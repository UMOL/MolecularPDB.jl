include("get_atoms_VMD.jl")

"""
Read an VMD flavored PDB file and 
return an object of type PdbRecord.

Arguments
-----------
file_name:AbstractString
    Name of the input PDB file.
"""
function read_VMD(file_name::AbstractString)
    return MolecularSystem(create_atoms(file_name))
end