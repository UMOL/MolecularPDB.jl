"""
A test for the comparison operator "==" between 
two objects of type PDB.

Arguments
----------
obj1:PDB
    An instance of type PDB.

obj2:PDB
    Another instance of type PDB.

key:Bool
    The answer key.
"""
function test_comparison_PDB(
    obj1::PDB,
    obj2::PDB,
    key::Bool)

    println("----------------------------------------")
    print_with_color(:blue, "Test ==() for type PDB\n\n")

    answer = (obj1 == obj2) 

    @test answer == key 

    print_with_color(:green, "\nVERIFIED! ==() for type PDB\n")
    println("----------------------------------------\n\n")

    return true
end

test_comparison_PDB(
    PDB(molecular_system=MolecularSystem(system_name="A")),
    PDB(molecular_system=MolecularSystem(system_name="A")),
    true
    )

test_comparison_PDB(
    PDB(molecular_system=MolecularSystem(system_name="A")),
    PDB(molecular_system=MolecularSystem(system_name="B")),
    false
    )
