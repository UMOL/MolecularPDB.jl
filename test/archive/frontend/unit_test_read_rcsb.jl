# a test for RCSB flavored PDB file
test_read(
    joinpath(TestParams.data_dir(), "RCSB", "1_line_RCSB.pdb"),
    :rcsb,
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
            element = "N")

        return MolecularSystem([atom])
    end
)