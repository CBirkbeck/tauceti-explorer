# Independent review of Classical Serre Modularity

Reviewer: Codex, session `codex-vUBWfG`. Date: 2026-10-09. Issue: #7508.
Verdict: **needs_changes**. This is a completed independent review, not a checkpoint.

The README is a substantial roadmap in upstream form. All 81 accepted targets are present, including the corrected terminal-weight arithmetic, the distinction between the classical and modern routes, the two integral lattices at 2, the dyadic closure and the weight-one descent. The package cannot be accepted under PROTOCOL §§13 and 20: its compiling Lean file is only a selection of the required signatures. It has 16 of the 38 specified API declarations and omits the three modern construction interfaces carrying the remaining 22. Several planned tests and named theorems are also missing or replaced by strictly weaker arithmetic examples.

## Scope and six checks

I read the three accepted packets `ClassicalSerreModularity--R26.1.json`, `--R27.3.json` and `--R33.5.json`, the entire package README and Suggested file, the writer's handoff, the relevant library-coverage records and supplier contracts. The packets contain 36, 37 and 8 nodes respectively: 81 targets across 18 layers, including five definitions/constructions, 38 API entries and 32 tests. The target ledger below records the location of each target; its entries record README coverage, not Lean completeness.

| Check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and size | Pass | Introduction, notation, boundaries, ordered layers, mathematical milestones, exact targets, sources and prerequisites; 176,259 bytes after the corrections, below 200 KB. Compared with the upstream ClassFieldTheory example and the local upstream SemisimpleAlgebras and InductionRestriction documents. The long source and prerequisite lists are justified by three distinct proof strands. |
| 2. Fidelity and boundaries | Pass against the accepted plan, with the supplier limitation below | Every target has a statement and hypotheses, including five terminal rows sharing an explicit branch contract. Conductor one is distinguished from unramifiedness of a characteristic-zero lift; residual rationality is imposed before Lemma 8.2; minimality and local types are retained when killing primes; the scalar dyadic case is included. The ordinary CM input is a requirement, not an established supplier consequence. |
| 3. Own words and locators | Pass | The document is organised around its own targets and their proof dependencies, rather than a section-by-section digest of a source. Each target has theorem/section and page locators, with the five terminal rows using a shared source paragraph. Source passages inspected for the delicate points are listed below. A supplementary normalised 18-word comparison against the downloaded searchable texts found no matches; this is supporting evidence, not a substitute for reading, and the scanned Serre source was not searchable. |
| 4. No process in the reader | Pass | No job IDs, packet filenames, review verdicts, checkpoints or coverage statuses occur in the README. Layer/target IDs identify mathematical prerequisites and are legitimate roadmap notation. |
| 5. Suggested Lean file | Fail | `lean-check` exited 0: no errors, 96 declaration-uses-`sorry` warnings, no other warnings. Missing API, test and theorem signatures are detailed below. It also replaces a pinned Tau Ceti newform carrier with opaque data rather than importing that carrier. |
| 6. Metadata | Pass | Exactly `topic = "math.NT"` followed by a newline; the subject is number theory. |

## Corrections made in place

1. In R33.3/Paso 4 the initial weight-two branch now goes straight to the crystalline lift. Only the initial weight-four branch passes through the Steinberg lift and Lemma 2.3. The previous numbering could apply the lemma without its Steinberg hypothesis. Dieulefait–Pacetti, Paso 4, p. 13, gives the explicit branch. The accepted packet also compresses this branching; the source-faithful clarification does not alter its target.
2. The source note for R27.6 now distinguishes the distinct-Frobenius form used for Artin representations from the general weight-one form exported to ML.1. The latter is already stated in the target and required by the accepted plan; the previous claim that no target uses it contradicted those statements.
3. The source note for the imaginary-quadratic ordinary branch now describes the required input accurately. A lifting theorem excluding imaginary-quadratic induction cannot establish this branch.
4. The baseline description now calls the existing Newform field a nebentypus character, rather than a character field.
5. The Dieulefait–Pacetti title is corrected to *A simplified proof of Serre's Conjectures*, matching arXiv:2108.07577v2.

No packet, supplier, queue or atlas files were changed. Suggested.lean and metadata.toml were retained for the revision worker; the missing representation and compatible-system interfaces require a coordinated mathematical change rather than a cosmetic signature insertion.

## Required Lean revision

### A. Restore all three construction interfaces and their 22 API entries

These names are absent as active declarations. The checked first two definition groups do provide all their 16 API entries, taking namespace-qualified names into account. A reference in a docstring or a matrix identity is not a declaration of the planned interface.

All names below have prefix `TauCeti.SerreConjecture.DP.`:

| Accepted construction | Required suffixes |
| --- | --- |
| `R33.2/dihedral-local-type-at-n` | `levelTwoCharacter`; `levelTwoCharacter_orderOf`; `levelTwoCharacter_artin`; `dihedralType`; `dihedralType_irreducible`; `dihedralType.standardLattice`; `dihedralType_standardLattice_residual`; `dihedralType_residual_semisimplification` |
| `R33.2/dp-lift-existence-and-good-dihedral-insertion` | `GoodDihedralInsertion`; `GoodDihedralInsertion.system`; `GoodDihedralInsertion.type_at_N`; `GoodDihedralInsertion.congruences`; `GoodDihedralInsertion.modular_iff` |
| `R33.3/dp-dyadic-transition-and-the-order-three-type` | `orderThreeCharacter`; `orderThreeType`; `orderThreeType.standardLattice`; `orderThreeType.adaptedLattice`; `orderThreeType_standardLattice_reduction`; `orderThreeType_adaptedLattice_reduction`; `orderThreeType_exists_lattice_reduction_iso`; `orderThreeType_isCompatible`; `typeChangeAtTwo` |

The current `dihedralInertia`, `dihedralFrob`, `Eis` and `M2` calculations are useful unit computations. They do not supply characters on the local Galois group, an induced representation, a stable lattice or an almost strictly compatible global system. In particular, the planned residual statement must specify the lattice; only semisimplification is lattice independent. Preserve the corrected integral-lattice argument and attach these computations to the actual planned interfaces. Do not introduce a `Prop := sorry` substitute for an unstated condition.

### B. Complete the test contract

The seven good-dihedral tests and four (L/W/D) tests appear with the intended content. For the 21 modern tests, the following distinctions are necessary:

| Test group | Existing mathematical checks | Required completion |
| --- | --- | --- |
| Dihedral type (6) | `residue_field_units` and `level_two_q7_N13` have their planned arithmetic; `residual_trace_zero` has the swap trace computation. | `unnormalised_character` has no corresponding example. `level_one_nonexample` only checks divisibility, not reducibility on inertia. `residual_depends_on_lattice` computes the different matrices, but the promised one-dimensional versus two-dimensional invariant spaces are not stated in an example. |
| Insertion (6) | `insertion_congruences_q13` and `insertion_level_two` are combined in an explicit prime/congruence example. | `insertion_needs_rationality` and `insertion_q_gt_5` are absent. `insertion_crystalline_needs_weight_two` is only `2 ≠ 13 + 1`, with no assertion about which lift clause applies. `insertion_not_general_lift_owner` is an ownership boundary in the plan, rather than a mathematical proposition: retain that boundary in prose and give an actual application test for the construction; do not manufacture an example of `True`. |
| Order-three type (9) | `order_three_level_two` has the planned cardinality arithmetic; `standard_lattice_relations`, `adapted_lattice_change_of_basis` and `split_case_standard_lattice` have explicit matrix checks. | `steinberg_nonexample` and `needs_unramified_at_3` are absent. `ramification_index_three` needs its named concrete oddness check; a general `Odd e → Odd v → Odd (e*v)` example does not identify the planned ramification index. `adapted_lattice_nonsplit` and `standard_lattice_nonexample` compute nontrivial versus trivial inertia matrices but omit the promised invariant-dimension assertions. |

Use the packet's names to label each `example`, including combined examples where their full assertions are present. Arithmetic-only tests explicitly specified as such by the plan are sufficient: this review does not demand a Galois construction merely to verify `5² − 1 = 24`.

### C. State the omitted named targets, not only their arithmetic consequences

The file contains the headline Serre statements, level-one row conclusions, the (L/W/D) implications, Lemma 8.2 and several Artin and weight-one signatures. The following gaps remain under §§13 and 20:

| Layers | Missing or weaker signatures to address |
| --- | --- |
| R26.1–R26.2 | Böckle's presentation, lifting-method flatness, the minimal weight-two and nebentypus lifts, their compatible systems, and the full local-ring smoothness target. The local Frobenius quadratic is only one algebraic ingredient. |
| R26.3–R26.5 | The local Serre-weight twist, ordinary/local-reducibility and degenerate lifting branches, and the terminal-row branch contract. Five `LevelOneUpTo` conclusions plus arithmetic rows do not state that contract. |
| R27.1 | Good-dihedral insertion, preservation across systems and residual members, and the Dickson/A5 subsidiary targets. The non-solvability theorem covers only one component of the preservation target. |
| R27.4–R27.5 | The full auxiliary-prime choice and the dyadic weight-two claim. Odd-times-odd arithmetic is not the finite-flat exclusion statement. |
| R27.6 | Theorem 10.1(i) for regular compatible systems; the missing parts of the Artin reduction target (realisation and lattice existence, lattice independence, weights/character and the positive-density Frobenius class); and the general weight-one assertion without `hdist`. The existing weight-one theorem proves only the distinct-Frobenius variant. State the finite-flat weight-two export or the precise imported bridge to the current `serreWeight = 2` signature. |
| R33.1–R33.3 | The modularity-transfer contracts, the Fontaine–Laffaille non-bad-dihedral statement, Paso 1, Lemma 2.1, Paso 3, Lemma 2.3 and Pasos 4–5. Their arithmetic examples and the overall weak theorem cannot replace their representation/system statements. |
| R33.4–R33.6 | The terminal characteristic-five argument, the auxiliary odd member of the dyadic system, and the eigenform/newform equivalence used by the optimisation route. Weight enumeration and the exclusions `p ≠ 3,1` give only numerical ingredients. Keep proof-route comparison and globalisation audits as proof/dependency documentation, rather than inventing logical certificates. |

A revision should make a target-to-active-declaration index and check every named theorem in the accepted nodes, not just search for target labels in comments. The standard opening note that upstream prototypes are non-exhaustive does not waive this programme's explicit API/test and named-theorem requirements.

### D. Reuse the pinned newform structure

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` defines `HeckeRing.GL2.Newform N k` as a normalised new eigenform, with its nebentypus and newness. Suggested.lean instead defines opaque `Newform` and `WeightOneNewform` carriers, with independent level, weight and character accessors. Missing attached Galois representations justify adding data above the existing carrier; they do not require replacing it. Import and wrap the pinned carrier, and leave only the unavailable attachment data as explicit stand-ins. The compiler run used the shared pinned Mathlib build; it did not validate any Tau Ceti import because this file has none. The revised use of Tau Ceti must receive its own check at the pinned build.

## Supplier and source audit

The pins checked were Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the relevant library-coverage records and actual declarations for `Nat.maxPrimeFac` (including the value at one), the prime-counting definitions, Bertrand's theorem, the matrix/general-linear carrier, Maschke's complement theorem, the Tau Ceti newform structure and the abelian-variety structure. Existing arithmetic, representations and forms must be reused; none of these declarations supplies the missing modularity/system interfaces.

The ordinary supplier `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q` explicitly excludes residual induction from an imaginary quadratic field. The R26.4 branch includes induction from ℚ(√−p) for p ≡ 3 mod 4. The accepted R26.1 packet already records this supplier gap. The package may identify the required extension, but cannot describe the current supplier theorem as having that scope. This is inherited closure work, not authority to change the supplier in this review.

The modern terminal reducible characteristic-three branch was compared with `GL2ModularityLifting--R32.3.json`: R32.5 supplies crystalline weights 2 and 4 with a globally reducible residual semisimplification. Retain the finite-order twist normalisation rather than imposing only `1 ⊕ χ̄₃` on every representation. The R32.6 globalisation audit explicitly does not certify independence of every cited modern theorem from Serre modularity; the package's conditional discussion correctly keeps that limitation. The irregular compatible-system export remains owned by ML.1, and the finite-flat elliptic and GL₂-type exports retain their stated neighbouring owners. No cyclic import from ML.1 is introduced.

Public PDFs were fetched only into disposable scratch space and their SHA-256 values matched the packet receipts. The passages independently inspected for the delicate statements included:

- [Khare, level-one preprint](https://arxiv.org/pdf/math/0504080v1), the prime estimates and terminal rows, especially §6.1, pp. 24–26: the final exponent must be 18, compatible with divisibility by 6. The document distinguishes that correction from what the source prints.
- [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Definition 2.1, pp. 4–5; the lifting and system statements around §§4–5; Lemma 8.2 and its rationality restriction, pp. 17–18; the dyadic proof, p. 19; and Theorem 10.1, its proof and the Artin export, pp. 19–21. These support the conductor/weight conventions, the prime-field requirement and the general weight-one export.
- [Böckle's appendix](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf), Proposition 1, pp. 1–2: the fixed-determinant and unfixed-determinant presentation counts are distinguished in the README.
- [Savitt](https://arxiv.org/pdf/math/0404327v3), Corollary 6.15, p. 38, and Remark 6.17, p. 39: the residual inertial possibilities have lattice/endomorphism and ramification conditions. Preserve those conditions instead of turning the table into an unconditional classification.
- [Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2), the lifting inputs, pp. 4–7; Paso 2 and Lemma 2.1, pp. 11–12; Lemma 2.3, Remark 6 and Paso 4, pp. 12–13; and Paso 5, p. 14. The lattice-aware correction of the Lemma 2.3 argument and the conditional weight-four detour are retained.
- Rosser–Schoenfeld, Theorems 1–2 and Corollary 1, published p. 69: the README and the suggested numerical statement use the correct strict inequalities and their ranges.

This is a review of package fidelity, contracts and prototypes; it does not claim to have re-proved every source theorem or inspected every external dependency's proof. No private book was needed or copied. The scanned Serre article's Proposition 4 locator is inherited from the accepted plan, rather than represented as a fresh scan audit.

## Validation

- Each of the three `scripts/check_blueprint.py` runs: zero errors and zero warnings. The packets were read-only.
- `lean-check research/blueprint/packages/ClassicalSerreModularity/Suggested.lean`: exit 0, 96 `sorry` warnings, no errors or other warnings; no Lean edit followed this check.
- Metadata shape, README byte limit and presence of all 81 target labels checked programmatically; statements and hypotheses read independently.
- Submission file validation and `git diff --check` are recorded in the handoff after final validation.

## Accepted-target ledger

All IDs in this table have prefix `ClassicalSerreModularity:`. The five terminal rows share the statement, hypotheses, source and prerequisites immediately surrounding their table. All other entries have their own target paragraph. Line numbers refer to the README in this submission.

| Accepted target | Kind | README line |
| --- | --- | --- |
| `R26.1/level-one-theorem-and-the-meaning-of-arises-from` | theorem | 172 |
| `R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof` | theorem | 177 |
| `R26.1/bockle-appendix-minimal-deformation-ring-presentation` | theorem | 182 |
| `R26.2/lifting-method-flatness` | lemma | 199 |
| `R26.2/minimal-weight-two-lift` | theorem | 203 |
| `R26.2/local-ring-at-q-smooth` | lemma | 207 |
| `R26.2/nebentype-lift-at-q` | theorem | 213 |
| `R26.2/compatible-system-lifts` | theorem | 217 |
| `R26.3/chebyshev-next-prime` | lemma | 252 |
| `R26.3/serre-weight-twist` | lemma | 261 |
| `R26.3/weight-interval-containment` | lemma | 265 |
| `R26.3/level-one-induction-scheme` | theorem | 270 |
| `R26.4/local-reducibility-ordinary` | lemma | 280 |
| `R26.4/level-one-lifting-lemma` | theorem | 285 |
| `R26.4/degenerate-branches` | theorem | 292 |
| `R26.5/small-weights-table` | application | 327 |
| `R26.6/level-one-proof-assembly` | theorem | 336 |
| `R26.6/corollary-1-2-proof` | theorem | 341 |
| `R26.6/finiteness-corollary-1-3` | theorem | 349 |
| `R26.6/corollary-8-1-ii-and-the-statement-W1` | theorem | 354 |
| `R27.1/good-dihedral-prime-definition` | definition | 366 |
| `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved` | lemma | 391 |
| `R27.1/dickson-and-the-dyadic-solvable-refinement` | lemma | 415 |
| `R27.2/hypotheses-Lr-Wr-and-Dr` | definition | 428 |
| `R27.2/prime-gap-estimates-driving-the-weight-recursion` | lemma | 450 |
| `R27.2/theorem-3-2-weight-reduction` | theorem | 459 |
| `R26.3/explicit-prime-counting-input` | lemma | 230 |
| `R26.3/next-prime-ratio` | lemma | 241 |
| `R26.3/finite-auxiliary-prime-checks` | lemma | 247 |
| `R26.4/ordinary-reduction-and-parity` | lemma | 300 |
| `R26.5/terminal-row-branch-contract` | application | 308 |
| `R26.5/weight-eight` | application | 316 |
| `R26.5/weights-ten-twelve` | application | 317 |
| `R26.5/weights-fourteen-twenty` | application | 318 |
| `R26.5/weights-twentytwo-thirty` | application | 319 |
| `R26.5/weight-thirtytwo` | application | 320 |
| `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` | theorem | 399 |
| `R27.1/good-dihedral-prime-insertion` | theorem | 410 |
| `R27.3/theorem-3-1-killing-ramification` | theorem | 472 |
| `R27.3/theorem-3-3-initial-case` | theorem | 477 |
| `R27.3/double-induction-assembly` | theorem | 482 |
| `R27.3/d0-from-all-lr` | lemma | 487 |
| `R27.4/auxiliary-characteristic-choice` | lemma | 496 |
| `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice` | theorem | 500 |
| `R27.4/strong-form-by-minimal-lifts` | theorem | 507 |
| `R27.4/theorem-1-2` | theorem | 515 |
| `R27.5/dyadic-weight-two-claim` | lemma | 526 |
| `R27.5/d1-by-the-prime-three` | theorem | 530 |
| `R27.5/dr-for-r-at-least-two` | theorem | 535 |
| `R27.5/hypothesis-H-and-theorem-9-1` | theorem | 540 |
| `R27.6/full-classical-serre-theorem` | theorem | 549 |
| `R27.6/finite-flat-weight-two-export` | theorem | 559 |
| `R27.6/scope-of-the-final-statement-and-the-compatible-system-export` | application | 564 |
| `R33.1/dp-target-and-the-weight-at-least-two-convention` | theorem | 606 |
| `R33.1/dp-modularity-lifting-inputs` | theorem | 611 |
| `R33.1/fontaine-laffaille-member-not-bad-dihedral` | lemma | 616 |
| `R33.1/solvable-residual-termination` | lemma | 620 |
| `R33.1/paso-1-weight-two-system` | theorem | 624 |
| `R33.2/dihedral-local-type-at-n` | construction | 632 |
| `R33.2/dp-lift-existence-and-good-dihedral-insertion` | construction | 653 |
| `R33.2/lemma-2-1-large-image` | theorem | 672 |
| `R33.2/paso-3-killing-the-odd-level` | theorem | 676 |
| `R33.3/dp-dyadic-transition-and-the-order-three-type` | construction | 684 |
| `R33.3/remark-6-weight-two-after-type-change` | lemma | 713 |
| `R33.3/paso-4-removing-two` | theorem | 717 |
| `R33.3/paso-5-killing-the-good-dihedral-prime` | theorem | 725 |
| `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case` | theorem | 737 |
| `R33.4/dp-odd-characteristic-assembly` | theorem | 745 |
| `R27.6/odd-artin-weight-one-modularity` | theorem | 595 |
| `R27.6/artin-reductions-of-serre-type` | lemma | 568 |
| `R27.6/unramified-residual-representations-arise-in-weight-one` | theorem | 578 |
| `R27.6/weight-one-reduction-is-onto-for-almost-all-primes` | lemma | 584 |
| `R27.6/weight-one-descent-from-infinitely-many-primes` | theorem | 589 |
| `R33.5/auxiliary-odd-prime-for-the-dyadic-system` | lemma | 754 |
| `R33.5/dp-characteristic-two-closure` | theorem | 758 |
| `R33.5/qualitative-serre-theorem` | theorem | 763 |
| `R33.5/globalisation-dependency-check` | comparison | 768 |
| `R33.6/modern-and-classical-modularity-agree` | comparison | 783 |
| `R33.6/strong-form-by-the-modern-route` | theorem | 787 |
| `R33.6/two-routes-comparison` | comparison | 792 |
| `R33.6/elliptic-curve-export-via-either-route` | theorem | 800 |

The revision is complete when the missing interfaces, examples and named signatures above are supplied, the existing pinned carriers are reused, and the resulting file compiles with only `sorry` warnings. Rechecking compilation alone will not resolve this verdict.
