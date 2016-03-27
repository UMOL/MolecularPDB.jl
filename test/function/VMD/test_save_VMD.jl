"""
A test for save(VMD,...)

Arguments
----------
output_file:AbstractString
    output file name

obj:PDB
    an object of type ``PDB``

key_file:AbstractString
    file that contains the answer key 
"""
function test_save_VMD(
    output_file::AbstractString,
    obj::PDB, 
    key_file::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test save(VMD,...)\n\n")

    save(VMD,output_file, obj) 

    answer = readall(output_file)
    key = readall(key_file)

    @test answer == key 

    print_with_color(:green, "\nVERIFIED! save(VMD,...)\n")
    println("----------------------------------------\n\n")

    return true
end

include("unit_test_1_save_VMD.jl")
include("unit_test_2_save_VMD.jl")