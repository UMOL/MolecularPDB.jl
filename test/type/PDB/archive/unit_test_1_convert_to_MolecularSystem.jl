test_convert_to_MolecularSystem(
    PdbRecord(
        atoms=[
                Atom(index=1,residue_id=1,residue="R1",segment="SEG1")
        ]
    ),
    "S",
    MolecularSystem(
        name="S",
        segments = Dict([

            (:SEG1, 
                Segment(name="SEG1",
                system="S",
                residues=Dict([
                    (Symbol("1"), Residue(
                        index=1,
                        name="R1",
                        segment="SEG1",
                        system="S",
                        atoms=Dict([
                                (Symbol("1"), Atom(index=1,residue_id=1,residue="R1",segment="SEG1")),
                            ])
                        ))
                ]))
            )

        ])
    )
)
