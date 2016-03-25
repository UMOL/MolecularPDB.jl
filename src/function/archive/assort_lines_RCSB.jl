include("get_lines_ATOM.jl")

"""
Assort lines from a RCSB PDB file into different categories and
return an object of data type **PdbText**.

Arguments
-----------
file_name:AbstractString
    Name of the input PDB file.
"""
function assort_lines_RCSB(file_name::AbstractString)
    output::PdbText = PdbText()
    output.atoms = get_lines_ATOM(file_name)
    return output
end