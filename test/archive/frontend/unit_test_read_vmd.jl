test_read(
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb"),
    :vmd,
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