from antlr4 import *

from TAGMLLexer import TAGMLLexer


def token_stream(string):
    input = InputStream(string)
    lexer = TAGMLLexer(input)
    stream = CommonTokenStream(lexer)
    # return stream.getNumberOfOnChannelTokens()
    return False
