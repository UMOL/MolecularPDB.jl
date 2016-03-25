"""
Create and return a formatted string representation of
the chain ID (single character).

Arguments
----------
chain_name:AbstractString
    chain name
"""
function format_chain_name(chain_name::AbstractString)
    if length(chain_name) > 0
        return chain_name[1]
    else
        return ' '
    end
end
