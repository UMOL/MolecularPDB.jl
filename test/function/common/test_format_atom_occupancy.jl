"""
A test for format_atom_occupancy().

Arguments
----------
occupancy:AbstractFloat
    occupancy
key:AbstractString
    answer key
"""
function test_format_atom_occupancy(
    occupancy::AbstractFloat,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_occupancy()\n\n")
    
    answer = format_atom_occupancy(occupancy)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_atom_occupancy()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_atom_occupancy(1., "  1.00")
test_format_atom_occupancy(1.01, "  1.01")
test_format_atom_occupancy(1.001, "  1.00")
test_format_atom_occupancy(100.001, "100.00")
test_format_atom_occupancy(1234.001, "***.**")