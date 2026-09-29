# Potential modularity and compatible systems — part R23.1: Moret-Bailly, potential modularity, and global finiteness — blueprint

This part covers stages R23.1–R23.6, R24.1 and R24.2 of PotentialModularityAndCompatibleSystems. After the second
checkpoint:

| Stage | Coverage |
|---|---|
| R23.1 | `source_decomposed`: Moret-Bailly's theorem and Taylor's Theorem G |
| R23.2 | `partial`: Taylor's auxiliary data, Lemmas 1.1–1.4, the Moret-Bailly point; Taylor 2006 Lemmas 4.4–4.5 |
| R23.3 | `partial`: Taylor's Lemma 1.5 and Theorem 1.6, Taylor 2006 Theorem 5.7, KW II Theorem 6.1, KW Annals Theorem 2.1 |
| R23.4 | `source_decomposed`: potential modularity of a given lift |
| R23.5 | `source_decomposed`: control of the extension |
| R23.6 | `source_decomposed`: exports and noncircularity |
| R24.1 | `source_decomposed`: KW II Theorem 10.1 |
| R24.2 | `source_decomposed`: characteristic-zero points |

The unreviewed draft `research/expansion/external/EXT-12` was used as a lead.
- **Carried:** 15 of its nodes, with every excerpt re-verified against sha-matched copies of the sources and converted to
  the blueprint format.
- **Dropped:** two draft nodes, because other roadmaps already plan them — the global rings of KW II §10.1
  (GlobalGaloisDeformations R04.6) and the local rings with nonemptiness (LocalGaloisDeformationRings R08.6).
- **New:** four nodes.
- **Checkpoint 2:** carries ten more draft nodes for R23.2–R23.3 (Taylor), re-verified on the page images. The
  draft's M-HBAV definition and its two moduli-space constructions are not carried: RS-23 gives the moduli to
  HilbertModularVarietiesAndShimuraCurves H6, which is requested.

**Sources:**
- **Moret-Bailly**, *Groupes de Picard et problèmes de Skolem* I–II (Ann. Sci. ÉNS 1989; Numdam).
- **Taylor**, *Remarks on a conjecture of Fontaine and Mazur* (the 2000 preprint of JIMJ 2002): Theorem G and §1.
- **Taylor**, *On the meromorphic continuation of degree two L-functions* (Documenta 2006): §4, Theorem 5.7 and the
  corrections to the 2002 paper.
- **Khare–Wintenberger II**: §§2, 4, 6, 8, 10.
- **Khare–Wintenberger, Annals 169**: §2.

## Purpose

This part supplies the two inputs that make the Khare–Wintenberger lifts exist:
- potential modularity, i.e. modularity of ρ̄ (and of a given lift) after restriction to a controlled totally real field;
- finiteness of the global deformation ring over ℤ_p.

From these, R24.2 gets characteristic-zero points, which are the lifts that part R24.3 then uses.

## Layer R23.1: Moret-Bailly's theorem (`TauCeti/NumberTheory/PotentialModularity/MoretBailly`)

- **`skolem-datum-and-integral-point`** (definition; planet "Skolem data and integral points").
  - *API:* `SkolemDatum` with `IsComplete`, `IntegralPoint`, `integralPoint_iff` (Remarque 1.5) and `enlargeSigma`.
  - *Tests:*
    - R = ℤ with Σ = {∞} is complete, and the theorem is silent about it;
    - R = ℤ[1/2] with Σ = {∞} is incomplete;
    - X = B is the degenerate case;
    - a single point is not an admissible Ω_v.
- **Reductions:** `density-of-algebraic-and-separable-local-points`, `elementary-reductions-of-skolem-data` and
  `reduction-to-relative-dimension-one` (Bertini).
- **`generalized-picard-functor-and-effective-divisor-fibration`** (construction). PG(X̄, Z) with its exact sequence, and
  the fibration φ_d : X^{(d)} → PG_d in affine spaces for d ≥ 2g + z − 1.
  - *API:* `generalizedPicard`, `_exact`, `divisorClassMap`, `_affineFibration`, `omegaDivisors_open`.
  - *Tests:* 𝔸¹ and G_m in ℙ¹; the failure at d = 1 when g = z = 1; Z = ∅.
- **The curve case:** `local-picard-open-sets-and-strong-approximation` and
  `quasi-compactness-of-the-generalized-jacobian-quotient`.
- **`moret-bailly-theorem-incomplete-skolem-data-have-integral-points`** (planet "Moret-Bailly's theorem"). Théorème 1.3.
- **`theorem-g-from-moret-bailly`** (new). The spreading-out deduction of Taylor's Theorem G, which the draft recorded as a
  gap.
- **`taylor-theorem-g-split-completely-points-are-dense`**, and **`forcing-linear-disjointness-by-extra-split-places`**.

## Layer R23.2: Taylor's auxiliary moduli problem (`…/PotentialModularity/TaylorAuxiliary`)

RS-23 makes HilbertModularVarietiesAndShimuraCurves H6 the owner of the twisted moduli spaces and their local points. It
leaves this layer the verification for Taylor's data. So M-HBAVs, the fine moduli space X/F with λ- and ℘-level
structures, and the twists X_{R,ψ} are requested from H6. The nodes below check Taylor's hypotheses.

- **`taylor-auxiliary-data-p-L-psi-N-M`** (construction). Taylor's standing hypotheses, with det ρ̄ = ε as corrected in
  2006. The data are β_v and χ̃_v, the prime p, α_w, the CM field L with ψ from Lemma 1.1, and the fields N and M.
  - *API:* `TaylorAuxiliaryData` with `exists`, `det_ind`, `psi_ne_conj`, `split`.
  - *Tests:*
    - N₀ = ℚ(ζ₄, √−19) at l = 5, with l unramified in N₀ (checked in Lean);
    - without det ρ̄ = ε there is no a_λ;
    - α_wα_w^c = p;
    - L ⊄ F(ζ_p).
- **`taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`.** Lemma 1.1 by class field theory,
  importing Lemma 2.1 of Taylor's icosahedral paper.
- **`taylor-lemma-1-2-local-hbav-at-places-above-l`.** The local M-HBAV above l:
  - Tate uniformisation when χ_v² = 1;
  - Honda–Tate with Serre–Tate lifting otherwise, including the 2006 corrections.
- **`taylor-lemmas-1-3-1-4-local-points-at-p-and-at-infinity`.** Lemma 1.3 has no printed proof (a gap). Lemma 1.4 uses
  the 2006 corrected real point.
- **`local-points-at-l-p-infinity-and-the-point-over-E`** (application). X(F_x) ≠ ∅ at l, at p and at ∞. Theorem G then
  gives E and A/E with A[λ] ≅ ρ̄ and A[℘] ≅ Ind ψ̄.
- **`taylor-2006-lemmas-4-4-4-5-descent-and-the-cm-point`.** For l > 2 and ρ̄|_{G_l} of niveau 2, Taylor 2006 builds R_ρ̄
  and R_Dih. Lemma 4.4 descends B from a point of X_ρ̄. Lemma 4.5 gives the ℚ-rational CM point of X_Dih.

## Layer R23.3: potential residual modularity (`…/PotentialModularity/Residual`)

- **`kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`** (planet "Potential modularity (KW II
  Theorem 6.1)"). Parts (i) and (ii).
- **`kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`.** The odd-characteristic precursor, which needs
  k(ρ̄) ≠ p.

- **`taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l`.** T_λA is ordinary at unramified x | l when
  χ_v²|_{I_v} = ε^n with 0 ≤ n < l − 1, and n ≠ 1 if ρ̄|_{G_v} is semisimple. Its proof ends with "χ₁|_{I_x} = ω", which
  should read ω^{−1} (E4).
- **`modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`.** (Ind ψ̄)|_{G_E} is absolutely irreducible, and A
  is semistable and ordinary above p. Skinner–Wiles 2001 Theorem 5.1 makes T_℘A modular, hence T_λA, hence ρ̄|_{G_E}.
  - The residual representation is induced from the CM field LE, split above p. That is the case of
    OrdinaryAutomorphicFormsAndModularityLifting/E11, where the printed proof of Skinner–Wiles 2001 has a gap (a gap
    here too).
- **`taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`** (planet "Taylor's potential modularity theorem").
  - Theorem 1.6, with the 2006 proof for a general determinant.
  - Corollary 1.7, which has no printed proof.
  - The soluble branch comes from the strong Artin conjecture (requested from GL2AutomorphicRepresentationsAndTransfer
    R17.5).
- **`taylor-2006-potential-modularity-when-residually-irreducible-at-l`** (planet "Potential modularity with l split
  (Taylor 2006)").
  - Proposition 4.1, Corollary 4.6 and Theorem 5.7.
  - Its use of Skinner–Wiles 2001 is again the E11 case. Taylor names an alternative: Skinner–Wiles' Duke base-change
    paper ([SW1]), his crystalline Theorem 3.3 and descent. Checkpoint 2 misread [SW1] as the 1999 paper.
  - Theorem 5.7 is now its own node (checkpoint 3).

- **Checkpoint 3: Taylor 2006 §5 and the §1 lemmas it uses** (module `…/PotentialModularity/TaylorWeights`):
  - `taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`: Jacquet–Langlands for the definite algebra, and
    ρ_𝔪 over non-Eisenstein Hecke algebras;
  - `taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`: the Fontaine–Laffaille shape at split x | l;
  - `taylor-2006-lemma-5-1-corollary-5-2-weight-reduction`: Buzzard's trick with 𝐕_{ϖ_x}, from U₀(𝔫, l) with η̄^i to weight
    i + 2;
  - `taylor-2006-lemma-5-3-weight-shift`: multiplication by X^lY − XY^l raises the weight by l + 1;
  - `taylor-2006-lemmas-5-4-5-6-weight-and-level`: weight 2, then level, then weight k;
  - `taylor-2006-theorem-5-7-serre-weight-at-level-one` (planet "Potential modularity in Serre's weight (Taylor 2006)").

KW II Theorem 6.1 and KW Annals Theorem 2.1 now cite these nodes.

## Layers R23.4–R23.6

- **`potential-modularity-of-a-given-lift`** (planet). A given lift of type (A), (B) or (C) becomes modular over a totally
  real Galois F from Theorem 6.1 and Theorem 8.2, by Theorem 9.7. It is a theorem about a supplied lift.
- **`control-of-the-extension`.** Theorem 6.1 (iii)(a)–(d) with their mechanisms (Grunwald–Wang, extra split primes), and
  solvable intermediate fields.
- **`application-table-and-noncircularity`.** The residual export feeds R24.1 and the given-lift export feeds R24.5.
  No step uses a lift before it has been constructed.

## Layers R24.1–R24.2: finiteness and points (`…/CompatibleSystems/GlobalFiniteness`)

- **`auxiliary-totally-real-field-for-the-finiteness-argument`** (construction). The field F with conditions (1)–(4)
  and the representations π′.
  - *API:* `AuxiliaryField`, `piA`, `piBC`, `tau_unramified`, `exists`.
  - *Tests:*
    - the dyadic weight-4 case;
    - ρ̄ unramified at p;
    - a CM field is a non-example;
    - killing tame inertia of order 3 at 7.
- **`kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`** (planet "Finiteness of global deformation rings").
  - The rings are GlobalGaloisDeformations R04.6's.
  - Only the unframed ring is finite: the framed ring has 4|S| − 1 extra variables.
- **`characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`** (planet "Characteristic-zero points of
  deformation rings"). Finite, and of dimension ≥ 1 (Proposition 4.5), so it has points (Corollary 4.7). The points are
  the lifts of required type.

## Mistakes found in the sources

**E2 (misprint, reaches nothing): KW II, proof of Theorem 10.1, p. 91.** "choosing F as in part (c) of Theorem 6.1" should
cite part (iii) b), the clause on prescribed local extensions. (E1 of this roadmap is in part R24.3.)

**E4 (misprint, reaches nothing): Taylor 2002, proof of Lemma 1.5, printed p. 15.** "Hence χ₁|_{I_x} = ω" should read
ω^{−1}: the action by ω^{−1} on A[℘] forces n = 1, the excluded case, whereas χ₁|_{I_x} = ω would mean n = l − 2.

**E5 (misprint, reaches nothing): Taylor 2002, proof of Lemma 1.1, p. 8.** "coincides with ψ_x on L_y^× for y ∈ S_L"
should read ψ_y.

**E6 (misprint, reaches nothing): Taylor 2002, pp. 7 and 11.** "congruent modulo λ" should be λ₀, since λ is chosen
only on p. 10. In the proof of Lemma 1.2, "End(A/k(v))" and "ℚ(α)" should be End(A₀/k(v)) and ℚ(β_v).

None of E4–E6 is among the corrections Taylor lists in Documenta 2006, pp. 776–777.

**E3 (misprint, reaches nothing): Moret-Bailly II, p. 192.** "LEMME 3.30.2" should be 3.10.2.

## Remaining work

- **R23.2:** the moduli spaces are requested from HilbertModularVarietiesAndShimuraCurves H6; Lemma 1.3 has no
  printed proof.
- **R23.3:** Corollary 1.7 has no printed proof. Khare's Lemma 2.2, Conrad–Diamond–Taylor 3.1.1 and 4.2.4, and
  Skinner–Wiles' Duke paper (Taylor 2006 Corollary 5.5) are unread. Taylor's use of Skinner–Wiles 2001 is the E11 case of
  OrdinaryAutomorphicFormsAndModularityLifting.
- **Gaps:**
  - Moret-Bailly's imported foundations (requested from AlgebraicModuliForArithmeticGeometry R09.3);
  - Taylor 2006 Lemmas 1.3, 5.3, 5.6 and Khare's Lemma 2.2;
  - KW II Theorem 8.2 and the weight results inside Theorem 6.1;
  - Khare's "Lemma 4.2";
  - KW II Propositions 9.2–9.3 and Theorem 8.2 over F.

## Sources

- L. Moret-Bailly, *Groupes de Picard et problèmes de Skolem I, II*, Ann. Sci. École Norm. Sup. (4) 22 (1989), 161–179,
  181–194.
- R. Taylor, *Remarks on a conjecture of Fontaine and Mazur*, J. Inst. Math. Jussieu 1 (2002), 125–143 (the author's 2000
  preprint).
- R. Taylor, *On the meromorphic continuation of degree two L-functions*, Documenta Math. Extra Volume Coates (2006),
  729–779.
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586 (the authors'
  preprint).
- C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Ann. of
  Math. 169 (2009), 229–253.
