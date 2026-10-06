# Fixes to RT-BP-ClassicalSerreModularity--R27.3

Job FIX-RT-BP-ClassicalSerreModularity--R27.3, issue #5715.
Author: Claude — claude-eZ1A2V. Date: 2026-10-06.
Base tree: origin/main at 238b3d26.

This session did not write, review, red-team or verify any earlier version of this packet. The independent
review REV-FIX-RT-BP-ClassicalSerreModularity--R27.3 checks these fixes.

The job lists the two medium findings. The low finding /3, also confirmed, is fixed too, since it concerns a
deliverable of this job (the suggested file). No theorem statement of the sources changes, and no source
erratum is asserted. The packet still has 33 nodes. It now has 17 open requests (one new, to
ArithmeticGaloisRepresentations R01.3) and five gaps (unchanged). Every implementation status remains `unchecked`.

## Sources read

Fresh downloads matched the hashes recorded in the packet:

| Source | Passages read | SHA-256 |
|---|---|---|
| [Dieulefait–Pacetti, arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | §1.3 and Theorem 1.9 (pp. 5–6), Paso 2 (p. 11), Lemma 2.3 and its proof, Remark 6, Paso 4 (pp. 12–13; p. 13 checked on the page image) | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| [Khare–Wintenberger I, author's preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | §5 with Theorem 5.1 and its Remarks (pp. 7–10), §8.4 (pp. 17–18), proof of Theorem 9.1 (pp. 18–19) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |

These readings are recorded in the packet's `sources[].readSections` and `sourceVersions`. The Inventiones printing
of KW I was not collated.

## Finding /1 (medium): the order-three type needs an adapted stable lattice

**Confirmed and fixed.** The two lattices are as the red team gives them. Over ℤ[ζ] with π = ζ − 1, put
D₀ = diag(ζ, ζ²), F₀ = (0 1; 1 0), P = (1 0; 1 π), D₁ = (ζ 0; ζ ζ²) and F₁ = (1 π; 0 −1). Then D₀P = PD₁ and
F₀P = PF₁. Both pairs satisfy D³ = F² = 1 and FDF⁻¹ = D². Modulo π, D₀ ≡ 1, while D₁ ≡ (1 0; 1 1). I re-checked
these identities exactly in Lean (see the suggested file).

`R33.2/dihedral-local-type-at-n`:
- The statement now names the standard lattice L_std = Ind 𝒪(κ), with basis e₁ = 1 ⊗ 1 and e₂ = s ⊗ 1. It says
  that the split reduction 1 ⊕ η is a statement about L_std only.
- Every stable lattice has semisimplification 1 ⊕ η (Brauer–Nesbitt), but another stable lattice can reduce to a
  non-split module.
- A new proof step explains why s acts by the swap for *every* Frobenius lift: the transfer sends s to
  s² = Art(Nu) with u ∈ ℤ_N^×, κ is trivial on ℤ_N^× because q ∤ N − 1, so κ(s²) = κ(Art(N)) = 1.
- A new hypothesis records that Paso 2 (`R33.2/dp-lift-existence-and-good-dihedral-insertion`) needs only L_std:
  ρ̄ is unramified at N, so L_std realises ρ̄|_{I_N}.
- API: `dihedralType_residual` is replaced by `dihedralType_standardLattice_residual`, explicitly about L_std. Two
  items are added: `dihedralType.standardLattice` (data) and `dihedralType_residual_semisimplification`
  (compatibility). The statement of `dihedralType` names its basis.
- Tests: `residual_trace_zero` now says "on the standard lattice". A new non-example,
  `residual_depends_on_lattice`, records the L₁ reduction at (q, N) = (3, 2).

`R33.3/dp-dyadic-transition-and-the-order-three-type`:
- **Statement.** It now describes the residual cases at 2. Either c = 0, so that ρ̄₃ is unramified at 2 and
  ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1); or ρ̄₃|_{I₂} is a nontrivial unipotent module. It asserts that a G_{ℚ₂}-stable lattice
  Λ in ρ̃₂ exists with γ ⊗ (Λ/πΛ) ≅ ρ̄₃|_{D₂}: L₀ in the split case, L₁ in the non-split case. L₀ fails in the
  non-split case. Hence ρ̃₂|_{I₂} is compatible with ρ̄₃ in DP's sense (p. 6).
- **Theorem.** The final type-change statement is unchanged.
- **Proof steps.** These are rewritten.
  1. The residual case analysis. In the ramified case the tame relation Frob σ Frob⁻¹ = σ² forces Frobenius
     eigenvalues −β (on the inertia invariants) and β. Conjugating by an upper unipotent matrix and by
     diag(b⁻¹, 1) then puts the module in the form of the reduction of L₁.
  2. The standard lattice L₀ and its split reduction.
  3. The adapted lattice L₁, its change of basis, and its non-split reduction.
  4. Compatibility and trace zero.
  5. The lift.
- **Hypotheses.** The KW I Theorem 5.1(4) route is checked at (p, q) = (3, 2):
  - ρ̄₃ is of S-type with k(ρ̄₃) = 2;
  - ρ̄₃|_{ℚ(µ₃)} is absolutely irreducible, because the image is non-solvable;
  - ρ̄₃|_{D₂} is (χ̄₃ ∗; 0 1) up to unramified twist;
  - 3 | 2 + 1, and χ′|_{I₂} = ω_{2,2} (i = 1, j = 0) has level 2 and order 3;
  - there is no parity condition.

  Its conclusion at p is crystalline of weight 2. Its local input at 2 is the level-two inertia-rigid condition
  of `LocalGaloisDeformationRings:R08.6/export-away-from-p` (b). The matrices of L₀ and L₁ are explicit lifts of
  that condition. Another hypothesis records that the twist is unramified where the lemma is used, because Paso 4
  step (1) produces the Steinberg type by Theorem 1.9(2), and KW I say "up to unramified twist". A further
  hypothesis records that DP's sentence "have the same reduction" holds for this choice of lattice, and that no
  erratum is asserted.
- **Prerequisites added:**
  - `PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q`;
  - `PotentialModularityAndCompatibleSystems:R24.3/modern-prescribed-type-lifts`;
  - `LocalGaloisDeformationRings:R08.6/export-away-from-p`;
  - `ArithmeticGaloisRepresentations:R01.2`, for the tame relation and the order-3 quotient of I₂.

  This node is added to the R01.2 request's `neededBy`, and that request's `need` now names these two facts.
- **API.** `orderThreeType_reduction` is replaced by `orderThreeType_exists_lattice_reduction_iso`. Also added:
  `orderThreeType.standardLattice` and `orderThreeType.adaptedLattice` (data),
  `orderThreeType_standardLattice_reduction` and `orderThreeType_adaptedLattice_reduction`, and
  `orderThreeType_isCompatible`, the hypothesis of Theorem 1.9(4) at ℓ = 2. `orderThreeCharacter` now records its
  normalisation χ′(Art(2)) = 1.
- **Tests added:**
  - `standard_lattice_relations`, `adapted_lattice_change_of_basis` and `adapted_lattice_nonsplit`: the exact
    identities and their reductions;
  - `standard_lattice_nonexample`: L₀ is a non-example for nontrivial residual inertia, as the finding asks;
  - `split_case_standard_lattice`: L₀ serves when ρ̄₃ is unramified at 2.
- **Acceptance, sources and uses.** Two acceptance checks are added. Three source excerpts are added: DP's
  compatibility definition on p. 6, DP's comparison sentence on p. 13, and KW I Theorem 5.1(4)'s residual
  hypothesis on p. 10. Each was checked as a literal substring of the text. A `uses` entry for Theorem 1.9(4) is
  added.

`R27.5/d1-by-the-prime-three` is unchanged. It uses KW I Theorem 5.1(4) directly, and that theorem needs no lattice.

## Finding /2 (medium): raising levels needs a conductor bound, not equality

**Confirmed and fixed** in `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`. Theorem 3.4's statement
is unchanged.

- **hypotheses[1].** The equality with the 2-part of N(ρ̄) is replaced by a chain of bounds. Let A be the
  exponent of the first system's Weil–Deligne parameter at 2.
  - For odd p, A = v₂(N(ρ̄)) ≤ r, by minimality at 2.
  - For p = 2 and k(ρ̄) = 2, A = 0, since the parameter is crystalline.
  - For p = 2 and k(ρ̄) = 4, A = 0 + dim V^{I₂} − dim ker N = 1, while v₂(N(ρ̄)) = 0. Here the theorem excludes
    r = 0.

  Then v₂(N(ρ̄_{p′})) ≤ A, because reduction at p′ ≠ 2 cannot increase the conductor. The second system's exponent
  equals v₂(N(ρ̄_{p′})), because the Theorem 5.1(4) lift is minimal at every prime other than p′ and q, and
  q ≡ 1 mod 8 is odd. Finally v₂(N(ρ̄′_s)) is at most that exponent. The hypothesis says that minimality refers
  to the intermediate ρ̄_{p′}, and that every reduction may lower the conductor.
- **hypotheses[0]** is sharpened. With k(ρ̄) = 4 the argument only bounds v₂(N(ρ̄′_s)) by 1, which (D₀) cannot
  use.
- **proofSteps[3]** states the chain and names its inputs: `R24.6/residual-members` (iii) for the reductions,
  minimality of the Theorem 5.1(4) lift, `R24.3/theorem-5-1-part-2-weight-two` for the parameters, and R01.3 for
  the conductor with its monodromy term.
- **acceptance[0]** is now the boundary case p = 2, k(ρ̄) = 4, r = 1: original exponent 0, first-system exponent 1,
  final bound ≤ 1. A new acceptance check allows conductor drop, with the example of ρ̄_{E,5} for the curve 11a1:
  it is unramified at 11 although Δ = −11⁵.
- **Prerequisites added:** `PotentialModularityAndCompatibleSystems:R24.6/residual-members`,
  `PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two` and
  `ArithmeticGaloisRepresentations:R01.3`.
- **New request** to `ArithmeticGaloisRepresentations:R01.3`: the conductor of a Weil–Deligne representation with
  its monodromy term, a(r, N) = a(r) + dim V^{I} − dim (ker N)^{I}, giving exponent 1 for the Steinberg parameter.
  R01.3's stage text asks for exactly this. No node of that roadmap exists yet.

## Finding /3 (low): analytic modular forms are present at the pins

**Confirmed and fixed** in the suggested file. I read the declarations at the pins:
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/NumberTheory/ModularForms/Basic.lean`: the
  structures `ModularForm` and `CuspForm` (`extends SlashInvariantForm Γ k`, holomorphic, bounded or zero at the
  cusps);
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`:
  `HeckeRing.GL2.Newform N k` (extends `EigenformAwayFromLevel`, with `isNew` and `isNorm : a₁ = 1`).

The standard note now names these carriers as reused inputs. It says that what the pins lack is the arithmetic
interface: attached Galois representations, k(ρ̄) and N(ρ̄), compatible systems, local types and the modularity
comparison. The sketch of `serre_strong` now uses `HeckeRing.GL2.Newform`. A checked example uses Mathlib's
`CuspForm`. Tau Ceti is named but not imported, because the shared build is not at the Tau Ceti pin.

## Suggested file and checks

- The suggested file has comment signatures for every API item of the two changed nodes. Their unit tests are named
  in the docstrings of the checked examples, or listed as statements where they concern Galois representations.
- The new checked examples are:
  - the exact lattice certificate over ℤ[ζ], written with explicit products, and its reductions as Mathlib
    matrices over ZMod 3;
  - the rank-one nilpotent monodromy;
  - the conductor chain;
  - the boundary case;
  - the `CuspForm` carrier.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R27.3.lean` (`lake env lean` in the shared
  build, Mathlib `082e2d3`): no errors and no warnings. The file contains no `sorry`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R27.3.json`, with the
  workers' declaration index: 0 errors, 0 warnings. The packet cites no baseline declarations.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- The reader document has new bullets for R27.4, R33.2 and R33.3, a new section "Stable lattices at 2 and the
  dyadic conductor bound", and a header line for this fix.

## Not changed, and for the maintainer

- The packet's `review` object still holds the earlier needs_changes verdict from REV-FIX-RT-AREA-langlands-2~2.
  This fix does not touch it; REV-FIX-RT-BP-ClassicalSerreModularity--R27.3 writes its own verdict.
- FIX-RT-AREA-langlands-2~3 (#5870) lists the same three files among its deliverables. These edits are confined to
  the three nodes above, two requests, the source records, one sentence appended to the summary, and new
  paragraphs in the reader document. A concurrent round there should merge without overlapping hunks except
  possibly the reader document's header.
