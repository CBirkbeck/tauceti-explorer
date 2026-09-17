# Review of AUDIT-17

**Job** REV-AUDIT-17 · **Date** 2026-09-17 · **Verdict `accepted`** · **3 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-17.json` —
`DeformationAndDerivedPatchingAlgebra`, `HabiroCyclotomicCompletions`, `HabiroRings`,
`ComputationalNumberTheory` and `tauceti:TauCetiRoadmap/HopfRinow`. That is 33 layers, 194 targets,
375 distinct declaration citations and 89 duplicate claims.

**The audit is correct.** Every presence claim holds at the stated generality, every absent or partial
claim I re-searched stayed absent or partial, every verdict follows from its targets, and every
duplicate points at a live layer that really does overlap. The only changes are three duplicates it
missed, all in `ComputationalNumberTheory`.

## What was checked

**Mechanical.**
- All 33 batch layers are present, in batch order, with no extras.
- Every one of the 375 citations resolves at its stated library, file and line. Four are not in
  `declarations.tsv` but are in the source exactly as cited: `PMF`
  (`Mathlib/Probability/ProbabilityMassFunction/Basic.lean:46`, where the index misses the universe
  annotation `PMF.{u}`) and the instances `proper_of_compact` and `complete_of_proper`
  (`Mathlib/Topology/MetricSpace/ProperSpace.lean:93` and `:104`). The audit already flags the last.
- No citation is `private`, an axiom or a bare structure field.
- No cited file contains a `sorry` in a proof. Nine Tau Ceti files and 44 Mathlib files contain the
  word at all; every occurrence is in a docstring, and none of those files is cited. In particular the
  `Isogeny` declaration cited under CN.3 lives in `Isogeny/OneSubFrobenius/Degree.lean`, not in the
  `Isogeny/Frobenius/Basic.lean` whose docstring mentions a `sorry` in the source roadmap.
- Every verdict agrees with its targets, under the rule that `built` means no absent or partial target,
  `not built` means none present and `partly built` means at least one of each. **No layer needed a
  verdict change** — unlike several earlier batches, this audit never marked a layer `partly built`
  with only partial and absent targets.

**Presence claims (27 targets: 11 `mathlib`, 15 `tauceti`, 1 `both`).** I read the statement, namespace
and `variable` lines of the lead declarations and compared them with the target. All hold. The checks
that mattered:

- **HopfRinow Layer 0 is genuinely `built`,** target by target. `exists_unit_speed_reparametrization`
  really assumes nonvanishing velocity and delivers the same endpoints and `pathELength`;
  `IsPiecewiseContMDiffOn.exists_contMDiff_pathELength_eq` really is corner smoothing to a `C¹` path of
  the same length; `riemannianEDist_eq_iInf_pathELength_piecewise` really is do Carmo's infimum equal to
  Mathlib's; `riemannianEDist_ne_top` is proved under `[PreconnectedSpace M]`, which is what the layer
  asks; and `Restriction.lean`'s own docstring says the three scoped instances are what make
  `EMetricSpace.ofRiemannianMetric` available on an open submanifold — the milestone the layer names.
  `riemannianEDist_eq_enorm_sub_of_convex` needs no finite dimension, so `more general` is right.
- **HopfRinow Layer 1, the Levi-Civita target is `mathlib`.** The pinned Mathlib has
  `CovariantDerivative.IsMetricCompatible` (`Metric.lean:155`), the Koszul construction
  `leviCivitaConnection` (`LeviCivita.lean:359`), `isLeviCivitaConnection_leviCivitaConnection` and
  `IsLeviCivitaConnection.uniqueness`. The roadmap's local shim is not needed, as the audit says.
- **P7's only present target.** `CochainComplex.IsKProjective.quasiIso_iff` really is "between
  K-projective complexes, quasi-isomorphism ⟺ homotopy equivalence", with the ℕ-indexed
  `ChainComplex.quasiIso_iff_of_projective` derived from it — in any abelian category, so
  `more general` is right.
- **CN.1's factorisation target.** `FactorsHelper` really asserts a sorted list of primes whose product
  is `n`, and the simproc `Nat.primeFactorsList_ofNat` is at `Tactic/Simproc/Factors.lean:161` exactly
  as the note says.
- **CN.3's Sturm target.** `TauCeti.ModularForm.sturm_bound_finiteIndex` and `eq_of_sturm_bound` are for
  subgroups of finite relative index in `SL₂(ℤ)` with discrete strict periods, in the stated form.
- **HR.7's two `mathlib` targets.** `normalizedFactors_cyclotomic_card` gives `φ(n)/ord` factors, hence
  four for Φ₅ over 𝔽₁₁, and `CommRingCat.equalizerForkIsLimit` is the equalizer universal property
  `Suggested.lean` wants.

**Absent and partial claims (167).** I re-searched independently — by concept, by Mathlib naming
convention, in `declarations.tsv` and with `grep -rn -i` over both whole source trees — every claim
whose concept has a standard name, and about two thirds of the rest. Searches that returned nothing:

- **Riemannian geometry:** exponential map, `expDomain`, injectivity radius, normal ball, normal
  coordinates, `log_p`, Gauss lemma, first variation of energy, energy functional, variation field,
  Hopf–Rinow, Riemannian isometry, geodesic flow. `geodesicInterval` exists but no chosen maximal
  geodesic `γ_{p,v}`, so the homogeneity identity really is unstated, and the only local-flow theorem is
  `ODE.exists_contDiffAt_localFlow` on a normed space.
- **Local commutative algebra:** Cohen–Macaulay, Auslander–Buchsbaum, complete-intersection ring,
  catenary, excellent/Nagata/Japanese, equidimensional, minimal free resolution. There is no depth
  invariant — `Mathlib/RingTheory/Depth/Rees.lean` proves only the Rees TFAE the audit cites.
- **Derived algebra:** perfect complex, `Perf`, pseudo-coherence, Tor-amplitude, flat dimension, derived
  completion, derived Nakayama, lim¹, derived inverse limit, Milnor sequence, completed tensor product.
- **Deformation theory:** Schlessinger, deformation functor, hull, versal, prorepresentable on Artinian
  algebras (Mathlib's `Prorepresentability` is Galois categories), ultrapatching, ultraproduct of a
  varying family of rings.
- **Habiro:** the word "Habiro" occurs in neither tree; no Λ-ring or λ-ring (`Dickson.lean` says so in
  as many words), no Adams operations, no δ-rings, no q-Witt or big Witt vectors, no E∞-algebras,
  spectra or solid tensor products. q-Pochhammer symbols are still a TODO in `Pochhammer.lean`, so
  `P_N(q)` has no carrier.
- **Computation:** Hermite normal form, LLL, Miller–Rabin, strong pseudoprime, Solovay–Strassen, AKS,
  Pollard rho, quadratic sieve, Cantor–Zassenhaus, Berlekamp, Vélu, Schoof, modular symbols, Manin
  symbols, Newton polygons, Sturm sequences, ball arithmetic, L-value enclosures. The Hasse bound itself
  is absent: Tau Ceti proves `deg(1 − π) = #E(𝔽_q)` and calls it "the first input of the Hasse bound".
  `GaloisField p n` is a `SplittingField`, so the "not executable" note is right.

One candidate could have overturned a claim and did not. Two Tau Ceti files the audit never cites,
`Geometry/Manifold/Riemannian/MetricVariation.lean` and `MetricBridge.lean`, are *metric* variation —
total variation equals `pathELength` on an open submanifold, plus the chart-displacement estimate — and
are further Layer-0 support, not the first variation of energy. Layer 2 stays absent.

**Duplicates (89).** All point at live atlas layers; none is retired and none is a batch layer of its
own. Reading each target description confirms the overlap; the notes track the descriptions closely
(median keyword overlap 0.8), and the low-scoring ones are same-roadmap cross-references that are
correct — including the observation that the atlas gives `HR.5-number-field-comparison` the whole of
HR.5's description. Candidates I checked and **rejected**, because they declare themselves consumers of
the batch's own roadmaps rather than duplicating them: OptimalTransport Layers 7 and 8 and
GeometricTopology Layer 7 (all three consume HopfRinow's connection, exponential map, minimizing
geodesics and length-space API by name), GlobalGaloisDeformations R04.1 and AutomorphicCongruences L3
(both list `DeformationAndDerivedPatchingAlgebra` as a dependency), LanglandsParameterStacks LP4 and
EffectiveDiophantineMethods ED.1.

## Corrections

Three duplicates added, no status or verdict changes.

| Layer | Added | Overlap |
| --- | --- | --- |
| CN.1 | `…/PolynomialGaloisGroups#layer-5-frobenius-specialization` | Owns `factorDegrees f p`, the criterion `factorDegrees f p = {n}` ⟺ `f mod p` irreducible of degree `n`, the multiplicity-one lemma at good primes and the worked examples — and owns all three Tau Ceti declarations the audit cites under CN.1's polynomial targets |
| CN.3 | `…/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas` | "The Sturm bound and finite-dimensionality — consume level one, build the general case", naming `sturm_bound_finiteIndex`: CN.3's Sturm target and the source of its Tau Ceti citations |
| CN.3 | `FiniteFieldsAndCharacterSums:FF.3` | Also asks for certified point-counting algorithms accepted only when "a point count agrees with the trace convention and a provable error bound" — CN.3's point-count target, Hasse bound included |

## Findings worth repeating

- **The batch is a genuine construction backlog, not hidden duplication.** 95 of 194 targets are absent
  and 72 partial; only 27 are present, 21 of them in HopfRinow. The Habiro family has nothing at all:
  no Habiro ring, no Λ-ring, no q-Witt ring, and no q-Pochhammer carrier to build `P_N(q)` from.
- **HopfRinow has moved well past its status page.** Layer 0 is complete, and Layer 1 has the geodesic
  spray with chart independence and smoothness, local existence and uniqueness, constant speed, the
  maximal interval with its scaling law, the finite-endpoint extension criterion and the manifold
  inverse function theorem. The whole roadmap now waits on one object: `exp_p`. Layer 1's last three
  targets, all of Layer 2, six of Layer 3's eight and two of Layer 4's three are blocked on it.
- **What the roadmaps should consume rather than build.** The pinned Mathlib's Levi-Civita connection
  with uniqueness (HopfRinow Layer 1 needs no shim); K-projective quasi-isomorphism ⟺ homotopy
  equivalence, `MvPowerSeries.eval₂Hom`/`eval₂_unique`, regular sequences and projective dimension
  (Deformation P7, R03.1, R03.3); `taylor_coeff` with `hasseDeriv` and `factorial_smul_hasseDeriv`,
  resultants with the Bézout identity, `modByMonic` with uniqueness, and `PowerSeries.HasSubst` with
  `subst_comp_subst` (Habiro HC.2, HC.3, HC.4); `CommRingCat.equalizerForkIsLimit` (HR.7).
- **Two `Suggested.lean`-style warnings in the roadmaps are already Mathlib theorems.** HR.5's p.18
  repair — Φ_m can split modulo ℓ — is `normalizedFactors_cyclotomic_card`, and HR.7's equalizer
  universal property is `CommRingCat.equalizerForkIsLimit`.
- **`ComputationalNumberTheory:CN.2` still lists the retired `FoundationsAndLibraryIntegration:LI.4` as
  an input** (the audit found this; `data/roadmap-retirements.json` confirms the retirement on
  2026-09-16).
