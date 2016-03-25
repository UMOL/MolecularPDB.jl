"""
Save a ``PDB`` object to an VMD PDB file.

Arguments
----------
:Type{VMD}
    must be type ``VMD``
    
output_file_name:AbstractString
    File name of the output file.

obj:PDB
    An instance of type ``PDB``
"""
function save(::Type{VMD}, output_file_name::AbstractString, obj::PDB)
    return save_pdb(output_file_name, obj, :vmd)
end
