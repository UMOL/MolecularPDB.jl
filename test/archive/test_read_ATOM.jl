import PDB.read_ATOM

test_file = "../data/1_line.pdb"
atom = read_ATOM(test_file)
println(atom)