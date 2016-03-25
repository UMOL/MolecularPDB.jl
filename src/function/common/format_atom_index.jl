"""
Create and return a correctly formated atom index string following the RCSB PDB format.
If the index has more than 5 digits,
 this function will return \"\*\*\*\*\*\*\".

Arguments
---------
index:Integer
    An integer 
"""
function format_atom_index(index::Integer)
    output = @sprintf "%5d" index 

    if length(output) > 5
        return "*****"
    end

    return output
end
