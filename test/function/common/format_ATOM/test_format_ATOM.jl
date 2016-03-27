"""
A test for format_ATOM()

Arguments
----------
format:Symbol 
    options: [:vmd, :rcsb]

atom:Atom 
    an object of type Atom 

solution:AbstractString
    answer key
"""
function test_format_ATOM(
    format::Symbol,
    atom::Atom,
    solution::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_ATOM()\n\n")

    answer = format_ATOM(format, atom)

    @test answer == solution

    print_with_color(:green, "\nVERIFIED! format_ATOM()\n")
    println("----------------------------------------\n\n")

    return true
end

include("unit_test_1_format_ATOM.jl")
include("unit_test_2_format_ATOM.jl")