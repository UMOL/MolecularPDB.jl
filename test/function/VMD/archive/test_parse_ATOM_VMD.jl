"""
A test for parse_ATOM_VMD()

Arguments
==========
line:AbstractString
    A string that represent one line of ATOM record from a VMD PDB file.

get_key:Function
    A function that returns the answer key.
"""
function test_parse_ATOM_VMD(
    line::AbstractString,
    get_key::Function)

    println("----------------------------------------")
    print_with_color(:blue, "Test parse_ATOM_VMD()\n\n")

    # get answer
    answer = parse_ATOM_VMD(1,line)

    # answer key
    key = get_key()

    # verify
    @test answer == key

    print_with_color(:green, "\nVERIFIED! parse_ATOM_VMD()\n")
    println("----------------------------------------\n\n")

    return true
end


test_parse_ATOM_VMD(
    "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12      ABCD N",
    function () 
        return Atom(
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
    end
)

