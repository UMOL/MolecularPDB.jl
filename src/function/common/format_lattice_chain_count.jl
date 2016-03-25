"""
Return a string to be used as 
the chain count part of the ``CRYST1`` record.

Arguments
----------
chain_count:Integer
    chain count in a unit cell

format:Symbol
    format of the PDB file, e.g., :vmd, :rcsb
"""
function format_lattice_chain_count(chain_count::Integer, format::Symbol)
    if format == :vmd
        return @sprintf "%4d" chain_count
    elseif format == :rcsb 
        return @sprintf "%4d%10s" chain_count ""
    else 
        @debug print_with_color(:red, "WARNING! format \":$(format)\" is not supported by format_lattice_chain_count()\n\n")
        return string(chain_count)
    end 
end
