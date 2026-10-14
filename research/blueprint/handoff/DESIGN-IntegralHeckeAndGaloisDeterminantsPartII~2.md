# Handoff: DESIGN-IntegralHeckeAndGaloisDeterminantsPartII~2 (revision round 2)

Worker: Claude (Opus), session `claude-3dOOCA`, 14 October 2026. Issue #8908.
The bot confirmed the claim for this session's comment before work began.
This round revises the plan that `REV-DESIGN-IntegralHeckeAndGaloisDeterminantsPartII`
returned as `needs_changes` (gaps G1 and G2, and an unsynchronized reader document).
The packet's `review` object is left in place for the next reviewer to replace.

## What this round changed

**G1: auxiliary characters (IHR.7/auxiliary-characters) — closed.** The missing input is the
Grunwald–Wang theorem in odd order. It is already planned and accepted elsewhere: the node
`ArithmeticGaloisDuality:R02.4/grunwald-wang` (package layer R02.4, "Grunwald–Wang with its exact
dyadic obstruction"). Its special case needs 8 | n, so it never occurs for odd orders. The
freely readable source is Conrad, *Lifting global representations with local properties*
(2011), Appendix A, Definition A.1 and Proposition A.3, pp. 31–32
(https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf, SHA-256
782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd, read 14 October 2026).
The node now states the exact contract and proves it:
- ψ = χ|_{G_F} for a character χ of G_{F⁺} of odd prime order r ≠ p, with r > 4n².
- Since each v ∈ R lies over a split place v̄, ψ(Frob_v) = ψ(Frob_{v^c}) = χ(Frob_v̄) and
  ψ^c = ψ. Both coprimality conditions of ACC+ Lemma 3.2.1(2)–(3) therefore only ask that
  χ(Frob_v̄)² avoid at most 4n² eigenvalue ratios in k̄^×.
- Squaring is a bijection of μ_r for r odd, and μ_r(O) → k^× is injective for r ≠ p, so
  suitable Frobenius values ζ_v̄ exist.
- Grunwald–Wang then gives χ, with the unramified character with value ζ_v̄ prescribed at the
  places below R and the trivial character at the other places of the prescription set.
- For ψ_2, the prescription set is enlarged by every place above a prime where ψ_1 ramifies,
  which gives the disjoint rational-prime ramification.
- For the character of condition (3), the prescription set is enlarged by every place above a
  prime below R ∪ R^c ∪ S_p. This is the strongest reading of "unramified above".

The node's acceptance items now include R = ∅, n = 1, and the even-order non-example
(r = 2 cannot avoid 1).

Other G1 changes:
- Prerequisites: Chebotarev layer 10 is dropped from this node; the Grunwald–Wang node and
  ClassFieldTheory layer 7 are added.
- New request to `ArithmeticGaloisDuality:R02.4`, stating the odd-order contract. It asks for
  nothing beyond the accepted node.
- The ClassFieldTheory layer 12 and Chebotarev requests were reworded: ClassFieldTheory leaves
  Grunwald–Wang out of scope, and Chebotarev is now used only in the reductions of Lemma 3.2.1.
- Source issue E17 now gives this construction as its correction.
- Conrad is added to `sources` and `sourceVersions`.
- The roadmap definition: IHR.7 now requires `ArithmeticGaloisDuality:R02.4`, and
  `ArithmeticGaloisDuality` is added to the roadmap's prerequisites. ArithmeticGaloisDuality is
  in Caraiani–Newton tier 8 (merged package with SelmerIwasawaCohomology; Tau Ceti PR #858); this Part II is not among the 94 roadmaps of the
  tier file, so no tier rule is crossed, and the citation is to an accepted node of the owner.

**G2: Lean signature coverage — resolved under PROTOCOL §13 and the 2026-10-12 shape rule.**
Every packet declaration whose carriers exist at the pins is now a Lean declaration. The file
grew from 946 to 1,242 lines (64 theorems, 42 examples). The additions:
- IHR.1: `iwahoriOneTwo` with the test `TameIwahoriLevel.not_iwahori_one_two`; `heckeMap`
  (coefficient change, real body) with `tameEmbedding_map` and `ramifiedHeckePoly_map`;
  `heckeTwist` (real-bodied f_χ) with `tameOperator_twist` and `ramifiedHeckePoly_twist`;
  `weilCharacter_inertia`; and the test `tameOperator_unnormalized_wrong`.
- IHR.2: `tame_hecke_centre`.
- IHR.3:
  - `leviEmbed` now has a real body.
  - New `siegelUnipotent`, `siegelOppUnipotent`, the predicate `HasSiegelIwahoriDecomposition`,
    `toFinIndex` and `leviEmbedFin`.
  - `SiegelParahoric.iwahoriDecomposition` and the test `SiegelParahoric.rank_one`.
  - `siegel_strongly_positive_invertible` (Lemma 2.2.10 and its tame analogue).
  - `siegelFullPoly_coeff`.
  - The unitary tame level on the GL_{2n}(F_v) side of ι_v: `UnitaryTameLevel`,
    `IsBlockDecomposable`, `inter_levi` and `iwahoriDecomposition`, with the tests
    `iwOneOne_inter`, `iwZeroOne_inter`, `toGL_tame` and `diagonal_not_decomposable`.
  - `unitaryTamePoly` with `_eq_map`, `_monic` and `_coeff`, and the tests `_rank_one`,
    `_inertia` and `_not_siegel`.
- IHR.4:
  - The full étaleness theorem over ℤ: `genericMonicLeft`, `genericMonicRight` and
    `factorizationMap`.
  - `factorization_finite_free`: finite free, of rank binom(n₁ + n₂, n₁).
  - `factorization_etale`: `Algebra.etaleLocus` equals the basic open set of the resultant.
  - The test `factorization_rank_one`, and the test `siegelResultant_classical_vanishing`.
- IHR.7: `weilDeterminant_eq_prod`.

Statements whose carriers are not at the pins are listed by name, layer by layer, in the
file's closing comment, with the missing carrier named, and are targets of the reader document.
These carriers are smooth and admissible representations with the Hecke action on invariants,
rec^T and Weil–Deligne representations, parabolic Satake maps, the unitary group with ι_{v^c},
Chenevier determinants, locally symmetric spaces and their complexes, absolute Galois groups of
number fields with Frobenius elements, idele class characters and automorphic Galois
representations. None is replaced by a placeholder. A script check confirms that every packet API
item and unit test name occurs in the file, either as a declaration or in that list.

G2 is removed from `gaps`. It was a coverage obligation, not a missing mathematical input, and
each stage's coverage record now says what its Lean part states and what stays in the document.

**Other packet changes.**
- `IHR.2/tame-hecke-centre` is now stated for every coefficient ring in which q_v is a unit, not
  only O ⊂ Q̄_p. A base-change proof step from ℤ[1/q_v] was added, with an acceptance item for
  coefficients ℤ/ℓ′ℤ.
- `IHR.4/factorization-etale` cites `mathlib:Algebra.etaleLocus`, read at the pin (line 40 of
  `Mathlib/RingTheory/Etale/Locus.lean`), and has a rank-one acceptance item.
- The summary is updated.
- Status `complete`. All seven stages are `planned` (IHR.7 was `partial` only because of G1).
  There are 0 gaps and 20 requests. Node, API and test counts are unchanged (43 nodes, 123 API
  items, 70 unit tests, 25 planets); there are 23 baseline declarations.

**Reader document.** The node sections, layer sections, requests, source mistakes and structure
were regenerated from the corrected packet and roadmap. A template check against the old reader
first reproduced it line for line, except where the review had changed the packet. So the
reader now carries all the review's corrections:
- integral torus invertibility by descent;
- the Siegel change-of-volume inverse;
- the |α|^{(1−2n)/2} normalization;
- the ordered resultant;
- compact determinant gluing;
- parabolic-intersection decomposedness;
- the qualified tests.

The hand-written boundaries, sources, layer overview and Lean section were updated, including
the Grunwald–Wang supplier, Conrad, Thorne §3 and the compilation statement.

## Corrections of the previous review, checked

- IHR.1 invertibility. Computed directly: for GL₂, residue field F₅ and A = F₅^× × {1}, the
  simple-reflection double coset has degree [I : I ∩ sIs⁻¹] = 4·5 = 20. Its degree is not a
  unit of ℤ[1/5], so the old Weyl-presentation argument fails. The reviewer's descended inverse
  is correct: 1_{ItI} = T_J(t) ∗_J E_A, E_A B is I-bi-invariant, and the two volume
  normalizations differ by [I : J]. With E_A² = [I : J]E_A this gives an inverse over ℤ[1/q_v]
  without dividing by [I : J].
- The resultant order was checked at ACC+ p. 928 (Res_v is the resultant of P_{v^c,φ^{−c}} and
  P_{v,φ}, in that order).
- The rec^T normalization was checked on the n = 1 example: geometric Frobenius on rec^T of
  normalized induction of two trivial characters of GL₂ has eigenvalues q_v^{1/2}, q_v^{1/2}.
- The other corrections (Siegel inverse after Thorne §3, Lemma 3.1; factorization freeness;
  compact gluing; decomposed level; qualified tests) were read and kept.

## Checks

- `python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
  `git diff --check`: clean.
- `lean-check` on the suggested file: exit 0, at Mathlib 082e2d3 and Tau Ceti f790474, with the
  genuine Tau Ceti Hecke-ring import. The 141 warnings are all `declaration uses sorry`, and
  there are no errors.

## What remains

- The 20 supplier requests stay open. They are supplier obligations, not claims of
  implementation: SR.1–SR.3, ET.6, TC.2–TC.4, AG2.2, AG2.5, IHG.1–IHG.4,
  ALS.5:finite-level-duality, ArithmeticGaloisDuality R02.4, and ClassFieldTheory layers 7, 9,
  11 and 12 with Chebotarev layer 10.
- For the orchestrator, unchanged from the previous round:
  - The PA.0 ownership of ACC+ Theorem 2.4.8 needs a decision. The first restructure proposal
    gives options (a) and (b). PotentialAutomorphyInfrastructure's packet still lists neither
    option's prerequisites.
  - The PA.3/PA.4 consumers of Theorem 3.1.1 should cite IHR.7.
- The `remaining` lists name the first lemma-level refinements.
- For the eventual package: this blueprint file still has `sorry`-bodied data definitions
  (`diagRed`, `TameTorus.valuation`, `tameEmbedding`, `degree`, `heckeScalar`, `weilCharacter`,
  `SiegelParahoric.level`, `siegelTransfer`, `leviRight`, `leviLeft` and a few others). PROTOCOL
  §13 allows them here, but a package Suggested.lean must turn them into README targets or give
  them real bodies (PACKAGE_REVIEW.md, 2026-10-12 shape).

## Sources

Read this round:
- ACC+, the published article, §2.2.5 pp. 926–929 and §3.2 pp. 955–957. The cleared copy in the
  maintainer's library has the same SHA-256 as the packet's published source.
- Conrad 2011, Appendix A.
- The current Tau Ceti ClassFieldTheory README and Suggested.lean, read-only at TauCetiRoadmap
  main 0d144d0. They exclude Grunwald–Wang from scope.
- The accepted ArithmeticGaloisDuality and InverseGaloisAndArithmeticFundamentalGroups packets,
  and the ArithmeticGaloisDuality package layer R02.4.

No source was found missing. No passage of any source was copied into the repository.
