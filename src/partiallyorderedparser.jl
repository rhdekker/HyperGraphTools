"""
# module PartiallyOrderedParser

- Julia version: 
- Author: rhdekker
- Date: 2019-02-17

# Examples

```jldoctest
julia>
```
"""
module PartiallyOrderedParser

using HyperGraphTools.SimpleTAGMLTokenizer

export my_parse


# We create the rules as a combination of tokens
# We use the Simple TAGML tokenizer
# Using the start state we try to predict to the next possible states

# We need to set the rules
# We do that we tree alike objects

struct TreeNode 
    name::String
    children::Array{TreeNode}
end

function my_parse()
    return "Hello World"
end

end