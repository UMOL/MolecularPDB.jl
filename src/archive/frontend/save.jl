"""
The frontend function for saving 
a ``MolecularSystem`` object to a PDB file
of different flavors. 
The currently supported flavors are listed below:
* RCSB
* VMD

Arguments
----------
output_file:AbstractString
    the output file name

obj:MolecularSystem
    the target MolecularSystem object

format:Symbol
    file format: [:rcsb, :pdb]
"""
function save(
    output_file::AbstractString, 
    obj::MolecularSystem, 
    format::Symbol)
    if format == :rcsb
        return save_RCSB(output_file, obj)
    elseif format == :vmd 
        return save_VMD(output_file, obj)
    else 
        @debug print_with_color(:red, "ERROR HINT: unsupported PDB format: \":$(format)\"\n\n")
        return false
    end
end