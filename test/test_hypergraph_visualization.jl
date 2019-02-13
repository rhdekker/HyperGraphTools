using Test

include("util.jl")

@testset "hypergraph_visualization" begin
    using HyperGraphTools

    he1 = HyperEdge("S", ["1"], ["2"])
    he_dot = to_dot(he1)
    expected = """
    digraph HyperEdge {
        rankdir=LR
        labelloc=b
        color=white
        edge [arrowsize=0.5]
        s1[shape=point;label="";xlabel="1";fontsize=10]
        he[shape=box;label="S"]
        t1[shape=point;label="";xlabel="2";fontsize=10]
        {s1} -> he -> {t1}
    }
    """
    _test_normalized_strings_are_equal(he_dot,expected)
    _print_dot(he_dot)

    he2 = HyperEdge("X", ["1", "3"], ["2", "4"])
    he_dot = to_dot(he2)
    expected = """
    digraph HyperEdge {
        rankdir=LR
        labelloc=b
        color=white
        edge [arrowsize=0.5]
        s1[shape=point;label="";xlabel="1";fontsize=10]
        s2[shape=point;label="";xlabel="3";fontsize=10]
        he[shape=box;label="X"]
        t1[shape=point;label="";xlabel="2";fontsize=10]
        t2[shape=point;label="";xlabel="4";fontsize=10]
        {s1,s2} -> he -> {t1,t2}
    }
    """
    _test_normalized_strings_are_equal(he_dot,expected)
    _print_dot(he_dot)

    he3 = HyperEdge("Y", ["2", "4"], ["5"])
    he4 = HyperEdge("Z", ["5"], ["6", "7", "8"])
    hg = HyperGraph{String}(HyperEdge[he1, he2, he3, he4])

    hg_dot = to_dot(hg)
    expected = """
    digraph HyperGraph {
        rankdir=LR
        labelloc=b
        color=white
        edge [arrowsize=0.5]
        n1[shape=point;label="";xlabel="1";fontsize=10]
        n2[shape=point;label="";xlabel="2";fontsize=10]
        n3[shape=point;label="";xlabel="3";fontsize=10]
        n4[shape=point;label="";xlabel="4";fontsize=10]
        n5[shape=point;label="";xlabel="5";fontsize=10]
        n6[shape=point;label="";xlabel="6";fontsize=10]
        n7[shape=point;label="";xlabel="7";fontsize=10]
        n8[shape=point;label="";xlabel="8";fontsize=10]
        he1[shape=box;label="S"]
        he2[shape=box;label="X"]
        he3[shape=box;label="Y"]
        he4[shape=box;label="Z"]
        {n1} -> he1 -> {n2}
        {n1,n3} -> he2 -> {n2,n4}
        {n2,n4} -> he3 -> {n5}
        {n5} -> he4 -> {n6,n7,n8}
    }
    """
    _test_normalized_strings_are_equal(hg_dot,expected)
    _print_dot(hg_dot)
end