"""
Return a formated string to be used 
as the lattice space group part (11 characters) 
of the ``CRYST1`` record,
e.g., "P 41 21 21 ".

Arguments
-----------
obj:CrystalSymmetry
    input ``CrystalSymmetry`` object 
"""
function format_lattice_space_group(obj::CrystalSymmetry)
    args = [obtain(obj, :lattice)]
    symmetries = obtain(obj, :symmetries)

    if symmetries == [(1,0),(0,0),(0,0)]
        #===========================================
            This is a special case which 
            signifies the structure was not
            determined by X-ray crystallography
            and therefore has not crystal symmetry.
        ===========================================#
        push!(args, " 1")
    else
        for item in obtain(obj, :symmetries)
            if item[2] == 0
                push!(args, " ")
                push!(args, string(item[1]))
            else
                push!(args, " ")
                push!(args, string(item[1],item[2]))
            end
        end
    end

    return @sprintf "%-11s" string(args...)
end