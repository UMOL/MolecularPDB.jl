"""
A test for save_VMD()

Arguments
----------
output_file:AbstractString
    output file name

obj:MolecularSystem
    an object of type MolecularSystem

key_file:AbstractString
    file that contains the answer key 
"""
function test_save_VMD(
    output_file::AbstractString,
    obj::MolecularSystem, 
    key_file::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test save_VMD()\n\n")

    save_VMD(output_file, obj) 

    answer = readall(output_file)
    key = readall(key_file)

    @test answer == key 

    print_with_color(:green, "\nVERIFIED! save_VMD()\n")
    println("----------------------------------------\n\n")

    return true
end

test_save_VMD(
    joinpath(TestParams.tmp_dir(), "tmp.pdb"),
    MolecularSystem([Atom(
        index = 1,
        atom_name = " N  ",
        residue_name = "PRO",
        chain_name = "A",
        residue_id = 7,
        coordinate = [32.551, 1.074, 73.319],
        occupancy = 1.00,
        beta = 95.12,
        element = "N",
        segment_name="ABCD")]),
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb")
)
