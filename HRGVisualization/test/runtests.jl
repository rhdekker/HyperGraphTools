#=
all_tests.jl:
- Julia version: 
- Author: bramb
- Date: 2019-01-24
=#
using Test

@testset "all tests" begin
    include("test_hypergraph_visualization.jl")
    include("test_rules_visualization.jl")
    include("test_hypergraph_external_nodes_count.jl")
end