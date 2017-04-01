"""
Save a ``Molecule`` object to an VMD Molecule file.

Arguments
----------
:Type{VMD}
    must be type ``VMD``
    
output_file_name:AbstractString
    File name of the output file.

obj:Molecule
    An instance of type ``Molecule``
"""
function save(::Type{VMD}, output_file_name::AbstractString, obj::Molecule)
    return save_pdb(output_file_name, obj, :vmd)
end
