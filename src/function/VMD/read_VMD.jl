"""
Read an VMD formated PDB file and 
return an object of type ``PDB``.


Arguments
-----------
:Type{VMD}
    must be type ``VMD``

file_name:AbstractString
    Name of the input PDB file.

system_name=""::AbstractString
    name of the output molecular system
"""
function read(::Type{VMD}, file_name::AbstractString, system_name::AbstractString="")
    return Molecule(create_atoms(:vmd, file_name, system_name))
end