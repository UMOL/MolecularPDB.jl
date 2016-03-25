"""
The frontend for reading PDB files of different flavors.
Currently supported flavors are:
* RCSB 
* VMD

Arguments
----------
file_name:AbstractString
    input target file name.

format:Symbol
    choices are [:rcsb, :vmd]
"""
function read(file_name::AbstractString, format::Symbol)
    if format == :rcsb
        return read_RCSB(file_name)
    elseif format == :vmd 
        return read_VMD(file_name)
    else 
        @debug print_with_color(:red, "ERROR HINT: unrecognized PDB format specification \"$(format)\"\n\n")
        return false
    end
end