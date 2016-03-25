"""
A test for format_atom_index()

Arguments
----------
index:Integer
    The test target.

key:AbstractString
    The answer key.
"""
function test_format_atom_index(
    index::Integer,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_index()\n\n")

    answer = format_atom_index(index)

    @test answer == key
    
    print_with_color(:green, "\nVERIFIED! format_atom_index()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_atom_index(1,      "    1")
test_format_atom_index(12,     "   12")
test_format_atom_index(12345,  "12345")
test_format_atom_index(123456, "*****")