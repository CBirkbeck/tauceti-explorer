# Independent review: symplectic Reidemeister torsion modulo squares

Accepted after corrections on 2026-10-19. Issue #3620; reviewer Codex,
session codex-M0Vtgx. The design was written by Codex in the distinct session
codex-yzPdpu (#3427). This is a completed independent review, not a checkpoint.

The packet is a complete target-level planning pass under PROTOCOL §0. Acceptance
means the mathematical plan and its recorded boundaries have been checked; it
makes no implementation claim. All nine layers RT.0–RT.8 remain planned, none is
closed, and all 63 implementation statuses remain unchecked. The existing
arithmetic-scheme Chebotarev producer/primary-proof gap remains explicit.

## Inventory and checks

| Item | Reviewed result |
| --- | --- |
| Nodes | 63: 9 definitions, 14 constructions, 33 theorems, 7 comparisons |
| Node verdicts | 59 verified, 4 corrected, 0 added, 0 unverifiable |
| Definition/construction API | 91 entries; all 23 objects reviewed |
| Definition/construction tests | 70; each object has at least three |
| Other regression tests | 3 circle-theorem cases and 1 strict-circle argument-position case |
| Planets | 41, naming key objects, constructions and theorems |
| Extraction routes | All 41 items assigned here remain represented |
| Baseline | 13 declarations in 8 source files, all confirmed |
| Supplier requests / gaps | 16 precise requests; 1 recorded gap |
| Source findings | 20 reviewed: 18 confirmed, 2 rejected |
| Suggested Lean | 180 lines; 4 light definitions with actual bodies |

Every node has an individual explanation in `review.checked`. I checked every
source locator, prerequisites and proof sketch, every definition/construction API
and test, stage coverage, and the scope of the new roadmap. All 63 statements and
proof contracts, 91 API statements, 74 total tests and nine layer descriptions
were checked for exact agreement between the corrected packet and reader.

## Corrections made in place

1. **RT.1/strongly-even.** The input claimed termwise even rank was stronger than
   requiring even-dimensional cohomology. Neither condition implies the other.
   The acyclic complex K→K with identity differential has even cohomology but
   odd terms. Conversely K²→K² with differential diag(1,0) has even terms and
   one-dimensional cohomology in both degrees. The statement now distinguishes
   these properties. I added the second example as a fourth test and added the
   bounded Euler-parity API. The original rank condition itself is retained.
2. **RT.4/strict-circle-calculation.** For the stated cross pairing
   P(x,y)=B((1+A)x/2,y), the alternating form is P(x,(1−A)y), equal to
   B((A−A⁻¹)x/2,y). The input put 1−A in the first argument. For B=I₂ over Q
   and the quarter-turn matrix A, that old form takes value one on (e₁,e₁).
   The corrected form takes value zero and has right radical ker(1−A).
   Thus its rank is n−h, and the existing root-line sign cancellation follows.
   I corrected both reader occurrences, the packet proof and the roadmap's
   layer description, added the quarter-turn regression, and stated the precise
   diagonal vanishing identity in Lean over the existing linear-map carrier.
3. **RT.3/normal-ring-torsion.** Clarified that normality extends generic
   isomorphisms between already defined finite étale torsors. The proof constructs
   local extensions before gluing; it does not extend an arbitrary ramified
   generic torsor. This is a clarification of the proof, not a stronger theorem.
4. **RT.3/normalized-family and source E19.** The orthogonal-circle specialization
   example refutes the broad raw-base-change assertion in AV §2.3.3, p. 13. It is
   not a geometric three-dimensional symplectic counterexample to Appendix B.10.
   The source locator and both relevant node matches now say so. The normalized
   three-dimensional theorem is supported by its independent term-rank formula:
   s−h=2r and ν_L=(−1)^rν_upperH give the normalization sign fibre by fibre.
5. **Source findings.** Rejected E2 and E18, narrowed E17 and E19, extended E1 to
   include the missed incorrect internal symplectic-basis pairings, and corrected
   E30's locator to pp. 25–26. Every finding now has a verdict and reason under
   this review's identifier. The reader presents rejected findings as rejected.
6. Added independent source/baseline verification records and the complete node
   ledger. Updated the three remaining-work entries that asked for the very
   independent sign review completed here; they now call for implementation of
   the reviewed arguments. No prerequisite ownership or target was moved.

## Source readings and verdicts

All statements and descriptions are in my own words; no source excerpt was
added. Public PDF hashes match the packet's records. I read every cited locator
in [AV arXiv v1](https://arxiv.org/pdf/2303.13436v1): §1.1, pp. 1–4; §1.3.3,
p. 6; §1.5, p. 8; §2, pp. 10–26; Appendices A–C, pp. 61–90. Arithmetic §§3–6
and Appendix D are outside this roadmap. I also read [Jouve–Rodriguez Villegas
v3](https://arxiv.org/pdf/1004.4208v3), §5, Theorem 5.1 and proof, pp. 16–17,
and §6, Lemma 6.1, p. 18; and [Thom](https://www.maths.ed.ac.uk/~v1ranick/papers/thomcob.pdf),
IV §8, Theorem IV.13, p. 81. Thom supplies point bordism coefficients; the
labelled cellular-filtration argument is explicitly a target here.

| Finding | Verdict and independently checked scope |
| --- | --- |
| E1, AV §1.5, p. 8 | Confirmed; fix the rank index and set the internal e/e and f/f pairings to zero. |
| E2, AV Theorem 2.2, p. 14 | Rejected; the dimension variable is locally bound. Renaming it j is useful but is no source correction. |
| E3, AV Lemma 2.7.1 proof, pp. 16–17 | Confirmed; odd-order H₂ suffices. The supplier retains the SL₂(F₉) order-three exception. |
| E12, AV A.6.1, p. 66 | Confirmed; the perfect alternating quotient is C⁰/ker d⁰, not coker d⁰. |
| E13, AV A.7, pp. 66–67 | Confirmed; the residual acyclic terms belong in degrees zero and one. |
| E14, AV B.3/B.4.1, pp. 70–71, 74 | Confirmed; inverse iteration, basis sizes and the brutal-truncation quotient have the recorded indices. |
| E15, AV B.6, pp. 78–80 | Confirmed; cone summands give the corrected Lagrangian, degree shift and labels. The rank formula determines parity. |
| E16, AV B.7–B.8, p. 81 | Confirmed; the needed class is in B.6 and torsion is defined in section B.7. |
| E17, AV B.9.2, pp. 83–84 | Confirmed only for the shifted target chain, second-block terminal vector and Mf in B.36. B.35's diagonal matrix is already correct. |
| E18, AV B.9, p. 85 | Rejected; the paragraph explicitly refers to the left side of B.30, which already includes normalized torsion. |
| E19, AV §2.3.3/B.10, p. 13 and pp. 85–86 | Confirmed with the circle/three-dimensional scope distinction above; the strict-model comparison requires its acyclic sign. |
| E20, AV C.2, p. 87 | Confirmed; the generalized primary component is nondegenerate, whereas an ordinary fixed subspace need not be. |
| E21, AV C.3–C.4, pp. 89–90 | Confirmed for the typed cocycle/cohomology slips. The explicit twist order is a convention independently verified by computation. |
| E25, AV B.9/C.2 and (1.5) | Confirmed as a proof-range gap for finite fields, not a disproof of the characteristic-zero statements. The corrected RT.4 proof addresses it. |
| E26, AV §2.7/§2.11 | Confirmed; a raw nonsquare can normalize to one. The Q(i) witness has h=0 and survives normalization. |
| E27, AV §2.11, pp. 20–21 | Confirmed; finite unions require upper-density-zero exceptions rather than lower density zero. |
| E28, AV Lemma 2.11.2, p. 21 | Confirmed; only individual compositum projections are surjective without disjointness. |
| E29, AV Lemma 2.12.2, pp. 22–23 | Confirmed; W=0 would give an empty controlling subset and must be excluded. |
| E30, AV §2.14, pp. 25–26 | Confirmed; for Spec Z[t] the stated normalization gives 1/2. The argument only needs the separately requested positive lower bound. |
| E31, JRV §5, p. 16 | Confirmed; the positive-definite real plane disproves unrestricted spinor-norm surjectivity. Theorem 5.1 does not require that assertion. |

I repeated arXiv version-history and title/correction searches on 2026-10-19,
including the author-page results linked in the packet. No dedicated correction
was found. This does not prove that none exists. The published AV and JRV
passages were not independently read, and the design author's comparison with
the AV author PDF was not repeated. Findings remain confined to the identified
public preprint versions. Sources mentioned only inside AV are not represented
as sources read in this review.

## Baseline confirmation

All thirteen entries were read under their exact names at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All eight distinct files match the
shared pinned build byte for byte. No citation was removed or replaced.

| Declaration | Statement and use confirmed |
| --- | --- |
| `CochainComplex` | Existing increasing-degree complex carrier; HomologicalComplex.lean, line 157. |
| `HomologicalComplex.homology` | Degreewise homology, with HasHomology available in the abelian ModuleCat; ShortComplex/HomologicalComplex.lean, line 90. |
| `groupHomology` | Homology of representation chains, not a theorem identifying integral and mod-two coefficients; GroupHomology/Basic.lean, line 230. |
| `Sylow` | Maximal p-subgroup carrier; transfer and lifting remain separately supplied; Sylow.lean, line 55. |
| `SymplecticGroup.det_eq_one` | Determinant one for finite-index symplectic matrices over a commutative ring; SymplecticGroup.lean, line 385. |
| `TauCeti.SquareClassGroup` | Additive units modulo squares, with F₂-module structure; SquareClassGroup/Basic.lean, line 44. |
| `TauCeti.squareClassHom` | Quotient homomorphism to the multiplicative square-class wrapper; same file, line 65. |
| `TauCeti.squareClass_eq_zero_iff` | Vanishing is equivalent to a unit being square; same file, line 75. |
| `RingHom.squareClassMap` | Field-map action on additive square classes; SquareClassGroup/Multiplicative.lean, line 148. |
| `CliffordAlgebra.orthogonalSpinorNorm` | Finite-dimensional nondegenerate quadratic-form map, with two invertible; SpinorNorm/Basic.lean, line 143. |
| `CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal` | Reflection value is [−Q(v)] at this pin, not [Q(v)]; same file, line 168. |
| `CliffordAlgebra.spinorNorm` | Restriction of that map to SO, reused directly; same file, line 213. |
| `CliffordAlgebra.spinorNorm_apply` | The restriction identity, needed by the convention adapter; same file, line 220. |

On SO an even number of reflection factors cancels the baseline's negative
sign and any common polar factor. This justifies the adapter without planning a
second spinor norm. The current upstream convention was not substituted for the
pinned one.

## Closure, ownership and numerical evidence

I read the reviewed AUDIT-29 and AUDIT-30 entries in `data/library-coverage.json`,
the relevant KTheoryFiniteLocalFields and K3 library entries, and the exact
Z.3/Z.6, finite-field L.1, number-field V.2, Kummer M.1 and classifying-space H.1
supplier statements. M.7/M.8 and V.4 do not themselves discharge the stronger
requested interfaces; the packet correctly requests them explicitly.

The current read-only upstream roadmap and Tau Ceti library were searched and
read independently of the atlas snapshot. AlgebraicTopology, GeometricTopology,
Chebotarev, LieGroups and OrthogonalSpinGroups retain their existing ownership.
Relevant upstream Suggested files and the newer roadmap directories disclose no
second torsion or Zassenhaus development to import. Generic determinant theory,
local coefficients, duality, geometric bordism, weighted number-field
Chebotarev, covers and Chern theory remain imports or precise extensions of their
owners. No upstream file was edited and no higher-tier definition was moved.

The target-level proof sketches account for nonroutine work explicitly: local
minimal-model strictification, even stabilization, labelled skeletal bordism,
rank-sensitive finite-field comparison, and the separate real Bockstein
argument. The real conclusion has the full mod-two domain; it is not inferred
from the weaker integral H₃/2 comparison. The density count uses a product
quotient only after proving its disjointness and keeps upper-density-zero
exceptions throughout.

I independently recomputed both Gaussian examples from the reader's generator
matrices and twist words, using exact rational-complex arithmetic. Expanding the
surface relator gives a 2×8 cocycle constraint; solve its first 2×2 block to
express the six remaining coordinates. Substitution in the twist words followed
by M⁻¹ gives the six-dimensional operator. All four representation intertwining
equations and T̃ι=ιM⁻¹ hold. Dividing its characteristic polynomial by that of
M⁻¹ gives x⁴+1 and (x²+1)² respectively; determinants are 4/2=2 and 8/2=4.
This checks the witness used by the density argument independently of the
source's displayed action matrices.

## Validation and handoff

- `python3 scripts/check_blueprint.py` passes with **0 errors, 0 warnings**,
  both normally and with a declaration index generated by the submission
  scanner from the eight independently fetched pinned source files.
- `python3 scripts/check_sorry_data.py` passes.
- The 180-line suggested file compiled with `lean-check`, exit zero, at the
  pinned shared build; available memory was 79 GiB before compilation. Its only
  warnings were 21 permitted proof-placeholder warnings. This checks signatures,
  not the mathematical proofs. No library build or language server was started.
- Packet/reader and review-ledger consistency checks pass; every implementation
  remains unchecked. Source PDF hashes and the eight pinned file comparisons pass.

The orchestrator must assign an accessible primary-proof producer for the
arithmetic-scheme quadratic-cover contract in RT.5. Number-field Chebotarev and
AN.4 alone are insufficient. The uncleared Serre book was not obtained from any
other copy. The existing upstream notes also retain the smooth/simple-cellular
extension and the specific symplectic fundamental-group calculation, while the
M.8 request retains the unread primary real-Chern comparison obligation.
These are recorded supplier work, not unreported contradictions in this plan.
No other question prevents accepting this target-level pass. The durable
handoff is `research/blueprint/handoff/REV-DESIGN-SymplecticReidemeisterTorsionModSquares.md`.
