"""
A test for the frontend function read()

Arguments
----------
file_name:AbstractString
    file name of the input PDB file

format:Symbol
    file format

get_key:Function 
    a function that returns the answer key
"""
function test_read(
    file_name::AbstractString,
    format::Symbol,
    get_key::Function)
    
    println("----------------------------------------")
    print_with_color(:blue, "Test read($(file_name), :$(format))\n\n")

    answer = read(file_name, format)
    key = get_key()

    @test answer == key 

    print_with_color(:green, "\nVERIFIED! read()\n")
    println("----------------------------------------\n\n")
    
    return true
end

include("unit_test_read_rcsb.jl")
include("unit_test_read_vmd.jl")
include("unit_test_read_unsupported.jl")
    
