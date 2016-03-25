"""
Create and return a formatted string representation of
the residue index number (right-adjusted).
If the number of digits is greater than 4, 
\"\*\*\*\*\" will be returned.

Arguments
----------
id:Integer
    Residue ID 
"""
function format_residue_id(id::Integer)
    output = @sprintf "%4d" id
    
    if length(output) > 4
        return "****"
    end

    return output
end