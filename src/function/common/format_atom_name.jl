"""
Create and return a formated string representation of the atom name field 
following the RCSB PDB standard.

Arguments
---------
name:AbstractString
    Raw atom name with space characters preserved.
"""
function format_atom_name(name::AbstractString)
    # the most tricky part of the PDB file is the atom name where 
    # space characters are significant.
    # For example, "CA  " means calcium, while " CA " means alpha-carbon
    # The way I solve the problem is to have a raw_name field in
    # the Atom data type that preserves the space characters.
    # The default for raw_atom name is ""
    if length(name) <= 3
        return @sprintf " %-3s" name 
    elseif length(name) == 4
        return name
    else
        return @sprintf "%-3s*" name[1:3]
    end

    return name 
end
