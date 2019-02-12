"""
# module SimpleTAGMLTokenizer

- Julia version:
- Author: bramb
- Date: 2019-02-12

# Examples

```jldoctest
julia>using SimpleTAGMLTokenizer

julia>tokens = tokenize("[r>tagml example<r]")

```
"""
module SimpleTAGMLTokenizer

export tokenize

function tokenize(tagml::String)
    tokens = []
    token_buf = IOBuffer()
    for char in tagml
        if (char == '[' || char == '<')
            token = String(take!(token_buf))
            if (token != "")
                push!(tokens,token)
            end
            token_buf = IOBuffer()
            print(token_buf,char)
        elseif (char == '>' || char == ']')
            print(token_buf,char)
            token = String(take!(token_buf))
            if (token != "")
                push!(tokens,token)
            end
            token_buf = IOBuffer()
        else
            print(token_buf,char)
        end
    end
    return tokens
end

end