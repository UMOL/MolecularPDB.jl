"""
A test for format_atom_charge()

Arguments
---------
charge:Integer
    charge

key:AbstractString
    answer key
"""
function test_format_atom_charge(charge::Integer, key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_charge())\n\n")

    answer = format_atom_charge(charge)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_atom_charge()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_atom_charge(0,  "  ")
test_format_atom_charge(1,  "1+")
test_format_atom_charge(-1, "1-")