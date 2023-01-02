#include "crun.h"

/* Compute weight for node nid */
static inline double compute_weight(state_t *s, int nid) {
    int count = s->rat_count[nid];
    return s->memo[count];
}

/* Compute sum of weights in region of nid */
static inline double compute_sum_weight(state_t *s, int nid, int eid_start, int eid_end, double *t) {
    return t[eid_end - eid_start];
}

/** DEBUGGING CODE **/
#if DEBUG
static void show_weights(state_t *s) {
    int nid, eid;
    graph_t *g = s->g;
    int nnode = g->nnode;
    int *neighbor = g->neighbor;
    outmsg("Weights\n");
    for (nid = 0; nid < nnode; nid++) {
	int eid_start = g->neighbor_start[nid];
	int eid_end  = g->neighbor_start[nid+1];
	outmsg("%d: [sum = %.3f]", nid, compute_sum_weight(s, nid));
	for (eid = eid_start; eid < eid_end; eid++) {
	    outmsg(" %.3f", compute_weight(s, neighbor[eid]));
	}
	outmsg("\n");
    }
}
#endif

/* Recompute all node counts according to rat population */
static inline void take_census(state_t *s) {
    graph_t *g = s->g;
    int nnode = g->nnode;
    int *rat_position = s->rat_position;
    int *rat_count = s->rat_count;
    int nrat = s->nrat;

    memset(rat_count, 0, nnode * sizeof(int));
    int ri;
    for (ri = 0; ri < nrat; ri++) {
	rat_count[rat_position[ri]] ++;
    }
}


/*
  Given list of integer counts, generate real-valued weights
  and use these to flip random coin returning value between 0 and len-1
*/
static inline int next_random_move(state_t *s, int r) {
    int nid = s->rat_position[r];
    int nnid = -1;
    random_t *seedp = &s->rat_seed[r];
    double *t = s->binfo[nid];
    graph_t *g = s->g;
    int eid_start = g->neighbor_start[nid], eid_end = g->neighbor_start[nid+1];
    double tsum = compute_sum_weight(s, nid, eid_start, eid_end, t);    
    double val = next_random_float(seedp, tsum);
    int a = eid_start, b = eid_end - 1, mid;
    while (a <= b) {
        mid = (a + b) / 2;
        if (val <= t[mid - eid_start + 1]) {
            b = mid - 1;
        } else {
            a = mid + 1;
        }
    }
    nnid = g->neighbor[a];
    return nnid;
}

static inline void pre_cal(state_t *s, int nid) {
    double *t = s->binfo[nid];
    graph_t *g = s->g;
    int eid_start = g->neighbor_start[nid], eid_end = g->neighbor_start[nid + 1];
    int eid;
    int *neightbor = g->neighbor;
    t[0] = 0.0;
    int i = 1;
    for (eid = eid_start; eid < eid_end; eid++, i++) {
        t[i] = compute_weight(s, neightbor[eid]) + t[i - 1];
    }
}

static void process_batch(state_t *s, int bstart, int bcount) {
    int rid;
    #if OMP
    #pragma omp parallel num_threads(s->nthread)
    {
        #pragma omp for private(rid) schedule(static)
    #endif
        for (rid = 0; rid < s->g->nnode; rid++) {
            pre_cal(s, rid);
        }
    #if OMP
        #pragma omp for private(rid) schedule(static)
    #endif
        for (rid = bstart; rid < bstart+bcount; rid++) {
            s->next_rat_position[rid] = next_random_move(s, rid);
        }
    #if OMP
    }
    #endif
    for (rid = bstart; rid < bstart+bcount; rid++) {
        int onid = s->rat_position[rid];
        int nnid = s->next_rat_position[rid];
        s->rat_count[onid]--;
        s->rat_count[nnid]++;
        s->rat_position[rid] = nnid;
    }
}

static void run_step(state_t *s, int batch_size) {
    int b, bcount;
    for (b = 0; b < s->nrat; b += batch_size) {
	int rest = s->nrat - b;
	bcount = rest < batch_size ? rest : batch_size;
	process_batch(s, b, bcount);
    }
}
void simulate(state_t *s, int count, update_t update_mode, int dinterval, bool display) {
    int i;
    /* Compute and show initial state */
    bool show_counts = true;
    take_census(s);
    int batch_size;
    switch(update_mode) {
    case UPDATE_SYNCHRONOUS:
	batch_size = s->nrat;
	break;
    case UPDATE_RAT:
	batch_size = 1;
	break;
    case UPDATE_BATCH:
	batch_size = s->batch_size;
	break;
    default:
	outmsg("WARNING: Unknown update mode.  Using batch mode\n");
	batch_size = s->batch_size;
	break;
    }
    #if OMP
    #pragma omp parallel for num_threads(s->nthread) private(i)
    #endif
    for (i = 0; i <= s->nrat; i++) {
        s->memo[i] = mweight((double) i / s->load_factor);
    }

    if (display)
	show(s, show_counts);
    for (i = 0; i < count; i++) {
	run_step(s, batch_size);
	if (display) {
	    show_counts = (((i+1) % dinterval) == 0) || (i == count-1);
	    show(s, show_counts);
	}
    }
    done();
}

