# Classical Serre modularity — part R26.1: the level-one theorem and the good-dihedral set-up — blueprint

This part covers stages R26.1–R26.6 and R27.1–R27.2 of ClassicalSerreModularity. After the first checkpoint:

| Stage | Coverage |
|---|---|
| R26.1 | `source_decomposed`: statements and contracts |
| R26.2 | `source_decomposed`: prescribed lifts in conductor one |
| R26.3 | `source_decomposed`: weights, primes and the induction measure |
| R26.4 | `source_decomposed`: degenerate branches |
| R26.5 | `partial`: the small-weight table |
| R26.6 | `source_decomposed`: the proof and its corollaries |
| R27.1 | `partial`: good dihedral primes |
| R27.2 | `partial`: (L_r), (W_r), (D_r) and Theorem 3.2 |

The accepted restructuring RS-06 narrows each stage:
- **R26.1** states the level-one target and Corollary 1.2 with every source hypothesis; their proofs are R26.6.
- **R26.2** keeps the proof-specific choice and verification of lifts. The global lifting and compatible-system theory is
  PotentialModularityAndCompatibleSystems R24.3–R24.6.
- **R26.3** owns Khare's own prime estimates and a proved well-founded recursion. The KW I §7 estimates move to R27.2 as
  that proof's lemma.
- **R26.4 and R26.5** apply the owners' results: Wintenberger's lemma and the base cases from
  SmallRamificationAndAbelianVarietyBaseCases, and ordinary lifting from OrdinaryAutomorphicFormsAndModularityLifting.

**Sources:**
- **Khare**, *On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Q̄/Q) unramified outside p*,
  arXiv:math/0504080v1, published as *Serre's modularity conjecture: the level one case*, Duke Math. J. 134 (2006). Read
  §§1–7.
- **Khare–Wintenberger**, *Serre's modularity conjecture (I)*, the authors' preprint. The sha256 matches the reviewed
  decomposition.
- **Böckle**, the appendix to Khare's Inventiones 154 (2003) paper.

Ten nodes are carried from the reviewed decomposition with their excerpts re-verified against these copies.

## Purpose

This part proves Serre's conjecture in level one: every odd irreducible ρ̄ : G_ℚ → GL₂(F̄_p) unramified outside p arises
from S_{k(ρ̄)}(SL₂(ℤ)). It is the base case of the Khare–Wintenberger induction. R27.1–R27.2 set up the good-dihedral
hypotheses (L_r), (W_r), (D_r) and the reduction to weight two that the rest of the R27 strand uses.

## Layer R26.1: statements (`TauCeti/NumberTheory/SerreConjecture/LevelOne`)

- **`level-one-theorem-and-the-meaning-of-arises-from`** (planet "Khare's level-one theorem"). This is Theorem 1.1:
  arising from a newform means an integral model of ρ_f reducing to ρ̄. Conductor one does not assert that the lift is
  unramified at p.
- **`corollary-1-2-conductor-a-prime-and-its-corrected-proof`.** This is Corollary 1.2, with KW I's removal of p > 2 and
  their corrected reference.
- **`bockle-appendix-minimal-deformation-ring-presentation`.** Böckle's Proposition 1 presentation and Theorem 1. Oddness
  enters the proof.

## Layer R26.2: prescribed lifts (`…/LevelOneLifts`)

- **`lifting-method-flatness`.** R is flat when the local rings have the right relative dimensions (via Böckle) and R/(π)
  is finite (via potential modularity and R_F ≅ T_F).
- **`minimal-weight-two-lift`.** Proposition 2.1: a minimal weight-2 lift of an ordinary ρ̄ (p > 3), with nebentypus
  ω^{k−2} at p.
- **`local-ring-at-q-smooth`.** The ring R_q with nebentypus χη_q^i is smooth of relative dimension 1. The proof is
  Böckle's Hensel computation: β² − βγ(χ′(τ) − 1) − ψ = 0.
- **`nebentype-lift-at-q`** (planet). Proposition 2.2: lifts crystalline of weight k(ρ̄) at p with nebentypus χη_q^i at q.
  The nebentypus is confined to the coset χ⟨η_q⟩.
- **`compatible-system-lifts`** (planet). Proposition 3.1: compatible systems whose members above q are Barsotti–Tate
  over ℚ_q(μ_q) with residual weight j + 2 or q + 1 − j.

## Layer R26.3: weights and the induction (`…/LevelOne`)

- **`chebyshev-next-prime`.** Khare §4: for p_n ≥ 31 there is a non-Fermat P > p_n and ℓ^r = 2m + 1 ∥ P − 1 with
  P/p_n ≤ (2m + 1)/(m + 1) − m/((m + 1)p_n) (1). Up to 21591 this is a finite check.
- **`serre-weight-twist`.** Lemma 5.2.
- **`weight-interval-containment`.** Both j + 2 and P + 1 − j lie in [2, p_n + 1] for j in (m(P − 1)/(2m + 1),
  (m + 1)(P − 1)/(2m + 1)]. Both bounds reduce to (m + 1)P ≤ (2m + 1)p_n − m, checked in Lean. The interval meets every
  coset modulo (P − 1)/ℓ^r exactly once.
- **`level-one-induction-scheme`** (planet). The measure is the weight bound B. S(32) is the base, S(p_n + 1) ⇒
  S(P + 1) is the step, and every call is to weight ≤ p_n + 1, to weight 2 (excluded), or to solvable image. Changing the
  prime is not the decreasing measure.

## Layer R26.4: degenerate branches

- **`local-reducibility-ordinary`.** Lemma 5.3 (Breuil–Mézard, Savitt), from LocalGaloisDeformationRings R08.4.
- **`level-one-lifting-lemma`.** Lemma 5.4 and Corollary 5.5, the change of prime. Weight p + 1 non-ordinary is
  excluded by Berger–Li–Zhu.
- **`degenerate-branches`.** Solvable image, unramified at P (weight 2 level 1, hence reducible) and locally reducible
  (ordinary up to twist) are all handled, with Skinner–Wiles (OrdinaryAutomorphicFormsAndModularityLifting R21.5) and
  Kisin. A reducible residual representation after a change of prime is a branch, not an impossible case.

## Layer R26.5: the small-weight table

**`small-weights-table`.** Each row gives (P, foil ℓ, nebentypus j) and the new weights j + 2 and P + 1 − j. All rows
are checked in Lean.

| Weights | P | ℓ | j | New weights |
|---|---|---|---|---|
| 8 | 7 | 3 | 2 | 4, 6 |
| 10, 12 | 11 | 5 | 4 | 6, 8 |
| 14–20 | 19 | 3 | 8 | 10, 12 |
| 22, 26, 30 | 29 | 7 | 16 | 18, 14 |
| 24, 28 | 29 | 7 | 14 | 16 |
| 32 | 31 | 5 | **18** (printed 16: E2) | 20, 14 |

Weights 2, 4 and 6 and the primes p = 2 and 3 come from SmallRamificationAndAbelianVarietyBaseCases (R25.2, R25.5,
R25.6).

## Layer R26.6: the proof

- **`level-one-proof-assembly`** (planet). The two compatible systems are linked at ℓ, then weight and level
  optimisation (SerreWeightAndLevelOptimisation R20.6) finish.
- **`corollary-1-2-proof`.** Killing ramification, with KW I's correction.
- **`finiteness-corollary-1-3`.**
- **`corollary-8-1-ii-and-the-statement-W1`** (carried). The start of the KW induction: (W₁) concerns locally
  good-dihedral representations. It is not a restatement of conductor one.

## Layers R27.1–R27.2 (carried, `…/GoodDihedral`)

- **`good-dihedral-prime-definition`** (planet). Definition 2.1.
  - *API:* `IsGoodDihedralPrime`, `IsLocallyGoodDihedral`, `largestPrimeFactor`, `IsGoodDihedralPrime.inertia`.
  - *Tests:*
    - values of Q;
    - q = 13 violates (ii);
    - t | q + 1 with t odd forces level 2.
- **`good-dihedral-implies-nonsolvable-image-and-is-preserved`.** Lemma 6.3.
- **`dickson-and-the-dyadic-solvable-refinement`.** Dickson's classification, Lemmas 6.1 and 6.2.
- **`hypotheses-Lr-Wr-and-Dr`.** The hypotheses (L_r), (W_r) and (D_r).
  - *API:* `HypL`, `HypW`, `HypD`, `hypL_imp_hypW`.
- **`prime-gap-estimates-driving-the-weight-recursion`.** KW I §7, moved here from R26.3 as RS-06 directs.
- **`theorem-3-2-weight-reduction`** (planet "Reduction to weight two").

## Mistakes found in the sources

**E1 (misprint, reaches nothing): Khare §6.1, weights 22–30, p. 25.** The mod-7 lift is said to be "unramified outside
3, 19". It should be 7, 29; the text was copied from the previous row.

**E2 (error, reaches nothing): Khare §6.1, weight 32, pp. 25–26.** The row prints nebentypus ω_31^{16}. The mod-5
member is unipotent at 31 (the weight-2 lift of a weight p + 1 representation is semistable), so the available nebentypes
are ω_31^{6i}. j = 18 works, giving weights 20 or 14; both are known.

Both issues are in arXiv v1; the Duke version was not obtained.

## Remaining work

- **R26.5:** a per-row split of the solvable and unramified sub-branches.
- **R27.1:** existence of good dihedral primes, the prime-insertion application.
- **R27.2:** KW I Theorems 4.1 and 5.1 are proved in KW II, which is unread (a carried gap), and so are Savitt's
  residual weights.
- **Carried gaps:**
  - the edition discrepancy of the level-one source;
  - KW I's references to the published numbering of Khare's paper;
  - KW I Lemma 6.2(ii).

## Sources

- C. Khare, arXiv:math/0504080v1 (Duke Math. J. 134 (2006), 557–589).
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504 (the authors'
  preprint).
- G. Böckle, *Appendix 1: On the isomorphism R_∅ → T_∅*, to C. Khare, Invent. Math. 154 (2003).
- C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Ann. of
  Math. 169 (2009), 229–253.
