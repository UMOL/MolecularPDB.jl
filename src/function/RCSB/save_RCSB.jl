"""
Save a ``PDB`` object to an RCSB PDB file.

Arguments
----------
:Type{RCSB}
    must be type ``RCSB``
    
output_file_name:AbstractString
    File name of the output file.

obj:PDB
    An instance of type ``PDB``
"""
function save(::Type{RCSB}, output_file_name::AbstractString, obj::PDB)
    return save_pdb(output_file_name, obj, :rcsb)
end
