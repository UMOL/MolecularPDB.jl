import PDB.PdbText
import PDB.assort_lines

"""
A test for function assort_lines()

Arguments
==========
file_name:AbstractString
    Full path of the input PDB file.

file_format:AbstractString
    Format of the input PDB file.
"""
function test_assort_lines(
    file_name::AbstractString,
    file_format::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test assort_lines()\n\n")

    answer::PdbText = assort_lines(file_name, file_format)
    key::PdbText = PdbText()

    # prepare answer key
    # populate the .atoms filed
    open(file_name, "r") do IN
        push!(key.atoms, strip(readline(IN)))
    end

    # check answers
    for i = 1:length(answer.atoms)
        @test answer.atoms[i] == key.atoms[i]
    end

    print_with_color(:green, "\nVERIFIED! assort_lines()\n")
    println("----------------------------------------\n\n")

    return true

end

test_assort_lines(joinpath(TestParams.data_dir(), "1_line.pdb"), "rcsb")
