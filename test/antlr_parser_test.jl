#=
test:
- Julia version: 
- Author: bramb
- Date: 2019-02-05
=#
import Pkg; Pkg.add("PyCall")

using PyCall

# start julia in HRGParser/src, where TAGMLLexer.py can be found
pushfirst!(PyVector(pyimport("sys")["path"]), @__DIR__) # add current directory to python path

Pkg.add("Conda")
using Conda

Conda.add_channel("conda-forge")
Conda.add("antlr-python-runtime")

function __init__()
    py"""
    from antlr4 import *
    from TAGMLLexer import TAGMLLexer

    def tokenize(filename):
        file = open(filename, "r")
        text = file.read()
        file.close()
        lexer = TAGMLLexer(InputStream(text))
        return CommonTokenStream(lexer)
    """
end


cs = py"tokenize"("test.tag")
keys(cs)
token0 = cs[:get](0)
token1 = cs[:get](1)
cs[:LT](-2)[:text]

# walk the stream until the end
cs[:fill]()
t=cs[:getTokens](0,25)
map(x->x[:text],t)
