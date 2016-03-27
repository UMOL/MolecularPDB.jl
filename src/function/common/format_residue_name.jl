"""
Create a formatted string representation of the residue name
following the RCSB PDB standard.

In RCSB format, if the number of characters is greater than 3, 
then return a 3-letter string with \"\*\" as the third character.
If this number is less than 3, the residue name field will
be right-adjusted.
In VMD format, the number of letters can go up to 4. 
If the residue name contain 5 or more letters, then it will be
truncated to 4.

Arguments
----------
format:Symbol
    PDB format 

name:AbstractString
    residue name
"""
function format_residue_name(format::Symbol, name::AbstractString)
    if length(name) <= 3
        return @sprintf "%-3s " name 
    elseif length(name) == 4
        if format == :rcsb 
            return @sprintf "%2s* " name[1:2]
        else
            return name 
        end
    else 
        @debug print_with_color(:red, "WARNING! residue name length is truncated from $(length(name)) by format_residue_name()\n\n")
        return name[1:4]
    end
end