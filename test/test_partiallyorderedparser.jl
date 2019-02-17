#=
test_parser:
- Julia version: 1.0.3
- Author: rhdekker
- Date: 2019-02-17
=#
using Test

@testset "parser" begin
    # using HyperGraphTools.PartiallyOrderedParser
    using HyperGraphTools.SimpleTAGMLTokenizer
    using HyperGraphTools.PartiallyOrderedParser

    r = my_parse()
    @test r == "Hello World"

    function has_no_errors(x)
        isempty(filter(x -> x.type == SimpleTAGMLTokenizer.ERROR, x))
    end

    # use case 1: 2 layers, full overlap
    tagml1 = "[root>[tag|a>[other|b>one two three<other]<tag]<root]"
    # grammar1 = """
    # S -> ROOT
    # ROOT -> [root> TAG <root]
    # TAG -> [tag|a> OTHER <tag]
    # OTHER -> [other|b> TEXT <other]
    # TEXT -> "one two three"
    # """
    t1 = tokenize(tagml1)
    @test has_no_errors(t1)
end
