"""
A test for format_residue_name()

Arguments
-----------
name:AbstractString
    Residue name
key:AbstractString
    Answer key
"""
function test_format_residue_name(
    name::AbstractString,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_residue_name()\n\n")
    
    answer = format_residue_name(name)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_residue_name()\n")
    println("----------------------------------------\n\n")

    return true 
end

test_format_residue_name("AB", " AB")
test_format_residue_name("ABC", "ABC")
test_format_residue_name("ABCD", "AB*")