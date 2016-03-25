"""
Save a ``MolecularSystem`` object to an RCSB PDB file.

Arguments
----------
output_file_name:AbstractString
    File name of the output file.

obj:MolecularSystem
    An instance of type MolecularSystem
"""
function save_RCSB(output_file_name::AbstractString, obj::MolecularSystem)
    OUT = open(output_file_name, "w")

    # CRYST1
    write(OUT, string(format_CRYST1(obtain(obj, :crystal_symmetry), :rcsb)), "\r\n")

    # ATOM
    for atom in obtain(obj, :atom_iterator)
        write(OUT, string(format_ATOM(atom, :rcsb), "\r\n"))
    end

    # END
    write(OUT, "END\r\n")

    close(OUT)

    return true
end
