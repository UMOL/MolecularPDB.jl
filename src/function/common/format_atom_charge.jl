"""
Create and return a formatted string representation 
of the atomic charge.
If the number of digits is greater than 1,
\"\*\*\" will be returned.

Arguments
-----------
charge:Integer
    charge
"""
function format_atom_charge(charge::Integer)
    output = "  " # in the case of charge == 0
    if charge > 0
        output = @sprintf "%1d+" charge 
    elseif charge < 0
        output = @sprintf "%1d-" abs(charge) 
    end

    if length(output) > 2
        output = "**"
    end

    return output
end
