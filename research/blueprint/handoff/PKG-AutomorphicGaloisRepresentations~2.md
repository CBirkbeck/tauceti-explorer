# PKG-AutomorphicGaloisRepresentations~2 — blocked checkpoint

Issue: #7891. Worker: Codex, session `codex-XePsML`. Date: 2026-10-11.
Branch: `codex-XePsML-7891`. The bot confirmed the claim in issue comment
6106034462. No second job was claimed.

This is **partial**, not a completed package or a new independent review.
The package's existing `review.json` remains `needs_changes` and is untouched.
The accepted packet, reader, original suggested file and supplier roadmaps
are unchanged. All the README targets remain; most full arithmetic signatures
and tests in Suggested.lean remain absent. The closing commented catalogue is
an inventory of missing interfaces, not evidence that they elaborate.

## Why this cannot be completed within the authorized deliverables

PROTOCOL §13 requires the actual mathematical signatures and examples, and
says that a condition that cannot yet be stated must be omitted, rather than
replaced by an arbitrary proposition. §15 forbids rebuilding mathematics
owned by a supplier. This job authorizes only its three package files and this
handoff. The following concrete supplier omissions persist:

- `research/blueprint/suggested/ModularCurvesPartII--R14.3.lean`, lines 34–45:
  the modular quotient, geometric H¹, Hecke comparison and special-fibre
  Eichler–Shimura declarations are inside a block comment. Its elaborated
  rank-two quotient is a generic free-module calculation, not the parabolic
  cohomology or Jacobian carrier needed here. Thus the R19.1 premotive,
  geometric Hecke action, rational orbit projector, pairings, integral lattice
  comparison and geometric tests cannot import those objects.
- `research/blueprint/suggested/PotentialModularityAndCompatibleSystems.lean`,
  header lines 66–82: its R24.3–R24.6 carriers explicitly omit inertia,
  Frobenius, Weil–Deligne parameters and labelled Hodge data. They cannot
  supply the full strict compatible family required by R19.3–R19.5. Equality
  of selected numerical coefficients cannot test those missing conditions.
- `research/blueprint/suggested/OrdinaryAutomorphicFormsAndModularityLifting.lean`,
  lines 66–105: ordinary automorphic/Hecke interfaces are comment-only.
  Its active R21.3 forms provide matrix fragments, not the eigenform-to-local-
  flag existence witness. The concrete flag contract below therefore takes
  that witness as an input; it does not establish automorphic existence.
- The geometric local and coefficient-prime targets additionally need the
  owned cohomology, comparison, Weil–Deligne and Wach interfaces in R06/R07,
  R08, R17/R18, R21 and PadicHodgeTheory P7. The existing package catalogue
  records the prerequisites for each target. Generic vector spaces,
  unlabelled lists of integers or arbitrary Frobenius matrices would erase
  those hypotheses.

A bounded search of the current Tau Ceti tree found representations, modular
forms and lattice algebra, but did not resolve these geometric interfaces.
This is not a claim of an exhaustive new library audit. Defining shadow
versions here or editing the suppliers would violate this job's scope.

## Changes preserved

The released earlier worker has an open draft,
[PR #8151](https://github.com/CBirkbeck/tauceti-explorer/pull/8151), session
`codex-68SmfT`. Its README and Lean corrections were carried forward from its
diff, with attribution here; its branch and PR were not changed. Those changes
include:

- The actual integral submodule T⁺ inside T and quotient T/T⁺, intersection
  stability, cancellation, torsion-freeness, generic-fibre span and the precise
  finite spanning DVR hypotheses for a free rank-one quotient.
- Coordinate-lattice examples showing T∩Ke₁=Oe₁; for nonzero nonunit c the
  class of e₁ in O²/cOe₁ is nonzero and killed by c. Zero and full lines exclude
  an unconditional rank-one assertion.
- Genuine p-adic unit-root signatures for the 11a1 polynomials at 3 and 2,
  faithful finite-group lifting retaining the image order, and projector
  naturality under an actual intertwining map. The signed averaging example
  uses a permutation representation, including cardinal normalization.
- README distinctions between arithmetic and cohomological conventions,
  scalar cancellation versus the rank-one lattice conclusion, and the
  geometric determinant owner already upstream.

This run adds:

- `OrdinaryRefinement`: a record on a fixed continuous G→GL₂(K), with supplied
  inertia, arithmetic Frobenius, nebentypus and cyclotomic characters. It fixes
  k≥2, an actual O-unit Euler root, a rank-one K-submodule, a continuous
  unramified quotient character with Frobenius equal to that root, the action
  on the line, and the action on the actual quotient K²/V⁺. There are no
  arbitrary proposition placeholders.
- `ordinaryRefinement`, choosing the concrete imported flag witness;
  `ordinaryRefinement_quotient` and `ordinaryRefinement_subcharacter`, exposing
  its actual action equations; invariance of the line; and a proposed matrix
  determinant theorem derived from the line and quotient actions. No separate
  determinant equation is assumed in the record.
- A conditional 11a1-at-3 test checking the unit-root equation and quotient
  Frobenius, an `IsEmpty` test excluding a flag with the nonordinary at-2
  polynomial, and a determinant test on the actual representation and its
  graded characters. These do not identify an arbitrary supplied ρ with the
  global 11a1 representation.
- README descriptions of these precise inputs and conditional conclusions.
  The generic projector image-membership example is no longer described as
  the rational orbit-versus-embedding test, which is still missing.

## Coverage audit and remaining work

Removing nested block comments and line comments, and ignoring declaration
attributes before counting, gives:
16 `def` commands, 1 `abbrev`, 1 `structure`, 22 named `theorem` commands and
69 `example` commands. These counts include private helpers and algebraic
fragments. They do **not** establish coverage of the packet's 66 targets,
15 definitions/constructions, 90 API items or 66 discriminating tests.

Exactly 13 accepted API names are active (some remain fragments):

- `TauCeti.ModularGalois.ConditionC`
- `TauCeti.ModularGalois.IsSemisimpleSubgroup`
- `TauCeti.ModularGalois.ConditionC.mono`
- `TauCeti.ModularGalois.ConditionC.of_index_two`
- `TauCeti.ModularGalois.card_charpoly_fibre`
- `TauCeti.ModularGalois.schollProjector`
- `TauCeti.ModularGalois.schollProjector_idempotent`
- `TauCeti.ModularGalois.newformFactor`
- `TauCeti.ModularGalois.ordinaryRefinement`
- `TauCeti.ModularGalois.ordinaryRefinement_quotient`
- `TauCeti.ModularGalois.ordinaryRefinement_subcharacter`
- `TauCeti.ModularGalois.ordinaryLatticePlus`
- `TauCeti.ModularGalois.ordinaryLatticePlus_saturated`

The other 77 accepted API names remain absent as elaborated declarations.
In particular, `ordinaryRefinement_coeffChange` and `ordinaryRefinement_period`
need the coefficient/period comparison suppliers; even the five active
ordinary API names do not provide the eigenform existence theorem. The
remaining names, grouped by accepted construction, are:

- `geometric-construction-and-the-eichler-congruence-relation`: `higherCoefficientHeckeAction`, `higherCoefficientHeckeAction_level`, `higherCoefficientEichlerShimura`, `higherCoefficientEichlerShimura_factorisation`.
- `parabolic-realisation-premotive`: `ParabolicPremotive`, `ParabolicPremotive.filTopEquivCuspForms`, `ParabolicPremotive.pairing`, `ParabolicPremotive.heckeAction`, `ParabolicPremotive.levelChange`.
- `integral-structure-of-the-newform-premotive`: `IntegralPremotive`, `IntegralPremotive.kernel`, `integralParabolic`, `integralParabolic_filTop`, `integralParabolic_heckeDuality`, `integralNewformPremotive`, `integralNewformPremotive_rational`.
- `carayol-sigma-lambda-construction`: `Carayol.sigmaLambda`, `Carayol.sigmaLambda_finrank`, `Carayol.sigmaLambda_level_indep`, `Carayol.cohomology_decomposition`.
- `residual-representation-of-a-newform`: `residualRep`, `residualRep_trace`, `residualRep_det`, `residualRep_lattice_indep`, `residualRep_unique_charpoly`.
- `full-weight-two-hecke-algebra-and-its-galois-representations`: `fullHeckeAlgebra`, `fullHeckeAlgebra_free`, `tateModule_free_rank_two`, `heckeRep`, `heckeRep_charpoly`, `residualHeckeRep`, `heckeRep_newform`.
- `scholl-projector`: `schollProjector_parabolic`, `schollProjector_hecke`, `schollProjector_level`.
- `newform-projector-and-coefficient-descent`: `newformOrbitProjector`, `newformOrbitProjector_idempotent`, `newformFactor_baseChange`, `newformFactor_rank`, `newformFactor_periodLines`, `newformFactor_lattice`.
- `all-cohomological-hilbert-representation`: `hilbertGaloisRep`, `hilbertGaloisRep_charpoly`, `hilbertGaloisRep_det`, `hilbertGaloisRep_twist`, `hilbertGaloisRep_carayol`, `hilbertGaloisRep_arithmeticDual`, `hilbertGaloisRep_unique`, `hilbertGaloisRep_coefficients`, `hilbertGaloisRep_auxiliaryCongruence`, `hilbertGaloisRep_classical`.
- `cm-hilbert-eigenform`: `IsCMHilbert`, `IsCMHilbert.inducingField`, `IsCMHilbert.trace_inert`, `IsCMHilbert.trace_split`, `IsCMHilbert.twist`, `IsCMHilbert.coefficientExtension`.
- `fixed-eigenform-compatible-family`: `fixedEigenformFamily`, `fixedEigenformFamily_member`, `fixedEigenformFamily_goodPolynomial`, `fixedEigenformFamily_localParameter`, `fixedEigenformFamily_coeffChange`, `fixedEigenformFamily_strict`.
- `ordinary-refinement-and-saturated-lattice`: `ordinaryRefinement_coeffChange`, `ordinaryRefinement_period`.
- `good-nonordinary-crystalline-wach-realisation`: `eigenformDcris`, `eigenformDcris_charpoly`, `eigenformWach`, `eigenformWach_modParameter`, `eigenformWach_changeBasis`, `eigenformWach_roots`.
- `geometric-hecke-determinant`: `geometricHeckeDeterminant`, `geometricHeckeDeterminant_goodFrob`, `geometricHeckeDeterminant_continuous`, `geometricHeckeDeterminant_coeffChange`, `geometricHeckeDeterminant_residual`, `geometricHeckeDeterminant_wholeRing`.

Resume from `research/blueprint/reviews/REV-PKG-AutomorphicGaloisRepresentations.md`
and the accepted packet, not command counts. Read each supplier's actual
exported signatures, then replace the corresponding missing catalogue entries
with full definitions, named target theorems, API lemmas and examples on the
owned carriers. Recheck every test against its accepted discrimination: local
subgroup schemes, coefficient-orbit descent, filtered and labelled comparisons,
CM infinity type, residual lattice semisimplification, local epsilon factors,
Wach basis change and integral determinant laws. No claim is made that the
review's omissions have all been fixed.

## Sources and upstream checked

Fresh focused source reading in this run (no source passages are recorded):

- Deligne–Serre, *Formes modulaires de poids 1*, §8.6, printed p. 526
  (lifting the finite prime-to-residue-characteristic image), with surrounding
  §§8.3–8.7 to check the reduction and image-order hypotheses.
  [Numdam PDF](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf).
  SHA-256 `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc`.
- Skinner–Wiles, *Residually reducible representations and modular forms*,
  §3.3, equation (3.2), printed pp. 38–39 (arithmetic ordinary line and
  quotient normalization). Their automorphic hypotheses remain supplier
  inputs; the added flag record isolates only the rank-two algebraic contract.
  [Numdam PDF](https://www.numdam.org/article/PMIHES_1999__89__5_0.pdf).
  SHA-256 `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3`.

Access date: 2026-10-11. Other unchanged source locators and baseline citations
are inherited from the accepted plan and the reviewed package; this is not a
claim that every source was reread or every baseline declaration re-audited.
No restricted book was needed and no source PDF was added to the repository.

The upstream style examples read were the atlas copies of Multiquadratic and
ArithmeticDirichletSeries. Current upstream was also inspected read-only,
particularly `IntegralHeckeAndGaloisDeterminants/Suggested.lean`: its
PolynomialLaw-based determinant and reconstruction belong there, not to a new
shadow determinant record here. The README now names that upstream owner.
The current upstream checkout reported commit
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti reported
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither was built or modified.
These current checkouts are for avoiding duplicated plans; elaboration uses
only the specified pinned shared build.

## Validation

- `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  final code run exited **0**, **48** `declaration uses sorry` warnings,
  **0** errors and **0** other Lean warnings. The later edit changes only a
  docstring. The single compile ran after `free -g` showed 101 GB available;
  no language server, Lake build/update/cache or concurrent second compile
  was started by this session.
- Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Pinned Tau Ceti baseline: `f790474821cf4256814db967cb154e7af3d0c369`.
  The file imports Mathlib only, so this does not establish elaboration of
  missing Tau Ceti/geometric interfaces.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json --json`:
  **0** errors, **0** warnings. The packet is unchanged.
- Submission path/local-path checks: **4 files, 0 problems**.
  `git diff --check`: passed. The final PR checks are recorded below.
- Metadata remains exactly `topic = "math.NT"`.

## Maintainer intake note

This is submitted as a **draft checkpoint** because package completion in
`research/blueprint/issues.py::deliverables_complete` currently falls through
to `True` after checking that all output paths exist. It does not inspect
mathematical coverage or the `needs_changes` package review. An automatically
merged ready PR could therefore mark this incomplete package as done.
Do not promote it to a completed package on file existence alone. Intake
needs maintainer handling for this partial revision and its unresolved
supplier interfaces. The earlier draft #8151 is still open; reconcile the two
checkpoints without treating either as an accepted full package.
