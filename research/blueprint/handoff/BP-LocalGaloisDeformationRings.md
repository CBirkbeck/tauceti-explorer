# BP-LocalGaloisDeformationRings: R08.1–R08.4, part of R08.6 and part of L7 (checkpoint 5)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #770. **Status: partial.**
- R08.1, R08.2, R08.3 and R08.4 are `source_decomposed`.
- R08.6 and L7 are `partial`.
- L8 and R08.5 are `not_read`.

## Checkpoint 5: R08.4 (12 nodes, 6 planets)

The source is Kisin's Annals paper §2, read from the author's DVI through a text extraction, and Savitt (arXiv v3).

**Moduli and generic fibre:**
- `flat-deformation-condition`, from Ramakrishna and Raynaud.
- `finite-flat-model-moduli`: L7's height-lattice moduli with h = 1, the map Θ, and the closed fibre as finite flat
  models.
- `small-ramification-flat`: e < p − 1, Raynaud.
- `flat-generic-fibre`: crystalline with weights {0, 1}, formally smooth, dimension d² + Σ(d − v_ψ)v_ψ.

**Resolution and components:**
- `hodge-type-resolution`: Θ^v, an isomorphism after inverting p.
- `resolution-local-structure`: normal and Cohen–Macaulay with a reduced closed fibre. The input is Pappas–Rapoport
  local models, which no roadmap plans, so it is **recorded as a gap**.
- `components-via-special-fibre`: Kisin (2.4.10). It uses the image, as RS-08 demands.
- `ordinary-type-of-components`: (2.4.14)–(2.4.16).

**Rank two:**
- `rank-two-nonordinary-connected`: (2.5.6), K₀ = ℚ_p.
- `rank-two-ordinary-locus`: (2.5.15).
- `rank-two-bt-components`: (2.5.16). This is which components a modular point meets, i.e. Kisin's matching conditions.

**Weight two:** `savitt-weight-two-rings` (Savitt 6.22–6.24). R08.6/export-weight-two-irreducible now cites it instead of
the stage.

**Source issue E1 (error, corrected by the author):** Savitt's published Theorem 6.12(4). It is `known` via arXiv v3,
Remark 1.7, and the author's corrigendum. `sourceVersions` records the arXiv v3 file.

**New requests:** FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (Raynaud) and R07.4 (Kisin modules ↔ finite flat
and p-divisible groups, Breuil's full faithfulness, and strongly divisible modules with descent data).

**Not covered:**
- The 2-adic analogues are stage R08.5.
- Potentially Barsotti–Tate lifts of a nontrivial type reach this layer through a global base change (GL2ModularityLifting
  R22.5), so no local component theorem for types is claimed.

**Lean:** three new proved checks (the 4 + [K : ℚ_p] count, e = 1 < p − 1, and the unit rescaling in X₁X₂ − pw), and new
signatures. It compiles with 0 errors and 4 `sorry` warnings (unchanged).

This works within RS-08, whose review accepted it.

## What is planned

There are 7 nodes (5 theorems, 2 lemmas) and 3 planets:
- `local-lifting-ring`;
- `local-tangent-obstruction`, the dimension bound from local duality and the Euler characteristic;
- `local-fixed-determinant`;
- `local-forget-framing`;
- `archimedean-rings-p-odd`;
- `archimedean-odd-ring-p2`, the explicit ring 𝒪[[a, b, c]]/(a² + bc − 1), matching KW II Proposition 3.3 as quoted by Tung;
- `local-residue-field-change`.

The generic functors and theorems are reused from the GlobalGaloisDeformations packet (#3804, merged), per RS-08.

**Requests:**
- Tau Ceti ClassFieldTheory Layer 5: local Tate duality and the local Euler characteristic.
- DeformationAndDerivedPatchingAlgebra R03.2: relations versus obstructions.
- DeformationAndDerivedPatchingAlgebra R03.1: completed tensor products.

## Checkpoint 2: R08.2 (9 nodes, 5 planets)

- `tame-splitting`.
- `unramified-lifting-ring`.
- `minimally-ramified-condition` and `minimally-ramified-ring` (CHT08 §2.4.4).
- `unrestricted-away-from-p` (CHT08 Lemma 2.4.9; Gee Theorem 3.31; BLGGT via Tung).
- `inertial-type-quotient`.
- `taylor-wiles-local-ring` (Gee Lemma 3.33).
- `steinberg-condition` (Taylor II §3, with the monodromy relation).
- `ihara-avoidance-components` (Taylor II Proposition 3.1; Gee 3.36–3.38).

New sources: CHT08 and Taylor II, both open access on Numdam. The deformation-problem nodes are reused from GlobalGaloisDeformations R04.3 (#3806, merged).

## Checkpoint 4: R08.6 exports from KW II §3 (11 nodes, 4 planets)

- `smooth-resolution-criterion` (KW II Proposition 2.12).
- `kw-local-conditions`, with the choices.
- Per-case exports:
  - archimedean;
  - irreducible Fontaine–Laffaille (L7);
  - irreducible weight two (Savitt, R08.4);
  - ordinary (Proposition 3.6, proved here);
  - semistable weight two at p (R08.5);
  - endpoint weight p + 1 (R08.5);
  - away from p (R08.2 Steinberg, and GlobalGaloisDeformations R04.4 inertia-rigid).
- `export-completed-tensor-product` (Proposition 3.2).
- `local-nonemptiness`, which closes R08.3's remaining item, so R08.3 is now `source_decomposed`.

These exports are what GlobalGaloisDeformations R04.6 (#3815) and GL2ModularityLifting R22.1 (#3816) request.

**Remaining in R08.6:**
- KW I Theorem 5.1's lift types.
- The good-dihedral type.
- The dyadic weight-two transition.
- The modern de Rham applications.

The proofs cited to L7, R08.4 and R08.5 are to be planned in those layers: Fontaine–Laffaille, Savitt's weight-two
computation, and the dyadic/endpoint cases.

**Lean:** two new proved checks, for the archimedean substitution and the 3|S| count; still 4 `sorry` warnings.

## Checkpoint 3: R08.3 (7 nodes) and L7's height lattices (2 nodes)

The source is Kisin, *Potentially semi-stable deformation rings*, JAMS 21 (2008). The AMS PDF is free, and printed
page = PDF page + 512.

**L7** (RS-08 makes L7 own the rank-general bounded-height lattices):
- `finite-height-lattices`. Uniqueness is Kisin 2006, 2.1.12, with the gap repaired in Kisin 2008 Errata (E.4).
- `height-lattice-moduli` (Kisin 1.3, 1.5.1, 1.6.4, 1.7). It includes the K = ℚ₂ example showing that Θ is not a
  closed immersion integrally.

**R08.3:**
- `hodge-and-galois-types`;
- `semistable-height-quotient` (Theorem 2.5.5);
- `hodge-type-components` (Corollary 2.6.2);
- `pst-deformation-ring` (Theorem 2.7.6 and Corollary 2.7.7). The integral ring is the reduced, p-torsion-free
  closure, as in Gee 3.28, and the ω example shows it can be empty.
- `filtered-phi-N-deformations` (Kisin 3.1.2–3.3.1);
- `pst-generic-fibre` (Theorem 3.3.4). Only a dense open is smooth, as Kisin's footnote on Breuil–Mézard (ii) shows.
- `pcris-generic-smooth` (Theorem 3.3.8, Gee 3.28);
- `pst-coefficient-change`.

**Reused (other packets' nodes):**
- PadicHodgeTheory R06.1–R06.3: B_st, D_st, filtered (φ, N, Gal)-modules, weak admissibility, Colmez–Fontaine,
  D_pst, WD(V), the HT(χ_p) = +1 convention and coefficient change.
- AdicSpacesPartII F0/grothendieck-algebraization.

**New requests:**
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (Breuil–Kisin modules).
- AlgebraicModuliForArithmeticGeometry R09.1 (Grassmannians).
- DeformationAndDerivedPatchingAlgebra R03.3 (dim R = dim R[1/p] + 1).

**Still open:**
- R08.3: nonemptiness for R24's local types (KW II §3.2's lifts at places above p). This should be planned with R08.6.
- L7: ordinary full-flag moduli, Fontaine–Laffaille conditions and ordinary functors.
- Kisin §4 (Hilbert modular forms) is automorphic and not planned here.

## Suggested Lean file

`suggested/LocalGaloisDeformationRings.lean` imports Mathlib only. It compiles against the pinned Mathlib 082e2d3 oleans with 0 errors and 4 `sorry` warnings. Its two matrix examples are proved by `simp`.

Checkpoint 3 adds two proved items:
- `flagDim`, the (d² − Σ m²)/2 of Kisin's dimension formula, with four `decide` checks;
- `X_not_dvd_pow`, which says u ∤ E(u)^h.

The ring-level signatures for L7 and R08.3 are in the comment block.

The ring-level signatures, which use the GlobalGaloisDeformations functors, are in a comment block.

## Checks

- `check_blueprint.py` with the pinned index, and with the merged GlobalGaloisDeformations packet present: 0 errors, 0 warnings.
- `intake.py check-files`: see the PR.

## What a continuation should do

0. **Done in checkpoint 5:** R08.4 and Savitt's weight-two computation.
1. **R08.5:** Kisin's 2-adic paper §§1–2 (DVI serre2.dvi on his page: connected finite flat group schemes at p = 2,
   flat connected deformation rings, rank two, ordinary deformations), and KW II's endpoint and dyadic calculations.
2. **R08.3 nonemptiness and R08.6:** KW II §3.2 (the authors' final version is free on Khare's UCLA page; see the
   GlobalGaloisDeformations packet) constructs the lifts at places above p.
3. **R08.5, the rest of L7, and L8.** For general n away from p, Shotton's explicit GL₂ equations and BLGGT (arXiv:1010.2561) §1.3 are the next free sources.

## Sources read

- Gee, arXiv:2202.05818v2, §3.1–3.19.
- Kisin, Lecture 1.
- Tung, arXiv:1908.06174v3, §3.2.5.
- Kisin, JAMS 21 (2008): Introduction, §1, §2.5–2.7, §3 and the Errata for [Ki 2].
- Gee, §3.27–3.28.
- Kisin, *Moduli of finite flat group schemes, and modularity* (author's DVI): §2.1–2.5.
- Savitt, arXiv:math/0404327v3: §1 and §6.6.
