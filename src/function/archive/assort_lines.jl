include("assort_lines_RCSB.jl")

"""
Assort the lines from a PDB file into different categories.

Arguments
-----------
file_name:AbstractString
    Name of the input PDB file.

format="rcsb":AbstractString
    Format of the PDB file.
    **Options**: ["rcsb", "namd"]
"""
function assort_lines(
    file_name::AbstractString, 
    format::AbstractString="rcsb")

    if format == "rcsb" 
        return assort_lines_RCSB(file_name)
    else
        return
    end

end