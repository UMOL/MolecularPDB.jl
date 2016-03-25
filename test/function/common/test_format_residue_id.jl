"""
A test for format_residue_id().

Arguments
----------
id:Integer
    residue ID 
key:AbstractString
    answer key
"""
function test_format_residue_id(
    id::Integer,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_residue_id()\n\n")

    answer = format_residue_id(id)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_residue_id()\n")
    println("----------------------------------------\n\n")

    return true 
end

test_format_residue_id(1, "   1")
test_format_residue_id(1234, "1234")
test_format_residue_id(12345, "****")
