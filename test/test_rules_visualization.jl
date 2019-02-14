#=
test_rules_visualization.jl:
- Julia version: 
- Author: bramb
- Date: 2019-01-24
=#

using Test

include("util.jl")

@testset "rules_visualization" begin
    using HyperGraphTools.HRGVisualization

    rules = Dict{String, HyperGraph{String}}(
        "S" => HyperGraph([HyperEdge("JOHN", ["_"], ["_"])]),
        "JOHN" => HyperGraph([HyperEdge("John", ["_"], ["3"]), HyperEdge("LOVES",["3"], ["_"])]),
        "LOVES" => HyperGraph([HyperEdge("loves", ["_"], ["4"]), HyperEdge("MARY", ["4"], ["_"])]),
        "MARY" => HyperGraph([HyperEdge("Mary", ["_"], ["_"])])
    )

    @test HRGVisualization._is_nonterminal("S") == true
    @test HRGVisualization._is_nonterminal("JOHN") == true
    @test HRGVisualization._is_nonterminal("loves") == false

    nonterminals = HRGVisualization._get_nonterminals(rules["S"])
    @test nonterminals == ["JOHN"]

    nonterminals = HRGVisualization._get_nonterminals(rules["JOHN"])
    @test nonterminals == ["LOVES"]

    nonterminals = HRGVisualization._get_nonterminals(rules["LOVES"])
    @test nonterminals == ["MARY"]

    nonterminals = HRGVisualization._get_nonterminals(rules["MARY"])
    @test nonterminals == []

    @test HRGVisualization._order_keys(rules) == ["S", "JOHN", "LOVES", "MARY"]

    rules_dot = to_dot(rules)
    expected = """
    digraph HRG_Rules {
        rankdir=LR
        edge [arrowsize=0.5]
        subgraph cluster_1 {
            label="MARY ⇒"
            rule1_n1_1[shape=circle;width=0.05;label=""]
            rule1_n1_2[shape=circle;width=0.05;label=""]
            rule1_he1[shape=box;label="Mary"]
            {rule1_n1_1} -> rule1_he1 -> {rule1_n1_2}
        }
        subgraph cluster_2 {
            label="LOVES ⇒"
            rule2_n1[shape=point;label="";xlabel="4";fontsize=10]
            rule2_n2_1[shape=circle;width=0.05;label=""]
            rule2_n2_2[shape=circle;width=0.05;label=""]
            rule2_he1[shape=box;label="loves"]
            rule2_he2[shape=box;label="MARY"]
            {rule2_n2_1} -> rule2_he1 -> {rule2_n1}
            {rule2_n1} -> rule2_he2 -> {rule2_n2_2}
        }
        subgraph cluster_3 {
            label="JOHN ⇒"
            rule3_n1[shape=point;label="";xlabel="3";fontsize=10]
            rule3_n2_1[shape=circle;width=0.05;label=""]
            rule3_n2_2[shape=circle;width=0.05;label=""]
            rule3_he1[shape=box;label="John"]
            rule3_he2[shape=box;label="LOVES"]
            {rule3_n2_1} -> rule3_he1 -> {rule3_n1}
            {rule3_n1} -> rule3_he2 -> {rule3_n2_2}
        }
        subgraph cluster_4 {
            label="S ⇒"
            rule4_n1_1[shape=circle;width=0.05;label=""]
            rule4_n1_2[shape=circle;width=0.05;label=""]
            rule4_he1[shape=box;label="JOHN"]
            {rule4_n1_1} -> rule4_he1 -> {rule4_n1_2}
        }
    }
    """
    _test_normalized_strings_are_equal(rules_dot,expected)
    _print_dot(rules_dot)
end