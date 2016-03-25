"""
Read the ATOM section of an RCSB PDB file and 
return an array of objects of type Atom.

Arguments
----------
file_name:AbstractString
    Name of the input PDB file.

system_name::AbstractString
    name of the output molecular system
"""
function create_atoms(file_name::AbstractString, system_name::AbstractString="")
    return map((args)-> parse_ATOM(args..., system_name), get_records(file_name, "ATOM"))
end
