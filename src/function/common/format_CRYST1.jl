"""
Return a formatted string to be 
used as the ``CRYST1`` record.

Arguments
----------
obj:CrystalSymmetry
    input object

format:Symbol
    format of the output PDB
"""
function format_CRYST1(obj::CrystalSymmetry, format::Symbol)
    return string("CRYST1",
        format_lattice_lengths(obj),
        format_lattice_angles(obj),
        " ",
        format_lattice_space_group(obj),
        format_lattice_chain_count(obtain(obj, :chain_count), format)
    )
end
