#=
test_parser:
- Julia version: 
- Author: bramb
- Date: 2019-02-01
=#
using Test

@testset "simple_tagml_tokenizer" begin
    using HyperGraphTools

    tagml = "[root>[a>[name>Cookie Monster<name] [b>loves<a] [name>Stroopwafels<name]<b]<root]"
    tokens = tokenize(tagml)
    @test tokens == [
        Token("[root>",OPENTAG),
        Token("[a>",OPENTAG),
        Token("[name>",OPENTAG),
        Token("Cookie Monster",TEXT),
        Token("<name]",CLOSETAG),
        Token(" ",TEXT),
        Token("[b>",OPENTAG),
        Token("loves",TEXT),
        Token("<a]",CLOSETAG),
        Token(" ",TEXT),
        Token("[name>",OPENTAG),
        Token("Stroopwafels",TEXT),
        Token("<name]",CLOSETAG),
        Token("<b]",CLOSETAG),
        Token("<root]",CLOSETAG)
    ]
end