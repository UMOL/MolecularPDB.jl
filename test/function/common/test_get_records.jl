"""
A test for function get_records()

Arguments
==========
file_name:AbstractString
    Full path of the input PDB file.

record_name::AbstractString
    name of the PDB record field

key:Array{Tuple{Integer, AbstractString},1}
    answer key
"""
function test_records(
    file_name::AbstractString,
    record_name::AbstractString,
    key::Array{Tuple{Int, ASCIIString}, 1})

    println("----------------------------------------")
    print_with_color(:blue, "Test get_records()\n\n")

    answer = get_records(file_name, record_name)

    @test length(answer) == length(key)

    # check answers
    for i = 1:length(answer)
        @test answer[i] == key[i]
    end

    print_with_color(:green, "\nVERIFIED! get_records()\n")
    println("----------------------------------------\n\n")

    return true

end

test_records(
    joinpath(TestParams.data_dir(), "RCSB", "1_line_RCSB.pdb"),
    "ATOM",
    [(1, "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12           N  ")]
)

test_records(
    joinpath(TestParams.data_dir(), "RCSB", "1_line_RCSB.pdb"),
    "CRYST1",
    [(1, "CRYST1  101.042  101.042  165.806  90.00  90.00  90.00 P 41 2 2     16          ")]
)

test_records(
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb"),
    "CRYST1",
    [(1, "CRYST1  101.042  101.042  165.806  90.00  90.00  90.00 P 1           1")]
)
