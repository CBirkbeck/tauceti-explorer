# Roadmap: the classical analytic cohomology inputs to diamonds (layers H0–H3)

*Roadmap `ClassicalAdicEtaleCohomology`, part `H0`: the layers H0, H1 with its four sub-stages, H2 and H3. The
layers H4–H5 (constructibility in curve families and annuli, algebraic–analytic comparison and finiteness) are
the other part of the roadmap.*

## Coverage of this planning pass

The packet is complete as a 300-node planning pass under PROTOCOL §0. Five stages are planned and three
remain partial, with their missing targets listed below. No stage is closed. Definitions and constructions
have 550 API items and 274 unit tests; there are 40 planets, 170 cited baseline declarations, 40 proof/source
gaps and 37 supplier requests. Every implementation status remains unchecked.

The additions cover arbitrary-preadic ℤ_p/ℚ_p local systems and analytic monodromy, the perfectoid limit
comparison of Česnavičius §4.10, semistable formal p-torsion nearby cycles and the non-quasi-compact
Bloch–Kato–Hyodo filtration of CDN §2.1.1, and arbitrary-dimensional traces with prime-to-residue duality.
The integral trace export is exactly the classical input of Guo–Reinecke 7.16/7.17; its prismatic
construction and Zavyalov’s mod-p duality are supplied by their respective roadmaps.

The arbitrary-preadic local-system category uses affinoid descent before sheafiness. This does not extend
the existing cohomology statements to all non-sheafy rings. The adic–Berkovich trace comparison uses rigid
spaces over Spa(K,O_K); the older statements over a general higher-rank C⁺ retain their own hypotheses.
In mixed characteristic, finite p-power coefficients are allowed for the smooth trace; classical
Poincaré duality requires coefficients invertible in O_K.

| Stage | Coverage | Remaining targets or refinements |
|---|---|---|
| H0 | planned | Refine the arbitrary-preadic and analytic-monodromy carrier imports with the SF.2/R0/R1/A1/D0 suppliers; no missing H0 target statement is hidden by this refinement. |
| H1:henselian | planned | Apply the proposed perfectoid-limit suffix and refine its P5/H0/L2 interfaces without adding a P5 dependency to early affine or Noetherian comparisons. |
| H1:formal-adic-comparison | planned | Assign and read the proposed algebraic semistable p-torsion BKH supplier, including the étale-local ramification endpoint; refine the completion transport and generic mate-coherence imports. |
| H1:valuation-nearby-cycles | partial | Hub96 4.2.4 for a non-dominant Cartesian change of valuation base: the stage states the dominant case (valuative-base-change-for-nearby-cycles); the only public route (Orgogozo's modification theorem) uses de Jong alterations owned by AdicCoefficientsAndComparisons L5, which consumes this stage.; Proofs available only in Hub96 §4.2 (4.2.1–4.2.3 exact forms, the Gauss-valuation induction, 4.2.10 beyond the tame quotient, the 4.2.5 curve case) are gaps. |
| H1:valuation-exports | partial | The finite-boundary alternative of Hub96 4.2.8–4.2.9 has no public statement and no node.; The exact hypotheses of Hub96 4.2.6–4.2.7 are not public; the nodes state publicly supported forms, and their correspondence with Huber's numbering is unverified. |
| H1 | planned | No missing target statement; recorded proof gaps and supplier requests remain. |
| H2 | planned | No missing target statement; recorded proof gaps and supplier requests remain. |
| H3 | partial | The trace isomorphism and Poincaré duality for curves over Spa(C, C⁺) with C⁺ ≠ O_C and without local smooth models (Hub96 7.2.2, 7.5.3, plus-ring case) — the case ECD's proof of Theorem 24.1 uses — are not realised; the stage proves the O_C case and the case with local smooth models.; Proper base change for non-algebraizable proper adic spaces (Hub96 4.4.3), and the general higher-rank-point/compactifiable cohomological-dimension assertions (5.3.11, 5.5.8), remain beyond the old formal-model/ball cases and the new partially proper rigid 2d bound.; Gluing and properness of the universal compactification (Hub96 5.1.5, 5.1.6, 5.1.14) and the Huber–Berkovich comparison (§8.3) are gaps.; Close the explicitly requested integral inverse-limit trace proof and relative tensor/Hom/base-change coherence; read the Huber proofs imported by Zavyalov A.15/A.18 and 5.3.2. |

The new source sections below supplement the earlier layer descriptions. The packet is authoritative
for the current prerequisite lists and planet choices. It proposes an isolated
H1:henselian:perfectoid-limit suffix; all of its nodes retain the current henselian parent until the
proposal is accepted. H0 retains ownership of the general tilde-limit and coherent-site continuity.

## Purpose

*Étale cohomology of diamonds* proves its six-functor formalism by reduction to classical statements about the
étale cohomology of analytic adic spaces, most of them from Huber's book *Étale cohomology of rigid analytic
varieties and adic spaces*. This roadmap supplies those classical inputs on the carriers of the atlas, before
their diamond applications:

- the **étale sheaf theory** of analytic adic spaces (H0): sheaves of modules, derived direct images, local
  systems, constructible sheaves, twists, supports, stalks at geometric points with higher-rank plus rings,
  pseudo-adic spaces, and Huber's **tilde-limits** with their cohomological continuity;
- the **comparison theorems** (H1): henselian pairs and Huber's comparison of analytic and algebraic cohomology
  over henselian f-adic rings (H1:henselian), the specialisation morphism of a formal scheme and the formal–adic
  comparison of nearby cycles (H1:formal-adic-comparison), nearby cycles over arbitrary valuation bases
  (H1:valuation-nearby-cycles) and the invariance and finiteness statements exported from them
  (H1:valuation-exports), with the umbrella H1 comparing them with the trait theory;
- **invariance** under extension of an algebraically closed complete field (H2), in the form ECD Lemma 16.3
  uses, and geometric connectedness under base extension;
- **proper-support direct images** in Huber's classical scope and the **trace and Poincaré duality** for smooth
  curves (H3), with arbitrary-dimensional rigid traces and prime-to-residue proper duality.

## Layers and their order

```text
AdicEtaleGeometry A1, DiamondsAndVStacks D0, EnhancedDerivedSheaves E1, anchor Layers 2–5, PerfectoidSpaces P3 → H0
H0, AdicSpacesPartII R0–R2/F0, AdicCoefficientsAndComparisons L2, SchemeAndStackFoundations SF.2
    → H1:henselian → H1:formal-adic-comparison
H0, ArithmeticGaloisDuality R02.1–R02.2, LefschetzPencilsAndVanishingCycles LPV.0 → H1:valuation-nearby-cycles
H1:formal-adic-comparison, H1:valuation-nearby-cycles → H1:valuation-exports
the four sub-stages, LPV.0–LPV.1 → H1
H1, PerfectoidSpaces P2, P3, P5, P7 → H2
H1, H2, EtaleDualityAndPerverseSheaves EDC.2 → H3
```

| Layer | Title | What it builds |
|---|---|---|
| H0 | Classical étale sheaves, stalks, and direct image | analytic sheaf instances, integral and rational preadic local systems, analytic monodromy, supports, stalks, pseudo-adic sites, tilde-limits and continuity |
| H1:henselian | Henselian pairs and approximation | henselian f-adic rings, affinoid and pro-special henselisations, Huber's §3.2 comparisons, isolated perfectoid-limit specialization |
| H1:formal-adic-comparison | Formal completion and the actual comparison map | specialization, pseudo-adic supports, stalk formulas, completion comparison and its naturality, formal RΨ, semistable p-torsion BKH filtration |
| H1:valuation-nearby-cycles | Arbitrary valuation bases, not just traits | nearby cycles over valuation bases, base change prime to the residue characteristic, constructibility |
| H1:valuation-exports | Interfaces for analytic invariance and support | support triangles, invariance for surjective valuation maps, finiteness |
| H1 | Formal models, specialization, and nearby-cycle comparison | the umbrella: comparisons of the sub-stages with each other and with LPV |
| H2 | Invariance under extension of an algebraically closed valued field | Huber 4.1.1(c) in ECD 16.3's form, geometric connectedness |
| H3 | Proper support, traces and Poincaré duality for curves | Rf_!, base change, dimension bounds, curve duality, arbitrary-dimensional rigid trace, prime-to-residue proper duality, integral trace export |

## Prerequisites

- **AdicEtaleGeometry A1–A2**: the étale, finite étale and pro-étale sites of analytic adic spaces, geometric
  points and strict localisations, smooth morphisms and formal generic fibres. H0 builds the classical sheaf
  theory on A1's sites; it introduces no second site.
- **DiamondsAndVStacks D0** (spectral spaces, coherent topoi and their limits, Čech-to-derived comparison) and
  **EnhancedDerivedSheaves E1** (sheaves of modules, K-injective replacements, the enhanced derived category):
  H0 proves their analytic instances and compares ordinary Ext cohomology with the enhancement.
- **AdicSpacesPartII** R0 (morphisms, fibre products, finite and étale morphisms), R1 (analytification and rigid
  spaces), R2 and F0 (formal schemes, type (S), generic fibres), R3 (coherent sheaves), R4 (the sites on these
  carriers).
- **PerfectoidSpaces** P2, P3, P5, P7: the p-finite approximation of perfectoid affinoids, finite étale
  algebras over perfectoid rings, finite-stage descent and perfectoid tilde-limits, used by H0 and H2.
- **LefschetzPencilsAndVanishingCycles** LPV.0–LPV.1 (trait nearby cycles and monodromy),
  **EtaleDualityAndPerverseSheaves** EDC.2 (scheme curve trace, purity and pairings), **ArithmeticGaloisDuality**
  R02.1–R02.2 (continuous Hochschild–Serre), **AdicCoefficientsAndComparisons** L2 (continuity and noetherian
  approximation for schemes), **SchemeAndStackFoundations** SF.2 (étale cohomology of schemes: base change,
  stalks, constructibility, supports), and the Tau Ceti roadmaps **Foundations of adic spaces** (Layers 2–5),
  **Profinite cohomology** and **Profinite and pro-p groups**.

## Boundaries

- **DiamondsAndVStacks D0 and EnhancedDerivedSheaves E1 own** the generic sheaf and derived-category
  interfaces; H0 proves their analytic instances and the geometric stalk and limit theorems.
- **H0 owns** Huber's general tilde-limit (the topology and the affinoid density condition as separate
  conditions) and its cohomological continuity; **PerfectoidSpaces P7** owns uniqueness in the perfectoid
  representable class and imports the general notion from here. **H0 also owns** pseudo-adic spaces and their
  étale sites, which H1 and H3 use.
- **LefschetzPencilsAndVanishingCycles owns** the trait theory of nearby and vanishing cycles. H1 does not build
  a second trait RΨ: it identifies Huber's formal nearby cycles with LPV's RΨ (not RΦ) and extends the theory to
  valuation bases of arbitrary rank.
- **PerfectoidSpaces P3 owns** the early algebraic finite étale approximation used inside almost purity;
  H1:henselian's comparisons are cohomological statements about henselian f-adic rings, a different theorem.
- **EtaleDualityAndPerverseSheaves EDC.2 owns** the scheme curve trace, purity and pairing; H3 proves the
  henselian comparison, local residues and formal-model transfer and uses no diamond smoothness and no Rf^!.
- **The other part of this roadmap** (H4–H5) owns relative constructibility, annuli and the general
  algebraic–analytic comparison; H3's curve comparison is the curve case it cites.
- **Consumers.** AdicSpacesPartII R5, AdicEtaleGeometry A4, PerfectoidSpaces P7–P8, PadicHodgeTheory P8,
  DiamondEtaleCohomology C0, C1, C5 and C8, DiamondSixOperations S4–S5, HodgeTateAndCanonicalSubgroups T1 and T6,
  PerfectoidShimuraVarieties S0 and AdicCoefficientsAndComparisons L5 import the layers named in their own
  documents.

## Pinned conventions

1. **Adic spaces** are analytic adic spaces in the anchor's category; étale sites are AdicEtaleGeometry A1's.
   Coefficients are torsion rings; where a statement needs torsion prime to the residue characteristic it says
   so, and no statement silently narrows the torsion scope of its source.
2. **Field pairs.** Geometric points are morphisms from Spa(C, C⁺) with C algebraically closed and complete and
   C⁺ an open bounded valuation subring of arbitrary rank; statements never replace C⁺ by O_C silently.
3. **Limits.** A tilde-limit X ~ lim X_i is Huber's notion (a homeomorphism onto the inverse limit of the
   underlying spaces together with the affinoid density condition); it is not a categorical inverse limit, and
   each statement says which of the two it uses.
4. **Nearby cycles.** RΨ denotes nearby cycles (Huber's "complex of vanishing cycles"); RΦ is its cone.
5. **Sources.** Huber's 1996 book is cited only through excerpts verified by reviewed decompositions; every other
   statement cites a public source that states or restates it, and a proof step available only in the book is a
   gap.
6. **Names.** Geometry lives in `TauCeti.AdicSpace` (étale sheaves, derived images, supports), formal schemes in
   `TauCeti.FormalScheme`, ring-level statements in `TauCeti.Huber`, and scheme-level nearby cycles over
   valuation bases in `TauCeti.AlgebraicGeometry`; the names below omit `TauCeti.`.

<a id="h0"></a>

## H0. Classical étale sheaves, stalks, and direct image


**Dependencies.** `AdicEtaleGeometry:A1` (the étale, finite étale and corrected pro-étale sites of analytic adic spaces,
geometric points `Spa(C, C⁺)` with `C⁺` of any rank, strict localisations, the affinoid étale basis), `AdicEtaleGeometry:A2`
(stage prerequisite of the roadmap), `DiamondsAndVStacks:D0` (spectral limits, qcqs objects of topoi, Čech-to-derived and Leray,
filtered colimits on coherent topoi; limits of coherent topoi requested), `EnhancedDerivedSheaves:E1` (module sheaves, K-injective
replacements, the enhanced derived category), `AdicSpacesPartII:R0` (completed tensor products, affinoid fibre products, locally
noetherian adic spaces), `AdicSpacesPartII:R3` (Tate acyclicity and finite étale descent of finite projective modules),
`AdicSpacesPartII:R4` (boundary complements, analytification of étale sites), `PerfectoidSpaces:P3` (henselian finite étale
approximation), and the anchor `tauceti:TauCetiRoadmap/AdicSpaces` Layers 2, 3 and 5 (requested: completion invariance of `Spa`,
plus rings as functions bounded by one, stalks, the adic-space category). Upstream placeholders `UPSTREAM:ECD:SCH_SHEAVES` and
`UPSTREAM:ECD:SCH_BC` enter only through the scheme comparisons of the consumers.

H0 is the classical analytic instance of the common sheaf and derived carriers, and the owner of the general Huber tilde-limit.
Following RS-05 it keeps: module sheaves on A1's étale and pro-étale sites with Mathlib's Grothendieck-abelian structure;
`D⁺`, derived global sections and derived direct images with injective resolutions; the comparison of ordinary Ext and `D⁺` with
E1's enhancement; Leray, Čech-to-derived and Cartan–Leray spectral sequences on these sites; the pro-étale/étale comparison;
affinoid-local descriptions; the étale sites of subsets (Huber's pseudo-adic spaces), supports and extension by zero; torsion local
systems, Tate twists and constructible sheaves in Huber's classical sense; stalks at geometric points `Spa(C, C⁺)` with higher-rank
`C⁺` retained; the stalk formula over strict localisations; and the general Huber tilde-limit with its topological and density
conditions kept separate, its affinoid criterion, restriction, base change, the étale topos of a tilde-limit and cohomological
continuity. D0 owns the generic site-theoretic statements, E1 the enhancement, A1 the sites, points and strict localisations;
PerfectoidSpaces P7 imports the tilde-limit and proves the perfectoid extensions. H0 constructs no second site, no second derived
category and no second notion of geometric point.

### Conventions

1. *Spaces.* X is an analytic adic space (anchor Layer 5; every point analytic) that is **locally strongly sheafy** (A1: locally
   `Spa(A, A⁺)` with `A⟨T₁, …, T_n⟩` sheafy for all n). Locally noetherian analytic spaces (Huber's setting, rigid spaces,
   analytifications) are the main case; pro-étale statements assume X locally noetherian, as A1's corrected pro-étale site does.
2. *Sites.* `X_ét` is A1's small étale site: coverings are the jointly surjective families on **all** points, including points of
   higher rank. `X_proét` is A1's pro-étale site with the erratum's corrected coverings (finite-étale towers followed by étale maps);
   no arbitrary open surjection of profinite sets is assumed to split. `ν: X_proét → X_ét` is A1's projection.
3. *Coefficients.* Λ is a ring (commutative with 1). `Sh(X_ét, Λ) := Sheaf (smallEtaleTopology X) (ModuleCat Λ)`; sheaves of modules
   over a sheaf of rings R are Mathlib's `SheafOfModules R`. Torsion hypotheses (nΛ = 0) are imposed only where stated.
4. *Size.* `X_ét` is handled through the essentially small affinoid basis; `X_proét` is not essentially small and is replaced by the
   κ-small subsites `X_proét,κ` for cutoff cardinals κ, with the colimit over κ (ECD §14 convention).
5. *Derived categories.* `D(X_ét, Λ) = DerivedCategory (Sh(X_ét, Λ))`, `D⁺ ⊆ D` the bounded-below full subcategory
   (`DerivedCategory.Plus`); `RΓ` and `Rg_*` are `Functor.rightDerivedFunctorPlus`; unbounded complexes use E1's K-injective model.
6. *Geometric points.* A geometric point is `ξ: Spa(C, C⁺) → X` with C algebraically closed, complete, nontrivially valued, and
   `C⁺ ⊆ C` an open bounded valuation subring **of any rank**; field pairs are never silently replaced by `Spa(C, O_C)`.
7. *Limits.* A **Huber tilde-limit** `X ∼ lim X_i` is not a categorical limit: it is written with `∼`, and both the topological and
   the density condition are required. Categorical limits appear only for topological spaces (`TopCat.limitCone`), pro-objects of
   `X_ét`, and filtered colimits of rings.
8. *Subsets.* A subset `S ⊆ |X|` (a closed complement, a stratum) is never treated as an adic subspace; its étale site is the
   pseudo-adic site `(X_ét, J_S)`.
9. *The warning of the roadmap.* The rational acyclicity of O (anchor Layer 4, R3, and H0.5 below for the étale site) says nothing
   about étale cohomology with constant torsion coefficients: `H¹(Spa(ℚ_p, ℤ_p)_ét, ℤ/p) ≠ 0` while `H¹(Spa(ℚ_p, ℤ_p)_ét, O) = 0`.

### H0.1 Étale and pro-étale sheaves of modules

`ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules` (construction). For X as in
Convention 1 and a ring Λ, `Sh(X_ét, Λ)` is a Grothendieck abelian category with enough injectives, equivalent to `SheafOfModules`
over the constant sheaf `Λ_X`. It carries sections `Γ(U, −)` (left exact), constant sheaves `M_X` with `Hom(M_X, F) = Hom_Λ(M, F(X))`
and `M_X(U) = LC(|U|, M)`, direct images `g_*` with `(g_*F)(U) = F(U ×_X X′)` and exact inverse images `g^{-1}` (base change is
finite-limit preserving, hence representably flat), restrictions `u^{-1}` to étale objects equal to Mathlib's `overPullback`
under A1's slice equivalence, stalks `F_ξ` at geometric points (exact, colimit-preserving, jointly conservative), change of
coefficients, and the same on `X_proét,κ` with `ν^{-1} ⊣ ν_*`.

API: `AdicSpace.EtaleSheaf` (structure): Sh(X_ét, Λ) := Sheaf (smallEtaleTopology X) (ModuleCat Λ), for X locally strongly sheafy analytic and a ring Λ.; `AdicSpace.EtaleSheaf.isGrothendieckAbelian` (instance): Sh(X_ét, Λ) is Grothendieck abelian (ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small).; `AdicSpace.EtaleSheaf.enoughInjectives` (instance): Sh(X_ét, Λ) has enough injectives.; `AdicSpace.EtaleSheaf.equivSheafOfModules` (equivalence): Sh(X_ét, Λ) ≌ SheafOfModules (Λ_X), the identity on underlying presheaves.; `AdicSpace.EtaleSheaf.sections` (functoriality): Γ(U, −): Sh(X_ét, Λ) ⥤ ModuleCat Λ for U ∈ X_ét, additive and left exact.; `AdicSpace.EtaleSheaf.const` (constructor): The constant sheaf M_X (constantSheaf), with constAdj : Hom(M_X, F) ≃ Hom_Λ(M, F(X)).; `AdicSpace.EtaleSheaf.const_sections` (characterisation): For every U ∈ X_ét, Γ(U, M_X) = locally constant functions |U| → M.; `AdicSpace.EtaleSheaf.pushforward` (functoriality): g_*: Sh(X′_ét, Λ) ⥤ Sh(X_ét, Λ), (g_*F)(U) = F(U ×_X X′); pushforward_comp: (h∘g)_* ≅ h_* ∘ g_*.; `AdicSpace.EtaleSheaf.pullback` (functoriality): g^{-1} = sheafPullback, left adjoint to g_* (pullbackPushforwardAdj), exact (preserves finite limits).; `AdicSpace.EtaleSheaf.restrict` (functoriality): u^{-1}F = F|_U for u: U → X in X_ét, equal to overPullback under U_ét ≃ X_ét/U.; `AdicSpace.EtaleSheaf.stalk` (projection): F ↦ F_ξ = (point ξ).sheafFiber F for a geometric point ξ (C⁺ of any rank); exact and colimit preserving.; `AdicSpace.EtaleSheaf.stalk_pullback` (compatibility): (g^{-1}F)_{ξ′} ≅ F_{g∘ξ′}, natural in F.; `AdicSpace.EtaleSheaf.isIso_iff_stalk` (characterisation): A morphism φ is an isomorphism (resp. mono, epi) iff φ_ξ is for every geometric point ξ.; `AdicSpace.EtaleSheaf.restrictScalars` (functoriality): Change of coefficients along Λ → Λ′: restriction of scalars and its left adjoint Λ′ ⊗_Λ −.; `AdicSpace.ProEtaleSheaf` (structure): Sh(X_proét, Λ) and SheafOfModules R on X_proét (X locally noetherian), defined via the κ-small sites and colimit over κ.; `AdicSpace.ProEtaleSheaf.nuPullback` (functoriality): ν^{-1}: Sh(X_ét, Λ) ⥤ Sh(X_proét, Λ) left adjoint to ν_*, exact.

Unit tests: `EtaleSheaf.test_const_sections_connected` (computation): If U ∈ X_ét has |U| connected, then Γ(U, M_X) ≅ M; if U = U₁ ⊔ U₂ with both nonempty, Γ(U, M_X) ≅ M × M.; `EtaleSheaf.test_empty` (degenerate): For X = ∅ every object of Sh(X_ét, Λ) is a zero object.; `EtaleSheaf.test_int_compat` (compatibility): For Λ = ℤ, Sh(X_ét, ℤ) is equivalent to Mathlib's `Sheaf (smallEtaleTopology X) AddCommGrpCat`, compatibly with sections, so Mathlib's `Sheaf.H` applies.; `EtaleSheaf.test_galois_point` (characterisation): For X = Spa(K, O_K) with K complete nonarchimedean and rank-one plus ring, the stalk at a geometric point over K ⊆ C induces an equivalence of Sh(X_ét, Λ) with discrete Λ[Gal(K^sep/K)]-modules.; `EtaleSheaf.test_rank_one_points_insufficient` (non-example): For X = Spa(C, C⁺) with C algebraically closed and C⁺ of rank 2, the skyscraper at the closed point (i_*Λ for the closed point, a nonzero sheaf) has zero stalk at the rank-one geometric point Spa(C, O_C) → X; only the family of all geometric points detects zero sheaves.

Supporting lemmas:

- `ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small`: `X_ét^aff` is essentially small (cardinality bound from
  the completion bound `|A⟨T/s⟩| ≤ |A|^ℵ₀` and finite étale steps), so `Sh(X_ét, Λ) ≃ Sh(X_ét^aff, Λ)` is Grothendieck abelian by
  `Sheaf.isGrothendieckAbelian_of_essentiallySmall`; `X_proét` is not essentially small and is replaced by `X_proét,κ`.
- `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`: restriction to `U ∈ X_ét` has the exact left adjoint
  `u_!` (so it preserves injectives), `g_*` has the exact left adjoint `g^{-1}`; hence `H^n(U, F)` computed on `X_ét` equals
  `H^n(U_ét, F|_U)`.
- `ClassicalAdicEtaleCohomology:H0/module-and-abelian-cohomology-agree`: injective R-modules are Γ-acyclic as abelian sheaves
  (Cartan's criterion, SGA 4 V 4.3, via the Čech resolution by `j_!R`), so cohomology and `R^q g_*` of R-modules (for example
  `Ô_X`-modules on `X_proét`) agree with those of the underlying abelian sheaves.

### H0.2 Derived categories and derived direct images

`ClassicalAdicEtaleCohomology:H0/derived-direct-image` (construction). `D⁺(X_ét, Λ)`,
`RΓ(U, −) := Γ(U, −).rightDerivedFunctorPlus`, `H^n(U, F) = R^nΓ(U, −)(F)` (Mathlib `Functor.rightDerived`, computed by any injective
resolution), `Rg_* := (g_*).rightDerivedFunctorPlus`, `R^q g_*`, and `Rν_*`, `Rf_proét,*` on the pro-étale sites. Normalisations:
`H⁰(U, F) = F(U)`; `H^n(X, F) ≅ Ext^n(Λ_X, F)` (Mathlib `Abelian.Ext`), which for Λ = ℤ is Mathlib's `Sheaf.H F n`;
`H^n(U, F) = H^n(U_ét, F|_U)`; module cohomology equals abelian cohomology.

API: `AdicSpace.EtaleDPlus` (structure): D⁺(X_ét, Λ) := DerivedCategory.Plus (EtaleSheaf X Λ), a full subcategory of DerivedCategory (EtaleSheaf X Λ).; `AdicSpace.RGamma` (constructor): RΓ(U, −) := (EtaleSheaf.sections U).rightDerivedFunctorPlus : EtaleDPlus X Λ ⥤ DerivedCategory.Plus (ModuleCat Λ).; `AdicSpace.RGamma.isIso_unit_of_injective` (characterisation): On bounded below complexes of injectives the unit Γ(U, I^•) → RΓ(U, I^•) is an isomorphism.; `AdicSpace.etaleCohomology` (constructor): H^n(U, F) := (EtaleSheaf.sections U).rightDerived n F, computed from any injective resolution (isoOfInjectiveResolution).; `AdicSpace.etaleCohomology_zero` (simp): H^0(U, F) ≅ F(U), naturally in F.; `AdicSpace.etaleCohomology.δ` (other): Connecting maps H^n(U, F″) → H^{n+1}(U, F′) for a short exact sequence, with the long exact sequence.; `AdicSpace.etaleCohomology_iso_ext` (compatibility): H^n(X, F) ≅ Ext^n(Λ_X, F) (Mathlib Abelian.Ext).; `AdicSpace.etaleCohomology_iso_sheafH` (compatibility): For Λ = ℤ, H^n(X, F) ≅ Sheaf.H F n.; `AdicSpace.etaleCohomology_restrict` (compatibility): H^n(U, F) ≅ H^n(U_ét, F|_U) (ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives).; `AdicSpace.Rpushforward` (constructor): Rg_* := (EtaleSheaf.pushforward g).rightDerivedFunctorPlus : EtaleDPlus X′ Λ ⥤ EtaleDPlus X Λ.; `AdicSpace.higherDirectImage` (constructor): R^q g_* F := (EtaleSheaf.pushforward g).rightDerived q F; R^0 g_* = g_*.; `AdicSpace.higherDirectImage_iso_sheafify` (characterisation): R^q g_* F is the sheafification of U ↦ H^q(U ×_X X′, F) (ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification).; `AdicSpace.Rpushforward_comp` (functoriality): R(h ∘ g)_* ≅ Rh_* ∘ Rg_* (ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence).; `AdicSpace.RNu` (constructor): Rν_* := ν_*.rightDerivedFunctorPlus : D⁺(X_proét, Λ) ⥤ D⁺(X_ét, Λ) for X locally noetherian, and R^qν_*.; `AdicSpace.RGamma_Rpushforward` (compatibility): RΓ(X, Rg_* K) ≅ RΓ(X′, K), naturally in K ∈ D⁺(X′_ét, Λ).

Unit tests: `etaleCohomology_test_injective` (degenerate): If I ∈ Sh(X_ét, Λ) is injective then H^n(U, I) = 0 for every U ∈ X_ét and n > 0; H^n(∅, F) = 0 for all n.; `etaleCohomology_test_galois` (computation): For X = Spa(K, O_K), K complete nonarchimedean with rank-one plus ring, H^n(X, F) ≅ H^n_cont(Gal(K^sep/K), F_ξ) (Mathlib `continuousCohomology` of the discrete module F_ξ).; `etaleCohomology_test_sheafH` (compatibility): For Λ = ℤ, H^n(X, F) ≅ Mathlib `Sheaf.H F n` naturally in F, and H^0(X, F) ≅ F(X) is `Sheaf.H.equiv₀`.; `RGamma_test_injective_complex` (characterisation): For a bounded below complex I^• of injectives, the unit Γ(U, I^•) → RΓ(U, I^•) is an isomorphism in D⁺(Mod_Λ).; `etaleCohomology_test_not_coherent` (non-example): For X = Spa(ℚ_p, ℤ_p) (p odd), H^1(X, ℤ/p) ≠ 0 while H^1(X_ét, O_{X_ét}) = 0; étale cohomology with torsion coefficients is not computed by the rational acyclicity of O.

- `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification` (lemma; PadicHodgeTheory P7 request): for a morphism of sites
  induced by a continuous finite-limit-preserving functor u (base change `g_ét`, the projection ν, pro-étale base change),
  `R^q f_*F` is the sheafification of `U ↦ H^q(u(U), F)`. In particular `R^qν_*F` is the sheafification of `U ↦ H^q(U, F)` with
  U regarded in `X_proét` (Scholze, Corollary 3.17 (i), proof).
- `ClassicalAdicEtaleCohomology:H0/ordinary-vs-enhanced-ext-comparison` (comparison): `Ext^n(F, G) ≅ Hom_D(F, G[n]) ≅ Hom_{D⁺}(F, G[n])
  ≅ π₀ Map_𝒟(F, G[n])` for E1's enhancement 𝒟 (whose homotopy category is Mathlib's `DerivedCategory`), and `RΓ`, `Rg_*`, `Rν_*` on
  `D⁺` agree with E1's enhanced functors because bounded-below complexes of injectives are K-injective
  (`CochainComplex.isKInjective_of_injective`). Every classical `D⁺` statement of H0–H5 is thereby a statement about E1's objects.

### H0.3 Spectral sequences on the classical sites

- `ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence` (theorem). For `g: X′ → X`, `h: X → X″`: `g_*` preserves injectives,
  `R(h∘g)_* ≅ Rh_* ∘ Rg_*` on `D⁺`, and `E₂^{pq} = R^p h_* R^q g_* F ⇒ R^{p+q}(h∘g)_* F`, `H^p(X, R^q g_*F) ⇒ H^{p+q}(X′, F)`; the same
  for ν and pro-étale direct images, with `Rf_ét,* ∘ Rν_{X,*} ≅ Rν_{Y,*} ∘ Rf_proét,*`.
- `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison` (theorem). For a covering 𝔘 of U in `X_ét` or `X_proét,κ`:
  `E₂^{pq} = Ȟ^p(𝔘, ℋ^q(F)) ⇒ H^{p+q}(U, F)`, the edge map an isomorphism in degree 0, injective in degree 1, and an isomorphism in
  all degrees under Leray acyclicity; the acyclic-basis comparison, with `B = X_ét^aff` and the test reduced to rational coverings
  and single faithfully finite étale maps (Kedlaya–Liu 8.2.20–8.2.21).
- `ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology` (lemma). On G-pfsets with corrected coverings,
  `H^i(pt, F_M) ≅ H^i_cont(G, M)` (Scholze 3.7 (iii)); `G → pt` is a covering by the erratum.
- `ClassicalAdicEtaleCohomology:H0/cartan-leray-spectral-sequence` (theorem; PadicHodgeTheory P7 request). (a) For a finite étale
  Galois cover `U → X` with group G, `H^p(G, H^q(U, F)) ⇒ H^{p+q}(X, F)`. (b) For a pro-finite-étale G-torsor `Ṽ → V` in
  `X_proét` with V qcqs, the Čech form `E₁^{pq} = H^q(Ṽ × G^p, F) ⇒ H^{p+q}(V, F)`, and `E₂^{pq} = H^p_cont(G, H^q(Ṽ, F))` under
  the hypothesis (★) `LC(S, H^q(Ṽ, F)) ≅ H^q(Ṽ × S, F)` for profinite S; (★) holds for `F = ν^*F′`. Consumers with completed
  coefficients supply (★) for their topology.

### H0.4 Pro-étale and étale cohomology

- `ClassicalAdicEtaleCohomology:H0/proetale-cohomology-continuity` (lemma, Scholze Lemma 3.16). For X locally noetherian, F on
  `X_ét` and `U = lim U_j` qcqs in `X_proét`: `colim_j H^i(U_j, F) ≅ H^i(U, ν^*F)`. The proof reduces, by transfinite induction along
  the towers of the corrected coverings, to étale coverings at a finite stage.
- `ClassicalAdicEtaleCohomology:H0/proetale-etale-comparison` (theorem, Scholze Corollary 3.17). `F → Rν_*ν^*F` is an isomorphism,
  so `H^i(X_ét, F) = H^i(X_proét, ν^*F)` and `ν^*` is fully faithful on `D⁺`; for qcqs `f: X → Y`,
  `ν_Y^* Rf_ét,* F ≅ Rf_proét,* ν_X^* F`. No statement is made for non-quasi-compact f such as boundary complements.

### H0.5 Affinoid-local descriptions

- `ClassicalAdicEtaleCohomology:H0/affine-local-description` (theorem). Restriction to `X_ét^aff` is an equivalence of sheaf and
  `D⁺` categories; on `X = Spa(A, A⁺)` étale sheaves are functors on the complete pairs reached by rational localisations and finite
  étale extensions, with descent for rational coverings and faithfully finite étale maps; restriction commutes with derived direct
  image, `(Rg_*K)|_V ≅ R(g_V)_*(K|)`; on qcqs objects cohomology is Čech cohomology of good affinoid coverings and commutes with
  filtered colimits (the étale topos of a qcqs space is coherent).
- `ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles` (theorem, Kedlaya–Liu 8.2.22). For A complete strongly
  sheafy Tate and M finite projective, `M̃_ét: Spa(B, B⁺) ↦ M ⊗_A B` is a sheaf on `X_ét` with `H^i(Y_ét, M̃_ét) = 0` (i > 0) on
  every basis object; vector bundles on `X_an` and `X_ét` correspond. Acceptance: `H¹(X_ét, O) = 0` but `H¹(Spa(ℚ_p)_ét, ℤ/p) ≠ 0`.

### H0.6 Subsets, supports and extension by zero

`ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site` (construction). For `S ⊆ |X|`, `(X, S)_ét := (X_ét, J_S)` where a sieve
on `u: U → X` covers iff its images cover `u^{-1}(S)`. It gives `i_S: (X, S)_ét → X_ét` with `i_S^{-1}` exact (J_S-sheafification)
and `i_{S,*}` the inclusion; geometric points supported in S form a conservative family of points; `S = |X|` gives `X_ét`, `S = ∅`
the trivial topos, `S = |W|` for an open W gives `W_ét`. With S convex and locally pro-constructible, `(X, S)` is a pseudo-adic
space in Huber's sense; closed complements and constructible strata are the cases used.

API: `AdicSpace.PseudoAdicSite` (structure): The site (X_ét, J_S) attached to X and S ⊆ |X|.; `AdicSpace.PseudoAdicSite.topology` (data): The Grothendieck topology J_S on X_ét.; `AdicSpace.PseudoAdicSite.mem_topology_iff` (characterisation): A sieve R on U is J_S-covering iff u^{-1}(S) ⊆ ⋃_{f ∈ R} f(|V|).; `AdicSpace.PseudoAdicSite.le_topology` (relation): smallEtaleTopology X ≤ J_S.; `AdicSpace.PseudoAdicSite.incl` (functoriality): i_S^{-1} (J_S-sheafification, exact) ⊣ i_{S,*} (inclusion of J_S-sheaves).; `AdicSpace.PseudoAdicSite.point` (constructor): The point of (X, S)_ét attached to a geometric point with support in S.; `AdicSpace.PseudoAdicSite.isConservativeFamily` (characterisation): Geometric points with support in S form a conservative family of points.; `AdicSpace.PseudoAdicSite.stalk_incl` (simp): (i_S^{-1}F)_ξ = F_ξ for ξ supported in S.; `AdicSpace.PseudoAdicSite.equivOpen` (equivalence): Sh((X, |W|)_ét) ≃ Sh(W_ét) for an open subspace W.; `AdicSpace.PseudoAdicSite.map` (functoriality): The morphism of sites (X′, S′)_ét → (X, S)_ét for g: X′ → X with S′ ⊆ g^{-1}(S), with map_comp.; `AdicSpace.PseudoAdicSite.IsPseudoAdic` (other): Huber's conditions on S: convex and locally pro-constructible; satisfied by locally closed constructible S.

Unit tests: `PseudoAdicSite.test_univ` (degenerate): For S = |X|, (X, S)_ét = X_ét and i_S is the identity; for S = ∅ every sheaf on (X, S)_ét is a terminal object.; `PseudoAdicSite.test_open` (compatibility): For S = |W| with W ⊆ X open, restriction gives Sh((X, S)_ét, Λ) ≃ Sh(W_ét, Λ), compatibly with i_S^{-1} and W → X.; `PseudoAdicSite.test_closed_point` (computation): For X = Spa(C, C⁺) (C algebraically closed, C⁺ of rank 2) and S the closed point, F ↦ F_s is an equivalence Sh((X, S)_ét, Λ) ≃ Mod_Λ.; `PseudoAdicSite.test_not_adic` (non-example): For the closed unit disc X and Z = X ∖ {|T| ≤ |p|}, Z is closed, infinite and not open (the disc is connected), so it is the underlying set of no open adic subspace and of no Zariski-closed adic subspace; i_Z^{-1} is not restriction to an adic subspace.

`ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero` (construction). `u_!` for `u: U → X` étale (left adjoint of `u^{-1}`,
exact, `(u_!G)_ξ = ⊕_{ū} G_ū`, `u_! ≅ u_*` for finite étale u); for an open `j: U ⊆ X` with closed complement Z and
`i: (X, Z)_ét → X_ét`: `j^{-1}j_! = id = j^{-1}j_*`, `i^{-1}i_* = id`, `j^{-1}i_* = 0`, `i^{-1}j_! = 0`; sections with support
`ℋ_Z`, `Γ_Z`, `i^!` (right adjoint of `i_*`), `RΓ_Z`, `H^n_Z`; extension by zero `i_{T,!}` from locally closed `T = U′ ∩ Z′`.

API: `AdicSpace.EtaleSheaf.extendByZero` (constructor): u_!: Sh(U_ét, Λ) ⥤ Sh(X_ét, Λ) for u: U → X étale.; `AdicSpace.EtaleSheaf.extendByZeroAdj` (universal-property): u_! ⊣ u^{-1}.; `AdicSpace.EtaleSheaf.extendByZero_exact` (instance): u_! preserves finite limits and colimits.; `AdicSpace.EtaleSheaf.stalk_extendByZero` (simp): (u_!G)_ξ ≅ ⊕_{lifts ū of ξ} G_ū; for an open immersion, G_ξ or 0 according as supp ξ ∈ U.; `AdicSpace.EtaleSheaf.extendByZero_iso_pushforward_of_finiteEtale` (compatibility): u_! ≅ u_* for u finite étale.; `AdicSpace.EtaleSheaf.restrict_extendByZero` (simp): j^{-1}j_! ≅ id for an open immersion j.; `AdicSpace.EtaleSheaf.closedRestrict` (constructor): i^{-1}: Sh(X_ét, Λ) ⥤ Sh((X, Z)_ét, Λ) and i_*, for the closed complement Z of an open U.; `AdicSpace.EtaleSheaf.sectionsWithSupport` (constructor): ℋ_Z(F) = ker(F → j_*j^{-1}F), Γ_Z(X, F), and i^! = i^{-1}ℋ_Z with i_* ⊣ i^!.; `AdicSpace.cohomologyWithSupport` (constructor): H^n_Z(X, F) := H^n(RΓ_Z(X, F)), RΓ_Z the right derived functor of Γ_Z on D⁺.; `AdicSpace.EtaleSheaf.extendByZeroLocallyClosed` (constructor): i_{T,!} for T = U′ ∩ Z′ locally closed, independent of the presentation.; `AdicSpace.EtaleSheaf.closedRestrict_extendByZero` (simp): i^{-1}j_! = 0 and j^{-1}i_* = 0.

Unit tests: `extendByZero_test_disc` (computation): For the quasi-compact open j: U = {|T| ≤ |p|} ⊆ X = Spa(ℚ_p⟨T⟩), Γ(X, j_!Λ) = 0 and Γ(X, j_*Λ) ≅ Λ.; `extendByZero_test_univ` (degenerate): For j = id_X, j_! = id and Z = ∅; for U = ∅, j_! = 0 and i_* i^{-1} = id.; `extendByZero_test_sheafPullback` (compatibility): u_! is naturally isomorphic to Functor.sheafPullback (Over.forget U) with values in ModuleCat Λ under U_ét ≃ X_ét/U, and agrees with the j_! of AdicSpacesPartII:R4/boundary-complement-restriction for the boundary complement of a smooth pair.; `extendByZero_test_stalk_boundary` (non-example): For U = {|T| ≤ |p|} in the closed disc and the rank-two point x ∉ U in the closure of U (a specialisation of the Gauss point of radius |p|), (j_!Λ)_x = 0 but (j_*Λ)_x ≅ Λ, so j_! ≠ j_* although U is quasi-compact.; `extendByZero_test_adjunction` (characterisation): Hom(u_!G, F) ≅ Hom(G, u^{-1}F), naturally in G and F; i^! is right adjoint to i_*.

- `ClassicalAdicEtaleCohomology:H0/localisation-sequence` (lemma). Stalks of `j_!` and `i_*`; the exact sequence
  `0 → j_!j^{-1}F → F → i_*i^{-1}F → 0`; the triangles `j_!j^{-1}K → K → i_*i^{-1}K →` and `i_*Ri^!K → K → Rj_*j^{-1}K →`; the long
  exact sequence `⋯ → H^n_Z(X, K) → H^n(X, K) → H^n(U, K) → H^{n+1}_Z(X, K) → ⋯`.

### H0.7 Local systems, Tate twists and constructible sheaves

`ClassicalAdicEtaleCohomology:H0/torsion-local-systems` (definition). F is locally constant if some étale covering trivialises it;
torsion local systems are locally constant sheaves of free modules of finite rank over a torsion ring; lisse ℤ_ℓ-sheaves are
pro-systems `(L_m)` with `L_{m+1}/ℓ^m ≅ L_m` up to pro-isomorphism (Scholze Definition 8.1), and lisse `Ẑ_ℓ`-sheaves live on
`X_proét`. The same definitions apply on pseudo-adic sites.

API: `AdicSpace.EtaleSheaf.IsLocallyConstant` (structure): F is locally constant: there is an étale covering on whose members F is constant.; `AdicSpace.EtaleSheaf.IsLocallyConstant.ofFiniteType` (structure): Local values finitely generated Λ-modules.; `AdicSpace.TorsionLocalSystem` (structure): The full subcategory of locally constant sheaves with local values free of finite rank, for Λ with nΛ = 0.; `AdicSpace.EtaleSheaf.isLocallyConstant_const` (example): Constant sheaves M_X are locally constant.; `AdicSpace.EtaleSheaf.IsLocallyConstant.pullback` (functoriality): g^{-1} preserves local constancy (and finite type, and rank).; `AdicSpace.EtaleSheaf.IsLocallyConstant.restrict` (functoriality): Restriction to U ∈ X_ét and to pseudo-adic sites preserves local constancy.; `AdicSpace.EtaleSheaf.IsLocallyConstant.kernel` (other): Kernels, cokernels and extensions of locally constant sheaves of finite type over noetherian Λ are locally constant of finite type.; `AdicSpace.EtaleSheaf.IsLocallyConstant.tensor` (other): F ⊗_Λ G and Hom_Λ(F, G) are locally constant of finite type.; `AdicSpace.EtaleSheaf.IsLocallyConstant.stalk_iso` (relation): On connected X all stalks of a locally constant sheaf are isomorphic (specialisation maps are isomorphisms).; `AdicSpace.EtaleSheaf.IsLocallyConstant.equivFiniteEtale` (equivalence): Locally constant sheaves of finite sets ≃ finite étale X-spaces.; `AdicSpace.EtaleSheaf.IsLocallyConstant.equivPiOneModules` (equivalence): For X connected with geometric point ξ: torsion local systems of finite Λ-modules ≃ finite Λ-modules with continuous π₁(X, ξ)-action.; `AdicSpace.LisseSheaf` (structure): Lisse ℤ_ℓ-sheaves on X_ét (inverse systems, Scholze Definition 8.1) and lisse Ẑ_ℓ-sheaves on X_proét.

Unit tests: `IsLocallyConstant.test_galois_point` (computation): For X = Spa(K, O_K), F ↦ F_ξ is an equivalence from torsion local systems of finite Λ-modules to finite Λ-modules with continuous Gal(K^sep/K)-action.; `IsLocallyConstant.test_field_pair_constant` (degenerate): On X = Spa(C, C⁺) with C algebraically closed (C⁺ of any rank) every locally constant sheaf is constant: F ≅ (F_ξ)_X.; `IsLocallyConstant.test_analytification` (compatibility): For a scheme Y locally of finite type over a complete nonarchimedean field and a locally constant sheaf F on Y_ét, the pullback along the analytification morphism of sites (AdicSpacesPartII:R4/analytification-etale-site) is locally constant with the same stalks.; `IsLocallyConstant.test_extendByZero` (non-example): For the quasi-compact open j: U = {|T| ≤ |p|} of the (connected) closed unit disc, j_!Λ is constructible but not locally constant: its stalks are Λ at geometric points supported in U and 0 at those supported in the nonempty complement, whereas a locally constant sheaf on a connected space has isomorphic stalks.; `IsLocallyConstant.test_representable` (characterisation): A sheaf of sets with finite stalks is locally constant iff it is representable by a finite étale X-space (ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers).

- `ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers` (lemma). Locally constant sheaves of finite sets are
  exactly the sheaves `h_Y` of finite étale X-spaces; for X connected with geometric point ξ they are the finite continuous
  `π₁(X, ξ)`-sets (A1's Galois category), torsion local systems of finite Λ-modules are finite continuous `Λ[π₁]`-modules, and
  `H¹(X, G_X)` classifies finite étale G-torsors. Effectivity of the descent datum uses rational descent (A1) and finite projective
  descent along finite étale maps (R3) with étaleness detected by the trace pairing.

`ClassicalAdicEtaleCohomology:H0/tate-twists` (construction). For n invertible on X: `μ_n = ker(x ↦ x^n on G_m)`, with
`μ_n(U) = rootsOfUnity n (O(U))`, a rank-one local system over ℤ/n trivialised by the cyclotomic cover; `Λ(r)` and `F(r)` for a
ℤ/n-algebra Λ and r ∈ ℤ; `ℤ_ℓ(1) = (μ_{ℓ^m})_m` and `Ẑ_ℓ(1) = lim ν^*μ_{ℓ^m}` on `X_proét` with `F(1) = F ⊗ Ẑ_ℓ(1)` (Scholze
Proposition 6.7); canonical isomorphisms `Λ(r) ⊗ Λ(s) ≅ Λ(r+s)`, `g^{-1}(F(r)) ≅ (g^{-1}F)(r)`, `(Rg_*K)(r) ≅ Rg_*(K(r))`;
`(μ_n)_ξ = μ_n(C)`.

API: `AdicSpace.muN` (constructor): μ_n on X_ét for n invertible on X: the kernel of the n-th power map of G_m.; `AdicSpace.muN_apply` (simp): μ_n(U) = rootsOfUnity n (O_U(U)).; `AdicSpace.muN.isLocallyConstant` (other): μ_n is a torsion local system of rank one over ℤ/n.; `AdicSpace.muN.equivOfPrimitiveRoot` (equivalence): A primitive n-th root of unity in O(X) gives μ_n ≅ ℤ/n on X_ét.; `AdicSpace.EtaleSheaf.twist` (constructor): F(r) := F ⊗_Λ Λ(r) for Λ a ℤ/n-algebra and r ∈ ℤ, on sheaves and on D⁺.; `AdicSpace.EtaleSheaf.twistAdd` (relation): F(r)(s) ≅ F(r + s) and Λ(r) ⊗ Λ(s) ≅ Λ(r + s).; `AdicSpace.EtaleSheaf.twist_pullback` (compatibility): g^{-1}(F(r)) ≅ (g^{-1}F)(r).; `AdicSpace.EtaleSheaf.twist_Rpushforward` (compatibility): (Rg_*K)(r) ≅ Rg_*(K(r)).; `AdicSpace.EtaleSheaf.stalk_muN` (simp): (μ_n)_ξ ≅ μ_n(C) for ξ: Spa(C, C⁺) → X.; `AdicSpace.ZellOne` (constructor): ℤ_ℓ(1) = (μ_{ℓ^m})_m as a lisse ℤ_ℓ-sheaf, and Ẑ_ℓ(1) = lim ν^*μ_{ℓ^m} on X_proét.; `AdicSpace.muN_analytification` (compatibility): Compatibility with the scheme μ_n under the analytification morphism of sites.

Unit tests: `muN_test_stalk` (computation): At a geometric point ξ: Spa(C, C⁺) → X, (μ_n)_ξ ≅ μ_n(C) ≅ ℤ/n (after choosing a primitive root in C).; `twist_test_zero` (degenerate): Λ(0) = Λ, F(0) = F, and μ_1 is the trivial sheaf.; `muN_test_rootsOfUnity` (compatibility): For U ∈ X_ét, μ_n(U) = rootsOfUnity n (O_U(U)) (Mathlib); and λ_X^{-1}μ_{n,Y} ≅ μ_{n,Y^ad} for the analytification of a scheme Y locally of finite type over K.; `twist_test_add` (characterisation): Λ(r) ⊗_Λ Λ(s) ≅ Λ(r + s) canonically, and F(r)(s) ≅ F(r + s).; `kummer_test_char_p` (non-example): For K of characteristic p and X = Spa(K, O_K), the p-th power map on G_m is not surjective as a map of étale sheaves, so there is no Kummer sequence for n = p; twists are defined only for n invertible on X.

- `ClassicalAdicEtaleCohomology:H0/kummer-sequence` (lemma). For n invertible on X, `1 → μ_n → G_m → G_m → 1` is exact on `X_ét`
  (the cover `B[T]/(T^n − f)` is finite étale and faithfully flat), with `0 → O(X)^×/n → H¹(X, μ_n) → Pic(X)[n] → 0` using Hilbert
  90 `H¹(X_ét, G_m) = Pic(X)` (from H0.5). For n = p on a characteristic-p space the Kummer sequence fails.

`ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves` (definition, planet *Constructible sheaf*). On a qcqs locally
noetherian analytic X and for Λ noetherian, F is constructible if there is a finite partition of |X| into locally closed
constructible subsets `S_k` (finite Boolean combinations of quasi-compact opens) with `i_{S_k}^{-1}F` locally constant of finite
type on the pseudo-adic site `(X, S_k)_ét`; for general locally noetherian X, constructibility is required on quasi-compact opens;
`D^b_c` consists of bounded complexes with constructible cohomology sheaves. This is Huber's classical notion (all points, strata not
adic subspaces), distinct from Bhatt–Hansen's Zariski-constructibility: `j_!Λ` for a disc of radius 1/2 in the disc of radius 1 is
constructible, not Zariski-constructible, and the skyscraper at a classical point is not constructible.

API: `AdicSpace.IsConstructibleSubset` (structure): Finite Boolean combinations of quasi-compact opens of |X|.; `AdicSpace.EtaleSheaf.IsConstructible` (structure): F is constructible: a finite partition into locally closed constructible subsets on whose pseudo-adic sites F is locally constant of finite type.; `AdicSpace.EtaleSheaf.IsConstructible.ofIsLocallyConstant` (constructor): Locally constant of finite type ⇒ constructible.; `AdicSpace.EtaleSheaf.IsConstructible.refine` (other): Constructibility is preserved under refinement of the stratification.; `AdicSpace.EtaleSheaf.IsConstructible.kernel` (other): Kernels, cokernels, images and extensions of constructible sheaves are constructible (abelian subcategory).; `AdicSpace.EtaleSheaf.IsConstructible.pullback` (functoriality): g^{-1} of a constructible sheaf is constructible for qcqs morphisms of qcqs locally noetherian spaces.; `AdicSpace.EtaleSheaf.IsConstructible.extendByZero` (functoriality): j_! preserves constructibility for quasi-compact open immersions and u_! for qcqs étale u.; `AdicSpace.EtaleSheaf.IsConstructible.pushforward_finiteEtale` (functoriality): π_* preserves constructibility for finite étale π.; `AdicSpace.EtaleSheaf.IsConstructible.stalk_fg` (projection): Every stalk of a constructible sheaf is a finitely generated Λ-module.; `AdicSpace.EtaleSheaf.IsConstructible.colimit` (characterisation): Every sheaf of Λ-modules is a filtered colimit of constructible subsheaves.; `AdicSpace.DbConstructible` (structure): D^b_c(X_ét, Λ): bounded complexes with constructible cohomology sheaves, a thick triangulated subcategory.

Unit tests: `IsConstructible.test_localSystem` (computation): A locally constant sheaf of finitely generated Λ-modules is constructible, with the one-stratum partition.; `IsConstructible.test_zero` (degenerate): The zero sheaf is constructible; on X = ∅ every sheaf is constructible (empty partition).; `IsConstructible.test_extendByZero_disc` (compatibility): For the qcqs open j of the disc of radius 1/2 in the disc of radius 1, j_!Λ is constructible, and it is not Zariski-constructible in the sense of Bhatt–Hansen.; `IsConstructible.test_skyscraper` (non-example): The skyscraper sheaf i_{x,*}Λ at a classical point x of the closed unit disc over ℂ_p is not constructible (Bhatt–Hansen, footnote 2): its stalk is Λ at x and 0 at every other point, while every constructible subset containing x contains other points (otherwise the punctured disc U ∖ {x}, for a rational neighbourhood U of x, would be quasi-compact).; `IsConstructible.test_filtered_colimit` (characterisation): Every sheaf of Λ-modules on a qcqs X is a filtered colimit of constructible sheaves (ClassicalAdicEtaleCohomology:H0/torsion-sheaf-colimit-of-constructible).

- `ClassicalAdicEtaleCohomology:H0/constructible-sheaves-stability` (lemma): abelian subcategory stable under extensions and ⊗;
  `g^{-1}` for qcqs g; `u_!` for qcqs étale u (in particular quasi-compact open immersions); `π_*` for finite étale π; finitely
  generated stalks.
- `ClassicalAdicEtaleCohomology:H0/torsion-sheaf-colimit-of-constructible` (lemma): every sheaf of Λ-modules on a qcqs X is the
  filtered colimit of its constructible subsheaves (presentation by sums of `u_!Λ`), so `H^q(X, −)` and `R^q g_*` commute with
  filtered colimits and torsion statements reduce to constructible ones.

### H0.8 Geometric stalks at field pairs

`ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs` (theorem). For `S = Spa(C, C⁺)`, C algebraically closed and `C⁺` of
any rank: `Γ(S, F) = F_{id}` (the neighbourhood category of `id_S` has an initial object), Γ is exact and colimit-preserving,
`H^n(S, F) = 0` for n > 0; étale maps to S are local isomorphisms, so `Sh(S_ét, Λ) ≃ Sh(|S|, Λ)`, with |S| the chain of valuation
rings between `C⁺` and `O_C`; for a geometric point ξ of X, `F_ξ ≅ Γ(Spa(C, C⁺), ξ^{-1}F)`. For rank ≥ 2 the skyscraper at the
closed point is invisible to rank-one points. Non-example: over a non-algebraically closed K, `H¹` is Galois cohomology.

### H0.9 Huber tilde-limits

`ClassicalAdicEtaleCohomology:H0/huber-tilde-limit` (definition, planet *Huber tilde-limit*). For a small cofiltered system `(X_i)`
of analytic adic spaces with qcqs transition maps (Scholze–Weinstein 2.4.1 generality: the `X_i` need not be qcqs) and a
compatible family `φ_i: X → X_i` from an analytic adic space X: `X ∼ lim X_i` iff

```text
(a) |X| → lim_i |X_i|  is a homeomorphism          (IsTildeLimit.Homeomorph)
(b) every x ∈ X has an affinoid neighbourhood U with
    E_U := ⋃_{i, V ⊇ φ_i(U) open} im(O_{X_i}(V) → O_X(U))  dense in O_X(U)   (IsTildeLimit.Dense)
```

Huber's pseudo-adic version (Definition 2.4.2) asks (a) for the distinguished subsets and (b) at their points; it agrees with (a),
(b) for `(X, |X|)`. The perfectoid tilde-limit of PerfectoidSpaces P7 is this predicate for perfectoid X; Scholze's residue-field
variant `∼′` is P7's.

API: `AdicSpace.IsTildeLimit` (structure): The predicate X ∼ lim X_i on a compatible family φ from X to a cofiltered system with qcqs transition maps.; `AdicSpace.IsTildeLimit.Homeomorph` (structure): Condition (a): |X| → lim |X_i| is a homeomorphism.; `AdicSpace.IsTildeLimit.Dense` (structure): Condition (b): local density of ⋃ im(O_{X_i}(V) → O_X(U)) for an affinoid neighbourhood U of each point.; `AdicSpace.IsTildeLimit.homeomorph` (projection): The homeomorphism |X| ≃ lim |X_i|.; `AdicSpace.IsTildeLimit.dense` (projection): For x ∈ X, an affinoid U ∋ x with E_U dense in O_X(U).; `AdicSpace.IsTildeLimit.mk` (constructor): From proofs of (a) and (b).; `AdicSpace.IsTildeLimit.ofIso` (functoriality): Transport along an isomorphism X ≅ X′ commuting with the cones.; `AdicSpace.IsTildeLimit.reindex` (functoriality): Invariance under an initial change of index category.; `AdicSpace.IsTildeLimit.const` (example): An isomorphism X ≅ X₀ is a tilde-limit of the constant one-object system.; `AdicSpace.IsTildeLimit.spectralSpace` (other): If all X_i are qcqs, |X| is spectral and the φ_i are spectral maps.; `AdicSpace.IsTildeLimit.restrictRational` (functoriality): Restriction to preimages of rational subsets defined at a finite level (ClassicalAdicEtaleCohomology:H0/tilde-limit-density-rational-restriction).; `AdicSpace.IsTildeLimit.ofCompletedColimit` (constructor): The affinoid criterion (ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion).; `PseudoAdicSpace.IsTildeLimit` (compatibility): Huber's pseudo-adic version for qcqs pseudo-adic spaces; agrees with AdicSpace.IsTildeLimit for (X, |X|).

Unit tests: `IsTildeLimit.test_completed_colimit` (computation): For K complete nonarchimedean of residue characteristic p, Spa(K⟨T^{1/p^∞}⟩, K°⟨T^{1/p^∞}⟩) ∼ lim_n Spa(K⟨T^{1/p^n}⟩, K°⟨T^{1/p^n}⟩), the left side being the completed colimit (ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion).; `IsTildeLimit.test_const` (degenerate): For the one-object category and an isomorphism φ: X ≅ X₀, X ∼ X₀.; `IsTildeLimit.test_not_categorical` (non-example): For a complete nonarchimedean field K, Spa(K, K°) ∼ Spa(K[ε]/(ε²), K° + Kε) along K[ε] → K (both spaces are one point and K[ε] → K is surjective), although the two adic spaces are not isomorphic.; `IsTildeLimit.test_density_needed` (non-example): Spa(ℂ_p, O_{ℂ_p}) → Spa(ℚ_p, ℤ_p) (one object) satisfies (a) (both are one point) but not (b) (ℚ_p is not dense in ℂ_p).; `IsTildeLimit.test_topology_needed` (non-example): The closed unit disc D mapped into the first summand of the constant system D ⊔ D satisfies (b) (O(D) × O(D) → O(D) is surjective) but not (a).; `IsTildeLimit.test_huber_compat` (compatibility): For X and all X_i quasi-compact quasi-separated, X ∼ lim X_i iff (X, |X|) ∼ lim (X_i, |X_i|) in the pseudo-adic sense of Huber's Definition 2.4.2.

- `ClassicalAdicEtaleCohomology:H0/spa-of-colimit-huber-pair` (lemma). For a filtered system of Huber pairs with compatible rings and
  finitely generated ideals of definition, `Spa(colim) ≅ lim Spa(A_i, A_i⁺)` (valuations correspond; continuity tested on the ideal
  of definition), rational subsets come from a finite stage, and the completion changes nothing (Wedhorn 7.48, requested from anchor
  Layer 2); for Tate pairs with a compatible pseudouniformiser ϖ one may use the ϖ-adic topology on the plus rings, and
  `lim Spa(A_i, A_i⁺) ≅ Spa(L̂⁺[1/ϖ], L̂⁺)`, `L⁺ = colim A_i⁺`.
- `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion` (theorem; AdicSpacesPartII R5 request). (1) If `(B, B⁺)` is
  the completed colimit of such a system — equivalently (T) B carries the colimit topology, (D) the colimit is dense, (P) `B⁺` is the
  closure of `colim A_i⁺` — then `Spa(B, B⁺) ∼ lim Spa(A_i, A_i⁺)` with global density. (2) In the Tate case it suffices that
  `colim A_i⁺ / ϖ^n ≅ C⁺ / ϖ^n` for all n (**colimit-presented**). (3) Density plus a plus-ring condition alone do not suffice:
  `ℚ_p⟨T⟩ → ℚ_p⟨T/p⟩` has dense image, yet `Spa(ℚ_p⟨T/p⟩, B⁺)` maps onto the closure of `{|T| ≤ |p|}` only.
- `ClassicalAdicEtaleCohomology:H0/tilde-limit-density-rational-restriction` (lemma; PerfectoidSpaces P8 request). If U has the
  density property, so has every rational subset `U ∩ φ_i^{-1}(R_V(T/s))` defined at a finite level; for a globally dense affinoid
  system, `colim O(W_j) → O(W)` is dense for every rational `W_i` at a finite level and `W ∼ lim W_j`. Density for an arbitrary
  affinoid of a tilde-limit is not claimed (gap).
- `ClassicalAdicEtaleCohomology:H0/tilde-limit-base-change` (lemma). Colimit-presented tilde-limits are stable under base change along
  adic maps topologically of finite type or étale (completed tensor products; plus rings compared through "|f| ≤ 1 on Spa"
  (Wedhorn 7.52) and constructible descent in spectral limits), and globally along qcqs morphisms locally of weakly finite type:
  `X ×_Y Spa(C_ξ, C_ξ⁺) ∼ lim X ×_Y V`. The general Scholze–Weinstein 2.4.3 (Huber Remark 2.4.3) is a gap.

### H0.10 Strict localisations, the étale topos of a tilde-limit, continuity

- `ClassicalAdicEtaleCohomology:H0/strict-localisation-tilde-limit` (lemma). With `L = O_{Y_ét,ξ} = colim O(V)`, `L⁺ = colim O⁺(V)`:
  `L⁺` is the preimage of `κ(ξ)⁺`, `m_ξ ⊆ ⋂ ϖ^n L⁺`, `L⁺/ϖ^n ≅ C_ξ⁺/ϖ^n`; so `Spa(C_ξ, C_ξ⁺) ∼ lim_{N(ξ)^aff} V` is colimit-presented,
  `|Spa(C_ξ, C_ξ⁺)| ≅ lim |V|` (A1's strict-localisation clause (b), here without its shrinking step), and `(C_ξ, C_ξ⁺)` is an
  algebraically closed affinoid field whose points are the vertical generisations of the support.
- `ClassicalAdicEtaleCohomology:H0/etale-topos-of-tilde-limit` (lemma, Huber 2.4.4). For locally colimit-presented tilde-limits of
  qcqs spaces, qcqs étale objects, morphisms and coverings descend to a finite stage and the étale topos of X is the projective limit
  of the `X_{i,ét}~`: opens via spectral limits, étale maps via the open-immersion/finite-étale factorisation, finite étale algebras
  via finite presentation, henselianity of plus rings along ϖ (Stacks 0ALJ, 0FWT) and Gabber–Ramero approximation (P3). For
  arbitrary tilde-limits the finite étale step rests on Huber's book (gap).
- `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity` (theorem, planet *Cohomological continuity*; kept from
  the reviewed decomposition). For `X ∼ lim X_i` qcqs with final object 0 whose étale topos is the projective limit (proved for
  colimit-presented tilde-limits), and `F_0` on `X_{0,ét}` with pullbacks `F_i`, F:
  `colim_i H^n(X_i, F_i) → H^n(X, F)` is bijective for n = 0 (sets), n ≤ 1 (groups), all n (abelian sheaves), and for bounded-below
  complexes; the limit-of-topoi input (SGA 4 VI 8.7.7) is requested from D0.

### H0.11 The stalk formula over strict localisations

- `ClassicalAdicEtaleCohomology:H0/stalk-of-higher-direct-image-as-colimit` (lemma): `(R^q g_*F)_ξ = colim_{N(ξ)} H^q(V ×_X X′, F)`,
  over affinoid neighbourhoods; likewise for `R^qν_*`.
- `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation` (theorem, planet *Stalk formula over strict localisations*;
  Huber 2.6.1). For `f: X → Y` qcqs and locally of weakly finite type, a geometric point ξ (C⁺ of any rank) and F on `X_ét`:

```text
(R^n f_* F)_ξ  ≅  H^n( X ×_Y Spa(C_ξ, C_ξ⁺),  F| ),        (Rf_*K)_ξ ≅ RΓ(X ×_Y Y(ξ), K|)
```

  for n = 0 (sets), n ≤ 1 (groups), all n (abelian sheaves), Galois-equivariantly; for the standard geometric point
  `(C_ξ, C_ξ⁺) = (C, C⁺)`; at a rank-one point the strict localisation is a point and the formula is Huber Example 2.6.2. The
  comparison with the fibre over a strictly larger algebraically closed field is H2 (Huber 4.1.1(c)), not H0.

### Service to consumers

- *AdicSpacesPartII R5* (affinoid criterion): served by `huber-tilde-limit-affinoid-criterion` with the topology hypothesis (T) or
  the plus-ring congruence (P2) made explicit; the requested form (density and the plus-ring condition only) is false without it
  (the `ℚ_p⟨T⟩ → ℚ_p⟨T/p⟩` non-example).
- *PerfectoidSpaces P0/P7* (the general tilde-limit and Huber 2.4.6): served by `huber-tilde-limit` (Scholze–Weinstein generality,
  separate predicates) and `tilde-limits-and-cohomological-continuity` (complete for colimit-presented tilde-limits; the general
  Huber case is a gap). The kept node id no longer carries the definition: consumers citing it for the definition should cite
  `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`.
- *PerfectoidSpaces P8* (density of `lim O(V_i)` in `O(V)`): served for rational subsets at a finite level of globally dense
  affinoids; the arbitrary-affinoid form is a gap.
- *PadicHodgeTheory P7* (derived direct images, `R^qν_*` as sheafification, Čech-to-derived, Cartan–Leray, Leray): served by H0.2–H0.4
  for sheaves of modules on étale and pro-étale sites, with the continuous-cohomology form of Cartan–Leray under (★).

### Gaps and source issues

Gaps: Huber 2.4.4 for arbitrary tilde-limits; Huber Remark 2.4.3 in general; identification of the pseudo-adic sites and of
constructibility with Huber's (non-public) definitions; pseudo-adic continuity and stalk formula; density on arbitrary affinoids of a
tilde-limit (P8). Source issues: Scholze–Weinstein Proposition 2.4.2 needs the completion and sheafiness hypotheses (new); Scholze's
Proposition 3.7 (i), Proposition 3.8 and the last sentence of 3.13 (known, erratum).

### Acceptance tests of the stage

1. `H⁰(U, F) = F(U)`; `H^n(X, F) ≅ Sheaf.H F n` for abelian F; `H^n(Spa(K, O_K), F) = H^n_cont(Gal(K^sep/K), F_ξ)`.
2. `H¹(Spa(ℚ_p, ℤ_p)_ét, ℤ/p) ≠ 0 = H¹(Spa(ℚ_p, ℤ_p)_ét, O)`.
3. For `Spa(C, C⁺)` with `C⁺` of rank 2: `H^n = 0` for n > 0, and the skyscraper at the closed point is nonzero with zero rank-one stalk.
4. `Spa(K, K°) ∼ Spa(K[ε]/ε², K° + Kε)` (not an isomorphism); `Spa(ℂ_p) → Spa(ℚ_p)` fails density; `D → D ⊔ D` fails (a).
5. `Spa(K⟨T^{1/p^∞}⟩) ∼ lim Spa(K⟨T^{1/p^n}⟩)` and `colim H^n(Spa(K⟨T^{1/p^n}⟩), F_n) = H^n(Spa(K⟨T^{1/p^∞}⟩), F)` for torsion `F_0`.
6. Stalk formula for a finite étale f: `R^n f_*F = 0` for n > 0; at a rank-one point, the stalk is the cohomology of the geometric fibre.
7. `j_!Λ` for `{|T| ≤ |p|}` in the closed disc: constructible, not locally constant, `Γ(X, j_!Λ) = 0 ≠ Γ(X, j_*Λ)`.
8. `F → Rν_*ν^*F` is an isomorphism; Cartan–Leray for `Spa(L, O_L) → Spa(K, O_K)` is Hochschild–Serre.

**Planets (6):** Étale sheaves of modules; Derived direct image; Constructible sheaf; Huber tilde-limit; Cohomological continuity;
Stalk formula over strict localisations.

<a id="h1-henselian"></a>

## H1:henselian. Henselian pairs and approximation


This stage owns the henselian half of Huber's classical comparison between étale cohomology of
schemes and of adic spaces: henselian f-adic rings and their henselizations, the special and
pro-special subsets of an adic spectrum along which one henselizes, the scheme `Spec A(U)` attached
to a pro-special subset `U`, Gabber's affine analogue of proper base change (Huber 1996,
Lemma 3.2.5) with Huber's Zariski–Riemann argument, and the comparison theorems 3.2.1–3.2.3 and
3.2.9–3.2.12 between `Spec A(U)` and the pseudo-adic space `(Spa A, U)`, together with their
continuity under cofiltered limits. It is one of the four sub-stages that the umbrella
`ClassicalAdicEtaleCohomology:H1` re-exports.

#### Scope and boundaries

- *Henselian pairs* are Mathlib's `HenselianRing A I`. This stage adds the general pair lemmas it
  needs — the equivalent characterisations (Stacks 15.11.6), invariance under the radical, under
  the ideal viewed as a non-unital ring, and under universal homeomorphisms — and does not
  introduce a second notion. Adic completeness and filtered colimits of henselian pairs, the
  henselization of a pair, and the independence of the ring of definition for Tate rings are
  imported from `PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions` and
  `PerfectoidSpaces:P3/henselisation-of-pairs`.
- *Finite étale approximation is not here.* `PerfectoidSpaces:P3/henselian-finite-etale-approximation`
  (Elkik, Gabber–Ramero 5.4.54: `FÉt(R[t⁻¹]) ≃ FÉt(R^∧[t⁻¹])` for `(R, tI)` henselian, and
  `FÉt(A) ≃ FÉt(Â)` for topologically henselian Tate rings) is an early algebraic statement about
  finite étale algebras over a henselian ring and its completion. This stage proves cohomological
  comparisons in all degrees with torsion coefficients between `Spec A(U)` and `(Spa A, U)`; the
  two share only the notion of a henselian f-adic ring, whose Tate case is P3's topologically
  henselian ring (`Huber.IsHenselian.iff_isTopologicallyHenselian`).
- *Strict localisations* of analytic adic spaces at geometric points are
  `AdicEtaleGeometry:A1/strict-localisation`; the stalk formula for morphisms of pseudo-adic spaces
  (Huber 1996, 2.6.1) and the tilde-limit continuity theorem (Huber 1996, 2.4.6) are
  `ClassicalAdicEtaleCohomology:H0`'s. This stage uses them for the comparison morphism to a scheme
  and records the resulting stalk formula over the strict localisations of the scheme.
- *Pseudo-adic spaces* `(X, Σ)` and their étale sites are `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`; the pseudo-adic forms of continuity and of the stalk formula are a gap recorded in H0.
- *Scheme étale cohomology* (constructible approximation, proper and integral base change,
  EGA IV §18) comes from `SchemeAndStackFoundations:SF.2`; noetherian approximation and étale
  continuity of qcqs schemes from `AdicCoefficientsAndComparisons:L2`.
- The Zariski–Riemann application to diamonds (ECD Lemma 19.4) and the exchange map belong to
  `DiamondEtaleCohomology:C5`; the formal/adic comparisons 3.5–3.6 to
  `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`; the proper comparison 3.7.2 to H5; the
  disc and annulus computations (including Huber's Example 3.2.4) to H4.

#### Conventions

- A *Huber ring* is Tau Ceti's `Huber.IsHuberRing` (Huber's f-adic ring); `A°` and `A°°` are
  `powerBoundedSubring A` and its ideal `topologicallyNilpotentIdeal A`. A *henselian datum* of `A`
  is a pair `(B, I)` with `B ⊆ A°` an open subring and `I` an ideal of `B`, open in `A`, contained in
  `A°°`. `A` is *henselian* if `(A°, A°°)` is a henselian pair, equivalently every henselian datum
  is. Completeness is never part of the definition; complete rings are henselian by a theorem.
- Huber's §3.1 works with arbitrary f-adic rings. The comparison theorems of §3.2 carry Huber's
  standing condition: the completion `Â` has a noetherian ring of definition or is a strongly
  noetherian Tate ring (the condition of `AdicSpacesPartII:R0/locally-noetherian-adic-space`), so
  that `Spa(Â, Â⁺)` is an adic space. The affinoid ring `A` itself need not be complete, and this is
  essential for the applications: `A(U)` is built from `A`, not from `Â`.
- *Tracking ideal, topology and plus ring.* The henselization `A^h = A ⊗_D D^h` of a Huber ring
  carries the topology with ring of definition `D^h` and ideal of definition `I·D^h`; for a Huber
  pair the plus ring is `(A⁺)^h = A⁺ ⊗_D D^h`, the integral closure of the image of `A⁺`; completing
  gives back `(Â, Â⁺)`. For a rational subset the henselization `G_A(U)` is a henselian Huber pair
  whose completion is the completed rational localisation with its plus ring. For a pro-special
  subset that is not rational, `A(U)` carries no natural Huber topology and is used as a discrete
  ring (Huber's remark after 3.1.5); its data are the ideal `J^h` and the subring `G^h` of the
  henselized triple.
- Sheaves of sets, of ind-finite groups and of abelian torsion groups are compared in degrees `0`,
  `≤ 1` and all degrees respectively. "Torsion" means every section is killed by a non-zero
  integer; no prime-to-residue-characteristic condition enters this stage.

#### Main results at a glance

```text
(A, I) henselian, F torsion on (Spec A)_et   ⟹   Hⁿ(Spec A, F) ≅ Hⁿ(Spec A/I, F|)           (3.2.5)
K sep. closed, Y = {V ∈ Spv K : E ⊆ V, F ⊆ 𝔪_V}   ⟹   Hⁿ(Y, G) = 0 for n ≥ 1, G torsion
A complete Huber ring   ⟹   (B, I) henselian for every open B ⊆ A°, open I ⊆ B ∩ A°°
U ⊆ Spa A pro-special, Y = Spec A(U)   ⟹   Hⁿ(Y, j*F) ≅ Hⁿ((Spa A, U), i*F)                (3.2.9)
f: X → Spec A lft, proper over the non-open primes near U   ⟹   Hⁿ(X″, F″) ≅ Hⁿ(X′, F′)   (3.2.10)
```

### Henselian pairs

#### Characterisations of henselian pairs

*Node* `henselian-pair-characterisations` (lemma). Let A be a commutative ring and I ⊆ A an ideal. The following are equivalent. (1) Mathlib's `HenselianRing A I`: I ⊆ Jacobson radical of A, and every monic f ∈ A[T] with an a₀ ∈ A such that f(a₀) ∈ I and f′(a₀) is a unit modulo I has a root a with a − a₀ ∈ I. (2) (Stacks Definition 15.11.1) I ⊆ rad(A), and every factorisation f̄ = g₀h₀ modulo I of a monic f ∈ A[T] into monic polynomials generating the unit ideal of (A/I)[T] lifts to a factorisation f = gh into monic polynomials. (3) For every étale A-algebra A′ and every A-algebra map σ: A′ → A/I there is an A-algebra map A′ → A lifting σ. (4) For every finite A-algebra B, reduction B → B/IB is a bijection on idempotents. (5) The same for every integral A-algebra B. (6) (Gabber) I ⊆ rad(A), and every polynomial T^n(T − 1) + a_nT^n + ⋯ + a₁T + a₀ with a₀, …, a_n ∈ I and n ≥ 1 has a root in 1 + I; this root is unique. Lean: `HenselianRing.tfae`, with the named directions `HenselianRing.lift_of_etale`, `HenselianRing.idempotent_bijective_of_finite`, `HenselianRing.of_gabber`.

*Hypotheses.* A commutative, arbitrary (no noetherian or local hypothesis). In (4) and (5) the bijection is between the idempotents of B and those of B/IB.

*Proof.* (1) ⇔ (2): a simple root modulo I is a coprime monic factorisation with a linear factor; conversely a coprime monic factorisation modulo I is realised over an étale A-algebra that is an isomorphism modulo I (Stacks Lemma 15.9.5), so (3) gives it over A; for local rings this is Mathlib `HenselianLocalRing.TFAE`. (2) ⇒ (3) ⇒ (4) ⇒ (5) ⇒ (6) ⇒ (2): the cycle of Stacks Lemma 15.11.6 (Tag 09XI): étale algebras are locally standard étale, idempotents of a ring correspond to its open and closed subsets of the spectrum, an integral algebra is the filtered union of its finite subalgebras, and Gabber's polynomial is the universal instance of lifting the idempotent decomposition of T^n(T − 1) modulo I. Uniqueness in (6): two roots in 1 + I give two lifts of the same idempotent of A[T]/(f) modulo I, which agree by (4).

*Acceptance.* For a local ring (A, 𝔪), (1) ⇔ (3) is Mathlib's HenselianLocalRing.TFAE. Gabber's test detects non-henselian pairs: for (ℤ_(3), 3ℤ_(3)) the polynomial T² − T + 3 = T(T − 1) + 3 has the root (1 + √−11)/2 ≡ 1 mod 3 in ℤ_3 but no root in ℤ_(3) (−11 is not a square in ℚ), so (6) fails, as it must.

*Depends on* elsewhere: `mathlib:HenselianRing`, `mathlib:HenselianLocalRing.TFAE`, `mathlib:Algebra.Etale`, `mathlib:Algebra.IsIntegral`, `mathlib:Ideal.jacobson`.

#### Radical invariance

*Node* `henselian-pair-radical-invariance` (lemma). Let A be a ring and I, J ⊆ A ideals with the same radical (equivalently V(I) = V(J) in Spec A). Then HenselianRing A I ↔ HenselianRing A J. Lean: `HenselianRing.iff_of_radical_eq`.

*Hypotheses.* No hypothesis on A; I and J need not be finitely generated.

*Proof.* For every integral A-algebra B, V(IB) = V(JB) in Spec B, so B/IB and B/JB have the same idempotents (idempotents correspond to open and closed subsets of the spectrum, and the two spectra are the same closed subset of Spec B). Conclude with characterisation (5) of henselian-pair-characterisations (Stacks Tag 09XJ).

*Acceptance.* (ℤ_p, pℤ_p) and (ℤ_p, p²ℤ_p) are both henselian. For a ring of definition A₀ of a Huber ring with ideal of definition J₀: (A₀, J₀) is henselian iff (A₀, A₀ ∩ A°°) is, because an element of A₀ is topologically nilpotent iff some power lies in J₀, i.e. √J₀ = A₀ ∩ A°°.

*Depends on* this stage: `henselian-pair-characterisations`; elsewhere: `mathlib:HenselianRing`, `mathlib:Ideal.radical`.

#### The ideal as a non-unital ring

*Node* `henselian-pair-shared-ideal-invariance` (lemma). Let φ: A → A′ be a ring homomorphism, I ⊆ A and I′ ⊆ A′ ideals such that φ restricts to a bijection I → I′ (so I ≅ I′ as non-unital rings). Then HenselianRing A I ↔ HenselianRing A′ I′. In particular, if R ⊆ R′ are rings and J is an ideal of both R and R′, then (R, J) is henselian iff (R′, J) is. Lean: `HenselianRing.iff_of_bijOn_ideal`.

*Hypotheses.* φ need not be injective or surjective; only its restriction I → I′ is assumed bijective.

*Proof.* Jacobson condition: I ⊆ rad(A) iff for every x ∈ I there is y ∈ I with (1 + x)(1 + y) = 1, i.e. x + y + xy = 0 (Gabber–Ramero Claim 5.1.3); this equation lives in the non-unital ring I and transfers along φ|_I. Gabber's criterion (henselian-pair-characterisations (6)): writing a root as 1 + β, the equation (1 + β)^n β + Σ a_i(1 + β)^i = 0 for a_i ∈ I is a polynomial identity with integer coefficients all of whose terms lie in I; existence and uniqueness of β ∈ I therefore depend only on the non-unital ring I and transfer along φ|_I (Gabber–Ramero Remark 5.1.9(ii); Bhatt, proof of Lemma 7.2.3(3)).

*Acceptance.* For rings of definition B₀ ⊆ B₀′ of a Tate ring with ϖⁿB₀′ ⊆ B₀, the ideal ϖ^{n+1}B₀′ is common to both, so (B₀, ϖB₀) is henselian iff (B₀′, ϖB₀′) is (with henselian-pair-radical-invariance). (ℤ + pℤ_p⟨T⟩, pℤ_p⟨T⟩) is a henselian pair, because pℤ_p⟨T⟩ is also an ideal of the p-adically complete ring ℤ_p⟨T⟩.

*Depends on* this stage: `henselian-pair-characterisations`; elsewhere: `mathlib:HenselianRing`, `mathlib:Ideal.jacobson`.

#### Universal homeomorphisms

*Node* `henselian-pair-universal-homeomorphism-invariance` (lemma). Let φ: B → R be a ring homomorphism such that Spec(φ): Spec R → Spec B is a universal homeomorphism (equivalently: φ is integral and Spec(φ) is universally injective and surjective, Stacks Tag 04DF), and let I ⊆ B be an ideal. Then HenselianRing B I ↔ HenselianRing R (I·R). Lean: `HenselianRing.iff_of_isUniversalHomeomorph`.

*Hypotheses.* No finiteness hypothesis on φ.

*Proof.* ⇒: φ is integral, and integral base change preserves henselian pairs (Stacks Tag 09XK; Gabber–Ramero Remark 5.1.9(v)). ⇐: by the topological invariance of the étale site (Stacks Tag 04DZ) base change V ↦ V ×_{Spec B} Spec R is an equivalence between étale B-schemes and étale R-schemes, compatible with the equivalence over the universal homeomorphism Spec(R/IR) → Spec(B/I). An étale B-algebra B′ with a section over B/I thus corresponds to an étale R-algebra with a section over R/IR; the latter lifts by characterisation (3) of henselian-pair-characterisations applied to (R, IR), and the lift descends (Bhatt, proof of Lemma 7.2.3(3)).

*Acceptance.* A surjection B → B/N with N a nil ideal is a universal homeomorphism, so (B, I) is henselian iff (B/N, I(B/N)) is (Gabber–Ramero Remark 5.1.9(i)). For a Tate ring with ring of definition A₀ ∋ ϖ, A₀ → A₀ + A°° is integral and a universal homeomorphism, which transfers henselianity from (A₀ + A°°, A°°) to (A₀, ϖA₀) (Bhatt Lemma 7.2.3(3)).

*Depends on* this stage: `henselian-pair-characterisations`; elsewhere: `mathlib:HenselianRing`, `mathlib:Algebra.IsIntegral`, `mathlib:Algebra.Etale`.

### Henselian f-adic rings

#### Independence of the henselian datum (Huber 3.1.1)

*Node* `henselian-f-adic-ring-independence` (lemma). Let A be a Huber (f-adic) ring (Tau Ceti `Huber.IsHuberRing`), A° its power-bounded subring and A°° ⊆ A° the ideal of topologically nilpotent elements (Tau Ceti `powerBoundedSubring`, `topologicallyNilpotentIdeal`). A *henselian datum* of A is a pair (B, I) with B ⊆ A° an open subring and I an ideal of B that is open in A and contained in A°°. Then (a) for fixed B, HenselianRing B I ↔ HenselianRing B (B ∩ A°°); (b) the truth of HenselianRing B (B ∩ A°°) does not depend on B. Hence Huber's four conditions are equivalent: (i) some henselian datum is a henselian pair; (ii) every henselian datum is a henselian pair; (iii)/(iv) for some/every open subring B ⊆ A°, Spec B is henselian along the closed set of its open prime ideals, which is V(B ∩ A°°). No completeness, noetherian or Tate hypothesis enters. Lean: `Huber.henselianRing_iff_of_isOpen`.

*Hypotheses.* A an arbitrary Huber ring (the §3.1 convention of Huber's book: arbitrary f-adic rings). Subrings are unital; 'open' refers to the topology of A.

*Proof.* (a): I ⊆ B ∩ A°°, and each x ∈ B ∩ A°° has xⁿ ∈ I for n large because xⁿ → 0 and I is open; so √I = B ∩ A°° in B and henselian-pair-radical-invariance applies. The same argument shows that a prime of B is open iff it contains B ∩ A°°, which gives (iii)/(iv). Reduction: for open subrings B, B′ ⊆ A°, B ∩ B′ is an open subring of A°, so it suffices to compare C ⊆ B. For open subrings C ⊆ B of A°, choose a ring of definition A₀ ⊆ C with a finitely generated ideal of definition J (A₀ ∩ C is open and bounded, hence a ring of definition, and every ring of definition has a finitely generated ideal of definition: Huber 1993, Proposition 1). Put R := C + JB, a subring of B containing C in which JB is an ideal. (R, JB) is henselian iff (B, JB) is, by henselian-pair-shared-ideal-invariance; JB is open in A and consists of topologically nilpotent elements, so by (a) these are the conditions for R and for B. C → R is a universal homeomorphism on spectra: every element of JB is topologically nilpotent, so a power lies in A₀ ⊆ C and it is integral over C; C/(C ∩ A°°) → R/(R ∩ A°°) is an isomorphism since R ∩ A°° = (C ∩ A°°) + JB; and for x ∈ J the localisations C_x → R_x are isomorphisms because for b ∈ B the singleton {b} is bounded, so J^m b ⊆ A₀ ⊆ C for m large. Hence Spec R → Spec C is integral, bijective with trivial residue field extensions, an isomorphism over Spec C ∖ V(J) (Stacks Tag 04DF). henselian-pair-universal-homeomorphism-invariance gives HenselianRing C J ↔ HenselianRing R (JR); with (a) (JR is an open ideal of R inside A°°) this is the condition for C versus R.

*Acceptance.* Tate case: for a Tate ring A with ring of definition A₀ ∋ ϖ, (A₀, ϖA₀) is henselian iff (A°, A°°) is iff (A⁺, A°°) is — the statement of PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions (c) and Bhatt Lemma 7.2.3(3). Discrete A: A° = A and A°° is the nilradical, which is locally nilpotent, so every henselian datum is a henselian pair (Stacks Tag 0ALI): discrete rings are henselian.

*Depends on* this stage: `henselian-pair-radical-invariance`, `henselian-pair-shared-ideal-invariance`, `henselian-pair-universal-homeomorphism-invariance`; elsewhere: `tauceti:TauCeti.Huber.IsHuberRing`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `mathlib:IsTopologicallyNilpotent`, `mathlib:HenselianRing`.

#### Henselian f-adic and affinoid rings (Huber 3.1.2)

*Node* `henselian-f-adic-ring` (definition). A Huber ring A is *henselian* (`Huber.IsHenselian A`) if the pair (A°, A°°) is henselian: `HenselianRing (powerBoundedSubring A) (topologicallyNilpotentIdeal A)`. By henselian-f-adic-ring-independence this holds iff some, equivalently every, henselian datum (B, I) — B ⊆ A° an open subring, I an ideal of B open in A with I ⊆ A°° — is a henselian pair. A Huber pair (A, A⁺) (Tau Ceti `Huber.Pair`) is henselian (`Huber.Pair.IsHenselian`) iff its underlying Huber ring is; the plus ring plays no role, and (A⁺, A°°) is then a henselian pair. Conventions: completeness is not assumed; the topology enters only through A° and A°°; on Tate rings the notion coincides with `Huber.IsTopologicallyHenselian` of PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions (c).

*Hypotheses.* A a Huber ring (any f-adic ring); no completeness, noetherian or Tate hypothesis.

*Proof.* The definition is the canonical henselian datum (A°, A°°); the equivalent descriptions are henselian-f-adic-ring-independence. Open subrings: for an open subring C ⊆ A (a Huber ring for the subspace topology), bounded subsets of C and of A contained in C agree because C is open, so C° = C ∩ A° and C°° = C ∩ A°°; C° is an open subring of A°, so C is henselian when A is (henselian-f-adic-ring-independence (ii)).

*API.*

- `Huber.IsHenselian` (structure): Prop-valued class on Huber rings: HenselianRing A° A°°.
- `Huber.IsHenselian.henselianRing` (characterisation): If A is henselian then HenselianRing B I for every open subring B ⊆ A° and every ideal I of B open in A with I ⊆ A°°.
- `Huber.IsHenselian.of_henselianRing` (constructor): If HenselianRing B I for one such (B, I), then A is henselian.
- `Huber.IsHenselian.of_completeSpace` (instance): A complete Hausdorff Huber ring is henselian (complete-f-adic-ring-is-henselian).
- `Huber.IsHenselian.of_discreteTopology` (instance): A discrete ring is henselian.
- `Huber.IsHenselian.of_isOpen_subring` (functoriality): An open subring of a henselian Huber ring, with the subspace topology, is henselian.
- `Huber.IsHenselian.of_ringEquiv` (functoriality): Henselianity transports along ring isomorphisms that are homeomorphisms (Tau Ceti `powerBoundedSubringEquiv`).
- `Huber.IsHenselian.iff_isTopologicallyHenselian` (compatibility): For Tate rings, IsHenselian ↔ PerfectoidSpaces:P3's IsTopologicallyHenselian.
- `Huber.Pair.IsHenselian` (structure): A Huber pair (A, A⁺) is henselian iff A is; then HenselianRing A⁺ (A⁺ ∩ A°°).

*Unit tests.*

- `IsHenselian_test_padic` (computation): ℚ_p and ℚ_p⟨T⟩ with their p-adic topologies are henselian (complete); ℚ_p⟨T⟩° = ℤ_p⟨T⟩ is henselian along pℤ_p⟨T⟩.
- `IsHenselian_test_discrete` (degenerate): Every ring with the discrete topology is henselian: A° = A (Tau Ceti `powerBoundedSubring_eq_top`) and A°° is the nilradical, a locally nilpotent ideal (Stacks Tag 0ALI).
- `IsHenselian_test_rational_three_adic` (non-example): ℚ with the 3-adic topology is not henselian: ℚ° = ℤ_(3), ℚ°° = 3ℤ_(3), and X² − 7 has the simple root 1 modulo 3 but no root in ℤ_(3).
- `IsHenselian_test_algebraic_padic` (characterisation): The field ℚ_p ∩ ℚ̄ of algebraic p-adic numbers with the p-adic topology is henselian but not complete: its power-bounded subring is the henselisation ℤ_(p)^h of ℤ_(p).
- `IsHenselian_test_tate_compat` (compatibility): For a Tate ring A, `Huber.IsHenselian A ↔ Huber.IsTopologicallyHenselian A` (PerfectoidSpaces:P3).

*Acceptance.* Every complete Huber ring is henselian (complete-f-adic-ring-is-henselian), every discrete ring is henselian, and ℚ with the 3-adic topology is not.

*Depends on* this stage: `henselian-f-adic-ring-independence`, `complete-f-adic-ring-is-henselian`; elsewhere: `PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `tauceti:TauCeti.Huber.IsHuberRing`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.powerBoundedSubring_eq_top`, `mathlib:HenselianRing`.

#### Rings of definition of complete Huber rings

*Node* `ring-of-definition-adically-complete` (lemma). Let A be a Huber ring whose uniform structure is complete and Hausdorff (CompleteSpace A, T2Space A), and let (A₀, J) be a pair of definition (Tau Ceti `Huber.PairOfDefinition`: A₀ open, J ⊆ A₀ finitely generated, subspace topology J-adic). Then A₀ is J-adically complete in the algebraic sense: Mathlib `IsAdicComplete J A₀` (Hausdorff and precomplete for the filtration Jⁿ). Lean: `Huber.PairOfDefinition.isAdicComplete`.

*Hypotheses.* Completeness and Hausdorffness refer to the topology of A; J finitely generated.

*Proof.* A₀ and every Jⁿ are open additive subgroups of A, hence closed. Hausdorff: ⋂ₙ Jⁿ = 0 because the Jⁿ form a neighbourhood basis of 0 in the Hausdorff ring A. Precomplete: a sequence (xₙ) in A₀ with x_{n+1} − xₙ ∈ Jⁿ is Cauchy in A, so converges to some x ∈ A; x ∈ A₀ and x − xₙ ∈ Jⁿ because A₀ and Jⁿ are closed.

*Acceptance.* For A = ℚ_p⟨T⟩ with A₀ = ℤ_p⟨T⟩ and J = pA₀, A₀ is p-adically complete. Completeness of A is needed: for ℚ with the 3-adic topology (A₀ = ℤ_(3), J = 3ℤ_(3)), ℤ_(3) is not 3-adically complete.

*Depends on* elsewhere: `tauceti:TauCeti.Huber.PairOfDefinition`, `mathlib:IsAdicComplete`, `mathlib:IsAdic`, `mathlib:CompleteSpace`.

#### A complete f-adic ring is henselian

*Node* `complete-f-adic-ring-is-henselian` (theorem). Let A be a complete Hausdorff Huber ring. Then for every open subring B ⊆ A° and every ideal I of B that is open in A and contained in A°°, the pair (B, I) is henselian (Mathlib `HenselianRing B I`). In particular (A°, A°°) and (A⁺, A°°) are henselian pairs for every ring of integral elements A⁺ (Tau Ceti `IsRingOfIntegralElements`), and if A is a Tate ring with pseudo-uniformiser ϖ, then (A°, ϖA°) and (A⁺, ϖA⁺) are henselian pairs. The proof uses neither Huber's book nor henselian-f-adic-ring-independence. Lean: `Huber.henselianRing_of_completeSpace`.

*Hypotheses.* A complete and Hausdorff; no noetherian, Tate or uniformity hypothesis; A° may be unbounded.

*Proof.* Fix a ring of definition A₀ ⊆ B (A₀ ∩ B is open and bounded). For a finite subset S ⊆ B the subring A₀[S] is open and bounded (Tau Ceti `isBounded_subringClosure`: finitely many power-bounded elements generate a bounded subring; products and additive spans of bounded sets are bounded in a nonarchimedean ring), hence a ring of definition (Huber 1993, Proposition 1(ii)); so B is the directed union of rings of definition B_λ ⊆ B. Each B_λ has a finitely generated ideal of definition J_λ (Huber 1993, Proposition 1(iii)) and is J_λ-adically complete by ring-of-definition-adically-complete; hence (B_λ, J_λ) is henselian (Mathlib instance `IsAdicComplete.henselianRing`; Stacks Tag 0ALJ). I ∩ B_λ and J_λ are open ideals of B_λ consisting of topologically nilpotent elements, so they have the same radical and (B_λ, I ∩ B_λ) is henselian by henselian-pair-radical-invariance. (B, I) is the directed union of the pairs (B_λ, I ∩ B_λ), hence henselian (PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions (b); Stacks Tag 0FWT). Special cases: A° and A⁺ are open subrings of A° and A°° is open and topologically nilpotent; for Tate A, ϖA° and ϖA⁺ are open (ϖ is a unit) and lie in A°°.

*Acceptance.* ℤ_p⟨T⟩ = (ℚ_p⟨T⟩)° is henselian along pℤ_p⟨T⟩. Non-uniform instance: A = ℚ_p⟨T⟩[ε]/(ε²) with ring of definition ℤ_p⟨T⟩[ε]; A° = ℤ_p⟨T⟩ ⊕ εℚ_p⟨T⟩ is unbounded and is henselian along A°° = pℤ_p⟨T⟩ ⊕ εℚ_p⟨T⟩. The instance requested by AdicEtaleGeometry:A4: for a complete Tate ring A, (A°, ϖA°) is a henselian pair. Completeness cannot be dropped: ℚ with the 3-adic topology has (ℚ°, ℚ°°) = (ℤ_(3), 3ℤ_(3)), not henselian (X² − 7 has the simple root 1 modulo 3 and no root in ℤ_(3)).

*Depends on* this stage: `henselian-pair-radical-invariance`, `ring-of-definition-adically-complete`; elsewhere: `PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions`, `mathlib:HenselianRing`, `tauceti:TauCeti.Huber.isBounded_subringClosure`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `tauceti:TauCeti.Huber.IsRingOfIntegralElements`.

#### Units of henselian Huber rings

*Node* `henselian-affinoid-unit-criterion` (lemma). Let A be a henselian Huber ring (henselian-f-adic-ring) and A⁺ a ring of integral elements. Then (a) 1 + A°° ⊆ A^× and the unit group A^× is open in A; (b) every maximal ideal of A is closed; (c) every proper ideal J of A is contained in supp v for some v ∈ Spa(A, A⁺); hence f ∈ A is a unit iff f ∉ supp v for every v ∈ Spa(A, A⁺), and a finite T ⊆ A generates the unit ideal iff no point of Spa(A, A⁺) kills all of T. Completeness is not assumed. Lean: `Huber.IsHenselian.isOpen_setOf_isUnit`, `Huber.IsHenselian.isClosed_of_isMaximal`, `Huber.IsHenselian.isUnit_iff_forall_mem_spa_notMem_supp`.

*Hypotheses.* A henselian (in particular A°° ⊆ Jacobson radical of A°); A⁺ any ring of integral elements.

*Proof.* (a): (A°, A°°) is a henselian pair, so A°° lies in the Jacobson radical of A° and 1 + A°° ⊆ (A°)^× ⊆ A^×; 1 + A°° is an open neighbourhood of 1 (A°° contains an ideal of definition) and u(1 + A°°) ⊆ A^× for every unit u. (b): Tau Ceti `Ideal.isClosed_of_isMaximal_of_isOpen_isUnit`. (c): the proof of Tau Ceti `exists_mem_spa_le_supp_of_ne_top` (Wedhorn Proposition 7.51) uses completeness only through the openness of A^×: the closure of a proper ideal J is proper (Tau Ceti `Ideal.closure_ne_top_of_isOpen_isUnit`), so 1 is not in the closure of 0 in A/J and the quotient pair has non-empty Spa (Tau Ceti `spa_eq_empty_iff_one_mem_closure_zero`); a point of it pulls back to v with J ⊆ supp v.

*Acceptance.* For the henselian, non-complete field A = ℚ_p ∩ ℚ̄ with the p-adic topology, Spa(A, A°) is one point with support 0 and the criterion says that the non-zero elements are the units. The criterion is what makes f(s) a unit in rational-henselization (ii) for henselian, not necessarily complete, targets.

*Depends on* this stage: `henselian-f-adic-ring`; elsewhere: `tauceti:Ideal.isClosed_of_isMaximal_of_isOpen_isUnit`, `tauceti:Ideal.closure_ne_top_of_isOpen_isUnit`, `tauceti:TauCeti.ValuationSpectrum.spa_eq_empty_iff_one_mem_closure_zero`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_spa_le_supp_of_ne_top`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:Ideal.jacobson`.

### Henselizations

#### Henselization of an f-adic ring and of an affinoid ring (Huber 3.1.3)

*Node* `henselian-f-adic-rings-and-henselization` (construction). Let A be a Huber ring and (D, I) a pair of definition (D open and bounded, I ⊆ D a finitely generated ideal of definition). The *henselization* of A is A^h := A ⊗_D D^h, where (D^h, ID^h) is the henselization of the pair (D, I) (PerfectoidSpaces:P3/henselisation-of-pairs); D^h → A^h is injective (D^h is flat over D) and A^h is topologised so that the image of D^h is a ring of definition with ideal of definition I·D^h (neighbourhood basis {IⁿD^h} of 0); ι: A → A^h is the canonical map. (i) A^h is a henselian Huber ring (henselian-f-adic-ring) and ι is continuous and adic. (ii) Universal property: every continuous ring homomorphism φ: A → B into a henselian Huber ring factors uniquely as φ = ψ ∘ ι with ψ: A^h → B continuous; hence A^h does not depend on (D, I) up to unique isomorphism. (iii) D/Iⁿ ≅ D^h/IⁿD^h for all n, so ι induces isomorphisms of the completed rings of definition and of completions Â ≅ (A^h)^ (Tau Ceti `PairOfDefinition.completion`), with Â = Â₀ ⊗_{A₀} A. (iv) ι is an isomorphism iff A is henselian; in particular complete Huber rings are their own henselizations (complete-f-adic-ring-is-henselian). Affinoid case: for a Huber pair (A, A⁺) choose D ⊆ A⁺; then (A⁺)^h := A⁺ ⊗_D D^h is the henselization of the Huber ring A⁺, it equals the integral closure of the image of A⁺ ⊗_D D^h in A^h, and (A, A⁺)^h := (A^h, (A⁺)^h) is a henselian Huber pair, universal among continuous homomorphisms of Huber pairs to henselian Huber pairs, whose completion is (Â, Â⁺). Section-wide convention (Huber 1996 §3.1): no noetherian or completeness hypothesis on A. The henselian notion itself (Huber 1996, 3.1.1–3.1.2) is henselian-f-adic-ring-independence and henselian-f-adic-ring, and the clause 'complete f-adic rings are henselian' is complete-f-adic-ring-is-henselian.

*Hypotheses.* A an arbitrary Huber ring; D ⊆ A⁺ may be chosen because D ∩ A⁺ is again a ring of definition. Henselization of pairs is the left adjoint of Stacks Tag 0A02, filtered colimit of étale D-algebras E with D/I ≅ E/IE.

*Proof.* Topology: for a ∈ A, a·I^N ⊆ D for N large (continuity of multiplication by a), so a·I^{N+n}D^h ⊆ IⁿD^h; the {IⁿD^h} define a ring topology in which the image of D^h is open and bounded with the finitely generated ideal of definition ID^h, so A^h is a Huber ring and ι is adic. Henselian: (image of D^h, ID^h) is a henselian pair and a henselian datum of A^h, so A^h is henselian by henselian-f-adic-ring-independence. Existence in (ii): for a continuous φ: A → B and a ring of definition B₀ of B, D′ := D ∩ φ^{-1}(B₀) is a ring of definition of A with a finitely generated ideal of definition I′; φ(I′) consists of topologically nilpotent elements, and (B₀, B₀ ∩ B°°) is henselian (B henselian, henselian-f-adic-ring-independence), so the universal property of the henselization of the pair (D′, I′) gives D′^h → B₀ and hence A ⊗_{D′} D′^h → B, continuous because (φ(I′)B₀)^m tends to 0 (it is generated by finitely many topologically nilpotent elements). A ⊗_{D′} D′^h is henselian and satisfies the same universal property, which identifies it with A ⊗_D D^h. Uniqueness in (ii): let ψ₁, ψ₂ be continuous with ψ₁ ∘ ι = ψ₂ ∘ ι. For an étale D′-algebra E with D′/I′ᵏ ≅ E/I′ᵏE one has E = D′ + I′ᵏE, and continuity gives ψ_i(I′ᵏE) ⊆ B₀ for k large, so ψ_i(E) ⊆ B₀. The two maps E → B₀ agree modulo φ(I′)B₀; the idempotent of E ⊗_{D′} E cutting out the diagonal maps to an idempotent f of B₀ with 1 − f ∈ φ(I′)B₀ ⊆ rad(B₀), so f = 1 and ψ₁ = ψ₂ on E; E ranges over a cofinal system of D′^h. (iii): Stacks Tag 0AGU gives D/Iⁿ ≅ D^h/IⁿD^h; hence the I-adic completions of D and D^h agree, and (A^h)^ = A^h ⊗_{D^h} (D^h)^ = A ⊗_D D̂ = Â (Huber 1993, Lemma 1.6, as recalled in the Berkeley lectures). (iv): if A is henselian, (D, I) is a henselian pair (henselian-f-adic-ring-independence) and D^h = D. Plus rings: A⁺ ⊗_D D^h is integrally closed in A ⊗_D D^h because integral closure commutes with étale base change (Stacks Tag 03GE) and with filtered colimits; it is open, contains the ring of definition D^h and consists of power-bounded elements (for a ∈ A⁺, Iᵏaⁿ ⊆ D for all n implies (ID^h)ᵏaⁿ ⊆ D^h), so it is a ring of integral elements; the universal property for pairs follows from (ii) applied to (D, I) → (B⁺, B⁺ ∩ B°°), and (A⁺)^h = A⁺ ⊗_D D^h is Huber's (A^h)⁺ = (A⁺)^h.

*API.*

- `Huber.Henselization` (constructor): The henselization A^h of a Huber ring A, with its Huber topology.
- `Huber.Henselization.of` (data): The canonical continuous adic ring map ι: A → A^h.
- `Huber.Henselization.isHuberRing` (instance): A^h is a Huber ring, with ring of definition the image of D^h and ideal of definition ID^h.
- `Huber.Henselization.isHenselian` (instance): A^h is henselian.
- `Huber.Henselization.lift` (universal-property): For continuous φ: A → B with B henselian, the continuous ψ: A^h → B.
- `Huber.Henselization.lift_comp_of` (universal-property): lift φ ∘ ι = φ.
- `Huber.Henselization.hom_ext` (extensionality): Two continuous maps A^h → B to a henselian Huber ring agreeing on A are equal.
- `Huber.Henselization.map` (functoriality): A continuous φ: A → A′ induces A^h → A′^h, with map_id and map_comp.
- `Huber.Henselization.of_bijective_iff` (characterisation): ι is bijective iff A is henselian.
- `Huber.Henselization.completionEquiv` (compatibility): The completion of ι is an isomorphism Â ≃ (A^h)^ of topological rings.
- `Huber.Henselization.ringOfDefinitionEquiv` (compatibility): The ring of definition of A^h is the henselization of the pair (D, I) (PerfectoidSpaces:P3 `Ring.henselization`).
- `Huber.Pair.henselization` (constructor): (A, A⁺)^h = (A^h, (A⁺)^h), a henselian Huber pair with the universal property for pairs.
- `Huber.Pair.henselization_plus` (characterisation): (A^h)⁺ = (A⁺)^h = the integral closure of the image of A⁺ ⊗_D D^h in A^h; its completion is Â⁺.

*Unit tests.*

- `Huber.henselization_test_complete` (degenerate): If A is complete (e.g. ℚ_p⟨T⟩), ι: A → A^h is an isomorphism of topological rings.
- `Huber.henselization_test_Zp` (computation): For ℚ with the p-adic topology, A^h = ℚ_p ∩ ℚ̄ with ring of definition ℤ_(p)^h, and the completion of A^h is ℚ_p.
- `Huber.henselization_test_completion` (compatibility): The completion map induces Â ≅ (A^h)^ as topological rings, compatible with Tau Ceti `PairOfDefinition.completion` for the pairs (D, I) and (D^h, ID^h).
- `Huber.henselization_test_lift` (characterisation): For ℤ[T] with the (p, T)-adic topology, the inclusion into ℤ_p⟦T⟧ factors uniquely through ℤ[T]^h, the henselization of (ℤ[T], (p, T)).
- `Huber.henselization_test_not_completion` (non-example): A^h ≠ Â in general: for ℚ with the p-adic topology, A^h = ℚ_p ∩ ℚ̄ is countable while ℚ_p is not.

*Acceptance.* A complete Huber pair is its own henselization; the henselization does not change the completion (Huber 1996, Lemma 3.1.3.ii). (A^h)⁺ = (A⁺)^h: the plus ring is henselized along with the ring and is recovered in every completion as Â⁺. For ℚ with the p-adic topology (D = ℤ_(p), I = pℤ_(p)): A^h = ℚ ⊗ ℤ_(p)^h = ℚ_p ∩ ℚ̄, and (A^h)^ = ℚ_p = Â.

*Depends on* this stage: `henselian-f-adic-ring`, `henselian-f-adic-ring-independence`, `complete-f-adic-ring-is-henselian`; elsewhere: `PerfectoidSpaces:P3/henselisation-of-pairs`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.PairOfDefinition.completion`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.IsRingOfIntegralElements`, `mathlib:HenselianRing`, `mathlib:Algebra.Etale`.

#### Henselization along a rational subset (Huber 3.1.4–3.1.5)

*Node* `rational-henselization` (construction). Let (A, A⁺) be a Huber pair and U = R(T/s) ⊆ Spa(A, A⁺) a rational subset (T ⊆ A finite with T·A open, s ∈ A). Let (A(T/s), A(T/s)⁺) be the uncompleted rational localisation: the localisation A_s with the Huber topology of Tau Ceti `PairOfDefinition.localization`/`locTopology` (ring of definition A₀[t/s : t ∈ T], ideal of definition generated by an ideal of definition of A₀) and A(T/s)⁺ the integral closure of A⁺[t/s : t ∈ T]. Define G_A(U) := (A(T/s), A(T/s)⁺)^h (henselian-f-adic-rings-and-henselization) with h: (A, A⁺) → G_A(U). (i) G_A(U) is a henselian Huber pair and Spa(h) is a homeomorphism of Spa G_A(U) onto U carrying rational subsets to rational subsets. (ii) Every continuous homomorphism of Huber pairs f: (A, A⁺) → (B, B⁺) with B henselian and Spa(f)(Spa(B, B⁺)) ⊆ U factors uniquely through h; hence G_A(U) depends only on U. (iii) The completion of G_A(U) is the completed rational localisation (O_X(U), O_X⁺(U)) (Tau Ceti `completionLocalization`), plus rings included. (iv) (3.1.5) A(U) := the underlying ring of G_A(U), the *henselization of A along U*, is a presheaf of rings on the rational subsets of Spa(A, A⁺) (restrictions from (ii)); completing it gives the structure presheaf on rational subsets. Lean: `Huber.Pair.rationalHenselization`.

*Hypotheses.* (A, A⁺) an arbitrary Huber pair; completeness and sheafiness are not assumed.

*Proof.* (i): Spa of the uncompleted localisation maps homeomorphically onto R(T/s) (Tau Ceti `spaLocalizationToRationalSubset`, embedding and surjective); henselization does not change the completion (henselian-f-adic-rings-and-henselization (iii)), and Spa of a Huber pair equals Spa of its completion (Wedhorn Proposition 7.48). (ii): f(s) is a unit in B: no point w of Spa(B, B⁺) has f(s) ∈ supp w (its pullback lies in R(T/s); Tau Ceti `valuation_ne_zero_of_mem_rationalSubset`), and units of a henselian Huber ring are detected on Spa (henselian-affinoid-unit-criterion). f(t)/f(s) ∈ B⁺ because it has value ≤ 1 at every point (Tau Ceti `vle_one_of_comap_mem_rationalSubset`, Wedhorn Proposition 7.52(1)). So f factors through A_s; the factorisation is continuous because its composite with B → B̂ is the continuous map of Tau Ceti `existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset` and the topology of B is induced from B̂ (open subgroups correspond). Then use the universal property of the henselization. (iii): henselian-f-adic-rings-and-henselization (iii) for the Huber pair (A(T/s), A(T/s)⁺). (iv): for V ⊆ U rational, the pair G_A(V) receives (A, A⁺) with image in U, so (ii) gives G_A(U) → G_A(V); uniqueness gives the presheaf identities.

*API.*

- `Huber.Pair.rationalHenselization` (constructor): G_A(U) for a rational U presented as R(T/s).
- `Huber.Pair.rationalHenselization.toHom` (data): The continuous homomorphism of Huber pairs h: (A, A⁺) → G_A(U).
- `Huber.Pair.rationalHenselization.isHenselian` (instance): G_A(U) is a henselian Huber pair.
- `Huber.Pair.rationalHenselization.spaHomeomorph` (characterisation): Spa(h) is a homeomorphism Spa G_A(U) ≃ U preserving rational subsets.
- `Huber.Pair.rationalHenselization.lift` (universal-property): The factorisation of f through h for henselian targets with image in U.
- `Huber.Pair.rationalHenselization.hom_ext` (extensionality): Two continuous maps out of G_A(U) agreeing after composition with h are equal.
- `Huber.Pair.rationalHenselization.equivOfEq` (other): R(T/s) = R(T′/s′) gives a unique isomorphism between the two constructions.
- `Huber.Pair.rationalHenselization.restrict` (functoriality): Restriction G_A(U) → G_A(V) for V ⊆ U, with restrict_id and restrict_comp.
- `Huber.Pair.rationalHenselization.completionEquiv` (compatibility): The completion of G_A(U) is Tau Ceti's completed rational localisation with its plus ring.

*Unit tests.*

- `Huber.Pair.rationalHenselization_test_whole` (degenerate): For U = Spa(A, A⁺) = R({1}/1), G_A(U) = (A, A⁺)^h.
- `Huber.Pair.rationalHenselization_test_disc` (computation): For A = ℚ_p⟨T⟩ and U = R((T, p)/p), the completion of G_A(U) is ℚ_p⟨T/p⟩ with plus ring ℤ_p⟨T/p⟩.
- `Huber.Pair.rationalHenselization_test_lift` (characterisation): The completion map (A, A⁺) → (O_X(U), O_X⁺(U)) has image in U and complete, hence henselian, target; its factorisation through G_A(U) is the completion map of G_A(U).
- `Huber.Pair.rationalHenselization_test_restriction` (compatibility): For rational V ⊆ U the restriction A(U) → A(V) completes to the Tau Ceti restriction O_X(U) → O_X(V).
- `Huber.Pair.rationalHenselization_test_not_complete` (non-example): For (A, A⁺) = (ℚ_p[T], ℤ_p[T]) with the p-adic topology and U = Spa(A, A⁺), A(U) = ℤ_p[T]^h[1/p] (henselization along p) is algebraic over ℚ_p[T] and so is not the completion ℚ_p⟨T⟩: exp(p²T) = Σ p^{2n}Tⁿ/n! lies in ℤ_p⟨T⟩ and is transcendental over ℚ_p(T).

*Acceptance.* U = Spa(A, A⁺) = R({1}/1): G_A(U) is the henselization (A, A⁺)^h, and A(U) = A for complete A. For A = ℚ_p⟨T⟩ and U = R((T, p)/p) = {|T| ≤ |p|}, the completion of G_A(U) is ℚ_p⟨T/p⟩. In the proof of H1:formal-adic-comparison 3.5.13 the scheme U ×_X Z^h is the spectrum of the henselization of (B(1/s), C) along Spa(B(1/s), C) — the case U = Spa of this construction.

*Depends on* this stage: `henselian-f-adic-rings-and-henselization`, `henselian-affinoid-unit-criterion`, `henselian-f-adic-ring`; elsewhere: `tauceti:TauCeti.Huber.PairOfDefinition.localization`, `tauceti:TauCeti.Huber.PairOfDefinition.locTopology`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spaLocalizationToRationalSubset`, `tauceti:TauCeti.ValuationSpectrum.valuation_ne_zero_of_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.vle_one_of_comap_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `mathlib:IsLocalization.Away`.

### Special and pro-special subsets; henselization along them

#### Special and pro-special subsets (Huber 3.1.6)

*Node* `special-and-pro-special-subsets` (definition). Let (A, A⁺) be a Huber pair and X = Spa(A, A⁺). For t ∈ A and finite subsets D, E ⊆ A such that the ideal (D ∪ E ∪ {t})·A is open, put S(D|E / t) := {x ∈ X : |d(x)| ≤ |t(x)| ≠ 0 for all d ∈ D, and |e(x)| < |t(x)| for all e ∈ E}. A subset U ⊆ X is *special* if U = S(D|E / t) for such data, and *pro-special* if it is an intersection of special subsets. Every rational subset R(T/s) = S(T|∅ / s) is special; X = S(∅|∅ / 1); pro-special subsets are stable under arbitrary intersections. Relative to a rational subset R: S(D|E / t) = R ∖ ⋃_{e ∈ E} R_e with R := R((D ∪ E ∪ {t})/t) and R_e := {x ∈ R : |t(x)| ≤ |e(x)|}. Functoriality (Huber 1996, 3.1.9): for an adic homomorphism of Huber pairs f: (A, A⁺) → (B, B⁺), Spa(f)^{-1}(S(D|E/t)) = S(f(D)|f(E) / f(t)), and special subsets of Spa A and of Spa Â correspond under Spa Â ≅ Spa A. Lean: `Huber.specialSubset`, `Huber.IsSpecialSubset`, `Huber.IsProSpecialSubset`.

*Hypotheses.* |a(x)| denotes the value of a at the continuous valuation x; D, E finite; the openness of (D ∪ E ∪ {t})·A is part of the data. Functoriality is stated for adic homomorphisms, for which f(D ∪ E ∪ {t})·B is open.

*Proof.* S(D|E/t) = R ∖ ⋃ R_e: on R the element t is invertible at every point, and |e(x)| < |t(x)| fails exactly on R_e (values are totally ordered). Preimages: |f(a)(y)| = |a(Spa(f)(y))| for y ∈ Spa B, and adic maps carry open ideals to ideals generating open ideals.

*API.*

- `Huber.specialSubset` (constructor): S(D|E / t) for finite D, E and t with (D ∪ E ∪ {t})·A open.
- `Huber.IsSpecialSubset` (structure): U is of the form S(D|E / t).
- `Huber.IsProSpecialSubset` (structure): U is an intersection of special subsets.
- `Huber.IsSpecialSubset.isProSpecialSubset` (relation): Special subsets are pro-special.
- `Huber.isSpecialSubset_rationalSubset` (example): R(T/s) is special.
- `Huber.IsProSpecialSubset.iInter` (structure): Arbitrary intersections of pro-special subsets are pro-special.
- `Huber.specialSubset_eq_diff` (characterisation): S(D|E/t) = R((D ∪ E ∪ {t})/t) ∖ ⋃_{e ∈ E} {x ∈ R : |t(x)| ≤ |e(x)|}.
- `Huber.IsSpecialSubset.preimage` (functoriality): Preimages of special (pro-special) subsets under Spa(f) for adic f are special (pro-special).
- `Huber.IsSpecialSubset.completion` (compatibility): Special subsets of Spa A and Spa Â correspond under the homeomorphism Spa Â ≅ Spa A.

*Unit tests.*

- `Huber.isSpecialSubset_rationalSubset` (compatibility): R(T/s) = S(T|∅/s) is special.
- `Huber.isSpecialSubset_univ` (degenerate): Spa(A, A⁺) = S(∅|∅/1) is special.
- `Huber.specialSubset_test_tube` (computation): In Spa(ℤ_p[T], ℤ_p[T]) with the p-adic topology, S(∅|{T}/1) = {x : |T(x)| < 1} (the ideal ({T, 1}) is the unit ideal, hence open).
- `Huber.specialSubset_test_not_open` (non-example): S(∅|{T}/1) above is closed (its complement is the rational subset R({1}/T)) and not open (Spa(ℤ_p[T], ℤ_p[T]) is connected, ℤ_p⟨T⟩ having no non-trivial idempotents), so special subsets are not rational in general.

*Acceptance.* Every rational subset is special; the tube {|T| < 1} = S(∅|{T}/1) in Spa(ℤ_p[T], ℤ_p[T]) (p-adic topology) is special and not open.

*Depends on* elsewhere: `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `AdicSpacesPartII:R0/adic-ring-homomorphism`.

#### Topology of special subsets (Huber 3.1.8)

*Node* `special-subsets-locally-closed-constructible` (lemma). Let (A, A⁺) be a Huber pair and X = Spa(A, A⁺), a spectral space (Tau Ceti `spectralSpace_spa_of_pairOfDefinition`). Every special subset S = S(D|E / t) is locally closed and constructible in X (Mathlib `Topology.IsConstructible`): S = R ∖ ⋃_{e ∈ E} R_e with R := R((D ∪ E ∪ {t})/t) quasi-compact open and each R_e := {x ∈ R : |t(x)| ≤ |e(x)|} quasi-compact open. Consequently every pro-special subset U is pro-constructible (DiamondsAndVStacks:D0/pro-constructible-subsets), hence quasi-compact, and convex: if x, z ∈ U and x specialises to y which specialises to z, then y ∈ U. Hence (X, U) satisfies Huber's conditions for a pseudo-adic space whenever X is an adic space. Lean: `Huber.IsSpecialSubset.isLocallyClosed`, `Huber.IsSpecialSubset.isConstructible`, `Huber.IsProSpecialSubset.isProConstructible`, `Huber.IsProSpecialSubset.isConvex`.

*Hypotheses.* (A, A⁺) any Huber pair.

*Proof.* R is a rational subset, open (Tau Ceti `isOpen_val_preimage_rationalSubset`) and quasi-compact (Tau Ceti `isCompact_of_mem_spaRationalFamily`). R_e is open and quasi-compact: under the homeomorphism Spa(A(T/t), A(T/t)⁺) ≅ R (Tau Ceti `spaLocalizationToRationalSubset`, T := D ∪ E ∪ {t}) it is the rational subset R({1}/(e/t)) of the rational localisation ({1} generates the unit ideal). S = R ∩ (X ∖ ⋃ R_e) is the intersection of an open and a closed set, and a Boolean combination of quasi-compact opens, hence locally closed and constructible. Convexity: a locally closed set O ∩ C is convex, since y lies in the closure of x (so in C) and generalises z ∈ O (so lies in O); intersections of convex, resp. pro-constructible, sets are convex, resp. pro-constructible.

*Acceptance.* S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T]) (p-adic topology) is closed, constructible and not open. Huber 1996, Corollary 3.1.8: special subsets are locally closed and constructible, pro-special subsets convex and pro-constructible.

*Depends on* this stage: `special-and-pro-special-subsets`; elsewhere: `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `tauceti:TauCeti.ValuationSpectrum.isOpen_val_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.isCompact_of_mem_spaRationalFamily`, `tauceti:TauCeti.ValuationSpectrum.spaLocalizationToRationalSubset`, `mathlib:Topology.IsConstructible`, `mathlib:SpectralSpace`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D0/locally-spectral-space`.

#### Henselization along a pro-special subset (Huber 3.1.11–3.1.13)

*Node* `henselization-along-pro-special-subset` (construction). (3.1.11) A *triple* (K, L, M) is a ring K, a subring L ⊆ K and an ideal M of L; it is henselian if (L, M) is a henselian pair; its henselization is (K ⊗_L L^h, L^h, ML^h), where (L^h, ML^h) is the henselization of the pair (L, M) (PerfectoidSpaces:P3/henselisation-of-pairs); its saturation replaces L by its integral closure in K and M by the radical of the extended ideal. (3.1.12) Let (A, A⁺) be a Huber pair, A^▷ its underlying ring, and U = ⋂_{i ∈ Λ} S(D_i|E_i / t_i) a pro-special subset of Spa(A, A⁺) with a chosen presentation; let (B, P) be a pair with B ⊆ A⁺ a subring over which A⁺ is integral and P ⊆ B ∩ A°° an ideal of B with P·A open (for example (A⁺, A⁺ ∩ A°°)). Put F := A^▷[1/t_i : i ∈ Λ], G := B[d/t_i, e/t_i : i ∈ Λ, d ∈ D_i, e ∈ E_i] ⊆ F and J := (P ∪ {e/t_i : i ∈ Λ, e ∈ E_i})·G, and define A(U) := F^h, where (F^h, G^h, J^h) is the henselization of the triple (F, G, J): the *henselization of A along U*, a ring without topology (used with the discrete topology). Then (i) A(U) is independent of the presentation of U and of (B, P) up to unique isomorphism; (ii) U ↦ A(U) is a presheaf of rings on the pro-special subsets of Spa(A, A⁺) whose restriction to rational subsets is the presheaf A(U) of rational-henselization; (iii) a continuous homomorphism of Huber pairs f: (A, A⁺) → (A′, A′⁺) and pro-special U ⊆ Spa A, U′ ⊆ Spa A′ with Spa(f)(U′) ⊆ U induce a ring map A(U) → A′(U′), compatibly with restrictions. (3.1.13) Examples: (i) for A with an I-adic topology, the henselization of (A, A⁺) along Spa(A, A⁺) is the henselization of A along I; (iii) for s ∈ A and B = (A, A)(1/s), λ^{-1}(P) is a pro-special subset of Spa B and (A^h)_s is the henselization of B along it — the bridge to formal generic fibres (AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus); (iv) the henselization of an affinoid field (K, K⁺) along its closed point is the henselization of K with respect to the valuation ring K⁺. Lean: `Huber.Triple`, `Huber.Pair.proSpecialHenselization`.

*Hypotheses.* (A, A⁺) any Huber pair (arbitrary f-adic A^▷); U pro-special. A(U) carries no natural Huber topology when U is not rational (Huber's remark after (3.1.5)); it is used as a discrete ring. Inputs of the source's proof: EGA IV 18.12.15 (henselization and integral closure; here replaced by Stacks Tag 03GE) and Huber 1993 (valuation spectra and the retraction r: Spv A^▷ → Spv(A^▷, Q)).

*Proof.* Construct (F, G, J) from the presentation and (B, P); henselize the pair (G, J) and base change to F; saturate. For a triple X = (K, L, M) let V(X) ⊆ Spv K be the valuations bounded by 1 on L and < 1 on M. The source proves: (1) (X^c)^h ≅ (X^h)^c; (2) for a henselian saturated triple, L and M are recovered from V(X), and every prime of K is the support of some v ∈ V(X); (3) the saturation Y of the henselization of (F, G, J) is universal among henselian saturated triples Z with im V(f) ⊆ r^{-1}(U); (4) r^{-1}(U) is the set of primary generalisations of U. These four steps are only in Huber 1996 (gap); (i)–(iii) follow from (3). 3.1.13(i): with U = Spa(A, A⁺) = S(∅|∅/1), F = A and J has the same radical as the ideal of definition, so A(U) = A ⊗_{A₀} A₀^h along I (henselian-pair-radical-invariance).

*API.*

- `Huber.Triple` (structure): A triple (K, L, M): ring, subring, ideal of the subring.
- `Huber.Triple.henselization` (constructor): (K ⊗_L L^h, L^h, ML^h).
- `Huber.Triple.saturation` (constructor): (K, integral closure of L in K, radical of the extended ideal).
- `Huber.Pair.proSpecialHenselization` (constructor): A(U) = F^h for a presented pro-special U and a pair (B, P).
- `Huber.Pair.proSpecialHenselization.equivOfPresentation` (other): (i): independence of the presentation and of (B, P).
- `Huber.Pair.proSpecialHenselization.restrict` (functoriality): (ii): restriction A(U) → A(U′) for U′ ⊆ U, with restrict_id and restrict_comp.
- `Huber.Pair.proSpecialHenselization.map` (functoriality): (iii): A(U) → A′(U′) for f with Spa(f)(U′) ⊆ U.
- `Huber.Pair.proSpecialHenselization.rationalEquiv` (compatibility): For rational U, agreement with rational-henselization.
- `Huber.Pair.proSpecialHenselization.isHenselian` (instance): The saturated triple (A(U), (G^h)^c, (J^h)^c) is henselian.
- `Huber.Pair.proSpecialHenselization.adicEquiv` (example): 3.1.13(i): for I-adic A, A along Spa(A, A⁺) is the henselization along I.
- `Huber.Pair.proSpecialHenselization.formalGenericFibreEquiv` (example): 3.1.13(iii): (A^h)_s is the henselization of (A, A)(1/s) along λ^{-1}(P).

*Unit tests.*

- `Huber.Pair.proSpecialHenselization_test_rational` (compatibility): For rational U = R(T/s), A(U) is the underlying ring of rational-henselization G_A(U).
- `Huber.Pair.proSpecialHenselization_test_complete` (degenerate): For complete (A, A⁺) and U = Spa(A, A⁺), A(U) = A.
- `Huber.Pair.proSpecialHenselization_test_tube` (computation): For (ℤ_p[T], ℤ_p[T]) with the p-adic topology and U = S(∅|{T}/1), A(U) is the henselization of the pair (ℤ_p[T], (p, T)).
- `Huber.Pair.proSpecialHenselization_test_affinoid_field` (characterisation): For an affinoid field (K, K⁺) and U its closed point, A(U) is the henselization of K with respect to K⁺.
- `Huber.Pair.proSpecialHenselization_test_not_germs` (non-example): A(U) is not the ring of germs Γ(U, O|_U) along U: for U = S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T]), exp(p²T) ∈ ℤ_p⟨T⟩ restricts to a germ along U but is transcendental over ℚ_p(T), whereas A(U) is ind-étale over ℤ_p[T].

*Acceptance.* For a rational U the construction returns the ring of rational-henselization. Example 3.1.13(iii) identifies the henselization along λ^{-1}(P) ⊆ d(Spf A) with (A^h)_s — the bridge between henselian pairs and formal generic fibres used in the proof of H1:formal-adic-comparison 3.5.13. For (A, A⁺) = (ℤ_p[T], ℤ_p[T]) with the p-adic topology and U = S(∅|{T}/1): F = G = ℤ_p[T], J = (p, T), and A(U) is the henselization of ℤ_p[T] along (p, T).

*Depends on* this stage: `special-and-pro-special-subsets`, `rational-henselization`, `henselian-f-adic-rings-and-henselization`, `henselian-pair-radical-invariance`, `henselian-f-adic-ring`; elsewhere: `PerfectoidSpaces:P3/henselisation-of-pairs`, `AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus`, `tauceti:TauCeti.ValuationSpectrum`, `mathlib:HenselianRing`.

#### Continuity of A(U) in U

*Node* `pro-special-henselization-continuity` (lemma). Let U = ⋂_λ U_λ be the intersection of a cofiltered family of pro-special subsets of Spa(A, A⁺), with presentations indexed by Λ_λ such that Λ = ⋃_λ Λ_λ is a directed union presenting U. Then the restriction maps induce an isomorphism colim_λ A(U_λ) ≅ A(U) (henselization-along-pro-special-subset). In particular, for U = ⋂_{i ∈ Λ} S(D_i|E_i / t_i), A(U) is the filtered colimit of A(⋂_{i ∈ Λ₀} S(D_i|E_i / t_i)) over finite Λ₀ ⊆ Λ. Lean: `Huber.Pair.proSpecialHenselization.colimitEquiv`.

*Hypotheses.* Presentations compatible as stated; (B, P) fixed.

*Proof.* The triple (F, G, J) for U is the filtered colimit of the triples for the U_λ: localisations, generated subrings and generated ideals commute with filtered colimits. Henselization of pairs commutes with filtered colimits (Stacks Tag 0A04; PerfectoidSpaces:P3/henselisation-of-pairs, API directLimitEquiv), and so does base change to F. Saturation (integral closure and radical) commutes with filtered colimits; independence of the presentation (henselization-along-pro-special-subset (i)) identifies the colimit with A(U).

*Acceptance.* For U = ⋂_n S(∅|{f_n}/1) (countably many strict inequalities) with (B, P) = (A⁺, A⁺ ∩ A°°), A(U) is the henselization of A along (P, f_1, f_2, …) as the union of the henselizations along (P, f_1, …, f_n). A special subset is its own finite presentation, so the statement is empty for it.

*Depends on* this stage: `henselization-along-pro-special-subset`; elsewhere: `PerfectoidSpaces:P3/henselisation-of-pairs`, `mathlib:Ring.DirectLimit`.

### The affine henselian comparison and the Zariski–Riemann argument

#### Gabber–Huber: étale cohomology of a henselian pair (Huber 3.2.5)

*Node* `affine-henselian-comparison-3-2-5` (theorem). Let (A, I) be a henselian pair (Mathlib `HenselianRing A I`), X = Spec A, Z = Spec(A/I) with closed immersion i: Z → X, and F an abelian torsion sheaf on the small étale site of X (Mathlib `smallEtaleTopology`). Then for every n ≥ 0 the restriction map H^n(X_et, F) → H^n(Z_et, i^*F) is bijective. No noetherian hypothesis. Lean: `HenselianRing.etaleCohomology_restrict_bijective`.

*Hypotheses.* (A, I) henselian; F torsion (every section killed by some non-zero integer); A arbitrary.

*Proof.* n = 0 (Stacks Lemma 59.82.6): Spec A is spectral and V(𝔭 + I) is connected for every prime 𝔭 (Stacks Lemma 15.11.16, from henselian-pair-characterisations (4) applied to A/𝔭), so Γ(X, G) = Γ(Z, G|_Z) for sheaves on the Zariski site (Stacks Lemma 59.82.4); finite A-algebras A′ give henselian pairs (A′, IA′) (Stacks Tag 09XK), which upgrades the equality to étale sheaves (Stacks Lemma 59.82.2). n ≥ 1 by induction (Stacks Theorem 59.82.7): for ξ ∈ H^n(Z, i^*F) choose an injection F → F′ of torsion sheaves killing ξ (Stacks Lemma 59.82.1, which reduces to constructible sheaves by Stacks Lemmas 59.73.2 and 59.51.4 and uses Section 59.80 on schemes over strictly henselian bases); a diagram chase in the long exact sequences of 0 → F → F′ → Q → 0 over X and Z, with the statement in degrees < n, gives injectivity and then surjectivity in degree n. The scheme-theoretic inputs (constructible approximation, Section 59.80, long exact sequences of étale cohomology) are supplied by the scheme étale cohomology owner (SchemeAndStackFoundations:SF.2; requested). Independent public proof (Huber 1993): reduce to noetherian X by limits (SGA 4 IX 2.7, VII 5.8) and to sheaves ∏ g_{k*}L_k (SGA 4½ V 1.8); degree 0 is SGA 4 XII 6.5(i), degree 1 follows from Elkik's theorem, and higher degrees from the Zariski–Riemann vanishing through Huber's Lemmas 0.3–0.4 (which prove zariski-riemann-cohomology-vanishing and this theorem simultaneously).

*Acceptance.* A henselian local ring (A, 𝔪) with residue field k: H^n(Spec A, F) ≅ H^n(Spec k, F|) is Galois cohomology of k. The henselian hypothesis is needed: for A = ℤ_(3), I = 3A and F = ℤ/2, the étale double cover Spec ℤ_(3)[√7] → Spec ℤ_(3) is non-trivial (7 is not a square in ℚ) but split over 𝔽_3 (7 ≡ 1 is a square), so H^1(Spec ℤ_(3), ℤ/2) → H^1(Spec 𝔽_3, ℤ/2) is not injective.

*Depends on* this stage: `henselian-pair-characterisations`; elsewhere: `mathlib:HenselianRing`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Sheaf.H`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`.

#### Push-forwards from separably closed points

*Node* `henselian-comparison-separably-closed-points` (lemma). Let A be a ring, J ⊆ A an ideal, K a separably closed field, s: A → K a ring homomorphism with t := Spec(s): Spec K → Spec A, and G an abelian torsion group, viewed as a sheaf on (Spec K)_et. Then H^i((Spec A/J)_et, (t_*G)|_{Spec A/J}) = 0 for every i ≥ 1. Lean: `HenselianRing.etaleCohomology_pushforward_sepClosed_eq_zero`.

*Hypotheses.* K separably closed; G torsion; A, J arbitrary.

*Proof.* Let (A^h, J^h) be the henselization of the pair (A, J) (PerfectoidSpaces:P3/henselisation-of-pairs); A/J = A^h/J^h, and A → A^h is a filtered colimit of étale maps, so the restriction of t_*G to Spec A/J equals that of t^h_*G, where t^h: Spec(K ⊗_A A^h) → Spec A^h (étale base change of push-forwards, passed to the colimit by continuity, AdicCoefficientsAndComparisons:L2). affine-henselian-comparison-3-2-5 for (A^h, J^h): H^i(Spec A^h/J^h, ·) = H^i(Spec A^h, t^h_*G). K ⊗_A A^h and K ⊗_A O^{sh} for the strict henselizations O^{sh} of A^h are filtered colimits of finite products of copies of K (an étale K-algebra of finite type is a finite product of finite separable extensions of K, i.e. of copies of K); their spectra are profinite sets of separably closed points, whose étale cohomology with torsion coefficients vanishes in positive degrees (SchemeAndStackFoundations:SF.2). Hence R^q t^h_*G = 0 for q ≥ 1, and Leray (DiamondsAndVStacks:D0/cech-to-derived-comparison) gives H^i(Spec A^h, t^h_*G) = H^i(Spec(K ⊗_A A^h), G) = 0 for i ≥ 1.

*Acceptance.* A = K, J = 0: the vanishing of H^i(Spec K, G) for separably closed K. A = ℤ_(p)[T], J = (p), K an algebraic closure of the fraction field: the input that Huber 1993 calls A_i, from which the Zariski–Riemann vanishing follows.

*Depends on* this stage: `affine-henselian-comparison-3-2-5`; elsewhere: `PerfectoidSpaces:P3/henselisation-of-pairs`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:IsSepClosed`.

#### Zariski–Riemann spaces as limits of models

*Node* `zariski-riemann-space-as-limit` (lemma). Let A be a ring, K a field and s: A → K a ring homomorphism. Let I be the category of triples (X, f, g) with X an integral scheme, f: X → Spec A projective and g: Spec K → X dominant with f ∘ g = Spec(s); between two objects there is at most one morphism, and I is cofiltered. Then the subspace {V ∈ Spv K : s(A) ⊆ V} of the Zariski–Riemann space Spv K (the valuation rings of K, topologised by the sets {V : a ∈ V}, a ∈ K) is homeomorphic, via the centre maps, to the projective limit lim_{(X, f, g) ∈ I} |X|; every |X| is spectral and the transition maps are spectral, so the limit is spectral. Lean: `ValuationSpectrum.zariskiRiemannHomeomorphLimit`.

*Hypotheses.* A arbitrary; K a field; 'projective' in the sense of EGA.

*Proof.* Centre maps: for V ∋ s(A), the valuative criterion of properness extends g uniquely to Spec V → X; the centre is the image of the closed point, compatible with morphisms of models. Cofiltered: two models are dominated by the closure of the image of Spec K in their fibre product over Spec A. Homeomorphism: Zariski's description (Zariski–Samuel, Commutative Algebra II, Chapter VI §17), as used in Huber 1993 Lemma 2.1 and in the proof of ECD Lemma 19.4; the set {V : a ∈ V} is the preimage of the open subset of the model given by the closure of the graph of a in ℙ¹_A where a is regular; limits of spectral spaces along spectral maps are spectral (DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces).

*Acceptance.* A = K, s = id: the only model is Spec K and the space is the single point {K}. A = ℤ, K = ℚ: the space is {ℤ_(p) : p prime} ∪ {ℚ}, homeomorphic to Spec ℤ, the final model.

*Depends on* elsewhere: `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0/locally-spectral-space`, `mathlib:ValuationRing`, `mathlib:SpectralSpace`, `tauceti:TauCeti.ValuationSpectrum`.

#### Étale is Zariski over normal schemes with separably closed function field

*Node* `etale-over-normal-separably-closed-local-isomorphism` (lemma). Let X be a normal integral scheme whose function field is separably closed, Y ⊆ X a closed subscheme and f: Z → Y an étale morphism. Then f is a local isomorphism: every z ∈ Z has an open neighbourhood mapped isomorphically onto an open subscheme of Y. Consequently the small étale topoi of X and of Y are equivalent to their Zariski topoi. Lean: `AlgebraicGeometry.isLocalIso_of_etale_of_isSepClosed_functionField`.

*Hypotheses.* X normal and integral with separably closed function field; Y closed; f étale.

*Proof.* Locally on Z, f is the restriction to Y of an étale morphism g: W → X (EGA IV 18.1.1: étale morphisms lift along closed immersions locally). g is a local isomorphism (EGA IV 18.10.8): each connected component of W is normal and integral with function field a finite separable extension of the separably closed function field of X, hence equal to it, so g is étale and birational onto its image, hence an open immersion on each component (Zariski's main theorem). The EGA IV §18 inputs are requested from the scheme étale owner (SchemeAndStackFoundations:SF.2).

*Acceptance.* For a valuation ring V with separably closed fraction field and any ideal 𝔞, (Spec V/𝔞)_et is equivalent to the Zariski site of Spec V/𝔞. ECD Lemma 19.4 uses this to identify étale and Zariski topoi of the models in the limit.

*Depends on* elsewhere: `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:IsSepClosed`.

#### Cohomology of Zariski–Riemann spaces

*Node* `zariski-riemann-cohomology-vanishing` (theorem). Let K be a separably closed field, E, F ⊆ K subsets, and Y := {V ∈ Spv K : E ⊆ V and F ⊆ 𝔪_V}, with the subspace topology of the Zariski–Riemann space Spv K. Then (a) H^n(Y, G) = 0 for every abelian torsion group G and every n ≥ 1 (sheaf cohomology of the constant sheaf on the topological space Y); (b) H^1(Y, G) is trivial for every ind-finite group G. Torsion is necessary: there are algebraically closed K and subsets E, F with H^1(Y, G) ≠ 0 for every group G containing an element of infinite order. Lean: `ValuationSpectrum.zariskiRiemann_cohomology_eq_zero`.

*Hypotheses.* K separably closed; E, F arbitrary subsets; G torsion (a), ind-finite (b).

*Proof.* Put A := ℤ[E ∪ F] ⊆ K and J := F·A. By zariski-riemann-space-as-limit, Y is the projective limit, over the models (X, f, g), of the closed subsets X̄ := X̃ ×_{Spec A} Spec A/J, where X̃ is the normalisation of X in K (Huber 1993, proof of Lemma 0.3). Each X̃ is normal and integral with separably closed function field, so the étale and Zariski topoi of X̃ and X̄ agree (etale-over-normal-separably-closed-local-isomorphism). The base change theorems for integral (SGA 4 VIII 5.6) and proper (SGA 4 XII 5.1) morphisms and the Leray spectral sequence give H^i(X̄, G) = H^i(Spec A/J, (t_*G)|) with t: Spec K → Spec A (Huber 1993, (2.2)–(2.3)). Cohomology of a cofiltered limit of spectral spaces along spectral maps is the colimit of the cohomologies (Huber 1993, Proposition 1.1(b); SGA 4 VI 8.7.7; requested from DiamondsAndVStacks:D0), so H^i(Y, G) = H^i(Spec A/J, (t_*G)|), which vanishes for i ≥ 1 by henselian-comparison-separably-closed-points. (b) is stated by Huber 1993 as Proposition 4.1 ('analogously to Theorem 0.2') without further proof: recorded as a gap.

*Acceptance.* E = F = ∅: Y = Spv K has the generic point K contained in every non-empty open subset, so constant sheaves are flasque and (a) is immediate. The application ECD Lemma 19.4 (the Zariski–Riemann space Spa(K′, V) of an extension of algebraically closed fields) is owned by DiamondEtaleCohomology:C5. The non-torsion counterexample recorded by Huber 1993 at the end of §4.

*Depends on* this stage: `zariski-riemann-space-as-limit`, `etale-over-normal-separably-closed-local-isomorphism`, `henselian-comparison-separably-closed-points`; elsewhere: `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:ValuationRing`, `mathlib:IsSepClosed`, `mathlib:CategoryTheory.Sheaf.H`.

### Pseudo-adic spaces over schemes, the comparison morphism, strict localisations and continuity

#### Fibre products with schemes and the site morphism (Huber 3.2.7–3.2.8)

*Node* `pseudo-adic-scheme-fibre-product` (construction). Let 𝒮 = (X, Σ) be a pseudo-adic space — an adic space X satisfying Huber's condition (AdicSpacesPartII:R0/locally-noetherian-adic-space) with a convex, locally pro-constructible subset Σ ⊆ |X| (the carrier and its étale site are ClassicalAdicEtaleCohomology:H0's) — with underlying locally ringed space ℓ(𝒮) := (Σ, O_X|_Σ), let Y be a scheme and g: ℓ(𝒮) → Y a morphism of locally ringed spaces. (3.2.7) For every scheme Z locally of finite type over Y there is a pseudo-adic space 𝒮 ×_Y Z = (X_Z, Σ_Z) with a morphism p: 𝒮 ×_Y Z → 𝒮 locally of finite type and a morphism of locally ringed spaces q: ℓ(𝒮 ×_Y Z) → Z over Y, universal among pseudo-adic spaces 𝒯 with a morphism 𝒯 → 𝒮 and a compatible morphism ℓ(𝒯) → Z; every pair (s, z) ∈ Σ × Z with g(s) = image of z is (p, q)(r) for some point r, and p is étale when Z → Y is. (3.2.8) Z ↦ 𝒮 ×_Y Z is a morphism of sites g^{-1}: Et/Y → Et/𝒮 from the small étale site of Y (Mathlib `smallEtaleTopology`) to the étale site of 𝒮; it induces g^*, Rg_* and the pullback maps H^n(Y_et, F) → H^n(𝒮_et, g^*F) for sheaves of sets, groups and abelian groups. Lean: `AdicSpace.PseudoAdic.schemeFibreProduct`, `AdicSpace.PseudoAdic.etaleSitePullback`.

*Hypotheses.* X satisfies Huber's condition; Σ convex and locally pro-constructible; Z locally of finite type over Y. g is defined on Σ only (germs of O_X along Σ).

*Proof.* Local construction: for Y = Spec R and Z = Spec R[T₁, …, T_m]/(f₁, …, f_k), the finitely many coefficients of the f_j lie in Γ(Σ, O_X|_Σ) = colim over open neighbourhoods W ⊇ Σ of O_X(W), hence are defined on some W; the fibre product of the adic space W with the finite type scheme Spec ℤ[coefficients][T]/(f) is AdicSpacesPartII:R1/scheme-fibre-product-analytification (Huber 1994, Proposition 3.8), and Σ_Z is the preimage of Σ. Independence of W and gluing over affine covers of Y and Z follow from its universal property. Points: Huber 1994, Lemma 3.9(i) (surjectivity onto compatible pairs; not injective). Étale: base change of étale morphisms (AdicEtaleGeometry:A1/etale-base-change); covering families go to covering families and finite limits are preserved, so g^{-1} is a morphism of sites.

*API.*

- `AdicSpace.PseudoAdic.schemeFibreProduct` (constructor): 𝒮 ×_Y Z for g: ℓ(𝒮) → Y and Z locally of finite type over Y.
- `AdicSpace.PseudoAdic.schemeFibreProduct.fst` (projection): p: 𝒮 ×_Y Z → 𝒮, locally of finite type.
- `AdicSpace.PseudoAdic.schemeFibreProduct.snd` (projection): q: ℓ(𝒮 ×_Y Z) → Z over Y.
- `AdicSpace.PseudoAdic.schemeFibreProduct.lift` (universal-property): The morphism 𝒯 → 𝒮 ×_Y Z from compatible 𝒯 → 𝒮 and ℓ(𝒯) → Z; lift_fst, lift_snd and uniqueness.
- `AdicSpace.PseudoAdic.schemeFibreProduct.surjective_points` (characterisation): Every compatible pair (s, z) comes from a point.
- `AdicSpace.PseudoAdic.schemeFibreProduct.isEtale_fst` (other): Z → Y étale ⇒ p étale.
- `AdicSpace.PseudoAdic.etaleSitePullback` (functoriality): g^{-1}: Et/Y ⥤ Et/𝒮 is a morphism of sites (continuous, cover preserving, finite limit preserving).
- `AdicSpace.PseudoAdic.etaleSitePullback_comp` (functoriality): Compatibility with composition of g with morphisms of schemes Y → Y′ and of pseudo-adic spaces 𝒯 → 𝒮.
- `AdicSpace.PseudoAdic.etaleCohomologyPullback` (other): H^n(Y_et, F) → H^n(𝒮_et, g^*F), natural in F.

*Unit tests.*

- `AdicSpace.PseudoAdic.schemeFibreProduct_test_identity` (degenerate): For Z = Y, 𝒮 ×_Y Y = 𝒮 and g^{-1}(Y) = 𝒮.
- `AdicSpace.PseudoAdic.schemeFibreProduct_test_line` (computation): For 𝒮 = Spa(A, A⁺) with A Tate, Y = Spec A and Z = A¹_Y, 𝒮 ×_Y Z is the relative analytic affine line, the increasing union of the relative closed discs of radius |ϖ|^{-n}.
- `AdicSpace.PseudoAdic.schemeFibreProduct_test_points_not_injective` (non-example): For 𝒮 = Spa(ℚ_p, ℤ_p) and Z = A¹_{ℚ_p}, all non-classical points of the analytic affine line lie over the generic point of Z: the map to the set-theoretic fibre product is surjective but not injective.
- `AdicSpace.PseudoAdic.schemeFibreProduct_test_analytification` (compatibility): For 𝒮 = Spa(K, K°), Y = Spec K, 𝒮 ×_Y Z = Z^ad of AdicSpacesPartII:R1/scheme-fibre-product-analytification.
- `AdicSpace.PseudoAdic.etaleSitePullback_test_hansen` (compatibility): For a K-affinoid A, g^{-1} for Spa(A, A°) → Spec A is Hansen's µ_X.

*Acceptance.* For a K-affinoid algebra A, 𝒮 = Spa(A, A°) and Y = Spec A, g^{-1} is the morphism of sites µ: (Spa A)_ét → (Spec A)_ét used by Hansen. For 𝒮 = Spa(K, K°) and Z locally of finite type over Y = Spec K, 𝒮 ×_Y Z is the analytification Z^ad of AdicSpacesPartII:R1.

*Depends on* elsewhere: `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `ClassicalAdicEtaleCohomology:H0`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-base-change`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Sheaf.H`; Tau Ceti anchor: `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`.

#### The comparison morphism γ (Huber 3.2.12)

*Node* `comparison-morphism-3-2-12` (construction). Let (A, A⁺) be a Huber pair, not necessarily complete, satisfying Huber's standing condition: the completion Â has a noetherian ring of definition or is a strongly noetherian Tate ring (the condition of AdicSpacesPartII:R0/locally-noetherian-adic-space), so that Spa(Â, Â⁺) is an adic space; let U ⊆ Spa(A, A⁺) be pro-special, 𝒰 := (Spa(Â, Â⁺), U) (a pseudo-adic space by special-subsets-locally-closed-constructible), A^▷ the underlying ring of A, Y := Spec A(U) (henselization-along-pro-special-subset), j: Y → Spec A^▷ and i: ℓ(𝒰) → Spec A^▷ the canonical morphisms. For a morphism of schemes f: X → Spec A^▷ locally of finite type put X′ := 𝒰 ×_{Spec A^▷} X (pseudo-adic-scheme-fibre-product) and X″ := Y ×_{Spec A^▷} X, with projections p′: X′ → X and p″: X″ → X. Huber 1996, 3.2.12 constructs a morphism of topoi γ_X: (X′_et)~ → (X″_et)~ with p″ ∘ γ_X ≅ p′, natural in X; for X = Spec A^▷ it is γ: (𝒰_et)~ → (Y_et)~ with j ∘ γ ≅ i. For A complete and U = Spa(A, A⁺), Y = Spec A^▷ and γ is the morphism of topoi of i^{-1} (pseudo-adic-scheme-fibre-product (3.2.8)). γ^* gives the comparison maps H^n(X″_et, F″) → H^n(X′_et, F′) for F on X_et. Lean: `AdicSpace.henselianComparison`.

*Hypotheses.* Standing condition on Â; U pro-special; f locally of finite type. No properness hypothesis: γ_X exists for every such X.

*Proof.* Reduction to a discrete affinoid ring A^d with pro-special U^d and comparison of (Spa A^d, U^d) with (Spa A, U) (Huber 1996, set-up of 3.3.3 and 3.4.4–3.4.5): only in Huber's book (gap). Discrete case: with A(U) = F^h, the discrete affinoid ring B := (A(U), (G^h)^c) and the tube V := {x ∈ Spa B : |j(x)| < 1 for j ∈ (J^h)^c}, put X‴ := V ×_{Spec B^▷} X″ = V ×_𝒰 X′. Then γ_X is the composite of the inverse of the equivalence (X‴_et)~ ≃ (X′_et)~ (Huber 1996 §§3.3–3.4; gap) with the morphism (X‴_et)~ → (X″_et)~ of pseudo-adic-scheme-fibre-product for the canonical ℓ((Spa B, V)) → Spec B^▷. Complete case U = Spa(A, A⁺): A(U) = A (complete-f-adic-ring-is-henselian and henselian-f-adic-rings-and-henselization (iv)); γ := the morphism of topoi of i^{-1}.

*API.*

- `AdicSpace.henselianComparison` (constructor): γ_X: (X′_et)~ → (X″_et)~ for f: X → Spec A^▷ locally of finite type.
- `AdicSpace.henselianComparison.snd_comp` (compatibility): p″ ∘ γ_X ≅ p′.
- `AdicSpace.henselianComparison.triangle` (compatibility): For X = Spec A^▷: j ∘ γ ≅ i.
- `AdicSpace.henselianComparison.of_complete` (example): The complete case γ = i^*.
- `AdicSpace.henselianComparison.naturality` (functoriality): Naturality in X over Spec A^▷.
- `AdicSpace.henselianComparison.restrict` (functoriality): Compatibility with shrinking U to a pro-special U₁ ⊆ U and the restriction A(U) → A(U₁).
- `AdicSpace.henselianComparison.cohomologyMap` (other): γ^*: H^n(X″_et, F″) → H^n(X′_et, F′) for F on X_et, natural in F.

*Unit tests.*

- `AdicSpace.henselianComparison_test_complete` (degenerate): For complete A and U = Spa(A, A⁺), γ = i^* (the canonical morphism of sites).
- `AdicSpace.henselianComparison_test_triangle` (characterisation): j ∘ γ ≅ i; hence γ^*(j^*F) ≅ i^*F for every sheaf F on (Spec A^▷)_et.
- `AdicSpace.henselianComparison_test_etale_base_change` (compatibility): For X₁ → X étale over Spec A^▷, γ_{X₁} is the restriction of γ_X along X₁′ → X′ and X₁″ → X″.
- `AdicSpace.henselianComparison_test_not_i` (non-example): For ℚ with the p-adic topology and U = Spa(ℚ, ℤ_(p)), replacing γ by i: 𝒰 → Spec ℚ fails: H^1 with ℤ/n-coefficients of Spec ℚ differs from that of Spa(ℚ_p, ℤ_p), while through Y = Spec(ℚ_p ∩ ℚ̄) they agree.

*Acceptance.* For A complete and U = Spa(A, A⁺), γ is the canonical morphism (Hansen's µ_X for affinoid rigid spaces). For ℚ with the p-adic topology (A⁺ = ℤ_(p)) and U = Spa(A, A⁺), a single point with étale site that of Spa(ℚ_p, ℤ_p): Y = Spec(ℚ_p ∩ ℚ̄), and γ identifies the Galois cohomology of ℚ_p with that of the henselian field ℚ_p ∩ ℚ̄, whereas i: 𝒰 → Spec ℚ does not induce isomorphisms.

*Depends on* this stage: `pseudo-adic-scheme-fibre-product`, `henselization-along-pro-special-subset`, `special-subsets-locally-closed-constructible`, `complete-f-adic-ring-is-henselian`, `henselian-f-adic-rings-and-henselization`; elsewhere: `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

#### Stalks via strict localisations

*Node* `strict-localisation-stalk-formula` (lemma). Let g: ℓ(𝒮) → Y be as in pseudo-adic-scheme-fibre-product (or γ as in comparison-morphism-3-2-12), F an abelian sheaf on 𝒮_et and ȳ a geometric point of Y with strict localisation Y(ȳ) = Spec O^{sh}_{Y,ȳ} = lim over the étale neighbourhoods (V, v̄) of ȳ. Then (R^q g_*F)_ȳ ≅ colim_{(V, v̄)} H^q((𝒮 ×_Y V)_et, F), the colimit over étale neighbourhoods (the stalk at the point of Mathlib `pointSmallEtale`); when 𝒮 is quasi-compact and quasi-separated, the fibre products form a Huber tilde-limit 𝒮(ȳ) := 𝒮 ×_Y Y(ȳ) ~ lim_V 𝒮 ×_Y V and the stalk is H^q(𝒮(ȳ)_et, F|) (continuity). The same holds for γ with 𝒮 ×_Y V replaced by γ^*V. Lean: `AdicSpace.PseudoAdic.stalk_higherDirectImage`.

*Hypotheses.* F abelian (for q = 0 sheaves of sets, for q ≤ 1 sheaves of groups); 𝒮 quasi-compact quasi-separated for the tilde-limit form.

*Proof.* R^q g_*F is the sheaf associated with V ↦ H^q(g^{-1}(V), F) (ClassicalAdicEtaleCohomology:H0/derived-direct-image; DiamondsAndVStacks:D0/cech-to-derived-comparison). Stalks at the point defined by ȳ are colimits over étale neighbourhoods (Mathlib `pointSmallEtale`). Tilde-limit form: the continuity theorem ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity (Huber 1996, Corollary 2.4.6), as in Huber 1996, Proposition 2.6.1 (ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation).

*Acceptance.* q = 0, 𝒮 = Spa(K, K⁺) → Y = Spec K for a complete nonarchimedean field K and ȳ = Spec K^sep: the formula gives colim over finite separable L ⊆ K^sep of F(Spa(L, L⁺)), the stalk of AdicEtaleGeometry:A1/strict-localisation-analytic (c). For 𝒮 = Spa(A, A°) with A a K-affinoid and Y = Spec A, the stalks of R^q µ_* at geometric points of Spec A are the cohomology groups of the analytic fibres over strictly henselian local rings.

*Depends on* this stage: `pseudo-adic-scheme-fibre-product`, `comparison-morphism-3-2-12`; elsewhere: `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `AdicEtaleGeometry:A1/strict-localisation`.

#### Continuity under cofiltered and finite-presentation limits

*Node* `comparison-continuity-under-limits` (lemma). (a) Let U = ⋂_λ U_λ be a cofiltered intersection of pro-special subsets of Spa(A, A⁺) (standing condition as in comparison-morphism-3-2-12). For every sheaf F of abelian groups (resp. groups, resp. sets) on (Spec A^▷)_et the natural maps colim_λ H^n(Spec A(U_λ), j_λ^*F) → H^n(Spec A(U), j^*F) and colim_λ H^n(𝒰_λ, i_λ^*F) → H^n(𝒰, i^*F) are bijective for all n (resp. n ≤ 1, resp. n = 0), compatibly with the comparison maps γ^*. Hence the comparison theorems for pro-special U follow from those for special U. (b) Let X → Spec A^▷ be of finite type with X quasi-compact and quasi-separated, written as X = lim_μ X_μ with X_μ → Spec A^▷ of finite presentation and closed immersions X ⊆ X_μ as transition maps, and F = colim_μ (pullback of F_μ). Then colim_μ H^n(X_μ″, F_μ″) ≅ H^n(X″, F″) and colim_μ H^n(X_μ′, F_μ′) ≅ H^n(X′, F′), compatibly with γ^*. Lean: `AdicSpace.henselianComparison_colimit`.

*Hypotheses.* Standing condition on Â; X qcqs in (b); degree ranges as for 3.2.9.

*Proof.* (a), scheme side: Spec A(U) = lim_λ Spec A(U_λ) with affine transition maps (pro-special-henselization-continuity), so étale cohomology commutes with the limit (Stacks Tag 09YQ; AdicCoefficientsAndComparisons:L2). (a), analytic side: (Spa, U) ~ lim_λ (Spa, U_λ) is a Huber tilde-limit (same underlying adic space; |U| = ⋂ |U_λ| = lim |U_λ| and the density condition is trivial; each U_λ is quasi-compact by special-subsets-locally-closed-constructible), so ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity applies. (b): X″ = lim X_μ″ with affine transition maps (Stacks Tag 09YQ) and X′ ~ lim X_μ′ is a tilde-limit of closed pseudo-adic subspaces (ClassicalAdicEtaleCohomology:H0/huber-tilde-limit); finite type as a limit of finite presentation with closed immersions is AdicCoefficientsAndComparisons:L2. Compatibility with γ^*: naturality of the comparison morphism (comparison-morphism-3-2-12, API restrict and naturality).

*Acceptance.* X = Spec A^▷/𝔞 with 𝔞 not finitely generated is the limit of the Spec A^▷/𝔞_μ over finitely generated 𝔞_μ ⊆ 𝔞, and both sides of the comparison for X are colimits of those for the Spec A^▷/𝔞_μ. For U = ⋂_n S(∅|{f_n}/1), the comparison for U is the colimit of the comparisons for the finite intersections.

*Depends on* this stage: `pro-special-henselization-continuity`, `comparison-morphism-3-2-12`, `special-subsets-locally-closed-constructible`; elsewhere: `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `AdicCoefficientsAndComparisons:L2`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

### The comparison theorems

#### Relative comparison (Huber 3.2.10)

*Node* `relative-comparison-3-2-9-3-2-12` (theorem). Let (A, A⁺) be a Huber pair, not necessarily complete, satisfying Huber's standing condition: the completion Â has a noetherian ring of definition or is a strongly noetherian Tate ring (the condition of AdicSpacesPartII:R0/locally-noetherian-adic-space); U ⊆ Spa(A, A⁺) pro-special, 𝒰 = (Spa(Â, Â⁺), U), Y = Spec A(U), i: ℓ(𝒰) → Spec A^▷ and j: Y → Spec A^▷ as in comparison-morphism-3-2-12. Let f: X → Spec A^▷ be a morphism of schemes such that (a) f is locally of finite type, and (b) with V := {𝔭 ∈ Spec A^▷ : 𝔭 is not open in A^▷} (an open subscheme) and g: f^{-1}(V) → V the restriction of f, g is proper at every x ∈ f^{-1}(V) such that f(x) specialises to a point of i(U) ∩ V (for separated g locally of finite type: proper at x iff universally specialising at x). Put X′ := 𝒰 ×_{Spec A^▷} X, X″ := Y ×_{Spec A^▷} X and let F be a sheaf of sets (resp. ind-finite groups, resp. abelian torsion groups) on X_et with pullbacks F′, F″. Then γ_X^*: H^n(X″_et, F″) → H^n(X′_et, F′) (comparison-morphism-3-2-12) is bijective for n = 0 (resp. n ∈ {0, 1}, resp. all n ≥ 0). The case X = Spec A^▷ is sheaf-comparison-3-2-9; condition (b) is what makes the comparison morphism of 3.2.12, which exists for every X locally of finite type, a cohomological isomorphism. Lean: `AdicSpace.henselianComparison_bijective`.

*Hypotheses.* Standing condition on Â; U pro-special; (a) and (b) as stated; coefficient types with their degree ranges.

*Proof.* Huber 1996 derives 3.2.12, and from it 3.2.10, from Theorem 3.3.3 and Lemmas 3.4.2–3.4.3: 3.3.3 (after the reduction to discrete A^▷, 3.4.4–3.4.5) compares X′ with X‴ = V ×_{Spec B^▷} X″ over the tube V ⊆ Spa B, B = (A(U), (G^h)^c); Lemma 3.4.2 (primary generalisations; q^*q_* ≅ id and H^n(W, G) ≅ H^n(Z, q^*G) when primary specialisations form chains) and Lemma 3.4.3 (condition (b) makes the relevant map universally primarily specialising with chain fibres) transport the cohomology. The statements and proofs of 3.3.3 and 3.4.2–3.4.5 are only in Huber's book: gap. Reduction of arbitrary X and pro-special U to finitely presented X and special U: comparison-continuity-under-limits.

*Acceptance.* Huber 1996, Example 3.2.11 (Fujiwara): A noetherian and henselian along I, X proper over Spec A ∖ V(I) — fujiwara-comparison-3-2-11. H5's proof of Theorem 3.7.2 applies 3.2.10 to the henselian pair (B, I) and the proper scheme X ×_S Spec B (verified excerpt). X = Spec A^▷ (f the identity, proper): sheaf-comparison-3-2-9.

*Depends on* this stage: `comparison-morphism-3-2-12`, `pseudo-adic-scheme-fibre-product`, `henselization-along-pro-special-subset`, `comparison-continuity-under-limits`; elsewhere: `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`.

#### Sheaves from Spec A^▷ (Huber 3.2.9)

*Node* `sheaf-comparison-3-2-9` (theorem). In the situation of comparison-morphism-3-2-12 (standing condition, U pro-special, Y = Spec A(U), j ∘ γ ≅ i), let F be a sheaf of sets (resp. ind-finite groups, resp. abelian torsion groups) on (Spec A^▷)_et. Then γ^*: H^n(Y_et, j^*F) → H^n(𝒰_et, i^*F) is bijective for n = 0 (resp. n ∈ {0, 1}, resp. all n ≥ 0). Lean: `AdicSpace.henselianComparison_bijective_of_spec`.

*Hypotheses.* As in comparison-morphism-3-2-12; F on (Spec A^▷)_et.

*Proof.* The case X = Spec A^▷ of relative-comparison-3-2-9-3-2-12: the identity is locally of finite type and proper, so (b) holds, and X′ = 𝒰, X″ = Y.

*Acceptance.* U = Spa(A, A°) for a K-affinoid algebra A (A complete, A(U) = A): Hansen's Theorem 1.7 (H^n(Spec A, F) ≅ H^n(Spa A, µ^*F) for every torsion abelian F), which Hansen deduces from the constant case affinoid-algebra-comparison-3-2-3 by cohomological descent — an independent public route for this case. H1:formal-adic-comparison, proof of Theorem 3.5.13 (principal-ideal case): H^n(U ×_X Z^h, K) = H^n(d(Ẑ), a^*K) (verified excerpt).

*Depends on* this stage: `relative-comparison-3-2-9-3-2-12`, `comparison-morphism-3-2-12`.

#### The fundamental comparison theorem (Huber 3.2.1)

*Node* `pro-special-comparison-theorem-3-2-1` (theorem). Let (A, A⁺) be a Huber pair, not necessarily complete, satisfying Huber's standing condition: the completion Â has a noetherian ring of definition or is a strongly noetherian Tate ring (the condition of AdicSpacesPartII:R0/locally-noetherian-adic-space); let U ⊆ Spa(A, A⁺) be a pro-special subset (special-and-pro-special-subsets), 𝒰 = (Spa(Â, Â⁺), U) the pseudo-adic space, Y = Spec A(U) (henselization-along-pro-special-subset) and γ: (𝒰_et)~ → (Y_et)~ the comparison morphism (comparison-morphism-3-2-12). For a set (resp. an ind-finite group, resp. an abelian torsion group) G with constant sheaves G_Y, G_𝒰, the maps γ^*: H^n(Y_et, G_Y) → H^n(𝒰_et, G_𝒰) are bijective for n = 0 (resp. n ∈ {0, 1}, resp. all n ≥ 0). The corollaries 3.2.2–3.2.3 are complete-affinoid-comparison-3-2-2 and affinoid-algebra-comparison-3-2-3, and the affine input Lemma 3.2.5 is affine-henselian-comparison-3-2-5. Lean: `AdicSpace.henselianComparison_constant_bijective`.

*Hypotheses.* Standing condition on Â; A need not be complete (which matters for the applications); U pro-special; constant coefficients.

*Proof.* For constant G: the case F = G_{Spec A^▷} of sheaf-comparison-3-2-9, since j^*G = G_Y and i^*G = G_𝒰 and γ^* is compatible with these identifications (j ∘ γ ≅ i). For sets and ind-finite groups the same case of Huber's Theorem 3.2.9 for sheaves of sets and ind-finite groups (its proof is in Huber 1996 §§3.3–3.4; gap).

*Acceptance.* Complete A and U = Spa(A, A⁺): complete-affinoid-comparison-3-2-2. A = ℚ with the p-adic topology, A⁺ = ℤ_(p), U = Spa(A, A⁺) (one point, with the étale site of Spa(ℚ_p, ℤ_p)): A(U) = ℚ_p ∩ ℚ̄ and the theorem is the equality of the Galois cohomology of the henselian field ℚ_p ∩ ℚ̄ and of ℚ_p with torsion coefficients (their absolute Galois groups coincide); Spec ℚ itself has different cohomology, which is why A(U) and not A^▷ appears. For a special U = S(∅|{T}/1) ⊆ Spa(ℤ_p[T], ℤ_p[T]) (p-adic topology), Y is the spectrum of the henselization of ℤ_p[T] along (p, T).

*Depends on* this stage: `sheaf-comparison-3-2-9`, `comparison-morphism-3-2-12`, `henselization-along-pro-special-subset`, `special-subsets-locally-closed-constructible`; elsewhere: `ClassicalAdicEtaleCohomology:H0`.

#### Complete affinoid rings (Huber 3.2.2)

*Node* `complete-affinoid-comparison-3-2-2` (theorem). Let (A, A⁺) be a complete Huber pair satisfying Huber's standing condition: the completion Â has a noetherian ring of definition or is a strongly noetherian Tate ring (the condition of AdicSpacesPartII:R0/locally-noetherian-adic-space), X = Spa(A, A⁺) and i^{-1}: Et/Spec A → Et/X the morphism of sites of pseudo-adic-scheme-fibre-product. For a set (resp. an ind-finite group, resp. an abelian torsion group) G, the maps H^n((Spec A)_et, G) → H^n(X_et, G) are bijective for n = 0 (resp. n ≤ 1, resp. all n). Lean: `AdicSpace.spec_spa_etaleCohomology_bijective`.

*Hypotheses.* A complete (Hausdorff); standing condition; constant coefficients.

*Proof.* U = Spa(A, A⁺) = S(∅|∅/1) is special, A(U) = A because A is henselian (complete-f-adic-ring-is-henselian) and its own henselization (henselian-f-adic-rings-and-henselization (iv)), and γ = i^* (comparison-morphism-3-2-12, complete case); apply pro-special-comparison-theorem-3-2-1.

*Acceptance.* n = 0, G = {0, 1}: connected components of Spa(A, A⁺) and of Spec A correspond (both are given by the idempotents of A). n = 1, G finite: G-torsors over Spec A and over Spa(A, A⁺) correspond; for finite étale covers this is compatible with AdicEtaleGeometry:A1/finite-etale-affinoid-algebra. A = ℚ_p⟨T⟩: H^n(Spec ℚ_p⟨T⟩, μ_ℓ) ≅ H^n(closed unit disc over ℚ_p, μ_ℓ).

*Depends on* this stage: `pro-special-comparison-theorem-3-2-1`, `comparison-morphism-3-2-12`, `complete-f-adic-ring-is-henselian`, `henselian-f-adic-rings-and-henselization`, `special-and-pro-special-subsets`, `pseudo-adic-scheme-fibre-product`.

#### Tate algebras of topologically finite type (Huber 3.2.3)

*Node* `affinoid-algebra-comparison-3-2-3` (theorem). Let k be a complete nonarchimedean field, A a Tate algebra topologically of finite type over k (a quotient of k⟨T₁, …, T_n⟩) and X = Spa(A, A°). For a set (resp. an ind-finite group, resp. an abelian torsion group) G, H^n((Spec A)_et, G) → H^n(X_et, G) is bijective for n = 0 (resp. n ≤ 1, resp. all n). Hansen (Theorem 1.7) extends the abelian case to every torsion abelian sheaf pulled back from Spec A; within this stage that extension is the case U = Spa(A, A°) of sheaf-comparison-3-2-9. Lean: `AdicSpace.tateAlgebra_spec_spa_etaleCohomology_bijective`.

*Hypotheses.* A topologically of finite type over k; A⁺ = A°; constant coefficients.

*Proof.* A is complete and strongly noetherian Tate (Tate algebras over k are strongly noetherian; anchor Layer 4), and A° is a ring of integral elements; apply complete-affinoid-comparison-3-2-2.

*Acceptance.* For k algebraically closed and ℓ invertible in the residue field: H^1(Spec k⟨T⟩, μ_ℓ) = k⟨T⟩^×/ℓ = 0 (units are c(1 + f) with c ∈ k^× and |f| < 1, and both factors are ℓ-th powers; Pic k⟨T⟩ = 0), matching H^1 of the closed unit disc. Hansen's Lemma 3.1 uses exactly this corollary for constant coefficients (ψ_{2,n}, ψ_{3,n}).

*Depends on* this stage: `complete-affinoid-comparison-3-2-2`; Tau Ceti anchor: `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`.

#### Fujiwara's comparison (Huber 3.2.11)

*Node* `fujiwara-comparison-3-2-11` (application). Let A be a noetherian ring henselian along an ideal I, with the I-adic topology (so (A, A) is a henselian Huber pair with A° = A: henselian-f-adic-ring), and let X be a scheme with a proper morphism X → Spec A ∖ V(I). Then for every abelian torsion sheaf F on X_et and every n: H^n(X_et, F) ≅ H^n((X ×_{Spec A} Spa(A, A))_et, F′). In particular, for X = Spec A ∖ V(I): H^n(Spec A ∖ V(I), F) ≅ H^n(Spa(A, A)_a, F′), where Spa(A, A)_a is the analytic locus (points with non-open support), the generic fibre of the formal completion (AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus). Lean: `AdicSpace.fujiwara_comparison`.

*Hypotheses.* A noetherian, henselian along I, with the I-adic topology; X proper over Spec A ∖ V(I); F torsion.

*Proof.* U := Spa(A, A) = S(∅|∅/1) is special and A(U) = A, since (A, I) is henselian (henselian-f-adic-rings-and-henselization (iv)). X → Spec A ∖ V(I) → Spec A is locally of finite type (A noetherian), and the open subscheme of non-open primes of A is V = Spec A ∖ V(I) (a prime is open for the I-adic topology iff it contains I), over which X is proper: conditions (a) and (b) hold. relative-comparison-3-2-9-3-2-12 with X″ = X; for X = Spec A ∖ V(I), X′ = Spa(A, A) ×_{Spec A} (Spec A ∖ V(I)) is the set of points whose support does not contain I, i.e. Spa(A, A)_a.

*Acceptance.* A a henselian discrete valuation ring with fraction field K and I = 𝔪: Spa(A, A)_a is the point Spa(K̂, Â) and the statement is H^n(Spec K, F) = H^n(Spa(K̂, Â), F): a henselian discretely valued field and its completion have the same Galois cohomology. AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus records this use: H^n(Spa(A, A)_a, F′) for noetherian A henselian along I.

*Depends on* this stage: `relative-comparison-3-2-9-3-2-12`, `henselian-f-adic-ring`, `henselian-f-adic-rings-and-henselization`, `special-and-pro-special-subsets`; elsewhere: `AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus`.

### Dependencies of H1:henselian

- `ClassicalAdicEtaleCohomology:H0` — pseudo-adic spaces and their étale sites, derived direct
  images, tilde-limits and their cohomological continuity (Huber 2.4.6), the stalk formula over
  strict localisations (Huber 2.6.1): `H0/pseudo-adic-etale-site`, `H0/huber-tilde-limit`,
  `H0/tilde-limits-and-cohomological-continuity`, `H0/derived-direct-image`,
  `H0/stalk-formula-strict-localisation`; their pseudo-adic forms are a gap recorded in H0.
- `AdicEtaleGeometry:A1` (étale sites and base change, strict localisations of analytic adic
  spaces), `AdicEtaleGeometry:A2` (`A2/formal-generic-fibre-analytic-locus` for Examples 3.1.13(iii)
  and 3.2.11).
- `AdicSpacesPartII:R0` (`locally-noetherian-adic-space`, `adic-ring-homomorphism`) and
  `AdicSpacesPartII:R1` (`scheme-fibre-product-analytification`, Huber 1994 Proposition 3.8).
- `PerfectoidSpaces:P3` (`henselian-pairs-colimits-and-completions`, `henselisation-of-pairs`).
- `DiamondsAndVStacks:D0` (spectral spaces and their limits, pro-constructible subsets, Čech and
  Leray comparisons; requested: cohomology of cofiltered limits of spectral spaces).
- `AdicCoefficientsAndComparisons:L2` (noetherian approximation, continuity of étale cohomology;
  requested).
- `SchemeAndStackFoundations:SF.2` (scheme étale cohomology inputs; requested).
- Tau Ceti anchor `tauceti:TauCetiRoadmap/AdicSpaces` Layers 0–5: Huber rings, power-bounded
  elements, pairs of definition, completion, rational localisation and its universal property,
  `Spa`, its spectrality and support criteria (all present at the pinned commit), and the adic
  space `Spa(Â, Â⁺)` and strong noetherianness of Tate algebras (Layers 4–5; requested).

Consumers: the umbrella `ClassicalAdicEtaleCohomology:H1`, `H1:formal-adic-comparison` (3.5.13,
3.5.8–3.5.10 and 3.6.1 use 3.1.11–3.1.13, 3.2.1, 3.2.9, 3.2.10), `H1:valuation-nearby-cycles`,
H5 (3.7.2 uses 3.2.10), `AdicEtaleGeometry:A4` (complete f-adic rings are henselian),
`DiamondEtaleCohomology:C5` (henselian comparison and the Zariski–Riemann vanishing),
`AdicCoefficientsAndComparisons:L5`.

### Acceptance tests of the stage

- `(A°, ϖA°)` is a henselian pair for every complete Tate ring, proved without Huber's book; the
  non-uniform ring `ℚ_p⟨T⟩[ε]/(ε²)` and the non-example `ℚ` with the 3-adic topology are checked.
- For `ℚ` with the `p`-adic topology: `A^h = ℚ_p ∩ ℚ̄`, `(A^h)^ = ℚ_p`, `Spec A(U)` for
  `U = Spa(ℚ, ℤ_(p))` is `Spec(ℚ_p ∩ ℚ̄)`, and the comparison is the equality of Galois
  cohomology of a henselian field and its completion — which fails for `Spec ℚ`.
- Gabber's theorem fails for the non-henselian pair `(ℤ_(3), 3)` with `ℤ/2`-coefficients
  (the double cover by `ℤ_(3)[√7]`).
- The Zariski–Riemann vanishing needs torsion coefficients (Huber's counterexample for groups
  with elements of infinite order).
- Complete affinoid rings: `π₀` and `H¹` with finite coefficients agree for `Spec A` and
  `Spa(A, A⁺)`; for Tate algebras over an algebraically closed field `H¹(Spec k⟨T⟩, μ_ℓ) = 0`.
- Fujiwara's comparison for a henselian discrete valuation ring is the equality of Galois
  cohomology of its fraction field and of the completion.

### Open proof obligations

The comparison morphism γ and the bijectivity in 3.2.9–3.2.12 rest on Huber 1996 §§3.3–3.4
(Theorem 3.3.3, Lemmas 3.4.2–3.4.5), which are not public; the independence and functoriality of
`A(U)` rest on the four steps of the proof of Huber 1996 3.1.12; the ind-finite part of the
Zariski–Riemann vanishing (Huber 1993, Proposition 4.1) has no written proof. Huber's Lemma 3.1.10
and Example 3.2.4 are not planned here: no verified excerpt or public restatement states them.

<a id="h1-formal-adic-comparison"></a>

## H1:formal-adic-comparison. Formal completion and the actual comparison map

<a id="h1-formal-adic-comparison"></a>
<a id="stage-H1:formal-adic-comparison"></a>

### H1:formal-adic-comparison — Formal completion and the actual comparison map

**Dependencies:** [AdicSpacesPartII F0](../AdicSpacesPartII/README.md#f0) (formal schemes of finite ideal type, ideals of definition and thickenings, adic morphisms, fibre products, colimits of thickenings, noetherian completion); [AdicSpacesPartII R2](../AdicSpacesPartII/README.md#r2) (formal schemes of type (S), Huber's generic fibre d(X), the specialisation map λ_X, tubes, the comparison σ and φ of (1.9.4)–(1.9.6), Raynaud generic fibres and completed base change); [AdicSpacesPartII R0, R1, R4](../AdicSpacesPartII/README.md#r0) (étale morphisms of adic spaces and (1.7.3), Huber's fibre product of a scheme with an adic space, rigid and adic étale topoi); [AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md#a1) (the étale site of an analytic adic space, geometric points, strict localisations); [ClassicalAdicEtaleCohomology H0](#h0) (sheaves of modules, derived direct images, pseudo-adic supports, constructible sheaves, Huber tilde-limits and continuity); [ClassicalAdicEtaleCohomology H1:henselian](#h1-henselian) (henselisations along pro-special subsets, Theorems 3.2.1, 3.2.9–3.2.10); [DiamondsAndVStacks D0](../DiamondsAndVStacks/README.md#d0) and [EnhancedDerivedSheaves E1](../EnhancedDerivedSheaves/README.md#e1) (spectral spaces, filtered colimits and Čech/Leray, derived categories); [LefschetzPencilsAndVanishingCycles LPV.0](../LefschetzPencilsAndVanishingCycles/README.md#lpv-0) (the trait nearby-cycle object RΨ); SchemeAndStackFoundations SF.2 (étale cohomology of schemes).

This stage builds the bridge between the étale cohomology of a formal scheme's special fibre and that of its analytic generic fibre, and between the nearby cycles of a scheme over a valuation ring and the cohomology of the generic fibre of its completion. The source is §§3.5–3.6 of Huber's book (Hub96), which is not public: every Hub96 citation below is one of the excerpts verified in the reviewed decompositions, and each statement is supported, where one exists, by a public restatement — Berkovich's *Vanishing cycles for formal schemes* (the same theory for Berkovich spaces over a henselian base of rank at most one), Hansen's *Vanishing and comparison theorems in rigid analytic geometry* (Huber's λ and his stalk formula 3.5.10), Bhatt–Hansen, Scholze's ECD (pseudo-adic supports), Fujiwara–Kato and the Stacks Project (topological invariance of the étale site).

Boundaries, stated once. AdicSpacesPartII R2 owns formal schemes of type (S), the generic-fibre functor d, the continuous specialisation map λ_X and tubes; this stage owns the étale site X_et of a type-(S) formal scheme, the morphism of étale sites λ_X: d(X)_et → X_et, pairs and their supports, and every comparison theorem of Hub96 §§3.5–3.6. H0 owns pseudo-adic spaces and their étale sites, derived direct images and tilde-limits; this stage produces objects of H0's categories. H1:henselian owns henselisations and the comparisons 3.2.1, 3.2.9, 3.2.10; this stage consumes their statements. LPV.0 owns the trait nearby-cycle object RΨ and its triangle; this stage identifies Huber's 'complex of vanishing cycles' with it and never constructs a second RΨ. The valuation-base nearby-cycle theory (Hub96 §4.2) is H1:valuation-nearby-cycles, and its exports are H1:valuation-exports.

#### Conventions

1. **Formal schemes.** Formal schemes are AdicSpacesPartII F0's formal schemes of finite ideal type; X is of type (S) (AdicSpacesPartII R2) if it is locally Spf A with A adic and either (a) noetherian or (b) with an ideal of definition sA such that the Tate ring A(1/s) is strongly noetherian. |X| = |X_red| is a locally spectral space (the underlying space of any thickening).
2. **Étale.** An étale morphism of type-(S) formal schemes is adic and étale modulo every ideal of definition, tested at all levels X_n, never only on X_0 or X_red; the source Y must itself be of type (S).
3. **Reduced special scheme.** X_red = (|X|, O_X/𝒯) with 𝒯 the ideal of topologically nilpotent sections; 𝒯 is not in general an ideal of definition (X = Spf O_{C_p}). X_et, (X_0)_et and (X_red)_et are identified by topological invariance, and 'the étale topos of X' means any of them.
4. **Generic fibre and λ.** d(X) is Huber's analytic adic space, λ_X: d(X) → |X| the continuous specialisation map, and λ_X: d(X)_et → X_et the morphism of sites with λ_X⁻¹(Y) = d(Y). The same letter denotes both; the stage never uses the rigid-analytic 'anticontinuous' specialisation.
5. **Supports.** For L ⊆ |X|, d(X, L) = (d(X), λ_X⁻¹(L)) uses the full preimage, not the tube ]L[ (its interior). For locally closed L it is a pseudo-adic space (local pro-constructibility tested at points of the subset), not an adic space in general.
6. **Coefficients.** E is a ring; the comparison maps exist for every E, and the isomorphisms 3.5.9–3.5.17 hold for every torsion ring E — including torsion divisible by the residue characteristic. No prime-to-p restriction is imposed in this stage; it belongs to the valuation-base-change theorem 4.2.4.
7. **Nearby versus vanishing cycles.** Huber's 'complex of vanishing cycles' RΨ_η(K) in 3.5.17 is the nearby-cycle object RΨ of SGA 7 XIII (LPV.0), with its inertia action; the cone RΦ never appears on the right-hand side of 3.5.17.
8. **Derived categories.** D⁺ denotes the bounded-below derived category of sheaves of E-modules (EnhancedDerivedSheaves E1, H0); R⁺f_* its right derived direct image.

#### The étale site of a formal scheme of type (S)

Huber's X_et is built from formal schemes étale over X; its underlying category is equivalent to the small étale site of any thickening and of the reduced special scheme, which is how the stage's clause 'identify X_et with the reduced special scheme's étale topos' is realised.

<a id="formal-etale-morphism"></a>
**Étale morphisms of formal schemes of type (S)** — `formal-etale-morphism` (definition; `TauCeti/AlgebraicGeometry/FormalScheme/EtaleSite`)

Let X and Y be formal schemes of type (S) (AdicSpacesPartII:R2/formal-schemes-of-type-S; formal schemes of finite ideal type in the sense of AdicSpacesPartII:F0, locally Spf A with A adic and either noetherian or with an ideal of definition sA such that the Tate ring A(1/s) is strongly noetherian). A morphism f: Y → X is étale (`FormalScheme.Hom.IsEtale`) if (a) f is adic: for one, equivalently every, ideal of definition 𝒥 of X the ideal f*(𝒥)·O_Y is an ideal of definition of Y; and (b) for every open U ⊆ X and every ideal of definition 𝒥 ⊆ O_U, the morphism of schemes f⁻¹(U) ×_U (U, O_U/𝒥) → (U, O_U/𝒥) is étale (Mathlib `AlgebraicGeometry.Etale`). Equivalent form of (b), used in proofs: for an open cover X = ∪ U_α and ideals of definition of finite type 𝒥_α ⊆ O_{U_α}, every reduction f_{α,n}: f⁻¹(U_α) ×_{U_α} (U_α, O/𝒥_α^{n+1}) → (U_α, O/𝒥_α^{n+1}), n ≥ 0, is étale. Pinned conventions: the source Y is required to be of type (S); étaleness is tested at every level n, never only on the reduction modulo one ideal of definition or on the reduced special scheme; no separatedness or quasi-compactness is imposed.

*Hypotheses.* X, Y formal schemes of type (S); the reductions are schemes because the ideals of definition are of finite type (AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type). Equivalence of the two forms of (b): an ideal of definition 𝒥' of a quasi-compact open U contains 𝒥^m for an ideal of definition 𝒥 of finite type, and étale morphisms are stable under base change.

*Proof.* (b) ⇔ (b'): (b) ⇒ (b') trivially; conversely, given (b') and an ideal of definition 𝒥' on an open U, work locally on quasi-compact affine opens V ⊆ U ∩ U_α, where 𝒥_α^{m} ⊆ 𝒥' for some m (𝒥' is open); then f⁻¹(V) ×_V (V, O/𝒥') is the base change of f_{α,m-1} along the closed immersion (V, O/𝒥') → (V, O/𝒥_α^{m}), hence étale (Mathlib `AlgebraicGeometry.Etale.etale_isStableUnderBaseChange`); étaleness is local on the target. Independence of the ideal of definition in (a): AdicSpacesPartII:F0/adic-morphism-of-formal-schemes and AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type (adicness over S is tested with one ideal of definition of finite type). The API items are proved levelwise: composition, base change and cancellation from the corresponding Mathlib properties of `AlgebraicGeometry.Etale` on each reduction X_n, using that for adic f the reductions satisfy Y_n = Y ×_X X_n (AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type); base change uses AdicSpacesPartII:F0/formal-fibre-product and the type-(S) statement of node etale-lifting-along-special-fibre.

*API.*

- `FormalScheme.Hom.IsEtale` (structure): f: Y → X between type-(S) formal schemes is étale: adic, and every reduction f⁻¹(U) ×_U (U, O_U/𝒥) → (U, O_U/𝒥) (U open, 𝒥 an ideal of definition) is an étale morphism of schemes.
- `FormalScheme.Hom.isEtale_iff_forall_thickening` (characterisation): For an ideal of definition 𝒥 of finite type on X with thickenings X_n = (X, O_X/𝒥^{n+1}): IsEtale f ↔ f adic ∧ ∀ n, Y ×_X X_n → X_n is étale.
- `FormalScheme.Hom.IsEtale.comp` (functoriality): Composites of étale morphisms are étale; identities are étale.
- `FormalScheme.Hom.IsEtale.of_isOpenImmersion` (instance): Open immersions of type-(S) formal schemes are étale.
- `FormalScheme.Hom.IsEtale.baseChange` (functoriality): For f: Y → X étale and any morphism g: X' → X of type-(S) formal schemes, X' ×_X Y is of type (S) and the projection X' ×_X Y → X' is étale.
- `FormalScheme.Hom.IsEtale.of_comp` (relation): If g ∘ f and g are étale then f is étale; in particular every X-morphism between objects étale over X is étale.
- `FormalScheme.Hom.IsEtale.reduction` (compatibility): If f is étale then Y ×_X X_red = Y_red and Y_red → X_red is an étale morphism of schemes (X_red as in node reduced-special-scheme-equivalence).
- `FormalScheme.Hom.isEtale_ofScheme_iff` (compatibility): For a morphism of locally noetherian schemes, viewed as formal schemes with the discrete topology: IsEtale ↔ AlgebraicGeometry.Etale.
- `FormalScheme.Hom.isEtale_iff_smoothFormal` (compatibility): For formal O_K-schemes locally of tf presentation (K complete of rank one), IsEtale agrees with étaleness in AdicSpacesPartII:R2/smooth-formal-scheme.

*Unit tests.*

- `FormalScheme.isEtale_test_unramifiedExtension` (computation): Spf W(F_{p^n}) → Spf Z_p is IsEtale for every n ≥ 1, while Spf Z_p[√p] → Spf Z_p (p odd, p-adic topologies) is adic and not IsEtale because Spec F_p[x]/(x²) → Spec F_p is not étale.
- `FormalScheme.isEtale_test_reductionOnly` (non-example): Spf F_p → Spf Z_p (p-adic topology on Z_p, discrete on F_p) is adic and an isomorphism modulo p, but Spec F_p → Spec Z/p² is not flat; so it is not IsEtale, and a definition testing only the reduction modulo one ideal of definition (or on X_red) would wrongly accept it.
- `FormalScheme.isEtale_test_notAdic` (non-example): Spf Z_p[[T]] with the (p,T)-adic topology → Spf Z_p with the p-adic topology is not adic (p·Z_p[[T]] is not an ideal of definition), hence not IsEtale.
- `FormalScheme.isEtale_test_openImmersion` (degenerate): The identity of X and, for X = Spf A and f ∈ A, the open immersion Spf A_{f} → Spf A (A_{f} the completed localisation, AdicSpacesPartII:F0/completed-localization) are IsEtale.
- `FormalScheme.isEtale_test_scheme` (compatibility): For locally noetherian schemes X, Y regarded as formal schemes with the discrete topology (ideal of definition 0; type (S) via (a)), a morphism is IsEtale iff it is étale in Mathlib's sense `AlgebraicGeometry.Etale`.

*Acceptance.* Spf W(F_{p^n}) → Spf Z_p (p-adic topologies) is étale; Spf Z_p[√p] → Spf Z_p is adic but not étale (its reduction Spec F_p[x]/(x²) → Spec F_p is ramified). Spf F_p → Spf Z_p is adic and its reduction modulo p is an isomorphism, but modulo p² it is the non-flat closed immersion Spec F_p → Spec Z/p², so it is not étale.

*Uses:* `AdicSpacesPartII:F0/adic-morphism-of-formal-schemes`, `AdicSpacesPartII:F0/ideal-of-definition`, `AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type`, `AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type`, `AdicSpacesPartII:F0/formal-fibre-product`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.Etale.etale_isStableUnderBaseChange`, `mathlib:AlgebraicGeometry.Etale.etale_comp`, `mathlib:AlgebraicGeometry.Etale.of_comp`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`.

*Sources:* Berkovich-VanishingCyclesFormal-1994 §2, before Lemma 2.1, printed p. 542; Stacks-Project Tag 039R (Étale Morphisms of Schemes, Theorem 41.15.2); Huber-EtaleCohomology-1996 §3.5, p. 201.

<a id="etale-site-of-type-S-formal-scheme"></a>
**The étale site X_et of a formal scheme of type (S)** — `etale-site-of-type-S-formal-scheme` (definition (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/EtaleSite`) — planet: *Étale site of a formal scheme*

Let X be a formal scheme of type (S). Its étale site X_et has underlying category Et/X = `FormalScheme.SmallEtale X`: the objects are the formal schemes Y of type (S) with an étale structure morphism Y → X (node formal-etale-morphism), the morphisms are all X-morphisms (automatically étale, `FormalScheme.Hom.IsEtale.of_comp`); its Grothendieck topology `FormalScheme.smallEtaleTopology X` is generated by the pretopology of jointly surjective families: (g_i: Y_i → Y)_i covers Y iff |Y| = ∪_i g_i(|Y_i|). Et/X has the final object X and fibre products (`FormalScheme.Hom.IsEtale.baseChange`), hence finite limits, and the Zariski opens of X are objects. Functoriality: a morphism h: X' → X of type-(S) formal schemes gives the continuous, finite-limit-preserving functor Et/X → Et/X', Y ↦ X' ×_X Y, hence a morphism of sites h_et: X'_et → X_et, with (h ∘ h')_et ≅ h_et ∘ h'_et and id_et = id. The topos of X_et is written X~. Huber identifies X_et with the étale site of the reduced special scheme X_red; that identification is the separate node reduced-special-scheme-equivalence.

*Hypotheses.* X of type (S); the objects of Et/X are required to be of type (S). Coverings count all points of the underlying spaces |Y| = |Y_red| (not only closed points). Imports: node formal-etale-morphism; AdicSpacesPartII:F0/formal-fibre-product for fibre products.

*Proof.* Finite limits: the final object X; fibre products Y ×_Z Y' in formal schemes (AdicSpacesPartII:F0/formal-fibre-product) are étale over X and of type (S) by `FormalScheme.Hom.IsEtale.baseChange` and node etale-lifting-along-special-fibre (ii). Pretopology axioms: isomorphisms cover; jointly surjective families are stable under base change because |Y ×_X Y'| = |Y_red ×_{X_red} Y'_red| and the underlying set of a fibre product of schemes surjects onto the fibre product of the underlying sets; composition of jointly surjective families is jointly surjective. Package as a Mathlib `Pretopology` on the category Et/X and take the generated topology, as Mathlib does for `AlgebraicGeometry.Scheme.smallEtaleTopology`. Functoriality: base change along h preserves étaleness and type (S) (`FormalScheme.Hom.IsEtale.baseChange`), finite limits and jointly surjective families; so Y ↦ X' ×_X Y is continuous (Mathlib `CategoryTheory.Functor.IsContinuous`) and gives h_et with pushforward `CategoryTheory.Functor.sheafPushforwardContinuous` and pullback `CategoryTheory.Functor.sheafPullback`.

*API.*

- `FormalScheme.SmallEtale` (constructor): The category Et/X of type-(S) formal schemes étale over X, with all X-morphisms.
- `FormalScheme.SmallEtale.hasFiniteLimits` (instance): Et/X has a final object (X) and fibre products, hence all finite limits.
- `FormalScheme.smallEtalePretopology` (structure): The pretopology of jointly surjective families on Et/X.
- `FormalScheme.smallEtaleTopology` (structure): The Grothendieck topology on Et/X generated by smallEtalePretopology.
- `FormalScheme.ofArrows_mem_smallEtaleTopology_iff` (characterisation): A family (g_i: Y_i → Y) generates a covering sieve iff |Y| = ∪ g_i(|Y_i|).
- `FormalScheme.SmallEtale.map` (functoriality): A morphism h: X' → X of type-(S) formal schemes gives the continuous finite-limit-preserving functor Y ↦ X' ×_X Y, with map_id and map_comp isomorphisms.
- `FormalScheme.etaleSheafPushforward` (constructor): h_{et,*}: Sheaf(X'_et) ⥤ Sheaf(X_et), (h_*F)(Y) = F(X' ×_X Y).
- `FormalScheme.etaleSheafPullback` (constructor): h_et^*, left adjoint to h_{et,*} (Mathlib sheafPullback and sheafAdjunctionContinuous).
- `FormalScheme.SmallEtale.ofOpens` (other): The Zariski site of X embeds into Et/X (U ↦ U), continuously; used for Huber's Remark 3.5.2.
- `FormalScheme.smallEtaleTopology_eq_formalEtaleSiteInvariance` (compatibility): For X locally tfp over O_K, X_et is the étale site of AdicSpacesPartII:R2/formal-etale-site-invariance.

*Unit tests.*

- `FormalScheme.smallEtale_test_Spf_Zp` (computation): For X = Spf Z_p, SmallEtale X is equivalent to the category of étale F_p-schemes; {Spf W(F_{p²}) → Spf Z_p} is a covering and Sheaf(X_et, Type) is equivalent to continuous Ẑ-sets.
- `FormalScheme.smallEtale_test_field` (degenerate): For X = Spec k with k a field and the discrete topology, X_et is the small étale site of Spec k; for X = ∅ the site is trivial and its topos is the one-point topos of the empty covering (every sheaf is terminal).
- `FormalScheme.smallEtale_test_missesClosedPoint` (non-example): For X = Spf Z_p[[T]] with the p-adic topology (X_red = Spec F_p[[T]]), the open immersion {Spf Z_p[[T]]{T} → X} is not a covering: it misses the closed point T = 0 of X_red although it contains the generic point.
- `FormalScheme.smallEtale_test_scheme` (compatibility): For a locally noetherian scheme X with the discrete topology, FormalScheme.smallEtaleTopology X is Mathlib's AlgebraicGeometry.Scheme.smallEtaleTopology X under the equivalence of categories given by FormalScheme.Hom.isEtale_ofScheme_iff.
- `FormalScheme.smallEtale_test_slice` (characterisation): For Y ∈ Et/X the site Y_et is the slice site X_et/Y.

*Acceptance.* For X = Spf Z_p, X_et is equivalent to (Spec F_p)_et: its sheaves of sets are the continuous Ẑ-sets, and the one-element family {Spf W(F_{p²}) → Spf Z_p} is a covering. X_et depends only on the reduced special scheme (node reduced-special-scheme-equivalence); this is the stage's clause 'identify X_et with the reduced special scheme's étale topos'.

*Uses:* [formal-etale-morphism](#formal-etale-morphism), `AdicSpacesPartII:F0/formal-fibre-product`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, p. 201; Huber-EtaleCohomology-1996 §2.1, p. 109; Berkovich-VanishingCyclesFormal-1994 §2, Lemma 2.1, printed p. 542.

<a id="etale-lifting-along-special-fibre"></a>
**Étale formal schemes over X are the lifts of étale schemes over a thickening; local form Spf B^ with B étale** — `etale-lifting-along-special-fibre` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/EtaleSite`)

Let X be a formal scheme of type (S), 𝒥 ⊆ O_X an ideal of definition of finite type and X_n = (X, O_X/𝒥^{n+1}). (i) The functor Et/X → Et/X_0 (Mathlib `AlgebraicGeometry.Scheme.Etale X_0`), Y ↦ Y_0 := Y ×_X X_0, is an equivalence of categories; a quasi-inverse sends an étale X_0-scheme V to the formal scheme attached to the adic system (V_n)_n of its unique étale lifts V_n → X_n. (ii) If X = Spf A with A as in (S), J ⊆ A the corresponding finitely generated ideal of definition, and B an étale A-algebra with J-adic completion B^, then Spf B^ → Spf A is étale and Spf B^ is of type (S) (A noetherian ⇒ B^ noetherian; in case (b), B^(1/s) is topologically of finite type over A(1/s), hence strongly noetherian); every object of Et/Spf A is covered by open formal subschemes of this form, and B may be taken standard étale.

*Hypotheses.* X of type (S); 𝒥 of finite type (exists locally). Imports: Stacks 039R (EGA IV 18.1.2) at each level; AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type; the type-(S) stability of completions of morphisms locally of finite type (AdicSpacesPartII:R2/formal-schemes-of-type-S, API FormalScheme.IsTypeS.completion, Huber (1.9.5)).

*Proof.* Level-wise lifting: X_0 ⊆ X_n is a closed immersion with the same underlying space, so V ↦ V ×_{X_n} X_0 is an equivalence from étale X_n-schemes to étale X_0-schemes (Stacks 039R); the lifts (V_n) form an adic inductive system over (X_n) (the squares are cartesian by full faithfulness). Pass to formal schemes: AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type turns (V_n) into a formal scheme Y adic over X with Y ×_X X_n = V_n; each V_n → X_n is étale, so Y → X is étale in the sense of node formal-etale-morphism once Y is known to be of type (S). Local form and type (S): affine-locally V = Spec of an étale A/J-algebra, which lifts to a (standard) étale A-algebra B (lift a standard étale presentation (A/J)[T]_g/(f) to A[T]_g/(f)); then V_n = Spec B/J^{n+1}B and Y = Spf B^ (Stacks 05GG: B^ is J-adically complete with B^/J^{n+1}B^ = B/J^{n+1}B). Spec B → Spec A is of finite presentation, so Spf B^ is of type (S) by FormalScheme.IsTypeS.completion; in case (b) this is the statement that B^(1/s) is a quotient of A(1/s)⟨T_1, …, T_r⟩ and hence strongly noetherian. Full faithfulness of Y ↦ Y_0 on Et/X: morphisms of adic formal schemes over X are compatible systems of morphisms of the X_n-schemes (AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type), and each level is determined by level 0 (Stacks 039R).

*Acceptance.* For X = Spf Z_p, the étale F_p-scheme Spec F_{p^n} lifts to Spf W(F_{p^n}); for X = Spf O_C⟨T⟩ (C = C_p) the étale k̄[T]-algebra k̄[T, T^{-1}] lifts to Spf O_C⟨T, T^{-1}⟩, which is of type (S) via (b) though O_C⟨T, T^{-1}⟩ is not noetherian.

*Uses:* [formal-etale-morphism](#formal-etale-morphism), `AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type`, `AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type`, `AdicSpacesPartII:F0/formal-fibre-product`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:Algebra.Etale`, `mathlib:AdicCompletion`, `tauceti:TauCeti.Huber.IsStronglyNoetherian`.

*Sources:* Berkovich-VanishingCyclesFormal-1994 §2, Lemma 2.1, printed p. 542; Stacks-Project Tag 039R (Étale Morphisms of Schemes, Theorem 41.15.2); Huber-EtaleCohomology-1996 §1.9, condition (S), p. 96.

<a id="reduced-special-scheme-equivalence"></a>
**X_et is the étale site of the reduced special scheme X_red** — `reduced-special-scheme-equivalence` (comparison; `TauCeti/AlgebraicGeometry/FormalScheme/EtaleSite`)

Let X be a formal scheme of type (S) and 𝒯 ⊆ O_X the ideal of sections vanishing at every point (affine-locally the ideal √J of topologically nilpotent elements of A, J an ideal of definition). Then X_red := (|X|, O_X/𝒯) is a reduced scheme with underlying space |X|; for every ideal of definition 𝒥 one has 𝒥 ⊆ 𝒯 and X_red → X_𝒥 = (X, O_X/𝒥) is a closed immersion which is a homeomorphism, hence a universal homeomorphism. The functor ρ_X: Et/X → Et/X_red, Y ↦ Y ×_X X_red (= Y_red), is an equivalence of categories which preserves finite limits and preserves and reflects coverings; hence ρ_X is an equivalence of sites X_et ≃ (X_red)_et and induces an equivalence of topoi X~ ≃ (X_red)~. It is natural in X: for a morphism h: X' → X of type-(S) formal schemes, ρ_{X'} ∘ (X' ×_X −) ≅ (X'_red ×_{X_red} −) ∘ ρ_X. In general 𝒯 is not an ideal of definition (for X = Spf O_{C_p}, 𝒯 = m and m² = m), so X_red need not be any thickening X_𝒥.

*Hypotheses.* X of type (S). Imports: Stacks 04DZ (topological invariance for universal homeomorphisms) and 039R; node etale-lifting-along-special-fibre.

*Proof.* X_red is a scheme: affine-locally X_red|_{Spf A} = Spec(A/√J), and 𝒯 is compatible with completed localisation (√J·A_{f} = √(J A_{f})); gluing as for AdicSpacesPartII:F0/ideal-of-definition. Equivalence of categories: compose the equivalence Et/X ≃ Et/X_0 of node etale-lifting-along-special-fibre (i) with Et/X_0 ≃ Et/X_red, which holds because X_red → X_0 is a universal homeomorphism (Stacks 04DZ, or 039R since X_red ⊆ X_0 has a nil ideal). Coverings: |Y| = |Y_red| for every Y ∈ Et/X, so a family is jointly surjective in Et/X iff its image is jointly surjective in Et/X_red; finite limits are preserved by base change. Topoi: an equivalence of categories preserving and reflecting coverings is a dense subsite (Mathlib `CategoryTheory.Functor.IsDenseSubsite`), so sheaf categories are equivalent (`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`). Naturality: (X' ×_X Y)_red = X'_red ×_{X_red} Y_red for Y étale over X (both are reduced and étale over X'_red with the same points).

*Acceptance.* X = Spf O_{C_p}: X_red = Spec k̄ (k̄ = F̄_p) while no ideal of definition 𝒥 has O/𝒥 = k̄; still X_et ≃ (Spec k̄)_et is trivial (every covering has a section). For X locally tfp over O_K this is AdicSpacesPartII:R2/formal-etale-site-invariance (a), and it is the identification (X^)_et ≅ Y_et used to define b in Huber's (3.5.12).

*Uses:* [etale-site-of-type-S-formal-scheme](#etale-site-of-type-S-formal-scheme), [etale-lifting-along-special-fibre](#etale-lifting-along-special-fibre), `AdicSpacesPartII:R2/formal-etale-site-invariance`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `SchemeAndStackFoundations:SF.2`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, p. 201; Stacks-Project Tag 04DZ (Étale Cohomology, Theorem 59.45.2); Stacks-Project Tag 04DY (Étale Cohomology, Section 59.45); Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, statement (†), p. 16.

#### The specialisation morphism λ_X (3.5.1–3.5.2)

The functor Y ↦ d(Y) from étale formal schemes to étale adic spaces is a morphism of sites because d preserves étaleness and fibre products and because points lift along étale maps through λ. Huber proves the point-lifting with a primary-generalisation lemma of Huber–Knebusch ([HK, 2.1.3], not in the library); the node below proves it by going-down for the flat map V → B ⊗_A V and the extension of valuation rings, all available in Mathlib.

<a id="generic-fibre-of-etale-morphism"></a>
**The generic fibre of an étale morphism of type-(S) formal schemes is étale; d preserves the fibre products of étale objects (Lemma 3.5.1(i), first part)** — `generic-fibre-of-etale-morphism` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Etale`)

Let f: Y → X be an étale morphism of formal schemes of type (S) (node formal-etale-morphism). (i) d(f): d(Y) → d(X) is an étale morphism of adic spaces (Huber's sense, AdicSpacesPartII:R0/differentials-unramified-smooth-etale; equivalently AdicEtaleGeometry A1's, AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison, since d(X) is analytic and locally noetherian), and λ_X ∘ d(f) = f ∘ λ_Y. (ii) If X = Spf A with A as in (S), J ⊆ A the ideal of definition and Y = Spf B^ for an étale A-algebra B, then the comparison morphism φ: d(Spf B^) → Spec B ×_{Spec A} d(Spf A) of Huber (1.9.5) (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison, with Spec B ×_{Spec A} d(Spf A) the fibre product of AdicSpacesPartII:R1/scheme-fibre-product-analytification) is an open embedding. (iii) For an étale Y → X and an adic morphism g: X' → X of type-(S) formal schemes, the natural morphism d(X' ×_X Y) → d(X') ×_{d(X)} d(Y) is an isomorphism; in particular d(Y ×_X Y') ≅ d(Y) ×_{d(X)} d(Y') for Y, Y' ∈ Et/X, and d sends open immersions to open immersions.

*Hypotheses.* f étale between type-(S) formal schemes; g adic in (iii). Imports: Huber (1.7.3) (a scheme étale over Spec D gives an adic space étale over Spa A, AdicSpacesPartII:R0/etale-local-structure) and Proposition 1.9.6 (φ is a local isomorphism, injective for separated f).

*Proof.* Reduce to the local form of (ii) by node etale-lifting-along-special-fibre (ii); étaleness of adic morphisms is local on source and target. (ii): Spec B → Spec A is étale, hence locally of finite type and separated (affine); by Huber 1.9.6(i),(ii) (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison) φ is a local isomorphism and injective, hence an open embedding. (i): Spec B ×_{Spec A} d(X) → d(X) is étale by (1.7.3) (AdicSpacesPartII:R0/etale-local-structure: base change to an adic space of an étale scheme morphism); open embeddings are étale and étale morphisms compose (AdicSpacesPartII:R0/differentials-unramified-smooth-etale). The equation λ_X ∘ d(f) = f ∘ λ_Y is the naturality of λ (AdicSpacesPartII:R2/specialisation-map). (iii): locally X' = Spf A', Y = Spf B^; then X' ×_X Y = Spf (A' ⊗_A B)^ with A' ⊗_A B étale over A', and by (ii) twice d(X' ×_X Y) is an open subspace of Spec(A' ⊗_A B) ×_{Spec A'} d(X') = (Spec B ×_{Spec A} d(X)) ×_{d(X)} d(X') (transitivity of Huber's fibre product, AdicSpacesPartII:R1/scheme-fibre-product-analytification), and the two open subspaces coincide because φ is natural and both have the points t with |b(t)| ≤ 1 for b ∈ A' ⊗ B; open immersions: AdicSpacesPartII:R2/generic-fibre-functor-d.

*Acceptance.* For X = Spf Z_p and Y = Spf W(F_{p²}), d(f) is Spa(Q_{p²}, Z_{p²}) → Spa(Q_p, Z_p), finite étale of degree 2. For X = Spf Z_p⟨T⟩ and the open immersion Spf Z_p⟨T⟩{T} → X, d(f) is the open immersion of the rational subset {|T| ≥ 1} = {|T| = 1}.

*Uses:* [formal-etale-morphism](#formal-etale-morphism), [etale-lifting-along-special-fibre](#etale-lifting-along-special-fibre), `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`.

*Sources:* Huber-EtaleCohomology-1996 §1.9, Proposition 1.9.6, p. 98; Huber-EtaleCohomology-1996 §1.7, Corollary 1.7.3, pp. 85-86; Berkovich-VanishingCyclesFormal-1994 §3, opening, printed p. 543; Berkovich-VanishingCyclesFormal-1994 §1, printed p. 542.

<a id="specialization-point-lifting"></a>
**Lifting of points along étale maps through the specialization map (Lemma 3.5.1(i), second part)** — `specialization-point-lifting` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Etale`)

Let f: Y → X be an étale morphism of formal schemes of type (S). For every y ∈ |Y| and every s ∈ d(X) with f(y) = λ_X(s) there is t ∈ d(Y) with λ_Y(t) = y and d(f)(t) = s. Consequently, if a family (g_i: Y_i → Y) in Et/X is jointly surjective on |Y|, then (d(g_i): d(Y_i) → d(Y)) is jointly surjective on d(Y).

*Hypotheses.* f étale; y a point of the underlying space (equivalently of Y_red); s any point of d(X), of any rank. The proof replaces Huber's appeal to [HK, 2.1.3] (lifting of primary generalizations in valuation spectra, a source not in the library) by going-down for the flat map V → B ⊗_A V and the extension of valuation rings.

*Proof.* Reduce to X = Spf A (A as in (S), ideal of definition J) and Y = Spf B^ with B étale over A (node etale-lifting-along-special-fibre (ii)); the points of d(Spf A) are the continuous valuations v on A with v ≤ 1 on A and non-open support (Tau Ceti `TauCeti.ValuationSpectrum.spaAnalytic` for the Huber pair of AdicSpacesPartII:R2/generic-fibre-functor-d), and λ_X(s) = {a : v_s(a) < 1} (AdicSpacesPartII:R2/specialisation-map). Let p = supp(v_s) (`TauCeti.ValuationSpectrum.supp`), K_s = Frac(A/p) and V ⊆ K_s the valuation ring of v_s, so A → V has kernel p and pulls the maximal ideal m_V back to q := λ_X(s). The prime y of B lies over q. B_V := B ⊗_A V is étale over V (Mathlib `Algebra.Etale.baseChange`), hence smooth (`Algebra.Etale.iff_formallyUnramified_and_smooth`) and flat (`Algebra.Smooth.flat`), so V → B_V has going-down (`Algebra.HasGoingDown.of_flat`). The ring κ(y) ⊗_{κ(q)} (V/m_V) is nonzero (a tensor product of two field extensions of κ(q)), so there is a prime Q_0 of B_V lying over m_V and over y. By going-down (`Ideal.exists_ideal_le_liesOver_of_le`) there is a prime Q_1 ⊆ Q_0 lying over (0) ⊆ V. R := (B_V/Q_1)_{Q_0} is a local domain dominating V whose fraction field L = κ(Q_1) is a finite separable extension of K_s. By `LocalSubring.exists_le_valuationSubring` there is a valuation subring W ⊆ L dominating R; W ∩ K_s dominates V and is a valuation ring, hence equals V (`ValuationSubring.isMax_toLocalSubring`). Let t be the valuation of B with valuation ring W via B → B_V → B_V/Q_1 ⊆ L. Then t ≤ 1 on B, supp(t) = Q_1 ∩ B lies over p (so is not open), the centre {b : t(b) < 1} equals Q_0 ∩ B = y (W dominates R), and t restricts to v_s on A (W ∩ K_s = V). The value group of t contains that of v_s with torsion quotient ([L : K_s] < ∞), so t is continuous for the J-adic topology and extends to B^: t ∈ d(Y) with λ_Y(t) = y and d(f)(t) = s. Coverings: given t' ∈ d(Y), put y' = λ_Y(t'); choose i and y_i ∈ Y_i with g_i(y_i) = y'; apply the first part to g_i (étale) to get t_i ∈ d(Y_i) over t'.

*Acceptance.* For X = Spf Z_p, Y = Spf W(F_{p²}), s the unique point of d(X) and y the closed point of Y: t is the unique point of Spa(Q_{p²}, Z_{p²}). For a rank-two point s of d(Spf Z_p⟨T⟩) with λ(s) the closed point (p, T) and an étale neighbourhood Y of (p,T), the lift t has rank two as well (its value group has the rank of v_s): the lemma does not only lift rank-one points.

*Uses:* [formal-etale-morphism](#formal-etale-morphism), [etale-lifting-along-special-fibre](#etale-lifting-along-special-fibre), `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.iff_formallyUnramified_and_smooth`, `mathlib:Algebra.Smooth.flat`, `mathlib:Algebra.HasGoingDown.of_flat`, `mathlib:Ideal.exists_ideal_le_liesOver_of_le`, `mathlib:LocalSubring.exists_le_valuationSubring`, `mathlib:ValuationSubring.isMax_toLocalSubring`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic`, `tauceti:TauCeti.ValuationSpectrum.supp`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Lemma 3.5.1, p. 202; Huber-EtaleCohomology-1996 §3.5, proof of Lemma 3.5.1, p. 202.

<a id="specialization-morphism-of-sites-lambda"></a>
**The specialization morphism of sites λ_X: d(X)_et → X_et (Lemma 3.5.1(ii), Remark 3.5.2)** — `specialization-morphism-of-sites-lambda` (construction (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Etale`) — planet: *Specialization morphism λ_X*

Let X be a formal scheme of type (S) and d(X) its generic fibre (AdicSpacesPartII:R2/generic-fibre-functor-d), an analytic, locally strongly noetherian adic space with étale site d(X)_et (AdicEtaleGeometry:A1/etale-site). The functor u_X: Et/X → Et/d(X), Y ↦ (d(Y) → d(X)), is well defined (node generic-fibre-of-etale-morphism (i)), preserves the final object and fibre products (same node, (iii)) and sends coverings to coverings (node specialization-point-lifting); hence it is continuous and defines a morphism of sites λ_X: d(X)_et → X_et with λ_X⁻¹ = u_X, direct image (λ_{X*}F)(Y) = F(d(Y)) and exact inverse image λ_X^* left adjoint to λ_{X*}. Properties: (a) (Remark 3.5.2) for Zariski opens U ⊆ X, u_X(U) = d(U) = λ_X⁻¹(U), so on Zariski sites λ_X is the continuous map λ_X of AdicSpacesPartII:R2/specialisation-map; (b) for an adic morphism g: X' → X of type-(S) formal schemes, u_{X'}(X' ×_X Y) ≅ d(X') ×_{d(X)} u_X(Y) naturally in Y, so g_et ∘ λ_{X'} ≅ λ_X ∘ d(g)_et as morphisms of topoi; (c) composed with X_et ≃ (X_red)_et (node reduced-special-scheme-equivalence) λ_X is a morphism of sites d(X)_et → (X_red)_et sending an étale X_red-scheme V to d(Ṽ), Ṽ the unique étale lift of V; (d) for a geometric point ξ: Spa(C, C⁺) → d(X) with support x (AdicEtaleGeometry:A1/etale-site-and-geometric-points), u_X maps étale neighbourhoods of the point λ_X(ξ) of X~ to étale neighbourhoods of ξ, and (λ_X^*F)_ξ ≅ F_{λ_X(ξ)}.

*Hypotheses.* X of type (S); d(X)_et is AdicEtaleGeometry A1's site, which on the locally noetherian analytic space d(X) is Huber's (AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison). Sheaves with values in sets, abelian groups or E-modules (ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules).

*Proof.* Well defined: node generic-fibre-of-etale-morphism (i) gives d(Y) → d(X) étale; morphisms go to morphisms by functoriality of d. Finite limits: final object X ↦ d(X); fibre products by node generic-fibre-of-etale-morphism (iii). Coverings: node specialization-point-lifting. A continuous functor preserving finite limits between sites with finite limits defines a morphism of sites: λ_{X*} = `CategoryTheory.Functor.sheafPushforwardContinuous`, λ_X^* = `CategoryTheory.Functor.sheafPullback`, adjunction `CategoryTheory.Functor.sheafAdjunctionContinuous`; λ_X^* is exact because u_X preserves finite limits. (a) from AdicSpacesPartII:R2/generic-fibre-functor-d (d(U) → d(X) is the open immersion with image λ_X⁻¹(U)). (b) from node generic-fibre-of-etale-morphism (iii). (c) from node reduced-special-scheme-equivalence. (d) the fibre functor of ξ composed with u_X is a point of X_et (points compose with morphisms of sites); the stalk formula is the definition of the composite point (Mathlib `CategoryTheory.GrothendieckTopology.Point`); its identification with a geometric point of X_red is node constructibility-and-stalks-of-lambda-pullback.

*API.*

- `FormalScheme.specialisationFunctor` (data): u_X: FormalScheme.SmallEtale X ⥤ AdicSpace.smallEtale (d X), Y ↦ d(Y).
- `FormalScheme.specialisationFunctor.isContinuous` (instance): u_X is continuous for smallEtaleTopology and AdicSpace.smallEtaleTopology and preserves finite limits.
- `FormalScheme.specialisationPushforward` (constructor): λ_{X*}: Sheaf(d(X)_et) ⥤ Sheaf(X_et), (λ_*F)(Y) = F(d(Y)).
- `FormalScheme.specialisationPullback` (constructor): λ_X^*: Sheaf(X_et) ⥤ Sheaf(d(X)_et), exact.
- `FormalScheme.specialisationAdjunction` (universal-property): λ_X^* ⊣ λ_{X*}.
- `FormalScheme.specialisationFunctor_opens` (compatibility): u_X(U) = d(U) = λ_X⁻¹(U) for Zariski opens U (Remark 3.5.2).
- `FormalScheme.specialisationFunctor_map` (functoriality): For adic g: X' → X, u_{X'}(X' ×_X Y) ≅ d(X') ×_{d(X)} u_X(Y) naturally in Y; hence g_et ∘ λ_{X'} ≅ λ_X ∘ d(g)_et.
- `FormalScheme.specialisationRed` (equivalence): The composite of λ_X with X_et ≃ (X_red)_et; its inverse image sends an étale X_red-scheme V to d of the étale lift of V.
- `FormalScheme.specialisation_stalk` (other): For a geometric point ξ of d(X): (λ_X^*F)_ξ ≅ F_{λ_X(ξ)}, the stalk at the composite point.
- `FormalScheme.specialisationPushforward_sections` (simp): Γ(X_et, λ_{X*}F) = Γ(d(X)_et, F).

*Unit tests.*

- `FormalScheme.specialisation_test_Spf_OK` (computation): For X = Spf O_K (K complete, rank one, residue field k), u_X sends Spf O_L (L/K finite unramified) to Spa(L, O_L); λ_{X*} of the sheaf given by a continuous Gal(K^sep/K)-set M is the Gal(k^sep/k)-set M^{I_K}.
- `FormalScheme.specialisation_test_zariski` (compatibility): For an open U ⊆ X, u_X(U) = d(U) is the open subspace λ_X⁻¹(U) of AdicSpacesPartII:R2/specialisation-map.
- `FormalScheme.specialisation_test_notEssSurj` (non-example): For X = Spf Z_p, the finite étale cover Spa(Q_p(√p)) → Spa(Q_p, Z_p) is not isomorphic to u_X(Y) for any Y ∈ Et/X: λ_X is a morphism of sites, not an equivalence.
- `FormalScheme.specialisation_test_cover` (characterisation): u_X sends the covering {Spf W(F_{p²}) → Spf Z_p} to the covering {Spa(Q_{p²}) → Spa(Q_p)}.
- `FormalScheme.specialisation_test_empty` (degenerate): If X is a scheme with the discrete topology (ideal of definition 0), d(X) = ∅, λ_{X*}F = * (the terminal sheaf) for every F.

*Acceptance.* λ_X restricted to Zariski sites is the continuous map λ of Huber 1.9.1. For X = Spf O_K (K complete of rank one) λ is a homeomorphism of one-point spaces and λ_{X*} on sheaves of sets is the functor 'inertia invariants' from continuous Gal(K^sep/K)-sets to continuous Gal(k^sep/k)-sets.

*Uses:* [etale-site-of-type-S-formal-scheme](#etale-site-of-type-S-formal-scheme), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), [generic-fibre-of-etale-morphism](#generic-fibre-of-etale-morphism), [specialization-point-lifting](#specialization-point-lifting), `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.GrothendieckTopology.Point`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Lemma 3.5.1, p. 202; Huber-EtaleCohomology-1996 §3.5, proof of Lemma 3.5.1, p. 202; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, statement (†), p. 16; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, statement (†), p. 16; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, statement (†), p. 16; BhattHansen-ZariskiConstructible-2022 §4.1, Theorem 4.2 (Properties of the perverse t-structure), item (8).

<a id="higher-direct-images-of-lambda"></a>
**Higher direct images R^nλ_*F: sheafification, stalks as colimits, and the Leray spectral sequence** — `higher-direct-images-of-lambda` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Etale`)

Let X be a formal scheme of type (S), E a ring and F a sheaf of E-modules on d(X)_et. (i) R^nλ_{X*}F is the sheaf on X_et associated with the presheaf Y ↦ H^n(d(Y), F|_{d(Y)}). (ii) For a geometric point ȳ of X_red (a point of X~ via node reduced-special-scheme-equivalence), (R^nλ_{X*}F)_ȳ = colim H^n(d(Y), F), the colimit over the cofiltered category of étale neighbourhoods (Y, u) of ȳ in X_et. (iii) For K ∈ D⁺(d(X)_et, E) there is a natural isomorphism R⁺Γ(d(X), K) ≅ R⁺Γ(X_red, R⁺λ_{X*}K) and a spectral sequence E_2^{pq} = H^p(X_red, R^qλ_{X*}K) ⇒ H^{p+q}(d(X), K).

*Hypotheses.* X of type (S); E any ring; K bounded below. The same statements hold for λ_{(X,L)} (node pair-specialization-morphism) with (X,L)_et ≃ (L_red)_et.

*Proof.* (i) and (iii) are the instances, for the morphism of sites λ_X of node specialization-morphism-of-sites-lambda, of the general statements owned by ClassicalAdicEtaleCohomology:H0/derived-direct-image (R^qf_* as the sheafification of U ↦ H^q(f⁻¹U, −); Leray for a composite of morphisms of sites), built on DiamondsAndVStacks:D0/cech-to-derived-comparison and EnhancedDerivedSheaves:E1. (ii) stalks of a sheafification are the colimits of the presheaf over neighbourhoods (Mathlib `CategoryTheory.GrothendieckTopology.Point.presheafFiber`), filtered colimits being exact (DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites). Replace X_et by (X_red)_et using node reduced-special-scheme-equivalence.

*Acceptance.* For X = Spf O_K with K complete discretely valued and ℓ ≠ p: (R^1λ_*Z/ℓ)_{s̄} = H^1(I_K, Z/ℓ) ≅ Z/ℓ(−1) and (R^nλ_*Z/ℓ)_{s̄} = 0 for n ≥ 2 (node stalk-formula-constant-coefficients-3-5-10).

*Uses:* [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `mathlib:CategoryTheory.GrothendieckTopology.Point`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`.

*Sources:* Berkovich-VanishingCyclesFormal-1994 §4, Proposition 4.1(ii), printed p. 548; Berkovich-VanishingCyclesFormal-1994 §4, Corollary 4.2(iii), printed p. 548; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, statement (†), p. 16; Berkovich-VanishingCyclesFormal-1994 Introduction, printed p. 540.

#### Pairs, supports and the topos of a pair (3.5.3–3.5.6)

For a locally closed subset L of the special fibre, the pseudo-adic space d(X, L) carries the analytic points specialising into L, and λ restricts to λ_(X,L): d(X, L)_et → (X, L)_et ≃ (L_red)_et. The inverse image λ^* is harmless — it preserves stalks and constructibility — so all cohomology of the comparison comes from R⁺λ_*.

<a id="pairs-and-pseudo-adic-supports"></a>
**Pairs (X, L) and the pseudo-adic support spaces d(X, L) (3.5.3)** — `pairs-and-pseudo-adic-supports` (construction (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`) — planet: *Pseudo-adic support space d(X,L)*

A pair (X, L) consists of a formal scheme X of type (S) and a subset L ⊆ |X| (= |X_red|). A morphism of pairs f: (X', L') → (X, L) is a morphism of formal schemes f: X' → X with f(L') ⊆ L; it is adic when f is. The support space of (X, L) is the prepseudo-adic space d(X, L) := (d(X), λ_X⁻¹(L)): the adic space d(X) (AdicSpacesPartII:R2/generic-fibre-functor-d) together with the subset λ_X⁻¹(L) of its underlying space (λ_X the continuous map of AdicSpacesPartII:R2/specialisation-map). Since λ_X is spectral on affine formal opens (Huber (1.9.3)), λ_X⁻¹(L) is convex and locally pro-constructible whenever L is, and then d(X, L) is a pseudo-adic space (the carrier of ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). In particular d(X, L) is pseudo-adic for every locally closed L ⊆ |X|, the case used in 3.5.6–3.5.16 (with the convention that local pro-constructibility of a subset S is tested at the points of S, under which locally closed subsets of locally spectral spaces qualify). An adic morphism of pairs induces d(f): d(X', L') → d(X, L), because λ_X ∘ d(f) = f ∘ λ_{X'}. Pinned conventions: the support is the full preimage λ_X⁻¹(L), not the tube ]L[ = interior of λ_X⁻¹(L) of AdicSpacesPartII:R2/tube; d(X, |X|) = d(X) as a pseudo-adic space; for L' ⊆ L the identity of X is a morphism of pairs i: (X, L') → (X, L) and d(i) is the inclusion of supports.

*Hypotheses.* X of type (S); L ⊆ |X| arbitrary for the prepseudo-adic space, convex and locally pro-constructible (e.g. locally closed) for the pseudo-adic space. Pseudo-adic spaces, their morphisms and étale sites are owned by ClassicalAdicEtaleCohomology:H0 (request recorded); this node only produces objects of that category.

*Proof.* λ_X is continuous and spectral on affine formal opens (AdicSpacesPartII:R2/generic-fibre-functor-d, API genericFibre_spectralSpace, Huber (1.9.3)). Preimages: continuous maps preserve specialisation, so preimages of convex sets are convex; preimages of pro-constructible sets under spectral maps are pro-constructible (DiamondsAndVStacks:D0/pro-constructible-subsets); hence λ_X⁻¹(L) is convex and locally pro-constructible when L is. Locally closed L = U ∩ Z (U open, Z closed): at a point of L choose a quasi-compact open V ⊆ U; then L ∩ V = Z ∩ V is closed in V, hence pro-constructible (DiamondsAndVStacks:D0/pro-constructible-subsets); convexity of locally closed sets is immediate. Functoriality: for adic f, d(f) exists (AdicSpacesPartII:R2/generic-fibre-functor-d) and d(f)(λ_{X'}⁻¹(L')) ⊆ λ_X⁻¹(f(L')) ⊆ λ_X⁻¹(L) by naturality of λ.

*API.*

- `FormalScheme.Pair` (structure): A pair (X, L): X a formal scheme of type (S), L ⊆ |X|.
- `FormalScheme.Pair.Hom` (constructor): Morphisms of pairs f: (X', L') → (X, L), f(L') ⊆ L; identities and composition make pairs a category.
- `FormalScheme.Pair.supportSpace` (data): d(X, L) = (d(X), λ_X⁻¹(L)), a prepseudo-adic space.
- `FormalScheme.Pair.isPseudoAdic_supportSpace` (instance): If L is convex and locally pro-constructible (in particular locally closed) then d(X, L) is a pseudo-adic space.
- `FormalScheme.Pair.supportSpace_map` (functoriality): An adic morphism of pairs f induces d(f): d(X', L') → d(X, L), with d(id) = id and d(g ∘ f) = d(g) ∘ d(f).
- `FormalScheme.Pair.supportSpace_univ` (simp): d(X, |X|) = d(X).
- `FormalScheme.Pair.supportSpace_mono` (relation): For L' ⊆ L the identity of X is a morphism of pairs i: (X, L') → (X, L) and d(i) is the inclusion of supports λ_X⁻¹(L') ⊆ λ_X⁻¹(L).
- `FormalScheme.Pair.supportSpace_isOpen` (compatibility): For L = U open, d(X, U) = d(U) (the open subspace λ_X⁻¹(U)).
- `FormalScheme.Pair.supportSpace_isClosed` (other): For L closed, the support λ_X⁻¹(L) is closed in d(X) and contains the tube ]L[ as its interior (AdicSpacesPartII:R2/tube).

*Unit tests.*

- `FormalScheme.Pair.supportSpace_test_closedPoint` (computation): X = Spf Z_p⟨T⟩, L = {(p, T)}: the support of d(X, L) is {x : |T(x)| < 1}, closed and not open in d(X), and it contains the rank-two point η_{1⁻}.
- `FormalScheme.Pair.supportSpace_test_notTube` (non-example): In the previous example the support λ_X⁻¹(L) is strictly larger than the tube ]L[ of AdicSpacesPartII:R2/tube (it contains η_{1⁻}); a definition by tubes gives a different pseudo-adic space.
- `FormalScheme.Pair.supportSpace_test_univ` (degenerate): d(X, |X|) = d(X) and d(X, ∅) is the empty pseudo-adic space.
- `FormalScheme.Pair.supportSpace_test_open` (compatibility): For X = Spf A and L = D(f) open, d(X, L) = d(Spf A_{f}), the rational subset {|f| ≥ 1} = {|f| = 1} of d(X) with its full support.
- `FormalScheme.Pair.supportSpace_test_microbialRankTwo` (computation): For A a microbial valuation ring of rank two with fraction field K and X = Spf A, d(X) = Spa(K, A) has two points (A and its rank-one generization K°); for L the closed point of X, the support of d(X, L) is the closed point of Spa(K, A) only.

*Acceptance.* For X = Spf Z_p⟨T⟩ and L the closed point (p, T): λ_X⁻¹(L) = {|T| < 1} is closed and not open in d(X); it contains the rank-two point η_{1⁻} which is not in the tube ]L[ (the open disc).

*Uses:* `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `AdicSpacesPartII:R2/tube`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `DiamondsAndVStacks:D0/locally-spectral-space`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, (3.5.3), p. 203; Huber-EtaleCohomology-1996 §3.5, (3.5.5), p. 204; Huber-EtaleCohomology-1996 §2.6, Proposition 2.6.1, p. 138; Scholze-EtaleCohomologyDiamonds Remark 19.3, pp. 108-109; Scholze-EtaleCohomologyDiamonds §20 opening, p. 109.

<a id="pair-etale-site"></a>
**The étale site (X, L)_et of a pair (3.5.3) and its functoriality (3.5.4, first part)** — `pair-etale-site` (construction; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let (X, L) be a pair (node pairs-and-pseudo-adic-supports). The site (X, L)_et has objects the pairs (Y, S) with Y ∈ Et/X (structure map g: Y → X) and S an open subset of g⁻¹(L) (subspace topology); morphisms (Y', S') → (Y, S) are X-morphisms h: Y' → Y with h(S') ⊆ S; a family (h_i: (Y_i, S_i) → (Y, S)) is a covering iff S = ∪ h_i(S_i). The category has the final object (X, L) and fibre products (Y_1, S_1) ×_{(Y,S)} (Y_2, S_2) = (Y_1 ×_Y Y_2, pr_1⁻¹(S_1) ∩ pr_2⁻¹(S_2)). The topos is (X, L)~. For L = |X| the functor Y ↦ (Y, |Y|) induces an equivalence X~ ≃ (X, |X|)~. A morphism of pairs f: (X', L') → (X, L) induces a morphism of sites f_et: (X', L')_et → (X, L)_et with inverse image functor (Y, S) ↦ (X' ×_X Y, pr⁻¹(S) ∩ q⁻¹(L')) (q: X' ×_X Y → X'), compatible with composition. For L' ⊆ L the identity of X gives i: (X, L')_et → (X, L)_et with (Y, S) ↦ (Y, S ∩ g⁻¹(L')); when L' is open in L, i^* has the exact left adjoint i_! (extension by zero) and i^*i_! = id.

*Hypotheses.* (X, L) a pair; L arbitrary for the site, locally closed in 3.5.5–3.5.16. Coverings only test the supports S: (Y, S) can be covered by objects (Y', S') with Y' → Y not surjective.

*Proof.* Fibre products: pr_1⁻¹(S_1) ∩ pr_2⁻¹(S_2) is open in the preimage of L; the universal property is checked on formal schemes (node etale-site-of-type-S-formal-scheme) and on subsets. Pretopology axioms: stability under base change uses that |Y_1 ×_Y Y_2| → |Y_1| ×_{|Y|} |Y_2| is surjective (as in node etale-site-of-type-S-formal-scheme); composition is clear. (X, |X|)~ ≃ X~: (Y, S) is covered by the single object (Y|_S, |Y|_S|) (S open in |Y| gives an open formal subscheme), so Y ↦ (Y, |Y|) is a dense subsite (Mathlib `CategoryTheory.Functor.IsDenseSubsite`), and sheaf categories are equivalent (`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`). Functoriality: base change preserves étaleness and type (S) (`FormalScheme.Hom.IsEtale.baseChange`); preimages of open subsets are open; coverings go to coverings by surjectivity on fibre products of underlying sets; so the inverse-image functor is continuous and preserves finite limits. Extension by zero for L' open in L: the inverse-image functor (Y, S) ↦ (Y, S ∩ g⁻¹(L')) has a left adjoint on presheaves which preserves sheaves and is exact, as for an open immersion (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero for the analogous pseudo-adic statement).

*API.*

- `FormalScheme.Pair.SmallEtale` (constructor): The category of pairs (Y, S), Y ∈ Et/X, S open in g⁻¹(L).
- `FormalScheme.Pair.smallEtaleTopology` (structure): Coverings: (h_i: (Y_i, S_i) → (Y, S)) with S = ∪ h_i(S_i).
- `FormalScheme.Pair.SmallEtale.hasFiniteLimits` (instance): Final object (X, L) and fibre products (Y_1 ×_Y Y_2, pr_1⁻¹S_1 ∩ pr_2⁻¹S_2).
- `FormalScheme.Pair.SmallEtale.map` (functoriality): A morphism of pairs f: (X', L') → (X, L) gives the continuous finite-limit-preserving functor (Y, S) ↦ (X' ×_X Y, pr⁻¹S ∩ q⁻¹L'), with map_id and map_comp.
- `FormalScheme.Pair.toposUnivEquiv` (equivalence): X~ ≃ (X, |X|)~ induced by Y ↦ (Y, |Y|).
- `FormalScheme.Pair.restrictSupport` (data): For L' ⊆ L, the morphism of sites i: (X, L')_et → (X, L)_et, with i^*(Y, S) = (Y, S ∩ g⁻¹L').
- `FormalScheme.Pair.extendByZero` (constructor): For L' open in L, i_!: left adjoint of i^* on sheaves of E-modules, exact, with i^* i_! ≅ id and i''^* i_! = 0 for the closed complement L'' = L − L'.
- `FormalScheme.Pair.ofArrows_mem_smallEtaleTopology_iff` (characterisation): A family generates a covering sieve iff the images of the supports cover S.

*Unit tests.*

- `FormalScheme.Pair.smallEtale_test_univ` (degenerate): (X, |X|)~ ≃ X~, and (X, ∅)~ is the one-point topos: every object (Y, ∅) is covered by the empty family.
- `FormalScheme.Pair.smallEtale_test_closedPoint` (computation): For X = Spf Z_p⟨T⟩ and L the closed point (p, T), (X, L)~ is equivalent to the category of continuous Gal(F̄_p/F_p)-sets.
- `FormalScheme.Pair.smallEtale_test_neighbourhood` (characterisation): For an open neighbourhood U of L, the one-element family {(U, L) → (X, L)} is a covering of (X, L) although U → X is not surjective: the site only sees L.
- `FormalScheme.Pair.smallEtale_test_notPointwise` (non-example): For L ≠ ∅, the one-element family {(X, ∅) → (X, L)} given by the identity of X with empty support is not a covering of (X, L), although its underlying morphism of formal schemes is an isomorphism; a definition testing coverings on Y instead of on the supports S would accept it.
- `FormalScheme.Pair.smallEtale_test_scheme` (compatibility): For X a locally noetherian scheme with the discrete topology and L locally closed, (X, L)~ is the étale topos of the reduced subscheme L_red (node pair-topos-reduced-subscheme-3-5-5).

*Acceptance.* For L = {y} a closed point, (X, {y})~ is the étale topos of Spec κ(y) (node pair-topos-reduced-subscheme-3-5-5).

*Uses:* [pairs-and-pseudo-adic-supports](#pairs-and-pseudo-adic-supports), [etale-site-of-type-S-formal-scheme](#etale-site-of-type-S-formal-scheme), [formal-etale-morphism](#formal-etale-morphism), `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, (3.5.5), p. 204; Huber-EtaleCohomology-1996 §3.5, (3.5.3), p. 203; Scholze-EtaleCohomologyDiamonds Remark 19.3, pp. 108-109.

<a id="pair-specialization-morphism"></a>
**The specialization morphism λ_(X,L): d(X, L)_et → (X, L)_et (3.5.3)** — `pair-specialization-morphism` (construction; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let (X, L) be a pair with L convex and locally pro-constructible (e.g. locally closed), so that d(X, L) is a pseudo-adic space (node pairs-and-pseudo-adic-supports) with étale site d(X, L)_et (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero: objects the étale morphisms of pseudo-adic spaces into d(X, L)). The functor u_(X,L): (X, L)_et → d(X, L)_et, (Y, S) ↦ d(Y, S) := (d(Y), λ_Y⁻¹(S)) with its map to d(X, L), is well defined (d(Y) → d(X) is étale and λ_Y⁻¹(S) is open in λ_Y⁻¹(g⁻¹(L)) = d(g)⁻¹(λ_X⁻¹(L))), preserves finite limits and sends coverings to coverings; it defines the morphism of sites λ = λ_(X,L): d(X, L)_et → (X, L)_et, with direct image (λ_*F)(Y, S) = F(d(Y, S)), exact inverse image λ^* ⊣ λ_*, and derived direct image R⁺λ_*: D⁺(d(X, L)_et, E) → D⁺((X, L)_et, E) for every ring E. For L = |X| it is λ_X of node specialization-morphism-of-sites-lambda under (X, |X|)~ ≃ X~ and d(X, |X|) = d(X).

*Hypotheses.* L convex and locally pro-constructible (locally closed in 3.5.6–3.5.16). The étale site of a pseudo-adic space is H0's carrier (request recorded).

*Proof.* Well defined: node generic-fibre-of-etale-morphism (i) and continuity of λ_Y. Finite limits: d preserves fibre products of étale objects (node generic-fibre-of-etale-morphism (iii)) and λ⁻¹ commutes with preimages and intersections of supports. Coverings: if S = ∪ h_i(S_i) then λ_Y⁻¹(S) = ∪ d(h_i)(λ_{Y_i}⁻¹(S_i)): for t ∈ λ_Y⁻¹(S) choose i and s_i ∈ S_i with h_i(s_i) = λ_Y(t) and lift by node specialization-point-lifting to t_i ∈ d(Y_i) with λ_{Y_i}(t_i) = s_i and d(h_i)(t_i) = t. Morphism of sites and derived direct image: as in node specialization-morphism-of-sites-lambda, with R⁺λ_* from ClassicalAdicEtaleCohomology:H0/derived-direct-image.

*API.*

- `FormalScheme.Pair.specialisationFunctor` (data): u_(X,L): (Y, S) ↦ d(Y, S) = (d(Y), λ_Y⁻¹(S)).
- `FormalScheme.Pair.specialisationFunctor.isContinuous` (instance): u_(X,L) is continuous and preserves finite limits.
- `FormalScheme.Pair.specialisationPushforward` (constructor): λ_*: Sheaf(d(X, L)_et) ⥤ Sheaf((X, L)_et), (λ_*F)(Y, S) = F(d(Y, S)).
- `FormalScheme.Pair.specialisationPullback` (constructor): λ^*, exact, left adjoint to λ_*.
- `FormalScheme.Pair.specialisationAdjunction` (universal-property): λ^* ⊣ λ_*.
- `FormalScheme.Pair.derivedSpecialisationPushforward` (constructor): R⁺λ_*: D⁺(d(X, L)_et, E) ⥤ D⁺((X, L)_et, E) for every ring E.
- `FormalScheme.Pair.specialisation_univ` (compatibility): λ_(X,|X|) = λ_X under (X, |X|)~ ≃ X~ and d(X, |X|) = d(X).
- `FormalScheme.Pair.specialisation_restrict` (relation): For L' ⊆ L: i ∘ λ_(X,L') ≅ λ_(X,L) ∘ d(i) (the square of node pair-specialization-functoriality-3-5-4 for the identity of X).

*Unit tests.*

- `FormalScheme.Pair.specialisation_test_univ` (degenerate): For L = |X|, λ_(X,|X|) is λ_X under (X, |X|)~ ≃ X~; for L = ∅ both topoi are trivial.
- `FormalScheme.Pair.specialisation_test_OK` (computation): X = Spf O_K, L the closed point: λ_* sends a continuous Gal(K^sep/K)-set M to M^{I_K}.
- `FormalScheme.Pair.specialisation_test_cover` (characterisation): For X = Spf Z_p⟨T⟩ and L = |X|, the Zariski covering {(X{T}, ·), (X{T−1}, ·)} (D(T) ∪ D(T−1) = A^1_{F_p}) is sent to the covering {|T| = 1} ∪ {|T − 1| = 1} of the closed unit disc: every point has |T| = 1 or |T − 1| = 1.
- `FormalScheme.Pair.specialisation_test_tube` (non-example): Replacing λ_Y⁻¹(S) by the tube ]S[ does not give a functor to d(X, L)_et preserving coverings: for L closed, the point η_{1⁻} ∈ λ_X⁻¹(L) is not in ]L[.

*Acceptance.* For X = Spf O_K and L the closed point, λ_(X,L) is λ_X (the closed point is all of |X|). The covering property fails if supports are replaced by tubes: for L closed, the rank-two boundary points of λ⁻¹(L) lie in no ]S_i[ (node pairs-and-pseudo-adic-supports).

*Uses:* [pairs-and-pseudo-adic-supports](#pairs-and-pseudo-adic-supports), [pair-etale-site](#pair-etale-site), [generic-fibre-of-etale-morphism](#generic-fibre-of-etale-morphism), [specialization-point-lifting](#specialization-point-lifting), [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, (3.5.3), p. 203; Huber-EtaleCohomology-1996 §3.5, Lemma 3.5.1, p. 202; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, statement (†), p. 16.

<a id="pair-specialization-functoriality-3-5-4"></a>
**Morphisms of pairs and the specialization square (3.5.4)** — `pair-specialization-functoriality-3-5-4` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let f: (X', L') → (X, L) be an adic morphism of pairs with L, L' convex and locally pro-constructible. Then the square of morphisms of sites formed by λ_(X',L'), λ_(X,L), d(f)_et: d(X', L')_et → d(X, L)_et and f_et: (X', L')_et → (X, L)_et commutes up to a canonical isomorphism: for (Y, S) ∈ (X, L)_et, d(X' ×_X Y, S') ≅ d(X', L') ×_{d(X,L)} d(Y, S) with S' = pr⁻¹(S) ∩ q⁻¹(L'), naturally in (Y, S). Consequently f^* ∘ λ_* ⟶ λ'_* ∘ d(f)^* and, for every ring E, the base-change transformation f^* ∘ R⁺λ_(X,L)* ⟶ R⁺λ_(X',L')* ∘ d(f)^* on D⁺(d(X, L)_et, E) are defined.

*Hypotheses.* f adic; L, L' convex and locally pro-constructible.

*Proof.* On formal schemes: d(X' ×_X Y) ≅ d(X') ×_{d(X)} d(Y) for Y étale over X (node generic-fibre-of-etale-morphism (iii)). On supports: λ_{X'×_X Y}⁻¹(pr⁻¹(S) ∩ q⁻¹(L')) = d(pr)⁻¹(λ_Y⁻¹(S)) ∩ d(q)⁻¹(λ_{X'}⁻¹(L')) by naturality of λ (AdicSpacesPartII:R2/specialisation-map). The base-change transformation is the mate of the isomorphism of inverse-image functors (standard for 2-commutative squares of morphisms of sites; derived form via ClassicalAdicEtaleCohomology:H0/derived-direct-image).

*Acceptance.* For the identity of X and L' ⊆ L this is the square used in Corollary 3.5.11(i).

*Uses:* [pairs-and-pseudo-adic-supports](#pairs-and-pseudo-adic-supports), [pair-etale-site](#pair-etale-site), [pair-specialization-morphism](#pair-specialization-morphism), [generic-fibre-of-etale-morphism](#generic-fibre-of-etale-morphism), `AdicSpacesPartII:R2/specialisation-map`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`.

*Sources:* Berkovich-VanishingCyclesFormal-1994 §1, printed p. 542; Huber-EtaleCohomology-1996 §3.5, (3.5.3), p. 203.

<a id="pair-topos-reduced-subscheme-3-5-5"></a>
**The topos of a pair is the étale topos of the reduced subscheme on L (3.5.5)** — `pair-topos-reduced-subscheme-3-5-5` (comparison; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let (X, L) be a pair with L locally closed in |X| or L = {y} a single point, and let L_red be the reduced locally closed subscheme of X_red with underlying space L (for L = {y}: Spec κ(y)). The functor φ⁻¹: (X, L)_et → Et/L_red, (Y, S) ↦ the open subscheme of L_red ×_{X_red} Y_red with underlying set S (S is open in g⁻¹(L) = |L_red ×_{X_red} Y_red|), is continuous and preserves finite limits, so it defines a morphism of sites φ: (L_red)_et → (X, L)_et, and the induced morphism of topoi φ~: (L_red)~ → (X, L)~ is an equivalence. Henceforth (X, L)~ is identified with (L_red)~; for L = |X| this is node reduced-special-scheme-equivalence.

*Hypotheses.* L locally closed, or a single point. Imports (scheme level, SchemeAndStackFoundations:SF.2): étale morphisms to a locally closed subscheme lift Zariski-locally to étale morphisms of the ambient scheme; étale κ(y)-algebras spread out to étale neighbourhoods of y.

*Proof.* φ⁻¹ is well defined and preserves fibre products and final objects (preimages of opens; base change of reduced schemes étale over L_red remains reduced). Cover-density: every étale L_red-scheme V is covered by open subschemes of the form S ⊆ L_red ×_{X_red} W with W étale over X_red: write L = U ∩ Z with U open and Z closed; an étale map to the closed subscheme L_red ⊆ U_red lifts Zariski-locally on V to an étale map to U_red (SchemeAndStackFoundations:SF.2 request); then lift from X_red to X by node reduced-special-scheme-equivalence. For L = {y}: a finite separable κ(y)-algebra has a standard étale presentation whose polynomial lifts to the local ring of X_red at y and spreads out to an étale W over an open neighbourhood with fibre V over y. Local fullness and faithfulness: morphisms between objects of the form S ⊆ L_red ×W are determined on L_red, and étale morphisms over L_red lift locally (same import). Coverings are jointly surjective families of supports on both sides, so φ⁻¹ is a dense subsite (Mathlib `CategoryTheory.Functor.IsDenseSubsite`) and φ~ is an equivalence (`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`). This replaces Huber's reference to (2.3.3), which is not in the library.

*Acceptance.* L = {y} a closed point: (X, {y})~ ≃ Gal(κ(y)^sep/κ(y))-sets. L = |X|: (X, |X|)~ ≃ X~ ≃ (X_red)~ (node reduced-special-scheme-equivalence).

*Uses:* [pair-etale-site](#pair-etale-site), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), `SchemeAndStackFoundations:SF.2`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, (3.5.5), p. 204; Stacks-Project Tag 04DZ (Étale Cohomology, Theorem 59.45.2); Stacks-Project Tag 039R (Étale Morphisms of Schemes, Theorem 41.15.2).

<a id="constructibility-and-stalks-of-lambda-pullback"></a>
**Stalks of λ^*F are the stalks of F (Proposition 3.5.6(ii))** — `constructibility-and-stalks-of-lambda-pullback` (lemma (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let X be a formal scheme of type (S), L ⊆ |X| locally closed and λ = λ_(X,L). Let x ∈ |d(X, L)| = λ_X⁻¹(L), y := λ_X(x) ∈ L, and let x̄: Spa(C, C⁺) → d(X) be a geometric point with support x (AdicEtaleGeometry:A1/etale-site-and-geometric-points; C complete algebraically closed, C⁺ an open bounded valuation ring of any rank). The composite point λ(x̄) of (X, L)~ ≃ (L_red)~ is the geometric point ȳ: Spec k_{C⁺} → L_red over y given by the residue field k_{C⁺} of C⁺ (algebraically closed, and κ(y) → k_{C⁺} because y is the centre of x). For every sheaf F on (X, L)_et there is a natural isomorphism of stalks (λ^*F)_x̄ ≅ F_ȳ. In particular λ^* creates no cohomology: all cohomology of the comparison comes from R⁺λ_*.

*Hypotheses.* L locally closed; F a sheaf of sets (hence also of groups or modules). The auxiliary valuation ring in the proof must have algebraically closed fraction field: it is the completion of C⁺ for the chosen geometric point (the source's parenthetical example, the completion of k(x)⁺, has this property only after passing to a geometric point).

*Proof.* Special case X = Spf B, B a complete microbial valuation ring with algebraically closed fraction field: by node specialization-over-microbial-valuation-ring λ_X is a homeomorphism and étale maps into X and into d(X) split near points over the closed point, so both stalks at the closed points are global sections and the comparison is the identity (with Remark 3.5.2, node specialization-morphism-of-sites-lambda (a)). General case: work on an affine formal open Spf A ∋ y; put B := the completion of C⁺ (a complete microbial valuation ring with fraction field C). The geometric point x̄ is a morphism g: d(Spf B) = Spa(C, B) → d(X); by the universal property of d (AdicSpacesPartII:R2/generic-fibre-functor-d, Huber 1.9.1(c)) and O⁺_{d(Spf B)}(d(Spf B)) = B, it comes from a unique continuous adic μ: A → B with g = d(Spf μ). Pull back along the adic morphism of pairs Spf μ: (Spf B, (Spf μ)⁻¹(L)) → (X, L) using the square of node pair-specialization-functoriality-3-5-4, and apply the special case; stalks at geometric points are compatible with pullback (ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs, AdicEtaleGeometry:A1/etale-site-and-geometric-points API stalk_pullback_iso). Identify the composite point with ȳ via (X, L)~ ≃ (L_red)~ (node pair-topos-reduced-subscheme-3-5-5).

*Acceptance.* Stalks of λ^*F at the analytic points of the support over y are the stalks of F at y; e.g. for X = Spf Z_p⟨T⟩, L = {(p,T)} and F = i_{y*}M (M a Gal(F̄_p/F_p)-set), λ^*F has stalk M at every geometric point of {|T| < 1}, including η_{1⁻}.

*Uses:* [pair-specialization-morphism](#pair-specialization-morphism), [pair-specialization-functoriality-3-5-4](#pair-specialization-functoriality-3-5-4), [pair-topos-reduced-subscheme-3-5-5](#pair-topos-reduced-subscheme-3-5-5), [specialization-over-microbial-valuation-ring](#specialization-over-microbial-valuation-ring), [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `mathlib:CategoryTheory.GrothendieckTopology.Point`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Proposition 3.5.6, p. 204; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.6, p. 204; Huber-EtaleCohomology-1996 Chapter 2 introduction, p. 108.

<a id="lambda-pullback-constructible-3-5-6-i"></a>
**λ^* preserves constructibility (Proposition 3.5.6(i))** — `lambda-pullback-constructible-3-5-6-i` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let X be a formal scheme of type (S), L ⊆ |X| locally closed, Λ a noetherian ring and λ = λ_(X,L). If F is a constructible sheaf of Λ-modules on (X, L)_et ≃ (L_red)_et (constructible in the sense of schemes: locally on L_red there is a finite partition into locally closed constructible subsets on whose reduced subschemes F is locally constant with finitely generated stalks), then λ^*F is a constructible sheaf of Λ-modules on the pseudo-adic space d(X, L) in the classical analytic sense of ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves (locally a finite partition into locally closed, locally constructible subsets on which the sheaf is locally constant of finite type).

*Hypotheses.* L locally closed; Λ noetherian; F constructible (scheme sense).

*Proof.* Stratify: locally L = ⊔ L_i with L_i locally closed and constructible and F|_{(L_i)_red} locally constant of finite type (SchemeAndStackFoundations:SF.2). λ^*F restricted to d(X, L_i) is λ_(X,L_i)^*(F|_{L_i}) (node pair-specialization-functoriality-3-5-4 for the identity of X), which is locally constant of finite type because inverse images of locally constant sheaves of finite type are such. λ_X⁻¹(L_i) is locally closed and locally constructible in λ_X⁻¹(L): λ_X is spectral (AdicSpacesPartII:R2/generic-fibre-functor-d, Huber (1.9.3)) and preimages of constructible sets under spectral maps are constructible (DiamondsAndVStacks:D0/pro-constructible-subsets).

*Acceptance.* For X = Spf O_K, L the closed point and F the constant sheaf Λ, λ^*F is the constant sheaf Λ on Spa(K, O_K).

*Uses:* [pair-specialization-morphism](#pair-specialization-morphism), [pair-specialization-functoriality-3-5-4](#pair-specialization-functoriality-3-5-4), [pair-topos-reduced-subscheme-3-5-5](#pair-topos-reduced-subscheme-3-5-5), `AdicSpacesPartII:R2/generic-fibre-functor-d`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `SchemeAndStackFoundations:SF.2`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Proposition 3.5.6, p. 204; FujiwaraKato-RigidGeometryI Chapter II, Theorem 3.1.2(2).

<a id="specialization-over-microbial-valuation-ring"></a>
**Specialization over a complete microbial valuation ring with algebraically closed fraction field** — `specialization-over-microbial-valuation-ring` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Pair`)

Let B be a complete microbial valuation ring (Wedhorn Definition 5.46) with algebraically closed fraction field C, and X = Spf B with the valuation topology (of type (S): AdicSpacesPartII:R2/formal-schemes-of-type-S, API spf_microbial). Then (i) d(X) = Spa(C, B) and λ_X: d(X) → |X| is a homeomorphism: both are the chain of valuation rings V with B ⊆ V ⊆ C° ↔ primes p of B containing the height-one prime q = √(sB) (V = B_p); (ii) X_red = Spec(B/q) with B/q a valuation ring whose fraction field is algebraically closed, hence a strictly henselian local ring, and every étale morphism into X_red, into X, or into d(X) has, through every point over the closed point, a section which is an open immersion (AdicEtaleGeometry:A1/geometric-point-etale-split for d(X)); (iii) consequently, for sheaves F on X_et and G on d(X)_et, the stalk of F at the closed point is F(X), the stalk of G at the closed point of Spa(C, B) is G(d(X)), and (λ_X^*F)_{closed} ≅ F(X).

*Hypotheses.* B complete microbial valuation ring, Frac B = C algebraically closed; any rank. Henselianity of B/q: a valuation ring with algebraically closed fraction field is henselian (every finite extension of its fraction field is trivial), and its residue field (that of B) is algebraically closed.

*Proof.* (i): AdicSpacesPartII:R2/generic-fibre-functor-d (API genericFibre_spf_microbial, Huber 1.9.2(i)) and Wedhorn Example 7.17 for the points of Spa(C, B). (ii) for X_red and X: B/q is a valuation ring of the algebraically closed field κ(q), so it is a henselian local ring (Mathlib `HenselianLocalRing`) with algebraically closed residue field; étale maps to the spectrum of a strictly henselian local ring have sections through points over the closed point (SchemeAndStackFoundations:SF.2), and they lift to X by node reduced-special-scheme-equivalence. (ii) for d(X): AdicEtaleGeometry:A1/geometric-point-etale-split (iii). (iii): in both sites every covering of the whole space has a member with a section through the closed point, so the closed point is a point whose stalk functor is global sections; compare through u_X (node specialization-morphism-of-sites-lambda).

*Acceptance.* For B = O_C (rank one), X_red = Spec k̄ is a point and d(X) = Spa(C, O_C) is a point; for B of rank two, both X and d(X) have two points and λ_X matches them.

*Uses:* `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), `SchemeAndStackFoundations:SF.2`, `mathlib:HenselianLocalRing`, `mathlib:ValuationRing`.

*Sources:* Wedhorn-AdicSpaces-2019 Remark and Definition 5.46; Wedhorn-AdicSpaces-2019 Example 7.17; Huber-EtaleCohomology-1996 §1.9, p. 96; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.6, p. 204.

#### Stalks of R^nλ_* (3.5.7–3.5.10) and henselian tubes (3.6.1–3.6.3)

At a geometric point of L, the stalk of R^nλ_*F is the cohomology of the generic fibre of the completed strict localisation when that completion is of type (S) (3.5.8), and in general a filtered colimit over the completed pointed étale neighbourhoods (3.5.9); no analytic strict-localisation space is asserted to exist without the type-(S) hypothesis. For constant coefficients the stalk is the étale cohomology of the generic locus of the strict localisation itself (3.5.10), with no completion. The passage from the support over L to the closed point is Huber's henselian tube comparison (3.6.1–3.6.3).

<a id="formal-strict-localisation-system-3-5-7"></a>
**The formal completions of the strict localisation at a point of the special fibre (3.5.7)** — `formal-strict-localisation-system-3-5-7` (construction; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

Let X be a formal scheme of type (S), L ⊆ |X| locally closed, x ∈ L and x̄ a geometric point of X_red over x. Choose an affine formal open U = Spf A ∋ x with A as in (S) such that L ∩ U is closed in U, and let B be the ring A with a finitely generated ideal of definition J, taken principal (J = sB, s as in (S)(b)) when A is not noetherian. Put Y := Spec B (a scheme), y ∈ Y the open prime corresponding to x (J ⊆ y), ȳ the induced geometric point of Y. Let I be the category of ȳ-pointed affine étale Y-schemes (Y_i, u_i) (u_i: ȳ → Y_i lifting ȳ → Y); I is cofiltered and essentially small, and Y_∞ := lim_I Y_i = Spec O^sh_{Y,ȳ} is the strict localisation. Let Y_i^ and Y_∞^ be the formal completions along the closed subschemes defined by J (Spf of the J-adic completions of O(Y_i) and of O^sh_{Y,ȳ}), with the induced morphisms f_i: Y_i^ → X and f: Y_∞^ → X, z_i ∈ Y_i^ the point u_i(ȳ) and z ∈ Y_∞^ the closed point. Then: each Y_i^ is étale over U and of type (S), so (Y_i^, u_i) is an étale neighbourhood of x̄ in X_et, and these neighbourhoods are cofinal among all étale neighbourhoods of x̄; the pseudo-adic spaces d(Y_i^, f_i⁻¹(L)) and d(Y_i^, {z_i}) form cofiltered systems along adic transition maps; Y_∞^ is an affine formal scheme which is of type (S) when A is noetherian and need not be of type (S) otherwise; when Y_∞^ is of type (S), d(Y_∞^, f⁻¹(L)) ~ lim_I d(Y_i^, f_i⁻¹(L)) is a Huber tilde-limit (ClassicalAdicEtaleCohomology:H0/huber-tilde-limit), and likewise for the supports {z}, {z_i}.

*Hypotheses.* X of type (S); L locally closed, shrunk to be closed in U; J principal in the non-noetherian case. Strict henselisation and limits of affine schemes are scheme-level inputs (SchemeAndStackFoundations:SF.2).

*Proof.* I is cofiltered and essentially small and lim Y_i = Spec O^sh_{Y,ȳ} (SchemeAndStackFoundations:SF.2: strict henselisation as a limit of pointed étale neighbourhoods). Each O(Y_i) is an étale B-algebra, so Y_i^ = Spf O(Y_i)^ is étale over U and of type (S) (node etale-lifting-along-special-fibre (ii)). Cofinality: étale neighbourhoods of x̄ in X_et are étale neighbourhoods of x̄ in U_red (node reduced-special-scheme-equivalence); an étale neighbourhood of x̄ in V(J) ⊆ Y lifts Zariski-locally to an étale neighbourhood of ȳ in Y (SchemeAndStackFoundations:SF.2, local lifting along closed immersions), whose completion recovers it (node etale-lifting-along-special-fibre (i)). Type (S) of Y_∞^ for A noetherian: O^sh_{Y,ȳ} is noetherian, hence so is its J-adic completion (AdicSpacesPartII:F0/adic-completion-noetherian); condition (S)(a). Tilde-limit: when Y_∞^ is of type (S), |d(Y_∞^)| → lim |d(Y_i^)| is a homeomorphism and colim O(d(Y_i^)) is dense in O(d(Y_∞^)) on affinoids, because O^sh = colim O(Y_i) and completion commutes with the dense image; restrict to the supports (ClassicalAdicEtaleCohomology:H0/huber-tilde-limit).

*API.*

- `FormalScheme.StrictLocalisationSystem` (structure): The data (U = Spf A, B, J, y, ȳ, I, (Y_i, u_i)) of (3.5.7).
- `FormalScheme.StrictLocalisationSystem.isCofiltered` (instance): The index category I is cofiltered and essentially small.
- `FormalScheme.StrictLocalisationSystem.completion` (data): i ↦ Y_i^ ∈ Et/X with f_i: Y_i^ → X and the points z_i; transition maps adic.
- `FormalScheme.StrictLocalisationSystem.completionInfty` (data): Y_∞^ = Spf (O^sh_{Y,ȳ})^_J, f: Y_∞^ → X, and its closed point z.
- `FormalScheme.StrictLocalisationSystem.limit_iso` (compatibility): lim_I Y_i ≅ Spec O^sh_{Y,ȳ} (strict localisation).
- `FormalScheme.StrictLocalisationSystem.completion_isEtale` (other): Each Y_i^ → U is étale and Y_i^ is of type (S).
- `FormalScheme.StrictLocalisationSystem.cofinal` (characterisation): The (Y_i^, u_i) are cofinal among étale neighbourhoods of x̄ in X_et.
- `FormalScheme.StrictLocalisationSystem.isTypeS_infty_of_isNoetherian` (instance): If A is noetherian, Y_∞^ is of type (S).
- `FormalScheme.StrictLocalisationSystem.tildeLimit` (other): If Y_∞^ is of type (S): d(Y_∞^, f⁻¹(L)) ~ lim_I d(Y_i^, f_i⁻¹(L)) and d(Y_∞^, {z}) ~ lim_I d(Y_i^, {z_i}) (Huber tilde-limits).

*Unit tests.*

- `FormalScheme.strictLocalisationSystem_test_OK` (computation): For X = Spf O_K (K complete discretely valued) and x the closed point, Y_∞ = Spec O_K^sh and Y_∞^ = Spf O_{K̆}; d(Y_∞^) is the single point Spa(K̆, O_{K̆}).
- `FormalScheme.strictLocalisationSystem_test_zariski` (non-example): Replacing I by Zariski neighbourhoods of y gives Y_∞ = Spec B_y (for X = Spf Z_p: Spec Z_p, not strictly henselian); the resulting 'stalk' of R^1λ_*Z/ℓ would be H^1(Q_p, Z/ℓ) instead of H^1(Q_p^nr, Z/ℓ), so the pointed étale neighbourhoods are essential.
- `FormalScheme.strictLocalisationSystem_test_noetherian` (compatibility): If A is noetherian then Y_∞^ is of type (S) via (a), so Theorem 3.5.8 applies (node stalks-of-higher-direct-images-lambda).
- `FormalScheme.strictLocalisationSystem_test_cofinal` (characterisation): The pointed completions (Y_i^, u_i) are cofinal among étale neighbourhoods of x̄ in X_et, so (R^nλ_*F)_x̄ = colim_I H^n(d(Y_i^, f_i⁻¹(L)), F) (node higher-direct-images-of-lambda (ii)).

*Acceptance.* X = Spf O_K (K complete discretely valued), x the closed point: Y_∞ = Spec O_K^sh, Y_∞^ = Spf O_{K̆} (completion of the maximal unramified extension), d(Y_∞^) = Spa(K̆, O_{K̆}) is one point.

*Uses:* [etale-site-of-type-S-formal-scheme](#etale-site-of-type-S-formal-scheme), [etale-lifting-along-special-fibre](#etale-lifting-along-special-fibre), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), [pairs-and-pseudo-adic-supports](#pairs-and-pseudo-adic-supports), `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:F0/adic-completion-noetherian`, `mathlib:AdicCompletion`, `mathlib:HenselianLocalRing`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.8, p. 205; Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.10, p. 206; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, before formula (∗), p. 17.

<a id="stalks-of-higher-direct-images-lambda"></a>
**Stalks of R^nλ_*F via the completed strict localisation (Theorem 3.5.8(i))** — `stalks-of-higher-direct-images-lambda` (theorem (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

In the situation of node formal-strict-localisation-system-3-5-7, let F be an abelian sheaf on d(X, L)_et, λ = λ_(X,L), and assume that the formal scheme Y_∞^ is of type (S). Put F'_∞ := d(f)^*F on d(Y_∞^, f⁻¹(L)). Then for every n ≥ 0 there is a natural isomorphism (R^nλ_*F)_x̄ ≅ H^n(d(Y_∞^, f⁻¹(L)), F'_∞). The type-(S) hypothesis on Y_∞^ is part of the statement; without it the filtered formula of node stalk-formula-filtered-3-5-9 is used instead, and no analytic strict-localisation space is asserted to exist.

*Hypotheses.* Y_∞^ of type (S) (automatic when A is noetherian). F any abelian sheaf (no torsion hypothesis in part (i)). L locally closed, closed in the chosen affine U.

*Proof.* Stalk as a colimit: (R^nλ_*F)_x̄ = colim_I H^n(d(Y_i^, f_i⁻¹(L)), F) (node higher-direct-images-of-lambda (ii) for λ_(X,L), with the cofinal system of node formal-strict-localisation-system-3-5-7). Continuity: d(Y_∞^, f⁻¹(L)) ~ lim_I d(Y_i^, f_i⁻¹(L)) is a tilde-limit of quasi-compact quasi-separated pseudo-adic spaces with closed supports (node formal-strict-localisation-system-3-5-7), so colim_I H^n(d(Y_i^, f_i⁻¹(L)), F_i) ≅ H^n(d(Y_∞^, f⁻¹(L)), F'_∞) by Huber's Corollary 2.4.6 (ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity). Naturality in F from the naturality of both steps.

*Acceptance.* X = Spf O_K (K complete discretely valued), L = |X|, x the closed point: (R^nλ_*F)_x̄ = H^n(Spa(K̆, O_{K̆}), F|) = H^n(Gal(K̆^sep/K̆), F_{ξ}) — the cohomology of the inertia group, as in SGA 7 XIII 1.2.2(b) for n = 0.

*Uses:* [formal-strict-localisation-system-3-5-7](#formal-strict-localisation-system-3-5-7), [higher-direct-images-of-lambda](#higher-direct-images-of-lambda), [pair-specialization-morphism](#pair-specialization-morphism), `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.8, p. 205; Huber-EtaleCohomology-1996 §3.5, after 3.5.8, p. 206; Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.10, p. 206; Huber-EtaleCohomology-1996 §2.4, Corollary 2.4.6, p. 129; Berkovich-VanishingCyclesFormal-1994 §4, Proposition 4.1(ii), printed p. 548.

<a id="stalk-formula-closed-point-3-5-8-ii"></a>
**Stalks of R^nλ_*F via the closed point of the completed strict localisation (Theorem 3.5.8(ii))** — `stalk-formula-closed-point-3-5-8-ii` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

In the situation of node stalks-of-higher-direct-images-lambda (Y_∞^ of type (S)), assume moreover that F is a torsion sheaf. Let z be the closed point of Y_∞^ and F_∞ the preimage of F'_∞ on d(Y_∞^, {z}) ⊆ d(Y_∞^, f⁻¹(L)). Then (R^nλ_*F)_x̄ ≅ H^n(d(Y_∞^, {z}), F_∞) for every n ≥ 0: only the analytic points specialising to the closed point contribute.

*Hypotheses.* Y_∞^ of type (S); F torsion. The distinction between F'_∞ on d(Y_∞^, f⁻¹(L)) and its preimage F_∞ on d(Y_∞^, {z}) is the source's.

*Proof.* By node stalks-of-higher-direct-images-lambda, (R^nλ_*F)_x̄ = H^n(d(Y_∞^, f⁻¹(L)), F'_∞). The completed strict henselisation C := (O^sh)^_J is henselian along its maximal ideal (a complete local ring, or the henselian pair of the strict henselisation), so the henselian tube comparison applies: Corollary 3.6.3 (node henselian-tube-closed-subsets-3-6-2-3-6-3) for Spa(C, C)_a ⊇ closed tube over z when A is noetherian, and for Spa(C(1/s), D) (D the integral closure of C in C(1/s)) when A is not noetherian, gives H^n(d(Y_∞^, f⁻¹(L)), F'_∞) ≅ H^n(d(Y_∞^, {z}), F_∞).

*Acceptance.* X = Spf Z_p⟨T⟩, L = |X|, x = (p, T): the stalk is the cohomology of the pseudo-adic space d(Y_∞^, {z}) whose support is the set of points of Spa of the completed strict henselisation specialising to z; the points specialising only to the generic point of the special fibre do not contribute.

*Uses:* [stalks-of-higher-direct-images-lambda](#stalks-of-higher-direct-images-lambda), [henselian-tube-closed-subsets-3-6-2-3-6-3](#henselian-tube-closed-subsets-3-6-2-3-6-3), [henselian-tube-comparison-3-6-1](#henselian-tube-comparison-3-6-1), [formal-strict-localisation-system-3-5-7](#formal-strict-localisation-system-3-5-7), `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `mathlib:HenselianLocalRing`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.8, p. 205; Huber-EtaleCohomology-1996 §3.6, Proposition 3.6.1, p. 211.

<a id="stalk-formula-filtered-3-5-9"></a>
**The filtered stalk formula without the type-(S) hypothesis (Theorem 3.5.9)** — `stalk-formula-filtered-3-5-9` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

In the situation of node formal-strict-localisation-system-3-5-7, without assuming that Y_∞^ is of type (S), let F be a torsion sheaf on d(X, L)_et and F_i its preimage on d(Y_i^, {z_i}) (z_i = u_i(ȳ)). Then for every n ≥ 0: (R^nλ_*F)_x̄ ≅ colim_{i∈I} H^n(d(Y_i^, {z_i}), F_i). This is the formula to use when the completed strict localisation is not of type (S); it involves only the type-(S) formal schemes Y_i^ and no analytic space attached to Y_∞^.

*Hypotheses.* F torsion; no hypothesis on Y_∞^. In the non-noetherian case the ideal of definition of B is principal (J = sB).

*Proof.* Noetherian case: Y_∞^ is of type (S) (node formal-strict-localisation-system-3-5-7); combine node stalk-formula-closed-point-3-5-8-ii with the tilde-limit d(Y_∞^, {z}) ~ lim d(Y_i^, {z_i}) and Corollary 2.4.6 (ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity). Non-noetherian case (source proof, §3.6): auxiliary pseudo-adic spaces P_i = (Spa(C_i, C_i⁺), N_i) ⊇ Q_i built from the localisations (B_i)_s with the discrete topology, the tube comparison Corollary 3.6.3 (node henselian-tube-closed-subsets-3-6-2-3-6-3) for Q_∞ ⊆ P_∞, Corollary 2.4.6 for P_∞ ~ lim P_i and Q_∞ ~ lim Q_i, and Huber's (3.4.2.ii, iii.b) to transport cohomology between d(Y_i^, L_i) and P_i; the inputs (3.4.2)–(3.4.3) are available only in Hub96 (gap recorded). Both cases: the stalk is colim_I H^n(d(Y_i^, f_i⁻¹(L)), F) (node higher-direct-images-of-lambda), and at each finite stage the passage from f_i⁻¹(L) to {z_i} happens only in the colimit.

*Acceptance.* The stage requirement 'without that assumption use the filtered formula 3.5.9, not a nonexistent analytic strict-localization space' is exactly the hypothesis-free form of this node. For X = Spf O_K with K complete discretely valued, each d(Y_i^, {z_i}) = Spa(K_i, O_{K_i}) for the unramified extensions K_i, and the formula gives colim H^n(K_i, M) = H^n(K^nr, M).

*Uses:* [formal-strict-localisation-system-3-5-7](#formal-strict-localisation-system-3-5-7), [stalk-formula-closed-point-3-5-8-ii](#stalk-formula-closed-point-3-5-8-ii), [henselian-tube-closed-subsets-3-6-2-3-6-3](#henselian-tube-closed-subsets-3-6-2-3-6-3), [higher-direct-images-of-lambda](#higher-direct-images-of-lambda), [pair-specialization-morphism](#pair-specialization-morphism), `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, after 3.5.8, p. 206; Berkovich-VanishingCyclesFormal-1994 §4, Proposition 4.1(ii), printed p. 548.

<a id="stalk-formula-constant-coefficients-3-5-10"></a>
**Stalks of R^nλ_*λ^*G: the cohomology of the generic locus of the strict localisation (Theorem 3.5.10)** — `stalk-formula-constant-coefficients-3-5-10` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

In the situation of node formal-strict-localisation-system-3-5-7, let G be a torsion sheaf on (X, L)_et and F = λ^*G. Let V := Y_∞ − (Y_∞ ×_Y Spec B/J), the open complement of V(J) in the strict localisation (V = Spec O^sh_{Y,ȳ}[1/s] when J = sB), and M the constant sheaf on V_et with value G_x̄. Then (R^nλ_*F)_x̄ ≅ H^n(V, M) for every n ≥ 0. No type-(S) hypothesis on Y_∞^ and no completion appears on the right-hand side; the torsion of G may be divisible by the residue characteristic.

*Hypotheses.* G torsion (any torsion, including p-torsion). No type-(S) hypothesis on Y_∞^.

*Proof.* Noetherian case: by node stalk-formula-closed-point-3-5-8-ii, (R^nλ_*F)_x̄ = H^n(d(Y_∞^, {z}), F_∞), and F_∞ is constant with value G_x̄ (node constructibility-and-stalks-of-lambda-pullback); the pro-special comparison Theorem 3.2.10 applied to the pro-special subset Spa(C, C) and the scheme V (ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12) identifies it with H^n(V, M). Non-noetherian case (source proof, §3.6): the functor e(T) = (Spa(T_s, D), {|s| < 1}) on affine Y-schemes, the sites T_{et,•} and the equivalence (Y_0)~ ≅ Y~_{et,•} of Huber's Appendix A.5, Corollary 3.6.3 and Theorem 3.2.1 (ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1) for e(Y_∞)'; Appendix A.5 is available only in Hub96 (gap recorded).

*Acceptance.* X = Spf O_K with K complete discretely valued, x the closed point, G = Z/ℓ with ℓ ≠ p: V = Spec of the fraction field of O_K^sh, so (R^nλ_*Z/ℓ)_x̄ = H^n(I_K, Z/ℓ) = Z/ℓ, Z/ℓ(−1), 0 for n = 0, 1, ≥ 2. The same X with G = Z/p: (R^1λ_*Z/p)_x̄ = H^1(K^nr_h, Z/p) is infinite (Artin–Schreier or Kummer theory): the theorem makes no prime-to-p restriction. Hansen's formula (∗): for X = Spf A° with A a reduced affinoid over a complete discretely valued field, (R^jλ_*Z/ℓ)_x ≅ H^j(Spec O^sh_{X,x}[1/ϖ], Z/ℓ).

*Uses:* [formal-strict-localisation-system-3-5-7](#formal-strict-localisation-system-3-5-7), [stalk-formula-closed-point-3-5-8-ii](#stalk-formula-closed-point-3-5-8-ii), [constructibility-and-stalks-of-lambda-pullback](#constructibility-and-stalks-of-lambda-pullback), [henselian-tube-closed-subsets-3-6-2-3-6-3](#henselian-tube-closed-subsets-3-6-2-3-6-3), `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `SchemeAndStackFoundations:SF.2`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.10, p. 206; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, formula (∗), p. 17; Hansen-ArtinVanishing-2020 §1, after Theorem 1.4, p. 2; Hansen-ArtinVanishing-2020 §3.3, proof of Theorem 1.4, before formula (∗), p. 17.

<a id="henselian-tube-comparison-3-6-1"></a>
**Cohomology of henselian tubes (Proposition 3.6.1)** — `henselian-tube-comparison-3-6-1` (theorem (decomposition id kept); `TauCeti/AlgebraicGeometry/AdicSpace/Etale/HenselianTube`)

Let A be an affinoid ring (not necessarily complete), J ⊆ I ideals of A⁺ such that A⁺/J is henselian along I/J, and let T := {x ∈ Spa A : |i(x)| < 1 for all i ∈ I} ⊆ U := {x ∈ Spa A : |j(x)| < 1 for all j ∈ J}, closed subsets of Spa A regarded as pseudo-adic subspaces. Let f: X → Spec A^▷ be a morphism of schemes satisfying conditions (a) and (b) of Theorem 3.2.10, or with A^▷ discrete, and X_T := X ×_{Spec A^▷} T → X_U := X ×_{Spec A^▷} U the induced morphism of pseudo-adic spaces (Huber's fibre products (3.2.7), ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12). Let F be an abelian torsion sheaf on (X_U)_et and F' its preimage on (X_T)_et. Then the restriction map H^n(X_U, F) → H^n(X_T, F') is bijective for every n ≥ 0.

*Hypotheses.* A⁺/J henselian along I/J; X satisfies (a),(b) of 3.2.10 or A^▷ is discrete; F torsion. Imports available only in Hub96 (gap recorded): (2.6.9)–(2.6.10), (2.7.8), (2.7.10), (2.7.12), (2.5.13), (3.3.4), (3.4.2)–(3.4.3), [KPR, 2.8.2], [G].

*Proof.* (I) Reduce to A^▷ discrete, via the discrete affinoid ring A^d and (3.4.2)/(3.4.3); (II) to X = Spec A^▷; (III) to J = 0, by henselising the triple (A^▷, A⁺, J) (ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset) and (3.3.4); (IV) to A^▷ noetherian of finite Krull dimension, writing (A^▷, A⁺, I) as a filtered colimit of henselisations of finitely generated triples ([KPR, 2.8.2]) with the constructible reductions (2.3.13.i), (2.7.8), (2.7.10.i) and the limit theorem (2.4.6). Induction on m = dim A^▷: (V) for constructible convex S = {|a_i| < |b_i|} and constant coefficients, from the isomorphism of henselisations A(S) ≅ A(S ∩ T) and Theorem 3.2.1 (ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1). (VI) for closed constructible S and constant coefficients, by the closed-covering spectral sequence (2.6.10), local cohomology along Z = {a = 0} through strict henselisations of A^▷ and the induction hypothesis on A^▷/aA^▷; (VII) for G = j_!P with P constant on an open constructible subset, by the five lemma. (VIII) for f_*(j_*G) with f finite, by the Čech-type spectral sequence (2.6.9); (IX) for general torsion F by the constructible dévissage (2.7.12.ii) after reducing to constructible Z/mZ-modules ((2.3.13.i), (2.7.8)). Each step is a separate lemma of the source proof (pp. 211–219); none has a public restatement, so the steps are recorded as a gap rather than as nodes.

*Acceptance.* For a complete affinoid A with A⁺ henselian along I = (A^▷)°°·A⁺ ∩ A⁺, the cohomology of a Zariski-open W ⊇ (Spa A)_a equals that of the closed tube over the special fibre; this is the mechanism behind Theorem 3.5.8(ii). The induction is on the Krull dimension of a discrete noetherian ring obtained after henselisation; completeness is not used.

*Uses:* `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `mathlib:HenselianRing`.

*Sources:* Huber-EtaleCohomology-1996 §3.6, Proposition 3.6.1, p. 211; Huber-EtaleCohomology-1996 §3.6, step (IV), p. 213; Huber-EtaleCohomology-1996 §3.6, step (IX), p. 219; Huber-EtaleCohomology-1996 §3.2, Lemma 3.2.5, pp. 178-179.

<a id="henselian-tube-closed-subsets-3-6-2-3-6-3"></a>
**Henselian tube comparison for Zariski opens and their closed subsets (Corollaries 3.6.2–3.6.3)** — `henselian-tube-closed-subsets-3-6-2-3-6-3` (theorem; `TauCeti/AlgebraicGeometry/AdicSpace/Etale/HenselianTube`)

Let A be an affinoid ring with A⁺ henselian along an ideal I ⊆ A⁺, let W ⊆ Spa A be a Zariski-open subset containing all analytic points of Spa A, and T := {w ∈ W : |i(w)| < 1 for all i ∈ I}. (3.6.2) For every abelian torsion sheaf F on W_et with preimage F' on the pseudo-adic space (Spa A, T), H^n(W, F) → H^n(T, F') is bijective for all n. (3.6.3) More generally, for a closed subset S ⊆ W (so that (Spa A, S) and (Spa A, S ∩ T) are pseudo-adic spaces) and a torsion sheaf F on (Spa A, S)_et with preimage F' on (Spa A, S ∩ T), H^n(S, F) → H^n(S ∩ T, F') is bijective for all n. (3.6.2) is the case S = W.

*Hypotheses.* A⁺ henselian along I; W Zariski-open containing (Spa A)_a; S closed in W; F torsion.

*Proof.* Both corollaries are specialisations of Proposition 3.6.1 (node henselian-tube-comparison-3-6-1) with J = 0 or with X a closed subscheme of Spec A^▷ cutting out S, as in the source (Hub96 §3.6); the pseudo-adic spaces and their étale sites are ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero.

*Acceptance.* Applied to the completed strict henselisation C of node formal-strict-localisation-system-3-5-7 (henselian along its maximal ideal), with W = Spa(C, C)_a and S the support over f⁻¹(L), it gives node stalk-formula-closed-point-3-5-8-ii.

*Uses:* [henselian-tube-comparison-3-6-1](#henselian-tube-comparison-3-6-1), `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `mathlib:HenselianRing`.

*Sources:* Huber-EtaleCohomology-1996 §3.6, Proposition 3.6.1, p. 211.

#### Restriction and extension by zero (3.5.11)

Both compatibilities follow from the filtered stalk formula and hold in D⁺ with torsion coefficients.

<a id="restriction-and-extension-by-zero-3-5-11"></a>
**R⁺λ_* commutes with restriction to a smaller support (Corollary 3.5.11(i))** — `restriction-and-extension-by-zero-3-5-11` (theorem (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

Let X be a formal scheme of type (S), L' ⊆ L locally closed subsets of |X|, i: (X, L') → (X, L) the morphism of pairs given by the identity of X, d(i): d(X, L') → d(X, L) the inclusion of supports, λ = λ_(X,L), λ' = λ_(X,L') and E a torsion ring. Then the base-change morphism of functors D⁺(d(X, L)_et, E) → D⁺((X, L')_et, E), i^* ∘ R⁺λ_* ⟶ R⁺λ'_* ∘ d(i)^* (node pair-specialization-functoriality-3-5-4), is an isomorphism.

*Hypotheses.* E a torsion ring; L' ⊆ L both locally closed.

*Proof.* Reduce to a sheaf K of E-modules in degree 0 (way-out argument on D⁺, ClassicalAdicEtaleCohomology:H0/derived-direct-image). The topoi have enough points (geometric points of (L'_red)~, node pair-topos-reduced-subscheme-3-5-5 and Mathlib `CategoryTheory.GrothendieckTopology.HasEnoughPoints`); at a geometric point x̄ of L', by the filtered formula (node stalk-formula-filtered-3-5-9) both stalks equal colim_I H^n(d(Y_i^, {z_i}), K_i): the formula only uses the restriction of K to the supports over the points z_i, which lie over x ∈ L'. The map between the two colimits is the identity of the colimit system.

*Acceptance.* The compatibility holds in D⁺ with torsion coefficients, exactly the scope of 3.5.9.

*Uses:* [pair-specialization-functoriality-3-5-4](#pair-specialization-functoriality-3-5-4), [stalk-formula-filtered-3-5-9](#stalk-formula-filtered-3-5-9), [pair-topos-reduced-subscheme-3-5-5](#pair-topos-reduced-subscheme-3-5-5), `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `mathlib:CategoryTheory.GrothendieckTopology.HasEnoughPoints`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Corollary 3.5.11, p. 206; Berkovich-VanishingCyclesFormal-1994 §4, Proposition 4.1(ii), printed p. 548.

<a id="extension-by-zero-compatibility-3-5-11-ii"></a>
**R⁺λ_* commutes with extension by zero from an open support (Corollary 3.5.11(ii))** — `extension-by-zero-compatibility-3-5-11-ii` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/Specialisation/Stalks`)

In the situation of node restriction-and-extension-by-zero-3-5-11, assume L' open in L, and let i_! and d(i)_! be the extensions by zero along the open inclusions of supports (node pair-etale-site, ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). Then the natural morphism of functors D⁺(d(X, L')_et, E) → D⁺((X, L)_et, E), i_! ∘ R⁺λ'_* ⟶ R⁺λ_* ∘ d(i)_!, is an isomorphism for every torsion ring E. The source writes the same morphism i (with lower shriek) in (ii), not a separately named open immersion.

*Hypotheses.* E a torsion ring; L' open in L; L locally closed.

*Proof.* Construction: by the adjunction i_! ⊣ i^*, give R⁺λ'_* → i^* R⁺λ_* d(i)_!; by node restriction-and-extension-by-zero-3-5-11, i^* R⁺λ_* d(i)_! ≅ R⁺λ'_* d(i)^* d(i)_! ≅ R⁺λ'_* since d(i)^* d(i)_! = id. Check on (X, L'): i^* applied to the morphism is the identity of R⁺λ'_* (i^* i_! = id). Check on the closed complement L'' = L − L' with i'': (X, L'') → (X, L): i''^* i_! = 0 and i''^* R⁺λ_* d(i)_! ≅ R⁺λ''_* d(i'')^* d(i)_! = 0 by node restriction-and-extension-by-zero-3-5-11 for L'' ⊆ L; the two restrictions detect isomorphisms (recollement for the open/closed decomposition of the supports).

*Acceptance.* For X = Spf Z_p⟨T⟩, L = |X|, L' = D(T): i_! R⁺λ'_* K ≅ R⁺λ_*(d(i)_! K), whose stalks at the closed point (p, T) vanish.

*Uses:* [restriction-and-extension-by-zero-3-5-11](#restriction-and-extension-by-zero-3-5-11), [pair-etale-site](#pair-etale-site), [pair-specialization-functoriality-3-5-4](#pair-specialization-functoriality-3-5-4), `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Corollary 3.5.11, p. 206; Scholze-EtaleCohomologyDiamonds Remark 19.3, pp. 108-109.

#### The comparison for completions of schemes (3.5.12–3.5.15)

For a scheme X, a closed subscheme Y defined by an ideal of finite type and the completion X^, the comparison map i^*R⁺j_*K → R⁺b_*a^*K is constructed from the morphisms φ_Z of (1.9.5) and shown to be an isomorphism for torsion coefficients under exactly Huber's hypothesis: X locally noetherian, or the ideal locally principal and X^ of type (S). Global sections and restriction to supports give 3.5.14 and 3.5.15.

<a id="completion-comparison-data-3-5-12"></a>
**Completion data: the sites i, j, a, b attached to a scheme and a closed subscheme (3.5.12)** — `completion-comparison-data-3-5-12` (construction; `TauCeti/AlgebraicGeometry/FormalScheme/CompletionComparison`)

Let X be a scheme, 𝓘 ⊆ O_X a quasi-coherent ideal of finite type, Y = V(𝓘) with closed immersion i: Y → X, U = X − Y with open immersion j: U → X, and X^ the formal completion of X along Y (the formal scheme of finite ideal type attached to the thickenings V(𝓘^{n+1}), AdicSpacesPartII:F0/colimit-of-thickenings; affine-locally Spf of the 𝓘-adic completion, Stacks 05GG). Hypothesis (3.5.12), exactly one of: (α) X is locally noetherian; or (β) 𝓘 is locally generated by one element and X^ is of type (S). Under (α), X^ is locally noetherian, hence of type (S). The completion data consist of: the morphisms of sites i: Y_et → X_et and j: U_et → X_et; b: d(X^)_et → Y_et, the composite of λ_{X^} (node specialization-morphism-of-sites-lambda) with (X^)_et ≃ (X^_red)_et = (Y_red)_et ≃ Y_et (node reduced-special-scheme-equivalence and topological invariance); and a: d(X^)_et → U_et, induced by the morphism of locally ringed spaces σ_{X^}: d(X^) → X of (1.9.4) (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison), whose image lies in U, via a⁻¹(Z) := Z ×_X d(X^) (Huber's fibre product of a scheme locally of finite type over X with an adic space over X, AdicSpacesPartII:R1/scheme-fibre-product-analytification) for Z étale over U.

*Hypotheses.* 𝓘 of finite type; (α) X locally noetherian, or (β) 𝓘 locally principal and X^ of type (S) — exactly as in Huber (3.5.12). Without (α) or (β), X^ need not be of type (S) and d(X^) is not defined.

*Proof.* σ_{X^}(d(X^)) ⊆ U: points of d(X^) are analytic, so their supports do not contain 𝓘 (they are not open primes), hence map to U (Huber (3.2.8) as recorded in the reviewed decomposition). a is a morphism of sites: Z ×_X d(X^) → d(X^) is étale for Z étale over U by (1.7.3) (AdicSpacesPartII:R0/etale-local-structure); fibre products are preserved by transitivity of Huber's fibre product (AdicSpacesPartII:R1/scheme-fibre-product-analytification); coverings go to coverings because points of Z ×_X d(X^) surject onto compatible pairs (AdicSpacesPartII:R0/fibre-product-points, Huber 1.2.3(d) for the analogous adic statement). b is a morphism of sites as a composite of λ_{X^} with an equivalence of sites; (X^)_red = Y_red because |X^| = |Y| and both are reduced. (α) ⇒ type (S): X^ is locally noetherian (AdicSpacesPartII:F0/formal-completion), hence of type (S) via (a) (AdicSpacesPartII:R2/formal-schemes-of-type-S).

*API.*

- `FormalScheme.CompletionData` (structure): (X, 𝓘) with 𝓘 quasi-coherent of finite type and hypothesis (α) ∨ (β) of (3.5.12).
- `FormalScheme.CompletionData.completion` (data): X^ with its type-(S) instance.
- `FormalScheme.CompletionData.isTypeS_of_isLocallyNoetherian` (instance): Under (α), X^ is locally noetherian, hence of type (S).
- `FormalScheme.CompletionData.sigma_mem_open` (other): σ_{X^}(d(X^)) ⊆ U = X − Y.
- `FormalScheme.CompletionData.specialMap` (data): b: d(X^)_et → Y_et, λ_{X^} composed with (X^)_et ≃ Y_et.
- `FormalScheme.CompletionData.genericMap` (data): a: d(X^)_et → U_et with a⁻¹(Z) = Z ×_X d(X^).
- `FormalScheme.CompletionData.restrict` (functoriality): For Z étale over X, (Z, 𝓘O_Z) is again completion data of the same type, Z^ ∈ Et/X^, and a, b, i, j restrict compatibly.
- `FormalScheme.CompletionData.genericMap_goodReduction` (compatibility): For X locally of finite type over O_K and 𝓘 = (ϖ), a is the restriction of the analytification morphism of sites X_K^{ad}_et → (X_K)_et to the good-reduction locus d(X^) (AdicSpacesPartII:R2/good-reduction-locus).

*Unit tests.*

- `FormalScheme.completionData_test_trait` (computation): X = Spec O_K (K complete discretely valued), 𝓘 = (ϖ): Y = Spec k, U = Spec K, d(X^) = Spa(K, O_K), a: Spa(K)_et → (Spec K)_et is an equivalence and b = λ_{Spf O_K}.
- `FormalScheme.completionData_test_unit` (degenerate): 𝓘 = O_X gives Y = ∅, U = X and X^ = ∅; 𝓘 = 0 with X locally noetherian gives Y = X, U = ∅, X^ = X with the discrete topology and d(X^) = ∅.
- `FormalScheme.completionData_test_notTypeS` (non-example): X = Spec O_C[T] (C = C_p) with 𝓘 = (p, T): X is not locally noetherian, 𝓘 is not locally principal, and X^ = Spf O_C[[T]] with the (p,T)-adic topology is not of type (S); the data are not defined and no comparison is claimed.
- `FormalScheme.completionData_test_disc` (compatibility): X = Spec O_C[T], 𝓘 = (p) (case (β)): X^ = Spf O_C⟨T⟩, d(X^) is the closed unit disc over C, and a is the inclusion of the disc into the analytified affine line composed with the analytification morphism of sites (AdicSpacesPartII:R2/good-reduction-locus).

*Acceptance.* For X = Spec O_K (K complete discretely valued) and 𝓘 = (ϖ): Y = Spec k, U = Spec K, X^ = Spf O_K, d(X^) = Spa(K, O_K); a is the equivalence between finite étale K-algebras seen algebraically and analytically, b is λ of Spf O_K.

*Uses:* [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:F0/colimit-of-thickenings`, `AdicSpacesPartII:F0/formal-completion`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.IsClosedImmersion`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, (3.5.12), p. 207; Huber-EtaleCohomology-1996 §1.2, (1.2.7), p. 50; Berkovich-VanishingCyclesFormal-1994 §5, printed p. 553; Stacks-Project Tag 04DZ (Étale Cohomology, Theorem 59.45.2).

<a id="completion-comparison-map-3-5-13-i"></a>
**The comparison map i^* ∘ R⁺j_* → R⁺b_* ∘ a^* (Theorem 3.5.13(i))** — `completion-comparison-map-3-5-13-i` (construction; `TauCeti/AlgebraicGeometry/FormalScheme/CompletionComparison`)

Let (X, 𝓘) be completion data (node completion-comparison-data-3-5-12). For Z ∈ Et/X let Z^ ∈ Et/X^ be its completion along Y ×_X Z and φ_Z: d(Z^) → Z ×_X d(X^) the comparison morphism of Huber (1.9.5) (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison). The φ_Z are natural in Z and form a natural transformation φ: b⁻¹ ∘ i⁻¹ ⟶ a⁻¹ ∘ j⁻¹ of functors Et/X → Et/d(X^) (b⁻¹i⁻¹Z = d(Z^), a⁻¹j⁻¹Z = Z ×_X d(X^)). On sheaves this gives j_* ∘ a_* ⟶ i_* ∘ b_* and, by adjunction, for every ring E and every sheaf K of E-modules on U_et, the morphism ψ_K: i^* j_* K ⟶ b_* a^* K, natural in K. Deriving: since i^* is exact, R⁺(i^* ∘ j_*) = i^* ∘ R⁺j_*, and composing R⁺ψ with the canonical R⁺(b_* ∘ a^*) ⟶ R⁺b_* ∘ a^* gives the natural transformation (*) i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^* of functors D⁺(U_et, E) → D⁺(Y_et, E), defined for every ring E. It is natural with respect to étale Z → X (restriction of completion data) and to isomorphisms of completion data, and on H⁰ of a sheaf in degree 0 it is ψ.

*Hypotheses.* (X, 𝓘) completion data; E any ring for the construction (torsion only for the isomorphism, node scheme-completion-comparison-3-5-13).

*Proof.* φ_Z exists and is natural (Huber (1.9.5), AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison). Direct images along morphisms of sites are restrictions along the inverse-image functors; a natural transformation of inverse-image functors u_1 ⟶ u_2 induces F(u_2 Z) → F(u_1 Z), i.e. (j_* a_* F)(Z) → (i_* b_* F)(Z). ψ_K: the composite j_*K → j_*a_*a^*K → i_*b_*a^*K (unit of a^* ⊣ a_*), transposed along i^* ⊣ i_*. Derived form: universal property of right derived functors on D⁺ (Mathlib `CategoryTheory.Functor.rightDerivedFunctorPlus`; ClassicalAdicEtaleCohomology:H0/derived-direct-image for the sheaf-theoretic instances; EnhancedDerivedSheaves:E1 for K-injective replacements).

*API.*

- `FormalScheme.CompletionData.phi` (data): φ_Z: d(Z^) → Z ×_X d(X^), natural in Z ∈ Et/X.
- `FormalScheme.CompletionData.comparisonInverseImage` (data): The natural transformation b⁻¹i⁻¹ ⟶ a⁻¹j⁻¹ of functors Et/X → Et/d(X^).
- `FormalScheme.CompletionData.psi` (constructor): ψ: i^* ∘ j_* ⟶ b_* ∘ a^* on sheaves of E-modules on U_et.
- `FormalScheme.CompletionData.derivedComparison` (constructor): (*): i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^* on D⁺(U_et, E), for every ring E.
- `FormalScheme.CompletionData.derivedComparison_H0` (compatibility): H⁰ of (*) on a sheaf in degree 0 is ψ.
- `FormalScheme.CompletionData.psi_stalk` (characterisation): At a geometric point ȳ of Y, ψ_ȳ is the colimit over ȳ-pointed étale neighbourhoods (Z, u) of the restriction maps K(U ×_X Z) → (a^*K)(d(Z^)) along φ_Z.
- `FormalScheme.CompletionData.derivedComparison_natural` (functoriality): (*) is natural for étale Z → X (restriction of completion data), for isomorphisms of completion data (in particular for automorphisms of X over a base), and for change of coefficient ring E → E'.
- `FormalScheme.CompletionData.globalComparison` (other): Applying R⁺Γ(Y, −) and the Leray isomorphism R⁺Γ(Y, R⁺b_*−) ≅ R⁺Γ(d(X^), −) gives R⁺Γ(Y, i^*R⁺j_*K) → R⁺Γ(d(X^), a^*K).

*Unit tests.*

- `FormalScheme.comparisonMap_test_trait` (computation): For X = Spec O_K with O_K a henselian DVR and 𝓘 = (ϖ), ψ on the sheaf of a Gal(K^sep/K)-module M is M^{I_K} → M^{I_{K^}}, an isomorphism.
- `FormalScheme.comparisonMap_test_empty` (degenerate): If 𝓘 = O_X (Y = ∅) both sides are zero; if U = ∅ both sides are zero.
- `FormalScheme.comparisonMap_test_local` (non-example): For X = Spec Z_(p), 𝓘 = (p), K = Z/ℓ: the comparison is with R⁺Γ(Y, i^*R⁺j_*K), not with R⁺Γ(U, K): H^1(Spec Q, Z/ℓ) is infinite while H^1(Spa(Q_p), Z/ℓ) is finite; a comparison map with target R⁺Γ(U, −) cannot be an isomorphism.
- `FormalScheme.comparisonMap_test_H0` (compatibility): On a sheaf K in degree 0, H⁰ of (*) is ψ_K: i^*j_*K → b_*a^*K.

*Acceptance.* For X = Spec O_K (O_K a henselian discretely valued ring with completion O_K^) and 𝓘 = (ϖ): on a sheaf given by a continuous Gal(K^sep/K)-module M, ψ is M^{I_K} → M^{I_{K^}}, an isomorphism because Gal(K^^sep/K^) ≅ Gal(K^sep/K) for henselian K.

*Uses:* [completion-comparison-data-3-5-12](#completion-comparison-data-3-5-12), `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.13, p. 208; Berkovich-VanishingCyclesFormal-1994 §5, before Theorem 5.1, printed p. 553; Berkovich-VanishingCyclesFormal-1994 §5, before Theorem 5.1, printed p. 554.

<a id="scheme-completion-comparison-3-5-13"></a>
**The nearby-cycle comparison for completions: i^*R⁺j_*K ≅ R⁺b_*a^*K for torsion coefficients (Theorem 3.5.13(ii))** — `scheme-completion-comparison-3-5-13` (comparison (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/CompletionComparison`) — planet: *Nearby-cycle comparison i*Rj*K ≅ Rb*a*K*

Let (X, 𝓘) be completion data (node completion-comparison-data-3-5-12): X a scheme, Y = V(𝓘) for a quasi-coherent ideal 𝓘 of finite type, U = X − Y, X^ the completion along Y, and either (α) X locally noetherian or (β) 𝓘 locally principal and X^ of type (S) — exactly as in (3.5.12). Let E be a torsion ring. Then the natural transformation (*) i^* ∘ R⁺j_* ⟶ R⁺b_* ∘ a^* of node completion-comparison-map-3-5-13-i is an isomorphism of functors D⁺(U_et, E) → D⁺(Y_et, E). The torsion scope is the source's: every torsion ring, with no prime-to-residue-characteristic hypothesis; that narrower restriction belongs to the valuation-base-change theorem (ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles), not to this comparison.

*Hypotheses.* (α) or (β) exactly as (3.5.12). E torsion for the isomorphism; the transformation exists for every ring E. Imports: Theorems 3.2.9 and 3.2.10 (ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12), whose proofs in Hub96 §§3.3–3.4 are Hub96-only (gap recorded there).

*Proof.* Way-out reduction to a sheaf K of E-modules in degree 0; the statement is étale-local on X, so assume X = Spec A affine with (α) A noetherian or (β) 𝓘 = sA and A^ satisfying (S)(b). Fix a geometric point ȳ of Y and the category C of ȳ-pointed affine étale X-schemes (Z, u); let Z^h be the henselisation of Z along Y ×_X Z. (i^*R^n j_*K)_ȳ = colim_C H^n(U ×_X Z, K) (stalks of R^n j_* at geometric points of Y, SchemeAndStackFoundations:SF.2). (R^n b_* a^*K)_ȳ = colim_C H^n(d(Z^), a^*K): the Z^ with the induced pointing are cofinal étale neighbourhoods of ȳ in (X^)_et ≃ Y_et (node etale-lifting-along-special-fibre, node reduced-special-scheme-equivalence), and node higher-direct-images-of-lambda (ii). For each (Z, u): H^n(U ×_X Z^h, K) ≅ H^n(d(Z^), a^*K) (node henselised-generic-locus-cohomology), compatibly with the maps induced by φ_Z. lim_C (U ×_X Z^h) ≅ lim_C (U ×_X Z) = U ×_X Spec O^sh_{X,ȳ} (henselising along Y does not change the strict localisation), and étale cohomology commutes with such cofiltered limits of qcqs schemes with affine transition maps (SchemeAndStackFoundations:SF.2); so colim_C H^n(U ×_X Z^h, K) = colim_C H^n(U ×_X Z, K), and the resulting isomorphism of stalks is (*)_ȳ. Isomorphism on all stalks at geometric points of Y ⇒ isomorphism (Y_et has enough points).

*Acceptance.* Both alternatives cover the classical case of a discrete valuation base (locally noetherian) and the nondiscrete rank-one case (principal ideal of definition, X^ of type (S)). The theorem is stated for arbitrary torsion E; the prime-to-residue-characteristic restriction is not part of 3.5.13. X = Spec O_K, 𝓘 = (ϖ), O_K henselian DVR: the isomorphism is M^{I_K} ≅ M^{I_{K^}} in degree 0 and H^n(K^sh, M) ≅ H^n(K^^sh, M) in degree n (henselian fields and their completions have the same Galois theory).

*Uses:* [completion-comparison-map-3-5-13-i](#completion-comparison-map-3-5-13-i), [henselised-generic-locus-cohomology](#henselised-generic-locus-cohomology), [completion-comparison-data-3-5-12](#completion-comparison-data-3-5-12), [etale-lifting-along-special-fibre](#etale-lifting-along-special-fibre), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), [higher-direct-images-of-lambda](#higher-direct-images-of-lambda), `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `mathlib:CategoryTheory.GrothendieckTopology.HasEnoughPoints`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, (3.5.12), p. 207; Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.13, p. 208; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.13, p. 209; Berkovich-VanishingCyclesFormal-1994 §5, Theorem 5.1, printed p. 554; Berkovich-VanishingCyclesFormal-1994 Introduction, printed p. 540; Scholze-EtaleCohomologyDiamonds §1 (Introduction).

<a id="henselised-generic-locus-cohomology"></a>
**Cohomology of the henselised generic locus equals that of the generic fibre of the completion** — `henselised-generic-locus-cohomology` (lemma; `TauCeti/AlgebraicGeometry/FormalScheme/CompletionComparison`)

Let (X, 𝓘) be completion data with X = Spec A affine, J = 𝓘(X), and Z = Spec B affine étale over X, Z^h = Spec B^h for the henselisation (B^h, J^h) of the pair (B, JB), and Z^ = Spf B^ (J-adic completion). The composite d(Z^) → Spec B^ − V(JB^) → Spec B^h − V(JB^h) = U ×_X Z^h induces, for every torsion sheaf K on U_et, isomorphisms H^n(U ×_X Z^h, K) ≅ H^n(d(Z^), a^*K), n ≥ 0. Case (α): d(Z^) = Spa(B, B)_a with B carrying the JB-adic topology, and the statement is Theorem 3.2.10 for the pro-special subset Spa(B, B) and the scheme Spec B − V(JB). Case (β) (J = sA): d(Z^) = Spa(B(1/s), C) with C the integral closure of B in B(1/s), U ×_X Z^h is the spectrum of the henselisation of the affinoid ring (B(1/s), C) along Spa(B(1/s), C), and the statement is Theorem 3.2.9.

*Hypotheses.* K torsion; (α) or (β). Imports: Theorems 3.2.9 and 3.2.10 and the henselisation along pro-special subsets (ClassicalAdicEtaleCohomology:H1:henselian nodes); the identification of the henselisation along Spa(B(1/s), C) with the henselisation of B along J is Huber's Example 3.1.13.iii.

*Proof.* The map exists because B^ is J-adically complete, hence henselian along J (so B → B^ factors through B^h), and d(Z^) maps to the complement of V(J). Case (α): Spa(B, B) = Spa(B^, B^) is a pro-special subset whose henselisation is B^h (ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset, Example 3.1.13.iii); Theorem 3.2.10 (ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12) applied to X' = Spec B − V(JB) → Spec B gives the isomorphism. Case (β): d(Z^) = Spa(B(1/s), C) (AdicSpacesPartII:R2/generic-fibre-functor-d, case (b)); the henselisation of the affinoid ring (B(1/s), C) along Spa(B(1/s), C) is B^h[1/s] (Example 3.1.13.iii); Theorem 3.2.9 compares the cohomology of its spectrum with that of the pro-special subset.

*Acceptance.* For Z = X = Spec O_K (O_K a DVR, not necessarily henselian) and J = (ϖ): U ×_X Z^h = Spec K^h (henselisation), d(Z^) = Spa(K^, O_K^), and the lemma is the classical Galois-theoretic fact Gal(K^sep/K^h) ≅ Gal(K^^sep/K^).

*Uses:* [completion-comparison-data-3-5-12](#completion-comparison-data-3-5-12), `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `mathlib:HenselianRing`, `mathlib:IsAdicComplete`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, proof of 3.5.13, p. 209; Huber-EtaleCohomology-1996 §3.1, Example 3.1.13.iii, p. 171; Huber-EtaleCohomology-1996 §3.2, Theorem 3.2.10, p. 180.

<a id="generic-fibre-cohomology-3-5-14"></a>
**Cohomology of the generic fibre of the completion via nearby cycles (Corollary 3.5.14)** — `generic-fibre-cohomology-3-5-14` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/CompletionComparison`)

Let (X, 𝓘) be completion data (hypothesis (α) or (β) of (3.5.12)), E a torsion ring and K ∈ D⁺(U_et, E). Then R⁺Γ(d(X^), a^*K) ≅ R⁺Γ(Y, i^*R⁺j_*K) naturally in K, the isomorphism being the inverse of the global comparison R⁺Γ(Y, i^*R⁺j_*K) → R⁺Γ(Y, R⁺b_*a^*K) ≅ R⁺Γ(d(X^), a^*K). In particular there is a spectral sequence H^p(Y, i^*R^q j_*K) ⇒ H^{p+q}(d(X^), a^*K) for arbitrary (not necessarily proper) X.

*Hypotheses.* (α) or (β); E torsion; K bounded below.

*Proof.* R⁺Γ(d(X^), −) = R⁺Γ(Y, R⁺b_*(−)) (Leray for b: node higher-direct-images-of-lambda (iii) composed with (X^)_et ≃ Y_et). Apply R⁺Γ(Y, −) to the isomorphism of node scheme-completion-comparison-3-5-13.

*Acceptance.* If X is proper over a henselian discrete valuation ring O with 𝓘 = m_O·O_X (Y the closed fibre), proper base change gives R⁺Γ(Y, i^*R⁺j_*K) = R⁺Γ(X, R⁺j_*K) = R⁺Γ(U, K); so for X proper over a complete discrete valuation ring O_K the cohomology of the generic fibre X_K equals that of the analytic space d(X^) = (X_K)^ad (the good-reduction locus is everything for proper X). For X = A^1_{O_C} (C = C_p) with 𝓘 = (p): R⁺Γ(closed unit disc, Z/ℓ) = R⁺Γ(A^1_{k̄}, Z/ℓ) = Z/ℓ in degree 0 (ℓ ≠ p), although X is not proper.

*Uses:* [scheme-completion-comparison-3-5-13](#scheme-completion-comparison-3-5-13), [higher-direct-images-of-lambda](#higher-direct-images-of-lambda), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), `ClassicalAdicEtaleCohomology:H0/derived-direct-image`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Theorem 3.5.13, p. 208; Berkovich-VanishingCyclesFormal-1994 §4, Corollary 4.2(iii), printed p. 548; Berkovich-VanishingCyclesFormal-1994 Introduction, printed p. 540; Berkovich-VanishingCyclesFormal-1994 §5, Theorem 5.1, printed p. 554.

<a id="tube-cohomology-3-5-15"></a>
**Cohomology of the support over a locally closed L ⊆ Y (Corollary 3.5.15)** — `tube-cohomology-3-5-15` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/CompletionComparison`)

Let (X, 𝓘) be completion data, E a torsion ring, K ∈ D⁺(U_et, E) and L ⊆ |Y| = |X^| locally closed. Let K' be the restriction of a^*K to the pseudo-adic space d(X^, L) = (d(X^), λ_{X^}⁻¹(L)) and K'' the restriction of i^*R⁺j_*K to (L_red)_et ≃ (X^, L)_et. Then R⁺Γ(d(X^, L), K') ≅ R⁺Γ(L, K'') naturally in K.

*Hypotheses.* (α) or (β); E torsion; L locally closed in Y.

*Proof.* By node restriction-and-extension-by-zero-3-5-11 for the supports L ⊆ |X^| (the morphism of pairs i_L: (X^, L) → (X^, |X^|)): i_L^* R⁺λ_{X^*} ≅ R⁺λ_(X^,L)* d(i_L)^*. Hence R⁺Γ(d(X^, L), K') = R⁺Γ(L, R⁺λ_(X^,L)* K') ≅ R⁺Γ(L, i_L^* R⁺b_* a^*K) (Leray, node higher-direct-images-of-lambda for λ_(X^,L)). Node scheme-completion-comparison-3-5-13: R⁺b_* a^*K ≅ i^*R⁺j_*K; restrict to L.

*Acceptance.* L = |Y|: this is node generic-fibre-cohomology-3-5-14. X = Spec O_C[T] (C = C_p), 𝓘 = (p), L = {T = 0} ⊆ A^1_{k̄}: the support d(X^, L) = (closed disc, {|T| < 1}) and R⁺Γ(d(X^, L), Z/ℓ) = (i^*R⁺j_*Z/ℓ)_{0} = Z/ℓ in degree 0 (the nearby cycles of the smooth X are constant).

*Uses:* [scheme-completion-comparison-3-5-13](#scheme-completion-comparison-3-5-13), [restriction-and-extension-by-zero-3-5-11](#restriction-and-extension-by-zero-3-5-11), [higher-direct-images-of-lambda](#higher-direct-images-of-lambda), [pairs-and-pseudo-adic-supports](#pairs-and-pseudo-adic-supports), [pair-topos-reduced-subscheme-3-5-5](#pair-topos-reduced-subscheme-3-5-5), `ClassicalAdicEtaleCohomology:H0/derived-direct-image`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, proof of 3.5.16, p. 210; Berkovich-VanishingCyclesFormal-1994 §4, Corollary 4.2(iii), printed p. 548.

#### Valuation-ring bases and the identification with LPV.0 (3.5.16–3.5.17)

Over a microbial valuation ring — any rank, not necessarily discrete — the cohomology of the pseudo-adic space over the closed point of d(Spf A) computes the nearby cycles of the special fibre (3.5.16). Over a strictly henselian discrete valuation ring and the completed algebraic closure, Huber's 3.5.17 identifies the cohomology of the geometric rigid generic fibre of the completion with that of LPV.0's nearby-cycle complex; the sheaf-level comparison and its inertia equivariance are proved here, not just the equality of cohomology groups.

<a id="microbial-closed-fibre-support"></a>
**The pseudo-adic space over the closed point of d(Spf A) for a microbial valuation ring A (setup of 3.5.16)** — `microbial-closed-fibre-support` (construction; `TauCeti/AlgebraicGeometry/FormalScheme/NearbyCycles`)

Let A be a microbial valuation ring (Wedhorn Definition 5.46: A has a prime ideal of height one; equivalently A with its valuation topology is adic and non-discrete) with fraction field K and its valuation topology, I ⊆ A a finitely generated ideal of definition (so I = sA for a nonzero topologically nilpotent s), η and s_0 the generic and closed points of Spec A, and X a scheme locally of finite type over A with fibres X_η, X_{s_0}. Let X^ be the completion of X along X ×_A Spec A/I. Then: (1) X^ is of type (S) and does not depend on the choice of I; (2) (X, I·O_X) is completion data of type (β) (node completion-comparison-data-3-5-12): I·O_X is principal and X − V(I·O_X) = X_η, because (0) is the only prime of A not containing s; (3) d(Spf A) = Spa(K^, A^) (Huber 1.9.2(i)), whose points are the valuation rings between A^ and K^° (a chain with a unique closed point c_A, corresponding to A^ itself); (4) T := the preimage of c_A under d(X^) → d(Spf A) equals λ_{X^}⁻¹(X_{s_0}), so Z := (d(X^), T) = d(X^, X_{s_0}) is a pseudo-adic space (node pairs-and-pseudo-adic-supports; X_{s_0} is closed in |X^| = |X ×_A Spec A/I|); (5) c: Z_et → (X_η)_et is the restriction to Z of the morphism a of the completion data. The base need not be a discrete valuation ring and need not have rank one; if A has rank one, d(Spf A) is a point and Z = d(X^).

*Hypotheses.* A microbial valuation ring with its valuation topology (any rank; not necessarily complete, discrete or noetherian); I finitely generated ideal of definition; X locally of finite type over A.

*Proof.* (1): Spf A^ is of type (S) (AdicSpacesPartII:R2/formal-schemes-of-type-S, API spf_microbial; Huber §1.9), and the completion of a morphism locally of finite type preserves type (S) (API FormalScheme.IsTypeS.completion, Huber (1.9.5)); two finitely generated ideals of definition have cofinal powers. (2): a finitely generated ideal of a valuation ring is principal; the primes of A not containing s are those not containing the height-one prime √(sA), i.e. only (0). (3): AdicSpacesPartII:R2/generic-fibre-functor-d (API genericFibre_spf_microbial) and Wedhorn Example 7.17 (K^° is the rank-one valuation ring dependent on A). (4): for t ∈ d(X^), its image in Spa(K^, A^) is the valuation ring of t restricted to A; it is A^ exactly when the centre of t lies over the closed point of Spec A, i.e. when λ_{X^}(t) ∈ X_{s_0}. (5): node completion-comparison-data-3-5-12 and restriction to the support (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero).

*API.*

- `FormalScheme.MicrobialBase` (structure): (A, I, X): A a microbial valuation ring with its valuation topology, I a finitely generated ideal of definition, X a scheme locally of finite type over A.
- `FormalScheme.MicrobialBase.completion_isTypeS` (instance): X^ (completion along X ×_A Spec A/I) is of type (S).
- `FormalScheme.MicrobialBase.completion_indep` (other): X^ does not depend on I.
- `FormalScheme.MicrobialBase.completionData` (compatibility): (X, I·O_X) is completion data of type (β) with U = X_η and Y = X ×_A Spec A/I.
- `FormalScheme.MicrobialBase.genericFibre_spf` (compatibility): d(Spf A) = Spa(K^, A^) with points the valuation rings between A^ and K^°, and closed point c_A.
- `FormalScheme.MicrobialBase.closedFibreSupport` (constructor): Z = (d(X^), T) = d(X^, X_{s_0}), a pseudo-adic space.
- `FormalScheme.MicrobialBase.mem_closedFibreSupport_iff` (characterisation): t ∈ T ↔ t maps to c_A ↔ λ_{X^}(t) ∈ X_{s_0}.
- `FormalScheme.MicrobialBase.closedFibreSupport_eq_of_rankOne` (simp): If A has rank one then Z = d(X^).
- `FormalScheme.MicrobialBase.genericFibreMap` (data): c: Z_et → (X_η)_et, the restriction of a to Z.

*Unit tests.*

- `FormalScheme.microbialBase_test_rankOne` (degenerate): For A = O_K of rank one, d(Spf A) = Spa(K^, O_K^) is a point, T = d(X^) and Z = d(X^).
- `FormalScheme.microbialBase_test_rankTwo` (computation): Let K be the completion of Q_p(t) for the Gauss norm (residue field F_p(t)) and A = {a ∈ O_K : ā ∈ F_p[t]_(t)}, a microbial valuation ring of rank two. For X = Spec A, d(X^) = Spa(K, A) has two points v_2 (valuation ring A) and v_1 (valuation ring O_K); T = {v_2}, and λ(v_1) is the height-one prime, which lies in V(I) but not in X_{s_0}.
- `FormalScheme.microbialBase_test_nondiscrete` (compatibility): For A = O_C (C = C_p), X = Spec O_C[T]: X^ = Spf O_C⟨T⟩ and Z is the closed unit disc over C; the construction does not use discreteness of the valuation.
- `FormalScheme.microbialBase_test_notAdicSpace` (non-example): In the rank-two example, T = {v_2} is closed and not open in d(X^), so Z is not an open adic subspace: replacing Z by an adic space (e.g. the interior of T) loses the point v_2.

*Acceptance.* For A of rank two, T is closed and not open in d(X^): Z is a pseudo-adic space which is not an adic space.

*Uses:* [completion-comparison-data-3-5-12](#completion-comparison-data-3-5-12), [pairs-and-pseudo-adic-supports](#pairs-and-pseudo-adic-supports), `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `mathlib:ValuationRing`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Corollary 3.5.16, p. 210; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.16, p. 210; Huber-EtaleCohomology-1996 §1.9, p. 96; Wedhorn-AdicSpaces-2019 Remark and Definition 5.46; Wedhorn-AdicSpaces-2019 Remark and Definition 5.46(iii); Wedhorn-AdicSpaces-2019 Example 7.17; Berkovich-VanishingCyclesFormal-1994 §5, opening, printed p. 552.

<a id="valuation-ring-base-3-5-16"></a>
**The comparison over a microbial valuation ring base (Corollary 3.5.16)** — `valuation-ring-base-3-5-16` (theorem (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/NearbyCycles`) — planet: *Comparison over a microbial valuation ring*

In the situation of node microbial-closed-fibre-support (A a microbial valuation ring with its valuation topology, I a finitely generated ideal of definition, X locally of finite type over A, j: X_η → X, i: X_{s_0} → X, Z = (d(X^), T) = d(X^, X_{s_0}), c: Z → X_η), for every torsion ring E and every K ∈ D⁺((X_η)_et, E) there is a natural isomorphism R⁺Γ(Z, c^*K) ≅ R⁺Γ(X_{s_0}, i^*R⁺j_*K). The base need not be a discrete valuation ring, need not be noetherian, and may have any rank; the coefficients may be any torsion ring.

*Hypotheses.* A microbial valuation ring (any rank); E torsion; K bounded below.

*Proof.* Apply node tube-cohomology-3-5-15 to the completion data (X, I·O_X) of type (β) (node microbial-closed-fibre-support (2)) with Y = X ×_A Spec A/I and L = X_{s_0} ⊆ |Y|: X_η = X − Y and d(X^, X_{s_0}) = Z; the restriction of i_Y^*R⁺j_*K to X_{s_0} is i^*R⁺j_*K.

*Acceptance.* For A = O_K complete of rank one and X proper over A: Z = d(X^) = (X_K)^ad and the statement becomes R⁺Γ((X_K)^ad, K) ≅ R⁺Γ(X_{s_0}, i^*R⁺j_*K) ≅ R⁺Γ(X_K, K) by proper base change. For A of rank two (node microbial-closed-fibre-support, test rankTwo), X = Spec A and K = M a torsion Galois module on Spec K: Z is the closed point of Spa(K, A) (as a pseudo-adic space) and both sides are R⁺Γ(Gal(K^sep/K^h), M) for the henselisation K^h of K with respect to the rank-two valuation of A.

*Uses:* [microbial-closed-fibre-support](#microbial-closed-fibre-support), [tube-cohomology-3-5-15](#tube-cohomology-3-5-15), [scheme-completion-comparison-3-5-13](#scheme-completion-comparison-3-5-13).

*Sources:* Huber-EtaleCohomology-1996 §3.5, Corollary 3.5.16, p. 210; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.16, p. 210; Berkovich-VanishingCyclesFormal-1994 §5, opening, printed p. 552; Berkovich-VanishingCyclesFormal-1994 §5, Theorem 5.1, printed p. 554.

<a id="huber-vanishing-cycles-are-nearby-cycles"></a>
**Huber's 'complex of vanishing cycles' RΨ_η is the nearby-cycle complex of LPV.0, not the cone RΦ** — `huber-vanishing-cycles-are-nearby-cycles` (comparison; `TauCeti/AlgebraicGeometry/FormalScheme/NearbyCycles`)

Let A be a henselian discrete valuation ring with separably closed residue field (a strictly henselian trait S = Spec A with generic point η and closed point s), k = Frac A, k̄ an algebraic closure, Ā the integral closure of A in k̄ (a henselian valuation ring of rank one, not discrete, with residue field purely inseparable over k(s)), S̄ = Spec Ā = {s̄, η̄}, X locally of finite type over A, X̄ = X ×_A Ā with ī: X_s̄ → X̄ and j̄: X_η̄ → X̄. For a torsion ring E and K ∈ D⁺((X_η)_et, E), Huber's complex RΨ_η(K) ∈ D⁺((X_s)_et, E) of Corollary 3.5.17 is ī^* R⁺j̄_*(K|_{X_η̄}), transported to (X_s)_et along the universal homeomorphism X_s̄ → X_s (topological invariance). With the action of Gal(k̄/k) = I (the inertia group, the residue field being separably closed) induced by its action on X̄ over X, this is the object RΨ_η(K) = (RΨ(K))_η of LefschetzPencilsAndVanishingCycles:LPV.0 (SGA 7 XIII 2.1.2.3, S̄ the normalisation of S in k(η̄)) in D⁺(X_s ×_s η, E): the nearby-cycle complex. It is not the vanishing-cycle cone RΦ(K), which for K on X sits in the distinguished triangle sp^*i^*K → RΨ_η(K_η) → RΦ(K) → of LPV.0. Huber's statement only uses the underlying complex; the Galois action is added here and is used in node formal-nearby-cycles-comparison.

*Hypotheses.* A strictly henselian DVR; E torsion; K bounded below. LPV.0 states its theory for coefficients prime to the residue characteristic; the definition ī^*R⁺j̄_* uses no such hypothesis, and for torsion divisible by p this node uses the same formula (request to LPV.0 recorded).

*Proof.* Unwind LPV.0's definition: RΨ_η(K)_η̄ = ī^* R j̄_* K_η̄ on X_s̄ with its continuous Gal(η̄/η)-action (LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle, LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities, conventions LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves). Huber's X ×_A Ā (proof of 3.5.17) is LPV.0's X̄ = X ×_S S̄; its closed fibre X_s̄ → X_s is a universal homeomorphism (k(s̄)/k(s) purely inseparable), so (X_s̄)_et ≃ (X_s)_et (Stacks 04DZ), and sheaves on X_s ×_s η are sheaves on X_s̄ with continuous I-action (LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S). RΦ ≠ RΨ: for X = S and K = E constant, Ā is strictly henselian and X_η̄ = Spec k̄ has no higher cohomology, so RΨ_η(E) = ī^*R⁺j̄_*E = E in degree 0 for every torsion E, while RΦ(E) = cone(E → E) = 0; so the right-hand side of 3.5.17 is RΨ.

*Acceptance.* X = S = Spec A, K = E: RΨ_η(E) = E in degree 0 with trivial action, RΦ(E) = 0; 3.5.17 gives R⁺Γ(Spa(k̄^), E) = E, consistent with RΨ and not with RΦ. X smooth over A, K = Z/ℓ with ℓ ≠ p: RΨ_η(Z/ℓ) = Z/ℓ and RΦ(Z/ℓ) = 0.

*Uses:* `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `SchemeAndStackFoundations:SF.2`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Corollary 3.5.17, p. 210; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.17, p. 210; Berkovich-VanishingCyclesFormal-1994 §5, opening, printed p. 552; Berkovich-VanishingCyclesFormal-1994 §5, printed p. 553.

<a id="formal-nearby-cycles-comparison"></a>
**Nearby cycles of X agree Galois-equivariantly with the formal nearby cycles of the completion** — `formal-nearby-cycles-comparison` (theorem; `TauCeti/AlgebraicGeometry/FormalScheme/NearbyCycles`)

In the situation of node huber-vanishing-cycles-are-nearby-cycles, let π be a uniformiser of A, X̄^ the π-adic completion of X̄ = X ×_A Ā along X_s̄, λ̄: d(X̄^)_et → (X̄^)_et ≃ (X_s̄)_et ≃ (X_s)_et the specialization morphism (node specialization-morphism-of-sites-lambda) and c: d(X̄^)_et → (X_η)_et the composite of the morphism a of the completion data (X̄, π·O_X̄) with X_η̄ → X_η. Then: (i) (X̄, π·O_X̄) is completion data of type (β), and d(X̄^) ≅ d(X^) ×_{Spa(k^, A^)} Spa(k̄^, O_{k̄^}) = Ȳ, the base change of the generic fibre of X^ to the completed algebraic closure; (ii) for every torsion ring E and K ∈ D⁺((X_η)_et, E), the comparison (*) of node completion-comparison-map-3-5-13-i for (X̄, π·O_X̄) is an isomorphism RΨ_η(K) = ī^*R⁺j̄_*(K|_{X_η̄}) ≅ R⁺λ̄_*(c^*K) in D⁺((X_s)_et, E); (iii) this isomorphism is Gal(k̄/k)-equivariant for the action on RΨ_η(K) (node huber-vanishing-cycles-are-nearby-cycles) and the action on R⁺λ̄_*(c^*K) induced by the continuous action of Gal(k̄/k) on k̄^, hence on X̄^ and d(X̄^) over X^ and d(X^); in particular the inertia actions on R^qΨ_η(K) and on the formal nearby-cycle sheaves R^qλ̄_*(c^*K) agree, and the latter action is continuous.

*Hypotheses.* A strictly henselian DVR; E any torsion ring; K bounded below. Ā is neither noetherian nor complete; its completion is O_{k̄^}.

*Proof.* (i) π·O_X̄ is principal. Affine-locally X = Spec B with B of finite type over A; the π-adic completion of B ⊗_A Ā is topologically finitely presented over O_{k̄^}, so X̄^ is locally tfp over O_{k̄^} and of type (S) via (b) (AdicSpacesPartII:R2/formal-schemes-of-type-S, API IsTypeS.of_isLocallyTFP). X̄^ = X^ ⊗̂_{A^} O_{k̄^}, and d commutes with this completed base change (AdicSpacesPartII:R2/generic-fibre-fibre-products (b)). (ii) node scheme-completion-comparison-3-5-13 for (X̄, π·O_X̄): X̄ − V(π) = X_η̄ and V(π) = X_s̄; transport along (X_s̄)_et ≃ (X_s)_et (Stacks 04DZ). (iii) σ ∈ Gal(k̄/k) acts on Ā over A, hence on X̄ by X-automorphisms preserving X_s̄ and X_η̄, on X̄^ and on d(X̄^); these are isomorphisms of completion data, and the comparison (*) is natural for them (node completion-comparison-map-3-5-13-i, API derivedComparison_natural). So (*) intertwines σ^* on both sides. Continuity of the action on RΨ_η(K) is part of LPV.0 (LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle) and transfers through the isomorphism.

*Acceptance.* X = A^1_A, K = Z/ℓ (ℓ ≠ p): R⁺λ̄_*(Z/ℓ) is the constant sheaf Z/ℓ on A^1_{k(s)} with trivial inertia action, matching RΨ_η(Z/ℓ) = Z/ℓ for the smooth X. X = Spec A[x, y]/(xy − π) (the nodal trait family of LPV.0's acceptance tests), K = Z/ℓ with ℓ ≠ p: at the node x̄, R^1Ψ_η(Z/ℓ)_x̄ ≅ Z/ℓ(−1) (LefschetzPencilsAndVanishingCycles:LPV.2), (ii) identifies it with (R^1λ̄_*Z/ℓ)_x̄, the H^1 of the support over the node in the generic fibre of the completion (an annulus over k̄^), and (iii) makes the two inertia actions agree.

*Uses:* [huber-vanishing-cycles-are-nearby-cycles](#huber-vanishing-cycles-are-nearby-cycles), [completion-comparison-data-3-5-12](#completion-comparison-data-3-5-12), [completion-comparison-map-3-5-13-i](#completion-comparison-map-3-5-13-i), [scheme-completion-comparison-3-5-13](#scheme-completion-comparison-3-5-13), [specialization-morphism-of-sites-lambda](#specialization-morphism-of-sites-lambda), [reduced-special-scheme-equivalence](#reduced-special-scheme-equivalence), `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-fibre-products`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `SchemeAndStackFoundations:SF.2`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, proof of 3.5.17, p. 210; Berkovich-VanishingCyclesFormal-1994 §5, Corollary 5.3, printed p. 555; Berkovich-VanishingCyclesFormal-1994 §5, before Theorem 5.1, printed p. 554; Berkovich-VanishingCyclesFormal-1994 §4, after Corollary 4.2, printed p. 548; Berkovich-VanishingCyclesFormal-1994 §4, Lemma 4.3, printed p. 548; Berkovich-VanishingCyclesFormal-1994 §4, before Theorem 4.9, printed p. 551.

<a id="vanishing-cycles-comparison-3-5-17"></a>
**Cohomology of the geometric rigid generic fibre of the completion via nearby cycles (Corollary 3.5.17)** — `vanishing-cycles-comparison-3-5-17` (comparison (decomposition id kept); `TauCeti/AlgebraicGeometry/FormalScheme/NearbyCycles`) — planet: *Huber's nearby-cycles comparison*

Let A be a henselian discrete valuation ring (of rank one) with separably closed residue field, k its fraction field with the valuation topology, k^ its completion, k̄^ the completion of an algebraic closure k̄, η and s the generic and closed points of Spec A, X a scheme locally of finite type over A, E a torsion ring, K ∈ D⁺((X_η)_et, E), and RΨ_η(K) ∈ D⁺((X_s)_et, E) Huber's 'complex of vanishing cycles of K', i.e. the nearby-cycle complex of LefschetzPencilsAndVanishingCycles:LPV.0 (node huber-vanishing-cycles-are-nearby-cycles; not RΦ). Let Y be the rigid analytic variety over k^ attached to the completion X^ of X along X_s (so r(Y) = d(X^), AdicSpacesPartII:R2/raynaud-generic-fibre), Ȳ := Y ⊗̂_{k^} k̄^, and c: Ȳ_et → (X_η)_et the natural morphism. Then R⁺Γ(Ȳ, c^*K) ≅ R⁺Γ(X_s, RΨ_η K), with X_s the closed fibre itself (its residue field is separably closed), and the isomorphism is Gal(k̄/k)-equivariant. No properness is assumed.

*Hypotheses.* A a henselian DVR with separably closed residue field; E torsion (any, including p-torsion); K bounded below. Rigid and adic étale topoi are identified by Huber's 2.1.4 (AdicSpacesPartII:R4/etale-site-and-rigid-comparison).

*Proof.* Source proof: apply Corollary 3.5.14 (node generic-fibre-cohomology-3-5-14) to the scheme X ×_A Ā and its closed subscheme X_s ×_A Ā, i.e. to the completion data (X̄, π·O_X̄) of node formal-nearby-cycles-comparison, and identify d(X̄^) with r(Ȳ) (AdicSpacesPartII:R2/generic-fibre-fibre-products (b), AdicSpacesPartII:R2/raynaud-generic-fibre) and Ȳ_et with d(X̄^)_et (AdicSpacesPartII:R4/etale-site-and-rigid-comparison). Equivalently: apply R⁺Γ(X_s, −) to the equivariant isomorphism RΨ_η(K) ≅ R⁺λ̄_*(c^*K) of node formal-nearby-cycles-comparison and use Leray for λ̄ (node higher-direct-images-of-lambda (iii)); equivariance follows from that node.

*Acceptance.* X proper and smooth over A, K = Z/ℓ (ℓ ≠ p): RΨ_η(Z/ℓ) = Z/ℓ, and Ȳ = (X_{k̄^})^an, so H^n(X_{k̄}, Z/ℓ) ≅ H^n(Ȳ, Z/ℓ) ≅ H^n(X_s, Z/ℓ): the specialisation isomorphism. X = A^1_A (not proper), K = Z/ℓ, ℓ ≠ p: Ȳ is the closed unit disc over k̄^ and both sides are Z/ℓ in degree 0; with K = Z/p the theorem still applies (no prime-to-p hypothesis), although RΨ_η(Z/p) is then in general not the constant sheaf (smooth morphisms are locally acyclic only for torsion prime to p). The Galois/inertia action is matched by node formal-nearby-cycles-comparison (iii), not only the abstract cohomology groups.

*Uses:* [formal-nearby-cycles-comparison](#formal-nearby-cycles-comparison), [huber-vanishing-cycles-are-nearby-cycles](#huber-vanishing-cycles-are-nearby-cycles), [generic-fibre-cohomology-3-5-14](#generic-fibre-cohomology-3-5-14), [higher-direct-images-of-lambda](#higher-direct-images-of-lambda), `AdicSpacesPartII:R2/raynaud-generic-fibre`, `AdicSpacesPartII:R2/generic-fibre-fibre-products`, `AdicSpacesPartII:R4/etale-site-and-rigid-comparison`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`.

*Sources:* Huber-EtaleCohomology-1996 §3.5, Corollary 3.5.17, p. 210; Huber-EtaleCohomology-1996 §3.5, proof of 3.5.17, p. 210; Huber-EtaleCohomology-1996 §2.1, Proposition 2.1.4, p. 111; Berkovich-VanishingCyclesFormal-1994 §5, Corollary 5.3, printed p. 555; Huber-GeneralizationFormalRigid-1994 Introduction, printed p. 514.

#### Dependencies by stage

- `AdicSpacesPartII:F0`: formal schemes of finite ideal type, ideals of definition, thickenings, adic morphisms, fibre products, colimits of thickenings, adic systems, noetherian completion.
- `AdicSpacesPartII:R2`: type (S), d(X), λ_X, tubes, σ and φ (1.9.4–1.9.6), completed base change of generic fibres, Raynaud generic fibres, good-reduction locus.
- `AdicSpacesPartII:R0`: étale morphisms of adic spaces, (1.7.3), points of fibre products.
- `AdicSpacesPartII:R1`: Huber's fibre product of a scheme with an adic space; the rigid–adic functor r.
- `AdicSpacesPartII:R4`: rigid and adic étale topoi (Hub96 2.1.4).
- `AdicEtaleGeometry:A1`: étale site of an analytic adic space, geometric points, splitting over Spa(C, C⁺).
- `ClassicalAdicEtaleCohomology:H0`: sheaves of modules, derived direct images and Leray, pseudo-adic supports and extension by zero, constructible sheaves, Huber tilde-limits and 2.4.6, geometric stalks (request recorded).
- `ClassicalAdicEtaleCohomology:H1:henselian`: henselisations along pro-special subsets, 3.2.1, 3.2.9–3.2.10.
- `DiamondsAndVStacks:D0`: locally spectral spaces, pro-constructible subsets, filtered colimits and cohomology, Čech-to-derived.
- `EnhancedDerivedSheaves:E1`: K-injective replacements and derived categories of sheaves.
- `LefschetzPencilsAndVanishingCycles:LPV.0`: the nearby-cycle object RΨ, its Galois action and triangle (request recorded: arbitrary torsion coefficients).
- `SchemeAndStackFoundations:SF.2`: étale cohomology of schemes with torsion coefficients, strict henselisation stalks, topological invariance, limits (request recorded).
- `tauceti:TauCetiRoadmap/AdicSpaces (Layers 1–5)`: valuation spectra and Spa through the AdicSpacesPartII suppliers.

Consumers: ClassicalAdicEtaleCohomology:H1 (the umbrella comparison with LPV.0–2 re-exports 3.5.13 and 3.5.17), H1:valuation-exports (compatibility of 4.2.6–4.2.9 with the maps built here), H2 and H5 (formal-model steps of Hub96 4.1.1(c) and 3.7.2), DiamondEtaleCohomology:C5 and AdicCoefficientsAndComparisons:L5 (through the umbrella).

#### Acceptance tests for the stage

- Spf F_p → Spf Z_p is adic and an isomorphism modulo p but not étale: étaleness is tested at every level (formal-etale-morphism).
- For X = Spf O_{C_p}, X_red = Spec F̄_p is not a thickening X_𝒥, yet X_et ≃ (X_red)_et (reduced-special-scheme-equivalence).
- For X = Spf Z_p⟨T⟩ and L the closed point (p, T), the support of d(X, L) is {|T| < 1} and contains the rank-two point η_{1⁻}, which the tube ]L[ misses (pairs-and-pseudo-adic-supports).
- The point-lifting of Lemma 3.5.1 holds for points of any rank, proved without [HK, 2.1.3] (specialization-point-lifting).
- For X = Spf O_K (K complete discretely valued) and ℓ ≠ p, (R^nλ_*Z/ℓ)_{s̄} = Z/ℓ, Z/ℓ(−1), 0 for n = 0, 1, ≥ 2; for Z/p the degree-1 stalk is infinite and the theorem still applies (stalk-formula-constant-coefficients-3-5-10).
- Without the type-(S) hypothesis on the completed strict localisation, only the filtered formula 3.5.9 is used (stalk-formula-filtered-3-5-9).
- For X = Spec Z_(p) and 𝓘 = (p) the comparison is with R⁺Γ(Y, i^*R⁺j_*K) = R⁺Γ(Q_p, K), not with R⁺Γ(Spec Q, K) (completion-comparison-map-3-5-13-i).
- X = Spec O_C[T] with 𝓘 = (p, T) satisfies neither (α) nor (β) and no comparison is claimed (completion-comparison-data-3-5-12).
- The torsion scope of 3.5.13 is every torsion ring; no prime-to-residue-characteristic hypothesis is added (scheme-completion-comparison-3-5-13).
- Over a microbial valuation ring of rank two, the support of Z = d(X^, X_s) is closed and not open; Z is pseudo-adic, not adic, and 3.5.16 holds for it (microbial-closed-fibre-support, valuation-ring-base-3-5-16).
- For X = S the trait itself, RΨ_η(E) = E while RΦ(E) = 0, so the right-hand side of 3.5.17 is RΨ (huber-vanishing-cycles-are-nearby-cycles).
- For X proper smooth over a strictly henselian DVR and ℓ ≠ p, 3.5.17 gives H^n(X_{k̄}, Z/ℓ) ≅ H^n(X_s, Z/ℓ), Galois-equivariantly; for the nodal family xy = π the inertia actions on R^1Ψ and on the formal nearby cycles agree (formal-nearby-cycles-comparison, vanishing-cycles-comparison-3-5-17).

#### Gaps and requests

- **Proof of Proposition 3.6.1 and Corollaries 3.6.2–3.6.3 (henselian tubes) rests on inputs available only in Hub96.** The nine steps (I)–(IX) of the proof (Hub96 pp. 211–219) use (2.5.13), the spectral sequences (2.6.9)–(2.6.10), the constructible dévissage (2.3.13.i), (2.7.8), (2.7.10), (2.7.12), the discrete-affinoid reduction (3.4.2)–(3.4.3), (3.3.4), [KPR, 2.8.2] and Gabber's criterion [G]. No public source restates the steps, so they are listed in the node's proof steps and not decomposed into nodes. Next action: obtain a public treatment of cohomology of henselian tubes (Fujiwara, 'Theory of tubular neighborhood in étale topology', Duke Math. J. 80 (1995)) and restate steps (V)–(IX) from it, or read Hub96 §§2.5–2.7 and §3.3–3.4 and record their statements as nodes of ClassicalAdicEtaleCohomology:H0/H1:henselian.
- **Non-noetherian cases of Theorems 3.5.9 and 3.5.10 use Hub96's Appendix A.5 and (3.4.2)–(3.4.3).** In the non-noetherian case the proofs (Hub96 §3.6, pp. 220–225) pass through the auxiliary pseudo-adic spaces P_i ⊇ Q_i built from (B_i)_s with the discrete topology, transport cohomology by (3.4.2.ii, iii.b), and use the sites T_{et,•} with the equivalence (Y_0)~ ≅ Y~_{et,•} of Appendix A.5. The noetherian cases need only nodes of this packet and H1:henselian. Hansen's public restatement covers the noetherian case of 3.5.10 over a discretely valued field.
- **Proofs of Theorems 3.2.9 and 3.2.10 (H1:henselian) are not public.** The stalk identification in Theorem 3.5.13 and the noetherian case of 3.5.10 apply 3.2.9 (principal-ideal case) and 3.2.10 (noetherian case). Their proofs (Hub96 §§3.3–3.4) are recorded as a gap of ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12; this packet only consumes the statements.
- **Berkovich's public comparison theorems are for Berkovich spaces over rank-one bases.** Berkovich 1994 Theorem 5.1 and Corollary 5.3 state i^*(R^q j_*F) ≅ R^qθ(F^) and R^qΨ_η(F) ≅ R^qΨ_η(F^) for torsion sheaves on schemes locally finitely presented over a henselian valuation ring of rank ≤ 1, for Berkovich analytic generic fibres. They support the rank-one (β) case of 3.5.13 and 3.5.16–3.5.17 as public restatements but do not replace the adic proofs: transporting them to d(X^) needs the comparison of étale topoi of Berkovich spaces and adic spaces (Hub96 §8.3, not public) and they do not cover higher-rank microbial bases or case (α). Next action: record a public comparison of étale topoi of good Berkovich spaces with taut adic spaces (Huber 1996 §8.3 has no public restatement in the library) or keep the adic proofs as the route.
- **Request to `SchemeAndStackFoundations:SF.2`.** Scheme-level étale cohomology used by the formal/adic comparison, for an arbitrary torsion coefficient ring E (not only torsion prime to the residue characteristics): (a) small étale sites with i^*, j_*, j_!, R⁺j_* on D⁺(−, E) for open/closed immersions; (b) stalks at geometric points as colimits over étale neighbourhoods, strict henselisations O^sh as limits of pointed affine étale neighbourhoods, and (R^q f_* F)_ȳ = H^q(X ×_Y Spec O^sh_{Y,ȳ}, F) for qcqs f; (c) topological invariance of the small étale site for universal homeomorphisms (Stacks 04DZ, 039R) as an equivalence of sites and topoi; (d) Zariski-local lifting of étale morphisms along closed immersions, and spreading out of étale κ(y)-algebras to étale neighbourhoods of y; (e) étale cohomology commutes with cofiltered limits of qcqs schemes along affine transition maps (Stacks 09YQ); (f) constructible sheaves of Λ-modules (Λ noetherian) with their stratification description; (g) étale maps to the spectrum of a strictly henselian local ring have sections through points over the closed point; (h) proper base change, used in acceptance tests only.
- **Request to `LefschetzPencilsAndVanishingCycles:LPV.0`.** The trait nearby-cycle object RΨ_η(K) := ī^*R⁺j̄_*(K|_{X_η̄}) on X_s ×_s η with its continuous Gal(η̄/η)-action and the triangle sp^*i^*K → RΨ_η(K_η) → RΦ(K) →, defined for an arbitrary torsion coefficient ring E (SGA 7 XIII 2.1.2 uses no prime-to-p hypothesis in the definition), the prime-to-p hypothesis being attached only to the theorems that need it; and its functoriality for the change of trait to the normalisation S̄ = Spec Ā in k(η̄), with the colimit description over finite subextensions that gives continuity of the action. Huber's Corollary 3.5.17 holds for every torsion ring, and H1:formal-adic-comparison identifies Huber's 'complex of vanishing cycles' with this object rather than creating a second trait RΨ.
- **From `ClassicalAdicEtaleCohomology:H0`.** The nodes `H0/pseudo-adic-etale-site`, `H0/supports-and-extension-by-zero`, `H0/derived-direct-image`, `H0/classical-constructible-sheaves`, `H0/huber-tilde-limit`, `H0/tilde-limits-and-cohomological-continuity`, `H0/geometric-stalks-at-field-pairs` and `H0/etale-sheaves-of-modules` supply pseudo-adic spaces with their étale sites, supports, derived direct images, constructibility, tilde-limits with continuity and stalks; the pseudo-adic forms of continuity and of the stalk formula are a gap recorded in H0.

<a id="h1-valuation-nearby-cycles"></a>

## H1:valuation-nearby-cycles. Arbitrary valuation bases, not just traits


**Dependencies.** Scheme-level étale sheaves, derived push-forward, strict localizations, stalk
formulas, proper base change and topological invariance come from the PR196 owners
(`UPSTREAM:CohomologicalPointCounting:EtaleBaseChange:3-8`), constructible coefficients and the
finite-type finiteness base cases from `UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:7-9`,
on Mathlib's small étale site (`AlgebraicGeometry.Scheme.smallEtaleTopology`, a Grothendieck
abelian sheaf category with enough points). Derived functors on `D⁺` and derived tensor products
are EnhancedDerivedSheaves E1's; commutation of cohomology with filtered colimits is
DiamondsAndVStacks D0's. Continuity of étale cohomology along limits of qcqs schemes with affine
transition maps is requested from AdicCoefficientsAndComparisons L2. The continuous
Hochschild–Serre spectral sequence is ArithmeticGaloisDuality R02.1–R02.2's; profinite Sylow
theory, pro-`p` groups and continuous cohomology of discrete modules are the Tau Ceti anchors
`ProfiniteProPGroups` (Layers 2–3) and `ProfiniteCohomology` (Layers 0, 10, 11). The trait case is
LefschetzPencilsAndVanishingCycles LPV.0. No analytic H2, diamond C1/C2, semipurity or Weil-weight
theorem enters. The stage prerequisites H0 and H1:henselian are not used by any node: H0 builds the
analytic étale sites, and Huber's affine henselian comparison (3.2.5, owned by H1:henselian) does
not enter the argument below.

**Sources.** Huber's book (Hub96) §4.2 is not public and no reviewed decomposition quotes it. Every
statement below is supported by a public restatement: Orgogozo, *Modifications et cycles proches
sur une base générale* (Introduction and Remarque 4.4: his Théorème 1.1 "permet de retrouver la
proposition 4.2.4 de [Hub96]", and Huber's proof treats base changes along valuative schemes
dominating S); Illusie, *Vanishing cycles over general bases* (Remark 3.3(c): over a valuative base
"one recovers a result of Huber [H, 4.2.4]"); Hansen–Zavyalov (Lemma A.4.3: the `i*Rj_*`
construction coincides with [Hub96, Section 4.2] over a henselian rank-one valuation ring);
Gabber–Ramero §§6.1–6.2 for the valuation theory; ECD §21 for the wild/tame pattern. The
unpublished parts of Huber's proof are recorded as gaps.

### Conventions

1. **Quadruples.** A quadruple `(X, S, η, s)`: `S = Spec V` for a valuation ring `V` of any rank
   (not necessarily discrete, noetherian or complete), points `η ⤳ s` (`𝔭_η ⊆ 𝔭_s`), a scheme
   `f : X → S`, and `O_{S,s} = V_{𝔭_s}` strictly henselian. `η = s` is allowed. `p_s` is the
   characteristic exponent of `k(s)`; "torsion prime to the residue characteristic" means killed by
   integers invertible in `k(s)`.
2. **The letter L.** `L` is a separable closure of `k(η)`, `η̄ = Spec L`, and `S(η̄)` is the strict
   localization of `S` at `η̄`, the spectrum of the strict henselization of `O_{S,η}`; it is a
   strictly henselian valuation ring with the value group of `O_{S,η}`.
3. **Milnor tubes, not fibres.** `X_η̃ = X ×_S S(η̄)` and `j : X_η̃ → X`. Nearby cycles are formed
   with this tube. The geometric fibre `X_η̄ = X ×_S η̄` gives `RΨ^geo_L`; the two agree when `η` is
   the generic point, and in general by Theorem H1v.3 (for prime-to-`p_s` torsion).
4. **Nearby, not vanishing.** `RΨ_L` is the nearby-cycle complex. The cone of the specialization
   map `i* → RΨ_L` (vanishing cycles `RΦ`) is not constructed here.
5. **Morphisms carry the Galois choice.** A morphism of quadruples includes an embedding `ι : L → L'`,
   which fixes the map of strict localizations and the restriction `φ_# : Gal(L'/k(η')) →
   Gal(L/k(η))`. "Cartesian" means `X' = X ×_S S'`; "dominant" means `O_{S,s} → O_{S',s'}` injective.
6. **No limit of traits.** Nothing is deduced by writing `V` as a filtered limit of discrete
   valuation rings: a valuation ring of rank ≥ 2 is not a directed union of DVRs along injective
   local maps (a directed union of archimedean ordered groups is archimedean).

### H1v.1 Quadruples, morphisms and strict localizations

`ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple` (definition,
planet "Valuation-base quadruple") — `AlgebraicGeometry.ValuationQuadruple`. API: `specializes`,
`henselianLocalRing_special`, `valuationRing_localizationAtEta`, `specialFiberι` (`i : X_s → X`,
Mathlib's `Scheme.Hom.fiber`), `localize` (base localized at `s`), `ofEq` (`η = s`),
`residueCharExp`, `baseChange`. Tests: `ofSepClosedField` (degenerate: `S` the spectrum of a
separably closed field, `η = s`); `admissible_pairs_rank_two` (for `V` strictly henselian with value
group `ℤ × ℤ` lexicographic, primes `0 ⊊ 𝔭 ⊊ 𝔪`, exactly `s = 𝔪` is admissible, with
`η ∈ {0, 𝔭, 𝔪}`); `not_of_Zp` (non-example: `ℤ_(p)` is a valuation ring but not strictly
henselian); `trait_compat` (a strictly henselian DVR gives LPV.0's trait datum).

`…/morphism-of-valuation-quadruples` (definition) — `ValuationQuadruple.Hom` with `id`, `comp`,
`strictLocalizationMap` (the unique local `S'(η̄') → S(η̄)` inducing `ι`), `galoisRestrict` (`φ_#`),
`IsCartesian`, `IsDominant`, `specialFiberMap`, `ofBaseChange`. Tests: identity (degenerate);
integral closure of a strictly henselian DVR in a finite separable `K'/K` gives `φ_#` the inclusion
of an open subgroup of index `[K' : K]` (computation); `Spec K → Spec V` is not a morphism onto
`(generic, closed)` (non-example); Cartesian morphisms are the base changes (characterisation).

`…/strict-localisation-of-a-valuation-ring` (lemma). For a valuation ring `V`, a prime `𝔭` and a
separable closure `L` of `κ(𝔭)`: `(V_𝔭)^sh` is a strictly henselian valuation ring with residue
field `L` and the value group of `V_𝔭` (Gabber–Ramero 6.2.5); it is `(Y^I)_{𝔮∩Y^I}` for the
integral closure `Y` in `K^s`; `D/I = Gal(L/κ(𝔭))` acts on it and is its automorphism group over
`V_𝔭` (Gabber–Ramero 6.2.3 and the universal property); for `𝔭 = 0` it is `L`, and for `V_𝔭`
strictly henselian it is `V_𝔭`.

### H1v.2 The nearby-cycle functor, its Galois action and base-change maps

`…/nearby-cycles-over-valuation-base` (construction, planet "Nearby cycles over a valuation ring")

```text
RΨ_L(F) := i* Rj_* j* F ∈ D⁺(X_{s,ét}, Λ),   F ∈ D⁺(X_ét, Λ),   j : X ×_S S(η̄) → X,   i : X_s → X.
```

No hypothesis on `f`, `F` or `Λ`. API: `nearbyCycles` (triangulated `Λ`-linear functor),
`nearbyCycles_def`, `tube`, `specialization` (`sp : i* → RΨ_L`), `nearbyCyclesGeo` with the map
`RΨ_L → RΨ^geo_L`, `nearbyCycles_ofEq` (`η = s` gives `i*`), `nearbyCycles_generic` (`η` generic:
tube = fibre), `nearbyCycles_stalk` (H1v.2 stalk formula), `nearbyCycles_restrictScalars`,
`nearbyCycles_trait` (LPV.0's `RΨ_η` on underlying complexes). Tests: `nearbyCycles_ofEq`
(degenerate); `nearbyCycles_base` (`X = S`: `RΨ_L(Λ) = Λ` in degree 0); `nearbyCycles_kummer`
(`V` a strictly henselian DVR, `X = Spec V[t]/(tⁿ − π)`, `n` prime to `p_s`: `R⁰Ψ_L(Λ) ≅ Λⁿ`,
higher terms zero); `nearbyCycles_ne_nonGeometric` (non-example: using `X_η` instead of `X_η̃` for
`X = S` gives `H¹ = Hom(Gal(L/K), ℤ/n) ≠ 0`); `nearbyCycles_trait_compat` (LPV.0 (2.1.2.3)).

`…/galois-action-on-nearby-cycles` (construction). `G_η = Gal(L/k(η))` acts on `RΨ_L(F)` by
transport along the automorphisms `X ×_S σ̃` of the tube over `X`; the action is natural in `F`,
fixes the image of `sp`, and is continuous: each stalk `H^q(X_(x̄) ×_S S(η̄), F)` is a discrete
`G_η`-module. For `η = s` the group is trivial; for `V` strictly henselian and `η` generic it is
the inertia group. API: `galoisAction`, `galoisAction_mul`, `galoisAction_one`,
`galoisAction_natural`, `isDiscrete_stalk_cohomology`, `specialization_galoisInvariant`,
`galoisAction_eq_inertia`, `galoisAction_trait`. Tests: trivial for `η = s` (degenerate); in the
Kummer example `σ` translates `Λ^{μ_n}` by `σ(π^{1/n})/π^{1/n}` (computation); the trivial action
is wrong there (non-example); `sp` lands in invariants (characterisation).

`…/nearby-cycles-base-change-map` (construction). For `φ = (g, h, ι)`,

```text
c_φ(F) : g_s* RΨ_L(F) ≅ i'* g* Rj_* j* F → i'* Rj'_* g̃* j* F ≅ RΨ_{L'}(g* F),
```

built from the base-change morphism `g* Rj_* → Rj'_* g̃*`. Natural in `F`, equivariant along `φ_#`,
`c_id = id`, `c_{φ∘ψ} = c_ψ ∘ ψ_s* c_φ`, compatible with `sp`; on stalks it is restriction along the
map of Milnor tubes. API: `nearbyCyclesBaseChange`, `_id`, `_comp`, `_equivariant`,
`_specialization`, `_stalk`, `_isIso`. Tests: `c_id = id` (degenerate); the localization at `s`
gives an isomorphism (computation); for `X = S ← X' = Spec V[t]/(tⁿ − π)` (not Cartesian) `c_φ(Λ)`
is the diagonal `Λ → Λⁿ` (non-example); equivariance (characterisation).

`…/nearby-cycles-equivariant-transport` (lemma). Changing `L` by a `k(η)`-isomorphism `τ` gives an
isomorphism `c_τ` intertwining `ρ(σ)` and `ρ(τστ⁻¹)`, and `c_{τσ₀} = c_τ ∘ ρ(σ₀)`: `RΨ_L` with its
action is independent of `L` up to transport unique modulo the action. Localizing the base at `s`
does not change `RΨ_L`.

`…/milnor-tube-stalk-formula` (lemma; the "henselian localization" step).

```text
(R^q Ψ_L F)_x̄ ≅ H^q(X_(x̄) ×_S S(η̄), F)      for every geometric point x̄ of X_s,
```

the cohomology of the Milnor tube, compatible with Galois actions and base-change maps; no
finiteness of `f` (the morphism `j` is affine).

### H1v.3 Reductions

`…/nearby-cycles-locality-and-proper-pushforward` (lemma; the "projective reduction"). (a)
`RΨ_L` commutes with étale restriction; (b) for torsion `Λ` and `h` proper over `S`,
`RΨ_L(Rh_* F) ≅ Rh_{s*} RΨ_L(F)` equivariantly; (c) for `X` affine of finite type with
`z : X ↪ A^N_S`, `w : A^N_S ↪ P^N_S`, `RΨ^X_L(F) ≅ z_s* w_s* RΨ^{P^N}_L(w_! z_* F)` compatibly with
base-change maps. Extension by zero changes `RΨ` along the boundary; only the restriction is used.

`…/radicial-invariance-of-nearby-cycles` (lemma). For `K'/K` purely inseparable and `V'` the
integral closure, `Spec V' → Spec V` is a universal homeomorphism, the base-changed quadruple is a
quadruple, and `c_φ` is an isomorphism for all `F` and all `Λ` (Stacks 04DZ); in characteristic
`p` one may pass to perfect fraction fields.

`…/nearby-cycles-commute-with-filtered-colimits` (lemma). For `f` qcqs, `R^qΨ_L` commutes with
filtered colimits; with `f` of finite presentation, statements for prime-to-`p_s` torsion sheaves
reduce to constructible sheaves of `ℤ/n`-modules, and from sheaves to `D⁺` by truncation.

`…/nearby-cycles-cohomological-amplitude` (lemma). For `f` of finite type and `n` invertible in
`k(s)`, `R^qΨ_L(F) = 0` for `q > 2 dim X_η` (via the tube–fibre comparison, cohomological
dimension of finite-type schemes over `L`, and continuity).

`…/noetherian-coefficient-change-for-constructibility` (lemma). Constructibility for `ℤ/n`
coefficients and the amplitude bound give `RΨ_L(F) ∈ D^b_c(X_s, B)` for every noetherian `B` with
`nB = 0` and constructible `F`: finite Tor-dimension is preserved (Orgogozo 6.3), a projection
formula for constant coefficients, and resolutions by sums of `j_{U!}B`. Acceptance: `B = 𝔽_ℓ[t]`.

### H1v.4 Valuation theory: tame quotients and Gauss valuations

`…/tame-quotient-of-a-henselian-valued-field` (lemma; the valuation-theoretic pro-`p` Sylow/tame
comparison). For `V` henselian with separably closed residue field of characteristic exponent `p`
and value group `Γ`:

```text
Gal(K^t/K) ≅ Hom_ℤ(Γ ⊗ ℤ_(p) / Γ, μ_(p)),     P := Gal(K^s/K^t) is pro-p, normal, of index prime to p,
```

so `P` is the unique `p`-Sylow subgroup (Gabber–Ramero 6.2.12, 6.2.16–6.2.17). Instances: DVR
(`∏_{ℓ≠p} ℤ_ℓ(1)`), value group `ℤ_(p) ⊂ ℚ` (tame quotient trivial, `G_K` pro-`p`: the
nondiscrete rank-one regression), value group `ℤ × ℤ` (`(∏_{ℓ≠p} ℤ_ℓ(1))²`: the higher-rank
regression).

`…/prime-to-p-cohomology-through-tame-quotient` (lemma). For discrete `M` of prime-to-`p` torsion,
`H^q(P, M) = 0` for `q > 0` and inflation `H^n(G_K/P, M^P) → H^n(G_K, M)` is an isomorphism
(Hochschild–Serre from R02.2); `cd_ℓ G_K = cd_ℓ Gal(K^t/K)` for `ℓ ≠ p`.

`…/gauss-valuation` (construction, planet "Gauss valuation") — `Valuation.gauss`,
`ValuationRing.gaussRing`.

```text
|a₀ + a₁T + … + a_mT^m|_G = max_i |a_i|,     V(T) = V[T]_{𝔪V[T]},     residue field κ(T),     value group Γ,
```

and `V(T₁,…,T_d)`, the local ring of `A^d_V` at the generic point of the special fibre. API:
`gaussPoly`, `gauss`, `gauss_C`, `gauss_X`, `gaussPoly_mul`, `gauss_valueGroup`, `gaussRing`,
`gaussRing_eq_localization`, `gaussRing_residueFieldEquiv`, `gaussRing_inf_K`, `gaussRingMv`,
`gauss_eq_gaussNorm`. Tests: over `ℤ_(p)`, `|p + T|_G = 1`, `|pT² + p²|_G = |p|` (computation);
trivial valuation (degenerate); agreement with Mathlib's `Polynomial.gaussNorm v 1` (compatibility);
`V[T]_{(𝔪,T)}` is not a valuation ring (non-example); residue field `κ(T)` and `V(T) ∩ K = V`
(characterisation).

`…/gauss-extension-tame-inertia-comparison` (lemma; the tame part of the Galois-surjectivity
calculation). For `W` the strict henselization of `V(T₁,…,T_d)` over a strictly henselian `V`:
`W` has value group `Γ`, `E^t = E·K^t` (Gabber–Ramero 6.2.18), and restriction
`Gal(E^t/E) → Gal(K^t/K)` is an isomorphism; hence prime-to-`p` cohomology of tame modules agrees.
No surjectivity on wild inertia is claimed; without it the comparison fails for modules on which
wild inertia acts nontrivially.

### H1v.5 The theorems

**Theorem H1v.3 (comparison with the geometric generic point).**
`…/comparison-with-geometric-generic-point` (planet "Milnor tube versus Milnor fibre"). For a
quadruple of finite type, `n` invertible in `k(s)`, `nΛ = 0` and `F ∈ D⁺(X_ét, Λ)`,
`RΨ_L(F) → RΨ^geo_L(F)` is a `G_η`-equivariant isomorphism; equivalently Milnor-tube and
Milnor-fibre cohomology agree at every geometric point of `X_s`. Nontrivial only for rank ≥ 2
(the regression case `η = 𝔭` for value group `ℤ × ℤ`). Nothing for `p_s`-torsion. Public
support: Orgogozo 5.1 after a modification, which has a section over a valuative base (4.4).

**Theorem H1v.4 (Cartesian change of valuation base; Hub96 4.2.4).**
`…/valuative-base-change-for-nearby-cycles` (planet "Valuative base change for nearby cycles").
For a Cartesian dominant morphism of quadruples with `f` locally of finite type and `n` invertible
in `k(s)`, `c_φ(F) : g_s* RΨ_L(F) → RΨ_{L'}(g* F)` is an isomorphism for every `F ∈ D⁺(X_ét, Λ)`,
`nΛ = 0`, equivariant along `φ_#`; in particular for every torsion sheaf prime to `p_s`. Not
claimed for `p_s`-torsion, non-Cartesian or non-dominant `φ`. Acceptance: dominant change of
strictly henselian traits (Deligne, Th. finitude); `V → O_C` for `C` a completed algebraic closure
(nondiscrete rank one); `η = s`.

**Theorem H1v.5 (constructibility; Hub96 4.2.5).** `…/constructibility-of-nearby-cycles` (planet
"Constructibility of nearby cycles"). For `f` locally of finite type, `B` noetherian with `nB = 0`,
`n` invertible in `k(s)`, and `F` a constructible sheaf of `B`-modules, each `R^qΨ_L(F)` is a
constructible sheaf of `B`-modules, zero for `q > 2 dim X_η`, with continuous Galois action.
Acceptance: the trait case (Th. finitude 3.2); `X = S`; the Kummer example; a base of value group
`ℤ × ℤ` treated directly; `B = ℤ/p` in mixed characteristic `(0, p)` gives no claim.

**Proof plan of H1v.3–H1v.5 (stage route).** Localize at `s`; pass to perfect fraction fields
(radicial invariance); reduce to constructible `ℤ/n`-sheaves (colimits, coefficient change) on
`P^N_S` (projective reduction); compare stalks through Milnor fibres; for prime-to-`p` torsion only
tame quotients matter (H1v.4 lemmas, Hochschild–Serre); induct on `dim X_η` through strictly
henselized Gauss valuation bases; in the curve case of 4.2.5 control `R^qΨ_L` by a constructible
subsheaf off finitely many closed points and finish with proper base change and finiteness over
`k(s)`. The induction step, the wild part of 4.2.10 (Galois surjectivity for defectless
extensions), the henselian-localization proof of 4.2.3 and the curve-case argument of 4.2.5
(pp. 249–250) are Hub96-only and recorded as gaps. The public route through Orgogozo's
modification theorem proves the three statements but rests on de Jong's alterations, owned by
AdicCoefficientsAndComparisons L5, a consumer of this stage; it is recorded, not used.

### Acceptance tests for the stage

- `η = s`: `RΨ_L = i*`, trivial Galois group, all base-change maps along Cartesian dominant
  morphisms are isomorphisms.
- Nondiscrete rank one: value group `ℤ_(p)` (tame quotient trivial, prime-to-`p` Galois cohomology
  vanishes in positive degrees); `V → O_C` base change.
- Higher rank: value group `ℤ × ℤ`, the three admissible `η`, and the tube–fibre comparison at
  `η = 𝔭`.
- Trait case: agreement with LPV.0's `RΨ_η` and with Deligne's constructibility and base change.
- Non-examples: the non-geometric generic fibre; a non-Cartesian morphism (`c_φ` the diagonal
  `Λ → Λⁿ`); `p_s`-torsion coefficients (no claim); no deduction from a limit of DVRs.

### Suggested Lean declarations

See `lean.md`. Scheme-level declarations live in `TauCeti/AlgebraicGeometry/Etale/NearbyCycles/`
under the namespace `AlgebraicGeometry.ValuationQuadruple`; valuation-theoretic ones in
`TauCeti/RingTheory/Valuation/` under `Valuation` and `ValuationRing`.

<a id="h1-valuation-exports"></a>

## H1:valuation-exports. Interfaces for analytic invariance and support

<a id="h1-valuation-exports"></a>
<a id="stage-H1:valuation-exports"></a>
### H1:valuation-exports — Interfaces for analytic invariance and support

This stage exports the valuation-base results that the analytic stages consume: comparisons of
nearby-cycle cohomology with cohomology with supports and with compact support, invariance of
nearby-cycle cohomology along a **surjective** map of valuation spectra with separably closed
fraction fields, constructibility, amplitude and finiteness, and the compatibility of all these
maps with the formal/adic comparison maps of H1:formal-adic-comparison. It constructs no new
nearby-cycle functor: `RΨ`, the quadruples `(X, S, η, s)` and the base-change map `bc` are those
of H1:valuation-nearby-cycles, and the tube comparisons `κ` are those of
H1:formal-adic-comparison (Hub96 3.5.11, 3.5.13, 3.5.16).

The stage text follows Huber's book (Hub96 4.2.6–4.2.9), which is not public and of which no
excerpt is in the reviewed decompositions. Every statement below is supported by a public source
that states or restates it: Orgogozo, *Modifications et cycles proches sur une base générale*
(who states that his results generalise Hub96 §4.2 and recover Hub96 4.2.4), Illusie's survey of
nearby cycles over general bases, Lu–Zheng (Example 4.26), Hansen–Zavyalov (Appendix A.4),
Kato (Constructions 4.2–4.3, restating Hub96 5.7.8), Berkovich's *Vanishing cycles for formal
schemes* (Theorem 4.9), ECD Lemma 16.3 and the Stacks Project. The correspondence with Huber's
numbered statements is recorded as a gap; the "finite-boundary" alternative of 4.2.8–4.2.9 has no
public statement and is not realised.

#### Pinned conventions

- A valuation ring is a domain whose ideals are totally ordered; every rank is allowed, including
  rank 0 (fields, the case `η = s`). `S = Spec A`, `η` the generic and `s` the closed point.
- The valuation rings in the invariance and finiteness theorems are **strictly henselian with
  separably closed fraction field**. Then the strict localisation at `η` is `η`, and the
  nearby-cycle functor of H1:valuation-nearby-cycles is `RΨ = i^* Rj_*` with `j : X_η → X`,
  `i : X_s → X`. A valuation ring with algebraically closed fraction field is automatically
  strictly henselian (this covers every `C^+` of ECD Lemma 16.3).
- A valuation ring is microbial if it has a prime `p_A` of height one; then `{η} = D(a)` for any
  `0 ≠ a ∈ p_A`, `X_η ⊆ X` is open, and the valuation topology is the `a`-adic topology.
- Coefficients: `Λ` a torsion ring. The prime-to-residue hypothesis is written `mΛ = 0` with `m`
  invertible in `A`; it is imposed exactly where the source imposes it (base change of `RΨ`,
  invariance for non-proper `X`, constructibility), never on proper base change.
- Spectra of higher-rank plus rings are kept: `Spa(C, C^+)` is not replaced by `Spa(C, 𝒪_C)`.

#### Objects

**Surjective map of valuation spectra** (`Huber.IsSurjectiveValuationMap`). A ring homomorphism
`φ : A → B` of valuation rings with `Spec φ` surjective. For valuation rings this is equivalent to
`φ` injective and local, and to `B` faithfully flat over `A`. For microbial rings, `φ` is
continuous iff `φ(p_A) ⊆ p_B`, and then `φ⁻¹(p_B) = p_A`. For algebraically closed nonarchimedean
fields `C_3 ⊆ C_1` with open bounded valuation subrings,

```text
Spa(C_1, C_1^+) → Spa(C_3, C_3^+) surjective  ⇔  C_3^+ → C_1^+ surjective on Spec  ⇔  C_1^+ ∩ C_3 = C_3^+ .
```

API: `isSurjectiveValuationMap_iff_injective_and_isLocalHom`,
`isSurjectiveValuationMap_iff_faithfullyFlat`, `.injective`, `.isLocalHom`, `.id`, `.comp`,
`.of_field`, `.comap_closedPoint`, `.comap_heightOnePrime`, `isSurjectiveValuationMap_iff_inter_eq`,
`.spa_surjective_iff`. Unit tests: `O_C → O_{C'}` (rank one, nondiscrete) is surjective; the
injective non-local inclusion `C^+ → O_C` of a rank-two plus ring is not; the local surjection
`A → A/p_A` is not; any map of fields is; `ℤ_(p) → ℤ_p` agrees with `Module.FaithfullyFlat`;
`Spa(C, O_C) → Spa(C, C^+)` is not surjective.

**Invariance map** (`AdicSpace.ValuationBase.invarianceMap`). For such `φ`, `f : X → S` qcqs,
`X' = X ×_S S'`, `g_s : X'_{s'} = X_s ⊗_{k(s)} k(s') → X_s`, and `F ∈ D^+((X_η)_et, Λ)`,

```text
inv_φ(F) : RΓ(X_s, RΨF) --g_s^*--> RΓ(X'_{s'}, g_s^* RΨF) --RΓ(bc_φ(F))--> RΓ(X'_{s'}, RΨF').
```

API: `invarianceMap_eq_comp_baseChange`, `_id`, `_comp`, `_natural` (triangulated in `F`),
`_restrict` (étale maps), `_of_isField`, `_proper` (becomes pullback `RΓ(X_η,F) → RΓ(X'_{η'},F')`),
`_tube` (becomes pullback of tube cohomology). Unit tests: `X = S, F = Λ` gives `id_Λ`; for fields
it is pullback along `X ⊗_K L → X`; it is undefined for `C^+ → O_C` (no morphism of quadruples over
the closed points); over the normalisation of a strictly henselian trait in an algebraic closure
it is the change-of-trait isomorphism of SGA 7 XIII 2.1.7.5 (LPV.0).

#### Theorems

1. **Invariance under surjective valuation base change** (the stage's 4.2.7). Let `φ : A → B` be
   a surjective map of valuation spectra between strictly henselian valuation rings with separably
   closed fraction fields, `f` of finite presentation or of finite type with `Spec A` noetherian,
   `mΛ = 0` with `m ∈ A^×`, `F ∈ D^+((X_η)_et, Λ)`. Then `bc_φ(F)` and `inv_φ(F)` are isomorphisms.
   If `f` is proper, `RΓ(X_η, F) ≅ RΓ(X'_{η'}, F')` for every torsion `Λ`. No claim for
   non-surjective `φ`, and none of the first two for residue characteristic dividing `m`.
2. **Support triangle along the special locus** (4.2.6, supports). For `S_0 ⊆ S` closed with
   `s ∈ S_0 ∌ η`, `X_0 = f⁻¹S_0`, `U = X ∖ X_0`:
   `i_{0*}RH_{X_0}(E) → E → Rj_{U*}j_U^*E →` and `RΓ_{X_0}(X,E) → RΓ(X,E) → RΓ(U,E) →`; the
   restriction `c_U : i^*Rj_{U*}j_U^*E → RΨ(j^*E)` is an isomorphism iff `U_S = {η}`, i.e. `A`
   microbial and `S_0 = V(p_A)`; for rank one this is `Ri^!E → i^*E → RΨ(E|X_η) →`.
3. **Proper comparison** (4.2.6, local cohomology). For `A` strictly henselian with separably
   closed fraction field and `f` proper, for every torsion `Λ`:
   `RΓ(X, E) ≅ RΓ(X_s, i^*E)`, `RΓ(X_η, F) ≅ RΓ(X_s, RΨF)`, and for microbial `A`,
   `H^n_{X_0}(X, E) ≅ H^{n−1}(X_s, RΦE)` with `RΦE` a cone of `i^*E → RΨ(E|X_η)`.
4. **Compactly supported comparison** (4.2.6, compact support). For `f` separated of finite
   presentation with a compactification `X ⊆ X̄`,

   ```text
   RΓ_c(X_η, F) ≅ RΓ(X̄_s, RΨ_X̄(j_! F)),
   RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F) → RΓ(∂_s, RΨ_X̄(j_! F)|∂_s) →,   ∂_s = X̄_s ∖ X_s .
   ```
5. **Finite-dimension alternative** (4.2.8–4.2.9). If `Spec A` is noetherian (e.g. `A` of finite
   rank) and `f` is of finite type with `X` affine, then `X_red = Y_red` for an `S`-scheme `Y` of
   finite presentation; étale sites, fibres, `RΨ`, `bc` and `inv` agree.
6. **Constructibility, amplitude, finiteness** (4.2.8–4.2.9). For `f` of finite type with fibres
   of dimension `≤ N`, `Λ` noetherian with `m ∈ A^×`, `F ∈ D^b_c` in degrees `[a, b]`:
   `RΨF ∈ D^b_c` in degrees `[a, b + 2N]`; `H^n(L, RΨF|_L)` finite for `L ⊆ X_s` proper;
   `H^n_c(L, RΨF|_L)` finite for `L ⊆ X_s` locally closed; `H^n(X_η, F)` finite for `f` proper and
   `H^n_c(X_η, F)` finite for `f` separated of finite presentation.
7. **Compatibility with H1:formal-adic-comparison** (comparison). For `A` strictly henselian
   microbial with separably closed fraction field: the 3.5.16 isomorphism
   `κ_X : RΓ(Z, c^*F) ≅ RΓ(X_s, RΨF)` for the tube `Z` over the closed point of `Spa(K, A)`; its
   restriction to constructible closed `L ⊆ X_0` inside `X_s`,
   `RΓ(d(X̂, L), c_L^*F) ≅ RΓ(L, RΨF|_L)` (Kato, Construction 4.2), compatible with 3.5.11; under a
   continuous surjective `φ`, pullback of tube cohomology corresponds to `inv_φ`; for complete rank
   one (discrete or not) `κ_X` is `RΓ(X_s, −)` of the sheaf isomorphism 3.5.13
   (Hansen–Zavyalov A.4.4).
8. **Export to H2** (application). For complete algebraically closed `C_3 ⊆ C_1` with
   `Spa(C_1, C_1^+) → Spa(C_3, C_3^+)` surjective, `X` of finite presentation over `C_3^+`, `n`
   prime to `p`, pullback `RΓ(Z_3, c_3^*F) → RΓ(Z_1, c_1^*F_1)` of tube cohomology is an
   isomorphism, in particular for `F = j_{V!}M` with `V` Zariski open. This is the algebraizable
   case of the input `[Hub96, 4.1.1(c)]` of ECD Lemma 16.3; H2 passes to affinoids of topologically
   finite type, perfectoid limits and adic quasi-compact opens.

A lemma: a valuation ring with algebraically closed fraction field is absolutely integrally closed
and strictly henselian (Stacks 0DCQ, 0DCS).

#### Regression tests of the stage text

- Nondiscrete rank one: `A = O_C → O_{C'}`, `X = P^1`, `G_m`: groups `Λ, 0, Λ(−1)` and
  `H^1(G_m) = Λ(−1)` on both sides; `RΓ_s(Spec O_C, Λ) = 0`; Hansen–Zavyalov's comparison holds
  for nondiscrete `O_K`.
- Higher-rank plus ring: `A = C^+` of rank two: invariance holds along `C^+ → C'^+` with
  `C'^+ ∩ C = C^+`; with `S_0 = {s}` the map `c_U` fails to be an isomorphism for
  `E = j_{U*}ι_*Λ` (`ι` the height-one point), while `S_0 = V(p_A)` gives the triangle.
- `η = s`: for fields, invariance is Stacks 0F0B, `RΨ = id`, the support theorem is vacuous.
- Non-surjective base map: `C^+ → O_C` with `j_!Λ` from `Spec O_C ⊆ Spec C^+`: `H^0 = 0` versus
  `Λ`; no invariance is asserted.
- Residue characteristic dividing the annihilator: `H^1(A^1_K, ℤ/p) ≅ K[x]/{g^p − g}` is not
  invariant under `K ⊊ L` algebraically closed of characteristic `p` (Artin–Schreier), so no 4.2.4
  or 4.2.7 claim; for proper `X` (`P^1`) invariance holds for `ℤ/p` by proper base change.

#### Dependencies

- ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles: quadruples, `RΨ`, `bc`, 4.2.4, 4.2.5,
  the Milnor-tube stalk formula and the amplitude bound.
- ClassicalAdicEtaleCohomology:H1:formal-adic-comparison: 3.5.11, 3.5.13, 3.5.16, pairs
  `d(X, L)`; base-change naturality is planned by completion-comparison-base-change-naturality, with the generic D0 mate-coherence proof requested.
- ClassicalAdicEtaleCohomology:H0: points of `Spa(C, C^+)`, extension by zero, derived direct image.
- UPSTREAM:ECD:SCH_BC, UPSTREAM:ECD:SCH_SHEAVES: proper base change, separably closed field
  invariance, finiteness over separably closed fields, cohomology with supports, topological
  invariance (requested).
- AdicCoefficientsAndComparisons:L2: nonnoetherian Nagata compactification and `RΓ_c` (requested).
- LefschetzPencilsAndVanishingCycles:LPV.0: trait specialisations used as compatibility tests.
- Consumers: ClassicalAdicEtaleCohomology:H1 (umbrella), H2 (4.1.1(c) in the form of ECD 16.3),
  H3, H4 (6.2.2), H5 (3.7.2, 3.8.1, 6.1.1), DiamondEtaleCohomology:C5,
  AdicCoefficientsAndComparisons:L5.

#### Acceptance

The stage is accepted when the invariance theorem, the three support comparisons, the finiteness
theorem and the formal/adic compatibility are proved from the nodes of H1:valuation-nearby-cycles
and H1:formal-adic-comparison and the requested scheme inputs, the export to H2 yields the
algebraizable tube invariance used for ECD Lemma 16.3, and each regression test above is a
compiled example. Constructibility uniform in the base point over the whole valuation base
(Orgogozo, Théorème 6.1) is not part of this stage.

<a id="h1"></a>

## H1. Formal models, specialization, and nearby-cycle comparison

<a id="h1"></a>

### H1. Formal models, specialization, and nearby-cycle comparison (compatibility umbrella)

**Dependencies:** [H1:henselian](#h1-henselian), [H1:formal-adic-comparison](#h1-formal-adic-comparison),
[H1:valuation-nearby-cycles](#h1-valuation-nearby-cycles), [H1:valuation-exports](#h1-valuation-exports) (the four
sub-stages, re-exported here); [H0](#h0) (analytic étale sheaves, D⁺ and derived global sections, as instances of
DiamondsAndVStacks D0 and EnhancedDerivedSheaves E1);
[LefschetzPencilsAndVanishingCycles LPV.0–2](../LefschetzPencilsAndVanishingCycles/README.md#lpv-0) (the trait
theory: henselian traits, the topos X_s ×_s S, Ψ and RΨ, RΦ, the vanishing triangle, variation, derived
functorialities, ordinary quadratic points); AdicSpacesPartII R2 (formal schemes of type (S), the generic-fibre
functor d and its compatibility with completed base-field extension); the scheme-level base-change facts of
`UPSTREAM:ECD:SCH_BC` (strict-localization stalk formula, integral base change, topological invariance). The stage
edges from AdicCoefficientsAndComparisons L2 and AdicEtaleGeometry A2 enter through the sub-stages.

After RS-05, H1 is a compatibility umbrella. It re-exports the main theorems of its four sub-stages on the common
carriers and proves the comparisons with the trait theory of LPV.0–2. It constructs no object of its own: no
henselization, no specialization morphism, no nearby-cycle functor, no RΦ. The trait theory is LPV's; the
non-discrete and higher-rank valuation-base extension and the formal/adic comparison are the sub-stages'. What H1
adds is the proof that these fit together: Huber's analytic comparison 3.5.17 is a statement about LPV.0's RΨ with
its inertia action, the valuation-base RΨ_L restricts on a trait to LPV.0's RΨ, and the vanishing complex RΦ enters
only as the cone of the analytic specialization map.

#### Pinned conventions

- **Trait.** A is a strictly henselian discrete valuation ring (Mathlib: `IsDiscreteValuationRing A`,
  `HenselianLocalRing A`, `IsSepClosed (IsLocalRing.ResidueField A)`), with residue characteristic exponent p,
  S = Spec A, generic point η, closed point s, k = Frac A, k^sep ⊆ k̄ separable and algebraic closures,
  A^sep and Ā the integral closures of A in k^sep and in k̄, and k^, k̄^, A^, Ā^ the completions.
  I = Gal(k^sep/k) is the inertia group (k(s) is separably closed) and acts on k̄ through
  Aut(k̄/k) ≅ Gal(k^sep/k).
- **Closed fibre, not a new geometric fibre.** The special fibres X_s̄ (LPV.0), X_s ×_A Ā (Hub96 3.5.17) and X_s
  are identified by universal homeomorphisms (topological invariance of the étale site); Huber's 3.5.17 is stated on
  X_s itself.
- **Terminology.** Huber's "complex of vanishing cycles" RΨ_η(K) (3.5.17), Berkovich's "vanishing cycles
  functor" Ψ_η and Deligne's "faisceaux de cycles évanescents" R^iΨ are all the **nearby-cycle** object RΨ_η of
  LPV.0. The **vanishing complex** — Deligne's "complexe évanescent" — is LPV.0's RΦ(K'), the cone in

  ```text
  sp^* i^* K'  →  RΨ_η(K'|X_η)  →  RΦ(K')  →(+1)        (SGA 7 XIII 2.1.2.4)
  ```

  defined for K' on all of X; it depends on i^*K', not only on the generic fibre.
- **Coefficient scopes.** Hub96 3.5.13–3.5.17 hold for every torsion ring E (p-torsion included). LPV.0 works with
  torsion rings prime to p (SGA 7 XIII 2.1.1); Hub96 4.2.4–4.2.5 are prime-to-residue-characteristic statements.
  H1 neither narrows 3.5.13 nor widens 4.2.4. The identifications with LPV.0's objects are stated for E prime to p;
  for p-torsion the H1 statement is 3.5.17 itself.

#### Re-exports

Each re-export is an alias with the sub-stage declaration's statement, checked by `rfl`; the node records the
scope that must not move.

- `ClassicalAdicEtaleCohomology:H1/henselian-substage-export`: henselian f-adic rings and henselization
  (3.1.1–3.1.3, with "a complete f-adic ring is henselian"), pro-special subsets and A(U) (3.1.6–3.1.12), the
  comparison 3.2.1 for affinoid A **not necessarily complete** with its three coefficient ranges (sets, n = 0;
  ind-finite groups, n ≤ 1; abelian torsion groups, all n), Gabber's affine analogue 3.2.5, and 3.2.9–3.2.12.
  Henselian pairs are Mathlib's `HenselianRing`.
- `ClassicalAdicEtaleCohomology:H1/formal-adic-substage-export`: λ_X: d(X)_et → X_et for type (S), pairs (X, L)
  and d(X, L), the stalk formulas 3.5.8 (type-(S) assumption) / 3.5.9 (filtered) / 3.5.10, 3.5.11, the
  comparison

  ```text
  i^* ∘ R⁺j_*  →  R⁺b_* ∘ a^*   on D⁺(U_et, E),  an isomorphism for every torsion ring E      (Hub96 3.5.13)
  ```

  under (3.5.12) (X locally noetherian, or the ideal locally principal and X̂ of type (S)), 3.5.14–3.5.17.
- `ClassicalAdicEtaleCohomology:H1/valuation-nearby-cycles-substage-export`: RΨ_L(F) = i^*Rj_*j^*F for a
  quadruple (X, S, η, s) over a valuation ring of any rank, η = s allowed, its Galois action and base change,
  4.2.3, 4.2.4 (torsion prime to the residue characteristic exponent at s), 4.2.5 (constructibility, B annihilated
  by an integer invertible in k(s)).
- `ClassicalAdicEtaleCohomology:H1/valuation-exports-substage-export`: 4.2.6 (supports), 4.2.7 (invariance for
  **surjective** maps of valuation spectra with separably closed fraction fields), 4.2.8–4.2.9 (constructibility
  and finiteness with their alternatives), compatible with the formal/adic maps; inputs of H2, H4 and H5.

#### Comparison with LPV.0–2

With A as above, X → S locally of finite type, X̂ the completion of X along X_s, Y = d(X̂) over Spa(k^, A^),
Ȳ = Y ⊗̂_{k^} k̄^ (the analytic geometric generic fibre) and c: Ȳ_et → (X_η)_et:

1. `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` (lemma). For E prime to p and K ∈ D⁺((X_η)_et, E),
   LPV.0's RΨ_η(K) (underlying ī^*Rj̄_*(K|X_η̄) on X_s̄), Huber's i'^*Rj'_*(K|X_k̄) on X_s ×_A Ā, and RΨ_L of
   H1:valuation-nearby-cycles are canonically isomorphic on (X_s)_et, I-equivariantly; for η = s, RΨ_L(F) = i^*F
   = RΨ(F)_s. Proof: universal homeomorphisms Spec Ā → Spec A^sep and X_s̄ → X_s with topological invariance; the
   strict-localization stalk formula for Rj_* against LPV.0's stalk formula 2.1.4 (S^nr = S); actions by transport
   of structure. Tests: `traitNearbyCycles_test_point`, `traitNearbyCycles_test_eta_eq_s`,
   `traitNearbyCycles_test_smooth_constant`, `traitNearbyCycles_nonexample_rPhi`.
2. `ClassicalAdicEtaleCohomology:H1/formal-nearby-cycle-comparison-inertia-equivariance` (lemma). For every torsion
   E, the isomorphism R⁺Γ(Ȳ, c^*K) ≅ R⁺Γ(X_s ×_A Ā, i'^*Rj'_*(K|X_k̄)) of 3.5.17 commutes with every
   σ ∈ Aut(k̄/k), acting on Ȳ through k̄^ and on X ×_A Ā over X. Neither Hub96 nor SGA 7 states this; it follows
   from the naturality of the 3.5.13 transformation (built from the φ_Z of (1.9.5)) and of d under completed
   base-field extension.
3. `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison` (comparison). For E prime to p,

   ```text
   R⁺Γ(Ȳ, c^*K)  ≅  R⁺Γ(X_s, RΨ_η K)      I-equivariantly; no properness assumption
   ```

   with RΨ_η LPV.0's complex. Acceptance: X = S; the closed unit disc (X = A¹_A: H⁰ = Z/ℓ, Hᵠ = 0 for q ≥ 1);
   for X proper, composing with LPV.0's 2.1.8.3 gives R⁺Γ(X_η̄, K) ≅ R⁺Γ(Ȳ, c^*K), which coincides with H5's
   proper comparison (Hub96 3.7.2); for X proper of odd relative dimension n = 2m + 1 with one ordinary quadratic
   point, LPV.2's Picard–Lefschetz formula σ(a) = a + (−1)^{m+1} ε_{b(x)}(σ)(a·δ_x)δ_x holds on H^n(Ȳ, Λ).
   Tests: `formalNearbyCyclesComparison_test_point`, `formalNearbyCyclesComparison_test_closed_disc`,
   `formalNearbyCyclesComparison_test_proper`, `formalNearbyCyclesComparison_nonexample_rPhi`.
4. `ClassicalAdicEtaleCohomology:H1/change-of-trait-compatibility` (comparison). For an injective local
   homomorphism A → A' of strictly henselian DVRs, the base-change map of H1:valuation-nearby-cycles is LPV.0's
   change-of-trait morphism (SGA 7 XIII 1.3.10, 2.1.7.5), I'-equivariantly; an isomorphism for E prime to p. Tests:
   `changeOfTrait_test_tame_extension`, `changeOfTrait_test_identity`, `changeOfTrait_test_finite_all_torsion`.
5. `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles` (comparison). For K' ∈ D⁺(X_et, E), E prime
   to p, the I-equivariant distinguished triangle

   ```text
   R⁺Γ(X_s, i^*K')  --sp_an-->  R⁺Γ(Ȳ, c^*K)  -->  R⁺Γ(X_s, RΦ(K'))  -->(+1)
   ```

   where sp_an is pullback along λ followed by the transformation b^*i^* → a^*j^* of 3.5.13(i) (triangle identity
   for (j^*, R⁺j_*)). H^q(X_s, RΦ K') is the cohomology of the cone of sp_an, not H^q(Ȳ, c^*K). Tests:
   `analyticSpecializationTriangle_test_smooth_disc` (RΦ = 0, sp_an an isomorphism),
   `analyticSpecializationTriangle_test_nodal_annulus` (xy = π: Ȳ the closed annulus {|π| ≤ |x| ≤ 1},
   H¹(Ȳ, Λ) ≅ H¹(X_s, RΦ Λ) free of rank one by LPV.2 3.1.2 with n = 1),
   `analyticSpecializationTriangle_test_point`, `analyticSpecializationTriangle_nonexample_rPhi_ne_rPsi`.
6. `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology` (comparison). σ − 1 on H^n(Ȳ, c^*K) is
   Var(σ) ∘ q through H^n(X_s, RΦ K') (SGA 7 XIII 1.4.3), with the cocycle rule; I acts trivially when RΦ = 0;
   LPV.1's monodromy operator is transported, not reconstructed. Tests: `analyticVariation_test_smooth_trivial`,
   `analyticVariation_test_cocycle`.

#### Added source interfaces

These declarations retain the current eight-stage scope. General log algebra is imported from CR.5,
general category-valued descent from D0, scheme local systems from SF.2, and preadic/Berkovich geometry
from R0/R1/A1. The analytic covering category and analytic fundamental group are owned here, rather
than routed to the scheme Galois category of IG.0. A rational system can have noncompact monodromy
and no global integral lattice despite having local integral lattices.

The perfectoid comparison visibly passes through Spec(R_j^h[1/p]), while its analytic stages are
Spa(R_j[1/p],R_j). The common-ideal completed-colimit site theorem is the hypothesis allowing H0
continuity; the topological clause of a tilde-limit alone does not imply it.

For the formal BKH theorem, the special fibre has its canonical log structure. The U/V filtration
is defined from mod-p² log symbols, and its associated graded is stated in additive étale sheaves.
The strict bound 0<m<pe/(p−1) and the distinction p|m versus p∤m are essential. The cutoff includes
an integral endpoint in the étale sheaf sense. The proof imports the algebraic BKH theorem and uses
canonical completion-symbol maps to glue over an arbitrary semistable chart covering.

For the trace, A.15 compares proper-support images only for θ^* of Berkovich complexes, and A.18
identifies Berkovich sheaves with overconvergent adic sheaves. Neither is used to assert duality for
arbitrary non-overconvergent adic complexes. The relative duality exports impose properness and finite
local-coefficient hypotheses, and record their tensor/Hom and base-change coherence obligations.

### H0: source additions

#### Integral local systems on arbitrary preadic spaces

`ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems` (definition)

Fix a prime p and a preadic space X in the sense of Kedlaya–Liu §8.1. For every preadic affinoid covering U_i = Spã(A_i,A_i⁺), take descent data for finite-free ℤ_p-local systems on Spec(A_i): compatible inverse systems T_n of finite locally free ℤ/pⁿ-sheaves, with T_{n+1}/pⁿ ≅ T_n, and transition isomorphisms on affinoid coverings of U_i∩U_j satisfying the triple-overlap cocycle. The category PreadicSpace.ZpLocalSystem(X) consists of these data modulo common refinement, with morphisms descended on common refinements. It is the category of Definition 8.4.3, without a sheafiness or strong-noetherianness assumption on X. On a locally strongly sheafy analytic space it agrees with the finite-free part of H0/torsion-local-systems; a finitely generated ℤ_p-sheaf with p-torsion is not an integral lattice in this category.

Prerequisites: `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R0`, `DiamondsAndVStacks:D0`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`.

Proof outline:

1. Import the scheme integral-local-system category and its effective étale descent from SF.2.
2. Use the preadic affinoid basis and intersections supplied by R0; take descent categories and identify refinements using D0 stack descent.
3. On the sheafy subcategory use the finite-étale equivalence at every coefficient level, then retain the compatible transition maps.

API:

- `PreadicSpace.ZpLocalSystem` (structure): The refinement-invariant category described above.
- `PreadicSpace.ZpLocalSystem.ofDescent` (constructor): Integral descent data on an affinoid cover give a local system.
- `PreadicSpace.ZpLocalSystem.restrict` (functoriality): Restriction to a preadic open or an affinoid refinement preserves the inverse system and cocycle.
- `PreadicSpace.ZpLocalSystem.pullback` (functoriality): Pullback along a preadic morphism, with canonical identity and composition isomorphisms.
- `PreadicSpace.ZpLocalSystem.modPow` (projection): T ↦ T_n is finite locally free over ℤ/pⁿ and T_{n+1}/pⁿ ≅ T_n.
- `PreadicSpace.ZpLocalSystem.equivLisse` (compatibility): On strongly sheafy analytic X, equivalence with finite-free lisse ℤ_p-systems in H0.

Unit tests:

- `preadicZp_constant` (computation): The trivial system of rank r has T_n = (ℤ/pⁿ)^r on every affinoid and identity overlap maps.
- `preadicZp_empty` (degenerate): On the empty preadic space the category has one object and one morphism.
- `preadicZp_lisse` (compatibility): The mod-pⁿ projection on a strongly sheafy analytic X agrees with the corresponding H0 finite-free lisse sheaf.
- `preadicZp_torsion` (non-example): The constant ℤ/p-system is not a rank-one ℤ_p-local system: its next level does not give a free ℤ/p²-lattice.

Uses: Kedlaya–Liu §8.4; PadicHodgeTheory:P8:local-rational: Rational local systems and integral lattices are the input to period-sheaf coefficients, before any period comparison..

Acceptance: Fix a prime p and a preadic space X in the sense of Kedlaya–Liu §8.1. For every preadic affinoid covering U_i = Spã(A_i,A_i⁺), take descent data for finite-free ℤ_p-local systems on Spec(A_i): compatible inverse systems T_n of finite locally free ℤ/pⁿ-sheaves, with T_{n+1}/pⁿ ≅ T_n, and transition isomorphisms on affinoid coverings of U_i∩U_j satisfying the triple-overlap cocycle. The category PreadicSpace.ZpLocalSystem(X) consists of these data modulo common refinement, with morphisms descended on common refinements. It is the category of Definition 8.4.3, without a sheafiness or strong-noetherianness assumption on X. On a locally strongly sheafy analytic space it agrees with the finite-free part of H0/torsion-local-systems; a finitely generated ℤ_p-sheaf with p-torsion is not an integral lattice in this category.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Definition 8.4.3, pp. 167–168; Definition 1.4.1, p. 20.

#### The isogeny category of integral local systems

`ClassicalAdicEtaleCohomology:H0/preadic-isogeny-local-systems` (construction)

For a prime p and preadic X, PreadicSpace.IsogenyZpLocalSystem(X) has the same objects as ZpLocalSystem(X) and Hom(T,T′) = Hom_Zp(T,T′) ⊗_ℤp ℚ_p, with bilinear composition, identity 1⊗id, tensor products and internal Hom induced from integral systems. This is rationalization of a category; it is not its stackification. A rational transition isomorphism and its inverse become integral after multiplication by some powers of p on every quasi-compact overlap where the underlying Hom has descended. The subsequent QpLocalSystem category is obtained by descent, and need not have a global integral lattice.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Rationalize integral morphism modules and their bilinear composition.
2. Use the scheme isogeny category of KL §1.4 on every affinoid and transport its pullbacks.
3. Retain the fully faithful embedding in its stackification rather than asserting effective descent for all covers.

API:

- `PreadicSpace.IsogenyZpLocalSystem` (structure): Integral objects with ℚ_p-rationalized morphisms.
- `PreadicSpace.IsogenyZpLocalSystem.rationalize` (constructor): The tensor functor T ↦ T⊗ℚ_p.
- `PreadicSpace.IsogenyZpLocalSystem.hom` (data): Hom is the scalar extension of the integral Hom module, with bilinear composition.
- `PreadicSpace.IsogenyZpLocalSystem.pullback` (functoriality): Rationalization commutes with preadic pullback.
- `PreadicSpace.IsogenyZpLocalSystem.toQp` (compatibility): The canonical fully faithful functor to QpLocalSystem(X).

Unit tests:

- `isogenyZp_rankOne` (computation): The endomorphisms of the trivial rank-one system on a connected geometric point are ℚ_p.
- `isogenyZp_mulP` (characterisation): Multiplication by p becomes invertible, with inverse p⁻¹, although it is not an integral isomorphism.
- `isogenyZp_zero` (degenerate): The zero system remains zero after rationalization.
- `isogenyZp_notStackification` (non-example): A rational local system with noncompact monodromy on a Tate curve is outside the image of global integral rationalization.

Uses: Kedlaya–Liu §8.4; PadicHodgeTheory:P8:local-rational: Rational local systems and integral lattices are the input to period-sheaf coefficients, before any period comparison..

Acceptance: For a prime p and preadic X, PreadicSpace.IsogenyZpLocalSystem(X) has the same objects as ZpLocalSystem(X) and Hom(T,T′) = Hom_Zp(T,T′) ⊗_ℤp ℚ_p, with bilinear composition, identity 1⊗id, tensor products and internal Hom induced from integral systems. This is rationalization of a category; it is not its stackification. A rational transition isomorphism and its inverse become integral after multiplication by some powers of p on every quasi-compact overlap where the underlying Hom has descended. The subsequent QpLocalSystem category is obtained by descent, and need not have a global integral lattice.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §4, p. 103, paragraph before Definition 4.1.

#### Rational local systems by affinoid descent

`ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems` (definition); planet **Rational local systems**

For a prime p and arbitrary preadic X, PreadicSpace.QpLocalSystem(X) is the category of descent data for scheme étale ℚ_p-local systems V_i on Spec(A_i), over preadic affinoid coverings Spã(A_i,A_i⁺), with restriction isomorphisms on affinoid coverings of intersections, cocycle on triple intersections, and identification under common refinements. Scheme ℚ_p-local systems here mean the étale stackification of the isogeny ℤ_p-local-system category, not arbitrary sheaves of discrete ℚ_p-vector spaces. Tensor product, dual, internal Hom and pullback are obtained by descent. Definition 8.4.3 applies to non-sheafy preadic spaces; comparison with sheaves on A1 sites is restricted to genuine strongly sheafy adic spaces. On affinoid spaces over an analytic field, compare with de Jong’s rational local systems through H0/analytic-rational-representation-equivalence.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-isogeny-local-systems`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R0`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Import scheme ℚ_p-local systems as an étale stack, including refinement equivalences, from SF.2.
2. Apply KL Definition 8.4.3 to the affinoid basis of a preadic space.
3. Glue morphisms and tensor structures on common refinements; the restriction functors inherit identity and composition coherence.

API:

- `PreadicSpace.QpLocalSystem` (structure): The category of rational local systems by affinoid descent.
- `PreadicSpace.QpLocalSystem.ofDescent` (constructor): Objects and cocycles on an affinoid cover define a rational local system.
- `PreadicSpace.QpLocalSystem.refine` (equivalence): Common refinement induces an equivalence of the descent presentations.
- `PreadicSpace.QpLocalSystem.pullback` (functoriality): Pullback preserves tensor products and duals, with coherent identity and composition maps.
- `PreadicSpace.QpLocalSystem.rank` (projection): The finite rank is locally constant, determined by the affinoid scheme local systems.
- `PreadicSpace.QpLocalSystem.rationalize` (constructor): An integral local system gives a rational local system by scalar extension.
- `PreadicSpace.QpLocalSystem.homDescent` (extensionality): Morphisms are equal if their restrictions agree on a covering.

Unit tests:

- `preadicQp_field` (compatibility): On Spã(K,K⁺) for a complete field, the category agrees with continuous finite-dimensional ℚ_p-representations of Gal(K^sep/K).
- `preadicQp_zero` (degenerate): Rank zero is the zero object, preserved by every pullback.
- `preadicQp_refinement` (characterisation): Refining every affinoid of a trivial rank-one descent datum gives an isomorphic object with identity transitions.
- `preadicQp_noncompact` (non-example): The rank-one rational local system on a Tate curve with generator acting by p has no global integral lattice.

Uses: Kedlaya–Liu §8.4; PadicHodgeTheory:P8:local-rational: Rational local systems and integral lattices are the input to period-sheaf coefficients, before any period comparison..

Acceptance: For a prime p and arbitrary preadic X, PreadicSpace.QpLocalSystem(X) is the category of descent data for scheme étale ℚ_p-local systems V_i on Spec(A_i), over preadic affinoid coverings Spã(A_i,A_i⁺), with restriction isomorphisms on affinoid coverings of intersections, cocycle on triple intersections, and identification under common refinements. Scheme ℚ_p-local systems here mean the étale stackification of the isogeny ℤ_p-local-system category, not arbitrary sheaves of discrete ℚ_p-vector spaces. Tensor product, dual, internal Hom and pullback are obtained by descent. Definition 8.4.3 applies to non-sheafy preadic spaces; comparison with sheaves on A1 sites is restricted to genuine strongly sheafy adic spaces. On affinoid spaces over an analytic field, compare with de Jong’s rational local systems through H0/analytic-rational-representation-equivalence.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Definition 8.4.3, p. 168.

#### A finite étale factor near an analytic point

`ClassicalAdicEtaleCohomology:H0/etale-cover-finite-factor-near-analytic-point` (lemma)

Let (A,A⁺) be an adic Banach ring and Spec(A′)→Spec(A) a surjective étale morphism. For every α∈M(A) there is a rational localization (A,A⁺)→(B,B⁺) encircling α for which A′⊗_A B decomposes as a finite product of rings, with at least one factor faithfully finite étale over B. Encircling is the neighborhood notion of KL §2.4; replacing it by an arbitrary rational subset containing α loses the neighborhood assertion. The algebra A′⊗_A B is the algebraic base change of the scheme cover, not an unspecified completion.

Prerequisites: `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R0`, `AdicEtaleGeometry:A1`.

Proof outline:

1. Choose a prime of A′ over the support prime of α and extend the norm to its residue field.
2. Apply the local Jacobian criterion and KL 2.4.17 to obtain a rational neighborhood on which the étale component has an invertible Jacobian.
3. Separate the component and use the point lying above α to retain a faithfully finite étale factor, as in KL 8.4.1.

Acceptance: For a faithfully finite étale A′/A, choose the identity localization and the whole A′ as the factor. A non-surjective open immersion need not supply a faithful factor near a point outside its image.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Lemma 8.4.1 and proof, p. 167.

#### A scheme rational local system acquires a local lattice

`ClassicalAdicEtaleCohomology:H0/scheme-rational-local-lattice` (lemma)

Let (A,A⁺) be an adic Banach ring, V a scheme étale ℚ_p-local system on Spec(A), and α∈M(A). There is a rational localization (A,A⁺)→(B,B⁺) encircling α such that V|_Spec(B) is isomorphic to T⊗ℚ_p for an integral ℤ_p-local system T on Spec(B).

Prerequisites: `ClassicalAdicEtaleCohomology:H0/etale-cover-finite-factor-near-analytic-point`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H0/preadic-isogeny-local-systems`.

Proof outline:

1. Present V étale-locally by isogeny integral systems using scheme stackification.
2. Apply the finite-factor lemma near α.
3. Apply effective descent of isogeny local systems along a faithfully finite étale ring map (KL Lemma 1.4.8), imported from SF.2.

Acceptance: Let (A,A⁺) be an adic Banach ring, V a scheme étale ℚ_p-local system on Spec(A), and α∈M(A). There is a rational localization (A,A⁺)→(B,B⁺) encircling α such that V|_Spec(B) is isomorphic to T⊗ℚ_p for an integral ℤ_p-local system T on Spec(B).

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Lemma 8.4.2 and proof, p. 167.

#### Adic and étale presentations of preadic local systems

`ClassicalAdicEtaleCohomology:H0/preadic-local-system-etale-descent` (comparison)

The integral and rational local-system categories of KL Definition 8.4.3 are unchanged if preadic étale covering families replace the adic open covering families in the descent presentation. The comparison functors preserve pullback, rank, tensor product and dual; on strongly sheafy spaces they agree with the corresponding local-system categories on A1’s ordinary étale site. The assertion extends the local-system categories, not every torsion cohomology theorem of H0, to arbitrary preadic spaces.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems`, `ClassicalAdicEtaleCohomology:H0/etale-cover-finite-factor-near-analytic-point`, `AdicEtaleGeometry:A1`, `SchemeAndStackFoundations:SF.2`.

Proof outline:

1. Use local factorization of preadic étale maps into a rational localization and a finite étale map, supplied by A1.
2. Descend integral systems along finite étale maps and rational systems along their stack descent.
3. Compare on common refinements to construct inverse equivalences, as KL Remark 8.4.4.

Acceptance: The integral and rational local-system categories of KL Definition 8.4.3 are unchanged if preadic étale covering families replace the adic open covering families in the descent presentation. The comparison functors preserve pullback, rank, tensor product and dual; on strongly sheafy spaces they agree with the corresponding local-system categories on A1’s ordinary étale site. The assertion extends the local-system categories, not every torsion cohomology theorem of H0, to arbitrary preadic spaces.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Remark 8.4.4, p. 168.

#### Bounded lattices in an integral local system

`ClassicalAdicEtaleCohomology:H0/bounded-lattices-in-preadic-local-systems` (construction)

For an integral ℤ_p-local system T on a preadic X and m≥0, define L_m(T)(Y) to be isomorphism classes of pairs (T′,ι), with T′ integral on Y and ι:T_Y⊗ℚ_p ≅ T′⊗ℚ_p satisfying p^mι∈Hom(T_Y,T′) and p^mι⁻¹∈Hom(T′,T_Y). It is represented by a finite étale preadic X-space. At a geometric point it is the finite set of lattices between p^m T_x and p^(−m)T_x; the two inequalities are both required. It has an inclusion relation represented by a finite étale subspace of L_m(T)×_X L_m(T) and a canonical operation taking the sum of finitely many bounded lattices. These are the analytic transports of KL Remark 1.4.7, used in Proposition 8.4.6.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-isogeny-local-systems`, `SchemeAndStackFoundations:SF.2`, `AdicEtaleGeometry:A1`, `mathlib:Submodule`, `mathlib:Padic`, `mathlib:PadicInt`.

Proof outline:

1. Import the finite étale bounded-lattice scheme L_m(T), its inclusion relation and finite sums from SF.2 (KL Remark 1.4.7).
2. Apply the finite-étale algebra/space correspondence of A1 on each affinoid.
3. Glue along overlaps; base change of the finite mod-p-power lattice data gives representability without a sheafiness assumption on X.

API:

- `PreadicSpace.BoundedLattice` (structure): The moduli functor with bounds on ι and ι⁻¹.
- `PreadicSpace.BoundedLattice.finiteEtale` (structure): L_m(T) is finite étale over X.
- `PreadicSpace.BoundedLattice.pullback` (functoriality): L_m(T_Y) ≅ L_m(T)×_X Y.
- `PreadicSpace.BoundedLattice.inclusion` (relation): The finite étale relation detects whether the rationally identified lattices are included.
- `PreadicSpace.BoundedLattice.sup` (constructor): Finite lattice sums are canonical and compatible with base change.
- `PreadicSpace.BoundedLattice.FiberCore` (structure): For submodules T,T′ of a ℚ_p-vector space with compatible ℤ_p scalar restriction, the geometric-fibre core is the conjunction p^mT⊆T′ and p^mT′⊆T. It records both bounds, without asserting finite freeness or representability.
- `PreadicSpace.BoundedLattice.FiberCore.zero_iff` (characterisation): At m=0 the two-sided bound is equivalent to T=T′.
- `PreadicSpace.BoundedLattice.FiberCore.refl` (constructor): Every submodule is two-sided bounded relative to itself at every nonnegative m.
- `PreadicSpace.BoundedLattice.FiberCore.symm` (relation): The two-sided bound is symmetric in T,T′.
- `PreadicSpace.BoundedLattice.FiberCore.trans` (relation): Bounds m and n compose to a bound m+n.
- `PreadicSpace.BoundedLattice.FiberCore.mono` (relation): Increasing m preserves the two-sided bound.

Unit tests:

- `boundedLattice_zeroBound` (computation): L_0(T) has one point on each geometric fibre: the original lattice.
- `boundedLattice_zeroRank` (degenerate): For T=0, L_m(T) is the terminal X-space for every m.
- `boundedLattice_rankOne` (computation): For trivial rank one over a geometric point, L_m has 2m+1 points, the lattices p^aℤ_p with −m≤a≤m.
- `boundedLattice_oneSided` (non-example): The condition p^mι integral alone admits arbitrarily large lattices; it does not define the finite L_m.
- `boundedLatticeCore_zero` (computation): At bound zero the two-sided core identifies T and T′.
- `boundedLatticeCore_zeroRank` (degenerate): The zero submodule is two-sided bounded with itself at every m.
- `boundedLatticeCore_composition` (compatibility): Two successive bounds add, so a bound m and a bound n give m+n.

Uses: Kedlaya–Liu §8.4; PadicHodgeTheory:P8:local-rational: Rational local systems and integral lattices are the input to period-sheaf coefficients, before any period comparison..

Acceptance: For an integral ℤ_p-local system T on a preadic X and m≥0, define L_m(T)(Y) to be isomorphism classes of pairs (T′,ι), with T′ integral on Y and ι:T_Y⊗ℚ_p ≅ T′⊗ℚ_p satisfying p^mι∈Hom(T_Y,T′) and p^mι⁻¹∈Hom(T′,T_Y). It is represented by a finite étale preadic X-space. At a geometric point it is the finite set of lattices between p^m T_x and p^(−m)T_x; the two inequalities are both required. It has an inclusion relation represented by a finite étale subspace of L_m(T)×_X L_m(T) and a canonical operation taking the sum of finitely many bounded lattices. These are the analytic transports of KL Remark 1.4.7, used in Proposition 8.4.6.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Proof of Proposition 8.4.6, p. 168; Remark 1.4.7, pp. 21–22.

#### Local integral lattices for preadic rational systems

`ClassicalAdicEtaleCohomology:H0/preadic-rational-local-lattice` (theorem)

For an adic Banach ring (A,A⁺), a rational local system V on Spã(A,A⁺), and α∈M(A), there is a rational localization (A,A⁺)→(B,B⁺) encircling α such that V|_Spã(B,B⁺) is an isogeny ℤ_p-local system. No global lattice and no strong-sheafiness assumption is asserted.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems`, `ClassicalAdicEtaleCohomology:H0/bounded-lattices-in-preadic-local-systems`, `ClassicalAdicEtaleCohomology:H0/scheme-rational-local-lattice`, `ClassicalAdicEtaleCohomology:H0/etale-cover-finite-factor-near-analytic-point`, `SchemeAndStackFoundations:SF.2`, `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H0/analytic-bounded-lattice-finite-quotient`.

Proof outline:

1. Represent bounded changes of lattice by L_m(T) using the previous construction and KL 8.2.17(a).
2. Use henselian finite étale approximation (KL 1.2.8 and 2.4.17) to find a rational neighborhood and faithfully finite étale cover carrying a lattice with descent datum.
3. Use KL 1.4.8 to descend the lattice up to isogeny.

Acceptance: A constant ℚ_p-system has its constant integral lattice on the identity neighborhood. A noncompact global monodromy example still has local lattices.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Proposition 8.4.6 and proof, p. 168.

#### Rational descent by isogeny lattices on a strong cover

`ClassicalAdicEtaleCohomology:H0/preadic-rational-isogeny-descent` (theorem)

Every rational local system on Spã(A,A⁺), for an adic Banach ring (A,A⁺), admits a descent presentation by isogeny ℤ_p-local systems on a strong rational covering family. Strong has KL’s affinoid meaning: the rational subsets encircle and cover M(A), with the corresponding preadic covering. Compactness yields a finite such family. Transition maps are rational isomorphisms satisfying the cocycle; they are not required to preserve the chosen integral lattices.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-lattice`, `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-isogeny-local-systems`, `AdicSpacesPartII:R0`.

Proof outline:

1. Choose the neighborhoods of Proposition 8.4.6 for all points of M(A).
2. Take a finite strong covering by compactness.
3. Restrict V’s descent isomorphisms to intersections; the cocycle is inherited.

Acceptance: Every rational local system on Spã(A,A⁺), for an adic Banach ring (A,A⁺), admits a descent presentation by isogeny ℤ_p-local systems on a strong rational covering family. Strong has KL’s affinoid meaning: the rational subsets encircle and cover M(A), with the corresponding preadic covering. Compactness yields a finite such family. Transition maps are rational isomorphisms satisfying the cocycle; they are not required to preserve the chosen integral lattices.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Corollary 8.4.7 and proof, p. 168.

#### Integral local systems agree on Spec and preadic Spa

`ClassicalAdicEtaleCohomology:H0/integral-spec-preadic-equivalence` (comparison)

For every adic Banach ring (A,A⁺), the natural tensor functor ℤ_p-Loc(Spec A)→ZpLocalSystem(Spã(A,A⁺)) is an equivalence, and induces an equivalence on the isogeny categories. Its mod-pⁿ functors are the finite-étale algebra/space comparisons of A1. This does not assert an equivalence of the full étale topoi or an equivalence of their rational stackifications.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-isogeny-local-systems`, `SchemeAndStackFoundations:SF.2`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R0`.

Proof outline:

1. Integral local systems are determined by compatible finite étale covers at every coefficient level (KL Remark 1.4.3).
2. Apply effective rational-localization descent of finite étale algebras (KL Theorem 2.6.9), requested from R0/A1.
3. Glue the compatible coefficient transitions, then rationalize morphisms.

Acceptance: For every adic Banach ring (A,A⁺), the natural tensor functor ℤ_p-Loc(Spec A)→ZpLocalSystem(Spã(A,A⁺)) is an equivalence, and induces an equivalence on the isogeny categories. Its mod-pⁿ functors are the finite-étale algebra/space comparisons of A1. This does not assert an equivalence of the full étale topoi or an equivalence of their rational stackifications.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Remark 8.4.5, p. 168.

#### Rational Spec–Spa comparison is fully faithful

`ClassicalAdicEtaleCohomology:H0/rational-spec-preadic-full-faithfulness` (comparison)

For an adic Banach ring (A,A⁺), the natural tensor functor ℚ_p-Loc(Spec A)→QpLocalSystem(Spã(A,A⁺)) is fully faithful. It need not be essentially surjective, even for reduced affinoid algebras over an analytic field. When A is normal noetherian, source objects admit a global ℤ_p-lattice, whereas the analytic category can contain continuous representations of de Jong’s non-profinite analytic fundamental group with noncompact image. The latter are outside the source image.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-rational-isogeny-descent`, `ClassicalAdicEtaleCohomology:H0/integral-spec-preadic-equivalence`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H0/analytic-rational-representation-equivalence`.

Proof outline:

1. Use local isogeny lattice presentations on a finite strong rational cover.
2. Descend rational Hom by integral descent after multiplying by one common p-power.
3. For failure of essential surjectivity combine the normal-noetherian scheme global-lattice criterion with de Jong’s analytic representation description, as KL Remark 8.4.8.

Acceptance: For an adic Banach ring (A,A⁺), the natural tensor functor ℚ_p-Loc(Spec A)→QpLocalSystem(Spã(A,A⁺)) is fully faithful. It need not be essentially surjective, even for reduced affinoid algebras over an analytic field. When A is normal noetherian, source objects admit a global ℤ_p-lattice, whereas the analytic category can contain continuous representations of de Jong’s non-profinite analytic fundamental group with noncompact image. The latter are outside the source image.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Remark 8.4.8, pp. 168–169.

#### Extensions of scheme isogeny systems descend from Spa

`ClassicalAdicEtaleCohomology:H0/rational-extensions-descend-to-spec` (theorem)

Let (A,A⁺) be an adic Banach ring and V_i=T_i⊗ℚ_p, i=1,2, isogeny integral local systems on Spec A. Every short exact sequence 0→V_1→V→V_2→0 in QpLocalSystem(Spã(A,A⁺)) is the pullback of an extension of isogeny ℤ_p-local systems on Spec A. This extension closure does not imply that every analytic rational local system has a global lattice.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-rational-isogeny-descent`, `ClassicalAdicEtaleCohomology:H0/integral-spec-preadic-equivalence`, `ClassicalAdicEtaleCohomology:H0/rational-spec-preadic-full-faithfulness`, `SchemeAndStackFoundations:SF.2`.

Proof outline:

1. On a finite strong rational cover, write the extension classes in Ext(T_2,T_1)⊗ℚ_p.
2. Rescale T_1 by a common power of p to make the classes integral and then to kill their overlap differences over B_i⊗̂_A B_j.
3. Glue integral extensions on Spa and apply the integral Spec–Spa equivalence (KL Remark 8.4.9).

Acceptance: Let (A,A⁺) be an adic Banach ring and V_i=T_i⊗ℚ_p, i=1,2, isogeny integral local systems on Spec A. Every short exact sequence 0→V_1→V→V_2→0 in QpLocalSystem(Spã(A,A⁺)) is the pullback of an extension of isogeny ℤ_p-local systems on Spec A. This extension closure does not imply that every analytic rational local system has a global lattice.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Remark 8.4.9 and proof, p. 169.

#### De Jong étale covering spaces

`ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces` (definition)

For a k-analytic Berkovich space X, an analytic étale covering map f:Y→X means that every x∈X has an ordinary open neighborhood U such that f⁻¹(U) is a disjoint union of spaces finite étale over U. A topological covering is the case where these finite étale pieces are isomorphisms. Cov_X is the category of these maps over X, including the empty map; it is not the category of all étale maps and is not silently enlarged to arbitrary disjoint unions. On Hausdorff strictly k-analytic spaces, transport this definition to the corresponding taut adic spaces via R1’s equivalence. For rigid affinoids use wide affinoid neighborhoods encircling analytic points, as de Jong §5.

Prerequisites: `AdicSpacesPartII:R1`, `AdicEtaleGeometry:A1`, `SchemeAndStackFoundations:SF.2`.

Proof outline:

1. Use R1’s Berkovich carrier and finite-étale comparison.
2. Define the local finite-étale condition on ordinary open neighborhoods.
3. Transport the rigid version along the equivalence, retaining its neighborhood qualification.

API:

- `AdicSpace.AnalyticEtaleCover` (structure): The local disjoint-finite-étale condition and its category.
- `AdicSpace.AnalyticEtaleCover.ofFiniteEtale` (constructor): Every finite étale map is an analytic covering.
- `AdicSpace.AnalyticEtaleCover.ofTopological` (constructor): A topological covering with its canonical analytic structure is an analytic covering.
- `AdicSpace.AnalyticEtaleCover.pullback` (functoriality): Coverings are stable under arbitrary analytic base change.
- `AdicSpace.AnalyticEtaleCover.finiteCoproduct` (structure): Finite coproducts, including the empty covering, stay in Cov_X.
- `AdicSpace.AnalyticEtaleCover.berkovichEquiv` (compatibility): Agreement with de Jong Definition 2.1 on Hausdorff strictly analytic spaces.

Unit tests:

- `analyticCover_identity` (degenerate): The identity and empty map are covering spaces.
- `analyticCover_finite` (compatibility): A finite étale covering has the same fibres as A1’s finite étale space.
- `analyticCover_open` (non-example): The open immersion of a nonempty proper open subset of connected X is not an analytic covering: its image is not a union of connected components.

Uses: de Jong Theorems 2.10 and 4.2; KL Definition 8.4.3 and Remark 8.4.8: The covering category defines the analytic fibre functor and allows noncompact rational monodromy..

Acceptance: For a k-analytic Berkovich space X, an analytic étale covering map f:Y→X means that every x∈X has an ordinary open neighborhood U such that f⁻¹(U) is a disjoint union of spaces finite étale over U. A topological covering is the case where these finite étale pieces are isomorphisms. Cov_X is the category of these maps over X, including the empty map; it is not the category of all étale maps and is not silently enlarged to arbitrary disjoint unions. On Hausdorff strictly k-analytic spaces, transport this definition to the corresponding taut adic spaces via R1’s equivalence. For rigid affinoids use wide affinoid neighborhoods encircling analytic points, as de Jong §5.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Definition 2.1, p. 91; §5, p. 106.

#### Étale descent and quotients for analytic coverings

`ClassicalAdicEtaleCohomology:H0/analytic-covering-descent-and-quotients` (theorem)

A sheaf of sets on X_ét is representable by a de Jong covering iff it is so after an étale covering of X. If Y→X is such a covering and R⊆Y×_X Y is an equivalence relation that is a union of connected components, then the quotient étale sheaf Y/R is representable by a de Jong covering. Coverings are separated and stable under base change; their images are unions of connected components. The quotient assertion retains the connected-component condition on R.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-separatedness`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-base-change`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-image-components`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-effective-etale-descent`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-componentwise-quotient`.

Proof outline:

1. Étale-locally reduce to a finite Galois covering of a neighborhood.
2. A finite group preserves finite unions of the covering components, so scheme finite-étale descent constructs the local quotients.
3. Glue the local representing spaces; use the same local finite-étale reduction for R, as de Jong Lemmas 2.2–2.4.

Acceptance: A sheaf of sets on X_ét is representable by a de Jong covering iff it is so after an étale covering of X. If Y→X is such a covering and R⊆Y×_X Y is an equivalence relation that is a union of connected components, then the quotient étale sheaf Y/R is representable by a de Jong covering. Coverings are separated and stable under base change; their images are unions of connected components. The quotient assertion retains the connected-component condition on R.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Lemmas 2.2–2.4 with proofs, pp. 92–93.

#### The fibre functor on analytic coverings

`ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-functor` (construction)

For a geometric point x:M(K)→X with K algebraically closed complete, define F_x:Cov_X→Set by F_x(Y)=Y×_X M(K), viewed as its discrete set of K-points. Morphisms act by the induced maps on fibres. The functor preserves finite fibre products and existing disjoint unions. Its restrictions to finite étale and topological coverings define the algebraic and topological fibre functors. The same fibre functor on the corresponding taut adic space uses Spa(K,O_K); it agrees with A1’s geometric stalk on a represented covering.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R1`.

Proof outline:

1. Use the splitting of finite étale spaces over an algebraically closed field on each local component.
2. Take the resulting discrete fibre and induced maps.
3. Identify the represented sheaf stalk with this fibre through A1 and R1.

API:

- `AdicSpace.AnalyticCoverFiber` (constructor): The fibre functor F_x on Cov_X.
- `AdicSpace.AnalyticCoverFiber.map` (functoriality): Maps of coverings induce fibre maps respecting identity and composition.
- `AdicSpace.AnalyticCoverFiber.pullback` (compatibility): A pointed analytic map identifies the fibre of a pulled-back covering.
- `AdicSpace.AnalyticCoverFiber.stalk` (equivalence): F_x(Y) is the A1 geometric stalk of the represented covering sheaf.

Unit tests:

- `analyticFiber_identity` (computation): The identity covering has a singleton fibre.
- `analyticFiber_empty` (degenerate): The empty covering has the empty fibre.
- `analyticFiber_field` (compatibility): For X=M(k) and Y=M(L), L/k finite separable, the fibre is Hom_k(L,K).

Uses: de Jong §2, definition of π₁ and Theorems 2.9–2.10: Automorphisms and paths of this fibre functor give analytic monodromy..

Acceptance: For a geometric point x:M(K)→X with K algebraically closed complete, define F_x:Cov_X→Set by F_x(Y)=Y×_X M(K), viewed as its discrete set of K-points. Morphisms act by the induced maps on fibres. The functor preserves finite fibre products and existing disjoint unions. Its restrictions to finite étale and topological coverings define the algebraic and topological fibre functors. The same fibre functor on the corresponding taut adic space uses Spa(K,O_K); it agrees with A1’s geometric stalk on a represented covering.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, pp. 93–94, definition of F_x.

#### De Jong analytic étale fundamental group

`ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group` (definition); planet **Analytic fundamental group**

For a connected k-analytic space X with geometric point x, define π₁^an(X,x)=Aut(F_x), where F_x is the fibre functor on de Jong covering spaces. Give it the topology whose identity neighborhoods are stabilizers H(Y,y) of y∈F_x(Y), Y∈Cov_X; finite intersections and conjugates again occur. This topological group need not be profinite. Restriction to finite étale coverings gives a continuous map to the profinite algebraic fundamental group π₁^alg; restriction to topological coverings gives the topological covering group. On taut strictly analytic adic spaces this is the transported analytic group. Scheme IG.0 is not a supplier for this definition.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-functor`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-descent-and-quotients`, `AdicSpacesPartII:R1`.

Proof outline:

1. Define automorphisms of the fibre functor and point stabilizers.
2. Finite fibre products and the identity γH(Y,y)γ⁻¹=H(Y,γy) give a subgroup neighborhood basis.
3. Use restriction of natural automorphisms for the algebraic and topological comparison maps.

API:

- `AdicSpace.AnalyticEtaleFundamentalGroup` (structure): Aut(F_x) with the stabilizer topology.
- `AdicSpace.AnalyticEtaleFundamentalGroup.action` (data): The continuous action on every discrete covering fibre.
- `AdicSpace.AnalyticEtaleFundamentalGroup.stabilizerBasis` (characterisation): H(Y,y) is a neighborhood basis at the identity.
- `AdicSpace.AnalyticEtaleFundamentalGroup.map` (functoriality): Pointed analytic maps give continuous homomorphisms with identity and composition laws.
- `AdicSpace.AnalyticEtaleFundamentalGroup.toAlgebraic` (compatibility): Restriction to finite coverings is the algebraic profinite comparison.
- `AdicSpace.AnalyticEtaleFundamentalGroup.toTopological` (compatibility): Restriction to topological coverings is the topological comparison.

Unit tests:

- `analyticPi_field` (compatibility): For X=M(k), π₁^an is Gal(k^sep/k) with its profinite topology.
- `analyticPi_geometricPoint` (degenerate): For X=M(C), C algebraically closed, π₁^an is trivial.
- `analyticPi_nonProfinite` (non-example): For a Tate elliptic curve the topological quotient is ℤ; π₁^an cannot be replaced by its profinite finite-cover quotient.

Uses: KL Remark 8.4.8; de Jong Theorem 4.2: Continuous finite-dimensional ℚ_p-representations need not have compact image..

Acceptance: For a connected k-analytic space X with geometric point x, define π₁^an(X,x)=Aut(F_x), where F_x is the fibre functor on de Jong covering spaces. Give it the topology whose identity neighborhoods are stabilizers H(Y,y) of y∈F_x(Y), Y∈Cov_X; finite intersections and conjugates again occur. This topological group need not be profinite. Restriction to finite étale coverings gives a continuous map to the profinite algebraic fundamental group π₁^alg; restriction to topological coverings gives the topological covering group. On taut strictly analytic adic spaces this is the transported analytic group. Scheme IG.0 is not a supplier for this definition.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, definition of π₁ and topology, p. 94.

#### Prodiscreteness of the analytic fundamental group

`ClassicalAdicEtaleCohomology:H0/analytic-fundamental-group-prodiscreteness` (theorem)

For π=π₁^an(X,x), the natural map π→lim_H π/H, over the point-stabilizer neighborhood system with quotient maps, is a homeomorphism of spaces. Thus π is Hausdorff and prodiscrete in de Jong’s sense. The stabilizers need not be normal and this formula is not a presentation as an inverse limit of finite groups.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-functor`, `mathlib:TopCat.limitCone`.

Proof outline:

1. A compatible system of cosets acts consistently on each covering fibre.
2. The resulting permutations commute with all covering morphisms and hence define an element of Aut(F_x).
3. Stabilizer neighborhoods identify the topology (de Jong Lemma 2.7).

Acceptance: For π=π₁^an(X,x), the natural map π→lim_H π/H, over the point-stabilizer neighborhood system with quotient maps, is a homeomorphism of spaces. Thus π is Hausdorff and prodiscrete in de Jong’s sense. The stabilizers need not be normal and this formula is not a presentation as an inverse limit of finite groups.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Lemma 2.7 and proof, p. 94.

#### Paths between analytic fibre functors

`ClassicalAdicEtaleCohomology:H0/analytic-covering-paths` (theorem)

For a connected k-analytic Berkovich X and any geometric points x,x′, there exists a natural isomorphism F_x≅F_x′ on de Jong covering spaces. A choice induces a continuous isomorphism of analytic fundamental groups, unique up to inner conjugation; no canonical path is asserted.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-functor`, `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-descent-and-quotients`, `AdicSpacesPartII:R1`.

Proof outline:

1. Reduce to connected affinoid neighborhoods and use arcwise connectedness supplied by R1’s Berkovich geometry.
2. For each finite open covering along an arc, compose paths in finite étale Galois categories on successive overlaps.
3. The possible compositions form nonempty compact sets compatible under refinement; their inverse limit supplies the natural isomorphism (de Jong Theorem 2.9).

Acceptance: For a connected k-analytic Berkovich X and any geometric points x,x′, there exists a natural isomorphism F_x≅F_x′ on de Jong covering spaces. A choice induces a continuous isomorphism of analytic fundamental groups, unique up to inner conjugation; no canonical path is asserted.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Theorem 2.9, p. 95; proof pp. 97–98.

#### Duality for analytic coverings and continuous actions

`ClassicalAdicEtaleCohomology:H0/analytic-covering-duality` (theorem)

For connected X with geometric point x, F_x:Cov_X→π₁^an(X,x)-Set is fully faithful and every transitive continuous discrete action occurs. The category of arbitrary disjoint unions of objects of Cov_X is equivalent to all continuous discrete π₁^an-sets. The original Cov_X itself is not asserted equivalent to all such sets: arbitrary disjoint unions need not satisfy the uniform local covering condition. Restriction to finite étale covers is an equivalence with finite continuous π₁^alg-sets.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-paths`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-descent-and-quotients`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-equivariant-morphisms`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-open-stabilizer-realization`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-disjoint-union-enlargement`.

Proof outline:

1. Paths identify connected components of a covering with group orbits on its fibre.
2. Morphisms are recovered from componentwise graphs in fibre products, giving full faithfulness.
3. For an open stabilizer construct the desired transitive orbit by quotienting a covering by a union of components, then take formal disjoint unions (de Jong Theorem 2.10(i)).

Acceptance: The regular action of the discrete deck group of a connected topological Galois cover recovers that cover. Finite covering fibres agree with the ordinary finite-étale Galois category.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Theorem 2.10(i) and proof, pp. 95–96.

#### The algebraic profinite quotient of analytic monodromy

`ClassicalAdicEtaleCohomology:H0/analytic-fundamental-group-profinite-quotient` (theorem)

The algebraic group π₁^alg(X,x) is profinite. Every continuous homomorphism π₁^an(X,x)→G to a profinite group factors uniquely through π₁^alg(X,x), and the canonical maps to π₁^alg and π₁^top have dense image. Surjectivity to π₁^alg is not asserted in general. A continuous representation on a finite-free ℤ_p-module factors through this quotient, since GL_r(ℤ_p) is profinite; a representation on ℚ_p may have noncompact image and need not do so.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-duality`, `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisDuality:R02.1`.

Proof outline:

1. Use finite covering duality for each finite quotient of G and pass to the profinite limit.
2. The fully faithful inclusions of finite and topological covering categories give density (de Jong Theorem 2.10(iii)–(iv)).
3. Apply the universal property to GL_r(ℤ_p), importing its profinite structure from R02.1.

Acceptance: The algebraic group π₁^alg(X,x) is profinite. Every continuous homomorphism π₁^an(X,x)→G to a profinite group factors uniquely through π₁^alg(X,x), and the canonical maps to π₁^alg and π₁^top have dense image. Surjectivity to π₁^alg is not asserted in general. A continuous representation on a finite-free ℤ_p-module factors through this quotient, since GL_r(ℤ_p) is profinite; a representation on ℚ_p may have noncompact image and need not do so.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Theorem 2.10(iii)–(iv), pp. 95–96; Remark 2.11(i), p. 96.

#### Analytic rational local systems and continuous representations

`ClassicalAdicEtaleCohomology:H0/analytic-rational-representation-equivalence` (comparison)

For a connected k-analytic space X and geometric point x, the geometric fibre functor is a ℚ_p-linear tensor equivalence between de Jong’s étale ℚ_p-local systems (the stackification of integral systems after rationalizing morphisms) and continuous finite-dimensional ℚ_p-representations of π₁^an(X,x). On Hausdorff strictly analytic spaces this identifies KL Definition 8.4.3 with de Jong Definition 4.1. Integral rationalizations correspond exactly to representations admitting a π₁^an-stable ℤ_p-lattice; representations with noncompact image have none. The group is the analytic covering group, not the scheme group of Spec A.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-duality`, `ClassicalAdicEtaleCohomology:H0/analytic-fundamental-group-profinite-quotient`, `AdicSpacesPartII:R1`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H0/analytic-rational-lattice-cover`.

Proof outline:

1. The sheaf of lattices of a rational local system is represented locally by disjoint finite étale covers, hence globally by a de Jong covering by Lemma 2.3.
2. Its fibre and the fibres of the universal integral system recover a continuous vector-space action.
3. Conversely a continuous action acts on the discrete lattice set; choose an orbit and the associated covering, build its stable integral system, and descend its rationalization (de Jong Theorem 4.2).

Acceptance: For a connected k-analytic space X and geometric point x, the geometric fibre functor is a ℚ_p-linear tensor equivalence between de Jong’s étale ℚ_p-local systems (the stackification of integral systems after rationalizing morphisms) and continuous finite-dimensional ℚ_p-representations of π₁^an(X,x). On Hausdorff strictly analytic spaces this identifies KL Definition 8.4.3 with de Jong Definition 4.1. Integral rationalizations correspond exactly to representations admitting a π₁^an-stable ℤ_p-lattice; representations with noncompact image have none. The group is the analytic covering group, not the scheme group of Spec A.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Definition 4.1 and Theorem 4.2 with proof, pp. 103–105.

#### Open local integral lattices in the analytic setting

`ClassicalAdicEtaleCohomology:H0/analytic-rational-open-lattices` (theorem)

Every rational local system on a k-analytic Berkovich space has a presentation by integral lattices on ordinary open neighborhoods with rational overlap isomorphisms. At a point x, the compact absolute Galois group of H(x) stabilizes a lattice in the fibre; the lattice covering then has a point with H(y)=H(x), producing a local section. On affinoids this agrees with the encircling rational-neighborhood assertion of KL Proposition 8.4.6 through the Berkovich/preadic comparison.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-rational-representation-equivalence`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-descent-and-quotients`, `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-lattice`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:R1`.

Proof outline:

1. Use compactness of the pointwise Galois action to choose a stable lattice.
2. Apply the locally finite-étale structure of the lattice covering to obtain a section on an ordinary neighborhood.
3. Refine by wide affinoid neighborhoods to compare with KL (de Jong Corollary 4.4).

Acceptance: Every rational local system on a k-analytic Berkovich space has a presentation by integral lattices on ordinary open neighborhoods with rational overlap isomorphisms. At a point x, the compact absolute Galois group of H(x) stabilizes a lattice in the fibre; the lattice covering then has a point with H(y)=H(x), producing a local section. On affinoids this agrees with the encircling rational-neighborhood assertion of KL Proposition 8.4.6 through the Berkovich/preadic comparison.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Corollary 4.4 and proof, p. 105.

#### Noncompact rational monodromy

`ClassicalAdicEtaleCohomology:H0/rational-monodromy-without-global-lattice` (application)

Let E_q be a Tate elliptic curve over an algebraically closed complete nonarchimedean field of characteristic zero, with 0<|q|<1. The topological covering G_m^an→E_q has deck group q^ℤ≅ℤ. Compose π₁^an(E_q,x)→π₁^top(E_q,x)≅ℤ with a↦p^a∈ℚ_p×. The resulting rank-one rational local system has local integral lattices but no global integral lattice: p^ℤ is noncompact and multiplication by p cannot stabilize a nonzero finite-free ℤ_p-lattice of rank one. This is a discriminating example for rational stackification. The reduced-affinoid failure of rational Spec–Spa equivalence is the separate assertion of KL Remark 8.4.8, not a claim that E_q is affinoid.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-rational-representation-equivalence`, `ClassicalAdicEtaleCohomology:H0/analytic-rational-open-lattices`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ArithmeticGaloisDuality:R02.1`, `ClassicalAdicEtaleCohomology:H0/analytic-topological-covering-equivalence`.

Proof outline:

1. Import Tate uniformization and its topological covering from the analytic geometry supplier R1.
2. Use de Jong’s representation equivalence for the rank-one action.
3. A lattice p^bℤ_p is carried to p^(b+1)ℤ_p, so cannot be invariant under the generator.

Acceptance: The noncompact system still has the local lattices of Proposition 8.4.6. On a geometric point every continuous Galois representation has a stable integral lattice.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Remark 8.4.8, p. 169.

#### Strict and full Berkovich étale topoi

`ClassicalAdicEtaleCohomology:H0/berkovich-strict-etale-site-comparison` (comparison)

For a Hausdorff strictly K-analytic Berkovich space Z, its strict étale site consists of étale Y→Z with Y strictly K-analytic, and jointly surjective families. The inclusion into the full Berkovich étale site induces an equivalence of topoi, as in Zavyalov A.13–A.14. This is an instance of the general basis/site comparison supplied by A1/D0, requested with this precise Berkovich carrier; it does not redefine the general sheaf category.

Prerequisites: `AdicEtaleGeometry:A1`, `DiamondsAndVStacks:D0`, `AdicSpacesPartII:R1`.

Proof outline:

1. Import the strict Berkovich étale category and coverings from the geometry/site supplier.
2. Use the local strictness/basis comparison to identify the full and strict topoi.
3. Transport sheaves, stalks and derived cohomology along this equivalence.

Acceptance: For a Hausdorff strictly K-analytic Berkovich space Z, its strict étale site consists of étale Y→Z with Y strictly K-analytic, and jointly surjective families. The inclusion into the full Berkovich étale site induces an equivalence of topoi, as in Zavyalov A.13–A.14. This is an instance of the general basis/site comparison supplied by A1/D0, requested with this precise Berkovich carrier; it does not redefine the general sheaf category.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### The adic–Berkovich morphism of étale topoi

`ClassicalAdicEtaleCohomology:H0/taut-adic-berkovich-site-morphism` (construction)

For taut rigid X over Spa(K,O_K), θ_X:X_et→u(X)_et,s is induced by the functor sending a strict Berkovich étale Y→u(X) to s₀(Y)→X. The functor is well-defined because s₀ sends étale maps to partially proper étale adic maps. Denote its exact inverse image by θ_X^*. For f:X→Y between taut rigid spaces the square of θ_X,θ_Y,f,u(f) commutes, with the canonical pullback identification θ_X^*u(f)^*≅f^*θ_Y^*.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/berkovich-strict-etale-site-comparison`, `AdicEtaleGeometry:A1`, `DiamondsAndVStacks:D0`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`.

Proof outline:

1. Use the imported taut/strict geometry equivalence and its effect on étale maps.
2. Apply the site-to-topos construction to the covering- and finite-limit-preserving functor.
3. Compare the two composite site functors to obtain the naturality square and exact inverse image.

API:

- `AdicBerkovichToposMorphism` (structure): The morphism θ_X with its inducing site functor.
- `AdicBerkovichToposMorphism.etaleObject` (constructor): Send Y→u(X) to s₀(Y)→X.
- `AdicBerkovichToposMorphism.pullback` (projection): The exact inverse-image functor θ_X^* on abelian sheaves.
- `AdicBerkovichToposMorphism.naturality` (functoriality): θ_X^*u(f)^*≅f^*θ_Y^*.
- `AdicBerkovichToposMorphism.stalkMaximal` (compatibility): At a maximal geometric point, θ_X^* has the corresponding Berkovich stalk.
- `AdicBerkovichToposMorphism.constant` (simp): θ_X^* preserves constant coefficient sheaves and their Tate twists.

Unit tests:

- `theta_constant` (computation): θ_X^*ℤ/n is the constant ℤ/n sheaf on X.
- `theta_identity` (compatibility): For f=id the naturality identification is the identity coherence map.
- `theta_field` (computation): For X=Spa(K,O_K) the comparison retains the continuous Galois action on the geometric stalk.

Uses: Zavyalov Theorem A.15 and §5.3: Pulls the Berkovich proper-support trace to classical adic sheaves..

Acceptance: For taut rigid X over Spa(K,O_K), θ_X:X_et→u(X)_et,s is induced by the functor sending a strict Berkovich étale Y→u(X) to s₀(Y)→X. The functor is well-defined because s₀ sends étale maps to partially proper étale adic maps. Denote its exact inverse image by θ_X^*. For f:X→Y between taut rigid spaces the square of θ_X,θ_Y,f,u(f) commutes, with the canonical pullback identification θ_X^*u(f)^*≅f^*θ_Y^*.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Overconvergent étale sheaves

`ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves` (definition)

For an analytic adic space X an abelian étale sheaf F is overconvergent when every specialization η₁→η₂ of geometric points induces an isomorphism F_{η₂}→F_{η₁}. Ab_ov(X_et) is the full subcategory of such sheaves. The quantifier includes geometric points with higher-rank plus rings and their specialization maps; it is not only a condition on closed points or on a chosen rank-one subspace.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `AdicEtaleGeometry:A1`.

Proof outline:

1. Use A1 geometric-point specialization maps and H0 stalk functors.
2. Define the specialization-isomorphism property and the full subcategory.
3. Prove invariance under sheaf isomorphism and restriction.

API:

- `OverconvergentEtaleSheaf` (structure): The full subcategory Ab_ov(X_et).
- `OverconvergentEtaleSheaf.specializationIso` (projection): The stalk isomorphism for every geometric specialization.
- `OverconvergentEtaleSheaf.ofStalkIsos` (constructor): Construct the overconvergence property from the full family of specialization isomorphisms.
- `OverconvergentEtaleSheaf.restrict` (functoriality): Restriction preserves all specialization isomorphisms.
- `OverconvergentEtaleSheaf.isoInvariant` (relation): Overconvergence is invariant under sheaf isomorphism.

Unit tests:

- `overconvergent_constant` (computation): A constant abelian sheaf is overconvergent.
- `overconvergent_empty` (degenerate): The condition is vacuous on the empty space.
- `overconvergent_higherRank` (compatibility): The definition tests specializations with a higher-rank plus ring, rather than silently dropping them.

Uses: Zavyalov A.18–A.19 and proof of Theorem 5.3.3: Identifies the essential image of θ^* and allows trace maps to be checked on maximal stalks..

Acceptance: For an analytic adic space X an abelian étale sheaf F is overconvergent when every specialization η₁→η₂ of geometric points induces an isomorphism F_{η₂}→F_{η₁}. Ab_ov(X_et) is the full subcategory of such sheaves. The quantifier includes geometric points with higher-rank plus rings and their specialization maps; it is not only a condition on closed points or on a chosen rank-one subspace.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Berkovich sheaves equal overconvergent adic sheaves

`ClassicalAdicEtaleCohomology:H0/berkovich-overconvergent-sheaf-equivalence` (comparison)

For a taut rigid K-space X, θ_X^*:Ab(u(X)_et,s)→Ab(X_et) is fully faithful with essential image exactly Ab_ov(X_et), hence induces an equivalence with that full subcategory. It does not assert an equivalence between all adic étale sheaves and Berkovich sheaves. This is Zavyalov Lemma A.18, importing Huber 8.3.5.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/taut-adic-berkovich-site-morphism`, `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `AdicSpacesPartII:R1`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Use the specialization description of θ_X^* to land in Ab_ov.
2. Import the Huber 8.3.5 descent/essential-image theorem with its exact overconvergence condition.
3. Restrict the fully faithful inverse-image functor to its essential image.

Acceptance: For a taut rigid K-space X, θ_X^*:Ab(u(X)_et,s)→Ab(X_et) is fully faithful with essential image exactly Ab_ov(X_et), hence induces an equivalence with that full subcategory. It does not assert an equivalence between all adic étale sheaves and Berkovich sheaves. This is Zavyalov Lemma A.18, importing Huber 8.3.5.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Maximal stalks detect maps of overconvergent sheaves

`ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks` (lemma)

On a taut rigid X, equality of two morphisms between overconvergent abelian sheaves can be checked at geometric points over maximal points of X. A morphism between them is an isomorphism if and only if those maximal geometric stalk maps are isomorphisms. Every geometric point specializes along its unique maximal generalization and overconvergence transports the stalk test; this does not say that an arbitrary unrelated family of stalk maps extends to a sheaf morphism.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `ClassicalAdicEtaleCohomology:H0/berkovich-overconvergent-sheaf-equivalence`, `AdicSpacesPartII:R0`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`.

Proof outline:

1. Import maximal generalization of points in the rigid locally spectral carrier.
2. Use overconvergence to transport both maps to the maximal stalk.
3. Apply the enough-points criterion on the full adic étale topos.

Acceptance: On a taut rigid X, equality of two morphisms between overconvergent abelian sheaves can be checked at geometric points over maximal points of X. A morphism between them is an isomorphism if and only if those maximal geometric stalk maps are isomorphisms. Every geometric point specializes along its unique maximal generalization and overconvergence transports the stalk test; this does not say that an arbitrary unrelated family of stalk maps extends to a sheaf morphism.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Pullback preserves overconvergent sheaves

`ClassicalAdicEtaleCohomology:H0/overconvergent-pullback-preservation` (lemma)

For a morphism of analytic adic spaces f:X→Y, f^* sends overconvergent abelian sheaves to overconvergent sheaves: each specialization of geometric points of X maps to a specialization over Y and the corresponding stalk map is the pullback of the original isomorphism. On taut rigid spaces this agrees with the θ-naturality identification whenever the Berkovich realization is available.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `ClassicalAdicEtaleCohomology:H0/taut-adic-berkovich-site-morphism`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`.

Proof outline:

1. Use the stalk formula for inverse image under a geometric morphism.
2. Transport specialization along f and use the defining stalk isomorphisms.
3. Compare with θ-naturality on the taut rigid subcategory.

Acceptance: For a morphism of analytic adic spaces f:X→Y, f^* sends overconvergent abelian sheaves to overconvergent sheaves: each specialization of geometric points of X maps to a specialization over Y and the corresponding stalk map is the pullback of the original isomorphism. On taut rigid spaces this agrees with the θ-naturality identification whenever the Berkovich realization is available.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Analytic covering maps are separated

`ClassicalAdicEtaleCohomology:H0/analytic-covering-separatedness` (lemma)

A de Jong étale covering Y→X is separated. On an ordinary neighbourhood where it is a disjoint union of finite étale spaces, each diagonal is closed and the disjoint-component diagonal is closed; separatedness then descends over the open covering of X.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `AdicSpacesPartII:R1`.

Proof outline:

1. Reduce to the local disjoint finite-étale presentation.
2. Check the diagonal on each pair of components and use the local criterion for separatedness.

Acceptance: A de Jong étale covering Y→X is separated. On an ordinary neighbourhood where it is a disjoint union of finite étale spaces, each diagonal is closed and the disjoint-component diagonal is closed; separatedness then descends over the open covering of X.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Base change of analytic coverings

`ClassicalAdicEtaleCohomology:H0/analytic-covering-base-change` (lemma)

For an arbitrary analytic map X′→X and a de Jong covering Y→X, Y×_X X′→X′ is again a covering. Pull back the ordinary neighbourhoods and their disjoint finite-étale presentations; base change of each finite étale piece is finite étale.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R1`.

Proof outline:

1. Pull back a neighbourhood presentation around the image of a point of X′.
2. Use finite-étale base change on every piece; their disjoint union is the full preimage.

Acceptance: For an arbitrary analytic map X′→X and a de Jong covering Y→X, Y×_X X′→X′ is again a covering. Pull back the ordinary neighbourhoods and their disjoint finite-étale presentations; base change of each finite étale piece is finite étale.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Images of analytic coverings are unions of components

`ClassicalAdicEtaleCohomology:H0/analytic-covering-image-components` (lemma)

The image of a de Jong covering Y→X is a union of connected components of X. In particular, on connected X any nonempty covering is surjective. This follows from the locally constant image condition of finite étale pieces, with the uniform ordinary neighbourhood in the covering definition.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `AdicSpacesPartII:R1`, `AdicEtaleGeometry:A1`.

Proof outline:

1. On a connected small neighbourhood each nonempty finite étale component is surjective.
2. The image and its complement are locally open; propagate along connected components.

Acceptance: The image of a de Jong covering Y→X is a union of connected components of X. In particular, on connected X any nonempty covering is surjective. This follows from the locally constant image condition of finite étale pieces, with the uniform ordinary neighbourhood in the covering definition.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Representability of analytic coverings is étale local

`ClassicalAdicEtaleCohomology:H0/analytic-covering-effective-etale-descent` (theorem)

An étale sheaf on X_et is represented by a de Jong covering if and only if its pullback to each member of an étale covering of X is so. Effective descent retains a single ordinary neighbourhood on which all fibres are a disjoint union of finite étale pieces; arbitrary sheaf representability alone would not prove this covering condition.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0`, `AdicSpacesPartII:R1`.

Proof outline:

1. Reduce the descent map locally to a finite étale Galois covering.
2. For each component take its finite orbit under the finite descent group.
3. Descend those finite étale unions and glue them over ordinary neighbourhoods, as de Jong Lemma 2.3.

Acceptance: An étale sheaf on X_et is represented by a de Jong covering if and only if its pullback to each member of an étale covering of X is so. Effective descent retains a single ordinary neighbourhood on which all fibres are a disjoint union of finite étale pieces; arbitrary sheaf representability alone would not prove this covering condition.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Componentwise equivalence-relation quotients of coverings

`ClassicalAdicEtaleCohomology:H0/analytic-covering-componentwise-quotient` (theorem)

For a de Jong covering Y→X and an equivalence relation R which is a union of connected components of Y×_X Y, the étale quotient sheaf Y/R is represented by a de Jong covering. Locally reduce to finite étale pieces and quotient by the descended relation; the component condition is essential to that reduction.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-base-change`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-effective-etale-descent`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0`.

Proof outline:

1. After finite étale base change split the local finite pieces.
2. The componentwise relation descends to a relation on the discrete pieces.
3. Construct their quotients and apply effective étale descent, as de Jong Lemma 2.4.

Acceptance: For a de Jong covering Y→X and an equivalence relation R which is a union of connected components of Y×_X Y, the étale quotient sheaf Y/R is represented by a de Jong covering. Locally reduce to finite étale pieces and quotient by the descended relation; the component condition is essential to that reduction.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### A covering morphism is determined by one fibre

`ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-faithfulness` (lemma)

For connected X and a geometric base point x, two maps between de Jong coverings agreeing on F_x agree everywhere. Use paths F_x≅F_z at every geometric point z, natural in covering maps, then the enough-points criterion for the represented étale sheaves.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-functor`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-paths`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-effective-etale-descent`, `AdicEtaleGeometry:A1`.

Proof outline:

1. Transport equality along a chosen covering path to each geometric point.
2. Apply equality detection on the étale sheaf of covering morphisms.

Acceptance: For connected X and a geometric base point x, two maps between de Jong coverings agreeing on F_x agree everywhere. Use paths F_x≅F_z at every geometric point z, natural in covering maps, then the enough-points criterion for the represented étale sheaves.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Connected coverings and fibre orbits

`ClassicalAdicEtaleCohomology:H0/analytic-covering-connected-orbits` (lemma)

For connected X, the fibres of connected components of a de Jong covering are exactly the π₁^an-orbits in F_x(Y). Connected coverings therefore have transitive fibre action, and their geometric points all lie above X. This is the connected-component/orbit step in the proof of de Jong 2.10.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-paths`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-image-components`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-base-change`.

Proof outline:

1. Use path transport to identify the points over different base points in a connected covering component.
2. Use fibre-functor automorphisms to identify the orbit over the fixed base point.
3. Apply the component image lemma for surjectivity.

Acceptance: For connected X, the fibres of connected components of a de Jong covering are exactly the π₁^an-orbits in F_x(Y). Connected coverings therefore have transitive fibre action, and their geometric points all lie above X. This is the connected-component/orbit step in the proof of de Jong 2.10.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Realization of a transitive open-stabilizer action

`ClassicalAdicEtaleCohomology:H0/analytic-covering-open-stabilizer-realization` (theorem)

For π=π₁^an(X,x) and an open subgroup H⊆π, the continuous transitive discrete action π/H is represented by a connected de Jong covering. Choose a pointed covering whose stabilizer is contained in H and quotient by the union of fibre-product components corresponding to H; the quotient is representable by the componentwise quotient theorem.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-fundamental-group`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-connected-orbits`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-componentwise-quotient`.

Proof outline:

1. Use the stabilizer neighbourhood basis to find the chosen pointed covering.
2. Translate the H-orbit equivalence relation to a union of connected components of its fibre product.
3. Take the represented quotient and identify its fibre with π/H.

Acceptance: For π=π₁^an(X,x) and an open subgroup H⊆π, the continuous transitive discrete action π/H is represented by a connected de Jong covering. Choose a pointed covering whose stabilizer is contained in H and quotient by the union of fibre-product components corresponding to H; the quotient is representable by the componentwise quotient theorem.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Equivariant fibre maps come from covering morphisms

`ClassicalAdicEtaleCohomology:H0/analytic-covering-equivariant-morphisms` (theorem)

For connected X and de Jong coverings Y,Z, every π₁^an-equivariant map F_x(Y)→F_x(Z) is induced by a unique analytic covering map Y→Z over X. Its graph is a union of components of Y×_X Z; projection to Y is an isomorphism by the fibre criterion and path transport.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-covering-fiber-faithfulness`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-connected-orbits`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-base-change`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-componentwise-quotient`.

Proof outline:

1. Build the graph as the corresponding union of fibre-product components.
2. Show its projection to Y is bijective on every fibre by paths.
3. Use local finite-étale presentations to turn the fibrewise bijection into an isomorphism.

Acceptance: For connected X and de Jong coverings Y,Z, every π₁^an-equivariant map F_x(Y)→F_x(Z) is induced by a unique analytic covering map Y→Z over X. Its graph is a union of components of Y×_X Z; projection to Y is an isomorphism by the fibre criterion and path transport.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Disjoint-union enlargement of the covering category

`ClassicalAdicEtaleCohomology:H0/analytic-covering-disjoint-union-enlargement` (comparison)

The category of arbitrary analytic disjoint unions of objects of Cov_X, with maps over X, is equivalent via F_x to all continuous discrete π₁^an-sets: decompose an action into transitive orbits, realize each orbit, and take their disjoint union in analytic spaces. Such a union need not be an object of Cov_X because one uniform ordinary neighbourhood may fail for its infinitely many components.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-covering-open-stabilizer-realization`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-equivariant-morphisms`, `AdicSpacesPartII:R1`.

Proof outline:

1. Decompose a discrete continuous action into open-stabilizer orbits.
2. Realize each orbit and take the analytic disjoint union.
3. Use full faithfulness componentwise; retain the distinction from Cov_X itself.

Acceptance: The category of arbitrary analytic disjoint unions of objects of Cov_X, with maps over X, is equivalent via F_x to all continuous discrete π₁^an-sets: decompose an action into transitive orbits, realize each orbit, and take their disjoint union in analytic spaces. Such a union need not be an object of Cov_X because one uniform ordinary neighbourhood may fail for its infinitely many components.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### The analytic covering of integral lattices

`ClassicalAdicEtaleCohomology:H0/analytic-rational-lattice-cover` (construction)

For an étale ℚ_p-local system V on a k-analytic X, let Lat(V) be the étale sheaf whose sections are finite-free integral ℤ_p-lattices in V, with inclusion after rationalization equal to V. It is represented by a de Jong covering: locally choose an integral presentation T, and express its lattice sheaf as the disjoint union of finite étale bounded-lattice strata. Étale-local representability then gives a global analytic covering. This construction allows Lat(V) to lack a global section.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/preadic-rational-local-systems`, `ClassicalAdicEtaleCohomology:H0/bounded-lattices-in-preadic-local-systems`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-effective-etale-descent`, `SchemeAndStackFoundations:SF.2`, `AdicEtaleGeometry:A1`.

Proof outline:

1. Use local integral presentations of the rational system.
2. Decompose lattices into strata lying between p^mT and p^(−m)T, using finite-level integral lattices.
3. Apply effective descent for analytic coverings.

API:

- `AnalyticRationalLatticeCover` (structure): The represented covering Lat(V)→X.
- `AnalyticRationalLatticeCover.fiber` (projection): At x its points are ℤ_p-lattices in the rational fibre V_x.
- `AnalyticRationalLatticeCover.boundedStratum` (constructor): The locally finite étale stratum determined by a chosen integral presentation and finite two-sided bounds.
- `AnalyticRationalLatticeCover.universalLattice` (data): The tautological integral system on Lat(V) rationalizes to the pullback of V.
- `AnalyticRationalLatticeCover.pullback` (functoriality): Lat(f^*V)≅Lat(V)×_X X′.
- `AnalyticRationalLatticeCover.section` (characterisation): Global sections correspond to global integral lattices in V.

Unit tests:

- `latticeCover_rankZero` (degenerate): For V=0 the lattice cover is X with its unique zero lattice.
- `latticeCover_rankOnePoint` (computation): For trivial rank-one V at a geometric point, the lattice set is {p^aℤ_p | a∈ℤ}.
- `latticeCover_noncompact` (non-example): The Tate-curve p^ℤ monodromy system has no section of its lattice cover.

Uses: de Jong Theorem 4.2 and Corollary 4.4: The tautological lattice proves the representation equivalence and ordinary-open local lattices..

Acceptance: For an étale ℚ_p-local system V on a k-analytic X, let Lat(V) be the étale sheaf whose sections are finite-free integral ℤ_p-lattices in V, with inclusion after rationalization equal to V. It is represented by a de Jong covering: locally choose an integral presentation T, and express its lattice sheaf as the disjoint union of finite étale bounded-lattice strata. Étale-local representability then gives a global analytic covering. This construction allows Lat(V) to lack a global section.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Proof of Theorem 4.2, pp. 103–104.

#### A monodromy orbit of lattices is a connected cover

`ClassicalAdicEtaleCohomology:H0/analytic-lattice-orbit-cover` (lemma)

For connected X, a lattice L⊂V_x has an open stabilizer under a continuous π₁^an-action. Its orbit in Lat(V)_x corresponds to a connected de Jong covering carrying the universal stable lattice, whose rationalization is the pulled-back V. The orbit can be infinite; the stabilizer need not have finite index.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-rational-lattice-cover`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-open-stabilizer-realization`, `ClassicalAdicEtaleCohomology:H0/analytic-rational-representation-equivalence`.

Proof outline:

1. Use continuity of the rational action and openness of GL(L) in GL(V_x).
2. Realize the discrete lattice orbit by the open-stabilizer covering.
3. Restrict the tautological integral system from Lat(V).

Acceptance: For connected X, a lattice L⊂V_x has an open stabilizer under a continuous π₁^an-action. Its orbit in Lat(V)_x corresponds to a connected de Jong covering carrying the universal stable lattice, whose rationalization is the pulled-back V. The orbit can be infinite; the stabilizer need not have finite index.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §2, Lemmas 2.2–2.7 and Theorem 2.10; §4, proof of Theorem 4.2.

#### Global integral lattices and compact monodromy

`ClassicalAdicEtaleCohomology:H0/analytic-global-lattice-monodromy-criterion` (theorem)

For connected analytic X and a finite-dimensional continuous ℚ_p-local system V, a global integral ℤ_p-lattice exists if and only if the image of π₁^an in GL(V_x) is relatively compact (equivalently its closure is compact). A stable lattice places the image in GL_r(ℤ_p); conversely a compact closure stabilizes a lattice by the general p-adic linear-algebra input. This criterion is for analytic local systems, and does not force all rational monodromy to be compact.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-rational-representation-equivalence`, `ClassicalAdicEtaleCohomology:H0/analytic-rational-lattice-cover`, `ClassicalAdicEtaleCohomology:H0/analytic-fundamental-group-profinite-quotient`, `ArithmeticGaloisDuality:R02.1`.

Proof outline:

1. A global lattice gives a section of Lat(V) and a stable fibre lattice.
2. Apply the compact-image stable-lattice lemma from the linear representation supplier.
3. Use the representation equivalence to descend the stable lattice to X.

Acceptance: For connected analytic X and a finite-dimensional continuous ℚ_p-local system V, a global integral ℤ_p-lattice exists if and only if the image of π₁^an in GL(V_x) is relatively compact (equivalently its closure is compact). A stable lattice places the image in GL_r(ℤ_p); conversely a compact closure stabilizes a lattice by the general p-adic linear-algebra input. This criterion is for analytic local systems, and does not force all rational monodromy to be compact.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), §4, proof of Theorem 4.2 and Corollary 4.4, pp. 104–105.

#### Bounded lattice strata are controlled by finite quotients

`ClassicalAdicEtaleCohomology:H0/analytic-bounded-lattice-finite-quotient` (lemma)

For an integral system T and m≥0, a lattice T′ with p^mT⊆T′⊆p^(−m)T is determined by the submodule T′/p^mT of the finite locally free quotient p^(−m)T/p^mT. The freeness and lattice conditions select a finite locally constant subset of the finite submodule set. Thus the two-sided bounded-lattice stratum is finite étale locally and globally represented by the corresponding finite étale preadic space.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/bounded-lattices-in-preadic-local-systems`, `ClassicalAdicEtaleCohomology:H0/preadic-integral-local-systems`, `SchemeAndStackFoundations:SF.2`, `AdicEtaleGeometry:A1`.

Proof outline:

1. Recover T′ as the preimage of its quotient submodule.
2. Check lattice/freeness after an integral trivializing cover.
3. Use the finite-étale algebra/space correspondence and integral descent.

Acceptance: For an integral system T and m≥0, a lattice T′ with p^mT⊆T′⊆p^(−m)T is determined by the submodule T′/p^mT of the finite locally free quotient p^(−m)T/p^mT. The freeness and lattice conditions select a finite locally constant subset of the finite submodule set. Thus the two-sided bounded-lattice stratum is finite étale locally and globally represented by the corresponding finite étale preadic space.

Sources: [KedlayaLiu-RelativeFoundations-2015](https://arxiv.org/abs/1301.0792), Remark 1.4.7 and proof of Proposition 8.4.6.

#### Analytic and underlying topological coverings

`ClassicalAdicEtaleCohomology:H0/analytic-topological-covering-equivalence` (comparison)

The category of topological analytic covering spaces of a k-analytic X is equivalent to the category of topological covering spaces of |X|. A topological covering T→|X| defines the étale sheaf U↦Hom_|X|(|U|,T); étale-local covering representability equips T with its unique analytic covering structure. Thus π₁^top depends only on (|X|,x), as required by the Tate-curve monodromy example.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/analytic-etale-covering-spaces`, `ClassicalAdicEtaleCohomology:H0/analytic-covering-effective-etale-descent`, `AdicSpacesPartII:R1`, `AdicEtaleGeometry:A1`.

Proof outline:

1. Construct the sheaf of continuous lifts to the underlying covering.
2. Apply de Jong Lemma 2.3 locally, then glue the represented analytic covering.
3. Check that taking underlying spaces and this construction are inverse.

Acceptance: The category of topological analytic covering spaces of a k-analytic X is equivalent to the category of topological covering spaces of |X|. A topological covering T→|X| defines the étale sheaf U↦Hom_|X|(|U|,T); étale-local covering representability equips T with its unique analytic covering structure. Thus π₁^top depends only on (|X|,x), as required by the Tate-curve monodromy example.

Sources: [deJong-AnalyticFundamentalGroups-1995](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf), Lemma 2.6 and proof, p. 93.

### H1:henselian: source additions

#### Noetherian models of an integral perfectoid ring

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-noetherian-approximation` (construction)

Let R be a p-torsion-free integral perfectoid ℤ_p-algebra with R = (R[1/p])°, and put X = Spa(R[1/p],R). Choose the filtered system of finite-type ℤ_p-subalgebras R_j of R, enlarged to their integral closures in R_j[1/p]. Write R_j^h for the henselization along p. The inclusions R_j → R extend uniquely to R_j^h → R, and R = colim_j R_j^h as rings. The adic system X_j = Spa(R_j[1/p],R_j) has common ideal of definition (p); its completed colimit presents X. This is approximation data, not a claim that R is Noetherian or that X is an ordinary categorical inverse limit.

Prerequisites: `PerfectoidSpaces:P5`, `AdicSpacesPartII:R0`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`.

Proof outline:

1. Use finite-type subalgebras and Noetherian normalization to obtain integrally closed finite stages.
2. Completeness makes (R,pR) henselian, so the finite-stage henselizations map into R.
3. Every element of R already belongs to a finite-type subalgebra; compatibility gives the asserted filtered colimit. Keep the completion and analytic topology as additional data.

API:

- `PerfectoidHuberApproximation` (structure): The filtered rings R_j, their henselizations, common p-adic ideal, transition maps and maps into R.
- `PerfectoidHuberApproximation.henselianMap` (constructor): The unique extension R_j^h → R of R_j → R.
- `PerfectoidHuberApproximation.ringColimit` (universal-property): R ≅ colim R_j^h as rings.
- `PerfectoidHuberApproximation.adicStage` (projection): X_j = Spa(R_j[1/p],R_j) with its f-adic topology.
- `PerfectoidHuberApproximation.refine` (functoriality): Finite collections of elements and finite-presentation equations descend after a common refinement.

Unit tests:

- `perfectoidApprox_elements` (computation): A finite tuple in R is contained in one finite stage.
- `perfectoidApprox_henselization` (compatibility): R_j → R factors through R_j^h, and the two factorizations coincide on refinement.
- `perfectoidApprox_notNoetherian` (non-example): For R = ℤ_p[p^{1/p^∞}] completed, the construction does not supply a Noetherian instance on R.

Uses: Česnavičius §4.10; RT-AREA-etale/26: Supplies the finite Noetherian inputs without importing all of P5 into the henselian-comparison layer..

Acceptance: Let R be a p-torsion-free integral perfectoid ℤ_p-algebra with R = (R[1/p])°, and put X = Spa(R[1/p],R). Choose the filtered system of finite-type ℤ_p-subalgebras R_j of R, enlarged to their integral closures in R_j[1/p]. Write R_j^h for the henselization along p. The inclusions R_j → R extend uniquely to R_j^h → R, and R = colim_j R_j^h as rings. The adic system X_j = Spa(R_j[1/p],R_j) has common ideal of definition (p); its completed colimit presents X. This is approximation data, not a claim that R is Noetherian or that X is an ordinary categorical inverse limit.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### The perfectoid model system is a tilde-limit

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-tilde-limit` (lemma)

For the model system in perfectoid-noetherian-approximation, X = Spa(R[1/p],R) satisfies X ∼ lim_j X_j: its underlying topological space is the inverse limit of |X_j|, rational subsets are pulled back from a finite stage, and the colimit of finite-stage rings of sections has dense image on rational affinoids. These are the separate topological and density clauses of HuberTildeLimit; no universal mapping property of an ordinary inverse limit is asserted.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-noetherian-approximation`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `PerfectoidSpaces:P5`, `AdicSpacesPartII:R0`.

Proof outline:

1. Apply the perfectoid completed-colimit presentation to valuations and rational inequalities.
2. Descend finitely many rational inequalities to one stage.
3. Use the common p-adic ideal and completion to prove density on each descended rational subset.

Acceptance: For the model system in perfectoid-noetherian-approximation, X = Spa(R[1/p],R) satisfies X ∼ lim_j X_j: its underlying topological space is the inverse limit of |X_j|, rational subsets are pulled back from a finite stage, and the colimit of finite-stage rings of sections has dense image on rational affinoids. These are the separate topological and density clauses of HuberTildeLimit; no universal mapping property of an ordinary inverse limit is asserted.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Étale-site descent for the perfectoid model system

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-etale-site-continuity` (comparison)

For the system X ∼ lim_j X_j above, qcqs étale X-spaces, their morphisms, finite fibre products and finite covering families descend to some X_j and two descended data agree after a further stage. Thus the qcqs étale site of X is the filtered 2-colimit of the qcqs étale sites of X_j. This assertion uses the perfectoid completed-colimit theorem; it is not inferred from the topological part of a tilde-limit alone.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-tilde-limit`, `PerfectoidSpaces:P5`, `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H0/etale-topos-of-tilde-limit`.

Proof outline:

1. Invoke P5 finite-étale descent on rational affinoids of the completed colimit.
2. Use standard étale presentations and A1 rational refinements to cover qcqs étale objects by finitely many such charts.
3. Descend the finite gluing diagrams and covering conditions; refine until their equalities hold.

Acceptance: For the system X ∼ lim_j X_j above, qcqs étale X-spaces, their morphisms, finite fibre products and finite covering families descend to some X_j and two descended data agree after a further stage. Thus the qcqs étale site of X is the filtered 2-colimit of the qcqs étale sites of X_j. This assertion uses the perfectoid completed-colimit theorem; it is not inferred from the topological part of a tilde-limit alone.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Finite hypercover data descend through the model system

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-hypercover-continuity` (lemma)

For a finite locally constant abelian sheaf G_j on X_j and G its pullback to X, every finite truncation of a qcqs étale hypercover of X together with the coefficient cocycle needed to compute a fixed H^q(X,G) descends to a subsequent X_k. Coboundaries and identifications descend after another refinement. Consequently colim_{k≥j} H^q(X_k,G_k) ≅ H^q(X,G) for every q≥0. This is continuity of cohomology, not commutation with an inverse limit of coefficient groups.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-etale-site-continuity`, `DiamondsAndVStacks:D0`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`.

Proof outline:

1. Use coherent-site hypercover cohomology imported from D0.
2. Only finitely many levels and finite diagrams occur for a fixed degree and cocycle; descend them using the 2-colimit site.
3. Descend the additional data witnessing equality of cocycles to obtain both injectivity and surjectivity.

Acceptance: For a finite locally constant abelian sheaf G_j on X_j and G its pullback to X, every finite truncation of a qcqs étale hypercover of X together with the coefficient cocycle needed to compute a fixed H^q(X,G) descends to a subsequent X_k. Coboundaries and identifications descend after another refinement. Consequently colim_{k≥j} H^q(X_k,G_k) ≅ H^q(X,G) for every q≥0. This is continuity of cohomology, not commutation with an inverse limit of coefficient groups.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Scheme continuity on generic henselizations

`ClassicalAdicEtaleCohomology:H1:henselian/generic-henselization-scheme-continuity` (lemma)

With R = colim_j R_j^h and a finite étale commutative p-primary group scheme G over R[1/p], G descends to G_j over R_j^h[1/p] for some j, and colim_{k≥j} H^q(Spec(R_k^h[1/p]),G_k) ≅ H^q(Spec(R[1/p]),G) for all q≥0. The finite generic schemes here are Spec(R_k^h[1/p]), not Spec(R_k[1/p]).

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-noetherian-approximation`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`.

Proof outline:

1. Descend the finite-presentation Hopf algebra and the finite étale condition.
2. Apply L2 affine scheme cohomology continuity to the localized filtered colimit of henselizations.

Acceptance: With R = colim_j R_j^h and a finite étale commutative p-primary group scheme G over R[1/p], G descends to G_j over R_j^h[1/p] for some j, and colim_{k≥j} H^q(Spec(R_k^h[1/p]),G_k) ≅ H^q(Spec(R[1/p]),G) for all q≥0. The finite generic schemes here are Spec(R_k^h[1/p]), not Spec(R_k[1/p]).

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Huber comparison at each Noetherian generic stage

`ClassicalAdicEtaleCohomology:H1:henselian/noetherian-henselized-generic-comparison` (comparison)

For each Noetherian p-adic model R_j as above and every finite locally constant abelian sheaf G_j on Spec(R_j^h[1/p]), H^q(Spec(R_j^h[1/p]),G_j) ≅ H^q(Spa(R_j[1/p],R_j),G_j^an) canonically for q≥0. The analytic pullback is the one defined by Huber 3.2.9 and henselization invariance. The ambient Noetherian hypotheses are checked only at R_j; neither R nor R[1/p] is put into that theorem.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-noetherian-approximation`, `ClassicalAdicEtaleCohomology:H1:henselian/sheaf-comparison-3-2-9`.

Proof outline:

1. Apply the exact Noetherian specialization identified in Česnavičius (4.10.5).
2. Check compatibility of its sheaf pullback with the generic henselization and with refinement.

Acceptance: For each Noetherian p-adic model R_j as above and every finite locally constant abelian sheaf G_j on Spec(R_j^h[1/p]), H^q(Spec(R_j^h[1/p]),G_j) ≅ H^q(Spa(R_j[1/p],R_j),G_j^an) canonically for q≥0. The analytic pullback is the one defined by Huber 3.2.9 and henselization invariance. The ambient Noetherian hypotheses are checked only at R_j; neither R nor R[1/p] is put into that theorem.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Finite-stage comparison commutes with refinement

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-finite-stage-comparison-naturality` (lemma)

For j≤k the Noetherian generic comparison gives a commutative square between H^q(Spec(R_j^h[1/p]),G_j) → H^q(Spec(R_k^h[1/p]),G_k) and H^q(X_j,G_j^an) → H^q(X_k,G_k^an). The identifications also commute with coefficient morphisms and the connecting maps of short exact coefficient sequences.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/noetherian-henselized-generic-comparison`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`.

Proof outline:

1. Construct comparison through the morphisms of étale topoi, rather than choosing abstract isomorphisms of groups.
2. Use functoriality of pullback and of derived global sections to compare both routes.

Acceptance: For j≤k the Noetherian generic comparison gives a commutative square between H^q(Spec(R_j^h[1/p]),G_j) → H^q(Spec(R_k^h[1/p]),G_k) and H^q(X_j,G_j^an) → H^q(X_k,G_k^an). The identifications also commute with coefficient morphisms and the connecting maps of short exact coefficient sequences.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Perfectoid limit of Huber’s Noetherian comparison

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-henselized-generic-comparison` (theorem)

Let R be p-torsion-free integral perfectoid with R=(R[1/p])°, and let G be a finite étale commutative group scheme of p-power order over R[1/p]. For every q≥0 the canonical pullback induces H^q_et(Spec(R[1/p]),G) ≅ H^q_et(Spa(R[1/p],R),G^an). The proof is the colimit of comparisons for Spec(R_j^h[1/p]) and Spa(R_j[1/p],R_j), using coherent-site continuity on the analytic side and L2 scheme continuity on the other side. No blanket Noetherian comparison is applied at the perfectoid limit.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/generic-henselization-scheme-continuity`, `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-hypercover-continuity`, `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-finite-stage-comparison-naturality`.

Proof outline:

1. Descend G to a generic henselized finite stage.
2. Take the filtered colimit of the natural finite-stage comparison squares.
3. Identify the left colimit by scheme continuity and the right colimit by perfectoid étale-site/hypercover continuity.

Acceptance: All degrees q≥0 and all finite commutative p-primary G, including nonconstant G, are retained. The proof visibly passes through R_j^h[1/p]; replacing it with R_j[1/p] is rejected. The only perfectoid input is the isolated completed-colimit/site descent interface.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### The same limit comparison in characteristic p

`ClassicalAdicEtaleCohomology:H1:henselian/equal-characteristic-perfectoid-comparison` (theorem)

For the tilt R^♭ and a chosen pseudouniformizer ϖ^♭, apply the same approximation and henselization argument to finite-type 𝔽_p[ϖ^♭]-models. For finite étale commutative p-primary G^♭ over R^♭[1/ϖ^♭], H^q(Spec(R^♭[1/ϖ^♭]),G^♭) ≅ H^q(Spa(R^♭[1/ϖ^♭],R^♭),G^{♭,an}) for all q≥0. Finite stages are henselized along ϖ^♭ and only then localized.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-henselized-generic-comparison`, `PerfectoidSpaces:P5`, `AdicCoefficientsAndComparisons:L2`.

Proof outline:

1. Repeat the finite-stage construction over 𝔽_p[ϖ^♭] with its common ideal (ϖ^♭).
2. Use the identical Noetherian comparison and coherent-site colimit argument; no mixed-characteristic assertion enters this repetition.

Acceptance: For the tilt R^♭ and a chosen pseudouniformizer ϖ^♭, apply the same approximation and henselization argument to finite-type 𝔽_p[ϖ^♭]-models. For finite étale commutative p-primary G^♭ over R^♭[1/ϖ^♭], H^q(Spec(R^♭[1/ϖ^♭]),G^♭) ≅ H^q(Spa(R^♭[1/ϖ^♭],R^♭),G^{♭,an}) for all q≥0. Finite stages are henselized along ϖ^♭ and only then localized.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Scheme cohomology comparison across tilting

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-scheme-cohomology-tilt-export` (application)

Under the hypotheses of the preceding mixed- and equal-characteristic comparisons, let G^♭ correspond to G under P5’s finite-étale tilting equivalence. Their cohomology groups H^q(Spec(R[1/p]),G) and H^q(Spec(R^♭[1/ϖ^♭]),G^♭) are canonically identified for q≥0 by passing to the two analytic étale sites and their tilting equivalence. This export is the cohomology step used in Česnavičius 4.10; it does not assert Brauer purity or vanishing of all such cohomology.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-henselized-generic-comparison`, `ClassicalAdicEtaleCohomology:H1:henselian/equal-characteristic-perfectoid-comparison`, `PerfectoidSpaces:P5`.

Proof outline:

1. Use the mixed-characteristic analytic comparison.
2. Apply the P5 étale-topos equivalence induced by tilting.
3. Invert the equal-characteristic analytic comparison.

Acceptance: Under the hypotheses of the preceding mixed- and equal-characteristic comparisons, let G^♭ correspond to G under P5’s finite-étale tilting equivalence. Their cohomology groups H^q(Spec(R[1/p]),G) and H^q(Spec(R^♭[1/ϖ^♭]),G^♭) are canonically identified for q≥0 by passing to the two analytic étale sites and their tilting equivalence. This export is the cohomology step used in Česnavičius 4.10; it does not assert Brauer purity or vanishing of all such cohomology.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### The perfectoid comparison is independent of its models

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-comparison-model-independence` (lemma)

The canonical comparison H^q(Spec(R[1/p]),G)→H^q(Spa(R[1/p],R),G^an) obtained through finite Noetherian henselized models is independent of the cofinal model system and the stage where G descends. A common refinement compares any two finite data and the natural finite-stage squares agree. Thus the proof gives the canonical pullback comparison rather than a choice-dependent isomorphism.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-henselized-generic-comparison`, `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-finite-stage-comparison-naturality`, `ClassicalAdicEtaleCohomology:H1:henselian/generic-henselization-scheme-continuity`, `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-hypercover-continuity`.

Proof outline:

1. Take a common cofinal filtered enlargement of the two model systems.
2. Use finite-presentation descent of G and naturality of the finite-stage comparisons.
3. Pass to colimits and identify both composites with pullback.

Acceptance: The canonical comparison H^q(Spec(R[1/p]),G)→H^q(Spa(R[1/p],R),G^an) obtained through finite Noetherian henselized models is independent of the cofinal model system and the stage where G descends. A common refinement compares any two finite data and the natural finite-stage squares agree. Thus the proof gives the canonical pullback comparison rather than a choice-dependent isomorphism.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

#### Coefficient compatibility of the perfectoid comparison

`ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-comparison-coefficient-exactness` (lemma)

The perfectoid generic scheme/adic cohomology comparison is natural in finite étale commutative p-primary G and commutes with the long exact sequences of short exact coefficient sequences. Both sides use the same descended finite-stage morphisms, while filtered colimits of abelian groups are exact. This coefficient compatibility concerns finite torsion groups and makes no inverse-limit ℤ_p assertion.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-comparison-model-independence`, `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-finite-stage-comparison-naturality`, `ClassicalAdicEtaleCohomology:H1:henselian/perfectoid-model-hypercover-continuity`, `ClassicalAdicEtaleCohomology:H1:henselian/generic-henselization-scheme-continuity`.

Proof outline:

1. Descend a finite coefficient sequence and its maps to a common henselized stage.
2. Use naturality and connecting-map compatibility of the finite-stage comparison.
3. Pass to exact filtered colimits.

Acceptance: The perfectoid generic scheme/adic cohomology comparison is natural in finite étale commutative p-primary G and commutes with the long exact sequences of short exact coefficient sequences. Both sides use the same descended finite-stage morphisms, while filtered colimits of abelian groups are exact. This coefficient compatibility concerns finite torsion groups and makes no inverse-limit ℤ_p assertion.

Sources: [Cesnavicius-BrauerPurity-2019](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf), §4.10, formulas (4.10.2)–(4.10.7), footnotes 2–4.

### H1:formal-adic-comparison: source additions

#### Canonical logarithmic structure of a semistable formal model

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-canonical-log-comparison` (comparison)

Let K be a finite extension of ℚ_p, ϖ a uniformizer and k its residue field. Let 𝔛 be a semistable formal O_K-scheme, or a base change of such a scheme from the integers of a subfield, with no quasi-compactness assumption. Import its canonical divisorial log structure M from CR.5. On étale formal opens U, M(U) consists of sections of O_𝔛(U) invertible on U_K; its groupification is identified with O(U_K)× as in CDN §2.1.1. The reduced special fibre Y carries the induced log structure relative to the log point (k,ℕ→k,1↦0). This node identifies the formal analytic carrier with the imported log carrier; it does not define log schemes again.

Prerequisites: `CrystallineCohomology:CR.5`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme`.

Proof outline:

1. Import semistable charts, the divisorial log structure, groupification and base-change compatibility from CR.5/R1.
2. Apply the semistable canonical-log identification used by CDN, citing Berkovich 1996 Theorem 2.3.1 as an explicit supplier interface.
3. Restrict the log structure to the special fibre and retain its map to the log point.

Acceptance: The generic-unit identification is sheafwise and compatible with étale formal restriction. The statement permits an infinite union of semistable charts.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Nearby-cycle sheaves on a semistable formal model

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-nearby-cycle-sheaves` (construction)

For 𝔛 as above, n≥1 and integer j, define R^iΨ_𝔛(ℤ/pⁿ(j)) on Y_et as the sheaf associated to U_0 ↦ H^i_et(U_K,ℤ/pⁿ(j)), where U→𝔛 ranges over étale formal schemes. This is the i-th derived functor of Berkovich’s nearby-cycle functor (denoted Θ in his Proposition 4.1). The formal and classical adic realizations are compared using the specialization and completion comparisons of this stage. These sheaves are nearby cycles; the vanishing-cycle cone is a separate object.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-canonical-log-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `ClassicalAdicEtaleCohomology:H0/tate-twists`.

Proof outline:

1. Use the equivalence of the formal étale site and the special-fibre site.
2. Sheafify the generic-fibre cohomology presheaf; identify it with the derived nearby-cycle construction.
3. Use the existing specialization/completion comparison to identify the classical adic realization, retaining its transport obligation.

API:

- `SemistableFormalNearbyCycles` (structure): The derived nearby-cycle sheaves R^iΨ_𝔛 ℤ/pⁿ(j) on Y_et.
- `SemistableFormalNearbyCycles.ofGenericCohomology` (constructor): Sheafification of generic-fibre cohomology on étale formal opens.
- `SemistableFormalNearbyCycles.restrict` (functoriality): Compatible with étale formal restriction and special-fibre restriction.
- `SemistableFormalNearbyCycles.coefficientMap` (functoriality): Reduction ℤ/pⁿ⁺¹(j)→ℤ/pⁿ(j) induces the corresponding nearby-cycle morphism.
- `SemistableFormalNearbyCycles.cup` (data): R^aΨ ℤ/pⁿ(j) ⊗ R^bΨ ℤ/pⁿ(l) → R^{a+b}Ψ ℤ/pⁿ(j+l).
- `SemistableFormalNearbyCycles.adicComparison` (compatibility): The specialization/completion comparison identifies this object with the classical adic realization.

Unit tests:

- `formalNearby_degreeZero` (computation): At degree zero, the sheaf is the sheafification of sections on U_K.
- `formalNearby_restriction` (compatibility): Computing on an étale formal U before or after restricting gives canonically the same sheaf.
- `formalNearby_notVanishing` (non-example): For a smooth model the degree-zero constant nearby sheaf is nonzero, whereas the corresponding vanishing-cycle cone has zero stalks.

Uses: CDN Theorem 2.4; H1 umbrella: The sheaves carry p-torsion Kummer symbols and the formal Bloch–Kato–Hyodo filtration..

Acceptance: For 𝔛 as above, n≥1 and integer j, define R^iΨ_𝔛(ℤ/pⁿ(j)) on Y_et as the sheaf associated to U_0 ↦ H^i_et(U_K,ℤ/pⁿ(j)), where U→𝔛 ranges over étale formal schemes. This is the i-th derived functor of Berkovich’s nearby-cycle functor (denoted Θ in his Proposition 4.1). The formal and classical adic realizations are compared using the specialization and completion comparisons of this stage. These sheaves are nearby cycles; the vanishing-cycle cone is a separate object.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Kummer symbols in formal nearby cycles

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycle-kummer-symbol` (construction)

For n≥1 the Kummer boundary on U_K induces a sheaf morphism i^*M^gp → R¹Ψ ℤ/pⁿ(1). Its q-fold cup product, q≥0, defines sym_q : i^*(M^gp)^{⊗q} → R^qΨ ℤ/pⁿ(q), with tensor power over ℤ and sym_0 the unit. Write {a_1,…,a_q} for its value. The maps are multiplicative in each unit, compatible with étale restriction and coefficient reduction, and graded commutative in the cohomology factors. This node constructs symbols without presupposing that they generate all nearby cycles.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-nearby-cycle-sheaves`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-canonical-log-comparison`, `ClassicalAdicEtaleCohomology:H0/kummer-sequence`.

Proof outline:

1. Use p invertible on the generic fibre to apply the finite-level Kummer sequence.
2. Replace generic units by the canonical formal log groupification.
3. Cup the degree-one boundaries and sheafify; naturality of Kummer gives restriction and reduction compatibility.

API:

- `FormalNearbySymbol` (structure): The morphisms sym_q for all n≥1 and q≥0.
- `FormalNearbySymbol.unitBoundary` (constructor): The degree-one Kummer boundary of a section of i^*M^gp.
- `FormalNearbySymbol.symbol` (constructor): The q-fold cup-product symbol.
- `FormalNearbySymbol.multilinear` (relation): Multiplication in a slot becomes addition of symbols.
- `FormalNearbySymbol.restrict` (functoriality): Symbols commute with étale formal restriction.
- `FormalNearbySymbol.reduce` (compatibility): Coefficient reduction sends a pⁿ⁺¹-symbol to the corresponding pⁿ-symbol.

Unit tests:

- `formalSymbol_one` (computation): A symbol with a slot equal to 1 is zero in positive degree.
- `formalSymbol_pthPower` (computation): At level p, a slot which is a p-th power gives a zero symbol.
- `formalSymbol_degreeZero` (degenerate): The empty symbol is the unit in R⁰Ψℤ/pⁿ.
- `formalSymbol_reduction` (compatibility): The degree-one boundary commutes with reduction from p² to p.

Uses: CDN §2.1.1, Theorem 2.4: Principal units and uniformizer symbols define U/V and its maps to logarithmic differentials..

Acceptance: For n≥1 the Kummer boundary on U_K induces a sheaf morphism i^*M^gp → R¹Ψ ℤ/pⁿ(1). Its q-fold cup product, q≥0, defines sym_q : i^*(M^gp)^{⊗q} → R^qΨ ℤ/pⁿ(q), with tensor power over ℤ and sym_0 the unit. Write {a_1,…,a_q} for its value. The maps are multiplicative in each unit, compatible with étale restriction and coefficient reduction, and graded commutative in the cohomology factors. This node constructs symbols without presupposing that they generate all nearby cycles.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Symbols factor through the mod-p-squared log model

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-symbols-mod-p-squared` (lemma)

Put (𝔛₂,M₂)=(𝔛,M) modulo p². The mod-p nearby-cycle symbols used in CDN §2.1.1 factor through i^*(M₂^gp)^{⊗q}; changing a lift by a section congruent to 1 modulo p² does not change its mod-p Kummer class. This supplies the actual domain of the U/V filtration, without replacing the whole generic fibre by its special fibre.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycle-kummer-symbol`, `CrystallineCohomology:CR.5`.

Proof outline:

1. Use the p-adic root/Hensel argument locally on generic fibres for units congruent to 1 modulo p².
2. Pass to cup symbols and the reduced log groupification.

Acceptance: Put (𝔛₂,M₂)=(𝔛,M) modulo p². The mod-p nearby-cycle symbols used in CDN §2.1.1 factor through i^*(M₂^gp)^{⊗q}; changing a lift by a section congruent to 1 modulo p² does not change its mod-p Kummer class. This supplies the actual domain of the U/V filtration, without replacing the whole generic fibre by its special fibre.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### The formal Bloch–Kato–Hyodo filtration

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bloch-kato-hyodo-filtration` (definition); planet **Bloch–Kato–Hyodo filtration**

Fix q≥0 and put A=M₂^gp on the special étale site. Define U⁰=A^{⊗q}. For q=0 put U^{m+1}=V^m=0 for m≥0. For q=1 put V⁰=(1+ϖO_𝔛₂)·ϖ^ℤ, U^m=1+ϖ^mO_𝔛₂ for m≥1, and V^m=U^{m+1} for m≥1. For q≥2 let U^m be the image of U^m(A)⊗A^{⊗(q−1)}; let V^m be the sum of U^{m+1} and the image of U^m(A)⊗A^{⊗(q−2)}⊗ϖ^ℤ. Apply sym_q to define image subsheaves U^m,V^m of R^qΨℤ/p(q), giving …⊂U²⊂V¹⊂U¹⊂V⁰⊂U⁰. Tensor powers, sums and images are sheaf operations, not pointwise quotients of presheaves.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-symbols-mod-p-squared`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycle-kummer-symbol`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`.

Proof outline:

1. Construct principal-unit and uniformizer subsheaves on the mod-p² log model.
2. Use the degree-dependent tensor formulas, including the independent q=0 and q=1 cases.
3. Take sheaf images under sym_q and prove the displayed inclusions locally.

API:

- `FormalBKHFiltration` (structure): The U/V filtration on symbol tensors and on their nearby-cycle images.
- `FormalBKHFiltration.principalUnits` (constructor): The subsheaf 1+ϖ^mO_𝔛₂ for m≥1.
- `FormalBKHFiltration.U` (projection): The m-th principal-unit image subsheaf.
- `FormalBKHFiltration.V` (projection): The uniformizer-symbol subsheaf plus U^{m+1}, with the q=1 special convention.
- `FormalBKHFiltration.interleaving` (relation): U^{m+1}⊂V^m⊂U^m.
- `FormalBKHFiltration.restrict` (functoriality): The filtration and image subsheaves commute with étale restriction.
- `FormalBKHFiltration.graded` (constructor): Sheaf quotients U^m/V^m and V^m/U^{m+1}.

Unit tests:

- `formalBKH_degreeZero` (degenerate): For q=0 all positive unit levels and all V-levels are zero.
- `formalBKH_degreeOne` (computation): For q=1 and m≥1, V^m/U^{m+1}=0 by definition.
- `formalBKH_uniformizer` (computation): The uniformizer symbol belongs to V⁰ in degree one.
- `formalBKH_image` (non-example): The symbol-tensor filtration is not asserted injective into nearby cycles; the latter filtration consists of images.

Uses: CDN Theorem 2.4; local calculations in Drinfeld cohomology: Its associated graded is expressed by log differential sheaves, including both p-divisibility cases..

Acceptance: Fix q≥0 and put A=M₂^gp on the special étale site. Define U⁰=A^{⊗q}. For q=0 put U^{m+1}=V^m=0 for m≥0. For q=1 put V⁰=(1+ϖO_𝔛₂)·ϖ^ℤ, U^m=1+ϖ^mO_𝔛₂ for m≥1, and V^m=U^{m+1} for m≥1. For q≥2 let U^m be the image of U^m(A)⊗A^{⊗(q−1)}; let V^m be the sum of U^{m+1} and the image of U^m(A)⊗A^{⊗(q−2)}⊗ϖ^ℤ. Apply sym_q to define image subsheaves U^m,V^m of R^qΨℤ/p(q), giving …⊂U²⊂V¹⊂U¹⊂V⁰⊂U⁰. Tensor powers, sums and images are sheaf operations, not pointwise quotients of presheaves.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Log differential sheaves used by the formal filtration

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface` (comparison)

Import Ω^q_{Y/k}, its differential d, B^q=im(d:Ω^{q−1}→Ω^q), Z^q=ker(d:Ω^q→Ω^{q+1}), and the additive logarithmic subsheaf Ω^q_log generated by wedges of dlog sections of M_Y from CR.5. Use Ω^r=B^r=Z^r=Ω^r_log=0 for r<0. The formal BKH comparison is with sheaf quotients Ω/B and Ω/Z; Ω_log is an additive subsheaf and is not asserted to be an O_Y-submodule.

Prerequisites: `CrystallineCohomology:CR.5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-canonical-log-comparison`.

Proof outline:

1. Transport CR.5 log differentials to the canonical special-fibre log carrier.
2. Use sheaf images and kernels for B and Z, and additive generation for Ω_log.
3. Fix negative-degree conventions before stating q=0 and q=1 graded pieces.

Acceptance: Import Ω^q_{Y/k}, its differential d, B^q=im(d:Ω^{q−1}→Ω^q), Z^q=ker(d:Ω^q→Ω^{q+1}), and the additive logarithmic subsheaf Ω^q_log generated by wedges of dlog sections of M_Y from CR.5. Use Ω^r=B^r=Z^r=Ω^r_log=0 for r<0. The formal BKH comparison is with sheaf quotients Ω/B and Ω/Z; Ω_log is an additive subsheaf and is not asserted to be an O_Y-submodule.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Local algebraization of semistable formal charts

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-local-algebraization` (lemma)

Étale locally on 𝔛, a semistable formal chart is the completion of a semistable O_K-scheme T, with the same reduced special fibre Y and the same induced canonical log structure modulo p². The charts may be chosen independently on an infinite covering; no global algebraization or global finite covering is needed.

Prerequisites: `AdicSpacesPartII:R1`, `CrystallineCohomology:CR.5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-canonical-log-comparison`.

Proof outline:

1. Use the semistable standard chart and its algebraic counterpart.
2. Descend the étale chart morphism to an algebraic étale neighbourhood using the formal geometry supplier.
3. Compare completion, special fibre and log reductions on each chart.

Acceptance: Étale locally on 𝔛, a semistable formal chart is the completion of a semistable O_K-scheme T, with the same reduced special fibre Y and the same induced canonical log structure modulo p². The charts may be chosen independently on an infinite covering; no global algebraization or global finite covering is needed.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Completion comparison respects Kummer symbols

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-symbol-comparison` (comparison)

On a chart 𝔛=Ť with j:T_K→T and i:Y→T, the natural completion morphism i^*R^qj_*ℤ/p(q) → R^qΨ_𝔛ℤ/p(q) is an isomorphism. It commutes with Kummer symbols from the common log model modulo p², and with restriction to smaller charts. This is CDN (2.5), using Berkovich 1994 Theorem 5.1; its classical adic realization uses this stage’s completion comparison, with the remaining transport proof recorded separately.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-local-algebraization`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycle-kummer-symbol`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`.

Proof outline:

1. Use the natural completion comparison, not an abstract cohomology isomorphism.
2. Apply naturality of the Kummer boundary and cup product to the common units.
3. Sheafify the resulting commuting symbol square.

Acceptance: On a chart 𝔛=Ť with j:T_K→T and i:Y→T, the natural completion morphism i^*R^qj_*ℤ/p(q) → R^qΨ_𝔛ℤ/p(q) is an isomorphism. It commutes with Kummer symbols from the common log model modulo p², and with restriction to smaller charts. This is CDN (2.5), using Berkovich 1994 Theorem 5.1; its classical adic realization uses this stage’s completion comparison, with the remaining transport proof recorded separately.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Completion carries the algebraic U/V filtration to the formal one

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison` (lemma)

Under the completion comparison on a local algebraized chart, the algebraic principal-unit and uniformizer symbol images U^m,V^m are identified with the formal U^m,V^m for every m and q. The identification uses the common mod-p² log reduction and thus identifies each associated graded sheaf and its differential-symbol morphism.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-symbol-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bloch-kato-hyodo-filtration`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`.

Proof outline:

1. Compare principal-unit and uniformizer subsheaves on the shared log reduction.
2. Take images in the natural symbol square; use the nearby-cycle isomorphism.
3. Pass to sheaf quotients and retain the induced maps on generators.

Acceptance: Under the completion comparison on a local algebraized chart, the algebraic principal-unit and uniformizer symbol images U^m,V^m are identified with the formal U^m,V^m for every m and q. The identification uses the common mod-p² log reduction and thus identifies each associated graded sheaf and its differential-symbol morphism.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### The zero-level BKH graded pieces

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-graded-pieces` (theorem)

For every q≥0, U⁰/V⁰ ≅ Ω^q_{Y/k,log} and V⁰/U¹ ≅ Ω^{q−1}_{Y/k,log}. The first sends {a₁,…,a_q} to ∧dlog(a_i); the second sends {a₁,…,a_{q−1},ϖ} to ∧dlog(a_i). These are isomorphisms of additive étale sheaves, with negative-degree terms zero. In particular the q=0 first piece is the constant ℤ/p logarithmic degree-zero sheaf.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`, `CrystallineCohomology:CR.5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-symbol-maps`.

Proof outline:

1. Import the algebraic BKH zero-level theorem on each semistable chart from the proposed supplier recorded in the gap.
2. Use the commuting symbol diagram and completion comparison to obtain the formal isomorphisms.
3. Glue the canonical generator maps on overlaps.

Acceptance: For every q≥0, U⁰/V⁰ ≅ Ω^q_{Y/k,log} and V⁰/U¹ ≅ Ω^{q−1}_{Y/k,log}. The first sends {a₁,…,a_q} to ∧dlog(a_i); the second sends {a₁,…,a_{q−1},ϖ} to ∧dlog(a_i). These are isomorphisms of additive étale sheaves, with negative-degree terms zero. In particular the q=0 first piece is the constant ℤ/p logarithmic degree-zero sheaf.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### BKH graded pieces at indices prime to p

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-prime-to-p-graded-pieces` (theorem)

Let e=v_K(p), q≥0 and m be an integer with 0<m<pe/(p−1) and p∤m. Then U^m/V^m ≅ Ω^{q−1}_{Y/k}/B^{q−1}_{Y/k} and V^m/U^{m+1} ≅ Ω^{q−2}_{Y/k}/Z^{q−2}_{Y/k}. The first sends {1+ϖ^m x,a₁,…,a_{q−1}} to x̄∧dlog(a_i); the second sends {1+ϖ^m x,a₁,…,a_{q−2},ϖ} to x̄∧dlog(a_i). Bounds are strict and quotients are additive sheaf quotients.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`, `CrystallineCohomology:CR.5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-positive-symbol-maps`.

Proof outline:

1. Import the algebraic BKH theorem at p∤m under its strict ramification bound.
2. Transport its generator maps through the common mod-p² symbols.
3. Glue locally computed isomorphisms.

Acceptance: For q=1 the second quotient is zero, consistent with V^m=U^{m+1}. The first denominator is B, not Z, when p∤m.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### BKH graded pieces at indices divisible by p

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-p-divisible-graded-pieces` (theorem)

For q≥0 and 0<m<pe/(p−1) with p|m, U^m/V^m ≅ Ω^{q−1}_{Y/k}/Z^{q−1}_{Y/k}, and V^m/U^{m+1} ≅ Ω^{q−2}_{Y/k}/Z^{q−2}_{Y/k}, via the same principal-unit and uniformizer symbol formulas as in the prime-to-p case. The first denominator changes from exact forms B to closed forms Z.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`, `CrystallineCohomology:CR.5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-positive-symbol-maps`.

Proof outline:

1. Import the algebraic BKH p-divisible-index theorem with its changed denominator.
2. Transport the generator maps and kernels through the completion comparison.
3. Glue the resulting sheaf isomorphisms.

Acceptance: The formula distinguishes p|m from p∤m rather than applying a uniform B-denominator. For q=0 both displayed negative-degree quotients vanish.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### The BKH ramification cutoff

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-ramification-cutoff` (theorem)

For integer m≥pe/(p−1), U^m(R^qΨ_𝔛ℤ/p(q))=0 for every q≥0, in the étale sheaf sense, as stated in CDN Theorem 2.4(4). At an integral endpoint m=pe/(p−1), this is an étale-local assertion, not a claim that every principal unit over the original non-separably-closed residue field is already a p-th power. The endpoint is part of the imported algebraic BKH input and must be checked with its étale-local residue-field convention.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `CrystallineCohomology:CR.5`.

Proof outline:

1. Use the algebraic cutoff theorem, including its endpoint convention, on each algebraized chart.
2. Transfer the zero image under completion and symbols.
3. Use locality of a zero sheaf.

Acceptance: For integer m≥pe/(p−1), U^m(R^qΨ_𝔛ℤ/p(q))=0 for every q≥0, in the étale sheaf sense, as stated in CDN Theorem 2.4(4). At an integral endpoint m=pe/(p−1), this is an étale-local assertion, not a claim that every principal unit over the original non-separably-closed residue field is already a p-th power. The endpoint is part of the imported algebraic BKH input and must be checked with its étale-local residue-field convention.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### BKH graded descriptions on non-quasi-compact formal schemes

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-non-quasi-compact-descent` (theorem)

The four graded-description and cutoff statements hold on any semistable 𝔛 allowed above, including non-quasi-compact 𝔛. The isomorphisms are defined by the displayed symbols and logarithmic differential maps, so they agree on pairwise overlaps of any semistable étale chart covering. An isomorphism or vanishing of étale sheaves can be checked locally; no cohomology continuity over an infinite union is used here.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-prime-to-p-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-p-divisible-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-ramification-cutoff`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-nearby-cycle-sheaves`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-etale-restriction`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-chart-independence`.

Proof outline:

1. Use the canonical formulas to identify both restrictions on an overlap.
2. Glue the morphisms of sheaves over the full chart covering.
3. Check kernels and cokernels locally to establish isomorphism, and check U^m locally for the cutoff.

Acceptance: The four graded-description and cutoff statements hold on any semistable 𝔛 allowed above, including non-quasi-compact 𝔛. The isomorphisms are defined by the displayed symbols and logarithmic differential maps, so they agree on pairwise overlaps of any semistable étale chart covering. An isomorphism or vanishing of étale sheaves can be checked locally; no cohomology continuity over an infinite union is used here.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Zero-level logarithmic symbol maps

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-symbol-maps` (construction)

Construct the additive maps U⁰/V⁰→Ω^q_log and V⁰/U¹→Ω^{q−1}_log using {a₁,…,a_q}↦∧dlog(a_i) and {a₁,…,a_{q−1},ϖ}↦∧dlog(a_i). They are defined on nearby-cycle image quotients by the algebraic BKH relations transported under completion, not merely on formal symbol tensors.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`, `CrystallineCohomology:CR.5`.

Proof outline:

1. Use the algebraic symbol relations to kill the kernels and the relevant V/U subgroups.
2. Transport through the common log reduction and completion.
3. Glue the canonical maps on semistable charts.

API:

- `FormalBKHZeroSymbolMaps` (structure): The two zero-level maps on nearby-cycle image quotients.
- `FormalBKHZeroSymbolMaps.unit` (projection): The map U⁰/V⁰→Ω^q_log.
- `FormalBKHZeroSymbolMaps.uniformizer` (projection): The map V⁰/U¹→Ω^{q−1}_log.
- `FormalBKHZeroSymbolMaps.restrict` (functoriality): Both maps commute with étale chart restriction.

Unit tests:

- `bkhZero_emptyWedge` (computation): For q=0 the empty wedge is the degree-zero unit.
- `bkhZero_oneUnit` (computation): A symbol with a unit 1 maps to zero in positive degree.
- `bkhZero_uniformizer` (computation): In degree one the uniformizer symbol maps to 1 in Ω⁰_log.

Uses: CDN Theorem 2.4(1): Supplies actual canonical morphisms whose isomorphism is proved by the zero-level theorem..

Acceptance: Construct the additive maps U⁰/V⁰→Ω^q_log and V⁰/U¹→Ω^{q−1}_log using {a₁,…,a_q}↦∧dlog(a_i) and {a₁,…,a_{q−1},ϖ}↦∧dlog(a_i). They are defined on nearby-cycle image quotients by the algebraic BKH relations transported under completion, not merely on formal symbol tensors.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Positive-level differential symbol maps

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-positive-symbol-maps` (construction)

For 0<m<pe/(p−1), map the principal-unit generator {1+ϖ^m x,a₁,…} to x̄∧dlog(a_i), and the generator ending in ϖ to the corresponding wedge one degree lower. On U^m/V^m the target is Ω^{q−1}/B^{q−1} if p∤m and Ω^{q−1}/Z^{q−1} if p|m; on V^m/U^{m+1} it is Ω^{q−2}/Z^{q−2} in both cases. Use the imported algebraic relations to make these maps independent of the symbol presentation and lifts.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`, `CrystallineCohomology:CR.5`.

Proof outline:

1. Verify lift independence using the mod-p² model and the algebraic BKH relations.
2. Use the p-divisibility-specific differential quotient to kill the appropriate kernel.
3. Transfer and glue the quotient maps.

API:

- `FormalBKHPositiveSymbolMaps` (structure): The two positive-level quotient maps with their p-divisibility-specific targets.
- `FormalBKHPositiveSymbolMaps.principal` (projection): The U^m/V^m map on principal-unit generators.
- `FormalBKHPositiveSymbolMaps.uniformizer` (projection): The V^m/U^{m+1} map on uniformizer-ending generators.
- `FormalBKHPositiveSymbolMaps.liftIndependent` (relation): The maps depend only on the quotient symbol, not on chosen lifts.
- `FormalBKHPositiveSymbolMaps.restrict` (functoriality): Compatibility with étale chart restriction.

Unit tests:

- `bkhPositive_zeroCoefficient` (computation): A principal-unit generator with x̄=0 maps to zero.
- `bkhPositive_degreeOne` (degenerate): At q=1 the second map has zero source and negative-degree target.
- `bkhPositive_divisibility` (compatibility): The first target switches from Ω/B to Ω/Z precisely when p divides m.

Uses: CDN Theorem 2.4(2)–(3): Makes the generator formulas actual well-defined sheaf morphisms before their bijectivity is asserted..

Acceptance: For 0<m<pe/(p−1), map the principal-unit generator {1+ϖ^m x,a₁,…} to x̄∧dlog(a_i), and the generator ending in ϖ to the corresponding wedge one degree lower. On U^m/V^m the target is Ω^{q−1}/B^{q−1} if p∤m and Ω^{q−1}/Z^{q−1} if p|m; on V^m/U^{m+1} it is Ω^{q−2}/Z^{q−2} in both cases. Use the imported algebraic relations to make these maps independent of the symbol presentation and lifts.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Étale locality of the formal symbol filtration

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-etale-restriction` (lemma)

For an étale formal map 𝔘→𝔛, pulling back M₂, nearby cycles and their symbol images carries U^m,V^m to the corresponding filtration on 𝔘. The canonical differential-symbol quotient maps also pull back. This is the locality used to pass from algebraizable charts to a non-quasi-compact semistable model.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bloch-kato-hyodo-filtration`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-symbol-maps`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-positive-symbol-maps`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-formal-nearby-cycle-sheaves`, `CrystallineCohomology:CR.5`.

Proof outline:

1. Use the étale pullback of the common log model and nearby-cycle presheaves.
2. Exact inverse image preserves images, sums and quotient sheaves.
3. Check the symbol and dlog formulas on generators.

Acceptance: For an étale formal map 𝔘→𝔛, pulling back M₂, nearby cycles and their symbol images carries U^m,V^m to the corresponding filtration on 𝔘. The canonical differential-symbol quotient maps also pull back. This is the locality used to pass from algebraizable charts to a non-quasi-compact semistable model.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Degree-zero BKH acceptance case

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-degree-zero` (application)

For q=0, the mod-p nearby-cycle unit sheaf is ℤ/p, U⁰/V⁰≅Ω⁰_log=ℤ/p, and all other U/V pieces vanish by the degree-zero definition. The first symbol map sends the empty symbol to 1. This case tests the tensor-zero and negative-degree conventions of the full theorem.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bloch-kato-hyodo-filtration`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-symbol-maps`.

Proof outline:

1. Apply the independent q=0 filtration definition.
2. Identify the empty Kummer symbol and empty dlog wedge with the unit.

Acceptance: For q=0, the mod-p nearby-cycle unit sheaf is ℤ/p, U⁰/V⁰≅Ω⁰_log=ℤ/p, and all other U/V pieces vanish by the degree-zero definition. The first symbol map sends the empty symbol to 1. This case tests the tensor-zero and negative-degree conventions of the full theorem.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Degree-one BKH acceptance case

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-degree-one` (application)

For q=1 and positive m, V^m/U^{m+1}=0. The first quotient is O_Y/B⁰=O_Y when p∤m and O_Y/Z⁰ when p|m, since B⁰=0 and Z⁰=ker(d:O_Y→Ω¹). At level zero, the uniformizer symbol gives V⁰/U¹≅Ω⁰_log. This simultaneously tests the q=1 filtration convention and the distinction between B and Z.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-prime-to-p-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-p-divisible-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-log-differential-interface`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bloch-kato-hyodo-filtration`.

Proof outline:

1. Specialize the degree formulas using negative-degree zero terms.
2. Use the imported log differential definitions of B⁰ and Z⁰.

Acceptance: For q=1 and positive m, V^m/U^{m+1}=0. The first quotient is O_Y/B⁰=O_Y when p∤m and O_Y/Z⁰ when p|m, since B⁰=0 and Z⁰=ker(d:O_Y→Ω¹). At level zero, the uniformizer symbol gives V⁰/U¹≅Ω⁰_log. This simultaneously tests the q=1 filtration convention and the distinction between B and Z.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### The integer cutoff in the formal filtration

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-integer-cutoff` (application)

For integer indices, the vanishing theorem says U^m=0 for m≥ceil(pe/(p−1)); the positive graded formulas are used only for integers strictly below pe/(p−1). If the threshold is integral, its endpoint is excluded from both positive formulas and included in the vanishing theorem. This arithmetic restatement preserves the étale-local endpoint convention.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-ramification-cutoff`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-prime-to-p-graded-pieces`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-p-divisible-graded-pieces`.

Proof outline:

1. Translate the real/rational strict bound into the integer-indexed filtration.
2. Separate the integral endpoint from the positive-index formulas.

Acceptance: For integer indices, the vanishing theorem says U^m=0 for m≥ceil(pe/(p−1)); the positive graded formulas are used only for integers strictly below pe/(p−1). If the threshold is integral, its endpoint is excluded from both positive formulas and included in the vanishing theorem. This arithmetic restatement preserves the étale-local endpoint convention.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Independence of the algebraizing chart

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-chart-independence` (lemma)

Two local algebraizations of a semistable formal model induce the same BKH differential-symbol morphisms on their overlap. Both are the canonical map on the common mod-p² log symbols; after a common étale refinement their maps agree on generators, hence on the nearby-cycle image quotients. No chosen global algebraization enters the resulting formal theorem.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-symbol-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/semistable-algebraic-formal-filtration-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-zero-symbol-maps`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-positive-symbol-maps`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-etale-restriction`.

Proof outline:

1. Pass to a common semistable étale refinement.
2. Compare the canonical Kummer and dlog maps on the common log reduction.
3. Use surjectivity from symbol tensors onto the image quotients to conclude equality.

Acceptance: Two local algebraizations of a semistable formal model induce the same BKH differential-symbol morphisms on their overlap. Both are the canonical map on the common mod-p² log symbols; after a common étale refinement their maps agree on generators, hence on the nearby-cycle image quotients. No chosen global algebraization enters the resulting formal theorem.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

#### Base-change naturality of the completion comparison

`ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-base-change-naturality` (lemma)

For a morphism of completion data (X,Y)→(X′,Y′) of 3.5.12 taking the closed subscheme Y into Y′, the square formed by the canonical pullback/base-change transformations and the comparison i^*R⁺j_*K→R⁺b_*a^*K commutes, starting from any bounded-below torsion K on the target generic site and its pullback on the source. The comparison is natural both in K and in the morphism of completion data. Base-change arrows here are the canonical transformations; they are not asserted to be isomorphisms for every map. The same statement restricts to microbial valuation bases and support subsets in 3.5.16.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-map-3-5-13-i`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Write the comparison as the mate of the commuting square of inverse-image/site functors used in its construction.
2. Import D0’s coherence of units, counits and base-change mates under composition of squares.
3. Apply that coherence to the square of completion data and then restrict to the microbial support.

Acceptance: The square uses canonical base-change maps even when those maps are not invertible. The actual comparison map is preserved; an abstract group isomorphism is insufficient.

Sources: [Huber-EtaleCohomology-1996](https://link.springer.com/book/10.1007/978-3-663-09991-8), 3.5.12–3.5.13(i), 3.5.16.

### H1: source additions

#### Semistable formal nearby cycles and BKH compatibility

`ClassicalAdicEtaleCohomology:H1/semistable-formal-bkh-export` (comparison)

H1 re-exports the semistable formal nearby-cycle sheaves, Kummer symbols and non-quasi-compact BKH theorem from H1:formal-adic-comparison. At coefficients prime to p it also uses the existing LPV.0 trait comparison. The p-torsion BKH export is the formal nearby-cycle theorem above and does not assert that LPV.0 already owns p-torsion log nearby cycles or that they are the vanishing-cycle cone.

Prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-bkh-non-quasi-compact-descent`, `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles`.

Proof outline:

1. Re-export the formal substage nodes by their actual identifiers.
2. Keep the coefficient hypotheses of the LPV comparison distinct from the p-torsion symbol theorem.

Acceptance: H1 re-exports the semistable formal nearby-cycle sheaves, Kummer symbols and non-quasi-compact BKH theorem from H1:formal-adic-comparison. At coefficients prime to p it also uses the existing LPV.0 trait comparison. The p-torsion BKH export is the formal nearby-cycle theorem above and does not assert that LPV.0 already owns p-torsion log nearby cycles or that they are the vanishing-cycle cone.

Sources: [ColmezDospinescuNiziol-DrinfeldFactorisation-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §2.1.1, pp. 22–24, Theorem 2.4 and proof.

### H3: source additions

#### Taut rigid spaces and their Berkovich realization

`ClassicalAdicEtaleCohomology:H3/taut-adic-berkovich-geometry-interface` (comparison)

For a complete nontrivially rank-one valued field K and a taut rigid K-space X over Spa(K,O_K), import the equivalence with Hausdorff strictly K-analytic Berkovich spaces and write u(X)=X_max for its maximal Hausdorff quotient. For partially proper f, u(f) is boundaryless; for proper f it is proper; étale f gives a quasi-étale u(f), smooth f gives a quasi-smooth u(f), and adding partial properness makes these étale and smooth respectively. These are the precise geometry interfaces of Zavyalov A.6–A.11, supplied by R0/R1 rather than a second construction here.

Prerequisites: `AdicSpacesPartII:R0`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`, `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`.

Proof outline:

1. Import the maximal Hausdorff quotient and the taut/Hausdorff equivalence.
2. Import the boundaryless comparison via reductions of analytic germs, and the proper comparison via formal models.
3. For étale/smooth maps combine quasi-étale/quasi-smooth with boundarylessness.

Acceptance: The plus ring is O_K; this interface does not cover arbitrary higher-rank C⁺. The smooth and étale conclusions retain partial properness.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Proper-support direct images preserve overconvergence

`ClassicalAdicEtaleCohomology:H3/overconvergent-proper-support-preservation` (theorem)

For a partially proper morphism f of rigid K-spaces and overconvergent abelian F, every R^if_!F is overconvergent. In particular R^{2d}f_!Λ(d) and Λ_Y are overconvergent, permitting the maximal-stalk test in the trace construction. For partially proper étale f, f_! restricts to the overconvergent categories and remains left adjoint to f^* there.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves`, `ClassicalAdicEtaleCohomology:H0/overconvergent-pullback-preservation`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`.

Proof outline:

1. Use Huber 8.2.4 as explicitly cited in Zavyalov §5.3/A.19; its proof remains a recorded source gap.
2. In the étale case restrict the existing (f_!,f^*) adjunction to the preserved full subcategories.

Acceptance: For a partially proper morphism f of rigid K-spaces and overconvergent abelian F, every R^if_!F is overconvergent. In particular R^{2d}f_!Λ(d) and Λ_Y are overconvergent, permitting the maximal-stalk test in the trace construction. For partially proper étale f, f_! restricts to the overconvergent categories and remains left adjoint to f^* there.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Adic–Berkovich comparison with proper support

`ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison` (comparison)

For a partially proper f:X→Y between taut rigid K-spaces and F∈D⁺(u(X)_et,s,ℤ), there is a natural isomorphism α_f(F):Rf_!θ_X^*F ≅ θ_Y^*Ru(f)_!F. This is Zavyalov Theorem A.15, importing Huber 8.3.6. Its domain is a complex of Berkovich sheaves and its adic inverse image; the statement does not cover an arbitrary non-overconvergent complex on X.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/taut-adic-berkovich-geometry-interface`, `ClassicalAdicEtaleCohomology:H0/taut-adic-berkovich-site-morphism`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Use boundarylessness of u(f) supplied by the geometry comparison.
2. Construct the natural support comparison on the sites and import Huber 8.3.6 for its isomorphism.
3. Pass to D⁺ using exact θ^* and the compatible derived proper-support functors.

Acceptance: The morphism is natural in F and in the partially proper map, with source and target written in the stated direction. Arbitrary plus rings C⁺≠O_C and arbitrary adic sheaves are not silently included.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Comparison preserves the étale trace counit

`ClassicalAdicEtaleCohomology:H3/berkovich-etale-counit-comparison` (lemma)

For partially proper étale f:X→Y between taut rigid spaces and G∈Ab(u(Y)_et,s), the diagram comparing θ_Y^*(u(f)_!u(f)^*G→G) with f_!f^*θ_Y^*G→θ_Y^*G commutes via α_f(u(f)^*G) and θ-naturality. This is Zavyalov A.19, and fixes the degree-zero normalization used by the general trace.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H0/berkovich-overconvergent-sheaf-equivalence`, `ClassicalAdicEtaleCohomology:H0/overconvergent-pullback-preservation`, `ClassicalAdicEtaleCohomology:H3/overconvergent-proper-support-preservation`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases`.

Proof outline:

1. Both f^* and f_! preserve overconvergence.
2. Use the equivalences with Berkovich sheaves to identify the restricted adjunctions.
3. Uniqueness of the adjunction counit gives the commutative diagram.

Acceptance: For partially proper étale f:X→Y between taut rigid spaces and G∈Ab(u(Y)_et,s), the diagram comparing θ_Y^*(u(f)_!u(f)^*G→G) with f_!f^*θ_Y^*G→θ_Y^*G commutes via α_f(u(f)^*G) and θ-naturality. This is Zavyalov A.19, and fixes the degree-zero normalization used by the general trace.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Relative pure dimension for the trace

`ClassicalAdicEtaleCohomology:H3/relative-pure-dimension-interface` (comparison)

Import dimension of a locally spectral space as the supremum of lengths of strict specialization chains, pure dimension d as dimension d on every nonempty open, and dim(f)=sup_y dim(f⁻¹(y)) from R0/R1. A morphism has relative pure dimension d when every nonempty fibre has pure dimension d. Smooth partially proper rigid morphisms of relative pure dimensions d,e compose in dimension d+e. These are geometry data, not a new cohomological definition; empty fibres do not become a surjectivity hypothesis.

Prerequisites: `AdicSpacesPartII:R0`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H3/taut-adic-berkovich-geometry-interface`.

Proof outline:

1. Identify the geometry supplier’s dimensions with Zavyalov Definition 5.3.1.
2. Import smooth fibre dimension and its composition rule.
3. Record the empty-fibre convention separately from the subsequent nonempty-fibre condition.

Acceptance: Import dimension of a locally spectral space as the supremum of lengths of strict specialization chains, pure dimension d as dimension d on every nonempty open, and dim(f)=sup_y dim(f⁻¹(y)) from R0/R1. A morphism has relative pure dimension d when every nonempty fibre has pure dimension d. Smooth partially proper rigid morphisms of relative pure dimensions d,e compose in dimension d+e. These are geometry data, not a new cohomological definition; empty fibres do not become a surjectivity hypothesis.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### The 2d proper-support bound for rigid morphisms

`ClassicalAdicEtaleCohomology:H3/partially-proper-relative-dimension-vanishing` (theorem)

For a partially proper morphism f of rigid K-spaces of relative pure dimension d and any abelian Λ=ℤ/n-sheaf F, R^if_!F=0 for i>2d. This is Zavyalov Lemma 5.3.2, whose proof cites Huber 5.3.11 and 1.8.7. It is the dimensional bound required by the trace’s top-degree Leray isomorphism, and is recorded separately from the packet’s more restricted relative-ball and general compactifiable-map bounds.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/relative-pure-dimension-interface`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`.

Proof outline:

1. Apply Huber’s fibre cohomological-dimension bound and the relative dimension comparison cited in the public lemma.
2. Test the vanishing on geometric stalks; retain those two Huber proof inputs as gaps.

Acceptance: For a partially proper morphism f of rigid K-spaces of relative pure dimension d and any abelian Λ=ℤ/n-sheaf F, R^if_!F=0 for i>2d. This is Zavyalov Lemma 5.3.2, whose proof cites Huber 5.3.11 and 1.8.7. It is the dimensional bound required by the trace’s top-degree Leray isomorphism, and is recorded separately from the packet’s more restricted relative-ball and general compactifiable-map bounds.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Top-degree Leray composition

`ClassicalAdicEtaleCohomology:H3/top-degree-proper-support-composition` (lemma)

For smooth partially proper taut rigid f:X→Y and g:Y→Z of relative pure dimensions d,e, Leray and the 2d/2e bounds give a canonical isomorphism R^{2(d+e)}(g∘f)_!Λ(d+e) ≅ R^{2e}g_!(R^{2d}f_!Λ(d))(e). For α:R^{2d}f_!Λ(d)→Λ and β:R^{2e}g_!Λ(e)→Λ, define β⊙α by this isomorphism followed by R^{2e}g_!(α)(e) and β. This specifies the meaning of trace compatibility with composition.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/partially-proper-relative-dimension-vanishing`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Form the proper-support Leray spectral sequence of the composite.
2. All terms except (2e,2d) in total top degree vanish by the relative bounds.
3. Use the projection formula for the twist and compose the resulting top-degree maps.

Acceptance: For smooth partially proper taut rigid f:X→Y and g:Y→Z of relative pure dimensions d,e, Leray and the 2d/2e bounds give a canonical isomorphism R^{2(d+e)}(g∘f)_!Λ(d+e) ≅ R^{2e}g_!(R^{2d}f_!Λ(d))(e). For α:R^{2d}f_!Λ(d)→Λ and β:R^{2e}g_!Λ(e)→Λ, define β⊙α by this isomorphism followed by R^{2e}g_!(α)(e) and β. This specifies the meaning of trace compatibility with composition.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### The Berkovich smooth trace interface

`ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface` (comparison)

For boundaryless smooth u(f):u(X)→u(Y) of pure relative dimension d, import Berkovich 1993 Theorem 7.2.1’s trace R^{2d}u(f)_!Λ(d)→Λ, with geometric-fibre/base-change compatibility, top-degree composition, dimension-zero étale counit and surjectivity for nonempty fibres. Work with n invertible in K so the Tate twist is defined; in mixed characteristic p, n=p^r is allowed here. The prime-to-residue hypothesis is imposed on Poincaré duality, not on this trace interface.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/taut-adic-berkovich-geometry-interface`, `ClassicalAdicEtaleCohomology:H0/berkovich-strict-etale-site-comparison`, `ClassicalAdicEtaleCohomology:H3/top-degree-proper-support-composition`, `ClassicalAdicEtaleCohomology:H0/tate-twists`.

Proof outline:

1. Apply the strict/full Berkovich topos comparison to Theorem 7.2.1.
2. Retain its degree-zero and composition normalization before transferring to adic spaces.
3. Keep the coefficient hypotheses separate from the stronger duality hypothesis.

Acceptance: For boundaryless smooth u(f):u(X)→u(Y) of pure relative dimension d, import Berkovich 1993 Theorem 7.2.1’s trace R^{2d}u(f)_!Λ(d)→Λ, with geometric-fibre/base-change compatibility, top-degree composition, dimension-zero étale counit and surjectivity for nonempty fibres. Work with n invertible in K so the Tate twist is defined; in mixed characteristic p, n=p^r is allowed here. The prime-to-residue hypothesis is imposed on Poincaré duality, not on this trace interface.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.2.1, pp. 131–132; [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### The smooth relative trace in arbitrary dimension

`ClassicalAdicEtaleCohomology:H3/smooth-relative-trace` (construction); planet **Smooth relative trace**

Let K be a complete nontrivially rank-one valued field, n>0 invertible in K and Λ=ℤ/n. For a smooth partially proper rigid f:X→Y of relative pure dimension d, define t_f:R^{2d}f_!Λ_X(d)→Λ_Y by θ_Y^* of the Berkovich trace on taut affinoid-base neighbourhoods, using α_f. These local sheaf morphisms glue by their compatible geometric maximal stalks. The map has geometric-maximal-fibre compatibility, t_g⊙t_f=t_{g∘f}, the étale counit normalization at d=0, and is surjective when every fibre is nonempty. This is Zavyalov Theorem 5.3.3; it constructs a trace without asserting p-torsion duality.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H3/berkovich-etale-counit-comparison`, `ClassicalAdicEtaleCohomology:H3/overconvergent-proper-support-preservation`, `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks`, `ClassicalAdicEtaleCohomology:H3/top-degree-proper-support-composition`.

Proof outline:

1. Cover Y by affinoids; each inverse image is taut because f is partially proper.
2. Transfer the normalized Berkovich trace through θ^* and α_f on each taut piece.
3. Use the canonical fibre identifications to show agreement of these already constructed sheaf morphisms on overlaps, then glue.
4. Transfer composition and dimension-zero normalization; surjectivity follows from the Berkovich trace and maximal-point surjectivity.

API:

- `SmoothRelativeTrace` (structure): The family t_f:R^{2d}f_!Λ(d)→Λ for smooth partially proper pure-dimensional f.
- `SmoothRelativeTrace.ofBerkovich` (constructor): Local trace obtained through α_f and θ^*.
- `SmoothRelativeTrace.maximalFiber` (compatibility): Restriction to a geometric fibre over a maximal point is its trace.
- `SmoothRelativeTrace.comp` (functoriality): t_g⊙t_f=t_{g∘f} under the top-degree Leray isomorphism.
- `SmoothRelativeTrace.dimensionZero` (simp): For d=0 the map is the counit (f_!,f^*).
- `SmoothRelativeTrace.surjective` (relation): All nonempty fibres imply an epimorphism of sheaves.
- `SmoothRelativeTrace.restrict` (functoriality): Trace commutes with restriction to the affinoid-base neighbourhoods used in its construction.
- `SmoothRelativeTrace.proper` (compatibility): For proper f, use f_!=f_* to obtain R^{2d}f_*Λ(d)→Λ.

Unit tests:

- `smoothTrace_identity` (computation): The trace of id_X in dimension zero is id_Λ.
- `smoothTrace_splitFinite` (computation): For a disjoint union of r copies of Y→Y, t_f is the sum Λ^r→Λ.
- `smoothTrace_emptyFiber` (non-example): The zero trace for an empty fibre is not surjective onto a nonzero coefficient sheaf.
- `smoothTrace_composition` (compatibility): For two projections of smooth proper factors, the trace on their product is the iterated trace.

Uses: Guo–Reinecke Theorem 7.16/Remark 7.17; higher-dimensional classical duality: Exports the composition, degree-zero and surjectivity normalization of the étale trace; prismatic trace construction remains with its owner..

Acceptance: Let K be a complete nontrivially rank-one valued field, n>0 invertible in K and Λ=ℤ/n. For a smooth partially proper rigid f:X→Y of relative pure dimension d, define t_f:R^{2d}f_!Λ_X(d)→Λ_Y by θ_Y^* of the Berkovich trace on taut affinoid-base neighbourhoods, using α_f. These local sheaf morphisms glue by their compatible geometric maximal stalks. The map has geometric-maximal-fibre compatibility, t_g⊙t_f=t_{g∘f}, the étale counit normalization at d=0, and is surjective when every fibre is nonempty. This is Zavyalov Theorem 5.3.3; it constructs a trace without asserting p-torsion duality.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Trace on geometric maximal fibres

`ClassicalAdicEtaleCohomology:H3/smooth-trace-geometric-maximal-fibres` (lemma)

For the trace t_f and a geometric point over a maximal y∈Y, the proper-support base-change identification carries its stalk to t_{f_y}:H_c^{2d}(X_y,Λ(d))→Λ. It is the maximal-geometric-fibre property in Zavyalov 5.3.3(1). This statement does not claim a base-change theorem for arbitrary higher-rank plus rings or arbitrary morphisms of bases.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`.

Proof outline:

1. Use the matching maximal geometric stalks under θ^*.
2. Apply Berkovich fibre compatibility and the support comparison.
3. Transport the fibre trace into the adic stalk.

Acceptance: For the trace t_f and a geometric point over a maximal y∈Y, the proper-support base-change identification carries its stalk to t_{f_y}:H_c^{2d}(X_y,Λ(d))→Λ. It is the maximal-geometric-fibre property in Zavyalov 5.3.3(1). This statement does not claim a base-change theorem for arbitrary higher-rank plus rings or arbitrary morphisms of bases.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Composition of smooth traces

`ClassicalAdicEtaleCohomology:H3/smooth-trace-composition` (lemma)

For smooth partially proper pure-dimensional f,g as in top-degree-proper-support-composition, t_g⊙t_f=t_{g∘f}. The equality is between the maps from R^{2(d+e)}(g∘f)_!Λ(d+e) to Λ after the canonical Leray/twist identification; relative dimensions add.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/top-degree-proper-support-composition`, `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`, `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks`.

Proof outline:

1. Check the equality on taut affinoid-base pieces through the Berkovich comparison.
2. Apply the source trace’s composition property.
3. Use overconvergent maximal-stalk detection to glue the equality.

Acceptance: For smooth partially proper pure-dimensional f,g as in top-degree-proper-support-composition, t_g⊙t_f=t_{g∘f}. The equality is between the maps from R^{2(d+e)}(g∘f)_!Λ(d+e) to Λ after the canonical Leray/twist identification; relative dimensions add.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Dimension-zero trace is the étale counit

`ClassicalAdicEtaleCohomology:H3/smooth-trace-dimension-zero` (lemma)

When d=0, smooth partially proper f is étale and t_f:f_!Λ→Λ is exactly the counit of (f_!,f^*), via f^*Λ=Λ. In the proper case f is finite étale and this is the usual summation trace on finite geometric fibres.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-etale-counit-comparison`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases`.

Proof outline:

1. Use the dimension-zero smooth/étale geometry identification.
2. Apply the counit comparison A.19 to the local Berkovich trace.
3. For proper f use the finite étale description and its fibrewise sum.

Acceptance: When d=0, smooth partially proper f is étale and t_f:f_!Λ→Λ is exactly the counit of (f_!,f^*), via f^*Λ=Λ. In the proper case f is finite étale and this is the usual summation trace on finite geometric fibres.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Nonempty fibres make the smooth trace surjective

`ClassicalAdicEtaleCohomology:H3/smooth-trace-nonempty-fibre-surjectivity` (lemma)

If all fibres of smooth partially proper f are nonempty, t_f is an epimorphism of Λ-sheaves. On each taut affinoid-base piece, surjectivity of f gives surjectivity X_max→Y_max, hence of u(f), and the Berkovich trace is surjective. Exact θ^* and locality preserve this conclusion. Nonempty fibres are needed; connectedness is not required.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`, `ClassicalAdicEtaleCohomology:H3/taut-adic-berkovich-geometry-interface`, `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks`.

Proof outline:

1. Use the maximal-generalization lifting in Huber 1.1.10 cited by Zavyalov.
2. Apply Berkovich trace surjectivity and exact θ^*.
3. Check epimorphism locally on Y.

Acceptance: If all fibres of smooth partially proper f are nonempty, t_f is an epimorphism of Λ-sheaves. On each taut affinoid-base piece, surjectivity of f gives surjectivity X_max→Y_max, hence of u(f), and the Berkovich trace is surjective. Exact θ^* and locality preserve this conclusion. Nonempty fibres are needed; connectedness is not required.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Finite-level trace compatibility in the coefficients

`ClassicalAdicEtaleCohomology:H3/smooth-trace-finite-coefficient-compatibility` (lemma)

The smooth relative trace is compatible with the reduction maps ℤ/p^{r+1}(d)→ℤ/p^r(d) when char(K)=0, and likewise with coefficient maps between finite constant torsion rings having invertible torsion in K. The trace squares commute through the natural support comparison and the coefficient-natural Berkovich trace. This finite-level fact is required before passing to a ℤ_p trace; it alone does not identify R^{2d}f_*ℤ_p with lim_r R^{2d}f_*ℤ/p^r.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`.

Proof outline:

1. Use coefficient-natural Kummer twists and derived proper-support maps.
2. Apply the naturality of the source trace under coefficient reduction.
3. Transport the commutative square through θ^* and glue.

Acceptance: The smooth relative trace is compatible with the reduction maps ℤ/p^{r+1}(d)→ℤ/p^r(d) when char(K)=0, and likewise with coefficient maps between finite constant torsion rings having invertible torsion in K. The trace squares commute through the natural support comparison and the coefficient-natural Berkovich trace. This finite-level fact is required before passing to a ℤ_p trace; it alone does not identify R^{2d}f_*ℤ_p with lim_r R^{2d}f_*ℤ/p^r.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### Galois-equivariant trace on a proper geometric fibre

`ClassicalAdicEtaleCohomology:H3/smooth-proper-galois-trace` (theorem)

For smooth proper rigid X/K of pure dimension d, n invertible in K and a completed algebraic closure C, the relative trace yields a G_K-equivariant map t_X:H^{2d}_et(X_C,ℤ/n(d))→ℤ/n. It is compatible with finite coefficient reduction and with composition of smooth proper maps. The field-point stalk comparison transports the continuous Galois action; equivariance is part of the sheaf morphism on Spa(K,O_K).

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-composition`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-finite-coefficient-compatibility`, `ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology`.

Proof outline:

1. Replace f_! by f_* for the proper structure map.
2. Take the geometric field-point stalk of the sheaf morphism.
3. Use the field-point/Galois equivalence to retain equivariance.

Acceptance: For smooth proper rigid X/K of pure dimension d, n invertible in K and a completed algebraic closure C, the relative trace yields a G_K-equivariant map t_X:H^{2d}_et(X_C,ℤ/n(d))→ℤ/n. It is compatible with finite coefficient reduction and with composition of smooth proper maps. The field-point stalk comparison transports the continuous Galois action; equivariance is part of the sheaf morphism on Spa(K,O_K).

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), Theorem 1.1.3 and §5.4 first paragraph.

#### Prime-to-residue Poincaré duality in arbitrary dimension

`ClassicalAdicEtaleCohomology:H3/higher-dimensional-prime-to-residue-duality` (theorem)

Let X be a smooth proper rigid K-space of pure dimension d, C a completed algebraic closure and ℓ a prime invertible in O_K. For every i≥0 the pairing H^i_et(X_C,𝔽_ℓ)⊗ H^{2d−i}_et(X_C,𝔽_ℓ(d)) → H^{2d}_et(X_C,𝔽_ℓ(d)) → 𝔽_ℓ is perfect and G_K-equivariant, with the second map the normalized trace above. The theorem is Zavyalov 1.1.3, citing Huber 7.5.3/Berkovich 7.3.1. In mixed characteristic p it requires ℓ≠p; the p-torsion duality of Zavyalov §5.4 is an external theorem on another roadmap.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-proper-galois-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H0/berkovich-overconvergent-sheaf-equivalence`, `DiamondsAndVStacks:D0`, `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`, `ClassicalAdicEtaleCohomology:H3/smooth-proper-local-system-cohomology-finiteness`.

Proof outline:

1. Use the Berkovich prime-to-residue proper smooth duality theorem on the taut rigid realization.
2. Transfer the constant coefficients, cup product and normalized trace through the support comparison.
3. Retain the stronger coefficient hypothesis and finite-dimensional/perfect-pairing conclusion.

Acceptance: All i and arbitrary dimension d are included. The hypothesis is ℓ invertible in O_K, not merely invertible in K. The pairing uses the same trace fixed by the composition and counit normalization.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), Theorem 1.1.3, p. 2; [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.3.1, p. 135.

#### The zero-dimensional duality pairing

`ClassicalAdicEtaleCohomology:H3/prime-to-residue-duality-dimension-zero` (lemma)

For a smooth proper zero-dimensional X/K with r geometric points, H⁰(X_C,𝔽_ℓ)=𝔽_ℓ^r and higher cohomology is zero. Cup product followed by the normalized trace pairs (a_j),(b_j) by Σ_j a_jb_j. This pairing is perfect, even when ℓ divides r; its perfectness is not the assertion that the trace of the constant unit is invertible.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/higher-dimensional-prime-to-residue-duality`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-dimension-zero`, `ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology`.

Proof outline:

1. Split the finite étale geometric fibre into points.
2. Use the counit summation trace and coordinatewise cup product.
3. Compute the identity Gram matrix to establish perfectness without a degree-invertibility condition.

Acceptance: For a smooth proper zero-dimensional X/K with r geometric points, H⁰(X_C,𝔽_ℓ)=𝔽_ℓ^r and higher cohomology is zero. Cup product followed by the normalized trace pairs (a_j),(b_j) by Σ_j a_jb_j. This pairing is perfect, even when ℓ divides r; its perfectness is not the assertion that the trace of the constant unit is invertible.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### General trace agrees with the normalized curve trace

`ClassicalAdicEtaleCohomology:H3/general-trace-curve-normalization` (comparison)

For a smooth proper curve over Spa(C,O_C), the arbitrary-dimensional trace at d=1 agrees with the packet’s curve trace transported through its Berkovich comparison. Hence the prime-to-residue perfect pairing specializes to the existing curve pairing with the same twist and sign convention. This comparison is limited to O_C; the higher-rank C⁺ formal-model transfer remains a distinct gap.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/higher-dimensional-prime-to-residue-duality`, `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`.

Proof outline:

1. Both maps are transported from Berkovich’s normalized trace on the same curve.
2. Use naturality of the support comparison and the curve normalization.
3. Identify the cup products and Tate twists before comparing the pairings.

Acceptance: For a smooth proper curve over Spa(C,O_C), the arbitrary-dimensional trace at d=1 agrees with the packet’s curve trace transported through its Berkovich comparison. Hence the prime-to-residue perfect pairing specializes to the existing curve pairing with the same twist and sign convention. This comparison is limited to O_C; the higher-rank C⁺ formal-model transfer remains a distinct gap.

Sources: [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### The ℤ_p trace for smooth proper formal generic fibres

`ClassicalAdicEtaleCohomology:H3/integral-smooth-proper-trace` (construction)

For a smooth proper morphism f:𝔛→𝔜 of smooth formal O_K-schemes of relative equidimension d, with K of mixed characteristic (0,p), construct t_{f_η}:R^{2d}f_{η,*}ℤ_p(d)→ℤ_p from the compatible finite-level traces using the integral-coefficient comparison supplied by L2. The normalized family satisfies composition, degree-zero adjunction counit, and surjectivity for all nonempty fibres, precisely the three hypotheses of Guo–Reinecke Theorem 7.16. Remark 7.17 supplies the classical Berkovich/adic family. This node exports the étale normalization only; the prismatic trace and duality construction are imported by their own roadmap.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-composition`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-dimension-zero`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-nonempty-fibre-surjectivity`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-finite-coefficient-compatibility`, `AdicCoefficientsAndComparisons:L2`, `AdicSpacesPartII:R1`.

Proof outline:

1. Use L2’s integral inverse-system carrier and proper smooth finite-level comparison to pass from the compatible mod-p^r traces to the ℤ_p sheaf map.
2. Transfer composition and dimension-zero normalization through those identifications.
3. Prove integral surjectivity using the supplier’s compatible local lifts/derived-completeness argument; do not infer it from surjectivity of unrelated finite-level maps alone.
4. Export the normalized family to the prismatic owner under exactly the formal smooth/proper hypotheses of Theorem 7.16.

API:

- `IntegralSmoothProperTrace` (structure): The ℤ_p-linear trace family on smooth proper formal generic fibres.
- `IntegralSmoothProperTrace.modPow` (compatibility): Reduction modulo p^r is the corresponding normalized finite-level trace.
- `IntegralSmoothProperTrace.comp` (functoriality): The integral trace family is compatible with composition.
- `IntegralSmoothProperTrace.dimensionZero` (simp): For d=0 the trace is the finite étale adjunction counit.
- `IntegralSmoothProperTrace.surjective` (relation): All nonempty fibres imply an epimorphism of ℤ_p sheaves under the integral comparison interface.
- `IntegralSmoothProperTrace.guoReineckeInput` (compatibility): Packages exactly assumptions (a)–(c) of Guo–Reinecke Theorem 7.16.

Unit tests:

- `integralTrace_splitFinite` (computation): The split finite étale trace is the sum ℤ_p^r→ℤ_p.
- `integralTrace_modPow` (compatibility): Reducing that sum modulo p^n gives the finite-level counit sum.
- `integralTrace_empty` (non-example): The empty proper smooth fibre supplies the zero map and fails the nonempty-fibre surjectivity hypothesis.

Uses: Guo–Reinecke Theorem 7.16; PrismaticCohomology: Supplies its chosen étale traces without reconstructing Frobenius, prismatic crystals or prismatic duality..

Acceptance: For a smooth proper morphism f:𝔛→𝔜 of smooth formal O_K-schemes of relative equidimension d, with K of mixed characteristic (0,p), construct t_{f_η}:R^{2d}f_{η,*}ℤ_p(d)→ℤ_p from the compatible finite-level traces using the integral-coefficient comparison supplied by L2. The normalized family satisfies composition, degree-zero adjunction counit, and surjectivity for all nonempty fibres, precisely the three hypotheses of Guo–Reinecke Theorem 7.16. Remark 7.17 supplies the classical Berkovich/adic family. This node exports the étale normalization only; the prismatic trace and duality construction are imported by their own roadmap.

Sources: [GuoReinecke-CrystallineLocalSystems-2024](https://par.nsf.gov/servlets/purl/10534610), Theorem 7.16 and Remark 7.17, pp. 114–115; [Zavyalov-PoincareDuality-2025](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf), §5.3 and Appendix A, pp. 77–78 and 84–88.

#### The classical trace normalization for prismatic comparisons

`ClassicalAdicEtaleCohomology:H3/guo-reinecke-etale-trace-normalization-export` (comparison)

The integral trace family of integral-smooth-proper-trace supplies a collection tr^et satisfying Guo–Reinecke 7.16(a)–(c), and agrees with the classical family specified in Remark 7.17 after finite-level reduction. The downstream prismatic theorem may consume these hypotheses to construct its own Frobenius-equivariant trace; no prismatic pairing or mod-p analytic duality is asserted by this export.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/integral-smooth-proper-trace`.

Proof outline:

1. List the three normalized hypotheses with the exact smooth proper formal scope.
2. Identify the chosen family by its finite-level Berkovich normalization.
3. Pass only this interface to the downstream owner.

Acceptance: The integral trace family of integral-smooth-proper-trace supplies a collection tr^et satisfying Guo–Reinecke 7.16(a)–(c), and agrees with the classical family specified in Remark 7.17 after finite-level reduction. The downstream prismatic theorem may consume these hypotheses to construct its own Frobenius-equivariant trace; no prismatic pairing or mod-p analytic duality is asserted by this export.

Sources: [GuoReinecke-CrystallineLocalSystems-2024](https://par.nsf.gov/servlets/purl/10534610), Theorem 7.16 and Remark 7.17, pp. 114–115.

#### Independence of the smooth trace chart

`ClassicalAdicEtaleCohomology:H3/berkovich-trace-chart-independence` (lemma)

For a separated smooth strict Berkovich f:Y→X of pure dimension d with an étale factorization Y→𝔸_X^d→X, Tr_f=Tr_projection∘Tr_etale is independent of the factorization. This is Berkovich Lemma 7.2.2, the key input making the general relative trace canonical. It uses the algebraic affine-space trace normalization and does not identify an adic closed ball with analytic affine space.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`, `AdicSpacesPartII:R1`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `ClassicalAdicEtaleCohomology:H3/curve-trace`.

Proof outline:

1. Use the weak base-change theorem to reduce to an algebraically closed field.
2. Exchange one étale coordinate at a time via regular local parameters; use the one-dimensional trace normalization.
3. Remove a lower-dimensional complement without changing top compactly supported cohomology.

Acceptance: For a separated smooth strict Berkovich f:Y→X of pure dimension d with an étale factorization Y→𝔸_X^d→X, Tr_f=Tr_projection∘Tr_etale is independent of the factorization. This is Berkovich Lemma 7.2.2, the key input making the general relative trace canonical. It uses the algebraic affine-space trace normalization and does not identify an adic closed ball with analytic affine space.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Lemma 7.2.2 and proof, pp. 132–133.

#### Rigid base change of the smooth trace

`ClassicalAdicEtaleCohomology:H3/smooth-trace-rigid-base-change` (lemma)

For a Cartesian square of smooth partially proper pure-dimensional rigid maps over K, with all four spaces taut and their Berkovich realization available, the smooth trace commutes with the canonical proper-support base-change map. The comparison α_f must be coherent with that square; that coherence is a supplier obligation. The statement covers rigid spaces over Spa(K,O_K), retaining n invertible in K, and does not assert arbitrary-plus-ring base change.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H3/taut-adic-berkovich-geometry-interface`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Use Berkovich Theorem 7.2.1(a).
2. Compare its square with the adic square through θ-naturality and the requested base-change coherence of α_f.
3. Apply exact θ^* to transfer the trace equality.

Acceptance: For a Cartesian square of smooth partially proper pure-dimensional rigid maps over K, with all four spaces taut and their Berkovich realization available, the smooth trace commutes with the canonical proper-support base-change map. The comparison α_f must be coherent with that square; that coherence is a supplier obligation. The statement covers rigid spaces over Spa(K,O_K), retaining n invertible in K, and does not assert arbitrary-plus-ring base change.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.2.1(a), p. 131.

#### Connected geometric fibres give an isomorphism trace

`ClassicalAdicEtaleCohomology:H3/smooth-trace-geometrically-connected-fibres` (theorem)

For smooth partially proper taut rigid f of pure relative dimension d and n invertible in O_K, if all geometric fibres are nonempty and connected, t_f:R^{2d}f_!ℤ/n(d)→ℤ/n is an isomorphism. This is the final assertion of Berkovich 7.2.1 transferred by θ^* and α_f. The stronger prime-to-residue condition is retained here; nonempty fibres alone give only surjectivity.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-geometric-maximal-fibres`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks`, `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`.

Proof outline:

1. Use the connected-geometric-fibre assertion of the Berkovich theorem.
2. Transport through the exact inverse image and the support comparison.
3. Check isomorphism at maximal geometric stalks.

Acceptance: For smooth partially proper taut rigid f of pure relative dimension d and n invertible in O_K, if all geometric fibres are nonempty and connected, t_f:R^{2d}f_!ℤ/n(d)→ℤ/n is an isomorphism. This is the final assertion of Berkovich 7.2.1 transferred by θ^* and α_f. The stronger prime-to-residue condition is retained here; nonempty fibres alone give only surjectivity.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.2.1, final assertion and proof, pp. 132–134.

#### Uniqueness with the Berkovich trace normalization

`ClassicalAdicEtaleCohomology:H3/smooth-trace-berkovich-normalization-uniqueness` (theorem)

A trace family on separated smooth strict Berkovich maps is uniquely determined by base-change compatibility, top-degree composition, the dimension-zero étale trace, and the absolute algebraically closed curve trace. Consequently the adic trace obtained through the fixed θ/α comparison is independent of the local affinoid cover and any choice of normalized Berkovich family. This uses all four normalizations of Berkovich 7.2.1; it does not claim uniqueness from Guo–Reinecke’s three assumptions alone.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `ClassicalAdicEtaleCohomology:H3/berkovich-trace-chart-independence`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-rigid-base-change`, `ClassicalAdicEtaleCohomology:H3/smooth-trace-dimension-zero`, `ClassicalAdicEtaleCohomology:H3/curve-trace`.

Proof outline:

1. Apply the uniqueness assertion of Berkovich Theorem 7.2.1 with its additional curve normalization.
2. Use θ^* and the fixed support comparison on every taut piece.
3. Glue the equal local maps.

Acceptance: A trace family on separated smooth strict Berkovich maps is uniquely determined by base-change compatibility, top-degree composition, the dimension-zero étale trace, and the absolute algebraically closed curve trace. Consequently the adic trace obtained through the fixed θ/α comparison is independent of the local affinoid cover and any choice of normalized Berkovich family. This uses all four normalizations of Berkovich 7.2.1; it does not claim uniqueness from Guo–Reinecke’s three assumptions alone.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.2.1(a)–(d), pp. 131–132.

#### The derived Berkovich duality input

`ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface` (comparison)

Let h:Z→W be separated smooth strict Berkovich of pure dimension d and n invertible in O_K. For G∈D⁻(Z_et,ℤ/n) and F∈D⁺(W_et,ℤ/n), the trace-induced map Rh_*RHom(G,h^*F(d)[2d])→RHom(Rh_!G,F) is an isomorphism. This is the precise imported Berkovich 7.3.1 input. It is not asserted here for every arbitrary non-overconvergent adic G; each adic application below states the properness/local-coefficient hypotheses enabling transport.

Prerequisites: `ClassicalAdicEtaleCohomology:H0/berkovich-strict-etale-site-comparison`, `ClassicalAdicEtaleCohomology:H3/berkovich-general-trace-interface`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Use the trace-induced duality morphism stated immediately before Berkovich Theorem 7.3.1.
2. Import the theorem with its stronger prime-to-residue hypothesis and boundedness directions.
3. Keep this Berkovich interface distinct from an all-sheaf adic six-functor duality statement.

Acceptance: Let h:Z→W be separated smooth strict Berkovich of pure dimension d and n invertible in O_K. For G∈D⁻(Z_et,ℤ/n) and F∈D⁺(W_et,ℤ/n), the trace-induced map Rh_*RHom(G,h^*F(d)[2d])→RHom(Rh_!G,F) is an isomorphism. This is the precise imported Berkovich 7.3.1 input. It is not asserted here for every arbitrary non-overconvergent adic G; each adic application below states the properness/local-coefficient hypotheses enabling transport.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.3.1 and preceding duality morphism, pp. 134–135.

#### Relative duality for constant coefficients

`ClassicalAdicEtaleCohomology:H3/smooth-proper-constant-relative-duality` (theorem)

For smooth proper taut rigid f:X→Y of pure relative dimension d, n invertible in O_K and a finite locally free ℤ/n-sheaf F on Y, the normalized trace induces Rf_*f^*F ≅ RHom_Y(Rf_*ℤ/n,F(−d)[−2d]). This is the proper adic transport of Berkovich 7.4.1; both direct images are proper-support images and F’s finite local freeness allows internal Hom to be transported through θ. Generic derived tensor/Hom coherence is imported from D0/E1.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H0/berkovich-overconvergent-sheaf-equivalence`, `ClassicalAdicEtaleCohomology:H3/smooth-relative-trace`, `DiamondsAndVStacks:D0`, `EnhancedDerivedSheaves:E1`.

Proof outline:

1. Apply Berkovich 7.4.1 with the unit sheaf in its derived duality theorem.
2. Use f_!=f_* and A.15 to transport both direct images.
3. Use local finite freeness of F and the imported tensor/Hom compatibility to transport the adjoint map.

Acceptance: For smooth proper taut rigid f:X→Y of pure relative dimension d, n invertible in O_K and a finite locally free ℤ/n-sheaf F on Y, the normalized trace induces Rf_*f^*F ≅ RHom_Y(Rf_*ℤ/n,F(−d)[−2d]). This is the proper adic transport of Berkovich 7.4.1; both direct images are proper-support images and F’s finite local freeness allows internal Hom to be transported through θ. Generic derived tensor/Hom coherence is imported from D0/E1.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.4.1 and proof, p. 143.

#### Poincaré pairing with finite local-system coefficients

`ClassicalAdicEtaleCohomology:H3/smooth-proper-local-system-perfect-pairing` (theorem)

For smooth proper rigid X/K of pure dimension d, ℓ invertible in O_K and a finite locally constant 𝔽_ℓ-sheaf L on X_C, let L∨=Hom(L,𝔽_ℓ). The trace and evaluation cup product give perfect pairings H^i(X_C,L)⊗H^{2d−i}(X_C,L∨(d))→𝔽_ℓ for all i. If L descends to X, the pairing is G_K-equivariant. This generalizes the constant-coefficient target using Berkovich 7.4.3; local freeness over the field ensures the dual is the actual finite local system.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H3/smooth-proper-galois-trace`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `DiamondsAndVStacks:D0`.

Proof outline:

1. Transport finite local systems through the taut/Berkovich sheaf equivalence.
2. Apply Berkovich 7.4.3 with the evaluation dual and normalized trace.
3. Use properness for support comparison and retain Galois equivariance on descended coefficients.

Acceptance: For smooth proper rigid X/K of pure dimension d, ℓ invertible in O_K and a finite locally constant 𝔽_ℓ-sheaf L on X_C, let L∨=Hom(L,𝔽_ℓ). The trace and evaluation cup product give perfect pairings H^i(X_C,L)⊗H^{2d−i}(X_C,L∨(d))→𝔽_ℓ for all i. If L descends to X, the pairing is G_K-equivariant. This generalizes the constant-coefficient target using Berkovich 7.4.3; local freeness over the field ensures the dual is the actual finite local system.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.4.3, p. 143.

#### Finiteness in arbitrary dimension with local-system coefficients

`ClassicalAdicEtaleCohomology:H3/smooth-proper-local-system-cohomology-finiteness` (theorem)

For an algebraically closed complete rank-one field C, a proper smooth rigid X/C and a finite locally constant ℤ/n-sheaf L with n invertible in O_C, every H^i_et(X,L) is finite. This is the adic proper transport of Berkovich 7.4.4, extending the existing curve finiteness node to arbitrary dimension. For 𝔽_ℓ-coefficients these finite groups are finite-dimensional vector spaces, as required by the perfect-pairing formulation.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H0/berkovich-overconvergent-sheaf-equivalence`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`.

Proof outline:

1. Use the finite-locally-constant finiteness theorem on u(X).
2. Identify proper cohomology via A.15 and f_!=f_*.
3. Retain the prime-to-residue coefficient hypothesis.

Acceptance: For an algebraically closed complete rank-one field C, a proper smooth rigid X/C and a finite locally constant ℤ/n-sheaf L with n invertible in O_C, every H^i_et(X,L) is finite. This is the adic proper transport of Berkovich 7.4.4, extending the existing curve finiteness node to arbitrary dimension. For 𝔽_ℓ-coefficients these finite groups are finite-dimensional vector spaces, as required by the perfect-pairing formulation.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Corollary 7.4.4, p. 143.

#### Relative duality when the cohomology sheaves are local systems

`ClassicalAdicEtaleCohomology:H3/smooth-proper-relative-local-system-duality` (theorem)

Let f:X→Y be smooth proper taut rigid of pure relative dimension d, ℓ invertible in O_K, and L a finite locally constant 𝔽_ℓ-sheaf. If every R^if_*L∨ is finite locally constant, the trace pairing gives canonical isomorphisms R^qf_*L ≅ (R^{2d−q}f_*L∨)∨(−d). This is the proper adic instance of Berkovich 7.4.9. The local-constancy hypothesis is an assumption, not a new smooth proper base-change theorem; the generic finite-coefficient Ext calculation in Lemma 7.4.10 is requested from D0/E1.

Prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`, `ClassicalAdicEtaleCohomology:H3/berkovich-proper-support-comparison`, `ClassicalAdicEtaleCohomology:H3/smooth-proper-constant-relative-duality`, `ClassicalAdicEtaleCohomology:H3/smooth-proper-local-system-perfect-pairing`, `DiamondsAndVStacks:D0`, `EnhancedDerivedSheaves:E1`.

Proof outline:

1. Use Berkovich 7.4.9 and its finite-coefficient Ext calculation.
2. Transport the proper direct images through α_f.
3. Identify the finite local-system duals and Tate twist with the trace-induced relative pairing.

Acceptance: Let f:X→Y be smooth proper taut rigid of pure relative dimension d, ℓ invertible in O_K, and L a finite locally constant 𝔽_ℓ-sheaf. If every R^if_*L∨ is finite locally constant, the trace pairing gives canonical isomorphisms R^qf_*L ≅ (R^{2d−q}f_*L∨)∨(−d). This is the proper adic instance of Berkovich 7.4.9. The local-constancy hypothesis is an assumption, not a new smooth proper base-change theorem; the generic finite-coefficient Ext calculation in Lemma 7.4.10 is requested from D0/E1.

Sources: [Berkovich-EtaleCohomology-1993](http://www.numdam.org/item/PMIHES_1993__78__5_0/), Theorem 7.4.9 and proof, pp. 145–146.

### Confirmed ownership findings

- **RT-AREA-etale/15:** L2 owns Noetherian approximation and affine-limit Hom/Dᵇ_c continuity.
  H1:valuation-nearby-cycles owns its valuation-base Rj_* constructibility and H1:valuation-exports its
  compatible exports. The packet proposes the missing GeneralBasesFourier imports and comparisons,
  including ABE/A10–A11 and YZ/A07/ABE/A14. It retains the nondominant and finite-boundary limitations.
- **RT-AREA-etale/20:** the affine Gabber–Huber comparison and Noetherian proper Fujiwara comparison
  remain H1:henselian’s. ArcTopologyAndDescent imports them and owns the broader non-Noetherian
  Fujiwara–Gabber extension, strongly Noetherian Tate extension and affinoid Artin vanishing.
- **RT-AREA-etale/26:** the perfectoid comparison is proposed as an isolated suffix importing P5,
  H0 continuity and L2 scheme continuity. P5 acquires no classical-cohomology ancestor, and early
  affine/Noetherian consumers do not acquire the whole perfectoid suffix.

These are proposals in this packet; downstream briefs and other workers’ files are outside this
issue’s deliverables. The algebraic p-torsion BKH supplier is separately proposed as an early log
semistable nearby-cycle layer extending LPV, importing CR.5 and SF.2. It has not been silently assigned
to the existing prime-to-p LPV.0 stage or to a period-comparison layer.

### Sources and proof gaps carried forward

The Huber finite-boundary alternative in 4.2.8–4.2.9 still has no verified public statement. The
Springer chapter remains subscription-only; this pass does not invent its hypothesis. Public
Zavyalov restatements identify the exact general-dimensional trace, support-comparison and
cohomological-dimension inputs, but their cited Huber proofs remain unread. The integral inverse-limit
trace proof and algebraic BKH theorem also remain explicit supplier gaps. All 40 gaps and 37 requests
are recorded per consumer in the packet and summarized in the handoff.

## Sources

Hub96 only through the excerpts of the reviewed decomposition (3.1.3, 3.2.1, 3.2.5, 3.5.12–3.5.13, 3.5.17);
SGA 7 II Exposé XIII (1.3.2, 1.3.10, 1.4.3, 2.1.1–2.1.2, 2.1.8.9); Berkovich, *Vanishing cycles for formal
schemes* (1994), §§4–5 (the nearby-cycle functor over a henselian valuation ring, not necessarily discrete; the
canonical comparison i^*j_* → θ; Theorem 5.1 for all torsion; Theorem 4.9 prime to p; Corollary 5.4); Hansen,
*Vanishing and comparison theorems* (λ = Berkovich's Θ, nearby-cycle sheaves, the special case of 3.5.10); ECD §1
(invariance reduces to schemes via nearby cycles), Lemma 16.3, Lemma 19.4; Stacks Tag 04DZ.

#### Open inputs

Requests: `UPSTREAM:ECD:SCH_BC` (stalk formula for Rj_*, integral base change, topological invariance); LPV.0
(RΨ_η for arbitrary torsion coefficients, so that the all-torsion 3.5.17 is a statement about LPV.0's object);
LPV.1 (the monodromy operator on E[I]-modules). Gaps: Hub96 §4.2 is not public, so the two valuation-base exports
carry exactly what H1:valuation-nearby-cycles and H1:valuation-exports realise; LPV.0's coefficient scope excludes
p-torsion.

#### Acceptance

- Every alias of the four re-export nodes has, by `rfl`, the type of its sub-stage declaration, and no H1
  declaration introduces a henselian pair, a specialization morphism, a nearby-cycle functor or a derived category.
- For A^1_A and Z/ℓ (ℓ ≠ p): H*(closed unit disc over k̄^, Z/ℓ) = Z/ℓ in degree 0 with trivial inertia action,
  RΦ = 0, sp_an an isomorphism.
- For xy = π: H¹ of the closed annulus is free of rank one and equals H¹(X_s, RΦ(Z/ℓ)); H¹(X_s, Z/ℓ) = 0.
- For X proper: the H1 isomorphism composed with LPV.0 2.1.8.3 is H5's proper comparison (Hub96 3.7.2).
- η = s: RΨ_L(F) = i^*F; a non-surjective map of valuation spectra carries no invariance claim; torsion divisible
  by the residue characteristic carries no 4.2.4 claim.

<a id="h2"></a>

## H2. Invariance under extension of an algebraically closed valued field


**Coverage: planned** (every target of the stage is realised by a node; Huber's reduction of Theorem 4.1.1(c) to
the algebraizable case exported by H1:valuation-exports exists only in the non-public book and is a recorded gap, and two
rigid-geometry inputs are requests to AdicSpacesPartII).

This stage proves that prime-to-p étale cohomology with supports does not change when an algebraically closed
nonarchimedean base field is enlarged, in the form Scholze uses in ECD Lemma 16.3, and that connectedness does not change
either (ECD Lemma 14.6). The base is the spectrum S = Spa(C, C⁺) of a *geometric field pair*: C algebraically closed and
complete, C⁺ an open and bounded valuation subring of any rank. The comparison runs along a morphism
Spa(C', C'⁺) → Spa(C, C⁺), and the cohomological statements need it to be **surjective**, i.e. C'⁺ ∩ C = C⁺.

The classical theorem is stated for affinoids Y = Spa(R, R⁺) with R topologically of finite type over C and an arbitrary plus
ring, and for extension by zero j_!M from an arbitrary quasicompact open U ⊆ Y, not only for constant coefficients. It is
then transported to affinoid perfectoid spaces over S by approximating them by affinoids of topologically finite type,
descending U to a finite level and passing to the cohomological limit. The special case of spectra of geometric field
pairs is ECD Lemma 16.3, which DiamondEtaleCohomology:C1 applies to prove ECD Theorem 16.1(iii). No proof in this stage
uses diamonds, DiamondEtaleCohomology C1 or the v-locality theorem ECD 14.12.

Connectedness is proved separately: for spaces of finite type over Spa(C, O_C) from Conrad's theorem on geometric
connectedness of rigid spaces, and for connected affinoid perfectoid spaces over Spa(C, C⁺) (ECD Lemma 14.6, used by
DiamondEtaleCohomology:C0 in ECD 14.5 and by C1 in ECD 16.1(i)) by reduction to the generic point, finite-type
approximation and finite-stage descent of a disconnection. No surjectivity is needed for connectedness.

**Not in this stage.** Étale sites, geometric points and strict localisations of analytic adic spaces (AdicEtaleGeometry A1);
sheaves of modules, derived direct images, supports, the stalk formula and Huber's continuity theorem
(ClassicalAdicEtaleCohomology H0); the henselian, formal/adic and valuation-base comparisons (H1 and its sub-stages);
perfectoid spaces, their étale sites, cofiltered limits, finite-stage descent and tilde-limits (PerfectoidSpaces P2, P3, P5, P7);
the diamond statements ECD 14.x–16.x (DiamondEtaleCohomology C0, C1).

### Conventions

- A *geometric field pair* (C, C⁺): C algebraically closed, complete for a nontrivial nonarchimedean absolute value (hence a
  perfectoid field, of characteristic 0 or p), C⁺ ⊆ C an open and bounded valuation subring, C°° ⊆ C⁺ ⊆ O_C = C°. Higher
  rank is kept throughout; rank one is the special case C⁺ = O_C, never a silent replacement.
- |Spa(C, C⁺)| is the chain of valuation rings V with C⁺ ⊆ V ⊆ O_C; the closed point s is C⁺, the generic point η is O_C,
  and S is the only open subset containing s.
- An *extension* ι: (C, C⁺) → (C', C'⁺) is a morphism of Tau Ceti `Huber.Pair`s; it induces g_ι: Spa(C', C'⁺) → Spa(C, C⁺),
  V' ↦ ι⁻¹(V'). *Surjective* means g_ι surjective, equivalently ι⁻¹(C'⁺) = C⁺.
- p is the characteristic exponent of the residue field of O_C (1 if it is 0); coefficients are ℤ/nℤ-modules M with n
  prime to p. Nothing is asserted for p-torsion.
- Base change Y' = Y ×_S S' of an affinoid is Spa(R ⊗̂_C C', ·), the completed tensor product of AdicSpacesPartII R0 with
  plus ring the closure of the integral closure of the image of R⁺ ⊗_{C⁺} C'⁺.
- Two kinds of limits appear and are kept apart: the *analytic approximation spaces* Y_I (noetherian affinoids of
  topologically finite type, not perfectoid), of which an affinoid perfectoid X is a *tilde-limit* X ~ lim Y_I (and
  X ~′ lim Y_I in Scholze 2012's residue-field sense), not a categorical limit; and, in characteristic p, the p-finite
  perfectoid spaces Y_I^perf, of which X is a genuine limit in perfectoid spaces.

### Objects

#### `geometric-field-pair-extension` — geometric field pairs, extensions, surjectivity (definition)

Data as in the conventions; every morphism Spa(C', C'⁺) → Spa(C, C⁺) comes from a unique extension, ι is injective and
ι⁻¹(O_{C'}) = O_C. Uses: ECD Lemma 16.3 (X₁ → X₃ surjective), ECD Lemma 14.6 (arbitrary X' → X), ECD 16.1 and 14.5(ii)
(connected strictly totally disconnected spaces and the reduction to surjective maps), this stage's theorems, and A1's
geometric points.

API: `AdicSpace.GeometricFieldPair` (structure), `.toPair` (the Tau Ceti Huber pair), `.spa` (Spa(C, C⁺) with s, η),
`.Hom` (extensions), `.Hom.id` / `.Hom.comp` with `spaMap_id`, `spaMap_comp`, `.Hom.spaMap` (g_ι), `.Hom.comap_powerBounded`
(ι⁻¹(O_{C'}) = O_C, C⁺ ⊆ ι⁻¹(C'⁺)), `.Hom.IsSurjective`, `.Hom.isSurjective_iff_comap_eq`, `.Hom.range_spaMap` (image =
generalisations of g_ι(s')), `.Hom.isSurjective_of_rankOne`, `.Hom.IsSurjective.comp`, `.ofEqPlus` ((C, V) for
C⁺ ⊆ V ⊆ O_C and the identity extension), `.Hom.toGeometricPoint` (g_ι as an A1 geometric point with support g_ι(s')).

Unit tests: `GeometricFieldPair.Hom.isSurjective_id` (degenerate); `GeometricFieldPair.Hom.not_isSurjective_toRankOne`
(non-example: for C⁺ ⊊ O_C the identity (C, C⁺) → (C, O_C) is a morphism of pairs with image {η}, which the wrong
definition 'ι(C⁺) ⊆ C'⁺' would call surjective); `GeometricFieldPair.Hom.isSurjective_of_plus_eq_powerBounded`
(computation: rank-one sources); `GeometricFieldPair.Hom.toGeometricPoint_support` (compatibility with A1: the support is
s iff ι is surjective); `GeometricFieldPair.Hom.isSurjective_comp` (characterisation).

#### `finite-type-approximation-of-perfectoid-affinoids` — approximation by affinoids of finite type (construction)

For X = Spa(R, R⁺) affinoid perfectoid over S (any characteristic) and a finite subset I ⊆ R⁺: S_I is the image of
C⟨T_i : i ∈ I⟩ → R with the quotient topology, S_I⁺ the integral closure of the subring generated by C⁺, I and S_I°°, and
Y_I = Spa(S_I, S_I⁺). Then S_I is a reduced C-affinoid algebra, S_I⁺ ⊆ R⁺, R = ⋃ S_I and R⁺ = ⋃ S_I⁺ (no completion),
|X| ≅ lim |Y_I|, quasicompact opens and rational subsets descend to a finite level, X ~ lim Y_I and X ~′ lim Y_I. In
characteristic p the completed perfections Y_I^perf have |Y_I^perf| = |Y_I|, the same étale topos, and X = lim Y_I^perf in
perfectoid spaces (ECD's presentation in Lemma 16.3); for C⁺ = O_C, S_I⁺ = S_I° and the system is Scholze 2012 Lemma 6.13's.
The plus ring is built from C⁺, I and S_I°° because R⁺ need not be an O_C-algebra when C⁺ has higher rank. The system may be
restricted to compatible rational subsets W_I ⊇ φ_I(X), for instance the connected components used for connectedness.

API: `AdicSpace.FiniteTypeApprox` (the system), `.isTopologicallyFiniteType`, `.space`, `.map` (with map_id, map_comp),
`.proj`, `.iUnion_eq`, `.homeomorph`, `.exists_isQuasiCompactOpen_preimage`, `.isTildeLimit`, `.perf`, `.restrict`,
`.plus_eq_powerBounded`.

Unit tests: `FiniteTypeApprox.test_point` (degenerate: X = S gives the constant system S);
`FiniteTypeApprox.test_disc` (computation: the perfectoid disc, S_{{T^{1/p^k}}} = C⟨T^{1/p^k}⟩);
`FiniteTypeApprox.not_isPerfectoid` (non-example: Y_{{T}} = Spa(C⟨T⟩, O_C⟨T⟩) is not perfectoid, so X ~ lim Y_I is only a
tilde-limit); `FiniteTypeApprox.plus_eq_powerBounded_of_rankOne` (compatibility with PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids);
`FiniteTypeApprox.homeomorph_test` (characterisation: |X| ≅ lim |Y_I| and a rational subset descending to Y_{{T}}).

### Lemmas

- `surjectivity-criterion-for-field-pair-extensions`: g_ι(V') = ι⁻¹(V'); the image of g_ι is the set of generalisations of
  W = ι⁻¹(C'⁺); g_ι is surjective iff g_ι(s') = s iff W = C⁺; rank-one sources are always surjective and surjectivity is
  stable under composition. Proof by convex hulls of convex subgroups of value groups (Mathlib's overrings of a valuation
  subring); the equivalence of surjectivity with C'⁺ ∩ C = C⁺ is also the Spa clause of
  H1:valuation-exports/surjective-valuation-base-change, which this lemma cites.
- `cohomology-over-geometric-field-pairs`: étale maps to S are local isomorphisms onto opens, S_ét^∼ ≃ Sh(|S|), Γ(S, −) is the
  stalk at s and is exact; hence Hⁱ(Y, F) = (Rⁱf_*F)_s for any f: Y → S, and the pullback along S' → S is the base-change map
  at the geometric point S' → S, preceded by the specialisation map from s to g_ι(s') (the identity iff ι is surjective).
- `field-extension-of-finite-type-approximations`: along any extension ι, X' = X ×_S S' ~ lim Y_I ×_S S', with the
  Y_I ×_S S' topologically of finite type over S', and preimages of descended opens match.
- `connectedness-via-maximal-generalisations`: for qcqs Z over S, Z° = Z ×_S Spa(C, O_C) is the subspace over η, every point
  has its maximal generalisation in Z°, and Z is connected iff Z° is (disconnections of Z° extend by closures).

### Theorems

- `invariance-for-affinoids-of-finite-type` (Hub96 Theorem 4.1.1(c) in the form of ECD Lemma 16.3). ι surjective, n prime
  to p, M a ℤ/nℤ-module, R topologically of finite type over C with any plus ring R⁺ ⊇ im C⁺, U ⊆ Y = Spa(R, R⁺)
  quasicompact open, U' its preimage in Y' = Y ×_S S': Hⁱ(Y_ét, j_!M) → Hⁱ(Y'_ét, j'_!M) is bijective for all i ≥ 0. Proof:
  reformulation as base change at the geometric point S' → S (whose support is s by surjectivity); then Huber's
  4.1.1(c), restated by ECD and cited by Hansen. The algebraizable case — tubes over the closed point for finitely presented
  C⁺-schemes, coefficients j_{V!}M for Zariski-open V — is exported by H1:valuation-exports (tube-cohomology-invariance-export),
  from the formal-model nearby-cycle comparisons 3.5.11, 3.5.13, 3.5.16 (H1:formal-adic-comparison), the invariance 4.2.7 of
  nearby-cycle cohomology along the surjective map Spec C'⁺ → Spec C⁺ and the prime-to-p base change 4.2.4
  (H1:valuation-nearby-cycles). Huber's reduction from there to non-algebraizable affinoids, arbitrary plus rings and
  quasicompact adic opens (strict localisations and continuity from H0, henselian comparisons 3.2.1, 3.2.9–3.2.12 from
  H1:henselian) is in Hub96 §4.1 only and is the stage's gap. Berkovich's Theorem 7.6.1 is the rank-one Berkovich-space
  analogue (public cross-check).
- `invariance-for-perfectoid-affinoids`. Same hypotheses with X affinoid perfectoid over S: Hⁱ(X_ét, j_!M) → Hⁱ(X'_ét, j'_!M)
  is bijective. Proof: finite-type approximation, descent of U, base change of the approximation, Scholze 2012 Corollary 7.18
  (PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison, extending H0's continuity) on both sides, and the classical
  theorem at every finite level. This is the 'more general' claim in ECD's proof of Lemma 16.3, for affinoid X.
- `extension-by-zero-over-geometric-field-pairs` (ECD Lemma 16.3). For X₁ → X₃ ← X₂ spectra of geometric field pairs with
  X₁ → X₃ surjective, U₂ ⊆ X₂ quasicompact open and M killed by n prime to p: Hⁱ((X₁ ×_{X₃} X₂)_ét, j₂!M) = 0 for all i
  unless U₂ = X₂ and i = 0, where it is M.
- `geometric-connectedness-of-finite-type-spaces`. C algebraically closed, C'/C any complete extension, Y quasi-separated
  and locally of finite type over Spa(C, O_C): Y is connected iff Y ×_{Spa(C,O_C)} Spa(C', O_{C'}) is (Conrad Theorem 3.2.1
  through Huber's functor r; the affinoid case, which is what the perfectoid theorem uses, needs only affinoid fibre products).
- `geometric-connectedness-of-perfectoid-base-change` (ECD Lemma 14.6). Z a connected affinoid perfectoid space over
  Spa(C, C⁺) and Spa(C', C'⁺) → Spa(C, C⁺) any morphism: Z ×_{Spa(C,C⁺)} Spa(C', C'⁺) is connected. Proof: reduce to rank one
  by maximal generalisations, approximate Z by the connected components Y_I⁰ of the finite-type approximations, descend a
  disconnection of Z' to some Y_J⁰ ×_S S' (PerfectoidSpaces P5, spectral spaces), contradict the finite-type theorem.

### Dependencies

Inside the roadmap: ClassicalAdicEtaleCohomology:H0 (derived-direct-image, leray-spectral-sequence, etale-sheaves-of-modules,
supports-and-extension-by-zero, geometric-stalks-at-field-pairs, stalk-formula-strict-localisation, huber-tilde-limit,
tilde-limits-and-cohomological-continuity); ClassicalAdicEtaleCohomology:H1:henselian (3.2.1, 3.2.9–3.2.12);
ClassicalAdicEtaleCohomology:H1:formal-adic-comparison (3.5.11, 3.5.13, 3.5.16);
ClassicalAdicEtaleCohomology:H1:valuation-exports (surjective-valuation-base-change, formal-adic-compatibility,
nearby-cycle-invariance-under-surjective-base-change = Hub96 4.2.7, tube-cohomology-invariance-export) and
ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles (4.2.4). Other roadmaps: AdicEtaleGeometry:A0, A1;
AdicSpacesPartII:R0, R1, R2; PerfectoidSpaces:P2, P3, P5, P7; DiamondsAndVStacks:D0; the anchor
`tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`. Consumers: DiamondEtaleCohomology:C0 (ECD 14.5,
14.7 through Lemma 14.6), DiamondEtaleCohomology:C1 (ECD 16.1 through Lemma 16.3 and Lemma 14.6), ClassicalAdicEtaleCohomology:H4
(finite-type bases approximating perfectoid spaces).

### Acceptance tests

- Y = S: for U = S both sides of the classical theorem are M in degree 0 and 0 above; for a quasicompact open U ⊊ S both
  vanish (ECD Lemma 16.3 with X₂ = X₃).
- Surjectivity cannot be dropped: C⁺ of rank two, ι = id: (C, C⁺) → (C, O_C), U = {η} ⊊ S: H⁰(S, j_!M) = 0 but
  H⁰(Spa(C, O_C), M) = M; in Lemma 16.3 form, X₁ = Spa(C, O_C) → X₃ = X₂ = Spa(C, C⁺) gives H⁰(X₁, j₂!M) = M with U₂ ≠ X₂.
- The perfectoid closed unit disc over S: U = {|T| ≤ |ϖ|} descends to the classical disc Y_{{T}}, and the perfectoid theorem
  reduces to the classical disc and its base change.
- Connectedness: the closed unit disc and the perfectoid closed unit disc stay connected over any C'; Spa(C⟨T⟩/(T² − T))
  and S ⊔ S stay disconnected; for connectedness no surjectivity is needed.
- ECD's uses: Lemma 16.3 in case (iii) of Theorem 16.1; Lemma 14.6 in Lemma 14.5(ii) and in case i = 0, V = X' of Theorem 16.1.

### Source notes

Huber's book is not public; Theorem 4.1.1(c) is used only through ECD's restatement (proof of Lemma 16.3) and Hansen's
citation of 4.1.1(c)′ as a qcqs base-change theorem, and Hub96 excerpts are copied from the reviewed decompositions only.
Two findings in ECD are recorded in sourceIssues: a misprint (C for C₃ in the proof of Lemma 16.3) and a gap (the
'more general' claim for an arbitrary perfectoid X₂ is proved only for affinoid X₂, which suffices for the lemma).

<a id="h3"></a>

## H3. Proper support, traces and Poincaré duality for curves


**Dependencies (stage ids).** ClassicalAdicEtaleCohomology:H0 (étale sheaves of modules, derived direct
images, extension by zero, geometric stalks, the stalk formula at strict localisations, constructible
sheaves, local systems, Tate twists); ClassicalAdicEtaleCohomology:H1:henselian (Huber 3.2.5, complete
f-adic rings are henselian); ClassicalAdicEtaleCohomology:H1:formal-adic-comparison (λ_X, the pairs d(X, L),
3.5.11, 3.5.13–3.5.16); ClassicalAdicEtaleCohomology:H2 (invariance under extension of algebraically closed
affinoid fields, entering proper base change; an internal edge H2 → H3); AdicEtaleGeometry:A1 (étale site,
geometric points, strict localisation, splitting of étale maps to Spa(C, C⁺)); AdicEtaleGeometry:A2 (the
relative closed polydisc, dimension); AdicSpacesPartII:R0 (separated, proper, partially proper, +weakly
finite type, smooth, flat, quasi-finite, étale local structure), R1 (Huber's fibre product with schemes,
analytification), R2 (formal schemes of type (S), the generic fibre d, Hub96 1.9.6), R3 (finite locally free
morphisms), R4 (étale sites); DiamondsAndVStacks:D0 (locally spectral spaces, pro-constructible sets, filtered
colimits, Čech); EnhancedDerivedSheaves:E1 (K-injective replacements, unbounded derived categories, derived
tensor); EtaleDualityAndPerverseSheaves:EDC.2 (scheme trace, effacement, curve pairing; the node
EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement); UPSTREAM:ECD:SCH_BC and
UPSTREAM:ECD:SCH_SUPPORT_NOETH (scheme proper base change, local acyclicity of smooth morphisms, scheme Rf_!);
and the Tau Ceti anchor tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry for the
category of adic spaces.

H3 constructs Huber's proper-support direct image on locally noetherian analytic adic spaces and proves the
statements of Huber's Chapter 5 that its consumers use; it then constructs the trace for smooth adic curves over
Spa(C, C⁺) and proves Poincaré duality for them, in the relative and valued-plus-ring forms that ECD's proof of
Theorem 24.1 uses. Consumers: ClassicalAdicEtaleCohomology:H4 (6.2.2 constructibility over finite-type bases,
disc and annulus computations with compact support), ClassicalAdicEtaleCohomology:H5 (algebraic/analytic
comparisons, compactification of curves), DiamondSixOperations:S4 (condition (iii) of ECD 23.10 at points
Spa(C, C⁺)) and DiamondSixOperations:S5 (ECD Theorem 24.1). No result on diamonds, no cohomological smoothness
of diamonds and no right adjoint Rf^! enters any proof of this stage: Poincaré duality is stated through the
duality morphism built from the trace, and consumers that construct Rf^! deduce the identification
Rf^! ≅ f^*(1)[2] by the Yoneda lemma.

**Sources.** Huber's book (Hub96) is not public. Its statements enter through the reviewed decomposition's
verified excerpts (3.2.5, 3.5.3, 3.5.11, 3.5.12–3.5.13, 3.7.2) and through public restatements: ECD (5.1.2,
5.1.5, 5.5.8, 7.2.2, 7.5.3), Zavyalov's foundational paper (2.2.8, 2.3.13, 2.6.1, 4.3.2, 4.4.3, 5.1.2–5.1.6,
5.1.14, 5.2.1–5.2.2, 5.3.1, 5.3.11, 5.4.3), Hansen (2.8.3, 5.1.1, 8.3.5), Bhatt–Hansen (§7), Kedlaya–Liu (5.1.2,
5.1.3), Scholze 2012 (8.3.1), Fargues–Scholze (pseudo-adic fibres, canonical compactification). Proofs follow
Berkovich's IHÉS paper (§§5–7), transplanted to adic spaces, and Berkovich's vanishing cycles paper for the
formal comparison. Proof inputs available only in Hub96 are recorded as gaps (end of this section).

### Conventions

1. **Carriers.** Spaces are locally noetherian analytic adic spaces (AdicSpacesPartII:R0/locally-noetherian-adic-space);
   étale sites are those of AdicEtaleGeometry A1 (identified on these carriers by AdicSpacesPartII R4).
2. **Coefficients.** Λ is a ring with nΛ = 0. Definitions on D⁺ need nothing more; base change, the extension to
   unbounded complexes, cohomological dimension, traces and duality require n invertible in O_Y⁺, i.e. n prime
   to all residue characteristics. For curves over Spa(C, C⁺) this is "n prime to the residue characteristic p
   of C". p-torsion is excluded everywhere: Berkovich Remark 6.2.10 shows the trace isomorphism fails for it.
3. **Twists.** μ_n is the sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n (H0).
4. **Bases Spa(C, C⁺).** C is algebraically closed and complete for a nontrivial nonarchimedean absolute value;
   C⁺ ⊆ C is any open bounded valuation subring (C°° ⊆ C⁺ ⊆ O_C), of any rank. Its points form a chain; the
   closed point s corresponds to C⁺ and the generic point η = Spa(C, O_C). Quasi-compact opens are again of the
   form Spa(C, C⁺_U). Étale maps to Spa(C, C⁺) split near the closed point, so its étale topos is the topos of
   the chain and global sections are exact. Field pairs are never silently replaced by Spa(C, O_C).
5. **Proper support is relative.** H^q_c(X, K) always means H^q(Y, R⁺f_!K) for a named compactifiable f : X → Y.
   Huber's proper support is not compact support on the Hausdorff quotient: the quasi-compact closed disc has
   H²_c(B, μ_n) ≅ ℤ/n although its Berkovich space is compact.
6. **Pseudo-adic supports.** A topologically closed complement (the boundary of a universal compactification,
   the fibre over the closed point of Spa(C, C⁺), the complement of an open disc) is a pseudo-adic support space,
   never an adic subspace.
7. **Duality without Rf^!.** Poincaré duality is the statement that the duality morphism
   Rf_*RHom(G, f^*F(1)[2]) → RHom(Rf_!G, F) is an isomorphism.

### H3.1 Taut spaces, compactifiable morphisms and pseudo-adic supports

`ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms` (definition). A locally spectral space T (DiamondsAndVStacks:D0/locally-spectral-space) is taut if it is quasi-separated (the intersection of two quasi-compact open subsets is quasi-compact) and the closure of every quasi-compact open subset of T is quasi-compact; for quasi-separated T this is equivalent to asking that the closure of every quasi-compact subset be quasi-compact. A spectral map g : T' → T of locally spectral spaces is taut if g⁻¹(W) is taut for every taut open subset W ⊆ T. An adic space, or a morphism of adic spaces, is taut if its underlying locally spectral space, or spectral map, is. Examples fixed by the definition: every quasi-compact quasi-separated space is taut; a quasi-separated space admitting a locally finite covering by quasi-compact open subsets is taut; every quasi-compact quasi-separated spectral map is taut; the composite of taut maps is taut. Non-example: the adic space obtained by gluing two copies of the closed unit disc over an analytic field along the complement of the origin is not taut, because that complement is not quasi-compact.

Hypotheses: T locally spectral; quasi-separatedness is part of the definition, never an extra hypothesis; tautness of a morphism quantifies over taut open subsets of the target, not over quasi-compact ones.

API:

- `AdicSpace.IsTaut` (structure): The predicate on a locally spectral space T: quasi-separated and every quasi-compact open subset has quasi-compact closure.

- `AdicSpace.IsTaut.isCompact_closure` (characterisation): If T is taut and A ⊆ T is quasi-compact then closure(A) is quasi-compact.

- `AdicSpace.IsTaut.of_compactSpace` (instance): A quasi-compact quasi-separated locally spectral space is taut.

- `AdicSpace.IsTaut.of_locallyFinite` (other): A quasi-separated space with a locally finite covering by quasi-compact open subsets is taut.

- `AdicSpace.IsTaut.isOpen_subset` (other): A partially proper open subset of a taut adic space over an analytic field is taut (Kedlaya–Liu 8.2.12(c)).

- `AdicSpace.IsTautMap` (structure): The predicate on a spectral map g : T' → T: g⁻¹(W) is taut for every taut open W ⊆ T.

- `AdicSpace.IsTautMap.of_qcqs` (instance): Quasi-compact quasi-separated spectral maps are taut.

- `AdicSpace.IsTautMap.comp` (functoriality): The composite of taut maps is taut; the identity is taut.

- `AdicSpace.IsTaut.of_isTautMap` (compatibility): If g : T' → T is taut and T is taut then T' is taut.

- `AdicSpace.IsTaut.of_partiallyProper` (compatibility): If f : X → Y is partially proper and Y is a quasi-compact quasi-separated analytic adic space then X is taut (AdicSpacesPartII:R0/partially-proper-closure-quasi-compact).

Unit tests:

- `isTaut_closedDisc` (computation): Spa(K⟨T⟩, K°⟨T⟩) is taut for every complete nonarchimedean field K.

- `isTaut_affineLine` (computation): The adic affine line A^{1,ad}_K is taut but not quasi-compact.

- `not_isTaut_doubledDisc` (non-example): The gluing of two closed unit discs along the complement of the origin is not taut (it is not quasi-separated).

- `isTaut_iff_isCompact_closure_isCompact` (characterisation): For a quasi-separated locally spectral T: IsTaut T ↔ ∀ A ⊆ T, IsCompact A → IsCompact (closure A).

- `isTautMap_of_qcqs` (degenerate): Every quasi-compact quasi-separated spectral map (in particular the identity) is taut.

Acceptance: The closed unit disc Spa(K⟨T⟩, K°⟨T⟩) and every affinoid adic space are taut. The analytic affine line A^{1,ad}_K (AdicSpacesPartII:R1/analytic-affine-space) is taut: the annuli {|ϖ|^{-k} ≤ |T| ≤ |ϖ|^{-k-1}} and the unit disc form a locally finite quasi-compact open cover. The doubled disc of Kedlaya–Liu Remark 8.1.11 is not taut.

`ClassicalAdicEtaleCohomology:H3/compactifiable-morphism` (definition). Let f : X → Y be a morphism of locally noetherian analytic adic spaces (AdicSpacesPartII:R0/locally-noetherian-adic-space). f is compactifiable if it is separated (AdicSpacesPartII:R0/separated-morphism), locally of +weakly finite type (AdicSpacesPartII:R0/plus-weakly-finite-type) and taut (ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms). This is the class on which Huber's proper-support direct image R⁺f_! is defined; it is the class 'separated, taut, locally +-weakly finite type' of Zavyalov's comparison with Hub96 Theorem 5.4.3. Distinguished subclasses: 𝓘, the quasi-compact open immersions; 𝓟, the proper morphisms (AdicSpacesPartII:R0/universally-closed-and-proper-morphism); 𝓔, the compactifiable morphisms that are quasi-compact (equivalently of +weakly finite type). The class contains every proper morphism, every quasi-compact open immersion, every open immersion with taut source, every separated quasi-compact étale morphism (Hub96 Lemma 5.1.3(iv), as quoted by Zavyalov), every separated smooth morphism of finite type between qcqs spaces, and it is closed under composition. It is stable under base change along any morphism of locally noetherian analytic adic spaces when f is quasi-compact (then the base change is again quasi-compact quasi-separated, hence taut).

Hypotheses: X, Y locally noetherian and analytic; no morphism outside this category is called compactifiable; separatedness and the plus-ring condition are those of AdicSpacesPartII R0; 'locally of finite type' (the anchor's notion) implies 'locally of +weakly finite type'; base-change stability is asserted only for quasi-compact f; for a general taut f it is the content of Hub96 Lemma 5.1.3, which is not public.

API:

- `AdicSpace.IsCompactifiable` (structure): The predicate: separated, locally of +weakly finite type and taut.

- `AdicSpace.IsCompactifiable.comp` (functoriality): Composites of compactifiable morphisms are compactifiable; identities are compactifiable.

- `AdicSpace.IsCompactifiable.of_isProper` (instance): Proper morphisms are compactifiable.

- `AdicSpace.IsCompactifiable.of_isOpenImmersion` (instance): Open immersions with taut source are compactifiable; quasi-compact open immersions always are.

- `AdicSpace.IsCompactifiable.of_etale` (instance): Separated quasi-compact étale morphisms are compactifiable (Hub96 Lemma 5.1.3(iv)).

- `AdicSpace.IsCompactifiable.baseChange` (compatibility): If f is compactifiable and quasi-compact then every base change of f along a morphism of locally noetherian analytic adic spaces is compactifiable and quasi-compact.

- `AdicSpace.IsCompactifiable.restrict` (other): If f is compactifiable and V ⊆ X is a taut open subspace then f|_V is compactifiable.

- `AdicSpace.IsCompactifiable.locallyOfPlusWeaklyFiniteType` (projection): A compactifiable morphism is locally of +weakly finite type; in particular it is adic.

Unit tests:

- `isCompactifiable_relBall` (computation): For S = Spa(C, C⁺) the projection B_S → S is compactifiable and quasi-compact.

- `isCompactifiable_openDisc` (computation): The open unit disc D = ⋃_m {|T|^m ≤ |ϖ|} → Spa(C, O_C) is compactifiable and not quasi-compact.

- `not_isCompactifiable_doubledDisc` (non-example): The doubled closed disc → Spa K is locally of finite type but not compactifiable.

- `isCompactifiable_of_isProper` (compatibility): Every proper morphism in the sense of AdicSpacesPartII:R0 is compactifiable.

- `isCompactifiable_id` (degenerate): The identity of a locally noetherian analytic adic space is compactifiable.

Acceptance: The relative closed unit disc B_S → S = Spa(C, C⁺) (AdicEtaleGeometry:A2/relative-closed-polydisc) is compactifiable and quasi-compact, i.e. lies in 𝓔. The open unit disc D → Spa(C, O_C) is compactifiable but not quasi-compact. The doubled disc over Spa K is locally of finite type but neither separated nor taut, hence not compactifiable.

`ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space` (definition; planet “Pseudo-adic support space”). A pseudo-adic support space is a pair (X, S) of a locally noetherian analytic adic space X and a subset S ⊆ |X| that is convex (if s, s' ∈ S and s specialises to x which specialises to s', then x ∈ S) and locally pro-constructible (DiamondsAndVStacks:D0/pro-constructible-subsets). Its étale site (X, S)_ét has the category Et/X of the étale site of X (AdicEtaleGeometry:A1/etale-site) as underlying category and the Grothendieck topology in which a family (U_i → U) is a covering when the images of the U_i cover the points of U lying over S; this topology is finer than the étale topology, so its topos Sh((X, S)_ét, Λ) is a subtopos of Sh(X_ét, Λ): the inclusion i_{S*} is fully faithful with exact left adjoint i_S^* (sheafification for the S-topology). Points: the geometric points of (X, S) are the geometric points of X (AdicEtaleGeometry:A1/etale-site-and-geometric-points) whose support lies in S, and they form a conservative family. Pinned conventions: (i) (X, |X|)_ét = X_ét and, for S open, (X, S)_ét is the étale site of the open adic subspace S; (ii) a closed subset Z ⊆ |X| is convex and pro-constructible, so (X, Z) is a pseudo-adic support space, and for the open complement U there is the recollement triangle j_!j^*K → K → i_{Z*}i_Z^*K → K[1] with j_! of ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero; (iii) a closed subset that is not open is never treated as an adic subspace: the boundary X̄ ∖ X of a universal compactification and the fibre f⁻¹(s) over the closed point s of Spa(C, C⁺) are pseudo-adic support spaces and in general not adic spaces; (iv) for f : X → Y and a subset T ⊆ |Y| with the same properties, f⁻¹(T) is convex and locally pro-constructible when f is spectral, so f induces (X, f⁻¹T) → (Y, T).

Hypotheses: X locally noetherian analytic; S ⊆ |X| convex and locally pro-constructible; Λ a ring; sheaves are sheaves of Λ-modules on Et/X for the S-topology; The site is built on Et/X with a coarser topology; no new adic space is attached to S.

API:

- `AdicSpace.PseudoAdic` (structure): A pair (X, S) with X locally noetherian analytic and S ⊆ |X| convex and locally pro-constructible.

- `AdicSpace.PseudoAdic.site` (data): The Grothendieck topology on Et/X whose coverings are the families surjective over the points of S.

- `AdicSpace.PseudoAdic.restrict` (functoriality): The exact functor i_S^* : Sh(X_ét, Λ) → Sh((X, S)_ét, Λ) and its derived version on D⁺.

- `AdicSpace.PseudoAdic.pushforward` (functoriality): The fully faithful inclusion i_{S*} right adjoint to i_S^*, with i_S^* i_{S*} ≅ id; for S closed it is the pushforward along the closed subset.

- `AdicSpace.PseudoAdic.ofClosed` (constructor): Every closed subset of |X| gives a pseudo-adic support space.

- `AdicSpace.PseudoAdic.ofOpen` (constructor): Every open subset gives a pseudo-adic support space equivalent to the open adic subspace.

- `AdicSpace.PseudoAdic.stalk` (characterisation): Geometric points of (X, S) are geometric points of X supported in S; stalks of i_S^*F are stalks of F; they are conservative.

- `AdicSpace.PseudoAdic.recollement` (relation): For Z closed with complement U: the triangle j_!j^* → id → i_{Z*}i_Z^*.

- `AdicSpace.PseudoAdic.comap` (functoriality): A morphism f : X → Y and T ⊆ |Y| convex locally pro-constructible give (X, f⁻¹T) → (Y, T) with pullback compatible with i^*.

- `AdicSpace.PseudoAdic.closedFibre` (constructor): For f : X → Spa(C, C⁺) the closed fibre (X, f⁻¹(s)).

Unit tests:

- `pseudoAdic_univ` (degenerate): For S = |X| the site (X, S)_ét is X_ét and i_S^* is the identity.

- `pseudoAdic_closedPoint` (computation): For S = Spa(C, C⁺) and its closed point s, global sections on (S, {s}) is the stalk at s and is exact.

- `boundaryPoint_not_isOpen` (non-example): In the universal compactification B̄ of the closed disc over Spa(C, O_C) the boundary point x_∞ is closed and not open: {x_∞} is not an adic subspace, although (B̄, {x_∞}) is a pseudo-adic support space.

- `pseudoAdic_recollement` (compatibility): For Z closed with open complement U, j_!j^*K → K → i_{Z*}i_Z^*K is a distinguished triangle in D⁺(X_ét, Λ).

- `pseudoAdic_open` (characterisation): For S open, (X, S)_ét is equivalent to the étale site of the open adic subspace S.

Acceptance: For S = Spa(C, C⁺) and its closed point s, Sh((S, {s})_ét) is equivalent to the category of sets (Λ-modules) and H^q((S,{s}), F) = 0 for q > 0. In the universal compactification B̄ = B ∪ {x_∞} of the closed unit disc over Spa(C, O_C), {x_∞} is closed and not open, so (B̄, {x_∞}) is a pseudo-adic support space and not an adic subspace. Huber's d(X, L) = (d(X), λ_X⁻¹(L)) of H1:formal-adic-comparison is an instance with X = d(𝔛).

### H3.2 The universal compactification and the proper-support direct image

`ClassicalAdicEtaleCohomology:H3/universal-compactification` (construction; planet “Universal compactification”). Let f : X → Y be compactifiable (ClassicalAdicEtaleCohomology:H3/compactifiable-morphism). There are an adic space X̄ = X̄^{/Y}, an open embedding j : X → X̄ and a partially proper morphism f̄ : X̄ → Y (AdicSpacesPartII:R0/partially-proper-morphism) with f = f̄ ∘ j, such that for every partially proper morphism g : Z → Y composition with j is a bijection Hom_Y(X̄, Z) → Hom_Y(X, Z). Affinoid charts: if Y = Spa(A, A⁺) and X = Spa(B, B⁺) with B topologically of finite type over A, then X̄ = Spa(B, B'⁺) where B'⁺ ⊆ B⁺ is the integral closure in B of the subring generated by the image of A⁺ and the topologically nilpotent elements B°°, and j is the identity of B. The rank-one points of X̄ and of X coincide; every point of X̄ ∖ j(X) is a specialisation of a point of j(X), and X̄ ∖ j(X) is closed, generally not open, and is treated only as a pseudo-adic support space (ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space). The construction is functorial in f, compatible with open immersions into X and with base change along Y' → Y when f is quasi-compact ((X ×_Y Y')‾^{/Y'} = X̄^{/Y} ×_Y Y'), and X̄ = X when f is partially proper.

Hypotheses: f compactifiable: separated, locally of +weakly finite type, taut; Y locally noetherian analytic; X̄ is in general not locally of finite type over Y (its plus rings are minimal), so f̄ is partially proper but not smooth even when f is smooth.

API:

- `AdicSpace.compactification` (data): The adic space X̄^{/Y} for a compactifiable f : X → Y.

- `AdicSpace.compactification.ι` (data): The open embedding j : X → X̄^{/Y}.

- `AdicSpace.compactification.proj` (data): The partially proper morphism f̄ : X̄^{/Y} → Y with f̄ ∘ j = f.

- `AdicSpace.compactification.isPartiallyProper` (instance): f̄ is partially proper.

- `AdicSpace.compactification.lift` (universal-property): For g : Z → Y partially proper and h : X → Z over Y, the unique h̄ : X̄ → Z over Y with h̄ ∘ j = h.

- `AdicSpace.compactification.lift_comp_ι` (universal-property): lift h ∘ j = h.

- `AdicSpace.compactification.hom_ext` (extensionality): Two Y-morphisms X̄ → Z to a partially proper Z that agree after composing with j are equal.

- `AdicSpace.compactification.affinoid` (characterisation): For X = Spa(B, B⁺) → Y = Spa(A, A⁺), X̄ = Spa(B, B'⁺) with B'⁺ the integral closure of A⁺·1 + B°° in B.

- `AdicSpace.compactification.rankOne_points` (other): j induces a bijection on points of rank one; every point of X̄ specialises from a point of j(X).

- `AdicSpace.compactification.baseChange` (compatibility): For f quasi-compact and Y' → Y, the canonical map (X ×_Y Y')‾^{/Y'} → X̄^{/Y} ×_Y Y' is an isomorphism.

- `AdicSpace.compactification.map` (functoriality): Functoriality in f for commutative squares, with map_id and map_comp.

Unit tests:

- `compactification_closedDisc` (computation): For the closed unit disc B over Spa(C, O_C), B̄ ∖ B consists of exactly one point, which is closed in B̄.

- `compactification_of_isProper` (degenerate): If f is proper then j : X → X̄ is an isomorphism.

- `compactification_openDisc` (degenerate): For the partially proper open unit disc D → Spa(C, O_C), D̄ = D.

- `compactification_not_smooth` (non-example): For the closed unit disc B → Spa(C, O_C), B̄ → Spa(C, O_C) is partially proper but not locally of finite type, hence not smooth: the compactification is not P¹ and not the closed disc.

- `compactification_lift_comp` (characterisation): For P¹ → Spa(C, O_C) (proper) and the inclusion B ⊆ P¹, the induced map B̄ → P¹ is injective with image the closure of B.

Acceptance: Closed unit disc over S = Spa(C, O_C): X̄ = Spa(C⟨T⟩, B'⁺) with B'⁺ the integral closure of O_C + C°°⟨T⟩; X̄ ∖ X is the single rank-two point x_∞ specialising the Gauss point in the direction T → ∞. If f is proper then X̄ = X and j is the identity. For the open unit disc D over Spa(C, O_C), which is partially proper, D̄ = D.

`ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation` (lemma). Let f : X → Y be compactifiable and quasi-compact (i.e. of +weakly finite type), with universal compactification f = f̄ ∘ j (ClassicalAdicEtaleCohomology:H3/universal-compactification). Then (i) f̄ : X̄ → Y is proper; (ii) j is a quasi-compact open immersion; (iii) f and f̄ have the same rank-one fibres, so dim f̄ = dim f for the relative dimension computed on rank-one fibres (AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres) and the topological transcendence dimensions of ECD Definition 21.1–21.2 agree. In particular every f ∈ 𝓔 factors as f = p ∘ i with i ∈ 𝓘 and p ∈ 𝓟.

Hypotheses: f compactifiable and quasi-compact; Y locally noetherian analytic.

Proof outline: (1) (i) f̄ is partially proper; on affinoid charts X̄ = Spa(B, B'⁺) is quasi-compact over Spa(A, A⁺), so f̄ is quasi-compact when f is, and proper = partially proper + quasi-compact (AdicSpacesPartII:R0/proper-iff-partially-proper-quasi-compact). (2) (ii) On affinoid charts j is the identity of B, a rational subset in Spa(B, B'⁺) cut out by |b| ≤ 1 for finitely many b ∈ B⁺ generating B⁺ over B'⁺ up to integral closure (local +weak finiteness), hence quasi-compact; quasi-compactness is local on the target. (3) (iii) Rank-one points of X̄ and X coincide (API compactification.rankOne_points), and for lft f the relative dimension is detected on rank-one fibres (AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres); the transcendence-degree dimension depends only on completed residue fields of maximal generalisations. The general equality dim.tr f̄ = dim.tr f is Hub96 Corollary 5.1.14 as quoted by Zavyalov.

Acceptance: For the closed unit disc over Spa(C, C⁺), B → B̄ is a quasi-compact open immersion and B̄ → Spa(C, C⁺) is proper of relative dimension 1. Non-example: for the open unit disc (not quasi-compact) the compactification is D itself and D → Spa(C, O_C) is partially proper but not proper.

`ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek` (construction). Let f : X → Y be a partially proper morphism of locally noetherian analytic adic spaces with f taut (so f is compactifiable) and Λ a ring. For an étale sheaf F of Λ-modules on X, f_!F ⊆ f_*F is the subsheaf whose sections over V ∈ Y_ét are the s ∈ F(X ×_Y V) whose support supp(s) (a closed subset of X ×_Y V) is quasi-compact over V: supp(s) ∩ f⁻¹(W) is quasi-compact for every quasi-compact open W ⊆ V. Equivalently, when Y is affinoid, f_!F = colim_U f_*(j_{U!}(F|_U)) over the filtered system of quasi-compact open subsets U ⊆ X, where j_U : U → X is the inclusion (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). f_! : Sh(X_ét, Λ) → Sh(Y_ét, Λ) is left exact, commutes with filtered colimits, equals f_* when f is proper, and R⁺f_! denotes its right derived functor on D⁺(X_ét, Λ) (via injective resolutions, ClassicalAdicEtaleCohomology:H0/derived-direct-image). Stalk formula: for a geometric point ȳ = Spa(C, C⁺) → Y, (f_!F)_ȳ is the group of sections of F over X ×_Y Spa(C, C⁺) with support quasi-compact.

Hypotheses: f partially proper and taut; Y locally noetherian analytic; supports are quasi-compact relative to the base, never compact in a Hausdorff sense: the relevant spaces are not Hausdorff.

API:

- `AdicSpace.properSupportSections` (data): The subsheaf f_!F ⊆ f_*F of sections with support quasi-compact over the base.

- `AdicSpace.properSupportSections.le_pushforward` (projection): The inclusion f_!F → f_*F, natural in F.

- `AdicSpace.properSupportSections.eq_of_isProper` (compatibility): For proper f the inclusion is an isomorphism.

- `AdicSpace.properSupportSections.colim` (characterisation): The colimit description over quasi-compact opens for affinoid Y.

- `AdicSpace.properSupportSections.leftExact` (instance): f_! is left exact and additive.

- `AdicSpace.properSupportSections.preservesFilteredColimits` (instance): f_! commutes with filtered colimits of sheaves.

- `AdicSpace.properSupportSections.stalk` (characterisation): (f_!F)_ȳ = sections over X ×_Y Spa(C, C⁺) with quasi-compact support.

- `AdicSpace.properSupportSections.comp` (functoriality): (g ∘ f)_! = g_! ∘ f_! for composable partially proper taut morphisms.

- `AdicSpace.RProperSupportSections` (data): The right derived functor R⁺f_! : D⁺(X_ét, Λ) → D⁺(Y_ét, Λ).

Unit tests:

- `partiallyProperLowerShriek_openDisc` (computation): For f : D → Spa(C, O_C) the open unit disc and Λ = ℤ/n, f_!Λ = 0.

- `partiallyProperLowerShriek_eq_pushforward_of_isProper` (compatibility): If f is proper then f_! = f_* as subfunctors.

- `partiallyProperLowerShriek_id` (degenerate): For f = id, f_! = id.

- `partiallyProperLowerShriek_ne_pushforward` (non-example): For the open unit disc, f_!Λ ≠ f_*Λ: the unit section has non-quasi-compact support.

- `partiallyProperLowerShriek_colim` (characterisation): For Y affinoid, f_!F ≅ colim_U f_*(j_{U!}(F|_U)) over quasi-compact opens U ⊆ X.

Acceptance: For the open unit disc f : D → Spa(C, O_C), f_!Λ = 0 while f_*Λ = Λ. For P¹ → Spa(C, C⁺) (proper), f_! = f_*.

`ClassicalAdicEtaleCohomology:H3/proper-support-direct-image` (construction; planet “Proper-support direct image”). Let f : X → Y be compactifiable (ClassicalAdicEtaleCohomology:H3/compactifiable-morphism), f = f̄ ∘ j its universal compactification (ClassicalAdicEtaleCohomology:H3/universal-compactification) and Λ a ring. The proper-support direct image is R⁺f_! := R⁺f̄_! ∘ j_! : D⁺(X_ét, Λ) → D⁺(Y_ét, Λ), where j_! is extension by zero along the open embedding j (exact; ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero) and R⁺f̄_! is the derived functor of sections with proper support for the partially proper f̄ (ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek). Its cohomology sheaves are R^q f_!K, and for Y = Spa(C, C⁺) the groups H^q_c(X, K) := H^q(Y, R⁺f_!K) = (R^q f_!K)(Y) are the compactly supported cohomology groups (global sections over Spa(C, C⁺) is exact). There is a natural forget-supports transformation R⁺f_! → R⁺f_*, an isomorphism when f is proper. When f is quasi-compact, R⁺f_! ≅ Rf̄_* ∘ j_! with f̄ proper (ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation). When nΛ = 0 with n invertible in O_Y⁺ and f has finite relative dimension, R⁺f_! has finite cohomological dimension (ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension) and extends uniquely to a triangulated functor Rf_! : D(X_ét, Λ) → D(Y_ét, Λ) commuting with direct sums, computed on K-injective replacements (EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements).

Hypotheses: f compactifiable between locally noetherian analytic adic spaces; Λ any ring for the definition on D⁺; the unbounded extension, base change and duality statements require nΛ = 0 with n invertible in O_Y⁺; H^q_c is always relative to the base; for the absolute case the base is Spa(C, C⁺) and C⁺ is part of the data.

API:

- `AdicSpace.lowerShriek` (data): The triangulated functor R⁺f_! : D⁺(X_ét, Λ) → D⁺(Y_ét, Λ) for compactifiable f.

- `AdicSpace.lowerShriek_def` (characterisation): R⁺f_! ≅ R⁺f̄_! ∘ j_! for the universal compactification.

- `AdicSpace.lowerShriek_of_isCompact` (characterisation): For quasi-compact f, R⁺f_! ≅ Rf̄_* ∘ j_! with f̄ proper.

- `AdicSpace.lowerShriekToPushforward` (data): The natural transformation R⁺f_! → R⁺f_* (forget supports).

- `AdicSpace.lowerShriekToPushforward_isIso_of_isProper` (compatibility): It is an isomorphism for proper f.

- `AdicSpace.compactCohomology` (data): H^q_c(X/Y, K) := H^q(Y, R⁺f_!K); for Y = Spa(C, C⁺) it is (R^q f_!K)(Y).

- `AdicSpace.lowerShriek_shift` (simp): R⁺f_!(K[m]) = (R⁺f_!K)[m], and R⁺f_! sends distinguished triangles to distinguished triangles.

- `AdicSpace.lowerShriekUnbounded` (data): Under finite cohomological dimension, the extension Rf_! : D(X_ét, Λ) → D(Y_ét, Λ), commuting with direct sums and agreeing with R⁺f_! on D⁺.

- `AdicSpace.lowerShriek.map_comp` (functoriality): Composition isomorphisms R(g ∘ f)_! ≅ Rg_! ∘ Rf_! (ClassicalAdicEtaleCohomology:H3/lower-shriek-composition).

Unit tests:

- `lowerShriek_relBall` (computation): For B → Spa(C, O_C) and n invertible in O_C, R²f_!μ_n ≅ ℤ/n and R^q f_!μ_n = 0 for q ≠ 2.

- `lowerShriek_eq_pushforward_of_isProper` (compatibility): For proper f the forget-supports map R⁺f_! → R⁺f_* is an isomorphism.

- `lowerShriek_openImmersion` (degenerate): For an open immersion j with taut source, R⁺j_! is extension by zero j_!.

- `lowerShriek_ne_pushforward_closedDisc` (non-example): For the closed unit disc over Spa(C, O_C), H⁰_c(B, Λ) = 0 ≠ H⁰(B, Λ) = Λ: compact support is not full cohomology even though B is quasi-compact.

- `lowerShriek_ne_berkovich` (non-example): H²_c(B, μ_n) ≅ ℤ/n, whereas the cohomology with compact support of the compact Berkovich disc E(0, 1) vanishes in degree 2: Huber's proper support is not compact support on the Hausdorff quotient.

Acceptance: For the closed unit disc f : B → Spa(C, O_C) and n invertible in O_C: R²f_!μ_n ≅ ℤ/n and R^q f_!μ_n = 0 for q ≠ 2, while Rf_*μ_n = μ_n in degree 0 (ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support). For an open immersion j with taut source, R⁺j_! = j_! (ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases).

### H3.3 Proper base change, independence and composition

`ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing` (lemma). Let C be an algebraically closed field complete for a nontrivial nonarchimedean absolute value, C⁺ ⊆ C an open and bounded valuation subring, S = Spa(C, C⁺) with closed point s, f : X → S a proper morphism with X locally noetherian, and Λ with nΛ = 0 for some n invertible in C⁺. Let X_s = (X, f⁻¹(s)) be the pseudo-adic closed fibre (ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space). Then for every K ∈ D⁺(X_ét, Λ) the restriction map RΓ(X, K) → RΓ(X_s, K|_{X_s}) is an isomorphism; equivalently, RΓ(X, K) = 0 whenever K|_{X_s} = 0, e.g. for K = j'_!L with j' : f⁻¹(S ∖ {s}) → X the open complement.

Hypotheses: f proper (AdicSpacesPartII:R0), X locally noetherian analytic; n invertible in C⁺: the p-torsion analogue is not asserted; X_s is a pseudo-adic support space, not an adic subspace.

Proof outline: (1) Equivalence of the two forms: the recollement triangle j'_!j'^*K → K → i_{s*}i_s^*K for the closed subset f⁻¹(s) and its open complement (ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space) reduces the isomorphism to RΓ(X, j'_!L) = 0. (2) Dévissage: RΓ(X, −) commutes with filtered colimits on the quasi-compact quasi-separated X (DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites), every torsion sheaf is a filtered colimit of constructible sheaves (ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves), and bounded below complexes reduce to sheaves by the hypercohomology spectral sequence; so it suffices to treat L constructible. (3) Algebraisable case: if X = d(𝒫̂) for a proper flat finitely presented C⁺-scheme 𝒫 and L is the pullback of a constructible sheaf on the generic fibre, the statement is ClassicalAdicEtaleCohomology:H3/formal-model-transfer combined with ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change: both sides are computed on the special fibre 𝒫 ⊗ C⁺/ϖ, the right side on its fibre over the closed point of Spec(C⁺/ϖ) (Hub96 3.5.16, ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16), and these agree by proper base change for schemes over the strictly henselian valuation ring C⁺/C°° (UPSTREAM:ECD:SCH_BC). (4) General case: Hub96 Proposition 4.4.3, as quoted by Zavyalov. Its proof is not public (gap: proper base change at the closed point for non-algebraisable proper X). The public route is ECD Theorem 19.2: reduce to a Zariski–Riemann space of an algebraically closed field (ECD Lemma 19.4), where the statement follows from proper base change for schemes; transplanting this reduction to proper adic spaces over Spa(C, C⁺) requires a cover of X by spaces of the form Spa(C', C'⁺)-families, which the diamond proof supplies and the classical setting does not.

Acceptance: X = P¹_S = P^{1,ad} over S = Spa(C, C⁺) and K = Λ: H^q(P¹_S, Λ) ≅ H^q(P¹_{k_s}, Λ) with k_s the residue field of C⁺ (algebraically closed): Λ, 0, Λ(−1) in degrees 0, 1, 2. If C⁺ = O_C then f⁻¹(s) = |X| and the statement is empty.

`ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero` (theorem; planet “Proper base change”). Let f : X → Y be a proper morphism of locally noetherian analytic adic spaces, j : U → Y an étale morphism (for instance an open immersion), g : X_U = X ×_Y U → U and j' : X_U → X the base changes, and Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺ (equivalently, n prime to the residue characteristic of every point of Y). The natural transformation α : j_! Rg_* → Rf_* j'_!, adjoint to f^*j_!Rg_* ≅ j'_!g^*Rg_* → j'_! (base change for j_!, ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero, followed by the counit), is an isomorphism of functors D⁺(X_{U,ét}, Λ) → D⁺(Y_ét, Λ); if Rf_* has finite cohomological dimension it is an isomorphism on D(X_{U,ét}, Λ). Equivalently, R f_* commutes with restriction to the pseudo-adic closed complement of U: this is the classical meaning of ECD's Theorem 19.2.

Hypotheses: f proper; Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺ (equivalently, n prime to the residue characteristic of every point of Y); j étale; the case of open immersions is the one used for the compactly supported pushforward.

Proof outline: (1) Definition of α as stated (Zavyalov, Proposition 9.3, proof of Part (1)). (2) Locality: the question is étale local on Y and U, so Y, U may be taken affinoid; by Huber's Lemma 2.2.8 (AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation) j is locally an open immersion followed by a finite étale map, and it suffices to treat these two cases. (3) Finite étale j: étale locally on Y, U is a disjoint union of copies of Y, where α is evidently an isomorphism. (4) Open immersion j: by way-out arguments (on D⁺; on D under the finite cohomological dimension hypothesis of the statement) reduce to K a sheaf; check on stalks at geometric points ȳ = Spa(C, C⁺) → Y. By the stalk formula for proper pushforward (Hub96 2.6.1, ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation) and base change for j_!, both sides become global sections over X ×_Y Spa(C, C⁺) → Spa(C, C⁺) with U replaced by its preimage, an open subset of Spa(C, C⁺). (5) If the preimage is all of Spa(C, C⁺) the map is the identity; otherwise the left side has zero stalk at the closed point and the right side is RΓ(X ×_Y Spa(C, C⁺), j'_!K), which vanishes by ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing.

Acceptance: For Y = Spa(C, C⁺), U = Spa(C, O_C) its generic point and X = P¹_Y: both sides of α applied to Λ have zero stalk at the closed point. For U = Y, α is the identity.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence` (theorem). Let f : X → Y be compactifiable and quasi-compact, and let f = p ∘ i be any factorisation with i : X → P a quasi-compact open immersion and p : P → Y proper. Then there is a canonical isomorphism R⁺f_! ≅ Rp_* ∘ i_! of functors D⁺(X_ét, Λ) → D⁺(Y_ét, Λ), for every torsion ring Λ with n invertible in O_Y⁺, and these isomorphisms are compatible with morphisms of factorisations (a proper Y-morphism h : P → P' with h ∘ i = i') and transitive for composites of such morphisms.

Hypotheses: f compactifiable and quasi-compact; i a quasi-compact open immersion, p proper; Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺ (equivalently, n prime to the residue characteristic of every point of Y).

Proof outline: (1) Comparison map: by the universal property of X̄ = X̄^{/Y} (ClassicalAdicEtaleCohomology:H3/universal-compactification) there is a unique Y-morphism h : X̄ → P with h ∘ j = i; h is proper by cancellation, since f̄ = p ∘ h is proper and p is separated (AdicSpacesPartII:R0/proper-of-comp-separated). (2) h⁻¹(i(X)) = j(X): a point of X̄ is given by Spa(K, K⁺) → Y with Spa(K, K°) → X, and it maps into i(X) exactly when the whole Spa(K, K⁺) maps to X; by separatedness of f and the valuative description of X̄ it then lies in j(X). (3) Hence the square formed by j, i, h and id_X is cartesian, and proper base change for extension by zero (ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero, applied to h and the open immersion i) gives i_! ≅ i_! R id_* ≅ Rh_* j_!. (4) Therefore Rp_* i_! ≅ Rp_* Rh_* j_! ≅ Rf̄_* j_! = R⁺f_! (ClassicalAdicEtaleCohomology:H3/proper-support-direct-image, quasi-compact case). (5) Compatibility and transitivity: for h' : P → P' as in the statement, uniqueness in the universal property forces the comparison maps to compose, and the isomorphisms of the previous steps are natural in the cartesian squares.

Acceptance: X = B_S the closed ball over S = Spa(C, C⁺), P = P¹_S, i the inclusion {|T| ≤ 1} ⊆ P¹: R⁺f_!Λ ≅ R(p)_* i_!Λ, which computes H^q_c(B_S) from P¹_S and the pseudo-adic complement {|T| > 1}‾. For f proper and the trivial factorisation, the isomorphism is the identity of Rf_*.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-composition` (theorem). Let f : X → Y and g : Y → Z be compactifiable morphisms of locally noetherian analytic adic spaces and Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Z⁺ (equivalently, n prime to the residue characteristic of every point of Y). There is a canonical isomorphism R⁺(g ∘ f)_! ≅ R⁺g_! ∘ R⁺f_! of functors D⁺(X_ét, Λ) → D⁺(Z_ét, Λ), associative for triples and unital (R⁺id_! = id), and compatible with the forget-supports maps to R⁺(g ∘ f)_* ≅ R⁺g_* ∘ R⁺f_*.

Hypotheses: f, g compactifiable; n invertible in O_Z⁺ (and hence in O_Y⁺, O_X⁺).

Proof outline: (1) Quasi-compact case: let X ⊆ X̄ → Y and Y ⊆ Ȳ → Z be the compactifications (ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation). The composite X̄ → Y → Ȳ is compactifiable and quasi-compact; compactify it as X̄ ⊆ W → Ȳ. Then X ⊆ X̄ ⊆ W is a quasi-compact open immersion and W → Ȳ → Z is proper (AdicSpacesPartII:R0/proper-comp), so by ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence R(g ∘ f)_! ≅ R(W → Z)_* ∘ (X → W)_!. (2) The cartesian square formed by X̄ → Y, W → Ȳ and the open immersion Y ⊆ Ȳ and proper base change for extension by zero (ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero) give (Y ⊆ Ȳ)_! ∘ Rf̄_* ≅ R(W → Ȳ)_* ∘ (X̄ ⊆ W)_!; composing yields R⁺g_! R⁺f_! ≅ R(g ∘ f)_!. (3) General case: reduce to quasi-compact opens by ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion and use that for partially proper morphisms (g ∘ f)_! = g_! ∘ f_! on sheaves with f_! carrying injectives to g_!-acyclics (ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek); this is Hub96 Theorem 5.4.3 as restated by Zavyalov. (4) Associativity and unitality follow from the transitivity clause of the independence theorem.

Acceptance: For X → Y the inclusion of the open unit disc into the closed unit disc over Spa(C, O_C) and g the structure map, R⁺(g ∘ f)_!Λ ≅ R⁺g_!(j_!Λ), giving H²_c(D, μ_n) ≅ H²_c(B, j_!μ_n) ≅ ℤ/n.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases` (lemma). Let f : X → Y be compactifiable and Λ a ring. (a) If f is proper, the forget-supports map R⁺f_! → R⁺f_* is an isomorphism. (b) If f is partially proper, R⁺f_! is the right derived functor of the functor f_! of sections with proper support (ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek). (c) If f = j is an open immersion with taut source, R⁺j_! is extension by zero j_!, which is exact and left adjoint to j^*. (d) If f is étale, separated and quasi-compact and nΛ = 0 with n invertible in O_Y⁺, R⁺f_! ≅ f_!, the exact left adjoint of f^* (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero), and R^q f_! = 0 for q > 0.

Hypotheses: f compactifiable; (d) needs n invertible in O_Y⁺ through proper base change.

Proof outline: (1) (a) For proper f, X̄ = X (ClassicalAdicEtaleCohomology:H3/universal-compactification) and f_! = f_* (ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek). (2) (b) For partially proper f, X̄ = X and j = id, so R⁺f_! = R⁺f̄_! by definition. (3) (c) For an open immersion j : X → Y with taut source, the universal compactification of j is X ⊆ X̄ → Y with X̄ → Y partially proper and injective on rank-one points; the sections of f̄_!(j'_!F) over V are the sections of F over X ∩ V whose closure in V stays inside X, i.e. (j_!F)(V); the higher derived functors vanish because j'_! is exact and f̄_! is exact on sheaves supported on X (checked on stalks). (4) (d) Separated quasi-compact étale f factors, locally on Y, as an open immersion followed by a finite étale map (AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation); for finite étale f, f_* is exact and equals the left adjoint f_! of f^* (étale-locally f is a disjoint union of isomorphisms); glue using independence of the factorisation (ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence), which uses proper base change.

Acceptance: For the inclusion j : D ⊆ B of the open disc into the closed disc, R⁺j_!Λ = j_!Λ. For the degree-n Kummer covering of the unit annulus {|T| = 1} over Spa(C, O_C), R⁺f_!Λ = f_*Λ is locally free of rank n.

### H3.4 Base change, projection formula, localisation and cohomological dimension

`ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change` (theorem). Let f : X → Y be a proper morphism of locally noetherian analytic adic spaces, g : Y' → Y any morphism of locally noetherian analytic adic spaces with base change f' : X' = X ×_Y Y' → Y', g' : X' → X, and Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺. The base change transformation g^* Rf_* → Rf'_* g'^* is an isomorphism of functors D⁺(X_ét, Λ) → D⁺(Y'_ét, Λ), and on D(X_ét, Λ) when Rf_* has finite cohomological dimension.

Hypotheses: f proper; g arbitrary between locally noetherian analytic adic spaces; Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺.

Proof outline: (1) Reduction to sheaves and stalks: by way-out arguments it suffices to treat a sheaf F and to check the map on stalks at geometric points ȳ' = Spa(C', C'⁺) → Y' (AdicEtaleGeometry:A1/etale-enough-points). (2) Stalk formula: for proper f the stalk (R^q f_*F)_ȳ equals H^q(X ×_Y Y(ȳ), F) for the strict localisation Y(ȳ) ≅ Spa(C, C⁺) (Hub96 2.6.1, ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation; AdicEtaleGeometry:A1/strict-localisation-analytic), and likewise on Y'; this reduces the claim to the map Spa(C', C'⁺) → Spa(C, C⁺) of strict localisations, which is surjective (the closed point maps to the closed point and generalisations lift). (3) Proper base change at the closed point (ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing) identifies both sides with the cohomology of the pseudo-adic closed fibres over Spa(C, C⁺) and Spa(C', C'⁺). (4) Invariance under the extension Spa(C', C'⁺) → Spa(C, C⁺) of algebraically closed affinoid fields with surjective map of spectra: this is the classical invariance theorem owned by ClassicalAdicEtaleCohomology:H2 (Hub96 Theorem 4.1.1(c) and Corollary 4.3.2, the latter quoted by Zavyalov for exactly this step).

Acceptance: For Y' = Spa(C, O_C) ⊆ Y = Spa(C, C⁺) the generic point and X = P¹_Y, the theorem identifies (Rf_*Λ)|_{Y'} with Rf'_*Λ = RΓ(P¹_C, Λ). For g an open immersion the statement is the restriction of Rf_* to an open subset, which is formal.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change` (theorem). Let f : X → Y be compactifiable and quasi-compact, g : Y' → Y a morphism of locally noetherian analytic adic spaces, f' : X' → Y' and g' : X' → X the base changes, and Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺. There is a canonical isomorphism g^* R⁺f_! ≅ R⁺f'_! g'^* of functors D⁺(X_ét, Λ) → D⁺(Y'_ét, Λ). For compactifiable f that is not quasi-compact the same holds when g is an open immersion or when f' is again compactifiable, via the quasi-compact exhaustion. Two special cases: the stalk of R^q f_!K at a geometric point Spa(C, C⁺) → Y is H^q_c(X ×_Y Spa(C, C⁺), K) (compact support relative to Spa(C, C⁺)); and restriction of R⁺f_! to an open U ⊆ Y is R⁺(f_U)_! of the restriction.

Hypotheses: f compactifiable and quasi-compact (general f through ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion); Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺.

Proof outline: (1) Factorisation: by ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation, f = f̄ ∘ j with j a quasi-compact open immersion and f̄ proper; their base changes f̄' and j' give a factorisation of f' of the same kind (AdicSpacesPartII:R0/proper-base-change), so R⁺f'_! ≅ Rf̄'_* j'_! by ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence. (2) g^*Rf̄_* ≅ Rf̄'_* ḡ^* by ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change, and ḡ^* j_! ≅ j'_! g'^* by base change for extension by zero (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). (3) Composing gives the isomorphism; independence of the factorisation makes it canonical. (4) The stalk formula is the case of g a geometric point, using that global sections over Spa(C, C⁺) are exact.

Acceptance: For S = Spa(C, C⁺), the ball B_S → S and g the inclusion of the generic point Spa(C, O_C): (R^q f_!Λ)|_{Spa(C,O_C)} = R^q f_{C!}Λ. For a geometric point over a point x of a curve family, the stalk of R²f_!μ_n is H²_c of the geometric fibre.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula` (lemma). Let f : X → Y be compactifiable of finite relative dimension and Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺. For K ∈ D(X_ét, Λ) and G ∈ D(Y_ét, Λ) there is a natural isomorphism Rf_!K ⊗^L_Λ G ≅ Rf_!(K ⊗^L_Λ f^*G), functorial in K and G and compatible with composition of morphisms; on D⁺ it holds when G has finite Tor-dimension or K, G ∈ D⁻ ∩ D⁺-bounded as in Berkovich 5.3.9.

Hypotheses: f compactifiable of finite relative dimension (so Rf_! is defined on unbounded complexes); Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺.

Proof outline: (1) The map is defined for proper f from the adjunction and for extension by zero j_! from the formula j_!(A ⊗ j^*B) ≅ j_!A ⊗ B (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero); compose along f = f̄ ∘ j. (2) Extension by zero: the formula for étale j is proved via Yoneda from the adjunctions (Zavyalov, Lemma 9.2(2)). (3) Proper f̄: reduce by homotopy colimits to G bounded, then to a sheaf, then to G = j_{V!}Λ for étale V → Y (every sheaf is a colimit of such); for these the formula follows from proper base change for extension by zero (ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero), as in Zavyalov, Proposition 9.3(2). (4) Commutation with direct sums (ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums) and derived tensor products from K-flat replacements (EnhancedDerivedSheaves:E1/presentability-and-derived-tensor) make the colimit reductions valid.

Acceptance: For f : B_S → S the ball and G = Λ' a Λ-module viewed as a constant sheaf: Rf_!(Λ) ⊗ Λ' = Rf_!(Λ'), so H²_c(B_S, Λ') = H²_c(B_S, Λ) ⊗ Λ'. Tate twists: Rf_!(K(m)) ≅ (Rf_!K)(m) (ClassicalAdicEtaleCohomology:H0/tate-twists).

`ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle` (lemma). Let f : X → Y be compactifiable, U ⊆ X an open subspace with taut source (so f_U = f|_U is compactifiable), Z = X ∖ U with its pseudo-adic support structure (ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space), and Λ a ring. For K ∈ D⁺(X_ét, Λ) there is a distinguished triangle R⁺(f_U)_!(K|_U) → R⁺f_!K → R⁺f_!(i_{Z*}i_Z^*K) → R⁺(f_U)_!(K|_U)[1], natural in K. For Y = Spa(C, C⁺) this is the long exact sequence ⋯ → H^q_c(U, K) → H^q_c(X, K) → H^q_c((X, Z), K) → H^{q+1}_c(U, K) → ⋯, where H^q_c((X, Z), K) := H^q(Y, R⁺f_!(i_{Z*}i_Z^*K)) is the compactly supported cohomology of the pseudo-adic Z.

Hypotheses: U open with f|_U compactifiable (e.g. U quasi-compact); Z is never treated as an adic subspace.

Proof outline: (1) The recollement triangle j_!j^*K → K → i_{Z*}i_Z^*K (ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space) and exactness of the triangulated functor R⁺f_! give the triangle. (2) R⁺f_!(j_!j^*K) ≅ R⁺(f ∘ j)_!(K|_U) by composition (ClassicalAdicEtaleCohomology:H3/lower-shriek-composition) and R⁺j_! = j_! (ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases (c)). (3) For Y = Spa(C, C⁺) take cohomology over Y, which is exact.

Acceptance: For X = P¹_C over Spa(C, O_C), U the open unit disc D and Z its closed complement: H¹_c((P¹, Z), μ_n) → H²_c(D, μ_n) → H²(P¹, μ_n) → H²((P¹, Z), μ_n) = 0 recovers Berkovich's sequence of Remark 6.2.10 in adic form. U = X gives the trivial triangle with Z = ∅.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion` (lemma). Let f : X → Y be compactifiable with Y quasi-compact and quasi-separated, and Λ a ring. For K ∈ D⁺(X_ét, Λ) the maps R⁺f_!(j_{U!}(K|_U)) → R⁺f_!K induced by the counits j_{U!}j_U^*K → K, for U ranging over the filtered system of quasi-compact open subsets of X, induce an isomorphism colim_U R⁺f_!(j_{U!}(K|_U)) ≅ R⁺f_!K; in each degree R^q f_!K = colim_U R^q f_!(j_{U!}(K|_U)). Combined with ClassicalAdicEtaleCohomology:H3/lower-shriek-composition, R⁺f_!(j_{U!}(K|_U)) ≅ R⁺(f|_U)_!(K|_U), so R⁺f_! is the colimit of the proper-support direct images of the quasi-compact opens.

Hypotheses: f compactifiable; Y qcqs (the statement is local on Y); K bounded below.

Proof outline: (1) On sheaves: j_!K = colim_U j_!j_{U!}(K|_U) as a filtered colimit of subsheaves (X is the union of its quasi-compact opens), and the functor f̄_! of sections with proper support commutes with filtered colimits (ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek; this is Hub96 Proposition 5.2.2 as restated by Zavyalov). (2) Derived version: filtered colimits are exact, and R⁺f̄_! commutes with filtered colimits of bounded-below complexes because the étale site of the quasi-compact quasi-separated X̄ over the qcqs Y is coherent (DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites); R⁺f_! = R⁺f̄_! ∘ j_! (ClassicalAdicEtaleCohomology:H3/proper-support-direct-image).

Acceptance: For the open unit disc D over Spa(C, O_C), H²_c(D, μ_n) = colim_{r<1} H²_c(D, j_{B(0,r)!}μ_n) with each term ℤ/n and identity transition maps.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension` (theorem). Let f : X → Y be compactifiable and locally of finite type, with relative dimension dim f ≤ d computed on rank-one fibres (AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres), and let F be an étale sheaf of Λ-modules on X with nΛ = 0, n invertible in O_Y⁺. Then R^q f_!F = 0 for q > 2d. In particular, for a smooth adic curve f (ClassicalAdicEtaleCohomology:H3/smooth-adic-curve) R^q f_!F = 0 for q > 2, so for the ball f_C : B_C → Spa(C, O_C) one has R^i f_{C!}F_ℓ(1) = 0 for i > 2, the form in which ECD's proof of Theorem 24.1 uses Hub96 Proposition 5.5.8. Consequently R⁺f_! has cohomological amplitude in [0, 2d] and extends to the unbounded derived category.

Hypotheses: f compactifiable, locally of finite type, dim f ≤ d; n invertible in O_Y⁺.

Proof outline: (1) Base change to geometric points (ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change) and quasi-compact exhaustion (ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion) reduce to Y = Spa(C, C⁺) and X quasi-compact, and to the vanishing of H^q(X̄, j_!F) for q > 2d with X̄ proper over Spa(C, C⁺) (ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation, dimensions of rank-one fibres preserved). (2) Proper base change to the pseudo-adic closed fibre (ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing) reduces further to the cohomological dimension of the closed fibre of X̄ over Spa(C, C⁺). (3) Rank-one case C⁺ = O_C: X̄ is quasi-compact quasi-separated of dimension d over the rank-one point; the bound H^q = 0 for q > 2d is Hub96 Corollary 2.8.3, restated by Hansen for quasi-compact quasi-separated rigid spaces over C, and Berkovich's Corollary 5.3.8 is its Berkovich analogue; X̄ is not locally of finite type, but it has the same rank-one points and étale cohomology can be computed on the quasi-compact open X together with its boundary via the triangle of ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle. (4) Higher-rank C⁺ and the non-lft X̄: Hub96 Propositions 5.3.11 and 5.5.8 (quoted by Zavyalov and ECD); their proofs are not public (gap: cohomological dimension over higher-rank points and for compactifications). For the relative ball and P¹ over any Spa(C, C⁺) the bound is proved directly in ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support.

Acceptance: For the ball over Spa(C, O_C): R^q f_!μ_n = 0 for q > 2 and R²f_!μ_n = ℤ/n (ECD proof of Theorem 24.1). For a finite étale f (d = 0): R^q f_! = 0 for q > 0.

`ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums` (lemma). Let f : X → Y be compactifiable, locally of finite type, of finite relative dimension, and Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺. Then Rf_! : D(X_ét, Λ) → D(Y_ét, Λ) commutes with arbitrary direct sums, and for a filtered system (F_i) of sheaves R^q f_!(colim F_i) = colim R^q f_! F_i.

Hypotheses: finite relative dimension, so that R⁺f_! has finite cohomological amplitude; Λ a ring with nΛ = 0 for an integer n ≥ 1 invertible in O_Y⁺.

Proof outline: (1) For bounded-below families of uniform lower bound, Rf̄_* on the quasi-compact quasi-separated compactification commutes with direct sums (Hub96 Lemma 2.3.13(ii) as quoted by Zavyalov; DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites), and j_! commutes with all colimits. (2) Finite cohomological dimension (ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension) extends this to unbounded complexes by truncation (Zavyalov, Lemma 9.1, Step 2). (3) For non-quasi-compact f, colimits commute with the colimit over quasi-compact opens (ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion).

Acceptance: For the ball and a family of constant sheaves Λ_i, H²_c(B, ⊕Λ_i(1)) = ⊕Λ_i.

### H3.5 Smooth adic curves and the flat quasi-finite trace

`ClassicalAdicEtaleCohomology:H3/smooth-adic-curve` (definition). Let S be a locally noetherian analytic adic space. A smooth adic curve over S is a morphism f : X → S that is smooth (AdicSpacesPartII:R0/smooth-morphism), separated, taut (ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms) and of relative pure dimension 1 (AdicEtaleGeometry:A2/dimension-of-adic-spaces; for smooth f equivalently Ω_{X/S} locally free of rank 1, AdicEtaleGeometry:A2/smooth-pure-relative-dimension). Every smooth adic curve is locally of finite type, hence compactifiable (ClassicalAdicEtaleCohomology:H3/compactifiable-morphism). The main base is S = Spa(C, C⁺) with C algebraically closed complete nonarchimedean and C⁺ ⊆ C an open and bounded valuation subring of any rank. Standard examples over such S: the relative closed unit ball B_S = Spa(C⟨T⟩, C⁺⟨T⟩) (AdicEtaleGeometry:A2/relative-closed-polydisc; this is ECD's B × Spa(C, C⁺) with B(R, R⁺) = R⁺), the open discs ⋃_{m} {|T − a|^m ≤ |ϖ| ρ^m}, the closed and open annuli, P¹_S = P¹_C ×_{Spec C} S (AdicSpacesPartII:R1/scheme-fibre-product-analytification), and W ×_{Spec C} S for a smooth separated curve W over C; taut open subspaces and étale separated taut X-spaces of a smooth adic curve are smooth adic curves. The generic fibre X_η := X ×_S Spa(C, O_C) is an open subspace of X containing every rank-one point.

Hypotheses: S locally noetherian analytic; the base Spa(C, C⁺) with C⁺ ≠ O_C is allowed and is the 'valued-plus-ring' case; relative dimension is the topological one of AdicEtaleGeometry:A2, computed on rank-one fibres.

API:

- `AdicSpace.IsSmoothCurve` (structure): The predicate: smooth, separated, taut, relative pure dimension 1.

- `AdicSpace.IsSmoothCurve.isCompactifiable` (instance): Smooth adic curves are compactifiable.

- `AdicSpace.IsSmoothCurve.of_etale` (functoriality): If X → S is a smooth adic curve and V → X is étale, separated and taut then V → S is a smooth adic curve.

- `AdicSpace.IsSmoothCurve.restrict` (other): Taut open subspaces of smooth adic curves are smooth adic curves.

- `AdicSpace.IsSmoothCurve.baseChange` (compatibility): For quasi-compact f and S' → S, the base change is a smooth adic curve.

- `AdicSpace.IsSmoothCurve.relBall` (example): B_S → S is a smooth adic curve.

- `AdicSpace.IsSmoothCurve.projectiveLine` (example): P¹_S → S is a proper smooth adic curve.

- `AdicSpace.IsSmoothCurve.genericFibre` (projection): The open generic fibre X_η ⊆ X over Spa(C, O_C).

- `AdicSpace.IsSmoothCurve.relDim_eq_one` (characterisation): Ω_{X/S} is locally free of rank 1.

Unit tests:

- `isSmoothCurve_relBall` (computation): For S = Spa(C, C⁺), B_S → S is a smooth adic curve with Ω_{B_S/S} free on dT.

- `isSmoothCurve_projectiveLine` (compatibility): P¹_S → S is a smooth adic curve and is proper; for S = Spa(C, O_C) it is the analytification of P¹_C (AdicSpacesPartII:R1/analytification-functor).

- `not_isSmoothCurve_compactification` (non-example): B̄_S → S is not a smooth adic curve: it is not locally of finite type.

- `not_isSmoothCurve_etale` (degenerate): An étale separated morphism has relative dimension 0 and is not a smooth adic curve.

- `isSmoothCurve_genericFibre` (characterisation): If X → S is a smooth adic curve then X_η → Spa(C, O_C) is a smooth adic curve and X_η ⊆ X is open with the same rank-one points.

Acceptance: For S = Spa(C, C⁺), B_S → S and P¹_S → S are smooth adic curves; P¹_S → S is proper. The universal compactification B̄_S → S of the ball is partially proper but not smooth (not locally of finite type). An étale morphism X → S is not a smooth adic curve (relative dimension 0).

`ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace` (construction). Let φ : Y → X be a separated, flat (AdicSpacesPartII:R0/flat-morphism), locally quasi-finite (AdicSpacesPartII:R0/quasi-finite-morphism) morphism of locally noetherian analytic adic spaces that is locally of finite type and taut. Then R^qφ_! = 0 for q > 0, and to every abelian étale sheaf F on X there is attached a trace Tr_φ : φ_!φ^*F → F, uniquely determined by: (a) Tr_φ is natural in F; (b) Tr_φ is compatible with base change along any morphism X' → X (via the base change isomorphism for φ_!); (c) Tr_φ is compatible with composition: Tr_{φ∘ψ} = Tr_φ ∘ φ_!(Tr_ψ); (d) if φ is finite locally free of constant rank d (AdicSpacesPartII:R3/finite-locally-free-morphism) the composite F → φ_*φ^*F = φ_!φ^*F → F is multiplication by d; (e) if φ is étale, Tr_φ is the counit of the adjunction φ_! ⊣ φ^* (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero). At a geometric point x̄ = Spa(K, O_K) of X of rank one, the fibre Y ×_X x̄ is a finite disjoint union of Spa(A_y, A_y°) with A_y local Artinian K-algebras, (φ_!φ^*F)_x̄ = ⊕_y F_x̄, and Tr_φ((a_y)_y) = Σ_y length(A_y)·a_y. The induced maps on compactly supported cohomology H^q_c(Y, φ^*F) → H^q_c(X, F) (for X → Z compactifiable) are also called Tr_φ.

Hypotheses: φ separated, flat, locally quasi-finite, locally of finite type, taut; no torsion hypothesis on F; the Kummer compatibility below needs n invertible.

API:

- `AdicSpace.quasiFiniteTrace` (data): The natural transformation Tr_φ : φ_!φ^* → id on Sh(X_ét, ℤ).

- `AdicSpace.quasiFiniteTrace_naturality` (functoriality): Naturality in the sheaf F.

- `AdicSpace.quasiFiniteTrace_baseChange` (compatibility): Compatibility with base change along X' → X.

- `AdicSpace.quasiFiniteTrace_comp` (functoriality): Compatibility with composition.

- `AdicSpace.quasiFiniteTrace_unit_eq_mul` (simp): For φ finite locally free of rank d, Tr_φ ∘ unit = d.

- `AdicSpace.quasiFiniteTrace_etale` (characterisation): For étale φ, Tr_φ is the adjunction counit.

- `AdicSpace.quasiFiniteTrace_stalk` (characterisation): At a rank-one geometric point, Tr_φ((a_y)) = Σ length(A_y) a_y.

- `AdicSpace.quasiFiniteTrace_unique` (universal-property): Any family of maps satisfying (a)–(d) equals Tr.

- `AdicSpace.quasiFiniteTrace_compactCohomology` (other): The induced maps H^q_c(Y, φ^*F) → H^q_c(X, F) for X compactifiable over a base.

Unit tests:

- `quasiFiniteTrace_etale` (degenerate): For an étale separated quasi-compact φ, Tr_φ is the counit φ_!φ^*F → F.

- `quasiFiniteTrace_degree` (computation): For φ finite locally free of constant rank d, Tr_φ ∘ unit = d·id.

- `quasiFiniteTrace_ramified` (non-example): For T ↦ T² on the closed disc (p ≠ 2), the stalk of Tr_φ at 0 is multiplication by 2, not the sum over geometric points of the fibre (a single point): the point-count formula holds only for étale φ.

- `quasiFiniteTrace_comp` (characterisation): Tr_{φ∘ψ} = Tr_φ ∘ φ_!(Tr_ψ).

- `quasiFiniteTrace_baseChange` (compatibility): For X' → X, the base-changed trace is the trace of the base change.

Acceptance: For the Kummer map φ : {|T| = 1} → {|T| = 1}, T ↦ T^m with p ∤ m, over Spa(C, O_C), Tr_φ ∘ (unit) = m. For φ : B → B, T ↦ T² with p ≠ 2 (finite flat of rank 2, ramified at 0), the stalk of Tr_φ at the origin is F_0 → F_0, a ↦ 2a (one point of multiplicity 2), and at other rank-one points the sum over the two preimages.

### H3.6 Henselian comparison and formal-model transfer

The scheme trace of EtaleDualityAndPerverseSheaves EDC.2 reaches adic curves over Spa(C, C⁺) through formal
models over C⁺: the ϖ-adic completion of a proper C⁺-scheme is of type (S), its generic fibre is the
analytification over Spa(C, C⁺), and Huber's comparison theorems of H1:formal-adic-comparison compute the
cohomology of tubes on the special fibre; the henselian comparison moves between C⁺, C⁺/ϖ and the closed point.
This is what makes the valued-plus-ring statements accessible: the relative ball over any Spa(C, C⁺) is the
tube of A¹ in P¹_{C⁺}.

`ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change` (lemma). Let A be a ring henselian along an ideal I (mathlib:HenselianRing), π : 𝒫 → Spec A a proper morphism of finite presentation, and K ∈ D⁺(𝒫_ét) with torsion cohomology sheaves. Then restriction RΓ(𝒫, K) → RΓ(𝒫 ⊗_A A/I, K|) is an isomorphism. Applied twice with the notation C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n, and ϖ ∈ C⁺ a pseudo-uniformiser: (i) C⁺ is ϖ-adically complete, hence henselian along ϖC⁺ (ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian), so RΓ(𝒫, K) ≅ RΓ(𝒫_0, K|) for 𝒫_0 = 𝒫 ⊗ C⁺/ϖ; (ii) C⁺/C°° is a valuation ring of the algebraically closed residue field of C, hence strictly henselian local with algebraically closed residue field k_s, and RΓ(𝒫_0, K) ≅ RΓ(𝒫_s, K|) for the fibre 𝒫_s over the closed point.

Hypotheses: π proper and finitely presented; torsion coefficients; A henselian along I.

Proof outline: (1) Proper base change for schemes (UPSTREAM:ECD:SCH_BC, after a limit argument reducing to finite type over a noetherian ring, DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites) identifies the restriction of Rπ_*K to Spec A/I with Rπ_{0*}(K|). (2) Huber's Lemma 3.2.5 (Gabber's affine theorem; ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1) gives RΓ(Spec A, G) ≅ RΓ(Spec A/I, G|) for torsion G, applied to the cohomology sheaves of Rπ_*K and assembled by the hypercohomology spectral sequence. (3) Composition gives the statement; (i) uses completeness of C⁺ (open subring of the complete field C) and the complete-implies-henselian node; (ii) uses that a valuation ring with algebraically closed fraction field is strictly henselian, and that the radical of ϖC⁺ is C°°, so 𝒫_0 and 𝒫 ⊗ C⁺/C°° have the same étale site (UPSTREAM:ECD:SCH_BC, topological invariance).

Acceptance: 𝒫 = P¹_{C⁺}: RΓ(P¹_{C⁺}, μ_n) ≅ RΓ(P¹_{k_s}, μ_n), giving H²(P¹_{C⁺}, μ_n) ≅ ℤ/n via the degree.

`ClassicalAdicEtaleCohomology:H3/formal-model-transfer` (comparison). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n; ϖ ∈ C⁺ a pseudo-uniformiser. Let 𝒫 be a proper flat finitely presented C⁺-scheme with special fibre 𝒫_0 = 𝒫 ⊗ C⁺/ϖ, P := 𝒫_C ×_{Spec C} S (Huber's fibre product), which equals the generic fibre d(𝒫̂) of the ϖ-adic completion (a formal scheme of type (S)), and λ : P_ét → (𝒫_0)_ét the specialisation morphism of sites; similarly λ_S : S_ét → Spec(C⁺/ϖ)_ét, an equivalence of topoi (both are the topos of the chain of valuation rings between C⁺ and O_C, since étale maps to either side split locally). For an open subscheme 𝒰 ⊆ 𝒫_0 let U := λ⁻¹(𝒰) ⊆ P (an open subspace, quasi-compact if 𝒰 is), f_U : U → S and π_𝒰 : 𝒰 → Spec(C⁺/ϖ). Then for every K ∈ D⁺(U_ét, Λ) with Λ torsion there is a natural isomorphism λ_{S*} R f_{P*}(j_{U!} K) ≅ Rπ_{𝒰!} Rλ_{U*} K, where j_U : U ⊆ P is the open inclusion and f_P : P → S the proper structure map (for quasi-compact U the left side is the proper-support direct image of U → S, see ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support), compatible with open immersions 𝒰' ⊆ 𝒰 (extension by zero on both sides), with restriction to open subsets of S (localisation of C⁺) and with the trace-type maps induced by finite flat maps of models. If moreover 𝒫 is smooth over C⁺ along 𝒰 and K = L|_U for a locally constant constructible L on 𝒫_C with torsion invertible in C⁺, then Rλ_{U*}K ≅ L_0 (the corresponding locally constant sheaf on 𝒰), so λ_{S*} R f_{P*}(j_{U!} L) ≅ Rπ_{𝒰!} L_0: compactly supported cohomology of the tube is compactly supported cohomology of the special fibre.

Hypotheses: 𝒫 proper flat of finite presentation over C⁺; C⁺ of arbitrary rank (the ϖ-adic completion is of type (S) because 𝒫̂[1/ϖ] is strongly noetherian); Λ torsion; the smooth clause needs torsion invertible in C⁺; U is the open tube of an open of the special fibre; tubes of closed or locally closed subsets are pseudo-adic and are treated through ClassicalAdicEtaleCohomology:H1:formal-adic-comparison, not here.

Proof outline: (1) P = d(𝒫̂): Hub96 Proposition 1.9.6 for the proper (hence separated and universally specialising) 𝒫 → Spec C⁺ (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison, AdicSpacesPartII:R2/generic-fibre-functor-d); U = d(𝒰̂) is the open subspace of the open formal subscheme 𝒰̂ (same node), and P → S is proper. (2) Functoriality of specialisation: λ_S ∘ f_P = π_0 ∘ λ_P as morphisms of sites for the adic morphism 𝒫̂ → Spf C⁺ (Hub96 3.5.4, ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports, ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda), hence λ_{S*}Rf_{P*} ≅ Rπ_{0*}Rλ_{P*}. (3) Extension by zero: Rλ_{P*} ∘ j_{U!} ≅ i_{𝒰!} ∘ Rλ_{U*} (Hub96 Corollary 3.5.11(ii) with L' = 𝒰 open in L = 𝒫_0; ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11). (4) Rπ_{0*} ∘ i_{𝒰!} = Rπ_{𝒰!} for the proper π_0 (UPSTREAM:ECD:SCH_SUPPORT_NOETH, after a limit argument from finite type over a noetherian ring). (5) Smooth clause: Rλ_{U*}(L|_U) is the restriction to 𝒰 of i^*Rj_*L (Hub96 Theorem 3.5.13, ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13), and for 𝒫 smooth over C⁺ along 𝒰 and L locally constant with torsion invertible in C⁺ the nearby cycles are trivial, i^*Rj_*L ≅ L_0 (local acyclicity of smooth morphisms, UPSTREAM:ECD:SCH_BC; Berkovich's Corollary 5.4 for smooth formal schemes over O_C). (6) λ_S is an equivalence: étale maps to S split near the closed point (AdicEtaleGeometry:A1/geometric-point-etale-split) so S_ét is the topos of |S|; all localisations of the valuation ring C⁺/C°° are strictly henselian, so Spec(C⁺/ϖ)_ét is the topos of |Spec(C⁺/C°°)|; λ_S(x) = {a ∈ C⁺ : |a(x)| < 1} is a homeomorphism of these chains.

Acceptance: 𝒫 = P¹_{C⁺}, 𝒰 = A¹ ⊆ P¹_0: U = B_S is the relative closed ball and λ_{S*}Rf_{P¹*}(j_!Λ) ≅ Rπ_{A¹!}Λ = Λ(−1)[−2] (ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support). 𝒰 = 𝒫_0: U = P and the statement is RΓ(P, K) ≅ RΓ(𝒫_0, Rλ_*K), Hub96 Corollary 3.5.14. 𝒰 = A¹ ∖ {0}: U is the annulus {|T| = 1} over S, with H¹_c and H²_c those of G_{m,k_s}.

`ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison` (comparison). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let W be a separated scheme of finite type over C of dimension ≤ 1, W^ad := W ×_{Spec C} S (AdicSpacesPartII:R1/scheme-fibre-product-analytification) with its structure map f^ad : W^ad → S, and F a constructible sheaf of ℤ/n-modules on W with analytification F^ad (pullback along the morphism of sites W^ad_ét → W_ét). Then there is a canonical isomorphism RΓ_c(W, F) ≅ RΓ(S, Rf^ad_!F^ad), compatible with the maps induced by open immersions and finite flat morphisms of curves and with restriction to the generic point Spa(C, O_C); for W proper, RΓ(W, F) ≅ RΓ(W^ad, F^ad).

Hypotheses: dim W ≤ 1 (the case needed for traces of curves); the general proper comparison is Hub96 Theorem 3.7.2, owned by ClassicalAdicEtaleCohomology:H5; n prime to p; C⁺ arbitrary.

Proof outline: (1) Compactify: W ⊆ W̄ with W̄ proper over C and W̄ ∖ W finite (UPSTREAM:ECD:SCH_SUPPORT_NOETH), so RΓ_c(W, F) = RΓ(W̄, j_!F); analytification commutes with j_! and W^ad ⊆ W̄^ad is open with complement finitely many copies of S, so Rf^ad_!F^ad ≅ Rf̄^ad_*(j_!F)^ad by composition (ClassicalAdicEtaleCohomology:H3/lower-shriek-composition, ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases). (2) Proper case: choose a proper flat finitely presented C⁺-model 𝒫 of W̄ (the closure in a projective space over C⁺ of a projective embedding, with the flat closure). By Hub96 1.9.6 (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison) W̄^ad = d(𝒫̂), and ClassicalAdicEtaleCohomology:H3/formal-model-transfer with 𝒰 = 𝒫_0 together with Hub96 3.5.13 gives RΓ(W̄^ad, G^ad) ≅ RΓ(𝒫_0, i^*Rj_*G) for G = j_!F. (3) Henselian comparison: RΓ(𝒫_0, i^*Rj_*G) ≅ RΓ(𝒫, Rj_*G) = RΓ(W̄, G) (ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change (i)). (4) Compatibilities: the constructions are natural in open immersions and finite flat maps of models, and restriction to Spa(C, O_C) corresponds to localising C⁺.

Acceptance: W = P¹_C, F = μ_n: H²(P¹_S, μ_n) ≅ H²(P¹_C, μ_n) ≅ ℤ/n. W = G_{m,C}: H¹_c(W^ad/S, ℤ/n) ≅ ℤ/n and H²_c ≅ ℤ/n(−1).

`ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support` (theorem). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let f : B_S → S be the relative closed unit ball (AdicEtaleGeometry:A2/relative-closed-polydisc). Then R^q f_!Λ = 0 for q ≠ 2 and R²f_!μ_n ≅ ℤ/n is a constant sheaf on S: its specialisation maps along the chain |S| are isomorphisms. The isomorphism is the formal-model transfer (ClassicalAdicEtaleCohomology:H3/formal-model-transfer, with 𝒫 = P¹_{C⁺} and 𝒰 = A¹) of the scheme trace Tr_{A¹} : R²π_!μ_n → ℤ/n of the affine line over C⁺/ϖ (EtaleDualityAndPerverseSheaves:EDC.2:trace-purity). It is compatible (i) with restriction to every open U = Spa(C, C⁺_U) ⊆ S (C⁺ ⊆ C⁺_U ⊆ O_C), (ii) with base change along every morphism Spa(C', C'⁺) → Spa(C, C⁺) of algebraically closed affinoid fields (B_S pulls back to B_{S'}), and (iii) with the inclusion B_S ⊆ P¹_S: extension by zero R²f_!μ_n → R²(f_{P¹})_*μ_n is an isomorphism onto H²(P¹_S, μ_n) ≅ ℤ/n, the degree normalisation. For C⁺ = O_C this is the case of Hub96 Theorem 7.2.2 and Proposition 5.5.8 restated in ECD's proof of Theorem 24.1: Rf_{C!}F_ℓ(1) → F_ℓ[−2] with R^i f_{C!} = 0 for i > 2.

Hypotheses: C algebraically closed, C⁺ arbitrary open bounded valuation subring; n prime to the residue characteristic p.

Proof outline: (1) B_S is the tube λ⁻¹(A¹_0) in P¹_S = d((P¹_{C⁺})^): on the chart Spf C⁺⟨T⟩ the generic fibre is Spa(C⟨T⟩, C⁺⟨T⟩), since C⁺⟨T⟩ is integrally closed in C⟨T⟩ (AdicSpacesPartII:R2/generic-fibre-functor-d, AdicEtaleGeometry:A2/relative-closed-polydisc (a)). (2) Rf_!μ_n ≅ Rf_{P¹*}(j_!μ_n) for the quasi-compact open B_S ⊆ P¹_S (ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence), and formal-model transfer with the smooth model P¹_{C⁺} (ClassicalAdicEtaleCohomology:H3/formal-model-transfer) gives λ_{S*}Rf_!μ_n ≅ Rπ_{A¹!}μ_n on Spec(C⁺/ϖ). (3) Scheme computation: Rπ_{A¹!}μ_n has stalk RΓ_c(A¹_κ, μ_n) = ℤ/n[−2] at every point with algebraically closed residue field κ, and the relative trace R²π_!μ_n → ℤ/n is an isomorphism compatible with base change (EtaleDualityAndPerverseSheaves:EDC.2:trace-purity; UPSTREAM:ECD:SCH_SUPPORT_NOETH, UPSTREAM:ECD:SCH_BC); hence R²f_!μ_n is constant. (4) Compatibilities: (i) restriction to Spa(C, C⁺_U) corresponds to localising C⁺ and the transfer is compatible with it; (ii) base change of B_S and of P¹_{C⁺} along C⁺ → C'⁺ (the models base change) plus base change of the scheme trace; (iii) extension by zero from A¹ to P¹ on the special fibre is an isomorphism on H² (the complement is a section, of cohomological dimension 0), and on P¹ the scheme trace is the degree (EDC.2 normalisation by c₁(O(1))).

Acceptance: C⁺ = O_C, n = ℓ: R²f_{C!}F_ℓ(1) ≅ F_ℓ and R^i f_{C!}F_ℓ(1) = 0 for i ≠ 2, the input of ECD's condition (iv). For C⁺ of rank two, the stalk of R²f_!μ_n at the closed point s is H²_c(B_S/S, μ_n) ≅ ℤ/n and the specialisation to η is an isomorphism.

### H3.7 Local residues and the trace for curves

`ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison` (comparison). Let k be a complete nonarchimedean field. (a) Huber's functor gives an equivalence between Hausdorff strictly k-analytic Berkovich spaces and taut adic spaces locally of finite type over Spa(k, k°), sending M(A) to Spa(A, A°); under it X^Berk is identified with the set of rank-one points of X^ad and the continuous retraction |X^ad| → |X^Berk| is the maximal Hausdorff quotient. (b) The inverse images of open subsets of X^Berk are exactly the partially proper open subsets of X^ad (Kedlaya–Liu's real quotient), and they are taut. (c) For an overconvergent étale sheaf F (every specialisation map of stalks is an isomorphism; for instance a locally constant constructible sheaf) the étale cohomology of X^ad and of X^Berk with coefficients in F agree. The node is used only with k = C algebraically closed and X a smooth adic curve over Spa(C, O_C), to transport Berkovich's local structure of smooth curves (elementary neighbourhoods, Berkovich 3.6.1–3.6.2) and his cohomology computations with locally constant coefficients (Berkovich 6.1.3, 6.4.1) to adic curves.

Hypotheses: k complete nonarchimedean; C⁺ = O_C (rank-one plus ring) throughout this node; (c) is asserted only for overconvergent sheaves; for non-overconvergent sheaves (such as j_!Λ for a quasi-compact open j) adic and Berkovich cohomology differ, and compact supports differ even for constant sheaves on quasi-compact non-proper X (ClassicalAdicEtaleCohomology:H3/proper-support-direct-image, test lowerShriek_ne_berkovich).

Proof outline: (1) (a) is Hub96 Proposition 8.3.1 and Lemma 8.1.8 as restated by Scholze (2012, Theorem 2.24); the proof is not public (gap: Hub96 §8.3). Its affinoid part is the identification of rank-one points of Spa(A, A°) with multiplicative seminorms, which is public (Scholze 2012 §2; Kedlaya–Liu §8.2). (2) (b) Kedlaya–Liu Lemma 8.2.12 and the definition of partially proper open subsets preceding it. (3) (c) Hub96 Theorem 8.3.5 as restated by Hansen; the proof is not public (same gap).

Acceptance: The closed unit disc Spa(C⟨T⟩, O_C⟨T⟩) corresponds to Berkovich's E(0, 1); its Berkovich space is compact, while the adic disc is quasi-compact but not partially proper. The open unit disc (partially proper) is the inverse image of Berkovich's open disc D(0, 1).

`ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula` (lemma). Let C be algebraically closed complete nonarchimedean with residue characteristic p, n prime to p, T a coordinate on P¹_C over Spa(C, O_C), a ∈ C and r ∈ |C^×|. (i) A function g on the circle A = {|T − a| = r} (an affinoid adic space) is a unit iff g = c(T − a)^m(1 + h) with c ∈ C^×, m ∈ ℤ and sup|h| < 1 on A; m =: deg_D(g) for the open disc D = {|T − a| < r}, and deg_{D'}(g) = −m for the complementary open disc D' ∋ ∞. (ii) For a finite flat φ : A → A' of circles with φ(D) = D', deg_{D'}(N_φ g) = deg_D(g). (iii) Let E = {|T − a| ≤ r} be the closed disc, Z = E ∖ D its closed pseudo-adic complement (ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space; Z has the same rank-one points as A), and γ_D : O(A)^× → ℤ/n the composite of the Kummer map O(A)^× → H¹(A, μ_n) ≅ H¹((E, Z), μ_n), the connecting map H¹((E, Z), μ_n) → H²(E, j_!μ_n) = H²_c(D, μ_n) of the recollement triangle j_!μ_n → μ_n → i_{Z*}μ_n on E, extension by zero to H²(P¹, μ_n) and the degree isomorphism H²(P¹, μ_n) ≅ ℤ/n. (The three sheaves of the triangle are overconvergent, so ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison (c) identifies this sequence with Berkovich's sequence for D ⊆ E ⊇ A, and H²(E, j_!μ_n) = H²_c(D, μ_n) because no point of D specialises to a point outside D.) Then γ_D(g) = −deg_D(g) mod n. (iv) For an open annulus B = D₁ ∩ D₂ in P¹ with boundary circles A₁, A₂ and (g₁, g₂) ∈ O(A₁)^× × O(A₂)^×, γ_B(g₁, g₂) = −deg_{D₁}(g₁) − deg_{D₂}(g₂) mod n.

Hypotheses: C⁺ = O_C: the computation lives on rank-one points; the plus-ring case reduces to it by generic-point determination (ClassicalAdicEtaleCohomology:H3/curve-trace); n prime to the residue characteristic (Berkovich Remark 6.2.10 shows the p-part fails).

Proof outline: (1) (i) Berkovich Lemma 6.2.2: if r ∉ |C^×| the ring O(A) is a field; for r ∈ |C^×| normalise r = 1, sup|g| = 1, and use that the reduction of g is a unit of k̃[T, T⁻¹], hence a monomial. (2) (ii) Berkovich Lemma 6.2.4, computed on reductions: the norm of a flat finite map of reduced annuli preserves the degree of the reduction. (3) (iii) Berkovich Lemma 6.2.5: by additivity reduce to g = T − a; its Kummer class maps to the class of the pair (O, O →^{T−a} O) in H¹_D(P¹, G_m) = Pic of line bundles trivialised off D, which is O([a]) of degree one, with the anticommutative square between the Kummer and G_m boundary maps giving the sign. In the adic setting the boundary map uses the pseudo-adic complement of D and the cohomology of Kummer classes of units is the same because units and Kummer classes are computed on rank-one points (ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison (c) for locally constant coefficients). (4) (iv) Berkovich Lemma 6.2.6: follows from (iii) by the commutative diagram of the embeddings B ⊆ A ⊇ A₁ ⊔ A₂ into D_i ⊆ E_i.

Acceptance: g = T − a: deg_D(g) = 1 and γ_D(g) = −1. g = (T − a)^n: γ_D(g) = 0 in ℤ/n, consistent with the Kummer class of an n-th power being trivial.

`ClassicalAdicEtaleCohomology:H3/curve-trace` (construction). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. To every smooth adic curve f : X → S (ClassicalAdicEtaleCohomology:H3/smooth-adic-curve) is attached a trace Tr_f : R²f_!μ_n → ℤ/n of sheaves on S, equivalently (S being strictly local) a homomorphism Tr_X : H²_c(X/S, μ_n) → ℤ/n, and, by the projection formula and R^q f_! = 0 for q > 2, a map Tr_f : Rf_!(f^*K(1))[2] → K for K ∈ D(S_ét, ℤ/n). The traces are uniquely determined by: (a) for every flat, separated, locally quasi-finite S-morphism φ : Y → X of smooth adic curves, Tr_Y = Tr_X ∘ Tr_φ, with Tr_φ the flat quasi-finite trace (ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace); (b) Tr_{P¹_S} is the degree: H²(P¹_S, μ_n) ≅ H²(P¹_C, μ_n) ≅ Pic(P¹)/n → ℤ/n (ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison); (c) generic-point determination: Hom_S(R²f_!μ_n, ℤ/n) ≅ Hom(H²_c(X_η, μ_n), ℤ/n) by restriction to the generic point η = Spa(C, O_C), and Tr_f corresponds to Tr_{X_η}. For C⁺ = O_C the traces are surjective for nonempty X; they are compatible with base change of S and with restriction to opens of S (ClassicalAdicEtaleCohomology:H3/curve-trace-base-change), with finite étale maps and restrictions to open subspaces (ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility), with the algebraic trace (ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison), and are isomorphisms for connected X in the cases of ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected. This is Hub96 Theorem 7.2.2 for curves over Spa(C, C⁺), in the form restated by ECD for the ball.

Hypotheses: S = Spa(C, C⁺) with C algebraically closed; open subsets U ⊆ S are again of this form (U = Spa(C, C⁺_U)) and are allowed as bases; n prime to the residue characteristic p of C; no trace is asserted on p-torsion (Berkovich Remark 6.2.10).

API:

- `AdicSpace.curveTrace` (data): Tr_f : R²f_!μ_n → ℤ/n for a smooth adic curve f over Spa(C, C⁺).

- `AdicSpace.curveTrace'` (data): The derived form Rf_!(f^*K(1))[2] → K.

- `AdicSpace.curveTrace_comp_quasiFiniteTrace` (compatibility): Tr_Y = Tr_X ∘ Tr_φ for flat quasi-finite separated φ : Y → X.

- `AdicSpace.curveTrace_projectiveLine` (characterisation): On P¹_S the trace is the degree.

- `AdicSpace.curveTrace_generic` (characterisation): Hom(R²f_!μ_n, ℤ/n) ≅ Hom(H²_c(X_η, μ_n), ℤ/n) sends Tr_f to Tr_{X_η}.

- `AdicSpace.curveTrace_surjective` (other): For C⁺ = O_C, Tr_X is surjective for nonempty X.

- `AdicSpace.curveTrace_unique` (universal-property): Any family of maps satisfying (a)–(c) is the trace.

- `AdicSpace.curveTrace_baseChange` (compatibility): Compatibility with change of the base Spa(C, C⁺) (node curve-trace-base-change).

- `AdicSpace.curveTrace_isIso` (other): Isomorphism for connected X in the cases of curve-trace-iso-connected.

Unit tests:

- `curveTrace_relBall` (computation): For B_S → S, Tr : R²f_!μ_n → ℤ/n is an isomorphism.

- `curveTrace_projectiveLine` (characterisation): Tr_{P¹_S}(c₁(O(1))) = 1 ∈ ℤ/n.

- `curveTrace_kummerCover` (compatibility): For the finite étale Kummer covering of degree m of the unit circle, Tr ∘ φ^* = m · Tr.

- `curveTrace_empty` (degenerate): For X = ∅, H²_c(X/S, μ_n) = 0 and Tr = 0.

- `curveTrace_generic` (characterisation): For C⁺ ≠ O_C, Tr_f is the unique map R²f_!μ_n → ℤ/n whose stalk at η is Tr_{X_η}.

- `curveTrace_not_pTorsion` (non-example): For char C = 0 and residue characteristic p, H²_c(D, μ_p) of the open unit disc is not ℤ/p (Berkovich Remark 6.2.10): no trace isomorphism exists for p-torsion.

Acceptance: For the relative ball B_S → S, Tr is the isomorphism R²f_!μ_n ≅ ℤ/n of ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support; for C⁺ = O_C this is ECD's trace map Rf_{C!}F_ℓ(1) → F_ℓ[−2]. For the Kummer covering φ : {|T| = 1} → {|T| = 1}, T ↦ T^m (p ∤ m), Tr ∘ φ^* = m·Tr on H²_c. For P¹_S, Tr(c₁(O(1))) = 1.

`ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility` (lemma). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let X → S be a smooth adic curve. (i) For a finite étale S-morphism φ : Y → X of degree d, Tr_Y = Tr_X ∘ Tr_φ on H²_c(Y/S, μ_n) and Tr_Y ∘ φ^* = d · Tr_X on H²_c(X/S, μ_n). (ii) For an open subspace U ⊆ X with taut source, Tr_U = Tr_X ∘ ι_! where ι_! : H²_c(U/S, μ_n) → H²_c(X/S, μ_n) is extension by zero; in particular the traces of X and of its quasi-compact open subspaces are compatible under the quasi-compact exhaustion. (iii) For a separated étale V → X that is quasi-compact, Tr_V = Tr_X ∘ Tr_{V/X}.

Hypotheses: n prime to p; φ finite étale, U open with taut source, V → X separated étale quasi-compact.

Proof outline: (1) (i), (iii): property (a) of ClassicalAdicEtaleCohomology:H3/curve-trace with Tr_φ from ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace; Tr_φ ∘ unit = d gives the second identity of (i). (2) (ii): an open immersion is flat, separated and quasi-finite and its Tr is the counit j_!j^* → id (ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace (e)), which on H²_c is extension by zero (ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases (c)).

Acceptance: For the open unit disc D ⊆ B, Tr_D = Tr_B ∘ ι_! and ι_! : H²_c(D, μ_n) → H²_c(B, μ_n) is an isomorphism. For the degree-m Kummer covering of the unit circle, Tr ∘ φ^* = m · Tr.

`ClassicalAdicEtaleCohomology:H3/curve-trace-base-change` (lemma). Let g : S' = Spa(C', C'⁺) → S = Spa(C, C⁺) be a morphism of algebraically closed affinoid fields (C' ⊇ C complete algebraically closed, C'⁺ ∩ C ⊇ C⁺ or more generally any morphism of adic spaces), n prime to the residue characteristic, f : X → S a quasi-compact smooth adic curve and f' : X' = X ×_S S' → S'. Then under the base change isomorphism g^*R²f_!μ_n ≅ R²f'_!μ_n (ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change) one has g^*(Tr_f) = Tr_{f'}. In particular: (i) for an open U = Spa(C, C⁺_U) ⊆ S the trace of X_U → U is the restriction of Tr_f; (ii) for the morphism Spa(C', C'⁺) → Spa(C, O_C) given by an extension C ⊆ C' with O_C ⊆ C'⁺ (the situation of ECD's condition (iv)), Tr_{X'} is the pullback of Tr_{X_C}. These are the relative and valued-plus-ring compatibilities used in ECD's proof of Theorem 24.1.

Hypotheses: f quasi-compact (so base change applies); n prime to p.

Proof outline: (1) By generic-point determination (ClassicalAdicEtaleCohomology:H3/curve-trace (c)) it suffices to compare the generic stalks; g maps the generic point of S' to the generic point of S when C' ⊇ C (the rank-one point maps to the rank-one point), so the question is the compatibility of the rank-one traces of X_{Spa(C,O_C)} and X_{Spa(C',O_{C'})}. (2) Rank one: the construction of ClassicalAdicEtaleCohomology:H3/curve-trace is compatible with extension of algebraically closed ground fields: P¹, discs, annuli and elementary curves base change to curves of the same type, the degree on P¹ and the residue formula are invariant (Berkovich Theorem 6.2.1, 'compatible with algebraically closed extensions of the ground field'), and Tr_φ commutes with base change (ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace (b)). (3) (i) is the case g an open immersion, where the claim is the definition.

Acceptance: For the relative ball, g^*(Tr_{B_S}) = Tr_{B_{S'}}, both being the formal-model transfer of the scheme trace of A¹ (ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support (ii)). For U = Spa(C, O_C) ⊆ S, restricting Tr_{B_S} gives ECD's trace over Spa(C, O_C).

`ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected` (lemma). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let f : X → S be a smooth adic curve with X nonempty. If C⁺ = O_C, then Tr_X : H²_c(X/S, μ_n) → ℤ/n is surjective, and it is an isomorphism when X is connected. If C⁺ is arbitrary, X_η is connected and R²f_!μ_n is a constant sheaf on S (its specialisation maps along |S| are isomorphisms), Tr_f : R²f_!μ_n → ℤ/n is an isomorphism; this holds for every open tube of a smooth proper C⁺-model, in particular for the relative ball, the open discs and annuli over S and P¹_S (ClassicalAdicEtaleCohomology:H3/formal-model-transfer).

Hypotheses: n prime to p; plus-ring case: constancy of R²f_!μ_n is a hypothesis, verified for tubes of smooth models.

Proof outline: (1) Surjectivity for C⁺ = O_C: X contains an open disc (a classical point of a smooth curve over Spa(C, O_C) has an open disc neighbourhood, AdicSpacesPartII:R2/residue-disc applied to a smooth formal model near it, or Berkovich 3.6.1), and Tr_D : H²_c(D, μ_n) → ℤ/n is an isomorphism (ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support with the quasi-compact exhaustion of D by closed discs); compatibility with restriction (ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility (ii)) gives surjectivity. (2) Rank one, connected X: cover X by elementary open subsets U_i with elementary pairwise intersections (Berkovich 3.6.1 via ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison); for elementary connected U, H²_c(U, μ_n) ≅ ℤ/n^{π₀(U)} via Tr (discs and annuli directly, elementary curves via Berkovich Corollary 6.2.8 and the triangle for a point); the presentation ⊕ H²_c(U_ij) → ⊕ H²_c(U_i) → H²_c(X) → 0 then computes H²_c(X, μ_n) as the cokernel of the coboundary of the nerve, which is ℤ/n for connected X. (3) Plus-ring case: under constancy, Tr_f is an isomorphism iff its generic stalk Tr_{X_η} is, which is the rank-one case. (4) Constancy for tubes of smooth models: ClassicalAdicEtaleCohomology:H3/formal-model-transfer identifies R²f_!μ_n with R²π_{𝒰!}μ_n on Spec(C⁺/ϖ), which is constant with value ℤ/n^{geometric components} by the scheme trace (EtaleDualityAndPerverseSheaves:EDC.2:trace-purity). (5) The constancy of R²f_!μ_n over higher-rank points for curves without local smooth models is Hub96 Theorem 7.2.2 over Spa(C, C⁺); its proof is not public (gap: trace isomorphism and duality over higher-rank points for general curves).

Acceptance: The open unit disc and the relative ball: Tr is an isomorphism for every C⁺. X = D ⊔ D (two discs): H²_c = (ℤ/n)² and Tr is the sum map, surjective, not injective.

`ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison` (lemma). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let W be a smooth separated curve over C, W^ad = W ×_{Spec C} S, and Tr^alg_W : H²_c(W, μ_n) → ℤ/n the scheme trace (EtaleDualityAndPerverseSheaves:EDC.2:trace-purity; for proper W the trace of EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement's duality). Then Tr_{W^ad} ∘ c = Tr^alg_W, where c : H²_c(W, μ_n) ≅ H²_c(W^ad/S, μ_n) is the comparison isomorphism of ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison. For W = P¹ this is the normalisation (b) of ClassicalAdicEtaleCohomology:H3/curve-trace.

Hypotheses: W smooth separated over C; n prime to p.

Proof outline: (1) Both sides are compatible with finite flat maps and with open immersions (EtaleDualityAndPerverseSheaves:EDC.2:trace-purity for the scheme trace; ClassicalAdicEtaleCohomology:H3/curve-trace (a) and ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace for the analytic trace; the comparison c is compatible with both by ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison). (2) Every point of W has an open neighbourhood W₀ with a finite flat map W₀ → A¹ ⊆ P¹ (Noether normalisation), and H²_c(W₀) → H²_c(W) is surjective for a cover; both traces equal Tr_{P¹} ∘ Tr_φ on W₀, and on P¹ they agree by the normalisation (b), which is the formal-model transfer of the degree (Berkovich Corollary 6.2.9 is the rank-one analogue).

Acceptance: W = G_m: both traces send the class of the generator of H²_c(G_m, μ_n) ≅ ℤ/n to 1. W proper of genus g: Tr_{W^ad} is the degree map on Pic(W)/n under H²(W^ad, μ_n) ≅ H²(W, μ_n).

### H3.8 Poincaré duality for curves

`ClassicalAdicEtaleCohomology:H3/smooth-curve-connected-fibres-unit` (lemma). Let f : Y → X be a quasi-compact smooth morphism of locally noetherian analytic adic spaces such that for every geometric point ξ = Spa(C, C⁺) → X the fibre Y ×_X Spa(C, C⁺) is nonempty and connected. Then for every étale sheaf of sets F on X the unit F → f_*f^*F is an isomorphism; in particular (f^*F)(Y) = F(X).

Hypotheses: f quasi-compact and smooth (hence open, AdicSpacesPartII:R0/smooth-morphism-open); fibres over all geometric points nonempty and connected.

Proof outline: (1) Check on stalks at geometric points (AdicEtaleGeometry:A1/etale-enough-points). By the stalk formula for the quasi-compact quasi-separated f (Hub96 2.6.1, ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation), (f_*f^*F)_ξ = H⁰(Y ×_X X(ξ), f^*F) with X(ξ) ≅ Spa(C_ξ, C_ξ⁺) the strict localisation (AdicEtaleGeometry:A1/strict-localisation-analytic). (2) Over the strictly local base, F is a sheaf on the chain |X(ξ)| and f^*F has sections determined by their stalks; for two sections a, b of f^*F over Y_ξ := Y ×_X X(ξ), the set where they differ is f⁻¹ of a subset of |X(ξ)| (sections of f^*F are locally constant along the connected fibres), which is closed because f is open; this is Berkovich's argument for Proposition 7.3.2. (3) Hence a section over Y_ξ agrees on each fibre with a section of F, and these glue to a section over X(ξ); injectivity uses nonemptiness of the fibres.

Acceptance: For the relative ball B_S → S over S = Spa(C, C⁺), f_*f^*F = F for every sheaf F on S; in particular H⁰(B_S, Λ) = Λ. Non-example: for the disjoint union of two balls the unit is the diagonal F → F × F, not an isomorphism.

`ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma` (lemma). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n, with C⁺ = O_C. Let f : Y → U be a smooth adic curve over an open U ⊆ S (so U = S = Spa(C, O_C)) and y ∈ Y. Then there is a separated étale morphism g : Y'' → Y with y ∈ g(Y'') such that (i) R¹(f ∘ g)_!μ_n → R¹f_!μ_n is zero and (ii) Y'' is nonempty, not proper and connected; and, iterating (i) and applying SGA 4 XVIII Lemma 2.14.2, the map R(f ∘ g)_!(ℤ/n) → Rf_!(ℤ/n) factors through ℤ/n(−1)[−2] via the trace.

Hypotheses: C⁺ = O_C; the higher-rank case is part of the gap on duality over higher-rank points; n prime to p.

Proof outline: (1) Local algebraisation (Berkovich Lemma 3.6.2, transported by ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison): after shrinking, Y is an open subspace of W^ad for a smooth affine curve W over C, and of the form {w ∈ W^ad : |h_i(w)| < ε_i} for finitely many h_i ∈ O(W). (2) Injectivity: H¹_c(Y, μ_n) → H¹_c(W^ad, μ_n) is injective, because in the localisation triangle (ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle) the term H⁰_c of the pseudo-adic complement vanishes: no connected component of the complement is quasi-compact over the base, by the maximum modulus argument of Berkovich Fundamental Lemma 7.3.4, step 3. (3) Algebraic effacement: SGA 4 XVIII Lemma 1.6.9 provides an étale W' → W killing R¹ (imported from EtaleDualityAndPerverseSheaves:EDC.2:trace-purity); via ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison the analytic map on H¹_c is zero; restrict to the preimage of Y and choose a connected non-proper component through a point over y. (4) Factorisation: SGA 4 XVIII Lemma 2.14.2 (Berkovich 7.3.5) applied to the composite of two effacing maps, with the trace isomorphism for connected curves (ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected) in degree 2.

Acceptance: For Y an open disc and y its centre, g = id works: H¹_c(D, μ_n) = 0.

`ClassicalAdicEtaleCohomology:H3/curve-poincare-duality` (theorem; planet “Poincaré duality for curves”). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let f : Y → S be a smooth adic curve. For G ∈ D⁻(Y_ét, ℤ/n) and F ∈ D⁺(S_ét, ℤ/n) the duality morphism Rf_* RHom(G, f^*F(1)[2]) → RHom(Rf_!G, F), obtained from the canonical map Rf_* RHom(G, G') → RHom(Rf_!G, Rf_!G') (for G' bounded below, via injective resolutions) with G' = f^*F(1)[2] and the trace Rf_!(f^*F(1))[2] → F (ClassicalAdicEtaleCohomology:H3/curve-trace), is an isomorphism in D(S_ét, ℤ/n). Equivalently, for all q ∈ ℤ, Ext^q(G, f^*F(1)[2]) ≅ Ext^q(Rf_!G, F). The statement uses no right adjoint of Rf_!: consumers that construct Rf^! (DiamondSixOperations S4–S5) deduce from it, by the Yoneda lemma, that the transformation f^*(1)[2] → Rf^! adjoint to the trace is an isomorphism. The theorem is proved here for C⁺ = O_C; for C⁺ ≠ O_C (the case X = Spa(C, C⁺) of ECD's proof of Theorem 24.1, Hub96 Theorem 7.5.3) it is recorded with the gap on duality over higher-rank points.

Hypotheses: S = Spa(C, C⁺), C algebraically closed; n prime to p (false for p-torsion, Berkovich Remark 6.2.10); G bounded above, F bounded below; unbounded forms follow from finite cohomological dimension and commutation with direct sums; proof complete for C⁺ = O_C; for C⁺ ≠ O_C the effacement step needs local algebraisation over Spa(C, C⁺), which is only in Hub96 (gap).

Proof outline: (1) Way-out reduction: fixing one variable, both sides are way-out functors of the other, so it suffices to treat G a sheaf and F = F'(−1)[−2] a sheaf (Berkovich 7.3.1, first paragraph; ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension for the amplitudes); write Φ^q(G) = Ext^q(G, f^*F') and Ψ^q(G) = Hom(Rf_!G, F'(−1)[q − 2]). (2) Φ is a universal δ-functor (right satellites of Φ⁰); it suffices that Φ⁰ ≅ Ψ⁰ and Ψ^q is effaceable for q ≥ 1. (3) Φ⁰ ≅ Ψ⁰ on generators: the sheaves g_!(ℤ/n)_V with g : V → Y separated étale and V → U ⊆ S smooth with nonempty connected geometric fibres generate Sh(Y_ét, ℤ/n) (Berkovich 7.3.1 Step 1 and Corollary 3.7.3, via ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison); for them Φ⁰ = F'(U) by adjunction and Ψ⁰ = Hom(R²(f g)_!(ℤ/n)(1), F') = F'(U) by the trace isomorphism for connected fibres (ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected) and ClassicalAdicEtaleCohomology:H3/smooth-curve-connected-fibres-unit. (4) Effaceability of Ψ^q, q ≥ 1: for M = h_!(ℤ/n)_V and a class α ∈ Ψ^q(M), ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma produces étale V'' → V covering a given point such that α restricted to V'' factors through a class in H^q(U, F') for an open U of S; since q ≥ 1 and U is strictly local, this class vanishes (AdicEtaleGeometry:A1/geometric-point-etale-split), so α dies on a surjection ⊕ M'' → M (Berkovich 7.3.1 Step 2). (5) Assembling Steps 1–2 gives the theorem for C⁺ = O_C. For C⁺ ≠ O_C the same argument applies once the effacement lemma and the connected-fibre trace isomorphism are available over Spa(C, C⁺); the reduction of the latter to smooth models is in ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected, and the general case is Hub96 Theorem 7.5.3 (gap).

Acceptance: G = ℤ/n, F = ℤ/n on S = Spa(C, O_C), Y connected: H^{2−q}_c(Y, μ_n)^∨ ≅ H^q(Y, ℤ/n), e.g. H²_c(Y, μ_n) ≅ ℤ/n dual to H⁰(Y, ℤ/n) = ℤ/n. Y = B the ball over Spa(C, O_C) and G = j_!ℤ/n for the open disc j : D ⊆ B: Ext^q(j_!ℤ/n, μ_n[2]) = H^{q+2}(D, μ_n) ≅ Hom(H^{−q}_c(D, ℤ/n), ℤ/n). ECD condition (iii) at X = Spa(C, O_C) (only U = X occurs): the trace-adjoint map ℤ/n(1)[2] → Rf^!ℤ/n is an isomorphism.

`ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility` (lemma). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let f : Y → S be a quasi-compact smooth adic curve, j : U → S a quasi-compact open (U = Spa(C, C⁺_U) with C⁺ ⊆ C⁺_U ⊆ O_C), f_U : Y_U → U and j' : Y_U → Y the base changes. Then: (i) Rf_! ∘ j'_! ≅ j_! ∘ Rf_{U!} canonically; (ii) under (i), Tr_f ∘ Rf_!(j'_! f_U^*K(1))[2] = j_!(Tr_{f_U}) for K ∈ D(U_ét, ℤ/n), using j'_! f_U^* ≅ f^* j_!; (iii) consequently the duality morphisms of ClassicalAdicEtaleCohomology:H3/curve-poincare-duality for f (with G = j'_!G_U, F = j_!F_U) and for f_U (with G_U, F_U) correspond under the adjunction isomorphisms Hom(j'_!G_U, f^*j_!F_U(1)[2]) ≅ Hom(G_U, f_U^*F_U(1)[2]) and Hom(Rf_!j'_!G_U, j_!F_U) ≅ Hom(Rf_{U!}G_U, F_U). This is the classical input of ECD Proposition 23.10(iii) for the ball over Spa(C, C⁺): together with Poincaré duality for f and f_U it identifies j'_!Rf_U^!(ℤ/n) → Rf^!j_!(ℤ/n) with the base change isomorphism j'_!f_U^*(1)[2] ≅ f^*j_!(1)[2]; that final identification is carried out by the consumer.

Hypotheses: f quasi-compact smooth adic curve over S = Spa(C, C⁺); U ⊆ S quasi-compact open; n prime to p.

Proof outline: (1) (i) Composition (ClassicalAdicEtaleCohomology:H3/lower-shriek-composition) for Y_U → Y → S and Y_U → U → S, with R⁺j_! = j_! and R⁺j'_! = j'_! for open immersions (ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases (c)). (2) (ii) Both sides are maps j_!R²f_{U!}(μ_n ⊗ K) → K' into sheaves on S; a map from j_!H to a sheaf is determined by its restriction to U (adjunction j_! ⊣ j^*), and on U both restrict to Tr_{f_U} by base change of the trace to the open U (ClassicalAdicEtaleCohomology:H3/curve-trace-base-change (i)). (3) (iii) Formal from (i), (ii), the base change isomorphism j'_!f_U^* ≅ f^*j_! (ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero) and the projection formula (ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula).

Acceptance: For the ball B_S and U = Spa(C, O_C) the generic point: R²f_!(j'_!μ_n) ≅ j_!(ℤ/n) and the trace is j_! of the rank-one trace. For U = S all statements are identities.

`ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness` (lemma). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n. Let f : X → S be a smooth adic curve that is quasi-compact or proper over S, and F a locally constant constructible sheaf of ℤ/n-modules on X. Then H^q(X, F) is finite for all q and vanishes for q > 2; if C⁺ = O_C then H^q_c(X/S, F) is finite for all q and vanishes outside [0, 2]. For affinoid X, H^q(X, F) = 0 for q ≥ 2. For arbitrary C⁺, H^q(X, F) ≅ H^q(X_η, F|_{X_η}).

Hypotheses: X quasi-compact or proper over S; F locally constant constructible, torsion prime to p.

Proof outline: (1) C⁺ = O_C, cohomology: F is overconvergent, so H^q(X, F) is the Berkovich cohomology of the compact curve X^Berk (ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison (c)); finiteness and vanishing for affinoid curves is Berkovich Theorem 6.4.1 (locally constant F reduces to constant F by a finite étale Galois cover and Hochschild–Serre), for proper curves Berkovich Corollary 7.4.4, and for general quasi-compact X a finite affinoid cover and the Čech spectral sequence (DiamondsAndVStacks:D0/cech-to-derived-comparison). (2) Arbitrary C⁺: X_η ⊆ X is a quasi-compact dense pro-open subspace and F is overconvergent, so RΓ(X, F) ≅ RΓ(X_η, F) (Zavyalov, Lemma 10.3). (3) Compact supports for C⁺ = O_C: by Poincaré duality (ClassicalAdicEtaleCohomology:H3/curve-poincare-duality with G = F), H^q_c(X, F) is the ℤ/n-dual of H^{2−q}(X, F^∨(1)), which is finite; vanishing outside [0, 2] by ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension.

Acceptance: The closed disc: H⁰ = ℤ/n, H^q = 0 for q > 0; H^q_c = 0 for q ≠ 2 and H²_c(B, μ_n) = ℤ/n. A proper curve of genus g over Spa(C, C⁺): H¹(X, ℤ/n) ≅ (ℤ/n)^{2g} for every C⁺.

`ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing` (theorem). Notation: C an algebraically closed field complete for a nontrivial nonarchimedean absolute value, with residue characteristic p ≥ 0; C⁺ ⊆ C an open and bounded valuation subring of arbitrary rank; S = Spa(C, C⁺), with closed point s and generic point η = Spa(C, O_C); n ≥ 1 an integer prime to p (so n is invertible in C⁺); μ_n the étale sheaf of n-th roots of unity and Λ(1) = Λ ⊗ μ_n, with C⁺ = O_C. Let X be a smooth adic curve over S and F a locally constant constructible sheaf of ℤ/n-modules with dual F^∨ = Hom(F, ℤ/n). The pairing H^q_c(X, F) × H^{2−q}(X, F^∨(1)) → H²_c(X, μ_n) →^{Tr} ℤ/n is nondegenerate: it induces an isomorphism H^q_c(X, F) ≅ Hom(H^{2−q}(X, F^∨(1)), ℤ/n) for all q, and, when X is quasi-compact or proper (all groups finite, ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness), also H^{2−q}(X, F^∨(1)) ≅ Hom(H^q_c(X, F), ℤ/n). In derived form RΓ_c(X, F) ≅ RHom(RΓ(X, F^∨(1)), ℤ/n)[−2] and, for finite groups, the biduality RΓ(X, F^∨(1)) ≅ RHom(RΓ_c(X, F), ℤ/n)[−2]; this is the passage between a complex and its dual. For X = W^ad with W smooth projective over C the pairing is the algebraic one under ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison.

Hypotheses: C⁺ = O_C (rank one); for general C⁺ the cohomology side is unchanged (ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness), and the plus-ring pairing is part of the gap on duality over higher-rank points; F locally constant constructible; n prime to p; ℤ/n is self-injective, so no Ext-terms occur.

Proof outline: (1) Apply Poincaré duality (ClassicalAdicEtaleCohomology:H3/curve-poincare-duality) with G = F and the constant sheaf ℤ/n on S: Ext^q(F, μ_n[2]) ≅ Hom(H^{−q}_c(X, F), ℤ/n); since F is locally constant, RHom(F, μ_n) = F^∨(1) and Ext^q(F, μ_n) = H^q(X, F^∨(1)) (Berkovich 7.4.3). (2) Global sections over the strictly local S are exact and ℤ/n is an injective ℤ/n-module, so RHom(RΓ_c(X, F), ℤ/n) = Hom(H^{−•}_c, ℤ/n) and the first isomorphism follows; the identification with the cup product is the definition of the duality morphism. (3) Finite groups: Pontryagin duality for finite ℤ/n-modules gives the second isomorphism and biduality. (4) Algebraic comparison: ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison and the compatibility of cup products with analytification identify the pairing with the one of EtaleDualityAndPerverseSheaves:EDC.2:pairings (for ℚ_ℓ-coefficients and j_* the statement of EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement).

Acceptance: X proper of genus g, F = ℤ/n: H¹(X, ℤ/n) × H¹(X, μ_n) → ℤ/n is perfect, groups (ℤ/n)^{2g}. X = D the open disc: H²_c(D, ℤ/n) = ℤ/n(−1) is dual to H⁰(D, μ_n) = μ_n, and H^q_c(D) = 0 for q ≠ 2 matches H^q(D, μ_n) = 0 for q ≠ 0.

### Gaps

- **Universal compactification beyond the affinoid case (Hub96 Theorem 5.1.5, Corollaries 5.1.6 and 5.1.14).** The affinoid chart Spa(B, B'⁺) with minimal plus ring, its valuative description and partial properness are proved from public inputs (ECD Propositions 18.6–18.7 give the diamond version; Fargues–Scholze restate the minimal plus ring). The gluing of affinoid compactifications for a separated, taut, locally +weakly finite type morphism, the properness of X̄ → Y for quasi-compact f and the dimension equality dim.tr f̄ = dim.tr f are Hub96 5.1.5, 5.1.6 and 5.1.14, known only through Zavyalov's citations. Next action: write out the gluing along compactified intersections using separatedness (uniqueness of gluing maps) and tautness (quasi-compact closures), following ECD's valuative construction. Needed by: `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation`.
- **Proper base change at the closed point of Spa(C, C⁺) for non-algebraisable proper spaces (Hub96 Proposition 4.4.3).** RΓ(X, j'_!F) = 0 for proper X over Spa(C, C⁺) and F vanishing on the pseudo-adic closed fibre is Hub96 Proposition 4.4.3, quoted by Zavyalov (proof of Proposition 9.3). The case of X = d(𝒫̂) for a proper C⁺-scheme 𝒫 and algebraic sheaves is proved here from Hub96 3.5.14–3.5.16 (H1:formal-adic-comparison) and henselian proper base change; this covers P¹ and projective curves. For arbitrary proper X and arbitrary constructible F the only public argument is ECD's diamond proof of Theorem 19.2 via Lemma 19.4 (Zariski–Riemann spaces and scheme proper base change), which uses canonical compactifications of strictly totally disconnected spaces and has no classical counterpart in the sources read. Needed by: `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing`, `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change`.
- **Cohomological dimension of proper pushforward from compactifications and over higher-rank points (Hub96 Propositions 5.3.11 and 5.5.8).** The bound R^q f_! = 0 for q > 2d is restated by ECD (5.5.8 for the ball) and Zavyalov (5.3.11); the rank-one absolute bound is Hub96 2.8.3 as restated by Hansen and Berkovich 5.3.8. The passage to the non-locally-of-finite-type compactification X̄ and to closed fibres over higher-rank points Spa(C, C⁺) is only in Hub96. For the relative ball and P¹ over any Spa(C, C⁺) the bound is proved directly by formal-model transfer (node relative-ball-compact-support). Needed by: `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums`.
- **Huber–Berkovich comparison (Hub96 Proposition 8.3.1, Lemma 8.1.8, Theorem 8.3.5).** The equivalence between taut adic spaces locally of finite type over Spa(k, k°) and Hausdorff strictly k-analytic Berkovich spaces (restated by Scholze 2012, Theorem 2.24) and the agreement of étale cohomology for overconvergent sheaves (restated by Hansen) are used to import Berkovich's local structure of smooth curves (3.6.1–3.6.2) and his cohomology computations for affinoid and proper curves. Their proofs are in Hub96 §8.3 only. Alternative: reprove the local structure of smooth adic curves over Spa(C, O_C) directly from semistable reduction (Bosch–Lütkebohmert) on the adic side. Needed by: `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula`, `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected`, `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma`, `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness`, `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`.
- **Trace isomorphism and Poincaré duality over higher-rank points Spa(C, C⁺) for curves without local smooth formal models (Hub96 Theorems 7.2.2 and 7.5.3, plus-ring case).** Over Spa(C, O_C) the trace, its isomorphism property and Poincaré duality are proved by transplanting Berkovich §§6–7. Over Spa(C, C⁺) with C⁺ ≠ O_C, the trace is defined formally from the generic point, and constancy of R²f_!μ_n (hence the trace isomorphism) is proved for tubes of smooth C⁺-models (balls, discs, annuli, P¹) by formal-model transfer. The Berkovich-style duality proof needs, over Spa(C, C⁺), the trace isomorphism for arbitrary connected étale neighbourhoods V → Y with connected fibres and the effacement lemma with local algebraisation; both are Hub96-only. This is exactly ECD's appeal 'In this case, the result follows from [Hub96, Theorem 7.5.3]' for X = Spa(C, C⁺). Zavyalov's foundational paper announces a companion paper [Zav22] with a 'formal' proof of Poincaré duality in non-archimedean geometry; it was not read, and a proof through a right adjoint Rf^! would not be admissible for this stage. Needed by: `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected`, `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma`, `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`.
- **Invariance under surjective extensions Spa(C', C'⁺) → Spa(C, C⁺) for proper pushforward (Hub96 Corollary 4.3.2).** Zavyalov's proof of Lemma 9.1(3) reduces base change for Rf_* to Hub96 Corollary 4.3.2. The invariance of étale cohomology under extension of algebraically closed affinoid fields belongs to ClassicalAdicEtaleCohomology:H2 (Hub96 4.1.1(c) in ECD Lemma 16.3's form); whether H2's statement covers proper spaces over Spa(C, C⁺) and their pseudo-adic closed fibres must be checked against H2's nodes. The dependency adds an internal stage edge H2 → H3. Needed by: `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`.

### Requests to other roadmaps

- **EtaleDualityAndPerverseSheaves:EDC.2:trace-purity.** The torsion trace for smooth separated curves π : 𝒰 → T over an arbitrary base scheme T on which n is invertible (needed for T = Spec of a valuation ring of an algebraically closed field and its quotients, reached from finite type over ℤ[1/n] by limits): Tr_π : R²π_!μ_n → ℤ/n compatible with base change, with finite flat maps (degree) and open immersions, normalised by c₁(O(1)) on P¹ and by degree-one points, and an isomorphism when the geometric fibres are nonempty and connected; together with SGA 4 XVIII Lemma 1.6.9 (effacement of R¹π_! by étale localisation) and Lemma 2.14.2 in the relative form over strictly henselian bases. Needed by: `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected`, `ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison`, `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma`.
- **EtaleDualityAndPerverseSheaves:EDC.2:pairings.** Torsion Poincaré duality for smooth projective curves over an algebraically closed field: for F locally constant constructible of ℤ/n-modules (n invertible) the cup-product pairing H^i(X, F) × H^{2−i}(X, F^∨(1)) → H²(X, μ_n) → ℤ/n is perfect, compatible with the trace of EDC.2:trace-purity (the finite-level form of EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement). Needed by: `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`, `ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison`.
- **UPSTREAM:ECD:SCH_BC.** (a) Proper base change for proper finitely presented morphisms and bounded-below torsion complexes over arbitrary affine bases, (Rπ_*K)|_{Spec A/I} ≅ Rπ_{0*}(K|), obtained from the noetherian case by limits; (b) local acyclicity of smooth morphisms: for 𝒫 smooth over a valuation ring V with algebraically closed fraction field and L locally constant constructible with torsion invertible on V, the nearby cycles i^*Rj_*L equal L on the special fibre; (c) topological invariance of the étale site under universal homeomorphisms (Spec(C⁺/ϖ) versus Spec(C⁺/C°°)). Needed by: `ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change`, `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing`.
- **UPSTREAM:ECD:SCH_SUPPORT_NOETH.** Compactly supported pushforward Rπ_! for separated finitely presented morphisms, independent of the compactification, extended from noetherian bases to limits of them (the bases Spec(C⁺/ϖ)), with the values RΓ_c(A¹_κ, μ_n) = ℤ/n[−2] and RΓ_c(G_{m,κ}, ℤ/n) over algebraically closed κ and the compactification W ⊆ W̄ of a separated curve over a field. Needed by: `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`.
- **AdicSpacesPartII:R2.** The nodes AdicSpacesPartII:R2/generic-fibre-functor-d and AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison stated for ϖ-adic completions of finitely presented C⁺-schemes with C⁺ ⊆ C an open bounded valuation subring of arbitrary rank (type (S)(b) with s = ϖ): d(Spf C⁺⟨T⟩) = Spa(C⟨T⟩, C⁺⟨T⟩), d(𝒫̂) ≅ 𝒫_C ×_{Spec C} Spa(C, C⁺) for proper 𝒫, and d(𝒰̂) = λ⁻¹(𝒰) for opens 𝒰 of the special fibre. Needed by: `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`.

### Acceptance tests for the stage

1. For the closed unit ball f : B → Spa(C, O_C) and n prime to p: R²f_!μ_n ≅ ℤ/n via the trace and R^q f_!μ_n = 0
   for q ≠ 2 (ECD's use of Hub96 7.2.2 and 5.5.8); H⁰_c(B, Λ) = 0 although B is quasi-compact.
2. For B_S over S = Spa(C, C⁺) with C⁺ of rank two: R²f_!μ_n is the constant sheaf ℤ/n on the two-point chain S,
   and restricting the trace to the generic point gives the trace of test 1.
3. For P¹_S: the trace is the degree, Tr(c₁(O(1))) = 1, and H^q(P¹_S, μ_n) = μ_n, 0, ℤ/n for q = 0, 1, 2.
4. Proper base change: for S = Spa(C, C⁺), U = Spa(C, O_C) and P¹_S, j_!Rg_*Λ ≅ Rf_*j'_!Λ, both with zero stalk at s.
5. Kummer covering T ↦ T^m of the unit circle (p ∤ m): Tr ∘ φ^* = m·Tr on H²_c; the ramified T ↦ T² on the disc
   has trace multiplication by 2 at the origin (not a sum over geometric points).
6. Poincaré duality over Spa(C, O_C) for a connected curve Y: H²_c(Y, μ_n) ≅ ℤ/n is dual to H⁰(Y, ℤ/n); for a
   proper curve of genus g, H¹ × H¹ → ℤ/n is a perfect pairing of (ℤ/n)^{2g}.
7. Non-examples: the doubled disc is not compactifiable; the boundary point of the compactified disc is closed and
   not open; the compactification of the ball is not smooth; p-torsion has no trace isomorphism.

### Named declarations (index)


- `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms` — Taut locally spectral spaces and taut morphisms (definition); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/Taut`.
- `ClassicalAdicEtaleCohomology:H3/compactifiable-morphism` — Compactifiable morphisms: the classical eligible class for proper support (definition); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/Compactifiable`.
- `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space` — Pseudo-adic support spaces and their étale topoi (definition); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/PseudoAdic`.
- `ClassicalAdicEtaleCohomology:H3/universal-compactification` — Huber's universal compactification of a compactifiable morphism (construction); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/Compactification`.
- `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation` — For quasi-compact f the compactification is a quasi-compact open immersion followed by a proper map (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/Compactification`.
- `ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek` — Sections with proper support: f_! for partially proper f (construction); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image` — Huber's proper-support direct image R⁺f_! (construction); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing` — Proper base change to the pseudo-adic closed fibre over Spa(C, C⁺) (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/BaseChange`.
- `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero` — Proper base change for extension by zero: j_!Rg_* ≅ Rf_*j'_! (theorem); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/BaseChange`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence` — Independence of R⁺f_! from the chosen compactification (theorem); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition` — Composition: R⁺(g ∘ f)_! ≅ R⁺g_! ∘ R⁺f_! (theorem); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases` — R⁺f_! for proper, partially proper and étale morphisms (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change` — Proper base change for Rf_* along arbitrary morphisms (theorem); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/BaseChange`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change` — Base change for the proper-support direct image (theorem); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/BaseChange`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula` — Projection formula for the proper-support direct image (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle` — Localisation triangle for an open subspace and its pseudo-adic complement (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion` — R⁺f_! is the colimit over quasi-compact opens (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension` — Finite cohomological dimension of R⁺f_! (Hub96 Proposition 5.5.8) (theorem); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/Dimension`.
- `ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums` — Rf_! commutes with direct sums and filtered colimits (lemma); module `TauCeti/AdicSpace/EtaleCohomology/ProperSupport/LowerShriek`.
- `ClassicalAdicEtaleCohomology:H3/smooth-adic-curve` — Smooth adic curves over a locally noetherian base (definition); module `TauCeti/AdicSpace/EtaleCohomology/Curves/SmoothCurve`.
- `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace` — The trace of a flat, separated, locally quasi-finite morphism on étale sheaves (construction); module `TauCeti/AdicSpace/EtaleCohomology/Curves/QuasiFiniteTrace`.
- `ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change` — Henselian comparison: proper schemes over C⁺ and over C⁺/ϖ (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/FormalModelTransfer`.
- `ClassicalAdicEtaleCohomology:H3/formal-model-transfer` — Formal-model transfer: compactly supported cohomology of tubes over Spa(C, C⁺) (comparison); module `TauCeti/AdicSpace/EtaleCohomology/Curves/FormalModelTransfer`.
- `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support` — Compactly supported cohomology of the relative ball over Spa(C, C⁺) (theorem); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Ball`.
- `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison` — Taut adic curves over Spa(C, O_C) and Berkovich curves (comparison); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Berkovich`.
- `ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula` — Local residue computation: Kummer classes of units on annuli and the degree (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Residue`.
- `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison` — Compactly supported cohomology of analytified algebraic curves over Spa(C, C⁺) (comparison); module `TauCeti/AdicSpace/EtaleCohomology/Curves/FormalModelTransfer`.
- `ClassicalAdicEtaleCohomology:H3/curve-trace` — The trace map for smooth adic curves over Spa(C, C⁺) (construction); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Trace`.
- `ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility` — Trace compatibility with finite étale maps and with restriction to open subspaces (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Trace`.
- `ClassicalAdicEtaleCohomology:H3/curve-trace-base-change` — Trace compatibility with change of the base Spa(C, C⁺) (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Trace`.
- `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected` — The trace is an isomorphism for connected curves (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Trace`.
- `ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison` — The analytic trace of an analytified algebraic curve is the algebraic trace (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Trace`.
- `ClassicalAdicEtaleCohomology:H3/smooth-curve-connected-fibres-unit` — Pullback along smooth maps with connected fibres is fully faithful on sections (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Duality`.
- `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma` — Effacement lemma for R¹f_! of smooth curves (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Duality`.
- `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality` — Poincaré duality for smooth adic curves (theorem); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Duality`.
- `ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility` — Compatibility of the trace and duality with extension by zero from quasi-compact opens of Spa(C, C⁺) (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Duality`.
- `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness` — Finiteness of the cohomology of quasi-compact and proper smooth curves (lemma); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Duality`.
- `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing` — Nondegeneracy of the cup-product pairing for smooth curves (theorem); module `TauCeti/AdicSpace/EtaleCohomology/Curves/Duality`.

## Declaration index

Every declaration of the roadmap, layer by layer: its identifier, kind and planet, its prerequisites, and the names of its API items and unit tests (the names the suggested Lean file uses). The layer sections above state each item; an item they do not present is stated here.

### H0. Classical étale sheaves, stalks, and direct image

- **The affinoid étale basis is essentially small, so étale sheaf categories are Grothendieck abelian** — `ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/corrected-covers-pretopology`, `AdicEtaleGeometry:A1/proetale-coherence`, `AdicEtaleGeometry:A1/profinite-set-objects`, `DiamondsAndVStacks:D0/cutoff-cardinal`, `DiamondsAndVStacks:D0/completion-cardinality-bound`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `mathlib:CategoryTheory.Sheaf.isGrothendieckAbelian_of_essentiallySmall`, `mathlib:SheafOfModules`, `mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives`, `mathlib:ModuleCat`
- **Étale and pro-étale sheaves of modules on analytic adic spaces** — `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules` (construction)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `AdicEtaleGeometry:A1/slice-site`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/etale-open-map`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small`, `EnhancedDerivedSheaves:E1/sheaves-of-modules-and-the-grothendieck-property`, `mathlib:ModuleCat`, `mathlib:SheafOfModules`, `mathlib:CategoryTheory.constantSheaf`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.RepresentablyFlat`, `mathlib:CategoryTheory.Functor.sheafPullbackConstruction.preservesFiniteLimits`, `mathlib:CategoryTheory.GrothendieckTopology.overPullback`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `mathlib:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints`
  - API: `AdicSpace.EtaleSheaf`; `AdicSpace.EtaleSheaf.isGrothendieckAbelian`; `AdicSpace.EtaleSheaf.enoughInjectives`; `AdicSpace.EtaleSheaf.equivSheafOfModules`; `AdicSpace.EtaleSheaf.sections`; `AdicSpace.EtaleSheaf.const`; `AdicSpace.EtaleSheaf.const_sections`; `AdicSpace.EtaleSheaf.pushforward`; `AdicSpace.EtaleSheaf.pullback`; `AdicSpace.EtaleSheaf.restrict`; `AdicSpace.EtaleSheaf.stalk`; `AdicSpace.EtaleSheaf.stalk_pullback`; `AdicSpace.EtaleSheaf.isIso_iff_stalk`; `AdicSpace.EtaleSheaf.restrictScalars`; `AdicSpace.ProEtaleSheaf`; `AdicSpace.ProEtaleSheaf.nuPullback`
  - unit tests: `EtaleSheaf.test_const_sections_connected`; `EtaleSheaf.test_empty`; `EtaleSheaf.test_int_compat`; `EtaleSheaf.test_galois_point`; `EtaleSheaf.test_rank_one_points_insufficient`
- **Restriction to étale objects and direct image preserve injectives; cohomology of an étale object is cohomology of its étale site** — `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/slice-site`, `AdicEtaleGeometry:A1/proetale-slice`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.GrothendieckTopology.overPullback`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.Injective.injective_of_adjoint`, `mathlib:CategoryTheory.Functor.rightDerived`, `mathlib:CategoryTheory.InjectiveResolution`
- **Higher direct images are sheafifications of cohomology presheaves** — `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.Functor.rightDerived`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.InjectiveResolution`
- **Cohomology of sheaves of modules agrees with cohomology of the underlying abelian sheaves** — `ClassicalAdicEtaleCohomology:H0/module-and-abelian-cohomology-agree` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `AdicEtaleGeometry:A1/proetale-topos-enough-points`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:SheafOfModules`, `mathlib:CategoryTheory.cechComplexFunctor`
- **Bounded-below derived categories, derived global sections and derived direct images on classical analytic sites** — `ClassicalAdicEtaleCohomology:H0/derived-direct-image` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/affinoid-etale-basis-essentially-small`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/module-and-abelian-cohomology-agree`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/etale-site`, `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Plus`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlusUnit`, `mathlib:CategoryTheory.Functor.rightDerived`, `mathlib:CategoryTheory.InjectiveResolution`, `mathlib:CategoryTheory.Abelian.Ext`, `mathlib:CategoryTheory.Abelian.Ext.addEquiv₀`, `mathlib:CategoryTheory.HasExt`, `mathlib:CategoryTheory.Sheaf.H`, `mathlib:CategoryTheory.Sheaf.H.equiv₀`, `mathlib:CategoryTheory.constantSheaf`
  - API: `AdicSpace.EtaleDPlus`; `AdicSpace.RGamma`; `AdicSpace.RGamma.isIso_unit_of_injective`; `AdicSpace.etaleCohomology`; `AdicSpace.etaleCohomology_zero`; `AdicSpace.etaleCohomology.δ`; `AdicSpace.etaleCohomology_iso_ext`; `AdicSpace.etaleCohomology_iso_sheafH`; `AdicSpace.etaleCohomology_restrict`; `AdicSpace.Rpushforward`; `AdicSpace.higherDirectImage`; `AdicSpace.higherDirectImage_iso_sheafify`; `AdicSpace.Rpushforward_comp`; `AdicSpace.RNu`; `AdicSpace.RGamma_Rpushforward`
  - unit tests: `etaleCohomology_test_injective`; `etaleCohomology_test_galois`; `etaleCohomology_test_sheafH`; `RGamma_test_injective_complex`; `etaleCohomology_test_not_coherent`
- **The étale site of a subset of an analytic adic space (pseudo-adic étale site)** — `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site` (construction)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/slice-site`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.GrothendieckTopology.Point`
  - API: `AdicSpace.PseudoAdicSite`; `AdicSpace.PseudoAdicSite.topology`; `AdicSpace.PseudoAdicSite.mem_topology_iff`; `AdicSpace.PseudoAdicSite.le_topology`; `AdicSpace.PseudoAdicSite.incl`; `AdicSpace.PseudoAdicSite.point`; `AdicSpace.PseudoAdicSite.isConservativeFamily`; `AdicSpace.PseudoAdicSite.stalk_incl`; `AdicSpace.PseudoAdicSite.equivOpen`; `AdicSpace.PseudoAdicSite.map`; `AdicSpace.PseudoAdicSite.IsPseudoAdic`
  - unit tests: `PseudoAdicSite.test_univ`; `PseudoAdicSite.test_open`; `PseudoAdicSite.test_closed_point`; `PseudoAdicSite.test_not_adic`
- **Étale sheaves on Spa(C, C⁺): global sections are the stalk at the closed point and higher cohomology vanishes** — `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/etale-morphism`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `mathlib:IsAlgClosed`, `mathlib:ValuationSubring`
- **Extension by zero, restriction to closed and locally closed subsets, and cohomology with supports** — `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `AdicEtaleGeometry:A1/slice-site`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.GrothendieckTopology.overPullback`, `AdicSpacesPartII:R4/boundary-complement-restriction`
  - API: `AdicSpace.EtaleSheaf.extendByZero`; `AdicSpace.EtaleSheaf.extendByZeroAdj`; `AdicSpace.EtaleSheaf.extendByZero_exact`; `AdicSpace.EtaleSheaf.stalk_extendByZero`; `AdicSpace.EtaleSheaf.extendByZero_iso_pushforward_of_finiteEtale`; `AdicSpace.EtaleSheaf.restrict_extendByZero`; `AdicSpace.EtaleSheaf.closedRestrict`; `AdicSpace.EtaleSheaf.sectionsWithSupport`; `AdicSpace.cohomologyWithSupport`; `AdicSpace.EtaleSheaf.extendByZeroLocallyClosed`; `AdicSpace.EtaleSheaf.closedRestrict_extendByZero`
  - unit tests: `extendByZero_test_disc`; `extendByZero_test_univ`; `extendByZero_test_sheafPullback`; `extendByZero_test_stalk_boundary`; `extendByZero_test_adjunction`
- **Ordinary Ext and D⁺ cohomology agree with the shared enhanced derived category** — `ClassicalAdicEtaleCohomology:H0/ordinary-vs-enhanced-ext-comparison` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/sheaves-of-modules-and-the-grothendieck-property`, `mathlib:CategoryTheory.Abelian.Ext`, `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Plus`, `mathlib:CochainComplex.IsKInjective`, `mathlib:CochainComplex.isKInjective_of_injective`, `mathlib:DerivedCategory.Plus.Qh_map_bijective_of_isKInjective`
- **Composition of derived direct images and the Leray spectral sequence on classical analytic sites** — `ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlusUnit`, `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence`, `mathlib:CategoryTheory.Injective.injective_of_adjoint`
- **Čech-to-derived spectral sequence and acyclic-basis comparison on étale and pro-étale sites** — `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison` (theorem)
  - prerequisites: `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/etale-covering-reduction`, `AdicEtaleGeometry:A1/corrected-covers-pretopology`, `AdicEtaleGeometry:A1/etale-site`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.cechComplexFunctor`
- **Cohomology on profinite G-sets is continuous group cohomology** — `ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/profinite-g-sets-site`, `AdicEtaleGeometry:A1/profinite-group-tower`, `AdicEtaleGeometry:A1/free-g-profinite-sections-exact`, `AdicEtaleGeometry:A1/profinite-etale-galois-sets`, `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison`, `mathlib:continuousCohomology`
- **Cohomology of ν^*F on quasi-compact quasi-separated pro-étale objects is the colimit of étale cohomology** — `ClassicalAdicEtaleCohomology:H0/proetale-cohomology-continuity` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/proetale-coherence`, `AdicEtaleGeometry:A1/nu-pullback-sections-qcqs`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/pro-etale-surjective-etale-descent`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/finite-etale-tower`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`
- **Cartan–Leray spectral sequences for finite étale and pro-finite-étale Galois covers** — `ClassicalAdicEtaleCohomology:H0/cartan-leray-spectral-sequence` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology`, `ClassicalAdicEtaleCohomology:H0/proetale-cohomology-continuity`, `AdicEtaleGeometry:A1/profinite-galois-cover-is-covering`, `AdicEtaleGeometry:A1/profinite-set-objects`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `mathlib:continuousCohomology`
- **Étale cohomology agrees with pro-étale cohomology of ν^*F, and ν^* commutes with qcqs direct images** — `ClassicalAdicEtaleCohomology:H0/proetale-etale-comparison` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/nu-pullback-sections-qcqs`, `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification`, `ClassicalAdicEtaleCohomology:H0/proetale-cohomology-continuity`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence`, `mathlib:DerivedCategory.isIso_iff`
- **Affinoid-local description of étale sheaves, their cohomology and derived direct images** — `ClassicalAdicEtaleCohomology:H0/affine-local-description` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/etale-covering-reduction`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `ClassicalAdicEtaleCohomology:H0/etale-restriction-preserves-injectives`, `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`
- **Étale acyclicity of vector bundles on strongly sheafy affinoids** — `ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/etale-covering-reduction`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `AdicSpacesPartII:R3/finite-projective-module-acyclicity`, `AdicSpacesPartII:R3/vector-bundle-global-generation`, `AdicSpacesPartII:R3/finite-projective-etale-descent`, `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison`, `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`
- **Stalks of j_! and i_*, the localisation sequence and the long exact sequence of cohomology with supports** — `ClassicalAdicEtaleCohomology:H0/localisation-sequence` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`
- **Locally constant sheaves and torsion local systems on the étale site** — `ClassicalAdicEtaleCohomology:H0/torsion-local-systems` (definition)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/proetale-projection-nu`
  - API: `AdicSpace.EtaleSheaf.IsLocallyConstant`; `AdicSpace.EtaleSheaf.IsLocallyConstant.ofFiniteType`; `AdicSpace.TorsionLocalSystem`; `AdicSpace.EtaleSheaf.isLocallyConstant_const`; `AdicSpace.EtaleSheaf.IsLocallyConstant.pullback`; `AdicSpace.EtaleSheaf.IsLocallyConstant.restrict`; `AdicSpace.EtaleSheaf.IsLocallyConstant.kernel`; `AdicSpace.EtaleSheaf.IsLocallyConstant.tensor`; `AdicSpace.EtaleSheaf.IsLocallyConstant.stalk_iso`; `AdicSpace.EtaleSheaf.IsLocallyConstant.equivFiniteEtale`; `AdicSpace.EtaleSheaf.IsLocallyConstant.equivPiOneModules`; `AdicSpace.LisseSheaf`
  - unit tests: `IsLocallyConstant.test_galois_point`; `IsLocallyConstant.test_field_pair_constant`; `IsLocallyConstant.test_analytification`; `IsLocallyConstant.test_extendByZero`; `IsLocallyConstant.test_representable`
- **Locally constant sheaves of finite sets are finite étale covers, and π₁-sets on connected spaces** — `ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/finite-etale-galois-category`, `AdicEtaleGeometry:A1/etale-covering-reduction`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/finite-etale-rational-descent`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicSpacesPartII:R3/finite-projective-etale-descent`, `AdicSpacesPartII:R3/etale-iff-trace-pairing-perfect`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`
- **Constructible sheaves in Huber's classical sense** — `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves` (definition) — planet *Constructible sheaf*
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `DiamondsAndVStacks:D0/locally-spectral-space`
  - API: `AdicSpace.IsConstructibleSubset`; `AdicSpace.EtaleSheaf.IsConstructible`; `AdicSpace.EtaleSheaf.IsConstructible.ofIsLocallyConstant`; `AdicSpace.EtaleSheaf.IsConstructible.refine`; `AdicSpace.EtaleSheaf.IsConstructible.kernel`; `AdicSpace.EtaleSheaf.IsConstructible.pullback`; `AdicSpace.EtaleSheaf.IsConstructible.extendByZero`; `AdicSpace.EtaleSheaf.IsConstructible.pushforward_finiteEtale`; `AdicSpace.EtaleSheaf.IsConstructible.stalk_fg`; `AdicSpace.EtaleSheaf.IsConstructible.colimit`; `AdicSpace.DbConstructible`
  - unit tests: `IsConstructible.test_localSystem`; `IsConstructible.test_zero`; `IsConstructible.test_extendByZero_disc`; `IsConstructible.test_skyscraper`; `IsConstructible.test_filtered_colimit`
- **Stability of constructible sheaves: abelian subcategory, pullback, extension by zero and finite étale pushforward** — `ClassicalAdicEtaleCohomology:H0/constructible-sheaves-stability` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `ClassicalAdicEtaleCohomology:H0/localisation-sequence`, `ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicEtaleGeometry:A1/etale-morphism`, `DiamondsAndVStacks:D0/locally-spectral-space`
- **Every étale sheaf of Λ-modules is a filtered colimit of constructible sheaves** — `ClassicalAdicEtaleCohomology:H0/torsion-sheaf-colimit-of-constructible` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/constructible-sheaves-stability`, `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/affine-local-description`, `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`
- **The Kummer sequence and Hilbert 90 on the étale site** — `ClassicalAdicEtaleCohomology:H0/kummer-sequence` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-structure-sheaf`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/basis-comparison`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles`, `ClassicalAdicEtaleCohomology:H0/cech-to-derived-comparison`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:rootsOfUnity`
- **Roots of unity and Tate twists on étale and pro-étale sites** — `ClassicalAdicEtaleCohomology:H0/tate-twists` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/kummer-sequence`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/affine-local-description`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `AdicEtaleGeometry:A1/strict-localisation-analytic`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `mathlib:rootsOfUnity`, `mathlib:IsPrimitiveRoot`, `AdicSpacesPartII:R4/analytification-etale-site`
  - API: `AdicSpace.muN`; `AdicSpace.muN_apply`; `AdicSpace.muN.isLocallyConstant`; `AdicSpace.muN.equivOfPrimitiveRoot`; `AdicSpace.EtaleSheaf.twist`; `AdicSpace.EtaleSheaf.twistAdd`; `AdicSpace.EtaleSheaf.twist_pullback`; `AdicSpace.EtaleSheaf.twist_Rpushforward`; `AdicSpace.EtaleSheaf.stalk_muN`; `AdicSpace.ZellOne`; `AdicSpace.muN_analytification`
  - unit tests: `muN_test_stalk`; `twist_test_zero`; `muN_test_rootsOfUnity`; `twist_test_add`; `kummer_test_char_p`
- **Huber tilde-limits X ∼ lim X_i: the topological condition and the density condition** — `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit` (definition) — planet *Huber tilde-limit*
  - prerequisites: `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `mathlib:TopCat.limitCone`, `mathlib:CategoryTheory.IsCofiltered`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.IsTildeLimit`; `AdicSpace.IsTildeLimit.Homeomorph`; `AdicSpace.IsTildeLimit.Dense`; `AdicSpace.IsTildeLimit.homeomorph`; `AdicSpace.IsTildeLimit.dense`; `AdicSpace.IsTildeLimit.mk`; `AdicSpace.IsTildeLimit.ofIso`; `AdicSpace.IsTildeLimit.reindex`; `AdicSpace.IsTildeLimit.const`; `AdicSpace.IsTildeLimit.spectralSpace`; `AdicSpace.IsTildeLimit.restrictRational`; `AdicSpace.IsTildeLimit.ofCompletedColimit`; `PseudoAdicSpace.IsTildeLimit`
  - unit tests: `IsTildeLimit.test_completed_colimit`; `IsTildeLimit.test_const`; `IsTildeLimit.test_not_categorical`; `IsTildeLimit.test_density_needed`; `IsTildeLimit.test_topology_needed`; `IsTildeLimit.test_huber_compat`
- **The adic spectrum of a colimit of Huber pairs is the limit of the adic spectra** — `ClassicalAdicEtaleCohomology:H0/spa-of-colimit-huber-pair` (lemma)
  - prerequisites: `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.mem_spa_iff`, `tauceti:TauCeti.ValuationSpectrum.comap`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap`, `tauceti:TauCeti.Huber.Pair.Hom.continuous_spaComap`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap_comp`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `mathlib:TopCat.limitCone`, `mathlib:UniformSpace.Completion.denseRange_coe`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **The affinoid criterion: completed colimits and colimit-presented affinoids are tilde-limits** — `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/spa-of-colimit-huber-pair`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCeti.ValuationSpectrum.spa_integralClosure`, `mathlib:UniformSpace.Completion.denseRange_coe`
- **Density on rational subsets defined at a finite level, and restriction of tilde-limits** — `ClassicalAdicEtaleCohomology:H0/tilde-limit-density-rational-restriction` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCeti.Huber.PairOfDefinition.toCompletionLoc`, `mathlib:UniformSpace.Completion.denseRange_coe`, `mathlib:TopCat.limitCone`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`
- **The strict localisation of an analytic adic space is a tilde-limit of its affinoid étale neighbourhoods** — `ClassicalAdicEtaleCohomology:H0/strict-localisation-tilde-limit` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/strict-localisation`, `AdicEtaleGeometry:A1/strict-localisation-analytic`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/basis-comparison`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.mem_spa_iff`, `mathlib:TopCat.limitCone`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
- **Base change of colimit-presented tilde-limits** — `ClassicalAdicEtaleCohomology:H0/tilde-limit-base-change` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion`, `ClassicalAdicEtaleCohomology:H0/strict-localisation-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/spa-of-colimit-huber-pair`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicEtaleGeometry:A1/etale-base-change`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `tauceti:TauCeti.ValuationSpectrum.comap`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **The étale site of a tilde-limit is the colimit of the étale sites (Huber 2.4.4)** — `ClassicalAdicEtaleCohomology:H0/etale-topos-of-tilde-limit` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit-affinoid-criterion`, `ClassicalAdicEtaleCohomology:H0/tilde-limit-base-change`, `ClassicalAdicEtaleCohomology:H0/tilde-limit-density-rational-restriction`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `PerfectoidSpaces:P3/henselian-finite-etale-approximation`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0`
- **Continuity of étale cohomology along tilde-limits (Huber 2.4.6)** — `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity` (theorem) — planet *Cohomological continuity*
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/etale-topos-of-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/affine-local-description`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D0`
- **Stalks of higher direct images as colimits over étale neighbourhoods** — `ClassicalAdicEtaleCohomology:H0/stalk-of-higher-direct-image-as-colimit` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/higher-direct-image-sheafification`, `AdicEtaleGeometry:A1/strict-localisation`, `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `mathlib:CategoryTheory.GrothendieckTopology.Point`, `mathlib:CategoryTheory.GrothendieckTopology.Point.presheafFiber`, `mathlib:CategoryTheory.Functor.Elements`
- **Stalks of higher direct images are cohomology of the fibre over the strict localisation (Huber 2.6.1)** — `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation` (theorem) — planet *Stalk formula over strict localisations*
  - prerequisites: `ClassicalAdicEtaleCohomology:H0/stalk-of-higher-direct-image-as-colimit`, `ClassicalAdicEtaleCohomology:H0/strict-localisation-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/tilde-limit-base-change`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/etale-topos-of-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `AdicEtaleGeometry:A1/strict-localisation-analytic`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicSpacesPartII:R0/fibre-products-existence`

### H1:henselian. Henselian pairs and approximation

- **Equivalent characterisations of henselian pairs: simple roots, coprime factorisations, étale sections, idempotents, Gabber's criterion** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations` (lemma)
  - prerequisites: `mathlib:HenselianRing`, `mathlib:HenselianLocalRing.TFAE`, `mathlib:Algebra.Etale`, `mathlib:Algebra.IsIntegral`, `mathlib:Ideal.jacobson`
- **A henselian pair depends only on the radical of the ideal** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-radical-invariance` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations`, `mathlib:HenselianRing`, `mathlib:Ideal.radical`
- **A henselian pair depends only on the ideal as a non-unital ring** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-shared-ideal-invariance` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations`, `mathlib:HenselianRing`, `mathlib:Ideal.jacobson`
- **Henselian pairs are invariant under universal homeomorphisms of spectra** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-universal-homeomorphism-invariance` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations`, `mathlib:HenselianRing`, `mathlib:Algebra.IsIntegral`, `mathlib:Algebra.Etale`
- **Henselian f-adic rings: independence of the open subring and the open ideal (Huber 1996, Lemma 3.1.1)** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring-independence` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-radical-invariance`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-shared-ideal-invariance`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-universal-homeomorphism-invariance`, `tauceti:TauCeti.Huber.IsHuberRing`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `mathlib:IsTopologicallyNilpotent`, `mathlib:HenselianRing`
- **A ring of definition of a complete Huber ring is adically complete** — `ClassicalAdicEtaleCohomology:H1:henselian/ring-of-definition-adically-complete` (lemma)
  - prerequisites: `tauceti:TauCeti.Huber.PairOfDefinition`, `mathlib:IsAdicComplete`, `mathlib:IsAdic`, `mathlib:CompleteSpace`
- **A complete f-adic ring is henselian: every henselian datum of a complete Huber ring is a henselian pair** — `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-radical-invariance`, `ClassicalAdicEtaleCohomology:H1:henselian/ring-of-definition-adically-complete`, `PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions`, `mathlib:HenselianRing`, `tauceti:TauCeti.Huber.isBounded_subringClosure`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `tauceti:TauCeti.Huber.IsRingOfIntegralElements`
- **Henselian f-adic rings and henselian affinoid rings (Huber 1996, Definition 3.1.2)** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring` (definition) — planet *Henselian f-adic ring*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring-independence`, `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian`, `PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `tauceti:TauCeti.Huber.IsHuberRing`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.powerBoundedSubring_eq_top`, `mathlib:HenselianRing`
  - API: `Huber.IsHenselian`; `Huber.IsHenselian.henselianRing`; `Huber.IsHenselian.of_henselianRing`; `Huber.IsHenselian.of_completeSpace`; `Huber.IsHenselian.of_discreteTopology`; `Huber.IsHenselian.of_isOpen_subring`; `Huber.IsHenselian.of_ringEquiv`; `Huber.IsHenselian.iff_isTopologicallyHenselian`; `Huber.Pair.IsHenselian`
  - unit tests: `IsHenselian_test_padic`; `IsHenselian_test_discrete`; `IsHenselian_test_rational_three_adic`; `IsHenselian_test_algebraic_padic`; `IsHenselian_test_tate_compat`
- **In a henselian Huber ring the unit group is open, maximal ideals are closed, and units are detected on Spa** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-affinoid-unit-criterion` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring`, `tauceti:Ideal.isClosed_of_isMaximal_of_isOpen_isUnit`, `tauceti:Ideal.closure_ne_top_of_isOpen_isUnit`, `tauceti:TauCeti.ValuationSpectrum.spa_eq_empty_iff_one_mem_closure_zero`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_spa_le_supp_of_ne_top`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:Ideal.jacobson`
- **Henselization of an f-adic ring and of an affinoid ring (Huber 1996, Lemma 3.1.3), with plus ring, ideal of definition and completion** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring-independence`, `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian`, `PerfectoidSpaces:P3/henselisation-of-pairs`, `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.PairOfDefinition.completion`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.IsRingOfIntegralElements`, `mathlib:HenselianRing`, `mathlib:Algebra.Etale`
  - API: `Huber.Henselization`; `Huber.Henselization.of`; `Huber.Henselization.isHuberRing`; `Huber.Henselization.isHenselian`; `Huber.Henselization.lift`; `Huber.Henselization.lift_comp_of`; `Huber.Henselization.hom_ext`; `Huber.Henselization.map`; `Huber.Henselization.of_bijective_iff`; `Huber.Henselization.completionEquiv`; `Huber.Henselization.ringOfDefinitionEquiv`; `Huber.Pair.henselization`; `Huber.Pair.henselization_plus`
  - unit tests: `Huber.henselization_test_complete`; `Huber.henselization_test_Zp`; `Huber.henselization_test_completion`; `Huber.henselization_test_lift`; `Huber.henselization_test_not_completion`
- **The henselization of an affinoid ring along a rational subset (Huber 1996, Lemma 3.1.4 and (3.1.5))** — `ClassicalAdicEtaleCohomology:H1:henselian/rational-henselization` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-affinoid-unit-criterion`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring`, `tauceti:TauCeti.Huber.PairOfDefinition.localization`, `tauceti:TauCeti.Huber.PairOfDefinition.locTopology`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spaLocalizationToRationalSubset`, `tauceti:TauCeti.ValuationSpectrum.valuation_ne_zero_of_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.vle_one_of_comap_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `mathlib:IsLocalization.Away`
  - API: `Huber.Pair.rationalHenselization`; `Huber.Pair.rationalHenselization.toHom`; `Huber.Pair.rationalHenselization.isHenselian`; `Huber.Pair.rationalHenselization.spaHomeomorph`; `Huber.Pair.rationalHenselization.lift`; `Huber.Pair.rationalHenselization.hom_ext`; `Huber.Pair.rationalHenselization.equivOfEq`; `Huber.Pair.rationalHenselization.restrict`; `Huber.Pair.rationalHenselization.completionEquiv`
  - unit tests: `Huber.Pair.rationalHenselization_test_whole`; `Huber.Pair.rationalHenselization_test_disc`; `Huber.Pair.rationalHenselization_test_lift`; `Huber.Pair.rationalHenselization_test_restriction`; `Huber.Pair.rationalHenselization_test_not_complete`
- **Special and pro-special subsets of Spa A (Huber 1996, Definition 3.1.6)** — `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets` (definition) — planet *Pro-special subset*
  - prerequisites: `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `AdicSpacesPartII:R0/adic-ring-homomorphism`
  - API: `Huber.specialSubset`; `Huber.IsSpecialSubset`; `Huber.IsProSpecialSubset`; `Huber.IsSpecialSubset.isProSpecialSubset`; `Huber.isSpecialSubset_rationalSubset`; `Huber.IsProSpecialSubset.iInter`; `Huber.specialSubset_eq_diff`; `Huber.IsSpecialSubset.preimage`; `Huber.IsSpecialSubset.completion`
  - unit tests: `Huber.isSpecialSubset_rationalSubset`; `Huber.isSpecialSubset_univ`; `Huber.specialSubset_test_tube`; `Huber.specialSubset_test_not_open`
- **Special subsets are locally closed and constructible; pro-special subsets are convex and pro-constructible (Huber 1996, Corollary 3.1.8)** — `ClassicalAdicEtaleCohomology:H1:henselian/special-subsets-locally-closed-constructible` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `tauceti:TauCeti.ValuationSpectrum.isOpen_val_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.isCompact_of_mem_spaRationalFamily`, `tauceti:TauCeti.ValuationSpectrum.spaLocalizationToRationalSubset`, `mathlib:Topology.IsConstructible`, `mathlib:SpectralSpace`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D0/locally-spectral-space`
- **Henselization of an affinoid ring along a pro-special subset: triples, construction, universal property and examples (Huber 1996, 3.1.11–3.1.13)** — `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset` (construction) — planet *Henselization along a pro-special subset*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `ClassicalAdicEtaleCohomology:H1:henselian/rational-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-radical-invariance`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring`, `PerfectoidSpaces:P3/henselisation-of-pairs`, `AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus`, `tauceti:TauCeti.ValuationSpectrum`, `mathlib:HenselianRing`
  - API: `Huber.Triple`; `Huber.Triple.henselization`; `Huber.Triple.saturation`; `Huber.Pair.proSpecialHenselization`; `Huber.Pair.proSpecialHenselization.equivOfPresentation`; `Huber.Pair.proSpecialHenselization.restrict`; `Huber.Pair.proSpecialHenselization.map`; `Huber.Pair.proSpecialHenselization.rationalEquiv`; `Huber.Pair.proSpecialHenselization.isHenselian`; `Huber.Pair.proSpecialHenselization.adicEquiv`; `Huber.Pair.proSpecialHenselization.formalGenericFibreEquiv`
  - unit tests: `Huber.Pair.proSpecialHenselization_test_rational`; `Huber.Pair.proSpecialHenselization_test_complete`; `Huber.Pair.proSpecialHenselization_test_tube`; `Huber.Pair.proSpecialHenselization_test_affinoid_field`; `Huber.Pair.proSpecialHenselization_test_not_germs`
- **Henselization along a cofiltered intersection of pro-special subsets is the colimit** — `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-henselization-continuity` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `PerfectoidSpaces:P3/henselisation-of-pairs`, `mathlib:Ring.DirectLimit`
- **Fibre products of pseudo-adic spaces with schemes and the morphism of étale sites to a scheme (Huber 1996, 3.2.7–3.2.8)** — `ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product` (construction)
  - prerequisites: `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `ClassicalAdicEtaleCohomology:H0`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-base-change`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Sheaf.H`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.PseudoAdic.schemeFibreProduct`; `AdicSpace.PseudoAdic.schemeFibreProduct.fst`; `AdicSpace.PseudoAdic.schemeFibreProduct.snd`; `AdicSpace.PseudoAdic.schemeFibreProduct.lift`; `AdicSpace.PseudoAdic.schemeFibreProduct.surjective_points`; `AdicSpace.PseudoAdic.schemeFibreProduct.isEtale_fst`; `AdicSpace.PseudoAdic.etaleSitePullback`; `AdicSpace.PseudoAdic.etaleSitePullback_comp`; `AdicSpace.PseudoAdic.etaleCohomologyPullback`
  - unit tests: `AdicSpace.PseudoAdic.schemeFibreProduct_test_identity`; `AdicSpace.PseudoAdic.schemeFibreProduct_test_line`; `AdicSpace.PseudoAdic.schemeFibreProduct_test_points_not_injective`; `AdicSpace.PseudoAdic.schemeFibreProduct_test_analytification`; `AdicSpace.PseudoAdic.etaleSitePullback_test_hansen`
- **The comparison morphism of topoi γ between a pseudo-adic space over Spec A^▷ and its henselian scheme model (Huber 1996, 3.2.12)** — `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/special-subsets-locally-closed-constructible`, `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
  - API: `AdicSpace.henselianComparison`; `AdicSpace.henselianComparison.snd_comp`; `AdicSpace.henselianComparison.triangle`; `AdicSpace.henselianComparison.of_complete`; `AdicSpace.henselianComparison.naturality`; `AdicSpace.henselianComparison.restrict`; `AdicSpace.henselianComparison.cohomologyMap`
  - unit tests: `AdicSpace.henselianComparison_test_complete`; `AdicSpace.henselianComparison_test_triangle`; `AdicSpace.henselianComparison_test_etale_base_change`; `AdicSpace.henselianComparison_test_not_i`
- **Stalks of the comparison direct images at geometric points via strict localisations** — `ClassicalAdicEtaleCohomology:H1:henselian/strict-localisation-stalk-formula` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product`, `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `AdicEtaleGeometry:A1/strict-localisation`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Continuity of the henselian comparison under cofiltered intersections of pro-special subsets and finite-presentation limits** — `ClassicalAdicEtaleCohomology:H1:henselian/comparison-continuity-under-limits` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-henselization-continuity`, `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/special-subsets-locally-closed-constructible`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `AdicCoefficientsAndComparisons:L2`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Affine analogue of proper base change: étale cohomology of a henselian pair (Gabber; Huber 1993, Theorem 0.1; Huber 1996, Lemma 3.2.5)** — `ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5` (theorem) — planet *Affine analogue of proper base change*
  - prerequisites: `mathlib:HenselianRing`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Sheaf.H`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`
- **Vanishing of the cohomology of the closed fibre of a push-forward from a separably closed point (Huber 1993, statements A_i)** — `ClassicalAdicEtaleCohomology:H1:henselian/henselian-comparison-separably-closed-points` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5`, `PerfectoidSpaces:P3/henselisation-of-pairs`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:IsSepClosed`
- **The Zariski–Riemann space of a field over a ring is the limit of its projective integral models (Huber 1993, Lemma 2.1)** — `ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-space-as-limit` (lemma)
  - prerequisites: `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0/locally-spectral-space`, `mathlib:ValuationRing`, `mathlib:SpectralSpace`, `tauceti:TauCeti.ValuationSpectrum`
- **Étale maps to closed subschemes of a normal integral scheme with separably closed function field are local isomorphisms (Huber 1993, Lemma 2.4)** — `ClassicalAdicEtaleCohomology:H1:henselian/etale-over-normal-separably-closed-local-isomorphism` (lemma)
  - prerequisites: `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:IsSepClosed`
- **Cohomological triviality of Zariski–Riemann spaces of separably closed fields (Huber 1993, Theorem 0.2 and Proposition 4.1)** — `ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-cohomology-vanishing` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/zariski-riemann-space-as-limit`, `ClassicalAdicEtaleCohomology:H1:henselian/etale-over-normal-separably-closed-local-isomorphism`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-comparison-separably-closed-points`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:ValuationRing`, `mathlib:IsSepClosed`, `mathlib:CategoryTheory.Sheaf.H`
- **Relative comparison theorem for schemes over an affinoid ring (Huber 1996, Theorem 3.2.10, with 3.2.12)** — `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12` (theorem) — planet *Relative comparison theorem*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/comparison-continuity-under-limits`, `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Comparison for sheaves pulled back from Spec A^▷ (Huber 1996, Theorem 3.2.9)** — `ClassicalAdicEtaleCohomology:H1:henselian/sheaf-comparison-3-2-9` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12`
- **The fundamental comparison theorem for pro-special subsets (Huber 1996, Theorem 3.2.1)** — `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1` (theorem) — planet *Fundamental comparison theorem*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/sheaf-comparison-3-2-9`, `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/special-subsets-locally-closed-constructible`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Étale cohomology of a complete affinoid ring and of its adic spectrum (Huber 1996, Corollary 3.2.2)** — `ClassicalAdicEtaleCohomology:H1:henselian/complete-affinoid-comparison-3-2-2` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `ClassicalAdicEtaleCohomology:H1:henselian/comparison-morphism-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `ClassicalAdicEtaleCohomology:H1:henselian/pseudo-adic-scheme-fibre-product`
- **Étale cohomology of a Tate algebra topologically of finite type: algebraic versus analytic (Huber 1996, Corollary 3.2.3)** — `ClassicalAdicEtaleCohomology:H1:henselian/affinoid-algebra-comparison-3-2-3` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/complete-affinoid-comparison-3-2-2`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`
- **Fujiwara's comparison for noetherian henselian pairs (Huber 1996, Example 3.2.11)** — `ClassicalAdicEtaleCohomology:H1:henselian/fujiwara-comparison-3-2-11` (application)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-ring`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus`

### H1:formal-adic-comparison. Formal completion and the actual comparison map

- **Étale morphisms of formal schemes of type (S)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism` (definition)
  - prerequisites: `AdicSpacesPartII:F0/adic-morphism-of-formal-schemes`, `AdicSpacesPartII:F0/ideal-of-definition`, `AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type`, `AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type`, `AdicSpacesPartII:F0/formal-fibre-product`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.Etale.etale_isStableUnderBaseChange`, `mathlib:AlgebraicGeometry.Etale.etale_comp`, `mathlib:AlgebraicGeometry.Etale.of_comp`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`
  - API: `FormalScheme.Hom.IsEtale`; `FormalScheme.Hom.isEtale_iff_forall_thickening`; `FormalScheme.Hom.IsEtale.comp`; `FormalScheme.Hom.IsEtale.of_isOpenImmersion`; `FormalScheme.Hom.IsEtale.baseChange`; `FormalScheme.Hom.IsEtale.of_comp`; `FormalScheme.Hom.IsEtale.reduction`; `FormalScheme.Hom.isEtale_ofScheme_iff`; `FormalScheme.Hom.isEtale_iff_smoothFormal`
  - unit tests: `FormalScheme.isEtale_test_unramifiedExtension`; `FormalScheme.isEtale_test_reductionOnly`; `FormalScheme.isEtale_test_notAdic`; `FormalScheme.isEtale_test_openImmersion`; `FormalScheme.isEtale_test_scheme`
- **The étale site X_et of a formal scheme of type (S)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme` (definition) — planet *Étale site of a formal scheme*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism`, `AdicSpacesPartII:F0/formal-fibre-product`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`
  - API: `FormalScheme.SmallEtale`; `FormalScheme.SmallEtale.hasFiniteLimits`; `FormalScheme.smallEtalePretopology`; `FormalScheme.smallEtaleTopology`; `FormalScheme.ofArrows_mem_smallEtaleTopology_iff`; `FormalScheme.SmallEtale.map`; `FormalScheme.etaleSheafPushforward`; `FormalScheme.etaleSheafPullback`; `FormalScheme.SmallEtale.ofOpens`; `FormalScheme.smallEtaleTopology_eq_formalEtaleSiteInvariance`
  - unit tests: `FormalScheme.smallEtale_test_Spf_Zp`; `FormalScheme.smallEtale_test_field`; `FormalScheme.smallEtale_test_missesClosedPoint`; `FormalScheme.smallEtale_test_scheme`; `FormalScheme.smallEtale_test_slice`
- **Étale formal schemes over X are the lifts of étale schemes over a thickening; local form Spf B^ with B étale** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism`, `AdicSpacesPartII:F0/adic-systems-equivalence-finite-ideal-type`, `AdicSpacesPartII:F0/thickening-colimit-finite-ideal-type`, `AdicSpacesPartII:F0/formal-fibre-product`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:Algebra.Etale`, `mathlib:AdicCompletion`, `tauceti:TauCeti.Huber.IsStronglyNoetherian`
- **X_et is the étale site of the reduced special scheme X_red** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre`, `AdicSpacesPartII:R2/formal-etale-site-invariance`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `SchemeAndStackFoundations:SF.2`
- **The generic fibre of an étale morphism of type-(S) formal schemes is étale; d preserves the fibre products of étale objects (Lemma 3.5.1(i), first part)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-of-etale-morphism` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`
- **Lifting of points along étale maps through the specialization map (Lemma 3.5.1(i), second part)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-point-lifting` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.iff_formallyUnramified_and_smooth`, `mathlib:Algebra.Smooth.flat`, `mathlib:Algebra.HasGoingDown.of_flat`, `mathlib:Ideal.exists_ideal_le_liesOver_of_le`, `mathlib:LocalSubring.exists_le_valuationSubring`, `mathlib:ValuationSubring.isMax_toLocalSubring`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic`, `tauceti:TauCeti.ValuationSpectrum.supp`
- **The specialization morphism of sites λ_X: d(X)_et → X_et (Lemma 3.5.1(ii), Remark 3.5.2)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda` (construction) — planet *Specialization morphism λ_X*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-of-etale-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-point-lifting`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.GrothendieckTopology.Point`
  - API: `FormalScheme.specialisationFunctor`; `FormalScheme.specialisationFunctor.isContinuous`; `FormalScheme.specialisationPushforward`; `FormalScheme.specialisationPullback`; `FormalScheme.specialisationAdjunction`; `FormalScheme.specialisationFunctor_opens`; `FormalScheme.specialisationFunctor_map`; `FormalScheme.specialisationRed`; `FormalScheme.specialisation_stalk`; `FormalScheme.specialisationPushforward_sections`
  - unit tests: `FormalScheme.specialisation_test_Spf_OK`; `FormalScheme.specialisation_test_zariski`; `FormalScheme.specialisation_test_notEssSurj`; `FormalScheme.specialisation_test_cover`; `FormalScheme.specialisation_test_empty`
- **Higher direct images R^nλ_*F: sheafification, stalks as colimits, and the Leray spectral sequence** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `mathlib:CategoryTheory.GrothendieckTopology.Point`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`
- **Pairs (X, L) and the pseudo-adic support spaces d(X, L) (3.5.3)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports` (construction) — planet *Pseudo-adic support space d(X,L)*
  - prerequisites: `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/specialisation-map`, `AdicSpacesPartII:R2/tube`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `DiamondsAndVStacks:D0/locally-spectral-space`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
  - API: `FormalScheme.Pair`; `FormalScheme.Pair.Hom`; `FormalScheme.Pair.supportSpace`; `FormalScheme.Pair.isPseudoAdic_supportSpace`; `FormalScheme.Pair.supportSpace_map`; `FormalScheme.Pair.supportSpace_univ`; `FormalScheme.Pair.supportSpace_mono`; `FormalScheme.Pair.supportSpace_isOpen`; `FormalScheme.Pair.supportSpace_isClosed`
  - unit tests: `FormalScheme.Pair.supportSpace_test_closedPoint`; `FormalScheme.Pair.supportSpace_test_notTube`; `FormalScheme.Pair.supportSpace_test_univ`; `FormalScheme.Pair.supportSpace_test_open`; `FormalScheme.Pair.supportSpace_test_microbialRankTwo`
- **The étale site (X, L)_et of a pair (3.5.3) and its functoriality (3.5.4, first part)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-etale-site` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-etale-morphism`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
  - API: `FormalScheme.Pair.SmallEtale`; `FormalScheme.Pair.smallEtaleTopology`; `FormalScheme.Pair.SmallEtale.hasFiniteLimits`; `FormalScheme.Pair.SmallEtale.map`; `FormalScheme.Pair.toposUnivEquiv`; `FormalScheme.Pair.restrictSupport`; `FormalScheme.Pair.extendByZero`; `FormalScheme.Pair.ofArrows_mem_smallEtaleTopology_iff`
  - unit tests: `FormalScheme.Pair.smallEtale_test_univ`; `FormalScheme.Pair.smallEtale_test_closedPoint`; `FormalScheme.Pair.smallEtale_test_neighbourhood`; `FormalScheme.Pair.smallEtale_test_notPointwise`; `FormalScheme.Pair.smallEtale_test_scheme`
- **The specialization morphism λ_(X,L): d(X, L)_et → (X, L)_et (3.5.3)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-etale-site`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-of-etale-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-point-lifting`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
  - API: `FormalScheme.Pair.specialisationFunctor`; `FormalScheme.Pair.specialisationFunctor.isContinuous`; `FormalScheme.Pair.specialisationPushforward`; `FormalScheme.Pair.specialisationPullback`; `FormalScheme.Pair.specialisationAdjunction`; `FormalScheme.Pair.derivedSpecialisationPushforward`; `FormalScheme.Pair.specialisation_univ`; `FormalScheme.Pair.specialisation_restrict`
  - unit tests: `FormalScheme.Pair.specialisation_test_univ`; `FormalScheme.Pair.specialisation_test_OK`; `FormalScheme.Pair.specialisation_test_cover`; `FormalScheme.Pair.specialisation_test_tube`
- **Morphisms of pairs and the specialization square (3.5.4)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-etale-site`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-of-etale-morphism`, `AdicSpacesPartII:R2/specialisation-map`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **The topos of a pair is the étale topos of the reduced subscheme on L (3.5.5)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-etale-site`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `SchemeAndStackFoundations:SF.2`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`
- **Specialization over a complete microbial valuation ring with algebraically closed fraction field** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-over-microbial-valuation-ring` (lemma)
  - prerequisites: `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `SchemeAndStackFoundations:SF.2`, `mathlib:HenselianLocalRing`, `mathlib:ValuationRing`
- **Stalks of λ^*F are the stalks of F (Proposition 3.5.6(ii))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/constructibility-and-stalks-of-lambda-pullback` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-over-microbial-valuation-ring`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `mathlib:CategoryTheory.GrothendieckTopology.Point`
- **λ^* preserves constructibility (Proposition 3.5.6(i))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/lambda-pullback-constructible-3-5-6-i` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **The formal completions of the strict localisation at a point of the special fibre (3.5.7)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-strict-localisation-system-3-5-7` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:F0/adic-completion-noetherian`, `mathlib:AdicCompletion`, `mathlib:HenselianLocalRing`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
  - API: `FormalScheme.StrictLocalisationSystem`; `FormalScheme.StrictLocalisationSystem.isCofiltered`; `FormalScheme.StrictLocalisationSystem.completion`; `FormalScheme.StrictLocalisationSystem.completionInfty`; `FormalScheme.StrictLocalisationSystem.limit_iso`; `FormalScheme.StrictLocalisationSystem.completion_isEtale`; `FormalScheme.StrictLocalisationSystem.cofinal`; `FormalScheme.StrictLocalisationSystem.isTypeS_infty_of_isNoetherian`; `FormalScheme.StrictLocalisationSystem.tildeLimit`
  - unit tests: `FormalScheme.strictLocalisationSystem_test_OK`; `FormalScheme.strictLocalisationSystem_test_zariski`; `FormalScheme.strictLocalisationSystem_test_noetherian`; `FormalScheme.strictLocalisationSystem_test_cofinal`
- **Stalks of R^nλ_*F via the completed strict localisation (Theorem 3.5.8(i))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalks-of-higher-direct-images-lambda` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-strict-localisation-system-3-5-7`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Cohomology of henselian tubes (Proposition 3.6.1)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-comparison-3-6-1` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `mathlib:HenselianRing`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Henselian tube comparison for Zariski opens and their closed subsets (Corollaries 3.6.2–3.6.3)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-closed-subsets-3-6-2-3-6-3` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-comparison-3-6-1`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `mathlib:HenselianRing`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Stalks of R^nλ_*F via the closed point of the completed strict localisation (Theorem 3.5.8(ii))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-closed-point-3-5-8-ii` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalks-of-higher-direct-images-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-closed-subsets-3-6-2-3-6-3`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-comparison-3-6-1`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-strict-localisation-system-3-5-7`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `mathlib:HenselianLocalRing`
- **The filtered stalk formula without the type-(S) hypothesis (Theorem 3.5.9)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-filtered-3-5-9` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-strict-localisation-system-3-5-7`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-closed-point-3-5-8-ii`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-closed-subsets-3-6-2-3-6-3`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-morphism`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Stalks of R^nλ_*λ^*G: the cohomology of the generic locus of the strict localisation (Theorem 3.5.10)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-constant-coefficients-3-5-10` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-strict-localisation-system-3-5-7`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-closed-point-3-5-8-ii`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/constructibility-and-stalks-of-lambda-pullback`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-closed-subsets-3-6-2-3-6-3`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `SchemeAndStackFoundations:SF.2`
- **R⁺λ_* commutes with restriction to a smaller support (Corollary 3.5.11(i))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalk-formula-filtered-3-5-9`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `mathlib:CategoryTheory.GrothendieckTopology.HasEnoughPoints`
- **R⁺λ_* commutes with extension by zero from an open support (Corollary 3.5.11(ii))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/extension-by-zero-compatibility-3-5-11-ii` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-etale-site`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-specialization-functoriality-3-5-4`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Completion data: the sites i, j, a, b attached to a scheme and a closed subscheme (3.5.12)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:F0/colimit-of-thickenings`, `AdicSpacesPartII:F0/formal-completion`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.IsClosedImmersion`
  - API: `FormalScheme.CompletionData`; `FormalScheme.CompletionData.completion`; `FormalScheme.CompletionData.isTypeS_of_isLocallyNoetherian`; `FormalScheme.CompletionData.sigma_mem_open`; `FormalScheme.CompletionData.specialMap`; `FormalScheme.CompletionData.genericMap`; `FormalScheme.CompletionData.restrict`; `FormalScheme.CompletionData.genericMap_goodReduction`
  - unit tests: `FormalScheme.completionData_test_trait`; `FormalScheme.completionData_test_unit`; `FormalScheme.completionData_test_notTypeS`; `FormalScheme.completionData_test_disc`
- **The comparison map i^* ∘ R⁺j_* → R⁺b_* ∘ a^* (Theorem 3.5.13(i))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-map-3-5-13-i` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12`, `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafAdjunctionContinuous`
  - API: `FormalScheme.CompletionData.phi`; `FormalScheme.CompletionData.comparisonInverseImage`; `FormalScheme.CompletionData.psi`; `FormalScheme.CompletionData.derivedComparison`; `FormalScheme.CompletionData.derivedComparison_H0`; `FormalScheme.CompletionData.psi_stalk`; `FormalScheme.CompletionData.derivedComparison_natural`; `FormalScheme.CompletionData.globalComparison`
  - unit tests: `FormalScheme.comparisonMap_test_trait`; `FormalScheme.comparisonMap_test_empty`; `FormalScheme.comparisonMap_test_local`; `FormalScheme.comparisonMap_test_H0`
- **Cohomology of the henselised generic locus equals that of the generic fibre of the completion** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselised-generic-locus-cohomology` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `mathlib:HenselianRing`, `mathlib:IsAdicComplete`
- **The nearby-cycle comparison for completions: i^*R⁺j_*K ≅ R⁺b_*a^*K for torsion coefficients (Theorem 3.5.13(ii))** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13` (theorem) — planet *Nearby-cycle comparison i*Rj*K ≅ Rb*a*K*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-map-3-5-13-i`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselised-generic-locus-cohomology`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-lifting-along-special-fibre`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `mathlib:CategoryTheory.GrothendieckTopology.HasEnoughPoints`
- **Cohomology of the generic fibre of the completion via nearby cycles (Corollary 3.5.14)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`
- **Cohomology of the support over a locally closed L ⊆ Y (Corollary 3.5.15)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/tube-cohomology-3-5-15` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pair-topos-reduced-subscheme-3-5-5`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **The pseudo-adic space over the closed point of d(Spf A) for a microbial valuation ring A (setup of 3.5.16)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/microbial-closed-fibre-support` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `mathlib:ValuationRing`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
  - API: `FormalScheme.MicrobialBase`; `FormalScheme.MicrobialBase.completion_isTypeS`; `FormalScheme.MicrobialBase.completion_indep`; `FormalScheme.MicrobialBase.completionData`; `FormalScheme.MicrobialBase.genericFibre_spf`; `FormalScheme.MicrobialBase.closedFibreSupport`; `FormalScheme.MicrobialBase.mem_closedFibreSupport_iff`; `FormalScheme.MicrobialBase.closedFibreSupport_eq_of_rankOne`; `FormalScheme.MicrobialBase.genericFibreMap`
  - unit tests: `FormalScheme.microbialBase_test_rankOne`; `FormalScheme.microbialBase_test_rankTwo`; `FormalScheme.microbialBase_test_nondiscrete`; `FormalScheme.microbialBase_test_notAdicSpace`
- **The comparison over a microbial valuation ring base (Corollary 3.5.16)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16` (theorem) — planet *Comparison over a microbial valuation ring*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/microbial-closed-fibre-support`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/tube-cohomology-3-5-15`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`
- **Huber's 'complex of vanishing cycles' RΨ_η is the nearby-cycle complex of LPV.0, not the cone RΦ** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles` (comparison)
  - prerequisites: `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `SchemeAndStackFoundations:SF.2`
- **Nearby cycles of X agree Galois-equivariantly with the formal nearby cycles of the completion** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-data-3-5-12`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/completion-comparison-map-3-5-13-i`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/reduced-special-scheme-equivalence`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-fibre-products`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `SchemeAndStackFoundations:SF.2`
- **Cohomology of the geometric rigid generic fibre of the completion via nearby cycles (Corollary 3.5.17)** — `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/higher-direct-images-of-lambda`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, `AdicSpacesPartII:R2/generic-fibre-fibre-products`, `AdicSpacesPartII:R4/etale-site-and-rigid-comparison`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`

### H1:valuation-nearby-cycles. Arbitrary valuation bases, not just traits

- **Valuation-base quadruples (X, S, η, s)** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple` (definition) — planet *Valuation-base quadruple*
  - prerequisites: `mathlib:ValuationRing`, `mathlib:HenselianLocalRing`, `mathlib:IsSepClosed`, `mathlib:IsLocalRing.ResidueField`, `mathlib:AlgebraicGeometry.Scheme.Hom.fiber`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`
  - API: `AlgebraicGeometry.ValuationQuadruple`; `AlgebraicGeometry.ValuationQuadruple.specializes` (projection: η ⤳ s in Spec V, i.e. 𝔭_η ⊆ 𝔭_s.); `AlgebraicGeometry.ValuationQuadruple.henselianLocalRing_special` (instance: HenselianLocalRing (Localization.AtPrime 𝔭_s) with separably closed residue field.); `AlgebraicGeometry.ValuationQuadruple.valuationRing_localizationAtEta` (instance: O_{S,η} = V_{𝔭_η} is a valuation ring of K, and O_{S,s} -> O_{S,η} is a localization.); `AlgebraicGeometry.ValuationQuadruple.specialFiberι` (projection: i: X_s -> X, the canonical morphism from the fibre over s.); `AlgebraicGeometry.ValuationQuadruple.localize` (constructor: The quadruple (X ×_S Spec O_{S,s}, Spec O_{S,s}, η, s) obtained by localizing the base at s; its special fibre is X_s.); `AlgebraicGeometry.ValuationQuadruple.ofEq` (constructor: For η = s: the quadruple (X, S, s, s).); `AlgebraicGeometry.ValuationQuadruple.residueCharExp` (data: p_s, the characteristic exponent of k(s); an integer n is 'prime to the residue characteristic' iff it is prime to p_s, iff n is invertible in O_{S,s}.); `AlgebraicGeometry.ValuationQuadruple.baseChange` (constructor: For a morphism h: S' = Spec V' -> S of valuation spectra and points η' ↦ η, s' ↦ s with O_{S',s'} strictly henselian, the quadruple (X ×_S S', S', η', s').)
  - unit tests: `ValuationQuadruple.ofSepClosedField` (degenerate: For a separably closed field k and any k-scheme X, (X, Spec k, pt, pt) is a quadruple with η = s and X_s = X.); `ValuationQuadruple.admissible_pairs_rank_two` (computation: If V is a strictly henselian valuation ring with value group ℤ × ℤ (lexicographic) and primes 0 ⊊ 𝔭 ⊊ 𝔪, then (X, Spec V, η, s) is a quadruple iff s = 𝔪; the three choices η ∈ {0, 𝔭, 𝔪} are admissible.); `ValuationQuadruple.not_of_Zp` (non-example: (Spec ℤ_(p), Spec ℤ_(p), (0), (p)) is not a quadruple: ℤ_(p) is not henselian and its residue field 𝔽_p is not separably closed; a definition asking only for a valuation ring would accept it.); `ValuationQuadruple.trait_compat` (compatibility: For a strictly henselian discrete valuation ring V with η generic and s closed, the quadruple structure on an S-scheme X is the henselian-trait datum of LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle with s̄ = s.)
- **The strict localization of a valuation spectrum at a geometric point** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring` (lemma)
  - prerequisites: `mathlib:ValuationRing`, `mathlib:ValuationRing.ValueGroup`, `mathlib:HenselianLocalRing`, `mathlib:IsSepClosed`, `mathlib:separableClosure`, `SchemeAndStackFoundations:SF.2`
- **Morphisms of quadruples and the chosen map of strict localizations** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/morphism-of-valuation-quadruples` (definition)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `mathlib:separableClosure`, `mathlib:ValuationRing`
  - API: `AlgebraicGeometry.ValuationQuadruple.Hom` (structure: The triple (g, h, ι) with f ∘ g = h ∘ f', h(η') = η, h(s') = s and ι: L -> L' a k(η)-embedding.); `AlgebraicGeometry.ValuationQuadruple.Hom.id` (constructor: The identity morphism (id, id, id_L).); `AlgebraicGeometry.ValuationQuadruple.Hom.comp` (functoriality: Componentwise composition; associative, with id_comp and comp_id.); `AlgebraicGeometry.ValuationQuadruple.Hom.strictLocalizationMap` (data: The unique local morphism h̃: S'(η̄') -> S(η̄) over h inducing ι on residue fields; strictLocalizationMap_comp and strictLocalizationMap_id.); `AlgebraicGeometry.ValuationQuadruple.Hom.galoisRestrict` (data: φ_#: Gal(L'/k(η')) ->* Gal(L/k(η)), σ' ↦ ι^{-1}σ'ι, continuous; galoisRestrict_comp and galoisRestrict_id.); `AlgebraicGeometry.ValuationQuadruple.Hom.IsCartesian` (other: The square (g, f', f, h) is a pullback square of schemes.); `AlgebraicGeometry.ValuationQuadruple.Hom.IsDominant` (other: The local homomorphism O_{S,s} -> O_{S',s'} is injective.); `AlgebraicGeometry.ValuationQuadruple.Hom.specialFiberMap` (projection: g_s: X'_{s'} -> X_s, the induced morphism of fibres; for Cartesian φ, X'_{s'} ≅ X_s ×_{k(s)} k(s').); `AlgebraicGeometry.ValuationQuadruple.Hom.ofBaseChange` (constructor: For h: S' -> S and ι, the Cartesian morphism from ValuationQuadruple.baseChange.)
  - unit tests: `ValuationQuadruple.Hom.id_galoisRestrict` (degenerate: For the identity morphism, φ_# is the identity of Gal(L/k(η)) and h̃ is the identity of S(η̄).); `ValuationQuadruple.Hom.galoisRestrict_finiteExtension` (computation: For the integral closure V' of a strictly henselian discrete valuation ring V in a finite separable K'/K, with ι = id_L, φ_#: Gal(L/K') -> Gal(L/K) is the inclusion and its image has index [K' : K].); `ValuationQuadruple.Hom.not_of_generization` (non-example: The inclusion Spec K -> Spec V (V a strictly henselian valuation ring, K = Frac V) does not underlie a morphism of quadruples (X_K, Spec K, pt, pt) -> (X, Spec V, generic, closed): the point pt would have to map to the closed point.); `ValuationQuadruple.Hom.isCartesian_baseChange` (characterisation: The morphism ValuationQuadruple.baseChange -> original, built from h: S' -> S, is Cartesian, and every Cartesian morphism with base h is isomorphic to it.)
- **The nearby-cycle functor RΨ_L = i^* Rj_* j^* of a quadruple** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base` (construction) — planet *Nearby cycles over a valuation ring*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`, `mathlib:DerivedCategory`, `mathlib:HasDerivedCategory`, `mathlib:DerivedCategory.Plus`, `mathlib:CategoryTheory.Functor.totalRightDerived`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
  - API: `AlgebraicGeometry.ValuationQuadruple.nearbyCycles` (constructor: RΨ_L: D^+(X_et, Λ) ⥤ D^+(X_{s,et}, Λ), a triangulated Λ-linear functor.); `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_def` (characterisation: RΨ_L ≅ i^* ∘ Rj_* ∘ j^* (by definition).); `AlgebraicGeometry.ValuationQuadruple.tube` (data: X_η̃ = X ×_S S(η̄) with j: X_η̃ -> X affine.); `AlgebraicGeometry.ValuationQuadruple.specialization` (data: sp: i^* ⟶ RΨ_L, from the unit id ⟶ Rj_* j^*.); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesGeo` (constructor: RΨ_L^geo = i^* R(jk)_*(jk)^* with k: X_η̄ -> X_η̃, and the natural map nearbyCycles ⟶ nearbyCyclesGeo.); `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_ofEq` (simp: η = s ⇒ RΨ_L ≅ i^*, with sp an isomorphism.); `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_generic` (compatibility: η generic ⇒ S(η̄) = η̄ and nearbyCycles ⟶ nearbyCyclesGeo is an isomorphism.); `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_stalk` (characterisation: (RΨ_L F)_x̄ ≅ RΓ(X_(x̄) ×_S S(η̄), F) (ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula).); `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_restrictScalars` (compatibility: For a ring map Λ' -> Λ, restriction of scalars commutes with RΨ_L.); `AlgebraicGeometry.ValuationQuadruple.nearbyCycles_trait` (compatibility: For a strictly henselian DVR base, RΨ_L agrees with LPV.0's RΨ_η on underlying complexes over X_s.)
  - unit tests: `ValuationQuadruple.nearbyCycles_ofEq_sheaf` (degenerate: If η = s then RΨ_L(F) ≅ i^* F for all F ∈ D^+(X_et, Λ); in particular R^qΨ_L(F) = 0 for q > 0 when F is a sheaf.); `ValuationQuadruple.nearbyCycles_base` (computation: For X = S and a ring Λ, RΨ_L(Λ_S) ≅ Λ concentrated in degree 0.); `ValuationQuadruple.nearbyCycles_kummer` (computation: V a strictly henselian DVR with uniformizer π, n prime to p_s, X = Spec V[t]/(t^n − π): R^0Ψ_L(Λ) ≅ Λ^n (one copy per K-embedding of K(π^{1/n}) into L) and R^qΨ_L(Λ) = 0 for q ≥ 1.); `ValuationQuadruple.nearbyCycles_ne_nonGeometric` (non-example: For X = S, V a strictly henselian DVR, η generic and n prime to p_s: i^* R(j_η)_* Z/n with j_η: X_η -> X (the non-geometric generic fibre) has H^1 ≅ Hom_cont(Gal(L/K), Z/n) ≠ 0, whereas R^1Ψ_L(Z/n) = 0; a definition using X_η instead of X_η̃ fails nearbyCycles_base.); `ValuationQuadruple.nearbyCycles_trait_compat` (compatibility: For V a strictly henselian DVR, η generic, s closed and a torsion ring Λ prime to p_s, RΨ_L(F) is isomorphic to the complex on X_s = X_s̄ underlying LPV.0's RΨ_η(F|X_η) (LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle, (2.1.2.3)).)
- **The continuous action of Gal(L/k(η)) on RΨ_L** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `AdicCoefficientsAndComparisons:L2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`
  - API: `AlgebraicGeometry.ValuationQuadruple.galoisAction` (data: ρ_F: Gal(L/k(η)) →* Aut(RΨ_L F), natural in F.); `AlgebraicGeometry.ValuationQuadruple.galoisAction_mul` (simp: ρ(στ) = ρ(σ) ∘ ρ(τ).); `AlgebraicGeometry.ValuationQuadruple.galoisAction_one` (simp: ρ(1) = id.); `AlgebraicGeometry.ValuationQuadruple.galoisAction_natural` (functoriality: For u: F ⟶ F', RΨ_L(u) ∘ ρ_F(σ) = ρ_{F'}(σ) ∘ RΨ_L(u).); `AlgebraicGeometry.ValuationQuadruple.isDiscrete_stalk_cohomology` (characterisation: Each stalk (R^qΨ_L F)_x̄ is a discrete Gal(L/k(η))-module (open stabilizers).); `AlgebraicGeometry.ValuationQuadruple.specialization_galoisInvariant` (compatibility: ρ(σ) ∘ sp = sp.); `AlgebraicGeometry.ValuationQuadruple.galoisAction_eq_inertia` (compatibility: η generic and V strictly henselian: Gal(L/K) is the inertia group (Gabber–Ramero 6.2.10).); `AlgebraicGeometry.ValuationQuadruple.galoisAction_trait` (compatibility: For a strictly henselian DVR, ρ is the inertia action of LPV.0 on RΨ_η.)
  - unit tests: `ValuationQuadruple.galoisAction_ofEq` (degenerate: If η = s then G_η is trivial and galoisAction is the trivial action.); `ValuationQuadruple.galoisAction_kummer` (computation: In the Kummer example (V strictly henselian DVR, X = Spec V[t]/(t^n − π), n prime to p_s), σ ∈ Gal(L/K) acts on R^0Ψ_L(Λ) ≅ Λ^{μ_n} by translation by σ(π^{1/n})/π^{1/n} ∈ μ_n.); `ValuationQuadruple.galoisAction_nontrivial` (non-example: The trivial action is not the Galois action: in the Kummer example with n ≥ 2 some σ acts on R^0Ψ_L(Λ) ≅ Λ^n without fixed basis vectors, so a definition forgetting the transport along σ̃ fails galoisAction_kummer.); `ValuationQuadruple.galoisAction_specialization` (characterisation: sp: i^*F -> RΨ_L(F) factors through the G_η-invariants in each degree: ρ(σ) ∘ sp = sp for all σ.)
- **Henselian localization: stalks of RΨ_L are cohomology of Milnor tubes** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`
- **The base-change map of nearby cycles for a morphism of quadruples** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/morphism-of-valuation-quadruples`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`
  - API: `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange` (data: c_φ: g_s^* ∘ RΨ_L ⟶ RΨ_{L'} ∘ g^*, a natural transformation of functors on D^+(X_et, Λ).); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_id` (simp: c_id = id.); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_comp` (functoriality: c_{φ∘ψ} = c_ψ ∘ ψ_s^* c_φ.); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_equivariant` (compatibility: Equivariance along φ_#.); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_specialization` (compatibility: c_φ ∘ g_s^* sp = sp'.); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_stalk` (characterisation: On stalks, c_φ is restriction along the map of Milnor tubes X'_(x̄') ×_{S'} S'(η̄') -> X_(x̄) ×_S S(η̄).); `AlgebraicGeometry.ValuationQuadruple.nearbyCyclesBaseChange_isIso` (other: Is an isomorphism for Cartesian dominant φ and torsion prime to p_s (valuative-base-change-for-nearby-cycles).)
  - unit tests: `ValuationQuadruple.nearbyCyclesBaseChange_id_example` (degenerate: c_id(F) is the identity of RΨ_L(F).); `ValuationQuadruple.nearbyCyclesBaseChange_localize` (computation: For the localization morphism at s, c_φ(F) is an isomorphism for every F ∈ D^+(X_et, Λ).); `ValuationQuadruple.nearbyCyclesBaseChange_not_iso_nonCartesian` (non-example: For V a strictly henselian DVR, n ≥ 2 prime to p_s, X = S and X' = Spec V[t]/(t^n − π) with g the structure map and h = id: c_φ(Λ): Λ -> Λ^n is the diagonal, not an isomorphism.); `ValuationQuadruple.nearbyCyclesBaseChange_equivariant_example` (characterisation: c_φ intertwines ρ(φ_# σ') and ρ'(σ') for every σ' ∈ Gal(L'/k(η')).)
- **Independence of RΨ_L of the choices, up to equivariant transport, and localization at s** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-equivariant-transport` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/morphism-of-valuation-quadruples`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula`, `AdicCoefficientsAndComparisons:L2`
- **Étale locality, proper push-forward and the projective reduction for RΨ_L** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`
- **Radicial invariance: RΨ_L is unchanged by a purely inseparable extension of the valuation base** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/radicial-invariance-of-nearby-cycles` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/morphism-of-valuation-quadruples`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.UniversallyInjective`, `mathlib:AlgebraicGeometry.Surjective`, `SchemeAndStackFoundations:SF.2`
- **RΨ_L commutes with filtered colimits; reduction to constructible coefficients** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-commute-with-filtered-colimits` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `SchemeAndStackFoundations:SF.2`
- **Comparison with the geometric generic point: Milnor tube versus Milnor fibre** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point` (theorem) — planet *Milnor tube versus Milnor fibre*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-equivariant-transport`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-commute-with-filtered-colimits`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`
- **Cohomological amplitude of RΨ_L: vanishing above twice the generic-fibre dimension** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-cohomological-amplitude` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-commute-with-filtered-colimits`, `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`
- **Wild inertia is the pro-p Sylow subgroup; the tame quotient is Hom(Γ ⊗ ℤ_(p)/Γ, μ_(p))** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field` (lemma)
  - prerequisites: `mathlib:ValuationRing`, `mathlib:HenselianLocalRing`, `mathlib:IsSepClosed`, `mathlib:IsPGroup`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`
- **Prime-to-p Galois cohomology is computed on the tame quotient** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`, `ArithmeticGaloisDuality:R02.2`, `ArithmeticGaloisDuality:R02.1`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- **The Gauss valuation ring V(T) of a valuation ring** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-valuation` (construction) — planet *Gauss valuation*
  - prerequisites: `mathlib:ValuationRing`, `mathlib:ValuationRing.valuation`, `mathlib:ValuationRing.ValueGroup`, `mathlib:RatFunc`, `mathlib:Polynomial.gaussNorm`, `mathlib:Polynomial.gaussNorm_mul`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`
  - API: `Valuation.gaussPoly` (constructor: |·|_G on K[T]: p ↦ max_i |coeff p i|.); `Valuation.gauss`; `Valuation.gauss_C` (simp: |a|_G = |a| for a ∈ K.); `Valuation.gauss_X` (simp: |T|_G = 1.); `Valuation.gaussPoly_mul` (other: Gauss's lemma: |fg|_G = |f|_G |g|_G.); `Valuation.gauss_valueGroup` (characterisation: The value group of |·|_G is the value group of |·|.); `ValuationRing.gaussRing`; `ValuationRing.gaussRing_eq_localization` (characterisation: V(T) = Localization.AtPrime (𝔪V[T]).); `ValuationRing.gaussRing_residueFieldEquiv` (equivalence: Residue field of V(T) ≃ κ(T).); `ValuationRing.gaussRing_inf_K` (compatibility: V(T) ∩ K = V and V -> V(T) is local.); `ValuationRing.gaussRingMv` (constructor: V(T_1, …, T_d), with the same characterisations.); `Valuation.gauss_eq_gaussNorm` (compatibility: Agreement with Polynomial.gaussNorm v 1 in the rank-one real case.)
  - unit tests: `Valuation.gauss_example_Zp` (computation: For V = ℤ_(p): |p + T|_G = 1, |pT^2 + p^2|_G = |p|; 1/(p + T) ∈ V(T) and (p + T)/p ∉ V(T).); `Valuation.gauss_trivial` (degenerate: For V = K a field (trivial valuation), |h|_G = 1 for every nonzero h ∈ K(T) and V(T) = K(T).); `Valuation.gauss_eq_gaussNorm_example` (compatibility: If |·| is a rank-one valuation realized as a nonarchimedean absolute value v: K -> ℝ_{≥0}, then for p ∈ K[T], |p|_G corresponds to Polynomial.gaussNorm v 1 p (mathlib:Polynomial.gaussNorm).); `Valuation.gaussRing_ne_localization_at_origin` (non-example: For V nontrivial with 0 ≠ π ∈ 𝔪, the local ring V[T]_{(𝔪, T)} at the origin of the special fibre is not a valuation ring (neither π | T nor T | π), so it is not V(T); the generic point of the special fibre is required.); `Valuation.gaussRing_residueField` (characterisation: The residue field of V(T) is κ(T) and V(T) ∩ K = V.)
- **Along a strictly henselized Gauss extension the tame quotients agree** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-extension-tame-inertia-comparison` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-valuation`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`
- **Cartesian change of valuation base: the base-change map of nearby cycles is an isomorphism for prime-to-p torsion** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuative-base-change-for-nearby-cycles` (theorem) — planet *Valuative base change for nearby cycles*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/morphism-of-valuation-quadruples`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-equivariant-transport`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/radicial-invariance-of-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-commute-with-filtered-colimits`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-extension-tame-inertia-comparison`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-valuation`, `ArithmeticGaloisDuality:R02.2`
- **From ℤ/n to noetherian coefficient rings annihilated by n** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/noetherian-coefficient-change-for-constructibility` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-commute-with-filtered-colimits`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SchemeAndStackFoundations:SF.2`
- **Constructibility of R^qΨ_L over a valuation base** — `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles` (theorem) — planet *Constructibility of nearby cycles*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/galois-action-on-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-equivariant-transport`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/radicial-invariance-of-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-locality-and-proper-pushforward`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/noetherian-coefficient-change-for-constructibility`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-valuation`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/gauss-extension-tame-inertia-comparison`, `SchemeAndStackFoundations:SF.2`

### H1:valuation-exports. Interfaces for analytic invariance and support

- **Surjective maps of valuation spectra** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change` (definition) — planet *Surjective map of valuation spectra*
  - prerequisites: `mathlib:ValuationRing`, `mathlib:PrimeSpectrum.comap`, `mathlib:PrimeSpectrum.comap_comp`, `mathlib:IsLocalHom`, `mathlib:IsLocalHom.of_comap_surjective`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`, `mathlib:Module.FaithfullyFlat.of_comap_surjective`, `mathlib:PrimeSpectrum.comap_surjective_of_faithfullyFlat`, `mathlib:Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, `mathlib:ValuationRing.iff_local_bezout_domain`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`
  - API: `Huber.IsSurjectiveValuationMap`; `Huber.isSurjectiveValuationMap_iff_injective_and_isLocalHom` (characterisation: For valuation rings A, B: IsSurjectiveValuationMap φ ↔ Function.Injective φ ∧ IsLocalHom φ.); `Huber.isSurjectiveValuationMap_iff_faithfullyFlat` (characterisation: For valuation rings A, B and φ making B an A-algebra: IsSurjectiveValuationMap φ ↔ Module.FaithfullyFlat A B.); `Huber.IsSurjectiveValuationMap.injective` (projection: IsSurjectiveValuationMap φ → Function.Injective φ (for A a domain: the zero ideal of A is a contracted prime).); `Huber.IsSurjectiveValuationMap.isLocalHom` (instance: IsSurjectiveValuationMap φ → IsLocalHom φ.); `Huber.IsSurjectiveValuationMap.id` (functoriality: IsSurjectiveValuationMap (RingHom.id A).); `Huber.IsSurjectiveValuationMap.comp` (functoriality: IsSurjectiveValuationMap φ → IsSurjectiveValuationMap ψ → IsSurjectiveValuationMap (ψ.comp φ) (from PrimeSpectrum.comap_comp).); `Huber.IsSurjectiveValuationMap.of_field` (example: Every ring homomorphism between fields is a surjective map of valuation spectra.); `Huber.IsSurjectiveValuationMap.comap_closedPoint` (simp: Spec(φ) sends the closed point to the closed point and the generic point to the generic point.); `Huber.IsSurjectiveValuationMap.comap_heightOnePrime` (relation: For microbial A, B and φ continuous (φ(p_A) ⊆ p_B) with IsSurjectiveValuationMap φ, φ^{-1}(p_B) = p_A.); `Huber.isSurjectiveValuationMap_iff_inter_eq` (characterisation: For valuation subrings A ⊆ K, B ⊆ L of fields K ⊆ L with A ⊆ B: the inclusion is a surjective map of valuation spectra iff B ∩ K = A.); `Huber.IsSurjectiveValuationMap.spa_surjective_iff` (compatibility: For a continuous extension C_3 ⊆ C_1 of algebraically closed nonarchimedean fields with open bounded valuation subrings C_3^+ ⊆ C_1^+: Spa(C_1, C_1^+) → Spa(C_3, C_3^+) is surjective iff IsSurjectiveValuationMap (C_3^+ → C_1^+).)
  - unit tests: `isSurjectiveValuationMap_test_rankOne` (computation: For C ⊆ C' complete algebraically closed nonarchimedean fields, the inclusion O_C → O_{C'} satisfies IsSurjectiveValuationMap (Spec O_{C'} = {0, m'} maps onto {0, m}).); `isSurjectiveValuationMap_test_rankTwoToRankOne` (non-example: For a rank-two open bounded valuation subring C^+ ⊊ O_C, the injective inclusion C^+ → O_C does not satisfy IsSurjectiveValuationMap: the closed point of Spec O_C maps to the height-one prime of C^+. A definition by injectivity alone fails this test.); `isSurjectiveValuationMap_test_quotient` (non-example: For a rank-two valuation ring A with height-one prime p, the local surjection A → A/p does not satisfy IsSurjectiveValuationMap: the generic point of Spec A is not in the image. A definition by locality alone fails this test.); `isSurjectiveValuationMap_test_field` (degenerate: Every ring homomorphism K → L of fields satisfies IsSurjectiveValuationMap (η = s).); `isSurjectiveValuationMap_test_faithfullyFlat` (compatibility: For the inclusion ℤ_(p) → ℤ_p of discrete valuation rings, IsSurjectiveValuationMap holds and agrees with Module.FaithfullyFlat ℤ_(p) ℤ_p.); `isSurjectiveValuationMap_test_spa` (characterisation: For a rank-two C^+ ⊊ O_C, Spa(C, O_C) → Spa(C, C^+) is not surjective (its image is the rank-one point), matching the failure of IsSurjectiveValuationMap for C^+ → O_C and the equality O_C ∩ C = O_C ≠ C^+.)
- **A valuation ring with algebraically closed fraction field is strictly henselian** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian` (lemma)
  - prerequisites: `mathlib:ValuationRing`, `mathlib:IsAlgClosed`, `mathlib:HenselianLocalRing`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`
- **The invariance map on nearby-cycle cohomology along a surjective valuation base change** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/invariance-comparison-map` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:DerivedCategory`, `mathlib:IsSepClosed`
  - API: `AdicSpace.ValuationBase.invarianceMap`; `AdicSpace.ValuationBase.invarianceMap_eq_comp_baseChange` (characterisation: inv_φ(F) = RΓ(X'_{s'}, bc_φ(F)) ∘ g_s^*.); `AdicSpace.ValuationBase.invarianceMap_id` (functoriality: For φ = id_A, inv_φ(F) is the identity.); `AdicSpace.ValuationBase.invarianceMap_comp` (functoriality: For surjective maps φ: A → B, ψ: B → C of such valuation rings, inv_{ψ∘φ}(F) = inv_ψ(F') ∘ inv_φ(F) (transitivity of bc of H1:valuation-nearby-cycles).); `AdicSpace.ValuationBase.invarianceMap_natural` (functoriality: inv_φ is a natural transformation of triangulated functors D^+((X_η)_et, Λ) → D^+(Λ-Mod); a distinguished triangle in F gives a map of long exact sequences.); `AdicSpace.ValuationBase.invarianceMap_restrict` (functoriality: For an étale S-morphism u: U → X, inv_φ for U and for X commute with restriction along u_s and u'_{s'}.); `AdicSpace.ValuationBase.invarianceMap_of_isField` (simp: For fields A = K, B = L, inv_φ(F) is pullback along X ⊗_K L → X.); `AdicSpace.ValuationBase.invarianceMap_proper` (compatibility: For f proper, under the isomorphisms RΓ(X_η, F) ≅ RΓ(X_s, RΨF) and RΓ(X'_{η'}, F') ≅ RΓ(X'_{s'}, RΨF') of proper-nearby-cycle-cohomology, inv_φ(F) is the pullback RΓ(X_η, F) → RΓ(X_η ⊗_K L, F').); `AdicSpace.ValuationBase.invarianceMap_tube` (compatibility: For microbial A, B and continuous φ, inv_φ(F) corresponds under the isomorphisms of H1:formal-adic-comparison 3.5.16 to pullback of cohomology of the tubes over the closed points (proved in formal-adic-compatibility).)
  - unit tests: `invarianceMap_test_point` (computation: For X = S = Spec A and F = Λ, H^0(s, RΨΛ) = Λ, H^n(s, RΨΛ) = 0 for n > 0, and inv_φ^0 is the identity of Λ.); `invarianceMap_test_field` (degenerate: For fields A = K ⊆ B = L (η = s), inv_φ(F) is the pullback RΓ(X, F) → RΓ(X ⊗_K L, F).); `invarianceMap_test_nonlocal` (non-example: For a rank-two C^+ ⊊ O_C and the inclusion C^+ → O_C, the closed point of Spec O_C maps to the height-one prime of C^+, so (X ⊗ O_C, Spec O_C, η, s') → (X, Spec C^+, η, s) is not a morphism of quadruples and inv is not defined.); `invarianceMap_test_trait` (compatibility: For a strictly henselian discrete valuation ring R with fraction field k and Ā the integral closure of R in an algebraic closure k̄ (a rank-one valuation ring with algebraically closed fraction field), RΨ over Ā of X ⊗_R Ā is the SGA 7 XIII complex RΨ_η(F) of LefschetzPencilsAndVanishingCycles:LPV.0 on the geometric special fibre, and for a surjective map Ā → Ā' of such rings inv is RΓ of the change-of-trait isomorphism (LPV.0, XIII 2.1.7.5).)
- **Reduction of finite type to finite presentation over a valuation ring with noetherian spectrum** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/finite-rank-finite-type-reduction` (lemma)
  - prerequisites: `mathlib:ValuationRing`, `mathlib:Algebra.FinitePresentation`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `SchemeAndStackFoundations:SF.2`
  - unit tests: `finiteTypeReduction_test_nonNoetherianSpec` (non-example: For a valuation ring of infinite rank whose primes contain an infinite strictly increasing chain p_1 ⊊ p_2 ⊊ …, Spec A is not noetherian (the closed sets V(p_n) strictly decrease), and the lemma does not apply.)
- **The support triangle along the special locus and its comparison with nearby cycles** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/special-locus-support-triangle` (theorem) — planet *Support triangle along the special locus*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `SchemeAndStackFoundations:SF.2`, `mathlib:ValuationRing`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`
  - unit tests: `supportTriangle_test_rankOne` (computation: For A = O_C, X = S, E = Λ: the triangle is 0 → Λ → Λ → with identity middle map; H^n_s(Spec O_C, Λ) = 0 for all n.); `supportTriangle_test_rankTwo` (non-example: For A = C^+ of rank two, S_0 = {s}, X = S, E = j_{U*}ι_*Λ with ι the inclusion of the point p_A of U_S: (i^*Rj_{U*}j_U^*E)_s = Λ but RΨ_S(j^*E) = 0, so c_U is not an isomorphism.); `supportTriangle_test_microbial` (characterisation: For A = C^+ of rank two and S_0 = V(p_A): c_U is an isomorphism for every E.)
- **Nearby-cycle cohomology of a proper scheme over a strictly henselian valuation ring** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology` (theorem) — planet *Proper nearby-cycle comparison*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/special-locus-support-triangle`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.IsProper`
  - unit tests: `properNearbyCycles_test_nonproper` (non-example: For microbial A the generic point is open; X = Spec K ⊆ S is an open subscheme with X_s = ∅, so RΓ(X_s, RΨΛ) = 0 while RΓ(X_η, Λ) = Λ: properness cannot be dropped in (b).); `properNearbyCycles_test_pTorsion` (compatibility: For A of residue characteristic p and Λ = Z/p, (b) holds for X = P^1: H^n(P^1_k, RΨ Z/p) ≅ H^n(P^1_C, Z/p); no prime-to-p hypothesis is used.)
- **Cohomological invariance of nearby cycles under a surjective map of valuation spectra** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change` (theorem) — planet *Invariance under surjective valuation base change*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/invariance-comparison-map`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/finite-rank-finite-type-reduction`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuative-base-change-for-nearby-cycles`, `SchemeAndStackFoundations:SF.2`, `mathlib:IsSepClosed`, `mathlib:ValuationRing`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.IsProper`
  - unit tests: `nearbyCycles_invariance_test_nonsurjective` (non-example: For a rank-two C^+ ⊊ O_C, the inclusion C^+ → O_C is not a surjective map of valuation spectra. With X = S = Spec C^+ and G = j_!Λ the extension by zero from the open subscheme Spec O_C = S ∖ {s}: H^0(S, G) = 0 (S is strictly local and G_s = 0), while the pullback of G to Spec O_C is Λ with H^0 = Λ. No invariance is asserted for this map.); `nearbyCycles_invariance_test_artinSchreier` (non-example: For algebraically closed fields K ⊊ L of characteristic p (valuation rings of rank 0, η = s), X = A^1_K and Λ = Z/p: by the Artin–Schreier sequence H^1(A^1_K, Z/p) ≅ K[x]/{g^p − g}, and the map to H^1(A^1_L, Z/p) ≅ L[x]/{g^p − g} misses the class of λx for λ ∈ L ∖ K. Here m = p is not invertible, so (i)–(ii) are not asserted, and (iii) does not apply as A^1 is not proper.); `nearbyCycles_invariance_test_properPTorsion` (compatibility: For algebraically closed fields K ⊆ L of characteristic p and X = P^1, (iii) gives H^n(P^1_K, Z/p) ≅ H^n(P^1_L, Z/p) for all n although m = p (Stacks Tag 0DDG).)
- **Compactly supported cohomology of the generic fibre through nearby cycles of a compactification** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/compact-support-nearby-cycle-cohomology` (theorem) — planet *Compactly supported nearby-cycle comparison*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`
  - unit tests: `compactSupportNearbyCycles_test_boundary` (non-example: For A = O_C and X = Spec C ⊆ X̄ = Spec O_C: RΓ_c(X_s, RΨ_X Λ) = 0 but RΓ_c(X_η, Λ) = Λ; compact support on the special fibre is not compact support on the generic fibre when f is not proper.); `compactSupportNearbyCycles_test_proper` (degenerate: For f proper and X̄ = X, the map RΓ_c(X_s, RΨ_X F) → RΓ_c(X_η, F) equals the isomorphism of proper-nearby-cycle-cohomology (b).)
- **Constructibility, amplitude and finiteness of nearby-cycle cohomology over a valuation ring** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-cohomology-finiteness` (theorem) — planet *Finiteness of nearby-cycle cohomology*
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/proper-nearby-cycle-cohomology`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/compact-support-nearby-cycle-cohomology`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.IsProper`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-cohomological-amplitude`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/milnor-tube-stalk-formula`
  - unit tests: `nearbyCyclesFiniteness_test_artinSchreierNonproper` (non-example: For an algebraically closed field K of characteristic p (A = K, η = s), H^1(A^1_K, Z/p) ≅ K[x]/{g^p − g} is infinite: ordinary cohomology of a non-proper L with p-torsion coefficients is not finite, and the node claims finiteness only for proper L and for compact supports, with m invertible for (i).); `nearbyCyclesFiniteness_test_amplitude` (computation: For X = A^N_A and F = Λ (smooth, so RΨΛ = Λ by local acyclicity), R^nΨΛ = 0 for n > 0, within the bound [0, 2N].)
- **Compatibility of the valuation exports with the formal/adic comparison maps** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/formal-adic-compatibility` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/invariance-comparison-map`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/special-locus-support-triangle`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuation-base-quadruple`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-base-change-map`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site`
- **Invariance of tube cohomology under surjective extension of algebraically closed valued fields (export to H2)** — `ClassicalAdicEtaleCohomology:H1:valuation-exports/tube-cohomology-invariance-export` (application)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-exports/algebraically-closed-fraction-field-strictly-henselian`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/formal-adic-compatibility`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`

### H1. Formal models, specialization, and nearby-cycle comparison

- **H1 re-export of the henselian comparison theorems of H1:henselian (Hub96 §§3.1–3.2)** — `ClassicalAdicEtaleCohomology:H1/henselian-substage-export` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `ClassicalAdicEtaleCohomology:H1:henselian/special-and-pro-special-subsets`, `ClassicalAdicEtaleCohomology:H1:henselian/henselization-along-pro-special-subset`, `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian`, `ClassicalAdicEtaleCohomology:H0`, `mathlib:HenselianRing`
- **H1 re-export of the formal/adic specialization comparisons of H1:formal-adic-comparison, with their all-torsion scope** — `ClassicalAdicEtaleCohomology:H1/formal-adic-substage-export` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/etale-site-of-type-S-formal-scheme`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/constructibility-and-stalks-of-lambda-pullback`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/stalks-of-higher-direct-images-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/henselian-tube-comparison-3-6-1`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17`, `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/generic-fibre-functor-d`
- **On a strictly henselian trait, Huber's complex of vanishing cycles (3.5.17), RΨ_L of H1:valuation-nearby-cycles and LPV.0's RΨ_η are one object with one inertia action** — `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` (lemma)
  - prerequisites: `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuative-base-change-for-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point`, `SchemeAndStackFoundations:SF.2`, `mathlib:IsDiscreteValuationRing`, `mathlib:HenselianLocalRing`, `mathlib:IsSepClosed`, `mathlib:IsSepClosure`, `mathlib:IsAlgClosure`, `mathlib:integralClosure`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.UniversallyInjective`, `mathlib:AlgebraicGeometry.Surjective`
  - unit tests: `traitNearbyCycles_test_point`; `traitNearbyCycles_test_eta_eq_s`; `traitNearbyCycles_test_smooth_constant`; `traitNearbyCycles_nonexample_rPhi`
- **H1 re-export of the valuation-base nearby cycles of H1:valuation-nearby-cycles, with the prime-to-residue scope of 4.2.4–4.2.5** — `ClassicalAdicEtaleCohomology:H1/valuation-nearby-cycles-substage-export` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuative-base-change-for-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point`, `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `mathlib:ValuationRing`
- **H1 re-export of the valuation-base support, invariance and constructibility interfaces of H1:valuation-exports** — `ClassicalAdicEtaleCohomology:H1/valuation-exports-substage-export` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/special-locus-support-triangle`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-cohomology-finiteness`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/formal-adic-compatibility`, `ClassicalAdicEtaleCohomology:H1/formal-adic-substage-export`, `ClassicalAdicEtaleCohomology:H1/valuation-nearby-cycles-substage-export`
- **The comparison isomorphism of Hub96 3.5.17 commutes with the inertia action** — `ClassicalAdicEtaleCohomology:H1/formal-nearby-cycle-comparison-inertia-equivariance` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/generic-fibre-fibre-products`, `mathlib:IsAlgClosure`, `mathlib:HenselianLocalRing`
- **Hub96 3.5.17 as an inertia-equivariant identification of the analytic generic-fibre cohomology with LPV.0's trait nearby cycles** — `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `ClassicalAdicEtaleCohomology:H1/formal-nearby-cycle-comparison-inertia-equivariance`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/vanishing-cycles-comparison-3-5-17`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
  - unit tests: `formalNearbyCyclesComparison_test_point`; `formalNearbyCyclesComparison_test_closed_disc`; `formalNearbyCyclesComparison_test_proper`; `formalNearbyCyclesComparison_nonexample_rPhi`
- **On strictly henselian traits the valuation-base base-change map of H1:valuation-nearby-cycles is LPV.0's change-of-trait morphism** — `ClassicalAdicEtaleCohomology:H1/change-of-trait-compatibility` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/valuative-base-change-for-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/constructibility-of-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/comparison-with-geometric-generic-point`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `mathlib:IsDiscreteValuationRing`
  - unit tests: `changeOfTrait_test_tame_extension`; `changeOfTrait_test_identity`; `changeOfTrait_test_finite_all_torsion`
- **RΨ versus RΦ: Huber's 'complex of vanishing cycles' is the nearby-cycle complex, and RΦ is the cone of the analytic specialization map** — `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison`, `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`
  - unit tests: `analyticSpecializationTriangle_test_smooth_disc`; `analyticSpecializationTriangle_test_nodal_annulus`; `analyticSpecializationTriangle_test_point`; `analyticSpecializationTriangle_nonexample_rPhi_ne_rPsi`
- **The inertia action on the analytic generic-fibre cohomology through LPV.0's variation** — `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles`, `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.1`
  - unit tests: `analyticVariation_test_smooth_trivial`; `analyticVariation_test_cocycle`

### H2. Invariance under extension of an algebraically closed valued field

- **Geometric field pairs, their extensions, and the surjectivity condition** — `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension` (definition)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:ValuationSubring`, `mathlib:ValuationSubring.comap`, `mathlib:ValuationSubring.mem_comap`, `mathlib:IsAlgClosed`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.GeometricFieldPair`; `AdicSpace.GeometricFieldPair.toPair` (coercion: The Tau Ceti `Huber.Pair` (C, C⁺).); `AdicSpace.GeometricFieldPair.spa` (data: The affinoid adic space Spa(C, C⁺) (sheafy: C is a field), with its closed point s (valuation ring C⁺) and generic point η (valuation ring O_C).); `AdicSpace.GeometricFieldPair.Hom` (structure: Extensions ι: (C, C⁺) → (C', C'⁺): continuous ring homomorphisms with ι(C⁺) ⊆ C'⁺ (a `Huber.Pair.Hom`).); `AdicSpace.GeometricFieldPair.Hom.id` (functoriality: The identity extension; `Hom.comp` composes, with `spaMap_id` and `spaMap_comp`.); `AdicSpace.GeometricFieldPair.Hom.spaMap` (functoriality: g_ι: Spa(C', C'⁺) → Spa(C, C⁺), with (g_ι v')'s valuation ring = ι⁻¹(V').); `AdicSpace.GeometricFieldPair.Hom.comap_powerBounded` (relation: ι⁻¹(O_{C'}) = O_C and C⁺ ⊆ ι⁻¹(C'⁺).); `AdicSpace.GeometricFieldPair.Hom.IsSurjective` (other: The Prop that g_ι is surjective on points.); `AdicSpace.GeometricFieldPair.Hom.isSurjective_iff_comap_eq` (characterisation: ι is surjective iff ι⁻¹(C'⁺) = C⁺ iff g_ι(s') = s (ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions).); `AdicSpace.GeometricFieldPair.Hom.range_spaMap` (characterisation: The image of g_ι is the set of generalisations of g_ι(s'), i.e. the points with valuation ring containing ι⁻¹(C'⁺).); `AdicSpace.GeometricFieldPair.Hom.isSurjective_of_rankOne` (example: If C⁺ = O_C every extension is surjective.); `AdicSpace.GeometricFieldPair.Hom.IsSurjective.comp` (functoriality: Composites of surjective extensions are surjective.); `AdicSpace.GeometricFieldPair.ofEqPlus` (constructor: For a valuation ring V with C⁺ ⊆ V ⊆ O_C, the pair (C, V) and the extension (C, C⁺) → (C, V) given by the identity; its image is the set of generalisations of the point V (used for Spa(C, O_C) ⊆ Spa(C, C⁺)).); `AdicSpace.GeometricFieldPair.Hom.toGeometricPoint` (compatibility: g_ι as an `AdicSpace.GeometricPoint` of Spa(C, C⁺) (AdicEtaleGeometry:A1/etale-site-and-geometric-points), with support g_ι(s').)
  - unit tests: `GeometricFieldPair.Hom.isSurjective_id`; `GeometricFieldPair.Hom.not_isSurjective_toRankOne`; `GeometricFieldPair.Hom.isSurjective_of_plus_eq_powerBounded`; `GeometricFieldPair.Hom.toGeometricPoint_support`; `GeometricFieldPair.Hom.isSurjective_comp`
- **The image of Spa(C', C'⁺) → Spa(C, C⁺) and the criterion ι⁻¹(C'⁺) = C⁺ for surjectivity** — `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change`, `mathlib:ValuationSubring.linearOrderOverring`, `mathlib:ValuationSubring.primeSpectrumEquiv`, `mathlib:ValuationSubring.comap`, `mathlib:ValuationSubring.mem_comap`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap`
- **Étale cohomology over Spa(C, C⁺) is the stalk at the closed point; the comparison map is a base-change map** — `ClassicalAdicEtaleCohomology:H2/cohomology-over-geometric-field-pairs` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-morphism`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.GrothendieckTopology.Point`
- **Invariance of prime-to-p étale cohomology with supports under surjective algebraically closed base extension (Hub96 4.1.1(c) in the form of ECD Lemma 16.3)** — `ClassicalAdicEtaleCohomology:H2/invariance-for-affinoids-of-finite-type` (theorem) — planet *Invariance under algebraically closed base change*
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions`, `ClassicalAdicEtaleCohomology:H2/cohomology-over-geometric-field-pairs`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/tube-cohomology-invariance-export`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/nearby-cycle-invariance-under-surjective-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/surjective-valuation-base-change`, `ClassicalAdicEtaleCohomology:H1:valuation-exports/formal-adic-compatibility`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11`, `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R1/tft-plus-ring-power-bounded`, `tauceti:TauCeti.Huber.IsTopologicallyFiniteType`, `mathlib:ValuationSubring.primeSpectrumEquiv`
- **Approximation of an affinoid perfectoid space over Spa(C, C⁺) by affinoids of topologically finite type** — `ClassicalAdicEtaleCohomology:H2/finite-type-approximation-of-perfectoid-affinoids` (construction) — planet *Approximation by affinoids of finite type*
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `PerfectoidSpaces:P2/affinoid-perfectoid-space`, `PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids`, `PerfectoidSpaces:P2/p-finite-acyclicity-from-tate`, `PerfectoidSpaces:P5/spa-of-filtered-colimit-of-tate-pairs`, `PerfectoidSpaces:P5/quasicompact-opens-in-limits-of-spectral-spaces`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P5/limit-restriction-to-rational-subsets`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`, `PerfectoidSpaces:P7/residue-field-tilde-limit`, `PerfectoidSpaces:P7/tilde-limit-from-completed-colimit`, `PerfectoidSpaces:P7/tilde-limit-implies-residue-field-tilde-limit`, `PerfectoidSpaces:P7/perfection-tilde-limit`, `PerfectoidSpaces:P7/etale-topos-invariance-under-inseparable-towers`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `AdicSpacesPartII:R0/reduced-affinoid-supremum-norm`, `AdicSpacesPartII:R0/affinoid-power-bounded-integral`, `AdicSpacesPartII:R0/noetherian-type-stably-sheafy`, `ClassicalAdicEtaleCohomology:H0/huber-tilde-limit`, `tauceti:TauCeti.Huber.IsStronglyNoetherian`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`
  - API: `AdicSpace.FiniteTypeApprox`; `AdicSpace.FiniteTypeApprox.isTopologicallyFiniteType` (instance: C → S_I is topologically of finite type (Tau Ceti `Huber.IsTopologicallyFiniteType`) and S_I is reduced and strongly noetherian.); `AdicSpace.FiniteTypeApprox.space` (data: Y_I = Spa(S_I, S_I⁺) as an adic space over S.); `AdicSpace.FiniteTypeApprox.map` (functoriality: Transition morphisms Y_J → Y_I for I ⊆ J, with map_id and map_comp.); `AdicSpace.FiniteTypeApprox.proj` (projection: φ_I: X → Y_I over S, compatible with the transition maps.); `AdicSpace.FiniteTypeApprox.iUnion_eq` (characterisation: ⋃_I S_I = R and ⋃_I S_I⁺ = R⁺ inside R.); `AdicSpace.FiniteTypeApprox.homeomorph` (equivalence: |X| ≃ₜ lim_I |Y_I|.); `AdicSpace.FiniteTypeApprox.exists_isQuasiCompactOpen_preimage` (other: Every quasicompact open (resp. rational) U ⊆ X equals φ_I⁻¹(U_I) for some I and quasicompact open (resp. rational) U_I ⊆ Y_I; equal preimages are equal at a finite level.); `AdicSpace.FiniteTypeApprox.isTildeLimit` (compatibility: X ~ lim_I Y_I (`PerfectoidSpace.IsTildeLimit`) and X ~′ lim_I Y_I (`PerfectoidSpace.IsResidueFieldTildeLimit`).); `AdicSpace.FiniteTypeApprox.perf` (constructor: In characteristic p, Y_I^perf, with |Y_I^perf| ≃ₜ |Y_I|, Y_I^perf,ét ≃ Y_I,ét and X ≅ lim_I Y_I^perf in perfectoid spaces.); `AdicSpace.FiniteTypeApprox.restrict` (constructor: Restriction of the system to compatible rational subsets W_I ⊇ φ_I(X), keeping homeomorph and isTildeLimit.); `AdicSpace.FiniteTypeApprox.plus_eq_powerBounded` (relation: If C⁺ = O_C then S_I⁺ = S_I°.)
  - unit tests: `FiniteTypeApprox.test_point`; `FiniteTypeApprox.test_disc`; `FiniteTypeApprox.not_isPerfectoid`; `FiniteTypeApprox.plus_eq_powerBounded_of_rankOne`; `FiniteTypeApprox.homeomorph_test`
- **Base change of the finite-type approximation along an extension of geometric field pairs** — `ClassicalAdicEtaleCohomology:H2/field-extension-of-finite-type-approximations` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/finite-type-approximation-of-perfectoid-affinoids`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property`, `PerfectoidSpaces:P7/tilde-limit-from-completed-colimit`, `PerfectoidSpaces:P7/tilde-limit-implies-residue-field-tilde-limit`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`, `AdicEtaleGeometry:A0/fibre-product-associativity-and-unit`
- **Invariance of prime-to-p étale cohomology with supports of affinoid perfectoid spaces under surjective algebraically closed base extension** — `ClassicalAdicEtaleCohomology:H2/invariance-for-perfectoid-affinoids` (theorem) — planet *Invariance for perfectoid affinoids*
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/finite-type-approximation-of-perfectoid-affinoids`, `ClassicalAdicEtaleCohomology:H2/field-extension-of-finite-type-approximations`, `ClassicalAdicEtaleCohomology:H2/invariance-for-affinoids-of-finite-type`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison`, `PerfectoidSpaces:P3/etale-site-of-perfectoid-space`, `PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`
- **Cohomology of extension by zero on X₁ ×_{X₃} X₂ for spectra of geometric field pairs (ECD Lemma 16.3)** — `ClassicalAdicEtaleCohomology:H2/extension-by-zero-over-geometric-field-pairs` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/invariance-for-perfectoid-affinoids`, `ClassicalAdicEtaleCohomology:H2/cohomology-over-geometric-field-pairs`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property`
- **Connectedness over Spa(C, C⁺) is detected over the generic point Spa(C, O_C)** — `ClassicalAdicEtaleCohomology:H2/connectedness-via-maximal-generalisations` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `mathlib:IsClopen`, `mathlib:ConnectedSpace`, `mathlib:SpectralSpace`
- **Connectedness of adic spaces of finite type over an algebraically closed field is invariant under complete field extension** — `ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-finite-type-spaces` (theorem)
  - prerequisites: `AdicSpacesPartII:R1/rigid-adic-quasi-separated-equivalence`, `AdicSpacesPartII:R1/rigid-adic-topos-equivalence`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/affinoid-residue-fields-finite`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:R1/tft-plus-ring-power-bounded`, `mathlib:IsClopen`, `mathlib:ConnectedSpace`, `mathlib:IsAlgClosed`
- **Connected affinoid perfectoid spaces over Spa(C, C⁺) stay connected after algebraically closed base extension (ECD Lemma 14.6)** — `ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-perfectoid-base-change` (theorem) — planet *Geometric connectedness under base change*
  - prerequisites: `ClassicalAdicEtaleCohomology:H2/connectedness-via-maximal-generalisations`, `ClassicalAdicEtaleCohomology:H2/finite-type-approximation-of-perfectoid-affinoids`, `ClassicalAdicEtaleCohomology:H2/field-extension-of-finite-type-approximations`, `ClassicalAdicEtaleCohomology:H2/geometric-connectedness-of-finite-type-spaces`, `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions`, `ClassicalAdicEtaleCohomology:H2/geometric-field-pair-extension`, `AdicEtaleGeometry:A1/etale-locally-finitely-many-components`, `AdicEtaleGeometry:A0/fibre-product-associativity-and-unit`, `PerfectoidSpaces:P5/quasicompact-opens-in-limits-of-spectral-spaces`, `PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids`, `AdicSpacesPartII:R0/fibre-product-points`, `mathlib:IsClopen`, `mathlib:ConnectedSpace`

### H3. Proper support, traces and Poincaré duality for curves

- **Taut locally spectral spaces and taut morphisms** — `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms` (definition)
  - prerequisites: `DiamondsAndVStacks:D0/locally-spectral-space`, `AdicSpacesPartII:R0/partially-proper-closure-quasi-compact`, `mathlib:QuasiSeparatedSpace`, `mathlib:IsCompact`, `mathlib:closure`, `mathlib:IsSpectralMap`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.IsTaut`; `AdicSpace.IsTaut.isCompact_closure`; `AdicSpace.IsTaut.of_compactSpace`; `AdicSpace.IsTaut.of_locallyFinite`; `AdicSpace.IsTaut.isOpen_subset`; `AdicSpace.IsTautMap`; `AdicSpace.IsTautMap.of_qcqs`; `AdicSpace.IsTautMap.comp`; `AdicSpace.IsTaut.of_isTautMap`; `AdicSpace.IsTaut.of_partiallyProper`
  - unit tests: `isTaut_closedDisc`; `isTaut_affineLine`; `not_isTaut_doubledDisc`; `isTaut_iff_isCompact_closure_isCompact`; `isTautMap_of_qcqs`
- **Compactifiable morphisms: the classical eligible class for proper support** — `ClassicalAdicEtaleCohomology:H3/compactifiable-morphism` (definition)
  - prerequisites: `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R0/separated-morphism`, `AdicSpacesPartII:R0/plus-weakly-finite-type`, `AdicSpacesPartII:R0/finite-type-morphism-classes`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`, `AdicSpacesPartII:R0/base-change-stability`, `AdicSpacesPartII:R0/fibre-products-existence`, `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`
  - API: `AdicSpace.IsCompactifiable`; `AdicSpace.IsCompactifiable.comp`; `AdicSpace.IsCompactifiable.of_isProper`; `AdicSpace.IsCompactifiable.of_isOpenImmersion`; `AdicSpace.IsCompactifiable.of_etale`; `AdicSpace.IsCompactifiable.baseChange`; `AdicSpace.IsCompactifiable.restrict`; `AdicSpace.IsCompactifiable.locallyOfPlusWeaklyFiniteType`
  - unit tests: `isCompactifiable_relBall`; `isCompactifiable_openDisc`; `not_isCompactifiable_doubledDisc`; `isCompactifiable_of_isProper`; `isCompactifiable_id`
- **Pseudo-adic support spaces and their étale topoi** — `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space` (definition) — planet *Pseudo-adic support space*
  - prerequisites: `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-enough-points`, `DiamondsAndVStacks:D0/pro-constructible-subsets`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:R4/etale-site-functoriality`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `mathlib:CategoryTheory.GrothendieckTopology.Point`
  - API: `AdicSpace.PseudoAdic`; `AdicSpace.PseudoAdic.site`; `AdicSpace.PseudoAdic.restrict`; `AdicSpace.PseudoAdic.pushforward`; `AdicSpace.PseudoAdic.ofClosed`; `AdicSpace.PseudoAdic.ofOpen`; `AdicSpace.PseudoAdic.stalk`; `AdicSpace.PseudoAdic.recollement`; `AdicSpace.PseudoAdic.comap`; `AdicSpace.PseudoAdic.closedFibre`
  - unit tests: `pseudoAdic_univ`; `pseudoAdic_closedPoint`; `boundaryPoint_not_isOpen`; `pseudoAdic_recollement`; `pseudoAdic_open`
- **Huber's universal compactification of a compactifiable morphism** — `ClassicalAdicEtaleCohomology:H3/universal-compactification` (construction) — planet *Universal compactification*
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/compactifiable-morphism`, `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space`, `AdicSpacesPartII:R0/partially-proper-morphism`, `AdicSpacesPartII:R0/separated-proper-partially-proper`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.compactification`; `AdicSpace.compactification.ι`; `AdicSpace.compactification.proj`; `AdicSpace.compactification.isPartiallyProper`; `AdicSpace.compactification.lift`; `AdicSpace.compactification.lift_comp_ι`; `AdicSpace.compactification.hom_ext`; `AdicSpace.compactification.affinoid`; `AdicSpace.compactification.rankOne_points`; `AdicSpace.compactification.baseChange`; `AdicSpace.compactification.map`
  - unit tests: `compactification_closedDisc`; `compactification_of_isProper`; `compactification_openDisc`; `compactification_not_smooth`; `compactification_lift_comp`
- **For quasi-compact f the compactification is a quasi-compact open immersion followed by a proper map** — `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `AdicSpacesPartII:R0/proper-iff-partially-proper-quasi-compact`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicEtaleGeometry:A2/dimension-of-adic-spaces`, `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres`, `AdicSpacesPartII:R0/plus-weakly-finite-type`
- **Sections with proper support: f_! for partially proper f** — `ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek` (construction)
  - prerequisites: `AdicSpacesPartII:R0/partially-proper-morphism`, `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`, `ClassicalAdicEtaleCohomology:H3/compactifiable-morphism`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/etale-sheaves-of-modules`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`
  - API: `AdicSpace.properSupportSections`; `AdicSpace.properSupportSections.le_pushforward`; `AdicSpace.properSupportSections.eq_of_isProper`; `AdicSpace.properSupportSections.colim`; `AdicSpace.properSupportSections.leftExact`; `AdicSpace.properSupportSections.preservesFilteredColimits`; `AdicSpace.properSupportSections.stalk`; `AdicSpace.properSupportSections.comp`; `AdicSpace.RProperSupportSections`
  - unit tests: `partiallyProperLowerShriek_openDisc`; `partiallyProperLowerShriek_eq_pushforward_of_isProper`; `partiallyProperLowerShriek_id`; `partiallyProperLowerShriek_ne_pushforward`; `partiallyProperLowerShriek_colim`
- **Huber's proper-support direct image R⁺f_!** — `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image` (construction) — planet *Proper-support direct image*
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/compactifiable-morphism`, `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek`, `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `mathlib:DerivedCategory`
  - API: `AdicSpace.lowerShriek`; `AdicSpace.lowerShriek_def`; `AdicSpace.lowerShriek_of_isCompact`; `AdicSpace.lowerShriekToPushforward`; `AdicSpace.lowerShriekToPushforward_isIso_of_isProper`; `AdicSpace.compactCohomology`; `AdicSpace.lowerShriek_shift`; `AdicSpace.lowerShriekUnbounded`; `AdicSpace.lowerShriek.map_comp`
  - unit tests: `lowerShriek_relBall`; `lowerShriek_eq_pushforward_of_isProper`; `lowerShriek_openImmersion`; `lowerShriek_ne_pushforward_closedDisc`; `lowerShriek_ne_berkovich`
- **Henselian comparison: proper schemes over C⁺ and over C⁺/ϖ** — `ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H1:henselian/pro-special-comparison-theorem-3-2-1`, `ClassicalAdicEtaleCohomology:H1:henselian/complete-f-adic-ring-is-henselian`, `SchemeAndStackFoundations:SF.2`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `mathlib:HenselianRing`, `mathlib:ValuationRing`
- **Formal-model transfer: compactly supported cohomology of tubes over Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/formal-model-transfer` (comparison)
  - prerequisites: `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/pairs-and-pseudo-adic-supports`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/specialization-morphism-of-sites-lambda`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/restriction-and-extension-by-zero-3-5-11`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `SchemeAndStackFoundations:SF.2`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change`
- **Proper base change to the pseudo-adic closed fibre over Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/valuation-ring-base-3-5-16`, `SchemeAndStackFoundations:SF.2`
- **Proper base change for extension by zero: j_!Rg_* ≅ Rf_*j'_!** — `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero` (theorem) — planet *Proper base change*
  - prerequisites: `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`
- **Independence of R⁺f_! from the chosen compactification** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero`, `AdicSpacesPartII:R0/proper-of-comp-separated`, `AdicSpacesPartII:R0/separated-morphism`, `AdicSpacesPartII:R0/separated-proper-partially-proper`, `AdicSpacesPartII:R0/proper-comp`
- **R⁺f_! is the colimit over quasi-compact opens** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`
- **Composition: R⁺(g ∘ f)_! ≅ R⁺g_! ∘ R⁺f_!** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek`, `AdicSpacesPartII:R0/proper-comp`
- **R⁺f_! for proper, partially proper and étale morphisms** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/universal-compactification`, `ClassicalAdicEtaleCohomology:H3/partially-proper-lower-shriek`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicSpacesPartII:R0/finite-morphism`
- **Proper base change for Rf_* along arbitrary morphisms** — `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change` (theorem)
  - prerequisites: `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/strict-localisation-analytic`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing`, `ClassicalAdicEtaleCohomology:H2`, `AdicSpacesPartII:R0/fibre-products-existence`
- **Base change for the proper-support direct image** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `AdicSpacesPartII:R0/proper-base-change`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicSpacesPartII:R0/fibre-products-existence`
- **Localisation triangle for an open subspace and its pseudo-adic complement** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases`
- **Smooth adic curves over a locally noetherian base** — `ClassicalAdicEtaleCohomology:H3/smooth-adic-curve` (definition)
  - prerequisites: `AdicSpacesPartII:R0/smooth-morphism`, `AdicSpacesPartII:R0/separated-morphism`, `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`, `ClassicalAdicEtaleCohomology:H3/compactifiable-morphism`, `AdicEtaleGeometry:A2/dimension-of-adic-spaces`, `AdicEtaleGeometry:A2/smooth-pure-relative-dimension`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R0/finite-type-morphism-classes`, `AdicSpacesPartII:R0/etale-smooth-composition`
  - API: `AdicSpace.IsSmoothCurve`; `AdicSpace.IsSmoothCurve.isCompactifiable`; `AdicSpace.IsSmoothCurve.of_etale`; `AdicSpace.IsSmoothCurve.restrict`; `AdicSpace.IsSmoothCurve.baseChange`; `AdicSpace.IsSmoothCurve.relBall`; `AdicSpace.IsSmoothCurve.projectiveLine`; `AdicSpace.IsSmoothCurve.genericFibre`; `AdicSpace.IsSmoothCurve.relDim_eq_one`
  - unit tests: `isSmoothCurve_relBall`; `isSmoothCurve_projectiveLine`; `not_isSmoothCurve_compactification`; `not_isSmoothCurve_etale`; `isSmoothCurve_genericFibre`
- **Compactly supported cohomology of the relative ball over Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support` (theorem)
  - prerequisites: `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/smooth-adic-curve`
- **Finite cohomological dimension of R⁺f_! (Hub96 Proposition 5.5.8)** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `ClassicalAdicEtaleCohomology:H3/compactification-proper-factorisation`, `ClassicalAdicEtaleCohomology:H3/proper-closed-fibre-vanishing`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `AdicEtaleGeometry:A2/dimension-of-adic-spaces`, `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres`, `AdicEtaleGeometry:A2/weakly-finite-type-finite-dimension`
- **Rf_! commutes with direct sums and filtered colimits** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`
- **Projection formula for the proper-support direct image** — `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/proper-base-change-extension-by-zero`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0/tate-twists`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`
- **The trace of a flat, separated, locally quasi-finite morphism on étale sheaves** — `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace` (construction)
  - prerequisites: `AdicSpacesPartII:R0/flat-morphism`, `AdicSpacesPartII:R0/quasi-finite-morphism`, `AdicSpacesPartII:R0/quasi-finite-and-finiteness-criteria`, `AdicSpacesPartII:R0/separated-morphism`, `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `AdicSpacesPartII:R3/finite-locally-free-morphism`, `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicEtaleGeometry:A1/etale-enough-points`
  - API: `AdicSpace.quasiFiniteTrace`; `AdicSpace.quasiFiniteTrace_naturality`; `AdicSpace.quasiFiniteTrace_baseChange`; `AdicSpace.quasiFiniteTrace_comp`; `AdicSpace.quasiFiniteTrace_unit_eq_mul`; `AdicSpace.quasiFiniteTrace_etale`; `AdicSpace.quasiFiniteTrace_stalk`; `AdicSpace.quasiFiniteTrace_unique`; `AdicSpace.quasiFiniteTrace_compactCohomology`
  - unit tests: `quasiFiniteTrace_etale`; `quasiFiniteTrace_degree`; `quasiFiniteTrace_ramified`; `quasiFiniteTrace_comp`; `quasiFiniteTrace_baseChange`
- **Taut adic curves over Spa(C, O_C) and Berkovich curves** — `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison` (comparison)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/taut-spaces-and-morphisms`, `AdicSpacesPartII:R1/analytification-functor`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`, `AdicSpacesPartII:R0/partially-proper-morphism`, `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs`
- **Local residue computation: Kummer classes of units on annuli and the degree** — `ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/pseudo-adic-support-space`, `ClassicalAdicEtaleCohomology:H0/tate-twists`
- **Compactly supported cohomology of analytified algebraic curves over Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison` (comparison)
  - prerequisites: `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `ClassicalAdicEtaleCohomology:H3/henselian-proper-base-change`, `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases`, `SchemeAndStackFoundations:SF.2`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`
- **The trace map for smooth adic curves over Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/curve-trace` (construction)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/smooth-adic-curve`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula`, `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `ClassicalAdicEtaleCohomology:H0/tate-twists`
  - API: `AdicSpace.curveTrace`; `AdicSpace.curveTrace'`; `AdicSpace.curveTrace_comp_quasiFiniteTrace`; `AdicSpace.curveTrace_projectiveLine`; `AdicSpace.curveTrace_generic`; `AdicSpace.curveTrace_surjective`; `AdicSpace.curveTrace_unique`; `AdicSpace.curveTrace_baseChange`; `AdicSpace.curveTrace_isIso`
  - unit tests: `curveTrace_relBall`; `curveTrace_projectiveLine`; `curveTrace_kummerCover`; `curveTrace_empty`; `curveTrace_generic`; `curveTrace_not_pTorsion`
- **Trace compatibility with finite étale maps and with restriction to open subspaces** — `ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases`
- **Trace compatibility with change of the base Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/curve-trace-base-change` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`
- **The trace is an isomorphism for connected curves** — `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/curve-trace-flat-quasi-finite-compatibility`, `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `ClassicalAdicEtaleCohomology:H3/formal-model-transfer`, `AdicSpacesPartII:R2/residue-disc`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`
- **The analytic trace of an analytified algebraic curve is the algebraic trace** — `ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`
- **Pullback along smooth maps with connected fibres is fully faithful on sections** — `ClassicalAdicEtaleCohomology:H3/smooth-curve-connected-fibres-unit` (lemma)
  - prerequisites: `AdicSpacesPartII:R0/smooth-morphism-open`, `AdicEtaleGeometry:A1/etale-enough-points`, `AdicEtaleGeometry:A1/strict-localisation-analytic`, `ClassicalAdicEtaleCohomology:H0/stalk-formula-strict-localisation`, `AdicSpacesPartII:R0/smooth-morphism`
- **Effacement lemma for R¹f_! of smooth curves** — `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected`, `ClassicalAdicEtaleCohomology:H3/smooth-adic-curve`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`
- **Poincaré duality for smooth adic curves** — `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality` (theorem) — planet *Poincaré duality for curves*
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/curve-trace-iso-connected`, `ClassicalAdicEtaleCohomology:H3/smooth-curve-connected-fibres-unit`, `ClassicalAdicEtaleCohomology:H3/curve-fundamental-lemma`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-direct-sums`, `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `ClassicalAdicEtaleCohomology:H0/derived-direct-image`, `ClassicalAdicEtaleCohomology:H0/tate-twists`, `mathlib:CategoryTheory.Abelian.Ext`
- **Compatibility of the trace and duality with extension by zero from quasi-compact opens of Spa(C, C⁺)** — `ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/lower-shriek-composition`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-proper-and-etale-cases`, `ClassicalAdicEtaleCohomology:H3/curve-trace`, `ClassicalAdicEtaleCohomology:H3/curve-trace-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-projection-formula`, `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`
- **Finiteness of the cohomology of quasi-compact and proper smooth curves** — `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness` (lemma)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`, `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H3/smooth-adic-curve`
- **Nondegeneracy of the cup-product pairing for smooth curves** — `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing` (theorem)
  - prerequisites: `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness`, `ClassicalAdicEtaleCohomology:H3/curve-trace-algebraic-comparison`, `ClassicalAdicEtaleCohomology:H3/algebraic-curve-comparison`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`, `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H0/tate-twists`


## Sources

- **Huber-EtaleCohomology-1996**: R. Huber, *Étale cohomology of rigid analytic varieties and adic spaces*, Aspects of Mathematics E30, Vieweg 1996 (not public; excerpts copied only from the reviewed decompositions). <https://link.springer.com/book/10.1007/978-3-663-09991-8>
- **Scholze-EtaleCohomologyDiamonds**: P. Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4. <https://arxiv.org/abs/1709.07343>
- **Scholze-PadicHodgeRigid-2013**: P. Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (Forum Math. Pi 1 (2013)). <https://arxiv.org/abs/1205.3463>
- **Scholze-PadicHodgeRigid-Erratum**: P. Scholze, *Erratum to "p-adic Hodge theory for rigid-analytic varieties"*, author erratum PDF (undated). <https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf>
- **deJongvanderPut-EtaleRigid-1996**: A. J. de Jong, M. van der Put, *Étale cohomology of rigid analytic spaces*, Documenta Math. 1 (1996) 1–56 (EMS Press PDF; its text layer drops the ligatures fi/ffi/ff/fl and accents). <https://ems.press/content/serial-article-files/25781>
- **Berkovich-EtaleCohomology-1993**: V. G. Berkovich, *Étale cohomology for non-Archimedean analytic spaces*, Publ. Math. IHÉS 78 (1993) 5–161 (printed page = PDF page + 3). <http://www.numdam.org/item/PMIHES_1993__78__5_0/>
- **ScholzeWeinstein-ModuliPDivisible-2013**: P. Scholze, J. Weinstein, *Moduli of p-divisible groups*, arXiv:1211.6357v2. <https://arxiv.org/abs/1211.6357>
- **sch12-perfectoid**: P. Scholze, *Perfectoid spaces*, arXiv:1111.4914v1. <https://arxiv.org/abs/1111.4914>
- **Wedhorn-AdicSpaces-2019**: T. Wedhorn, *Adic spaces*, arXiv:1910.05934v1. <https://arxiv.org/abs/1910.05934>
- **KedlayaLiu-RelativeFoundations-2015**: K. Kedlaya, R. Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5 (Astérisque 371); printed page numbers. <https://arxiv.org/abs/1301.0792>
- **BhattHansen-ZariskiConstructible-2022**: B. Bhatt, D. Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, arXiv:2101.09759v2. <https://arxiv.org/abs/2101.09759>
- **Hansen-ArtinVanishing-2020**: D. Hansen, *Vanishing and comparison theorems in rigid analytic geometry*, arXiv:1708.07276v1. <https://arxiv.org/abs/1708.07276>
- **Stacks-Project**: The Stacks project authors, *The Stacks project*, online, tags fetched 2026-09-26. <https://stacks.math.columbia.edu>
- **Huber-EtaleCohomologyHenselianRings-1993**: Roland Huber, *Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields*, Math. Ann. 295 (1993) 703–708; GDZ full-text OCR (PPN235181684_0295, physical pages 711–716), accessed 2026-09-26. <https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295>
- **gr-almost**: Ofer Gabber, Lorenzo Ramero, *Foundations for almost ring theory*, arXiv:math/0201175v3. <https://arxiv.org/abs/math/0201175>
- **Bhatt-PerfectoidNotes-2017**: Bhargav Bhatt, *Lecture notes for a class on perfectoid spaces*, 2017 notes (as in S/. <http://www-personal.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf>
- **FujiwaraKato-RigidGeometryI**: Kazuhiro Fujiwara, Fumiharu Kato, *Foundations of Rigid Geometry I*, arXiv:1308.4734. <https://arxiv.org/abs/1308.4734>
- **Huber-ContinuousValuations-1993**: Roland Huber, *Continuous valuations*, Math. Z. 212 (1993) 455–477; GDZ OCR. <https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212>
- **Huber-GeneralizationFormalRigid-1994**: Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994) 513–551; GDZ OCR. <https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217>
- **ScholzeWeinstein-Berkeley-2020**: Peter Scholze, Jared Weinstein, *Berkeley lectures on p-adic geometry*, author PDF. <https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf>
- **Berkovich-VanishingCyclesFormal-1994**: Vladimir G. Berkovich, *Vanishing cycles for formal schemes*, Invent. Math. 115 (1994) 539–571; GDZ OCR (berkovich-vc1.ocr.txt, printed pp. 540–571; some pages incomplete). <https://gdz.sub.uni-goettingen.de/id/PPN356556735_0115 (LOG_0031)>
- **Orgogozo-ModificationsCyclesProches-2006**: Fabrice Orgogozo, *Modifications et cycles proches sur une base générale (arXiv title: Modifications et cycles évanescents sur une base de dimension supérieure à un)*, arXiv:math/0507475v1 (22 Jul 2005), read; published in Int. Math. Res. Not. 2006, Art. ID 25315. Page numbers are those of the arXiv PDF. Text extracted with pdftotext -layout into cae/H1v/; accessed 2026-09-26.. <https://arxiv.org/abs/math/0507475>
- **Illusie-VanishingCyclesGeneralBases-2006**: Luc Illusie, *Vanishing cycles over general bases after P. Deligne, O. Gabber, G. Laumon and F. Orgogozo*, Author PDF dated April 9, 2006 (19 pp.), read; the talk appeared in RIMS Kôkyûroku 1521 (2006) 35–53. Text extracted into cae/H1v/; accessed 2026-09-26.. <https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf>
- **HansenZavyalov-ArithmeticRigidNearbyCycles-2023**: David Hansen, Bogdan Zavyalov, *Arithmetic properties of ℓ-adic étale cohomology and nearby cycles of rigid-analytic spaces*, arXiv:2301.01800v2 (17 Jul 2025), read; text in cae/H1v/; accessed 2026-09-26.. <https://arxiv.org/abs/2301.01800>
- **Kato-AlgebraizableRigidNearbyCycles-2021**: Hiroki Kato, *Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases*, arXiv:2011.09880v2 (31 May 2021), read; text in cae/H1v/; accessed 2026-09-26.. <https://arxiv.org/abs/2011.09880>
- **LuZheng-DualityNearbyCyclesGeneralBases-2019**: Qing Lu, Weizhe Zheng, *Duality and nearby cycles over general bases*, arXiv:1712.10216v7 (7 Oct 2019); Duke Math. J.. <https://arxiv.org/abs/1712.10216v7>
- **SGA7II-1973**: Pierre Deligne, Nicholas Katz (directors); Exposé XIII by P. Deligne, *Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340*, Springer 1973; IAS author-archive scan (PDF SHA-256 fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297, as in LefschetzPencilsAndVanishingCycles' decomposition); OCR text copied from the library's references/text/Weil_SGA7II.txt to sga7ii.ocr.txt (sha256 below); the OCR is poor and excerpts quote it exactly; Exposé XIII pages are the exposé's internal page numbers. <https://publications.ias.edu/sites/default/files/Number12.pdf>
- **Conrad-IrreducibleComponents-1999**: Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author PDF irredpaper.pdf. <https://math.stanford.edu/~conrad/papers/irredpaper.pdf>
- **Zavyalov-FoundationalAdic-2024**: Bogdan Zavyalov, *Some foundational results in adic geometry*, arXiv:2409.15516 v2. <https://arxiv.org/abs/2409.15516>
- **Scholze-PerfectoidSpaces-2012**: Peter Scholze, *Perfectoid spaces*, arXiv:1111.4914 v1. <https://arxiv.org/abs/1111.4914>
- **FarguesScholze-Geometrization**: Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, arXiv:2102.13459. <https://arxiv.org/abs/2102.13459>

- **deJong-AnalyticFundamentalGroups-1995**: A. J. de Jong, *Étale fundamental groups of non-Archimedean analytic spaces*, Compositio Math. 97 (1995), 89–118; Numdam scan; printed page numbers. [Public source](https://www.numdam.org/item/CM_1995__97_1-2_89_0.pdf). Read: §2 (Definitions 2.1, 2.6; Lemmas 2.2–2.7; Theorems 2.9–2.10, with proofs); §4 (Definition 4.1, Theorem 4.2 with proof, Corollary 4.4); §5 first paragraphs (rigid translation).

- **Cesnavicius-BrauerPurity-2019**: Kęstutis Česnavičius, *Purity for the Brauer group*, Author PDF of Duke Math. J. 168 (2019); §4.10, printed pp. 9–11. [Public source](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf). Read: §4.10 proof, formulas (4.10.2)–(4.10.7), footnotes 2–4.

- **ColmezDospinescuNiziol-DrinfeldFactorisation-2023**: Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Published Forum Math. Pi 11 (2023), e16; printed pp. 22–24; PDF carries a download stamp. [Public source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Read: §2.1.1, including Theorem 2.4 and its local algebraization proof.

- **Zavyalov-PoincareDuality-2025**: Bogdan Zavyalov, *Mod-p Poincaré Duality in p-adic analytic geometry*, Author PDF of Annals Math. 201 (2025), no. 3; author pagination, §5.3 pp. 77–78, Appendix A pp. 84–88. [Public source](https://bogdanzavyalov.com/refs/papers/Poincare_Duality.pdf). Read: Theorem 1.1.3 (prime-to-residue-characteristic duality); §1.4 conventions; §5.3 complete (Definition 5.3.1, Lemma 5.3.2, Theorem 5.3.3 with proof); Appendix A complete (A.1–A.19); §5.4 used only to delimit the external mod-p duality input.

- **GuoReinecke-CrystallineLocalSystems-2024**: Haoyang Guo, Emanuel Reinecke, *A prismatic approach to crystalline local systems*, Published Invent. Math. 236 (2024), 17–164; printed pp. 114–115. [Public source](https://par.nsf.gov/servlets/purl/10534610). Read: Theorem 7.16 (étale normalization hypotheses only), Remark 7.17, first paragraph of proof.
