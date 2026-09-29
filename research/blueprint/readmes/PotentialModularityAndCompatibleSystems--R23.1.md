# Potential modularity and compatible systems — part R23.1: Moret-Bailly, potential modularity, and global finiteness — blueprint

This part covers stages R23.1–R23.6, R24.1 and R24.2 of PotentialModularityAndCompatibleSystems. After the first
checkpoint:

| Stage | Coverage |
|---|---|
| R23.1 | `source_decomposed`: Moret-Bailly's theorem and Taylor's Theorem G |
| R23.2 | `not_read`: Taylor's moduli problem (deferred) |
| R23.3 | `partial`: KW II Theorem 6.1, KW Annals Theorem 2.1 |
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

**Sources:**
- **Moret-Bailly**, *Groupes de Picard et problèmes de Skolem* I–II (Ann. Sci. ÉNS 1989; Numdam).
- **Taylor**, *Remarks on a conjecture of Fontaine and Mazur* (the 2000 preprint of JIMJ 2002): Theorem G.
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

## Layer R23.3: potential residual modularity (`…/PotentialModularity/Residual`)

- **`kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`** (planet "Potential modularity (KW II
  Theorem 6.1)"). Parts (i) and (ii).
- **`kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`.** The odd-characteristic precursor, which needs
  k(ρ̄) ≠ p.

Taylor's own theorems are deferred to checkpoint 2 (see the gaps): Lemma 1.5, Theorem 1.6 with Corollary 1.7, and the
2006 Proposition 4.1 and Theorem 5.7.

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

**E3 (misprint, reaches nothing): Moret-Bailly II, p. 192.** "LEMME 3.30.2" should be 3.10.2.

## Remaining work

- **R23.2 and the rest of R23.3:** carry the draft's 12 Taylor nodes after page-image verification.
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
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586 (the authors'
  preprint).
- C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Ann. of
  Math. 169 (2009), 229–253.
