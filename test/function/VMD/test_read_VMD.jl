"""
A test for read(VMD,...)

Arguments
----------
file_name:AbstractString
    File name of the input VMD PDB file.

solution:PDB  
    answer key
"""
function test_read_VMD(file_name::AbstractString, solution::PDB)
    
    println("----------------------------------------")
    print_with_color(:blue, "Test read(VMD,...)\n\n")

    answer = read(VMD,file_name)

    @test answer == solution 

    print_with_color(:green, "\nVERIFIED! read(VMD,...)\n")
    println("----------------------------------------\n\n")
    
    return true
end

include("unit_test_1_read_VMD.jl")
include("unit_test_2_read_VMD.jl")


    