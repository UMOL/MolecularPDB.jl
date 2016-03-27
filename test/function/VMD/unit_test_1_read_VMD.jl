test_read_VMD(
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb"),
    PDB(molecular_system=MolecularSystem([Atom(
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
        ];
        crystal_symmetry=CrystalSymmetry(lattice="P", symmetries=[(1,0),(0,0),(0,0)],
            lengths=[101.042, 101.042, 165.806],
            angles=[90.0, 90.0, 90.0],
            chain_count=1)
        )
    )
)