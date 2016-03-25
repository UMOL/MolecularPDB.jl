"""
Create and return a string representation of
the segment name (left-adjusted).
If the number of characters is greater
than 4, only the first four will be used.

Arguments
---------
name:AbstractString
    segment name
"""
function format_segment_name(name::AbstractString)
    if length(name) > 4
        return @sprintf "%-4s" name[1:4]
    else
        return @sprintf "%-4s" name 
    end
end