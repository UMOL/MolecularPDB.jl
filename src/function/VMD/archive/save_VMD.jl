include("format_ATOM_VMD.jl")

"""
Save a ``MolecularSystem`` object to an VMD PDB file.

Arguments
----------
output_file_name:AbstractString
    File name of the output file.

obj:MolecularSystem
    An instance of type MolecularSystem
"""
function save_VMD(output_file_name::AbstractString, obj::MolecularSystem)
    OUT = open(output_file_name, "w")

    for atom in obtain(obj, :atom_iterator)
        write(OUT, string(format_ATOM_VMD(atom), "\r\n"))
    end

    write(OUT, "END\r\n")

    close(OUT)

    return true
end
