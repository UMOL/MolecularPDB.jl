"""
A test for read_VMD()

Arguments
----------
file_name:AbstractString
    File name of the input VMD PDB file.

get_key:Function 
    A function that returns the answer key.
"""
function test_read_VMD(
    file_name::AbstractString,
    get_key::Function)
    
    println("----------------------------------------")
    print_with_color(:blue, "Test read_VMD()\n\n")

    answer = read_VMD(file_name)
    key = get_key()

    @test answer == key 

    print_with_color(:green, "\nVERIFIED! read_VMD()\n")
    println("----------------------------------------\n\n")
    
    return true
end


test_read_VMD(
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb"),
    function ()
        atom = Atom(
            index = 1,
            atom_name = " N  ",
            residue_name = "PRO",
            chain_name = "A",
            residue_id = 7,
            coordinate = [32.551, 1.074, 73.319],
            occupancy = 1.00,
            beta = 95.12,
            element = "N",
            segment_name="ABCD")

        return MolecularSystem([atom])
    end
)
    