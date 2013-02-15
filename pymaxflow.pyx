# distutils: language = c++
# distutils: sources = maxflow.cpp graph.cpp

cdef extern from "Graph.h":
    cdef cppclass Block[T]:
        pass
    cdef enum termtype:
        SOURCE, SINK
    cdef cppclass Graph[capT, tcapT, flowT]:
        Graph(int node_num_max, int edge_num_max) except +
        int add_node(int)
        void add_edge(int i, int j, capT cap, capT rev_cap)
        void add_tweights(int i, tcapT cap_source, tcapT cap_sink)
        flowT maxflow()
        termtype what_segment(int i)

cdef class PyGraph:
    cdef Graph[float,float,float] *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self, int node_num_max, int edge_num_max):
        self.thisptr = new Graph[float,float,float](node_num_max, edge_num_max)
    def __dealloc__(self):
        del self.thisptr
    def add_node(self, int num=1):
        return self.thisptr.add_node(num)
    def add_edge(self, int i, int j, float cap, float rev_cap):
        self.thisptr.add_edge(i, j, cap, rev_cap)
    def add_tweights(self, int i, float cap_source, float cap_sink):
        self.thisptr.add_tweights(i, cap_source, cap_sink)
    def maxflow(self):
        return self.thisptr.maxflow()
    def what_segment(self, int i):
        return self.thisptr.what_segment(i)
