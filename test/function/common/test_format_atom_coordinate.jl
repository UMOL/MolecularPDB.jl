"""
A test for format_atom_coordinate()

Arguments
-----------
coordinate:AbstractFloat
    one atomic coordinate 
key:AbstractString
    answer key
"""
function test_format_atom_coordinate(
    coordinate::AbstractFloat,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_coordinate())\n\n")

    answer = format_atom_coordinate(coordinate)

    @test answer == key 

    print_with_color(:green, "\nVERIFIED! format_atom_coordinate()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_atom_coordinate(1.0, "   1.000")
test_format_atom_coordinate(1.00001, "   1.000")
test_format_atom_coordinate(-1.00001, "  -1.000")
test_format_atom_coordinate(-123.00001, "-123.000")
test_format_atom_coordinate(1234.00001, "1234.000")
test_format_atom_coordinate(12345.00001, "****.***")