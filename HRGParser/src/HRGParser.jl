"""
# module HRGParser

- Julia version: 
- Author: bramb
- Date: 2019-02-01

# Examples

```jldoctest
julia>
```
"""
module HRGParser
    using PEGParser

    tagml_grammar = Grammar("""
    start =>
    """,standardrules)
end