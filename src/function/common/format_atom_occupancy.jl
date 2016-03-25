"""
Create and return a formatted string representation
of the atom occupancy with 2 decimal places and right-adjusted.
If the number of string characters is greater than 6,
then \"\*\*\*\.\*\*\" will be returned.

Arguments
----------
occupancy:AbstractFloat
    occupancy
"""
function format_atom_occupancy(occupancy::AbstractFloat)
    output = @sprintf "%6.2f" occupancy
    if length(output) > 6
        return "***.**"
    end

    return output
end