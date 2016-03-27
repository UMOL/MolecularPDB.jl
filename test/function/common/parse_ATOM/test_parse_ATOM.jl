"""
A test for parse_ATOM()

Arguments
==========
format:Symbol
    format of the PDB file 

line:AbstractString
    A string that represent one line of ATOM record from a RCSB PDB file.

solution:Atom 
    answer key
"""
function test_parse_ATOM(format::Symbol,line::AbstractString, solution::Atom)

    println("----------------------------------------")
    print_with_color(:blue, "Test parse_ATOM()\n\n")

    answer = parse_ATOM(format, 1, line)

    @test answer == solution

    print_with_color(:green, "\nVERIFIED! parse_ATOM()\n")
    println("----------------------------------------\n\n")

    return true
end

include("unit_test_1_parse_ATOM.jl")
include("unit_test_2_parse_ATOM.jl")
include("unit_test_3_parse_ATOM.jl")