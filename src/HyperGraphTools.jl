"""
# module HyperGraphTools

- Julia version: 
- Author: bramb
- Date: 2019-02-13

# Examples

```jldoctest
julia>
```
"""
module HyperGraphTools
    include("SimpleTAGMLTokenizer.jl")

    import .SimpleTAGMLTokenizer: tokenize,Token,OPENTAG,CLOSETAG,TEXT
    export tokenize,Token,OPENTAG,CLOSETAG,TEXT
end