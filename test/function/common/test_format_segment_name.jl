"""
A test for format_segment_name()

Arguments
----------
name:AbstractString
    segment name 

key:AbstractString
    answer key
"""
function test_format_segment_name(
    name::AbstractString,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_segment_name()\n\n")

    answer = format_segment_name(name)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_segment_name()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_segment_name("A", "A   ")
test_format_segment_name("ABCD", "ABCD")
test_format_segment_name("ABCDE", "ABCD")