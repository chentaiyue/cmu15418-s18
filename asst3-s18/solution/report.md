# asst3-s18

The first step is to setup the environment.
```sh
// py
conda create -n py2.7 python=2.7
conda activate py2.7
# omp
sudo apt-get install libopenmpi-dev
```

## Graph Rats

Our result is as follows (One 6-core Intel(R) Xeon(R) W-2235 CPU @ 3.80GHz):
```
	Nodes	gtype	lf	rtype	steps	update	threads	secs	MRPS
	------------------------------------------------------------------------
Running with 1 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 11.206 seconds
+++	25600	t	  40	u	400	b	1	11.37	  36.03
Running with 1 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 9.794 seconds
+++	25600	t	  40	d	400	b	1	9.95	  41.15
Running with 1 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 8.285 seconds
+++	25600	t	  40	r	400	b	1	8.44	  48.51
Running with 1 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 15.803 seconds
+++	25600	f	  40	u	400	b	1	15.99	  25.61
Running with 1 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 15.228 seconds
+++	25600	f	  40	d	400	b	1	15.41	  26.57
+++	Gmean					b	1		  34.51
+++	------------------------------------------------------------------------
	Nodes	gtype	lf	rtype	steps	update	threads	secs	MRPS
	------------------------------------------------------------------------
Running with 12 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 3.360 seconds
+++	25600	t	  40	u	400	b	12	3.51	 116.56	( 3.24X)
Running with 12 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 2.877 seconds
+++	25600	t	  40	d	400	b	12	3.00	 136.46	( 3.32X)
Running with 12 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 2.090 seconds
+++	25600	t	  40	r	400	b	12	2.21	 185.27	( 3.82X)
Running with 12 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 4.789 seconds
+++	25600	f	  40	u	400	b	12	4.93	  83.04	( 3.24X)
Running with 12 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
400 steps, 1024000 rats, 4.653 seconds
+++	25600	f	  40	d	400	b	12	4.79	  85.44	( 3.22X)
+++	Gmean					b	12		 115.89
+++	------------------------------------------------------------------------
	Nodes	gtype	lf	rtype	steps	update	threads	secs	MRPS
	------------------------------------------------------------------------
Running with 1 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 17.030 seconds
+++	25600	t	  40	u	800	s	1	17.18	  47.67
Running with 1 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 15.439 seconds
+++	25600	t	  40	d	800	s	1	15.61	  52.47
Running with 1 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 13.619 seconds
+++	25600	t	  40	r	800	s	1	13.79	  59.42
Running with 1 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 22.973 seconds
+++	25600	f	  40	u	800	s	1	23.18	  35.34
Running with 1 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 21.765 seconds
+++	25600	f	  40	d	800	s	1	21.96	  37.30
+++	Gmean					s	1		  45.54
+++	------------------------------------------------------------------------
	Nodes	gtype	lf	rtype	steps	update	threads	secs	MRPS
	------------------------------------------------------------------------
Running with 12 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 3.641 seconds
+++	25600	t	  40	u	800	s	12	3.76	 217.61	( 4.56X)
Running with 12 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 3.248 seconds
+++	25600	t	  40	d	800	s	12	3.37	 242.81	( 4.63X)
Running with 12 threads
Loaded graph with 25600 nodes and 150400 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 2.758 seconds
+++	25600	t	  40	r	800	s	12	2.88	 284.63	( 4.79X)
Running with 12 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 4.349 seconds
+++	25600	f	  40	u	800	s	12	4.49	 182.57	( 5.17X)
Running with 12 threads
Loaded graph with 25600 nodes and 254940 edges
Loaded 1024000 rats
DONE
800 steps, 1024000 rats, 4.178 seconds
+++	25600	f	  40	d	800	s	12	4.32	 189.72	( 5.09X)
+++	Gmean					s	12		 220.47
+++	------------------------------------------------------------------------
Total test time = 190.18 secs.
---------------------------------------------------------------------------------
MRPS Scores
  Threads = 1, Mode = batch, Achieved = 34.51, Target = 20.00, Score = 17.00/17.00
  Threads = 1, Mode = synch, Achieved = 45.54, Target = 32.00, Score = 17.00/17.00
  Threads = 12, Mode = batch, Achieved = 115.89, Target = 70.00, Score = 17.00/17.00
  Threads = 12, Mode = synch, Achieved = 220.47, Target = 256.00, Score = 12.28/17.00
Speedup Scores
  Ratio = 12:1, Mode = batch, Achieved = 5.79, Target = 3.50, Score = 6.00/6.00
  Ratio = 12:1, Mode = synch, Achieved = 6.89, Target = 8.00, Score = 4.33/6.00
TOTAL = 74/80
```
> Note that the expected result is obtained with 2 6-core CPUs, while we only have one 6-core CPU and fail to get full marks.

But how can we achieve this goal?
> The core idea contains two parts: (1) if some computational processes occur more than once, just cache their results and reuse them. (2) recognize the parallelizable code and just parrllelize it.

Firstly, we find that for each iteration, this code needs to call func `compute_sum_weight` (also indirectly call func `compute_weight` & `mweight`) to get the sum of weights in region of nid. 

We notice that the results of func `mweight(double val)` is constant when `val` is fixed, this case is common. Thus, we add an extra array to cache all possible results of func `mweight` (`val` must be range `[0, s->nrat]`).
```c
// crun.c
typedef struct {
    double *memo;
    graph_t *g;
    // ...
} state_t;


// simutil.c #new_rats
s->memo = double_alloc(nrat+1);
ok = ok && s->memo != NULL;

// sim.c
static inline double compute_weight(state_t *s, int nid) {
    int count = s->rat_count[nid];
    return s->memo[count];
}

void simulate(state_t *s, int count, update_t update_mode, int dinterval, bool display) {
    // ...
    }
    #if OMP
    #pragma omp parallel for num_threads(s->nthread) private(i)
    #endif
    for (i = 0; i <= s->nrat; i++) {
        s->memo[i] = mweight((double) i / s->load_factor);
    }
    if (display)
	// ...
}

```

Secondly, for each batch, we need to *generate real-valued weights* and use these to flip random coin returing value between 0 and len-1. The process of `generate real-valued weights` shares for these rats in the same region. So, we pre-calculate these results befor flipping random coin.
```c
// crun.h
typedef struct {
    double **binfo;
    graph_t *g;
} state_t;

// simutil.c #new_rats
static state_t *new_rats(graph_t *g, int nrat, random_t global_seed) {
    // ...
    s->binfo = calloc(nnode, sizeof(double *));
    ok = ok && s->binfo != NULL;
    for (int i = 0; i < nnode; i++) {
        int a = g->neighbor_start[i], b = g->neighbor_start[i + 1];
        s->binfo[i] = double_alloc(b - a + 1);
    }
    //...
}

// sim.c

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
static inline double compute_sum_weight(state_t *s, int nid, int eid_start, int eid_end, double *t) {
    return t[eid_end - eid_start];
}
```