const Node = Any

struct HyperEdge{N}
    label::String
    source::Array{N}
    target::Array{N}
end

struct HyperGraph{N} <: AbstractArray{HyperEdge, 1}
    edges::Array{HyperEdge{N}}
end

# minimum methods for abstract array; I delegate everything to the edges array
Base.size(HG::HyperGraph) = size(HG.edges)

Base.IndexStyle(::Type{<: HyperGraph}) = IndexLinear()

Base.getindex(HG::HyperGraph, i::Int) = getindex(HG.edges, i)

const HRGrammarRules = Dict{String,HyperGraph{String}}
