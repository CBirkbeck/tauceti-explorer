# BP-ArithmeticGaloisRepresentations--R01.4

Issue #7958. Agent: Codex, session codex-8COGDm. Complete target-level continuation, submitted for independent review.

## Completed scope

`ArithmeticGaloisRepresentations:R01.4` is closed in this supplement: no remaining in-scope obligations, gaps or requests. All 31 accepted principal target IDs remain in the parent packet by reference. The parent file was not edited. The current WORKERS and `detail.json` target-level rule supersede the generated issue's older demand for a node for each routine lemma. Every one of the parent's 19 remaining obligations is mapped by its coverage-list index in `inheritedRemainingResolution`.

The follow-up adds 13 nodes: three constructions, four definitions, five theorems and one application. Its seven definition/construction nodes have 42 API entries and 29 discriminating tests, all represented in the reader and suggested file. The 29 baseline declarations were checked at the pinned commits. The six existing principal planets are retained in `planetSelection`; no new planet duplicates them.

The two R01.4 parent gaps are supplied:

- Steinberg 1960 was read directly. The rank-one automorphism proof is specialised to PSL₂, including uniqueness; the characteristic derived subgroup and trivial centralizer give the PGL₂ extension.
- The characteristic-two matrix cohomology result has an elementary proof for every q≥4 and every coefficient extension: average over the odd-order torus, use the root-group identity and torus covariance to remove the remaining cocycle, then average over the odd-index Borel cosets. Dickinson Lemma 42 is not claimed read or used as an unresolved input.

The new arithmetic acceptance example is the splitting field of X⁴+3, with its faithful D₈ representation over F₃. Its restriction to Q(√−3) is diagonal; local inertia at three is cyclic of order four with niveau-two characters ω₂², ω₂⁶ and projective order two. The prototype states existence of the actual Galois representation and identifies its kernel, followed by a separate fundamental-character statement.

The full reader states all inherited targets and the clauses missing from the earlier prototype: Sylow parameters, tame class equation, character/determinant transfer, induction uniqueness and self-twists, restriction intersections, normal and small-field lists, semilinear product automorphisms, projective kernel-field intersections, all eight cyclotomic cases, large-image persistence and tame inertia, and the characteristic-two quotient/module assertions.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.4.json --index <pinned declaration index>`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.4.lean`: **exit 0**, 177 warnings, all declaration uses `sorry`; **no errors or other warnings**. Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This is elaboration of a plan, not proof completion.
- Correspondence check: all 42 new API names, all 29 new test names, all 31 principal IDs in the reader, and every named signature in the 19-obligation resolution map are present.
- Independent finite-matrix calculations: the eight D₈ matrices are distinct; 1,R,S,RS have span rank four; the quadratic restriction is diagonal; complex conjugation has determinant −1; inertia/projective inertia orders are four/two. Split and nonsplit Cartan normalizer orders were checked over F₂, F₃ and F₅.
- Diff/path/JSON checks: only the four authorised deliverables; no private paths, source passages, PDF or extracted text.

## Sources and ownership

The packet records 14 public source PDFs and 15 source-version records, with exact URLs, hashes, read sections and date. Original Dickson §§239–262, pp. 260–287, supply the missing construction/counting/conjugacy details. The new primary automorphism source is Steinberg, Canadian Journal of Mathematics 12 (1960), pp. 606–615, with the exact portions read listed in the packet. Serre 1972's scanned pp. 278–283 were read as page images. The continuation also read the relevant Serre 1987, Khare–Wintenberger I/II, Dieulefait–Pacetti, Darmon–Diamond–Taylor, Caraiani–Newton, Newton–Thorne, Allen et al., Boxer–Calegari–Gee, Boxer et al., and Guralnick–Herzig–Tiep passages. The latter is corroboration for cohomology, not a dependence on its uninspected Ext reference.

No uncleared book was used. Dickinson's inaccessible paper remains unread; its theorem is replaced by the complete elementary argument, so this is not a gap.

Two already registered source corrections are carried with their original identifiers under `known`: the small-field normal-subgroup shortcut (parent E450 / PAPER-ALLEN-ETAL-23/E100) and the missing product exponent in Aut(S^r) (PAPER-BOXER-CALEGARI-GEE-ETAL-25/E26). The latter was checked in arXiv v3 p. 52 and the published Cambridge PDF p. 47. Neither is asserted to be a new discovery.

Current upstream roadmaps and the current Tau Ceti library were checked in addition to the pin. General induction/Clifford/projective representation theory stays with `RepresentationTheory/InductionRestriction`; local fundamental characters, inertia and decomposition groups stay with `LocalGaloisGroups` and R01.2. No ownership move, new roadmap or Part II is proposed.

## Next action

Independent review of this packet, reader and prototype, followed by assembly/package inclusion after acceptance. Assembly should retain the principal IDs, combine these 13 additional targets with the parent R01.4 targets, replace the old R01.4 reader/prototype section with this completed account, and recognise `gapResolutions` as supplying exactly the two named R01.4 gaps. The separate parent G7 adequacy/Schur issue is outside this supplement and remains untouched.

No mathematical follow-up is requested for R01.4. A reviewer should particularly check the root/Borel averaging proof, the actual local ramification calculation for X⁴+3, the small-field hypotheses, and the explicit number-field extension of the rational bad-dihedral definition. Nothing in the scratch directory is needed by the next worker.
