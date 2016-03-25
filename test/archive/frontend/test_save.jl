"""
A test for the frontend function save()

Arguments
----------
output_file:AbstractString
    output file name

obj:MolecularSystem
    an object of type MolecularSystem

format:Symbol
    file format

key_file:AbstractString
    file that contains the answer key 
"""
function test_save(
    output_file::AbstractString,
    obj::MolecularSystem,
    format::Symbol,
    key_file::AbstractString)
    
    println("----------------------------------------")
    print_with_color(:blue, 
        "Test save(obj, :$(format), $(output_file))\n\n")

    status = save(output_file, obj, format)

    if status == false
        answer = false
    else
        answer = readall(output_file)
    end

    if key_file == "false"
        key = false
    else
        key = readall(key_file)
    end
    @test answer == key 

    print_with_color(:green, "\nVERIFIED! save()\n")
    println("----------------------------------------\n\n")
    
    return true
end

include("unit_test_save_rcsb.jl")
include("unit_test_save_vmd.jl")
include("unit_test_save_unsupported.jl")
    
