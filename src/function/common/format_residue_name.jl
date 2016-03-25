"""
Create a formatted string representation of the residue name
following the RCSB PDB standard.
If the number of characters is greater than 3, 
then return a 3-letter string with \"\*\" as the third character.
If this number is less than 3, the residue name field will
be right-adjusted.

Arguments
----------
name:AbstractString
    residue name
"""
function format_residue_name(name::AbstractString)
    if length(name) > 3
        return @sprintf "%2s*" name[1:2]
    end

    return @sprintf "%3s" name 
end