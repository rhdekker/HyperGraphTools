using Test

include("util.jl")

@testset "hypergraph_external_nodes_count" begin
    using HRGVisualization

    hg = HyperGraph{String}(HyperEdge[
        HyperEdge("John", ["_"], ["3"]),
        HyperEdge("LOVES",["3"], ["_"])
    ])
    external_node_count = HRGVisualization._external_node_count(hg)
    @test external_node_count == 2

    hg = HyperGraph{String}(HyperEdge[
        HyperEdge("Cookie Monster", ["_"], ["3"]),
        HyperEdge("EATS",["3"], ["_", "_"])
    ])
    external_node_count = HRGVisualization._external_node_count(hg)
    @test external_node_count == 3
end