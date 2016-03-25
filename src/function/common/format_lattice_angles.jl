"""
Return a formated string (21 characters) to be used
as the lattice angle part of the ``CRYST1`` record.

Arguments
------------
obj:CrystalSymmetry
    input object
"""
function format_lattice_angles(obj::CrystalSymmetry)
    args = []
    angles = obtain(obj, :angles)
    for a::AbstractFloat in angles
        push!(args, @sprintf "%7.2f" a)
    end
    return string(args...)
end
