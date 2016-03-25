# a unit test for writing VMD PDB file
test_save(
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
    :vmd,
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb")
)
