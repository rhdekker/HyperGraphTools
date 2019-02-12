#=
test_parser:
- Julia version: 
- Author: bramb
- Date: 2019-02-01
=#
using Test

@testset "simple_tagml_tokenizer" begin
    using SimpleTAGMLTokenizer

    tagml = "[root>[a>[name>Cookie Monster<name] [b>loves<a] [name>Stroopwafels<name]<b]<root]"
    tokens = tokenize(tagml)
    @test tokens == [
        "[root>",
        "[a>",
        "[name>",
        "Cookie Monster",
        "<name]",
        " ",
        "[b>",
        "loves",
        "<a]",
        " ",
        "[name>",
        "Stroopwafels",
        "<name]",
        "<b]",
        "<root]"
    ]
end