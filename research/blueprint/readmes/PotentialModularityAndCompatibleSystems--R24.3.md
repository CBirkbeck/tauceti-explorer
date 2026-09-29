# Potential modularity and compatible systems — part R24.3: prescribed lifts, the lifting interface and compatible systems — blueprint

This part covers stages R24.3–R24.6 of PotentialModularityAndCompatibleSystems, including the operations sub-layer
R24.5:operations. After the first checkpoint:

| Stage | Coverage |
|---|---|
| R24.3 | `source_decomposed`: Böckle, KW Annals, the lifts of KW I Theorem 5.1, Snowden |
| R24.4 | `source_decomposed`: KW I Theorem 4.1 |
| R24.5 | `source_decomposed`: the Brauer system, almost strict compatibility, KW I Theorem 5.1 |
| R24.5:operations | `partial`: definitions and rank-2 operations |
| R24.6 | `source_decomposed`: changing residual characteristic |

No integrated decomposition exists for this roadmap. RS-06 and RS-08 keep these stages unchanged and route their
consumers to them: ClassicalSerreModularity R26–R33 and SmallRamificationAndAbelianVarietyBaseCases R25.5.

Suppliers:
- finiteness of global deformation rings (R24.1, KW II Theorem 10.1) and the existence of characteristic-zero points
  (R24.2, KW II Corollary 4.7) are this roadmap's part R23.1;
- the lifting theorems over totally real fields (KW II Theorem 9.7) are GL2ModularityLifting R22.5–R22.6;
- presentations and deformation data are GlobalGaloisDeformations R04.3 and R04.6;
- local rings with their nonemptiness are LocalGaloisDeformationRings R08.6.

**Sources** (all read on 29 September 2026; the sha256 values match earlier records where there are any):
- **Khare–Wintenberger II**, the authors' preprint of Invent. Math. 178 (2009): §6, §8, §9.2 and §10.
- **Khare–Wintenberger I**: §§4–5.
- **Khare–Wintenberger, Annals 169**: §§1–3.
- **Böckle**, the appendix to Khare's Invent. Math. 154 (2003) paper.
- **Dieulefait–Pacetti**, arXiv v2: §§1.3–1.4.
- **Snowden**, arXiv:0905.4266v1: §7.

## Purpose

These layers produce the lifts and compatible systems that the proofs of Serre's conjecture move modularity along:
- R24.3 constructs p-adic lifts with prescribed local behaviour;
- R24.4 states the modularity lifting theorem over ℚ in the form KW I use;
- R24.5 puts a lift into an almost strictly compatible system;
- R24.6 records what changing the residual characteristic preserves.

## Layer R24.3: prescribed local lifts (`TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`)

The roadmap pins the earlier input to Böckle's appendix and the Remark in §5.2 of Khare 2003, which KW Annals realise as
Theorem 3.3.

- **`bockle-presentation`.** R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/(f₁, …, f_{n+Δ}) when the local rings are flat complete
  intersections of the stated relative dimensions. Oddness enters through the Euler characteristic.
- **`finite-presentation-complete-intersection`** (Böckle's Lemma 2). A finite R with no more relations than variables is
  a finite flat complete intersection. This is the "finiteness then flatness" principle.
- **`bockle-minimal-r-equals-t`** (Theorem 1). An auxiliary R_Q ≅ T_Q gives the minimal R_∅ ≅ T_∅. It is not an
  unconditional lift-existence theorem.
- **`kw-annals-minimal-lifts`** (planet "Minimal lifts (KW Annals Theorem 3.3)"). Minimal lifts exist for p > 2 and
  k(ρ̄) ≠ p. The steps are Böckle's presentation, finiteness through potential modularity, and flatness.
- **`required-lift-types`** (definition; planet "Lifts of required type"). KW I Theorem 5.1's types (1)–(4) as local
  conditions of LocalGaloisDeformationRings R08.6.
  - *API:* `RequiredLiftType` with `localCondition`, `ring`, `points_iff` and `det`.
  - *Tests:*
    - the parity condition at p = 2 (ω₅ is excluded, ω₅² allowed);
    - level-2 characters of 2-power order exist at q = 7 but not at q = 5;
    - the Steinberg type at k(ρ̄) = p + 1;
    - type (3) is unavailable when p ∤ q − 1.
- **`theorem-5-1-part-1-minimal-crystalline`, `…-part-2-weight-two`, `…-part-3-level-one-type-at-q`,
  `…-part-4-level-two-type-at-q`.** The four constructions share one proof (KW II §10.3.1): local nonemptiness (R08.6),
  finiteness (R24.1), dimension ≥ 1 (R04.3), then a point (R24.2).
- **`theorem-5-1-application-table`** (application). Where each type is used in KW I §§8–9, KW Annals and
  Dieulefait–Pacetti.
- **`modern-prescribed-type-lifts`.** Snowden Theorems 7.2.1 and 7.6.1: a weight-two lift with prescribed definite types
  and inertial types exists iff a local solution exists. Over ℚ, (A2) is automatic. This gives DP Theorem 1.9(4), which
  only the modern route uses.

## Layer R24.4: the full KW modularity-lifting interface (`…/LiftingInterface`)

- **`alpha-beta-from-residual-modularity`.** "ρ̄ modular" gives (α) and (β) after an allowable base change, through the
  weight part of Serre's conjecture (Gross, Coleman–Voloch).
- **`kw-theorem-4-1`** (planet "KW I Theorem 4.1 (modularity lifting over ℚ)").
  - *Proof:* base change, then Theorem 9.7 over F (GL2ModularityLifting R22.5/R22.6), then descent.
  - The cases the source lists as known earlier are recorded, with each author and case.

## Layer R24.5:operations: general systems (`…/Basic`)

- **`compatible-system`** (definition). E-rational strictly compatible, almost strictly compatible and plain compatible
  systems, with the three local predicates kept separate; DP's Definition 1.10 is the same notion.
  - *API:* `CompatibleSystem` with `IsStrict`, `IsAlmostStrict`, `IsRegular`, `IsStrict.isAlmostStrict` and `ofNewform`.
  - *Tests:*
    - Δ is strict with weights (11, 0);
    - weight one is irregular;
    - almost strict is not strict at a ramified coefficient prime with reducible reduction;
    - the weight convention.
- **`system-operations`.** Twisting, restriction and induction preserve each kind of compatibility. Irreducibility,
  regularity and purity are not automatic.

## Layer R24.5: compatible systems from potential modularity

- **`brauer-induction-system`** (construction; planet "Compatible systems by Brauer induction"). The system is
  ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}).
  - It is true, independent of choices, and automorphic on solvable subextensions.
  - *API:* `brauerSystem` with `isTrue`, `trace`, `unique` and `restrict`.
  - *Tests:*
    - the case F = ℚ;
    - 1_{ℤ/2} = Ind_1 1 − ε;
    - the non-example 3·1 − ε, which has degree 2 but is not a character;
    - elliptic curves.
- **`almost-strict-compatibility`.** The cases are:
  - Carayol–Taylor away from ℓ;
  - Breuil–Berger at an unramified coefficient prime;
  - Kisin when the residual representation is irreducible.

  KW II withdraw the earlier claim of strict compatibility.
- **`kw-theorem-5-1-systems`** (planet "KW I Theorem 5.1 (compatible systems)"). This includes the residual weights of
  (3) and (4) (Savitt is requested) and Diamond's list of (i, j).
- **`dieulefait-families`.** DP Theorem 1.11 for a given lift, through potential modularity (R23.4).

## Layer R24.6: changing residual characteristic (`…/ChangeOfPrime`)

- **`residual-members`.** For the residual members of a system:
  - the determinant and oddness;
  - irreducibility for almost all ι;
  - conductor divisibility;
  - injectivity of reduction on inertia of order prime to ℓ;
  - the Fontaine–Laffaille weight.
- **`local-compatibility-at-the-coefficient-prime`** (planet). Exactly two cases (a) and (b) give Weil–Deligne
  information at a coefficient prime. In case (c) only the de Rham property is available, and the modern route (Pan,
  DP Paso 5) needs no more.
- **`linked-systems-modularity-transfer`.**
  - A system is modular iff one member is.
  - Modularity moves between linked systems through a lifting theorem at the link.

## Mistakes found in the sources

**E1 (misprint, reaches nothing): KW II, bibliography [33], p. 96.** Khare's level-one paper is cited as "Duke Math. J.
134 (3) (2006), 534–567". It is pp. 557–589.

KW II themselves correct an earlier claim (Wintenberger, Documenta 2006) that the systems are strictly compatible. The
packet records only almost strict compatibility.

## Remaining work

- **R24.5:operations:** rank n and polarised systems, with tensor, dual and symmetric/exterior powers (RS-12 is not
  accepted).
- **Gaps:** Savitt's residual weights (requested from AlgebraicModularFormsAndSerreWeights R15.4); Dieulefait 2004 and
  Gee 2011 were not read.
- **A duplication to resolve in ClassicalSerreModularity:** part R26.1 carries the reviewed decomposition node
  `R26.1/bockle-appendix-minimal-deformation-ring-presentation`. RS-06 makes R24.3 the owner of Böckle's appendix, and
  RS-06 links R24.3 → R26.1, so that node should become an import of `R24.3/bockle-presentation` and
  `R24.3/bockle-minimal-r-equals-t`.

## Sources

- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586 (the authors'
  preprint).
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504 (the authors'
  preprint).
- C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*, Ann. of
  Math. 169 (2009), 229–253.
- G. Böckle, *Appendix 1: On the isomorphism R_∅ → T_∅*, to C. Khare, Invent. Math. 154 (2003).
- L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2 (2022).
- A. Snowden, *On two dimensional weight two odd representations of totally real fields*, arXiv:0905.4266v1 (2009).
