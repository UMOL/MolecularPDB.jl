"""
A test for format_atom_name()

Arguments
----------
name:AbstractString
    Atom name 
key:AbstractString
    Answer key
"""
function test_format_atom_name(
    name::AbstractString, 
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_name()\n\n")

    answer = format_atom_name(name)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_atom_name()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_atom_name(" CA ", " CA ")
test_format_atom_name("CA  ", "CA  ")
test_format_atom_name("CA ",  "CA ")
