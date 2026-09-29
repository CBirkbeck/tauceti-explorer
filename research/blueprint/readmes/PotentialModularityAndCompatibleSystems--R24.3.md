# Potential modularity and compatible systems — part R24.3: prescribed lifts, the lifting interface and compatible systems — blueprint

This part covers stages R24.3–R24.6 of PotentialModularityAndCompatibleSystems, including the operations sub-layer
R24.5:operations. After the fourth checkpoint:

| Stage | Coverage |
|---|---|
| R24.3 | `source_decomposed`: Böckle, KW Annals, the lifts of KW I Theorem 5.1, Snowden |
| R24.4 | `source_decomposed`: KW I Theorem 4.1 |
| R24.5 | `source_decomposed`: the Brauer system, almost strict compatibility, KW I Theorem 5.1 |
| R24.5:operations | `partial`: rank-n weakly compatible systems, their predicates, operations and L-functions, residual irreducibility and the Grothendieck ring (BLGGT's potential-automorphy consequences not planned) |
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
- **Barnet-Lamb–Gee–Geraghty–Taylor**, *Potential automorphy and change of weight* (arXiv:1010.2561v1): §5.1 and
  Lemma 5.2.1 (checkpoint 3); §§5.2–5.4 (checkpoint 4).
- **Taylor**, *On the meromorphic continuation of degree two L-functions* (Documenta 2006): §6 (checkpoint 3).

## Purpose

These layers produce the lifts and compatible systems that the proofs of Serre's conjecture move modularity along:
- R24.3 constructs p-adic lifts with prescribed local behaviour;
- R24.4 states the modularity lifting theorem over ℚ in the form KW I use;
- R24.5 puts a lift into an almost strictly compatible system;
- R24.6 records what changing the residual characteristic preserves.

## Layer R24.3: prescribed local lifts (`TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`)

The roadmap pins the earlier input to Böckle's appendix and "KW Annals §5.2". The latter is the Remark in §5.2 of
Khare–Ramakrishna, *Finiteness of Selmer groups and deformation rings* (Invent. Math. 154 (2003); KW Annals' [27]),
which KW Annals cite for the method they carry out as Theorem 3.3. Checkpoint 2 corrects an earlier attribution to
Khare's paper with Böckle's appendix ([26]).

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
- **Checkpoint 3: rank n** (RS-12 is accepted; "early R24.5:operations owns the carrier and generic operations").
  - **`weakly-compatible-system-rank-n`** (definition). BLGGT's 5-tuple (M, S, {Q_v}, {r_λ}, {H_τ}), and Taylor's rank-d
    systems over ℚ. It is the common carrier; its members are representations, not only traces.
    - *API:* `WeaklyCompatibleSystem` with `rank`, `charpoly_frob`, `deRham`, `ofCompatibleSystem`, `ofNewform`.
    - *Tests:* the cyclotomic system; Δ; the carrier stores representations; enlarging S.
  - **`compatible-system-predicates`** (definition). These are separate predicates, kept apart from Khare–Wintenberger's
    local ones:
    - regular and extremely regular, and totally odd;
    - essentially conjugate self-dual, and its totally odd form;
    - irreducible on a density-one set;
    - strictly compatible, pure and strictly pure;
    - automorphic.
  - **`linear-algebra-operations-on-systems`.** ⊕, ⊗, duals, Sym^k, ∧^k, restriction and induction, applied member by
    member. A preservation table records what each keeps: regularity fails for ⊗, and irreducibility fails for restriction.
  - **`rank-two-reducibility-independent-of-lambda`.** Taylor's Lemma 6.5, and BLGGT Lemma 5.2.1 (the component group is
    independent of λ; its Larsen–Pink input is a gap).
- **Checkpoint 4: L-functions, residual irreducibility and the Grothendieck ring** (BLGGT §§5.1–5.2 and 5.4).
  - **`system-l-functions`** (definition, `…/LFunction`). BLGGT's partial L-function L^S(ıℛ, s) and, for strictly
    compatible ℛ, L(ıℛ, s). For pure, regular ℛ it adds the archimedean Γ- and ε-factors, which use det ℛ(c_v) at real
    places when n is odd, the Hodge factor L({H_τ}, s), and the completed Λ(ıℛ, s) and ε(ıℛ, s). The functional
    equation needs potential automorphy (Corollary 5.3.2) and is not claimed.
    - *API:* `partialLFunction`, `lFunction`, `archimedeanGammaFactor`, `archimedeanEpsilon`, `hodgeFactor`,
      `completedLFunction`, convergence for pure ℛ, and independence of λ.
    - *Tests:* the trivial system gives Mathlib's `completedRiemannZeta`; Γ_ℂ = Γ_ℝ(s)Γ_ℝ(s + 1); ε_l in BLGGT's
      geometric-Frobenius convention gives ζ^S(s + 1) and Γ_ℝ(s + 1); an impure non-example.
  - **`galois-grothendieck-ring`** (construction, `…/Grothendieck`). Rep_{F,l} with traces, the pairing, conj, res and
    ind (Frobenius reciprocity, Mackey), Brauer induction and L^S of virtual classes (§5.4 (1)–(9)).
    - *API:* `RepRing` with `trace`, `pairing`, `eq_irreducible_of_pairing_eq_one`, `res`, `ind`, `brauer`,
      `partialLFunction`.
    - *Tests:* (A, A) = 5 for 2[V₁] − [V₂]; the unit; dim ind[1] = [F′ : F]; a virtual non-example.
  - **`residual-irreducibility-density-one`** (`…/Irreducibility`). Proposition 5.2.2: for a regular system, s̄|_{G_{F(ζ_l)}}
    is irreducible for every irreducible constituent s at primes above a density-one set of l. Larsen 1995 is a gap.
  - **`constituents-essentially-self-dual`** (`…/Irreducibility`). Lemma 5.2.3: for pure, extremely regular, essentially
    conjugate self-dual ℛ, a constituent of r_λ|_{G_{F′}} descends to a CM field F″ ⊆ F′ and stays essentially conjugate
    self-dual (totally odd if r_λ is).

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

- **R24.5:operations:** BLGGT §5.3 (Theorem 5.3.1 to Proposition 5.3.4) and Theorems 5.4.1–5.4.3 follow from potential
  automorphy (Theorem 4.5.1). The stage "does not assume … a potential-automorphy endpoint", so they belong with the
  potential-automorphy assembly (ModularityAndLanglandsExtensions ML.2). Larsen–Pink Proposition 6.14 and Larsen 1995
  are gaps.
- **Gaps:** Savitt's residual weights (requested from AlgebraicModularFormsAndSerreWeights R15.4); Dieulefait 2004 and
  Gee 2011 were not read.
- **Requests (checkpoint 4):** the local factors L(WD, s) and ε(WD, ψ, s) of Weil–Deligne representations
  (EndoscopicTransferAndUnitaryTraceComparison ET.6), and Brauer's induction theorem with Frobenius reciprocity and
  Mackey (Tau Ceti RepresentationTheory/InductionRestriction, Layer 6).
- **Resolved:** ClassicalSerreModularity part R26.1 now imports Böckle's appendix from here (its checkpoint 2, #3865).

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
- T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Potential automorphy and change of weight*, Ann. of Math. 179
  (2014), 501–609 (arXiv:1010.2561v1).
- R. Taylor, *On the meromorphic continuation of degree two L-functions*, Documenta Math. Extra Volume Coates (2006),
  729–779.
