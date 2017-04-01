import SimpleMolecule.obtain


"""
Save a ``Molecule`` object to an Molecule file.
Return ``true`` if succeed and ``false`` if not.

Arguments
----------
output_file_name:AbstractString
    File name of the output file.

obj:Molecule
    An instance of type ``Molecule``

format:Symbol
    choices: [:rcsb, :vmd]
"""
function save_pdb(output_file_name::AbstractString, molecule::Molecule, format::Symbol)
    OUT = open(output_file_name, "w")

    # CRYST1
    # write(OUT, string(format_CRYST1(obtain(molecule, :crystal_symmetry), format)), "\r\n")

    # ATOM
    for atom in obtain(molecule, :atoms)
        write(OUT, string(format_ATOM(format, atom), "\r\n"))
    end

    # END
    write(OUT, "END\r\n")

    close(OUT)

    return true
end
