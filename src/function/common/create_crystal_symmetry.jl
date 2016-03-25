"""
Create a ``CrystalSymmetry`` object based on 
the ``CRYST1`` record from the PDB file.

Arguments
----------
pdb_file:AbstractString
    Name of the input PDB file.
"""
function create_crystal_symmetry(pdb_file::AbstractString)
    line_array_of_tuples = get_records(pdb_file, "CRYST1")
    if length(line_array_of_tuples) == 0
        return CrystalSymmetry()
    else
        return parse_CRYST1(line_array_of_tuples[1][2])
    end
end