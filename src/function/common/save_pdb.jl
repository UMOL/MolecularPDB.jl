"""
Save a ``PDB`` object to an PDB file.
Return ``true`` if succeed and ``false`` if not.

Arguments
----------
output_file_name:AbstractString
    File name of the output file.

obj:PDB
    An instance of type ``PDB``

format:Symbol
    choices: [:rcsb, :vmd]
"""
function save_pdb(output_file_name::AbstractString, obj::PDB, format::Symbol)
    OUT = open(output_file_name, "w")

    molecule = obtain(obj, :molecular_system)

    # CRYST1
    write(OUT, string(format_CRYST1(obtain(molecule, :crystal_symmetry), format)), "\r\n")

    # ATOM
    for atom in obtain(molecule, :atom_iterator)
        write(OUT, string(format_ATOM(format,atom), "\r\n"))
    end

    # END
    write(OUT, "END\r\n")

    close(OUT)

    return true
end
