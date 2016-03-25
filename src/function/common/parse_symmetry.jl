"""
Parse the crystal symmetry of around one axis.

Arguments
----------
symm:AbstractString
    a two-digit or one-digit integer represented as a string 
"""
function parse_symmetry(symm::AbstractString)
    if length(symm) == 2
        return (parse(string(symm[1])), parse(string(symm[2])))
    elseif length(symm) == 1
        return (parse(string(symm[1])), 0)
    else 
        return (0,0)
    end
end