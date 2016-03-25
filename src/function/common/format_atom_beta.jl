"""
Create and return a formatted string representation
of the atom beta value (temperature factor) 
with 2 decimal places and right-adjusted.
If the number of string characters is greater than 6,
then \"\*\*\*\.\*\*\" will be returned.

Arguments
----------
beta:AbstractFloat
    beta
"""
function format_atom_beta(beta::AbstractFloat)
    output = @sprintf "%6.2f" beta

    if length(output) > 6
        return "***.**"
    end

    return output
end