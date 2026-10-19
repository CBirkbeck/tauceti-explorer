# DESIGN-LevelOneAutomorphicFormsForClassicalGroups

Issue: #3468. Agent: Codex. Session: codex-7o3Qp5. Branch: codex-7o3Qp5-level-one. This is a complete design submission for independent review, not an implementation or a checkpoint. No second job was claimed.

The five deliverables are this handoff and the matching roadmap JSON, packet JSON, reader Markdown and suggested Lean file named `LevelOneAutomorphicFormsForClassicalGroups` in their respective blueprint directories. The reader contains the full mathematical specifications; its finite tables are mathematical data written in our own notation, with source locators. No source passages, PDFs or private library files are included.

## Coverage

The packet contains 107 targets: 18 definitions, 12 constructions, 44 theorems, 8 comparisons, 20 lemmas and 5 applications. The 30 definitions/constructions have 91 API items and 92 discriminating tests. There are 40 planets and six pinned baseline declarations. All implementation statuses are unchecked.

| Stage | Targets | Coverage |
|---|---:|---|
| LO.1: level-one spectrum and weights | 9 | planned |
| LO.2: intrinsic explicit formula and exclusions | 20 | planned |
| LO.3: packets, EP and triangular counts | 16 | planned |
| LO.4: torsion masses and exact recovery | 17 | planned |
| LO.5: low-weight classifications | 10 | planned |
| LO.6: theta maps, eigenparameters and first occurrence | 11 | planned |
| LO.7: Siegel dimensions and weight thirteen | 10 | planned |
| LO.8: harmonic realization and stable forms | 14 | planned |

Every stage is planned at target level; none is closed. There are 12 explicit implementation/source gaps, 26 supplier contracts and two proposed supplier extensions. Status complete means the design pass is finished, not that these obligations have proofs.

The reader includes all 29 nonscalar rows, all 32 scalar cusp eigenparameter rows, all 24 rank-24 compact lattice eigenparameters and their degrees, the SO₃ trace system, torsion support counts, and the five harmonic theta order calculations. The statements cover arbitrary regular highest weight in genus at most eight and all genera for the stated low scalar weights, harmonic isomorphism and stable theorems.

## Proof order and corrections to preserve

- The real Weil ring uses parity-truncated subgroups: the odd cutoff 23 contains the odd induced representations, whereas the even cutoff 22 also contains both zero characters. Effective bounded-weight finiteness uses both parities. Weights reconstruct the real parameter only on the specified regular determinant-one stratum. The nonregular parameters with three trivial characters and with one trivial plus two sign characters give a counterexample without regularity.
- The weight dictionary and the EP definition precede triangular count recovery. The Siegel-operator L-function comparison is in LO.6, before the higher-genus square-integrability argument. Node and stage prerequisite orders are acyclic.
- Coarse masses establish the 27 known classes before refined masses use them. The classifications use those refined tables afterwards. The earlier CL lattice eigensystem is an input to the H1 analysis, not a consequence of the Siegel dimension table it helps prove.
- Keep the intrinsic Rankin–Selberg formula, its gamma-integral functional and cone inequality here. CN owns scalar enclosures, exact checkers, complete covers and the existing multiplicity-gram-lift node. The lift averages by multiplicity. Strict negativity is preserved under compression; the Euclidean normalized minima need not agree.
- The real Gram matrix requires active epsilon factors to be real signs. The explicit formula has the stated conjugated finite Satake trace, Fourier normalization and half zero term. The cone assertion does not assert positive semidefiniteness on signed vectors.
- Keep actual cuspidal classes distinct. In particular the two weight-23 GL₂ classes give two labels. Positive-genus regular enumeration has 223 actual candidates and 58 survivors, or 198 shapes and 58 survivors after collapsing those labels. The 199/59 convention includes genus zero.
- The weight-23 residual analysis concerns additional classes outside the known duality-stable set. Its first regular residual is already the known GL₁₀ class. Use the six exact self-dual counts (1,0,0,0,0,0), subtracting that known class, rather than asserting all six fibres are empty. E21 records this new, unreviewed source observation. E1–E20 retain their provenance in the accepted paper extraction; no independent-review verdict was assigned by this design.
- The exceptional repeated-top parameter remains in the 181-vector list. The separate self-dual two-class certificate is required. The GRH restriction uses its own test family and asserts at most one class at the surviving parameter, with no existence conclusion.
- First-occurrence degree and actual lift genus remain distinct. The actual genus determines the Rallis string; the degree remains in the strict growth bound. Native harmonic coefficient assignments carry stabilizer denominators, whereas the transported coinvariant generator maps to the ordinary lattice sum. Direct Leech coefficients count embeddings, retaining the isometry-group factor between embeddings and sublattices.

## Ownership and supplier contracts

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The six cited declarations were read at those pins. Current Tau Ceti and TauCetiRoadmap main were also inspected read-only. RootSystems and SpinRepresentations were read in full as upstream structural examples.

Reuse the current IntegralLattices carrier, Gram and isometry interfaces, and its reference lattices. Rank-16 completeness belongs to OrthogonalTamagawaAndLatticeMass Layer 7I; constructing two examples does not establish it. Current IntegralLattices 6E supplies reference rank-24 lattices and nonisometry, with completeness/rootless uniqueness requiring the stated extension. Generic genus-one theta and its rational/real bridge remain with ThetaSeries. Reuse the existing smooth integral symplectic scheme. General ring spinor norms and integral GSpin lifting stay with the spin owner/GN.2; integral split SO and the comparison at 2 stay with ReductiveGroups 9.

The two packet restructuring proposals route missing generic inputs to **Orthogonal and spin groups, Part II: integral spinor norms and local lifting** and **Integral lattices, Part II: Niemeier completeness and Leech embedding orbits**, each beginning from its current upstream base. They propose no edits to existing upstream layers. GN.2/GN.3 import those extensions, and LO retains its polynomial obstruction and theta consequences.

The 26 packet requests give exact stage contracts and consuming nodes. Their principal owners are AF for native automorphic objects and the GL₂ dictionary; AL/AN for local factors and analytic explicit-formula foundations; ML for Arthur and real-packet foundations, preserving ML.0's dependency gate; AS for normalized EP/orbital/proper-Levi formulas; CN for exact certificates; B4/B5 for Siegel spaces, boundary and operator theorems; GN for lattice and spin inputs; MP for theta/Rallis/Ikeda and the precise image criterion; FF.4 for Golay finite data. No supplier file was modified.

## Remaining implementation and source obligations

All twelve gaps have exact consuming targets in the packet. A follow-up must supply:

1. Native automorphic, Arthur, Siegel and higher-theta carriers at the pins, rather than proposition-field replacements.
2. Arthur's foundations and the real-packet comparisons under the explicit ML.0 gate.
3. Complete candidate-cover and interval-negativity manifests, including the enlarged 12293/265 lists, the 1256 weight-24 exclusions and GRH witnesses.
4. The additional exceptional self-dual two-class negative certificate at length 31/4, with the specified known subset and a rational vector with a strict certified margin.
5. Exact mass row/rank/solution certificates, including the Sp₁₆ easy orbital values and 766-column hard system.
6. Original centralizer-volume and local-orbital normalizations, including qualified critical special-value rationality and the prime 2.
7. A proof/comparison for the Koike–Terada character determinant specialization.
8. The lattice completeness inputs beyond the current reference constructions.
9. Böcherer's original Theorem 5 hypotheses and normalization in precisely the five required cases.
10. Exact Golay/Leech group, embedding-orbit and stabilizer witnesses, including the full intermediate lattice arguments in CT19a §3.
11. The rank-16 harmonic source's invariant matrices and two-line Hecke decomposition.
12. Exact lattice neighbour/eigenparameter and first-occurrence certificates for the 24 compact eigenlines, preserving their independence from the new cusp table.

The next job is independent review of this design, especially E21, the packet character branches, the ownership boundaries and the completeness interfaces. Implementation must discharge the recorded contracts and gaps before any mathematical target is described as formalized. No further source data or unpublished calculation in this run's scratch directory is necessary to understand the plan.

## Sources read and limits

The reader and packet contain public URLs, SHA-256 digests, editions, access date and exact theorem/section/page locators for six sources. CT20 was read through the mathematical sections and tables. Targeted portions of Tai17, the public French Chenevier–Lannes preprint and CT19a were read; their precise boundaries are in the manifest. The companion scalar/enumeration/character code and residual database were inspected. The entire three-page Böcherer verification note was read.

The English Chenevier–Lannes book was not used. The public French preprint supplies the cited results, with its own chapter numbering and pagination. Original Böcherer and Koike–Terada papers and all original local-orbital references were not read; the corresponding exact supplier/source obligations are explicit. The journal page showed no linked CT20 erratum. Retrieval of the author's publication page failed, so this is not an exhaustive erratum-search claim.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LevelOneAutomorphicFormsForClassicalGroups.json --index <pinned declaration index>`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/LevelOneAutomorphicFormsForClassicalGroups.lean`: compiled successfully at the pinned shared build. The only warnings report unproved declarations. Memory availability was checked before compilation; no build, cache update or language server was started. The file is 247 lines, has six real-bodied light definitions, and uses existing native carriers. Heavy target signatures remain in the reader under the current WORKERS compact-file rule.
- Independent exact exploratory arithmetic reproduced the 198/58 shape and 223/58 actual regular enumeration, the 29/29 nonscalar/scalar regular split, every torsion support count in the reader, the SO₃ determinant 288 and its rational mass solution. Exact parsing of the companion database gave 12293 rows and 187 nonnegative residual rows, including the known GL₁₀ type. These checks are not Lean certificates and the original Sage/PARI suite was not run.
- A consistency pass checked every node statement against the reader, topological ordering of nodes and stages, all internal use references, planet caps, source digests, and absence of local paths or prohibited prose tokens from the roadmap, packet and reader. The submission also runs intake path/JSON checks, the unproved-data-definition checker and Git whitespace checks.
