# PKG-SmoothRepresentationsOfLocalGroups

Worker session `cc-ccb859` (Claude Code), 2026-10-09, branch `cc-ccb859`. Short-pipeline package job: one sitting, from the two part packets as they stand.

## Deliverables

`research/blueprint/packages/SmoothRepresentationsOfLocalGroups/`:

- `README.md` — 199,968 bytes (the cap is 200,000). Intro, scope table against ReductiveGroupsPartII and the Tau Ceti roadmaps, boundary paragraph against the consumers, conventions (groups, coefficients, measures and modulus, Hecke algebras, adjunctions, centres, Satake and parameters, integral parameters, names), layer order, references, then ten layers with 169 targets: SR.0 (16), SR.1 (22), SR.0:derived-extension (9), SR.2 (20), SR.3a (9), SR.3 (18), SR.2a (5), SR.4 (24), SR.5 (19), SR.6 (27). Every target has its statement, hypotheses, a source locator and its prerequisites ("Needs"); definitions and constructions have API items and tests; the Mathlib/Tau Ceti declarations each layer rests on are listed at the end of the layer.
- `Suggested.lean` — 161 declarations and 68 `example`s; sha256 after the final check is recorded below.
- `metadata.toml` — `topic = "math.RT"`.

Inputs: packets `SmoothRepresentationsOfLocalGroups--SR.0.json` (99 nodes, 8 stages, status `partial` because its suggested file was never written) and `--SR.4.json` (70 nodes, 3 stages, complete, with reader and suggested file), their readers and handoffs, and the atlas stage descriptions. Every stage of the roadmap is covered by one of the two packets, so no layer had to be written from the atlas description alone.

## Stage order

The README orders the layers SR.0 → SR.1 → SR.0:derived-extension → SR.2 → SR.3a → SR.3 → SR.2a → SR.4 → SR.5 → SR.6, which is the order argued in the SR.0 handoff (restructure proposal 1) rather than the atlas order SR.2 → SR.2a → SR.3a → SR.3. Reasons, as stated in the README's "Layer order" section: Bernstein's stabilisation theorem (the only complete public route to second adjointness for general G) uses uniform admissibility, the Bernstein decomposition, noetherianity and generic irreducibility; SR.3 uses nothing from SR.2a; SR.0:derived-extension follows SR.1 (derived Hecke algebra extends the permutation-module Hecke algebra) and precedes SR.2 (principal-series Jacquet modules split by Ext vanishing between central characters). The atlas `requires` edges SR.2a → SR.3a and SR.3a → SR.3 should be replaced by SR.2 → SR.3a, SR.3a → SR.3 and SR.3 → SR.2a when the atlas is regenerated; the consumers of SR.3 and SR.2a are unaffected (AS.2 already uses SR.3).

## Moved-down notions and the tier rule

- **EnhancedDerivedSheaves:E1 (tier 4) → SR.0:derived-extension.** K-injective resolutions in the Grothendieck category, the unbounded derived category, the dg (Hom-complex) enhancement and derived invariants are targets of this roadmap (`grothendieck-abelian`, `derived-smooth-category`, `k-injective-resolutions`, `dg-enhancement`, `derived-invariants`), built with Mathlib's `DerivedCategory`, `HomComplex` and `IsGrothendieckAbelian`. The ∞-categorical enhancement and the comparison with sheaves on the classifying stack are left to the roadmaps that consume this one; the README says so in its boundary paragraph and in the layer introduction. This is the move the SR.0 packet already recorded (restructure proposal 2).
- **ExcursionOperatorsAndSpectralAction / LanglandsParameterStacks (outside the upstream set) → SR.6.** Neither packet lists them as prerequisites of any node; the SR.4 packet already moved the minimum SR.6 needs into its own nodes (`crossed-cocycles`, `finite-wild-discretization`, `finite-wild-representability`, `ell-adic-extension`, `excursion-algebra`, `excursion-invariant-comparison`, `geometric-hecke-action`, `excursion-center-action`, `torus-central-compatibility`, `parabolic-excursion-compatibility`). The README states these as targets of SR.6 and names LP/ES only as consumers. The atlas stage SR.6 still lists LP1, LP2:excursion-presentation, ES1, ES6:functoriality and ES7:parabolic in `requires`; those edges should be dropped and reversed when the atlas is regenerated. The redirect table of the SR.4 handoff remains the reference for the higher roadmaps' edits.
- A prerequisite audit over both packets found 436 internal, 85 Mathlib, 52 Tau Ceti and 29 ReductiveGroupsPartII (tier 1) prerequisites and no citation of any roadmap of equal or higher tier.

## What the README could not support (recorded here, not in the README)

The README keeps the packets' explicit limits as hypotheses or boundaries, in roadmap language:

- Multiplicity one of Whittaker functionals and Rodier heredity for a general quasi-split group: proved for GL_2 only; the README says the general case is taken as a hypothesis where needed (SR.0 gap 1 and 4).
- Harish-Chandra's classification of tempered representations (and Plancherel theory): the Langlands classification takes it as an explicit hypothesis (SR.0 gap 2). Projectivity of discrete series in the tempered category is not a target (gap 3).
- Bushnell's localisation proof and the Bushnell–Kutzko embeddings: not public; the positive Hecke homomorphism is proved from the Iwahori factorisation and second adjointness by Bernstein's route (gap 5).
- SR.4: the actual Satake carrier (`satake-transform` is stated on the true N-integral; the SR.4 Lean prototype is a coefficient-matrix adapter), and the elementary-divisor/isotropic-flag proofs behind the Macdonald and unitary triangular matrices (targets `macdonald-formula`, `unitary-triangular-transform`, `unitary-isotropic-counts` are stated with their sources, their proofs were not reconstructed).
- SR.5: the finite-group projective envelopes and modular multisegment inputs of Helm's integral centre (`integral-blocks`, `type-projectives`); the general integral essential-vector theorem is an interface contract (`essential-vector-contract`); interpolation is the conditional theorem (`llc-family-conditional`), stated as conditional.
- SR.6: the geometric bootstrap of the Hecke action, the integral GIT refinements and Dat's integral depth generators are stated as targets with their sources; their proof routes are the ones the SR.4 reader gives and were not refined further.

Content trimmed to meet the 200,000-byte cap (the packets and readers keep the full lists): at most four API items and three tests per definition (the SR.0 packet has up to 13 API items and 5 tests per definition; 291 API items and 161 tests in the packet against 168 and 120 in the README for SR.0–SR.2a; the SR.4 packet's 51 and 51 are all present), one source locator per target (the first in the packet), and no check-lists for theorems (the packets' `acceptance` fields). Statements and hypotheses are complete. Node slugs appear in headings so the packet's full record of a target can be found by name.

## Lean

`Suggested.lean` = the SR.4 suggested file (unchanged mathematical content) + a new SR.0 part written here, in the shared namespace of that file.

- New SR.0–SR.2 declarations (73 names incl. examples): `exists_compactOpenSubgroup_le` (van Dantzig); `Representation.IsSmooth`, `smoothVectors`, `baseChange`, `whittakerFunctionals`, `invariantsOf`, `IsAdmissible`, `smoothDual`, `jacquetModule`, `averaging`, `ofCharacter` with their characterisation lemmas; `HasUnitProOrder` (pro-order invertible in A, as a condition on every finite continuous quotient); `IsSmoothCharacter`; `SmoothRep` (full subcategory of `Rep A G`), `SmoothRep.ι`, `instAbelian`, `smoothPart`, `smoothPartAdjunction`, `SmoothCentre` (= `CatCenter`), `instIsGrothendieckAbelian`; `LocallyConstantCompact`, `HaarMeasureWithValues`, `HeckeAlgebra` with its idempotents, `HeckeAlgebraLevel` (endomorphisms of `A[G/U]` as an `A[G]`-module), `isHeckeTriple_compactOpen`, `HeckeAlgebraLevel.equivHeckeRing` (against Mathlib's `HeckeRing` with Tau Ceti's ring instance); `Representation.ind` (smooth vectors of Mathlib's `coind`), `indResEquiv`, `ind_isSmooth`; 24 examples (`ℤ_p` non-smooth regular representation, admissibility of `ℚ[ℤ_p/U]`, pro-orders of `ℤ_p` over `ℚ` and `ZMod p`, Hecke algebras at levels ⊤ and ⊥, induction from ⊤ and ⊥, …).
- Dedupe: the SR.4 file's temporary adapters `Smooth`, `smoothVectors`, `Admissible`, `extendRepresentation` were deleted and their uses redirected to the SR.0 names above. `IsSmooth` is stated over `AddCommMonoid` modules so that it applies to dual and sub-representations without instance mismatches; `smoothVectors` over `AddCommGroup`, as the SR.4 uses require.
- Imports: the SR.4 file's Mathlib modules plus Stabilizer, Coinduced, Intertwining, OpenSubgroup, Nonarchimedean.Basic, Sets.Compacts, HeckeRing.Defs, GrothendieckCategory.Basic, PadicIntegers, GroupAction.Quotient, PGroup, and one Tau Ceti module, `TauCeti.NumberTheory.HeckeRing.Associativity` (the ring instance on `HeckeRing`).
- Not elaborated (comment inventory at the end of the file, generated from the SR.0 packet): 518 names — every SR.0-part declaration, API item and test not declared above, in particular everything needing the reductive carriers (Iwahori decompositions, positive Hecke homomorphisms, Iwahori–Matsumoto/Bernstein presentations, parabolic induction and Jacquet functors for P = MN, the geometric lemma, Casselman's pairing, cuspidal theory, uniform admissibility, the Bernstein decomposition and centre, temperedness, the Langlands classification, stabilisation and second adjointness), the derived-extension constructions beyond the Grothendieck instance, and the convolution-level comparison lemmas. The SR.4 part keeps its 72 omitted signatures as before.
- Process tokens in the SR.4 comments (gap ids, "packet", "reader") were replaced by roadmap language; no mathematical content changed.

lean-check: `lean-check <worktree>/research/blueprint/packages/SmoothRepresentationsOfLocalGroups/Suggested.lean` (the swarm wrapper in its bin directory), four runs. Run 1: 19 errors (dot notation on `Representation` values resolves to `MonoidHom.*`; `IsPGroup` import; a `CommRing (CatCenter _)` instance that does not exist). Run 2: 4 errors (a section variable not captured by a `sorry` body; the `AddCommGroup`/`AddCommMonoid` instance mismatch described above). Run 3: **exit 0, 0 errors, 182 warnings, all `declaration uses sorry`**, no other warning (unused-variable linters included). Run 4, after the comment-only edits: **exit 0, 0 errors, 182 warnings, all `declaration uses sorry`**. Final `Suggested.lean`: 177,672 bytes, sha256 `d6950f0053044d9446da8dfe0c4732f780aecbd383f64877166c506f8b668ac1`.

## Checks

- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean, metadata.toml and this note: 4 files, 0 problems.
- No `/home/` path in any deliverable; the README was scanned for process vocabulary (packet, node, job, review, coverage, checkpoint, gap ids) and the three hits were reworded.
- `git status --porcelain` shows only the package directory and this note.

## Notes for the maintainer

- The README is at 99.98% of the byte cap. Any reviewer-requested addition must be paid for by a cut; the natural cuts are the per-layer "Library" lists (4 KB) or merging SR.3a into SR.3.
- The SR.0 packet still has status `partial` for the single reason that its own suggested file does not exist; the package's `Suggested.lean` covers that part. If the other worker's SR.0 suggested file lands, its SR.0 names should be checked against the SR.0 section here (same packet names, so they should agree).
- Sources were not re-downloaded in this job; locators are the packets'. The two packets cite different editions of Treumann–Venkatesh, Venkatesh, Calegari–Geraghty 2018/2020 and Clozel–Thorne; the README's reference list keeps both editions with distinct keys ([TV]/[TVpre], [Ven]/[Ven-arXiv], [CG18]/[CG18-arXiv], [CG20]/[CG20-arXiv]) so that each locator points at the edition it was read in.
