"""
Create and return a formatted string
representation of the atom coordinate
with 3 decimal places and right-adjusted.
If the number of characters is
greater than 8, 
\"\*\*\*\*\.\*\*\*\" will be returned.

Arguments
-----------
coordinate:AbstractFloat
    one of the atomic coordinates
"""
function format_atom_coordinate(coordinate::AbstractFloat)
    output = @sprintf "%8.3f" coordinate

    if length(output) > 8
        return "****.***"
    end

    return output

end