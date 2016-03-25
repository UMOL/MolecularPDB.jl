"""
Create and return a formatted string
representation of the atom element name
which is 2-character wide and right adjusted.
If the number of characters is greater than 2,
\"\*\*\" will be returned.

Arguments
-----------
element:AbstractString
    element name
"""
function format_atom_element(element::AbstractString)
    output = @sprintf "%2s" element 
    if length(output) > 2
        return "**"
    end

    return output
end