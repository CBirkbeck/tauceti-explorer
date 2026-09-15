# Dependency order and independently usable endpoints

The graph in diamonds_source_dependencies.json
records prerequisites of **milestones**, not dependencies
between whole directories. It is a proposed proof order. Acyclicity does not prove that every
mathematical prerequisite has been found. Supplier nodes denote their stated roadmap contracts,
not completed implementations.

## Start from the available foundations

Begin the analytic algebra A0–A2 and abstract almost mathematics P0 alongside D0's spectral,
ordinary-site and cardinal foundations. Construct P1–P5 from those foundations. In parallel,
E0–E4 build the enhanced categorical operations. Q0–Q4 then prove the closed-quotient theorem
by the specified prismatic route. The conservative source-following graph uses that theorem
in A3's nonnoetherian analytic-algebra work, followed by P6's affinoid approximation.

This graph does not claim that every possible proof of diamondification needs prismatic
cohomology. It records the chosen route through the corrected source and the analytic
prerequisites specified here. Removing Q4 from the early path requires a proved replacement
for every use of that theorem, not deletion of a dependency edge.

## The Fargues–Fontaine branch

After A4 and D1–D6, the fixed-field geometric application F0–F4 can be completed without
waiting for the classical analytic **cohomology**, diamond cohomology, six-operation or scheme
alteration branches. F3 proves the identification of the existing adic quotient and the
étale-site equivalence. F4 supplies the Cartier-divisor interpretation. F5 is deliberately later:
its derived and adic-coefficient statements use C2 and L0.

A topological ordering printed by a graph algorithm is not a schedule: the location of F3 at
the end of such a list does not make the preceding unrelated nodes prerequisites.

### Declared prerequisites of F3

`A0`, `A1`, `A2`, `A3`, `A4`, `ADIC`, `BASE`, `D0`, `D1`, `D2`, `D3`, `D4`, `D5`, `D6`, `DG`, `E0`, `E1`, `E2`, `E3`, `E4`, `F0`, `F1`, `F2`, `FF_ADIC`, `P0`, `P1`, `P2`, `P3`, `P4`, `P5`, `P6`, `Q0`, `Q1`, `Q2`, `Q3`, `Q4`, `SCH_SHEAVES`

## The cohomological branch

H0–H5 supply the classical analytic results used by the source. L2's extension of the
Noetherian scheme supplier is placed before the H1 uses that require it; L2 does not depend
on the diamond six operations. C0 starts the bounded site comparisons. H2 and D6 make C1's
Theorem 16.1 available before C2 proves Theorem 14.12. C3–C6 construct the four operations,
compactifications and the two different base-change arguments. Constructibility C7 and the
dimension lemmas C8 precede compact generation C9. S0–S6 then construct the six operations
and their duality theorems. L0 and L1/L3–L6 give adic coefficients and scheme comparisons.

## Ordering constraints inside components

- C7
- S3
- D0

## External supplier contracts

| Identifier | Supplier | Scope |
|---|---|---|
| `BASE` | Existing Mathlib/Tau Ceti primitives | Only the basic algebra, topology, schemes, sheaf and ordinary complex carriers actually present; missing lemmas belong to the named consumer. |
| `ADIC` | AdicSpaces Layers 0–5 | Existing roadmap contract: Huber/Tate foundations, sheafiness and adic spaces, not perfectoid/étale cohomology. |
| `FF_ADIC` | AdicSpaces Layer 6 | Existing absolute adic Fargues–Fontaine objects for E=Q_p. |
| `SCH_SHEAVES` | CohomologicalPointCounting/ConstructibleEtale | Parallel roadmap contract, not implementation status. |
| `SCH_BC` | CohomologicalPointCounting/EtaleBaseChange | Use its precise scheme, coefficient and bounded-category hypotheses. |
| `SCH_SUPPORT_NOETH` | CohomologicalPointCounting/CompactSupport | Noetherian separated finite-type compactification and lower shriek; L2 owns the extension. |
| `PROFINITE_COH` | ProfiniteCohomology | Canonical continuous cohomology and stated dimension API; excludes all-degree Hochschild–Serre. |
| `PROFINITE_COH_PLUS` | ArithmeticGaloisDuality R02.1–R02.2 | Canonical all-degree continuous Hochschild–Serre, compact/discrete comparison and convergence/edge-map API on the upstream carrier; C8 applies it to diamonds. |
| `PRO_P` | ProfiniteProPGroups | Profinite Sylow/pro-p inputs, with scope checked against supplier before use. |
| `DG` | DGAInfinity: relevant DG/Hom-complex prefix | Only applicable DG primitives; E0–E3 own the required higher-category/sheaf enhancements. |

## Milestone prerequisites

Every row links to the definitive component specification. Prerequisite mathematics and the
extra Fargues–Fontaine application may have no numbered ECD endpoint of their own.
These tables preserve the 65 source milestones, not the entire current campaign. The
campaign additions P7–P9, E5 and their cycle-breaking substages are listed below and in
STAGED_DEPENDENCIES.json; canonical PR/DD/CR transfers there
also refine historical Q0–Q3/E4 rows. The source graph is not a complete FS-successor graph.

| Campaign addition | Direct supplier contracts |
|---|---|
| PerfectoidSpaces P7 | P1–P5; AdicSpacesPartII R0–R3/F0; controlled towers and valid tilde-limits |
| PerfectoidSpaces P8 | P7, PerfectoidQuotients Q4, DiamondsAndVStacks D4; invariant affinoid finite quotients |
| PerfectoidSpaces P9 | P8, D2–D3, AdicSpacesPartII R5; continuous profinite descent |
| EnhancedDerivedSheaves E5 | E0 abstract baseline; E3 presentability/animation; DD.0 cotangent reexport; StableHomotopyKTheory H.5 only for the later spectra comparison |

Exact substage pins and FS-successor dependencies are maintained in
`review/diamonds_fargues_metadata.json`, merged into the campaign stage graph. RF0/RF2
integral geometry feeds GS0; GS0's early smoothness feeds BG2, whereas only GS4's rational
reductivity imports EDC.7 and thus the DWP.9 chain. These are distinct returns.

### AdicEtaleGeometry

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `A0` | [Completed tensor products and the fibre products actually used](../campaign/AdicEtaleGeometry/README.md) | `ADIC` |
| `A1` | [Finite étale and étale geometry](../campaign/AdicEtaleGeometry/README.md) | `A0`, `ADIC` |
| `A2` | [Separatedness, smooth charts, and classical analytic geometry](../campaign/AdicEtaleGeometry/README.md) | `A1` |
| `A3` | [The nonnoetherian affinoid étale approximation input](../campaign/AdicEtaleGeometry/README.md) | `A2`, `P5`, `Q4` |
| `A4` | [Analytic adic presentations for diamondification](../campaign/AdicEtaleGeometry/README.md) | `A1`, `P3`, `P5`, `P6` |

### PerfectoidSpaces

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `P0` | [Almost mathematics with a reusable base ideal](../campaign/PerfectoidSpaces/README.md) | `D0`, `BASE` |
| `P1` | [Perfectoid Tate rings, tilts and marked untilts](../campaign/PerfectoidSpaces/README.md) | `ADIC`, `P0` |
| `P2` | [Rational localization, sheafiness, and perfectoid spaces](../campaign/PerfectoidSpaces/README.md) | `P1`, `P0`, `A0`, `D0` |
| `P3` | [Almost purity and étale tilting](../campaign/PerfectoidSpaces/README.md) | `P2`, `P0`, `A1` |
| `P4` | [Morphisms and perfectoid quotients](../campaign/PerfectoidSpaces/README.md) | `P2`, `P3`, `A1` |
| `P5` | [Limits and étale finite-stage descent](../campaign/PerfectoidSpaces/README.md) | `P3`, `P4`, `D0` |
| `P6` | [Affinoid approximation and pro-étale presentations](../campaign/PerfectoidSpaces/README.md) | `P5`, `A3`, `D0` |

### PerfectoidQuotients

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `Q0` | [Integral perfectoid rings, δ-rings and perfect prisms](../campaign/PerfectoidQuotients/README.md) | `P1`, `P3`, `E0`, `E4` |
| `Q1` | [Prismatic cohomology of smooth algebras and Hodge–Tate comparison](../campaign/PerfectoidQuotients/README.md) | `Q0`, `E1`, `E2`, `D0`, `SCH_SHEAVES` |
| `Q2` | [Derived prismatic cohomology and universal prisms](../campaign/PerfectoidQuotients/README.md) | `Q1`, `E3` |
| `Q3` | [Quasisyntomic covers and André's flatness lemma](../campaign/PerfectoidQuotients/README.md) | `Q2`, `P0` |
| `Q4` | [Surjectivity of perfectoidization and closed perfectoid quotients](../campaign/PerfectoidQuotients/README.md) | `Q3`, `Q2`, `P4` |

### DiamondsAndVStacks

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `D0` | [Spectral topology, ordinary sites, and size](../campaign/DiamondsAndVStacks/README.md) | `BASE` |
| `D1` | [Totally disconnected perfectoid spaces](../campaign/DiamondsAndVStacks/README.md) | `P6`, `P4`, `D0` |
| `D2` | [Pro-étale and v-topologies](../campaign/DiamondsAndVStacks/README.md) | `D1`, `P0`, `P2`, `D0` |
| `D3` | [Effective descent and morphisms of stacks](../campaign/DiamondsAndVStacks/README.md) | `D2`, `D1`, `A2`, `P6`, `P0` |
| `D4` | [Diamonds and small v-stacks](../campaign/DiamondsAndVStacks/README.md) | `D3`, `D2` |
| `D5` | [Spatial geometry and relative representability](../campaign/DiamondsAndVStacks/README.md) | `D4`, `D1`, `P6` |
| `D6` | [Analytic adic spaces as diamonds](../campaign/DiamondsAndVStacks/README.md) | `D5`, `A4`, `P1`, `D3` |

### EnhancedDerivedSheaves

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `E0` | [A concrete enhancement and the necessary higher-category operations](../campaign/EnhancedDerivedSheaves/README.md) | `BASE`, `DG` |
| `E1` | [Derived sheaves and presentability](../campaign/EnhancedDerivedSheaves/README.md) | `E0`, `D0` |
| `E2` | [Repleteness, Postnikov completion and cohomological descent](../campaign/EnhancedDerivedSheaves/README.md) | `E1`, `D0` |
| `E3` | [Coherent diagrams, Kan extensions and adjoints](../campaign/EnhancedDerivedSheaves/README.md) | `E0`, `E1`, `E2` |
| `E4` | [Derived adic completion](../campaign/EnhancedDerivedSheaves/README.md) | `E1`, `E3` |

### ClassicalAdicEtaleCohomology

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `H0` | [Classical étale sheaves, stalks, and direct image](../campaign/ClassicalAdicEtaleCohomology/README.md) | `A2`, `D0`, `SCH_SHEAVES`, `SCH_BC`, `E1` |
| `H1` | [Formal models, specialization, and nearby-cycle comparison](../campaign/ClassicalAdicEtaleCohomology/README.md) | `H0`, `A2`, `SCH_BC`, `L2` |
| `H2` | [Invariance under extension of an algebraically closed valued field](../campaign/ClassicalAdicEtaleCohomology/README.md) | `H1`, `P6`, `P3` |
| `H3` | [Proper support, traces and Poincaré duality for curves](../campaign/ClassicalAdicEtaleCohomology/README.md) | `H1`, `SCH_SUPPORT_NOETH`, `SCH_BC`, `E1`, `A2` |
| `H4` | [Constructibility in curve families and annulus computations](../campaign/ClassicalAdicEtaleCohomology/README.md) | `H2`, `H3`, `P6` |
| `H5` | [Algebraic/analytic comparison and compactification of smooth curves](../campaign/ClassicalAdicEtaleCohomology/README.md) | `H1`, `H3`, `H4`, `L2` |

### DiamondEtaleCohomology

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `C0` | [Sites and bounded comparison](../campaign/DiamondEtaleCohomology/README.md) | `D5`, `D2`, `E2`, `H2` |
| `C1` | [General base change, before v-locality](../campaign/DiamondEtaleCohomology/README.md) | `C0`, `D6`, `H2` |
| `C2` | [The left-completed étale category and descent](../campaign/DiamondEtaleCohomology/README.md) | `C1`, `E3`, `C0` |
| `C3` | [Four operations](../campaign/DiamondEtaleCohomology/README.md) | `C2`, `E1` |
| `C4` | [Proper, partially proper, and canonical compactification](../campaign/DiamondEtaleCohomology/README.md) | `D5`, `D3` |
| `C5` | [Extension by zero and proper base change](../campaign/DiamondEtaleCohomology/README.md) | `C3`, `C4`, `SCH_BC`, `E2`, `H1` |
| `C6` | [Algebraically closed base-field invariance](../campaign/DiamondEtaleCohomology/README.md) | `C5`, `C1`, `H4` |
| `C7` | [Constructible and perfect-constructible coefficients](../campaign/DiamondEtaleCohomology/README.md) | `C3`, `D5`, `E1` |
| `C8` | [Dimension and cohomological bounds](../campaign/DiamondEtaleCohomology/README.md) | `C3`, `C4`, `PROFINITE_COH`, `PROFINITE_COH_PLUS`, `PRO_P`, `H0`, `C1` |
| `C9` | [Compact generation in the correct scope](../campaign/DiamondEtaleCohomology/README.md) | `C7`, `C8`, `E3` |

### DiamondSixOperations

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `S0` | [Compactifiable morphisms](../campaign/DiamondSixOperations/README.md) | `C4`, `D5` |
| `S1` | [Quasicompact proper-support pushforward and the dimension estimate](../campaign/DiamondSixOperations/README.md) | `S0`, `C5`, `C8`, `C3`, `D5` |
| `S2` | [Non-quasicompact maps and small v-stacks](../campaign/DiamondSixOperations/README.md) | `S1`, `E3`, `C2` |
| `S3` | [Exceptional inverse image and the formal identities](../campaign/DiamondSixOperations/README.md) | `S2`, `E3` |
| `S4` | [Cohomological smoothness with the revised descent hypotheses](../campaign/DiamondSixOperations/README.md) | `S3`, `C9`, `C6`, `H3` |
| `S5` | [Examples: the ball, quotients and analytic smooth maps](../campaign/DiamondSixOperations/README.md) | `S4`, `H4`, `H3`, `D6`, `P1` |
| `S6` | [Biduality and conservativity](../campaign/DiamondSixOperations/README.md) | `S5`, `H5`, `C9` |

### AdicCoefficientsAndComparisons

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `L2` | [General qcqs scheme compactification and coefficient extensions](../campaign/AdicCoefficientsAndComparisons/README.md) | `SCH_SUPPORT_NOETH`, `SCH_BC`, `E1`, `E2`, `E3`, `D0` |
| `L0` | [Adic coefficients](../campaign/AdicCoefficientsAndComparisons/README.md) | `S3`, `E4`, `C2` |
| `L1` | [The scheme-to-v-sheaf constructions](../campaign/AdicCoefficientsAndComparisons/README.md) | `D6`, `A2`, `D3` |
| `L3` | [Characteristic-`p` cohomological comparison](../campaign/AdicCoefficientsAndComparisons/README.md) | `L1`, `L2`, `S3`, `C6`, `H5`, `L0` |
| `L4` | [Mixed-characteristic proper-support comparison](../campaign/AdicCoefficientsAndComparisons/README.md) | `L1`, `L0`, `S5`, `H5`, `SCH_SUPPORT_NOETH` |
| `L5` | [Alterations and the local normal-crossing calculations](../campaign/AdicCoefficientsAndComparisons/README.md) | `SCH_SUPPORT_NOETH`, `SCH_BC`, `E2`, `E3`, `H1`, `H5` |
| `L6` | [Constructible direct-image comparison and full faithfulness](../campaign/AdicCoefficientsAndComparisons/README.md) | `L4`, `L5`, `H5`, `PROFINITE_COH` |

### FarguesFontaineDiamonds

| Milestone | Construction or theorem | Direct prerequisites |
|---|---|---|
| `F0` | [Reuse the actual adic objects](../campaign/FarguesFontaineDiamonds/README.md) | `FF_ADIC`, `D6` |
| `F1` | [The untilt product formula](../campaign/FarguesFontaineDiamonds/README.md) | `F0`, `P1` |
| `F2` | [Frobenius equivariance and the quotient comparison](../campaign/FarguesFontaineDiamonds/README.md) | `F1`, `D4`, `A1` |
| `F3` | [Étale-site and finite-cover comparison](../campaign/FarguesFontaineDiamonds/README.md) | `F2`, `D6` |
| `F4` | [Marked untilts and Cartier divisors](../campaign/FarguesFontaineDiamonds/README.md) | `F2`, `Q0`, `P2`, `A0` |
| `F5` | [Derived étale comparison](../campaign/FarguesFontaineDiamonds/README.md) | `F3`, `C2`, `L0` |

## Checks

The original input pack's `validate_roadmap.py` checks its historical declared graph,
milestone/document ownership, source-number coverage and ordering constraints. Its results
do not validate this campaign's ownership adjustments. The campaign review metadata records
those transfers and staged edges for the campaign validator. Structural checks exclude
mathematical proof correctness and completeness of undeclared prerequisites; the separate
Lean report checks signature elaboration.
