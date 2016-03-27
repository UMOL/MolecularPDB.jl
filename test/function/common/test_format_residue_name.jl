"""
A test for format_residue_name()

Arguments
-----------
format:Symbol
    PDB format 

name:AbstractString
    Residue name

key:AbstractString
    Answer key
"""
function test_format_residue_name(
    format::Symbol,
    name::AbstractString,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_residue_name()\n\n")
    
    answer = format_residue_name(format, name)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_residue_name()\n")
    println("----------------------------------------\n\n")

    return true 
end

test_format_residue_name(:rcsb, "AB",   "AB  ")
test_format_residue_name(:rcsb, "ABC",  "ABC ")
test_format_residue_name(:rcsb, "ABCD", "AB* ")
test_format_residue_name(:vmd, "AB",    "AB  ")
test_format_residue_name(:vmd, "ABC",   "ABC ")
test_format_residue_name(:vmd, "ABCD",  "ABCD")
test_format_residue_name(:vmd, "ABCDE", "ABCD")