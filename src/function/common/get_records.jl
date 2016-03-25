"""
Extract the lines containing a certain type of records from a PDB file
and return 
an array of tuples (Integer, AbstractString), e.g. (1, "ATOM...")

Arguments
----------
file_name:AbstractString
    name of the input RCSB PDB file

record_name::AbstractString
    name of the PDB record, e.g., ATOM
"""
function get_records(file_name::AbstractString, record_name::AbstractString)
    output::Array{Tuple{Integer, AbstractString},1} = []
    pattern = Regex(string("^", record_name, ".*"))
    open(file_name, "r") do obj_File
        ccc = 0
        while ! eof(obj_File)
            line::AbstractString = chomp(readline(obj_File))
            if ismatch(pattern, line)
                ccc += 1
                push!(output, (ccc, line))
            end
        end
    end
    return output
end
