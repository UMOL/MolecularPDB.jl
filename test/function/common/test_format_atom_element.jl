"""
A test for format_atom_element()

Arguments
----------
element:AbstractString
    element name

key:AbstractString
    answer key
"""
function test_format_atom_element(
    element::AbstractString,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_element()\n\n")

    answer = format_atom_element(element)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_atom_element()\n")
    println("----------------------------------------\n\n")    

    return true
end

test_format_atom_element("C", " C")
test_format_atom_element("CA", "CA")
test_format_atom_element("ABC", "**")