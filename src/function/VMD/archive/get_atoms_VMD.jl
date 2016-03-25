include("parse_ATOM_VMD.jl")

"""
Read the ATOM section of an VMD PDB file and 
return an array of objects of type Atom.

Arguments
----------
file_name:AbstractString
    Name of the input PDB file.
"""
function get_atoms_VMD(file_name::AbstractString)
    return map((args)-> parse_ATOM_VMD(args...), get_lines_ATOM(file_name))
end
