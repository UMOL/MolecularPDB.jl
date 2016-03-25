"""
A test for convert_to_MolecularSystem() that converts a PdbRecord object to a 
MolecularSystem object.

Arguments
---------
obj:PdbRecord
     a PdbRecord object

system:AbstractString
    name for the new molecular system 

key:MolecularSystem
    answer key
"""
function test_convert_to_MolecularSystem(
    obj::PdbRecord, 
    system::AbstractString,
    key::MolecularSystem)
    
    println("----------------------------------------")
    print_with_color(:blue, "Test convert() from PdbRecord to MolecularSystem\n\n")

    answer = convert(MolecularSystem, obj; system=system)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! convert() from PdbRecord to MolecularSystem\n")
    println("----------------------------------------\n\n")

    return true 
end

include("unit_test_1_convert_to_MolecularSystem.jl")
include("unit_test_2_convert_to_MolecularSystem.jl")
