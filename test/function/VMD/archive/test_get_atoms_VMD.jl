"""
A test for get_atoms_VMD()

Arguments
----------
file_name:AbstractString
    File name of the input VMD PDB file.

get_key:Function 
    A function that returns the answer key.
"""
function test_get_atoms_VMD(
    file_name::AbstractString,
    get_key::Function)

    println("----------------------------------------")
    print_with_color(:blue, "Test get_atoms_VMD()\n\n")

    answer = get_atoms_VMD(file_name)
    key = get_key()

    for i = 1:length(key)
        @test answer[i] == key[i]
    end
    
    print_with_color(:green, "\nVERIFIED! get_atoms_VMD()\n")
    println("----------------------------------------\n\n")

    return true
end

test_get_atoms_VMD(
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb"),
    function () 
        return [Atom(
        index = 1,
        atom_name = " N  ",
        residue_name = "PRO",
        chain_name = "A",
        residue_id = 7,
        coordinate = [32.551, 1.074, 73.319],
        occupancy = 1.00,
        beta = 95.12,
        element = "N",
        segment_name="ABCD")]
    end
)