"""
Return a formated string (27 characters) to be used
as the lattice length part of the ``CRYST1`` record.

Arguments
------------
obj:CrystalSymmetry
    input object
"""
function format_lattice_lengths(obj::CrystalSymmetry)
    args = []
    lengths = obtain(obj, :lengths)
    for a::AbstractFloat in lengths
        push!(args, @sprintf "%9.3f" a)
    end
    return string(args...)
end
