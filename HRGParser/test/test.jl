#=
test:
- Julia version: 
- Author: bramb
- Date: 2019-02-05
=#
using PyCall

pushfirst!(PyVector(pyimport("sys")["path"]), @__DIR__) # add current directory to python path
Conda.add("antlr-python-runtime")

tagmllexer = pyimport("TAGMLLexer")
