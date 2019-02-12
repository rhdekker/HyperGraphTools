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

export tokenize,Token,OPENTAG,CLOSETAG,TEXT

@enum(TokenType,
    OPENTAG,
    CLOSETAG,
    TEXT
)

struct Token
    content::String
    type::TokenType
end

function tokenize(tagml::String)
    tokens = Token[]
    token_buf = IOBuffer()
    token_type = TEXT
    for char in tagml
        if (char == '[' || char == '<')
            _push_token!(tokens, token_buf, token_type)
            token_type = (char == '[') ? OPENTAG : CLOSETAG
            print(token_buf,char)
        elseif (char == '>' || char == ']')
            print(token_buf,char)
            _push_token!(tokens, token_buf, token_type)
            token_type = TEXT
        else
            print(token_buf,char)
        end
    end
    return tokens
end

function _push_token!(tokens, token_buf, token_type)
    token_content = String(take!(token_buf))
    if (token_content != "")
        token = Token(token_content,token_type)
        push!(tokens,token)
    end
    token_buf = IOBuffer()
end

end