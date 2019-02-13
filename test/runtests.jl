#=
runtests:
- Julia version: 
- Author: bramb
- Date: 2019-02-01
=#
using Test

@testset "all tests" begin
    include("test_parser.jl")
end