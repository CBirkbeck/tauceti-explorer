# Roadmap: derived de Rham cohomology

Derived de Rham cohomology extends differential algebra to singular and animated rings. Its cotangent and power operations record relations that ordinary differential modules lose. In characteristic p, the conjugate filtration links these operations to Cartier theory; under precise flatness and complete-intersection hypotheses, the resulting complex recovers crystalline cohomology. Completion and descent then make these constructions usable on p-adic formal schemes and in period comparisons.

This roadmap builds that library, including its logarithmic counterpart. It starts with the full cotangent complex, integral derived powers and derived completion. It constructs ordinary differential algebra on the existing Kähler and exterior-power carriers before extending it through polynomial resolutions. The final layers supply crystalline comparisons, quasisyntomic descent, Gabber's log cotangent complex and log derived de Rham cohomology. The main sources are Bhatt's *p-adic derived de Rham cohomology*, Bhatt–Morrow–Scholze's integral p-adic Hodge theory, Bhatt–Lurie's appendices on derived Hodge theory, and Koshikawa–Yao's logarithmic theory.

The [suggested Lean file](Suggested.lean) proposes names and some ordinary derived-category forms. This README specifies the mathematics, including the animation, multiplicative structures, mapping spaces and diagram coherences that those forms forget. An ordinary triangulated-category diagram cannot replace a coherent filtered object. Every construction below needs its stated functoriality and tests as well as its defining formula.

## Scope and ownership

Generic enhanced categories and animation come from `EnhancedDerivedSheaves`. Ordinary divided powers, PD envelopes and crystalline sites come from `CrystallineCohomology`. Integral perfectoid algebra comes from `PerfectoidQuotients`. This roadmap builds derived cotangent and de Rham operations and their comparisons with those imported objects. It also supplies the ordinary differential-algebra API used by `MotivicEtaleKTheory:M.5d`; Milnor K-theory is not an input to the differential construction.

### Prerequisites and boundaries

`TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants`, Layer 6.4, owns the general
Koszul complex of a linear functional, its alternating contraction, sequence tensor
formula, regular-sequence resolution and multiplication null-homotopies. Use that
interface here, reindexed from homological degree n to cohomological degree −n.
Its degree-one contraction is φ(e); for an empty sequence it is A, for (p) over
Z it resolves F_p, and for (0) it has A in degrees −1 and 0. These fix the supplier
normalization used by the completion tower. No Koszul construction is owned here.

The ordinary Rees algebra of an ideal, with `reesAlgebra.grade`,
`reesAlgebra.gradedAlgebra` and `reesAlgebra.gradeZeroEquiv` in
`TauCeti.RingTheory.ReesAlgebra.Grading` at `a91d3aaf`, is not
the enhanced graded-module equivalence constructed in Layer 1: that equivalence
allows arbitrary coherent filtrations and derived quotient by t.
`TauCetiRoadmap.DifferentialGeometry`, Layers 0–6, constructs smooth real manifold
forms; Layer 2 here constructs algebraic Kähler forms over arbitrary rings.
`TauCetiRoadmap.AlgebraicVectorBundles`, Layer 0, supplies ordinary sheaf tensor,
dual and exterior operations; the derived cotangent powers here retain negative
homology and integral divided-power behavior.

At `a91d3aaf`, `TauCeti.RingTheory.Ideal.ArtinRees` supplies
`TauCeti.ArtinRees.exists_controlled_lift`, with one filtration shift independent
of the source of the surjection. Use it as the ordinary input to the Noetherian
completion proof; the derived pro-zero comparison remains to be constructed.
The weight-one pullback of algebraic differentials is already
`KaehlerDifferential.mapSemilinear` in `TauCeti.RingTheory.Kaehler.MapSemilinear`;
Layer 2 extends it to all exterior degrees and the differential complex.

## Conventions

Rings are commutative and unital. In ordinary differential algebra, A→B is a specified algebra structure, Ω¹ means `KaehlerDifferential A B`, and Ωⁿ means `exteriorPower B n (KaehlerDifferential A B)`. Wedge products use the existing exterior-algebra grading. The differential is **A-linear**. The modules of forms are B-modules, but the full de Rham complex is an A-complex: its differential generally fails B-linearity. Base-change tensors of that complex must use the base ring.

Complexes use cohomological degrees. A simplicial degree n contributes degree −n; a connective cotangent complex has nonpositive cohomology. For a module N in degree zero, N[1] lies in degree −1. Derived exterior powers are unshifted power functors. The de Rham weight shift is written separately: gr_H^i dR and gr_i^conj dR have the relevant L∧^i L[−i]. Thus the shifted conormal of a regular quotient produces divided powers in degree zero after the shifts cancel.

General algebra pushouts and module tensors are derived. An ordinary tensor computes an animated pushout only with the stated Tor independence. In particular the naive two-term cotangent complex is a truncation, and cannot detect all negative homology of a non-lci quotient.

The notation dR denotes **direct-sum** realization of polynomial de Rham complexes along antidiagonals. The decreasing Hodge filtration is F_H^i, with gr_H^i = cofib(F_H^(i+1)→F_H^i). Hodge completion is the derived inverse limit of its quotients and corresponds to product totalization. Derived p-completion Λ_p is a different reflection, computed by a derived quotient tower in its bounded-torsion range. Both completions are specified whenever both occur. Rational uncompleted dR is the base ring; rational smooth ordinary de Rham is recovered by Hodge completion. Nilpotent-p smooth comparison has its own hypotheses.

The conjugate filtration is increasing, starts with Fil_−1=0, and has gr_i = cofib(Fil_(i−1)→Fil_i). Its affine uncompleted exhaustiveness does not give unconditional convergence after a global totalization or completion. Every spectral-sequence or colimit/totalization exchange below retains its connectivity, finite-contribution or derived-limit condition. Complete filtered objects use completed Day convolution, not tensor products of equal-index levels.

Complete flatness is a derived-reduction condition; completeness of the object is a separate assumption. Flatness, faithful flatness, projectivity, finite projectivity, perfectness and almost perfectness are used in their respective ranges. Tor amplitude alone supplies no finiteness. A proper smooth perfect-complex result supplies no automatic finite-projectivity statement for its individual cohomology modules.

Log cotangent means **Gabber's** complex. The ordinary-log-differential and Olsson comparisons keep the integral and log-smooth hypotheses. Homological log flatness is the homotopy-pushout criterion and differs from Kato log flatness. General prelog QSyn and QRSP objects need not have integral monoids; integrality and Cartier type enter explicitly in the smooth and crystalline applications. Logification of cotangent complexes and invariance of uncompleted log de Rham have different ranges.

## Exact supplier contracts

### From neighbouring roadmaps

The following interfaces fix the boundary and the order of use. A reference to an early part of a neighbouring layer means the listed mathematical interface, rather than every application in that layer.

| Owner | Interface used here |
|---|---|
| `EnhancedDerivedSheaves:E1` | Stable enhanced module categories, their ordinary `DerivedCategory` views, derived tensor, presentability and descent targets. |
| `EnhancedDerivedSheaves:E2` | Derived inverse limits, amplitude and connectivity estimates. |
| `EnhancedDerivedSheaves:E3` | Left Kan extension and its universal property. |
| `EnhancedDerivedSheaves:E5:animation` | Animated commutative rings and modules, homotopy pushouts, square-zero extensions and animation from compact projective generators. |
| `CrystallineCohomology:CR.0` | Ordinary Γ-algebras and flat-module base change; PD envelopes with their filtered universal maps; the explicit regular envelopes, tensor discreteness, flatness and reduction in [Bhatt12], Lemmas 3.37–3.38, pp.16–17. |
| `CrystallineCohomology:CR.2` | The crystalline site, PD Poincaré models, scheme descent and crystalline transitivity/base-change maps in their nilpotent-PD range. Layer 5 proves the lci derived de Rham comparison. |
| `CrystallineCohomology:CR.4` | The early classical smooth F_p complex WΩ, Nygaard filtration, divided Frobenius and classical smooth crystalline comparison; in particular [BMS19], Lemmas 8.2–8.3, pp.266–267. Layer 4 animates this input; Layer 5 identifies its quasiregular values. |
| `PerfectoidQuotients:Q0:integral-algebra` | Integral perfectoid rings, tilts and the elementary perfectoid algebra obtained by adjoining compatible roots of p and coordinates; bounded torsion and the completed cotangent criterion. Layer 1 states the QSyn condition; Layer 5 constructs its sites, QRSP objects and elementary covers. |
| `AInfCohomology:AI.0:integral` | A_inf, θ with regular principal kernel, the relatively perfect mod-p input, completed PD period ring, and its structure/Frobenius/Galois maps. |
| `PadicHodgeTheory:R06.1` | B_dR⁺, B_dR, B_cris and their localization maps, filtrations and G_K actions. Layer 5 identifies the derived period object with these shared rings. |
| `AlgebraicModuliForArithmeticGeometry:A0-extension` | Proper-flat finite-presentation coherent cohomology, perfectness and arbitrary derived base change, including the nonnoetherian approximation theorem [StacksProper], Lemmas 36.30.1 and 36.30.4, pp.73–74. |
| `SchemeAndStackFoundations:SF.0` | Schemes, affine charts and proper/smooth finite-presentation morphisms. |
| `SchemeAndStackFoundations:SF.4` | The early p-adic formal-spectrum, compatible finite-reduction, proper-smooth formal-chart and étale-site constructions. |
| `CrystallineCohomology:CR.5:log-algebra` | Prelog/log ring and monoid algebra; integral, fine, saturated, strict, exact and Cartier-type conditions; ordinary log differentials; exactification followed by strict PD envelopes and log PD Poincaré models. |
| `ArithmeticGaloisRepresentations:R01.1` | G_K-actions, the Tate module Z_p(1) of compatible roots of unity and coherent equivariant maps. |

The fine-node name `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings` is used below only for the integral perfectoid algebra in this interface. The QSyn and QRSP definitions are in Layer 1 and Layer 5. Elementary covers do not require the absolutely-integrally-closed extension construction in Q3. Likewise the early classical CR.4 and log-algebra CR.5 interfaces precede the derived comparisons here.

**Dependency gap.** This roadmap and CrystallineCohomology form the tier-9 bundle.
PerfectoidQuotients, AInfCohomology and PadicHodgeTheory are tier 13 in the
Caraiani–Newton dependency order. Their interfaces in this table are therefore
upward dependencies. The elementary perfectoid algebra, A_inf/θ/PD-period
construction and period-ring interfaces must be supplied as complete targets
in this bundle before their applications below have a permitted build route.
Merely naming an early part of a higher roadmap does not supply that route.

### From Mathlib and Tau Ceti

Use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The existing Kähler presentation and universal derivation, exterior powers and their alternating universal property, `CochainComplex.of`, naive cotangent/H1 and square-zero lift equivalence supply the ordinary starting point. `DividedPowers`, `DividedPowerAlgebra`, `WittVector`, `DerivedCategory`, `PadicInt`, `LaurentPolynomial` and ordinary adic completeness are existing carriers. Their derived or coherent analogues are constructed below, rather than inferred from these carriers. Every existing declaration used as a prerequisite is linked to its individual module at these commits.

For ordinary differential algebra, consult [StacksDR], §10.132, pp.334–336, and [StacksExterior], Lemma 10.13.4, p.28. [Riou] gives an independent direct-presentation design for the same complex. Follow the mathematical shape of that Mathlib work and adopt its API if incorporated; the construction here is independently specified and does not require its code.

## How to read the build

The layers follow the construction order. Layer 0 builds cotangent complexes and
integral derived powers. Layer 1 builds completion and complete flatness before
stating the quasisyntomic condition. Layer 2 constructs ordinary differential
algebra, polynomial realization and its two completions. Layer 3 supplies
Cartier theory and its Frobenius-lift calculations, then the non-lci and rational
completion boundaries and smooth comparisons. Layer 4 constructs crystalline
comparison maps, classical-input Witt animation and PD filtrations. Layer 5 builds the quasisyntomic sites and elementary covers before
descent, scheme realization, lci and period comparisons, QRSP crystalline
applications and proper smooth control. Layer 6 develops the logarithmic counterpart from prelog resolutions.

Each layer groups related constructions with their mathematical laws and checks.
Ordinary differential algebra uses the `DeRham` subnamespace and the derived
constructions use `DerivedDeRham`, both inside
`TauCetiRoadmap.DerivedDeRhamCohomology` in Suggested.lean. These are representative
signature names; production declarations belong in the corresponding Tau Ceti
modules. A common source paragraph applies to every claim in its subsection.

The signatures distinguish full targets from specified ordinary parts.
`cotangentNaiveComparison` records H^−1, with H⁰ recorded by `cotangentH0`;
`cotangentTransitivity` records existence of the distinguished triangle on the
three specified objects. `cotangentBaseChange` records ordinary base change
under the sufficient assumption that B is A-flat, and
`regularQuotientCotangent` records the relative regular-quotient computation.
`ordinaryBaseChangeKunneth` records the degreewise linear base-change equivalence;
its differential compatibility and polynomial Künneth equivalence are additional
named requirements below. `ordinaryDeRhamUniversalProperty` records uniqueness
on elementary forms, while the graded-algebra existence statement is separate.
`quotientCompleteness` records derived completeness, with the classical
comparison requiring the additional injectivity stated below. The full animated,
coherent and multiplicative forms of these targets remain specified in their
subsections, rather than being inferred from the ordinary signatures.

## Layer 0: Cotangent complexes and integral derived powers

Construct the full cotangent complex and its square-zero universal property, then the integral power operations and local algebra criteria.

### 0.1 The full cotangent complex


For A→B in animated commutative rings construct the connective B-module L_(B/A). For ordinary rings and a cofibrant simplicial polynomial A-algebra resolution P•→B its underlying cochain complex is the normalized realization of Ω¹_(P•/A)⊗_(P•)B, with simplicial degree n placed in cohomological degree −n. Comparisons between free resolutions and naturality in commutative base squares are coherent. The full object retains all negative cohomology.

[StacksCt], Definition 3.2, Lemmas 4.3–4.7, Remark 5.5; tags 08PN,08PU,08QF,08QH,08QI, pp.3,5–6,9; [BL22], Appendix B, Construction B.1 and Remark B.2, pp.225–226.

*Needs:* `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`; `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; [`KaehlerDifferential.D`][lib-11]; [`DerivedCategory`][lib-37]; [`DerivedCategory.Q`][lib-38]; [`DerivedCategory.singleFunctor`][lib-39]; [`DerivedCategory.homologyFunctor`][lib-40].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.cotangentComplex`.

Prove the following named laws.

- `cotangentMap`: Every commutative square (A→B)→(A′→B′) gives L_(B/A)⊗^L_B B′→L_(B′/A′), with identity and composition coherences.
- `cotangentResolutionEquiv`: Every free resolution gives the normalized differential model, naturally and coherently in comparison maps.
- `cotangentH0`: For ordinary A→B, H⁰L_(B/A)≃KaehlerDifferential A B, preserving the universal derivation.

**Checks.**

- `test_cotangent_identity`: L_(A/A)=0.
- `test_cotangent_polynomial`: L_(A[t]/A)≃A[t]·dt in degree 0.
- `test_cotangent_dual_numbers`: For k a field of characteristic different from 2 and B=k[ε]/ε², L_(B/k) is [B→B·dε], in degrees −1,0 with map multiplication by 2ε; H^−1 is nonzero.
- `test_cotangent_dual_numbers_two`: In characteristic 2 the same regular presentation has zero differential: both H^−1 and H⁰ are B. This pins the derivative 2ε and prevents an invertibility-of-2 assumption from entering the integral construction.

### 0.2 Derived derivations and square-zero extensions


For A→B animated and a connective B-module M, define Der_A(B,M) as Map_(CAlg_A/B)(B,B⊕M), the space of sections of the split square-zero A-algebra extension. The multiplication is (b,m)(b′,m′)=(bb′,bm′+b′m). This mapping space, including its higher homotopy, is the intrinsic derivation functor.

[Bhatt12], Remark 6.6 and equivalence (6), printed p.25, specialized to identical trivial monoids; preceding paragraph for ordinary cotangent interpretation.

*Needs:* `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedDerivations`.

Prove the following named laws.

- `squareZero`: B⊕M has projection to B and zero section, with square-zero augmentation ideal M.
- `derivationZero`: The zero derivation is the canonical base point of Der_A(B,M).
- `derivationPostcompose`: A B-linear map M→N induces Der_A(B,M)→Der_A(B,N), preserving the zero section.
- `derivationDiscrete`: For ordinary B and an ordinary module M, π₀ Der_A(B,M) is the usual A-derivation set.

**Checks.**

- `test_derivation_base`: Der_A(A,M) is contractible.
- `test_derivation_coordinate`: For B=A[t], Der_A(B,M) is the underlying anima of M via δ↦δ(t).
- `test_derivation_product_rule`: For discrete M, a section sends t² to (t²,2tδ(t)); replacing the square-zero product by a product ring fails.

### 0.3 The cotangent universal property


For A→B animated and connective M there is a natural equivalence Map_(Mod_B)(L_(B/A),M)≃Der_A(B,M), compatible with base squares and module maps. This compares the independent square-zero characterization with the polynomial-resolution object, including higher homotopies.

[Bhatt12], Remark 6.6 and equivalence (6), printed p.25, specialized to identical trivial monoids; preceding paragraph for ordinary cotangent interpretation.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Derived derivations and square-zero extensions; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; [`derivationToSquareZeroEquivLift`][lib-33].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivationsCotangentComparison`.

### 0.4 Degree zero and the naive cotangent complex


For ordinary A→B, H⁰L_(B/A)≃Ω¹_(B/A). If P→B is a polynomial presentation with kernel J, τ≥−1L_(B/A) is represented by [J/J²→Ω¹_(P/A)⊗_P B] in degrees −1,0. Its H^−1 agrees with the pinned Algebra.H1Cotangent; the displayed two-term complex is not the full cotangent complex for an arbitrary quotient.

[StacksCt], Lemmas 4.5, 11.2 and 11.3; tags 08QF,08RA,08RB, pp.5,21–22.

*Needs:* Layer 0: The full cotangent complex; [`Algebra.Extension.cotangentComplex`][lib-28]; [`Algebra.Extension.toKaehler`][lib-29]; [`Algebra.Extension.exact_cotangentComplex_toKaehler`][lib-30]; [`Algebra.H1Cotangent`][lib-31]; [`Algebra.Generators.equivH1Cotangent`][lib-32].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.cotangentNaiveComparison`.

**Transitivity, base change and geometric cases.**

The cotangent functor must work on base squares and composable maps, with ordinary computations recovered in their correct range.

### 0.5 The cotangent transitivity triangle


For composable maps A→B→C of animated commutative rings there is a coherent natural fibre sequence L_(B/A)⊗^L_B C→L_(C/A)→L_(C/B)→(L_(B/A)⊗^L_B C)[1] in Mod_C.

[StacksCt], §7, Proposition 7.4; tag 08QX, p.16 (construction in pp.13–16).

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent universal property; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.cotangentTransitivity`.

### 0.6 Derived base change of the cotangent complex


For a derived pushout B′=B⊗^L_A A′, L_(B′/A′)≃L_(B/A)⊗^L_B B′ naturally. For ordinary ring squares this formula applies to the ordinary pushout only when Tor_i^A(B,A′)=0 for i>0. Without Tor independence the degree-zero pushout need not satisfy it.

[StacksCt], §6, Lemma 6.2; tag 08QQ, p.12. Remark 6.3, pp.12–13, gives the comparison map outside the Tor-independent range.

*Needs:* Layer 0: The full cotangent complex; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.cotangentBaseChange`.

### 0.7 Localization and filtered colimits of cotangent complexes


For an ordinary ring B and multiplicative set S, L_(S⁻¹B/B)=0 and L_(S⁻¹B/A)≃L_(B/A)⊗^L_B S⁻¹B. Cotangent complexes commute with filtered colimits of animated A-algebras in the module-pair category: if B=colim_j B_j, L_(B/A)≃colim_j(L_(B_j/A)⊗^L_(B_j)B).

[StacksCt], §8, Lemmas 8.1 and 8.6 (tags 08QZ,08SF); §3 standard-resolution functoriality and its filtered-colimit construction, pp.17–19.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0: Derived base change of the cotangent complex; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.cotangentLocalizationColimits`.

### 0.8 The smooth cotangent computation


For a smooth finitely presented ordinary ring map A→B, L_(B/A)≃Ω¹_(B/A)[0], where Ω¹ is finite projective. For an étale map it vanishes. Polynomial rings on arbitrary sets have a free differential module in degree zero without a finiteness claim.

[StacksCt], §9, Lemma 9.1 (tag 08R5), using §8, Lemma 8.4 (tag 08R2) for étale maps, pp.18–21.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Derived base change of the cotangent complex; Layer 0: Localization and filtered colimits of cotangent complexes.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.smoothCotangent`.

### 0.9 Regular quotients and two-term models


If J⊂P is generated by a finite regular sequence f₁,…,f_r and B=P/J, then L_(B/P)≃(J/J²)[1], with J/J² free on the classes of f_i. If P is smooth over A, L_(B/A) is the two-term complex [J/J²→Ω¹_(P/A)⊗_P B] with f_i↦df_i in degrees −1,0. Flatness of B over A is not needed for this computation.

[StacksCt], §14, Lemma 14.2 and Proposition 14.4; tags 08SJ,08SL, pp.29–31.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0: The smooth cotangent computation.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.regularQuotientCotangent`.

**Integral power operations.**

Build powers in the animated module-pair category, with multiplication, coherent scalar extension and the flat-module comparison. [BL22], Construction B.1 and Remark B.5, pp.225–226, describe the cotangent-specialized exterior operation. The general module exterior, symmetric and divided-power constructions specified here require the projective-resolution argument and its integral identities; the cotangent-specialized reference alone does not establish them. In the décalage argument use Illusie’s corrections [IllusieI], pp.1–2 (corrections to pp.227,231,247–248 of volume I), and [IllusieII], p.1. All formulas are integral, including at p=2.

### 0.10 Derived exterior powers


**Source gap.** [BL22], Construction B.1 and Remark B.5, certify exterior powers of cotangent complexes, not this general module-pair power functor. A primary construction with integral base change and the flat-module comparison is needed for the stated generality; the cotangent specialization does not supply it.

For an animated ring B and a connective B-module M define L∧^n_B(M), n≥0, by the sifted-colimit extension of the ordinary exterior power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary exterior power. The exterior operation imposes x∧x=0 even at 2.

[BL22], Appendix B, Construction B.1, Remark B.5, pp.225–226 (cotangent-specialized exterior case; the general module construction is specified above).

*Needs:* `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; [`ExteriorAlgebra.exteriorPower`][lib-8]; [`exteriorPower.ιMulti`][lib-24].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedExteriorPowers`.

Prove the following named laws.

- `exteriorPowerZero`: L∧⁰_B(M)≃B naturally.
- `exteriorPowerOne`: L∧¹_B(M)≃M.
- `exteriorPowerBaseChange`: L∧ⁿ_B(M)⊗^L_B B′≃L∧ⁿ_(B′)(M⊗^L_B B′).
- `exteriorPowerFlat`: For flat discrete M, L∧ⁿ_B(M) is the ordinary exterior power in degree zero.

**Checks.**

- `test_derived-exterior-powers_zero_weight`: L∧⁰_B(0)=B and L∧ⁿ_B(0)=0 for n>0.
- `test_derived-exterior-powers_rank_one`: For the flat rank-one B-module Be, L∧²(Be)=0, including B=F₂.
- `test_derived-exterior-powers_integral_boundary`: For flat M=B and n≥0, L∧ⁿ(M[1])≃Γⁿ(M)[n], so positive powers of a shifted line are nonzero.

### 0.11 Derived symmetric powers


**Source gap.** [BL22], Construction B.1 and Remark B.5, certify exterior powers of cotangent complexes, not this general module-pair power functor. A primary construction with integral base change and the flat-module comparison is needed for the stated generality; the cotangent specialization does not supply it.

For an animated ring B and a connective B-module M define LSym^n_B(M), n≥0, by the sifted-colimit extension of the ordinary symmetric power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary symmetric power.

[BL22], Appendix B, Construction B.1, Remark B.5, pp.225–226 (cotangent-specialized exterior case; the general module construction is specified above).

*Needs:* `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedSymmetricPowers`.

Prove the following named laws.

- `symmetricPowerZero`: LSym⁰_B(M)≃B naturally.
- `symmetricPowerOne`: LSym¹_B(M)≃M.
- `symmetricPowerBaseChange`: LSymⁿ_B(M)⊗^L_B B′≃LSymⁿ_(B′)(M⊗^L_B B′).
- `symmetricPowerFlat`: For flat discrete M, LSymⁿ_B(M) is the ordinary symmetric power in degree zero.

**Checks.**

- `test_derived-symmetric-powers_zero_weight`: LSym⁰_B(0)=B and LSymⁿ_B(0)=0 for n>0.
- `test_derived-symmetric-powers_rank_one`: For the flat rank-one Z-module Ze, LSym² is free of rank one on e²; its coefficient map is quadratic.
- `test_derived-symmetric-powers_integral_boundary`: Over F₂, Sym²(F₂e) is generated by e², whereas the square of e in the divided power algebra is zero.

### 0.12 Derived divided powers


**Source gap.** [BL22], Construction B.1 and Remark B.5, certify exterior powers of cotangent complexes, not this general module-pair power functor. A primary construction with integral base change and the flat-module comparison is needed for the stated generality; the cotangent specialization does not supply it.

For an animated ring B and a connective B-module M define LΓ^n_B(M), n≥0, by the sifted-colimit extension of the ordinary divided power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary divided power.

[BL22], Appendix B, Construction B.1, Remark B.5, pp.225–226 (cotangent-specialized exterior case; the general module construction is specified above).

*Needs:* `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `CrystallineCohomology:CR.0`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedDividedPowers`.

Prove the following named laws.

- `dividedPowerZero`: LΓ⁰_B(M)≃B naturally.
- `dividedPowerOne`: LΓ¹_B(M)≃M.
- `dividedPowerBaseChange`: LΓⁿ_B(M)⊗^L_B B′≃LΓⁿ_(B′)(M⊗^L_B B′).
- `dividedPowerFlat`: For flat discrete M, LΓⁿ_B(M) is the ordinary divided power in degree zero.

**Checks.**

- `test_derived-divided-powers_zero_weight`: LΓ⁰_B(0)=B and LΓⁿ_B(0)=0 for n>0.
- `test_derived-divided-powers_rank_one`: For the flat rank-one Z-module Ze, LΓ² is free of rank one on γ₂(e), and e·e=2γ₂(e).
- `test_derived-divided-powers_integral_boundary`: Over F_p, γ_p(e) in Γ(F_pe) is nonzero although e^p=p!γ_p(e)=0.

### 0.13 Exterior powers of a triangle


**Proof input gap.** The cited cotangent-power triangle does not yet supply the general animated module-pair filtration and the corrected integral décalage proof. The original Illusie proofs remain to be replaced by an accessible primary construction or a complete supplier argument.

For a fibre sequence K→L→M of connective B-modules, L∧ⁿL has a natural finite filtration of length n+1 with graded pieces L∧^jK⊗^L_B L∧^(n−j)M, 0≤j≤n. For a flat discrete module N, L∧ⁿ(N[1])≃Γⁿ(N)[n]. The finite filtration is functorial and its multiplication is compatible with the weight grading.

[DM], Lemma 3.3 and proof, pp.21–22; [Bhatt12], Proposition 3.22 and Remark 3.43; cotangent-specialized power filtration and décalage (general module version requires the projective-resolution construction), pp.11–12,18.

*Needs:* Layer 0: Derived exterior powers; Layer 0: Derived divided powers; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.powerTriangleFiltration`.

**André–Quillen criteria and finiteness.**

Define coefficient homology using the full cotangent object. The local criteria must include the Cohen-factorization argument and the distinctions between finite-presentation lci maps and absolute Noetherian complete-intersection rings. F-finiteness requires both directions; the almost-perfect converse is part of the target, not a deduction from a finite list of homology groups.

### 0.14 André–Quillen homology


For an ordinary map A→B, a B-module N and n≥0 define D_n(B|A,N)=H^−n(L_(B/A)⊗^L_B N). Coefficients are derived-tensored, even if the cotangent module has a two-term presentation. Transitivity gives the homological long exact sequence.

[Iyengar], §§4–5 definitions and §8.10–8.14 applications, pp.211–217,228–229.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.andreQuillenHomology`.

Prove the following named laws.

- `andreQuillenZero`: D₀(B|A,N)≃Ω¹_(B/A)⊗_B N.
- `andreQuillenCoefficients`: A B-linear coefficient map induces natural maps on D_n.
- `andreQuillenTransitivity`: The cotangent transitivity triangle induces the exact sequence of D_n with the appropriate scalar extensions.

**Checks.**

- `test_aq_polynomial`: D₀(A[t]|A,N)≃N and D_n=0 for n>0.
- `test_aq_regular_quotient`: D₁(F_p|Z,F_p)≃F_p and D_n=0 for n≠1.
- `test_aq_nonregular_local`: For A=k[ε]/ε² and its residue field k, D₂(k|A,k)≃k; A is not regular.

### 0.15 The finite-presentation lci amplitude criterion


**Proof input gap.** The finite-presentation converse needs the cited local complete-intersection argument as a checked supplier proof. A two-term naive cotangent model alone is insufficient.

For a flat finitely presented map A→B of ordinary rings, A→B is locally complete intersection precisely when L_(B/A) is perfect of Tor-amplitude [−1,0]. A local regular-sequence presentation gives the two-term model. No unrestricted converse for arbitrary nonnoetherian, non-finitely-presented maps is asserted.

[StacksCt], §14, Proposition 14.4 and local-complete-intersection criterion; tag 08SL, pp.29–31.

*Needs:* Layer 0: Regular quotients and two-term models; Layer 0: Degree zero and the naive cotangent complex.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.lciAmplitude`.

### 0.16 Avramov’s absolute complete-intersection criterion


**Proof input gap.** Avramov’s theorem is correctly located, but the Cohen-factorization interior and its complete-intersection transfer must be supplied; the formalization cannot infer them from an amplitude bound.

For a Noetherian ring A, A is locally a complete-intersection ring (each completed local ring is a quotient of a regular local ring by a regular sequence) if and only if L_(A/Z) has Tor-amplitude [−1,0]. This is the absolute Noetherian criterion, without a finite-presentation hypothesis over Z. Local map versions use Cohen factorizations and D₂ with all coefficients.

[BMS19], Theorem 4.13, published p.224; [Avramov], Definitions §1, Theorem 1.2 and local criterion 1.8, pp.458–461.

*Needs:* Layer 0: André–Quillen homology; Layer 0: Regular quotients and two-term models; Layer 0: The cotangent transitivity triangle.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.absoluteCompleteIntersection`.

### 0.17 André’s regularity criterion and the cotangent injection test


**Proof input gap.** The local regularity statement needs the checked factorization and André–Quillen comparison arguments, including the specified coefficient modules.

For a Noetherian local ring (A,m,k), A is regular iff D₂(k|A,k)=0. If A is a complete-intersection local ring, this is equivalent to injectivity of H^−1(L_(A/Z)⊗^L_A k)→H^−1(L_(k/Z)). The injection reformulation retains the complete-intersection hypothesis; it is not a criterion obtained by truncating L_(A/Z) for arbitrary A.

[Iyengar], Proposition 8.12 and proof, pp.228–229; [BM], Lemma 4.18 and proof, printed pp.18–19.

*Needs:* Layer 0: André–Quillen homology; Layer 0: Avramov’s absolute complete-intersection criterion; Layer 0: The cotangent transitivity triangle.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.andreRegularity`.

### 0.18 F-finiteness and almost perfect cotangent complexes


**Proof input gap.** Dundas–Morrow proves the forward direction. The converse passes through Lurie’s SAG Theorem 3.5.1; that primary proof and its hypotheses remain an unsupplied input.

For a Noetherian F_p-algebra S, Frobenius S→S is finite if and only if L_(S/F_p) is almost perfect. In particular each H^−nL_(S/F_p) is a finite S-module for F-finite S. Here almost perfect means bounded above with finitely generated homology (equivalently over a Noetherian ring a bounded-above resolution by finite projectives); it does not mean bounded or perfect.

[DM], Theorem 3.6 with Lemma 3.3 and proof, pp.21–24; [CMM], Definition 5.1 and paragraph following, p.38; [BM], F-finiteness discussion preceding Corollary 4.20, citing DM17 and SAG Theorem 3.5.1, p.20.

*Needs:* Layer 0: The full cotangent complex; Layer 0: The cotangent transitivity triangle; Layer 0: Exterior powers of a triangle.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.fFiniteCotangent`.

### 0.19 p-bases and the dimension of differentials


For a field k of characteristic p with finite degree [k:k^p]=p^r, a p-basis b₁,…,b_r gives a basis db₁,…,db_r of Ω¹_(k/F_p), so dim_kΩ¹_(k/F_p)=r=log_p[k:k^p]. A p-basis means the p-monomials ∏b_i^e_i, 0≤e_i<p, form a k^p-basis; arbitrary transcendence bases are not substituted.

[CMM], §5.1, Theorem 5.7, Footnote 10 and the paragraph before Lemma 5.8, PDF pp.39–40.

*Needs:* [`KaehlerDifferential.D`][lib-11].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.pBasesDifferentials`.

**Deformations.**

For flat lifting, prove the nilpotent flatness criterion that identifies the lifted square-zero ideal with J⊗_A B. Ext obstruction classes alone classify extensions with a specified ideal; this flatness step is needed to obtain flat lifts. The singular example also requires the stronger eventual André–Quillen vanishing criterion, not merely failure of amplitude [−1,0].

### 0.20 Cotangent obstruction theory for square-zero lifts


**Proof input gap.** The displayed Ext obstruction classifies extensions with the specified ideal. The flat-lift specialization additionally needs the nilpotent flatness criterion identifying that ideal with J⊗_A B. The cited cotangent obstruction lemmas alone do not prove flatness.

Let A′→A be a square-zero extension with ideal J and let B be a flat ordinary A-algebra. The obstruction to a flat lift B′ over A′ with B′⊗_(A′)A≃B is a natural class in Ext²_B(L_(B/A),J⊗_A B). When it vanishes, isomorphism classes of lifts form a torsor under Ext¹ and automorphisms under Ext⁰. For smooth B/A, finite projectivity of L in degree zero gives existence and uniqueness up to the stated automorphisms. Derived lift spaces use the full module-valued square-zero extension, not just the Ext set.

[StacksCt], §16, Lemma 16.1 (tag 08SP), and its ringed-space version §21, Lemma 21.1 (tag 08UZ), pp.31–32,37–38.

*Needs:* Layer 0: The cotangent universal property; Layer 0: The cotangent transitivity triangle; Layer 0: The smooth cotangent computation; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.squareZeroDeformations`.

### Examples

The identity map has zero cotangent complex. A polynomial line has one degree-zero generator. The hypersurface k[ε]/ε² has differential 2ε; at characteristic 2 the map is zero and both cotangent degrees survive. Weight zero of every power is the base ring, including the zero module.

### Dependencies

EnhancedDerivedSheaves supplies animation and enhanced module operations; Mathlib supplies ordinary Kähler differentials, naive cotangent and regular sequences. The integral power and local-factorization proof inputs are marked at their targets.

## Layer 1: Completion and filtered modules

Use the supplied Koszul towers to construct completion, complete flatness and coherent filtered operations. The quasisyntomic condition comes after complete flatness.

### 1.1 Derived ideal completeness


Let I=(f₁,…,f_r)⊂A be finitely generated. A complex M∈D(A) is derived I-complete if RHom_A(A[1/f_i],M)=0 for each i, equivalently Hom_D(A)(A[1/f_i][n],M)=0 for every integer n and i. This depends only on √I and is equivalent to each H^j(M) being a derived I-complete module. Completeness is a homotopical condition, not ordinary separatedness.

[StacksMA], §93, Lemmas 93.1–93.3 and Definition 93.4; tags 091P,091S, pp.261–263.

*Needs:* `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedCompleteness`.

Prove the following named laws.

- `isDerivedCompleteGenerators`: The condition is RHom-vanishing for any finite generating set of I.
- `isDerivedCompleteRadical`: If √I=√J for finite-generated ideals, I-complete and J-complete objects coincide.
- `isDerivedCompleteCohomology`: M is I-complete iff every H^j(M) is derived I-complete.
- `isDerivedCompleteLimits`: Derived I-complete objects are closed under all limits and finite colimits in D(A).

**Checks.**

- `test_complete_zero_ideal`: For I=0, every complex is derived complete.
- `test_complete_unit_ideal`: For I=A, only the zero object is complete.
- `test_complete_zp`: Z_p is derived p-complete, while Q_p is not: RHom_Zp(Q_p,Q_p) has a nonzero identity class.

### 1.2 The derived completion reflector


For finite-generated I⊂A construct Λ_I:D(A)→D_I-comp(A) left adjoint to the inclusion, with natural unit η_M:M→Λ_I M. For I=(f_i), put C_I=⊗_i[A→A[1/f_i]] in cochain degrees 0,1 and Λ_I M=RHom_A(C_I,M). This is exact, independent of generators, idempotent and preserves colimits formed in the complete category. Derived Nakayama: if M is complete and M⊗^L_A A/I=0 then M=0.

[StacksMA], §93, Lemmas 93.10, 93.18 and 93.20; tags 091V,0920,0G1U, pp.264,267–268.

*Needs:* Layer 1: Derived ideal completeness; the Koszul supplier contract; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`; [`PadicInt`][lib-44].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedCompletion`.

Prove the following named laws.

- `completionUnit`: η_M is the universal map from M to an I-complete object.
- `completionAdjunction`: Map_(D_I-comp)(Λ_I M,N)≃Map_D(A)(M,N), naturally for complete N.
- `completionIdempotent`: Λ_IΛ_I M≃Λ_I M, compatibly with both units.
- `completeNakayama`: A complete M with M⊗^L_A A/I=0 vanishes.
- `completionComplete`: For a finitely generated ideal I, the reflected object Λ_I M is derived I-complete.
- `completedColimit`: The colimit of a diagram of complete objects is Λ_I of its colimit in D(A).

**Checks.**

- `test_completion_z`: Λ_(p)Z≃Z_p in degree 0.
- `test_completion_inverted`: Λ_(p)Z[1/p]=0, although Z[1/p] is nonzero.
- `test_completion_torsion`: Λ_(p)(Z/p^m)≃Z/p^m for m≥1.

### 1.3 The derived Koszul completion tower


For M∈D(A), I=(f₁,…,f_r), Λ_I M≃Rlim_n(M⊗^L_A K_A(f₁^n,…,f_r^n)), with the quotient-direction transition induced by e_i↦f_i e_i and the identity in degree zero. These are derived Koszul quotients. Replacing them by ordinary A/I^n for an arbitrary ring is invalid.

[StacksMA], Lemma 93.18; tag 0920, pp.266–267.

*Needs:* the Koszul supplier contract; Layer 1: The derived completion reflector; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.koszulCompletionTower`.

### 1.4 When ordinary quotient towers compute completion


**Proof input gap.** For a general finite ideal in a Noetherian ring, the Artin–Rees-to-pro-zero Koszul-homology argument remains to be supplied. The ordinary Artin–Rees theorem is available; the derived tower comparison is a separate assertion.

For finite I generated by a regular sequence, Λ_I M≃Rlim_n(M⊗^L_A A/I^n), using cofinal ideals (f₁^n,…,f_r^n). The same comparison holds for Noetherian A by Artin–Rees. For principal I=(f), it holds for every complex M if A has bounded f-power torsion. Without these hypotheses use the Koszul tower; a general weak-proregular model requires its separate pro-zero theorem.

[StacksMA], §95, Lemmas 95.1–95.2 and Examples 95.3–95.4; tags 091X,0923,09AT,0G3F, pp.271–273; [Prisms], §1.2 Footnote 5, pp.10–11.

*Needs:* Layer 1: The derived Koszul completion tower; the Koszul supplier contract.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.ordinaryQuotientCompletion`.

### 1.5 Completion of animated rings


For an animated A-algebra B and finite I⊂π₀A, construct its derived I-completion as the inverse limit of animated Koszul quotients B⊗^L_(Z[x₁,…,x_r])Z[x₁,…,x_r]/(x₁^n,…,x_r^n), with x_i acting through f_i. Its underlying A-module is Λ_I B; the unit is a map of animated algebras, and the construction is a reflector onto complete animated algebras. Specialize to (p) and (p,d). Limits are taken in animated rings, not degree-zero rings.

[Prisms], §1.2 and Footnote 6, pp.10–11.

*Needs:* Layer 1: The derived completion reflector; Layer 1: The derived Koszul completion tower; `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.animatedRingCompletion`.

Prove the following named laws.

- `ringCompletionUnit`: B→Λ_I B is an animated algebra map with the module completion unit underneath.
- `ringCompletionUnderlying`: The underlying module is the Layer 1 derived completion, including negative cochain degrees.
- `ringCompletionMap`: A map of animated algebras respecting the ideal induces the completed map.
- `ringCompletionIdempotent`: Completing a complete animated algebra gives it back.

**Checks.**

- `test_ring_completion_z`: The p-completion of Z is the ordinary Z_p.
- `test_ring_completion_pd`: The (p,d)-completion of Z[d] is Z_p[[d]], with both generators retained.
- `test_ring_completion_unit`: Completion at the unit ideal is the zero ring.

**Complete flatness and algebraization.**

The reduction criterion controls amplitude, descent and smooth deformation theory. Keep the assumptions that turn complete flatness into ordinary flatness and classical completeness.

### 1.6 Complete flatness and complete faithful flatness


For finite I⊂A, an object M∈D(A) is I-completely flat when M⊗^L_A A/I is a flat A/I-module in degree zero, equivalently M⊗^L_A N is discrete for every I-power-torsion A-module N. It is I-completely faithfully flat if that reduction is faithfully flat. The predicate itself does not require M to be complete. Define finite I-complete Tor-amplitude [a,b] using the derived reduction and all discrete A/I-modules.

[Prisms], §1.2, p.11; [BMS19], Definition 4.1, Lemmas 4.3–4.8, pp.220–223.

*Needs:* `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; Layer 1: Derived ideal completeness.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completeFlatness`.

Prove the following named laws.

- `completeFlatReduction`: Complete flatness is equivalent to flat discrete derived reduction.
- `completeFlatCompletion`: The derived I-completion of a flat A-module is I-completely flat.
- `completeFlatBaseChange`: Derived base change followed by completion preserves complete flatness and complete faithful flatness.
- `completeTorAmplitude`: Amplitude [a,b] means every tensor with a discrete A/I-module has cohomology in [a,b].

**Checks.**

- `test_complete_flat_z`: For a prime p, Z as a Z-module is p-completely flat but is not derived p-complete.
- `test_complete_flat_zp`: Z_p is p-completely faithfully flat over Z.
- `test_complete_flat_fp_boundary`: F_p is not p-completely flat over Z: F_p⊗^L_Z F_p has a nonzero degree −1 term. The analogous Z_p calculation has the same obstruction.

### 1.7 Bounded torsion and complete Tor-amplitude


Assume A has bounded p-power torsion. If M is derived p-complete and has p-complete Tor-amplitude [a,b], then M has ordinary cohomological amplitude [a,b]. Bounded p-power torsion in every cohomology group does not follow from this finite amplitude assumption. The bounded-torsion conclusion below is restricted to the p-completely flat case [a,b]=[0,0]. In particular derived p-complete, p-completely flat M is an ordinary p-adically complete bounded-torsion module with M/p^n flat over A/p^n and M[p^n]≃M⊗_A A[p^n]. Conversely an ordinary p-complete bounded-torsion module satisfying these flatness/torsion conditions is p-completely flat.

[BMS19], Lemmas 4.6–4.7 and Corollary 4.8, published pp.221–223.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Complete flatness and complete faithful flatness; Layer 1: The derived Koszul completion tower.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.boundedTorsionCriterion`.

### 1.8 Complete faithful-flat module descent


Let A→B be a p-completely faithfully flat map of ordinary p-complete rings with bounded p-power torsion. For derived p-complete M, the augmentation M→Tot((M⊗^L_A B•)^∧_p) is an equivalence, where B• is the p-completed derived Čech nerve. Complete flatness and fixed finite p-complete Tor-amplitude are detected after this base change. These statements concern Čech descent; arbitrary hyperdescent is not inferred.

[BMS19], Remark 4.9 and §3 flat-descent argument, pp.215–218,223.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Complete flatness and complete faithful flatness; Layer 1: Bounded torsion and complete Tor-amplitude; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completeFlatDescent`.

### 1.9 Bhatt’s ordinary flatness criterion


Let A be Noetherian, π∈A, and suppose A and an A-algebra B are π-torsion-free and classically π-adically complete. If A/π→B/π is flat, then A→B is flat; if it is faithfully flat, then A→B is faithfully flat. This is the Noetherian algebra criterion of Bhatt Proposition 5.1, not a general identification of complete flatness and ordinary flatness.

[BhattDS], Proposition 5.1 and proof, pp.8–9.

*Needs:* Layer 1: Complete flatness and complete faithful flatness; Layer 1: When ordinary quotient towers compute completion.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.ordinaryFlatnessFromCompleteFlatness`.

### 1.10 Quotient completeness under a nonzerodivisor condition


Let N be an A-module, f,g∈A. If N is classically f-adically complete and f acts injectively on N/gN, then N/gN is classically f-adically complete. Derived completeness of cokernels supplies the intermediate assertion; f-separatedness follows from injectivity and derived completeness. No unconditional claim that every quotient of a classically complete module is separated is made.

[BMaEtAl], Lemmas 2.7–2.8 and proof, pp.13–14.

*Needs:* Layer 1: Derived ideal completeness.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.quotientCompleteness`.

### 1.11 Elkik algebraization of completely smooth and étale algebras


For an ordinary ring A, finite-generated I⊂A and a derived I-complete animated A-algebra R, if R⊗^L_A A/I is a discrete smooth (respectively étale) A/I-algebra, then R is the derived I-completion of a smooth (respectively étale) ordinary A-algebra R′. Conversely such completions are completely smooth (respectively étale). No Noetherian hypothesis is imposed in the derived deformation-theoretic proof of BS Footnote 6.

[Prisms], §1.2 Footnote 6 and Lemma 2.18 usage, pp.10–11,17; [StacksLift], Proposition 16.3.2, Tag 07M8, pp.5–6 of Smoothing Ring Maps.

*Needs:* Layer 1: Completion of animated rings; Layer 1: Complete flatness and complete faithful flatness; Layer 1: The derived Koszul completion tower; Layer 0: Cotangent obstruction theory for square-zero lifts; Layer 0: The smooth cotangent computation.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completelySmoothAlgebraization`.

**Filtered modules, Rees objects and tensor.**

Filtrations are coherent diagrams in the enhanced category. Their reflection and monoidal structure must retain the underlying object, cofibers, shifts and universal properties.

### 1.12 Coherent filtered modules


For a commutative ring A define DF(A)=Fun(Z^op,D(A)) in the stable enhanced category. A filtered object F has F^i→F^(i−1), underlying object colim_(i→−∞)F^i, and gr^iF=cofib(F^(i+1)→F^i). Filtration shifts satisfy (F{n})^i=F^(i+n). Increasing filtrations are reindexed explicitly. This is a category of coherent diagrams; a diagram in the ordinary triangulated derived category does not encode the same data.

[BMS19], §5.1, p.233, with gr^i=cofib(F^(i+1)→F^i); [GP], Definitions 2.1–2.3, pp.5–7, reindex by i↦−i.

*Needs:* `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.filteredModules`.

Prove the following named laws.

- `filtrationAt`: Evaluation F↦F^i is exact.
- `associatedGraded`: gr^iF=cofib(F^(i+1)→F^i).
- `filteredShift`: F{n} has i-th value F^(i+n) and shifts the graded pieces by the same convention.
- `filteredMapExt`: A map of coherent filtered objects is an equivalence iff every evaluation is an equivalence.

**Checks.**

- `test_filtered_step`: For the step filtration F^i=M for i≤0 and 0 for i>0, gr⁰=M and all other graded pieces vanish.
- `test_filtered_constant`: A nonzero constant filtration has every graded piece zero although its underlying object is nonzero.
- `test_filtered_shift`: For the preceding step F, F{1} has its sole graded piece in index −1.

### 1.13 Completion of a filtered object


A coherent decreasing filtration F is complete when Rlim_(i→+∞)F^i=0. Its reflection is (F^∧)^i=cofib(Rlim_jF^j→F^i); its underlying object is Rlim_i(cofib(F^i→F)), where F=colim_(i→−∞)F^i. Completion leaves every gr^i unchanged and gr is conservative on complete filtrations. Colimits in complete filtered modules are formed by completing colimits in DF(A). Classical separatedness alone does not imply this completeness.

[GP], Definition 2.8, Lemma 2.9, Proposition 2.14, Lemma 2.15, pp.6–7; [BMS19], Lemma 5.2, pp.233–234.

*Needs:* Layer 1: Coherent filtered modules; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.filteredCompletion`.

Prove the following named laws.

- `filteredCompletionUnit`: F→F^∧ is universal among maps to complete filtered objects.
- `filteredCompletionGraded`: gr^iF≃gr^i(F^∧) for every i.
- `filteredCompletionIdempotent`: (F^∧)^∧≃F^∧.
- `gradedDetectsComplete`: A map between complete filtered objects is an equivalence exactly when all its graded maps are equivalences.

**Checks.**

- `test_filtered_complete_step`: The step filtration of an object is already complete.
- `test_filtered_complete_constant`: The completion of a nonzero constant filtration is zero.
- `test_filtered_separated_boundary`: The t-adic filtration of k[t] is classically separated; its completed underlying object is k[[t]], so it is not derived complete as a filtered object.

### 1.14 The Rees description of filtered modules


For a coherent decreasing filtration F, define its Rees graded A[t]-module with grading-deg(t)=1 by degree −i term F^i and t-action the transition F^i→F^(i−1). This yields a symmetric monoidal equivalence DF(A)≃D_gr(A[t]). Derived quotient by t has degree −i term gr^iF, and inversion of t recovers the underlying object after forgetting weights. Filtered completeness corresponds to derived t-completeness in the graded category; it is not completeness of the ungraded direct sum.

[FGauges], §2.2.1, Proposition 2.2.6 and inverse, Remark 2.2.7, pp.13–17.

*Needs:* Layer 1: Coherent filtered modules; Layer 1: Completion of a filtered object; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.reesDescription`.

### 1.15 Completed filtered tensor products


Define (F⊗_filG)^n=colim_(i+j≥n)(F^i⊗^L_A G^j) by Day convolution. On complete filtered objects use F⊗̂_filG=(F⊗_filG)^∧. These form a symmetric monoidal category; gr^n(F⊗̂_filG)≃⊕_(i+j=n)gr^iF⊗^L_A gr^jG. The tensor unit is the step filtration of A. Complete filtered algebras and their modules use this tensor, not levelwise tensor.

[GP], §2.23, Theorem 2.25, Proposition 2.26, pp.9–10; [BMS19], §5.1 and Lemma 5.2, pp.233–234.

*Needs:* Layer 1: Coherent filtered modules; Layer 1: Completion of a filtered object; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completedFilteredTensor`.

Prove the following named laws.

- `filteredTensorAt`: The n-th term is the colimit over i+j≥n before completion.
- `filteredTensorGraded`: The n-th graded piece is the direct sum of tensor products with i+j=n.
- `filteredTensorUnit`: The step filtration of A is the tensor unit.
- `filteredTensorSteps`: The tensor of steps in weights i,j is the step of the module tensor in weight i+j.

**Checks.**

- `test_filtered_tensor_unit`: Tensor with the step filtration of A returns F.
- `test_filtered_tensor_two_steps`: Two filtrations with sole graded pieces A in weight 1 have tensor with sole graded piece A in weight 2.
- `test_filtered_tensor_derived`: For step filtrations of F_p over Z_p, the tensor has the degree −1 Tor term of F_p⊗^L_ZpF_p, so ordinary module tensor is wrong.

**The Beilinson heart and limit estimates.**

The heart consists of actual complexes, including nonzero acyclic ones. It therefore has a different Ext calculation from the localized derived category. Connectivity estimates justify the particular limit exchanges needed in descent.

### 1.16 The Beilinson t-structure


DF(A) has the Beilinson t-structure with DF≤0_Beil={F:gr^iF∈D≤i(A) for all i} and DF≥0_Beil={F:F^i∈D≥i(A) for all i}. On complete filtered objects the latter can equivalently be tested on gr^iF∈D≥i. These conventions use cohomological grading and decreasing filtrations.

[BMS19], Theorem 5.4, pp.234–235; [BL22], Appendix D, Definition D.3, Proposition D.4 and Remark D.6, pp.229–230.

*Needs:* Layer 1: Coherent filtered modules; Layer 1: Completion of a filtered object; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.beilinsonTStructure`.

### 1.17 The Beilinson heart is the category of complexes


The Beilinson heart is equivalent to the abelian category Ch(A) of actual unbounded cochain complexes. A complex M• maps to its stupid filtration F^i=M≥i with gr^iF=M^i[−i]. Conversely H^i(gr^iF) are its terms, and the connecting maps of adjacent cofibres give a differential squaring to zero. Acyclic complexes can be nonzero in this heart.

[BMS19], Theorem 5.4(3) and proof, pp.234–237 (Remark 5.5 concerns décalage); [BL22], Appendix D, Example D.8, pp.230–231.

*Needs:* Layer 1: The Beilinson t-structure; Layer 1: Coherent filtered modules; [`CochainComplex.of`][lib-3].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.beilinsonHeart`.

### 1.18 Ext groups in the category of complexes


For ordinary A-modules M,N regarded as cochain complexes in degree zero and integers i≥0,c, Ext^i_(Ch(A))(M,N[c])=0 if c>0, while for c≤0 it is naturally Ext^(i+c)_A(M,N), with negative-degree Ext defined to be zero. This is BMS2 Proposition 5.6; it is not an Ext computation in D(A) after quotienting acyclic complexes.

[BMS19], Proposition 5.6 and proof, pp.237–238, with the cohomological Ext indexing below.

*Needs:* Layer 1: The Beilinson heart is the category of complexes; Layer 1: The Beilinson t-structure; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.complexHeartExt`.

### 1.19 The weak Postnikov tower lemma


Let S be connective and K∈D(S) have a weak Postnikov tower K_n with K≃Rlim_nK_n and fibre(K_n→K_(n−1)) n-connective in homological grading. For an exact t-exact functor F:D(S)→D(S′), the canonical map F(K)→Rlim_nF(K_n) is an equivalence. The uniform connectivity of the fibres is essential; t-exactness does not assert preservation of every inverse limit.

[BMS19], Lemma 3.3 and proof, pp.217–218.

*Needs:* `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.weakPostnikovTowers`.

### 1.20 Valid exchanges of completion and derived operations


Derived ideal and filtered completion are exact and commute with limits on complete objects through their reflector descriptions. A perfect A-complex P satisfies P⊗^L_A Λ_I M≃Λ_I(P⊗^L_A M). A filtered colimit in the complete category is completed after the raw colimit. For a uniformly cohomologically bounded-below cosimplicial diagram, filtered colimits commute with its totalization degreewise; the connectivity bound is necessary. The Milnor exact sequence 0→lim¹ H^(j−1)M_n→H^j(Rlim M_n)→lim H^jM_n→0 retains the derived-limit term.

[StacksMA], §93 and §95; completion and Milnor computations, pp.261–268,271–275; [BMS19], Example 5.12 and Lemma 3.3, pp.217–218,240; [GP], Lemma 2.9 and Proposition 2.14, pp.6–7.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Completion of a filtered object; Layer 1: Completed filtered tensor products; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`; [`DerivedCategory.isIso_iff`][lib-41].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completionExchanges`.

### 1.21 The quasisyntomic cotangent condition


Fix a prime p. A quasisyntomic ring A is ordinary p-adically complete, has bounded p-power torsion, and has L_(A/Z)⊗^L_A A/p of Tor amplitude [−1,0]. For two such rings, A→B is a quasisyntomic map when it is p-completely flat and L_(B/A)⊗^L_B B/p has Tor amplitude [−1,0]; a cover is p-completely faithfully flat. In these conditions A/p and B/p are ordinary quotient rings, while the displayed module tensors are derived. The absolute condition and the morphism condition must be kept distinct.

[BMS19], Definitions 4.1 and 4.10, Remark 4.11, Example 4.12, Lemmas 4.15–4.17; published pp.220,223–225.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Avramov’s absolute complete-intersection criterion; Layer 1: Complete flatness and complete faithful flatness; Layer 1: Bounded torsion and complete Tor-amplitude; [`IsAdicComplete`][lib-46].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.quasisyntomicCondition`.

Prove the following named laws.

- `quasisyntomicCover`: A quasisyntomic map is a cover precisely when its mod-p map is faithfully flat.
- `quasisyntomicComp`: Composites and p-completed base changes of quasisyntomic maps are quasisyntomic, with bounded-torsion hypotheses inherited from the objects.
- `quasisyntomicNoetherianLci`: A p-complete Noetherian lci ring is a quasisyntomic object by Avramov’s criterion and bounded torsion.
- `quasisyntomicRelative`: For a map between the specified QSyn objects, quasisyntomicity means both p-complete flatness and Tor-amplitude [-1,0] of the actual relative cotangent complex after derived reduction mod p. Object membership is a separate hypothesis; BMS2 Definition 4.10 and Lemma 4.16 govern maps and their composition/base change.

**Checks.**

- `test_qsyn_zp`: Z_p is quasisyntomic.
- `test_qsyn_fp_map_boundary`: F_p is a quasisyntomic object, but both Z→F_p and Z_p→F_p fail p-complete
  flatness: derived tensor with F_p has a nonzero Tor₁=F_p. Hence Z_p→F_p is
  not a quasisyntomic map. The absolute Z formulation and the completed Z_p
  formulation give the same object condition.
- `test_qsyn_smooth`: A p-completed smooth finitely presented algebra over a bounded-torsion quasisyntomic base gives a quasisyntomic map.

### Examples

The zero ideal makes every complex complete, whereas the unit ideal admits only the zero complete complex. Z is p-completely flat but is not p-complete; F_p as a Z-module fails complete flatness because Tor₁ is nonzero. The filtered step in weight one fixes the Rees degree −1 and the direction of multiplication by t.

### Dependencies

Layer 0 cotangent and derived powers; the Koszul supplier contract; enhanced limits and tensors from EnhancedDerivedSheaves. The quasisyntomic condition uses this layer’s complete flatness and bounded-torsion criterion.

## Layer 2: Ordinary and derived de Rham cohomology


**Presenting differential forms.**

Use the existing forms, and present them as A-modules so that coefficient differentiation is scalar-correct. The quotient presentation must prove both surjectivity and the whole kernel, including degree zero and strict alternation in characteristic two.

Sources for this subsection: [StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

### 2.1 Relations for ordinary differential symbols


Let Sₙ be the free A-module on pairs (c,v) with c∈B and v:{1,…,n}→B, written [c;v]. Define Rₙ⊂Sₙ as the A-span of six families: [c+e;v]−[c;v]−[e;v]; [ac;v]−a[c;v] for a∈A; slot additivity [c;v(i↦x+y)]−[c;v(i↦x)]−[c;v(i↦y)]; slot Leibniz [c;v(i↦xy)]−[cx;v(i↦y)]−[cy;v(i↦x)]; [c;v(i↦a)] for a∈A; and [c;v] when v_i=v_j with i≠j. There is no B-linearity requirement in the coefficient before applying d.

*Needs:* [`KaehlerDifferential.kerTotal`][lib-12]; [`exteriorPower.presentation`][lib-22].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.symbolRelations`.

Prove the following named laws.

- `symbolRelations_eq_span`: Rₙ is exactly the A-span of the six explicitly displayed relation families.
- `symbolRelations_coeff_add`: Coefficient additivity belongs to Rₙ.
- `symbolRelations_slot_mul`: The slot Leibniz relation belongs to Rₙ for every slot.

**Checks.**

- `test_relations_degree_zero`: Over Z, [0;()] belongs to R₀ and [1;()] does not. The quotient has its nonzero degree-zero unit.
- `test_relations_constant_slot`: A differential slot filled with an element from A is zero in the quotient; over Z[X], [1;X] is not a relation, since dX is nonzero. Taking every symbol as a relation fails.
- `test_relations_diagonal_char_two`: Over F₂, the diagonal degree-two symbol is itself a relation, not merely twice that symbol.

### 2.2 Evaluation of differential symbols


Define qₙ:Sₙ→Ωⁿ as the A-linear map [c;v]↦c·Dv₁∧…∧Dvₙ. In degree zero it sends [c;()] to c under Ω⁰≃B.

*Needs:* [`Finsupp.linearCombination`][lib-10]; [`KaehlerDifferential.D`][lib-11]; [`exteriorPower.ιMulti`][lib-24]; [`exteriorPower.zeroEquiv`][lib-23].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.symbolMap`.

Prove the following named laws.

- `symbolMap_single`: qₙ([c;v])=c Dv₁∧…∧Dvₙ.
- `symbolMap_add`: qₙ is additive.
- `symbolMap_smul`: For a∈A, qₙ(a s)=a qₙ(s).

**Checks.**

- `test_symbolMap_zero_degree`: Evaluation in weight zero agrees with the existing zeroEquiv.
- `test_symbolMap_one_degree`: Evaluation in weight one agrees with c times the universal derivation.
- `test_symbolMap_repeated`: The image of [c;x,x] is zero in every characteristic.

### 2.3 Differential symbols generate all forms


The map qₙ is surjective for every n≥0; equivalently the forms c Dv₁∧…∧Dvₙ span Ωⁿ as an A-module.

*Needs:* Layer 2: Evaluation of differential symbols; [`KaehlerDifferential.span_range_derivation`][lib-16]; [`exteriorPower.ιMulti_span_of_span`][lib-25]; [`exteriorPower.zeroEquiv`][lib-23].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.symbolMap_surjective`.

### 2.4 The differential-symbol presentation


For every n, ker(qₙ)=Rₙ. Thus Sₙ/Rₙ is canonically Ωⁿ as an A-module, including n=0.

*Needs:* Layer 2: Relations for ordinary differential symbols; Layer 2: Evaluation of differential symbols; Layer 2: Differential symbols generate all forms; [`KaehlerDifferential.quotKerTotalEquiv`][lib-15]; [`exteriorPower.presentation`][lib-22]; [`Submodule.liftQ`][lib-19]; [`Module.Presentation.restrictScalars`][lib-17].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.symbolRelations_ker`.

**Constructing the differential.**

Descend the free-symbol rule by checking each relation, then prove uniqueness, square-zero and the graded product identity. The leading differentiated coefficient is the first wedge slot.

Sources for this subsection: [StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

### 2.5 Differentiating a free differential symbol


Define δₙ:Sₙ→Ωⁿ⁺¹ as the A-linear map [c;v]↦Dc∧Dv₁∧…∧Dvₙ. This uses the coefficient as the first slot, with positive sign.

*Needs:* [`Finsupp.linearCombination`][lib-10]; [`KaehlerDifferential.D`][lib-11]; [`exteriorPower.ιMulti`][lib-24].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.freeDifferential`.

Prove the following named laws.

- `freeDifferential_single`: δₙ([c;v])=Dc∧Dv₁∧…∧Dvₙ.
- `freeDifferential_add`: The free differential preserves sums.
- `freeDifferential_smul`: The free differential is A-linear on free-module coefficients.

**Checks.**

- `test_freeDifferential_unit`: Symbols with coefficient one have zero differential.
- `test_freeDifferential_zero_degree`: In weight zero the free differential agrees with D after oneEquiv.
- `test_freeDifferential_diagonal`: δ₁([x;x])=Dx∧Dx=0, while over Z[X,Y], δ₁([X;Y])=dX∧dY≠0. This also detects a zero differential in positive weights and fixes the positive leading-slot sign.

### 2.6 The free differential kills every relation


For every n, Rₙ⊂ker(δₙ), so δₙ depends only on the represented ordinary form.

*Needs:* Layer 2: Relations for ordinary differential symbols; Layer 2: Differentiating a free differential symbol; [`Derivation.leibniz`][lib-4]; [`Derivation.map_algebraMap`][lib-6]; [`AlternatingMap.map_eq_zero_of_eq`][lib-1]; [`AlternatingMap.map_swap`][lib-2].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.freeDifferential_relations`.

### 2.7 The ordinary de Rham differential


For every n≥0 define dₙ:Ωⁿ→Ωⁿ⁺¹, A-linear, as the descent of δₙ along qₙ. It is characterised by dₙ(c Dv₁∧…∧Dvₙ)=Dc∧Dv₁∧…∧Dvₙ. The scalar ring is A; in general it is not B-linear.

*Needs:* Layer 2: The differential-symbol presentation; Layer 2: The free differential kills every relation; Layer 2: Differential symbols generate all forms; [`Submodule.liftQ`][lib-19]; [`exteriorPower.oneEquiv`][lib-21]; [`KaehlerDifferential.polynomialEquiv_D`][lib-14]; [`Polynomial.derivative_X`][lib-18]; [`KaehlerDifferential.mvPolynomialBasis`][lib-13].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.d`.

Prove the following named laws.

- `d_add`: dₙ(α+β)=dₙα+dₙβ.
- `d_base_smul`: For a∈A, dₙ(aα)=a dₙα.
- `d_zero_degree`: Transport d₀ along Ω⁰≃B and Ω¹≃Ω to recover the pinned universal derivation.

**Checks.**

- `test_d_base_constant`: The differential of the image of a base-ring constant is zero.
- `test_d_polynomial_X`: The differential of X in Z[X] over Z is nonzero, so the zero operator fails.
- `test_d_polynomial_X_char_two`: The differential of X in F₂[X] over F₂ is still nonzero.
- `test_d_two_variables`: In Z[X,Y], d(X dY)=dX∧dY and this two-form is nonzero. This detects a zero positive-degree differential and fixes the leading-slot sign.

### 2.8 Differential of an elementary form


dₙ(c Dv₁∧…∧Dvₙ)=Dc∧Dv₁∧…∧Dvₙ, for every n including zero.

*Needs:* Layer 2: The ordinary de Rham differential; Layer 2: Evaluation of differential symbols; Layer 2: Differentiating a free differential symbol.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.d_elementary`.

### 2.9 Uniqueness from elementary forms


An A-linear map Ωⁿ→Ωⁿ⁺¹ satisfying the displayed elementary-form rule equals dₙ.

*Needs:* Layer 2: Differential symbols generate all forms; Layer 2: Differential of an elementary form.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.d_unique`.

### 2.10 The de Rham differential squares to zero


For every n, dₙ₊₁∘dₙ=0 as an A-linear map Ωⁿ→Ωⁿ⁺².

*Needs:* Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms; [`Derivation.map_one_eq_zero`][lib-7].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.d_squared`.

### 2.11 The graded Leibniz identity


For α∈Ωᵐ and β∈Ωⁿ, d(α∧β)=dα∧β+(−1)ᵐα∧dβ. The product is the existing graded multiplication of the exterior algebra.

*Needs:* Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms; [`Derivation.leibniz`][lib-4]; [`ExteriorAlgebra.gradedAlgebra`][lib-9]; [`AlternatingMap.map_swap`][lib-2].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.d_leibniz`.

### 2.12 The ordinary algebraic de Rham complex


Define Ω•_(B/A) as the nonnegative cochain complex of A-modules with degree n object Ωⁿ and differential dₙ. Its multiplication is the existing wedge product and satisfies the graded Leibniz identity. This is the ordinary complex, not a claim of a derived smooth comparison in characteristic zero.

*Needs:* Layer 2: The ordinary de Rham differential; Layer 2: The de Rham differential squares to zero; Layer 2: The graded Leibniz identity; [`CochainComplex.of`][lib-3].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.complex`.

Prove the following named laws.

- `complex_d_apply`: The adjacent differential of Ω• is dₙ.
- `complex_d_nonadjacent`: Every nonadjacent differential is zero.
- `complex_X`: The object in degree n is the existing module Ωⁿ, restricted to A.

**Checks.**

- `test_complex_degree_zero`: The first arrow agrees with the universal derivation after the existing degree-one equivalence.
- `test_complex_two_steps`: The first two arrows compose to zero on each b.
- `test_complex_base_ring`: Over A→A the first differential is zero.

**Pullback and the ordinary universal property.**

Extend the existing semilinear Kähler map to exterior powers. The resulting complex maps and differential-algebra universal property are the functorial input for animation.

### 2.13 Pullback of ordinary differential forms


For an A-algebra homomorphism f:B→C, extend the pinned KaehlerDifferential.mapSemilinear to f-semilinear maps f*ₙ:Ωⁿ_(B/A)→Ωⁿ_(C/A). On elementary forms, c Dv₁∧…∧Dvₙ maps to f(c)D(fv₁)∧…∧D(fvₙ). These are A-linear as well, but in general are not B-linear for an unrelated B-action on C.

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* [`KaehlerDifferential.mapSemilinear`][lib-26]; [`KaehlerDifferential.mapSemilinear_D`][lib-27]; [`exteriorPower.alternatingMapLinearEquiv`][lib-20].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.pullback`.

Prove the following named laws.

- `pullback_smul`: Pullback is f-semilinear in B-scalars.
- `pullback_base_smul`: Pullback is linear in A-scalars.
- `pullback_add`: Pullback preserves sums of forms.

**Checks.**

- `test_pullback_zero_degree`: Degree-zero pullback agrees with f under the existing zero equivalence.
- `test_pullback_one_degree`: Degree-one pullback agrees with the pinned Kaehler mapSemilinear.
- `test_pullback_identity_two`: The identity fixes an arbitrary degree-two form.

### 2.14 Pullback on elementary differential forms


Pullback sends c Dv₁∧…∧Dvₙ to f(c) D(fv₁)∧…∧D(fvₙ).

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* Layer 2: Pullback of ordinary differential forms; [`KaehlerDifferential.mapSemilinear_D`][lib-27].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.pullback_elementary`.

### 2.15 Pullback commutes with the differential


For every A-algebra map f:B→C and n, f*ₙ₊₁(dₙω)=dₙ(f*ₙω).

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms; Layer 2: Pullback on elementary differential forms.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.pullback_d`.

### 2.16 Pullback preserves wedge products


For every A-algebra homomorphism f, f*(α∧β)=f*α∧f*β, with the existing exterior products.

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all forms; [`ExteriorAlgebra.gradedAlgebra`][lib-9]; Layer 2: Pullback on elementary differential forms.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.pullback_wedge`.

### 2.17 Identity pullback


For every n, pullback along id_B is the identity on Ωⁿ.

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all forms; Layer 2: Pullback on elementary differential forms.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.pullback_id`.

### 2.18 Composition of pullbacks


For f:B→C and g:C→E of A-algebras, pullback along g∘f equals g*∘f* in every degree.

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all forms; Layer 2: Pullback on elementary differential forms.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.pullback_comp`.

### 2.19 The functorial map of ordinary de Rham complexes


An A-algebra homomorphism f:B→C induces a morphism Ω•_(B/A)→Ω•_(C/A) in CochainComplex(ModuleCat A), whose degree-n map is f*ₙ. These maps preserve identities, composition and wedge multiplication.

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336 of Comm. Algebra; [Riou], proposed DeRham/Basic.lean, presentationDifferentialsDown through deRhamComplex, lines 285–434.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: Pullback commutes with the differential; Layer 2: Pullback preserves wedge products; Layer 2: Identity pullback; Layer 2: Composition of pullbacks.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.complexMap`.

Prove the following named laws.

- `complexMap_apply`: The degree-n component is pullback f n.
- `complexMap_id`: The complex map of id is the identity.
- `complexMap_comp`: The complex map of g∘f is the categorical composite of the two complex maps.

**Checks.**

- `test_complexMap_constant`: In degree zero, the complex map takes b to f(b).
- `test_complexMap_identity`: The identity map of B induces the identity in degree one.
- `test_complexMap_d`: The degree-one image of db is d(fb).

### 2.20 Ordinary polynomial base change and Künneth


For an ordinary base square A→A′, B′=B⊗_A A′, the ordinary differential graded de Rham algebra satisfies Ω•_(B/A)⊗_A A′≃Ω•_(B′/A′), with its ordinary tensor and Hodge filtration. For polynomial A-algebras B,C, Ω•_(B⊗_A C/A)≃Ω•_(B/A)⊗_AΩ•_(C/A), including the signed differential and degree-sum filtration. In the polynomial case these complexes are termwise flat, so the derived tensor computes the same object. The ordinary formula does not justify replacing a derived algebra pushout by an ordinary pushout outside Tor independence.

[Bhatt12], Proposition 2.7 proof, p.6.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: The functorial map of ordinary de Rham complexes; Layer 2: The graded Leibniz identity; Layer 2: Pullback of ordinary differential forms; [`KaehlerDifferential.D`][lib-11].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.ordinaryBaseChangeKunneth`.

### 2.21 The universal differential graded algebra


For an ordinary A-algebra B, Ω•_(B/A) is initial among nonnegatively graded strictly graded-commutative differential graded A-algebras D with odd squares zero and an A-algebra map B→D⁰. The unique dg map sends b to its degree-zero image and db to its differential, hence b₀ db₁∧…∧db_n to f(b₀)d f(b₁)…d f(b_n). The odd-square condition is part of the target even in characteristic 2.

[Prisms], §4, construction of the Hodge–Tate map after Lemma 4.10, pp.39–40; [StacksDR], Section 10.132, differential construction, pp.334–336 of Comm. Algebra.

*Needs:* Layer 2: The differential-symbol presentation; Layer 2: Differential of an elementary form; Layer 2: The de Rham differential squares to zero; Layer 2: The graded Leibniz identity; Layer 2: The ordinary algebraic de Rham complex.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.ordinaryDeRhamUniversalProperty`.

**Polynomial realization and the Hodge filtration.**

Extend polynomial differential algebra by animation into the enhanced filtered algebra category. Construct resolution independence and all comparison coherences, rather than just an isomorphism of its underlying complexes.

### 2.22 De Rham cohomology from polynomial resolutions


**Proof input gap.** The sources define the construction and describe resolution independence. A complete supplier argument for independence as a filtered algebra, including coherent comparison maps, remains required.

For a map of animated commutative rings A→B, define dR_(B/A) by the sifted-colimit extension of the polynomial ordinary de Rham functor: for a free resolution P•→B use |Ω•_(P•/A)| with direct sums along antidiagonals. This is a coherent E∞ A-algebra with a decreasing multiplicative Hodge filtration, natural in the base square and independent of a free resolution. No derived Hodge completeness is imposed; its completion is a separate reflection. The construction is not the ordinary smooth de Rham complex over every base.

[Bhatt12], Definition 2.1, its explanatory paragraph and Remark 2.2, p.5.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: The functorial map of ordinary de Rham complexes; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`; Layer 1: Coherent filtered modules.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.ofPolynomialResolution`.

Prove the following named laws.

- `map`: A morphism of A-algebras induces a map of the coherent Hodge-filtered derived de Rham objects, with identity and composition coherences.
- `resolutionEquiv`: Two free simplicial resolutions of B give equivalent Hodge-filtered multiplicative objects; the comparison respects the augmentation and is coherent in maps of resolutions.
- `hodgeFiltration`: The value Fil_H^i is the realization of the subcomplex of polynomial forms of degrees at least i, with decreasing transition maps and multiplication Fil_H^i⊗Fil_H^j→Fil_H^(i+j).

**Checks.**

- `test_identity_algebra`: For A→A, dR_(A/A) is A concentrated in degree zero.
- `test_hodge_zero_quotient`: For an ordinary A-algebra B, the degree-zero Hodge quotient gr_H^0 dR_(B/A) is B in degree zero.
- `test_rational_laurent_boundary`: For Q→Q[t,t⁻¹], uncompleted dR is Q, whereas ordinary degree-one de Rham cohomology is Q·dt/t. The unrestricted uncompleted smooth comparison fails.

### 2.23 Derived base change and Künneth


There are natural equivalences dR_(B⊗^L_A C/A)≃dR_(B/A)⊗^L_A dR_(C/A) and dR_(B/A)⊗^L_A C≃dR_(B⊗^L_A C/C). All tensor products, including the algebra pushout, are derived. Ring maps A→B and A→C. Interpret B⊗^L_A C as a simplicial commutative algebra unless Tor independence has been established.

[Bhatt12], Proposition 2.7 and proof, p.6.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Ordinary polynomial base change and Künneth; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.baseChangeKunneth`.

### 2.24 Hodge graded pieces of derived de Rham


**Proof input gap.** The animation calculation is located, but the integral power/coherence input used to obtain the enhanced filtered-algebra identification remains the gap in Layer 0.

For A→B animated, gr_H^i dR_(B/A)≃L∧^i_B L_(B/A)[−i] naturally as B-modules for every i≥0. The degree-zero quotient is B. The differential of the filtered algebra induces the universal derivation in the first Hodge boundary; the full de Rham differential is formed before realization, not defined only on cotangent homology.

[BL22], Appendix E, Construction E.2, pp.232–233.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 0: The full cotangent complex; Layer 0: Derived exterior powers; Layer 1: Coherent filtered modules.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.hodgeGradedPieces`.

### 2.25 Hodge-completed derived de Rham


Define dR^hc_(B/A)=Rlim_i(dR_(B/A)/Fil_H^i), with its complete decreasing filtration as the Layer 1 reflection of the Hodge-filtered object. The natural dR→dR^hc map is universal among maps to complete Hodge-filtered objects and leaves every graded piece L∧^i L_(B/A)[−i] unchanged. Hodge completion and p-completion are different operations.

[BL22], Appendix E, Construction E.14 and Remark E.15, p.235.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge graded pieces of derived de Rham; Layer 1: Completion of a filtered object; Layer 1: Completed filtered tensor products.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.hodgeCompletedDerham`.

Prove the following named laws.

- `hodgeCompletionMap`: The canonical filtered algebra map dR→dR^hc is the Layer 1 reflection unit.
- `hodgeCompletionGraded`: gr_H^i dR^hc≃L∧^i L_(B/A)[−i].
- `hodgeCompletionUniversal`: Maps to complete Hodge-filtered algebras factor through dR^hc in the enhanced mapping space.
- `hodgeCompletionFunctorial`: The unit and completion are coherent in commutative base squares, with completed base-change comparisons under the separate stated hypotheses.

**Checks.**

- `test_hodge_complete_base`: dR^hc_(A/A)=A.
- `test_hodge_complete_rational_laurent`: For Q[t,t⁻¹]/Q, the completed complex is ordinary de Rham, with H¹=Q·dt/t, whereas uncompleted dR=Q.
- `test_hodge_complete_dual_numbers`: For R=F₂[t]/t², the regular-quotient crystalline model is the de Rham complex of
  D=D_(F₂[t])((t²)). Write u_j=γ_(2^j)(t²), j≥1. Its degree-zero ring is
  F₂[t,u₁,u₂,…]/(t⁴,u₁²,u₂²,…), and d(u_j)=0. The Hodge completion contains the
  closed class Σ_(j≥1)u_j, whose terms have weights 2^j; it has no representative
  in D, where every element is a finite polynomial. Thus H⁰(dR)→H⁰(dR^hc) is not
  surjective. The comparison uses [Bhatt12], Theorem 3.27 and the regular PD
  computation, pp.13,16–19; it tests completion rather than separatedness.

### 2.26 p-completed derived de Rham


For A→B define dR̂_(B/A)=Λ_(p)dR_(B/A)=Rlim_n(dR_(B/A)⊗^L_Z Z/p^n). Apply p-completion to every specified filtration term, and use completed tensor for its multiplication. A p-completed increasing conjugate diagram is not automatically exhaustive before a bounded-connectivity argument. For maps of p-completely flat bounded-torsion algebras the mod-p computation uses the ordinary reductions; general reductions are animated.

[Bhatt12], Definition 8.1, Lemmas 8.2–8.3, pp.31–32; [BL22], Appendix E, Construction E.3 and Remark E.4, p.233.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 1: The derived completion reflector; Layer 1: When ordinary quotient towers compute completion; Layer 1: Completed filtered tensor products.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.pCompletedDerham`.

Prove the following named laws.

- `pCompletedDeRhamMod`: The reduction of dR̂ modulo p^n is the derived de Rham reduction, compatibly in n.
- `pCompletedDeRhamInputs`: Completing A and B at p does not change the p-completed de Rham construction with the derived base-change conventions.
- `pCompletedDeRhamKunneth`: The base-change/Künneth comparison uses p-completed derived tensor and animated pushouts.
- `pHodgeCompletionCommute`: Applying p-completion and Hodge completion in either order gives the same specified quotient-limit object, since the relevant completion functors commute with limits.

**Checks.**

- `test_p_derham_identity`: For A=A, dR̂_(A/A) is Λ_p A.
- `test_p_derham_inverted`: For Q_p→Q_p, p-completed de Rham is zero, while Hodge-completed de Rham is Q_p.
- `test_p_derham_fp_over_zp`: For F_p/Z_p, dR̂ is the p-completed PD two-term model in Layer 4, retaining the extra completed torsion summands in H⁰ and the actual two-term differential; it is not just Z_p.

### 2.27 The de Rham algebra of a completely smooth formal algebra


Let A be p-complete with bounded p-power torsion and B a p-completely smooth p-complete A-algebra. Define continuous differentials Ω̂¹_(B/A)=L̂_(B/A) in degree zero, finite projective over B; define Ω̂^n=∧^n_BΩ̂¹ and the continuous differential by d(b₀db₁∧…∧db_n)=db₀∧…∧db_n. These form the p-complete ordinary de Rham dg algebra. Its universal property is among termwise p-complete strictly graded-commutative A-dg algebras with odd squares zero, continuous differential and a continuous map B→D⁰.

[Prisms], §1.2; §4 Hodge–Tate universal map after Lemma 4.10, pp.10–11,39–40.

*Needs:* Layer 1: Elkik algebraization of completely smooth and étale algebras; Layer 1: Complete flatness and complete faithful flatness; Layer 0: The smooth cotangent computation; Layer 2: The universal differential graded algebra; Layer 2: The ordinary algebraic de Rham complex; `SchemeAndStackFoundations:SF.4`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.formalOrdinaryDerham`.

Prove the following named laws.

- `continuousDerivation`: The continuous derivation B→Ω̂¹ agrees with the completed polynomial universal derivation.
- `formalDeRhamUniversal`: A continuous degree-zero map into the stated dg target extends uniquely by b₀db₁…db_n↦f(b₀)df(b₁)…df(b_n).
- `formalDeRhamMap`: Continuous maps of completely smooth formal algebras induce the differential-algebra pullback.
- `formalDeRhamReduction`: Modulo p^n this is the ordinary smooth de Rham algebra of the corresponding finite reduction.

**Checks.**

- `test_formal_derham_base`: For B=A, Ω̂¹=0 and the complex is A.
- `test_formal_derham_coordinate`: For B=Z_p⟨t⟩, d(t)=dt generates the finite projective continuous differential module.
- `test_formal_derham_char_two_square`: Over a 2-complete base, (dt)²=0 in the exterior dg algebra; mere graded commutativity is insufficient.

### 2.28 Derived de Rham transitivity filtrations


For A→B→C animated construct the base-forms filtration on dR_(C/A), whose weight-i graded term is dR_(C/B)⊗^L_B L∧^i_B L_(B/A)[−i]. Its boundary maps encode the Gauss–Manin connection; it does not canonically split. Separately, for composable F_p-algebras, Proposition 3.22 gives an increasing relative conjugate filtration with gr_n=dR_(B/A)⊗^L_(B^(1)) Frob_A^*(Res^C_B(L∧^n_C L_(C/B)[−n])), where Frob_A^* is extension along the base-change map B→B^(1), b↦b⊗1. This uses the Frobenius-descent connection. Finite Hodge quotients and specified completions retain the extension data; no unrestricted de Rham-with-coefficients theory is inferred from Remark 3.23. The relative cotangent exterior power is formed over C; only afterward is it regarded as a B-module for this Frobenius base change.

[Bhatt12], Proposition 3.22 and Remark 3.23, pp.11–12; [BL22], Appendix E, Construction E.2, pp.232–233.

*Needs:* Layer 0: The cotangent transitivity triangle; Layer 0: Exterior powers of a triangle; Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Ordinary polynomial base change and Künneth; Layer 1: Coherent filtered modules; Layer 1: Valid exchanges of completion and derived operations.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.deRhamTransitivity`.

### 2.29 Hodge pieces of a singular hypersurface


For k=F_p and B=k[t]/(t²), the full cotangent complex is [B e --2t→ B dt] in degrees −1,0. Thus gr_H¹ dR_(B/k)=L_(B/k)[−1] has B e in degree zero and B dt in degree one. Its higher Hodge pieces are the derived exterior powers of this two-term complex, with divided powers of the degree −1 generator. For p=2 the displayed differential vanishes; replacing L by Ω¹ loses the nonzero degree-zero Hodge-weight-one term. This is a singular lci algebra, distinguished from the non-lci square-zero example.

[Bhatt12], §3.3, regular quotient computations and Lemma 3.42, pp.17–18.

*Needs:* Layer 0: Regular quotients and two-term models; Layer 0: Derived exterior powers; Layer 0: Derived divided powers; Layer 0: Exterior powers of a triangle; Layer 2: Hodge graded pieces of derived de Rham.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.singularHypersurfaceHodge`.

### Examples

For a polynomial coordinate t, d(t²)=2t dt; at characteristic 2 it is zero although dt is nonzero. The two-coordinate formula d(x dy)=dx∧dy and dy∧dx=−dx∧dy fixes the graded sign without dividing by 2. The rational Laurent line has the ordinary class dt/t, while its uncompleted derived de Rham object is Q. The characteristic-2 PD example above distinguishes Hodge completion from separatedness.

### Dependencies

Layers 0–1 supply cotangent powers, completion and complete filtered tensor. Mathlib and Tau Ceti supply ordinary Kähler, exterior and pullback carriers. Scheme realization is constructed after descent in Layer 5.

## Layer 3: Conjugate filtration and Cartier theory

Use the characteristic-p conjugate filtration to construct Cartier theory and the Frobenius-lift splitting. These then give the singular and rational-completion boundary examples and the smooth comparisons.

### 3.1 Frobenius-linear ordinary differential


Let p be prime and A→B a map of characteristic-p commutative rings. For every b∈B and ω∈Ωⁿ_(B/A), dₙ(bᵖω)=bᵖdₙω. Thus the ordinary differential is linear for the B-action through Frobenius, the algebraic input to the B^(1)-action. p is prime and both A and B have characteristic p, with the given algebra map.

[Bhatt12], Notation 3.1, final paragraph, printed p.6.

*Needs:* Layer 2: The graded Leibniz identity; [`Derivation.leibniz_pow`][lib-5].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DeRham.d_frobenius_smul`.

### 3.2 The conjugate filtration


Construct Fil_i^conj dR_(B/A)=|τ≤i Ω•_(P•/A)| for i≥0, with Fil_−1=0, natural increasing maps, and colim_i Fil_i^conj≃dR_(B/A). Its graded piece is |H^i(Ω•_(P•/A))|[−i]. The filtration is multiplicative and is B^(1)-linear over F_p via Cartier; an exhaustive direct-sum realization is not an unrestricted completed or global convergence assertion. Here P•→B is a free simplicial polynomial resolution. Spectral-sequence applications keep the bounded-below increasing filtration and the further convergence hypotheses stated below.

[Bhatt12], Proposition 2.3, proof and Remark 2.4, p.5.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 1: Coherent filtered modules; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.conjugateFiltration`.

Prove the following named laws.

- `conjugateAt`: The ith stage is |τ≤i Ω•_(P•/A)|, with the canonical maps from truncation.
- `conjugateInclusion`: The map from stage i to stage j for i≤j is induced by cohomological truncation; the maps compose and are natural in A→B.
- `conjugateColimit`: The filtered homotopy colimit over i≥0 of these stages is dR_(B/A). This is an uncompleted exhaustiveness assertion.

**Checks.**

- `test_conjugate_identity`: For A→A, stage zero is A and every successive positive graded piece is zero.
- `test_conjugate_weight_zero`: The zeroth graded piece is |H⁰(Ω•_(P•/A))|, with no cohomological shift.
- `test_conjugate_rational`: For Q→Q[t], every positive conjugate graded piece vanishes and stage zero is Q.

### 3.3 The derived Frobenius twist


For A→B of F_p-algebras define B^(1)=B⊗^L_(A,Frob_A) A, together with the relative Frobenius B^(1)→B. The derived de Rham complex and its conjugate filtration are naturally B^(1)-linear. The ordinary Frobenius twist computes this pushout when Tor_i^A(B,Frob_*A)=0 for every i>0. Without Tor independence the twist retains its higher homotopy.

[Bhatt12], Notation 3.1 and following paragraph, p.6; [Bhatt12], Proposition 3.5 statement, p.7.

*Needs:* `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.frobeniusTwist`.

Prove the following named laws.

- `relativeFrobenius`: The canonical map B⊗^L_(A,Frob_A)A→B is induced at polynomial level by b⊗a↦bᵖf(a).
- `twistMap`: A map B→C of A-algebras induces B^(1)→C^(1) and a commuting square with the two relative Frobenius maps.
- `twistUnderived`: If Tor_i^A(B,Frob_*A)=0 for all i>0, the derived twist agrees with the ordinary tensor-product twist, compatibly with relative Frobenius.

**Checks.**

- `test_twist_base`: For B=A, B^(1)=A⊗^L_(A,Frob_A)A is canonically A and the relative Frobenius is the identity under this identification.
- `test_twist_polynomial`: For B=F_p[t] over F_p, the derived twist is the ordinary polynomial algebra and relative Frobenius sends its coordinate t to tᵖ.
- `test_twist_no_underived_shortcut`: Let A=F_p[ε]/ε² and B=F_p. For p≥2, Tor₁^A(B,Frob_*A) is nonzero (indeed isomorphic to Frob_*A as an A-module with ε acting by zero); therefore B^(1) has positive homotopy and cannot be replaced by its ordinary tensor product.

**Cartier isomorphisms and convergence.**

First calculate inverse Cartier on polynomial generators, then extend it to derived graded pieces and smooth algebras. The graded identification is canonical; spectral-sequence convergence needs its own estimate.

### 3.4 The polynomial Cartier map


For a free (polynomial) algebra F over an F_p-algebra A, construct the canonical isomorphism of F^(1)-modules C^{-1}:∧^k L_(F^(1)/A)≃H^k(Ω*_(F/A)) for every k, extending to a graded F^(1)-algebra isomorphism ⊕_k ∧^k L_(F^(1)/A)[−k]→⊕_k H^k(Ω*_(F/A))[−k] (for polynomial F^(1), ∧^k L_(F^(1)/A)=Ω^k_(F^(1)/A)). In one variable, applying the source recipe with the lift t↦t^p gives dt↦[t^{p−1}dt] in degree one; that formula is a consequence of the recipe and is not displayed in the source. The canonical assertion is on cohomology; a chain-level splitting obtained from a lift may depend on choices.

[Bhatt12], Theorem 3.2, proof and Remark 3.3, p.7.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 3: The derived Frobenius twist; Layer 2: The graded Leibniz identity.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.polynomialCartier`.

### 3.5 Derived Cartier graded pieces


For every map A→B of F_p-algebras, gr^conj_i dR_(B/A)≃L∧^i L_(B^(1)/A)[−i], naturally as B^(1)-modules. The exterior power and Frobenius twist are derived. A→B is a map of F_p-algebras. Use the common cotangent complex and derived exterior-power construction from Layer 0.

[Bhatt12], Proposition 3.5 and proof, p.7.

*Needs:* Layer 3: The conjugate filtration; Layer 3: The derived Frobenius twist; Layer 3: The polynomial Cartier map; Layer 0: The full cotangent complex; Layer 0: Derived exterior powers.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.conjugateGradedCartier`.

### 3.6 The classical smooth Cartier isomorphism


For any F_p-algebra A and a smooth A-algebra B, inverse Cartier gives ∧^i_(B^(1))Ω¹_(B^(1)/A)≃H^i(Ω•_(B/A)), as B^(1)-modules and graded algebras. The ordinary Frobenius twist suffices here because B/A is flat. Over an arbitrary characteristic-p field this is the relative Cartier theorem, including imperfect fields and the actual relative twist.

[Bhatt12], Theorem 3.2 and Remark 3.4 with proof, p.7.

*Needs:* Layer 3: The polynomial Cartier map; Layer 3: The derived Frobenius twist; Layer 0: The smooth cotangent computation; Layer 0: Derived base change of the cotangent complex; Layer 2: Ordinary polynomial base change and Künneth.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.smoothCartier`.

### 3.7 The conjugate spectral sequence and convergence


For A→B over F_p the increasing exhaustive filtration gives the exact-couple spectral sequence with E₁^(i,j)=H^(i+j)(L∧^i L_(B^(1)/A)[−i])=H^j(L∧^i L_(B^(1)/A)), abutting conditionally to H^(i+j)dR_(B/A). Strong convergence in a given degree is asserted when only finitely many filtration indices contribute there (for example a bounded smooth affine complex); alternatively state and prove the needed complete/lim¹ conditions. Global and completed variants retain their actual totalization and convergence hypotheses.

[Bhatt12], Proposition 2.3 and Remark 2.4; Proposition 3.5, pp.5,7; [GP], Proposition 2.18, pp.7–8.

*Needs:* Layer 3: The conjugate filtration; Layer 3: Derived Cartier graded pieces; Layer 1: Coherent filtered modules; Layer 1: Valid exchanges of completion and derived operations; `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.conjugateSpectralSequence`.

Prove the following named laws.

- `conjugateSpectralE1`: E₁^(i,j)=H^j(L∧^iL_(B^(1)/A)).
- `conjugateSpectralFunctorial`: Base-compatible algebra maps induce maps of exact couples and spectral sequences.
- `conjugateSpectralFiniteConvergence`: Finite contribution in each total degree gives a separated exhaustive finite filtration on the abutment.
- `conjugateSpectralCompletion`: Filtered reflection leaves the cofiber exact couple unchanged; the abutment still requires its own convergence check.

**Checks.**

- `test_conjugate_spectral_base`: For A→A, only E₁^(0,0)=A is nonzero.
- `test_conjugate_spectral_line`: For F_p[t]/F_p, weights 0,1 compute the classical Cartier modules in total degrees 0,1.
- `test_conjugate_spectral_nonlci`: For B=F_p[x,y]/(x,y)², uncompleted dR has unbounded negative cohomology; a first-quadrant bounded smooth convergence argument cannot apply.

### 3.8 Regular quotient divided-power calculations


Let A→B=A/I be a regular-sequence quotient of F_p-algebras. Put B^(1)=B⊗^L_(A,Frob_A)A; in the Tor-independent case this is A/(f₁^p,…,f_r^p). Then L_(B^(1)/A)≃(I^(1)/(I^(1))²)[1], and gr_i^conj dR_(B/A)≃Γ^i_(B^(1))(I^(1)/(I^(1))²), in degree zero. Hence dR_(B/A) is discrete by exhaustive realization. The eventual identification with the classical PD envelope is owned only by Layer 4.

[Bhatt12], Lemma 3.42 and Remark 3.43 and the regular quotient computation §§3.3, pp.17–18.

*Needs:* Layer 0: Regular quotients and two-term models; Layer 0: Exterior powers of a triangle; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate filtration.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.regularQuotientDividedPowers`.

**Extension classes and chosen splittings.**

The first conjugate extension encodes a lifting obstruction. Compatible Frobenius lifts can split the whole filtration, with the dependence on those choices retained.

### 3.9 The first conjugate extension and W₂ lifting


For A→B over F_p, the extension B^(1)→Fil₁^conj dR_(B/A)→L_(B^(1)/A)[−1] determines an Ext² obstruction class. Given a compatible W₂ lift of A, this is the obstruction to a compatible W₂ lift of the Frobenius-twisted B as in Bhatt Proposition 3.15. The first conjugate extension need not split; a canonical isomorphism of graded pieces does not supply a canonical splitting.

[Bhatt12], Proposition 3.15 and Remark 3.16, pp.9–10.

*Needs:* Layer 0: Cotangent obstruction theory for square-zero lifts; Layer 3: The conjugate filtration; Layer 3: Derived Cartier graded pieces.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.cartierExtensionObstruction`.

### 3.10 A splitting from compatible Frobenius lifts


If a map A→B of F_p-algebras has compatible flat Z/p² lifts and compatible lifts of the absolute Frobenius on both rings, these choices produce a multiplicative splitting dR_(B/A)≃⊕_(i≥0)L∧^iL_(B^(1)/A)[−i] of the conjugate filtration. The chain-level splitting depends on the lift data; the cohomological Cartier map is canonical. Liftability and Frobenius compatibility are retained.

[Bhatt12], Proposition 3.17 and proof, pp.10–11.

*Needs:* Layer 3: The polynomial Cartier map; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate filtration.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.frobeniusLiftSplitting`.

### 3.11 The square-zero non-lci quotient


**Proof input gap.** The failure of Tor-amplitude [−1,0] does not imply unbounded homology. The stated unbounded example needs the stronger eventual André–Quillen vanishing criterion and its residue-coefficient argument; Avramov’s finite-flat-dimension theorem supplies a route whose bridge remains to be built.

For k=F_p and B=k[x,y]/(x²,xy,y²), L_(B/k) is unbounded in negative cohomological degrees. The polynomial-presentation complex [I/I²→B dx⊕B dy] computes only τ≥−1L; it cannot replace the full complex. The quotient has a flat Z/p² lift with the same equations and a compatible p-power Frobenius lift; derived Cartier then makes dR_(B/k) unbounded on the left. Classical crystalline cohomology, computed as sheaf cohomology in nonnegative degrees, cannot be equivalent to this object.

[Bhatt12], Example 3.21, printed p.11.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Degree zero and the naive cotangent complex; Layer 0: Avramov’s absolute complete-intersection criterion; Layer 3: A splitting from compatible Frobenius lifts.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.nonregularQuotientHomology`.

### 3.12 Why Hodge completion matters


If A→B is a map of Q-algebras, direct-sum derived de Rham satisfies dR_(B/A)≃A. For Q[t,t⁻¹]/Q the ordinary complex instead has H¹=Q·dt/t. Hodge completion recovers ordinary de Rham for smooth finitely presented Q-algebras, by the separate comparison below. Its quotient-limit construction and convergence argument must be proved; they do not follow by identifying the uncompleted complex with the ordinary one. Hodge completion and p-completion remain separate operations.

[Bhatt12], Corollary 2.5, proof and Remark 2.6, pp.5–6; [Bhatt12], Remark 3.12 and Corollary 3.10, p.8.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 3: The conjugate filtration; [`LaurentPolynomial`][lib-45].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.rationalCollapse`.

**Hodge, p-adic and continuous variants.**

Specify each completion separately, then prove the smooth comparisons in their respective ranges. The rational comparison includes the filtered algebra argument: agreement of graded pieces is used only after Hodge completeness.

### 3.13 Smooth ordinary and completed de Rham comparisons


**Proof input gap.** The smooth statements have the characteristic and completion ranges below. The fully coherent rational Hodge-completed comparison still needs its corrected resolution and filtered-algebra proof inputs.

For a smooth map of Z/p^n-algebras with n≥1, uncompleted dR_(B/A)≃Ω•_(B/A). For smooth finitely presented Q-algebras, the Hodge-completed dR^hc_(B/A)≃Ω•_(B/A); the uncompleted dR_(B/A)≃A instead. For p-completely smooth bounded-torsion formal algebras, p-completed derived de Rham identifies with the continuous ordinary complex. Each equivalence preserves the indicated Hodge filtration and multiplication.

[Bhatt12], Corollary 3.10, Remarks 2.6 and 3.12, pp.6,8; [BL22], Appendix E, Proposition E.12, Construction E.14, pp.234–235.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer 2: The de Rham algebra of a completely smooth formal algebra; Layer 3: Why Hodge completion matters; Layer 0: The smooth cotangent computation.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.smoothDeRhamComparison`.

**Transitivity, sheaves and a singular calculation.**

Retain connection and extension data. Global objects are formed using finite-quotient descent before completion; their graded pieces, rather than their full differential, are O_X-linear.

### Examples

On the polynomial line over F_p, inverse Cartier sends dt^(1) to [t^(p−1)dt]. At p=2 this is [t dt], and on the identity algebra the relative Frobenius twist is the base itself. A zero conormal has only weight zero, while a shifted free conormal has nonzero divided powers in every weight.

### Dependencies

Layers 0–2 supply cotangent powers, ordinary differential algebra and polynomial realization. The conjugate filtration precedes both the rational boundary calculation and the smooth comparison application.

## Layer 4: Crystalline comparison maps and Witt animation

Construct the crystalline comparison map, its regular-quotient model and
Frobenius. Animate the classical Witt input and build the PD conjugate
filtration. The global lci and period applications follow scheme descent in
Layer 5.

### 4.1 The derived de Rham to crystalline map


For an ordinary map A→B of Z/p^n-algebras, n≥1, construct Comp_(B/A):dR_(B/A)→RΓ((B/A)_crys,O_crys) as a natural map of Hodge-filtered E∞ A-algebras. The crystalline site has nilpotent PD thickenings compatible with the canonical divided powers on p. On a surjective free resolution P•→B, map Ω•_(P•/A) into Ω•_(P•/A)⊗_(P•)D_(P•)(ker(P•→B)) and use the PD Poincaré comparison. The target is classical crystalline cohomology of B (of π₀B for the separately specified animated extension).

[Bhatt12], Proposition 3.25 and Remark 3.26, p.12.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; `CrystallineCohomology:CR.0`; `CrystallineCohomology:CR.2`; `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.crystallineComparisonMap`.

Prove the following named laws.

- `crystallineComparisonNatural`: A base-compatible square induces a commuting square of the specified comparison maps.
- `crystallineComparisonHodge`: The map carries Hodge filtration to the crystalline PD filtration.
- `crystallineComparisonSmooth`: For a smooth map in the nilpotent-p range this is the PD Poincaré equivalence.
- `crystallineComparisonSheaf`: Affine comparison maps glue over the common scheme site and preserve cup products.

**Checks.**

- `test_crys_map_base`: For A→A over Z/p^n, Comp is the identity on A.
- `test_crys_map_polynomial`: For F_p→F_p[t], Comp identifies the ordinary complex with the crystalline PD de Rham model.
- `test_crys_map_nonlci`: For F_p→F_p[x,y]/(x,y)², the map exists but cannot be an equivalence: source cohomology is unbounded negatively and the classical target is coconnective.

### 4.2 Regular quotients and classical PD envelopes


For A→B=A/I with A and B flat over Z/p^n, n≥1, and I locally generated by a finite regular sequence, prove that Comp identifies dR_(B/A) with the ordinary PD envelope D_A(I) compatible with the divided powers on p. Its Hodge filtration is the PD filtration. Modulo p its conjugate filtration is the explicit PD conjugate filtration below. The comparison is proved here using the ordinary envelope, flatness, tensor-discreteness and reduction facts supplied by CR.0.

[Bhatt12], Lemma 3.29, Claim 3.30, Lemmas 3.37–3.38, Corollary 3.40, pp.13–17.

*Needs:* Layer 4: The derived de Rham to crystalline map; Layer 3: Regular quotient divided-power calculations; Layer 2: Derived base change and Künneth; `CrystallineCohomology:CR.0`; `CrystallineCohomology:CR.2`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.regularPdComparison`.

### 4.3 Frobenius on nilpotent-p derived de Rham


For a Z/p^n-algebra B, polynomial crystalline Frobenius gives a natural endomorphism φ of dR_(B/(Z/p^n)), commuting with the crystalline comparison map. For p-completed algebras use the compatible finite reductions. On characteristic-p Cartier graded pieces record the actual Frobenius twist. This construction does not identify the Hodge filtration with the conjugate or Nygaard filtration.

[Bhatt12], Proposition 3.47 and proof, p.19; Remark 9.8.

*Needs:* Layer 4: The derived de Rham to crystalline map; Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: p-completed derived de Rham; Layer 3: The derived Frobenius twist; `CrystallineCohomology:CR.2`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.deRhamFrobenius`.

Prove the following named laws.

- `deRhamFrobeniusNatural`: Algebra maps over Z/p^n commute with φ.
- `deRhamFrobeniusCrystalline`: Comp intertwines φ and crystalline Frobenius.
- `deRhamFrobeniusLimit`: The finite φ maps induce the endomorphism of Λ_p dR.
- `deRhamFrobeniusDegreeZero`: Modulo p, degree-zero polynomial functions map by b↦b^p.

**Checks.**

- `test_derham_frob_base`: On the base Z/p^n, the canonical Frobenius is the base identity.
- `test_derham_frob_coordinate`: Modulo p on F_p[t], t maps to t^p and the differential of t^p is zero.
- `test_derham_frob_filtration_boundary`: For F_p[t]/F_p, polynomial Frobenius has φ(t)=t^p and φ(dt)=0, while inverse
  Cartier sends dt^(1) to the nonzero class [t^(p−1)dt]. This holds at p=2, where
  the latter is [t dt]. A Frobenius endomorphism therefore cannot substitute for
  inverse Cartier or identify the two filtrations ([Bhatt12], Lemma 3.2, p.7).

**Derived Witt theory and quasiregular PD structure.**

Animate the early classical smooth Witt/Nygaard interface, then compare its quasiregular values with PD envelopes. The PD root-quotient p-torsion-free calculation used in [BMS19], Proposition 8.12, pp.272–273, must come from CR.0, including the Scholze–Weinstein Proposition 4.1.11 input or a complete direct PD-basis proof.

### 4.4 Derived de Rham–Witt with Nygaard filtration


From the classical smooth F_p complex WΩ and Nygaard filtration supplied by CR.4, construct LWΩ on animated F_p-algebras by left Kan extension into p-complete filtered E∞ Z_p-algebras, with p-completed colimits. Extend divided Frobenius and prove the fiber sequences N^(≥i+1)LWΩ→N^(≥i)LWΩ --φ_i mod p→Fil_i^conj dR and LWΩ/N^(≥i) --p→LWΩ/N^(≥i+1)→dR/Fil_H^(i+1). The resulting functor restricts to the supplied classical smooth object.

[BMS19], §8.2 opening, p.270, equations (4)–(5); Lemmas 8.2–8.3.

*Needs:* `CrystallineCohomology:CR.4`; Layer 1: Coherent filtered modules; Layer 1: Completed filtered tensor products; Layer 1: The derived completion reflector; Layer 2: De Rham cohomology from polynomial resolutions; Layer 3: The conjugate filtration; `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.derivedDeRhamWitt`.

Prove the following named laws.

- `derivedWittSmooth`: On a smooth F_p-algebra, LWΩ is the imported classical WΩ with its Nygaard filtration.
- `derivedWittModP`: LWΩ_S⊗^L_Zp F_p≃dR_(S/F_p).
- `derivedWittDividedFrobenius`: φ_i:N^(≥i)LWΩ→LWΩ has the displayed modulo-p fiber sequence.
- `derivedWittHodgeQuotient`: Multiplication by p on Nygaard quotients has cofiber dR/Fil_H^(i+1).

**Checks.**

- `test_derived_witt_perfect`: For perfect S, LWΩ_S=W(S), with Nygaard filtration p^iW(S).
- `test_derived_witt_fp`: For S=F_p, LWΩ=Z_p and reduction is F_p.
- `test_derived_witt_singular_boundary`: For S=F_p[x,y]/(x,y)², dR_(S/F_p) is unbounded in negative degrees by the
  lifted-Frobenius calculation, including p=2. Since LWΩ_S⊗^L_(Z_p)F_p≃dR_S,
  LWΩ_S cannot be concentrated in degree zero: reduction of a discrete Z_p-module
  has cohomology only in degrees −1 and 0 ([Bhatt12], Example 3.21, p.11;
  [BMS19], §8.2, p.270, by animation of Lemma 8.2, p.266).

### 4.5 The conjugate filtration of a PD envelope


For an F_p-algebra A, ideal I and ordinary PD envelope D_A(I), define Fil_n^conj as the A-submodule generated by products ∏ a_j^[l_j] with a_j∈I and Σl_j<(n+1)p, with Fil_(−1)=0. It is increasing, multiplicative and exhaustive; equivalently use products ∏a_j^[p k_j] with Σk_j≤n. There is a canonical surjective graded map Γ^*_(A/I)(I/I²)⊗_(A/I,Frob) A/φ(I)→gr_*^conj D_A(I), sending divided-power monomials to ∏((p k_j)!/(p^k_j k_j!))a_j^[p k_j]. Here φ(I) is the ideal generated by a^p for a∈I. These factors are p-adic units.

[BMS19], Definitions 8.10 and Proposition 8.11, pp.271–272.

*Needs:* `CrystallineCohomology:CR.0`; [`DividedPowers`][lib-34]; [`DividedPowerAlgebra`][lib-35].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.pdConjugateFiltration`.

Prove the following named laws.

- `pdConjugateMembership`: The two displayed generator descriptions define the same filtration level.
- `pdConjugateProduct`: Fil_i·Fil_j⊆Fil_(i+j) and colim Fil_i=D_A(I).
- `pdConjugateGradedMap`: The divided-power graded map has the displayed Frobenius base change and factorial factors.
- `pdConjugateNatural`: Maps of F_p PD envelope problems preserve all levels and the graded map.

**Checks.**

- `test_pd_conj_zero_ideal`: For I=0 only weight zero survives, and D_A(0)=A.
- `test_pd_conj_coordinate`: For A=F_p[x], I=(x), γ_(p k)(x) has conjugate weight k and γ_(p−1)(x) belongs to weight zero.
- `test_pd_conj_two_filtrations`: γ_p(x) has conjugate weight 1 but PD/Hodge weight p; the two filtrations are different.

### 4.6 The torsion boundary for F_p over Z_p


The p-completed de Rham complex of F_p/Z_p is the derived completion of [Z_p⟨x⟩ --(x−p)→ Z_p⟨x⟩] in degrees −1,0. Its decompleted model is Z_p⊕⊕_(j>0) Z_p/j in degree zero; the completion of the torsion direct sum need not be torsion. In the factors Z_p/p^n the coordinates p^floor(n/2) tend p-adically to zero and have unbounded orders, hence define a nontorsion completed-sum element. This corrects Remark 8.7; the printed p^(n−1) coordinates are all killed by p. For a perfect F_p-algebra A₀, the Witt summand in Corollary 8.6 is W(A₀).

[Bhatt12], Proposition 8.5, Corollary 8.6, Remark 8.7, p.32.

*Needs:* Layer 1: The derived completion reflector; Layer 1: Valid exchanges of completion and derived operations; Layer 2: p-completed derived de Rham; `CrystallineCohomology:CR.0`; [`WittVector`][lib-36].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.fpOverZpTorsion`.

### Examples

The identity crystalline comparison is an equivalence. The non-lci square-zero algebra F_p[x,y]/(x,y)², including p=2, distinguishes unbounded derived de Rham from classical nonnegative crystalline cohomology. In the completed torsion sum, coordinates p^floor(n/2) have unbounded order, whereas p^(n−1) is killed by p.

### Dependencies

Layers 0–3 and the CrystallineCohomology bundle supply cotangent powers, completion, Cartier, ordinary PD/site and classical smooth Witt inputs. Global lci, period and QRSP comparisons follow the sites and descent of Layer 5.

## Layer 5: Quasisyntomic descent, crystalline applications and geometric control

Construct the sites and covers before applying descent to cotangent powers, de Rham objects and schemes. The QRSP Witt/PD calculations and canonical crystalline Čech comparison then precede proper smooth control.

### 5.1 The quasisyntomic sites


Fix p. QSyn has p-complete bounded-p-torsion rings whose L_(A/Z_p) has p-complete Tor amplitude [−1,0]; its opposite has singleton covers given by the Layer 0 quasisyntomic morphism condition with complete faithful flatness. Construct the big slices QSyn_R (all maps R→A with A∈QSyn) and the relative subsite qSyn_R (quasisyntomic R-algebras). Their completed fiber products for covers, composition and base-change stability define the site; the full ring category need not have every finite limit. These two relative categories are distinguished.

[BMS19], Definition 4.10; Lemmas 4.15–4.17; Variants 4.33 and 4.35, pp.223–225,231–232.

*Needs:* Layer 1: The quasisyntomic cotangent condition; Layer 0: The cotangent transitivity triangle; Layer 0: Derived base change of the cotangent complex; Layer 1: Complete flatness and complete faithful flatness; Layer 1: Complete faithful-flat module descent; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.quasisyntomicSite`.

Prove the following named laws.

- `qSynCoverComposition`: Identity covers and composites are covers.
- `qSynCoverBaseChange`: The p-completed derived pushout of a cover is an ordinary bounded-torsion quasisyntomic cover under complete flatness.
- `qSynObjectCoverDescent`: For a quasisyntomic cover A→B, A∈QSyn iff B∈QSyn.
- `qSynRelativeInclusion`: qSyn_R embeds in QSyn_R; for R=Z_p or integral perfectoid R, the relative cotangent amplitude is automatically [−1,0] on the big slice.

**Checks.**

- `test_qsyn_site_zp`: Z_p lies in QSyn and its identity is a cover.
- `test_qsyn_site_smooth`: The p-completion of a smooth algebra over an integral perfectoid ring is an object.
- `test_qsyn_site_nonlci`: F_p[x,y]/(x,y)² is not an object because the full absolute cotangent complex has unbounded negative homology.

### 5.2 Quasiregular semiperfectoid rings


A quasiregular semiperfectoid ring S is a QSyn object admitting a map from an integral perfectoid ring R and having surjective Frobenius on S/p. Equivalently it is a quotient of an integral perfectoid ring by a p-completely quasiregular ideal, with bounded p-torsion and relative cotangent in degree −1. QRSPerfd carries the induced cover topology. In characteristic p these are exactly quasiregular semiperfect F_p-algebras: S^♭=lim_φ S→S is surjective and L_(S/F_p)≃L_(S/S^♭)≃(I/I²)[1] with I/I² flat, I=ker(S^♭→S). Quasiregularity here need not mean a finite regular sequence.

[BMS19], Definition 4.20, Remarks 4.21–4.24, Lemma 4.25 with proof; Definition 8.8, pp.227–229,270.

*Needs:* Layer 5: The quasisyntomic sites; Layer 0: The cotangent transitivity triangle; Layer 0: Derived base change of the cotangent complex; Layer 0: Derived divided powers; `PerfectoidQuotients:Q0:integral-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.quasiregularSemiperfectoidRings`.

Prove the following named laws.

- `qrspPerfectoidQuotient`: The quotient characterization uses a p-completely quasiregular ideal and an integral perfectoid source.
- `qrspCotangentDegree`: For S and any integral perfectoid R→S, Λ_p L_(S/R) is a shifted complete-flat module.
- `qrspCharacteristicP`: In characteristic p, QRSPerfd equals quasiregular semiperfect F_p-algebras with flat I/I².
- `qrspPerfectoidExample`: Every integral perfectoid ring is a QRSPerfd object.

**Checks.**

- `test_qrsp_perfect_fp`: Every perfect F_p-algebra is quasiregular semiperfect, with I=0.
- `test_qrsp_root_quotient`: F_p[t^(1/p^∞)]/(t) is quasiregular semiperfect, with its nonzero conormal module in degree −1.
- `test_qrsp_zp_boundary`: Z_p meets the QSyn and semiperfect-reduction conditions but admits no map from an integral perfectoid ring, so is excluded.

### 5.3 Compatible-root quasisyntomic covers


For A∈QSyn, choose a surjective free p-complete polynomial algebra F→A. Adjoin compatible p-power roots of p and all polynomial coordinates to obtain the integral perfectoid F_∞. Put S=Λ_p(A⊗^L_F F_∞). Then A→S is a quasisyntomic cover and S∈QRSPerfd. Its mod-p module is free faithfully flat over A/p, and L_(S/p over A/p)[−1] is free. The cover is elementary; it does not use Q3’s absolutely-integrally-closed extension theorem.

[BMS19], Lemma 4.28 and Remark 4.29 with proof, p.229.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Quasiregular semiperfectoid rings; Layer 1: Completion of animated rings; Layer 1: Complete flatness and complete faithful flatness; Layer 1: Complete faithful-flat module descent; Layer 0: Derived base change of the cotangent complex; Layer 0: The cotangent transitivity triangle; `PerfectoidQuotients:Q0:integral-algebra`; `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.elementarySemiperfectoidCovers`.

Prove the following named laws.

- `rootCoverFaithfullyFlat`: S/p is free faithfully flat over A/p.
- `rootCoverCotangent`: L_(S/p over A/p)[−1] is a free S/p-module.
- `rootCoverPerfectoidSource`: The cover comes with an integral perfectoid surjection F_∞→S.
- `rootCoverFunctorialRefinement`: Maps between choices of generators produce a common refinement of the resulting covers.

**Checks.**

- `test_root_cover_zp`: For A=Z_p, adjoining all compatible roots of p and completing gives a perfectoid cover.
- `test_root_cover_coordinate`: For A=Z_p⟨t⟩, roots of p and t give the stated free mod-p module and shifted free relative cotangent.
- `test_root_cover_finite_roots`: Adjoining only t^(1/p) leaves elements without p-power roots in the next stage and does not establish semiperfectness.

### 5.4 Refinement and Čech stability of QRSP covers


Completed base change of a QSyn cover with QRSP target by a QRSP object is QRSP; each term of the completed Čech nerve of A→S with S∈QRSPerfd is QRSP. Any two such covers admit a common QRSP refinement by applying the elementary cover to their completed fiber product. Relative and big-slice variants retain the same statement. This establishes the basis condition needed for unfolding.

[BMS19], Lemmas 4.27 and 4.30, pp.229–230; Variant 4.33.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Quasiregular semiperfectoid rings; Layer 5: Compatible-root quasisyntomic covers; Layer 1: Complete faithful-flat module descent.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.qrspRefinement`.

### 5.5 Sheaves and unfolding from the QRSP basis


For a presentable enhanced target category C, restriction gives Shv_C(QSyn^op)≃Shv_C(QRSPerfd^op). Its inverse sends F to the unfolding F^unf(A)=Tot(F(S•)) for any QRSP cover A→S; this is independent of the cover by common refinement. The same applies to the specified relative and big-slice sites. In a complete filtered module target, evaluation and graded pieces commute with unfolding; the underlying object commutes for nonnegative filtrations that are constant below zero.

[BMS19], Proposition 4.31 and Remark 4.32, pp.230–231.

*Needs:* Layer 5: Compatible-root quasisyntomic covers; Layer 5: Refinement and Čech stability of QRSP covers; Layer 1: Coherent filtered modules; Layer 1: Completion of a filtered object; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.qrspUnfolding`.

**Cotangent and de Rham descent.**

Prove cotangent-power descent, then finite Hodge-quotient descent and Hodge-completed descent. For p-completed uncompleted dR, use the actual uniform lower bound on the conjugate stages in the specified relative site.

### 5.6 Descent of completed cotangent powers


For a fixed ordinary base R and a p-completely faithfully flat map A→B between bounded-torsion p-complete rings, the completed cotangent exterior-power functor A↦Λ_p L∧^i_A L_(A/R) satisfies Čech descent: its value at A is Tot of the values at the completed Čech terms. Finite Hodge quotients inherit descent by finite exact extensions. The mod-p proof keeps the derived reductions and the completed base ring; no freeness of the cotangent complex is assumed.

[BMS19], Theorem 3.1 and p-completed use in Example 5.11, pp.217–218,240.

*Needs:* Layer 0: The full cotangent complex; Layer 0: Derived base change of the cotangent complex; Layer 0: Derived exterior powers; Layer 0: Exterior powers of a triangle; Layer 1: Complete faithful-flat module descent; Layer 1: Valid exchanges of completion and derived operations.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completedCotangentDescent`.

### 5.7 Descent of Hodge quotients and completion


The functors A↦dR_(A/R)/Fil_H^m for finite m, their p-completions, and the complete Hodge-filtered object dR^hc_(A/R) satisfy their flat or p-completely flat Čech descent assertions. For Hodge completion, Tot commutes with the quotient inverse limit because both are limits. Graded conservativity is used only in the complete filtered category. There is no assertion here that uncompleted derived de Rham commutes with every unbounded totalization.

[BMS19], Example 5.11, p.240; [BL22], Proposition E.16 with proof, pp.235–236 of the downloaded revision.

*Needs:* Layer 5: Descent of completed cotangent powers; Layer 2: Hodge graded pieces of derived de Rham; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer 1: Completion of a filtered object; Layer 1: Valid exchanges of completion and derived operations.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.filteredDeRhamDescent`.

### 5.8 Derived de Rham on schemes and formal schemes


For a qcqs scheme X over an ordinary ring A, sheafify each finite Hodge quotient of the affine functor B↦dR_(B/A), then form its Hodge-completed quotient limit. It has gr_H^i=RΓ(X,L∧^i L_(X/A))[−i]. The uncompleted functor can be sheafified separately; recovering its raw affine values requires the particular uncompleted descent theorem and is not asserted for arbitrary unbounded flat totalizations. For p-adic formal schemes use the specified p-complete affine charts, derived reductions and Hodge/p-completions. Global de Rham is an A-linear complex with cup products; its full differential is not O_X-linear, although Hodge graded pieces are O_X-modules. X is a qcqs scheme over an ordinary ring A. Affine descent is applied to each finite Hodge quotient before taking the Hodge-completed limit; raw uncompleted affine values need the separately stated descent hypotheses.

[BL22], Appendix B, Construction B.7 and Remark B.8; Appendix E, Proposition E.16, pp.226,235–236.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer 2: Hodge graded pieces of derived de Rham; Layer 5: Descent of Hodge quotients and completion; `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.4`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.deRhamSheaves`.

Prove the following named laws.

- `schemeDeRhamAffine`: On Spec B the Hodge-completed global object is dR^hc_(B/A). Recovery of the p-completed uncompleted affine object uses the precise Layer 5 relative/big-slice hypotheses.
- `schemeDeRhamGraded`: For Hodge-completed global de Rham, gr_H^i≃RΓ(X,L∧^iL_(X/A))[−i].
- `schemeDeRhamPullback`: A morphism over A induces coherent pullback preserving cup products and the Hodge filtration.
- `formalDeRhamLimit`: The p-completed formal object is the derived inverse limit of its finite reductions under the stated descent and bounded-torsion hypotheses.

**Checks.**

- `test_scheme_derham_affine_base`: For X=Spec A over A the object is A, with no positive Hodge pieces.
- `test_scheme_derham_affine_line`: For X=Spec F_p[t], H¹ of ordinary smooth de Rham is F_p[t^p]·t^(p−1)dt.
- `test_scheme_derham_product_boundary`: For X=Spec(F_p[t]), ordinary and derived de Rham agree by smooth comparison,
  and H⁰_dR(X/F_p)=F_p[t^p], of infinite dimension over F_p. Thus even a smooth
  finite-dimensional affine scheme need not have finite-projective global de Rham
  cohomology over its base. Properness is essential to the later perfectness
  theorem ([Bhatt12], Corollary 3.10, p.8; differentiate t^n explicitly).

### 5.9 The lci crystalline comparison theorem


For n≥1 and an lci morphism of flat Z/p^n-schemes f:X→S (finite-presentation/local regular-immersion convention), the natural Comp_f is an equivalence of Hodge-filtered E∞ algebras and is compatible with base change in its Tor-independent crystalline range, products and Frobenius. This is Bhatt Theorem 3.27; the general singular and nonflat cases remain outside its isomorphism assertion.

[Bhatt12], Theorem 3.27, Lemmas 3.39 and 3.44–3.45, proof pp.18–19.

*Needs:* Layer 4: The derived de Rham to crystalline map; Layer 4: Regular quotients and classical PD envelopes; Layer 3: Smooth ordinary and completed de Rham comparisons; Layer 2: Derived de Rham transitivity filtrations; Layer 5: Derived de Rham on schemes and formal schemes; Layer 3: Derived Cartier graded pieces; `CrystallineCohomology:CR.2`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.lciCrystallineComparison`.

### 5.10 p-adic crystalline comparison by derived limits


Let A→B be a map of p-complete bounded-torsion algebras whose derived reductions are ordinary flat Z/p^n-algebras and lci for every n, compatibly. Then Λ_p dR_(B/A)≃Rlim_n RΓ((B/p^n over A/p^n)_crys,O). The same assertion applies to compatible p-adic formal schemes with the analogous finite-level hypotheses. The filtration is the derived limit of the specified Hodge/PD filtration. Each limit and base-change map is derived; reduction of arbitrary rings to π₀ is not allowed.

[Bhatt12], Definition 8.1, Lemma 8.3, Theorem 8.4, pp.31–32.

*Needs:* Layer 1: The derived completion reflector; Layer 1: When ordinary quotient towers compute completion; Layer 1: Valid exchanges of completion and derived operations; Layer 2: p-completed derived de Rham; Layer 2: Derived base change and Künneth; Layer 5: The lci crystalline comparison theorem.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.pAdicCrystallineComparison`.

### 5.11 The derived de Rham description of A_cris


In Bhatt Notation 9.1, let W=W(k), K/Frac(W) finite, C=widehat(bar K), A_inf=W(O_C^♭) with θ:A_inf→O_C and regular kernel ξ supplied by AI.0. Then Λ_p dR_(O_barK/W)≃Λ_p dR_(O_C/W)≃Λ_p dR_(O_C/A_inf)≃widehat D_(A_inf)(ker θ)=A_cris. The Hodge filtration is the completed PD filtration, the map A_inf→A_cris is the PD structure map, and the equivalence preserves Frobenius and the G_K action. The integral perfectoid generalization keeps the regular θ-kernel and relatively perfect mod-p input.

[Bhatt12], Proposition 9.3(2)–(5), Definition 9.7, Proposition 9.9, Remark 9.10, pp.34–35.

*Needs:* Layer 5: p-adic crystalline comparison by derived limits; Layer 4: Regular quotients and classical PD envelopes; Layer 4: Frobenius on nilpotent-p derived de Rham; Layer 0: Regular quotients and two-term models; Layer 0: The cotangent transitivity triangle; Layer 2: p-completed derived de Rham; `AInfCohomology:AI.0:integral`; `CrystallineCohomology:CR.0`; `PerfectoidQuotients:Q0:integral-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.acrisDerivedDescription`.

### 5.12 Hodge completion and B_dR⁺


For the same W,K,C as above, the rational Hodge completion of the p-completed derived de Rham period object, Rlim_i(((Λ_p dR_(O_barK/W))/Fil_H^i)[1/p]), identifies with the ker(θ)[1/p]-adic completion of A_inf[1/p], namely the shared B_dR⁺. Precisely use Rlim_i(((Λ_p dR)/Fil_H^i)[1/p]); inversion outside the limit is not identified with it. The natural map A_cris→B_dR⁺ preserves the filtration and G_K action; passage to B_dR and B_cris uses the period owner’s specified localization maps.

[Bhatt12], Remark 9.17, p.38.

*Needs:* Layer 5: The derived de Rham description of A_cris; Layer 2: Hodge-completed derived de Rham; Layer 1: Valid exchanges of completion and derived operations; `PadicHodgeTheory:R06.1`; `AInfCohomology:AI.0:integral`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.rationalHodgePeriodComparison`.

### 5.13 Relative Tor-amplitude estimates


For a quasisyntomic R-algebra A, Λ_p L_(A/R) has p-complete Tor amplitude [−1,0]; thus Λ_p L∧^i L_(A/R) has amplitude [−i,0], its Hodge/conjugate shift [−i] has [0,i] before the additional derived Z/p tensor bound, and each finite quotient has a specified finite amplitude bound. For a quasismooth map the completed L is a p-completely flat module in degree zero; ordinary flatness requires an additional criterion, such as the Noetherian complete-flatness theorem in Layer 1. For relative QRSP algebras the shifted cotangent and divided-power terms are complete-flat in degree zero. These are Tor-amplitude assertions, not finite-projectivity assertions without finiteness.

[BMS19], Lemma 4.7, Lemma 4.34 and Lemma 5.14(1), pp.222,231,241.

*Needs:* Layer 1: The quasisyntomic cotangent condition; Layer 0: Derived exterior powers; Layer 0: Derived divided powers; Layer 5: Quasiregular semiperfectoid rings; Layer 5: The quasisyntomic sites; Layer 1: Complete flatness and complete faithful flatness.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.relativeTorAmplitude`.

### 5.14 Descent of p-completed uncompleted de Rham


For a fixed R∈QSyn, Λ_p dR_(−/R) is a sheaf on the relative site qSyn_R. If R=Z_p or R is integral perfectoid, it is also a sheaf on the big slice QSyn_R. Modulo p, its increasing exhaustive conjugate filtration has sheaf stages uniformly in D^(≥−1); hence filtered colimits commute with the Čech totalization in the required bounded-below category. The same conclusion holds in BL Variant E.17’s p-quasisyntomic range. The uniform bound and relative-site restriction are explicit.

[BMS19], Example 5.12 and Lemma 4.34, pp.231,240; [BL22], Variant E.17 with proof, p.236 of the downloaded revision.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Descent of completed cotangent powers; Layer 3: The conjugate filtration; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate spectral sequence and convergence; Layer 1: Valid exchanges of completion and derived operations; `PerfectoidQuotients:Q0:integral-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.uncompletedPDeRhamDescent`.

**Proper smooth cohomology and base change.**

Apply the imported proper-flat coherent-cohomology theorem to differential bundles at finite level. Prove the effectivity theorem lifting a compatible system of perfect A/p^n-complexes with uniform bounds to a perfect derived p-complete A-complex; finite-level perfectness alone does not supply this step.

### 5.15 Quasiregular semiperfect derived Witt control


For quasiregular semiperfect S over F_p, LWΩ_S is degree zero and p-torsion-free, N^(≥i)LWΩ_S is a degree-zero submodule, φ_i mod p on gr_N^i LWΩ injects into dR_(S/F_p) with image Fil_i^conj, and LWΩ_S→S is a PD thickening. The injectivity is on the Nygaard graded term; it is not an injectivity claim for φ_i mod p on the entire level N^(≥i).

[BMS19], Proposition 8.13 and the end of Proposition 8.12 proof, pp.273–274.

*Needs:* Layer 4: Derived de Rham–Witt with Nygaard filtration; Layer 5: Quasiregular semiperfectoid rings; Layer 3: Derived Cartier graded pieces; Layer 1: Complete flatness and complete faithful flatness; `CrystallineCohomology:CR.0`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.qrspWittControl`.

### 5.16 Quasiregular semiperfect derived de Rham and PD envelopes


**Proof input gap.** The root-quotient PD torsion-freeness proof used in BMS Proposition 8.12 invokes Scholze–Weinstein Proposition 4.1.11. That original proof or a complete direct PD-basis argument is not yet supplied.

For every quasiregular semiperfect F_p-algebra S, put S^♭=lim_φ S and I=ker(S^♭→S). Then dR_(S/F_p)≃dR_(S/S^♭) is discrete and naturally identifies with D_(S^♭)(I)=A_crys(S)/p. The Hodge filtration is the PD filtration and the increasing conjugate filtration agrees with the PD conjugate filtration, with gr_*≃Γ^*_S(I/I²). No finite-generation or regular-sequence hypothesis on I is imposed. A_crys(S) is the imported completed PD envelope of W(S^♭)→S.

[BMS19], Proposition 8.12 and proof, pp.272–273.

*Needs:* Layer 5: Quasiregular semiperfectoid rings; Layer 0: The cotangent transitivity triangle; Layer 0: Derived divided powers; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate filtration; Layer 4: Regular quotients and classical PD envelopes; Layer 4: The conjugate filtration of a PD envelope; Layer 4: Derived de Rham–Witt with Nygaard filtration; `CrystallineCohomology:CR.0`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.qrspPdDerham`.

### 5.17 The structure theorem for A_crys(S)


**Proof input gap.** The general PD root-quotient torsion-freeness input is the preceding source gap. Its citation does not by itself construct the required integral PD model.

For every quasiregular semiperfect F_p-algebra S, the imported A_crys(S) is p-torsion-free and has a natural φ-equivariant identification A_crys(S)≃LWΩ_S matching Nygaard filtrations. Its N^(≥i) is {x:φ(x)∈p^iA_crys}; the divided Frobenius gr_N^i→A_crys/p injects with conjugate image Fil_i^conj. The image of N^(≥i) modulo p is Fil_H^i dR. Nygaard completion modulo p is Hodge-completed dR, and φ mod p is x↦x^p. Nygaard completion and completion at the PD ideal are not identified; at p=2 the latter can collapse Z₂ to F₂.

[BMS19], Theorem 8.14 and proof, pp.274–275.

*Needs:* Layer 5: Quasiregular semiperfect derived de Rham and PD envelopes; Layer 5: Quasiregular semiperfect derived Witt control; Layer 4: Derived de Rham–Witt with Nygaard filtration; Layer 4: The conjugate filtration of a PD envelope; `CrystallineCohomology:CR.0`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.acrysStructure`.

**Canonical crystalline Čech complexes.**

Use the Layer 5 basis and unfolding theorem. The regular perfection argument requires Kunz’s Frobenius-flatness direction and the smooth approximation in Stacks Tag 07GB; include those proof inputs in establishing this application.

Sources for this subsection: [BMS19], Remark 8.15, p.275.

### 5.18 The canonical crystalline Čech complex


**Proof input gap.** Kunz’s Frobenius-flatness theorem and the smooth approximation of Stacks tag 07GB are needed in their precise regular-ring ranges. Neither has a checked supplier proof here.

For a regular F_p-algebra A in BMS2 Remark 8.15’s convention, let S=A_perf be its direct-limit perfection. The map A→S is a quasisyntomic cover and its completed Čech terms are quasiregular semiperfect. The canonical cochain complex A_crys(S)→A_crys(S⊗_A S)→… computes RΓ_crys(A/Z_p), through the unfolding of LWΩ on QSyn_(F_p). Regularity is essential for faithful flatness of perfection; this formula is not asserted for arbitrary singular A.

*Needs:* Layer 5: The structure theorem for A_crys(S); Layer 4: Derived de Rham–Witt with Nygaard filtration; Layer 5: Compatible-root quasisyntomic covers; Layer 5: Refinement and Čech stability of QRSP covers; Layer 5: Sheaves and unfolding from the QRSP basis; Layer 5: Descent of p-completed uncompleted de Rham; `CrystallineCohomology:CR.2`; `CrystallineCohomology:CR.4`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.regularFpCrystallineCech`.

**Period objects and a torsion boundary.**

Apply the integral θ-kernel and perfectoid interfaces first, then the rational period-ring interface. Keep inversion inside the specified Hodge quotient limit. The F_p/Z_p calculation supplies a concrete check that p-completion can create nontorsion elements from a torsion direct sum.

### 5.19 Proper smooth de Rham perfectness


**Proof input gap.** Finite-level proper cohomology is located. Effectivity of a compatible uniformly bounded system of perfect A/p^n-complexes as a perfect derived-complete A-complex is a separate unsupplied theorem.

Let A be p-complete with bounded p-torsion and X a proper p-completely smooth formal A-scheme of finite presentation, with compatible proper smooth ordinary reductions X_n/A_n of bounded relative dimension d. Then the p-completed continuous de Rham global object is a perfect derived p-complete A-complex. Each RΓ(X_n,Ω^i_(X_n/A_n)) is perfect by the shared proper-flat coherent-cohomology theorem, its Hodge quotient is a finite extension of these pieces, and Ω^i=0 for i>d. No degeneration or finite-projective individual H^j is asserted. The same finite-filtration argument applies to an ordinary proper smooth finite-presentation A-scheme with its smooth ordinary/Hodge-completed comparison in the appropriate characteristic.

[StacksProper], §36.30, Lemmas 36.30.1 and 36.30.4 with proof; tags 0A1H,0B91, pp.73–74 of Derived Categories of Schemes.

*Needs:* Layer 2: The de Rham algebra of a completely smooth formal algebra; Layer 3: Smooth ordinary and completed de Rham comparisons; Layer 5: Derived de Rham on schemes and formal schemes; Layer 5: Relative Tor-amplitude estimates; Layer 5: Descent of Hodge quotients and completion; Layer 1: Valid exchanges of completion and derived operations; `AlgebraicModuliForArithmeticGeometry:A0-extension`; `SchemeAndStackFoundations:SF.4`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.properSmoothCohomologicalControl`.

### 5.20 Completed base change and cup products


**Proof input gap.** The completed perfect-complex effectivity theorem in the preceding subsection is required before the formal global base-change comparison follows.

Under the proper smooth finite-presentation hypotheses of the preceding node, a bounded-torsion p-complete base map A→A′ gives a natural equivalence RΓ_dR(X/A) completed-tensor^L_A A′≃RΓ_dR(X completed-base-change A′/A′), compatibly with Hodge filtrations and cup products. All completed tensor and reductions are derived. For general QSyn algebras the affine base-change/Künneth and descent products remain available, but neither proper global perfectness nor a finite-projective cohomology conclusion follows.

[StacksProper], Tag 0A1G, Lemma 36.30.1 and Remark 36.30.2, pp.73–74 of Derived Categories of Schemes.

*Needs:* Layer 5: Proper smooth de Rham perfectness; Layer 5: Descent of Hodge quotients and completion; Layer 2: Derived base change and Künneth; Layer 5: Derived de Rham on schemes and formal schemes; Layer 1: Completed filtered tensor products; Layer 1: Valid exchanges of completion and derived operations; `AlgebraicModuliForArithmeticGeometry:A0-extension`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.completedBaseChangeCupProducts`.

**Projective variants and formal étale realization.**

The projective site strengthens the mod-p module condition and Tor amplitude without imposing finite generation. Formal realization uses only charts that meet the QSyn conditions and actual covering families.

### 5.21 The proj-quasisyntomic variant over O_C


For O_C with C a characteristic-zero perfectoid field, a map A→B of p-complete p-torsion-free O_C-algebras is proj-quasisyntomic if B/p is a projective A/p-module and L_(B/p over A/p) has projective amplitude [−1,0]; it is a cover if B/p is also faithfully flat. Form the relative proj-qSyn_(O_C) and proj-qrsPerfd_(O_C) sites. They have completed base-change/composition stability, compatible-root basis covers and the sheaf-unfolding equivalence. Projective amplitude is stronger than Tor amplitude and does not imply finite generation.

[BMS19], Variant 4.36 and Footnotes 12–13, p.232.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Compatible-root quasisyntomic covers; Layer 5: Refinement and Čech stability of QRSP covers; Layer 5: Sheaves and unfolding from the QRSP basis; `PerfectoidQuotients:Q0:integral-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.projQuasisyntomicSite`.

Prove the following named laws.

- `projQSynCover`: A cover has projective faithfully flat reduction and projective cotangent amplitude [−1,0].
- `projQSynSmooth`: The p-completion of a smooth O_C-algebra is in the relative projective site.
- `projQSynRootBasis`: Every such object admits a compatible-root cover by proj-QRSP objects.
- `projQSynUnfolding`: Restriction to the proj-QRSP basis is a sheaf equivalence in presentable targets.

**Checks.**

- `test_proj_qsyn_identity`: O_C→O_C has rank-one projective reduction and zero relative cotangent.
- `test_proj_qsyn_smooth`: O_C⟨t⟩ has the free coordinate differential module and qualifies.
- `test_proj_qsyn_torsion`: An O_C-algebra with nonzero p-torsion is excluded even if its reduction happens to be projective.

### 5.22 From quasisyntomic sheaves to formal étale sites


For a p-complete formal scheme X with QSyn affine charts, a C-valued sheaf F on QSyn defines a sheaf F_X on X_ét by F_X(U)=lim_(Spf A⊆U)F(A), the limit over affine formal opens. Smooth/étale maps of such charts are quasisyntomic maps. A completely faithfully flat map, or a jointly covering family with that faithful cover property, supplies quasisyntomic descent, so the local values glue; an arbitrary individual open immersion is not a cover. The construction is natural in X and retains the coefficient category and any complete filtration carried by F; a small site is used only after chart hypotheses are checked.

[BMS19], Remark 10.4 and its construction, p.288.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Sheaves and unfolding from the QRSP basis; Layer 5: Descent of Hodge quotients and completion; `SchemeAndStackFoundations:SF.0`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `SchemeAndStackFoundations:SF.4`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.formalEtaleRealization`.

Prove the following named laws.

- `formalEtaleAffine`: On Spf A the restricted sheaf recovers F(A).
- `formalEtaleCoverDescent`: An étale affine-chart cover gives the enhanced Čech descent equivalence.
- `formalEtalePullback`: Compatible morphisms of formal schemes induce the specified sheaf pullback maps.
- `formalEtaleFiltered`: For complete filtered targets, evaluation and graded pieces commute with the chart-limit construction.

**Checks.**

- `test_formal_etale_affine`: For X=Spf Z_p and its identity chart, the value is F(Z_p).
- `test_formal_etale_smooth_chart`: Smooth p-complete polynomial charts over an integral perfectoid base satisfy the required QSyn hypothesis.
- `test_formal_etale_bad_chart`: A chart with unbounded p-torsion is not accepted as a QSyn chart without additional construction.

### Examples

Z_p and F_p are QSyn objects, but Z_p→F_p fails complete flatness. Z_p has semiperfect reduction but has no integral perfectoid source, so it is not QRSP. The free root tower and its first finite stage distinguish genuine semiperfectness from adjoining one root. The affine polynomial line over F_p has H⁰=F_p[t^p], illustrating why sheaf descent alone supplies no global finiteness.

### Dependencies

Layers 0–4 supply cotangent powers, complete flatness, de Rham, Cartier, PD filtrations and Witt animation. EnhancedDerivedSheaves supplies descent targets; the permitted geometric suppliers supply schemes and finite-level proper cohomology. Elementary perfectoid algebra still has the tier-13 dependency gap.

## Layer 6: Logarithmic cotangent and de Rham theory


**Free prelog resolutions and Gabber cotangent.**

Use the two sorts of free generators, with compatibility between a monoid generator and its ring image. Import ordinary log algebra and exactification from the early CR.5 interface. Establish the integral logification and Gabber–Olsson comparisons in their stated ranges as part of the functorial construction.

### 6.1 Free prelog resolutions and animation


For a prelog base (A,M), import its ring/monoid carrier from the early CR.5 prefix and use free objects (A[T₀,N^(T₁)],M⊕N^(T₁)) with finite generator sets. Finite free objects are the compact projective generators for animation. The free/forgetful cotriple on the underlying generator sets gives a canonical surjective simplicial resolution of (B,N), whose termwise free ring and monoid generator sets may be infinite. Its realization recovers the prelog object, and comparison maps between projective resolutions are coherent homotopy equivalences. Apply the EDS nonabelian animation universal property to this prelog-specific compact-projective subcategory.

[Bhatt12], §§4–5, Propositions 5.3–5.5; Remark 6.10, pp.19–24,26; [KY], §2.1, Notation 2.4 and Remark 2.8, pp.12–14.

*Needs:* `CrystallineCohomology:CR.5:log-algebra`; `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`; `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.freePrelogResolutions`.

Prove the following named laws.

- `freePrelogUniversal`: A base prelog map from the free object is uniquely determined by its ordinary ring generators and compatible monoid generators.
- `prelogResolutionAugmentation`: The canonical resolution has a surjective augmentation on ring and monoid in every simplicial degree.
- `prelogResolutionComparison`: Projective resolutions compare coherently after realization.
- `prelogAnimationExtend`: A sifted-colimit preserving enhanced prelog functor is determined on the finite free objects.

**Checks.**

- `test_prelog_free_empty`: With both generator sets empty the free object is (A,M).
- `test_prelog_free_two_generators`: One ordinary t and one monoid x give (A[t,x],M⊕N), with x the image of the monoid generator.
- `test_prelog_free_no_identification`: The monoid generator x is not freely mapped independently of its ring image; forgetting this compatibility gives the wrong adjunction.

### 6.2 Derived logarithmic derivations


For a map (A,M)→(B,N) and a connective animated B-module P, define the derived log derivation space as the space of base-compatible sections of (B⊕P,N⊕P)→(B,N). The ring is the split square-zero extension, the monoid operation is (n,u)(n′,u′)=(nn′,u+u′), and its structure sends (n,u) to (α(n),α(n)u). For discrete modules the sections are a ring derivation D:B→P and additive log derivative δ:N→P satisfying D(α(n))=α(n)δ(n), with both zero on the base.

[Bhatt12], Remark 6.6 and displayed equivalence (6), pp.25–26.

*Needs:* Layer 6: Free prelog resolutions and animation; Layer 0: Derived derivations and square-zero extensions; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logDerivedDerivations`.

Prove the following named laws.

- `logDerivationsDiscrete`: π₀ for a discrete module is the compatible pair (D,δ) satisfying Dα=αδ.
- `logDerivationsModuleMap`: A B-linear P→P′ induces the coherent map of section spaces.
- `logDerivationsFree`: For finite free prelog generators the sections are freely specified by ordinary D(t) and logarithmic δ(x).
- `logDerivationsRepresented`: The Gabber cotangent represents this functor by Map_B(L_log,P).

**Checks.**

- `test_log_derivations_identity`: For the identity prelog map, the section space is contractible.
- `test_log_derivations_coordinate`: For (A,0)→(A[x],N), a log derivation has D(x)=xδ(1).
- `test_log_derivations_log_point`: For (k,0)→(k,N→0), discrete derivations have D=0 and arbitrary δ(1)∈P; the representing derived object still has an additional negative cotangent term.

### 6.3 The Gabber logarithmic cotangent complex


**Proof input gap.** The Gabber definition and the stated integral comparison are located in Bhatt and Koshikawa–Yao. The original Gabber–Olsson proof interiors, including logification, must be supplied by the log-algebra interface.

For an animated prelog map (A,M)→(B,N), define L_log by realizing Ω¹_log of the common free prelog resolution and derived-extending its module coefficients to B. It represents the independently defined log derivation space, is natural and resolution-independent, and has the universal ring derivation d and monoid map d log. For ordinary rings H⁰ is the imported ordinary logarithmic differential module, with dα(n)=α(n)d log n. This is Gabber’s complex; Olsson’s complex is identified only in the proved integral morphism range, not for all log smooth maps.

[Bhatt12], Definition 6.3, Remark 6.4, Proposition 6.5 and Remark 6.6, pp.24–26; [KY], Definition 2.5, Lemmas 2.9–2.10, Remark 2.13, pp.13–15.

*Needs:* Layer 6: Free prelog resolutions and animation; Layer 6: Derived logarithmic derivations; Layer 0: The full cotangent complex; `CrystallineCohomology:CR.5:log-algebra`; `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.gabberLogCotangent`.

Prove the following named laws.

- `logCotangentUniversal`: Map_B(L_log,P)≃Der_log((B,N)/(A,M),P).
- `logCotangentH0`: For ordinary inputs H⁰L_log≃Ω¹_log with the displayed d/d log relation.
- `logCotangentOrdinaryMap`: There is a natural map L_(B/A)→L_log, an equivalence when the monoid map is an isomorphism.
- `logCotangentNaturality`: Base-compatible prelog squares give coherent maps of the complexes and the universal d/d log.

**Checks.**

- `test_log_cotangent_identity`: An identity prelog map has zero cotangent complex.
- `test_log_cotangent_free`: For (A,0)→(A[t,x],N), L_log is free in degree zero on dt and d log x, with dx=x d log x.
- `test_log_cotangent_nonintegral`: KY Remark 2.13 with P generated by (2,0),(0,2),(1,1) inside N² and char(k)≠2 is log étale but has unbounded Gabber cotangent homology.

### 6.4 Log cotangent transitivity, base change and invariance


**Proof input gap.** The comparison and functoriality statements are located; their original Olsson proof interiors remain an explicit supplier obligation.

For composable animated prelog maps R→S→T, L_log(S/R)⊗^L_S T→L_log(T/R)→L_log(T/S) is a canonical fiber sequence. A homotopy pushout of prelog rings gives the corresponding derived cotangent base-change equivalence, and filtered colimits commute with L_log. Passage to the associated log structure preserves the Gabber cotangent complex in the source’s established log-equivalence range; a map inducing an isomorphism of associated log rings has relative cotangent zero. For an integral morphism of integral prelog rings that is log smooth after logification, L_log≃Ω¹_log. The derived pushout is replaced by the ordinary one only under the homological log-flat condition.

[KY], Lemmas 2.10,2.14, Theorem 2.11 and Remark 2.12, pp.14–16.

*Needs:* Layer 6: The Gabber logarithmic cotangent complex; Layer 6: Free prelog resolutions and animation; Layer 0: The cotangent transitivity triangle; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logCotangentFunctoriality`.

### 6.5 Homological logarithmic flatness


A prelog map R→S is homologically log flat (hlf) if every prelog base map R→S′ makes the derived pushout S′⊔^L_R S equivalent to its ordinary pushout. It is hlf faithfully flat if additionally the underlying ring map is faithfully flat. Equivalently require ordinary ring flatness and the monoid homotopy-pushout flatness of Bhatt Definition 4.8. This is different from Kato log flatness in both directions. Coverings define the hlf topology on prelog algebras.

[KY], Definition 2.44 and Remarks 2.45–2.46, pp.23–24; [Bhatt12], Definition 4.8 and Proposition 4.9, pp.20–21.

*Needs:* Layer 6: Free prelog resolutions and animation; Layer 6: Log cotangent transitivity, base change and invariance; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.homologicalLogFlatness`.

Prove the following named laws.

- `hlfUnderlyingCriteria`: Hlf iff ring-flat and monoid homotopy-pushout-flat.
- `hlfPushoutOrdinary`: Every base change has the displayed derived-to-ordinary pushout equivalence.
- `hlfCompositionBaseChange`: Hlf and hlf faithful-flat maps are stable under composition and base change.
- `hlfIntegralSufficient`: An underlying flat ring map with injective integral map of integral monoids is hlf.

**Checks.**

- `test_hlf_strict_flat`: A strict map with flat underlying ring is hlf.
- `test_hlf_diagonal`: The diagonal (k,N→0)→(k,N²→0) is hlf but not Kato log flat.
- `test_hlf_nonintegral_kato`: For P generated by (2,0),(0,2),(1,1) in Q=N², (k[P],P)→(k[Q],Q) is Kato log flat but not hlf.

**Log de Rham, Cartier and logification.**

Realize the ordinary logarithmic complex, then prove the derived graded identifications. Scalar rings, shifts and the ring/monoid homotopy pushout are part of every comparison. Ordinary d and closed d log have different generator formulas.

### 6.6 Logarithmic derived de Rham


For an animated prelog map (A,M)→(B,N), realize the ordinary log de Rham dg algebra of the common free prelog resolution with direct sums along antidiagonals. This gives an E∞ A-algebra dR_log with universal ordinary d and closed d log:N→dR_log[1]. It has a decreasing multiplicative Hodge filtration with gr_H^i≃L∧^i_B L_log[−i], an increasing exhaustive conjugate filtration, a separate Hodge completion and the Layer 1 p-completion. Strict maps with identical monoids recover ordinary derived de Rham. The derived algebra is A-linear; its full differential is generally not B-linear.

[Bhatt12], Definition 6.8, Proposition 6.9, Remarks 6.10–6.11, pp.25–26; [KY], Construction 2.6, p.13.

*Needs:* Layer 6: Free prelog resolutions and animation; Layer 6: The Gabber logarithmic cotangent complex; Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: The universal differential graded algebra; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham; Layer 0: Derived exterior powers; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logDerivedDeRham`.

Prove the following named laws.

- `logDeRhamHodgeGraded`: gr_H^i dR_log≃L∧^i L_log[−i].
- `logDeRhamDLog`: The additive monoid map d log is closed and lands in dR_log[1].
- `logDeRhamStrict`: For identical base and target monoids, dR_log is ordinary derived de Rham.
- `logDeRhamCompletions`: Hodge and p-completion are separate functors with their specified universal maps and quotient towers.

**Checks.**

- `test_log_derham_identity`: An identity prelog map gives the base ring with no positive Hodge pieces.
- `test_log_derham_free_coordinate`: For (F_p,0)→(F_p[x],N), d(x)=x d log x and d(d log x)=0.
- `test_log_derham_rational_logification`: Bhatt Example 6.15: strict Q→Q[x,x⁻¹] gives uncompleted dR=Q, while logifying the units adds a degree-one conjugate class.

### 6.7 Log de Rham base change and Künneth


For a homotopy pushout of prelog A-algebras S₁,S₂ with result S, dR_log(S₁/A)⊗^L_A S₂≃dR_log(S/S₂), and dR_log(S₁/A)⊗^L_A dR_log(S₂/A)≃dR_log(S/A), compatibly with the Hodge filtrations and multiplication. The p-completed versions use completed derived tensor. The first tensor is over the base ring A; dR_log(S₁/A) is not generally an S₁-module, so the additional S₁-relative tensor printed in KY Theorem 2.11 is not used.

[Bhatt12], Proposition 6.12 and proof, p.26; [KY], Theorem 2.11, second displayed formula p.15.

*Needs:* Layer 6: Logarithmic derived de Rham; Layer 6: Free prelog resolutions and animation; Layer 6: Homological logarithmic flatness; Layer 2: Derived base change and Künneth; Layer 1: Completed filtered tensor products.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logDeRhamBaseChange`.

### 6.8 Derived logarithmic Cartier theory


For a map (A,M)→(B,N) of prelog F_p-algebras, define the Frobenius of the base by p on M and Frobenius on A and form the homotopy prelog pushout (B,N)^(1). The relative Frobenius maps it to (B,N). The increasing conjugate filtration of dR_log is linear over its twisted underlying ring and gr_i^conj≃L∧^i L_log((B,N)^(1)/(A,M))[−i]. On free ordinary coordinates y, inverse Cartier sends dy to [y^(p−1)dy]; on free log coordinates x it sends d log x to [d log x]. All twists are derived unless the ring and monoid flatness criteria are proved.

[Bhatt12], Notation 7.1, Lemma 7.2, Theorem 7.3 and Proposition 7.4, pp.27–28; [KY], Notation 2.15 and Construction 2.6, pp.13,16.

*Needs:* Layer 6: Logarithmic derived de Rham; Layer 6: Free prelog resolutions and animation; Layer 6: Log cotangent transitivity, base change and invariance; Layer 3: The derived Frobenius twist; Layer 3: Derived Cartier graded pieces; Layer 0: Derived exterior powers; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logCartier`.

### 6.9 The boundary of logification invariance


For maps of integral prelog Z/p^n-algebras, n≥1, passage to associated log structures preserves uncompleted log derived de Rham with its specified Hodge and conjugate filtrations. The proof uses the derived logarithmic Cartier pieces modulo p and finite p-devissage. The p-completed statement follows under the corresponding integral and compatible derived-reduction hypotheses. No characteristic-zero uncompleted invariance is asserted: Bhatt Example 6.15 is a required counterexample. Cotangent logification invariance and this de Rham assertion have different ranges.

[Bhatt12], Corollary 7.5 and proof, pp.28–29; Example 6.15, p.27.

*Needs:* Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Derived logarithmic Cartier theory; Layer 6: Logarithmic derived de Rham; Layer 1: The derived completion reflector; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logificationBoundaries`.

### 6.10 Integral log smooth Cartier-type comparison


For a map of integral prelog F_p-algebras that is integral and log smooth of Cartier type after associated logification, Gabber L_log is the ordinary log differential module and derived log de Rham agrees with the ordinary log complex. Nilpotent-p extensions retain flatness and finite devissage hypotheses. Cartier type is the source’s condition on the relative Frobenius exactness and twist; it is not inferred from fs log smoothness alone.

[Bhatt12], Corollary 7.6 and its proof, pp.28–29; [KY], Lemma 2.14, pp.15–16.

*Needs:* Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Derived logarithmic Cartier theory; Layer 6: The boundary of logification invariance; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logSmoothCartierComparison`.

**Log crystalline comparison in the regular range.**

Exactify before taking the strict PD envelope. The equivalence theorem requires a regular-sequence quotient after the Cartier-type log smooth map. Construct compatible regular presentations for the inductive-limit applications and prove the filtered PD/site exchange used there.

### 6.11 The log crystalline comparison map


**Proof input gap.** The comparison construction needs exactification and the log PD Poincaré proof from the crystalline log-algebra interface. Their original Kato/Olsson proof inputs remain unsupplied.

For a prelog Z/p^n-map f:(A,M)→(B,N), use the standard free prelog resolution P•→(B,N). For every effective epimorphism P_i→(B,N), first exactify it, then form the ordinary strict PD envelope compatible with p. The natural map Ω•_log(P•/(A,M))→Ω•_log(P•/(A,M))⊗_(P•,Alg)D_log(P•→(B,N)) yields Comp_log:dR_log(f)→RΓ(f_log-crys,O_crys) via the imported log PD Poincaré equivalence. It is natural, multiplicative and respects Hodge/PD filtrations. Strictification is performed before taking the PD envelope.

[Bhatt12], Proposition 7.18 and proof, p.30.

*Needs:* Layer 6: Free prelog resolutions and animation; Layer 6: Logarithmic derived de Rham; Layer 4: The derived de Rham to crystalline map; `CrystallineCohomology:CR.5:log-algebra`; `CrystallineCohomology:CR.0`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logCrystallineComparisonMap`.

Prove the following named laws.

- `logCrystallineComparisonNatural`: Prelog base squares induce the commuting comparison-map squares.
- `logCrystallineComparisonFiltered`: Hodge terms map to the log crystalline PD filtration.
- `logCrystallineComparisonStrict`: For strict maps with fixed log structure the map is the ordinary Comp.
- `logCrystallineComparisonExactification`: The target model uses the exactification followed by the strict PD envelope, functorially.

**Checks.**

- `test_log_crys_identity`: For an identity log map, Comp is the base identity.
- `test_log_crys_strict_regular`: A strict regular quotient in the nilpotent-p flat range agrees with the Layer 4 PD comparison.
- `test_log_crys_noncartier`: Bhatt Example 7.23 has a comparison map but its relative Frobenius-twisted source and ordinary crystalline target differ.

### 6.12 The corrected logarithmic lci condition


**Proof input gap.** The finite regular-quotient correction is explicit. The asserted filtered-colimit extension and all three Example 7.21 presentations need compatible regular factorizations and a checked crystalline-colimit exchange. The printed strict-epimorphism criterion cannot establish them.

For n≥1 use the following G-lci condition on a prelog Z/p^n-map with flat source and target. Locally it factors as a log smooth map of Cartier type modulo p followed by a strict surjection with kernel generated by a regular sequence. An inductive-limit version consists of compatible such factorizations and regular-sequence presentations, with comparison compatible with their filtered colimit. A strict effective epimorphism without the regular-sequence condition does not suffice.

[Bhatt12], Definition 7.20, Example 7.21 and Theorem 7.22 proof sketch, p.31.

*Needs:* Layer 6: Integral log smooth Cartier-type comparison; Layer 6: The log crystalline comparison map; Layer 0: Regular quotients and two-term models; `CrystallineCohomology:CR.5:log-algebra`; [`RingTheory.Sequence.IsWeaklyRegular`][lib-42]; [`RingTheory.Sequence.IsRegular`][lib-43].

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.correctedLogLciCondition`.

Prove the following named laws.

- `correctedGLciFactorization`: The condition returns the chosen factorization with its regular quotient and modulo-p Cartier witnesses.
- `correctedGLciStrictRegular`: A strict regular quotient of flat Z/p^n-algebras is in the condition, with identity first factor.
- `correctedGLciLocalFiltered`: Local regular presentations and the specified compatible filtered colimit factorizations retain the comparison criterion.
- `correctedGLciExample721`: All three source examples are supplied with the appropriate finite or filtered regular quotient presentation.

**Checks.**

- `test_corrected_glci_identity`: The identity map has empty regular sequence and Cartier-type first factor.
- `test_corrected_glci_hypersurface`: The strict quotient F_p[t]→F_p by the regular element t qualifies.
- `test_corrected_glci_square_zero`: F_p→F_p[x,y]→F_p[x,y]/(x,y)² with trivial logs satisfies the printed condition but fails this corrected regular quotient condition.

### 6.13 The corrected log crystalline comparison theorem


**Proof input gap.** The finite corrected factorization has the stated proof route. Its filtered and p-adic versions need the compatible presentations and exchange theorem in the preceding source gap.

For a corrected G-lci prelog Z/p^n-map, Comp_log is an equivalence of Hodge-filtered E∞ algebras. Its compatible p-adic version uses derived limits of flat finite reductions with the same corrected factorization. The proof combines integral Cartier-type log smooth comparison for a with the Layer 4 regular quotient comparison for b and the logarithmic relative conjugate filtration. This is the valid scope of Bhatt Theorem 7.22 after repairing Definition 7.20. Neither arbitrary strict surjections nor every fs log smooth map are included.

[Bhatt12], Theorem 7.22 proof sketch and Proposition 7.8, pp.29,31.

*Needs:* Layer 6: The corrected logarithmic lci condition; Layer 6: The log crystalline comparison map; Layer 6: Integral log smooth Cartier-type comparison; Layer 6: Derived logarithmic Cartier theory; Layer 6: Log de Rham base change and Künneth; Layer 4: Regular quotients and classical PD envelopes; Layer 5: The lci crystalline comparison theorem; Layer 5: p-adic crystalline comparison by derived limits; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logLciCrystallineComparison`.

**Log QSyn, QRSP covers and descent.**

The general prelog sites allow nonintegral monoids. Prove the two-sort completed pushout and reduction lemmas, the tilt-surjectivity criterion, and the connectivity estimates before exchanging completion with Čech totalization.

### 6.14 Log quasisyntomic sites and QRSP bases


**Proof input gap.** The completed hlf pushout and descent statements are located in Koshikawa–Yao. The two-sort completion argument, monoid derived-reduction and boundedness interfaces must still be decomposed into suppliers.

A log-quasisyntomic prelog ring (R,P) has R p-complete with bounded p-torsion and Gabber L_log((R,P)/Z_p) of p-complete Tor amplitude [−1,0]; P need not be integral in KY Definition 3.2. A map A→B between bounded-torsion p-complete prelog rings is p-completely homologically log flat when B⊗^L_A A/p≃B/p is discrete and A/p→B/p is hlf. It is log-quasisyntomic when additionally L_log(B/A)⊗^L_B B/p has Tor amplitude [−1,0], and a cover when the mod-p map is hlf faithfully flat. These covers define QSyn_prelog and the relative qSyn_(R,P) of log-quasisyntomic maps. For a perfectoid prelog base, the big slice has the analogous amplitude/descent package. Integral monoids are an additional restriction of the later log-smooth/prismatic applications, not built into the general site definition.

[KY], Definitions 3.1–3.3, Lemmas 3.5–3.6, Corollary 3.7 and Remarks 3.8–3.9, pp.27–28.

*Needs:* Layer 6: Homological logarithmic flatness; Layer 6: The Gabber logarithmic cotangent complex; Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Free prelog resolutions and animation; Layer 5: The quasisyntomic sites; Layer 5: Compatible-root quasisyntomic covers; Layer 5: Sheaves and unfolding from the QRSP basis; Layer 1: Complete flatness and complete faithful flatness; `PerfectoidQuotients:Q0:integral-algebra`; `CrystallineCohomology:CR.5:log-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logQuasisyntomicSites`.

Prove the following named laws.

- `logQSynCover`: A cover retains complete faithful-flatness, completed hlf and relative log cotangent amplitude [−1,0].
- `logQSynBaseChange`: The completed homotopy prelog base change preserves the stated covers.
- `logQSynQrspBasis`: The separate compatible-root construction gives general prelog QRSP basis objects; integrality of an output is checked separately when an application needs it.
- `logQSynUnfolding`: Restriction to the KY general prelog QRSP basis and enhanced totalization are inverse sheaf constructions.

**Checks.**

- `test_log_qsyn_strict`: With identical monoids and the strict conventions, the ordinary QSyn condition is recovered.
- `test_log_qsyn_semistable`: The p-complete integral semistable chart is log quasisyntomic over its logarithmic O_K base.
- `test_log_qsyn_hlf_boundary`: A Kato log-flat map that is not hlf fails the log QSyn cover condition, even if its ring reduction is flat.

### 6.15 Log quasiregular semiperfectoid objects


**Proof input gap.** The definition is located, but the perfectoid-source and monoid-root arguments still need the two-sort completion and boundedness interfaces.

For a p-complete prelog ring (S,P), let P^♭=lim_(×p)P and P× be its units. It is log semiperfectoid in KY Definition 3.11 if (1) S admits a map from an integral perfectoid ring, (2) Frobenius on S/p is surjective, and (3) P^♭→P/P× is surjective. It is log quasiregular semiperfectoid if also (S,P) is log quasisyntomic. Integrality of P is a separately stated additional hypothesis, and is not imposed by this definition. The tilt-surjectivity clause is stronger than p-divisibility of P/P× and weaker than p-divisibility of P; these are not interchanged. Such objects have Λ_p L_log((S,P)/Z_p)[−1] complete-flat. Equivalently, with the log-semiperfect assumptions, require this shifted relative cotangent criterion for a perfectoid ring source equipped with trivial prelog structure.

[KY], Definition 3.11, Remarks 3.12–3.15 and Lemma 3.16, pp.29–31.

*Needs:* Layer 6: Log quasisyntomic sites and QRSP bases; Layer 6: The Gabber logarithmic cotangent complex; Layer 6: Log cotangent transitivity, base change and invariance; `PerfectoidQuotients:Q0:integral-algebra`; `CrystallineCohomology:CR.5:log-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logQuasiregularSemiperfectoid`.

Prove the following named laws.

- `logQrspTiltCondition`: P^♭→P/P× is surjective, with the ring perfectoid-source and semiperfectness conditions.
- `logQrspCotangent`: Under log semiperfectness, the shifted relative log cotangent is complete-flat exactly in the log QRSP range.
- `logQrspPerfectoidSource`: The stated completed source prelog ring surjects on rings and modulo monoid units.
- `logQrspDivisibilityRelations`: P p-divisible implies tilt-surjectivity, which implies P/P× p-divisible; for sharp monoids the three conditions agree.

**Checks.**

- `test_log_qrsp_trivial`: For trivial monoids the condition reduces to the ordinary QRSP ring condition.
- `test_log_qrsp_divisible`: If S is ordinary QRSP and P is uniquely p-divisible, then (S,P) is log QRSP by KY Example 3.15(1).
- `test_log_qrsp_missing_ring_source`: (Z_p,0) has semiperfect reduction and the tilt condition, but lacks a perfectoid ring map and is excluded.

### 6.16 Compatible-root covers of prelog rings


**Proof input gap.** The general prelog compatible-root cover proof requires the monoid and completion interfaces from the preceding source gap, beyond adjoining roots on the ring alone.

For (R,P)∈QSyn_prelog, choose ring generators Z_p[X_i]→R and monoid generators N^(J)→P. Use the free p-complete prelog source (Z_p⟨X_i,Y_j⟩,N^(J)), with e_j↦Y_j, and its compatible-root cover (O_C⟨X_i^(1/p^∞),Y_j^(1/p^∞)⟩,N[1/p]^(J)) over an integral perfectoid O_C. The p-completed homotopy prelog base change to (R,P) gives a log QSyn cover by log QRSP objects, and its target monoid is p-divisible. The target need not be integral. All completed Čech terms remain log QRSP; restriction to this basis is an equivalence of sheaf categories in any presentable enhanced target.

[KY], Lemmas 3.17–3.19 and Corollary 3.20 with proof, pp.31–32.

*Needs:* Layer 6: Log quasisyntomic sites and QRSP bases; Layer 6: Log quasiregular semiperfectoid objects; Layer 6: Free prelog resolutions and animation; Layer 6: Homological logarithmic flatness; Layer 5: Compatible-root quasisyntomic covers; Layer 5: Sheaves and unfolding from the QRSP basis; `PerfectoidQuotients:Q0:integral-algebra`; `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logCompatibleRootCovers`.

Prove the following named laws.

- `logRootCover`: The displayed completed two-sort pushout gives a log QSyn cover with log QRSP target.
- `logRootCoverMonoid`: The target monoid is p-divisible and satisfies the tilt-surjectivity condition.
- `logRootCoverCech`: Every completed Čech term is log QRSP.
- `logRootCoverUnfolding`: General prelog log QRSP basis sheaves unfold by the corresponding Čech totalization, independently of the cover.

**Checks.**

- `test_log_root_cover_trivial`: With no monoid generators, the construction specializes to the ordinary ring compatible-root cover.
- `test_log_root_cover_coordinate`: A free monoid coordinate x acquires compatible monoid roots and matching ring roots x^(1/p^n).
- `test_log_root_cover_finite`: One finite root stage does not make the monoid p-divisible or the ring reduction semiperfect.

### 6.17 Log cotangent powers and completed de Rham descent


**Proof input gap.** The hlf descent proof and the bounded-connectivity reason for p-completed de Rham descent are located. Their use on general prelog QRSP covers still depends on the unsupplied two-sort completion interfaces.

For a fixed prelog base, derived exterior powers of the Gabber log cotangent satisfy hlf faithfully-flat Čech descent. Finite Hodge quotients of log derived de Rham inherit descent; the Hodge-completed object descends by its quotient limit. In the log-quasisyntomic range, p-completed uncompleted log de Rham descends using the uniformly bounded-below conjugate filtration. The completion and totalization exchanges retain their boundedness hypotheses and the actual prelog homotopy Čech nerve.

[KY], Proposition 2.47, Remark 2.48 and Corollary 2.49, pp.24–26; Corollary 3.10, p.29.

*Needs:* Layer 6: Homological logarithmic flatness; Layer 6: Log quasisyntomic sites and QRSP bases; Layer 6: Compatible-root covers of prelog rings; Layer 6: Derived logarithmic Cartier theory; Layer 6: Logarithmic derived de Rham; Layer 0: Exterior powers of a triangle; Layer 5: Descent of completed cotangent powers; Layer 5: Descent of Hodge quotients and completion; Layer 5: Descent of p-completed uncompleted de Rham; Layer 1: Valid exchanges of completion and derived operations.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logPowerDeRhamDescent`.

**Log points, semistable charts and periods.**

Calculate the relative log structure against its actual base chart. Finally apply the ordinary and logarithmic period identifications to the Tate-module d log map, retaining filtration and Galois equivariance.

### 6.18 The log point and its full cotangent complex


For a field k, the standard log point is (k,N) with every positive monoid element sent to 0. Over the trivial prelog base (k,0), its Gabber complex is [k --0→ k] in cohomological degrees −1,0: factor through the free log line (k[t],N), then the strict regular quotient t=0, whose conormal maps to t d log t=0. H⁰ is k·d log 1 and H^(−1) is k; the log point over this trivial base is not assigned the integral log-smooth degree-zero theorem. Over itself the relative complex is zero and derived de Rham is k. Over F_p its Hodge/conjugate powers retain both cotangent degrees and the actual derived twist.

[Bhatt12], Example 6.2, Proposition 6.5 and the strict regular quotient calculation §§3.3,6, pp.16–18,24–25.

*Needs:* Layer 6: The Gabber logarithmic cotangent complex; Layer 6: Log cotangent transitivity, base change and invariance; Layer 6: Logarithmic derived de Rham; Layer 6: Derived logarithmic Cartier theory; Layer 0: Regular quotients and two-term models.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logPointExample`.

### 6.19 The semistable chart with its actual monoid map


Let O_K be a complete mixed-characteristic DVR with uniformizer π and perfect residue field. For 1≤r≤d, B=O_K[x₁,…,x_d]/(x₁…x_r−π), or its p-adic completion, carries the chart N^r→B, e_i↦x_i. The base chart is N→O_K, 1↦π, and the monoid map sends 1↦e₁+…+e_r. This is an integral log smooth Cartier-type chart; its relative Gabber cotangent is the finite free module on d log x₁,…,d log x_r, dx_(r+1),…,dx_d modulo Σd log x_i=0, in degree zero and rank d−1. For the completed chart use continuous completed differentials. The log de Rham Hodge and conjugate pieces, finite reductions and crystalline comparison retain this base chart; the unrelated trivial log base has a different cotangent complex.

[Bhatt12], Example 7.21, third example, p.31.

*Needs:* Layer 6: Integral log smooth Cartier-type comparison; Layer 6: The corrected log crystalline comparison theorem; Layer 6: Logarithmic derived de Rham; Layer 6: Derived logarithmic Cartier theory; Layer 2: The de Rham algebra of a completely smooth formal algebra; `CrystallineCohomology:CR.5:log-algebra`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.semistableChartExample`.

### 6.20 Logarithmic period d log and the Tate map


**Proof input gap.** The Tate-map statement and PD logarithm are located. Its corrected filtered G-lci applications require the compatible regular presentations above; the Fontaine and equivariant uniqueness inputs must be supplied in their mixed-characteristic range.

In the W,K,C period setup, the canonical uniquely divisible log structure on O_barK gives Λ_p L_(O_barK/W)≃Λ_p L_log((O_barK,can)/W) and Λ_p dR_log≃A_cris. Completing d log:μ_(p^∞)→dR_log[1] yields β:Z_p(1)→Fil_H¹ A_cris, G_K-equivariantly. Under the shared period identification β sends a compatible root-of-unity system ε to log([ε]); the logarithm converges in the imported completed PD ring. Z_p(1), the Galois action, and Tate’s period invariant theorem are imported from their arithmetic/period owners.

[Bhatt12], Proposition 9.11, Proposition 9.13, Construction 9.15 and Proposition 9.16, pp.35–38.

*Needs:* Layer 6: Logarithmic derived de Rham; Layer 6: Derived logarithmic Cartier theory; Layer 6: The boundary of logification invariance; Layer 5: The derived de Rham description of A_cris; Layer 5: Hodge completion and B_dR⁺; Layer 1: The derived completion reflector; `AInfCohomology:AI.0:integral`; `PadicHodgeTheory:R06.1`; `ArithmeticGaloisRepresentations:R01.1`.

The named construction or statement is `TauCetiRoadmap.DerivedDeRhamCohomology.DerivedDeRham.logPeriodDlog`.

Prove the following named laws.

- `logPeriodOrdinaryComparison`: The completed canonical log and ordinary period de Rham objects agree in this uniquely divisible setup.
- `periodDLogTate`: β:Z_p(1)→Fil_H¹ A_cris is G_K-equivariant.
- `periodDLogFormula`: β(ε)=log([ε]) in the shared completed PD period ring.
- `periodDLogFirstGraded`: The first Hodge graded map agrees with the completed d log cotangent/conormal class.

**Checks.**

- `test_period_dlog_identity`: The identity compatible root-of-unity system maps to log(1)=0.
- `test_period_dlog_roots`: For compatible ε, β(ε^a)=aβ(ε) and G_K acts through the Tate twist.
- `test_period_dlog_logarithm_domain`: An arbitrary A_inf unit whose image is not 1 under θ is not assigned this Fil_H¹ PD logarithm by the construction.

### Examples

The free log line satisfies dx=x d log x. Over the trivial log base the standard log point has k in both cotangent degrees −1 and 0, while the identity log point has zero relative cotangent complex. In the semistable chart r=d=1, the relation d log x=0 leaves rank zero; for r=2,d=2 the relation d log x₁+d log x₂=0 leaves rank one. The root-of-unity identity maps to log(1)=0 in the period construction.

### Dependencies

Layers 0–5 and CrystallineCohomology’s log-algebra interface supply the ordinary and derived operations used here. The general prelog root constructions retain their two-sort proof input gap; the period application retains the tier-13 dependency gap.

## Downstream consumers

CrystallineCohomology consumes the regular and logarithmic comparison maps. AInfCohomology, PerfectoidQuotients and PrismaticCohomology consume completed cotangent powers, quasisyntomic descent and QRSP calculations. PadicHodgeTheory uses the derived period comparisons. MotivicEtaleKTheory uses the ordinary differential-symbol API, independently of the derived layers.

## References

References use the page numbering of the listed edition. BMS19 pages are the published IHÉS pages; Avramov and Iyengar use printed journal/chapter pages. Stacks chapter PDFs use chapter-local page numbers while theorem numbers retain their online chapter prefix. Stable tags identify the corresponding statements in the living text. Code references use file and line numbers instead of pages.

The statements above incorporate the following source conventions. In [Bhatt12], Proposition 2.3, p.5, the resolution is of B; Notation 3.1, p.6, twists B relative to A; Proposition 3.5, p.7, includes the weight shift [−i]. Definition 7.20 and Theorem 7.22, p.31, are used with the regular-sequence strict quotient and flatness hypotheses stated in Layer 6. In Remark 6.6 and Proposition 6.12, pp.25–26, the derivation section is over B and the second target factor is B₂. In Remark 8.7, p.32, nontorsion in the completed torsion sum is detected by coordinates p^floor(n/2), whose orders grow, rather than p^(n−1), all killed by p.

For [BMS19], Definition 5.1, p.233, a decreasing filtration has gr^i=cofib(F^(i+1)→F^i). In Theorem 5.4 and Proposition 5.6, pp.234–238, use the cohomological Ext^(i+c) formula specified in Layer 1; the companion Ext display in the proof of Theorem 5.4, p.236, has degree a+i−j. In Proposition 8.13(3), p.274, divided-Frobenius injectivity concerns the Nygaard graded piece. For [KY], Construction 2.6, p.13, both de Rham graded formulas carry [−i]. Theorem 2.11, pp.14–15, uses the base-ring tensor for the full de Rham complex; the invalid tensor over the target ring is excluded. In Lemma 2.14, pp.15–16, retain the source and target assignments of the statement when using the proof.

The integral resolution, power and crystalline arguments must respect the author corrections [IllusieI], [IllusieII] and [BOErratum]. In particular an arbitrary quotient of differentials need not carry the induced exterior differential without stability of its kernel, and a compatible inverse system is represented by the corrected projective/surjective derived model. No theorem here is justified by copying the uncorrected assertion.

- **Bhatt12**: Bhargav Bhatt, *p-adic derived de Rham cohomology*. arXiv:1204.6560v1, 30 April 2012, 50-page PDF.

- **StacksDR**: The Stacks Project Authors, *The de Rham complex, Section 10.132*. online text; chapter PDF build 88ff78, 14 July 2026.

- **StacksExterior**: The Stacks Project Authors, *Kernel of the tensor-to-exterior map, Lemma 10.13.4*. online text; chapter PDF build 88ff78, 14 July 2026.

- **Riou**: Joël Riou, *feat(AlgebraicGeometry): the algebraic De Rham complex*. Unmerged Mathlib PR 18551, head 5888c0081ba867ede5c60d3060f2d674d932b53c.

- **IllusieI**: Luc Illusie, *Errata: Complexe cotangent et déformations I*. Author erratum.

- **IllusieII**: Luc Illusie, *Errata: Complexe cotangent et déformations II*. Author erratum.

- **BOErratum**: Pierre Berthelot and Arthur Ogus, *Erratum to Notes on crystalline cohomology*. Author erratum dated 21 August 2013.

- **BMS19**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*. Published, Publ. Math. IHÉS 129 (2019), pp.199–310.

- **BL22**: Bhargav Bhatt and Jacob Lurie, *Absolute prismatic cohomology*. arXiv:2201.06120v1.

- **StacksCt**: The Stacks Project Authors, *The cotangent complex*. PDF build 88ff78, 14 July 2026.

- **StacksMA**: The Stacks Project Authors, *More on Algebra: Koszul complexes and derived completion*. Chapter PDF build 88ff78, 14 July 2026.

- **Prisms**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*. arXiv:1905.08229v4.

- **BM**: Bhargav Bhatt and Akhil Mathew, *Syntomic complexes and p-adic étale Tate twists*. arXiv:2202.04818v2.

- **CMM**: Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*. arXiv:1803.10897v2.

- **DM**: Bjørn Ian Dundas and Matthew Morrow, *Finite generation and continuity of topological Hochschild and cyclic homology*. arXiv:1403.0534v1.

- **Avramov**: Luchezar L. Avramov, *Locally complete intersection homomorphisms and a conjecture of Quillen on the vanishing of cotangent homology*. arXiv:math/9909192.

- **Iyengar**: Srikanth Iyengar, *André–Quillen homology of commutative algebras*. Contemporary Mathematics 436 (2007), freely accessible MIT chapter copy.

- **BhattDS**: Bhargav Bhatt, *On the direct summand conjecture and its derived variant*. arXiv:1608.08882v2.

- **BMaEtAl**: Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and Jakub Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*. arXiv:2012.15801v3.

- **KY**: Teruhisa Koshikawa and Zijian Yao, *Logarithmic prismatic cohomology II*. arXiv:2306.00364v1.

- **GP**: Owen Gwilliam and Dmitri Pavlov, *Enhancing the filtered derived category*. arXiv:1602.01515v3, 1 May 2018.

- **FGauges**: Bhargav Bhatt, *Prismatic F-gauges*. Author lecture notes, MAT 549, Fall 2022; 2026 PDF.

- **StacksProper**: The Stacks Project Authors, *Cohomology and base change, VI (Section 36.30)*. online text; chapter PDF build 88ff78, 14 July 2026.

- **StacksLift**: The Stacks Project Authors, *Smoothing ring maps: lifting smooth algebras*. online text; chapter PDF build 88ff78, 14 July 2026.

[lib-11]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean
[lib-37]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean
[lib-38]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean
[lib-39]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean
[lib-40]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean
[lib-33]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/ToSquareZero.lean
[lib-28]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean
[lib-29]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean
[lib-30]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean
[lib-31]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean
[lib-32]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean
[lib-8]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean
[lib-24]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean
[lib-46]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean
[lib-2]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Alternating/Basic.lean
[lib-3]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean
[lib-44]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean
[lib-41]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean
[lib-12]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean
[lib-22]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean
[lib-10]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean
[lib-23]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean
[lib-16]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean
[lib-25]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean
[lib-15]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean
[lib-19]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean
[lib-17]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Presentation/RestrictScalars.lean
[lib-4]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean
[lib-6]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean
[lib-1]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Alternating/Basic.lean
[lib-21]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean
[lib-14]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Polynomial.lean
[lib-18]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Derivative.lean
[lib-13]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Polynomial.lean
[lib-7]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean
[lib-9]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean
[lib-26]: https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Kaehler/MapSemilinear.lean
[lib-27]: https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Kaehler/MapSemilinear.lean
[lib-20]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean
[lib-45]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean
[lib-5]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean
[lib-34]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowers/Basic.lean
[lib-35]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean
[lib-36]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean
[lib-42]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean
[lib-43]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean
[Bhatt12]: https://arxiv.org/pdf/1204.6560v1
[StacksDR]: https://stacks.math.columbia.edu/tag/0FKF
[StacksExterior]: https://stacks.math.columbia.edu/tag/0H1C
[Riou]: https://github.com/leanprover-community/mathlib4/pull/18551
[IllusieI]: https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf
[IllusieII]: https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf
[BOErratum]: https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf
[BMS19]: https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf
[BL22]: https://arxiv.org/pdf/2201.06120v1
[StacksCt]: https://stacks.math.columbia.edu/download/cotangent.pdf
[StacksMA]: https://stacks.math.columbia.edu/download/more-algebra.pdf
[Prisms]: https://arxiv.org/pdf/1905.08229v4
[BM]: https://arxiv.org/pdf/2202.04818v2
[CMM]: https://arxiv.org/pdf/1803.10897v2
[DM]: https://arxiv.org/pdf/1403.0534v1
[Avramov]: https://arxiv.org/pdf/math/9909192
[Iyengar]: https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf
[BhattDS]: https://arxiv.org/pdf/1608.08882v2
[BMaEtAl]: https://arxiv.org/pdf/2012.15801v3
[KY]: https://arxiv.org/pdf/2306.00364v1
[GP]: https://arxiv.org/pdf/1602.01515v3
[FGauges]: https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf
[StacksProper]: https://stacks.math.columbia.edu/tag/0A1G
[StacksLift]: https://stacks.math.columbia.edu/tag/07M8
