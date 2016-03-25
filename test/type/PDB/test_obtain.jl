"""
A test for obtain the value of 
the **atoms** field of an object
of type PDB.

Arguments
----------
obj:PDB 
    target object

field:Symbol
    target field 

solution:Any
    answer key
}
"""
function test_obtain_PDB(obj::PDB, field::Symbol, solution::Any)
    println("----------------------------------------")
    print_with_color(:blue, "Test obtain(obj, :$(field)) for type PDB\n\n")

    answer = obtain(obj, field)
    @test answer == solution

    print_with_color(:green, "\nVERIFIED! obtain(obj, :$(field)) for type PDB\n")
    println("----------------------------------------\n\n")

    return true 
end

test_obtain_PDB(PDB(molecular_system=MolecularSystem(system_name="A")),
    :molecular_system,
    MolecularSystem(system_name="A"))