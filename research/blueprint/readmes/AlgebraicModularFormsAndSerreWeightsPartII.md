# Algebraic modular forms, Part II: Siegel forms modulo pⁿ

Extend the parent’s modular-curve direction to integral genus-two Siegel forms, arbitrary torsion coefficients and K/O. Nine layers give the all-component Fourier interface, primary and secondary Hasse geometry, coefficient operators and corrected Q₂, integral geometric Hecke actions, characteristic-p theta and ordinary full-frame comparison. Existing bundle, BT₁, compactification and primary-Hasse owners are imported. This is a completed planning pass with precise open supplier requests and six mathematical verification gaps; it is not a closed or implemented roadmap. The independent generic GL₃ direction is proposed as a separate roadmap.

This document is the mathematical specification. Each numbered target below is one packet node; smaller calculations stay inside its proof route. Its assertions are targets for future formalization, not claims of existing Lean implementations. All statements and source descriptions are in our own words.

## Scope, notation and ownership

The parent AlgebraicModularFormsAndSerreWeights stops at modular-curve forms, characteristic-p operations and Serre weights (R15.1–R15.6). This continuation develops the independent genus-two direction. The generic GL₃ weight/lattice continuation belongs to the split proposal at the end. Analytic overconvergent sheaves, ordinary projectors, higher Hida/Coleman control and eigenvarieties remain in HigherHidaAndColemanTheory.

Fix a prime p, a neat tame level K^p, and a complete DVR O finite over Z_p, with uniformizer ϖ, fraction field K and residue field k₀. Unless a target explicitly uses paramodular level, X is the good spherical genus-two toroidal compactification, D its boundary and G its universal semiabelian scheme. Write E=e*Ω¹_G/X and λ=det E. The weight conversion is ω(j,k)=Sym^(j−k)E⊗λ^k=Ω(j−k,k), j≥k. A coefficient M always enters the sheaf before taking cohomology. The p-power thickenings of Pilloni become ϖ-power thickenings after flat scalar extension; the canonical power congruence is first stated modulo pⁿ and the ramified generalization keeps its valuation condition.

Write S=V(h) for the closed nonordinary divisor. Its rank-one open is S minus the reduced supersingular curve Z_red. Write SS for the finite superspecial set. The secondary zero scheme Z₂=V_S(h′) is not identified with Z_red: generically h′ has order two at odd p in the spherical setting. A global square root b₀, when established at the specified level, cuts out Z_red and has half the weight of h′.

Use the binary index Q=(m,r,n) with Δ=r²−4mn=−4det Q. The normalized action is M·Q=(det M)^(−1)MQMᵗ. All-component expansions and coefficient transports are retained. CG20 T is the minuscule β₁ operator, named T_(p,2) by Pilloni. CG20 T₂ is the nonminuscule β₂ operator, named T_(p,1) by Pilloni. The symbol C_r below is Pilloni’s composite T in §7. The formal diagonal U₂=−1+pX₂ is distinct from the ordinary coefficient operator Z₂=UZ.

Generic vector-bundle operations are already planned in current TauCetiRoadmap/AlgebraicVectorBundles. C14 supplies the genus-two bundles and compactification models; T0 and R07 supply the primary invariant and BT₁ filtration/duality. These are exact imports. A named stage in a request denotes an open supplier obligation, not an implemented or already proved interface.

## Layer map

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| S1: Integral forms and Fourier expansions | 4 | 4 | closed |
| S2: Rank strata and the primary Hasse invariant | 4 | 3 | planned |
| S3: The secondary Hasse invariant | 8 | 6 | planned |
| S4: Hasse lifts and torsion weight shifts | 4 | 4 | planned |
| S5: Formal coefficient operators and Q₂ | 7 | 6 | planned |
| S6: Binary quadratic neighbors | 3 | 2 | planned |
| S7: Integral geometric Hecke actions | 7 | 6 | planned |
| S8: Theta operators and low-weight injectivity | 7 | 6 | planned |
| S9: Ordinary p-adic forms and coefficient comparison | 4 | 4 | planned |

## Baseline and exact imports

Pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. A declaration name is used only after its statement was read at the pin. Current read-only upstream heads are recorded in the packet’s libraryAudit; no commands that build or update those environments are needed.

- `tauceti:Representation.symmetricPower` (`TauCeti/RepresentationTheory/SymmetricPower.lean`): The induced symmetric-power representation on the existing symmetric-power module, for commutative semirings and monoids. Statement and action lemmas read at the pinned commit, lines 22–125; used for integral matrix action, not a claim about an unimplemented sheaf representation.
- `tauceti:Module.Basis.symmetricPower` (`TauCeti/LinearAlgebra/SymmetricPower/Basis.lean`): The basis of a symmetric power indexed by unordered degree-d multisets of basis indices. Declaration and basis evaluation read at the pinned commit, lines 150–211; used for the rank-two monomial description.
- `mathlib:Matrix.det` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): The determinant of a square matrix over a commutative ring. Statement read at the pinned commit, lines 50–85; the binary-form matrix formula is used only with 2 invertible.
- `mathlib:Matrix.det_mul` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): Multiplicativity of determinant for finite square matrices over a commutative ring. Statement read at the pinned commit, lines 128–145; verifies discriminant invariance for the normalized matrix action.
- `mathlib:legendreSym` (`Mathlib/NumberTheory/LegendreSymbol/Basic.lean`): The integer-valued Legendre symbol at a prime natural number. Definition and zero/square cases read at the pinned commit, lines 100–155; the input here is r²−4mn.

The graph uses the following exact imported nodes. Their fields were read, and their specialization is limited to the stated output.

- `ClassicalArithmeticCompletion:CA.1/projective-zeros-of-a-binary-quadratic-form`: The number of zeros of a binary quadratic form on ℙ¹(𝔽_p).
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/multiplicative-part-filtration`: The multiplicative–connected–étale filtration and its splitting over perfect bases.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-invariant`: The Hasse invariant of a BT₁ and the Hasse–Witt map.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-witt-duality`: The Hasse–Witt maps of a BT₁ and of its dual: the exact sequence of complexes.
- `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`: The Hasse invariant on toroidal and minimal compactifications.
- `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`: The Hasse invariant is invertible exactly on the ordinary locus.
- `HodgeTateAndCanonicalSubgroups:T0/normalized-multiplicative-pullback`: Boundary application of normalized multiplicative determinant pullback.
- `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`: The Hasse invariant of a semi-abelian scheme.
- `SchemeAndStackFoundations:SF.0/coherent-hartogs`: Algebraic Hartogs for coherent sheaves of depth at least two.
- `ShimuraCompactifications:C3/coherent-cohomology-invariance`: Canonical and cuspidal cohomology under refinement.
- `ShimuraCompactifications:C5/minimal-hodge-ampleness`: Ample Hodge line on the minimal model.
- `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`: Siegel Koecher with arbitrary coefficients.
- `ShimuraCompactificationsPartII:C14/genus-two-sheaves`: Automorphic sheaves of genus two at Klingen and paramodular level.
- `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications`: Toroidal compactifications at Klingen and paramodular level (Pilloni, Theorem 6.1.5.1).
- `ShimuraCompactificationsPartII:C14/klingen-paramodular-minimal`: Minimal compactifications at Klingen and paramodular level.
- `ShimuraCompactificationsPartII:C14/normal-lci`: Klingen and paramodular compactifications are normal and lci.
- `ShimuraCompactificationsPartII:C14/tp2-correspondence`: The compactified T_{p,2}-correspondence over ℤ_p.

- `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`: Total Hasse ideal (p, det V*) on integral Hilbert charts, including its stated ramified hypotheses.
- `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`: Higher coherent-cohomology vanishing after sufficiently high ample twists.
- `SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing`: Finite-level H⁰ restriction isomorphism and H¹ injection from depth at least two.
- `SchemeAndStackFoundations:SF.4/theorem-on-formal-functions`: Proper coherent formal functions; the open Milnor comparison is a separate requested extension.

- `AbelianSchemesAndArithmeticModuli:A4/grothendieck-messing`: Polarized Hodge-filtration deformation criterion with its PD hypotheses.
- `AbelianSchemesAndArithmeticModuli:A4/serre-tate-equivalence`: Equivalence of abelian and Barsotti–Tate deformations over nilpotent p-bases.
- `AbelianSchemesAndArithmeticModuli:A4/ordinary-serre-tate-coordinates`: Generic ordinary bilinear coordinates and their polarized symmetry.
- `AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham`: Abelian Hodge filtration, Gauss–Manin connection and polarized pairing under the stated degree hypotheses.
- `SchemeAndStackFoundations:SF.2/relative-dualizing-complex`: Relative dualizing complexes for flat finitely presented maps.
- `SchemeAndStackFoundations:SF.2/relative-dualizing-module`: The Cohen–Macaulay dualizing module and Gorenstein invertibility criterion.
- `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`: Proper Noetherian coherent duality with the specified boundedness conditions.

The generic double-coset and index-p lattice inputs are imported from `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; S5 specializes the action to binary indices and states the extra congruence-level work explicitly.

## S1. Integral forms and Fourier expansions

Build the genus-two section and expansion interface over arbitrary O-modules, importing the existing genus-two bundles and compactifications. The section lattice, all-component expansion principle and covariance are the common input to both geometric and formal operators.

### Integral Siegel forms and cusp forms

Target `AlgebraicModularFormsAndSerreWeightsPartII:S1/integral-siegel-forms` (definition).

Fix neat tame level K^p and hyperspecial level at p. On the imported smooth toroidal Siegel threefold X over O, let E=e*Ω¹_G/X and λ=det E. For integers j≥k put ω(j,k)=Sym^(j−k)E⊗λ^k and ω(j,k)^sub=ω(j,k)⊗I_D, using the imported bundles. For every O-module M define M_(j,k)(M)=H⁰(X,ω(j,k)⊗_O M) and S_(j,k)(M)=H⁰(X,ω(j,k)^sub⊗_O M). All components are retained. Ω(d,r)=ω(d+r,r). The notation H⁰ with M=K/O means the sheaf tensor product, not a tensor of H⁰ with K/O.

Hypotheses and conventions:

- O is a complete DVR finite over Z_p, uniformizer ϖ, fraction field K and residue field k₀.
- A good projective smooth cone decomposition is chosen; tame auxiliary covers are finite étale.

Construction or proof route:

1. Specialize the imported genus-two sheaf interface, without defining a second symmetric-power or vector-bundle theory.
2. Apply the imported refinement and arbitrary-coefficient Koecher theorems to obtain canonical identifications independent of the fan.

API required by the uses:

- `forms_eq_sections` (characterisation): The form module is the indicated global-section module, with its O-linear structure.
- `cusp_to_form` (coercion): For every O-module M the inclusion ω(j,k)^sub⊗M→ω(j,k)⊗M induces an injective cusp-to-form map. The boundary D is relative Cartier, so its quotient O_D and the locally free bundle restricted to D are O-flat; tensoring preserves this inclusion.
- `change_coefficients` (functoriality): An O-linear M→N induces a form map, preserving identities and composition.
- `refinement_equiv` (equivalence): Refinement induces canonical isomorphisms for forms and cusp forms with arbitrary O-module coefficients.
- `omega_weight_translation` (compatibility): Tensoring by λ^t changes (j,k) to (j+t,k+t), leaving symmetric degree j−k fixed.

Discriminating checks:

- `weight_zero` (degenerate): ω(0,0)=O_X and its constant section 1 has constant coefficient 1.
- `parallel_rank` (compatibility): ω(k,k)=λ^k has rank one; ω(k+1,k) has rank two.
- `cohomology_tensor` (non-example): For m≥1 and E₀=ω(j,k) or ω(j,k)^sub, the sequence 0→H⁰(X,E₀)/ϖ^m→H⁰(X,E₀/ϖ^m)→H¹(X,E₀)[ϖ^m]→0 is exact. Thus a nonzero last term detects failure of the premature tensor definition.

Uses:

- S7 integral Hecke action: Requires forms with torsion and K/O coefficients.
- S8 theta operators: Requires the same bundle convention at nonparallel weights.

Acceptance:

- No flatness hypothesis on M is inserted into the definition.
- Cusp sections use I_D, including after a refinement where the pullback of the boundary ideal need not be an equality.

Prerequisites: `ShimuraCompactificationsPartII:C14/genus-two-sheaves`, `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications`, `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `tauceti:Representation.symmetricPower`, `tauceti:Module.Basis.symmetricPower`.

Sources: CG20, §5.2, internal pp. 21–22 (journal 821–822); §8.2, pp. 56–57 (856–857) — Supplies integral coefficients, the weight lattice and the vector-valued coefficient representation.; P20, §6.2.1, p. 30 — Identifies the symmetric-degree/determinant convention and refinement invariance.

### Fourier indices and change of variables

Target `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-indices` (definition).

At a marked split zero-dimensional cusp with tame denominator bound L^e, use Q=(m,r,n), representing mx²+rxy+ny² and the half-integral matrix [[m,r/2],[r/2,n]]. Here m,r,n∈L^(−e)Z, m,n≥0 and Δ(Q)=r²−4mn≤0. The denominators are prime to p. For M∈GL₂(Q) set M·Q=(det M)^(−1)MQMᵗ; in particular Δ(M·Q)=Δ(Q). Coefficients outside the allowed semidefinite, tame-denominator index lattice are zero. A form is p-primitive precisely when its three p-integral coefficients are not all divisible by p.

Hypotheses and conventions:

- L is prime to p; formulas involving the matrix entries r/2 are used at odd p.
- The transformation preserves the relevant cone only for positive determinant; arbitrary GL₂ is used for the algebraic discriminant identity.

Construction or proof route:

1. Use binary quadratic forms for integral data and matrix notation after inverting 2.
2. Apply determinant multiplicativity to the normalized matrix action; p-primitivity is checked coefficientwise.

API required by the uses:

- `index_discriminant` (data): Δ(m,r,n)=r²−4mn=−4det Q.
- `index_action_comp` (functoriality): M·(N·Q)=(MN)·Q and 1·Q=Q wherever defined.
- `discriminant_action` (compatibility): Δ(M·Q)=Δ(Q).
- `primitive_iff` (characterisation): Q is p-primitive iff its reduction is a nonzero binary quadratic form.
- `coefficient_zero_outside` (simp): An inadmissible index has coefficient zero, including a transformed index with a p denominator.

Discriminating checks:

- `rank_one` (degenerate): Q=x² is admissible, primitive at every p, and has Δ=0.
- `primitive_not_discriminant_unit` (non-example): Q=x² has Δ divisible by p but Q is p-primitive.
- `discriminant_sign` (computation): For Q=x²+y², Δ=−4 and det Q=1; at p=3 the two Legendre symbols differ.

Uses:

- S5 diagonal operators: The discriminant determines X₂.
- S6 neighbors: Primitive reduction determines the number of neighbors.

Acceptance:

- No positive-definite-only convention excludes constant or boundary terms.
- The primitive condition concerns coefficients, not the discriminant alone.

Prerequisites: `mathlib:Matrix.det`, `mathlib:Matrix.det_mul`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/integral-siegel-forms`.

Sources: CG20, §8.2, internal pp. 56–57 (856–857); Definition 8.7, p. 59 (859) — Gives the coefficient indexing, normalized action and primitive condition, with the discriminant sign fixed here.

### Fourier expansions on every component

Target `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-expansion` (construction).

For a tame cyclotomic faithfully flat extension O′/O, choose a split cusp on every geometric connected component and a Mumford torus frame. Restriction defines coefficients a_c(F,Q)∈Sym^(j−k)(O′²)⊗M, with the determinant factor trivialized by that frame. Their support lies in the preceding index set with one fixed tame denominator bound. For L=1 the ambient series module embeds in (O′⊗M)[ζ,ζ⁻¹][[q,q′]] with finite Laurent support in ζ for each (q,q′) slice. Use the completed cone-monoid modules on charts, glued over faces; do not use a Laurent localization of a three-variable power-series ring. At a cusp stabilizer Γ̄⊂SL₂(Z) of level prime to p, a_c(F,M·Q)=Sym^(j−k)(M)a_c(F,Q). On another marked frame or component, include the induced coefficient transport.

Hypotheses and conventions:

- The level and cusp charts are those of S1; the coefficient expression for a general module is a module of series.
- Γ̄ is the actual cusp stabilizer; no global Γ̄-action on the form space is assumed.

Construction or proof route:

1. Trivialize the imported Hodge bundle on Mumford charts and restrict a section.
2. Glue cone expansions and check the stabilizer covariance using the frame torsor.
3. Use a common refinement for different fan choices and finite étale descent for tame auxiliary levels.

API required by the uses:

- `coeff_linear` (structure): Each a_c(−,Q) is an O-linear map.
- `coeff_ext` (extensionality): Equality of every component expansion determines equality of forms, by the expansion principle node.
- `coeff_frame_change` (functoriality): Changing a frame applies the corresponding symmetric-power representation and transports Q.
- `coeff_tame_base_change` (compatibility): Expansion commutes with coefficient maps, tame finite étale pullback and faithfully flat scalar extension.
- `cusp_support` (characterisation): A cusp form has zero coefficients at all non-positive-definite indices at every cusp; conversely these vanishings characterize cusp forms using all rational boundary components.

Discriminating checks:

- `negative_zeta_powers` (computation): The admissible form x²−xy+y² contributes qζ⁻¹q′; arbitrarily negative r occur as m,n grow.
- `zero_index` (degenerate): The constant form 1 has coefficient 1 at Q=0 and zero elsewhere.
- `component_detection` (non-example): On X=X₁⊔X₂, a section supported on X₂ has zero expansion at every cusp chosen only on X₁.

Uses:

- S5 and S7: Fixes the formulas and tests the integral Hecke normalizations.
- S9: Must agree with the classical-to-Igusa expansion map.

Acceptance:

- The target is O-linear for M=K/O; it is not asserted to be a coefficient ring.
- Disconnected levels have a family of expansions.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S1/integral-siegel-forms`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-indices`, `tauceti:Representation.symmetricPower`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`.

Sources: T06, §3.1, pp. 806–808, construction before Proposition 3.2 — Constructs expansions by toroidal charts and describes their stabilizer action.; CG20, §8.1–8.2, internal pp. 56–57 (856–857) — Supplies the binary-form indexing and coefficient-module convention.

### Integral q-expansion principle

Target `AlgebraicModularFormsAndSerreWeightsPartII:S1/q-expansion-principle` (theorem).

The family of expansion maps on one cusp of each geometric connected component is injective for every O-module M. For M=O, a rational section of ω(j,k) or its subcanonical extension whose coefficients at all these cusps are integral belongs to the integral global-section lattice. More generally, divisibility of an integral section by ϖ^m is equivalent to divisibility of all its coefficients. This is a statement about sections and their saturated lattice, not a surjectivity assertion for arbitrary formal series.

Hypotheses and conventions:

- The models and coefficient transports are those of S1.
- Use all relevant components after the tame cyclotomic extension.

Construction or proof route:

1. Apply Tilouine Proposition 3.2 on each geometrically connected good-level model and descend along the faithfully flat coefficient extension.
2. For O/ϖ^m use the same chart argument with arbitrary coefficients, then use injectivity of reduction to test divisibility.
3. Clear denominators of a rational section, lower their exponent using mod-ϖ injectivity, and repeat.

Acceptance:

- One-cusp injectivity is asserted only after selecting one cusp on every component.
- At each finite coefficient level, a zero expansion forces a zero section.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-expansion`, `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`.

Sources: T06, Proposition 3.2, p. 808 — Gives componentwise q-expansion injectivity for arbitrary coefficient rings and the cusp support criterion.; CG20, Theorem 8.1, internal p. 56 (856); Lemma 8.8, p. 60 (860) — Uses injectivity to detect equality and to fix integral Hecke normalizations.

## S2. Rank strata and the primary Hasse invariant

Separate the closed primary-Hasse zero scheme from its rank-one open. Record the precise rank geometry used later, with an explicit gap for the comparison of reduction-theory coordinates and the existing moduli models. Import the primary invariant rather than defining it again.

### Rank strata and scheme structures

Target `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-strata` (definition).

For X₁=X⊗k₀ and X_par,1 define the rank-r stratum by multiplicative rank r∈{0,1,2} of the semiabelian fiber; rank at most r and rank at least r have their inclusive meanings. On abelian fibers this equals the p-rank. Write S=V(h) for the scheme cut out by the imported primary Hasse section h∈H⁰(X₁,λ^(p−1)); later define Z₂=V_S(h′). Write Z_red for the reduced rank-zero locus and SS for the finite superspecial subset of the abelian interior. The same conventions with subscript par apply to X_par,1. For X_n use the rank loci in its underlying special-fiber space; S itself is a characteristic-p closed subscheme.

Hypotheses and conventions:

- The semiabelian extensions and primary Hasse invariant are imported.
- At rank zero the whole fiber is abelian, so the supersingular and superspecial terminology has its usual genus-two meaning.

Construction or proof route:

1. Define open rank loci by the connected/multiplicative filtration and semicontinuity.
2. Take V(h) as a Cartier zero scheme; keep its reducedness as a theorem, rather than part of the definition.

API required by the uses:

- `ordinary_open` (characterisation): X₁^{=2}=D(h).
- `nonordinary_closed` (data): S=V(h) with ideal generated by h in local Hodge trivializations.
- `rank_locus_base_change` (functoriality): Geometric rank strata commute with field extension and tame étale pullback.
- `rank_thickening` (compatibility): The open X_n^{≥1} has the same topological support as X₁^{≥1} and its inherited O/ϖ^n structure.
- `rank_zero_names` (compatibility): The supports of Z₂ and Z_red agree, but the scheme structures differ for odd p.

Discriminating checks:

- `ordinary_dimension` (degenerate): The rank-two locus is open of dimension three in the special fiber.
- `inclusive_rank` (non-example): A rank-one point belongs to both ≤1 and ≥1.
- `boundary_rank_one` (compatibility): A torus-rank-one degeneration with supersingular elliptic abelian part lies in S and outside Z_red.

Uses:

- S3: Places the two Hasse sections on their correct bases.
- S7 Hartogs: Identifies the deleted codimension-two locus.

Acceptance:

- S is not called the rank-one open stratum.
- Z₂ and Z_red are separate names.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S1/integral-siegel-forms`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`, `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/multiplicative-part-filtration`.

Sources: P20, §6.4, pp. 34–37 — Defines both levels of rank strata and the zero schemes of the two invariants.; CG20, §7.1, internal p. 49 (849); proofs of Theorems 8.10–8.11, pp. 62–63 (862–863) — Uses nonordinary, supersingular and superspecial loci; their letters are reconciled here.

### Dimensions and supersingular geometry

Target `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry` (theorem).

At both spherical and paramodular level, the rank-r stratum is dense in its rank-at-most-r closure and has pure dimension r+1. At spherical level X₁ is smooth, S is a pure surface and Z_red is a curve disjoint from the toroidal boundary. SS is finite; V* has rank one on S minus SS. Over an algebraic closure, every irreducible component C of Z_red is P¹, contains p²+1 distinct superspecial points, and has E|_C≅O(−1)⊕O(p), hence λ|_C≅O(p−1). The assertions about this splitting and component counts are for spherical good level; no analogous paramodular splitting is asserted.

Hypotheses and conventions:

- Geometric component statements are over an algebraic closure with neat prime-to-p level.
- At tame nonprincipal polarization, use a prime-to-p isogeny to the principally polarized model and finite étale descent.

Construction or proof route:

1. Use polarized genus-two deformation/Dieudonné charts to compute rank strata and identify the rank-zero Newton stratum.
2. A boundary torus contributes multiplicative rank, excluding rank zero from D.
3. For the P¹ components use the supersingular isogeny family and its Hodge filtration, as invoked explicitly in CG20 Theorems 8.10–8.11; count its F_(p²)-points.
4. The missing detailed supplier interface for these reduction charts is recorded in gap G1; it is not supplied by the generic PEL good-level construction.

Acceptance:

- Codimension of rank zero in every X_n is two.
- The largest degree in ω(a,b)|_C is pa−b when a≥b.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-strata`, `ShimuraCompactificationsPartII:C14/normal-lci`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/multiplicative-part-filtration`, `AbelianSchemesAndArithmeticModuli:A4`.

Sources: P20, §6.4, p. 35 and proof of Lemma 6.4.2, p. 36 — Gives density and finiteness, with the dimension corrected to r+1.; CG20, Proofs of Theorems 8.10–8.11, internal pp. 62–63 (862–863) — States the P¹ components, superspecial count and Hodge-bundle splitting used in theta injectivity.

Open obligations: G1 — genus-two reduction and local-model comparison.

### Simple Hasse zeros at rank one

Target `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero` (theorem).

The nonordinary zero schemes S and S_par are reduced effective Cartier divisors. In the rank-one crystalline basis e₁,e₂,e₃,e₄ with F e₁=p e₁, F e₂=−p e₃, F e₃=e₂ and F e₄=e₄, choose the alternating pairing with ⟨e₁,e₄⟩=⟨e₂,e₃⟩=1. A first-order Hodge lift generated by columns (1,0,X,W) and (0,1,Y,Z) has Hasse linear term −Y. The principal tangent equation X=Z, and the two paramodular equations Z=0 and X=0, leave Y free. Thus h vanishes simply at every generic point of the nonordinary divisor. Normality of the ambient special fiber and Cohen–Macaulayness give reducedness globally.

Hypotheses and conventions:

- Use the polarized deformation input A4.
- The paramodular model is the imported flat local complete intersection, smooth off its finite singular set.

Construction or proof route:

1. Check ⟨Fe₂,Fe₃⟩=pσ⟨e₂,e₃⟩; this fixes the sign in the source matrix.
2. Compute the quotient Frobenius matrix [[−Y,0],[−Z,1]].
3. Use the tangent constraints to establish multiplicity one, then the normal/CM criterion to exclude nilpotents and embedded components.

Acceptance:

- At odd p, the unsigned source basis would give ⟨Fe₂,Fe₃⟩=−p and fails the pairing identity.
- The Hasse tangent term is a nonzero linear form at every rank-one point.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `AbelianSchemesAndArithmeticModuli:A4`, `ShimuraCompactificationsPartII:C14/normal-lci`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `AbelianSchemesAndArithmeticModuli:A4/grothendieck-messing`, `AbelianSchemesAndArithmeticModuli:A4/serre-tate-equivalence`.

Sources: P20, Lemma 6.4.1 and proof, pp. 35–36 — The deformation computation proves reducedness at both levels after the polarization sign is corrected.

Open obligations: G1 — genus-two reduction and local-model comparison, R1.

### Hasse expansion and multiplication

Target `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-q-expansion` (theorem).

At every split cusp the imported primary Hasse section has Fourier expansion 1. It is a nonzerodivisor on X₁ because the ordinary locus is dense on every component. Multiplication by h therefore injects M_(j,k)(k₀) and S_(j,k)(k₀) into weight (j+p−1,k+p−1), for any j≥k. It commutes with prime-to-p Hecke correspondences under the natural coefficient maps and with tame deck transformations. The determinant Hasse ideal used on an integral Hilbert modular chart is locally (p,h) after specializing the same semiabelian determinant, with its chosen Hodge trivialization; it is not a different invariant.

Hypotheses and conventions:

- For the Hilbert comparison use the same determinant Hasse ideal, rather than an unproved equality with an individual partial Hasse invariant.

Construction or proof route:

1. Verschiebung on the split Mumford torus acts as the identity on invariant logarithmic differentials.
2. Density on every smooth component makes h regular; tensoring a vector bundle preserves injectivity.
3. Functoriality of the imported invariant under prime-to-p isogenies and pullback proves Hecke and deck equivariance.

Acceptance:

- A disconnected smooth model still requires density on each component.
- For the scalar operator in S8, Θh=0 supplies a counterexample to unrestricted injectivity.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-expansion`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`, `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`.

Sources: Y16, Proposition 3.11(2), p. 22 — Computes the Mumford Hasse matrix and its constant expansion.; CG20, Lemma 6.2(1), internal p. 36 (836); proof of Lemma 7.4, pp. 48–49 (848–849) — Uses multiplication by the invariant; componentwise density and deck equivariance supply the needed hypotheses.

Exact import: `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`.

## S3. The secondary Hasse invariant

Construct h′ intrinsically from the rank-one BT₁ filtration, prove duality and the normal extension calculation, then glue over the nonordinary divisor and boundary. Distinguish its order-two zero scheme from the reduced supersingular curve; the odd-p global square root is a separate, conditional target.

### Secondary Hasse invariant on rank one

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-hasse` (construction).

Over a reduced F_p-scheme B let G be a height-four, dimension-two BT₁ with constant multiplicative and étale ranks both one. Import G^m⊂G^o⊂G and put G^oo=G^o/G^m. The imported crystal of G^oo gives an isomorphism v:(ω_((G^oo)^D))^∨→(ω_(G^oo))^p induced by V*. Taking v^(p−1) and the Fargues determinant identification LF defines h′(G^oo) in ω_G^oo^(p²−1). Define h′(G)=Ha(G^m)^(p+1)⊗h′(G^oo) in (det ω_G)^(p²−1). It is a unit on B. The same recipe applies to the connected height-three, dimension-two BT₁ with multiplicative rank one and biconnected quotient of height two, to handle the boundary; its duality claim is only made in the height-four case.

Hypotheses and conventions:

- B is reduced, so the pointwise zero restrictions of V* on the two Hodge graded pieces are zero as maps.
- All occurrences of powers of ω_G in the output mean powers of its determinant.

Construction or proof route:

1. Use the imported multiplicative-connected filtration and crystal; the induced V* between the quotient and the Hodge line is an isomorphism.
2. Take the indicated tensor powers and use LF to put the result in a single determinant line.
3. Removing the étale quotient changes no invariant differentials, giving the connected-boundary recipe.

API required by the uses:

- `secondary_hasse_line` (data): h′(G) is a section of (det ω_G)^(p²−1).
- `secondary_hasse_unit` (characterisation): On the constant rank-one base the section is nowhere zero.
- `secondary_hasse_base_change` (functoriality): The section commutes with morphisms of reduced bases preserving the indicated filtration.
- `secondary_hasse_etale_quotient` (compatibility): Passing to G^o and using det ω_G≅det ω_G^o leaves the section unchanged.
- `secondary_hasse_dual` (compatibility): In height four LF^(p+1)(h′(G))=h′(G^D), as proved in the duality node.

Discriminating checks:

- `line_weight` (compatibility): The factor Ha(G^m)^(p+1) has weight (p−1)(p+1)=p²−1 in det ω_G^m.
- `rank_one_product` (degenerate): For μ_p⊕I_(1,1)⊕Z/p over an algebraically closed field, h=0 and h′ is a unit.
- `connected_boundary` (compatibility): Deleting the étale Z/p factor yields height three with the same determinant section; demanding height four at the boundary would lose it.

Uses:

- S3 extension: The unit section on the rank-one open is the section to extend.
- S4 cover: Its nonvanishing supplies the second affine open.

Acceptance:

- An arbitrary height-four BT₁ of rank zero is not an input to this initial definition.

Prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/multiplicative-part-filtration`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-witt-duality`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-invariant`.

Sources: P20, §6.3.2, pp. 30–31; §6.4, p. 36 — Provides the construction, its unit property and its connected height-three boundary specialization.

### Secondary Hasse duality

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-duality` (theorem).

For the height-four input above, LF^(p+1):(det ω_G)^(p²−1)≅(det ω_G^D)^(p²−1) sends h′(G) to h′(G^D). An étale isogeny of Barsotti–Tate groups identifies both primary and secondary sections wherever the latter is defined. These equalities survive their unique extensions to reduced normal bases.

Hypotheses and conventions:

- The determinant LF map and its quasi-polarization compatibility are imported from R07.2.

Construction or proof route:

1. Check the equality after algebraically closed geometric specialization, where a quasi-polarization identifies the two BT₁ types.
2. Apply functoriality and LF∘det(λ*)^(p−1)=id in its correctly typed determinant line.
3. On a reduced base equality of sections is detected at geometric points; unique extension preserves it.

Acceptance:

- The comparison is not an identification of ω_G and ω_G^D without their determinant powers.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-hasse`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-invariant`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-witt-duality`.

Sources: P20, Lemma 6.3.2.1, p. 31; §6.3.4, p. 34 — Proves duality and étale-isogeny invariance; the final line of the duality composite is the G^D line.

### Canonical subgroup in the Frobenius kernel

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/rank-one-subgroup` (construction).

Let B be reduced normal, G a height-four dimension-two BT₁, generically of multiplicative and étale ranks one, and suppose ker(V*:ω_G→ω_G^(p)) is an invertible direct summand. Set K=ker(V:G[F]^(p)→G[F]). Then K is finite flat of rank p and H=G[F]^(p)/K embeds as a finite flat rank-p subgroup of G[F], extending G^m from the rank-one open. Apply the same construction to G^D to obtain L. Let N=ω_(G[F]/H) and N_D=ω_(G^D[F]/L). The Hodge diagram defines V_H*:ω_H→ω_H^p, W:N^p→coker(V*), and Z:N_D^∨→coker(V*); all three are maps between line bundles. The source of Z uses coker(F*)≅N_D^∨; Z is an isomorphism, since the full crystalline V* has image ω_G^(p) and kernel im F*.

Hypotheses and conventions:

- Constant rank one for V* is imposed as a map of bundles, not merely at generic points.
- The generic rank-one open is dense in every component of B.

Construction or proof route:

1. Import the dual Hasse–Witt rank equality from the exact sequence of crystal complexes.
2. Use the Hodge–Tate kernel description or the geometric Dieudonné calculation to show K has constant rank p, and construct the quotient H.
3. Read the maps off the Hodge filtration diagrams; duality identifies the stated cokernel.

API required by the uses:

- `rank_one_subgroup_restrict` (compatibility): H agrees with G^m on the open where both ranks are one.
- `rank_one_subgroup_unique` (extensionality): The displayed image-of-V construction determines H canonically, hence commutes with its defined base changes.
- `rank_one_subgroup_dual` (compatibility): Applying the construction to G^D yields L, and the quotient Hodge lines identify coker F* with N_D^∨.
- `rank_one_maps` (data): V_H*, W and Z have the stated line-bundle domains and codomains.
- `rank_one_maps_orders` (relation): At codimension-one points the vanishing orders of V_H* and W are equal; their zero set is multiplicative rank zero.

Discriminating checks:

- `open_multiplicative` (compatibility): Over the rank-one open H=μ_p locally étale and V_H* is a unit.
- `dual_rank_drop` (non-example): If étale rank drops while multiplicative rank stays one, V_H* remains a unit; its zero locus is not the entire complement of the rank-one open.
- `local_matrix` (computation): For V* with matrix [[0,a],[0,b]], a a unit at a zero of b, the two line maps V_H* and W have the same order ord(b).

Uses:

- S3 normal extension: The line-map orders cancel the poles in W⁻¹Z.
- S3 local-model extension: Supplies the subgroup used in the Iwahori identification.

Acceptance:

- No arbitrary flat closure of the generic multiplicative group replaces this construction.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-hasse`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-witt-duality`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-invariant`.

Sources: P20, Lemmas 6.3.3.1–6.3.3.4 and diagrams (6.3.A)–(6.3.B), pp. 31–33 — Provides the subgroup extension and the line maps used to remove poles of the secondary section.

### Normal-base extension of secondary Hasse

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/normal-extension` (theorem).

Under the preceding normal-base hypotheses, h′ extends uniquely across B. Its support of zeros is the complement of the open where both multiplicative and étale ranks are one. To construct it, use A=(V_H*)^(p+1)⊗(W⁻¹Z)^(p−1) and the analogous B_D for the dual. A is regular, with zeros exactly where multiplicative rank is zero; B_D has zeros where étale rank is zero. Their product, under LF and determinant identifications, extends (h′)². Normality then extends the rational section h′ itself. If the two ranks agree at every point, both individual zero-locus descriptions reduce to the same rank-zero set.

Hypotheses and conventions:

- The base is normal and reduced, and V* has rank one everywhere as in the subgroup construction.
- The squares are compared in their tensor-square line, not as unrelated scalar functions.
- For the height-one/DVR extension argument the base is locally Noetherian and normal; all moduli applications satisfy this hypothesis.

Construction or proof route:

1. At each height-one DVR compare orders of V_H* and W; the remaining exponent (p+1)−(p−1)=2 removes every possible pole.
2. Use that Z is an isomorphism, so A has precisely twice the local zero order of V_H*. Repeat for the Cartier dual and multiply the two sections.
3. A rational section whose square is integral is integral over each normal affine trivialization; uniqueness follows from density.

Acceptance:

- The extension theorem remains valid when the two rank-drop loci differ.
- A pointwise equality of the two ranks may simplify the proof but is not silently inferred from the generic ranks.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/rank-one-subgroup`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-duality`.

Sources: P20, Lemmas 6.3.3.3–6.3.3.5 and Proposition 6.3.3.1, p. 33 — Gives the pole cancellation and square argument, with the two individual rank-drop loci distinguished.

### Local models of the nonordinary surface

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/local-model-identifications` (comparison).

Off SS, the spherical nonordinary surface is smooth and is identified via H⊂G[F] with the indicated rank-one Iwahori strata. In the supplied local-model ring R=F_p[x,y,a,b,c]/(xy,ax+by+abc), its chart is R/(a,y,x+bc)≅F_p[b,c]. For the paramodular surface off SS, the two branches are obtained from R/(x,y+ac)≅F_p[a,b,c] by a=0 and b=0. Their reduced union is Spec F_p[a,b,c]/(ab), with rank-one open D(a)∪D(b). The two branches meet along a=b=0. The initial quotient R/(x,y+ac) alone is the ambient three-space, not the nonordinary surface.

Hypotheses and conventions:

- The Iwahori integral moduli/local-model chart, its smooth local-model comparison and the named rank strata are a missing supplier interface, gap G1.
- Étale-local isomorphisms may require extending the residue field.

Construction or proof route:

1. Construct the flag from the canonical rank-p subgroups H and L and the degree-p factors of the paramodular polarization.
2. Check the equations for the two closures in the Iwahori chart, then compute their union using the intersection (a)∩(b)=(ab).
3. Import the local-model comparison, rather than treating an algebraic quotient calculation as proof that the moduli space has this chart.

Acceptance:

- The paramodular union has dimension two and two branches.
- The spherical quotient is a smooth affine plane.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/rank-one-subgroup`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `ShimuraCompactificationsPartII:C14/normal-lci`, `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications`.

Sources: P20, Proof of Lemma 6.4.2, pp. 36–37 — Describes the flag identification and the branch quotients of the Iwahori chart.

Open obligations: G1 — genus-two reduction and local-model comparison.

### Secondary Hasse on both nonordinary divisors

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/global-secondary` (construction).

The rank-one secondary sections for G and G′ extend uniquely to h′∈H⁰(S,λ^(p²−1)) and h′_par∈H⁰(S_par,λ_par^(p²−1)). At torus-rank-one boundary points use the connected height-three BT₁ recipe. Off SS, extend on the spherical normal chart; on the paramodular nodal chart extend on each normal branch and glue because both restrictions vanish on their intersection. Across the finite set SS use Cohen–Macaulay Hartogs on the surface. The support of V(h′) is Z_red and likewise at paramodular level. This is the single secondary section used here; CG20’s auxiliary section is compared only after specifying its normalization or power.

Hypotheses and conventions:

- S and S_par are reduced CM surfaces; the rank-one locus is dense in every component.
- The imported coherent Hartogs theorem applies to the locally free determinant power.

Construction or proof route:

1. Use the connected recipe at the boundary and the normal-base extension off SS.
2. Glue the two nodal branches using their common zero value.
3. Use depth two at SS to extend uniquely, then compare all tame pullbacks by density.

API required by the uses:

- `secondary_restriction` (compatibility): Restriction to the rank-one open gives the section constructed from G^oo.
- `secondary_extension_unique` (extensionality): Two extensions agreeing on the dense rank-one open are equal.
- `secondary_zero_support` (characterisation): The geometric zero set is exactly the rank-zero set.
- `secondary_tame_equivariant` (functoriality): Prime-to-p isogeny pullbacks, tame level maps and deck transformations preserve the section.
- `secondary_regular` (structure): Multiplication by every positive power of h′ is injective on locally free sheaves over S and S_par, because the CM surfaces have no embedded associated points and h′ is generically a unit.

Discriminating checks:

- `nodal_gluing` (computation): On F_p[a,b,c]/(ab), two branch sections zero on a=b=0 glue uniquely.
- `nonordinary_boundary` (degenerate): The construction remains defined at torus-rank-one points, where the connected BT₁ has height three.
- `regular_not_reduced_zero` (non-example): Injectivity of multiplication by h′ does not imply its zero scheme is reduced; for odd p its generic zero order is two.

Uses:

- S4: Provides the second affine and weight-shifting section.
- GSp4NonregularModularityLifting: Supplies the injective multiplication used on nonordinary cohomology.

Acceptance:

- The extension is not proved by normality of the nodal union.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-hasse`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/normal-extension`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/local-model-identifications`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `SchemeAndStackFoundations:SF.0/coherent-hartogs`.

Sources: P20, Lemma 6.4.2 and Remark 6.4.1, pp. 36–37 — Extends at the boundary, on both levels and across the finite superspecial set.; B15, Theorem 4.5.4(3), pp. 122–123; Theorem 6.2.2, pp. 188–189 — Provides a comparison via Hecke-compatible generalized Hasse invariants and boundary extensions, rather than an unlocated Appendix B citation.

Open obligations: G1 — genus-two reduction and local-model comparison.

### Reduced supersingular divisor and square root

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-square-root` (theorem).

For odd p on the spherical nonordinary surface S, there is a secondary root b∈H⁰(S,λ^((p²−1)/2)), with normalization fixed so that b²=h′; it cuts out Z_red as an effective Cartier divisor. Thus V(h′)=2 Z_red as effective Cartier divisors. State the existence and normalization first over an algebraically closed residue field and descend only with its verified descent datum. At p=2 the half-integer Hodge exponent is unavailable; h′ itself remains defined, and no integral-half-weight root statement is included. No square-root theorem at paramodular level is inferred from the spherical one.

Hypotheses and conventions:

- p is odd for the root assertion.
- The sign and descent of b are retained as part of its datum; they are not supplied by a set-theoretic description of Z_red.

Construction or proof route:

1. Use Koblitz’s local genus-two rank-one degeneration and the line transition functions of the Hasse–Witt factorization to construct the root.
2. Compute order one for b at generic points of Z_red and extend across SS using CM depth.
3. Compare b² and the normalized h′ on the dense rank-one open. The global transition-function/descent check is recorded as gap G2 rather than inferred from the even order alone.

Acceptance:

- A local square of a divisor does not by itself prove a global section has a square root.
- The multiplicity-two scheme is retained for the higher-Hida interface.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/global-secondary`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `SchemeAndStackFoundations:SF.0/coherent-hartogs`.

Sources: P20, Remark 6.4.1, p. 37 — States order two and the odd-prime root, with a proof only indicated.; K75, §V.11, pp. 192–193 — Computes the local singularities of the genus-two rank-one and rank-zero loci.; CG20, Proof of Theorem 8.10, internal p. 62 (862) — Uses the root of weight (p²−1)/2 as a Cartier equation.

Open obligations: G2 — global secondary square root and descent.

### Normalized pullback of Hasse sections

Target `AlgebraicModularFormsAndSerreWeightsPartII:S3/normalized-isogeny-pullback` (construction).

Let λ_G:G→G′ be an isogeny of Barsotti–Tate groups in characteristic p with constant multiplicative rank, ker λ_G=L⊂G[p], and suppose at every geometric point G[p]=H_x⊕L_x with H_x multiplicative. There is a canonical determinant-line isomorphism λ̃*:det ω_G′→det ω_G. On the multiplicative parts use the imported normalized determinant of the character-lattice isogeny. On the quotient by the multiplicative part write the induced isogeny uniquely as pµ with µ an isomorphism and use µ*. Tensor these two maps. The result preserves h and h′ wherever defined and hence their unique normal extensions.

Hypotheses and conventions:

- These are full Barsotti–Tate groups, so division of the induced isogeny by p on the quotient has the stated meaning.
- This is not defined by dividing a zero differential in characteristic p.

Construction or proof route:

1. Intersect L with the multiplicative part; the complement condition makes the quotient kernel its entire p-torsion.
2. Use the unique factorization pµ and the imported multiplicative determinant normalization.
3. Apply functoriality to each factor and the tensor construction of the two invariants.

API required by the uses:

- `normalized_pullback_line` (data): λ̃* is an isomorphism of the indicated determinant lines.
- `normalized_pullback_etale` (compatibility): If λ_G is étale, λ̃*=det λ_G*.
- `normalized_pullback_multiplicative` (compatibility): For a purely multiplicative isogeny of degree p^s, λ̃* is the transpose of p^(−s)det of the character-lattice map.
- `normalized_pullback_hasse` (relation): (λ̃*)^(p−1)h(G′)=h(G), and (λ̃*)^(p²−1)h′(G′)=h′(G).
- `normalized_pullback_base_change` (functoriality): The normalized map commutes with base change preserving the constant-rank filtration and with compositions satisfying the same factorization hypotheses.

Discriminating checks:

- `multiplication_on_mu` (computation): For [p]:μ_(p∞)→μ_(p∞), the normalized determinant map is the identity, while the differential modulo p is zero.
- `identity` (degenerate): For the identity isogeny of a multiplicative Barsotti–Tate group G, the complement hypothesis holds with H_x=G[p] and L_x=0; s=0 and the normalized map is identity.
- `quotient_factor` (compatibility): On G/G^m, an isogeny pµ contributes µ*, not the zero map (pµ)*.

Uses:

- HigherHidaAndColemanTheory: Supplies Hasse compatibility for normalized coefficient correspondences.
- S7: Checks the normalization of determinant factors in ordinary isogeny charts.

Acceptance:

- The character lattice is dual to invariant differentials.

Prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/multiplicative-part-filtration`, `HodgeTateAndCanonicalSubgroups:T0/normalized-multiplicative-pullback`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-hasse`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-duality`.

Sources: P20, Lemma 6.3.4.2 and proof, p. 34 — Defines normalized pullback by the multiplicative and quotient factors.

## S4. Hasse lifts and torsion weight shifts

Lift a positive power of the primary invariant, prove its coefficient-adic power congruences and torsion weight-shift injection. The two-affine cover uses descended sections on the minimal compactification, whose secondary-section comparison remains an explicit gap.

### Characteristic-zero Hasse power lifts

Target `AlgebraicModularFormsAndSerreWeightsPartII:S4/hasse-power-lift` (construction).

There exist r>0 and A∈H⁰(X,λ^(r(p−1))) reducing to h^r. They are obtained by lifting a sufficiently high Hasse power on the minimal compactification, where an appropriate power of λ is ample, and pulling back. A is a chosen lift, with no canonicality asserted. It pulls back to every tame auxiliary-level model. For prescribed j≥k and m≥1 one may choose arbitrarily large s divisible by p^(m−1); multiplication by A^s then raises both weights by t=rs(p−1) modulo ϖ^m.

Hypotheses and conventions:

- The chosen exponent r also clears the tensor power needed for descent of the Hodge line.
- The higher-cohomology vanishing used here is Serre vanishing for a coherent ample twist on the minimal model.

Construction or proof route:

1. Descend h and a Hodge-line power using the imported minimal interface.
2. Apply the reduction exact sequence and Serre vanishing to lift a sufficiently large power, then pull back to X.

API required by the uses:

- `hasse_lift_reduction` (data): A mod ϖ=h^r in the indicated determinant line.
- `hasse_lift_auxiliary` (functoriality): At tame auxiliary levels use the pullback of the same A, so every deck transformation fixes it.
- `hasse_lift_choice` (characterisation): Two chosen lifts of h^r differ by a section divisible by ϖ.
- `hasse_lift_large_power` (structure): For any lower weight-shift bound one can choose s divisible by p^(m−1) giving a larger shift.
- `hasse_lift_not_canonical` (other): A itself depends on a lift; canonicality appears only after the exponent/congruence in the next node.

Discriminating checks:

- `reduction_q` (computation): Every such A has Fourier expansion congruent to 1 modulo ϖ.
- `different_lifts` (non-example): Locally 1 and 1+ϖ give different lifts modulo ϖ².
- `tame_deck` (compatibility): A pulled back from X is fixed by the auxiliary deck action even when the group order is divisible by p.

Uses:

- S4 torsion weight shifts: Produces arbitrarily large integral weight changes.
- GSp4NonregularModularityLifting: Supplies the coefficient-level weight-raising maps.

Acceptance:

- Ampleness is used on the minimal model, not asserted on the toroidal one.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-q-expansion`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `ShimuraCompactificationsPartII:C14/klingen-paramodular-minimal`, `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`.

Sources: CG20, Definition 6.1 and following paragraph, internal pp. 35–36 (835–836) — Obtains a characteristic-zero lift of a power using minimal Hodge ampleness.; T06, §3.2, p. 810 — Chooses a Hasse-power lift with constant reduction of its expansion.

Exact import: `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`.

### Canonical powers modulo pⁿ

Target `AlgebraicModularFormsAndSerreWeightsPartII:S4/canonical-power-congruence` (theorem).

If two local lifts a,b of the same mod-p section of a line bundle differ by p, then a^(p^(n−1))≡b^(p^(n−1)) mod p^n. Consequently h^(p^(n−1)) has a canonical lift to X⊗Z/p^n in λ^(p^(n−1)(p−1)), obtained by taking local lifts and gluing their powers. Over a ramified O the analogous statement for a−b∈ϖO is a^(p^(m−1))≡b^(p^(m−1)) mod ϖ^m. Thus A^s modulo ϖ^m depends only on h^r whenever p^(m−1) divides s. It commutes with pullback, including prime-to-p isogenies identifying the determinant sections.

Hypotheses and conventions:

- n,m≥1 and p is any prime.
- Local transition functions of the line bundle are included when comparing the lifts; the statement does not give a lift of h itself modulo p².

Construction or proof route:

1. Induct with (u+p^a v)^p−u^p divisible by p^(a+1), starting with a=1.
2. For ϖ use p∈ϖO and the same binomial argument, which increases the ϖ-adic order by at least one.
3. Apply the congruence on overlaps, with their line-bundle transition factors, then glue.

Acceptance:

- At p=2, (a+2b)²≡a² mod 4 still verifies the induction base.
- Over a ramified DVR, the claim uses reduction modulo ϖ^m, not an assertion that p and ϖ have equal valuation.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S4/hasse-power-lift`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`.

Sources: P20, Proof of Theorem 11.2.1, p. 70 — Uses the canonical high-power lift.; CG20, Lemma 6.4, internal pp. 36–37 (836–837) — Uses p^(m−1)-divisibility of the exponent for torsion-level Hecke equivariance.

### Equivariant torsion weight shifts

Target `AlgebraicModularFormsAndSerreWeightsPartII:S4/torsion-weight-shift` (theorem).

For j≥k, m≥1 and the chosen r,A, let s>0 be divisible by p^(m−1), and t=rs(p−1). Multiplication by A^s is injective from M_(j,k)(O/ϖ^m) to M_(j+t,k+t)(O/ϖ^m), and likewise for cusp forms. It is equivariant for prime-to-p Hecke correspondences, their tame-level U operators, and auxiliary deck transformations. Arbitrarily large t of this form are possible.

Hypotheses and conventions:

- These are the away-from-p equivariances; the separate at-p theorem is S7/hasse-at-p.

Construction or proof route:

1. Reduce injectivity first modulo ϖ, where h is a nonzerodivisor.
2. Induct on m using the ϖ-filtration of the locally free sheaf tensored with O/ϖ^m.
3. Use the canonical-power congruence on the two sides of a prime-to-p isogeny; deck equivariance follows because A is pulled back from X.

Acceptance:

- No averaging over the auxiliary deck group is used.
- The statement does not make a characteristic-zero theta operator out of the mod-p one.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S4/hasse-power-lift`, `AlgebraicModularFormsAndSerreWeightsPartII:S4/canonical-power-congruence`.

Sources: CG20, Lemmas 6.2 and 6.4, internal pp. 36–37 (836–837) — Gives injection and prime-to-p equivariance; auxiliary deck equivariance follows from the same pullback construction.

### Two affine opens above rank at least one

Target `AlgebraicModularFormsAndSerreWeightsPartII:S4/minimal-hasse-cover` (construction).

Let 𝔛* be the formal minimal spherical compactification. Descend h to its special fiber and h′ to the closed nonordinary divisor V(p,h). For sufficiently divisible and sufficiently large N, these supply noncanonical sections s₁,s₂ of the same ample line L=λ^(N(p²−1)) on 𝔛*: s₁ reduces to h^(N(p+1)), and s₂ restricts on V(p,h) to (h′)^N. Their nonzero formal loci cover precisely 𝔛*^{≥1}=D(s₁)∪D(s₂), and each is affine. This construction owns the spherical cover; the inverse-image Klingen cover and its cohomological resolution belong to HigherHidaAndColemanTheory.

Hypotheses and conventions:

- A Hodge power is used whenever λ itself is only a descended rational line.
- Descent of h′ or a specified positive power on the closed divisor must be proved; gap G3 records that remaining interface.

Construction or proof route:

1. For h use the imported minimal descent. For h′ compare the toroidal section with its formal boundary value and prove descent on the nonordinary divisor, or descend a checked common power.
2. Use the exact sequences for reduction and for the closed divisor together with Serre vanishing to lift both sections into one high ample power.
3. Their common special-fiber zero support is rank zero; principal nonvanishing opens of an ample section on the proper minimal model are affine.

API required by the uses:

- `hasse_cover_common_line` (data): s₁ and s₂ lie in the same specified ample tensor power.
- `hasse_cover_support` (characterisation): Their common zero support is exactly Z_red.
- `hasse_cover_affine` (structure): D(s₁), D(s₂), and their intersection are affine formal opens.
- `hasse_cover_pullback` (functoriality): A finite morphism to the spherical minimal model pulls the cover back to two affine opens; nonfinite morphisms require a separate argument.
- `hasse_cover_choice` (compatibility): Different permissible lifts define the same special-fiber open 𝔛*^{≥1}, without claiming their individual opens are identical.

Discriminating checks:

- `rank_one_covered` (degenerate): At a rank-one point h=0 and h′≠0, so s₂ is a unit.
- `rank_zero_removed` (degenerate): At rank zero both specializations vanish, so neither formal nonzero locus contains the point.
- `equal_weights` (computation): (p−1)N(p+1)=(p²−1)N; unequal weights would not be two sections of L.

Uses:

- HigherHidaAndColemanTheory, two-affine covering: Imports the spherical cover before its own Klingen pullback and Čech comparison.
- S4: Tests both the scheme structures and the secondary-invariant descent.

Acceptance:

- D(s₂) may contain ordinary points; only its restriction to V(h) is prescribed.
- A section defined only on V(p,h) is not treated as a section of the whole formal model before the lifting step.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S3/global-secondary`, `AlgebraicModularFormsAndSerreWeightsPartII:S4/canonical-power-congruence`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`, `ShimuraCompactificationsPartII:C14/klingen-paramodular-minimal`, `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`.

Sources: P20, Proof of Lemma 14.8.2, p. 101 — Uses equal-weight lifts of the two Hasse sections to give the spherical cover.; B15, Theorem 6.2.3 and Corollary 6.2.4, p. 190 — Provides minimal descent of generalized Hasse sections after a positive power; identifying that power with the present h′ requires a comparison.

Open obligations: G3 — secondary minimal descent and comparison. Serre vanishing is imported from `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`.

## S5. Formal coefficient operators and Q₂

Keep the coefficient combinatorics on a formal module separate from geometric modularity. Fix the discriminant sign, normalized binary-form action, determinant-p cosets and two different operators denoted U₂ in the sources. Cancel the rational expression for Q₂ before any finite-coefficient reduction.

### Covariant formal Siegel series

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/formal-series` (definition).

For a coefficient O-module C_d=Sym^d(O²)⊗M, d≥0, a formal Siegel series is a coefficient function Q↦a(Q) on the S1 index lattice, extended by zero outside it, with a(γ·Q)=ρ_d(γ)a(Q) for γ∈Γ̄. Use the actual semidefinite support and fixed tame denominator bound; all-component series carry the source/target cusp transports of the fixed level. This defines a module. A series need not be the expansion of a geometric form. The action ρ_d extends to integral 2×2 matrices via the existing symmetric-power functor; determinant weight is recorded in the operator scalars.

Hypotheses and conventions:

- d=j−k, and Γ̄ has prime-to-p level.
- For characteristic-p identities tensor the entire coefficient module with k₀.

Construction or proof route:

1. Take the submodule of coefficient functions satisfying the support and covariance equations.
2. Import symmetric powers and their matrix functoriality from Tau Ceti; do not replace C_d by an unverified polynomial representation lattice.

API required by the uses:

- `formal_coeff_ext` (extensionality): Two formal series are equal iff each coefficient agrees.
- `formal_coeff_linear` (structure): The coefficient maps are linear and define a submodule of all functions on the index set.
- `formal_zero_extension` (simp): Evaluation at an index outside the allowed lattice is zero.
- `formal_change_coefficients` (functoriality): Coefficient maps commute with zero extension and the ρ_d-action.
- `geometric_to_formal` (coercion): The S1 q-expansion map lands in this module, injectively for the all-component family.

Discriminating checks:

- `determinant_twist` (compatibility): For d=1 and M=diag(p,1), ρ₁(M)x=px and ρ₁(M)y=y; inserting an extra determinant twist would instead give p²x and py. For γ∈SL₂ the determinant factor is 1.
- `module_coefficients` (degenerate): In the scalar coefficient module K/O, the nonzero class 1/p+O is killed by p. The constant coefficient function with this value is a formal series killed by p, so the definition cannot require a coefficient algebra or a p-torsion-free module.
- `formal_not_geometric` (non-example): At weight (0,0) over a field, the indicator of one Γ̄-orbit of a positive-definite index is a nonzero covariant formal series with zero constant term. On a proper geometrically connected X every global regular function is constant, so this series is not geometric.

Uses:

- S5–S6: Makes finite coefficient computations independent of geometric Hecke construction.
- S8: States the corrected theta coefficient formulas.

Acceptance:

- Formal operator identities do not by themselves show that their outputs are geometric forms.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-indices`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-expansion`, `tauceti:Representation.symmetricPower`, `tauceti:Module.Basis.symmetricPower`.

Sources: CG20, §8.2, internal pp. 56–57 (856–857); terminology in §8.6–8.9 — Works with coefficient functions and integral symmetric-power matrix action independently of geometric modularity.

### Determinant-p cosets and integral neighbors

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/determinant-p-cosets` (construction).

Let Γ̄ be a congruence subgroup of SL₂(Z) of level prime to p. Import the generic double-coset and index-p lattice machinery from current TauCetiRoadmap/ModularForms Layer 2. The left cosets MΓ̄ in Γ̄ diag(p,1) Γ̄ have p+1 integral representatives M of determinant p and are parametrized by P¹(F_p). For the full group one may take diag(1,p) and [[p,a],[0,1]] for 0≤a<p, with the chosen action on Q; at general level choose compatible lifts by prime-to-p approximation. Only terms with M⁻¹·Q p-integral contribute. The associated projective line is the one on which the reduction of Q must vanish; specify it through this integrality criterion rather than an ambiguous kernel/image convention.

Hypotheses and conventions:

- p is prime and the level of Γ̄ is prime to p.
- The matrices are representatives of left cosets; the covariance acts on coefficients from the left.

Construction or proof route:

1. Import the generic double-coset/lattice correspondence and the full-group index-p count from current TauCetiRoadmap/ModularForms Layer 2; specialize its lines to the normalized binary-index transform.
2. For the stated arbitrary prime-to-p congruence subgroup, use Γ(N)⊂Γ̄ and prime-to-p approximation to lift compatible representatives; prove any level extension not covered by the imported Γ₀/Γ₁ interfaces here.
3. Changing M to Mγ, γ∈Γ̄, cancels using a(γ⁻¹·Q)=ρ_d(γ⁻¹)a(Q); then identify the projective line through the integral-transform criterion.

API required by the uses:

- `det_p_cosets_card` (data): The representative set has cardinality p+1.
- `det_p_cosets_line` (equivalence): Its cosets correspond bijectively to projective F_p-lines with the specified integral-transform criterion.
- `det_p_cosets_change` (compatibility): The coefficient sum defining Z is independent of the representative choice.
- `det_p_cosets_congruence` (functoriality): A prime-to-p change of level gives the compatible double-coset correspondence and coefficient transport.
- `det_p_cosets_integral` (characterisation): M⁻¹·Q is p-integral iff Q vanishes at the corresponding projective point.

Discriminating checks:

- `cosets_p3` (computation): For p=3 and Γ̄=SL₂(Z), there are four left cosets.
- `zero_form_all_cosets` (degenerate): Every coset is admissible for Q≡0 mod p.
- `anisotropic_empty` (computation): At p=3, Q=x²+y² has no admissible coset, because its reduction has no projective zero.

Uses:

- S5 Z and Z₂: Provides the finite sums and representative independence.
- S6: Labels the neighbor multiset, including repetitions.

Acceptance:

- The source typo replacing M⁻¹·Q by an unnormalized matrix product is not adopted.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S5/formal-series`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.

Sources: CG20, Lemma 8.3, internal p. 58 (858); Definition 8.19, p. 72 (872) — Uses these cosets and their projective parametrization for Z and the neighbor multiset.

### The formal U, Z and V operators

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/u-z-v` (construction).

For formal series define (UF)(Q)=a(F,pQ), (VF)(Q)=a(F,Q/p) with zero extension, and (ZF)(Q)=Σ_M ρ_d(M)a(F,M⁻¹·Q), summed over the determinant-p representatives. Define Z₂=UZ, so (Z₂F)(Q)=Σ_Mρ_d(M)a(F,M⁻¹·pQ). These operators preserve integral coefficient modules and covariance, with the all-component Hecke transport attached when the level has multiple components. They satisfy UV=1, Z₂=UZ, and UZ₂=Z₂U. No identity UZ=ZU is asserted.

Hypotheses and conventions:

- The tame denominator bound can be enlarged within the same fixed level lattice when required by its marked cusp; p-denominators remain forbidden.
- The coefficients carry the symmetric-power matrix action ρ_d.

Construction or proof route:

1. Define U and V by reindexing and Z by its finite sum.
2. Check covariance by permuting cosets, then prove the identities coefficientwise; scalar multiplication of Q commutes with the normalized matrix action.
3. For UZ₂=Z₂U both coefficient formulas evaluate a(F,p²M⁻¹·Q), with the same zero-extension convention.

API required by the uses:

- `u_coeff` (simp): a(UF,Q)=a(F,pQ).
- `v_coeff` (simp): a(VF,Q)=a(F,Q/p), with inadmissible indices zero.
- `z_coeff` (simp): a(ZF,Q)=Σ_Mρ_d(M)a(F,M⁻¹·Q).
- `z2_coeff` (simp): a(Z₂F,Q)=Σ_Mρ_d(M)a(F,M⁻¹·pQ).
- `u_v_identity` (relation): UV=1 on the coefficient module; VU is the projection retaining indices divisible by p.
- `u_z2_commute` (relation): UZ₂=Z₂U; integrality is preserved by all four operators.

Discriminating checks:

- `uv_test` (computation): At every Q, a(UVF,Q)=a(F,Q).
- `vu_test` (non-example): For p-primitive Q, a(VUF,Q)=0, even if a(F,Q)≠0.
- `z_scalar_formula` (computation): For d=0, a(ZF,n,r,m)=a(F,pn,r,m/p)+Σ_(0≤a<p)a(F,(n+ar+a²m)/p,r+2ma,pm), with nonintegral terms zero.

Uses:

- S7: Pins the q-expansion formula for the normalized minuscule Hecke operator.
- S9: The Klingen ordinary degree-zero coefficient operator is compared with Z₂.

Acceptance:

- For d=0 recover the two scalar formulas recorded in the reader worked calculations.
- The source’s ordinary U_(p,2) is Z₂ in the congruences; it is not the diagonal U₂.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S5/formal-series`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/determinant-p-cosets`.

Sources: CG20, Lemmas 8.3–8.4 and the display after Lemma 8.4, internal pp. 58–59 (858–859) — Defines U,Z,V and Z₂ and supplies the coefficient formulas.

### Discriminant diagonal operator X₂

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/diagonal-x2` (definition).

Assume p odd. Over O, define X₂ on the Q-coefficient by the integer scalar ε(Q): if Q is p-primitive, ε(Q)=legendreSym(p,Δ(Q)); if Q≡0 mod p, ε(Q)=p. Define U₂=−1+pX₂. Thus its scalar is −1+p legendreSym(p,Δ(Q)) on primitive Q and −1+p² on nonprimitive Q. On characteristic-p coefficients X₂ reduces everywhere to multiplication by legendreSym(p,Δ(Q)). The sign convention is Δ=r²−4mn=−4det Q.

Hypotheses and conventions:

- The Legendre symbol of a p-integral rational is defined by its reduction to F_p, equivalently by an integral numerator times a square denominator factor.
- p odd avoids the half-integral matrix denominator and the characteristic-two quadratic classification.

Construction or proof route:

1. Apply the existing Legendre symbol to the reduced discriminant and use the primitive/nonprimitive coefficient test.
2. Show invariance under the normalized Γ̄-action; the operator is coefficientwise linear.

API required by the uses:

- `x2_primitive` (simp): On a primitive Q the multiplier is legendreSym(p,Δ(Q)).
- `x2_nonprimitive` (simp): On Q≡0 mod p the integral multiplier is p.
- `u2_from_x2` (relation): U₂=−1+pX₂ as integral operators.
- `x2_mod_p` (compatibility): Over k₀ the multiplier is the reduced discriminant Legendre symbol for every Q.
- `x2_linear` (structure): X₂ and U₂ are coefficient-linear and preserve Γ̄ covariance.

Discriminating checks:

- `discriminant_p3` (computation): For p=3,Q=x²+y², X₂ has scalar −1 and U₂ has scalar −4.
- `nonprimitive_integer` (computation): For Q=3(x²+y²) at p=3, X₂ has scalar 3 and U₂ has scalar 8 before reduction.
- `singular_primitive` (degenerate): For Q=x², X₂ has scalar 0 and U₂ has scalar −1.

Uses:

- S5 Q₂: Cancels the apparent negative p-power in the weight-(2,2) normalization.
- S8: Tests the support distinction between scalar theta and the vector contraction.

Acceptance:

- The discriminant and matrix determinant give opposite signs when −1 is nonsquare.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S5/formal-series`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-indices`, `mathlib:legendreSym`.

Sources: CG20, Lemma 8.4, Definition 8.5, internal p. 59 (859) — Gives the two diagonal branches; use the discriminant rather than the conflicting determinant wording.

### Characteristic-p formal relations

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/characteristic-p-relations` (theorem).

Over k₀ and for odd p, UX₂=0, X₂³=X₂ and Z₂X₂=0. The first holds because pQ is nonprimitive; the second because the reduced multipliers are 0,1,−1. In Z₂X₂, every contributing index R=M⁻¹·pQ has det R=p²det Q, hence Δ(R) is divisible by p, so its X₂ coefficient vanishes. This only uses congruence of the discriminant, not det R=0 as a rational number.

Hypotheses and conventions:

- Formal series and zero extension are those of S5.

Construction or proof route:

1. Compute every identity on one coefficient.
2. When a transformed index is nonintegral its summand is zero; otherwise its discriminant is divisible by p.

Acceptance:

- The relation UX₂=0 need not hold over O.
- At a p-primitive nonsingular index the possible X₂ eigenvalues are ±1.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S5/u-z-v`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/diagonal-x2`.

Sources: CG20, Lemma 8.6, internal p. 59 (859); uses in §§8.6–8.7, pp. 68–73 (868–873) — Uses the diagonal relations in characteristic p; the discriminant divisibility corrects the literal-zero wording.

### Rational Hecke decomposition and residual V₂

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/hecke-decomposition` (construction).

Fix j≥k≥2, d=j−k, and the CG20 similitude^(−3) normalization of the rational spherical double cosets T=[diag(1,1,p,p)], T₂=[diag(1,p,p,p²)] and S=[pI₄]. In the trivial central/diamond sector with its chosen component identifications, S=p^(j+k−6). Their coefficient operators satisfy T=U+p^(k−2)Z+p^(j+k−3)V and T₂=p^(j+k−6)U₂+p^(k−3)Z₂+p^(j+2k−6)V₂. Define the rational residual V₂ by the second equality, using the rational T₂ and the other defined terms. The finite-coset calculation must show it preserves the integral formal lattice and thereby extends to all coefficient modules. At a disconnected adelic level retain the central and cusp transport actions; the displayed scalar S formula requires the stated trivial sector.

Hypotheses and conventions:

- p is odd, as required for the discriminant and X₂ interface.
- Negative p-exponents in these rational identities are interpreted only after inverting p.
- The second equality is the characterization of V₂, not a definition of integral T₂ on torsion forms.

Construction or proof route:

1. Use the imported prime-to-p/rational automorphic-bundle Hecke pullback-and-trace convention with similitude^(−3).
2. Compute the rational double-coset action at the split cusp and group terms as the three displayed summands.
3. For V₂ compute the remaining determinant-p² cosets explicitly and verify their integral ρ_d weights. This last finite-coset verification is gap G4; the source asserts it without displaying V₂.

API required by the uses:

- `hecke_t_expansion` (compatibility): T=U+p^(k−2)Z+p^(j+k−3)V on rational expansions.
- `hecke_t2_expansion` (compatibility): T₂=p^(j+k−6)U₂+p^(k−3)Z₂+p^(j+2k−6)V₂ on rational expansions.
- `v2_rational_unique` (characterisation): The second identity uniquely specifies V₂ after p is inverted.
- `v2_integral_extension` (structure): The determinant-p² coset calculation gives an integral coefficient operator whose scalar extension is the characterized V₂.
- `central_transport` (functoriality): A nontrivial central/diamond action is retained rather than replaced by its scalar trivial-character specialization.

Discriminating checks:

- `t_low_weight` (computation): Modulo p, T=U+Z at k=2 and T=U at k≥3.
- `t2_weight_33` (computation): At (j,k)=(3,3), T₂=−1+pX₂+Z₂+p³V₂, hence T₂≡Z₂−1 mod p.
- `central_low_weight` (non-example): At (2,2), S=p^(−2) is a rational normalization; it cannot be separately applied as a scalar on O/ϖ^m.

Uses:

- S5 Q₂: Allows cancellation before defining an integral low-weight operator.
- S7: Compares a geometric normalized correspondence with the source’s Hecke convention.

Acceptance:

- The integral normalized output constructed in S7 is T and Q₂, not unnormalized T₂ in all weights.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S5/u-z-v`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/diagonal-x2`, `AutomorphicBundles:B5`.

Sources: CG20, §5.5 and Remark 5.10, internal pp. 33–34 (833–834); Lemmas 8.3–8.4, p. 58 (858) — Fixes the rational normalization and the integral U,Z,V,U₂,Z₂,V₂ decomposition.; P20, §5.1.3, p. 21; §14.9.2, p. 104 — The source names for the first and second spherical generators are interchanged relative to CG20.

Open obligations: G4 — explicit integral residual V₂ cosets, R2.

### Integral corrected Q₂ operator

Target `AlgebraicModularFormsAndSerreWeightsPartII:S5/corrected-q2` (construction).

For j≥k≥2 in the normalization just fixed, cancel negative powers in (pT₂+(p+p³)S)p^(2−k) before reducing coefficients. The result is the integral formal operator Q₂=p^(j−2)X₂+Z₂+p^(j+k−3)V₂+p^(j−1)·1. Thus Q₂≡Z₂ mod p except at (j,k)=(2,2), where Q₂≡Z₂+X₂. The extra identity term comes from p³S and is retained in the exact integral identity. In particular at (3,3) Q₂≡Z₂ even though T₂≡Z₂−1.

Hypotheses and conventions:

- This scalar expression is in the trivial central/diamond sector specified above.
- Integrality depends on the residual V₂ target, whose unresolved explicit coset proof is recorded in G4.

Construction or proof route:

1. Substitute the T₂ decomposition and S=p^(j+k−6).
2. The U₂ and pS terms combine as p^(j−3)(U₂+1)=p^(j−2)X₂.
3. The p³S term becomes p^(j−1), and the remaining coefficients have nonnegative exponents. Reduce only after this cancellation.

API required by the uses:

- `q2_integral_formula` (simp): Q₂=p^(j−2)X₂+Z₂+p^(j+k−3)V₂+p^(j−1).
- `q2_rational_comparison` (compatibility): After p is inverted it equals (pT₂+(p+p³)S)p^(2−k).
- `q2_mod_p` (relation): Q₂≡Z₂ unless (j,k)=(2,2), where the extra term is X₂.
- `q2_coefficient_change` (functoriality): The cancelled integral formula commutes with all coefficient maps.
- `q2_weight_shift` (compatibility): A positive simultaneous Hasse shift preserves d and gives Q₂≡Z₂ at the shifted weight.

Discriminating checks:

- `q2_weight_22` (computation): At (2,2), Q₂=X₂+Z₂+pV₂+p, so its mod-p value is X₂+Z₂.
- `q2_weight_33` (computation): At (3,3), Q₂=pX₂+Z₂+p³V₂+p².
- `q2_cancellation` (non-example): Dropping the pS term before combining U₂+1 would leave a spurious p^(−1) at (2,2).

Uses:

- S7: The H⁰ action is required over O/ϖ^m and K/O.
- GSp4NonregularModularityLifting: Provides the ordinary degree-zero operator with the correct weight-(2,2) correction.

Acceptance:

- No multiplication by p^(−1) is performed on a torsion coefficient module.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S5/hecke-decomposition`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/characteristic-p-relations`.

Sources: CG20, Definition at start of §8.4, internal p. 59 (859); Lemma 8.12, p. 64 (864) — Defines Q₂ and gives its two residual congruences.

Open obligations: G4 — explicit integral residual V₂ cosets.

## S6. Binary quadratic neighbors

Retain labeled occurrences and the symmetric-power matrix weights in the neighbor multiset. The projective-zero theorem is imported; this layer specializes it to the support of Z and proves reciprocity without inverting a determinant-p matrix on coefficients.

### Binary-form neighbor multiset

Target `AlgebraicModularFormsAndSerreWeightsPartII:S6/neighbor-multiset` (definition).

Fix the oriented double coset Δ_p=Γ̄ diag(p,1)Γ̄ from S5. For a p-integral index Q, let ℱ_Δ([Q]) (abbreviated ℱ([Q])) be the multiset of Γ̄-equivalence classes [M⁻¹·Q] contributed by the determinant-p left cosets whose transform is p-integral. Count each contributing coset once, including when different cosets give the same class. The construction depends only on [Q]. Its coefficient realization retains, for each contributing M and its transformed representative P, the intertwiner ρ_d(M): a(ZF,Q)=Σ_Mρ_d(M)a(F,P). It is not an unweighted sum of abstract orbit coefficients.

Hypotheses and conventions:

- Γ̄, indices and zero extension are as in S5.
- For statements about positive discriminant classes use Δ as defined in S1; semidefinite Fourier indices have Δ≤0.

Construction or proof route:

1. Use the determinant-p coset parametrization and covariance to pass from a representative Q to its class.
2. Keep a labeled multiset before taking classes; this remembers multiplicity and the coefficient transport.

API required by the uses:

- `neighbors_well_defined` (extensionality): Equivalent Q give the same multiset of classes by permutation of left cosets.
- `neighbors_card` (data): Its multiset cardinality counts all admissible projective points.
- `neighbors_representative` (characterisation): A labeled occurrence consists of a determinant-p M and P=M⁻¹·Q, not just an unlabelled orbit.
- `neighbors_weighted_sum` (compatibility): Z is the sum of ρ_d(M)a(F,P) over those occurrences.
- `neighbors_discriminant` (relation): Every neighbor occurrence has Δ(P)=Δ(Q).

Discriminating checks:

- `multiplicity_two` (computation): For p=5,Q=x²+y²,Γ̄=SL₂(Z), the two isotropic projective points give the same discriminant −4 class twice.
- `nonprimitive_count` (degenerate): If Q≡0 mod p, every one of the p+1 cosets contributes.
- `matrix_weight_retained` (non-example): For d=1 and M=diag(p,1), a contributing coefficient x is weighted to px, whereas a coefficient y is weighted to y. Replacing ρ₁(M) by the scalar 1 loses the first value and cannot define the same neighbor operator.
- `tame_orientation` (non-example): At Γ̄=Γ(5), p=3 and Q=x², each M in Δ_p is diag(3,1) modulo 5, so its integral neighbor is 2x² modulo 5. A second forward neighbor is 4x² modulo 5, not Q; the reverse double coset is necessary.

Uses:

- S6 counting theorem: Translates finite-field zeros to a Hecke-support test.
- GSp4NonregularModularityLifting, binary-form argument: Uses reciprocity of neighbor classes without losing their matrix action.

Acceptance:

- Equal classes contributed by two different projective points are not deduplicated.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-indices`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/determinant-p-cosets`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/u-z-v`.

Sources: CG20, Definition 8.19 and the coefficient identity following it, internal p. 72 (872) — Defines the multiset and its weighted coefficient interpretation.

### Projective-zero count of neighbors

Target `AlgebraicModularFormsAndSerreWeightsPartII:S6/neighbor-count` (theorem).

If Q is p-primitive and p odd, |ℱ([Q])|=1+legendreSym(p,Δ(Q)), giving 0,1,2 according as the discriminant is nonsquare, zero or a nonzero square modulo p. If Q≡0 mod p the cardinality is p+1. The bijection is between labeled admissible determinant-p cosets and zeros of Q in P¹(F_p), so the count is a multiset count.

Hypotheses and conventions:

- Q is p-integral and p odd; the primitive branch requires the nonzero reduction of Q.

Construction or proof route:

1. Use the coset integrality/projective-zero equivalence.
2. Apply the imported binary-quadratic projective-zero theorem; the zero form is its separate p+1-point case.

Acceptance:

- At p=3 the positive form x²+y² has no neighbor.
- For x² the count is one, despite Δ=0.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S6/neighbor-multiset`, `ClassicalArithmeticCompletion:CA.1/projective-zeros-of-a-binary-quadratic-form`, `mathlib:legendreSym`.

Sources: CG20, Lemma 8.21 and preceding paragraph, internal pp. 72–73 (872–873) — Relates the neighbor count to the discriminant and records possible repeated classes.

### Reciprocity of neighbor classes

Target `AlgebraicModularFormsAndSerreWeightsPartII:S6/neighbor-reciprocity` (theorem).

Let Δ_p^∨={pM⁻¹:M∈Δ_p}. If [P] occurs in ℱ_Δ([Q]), then [Q] occurs in ℱ_(Δ^∨)([P]). For Q=M·P the reverse action uses pM⁻¹, an integral determinant-p matrix. If Δ_p^∨=Δ_p, in particular for Γ̄=SL₂(Z), this is the symmetric relation [P]∈ℱ([Q]) iff [Q]∈ℱ([P]). At general tame level keep the reverse correspondence and cusp/diamond transport; prime-to-p level alone does not imply equality of the two double cosets. No inverse of ρ_d(M) on torsion coefficients is asserted.

Hypotheses and conventions:

- The equivalence classes and oriented double cosets are fixed as in S5–S6.
- The same-coset specialization requires Δ_p^∨=Δ_p, or a separately proved level/diamond identification; the general all-level downstream use is G6.

Construction or proof route:

1. Conjugate within Γ̄ to an index-p lattice normal form.
2. Use (pM⁻¹)·Q=P, since the normalized action of scalar pI is identity on quadratic forms.
3. The reverse matrix belongs to Δ_p^∨ by definition. Identify it with the forward double coset only under the stated self-duality hypothesis; prime-to-p congruence lifting does not supply that identification.

Acceptance:

- No inverse of a determinant-p coefficient matrix is used modulo p.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S6/neighbor-multiset`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/determinant-p-cosets`.

Sources: CG20, Lemma 8.20 and proof, internal p. 72 (872) — Uses the reverse determinant-p matrix. Its same-coset interpretation is retained at full SL₂ level; G6 records the missing tame-level identification.

Open obligations: G6 — tame-level identification of reverse neighbors.

## S7. Integral geometric Hecke actions

Construct the minuscule operator on the rank-at-least-one formal open using ordinary trace divisibility. Use coherent Hartogs for global H⁰ and use a normalized paramodular composite for the torsion Q₂ action. Coherent duality is an explicit supplier extension, and the low-weight central subtraction is checked.

### Finiteness of the spherical correspondence

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/finite-rank-one-correspondence` (theorem).

Restrict the imported compactified C_(p,2) isogeny correspondence (Pilloni indexing; CG20 β₁) to the formal locus X^{≥1}. Both relevant projections are proper and quasi-finite, hence finite, and are generically étale. In the interior they classify isotropic Lagrangian rank-p² kernels. At a geometric ordinary or rank-one point, only finitely many such subgroups occur; positive-dimensional families of α_p-subgroups arise only on the excluded rank-zero locus. At the boundary use the imported degeneration chart. This is a restriction of the existing correspondence, not a new Hilbert-scheme construction.

Hypotheses and conventions:

- The rank loci are defined by the underlying special fiber; finiteness is over the inherited nilpotent thickening/formal open.
- The finite-fiber statement requires the full genus-two BT₁ classification, including nonordinary rank one, and the toroidal chart comparison.

Construction or proof route:

1. Classify the possible isotropic kernels at rank two and rank one using the BT₁ Dieudonné module.
2. Use the imported proper compactification and the boundary subgroup description to obtain quasi-finiteness on all of the stated open.
3. Apply proper plus quasi-finite and generic characteristic-zero étaleness. Gap G1 records the exact missing reduction-classification interface.

Acceptance:

- The complete proper correspondence is not asserted to be finite over rank zero.

Prerequisites: `ShimuraCompactificationsPartII:C14/tp2-correspondence`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/multiplicative-part-filtration`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/bt1-hasse-witt-duality`.

Sources: CG20, Proof of Lemma 8.8, internal p. 60 (860) — Removes the failure of quasi-finiteness by deleting the rank-zero locus.; P20, Spherical part of §14.9.2, p. 104 — Uses finiteness and generic étaleness of the compactified correspondence over rank at least one.

Open obligations: G1 — genus-two reduction and local-model comparison.

### Ordinary trace divisibility

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/ordinary-trace` (theorem).

For the finite correspondence over X^{≥1}, write d=j−k≥0 and r=k≥2. On the formal neighborhood of an ordinary point the kernel types are multiplicative, mixed and étale. The differential on Ω(d,r) factors respectively through p^(d+2r), p^r and 1; the trace factors respectively through 1, p and p³. Thus the raw pullback followed by trace lands in p³Ω(d,r), including the subcanonical boundary twist. For r=2 these are the source’s p^(d+4),p²,1 differential bounds. The trace bounds are ideals/divisibility statements, not merely the degrees of maps.

Hypotheses and conventions:

- Use the polarized Serre–Tate charts supplied by A4 and the semiabelian boundary charts.
- The bound on the symmetric-power part in the mixed case is only integrality; it is not assumed divisible by p^d.

Construction or proof route:

1. On a multiplicative kernel the differential on E is p times an isomorphism, yielding p^d from Sym^d and p^(2r) from det^r.
2. For a mixed kernel use a basis with differential diag(p,1), yielding the determinant factor p^r and an integral symmetric-power map.
3. For an étale kernel the differential is an isomorphism; compute trace ideals in Serre–Tate coordinates as p and p³ for the ramified covers.
4. Each product has p-order at least three when r≥2. The source’s r=2 computation is extended by the stated determinant factors.

Acceptance:

- At r=1 the mixed product gives only p², so the same divisibility theorem is not asserted.
- The three kernel types remain separately tested.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S7/finite-rank-one-correspondence`, `AbelianSchemesAndArithmeticModuli:A4`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/normalized-isogeny-pullback`, `ShimuraCompactificationsPartII:C14/genus-two-sheaves`, `AbelianSchemesAndArithmeticModuli:A4/ordinary-serre-tate-coordinates`.

Sources: P20, Spherical part of §14.9.2, p. 104 — Computes the three differential/trace bounds at r=2.; CG20, Lemma 8.3, internal p. 58 (858) — Its general-weight expansion matches the resulting r≥2 normalization.

Open obligations: R1.

### Integral normalized minuscule operator

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/integral-sheaf-t` (construction).

The raw finite-correspondence sheaf map T′_(p,2):(p₁)*p₂*Ω(d,r)(−D)→Ω(d,r)(−D) has image in p³Ω(d,r)(−D) over the formal rank-at-least-one locus for d≥0,r≥2. Define T=p^(−3)T′ by the unique factorization through multiplication by p³ on the torsion-free target. This defines an integral cohomological correspondence on RΓ(𝔛^{≥1},Ω(d,r)(−D)), compatible with finite coefficients and rationalization; the same construction applies to the canonical bundle without the boundary twist. For O/ϖ^m, reduce the integral correspondence after its construction, without dividing by p on the quotient.

Hypotheses and conventions:

- The formal base is smooth and normal, and p-torsion-free before reduction.
- Divisibility is checked at every relevant height-one point; all vertical generic points are ordinary by density in the special fiber.

Construction or proof route:

1. The ordinary trace node checks divisibility at the vertical height-one points; at horizontal points p is a unit.
2. Use normality and local freeness of the target to extend the p³ factorization across the remaining locus.
3. Use the finite trace and projection formula to form the cohomological correspondence, then reduce the integral map to finite coefficients.

API required by the uses:

- `normalized_t_factorization` (characterisation): p³T=T′ on the integral torsion-free target, uniquely.
- `normalized_t_coefficients` (functoriality): The integral correspondence reduces compatibly modulo ϖ^m and extends scalars to K.
- `normalized_t_boundary` (compatibility): Canonical and subcanonical coefficient maps preserve their specified boundary ideals.
- `normalized_t_refinement` (functoriality): A common toroidal refinement intertwines the correspondence, so the induced cohomology map is fan-independent.
- `normalized_t_rational` (compatibility): After p is inverted, the operator is CG20 T, which is Pilloni T_(p,2).

Discriminating checks:

- `multiplicative_bound` (computation): At d=0,r=2 the differential contributes p⁴ and trace contributes a unit, so division by p³ is integral.
- `mixed_bound` (computation): At r=2, p² from the differential times p from trace gives exactly the required p³ bound.
- `etale_bound` (computation): For an étale kernel all p³ divisibility comes from the trace, not the differential.

Uses:

- S7 H⁰: Extends the action to global torsion forms by Hartogs.
- HigherHidaAndColemanTheory, spherical half of Lemma 14.9.1: Imports the integral RΓ action on the spherical open.

Acceptance:

- The formula at weight (d+r,r) agrees with U+p^(r−2)Z+p^(d+2r−3)V.
- No analogous RΓ construction is claimed for the nonminuscule β₂ generator.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S7/ordinary-trace`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/finite-rank-one-correspondence`, `ShimuraCompactificationsPartII:C14/normal-lci`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`.

Sources: P20, Lemma 14.9.1, spherical half, p. 103; proof §14.9.2, p. 104 — Constructs p^(−3)T′ on the formal rank-at-least-one locus for r=2; the determinant-factor argument supplies r≥2.

### Hartogs across supersingular curves

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/siegel-hartogs` (theorem).

Let E₀=Ω(d,r) or Ω(d,r)(−D), with d≥0 and r any integer. For n≥1, restriction H⁰(X,E₀/ϖ^n)→H⁰(X_n^{≥1},E₀/ϖ^n) is an isomorphism and H¹ is injective. The same holds for n=∞, interpreted as coherent formal cohomology over 𝔛, and for the corresponding K/O sheaves by filtered colimits. The closed complement Z_red has codimension two in every CM thickening X_n and is disjoint from D. No H²-injectivity assertion follows.

Hypotheses and conventions:

- At n=∞, coherent cohomology on the proper formal scheme and derived inverse-limit cohomology on its open are compared using the Milnor sequence.
- The finite-level locally free sheaf is over O/ϖ^n; CM excludes depth-one points on the complement.

Construction or proof route:

1. Apply the imported coherent Hartogs theorem to the CM thickening at every finite n.
2. The same local-depth calculation gives local-cohomology H⁰_Z=H¹_Z=0, yielding H¹ injectivity in the localization sequence.
3. At the formal limit use the compatible H⁰ isomorphisms to identify the lim¹ terms, and the left-exact inverse limit of the finite-level H¹ injections; use proper coherent formal functions on the source.
4. On qcqs schemes coherent sheaf cohomology commutes with the needed filtered colimits, giving K/O coefficients.

Acceptance:

- The codimension-two locus is the complement of rank at least one.
- The formal n=∞ step is not replaced by a claim that H¹ always commutes with ordinary inverse limits.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `SchemeAndStackFoundations:SF.0/coherent-hartogs`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing`, `SchemeAndStackFoundations:SF.4/theorem-on-formal-functions`.

Sources: P20, §8.2, p. 53; Lemma 14.9.2, spherical half, p. 103 — Uses codimension-two extension; the formal-limit justification is made explicit here.; CG20, Proof of Lemma 8.8, internal p. 60 (860) — Uses Hartogs for global degree-zero operators.

Open obligations: R3.

### Integral paramodular composite correspondence

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/paramodular-composite` (construction).

Write d=j−k≥0 and r=k≥2. On the imported spherical, Klingen and paramodular lci models, form the degree-p³ and degree-p isogeny correspondences. Their differential maps tensored with fundamental classes have integral factorizations by p^(r+2) and p respectively. Normalize these integral maps before passing to coefficients, then compose to obtain C_r on integral coherent cohomology. Rationally, in the CG20 normalization, C_r=p^(3−r)(T₂+(1+p+p²+p³)S). In the trivial central sector Q₂=C_r−(1+p²)p^(j−2)·1. This difference is integral for every j≥k≥2, and its finite-coefficient and K/O actions are obtained from the integral derived correspondence, without lifting torsion sections. Here C_r is Pilloni’s operator T in §7; it is distinct from CG20 T and from either source’s individual numbered generators.

Hypotheses and conventions:

- The models, maps, normality and lci hypotheses are imported from C14; the fundamental class and trace require the exact DUAL request.
- The central scalar formula is restricted as in S5. At general central character, keep the corresponding central transport and prove the same cancellation before reducing.

Construction or proof route:

1. Apply coherent duality to the two projections of the Klingen-to-paramodular diagram, obtaining maps into their relative dualizing lines.
2. At the ordinary generic points the first map has differential/trace orders (r,2) or (d+2r,0); d+r≥2 gives order at least r+2. For the second map the orders are (0,1) or (r,0), giving order at least one.
3. Extend both factorizations by normality from the smooth ordinary generic points, using local freeness of the dualizing line and the boundary fundamental-class comparison.
4. The composite double coset has one noncentral component β₂, and the central component has multiplicity 1+p+p²+p³, the number of Klingen lines. With the total normalization p^(−r−3), this gives the stated rational C_r.
5. Subtract (1+p²)p^(j−2), since p^(3−r)S=p^(j−3), to obtain exactly the S5 cancelled Q₂ formula. Reduce the integral derived maps only after their construction.

API required by the uses:

- `composite_factorization` (characterisation): The raw two maps factor by p^(r+2) and p; division is performed in their torsion-free integral Hom sheaves.
- `composite_rational` (compatibility): C_r=p^(3−r)(T₂+(1+p+p²+p³)S) over K.
- `composite_q2` (relation): Q₂=C_r−(1+p²)p^(j−2) in the specified trivial central sector.
- `composite_coefficients` (functoriality): Derived tensor with O/ϖ^m and filtered coefficient colimits give compatible actions on finite coefficients and K/O.
- `composite_boundary` (compatibility): The fundamental class carries the subcanonical boundary ideals, so the construction also acts on cusp cohomology.

Discriminating checks:

- `composite_weight_22` (computation): At (2,2), C₂−Q₂=1+p² is integral although p^(3−2)S=p^(−1) is not.
- `composite_weight_33` (computation): At (3,3), C₃−Q₂=p+p³, so C₃ and Q₂ have the same mod-p action.
- `torsion_obstruction` (non-example): A nonzero H¹(ω)[ϖ^m] can obstruct lifting a torsion form; the derived integral map still acts on that form, whereas a rational-lattice map alone would not.

Uses:

- S7 global Q₂: Supplies the actual finite-coefficient construction behind the coefficient formula.
- Future IntegralCoherentHeckeComplexes: Records the genus-two special case and exact generic duality interface, for later transfer to its general owner.

Acceptance:

- The difference C_r−Q₂ is (1+p²)p^(j−2), including a unit term when j=2.
- Integral derived coefficient reduction constructs an action on every torsion section, even a section obstructed from lifting to O.

Prerequisites: `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications`, `ShimuraCompactificationsPartII:C14/normal-lci`, `ShimuraCompactificationsPartII:C14/genus-two-sheaves`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `SchemeAndStackFoundations:SF.2`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/hecke-decomposition`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/corrected-q2`, `AbelianSchemesAndArithmeticModuli:A4`, `SchemeAndStackFoundations:SF.2/relative-dualizing-complex`, `SchemeAndStackFoundations:SF.2/relative-dualizing-module`, `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`.

Sources: P20, §4.1–4.3, pp. 16–19; §7 and Lemmas 7.1.1–7.1.2, pp. 37–40 — Constructs integral normalized fundamental-class correspondences, their composite and its rational double-coset identity.

Open obligations: R4.

### Integral T and Q₂ on global forms

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/integral-h0-action` (construction).

For j≥k≥2, T and Q₂ act O-linearly on M_(j,k)(O/ϖ^m), S_(j,k)(O/ϖ^m), and their K/O versions. T is the restriction of the integral minuscule correspondence, extended by Hartogs. Q₂ is the integral paramodular composite C_k minus (1+p²)p^(j−2). Its rational comparison and all-component expansion identify it with S5. The actions commute with coefficient transitions, tame deck transformations, prime-to-p Hecke operators and common fan refinements. Rationally they have the prescribed spherical normalization. No action of bare T₂ on these torsion spaces is inferred.

Hypotheses and conventions:

- Use the trivial central/diamond sector for the scalar S5 expression, or retain and verify the full central transport operator before generalizing.
- The integral correspondence, including the coherent-duality supplier request, is constructed before coefficient reduction.

Construction or proof route:

1. Construct T on the formal open using its normalized integral sheaf correspondence, then transport H⁰ through Hartogs.
2. Construct Q₂ by the paramodular composite and integral central subtraction. Take derived tensor with O/ϖ^m; the derived projection formula identifies the cohomology of the coefficient sheaf because the models and bundles are O-flat.
3. Check the rational coefficient formula on every component. The integral correspondence gives the finite-level map itself, rather than a claim that every torsion form lifts.
4. Take the filtered colimit along O/ϖ^m→K/O and use uniqueness plus disjoint-support correspondence composition to prove commutation.

API required by the uses:

- `global_t_q2_coeff` (compatibility): Their expansions are exactly the S5 formulas with every component transport included.
- `global_t_q2_unique` (extensionality): The all-component expansion principle determines each operator uniquely.
- `global_t_q2_transitions` (functoriality): The actions commute with reduction and the maps to K/O.
- `global_t_q2_away_p` (relation): They commute with prime-to-p Hecke actions, tame U actions and deck transformations.
- `global_t_q2_rational` (compatibility): Over K they are the normalized spherical double cosets T and (pT₂+(p+p³)S)p^(2−k).

Discriminating checks:

- `torsion_reduction` (compatibility): Applying the integral operator then reducing mod ϖ gives the same coefficients as the characteristic-p formula.
- `all_components` (non-example): Testing only an untransported cusp on one component does not determine a global Hecke action.
- `weight_22_global` (computation): In weight (2,2), the Q₂ coefficient has X₂+Z₂ modulo p, so replacing Q₂ by Z₂ fails.

Uses:

- GSp4NonregularModularityLifting: Provides the degree-zero at-p algebra.
- HigherHidaAndColemanTheory: Provides the spherical degree-zero comparison only; its Klingen construction stays there.

Acceptance:

- A torsion form need not lift to characteristic zero; the proof works by reduction of an integral derived correspondence.
- The exact central subtraction agrees at weights (2,2) and (3,3).

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S7/integral-sheaf-t`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/paramodular-composite`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/siegel-hartogs`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/q-expansion-principle`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/corrected-q2`, `AutomorphicBundles:B5`.

Sources: CG20, Lemma 8.8, internal p. 60 (860); Lemma 8.12, p. 64 (864) — Provides global T and Q₂ actions with K/O coefficients and the cancelled integral coefficient formula.; P20, §7, pp. 37–40 — Provides the integral composite used to construct Q₂ on torsion coefficients.

Open obligations: R2.

### Hasse equivariance at p

Target `AlgebraicModularFormsAndSerreWeightsPartII:S7/hasse-at-p` (theorem).

In characteristic p, multiplication by h commutes with T and Q₂ for weights j≥k≥3. The source and target symmetric degrees agree, and h has expansion 1. T reduces to U in both weights; Q₂ reduces to Z₂ in both, including weight (3,3). For k=2, T initially reduces to U+Z and Q₂ has the additional X₂ term at (2,2), so no such unrestricted commutation claim is made.

Hypotheses and conventions:

- Operators are those of the global H⁰ action, with matching cusp/component transports.

Construction or proof route:

1. Use the exact S5 formulas to reduce modulo p before comparing the two weights.
2. At (3,3), retain the cancellation in Q₂; bare T₂ has an extra −1 and does not justify the conclusion.
3. Apply the all-component expansion principle.

Acceptance:

- The proof explicitly includes (3,3).
- No p-adic lifting of theta is used in this comparison.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/integral-h0-action`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/hecke-decomposition`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/corrected-q2`.

Sources: CG20, Lemma 6.2(2), internal p. 36 (836); Lemma 8.12, p. 64 (864) — The intended equivariance holds, while the special (3,3) normalization requires the Q₂ cancellation.

## S8. Theta operators and low-weight injectivity

State theta only in characteristic p, with the GL₂ determinant twist in the contraction and no extra determinant in the vector Fourier coefficient. Prove the superspecial and negative-weight inputs separately, then give corrected scalar and vector injectivity ranges. Targets using the global secondary square root retain G2.

### Integral symmetric-power contraction

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/contraction` (construction).

Let d≥2 and let R be an algebra in which 2d(d+1) is invertible, in particular a characteristic-p algebra with p>d+2. For a free rank-two module E define con_d:Sym^d E⊗Sym²E→Sym^(d−2)E⊗(det E)² by the normalized second transvectant. In a frame x,y, con_d(f⊗g)=(f_xx g_yy−2f_xy g_xy+f_yy g_xx)/(2d(d+1)), with the indicated determinant-square tensor. This frame formula glues by GL₂-equivariance; changing to another source convention rescales by its explicitly identified unit. Under the chosen highest-weight inclusion, the vector x^d⊗y²−2x^(d−1)y⊗xy+x^(d−2)y²⊗x² maps to x^(d−2)⊗(x∧y)².

Hypotheses and conventions:

- The polynomial expression describes the existing symmetric-power basis; it does not replace the imported symmetric-power carrier.
- The determinant square is part of the GL₂ statement, even though it disappears on SL₂.

Construction or proof route:

1. Define the bilinear map in the monomial basis supplied by Tau Ceti.
2. Check the second-transvectant transformation under generators of GL₂ and its determinant-square factor.
3. Compute the highest-weight inclusion to fix the scalar 2d(d+1); its invertibility gives the projection normalization.

API required by the uses:

- `con_frame_formula` (simp): The coefficient formula is the normalized second transvectant in every frame.
- `con_equivariant` (functoriality): con_d intertwines GL₂ with the target determinant-square action.
- `con_base_change` (functoriality): The map commutes with scalar extension preserving invertibility of 2d(d+1).
- `con_projection` (relation): On the displayed highest-weight inclusion its value is x^(d−2)⊗(x∧y)².
- `con_degree` (compatibility): The map lowers symmetric degree by two and raises determinant exponent by two.

Discriminating checks:

- `con_d2` (computation): For d=2, con₂(x²⊗y²)=(1/3)(x∧y)².
- `rank_one_not_zero` (non-example): For d=2 and Q=x², con₂(y²⊗Q)=(1/3)(x∧y)² although det Q=0.
- `highest_weight_normalization` (computation): The three-term highest-weight tensor in the statement has unnormalized transvectant 2d(d+1)x^(d−2).

Uses:

- S8 vector theta: Defines its Fourier coefficient and target weight.
- GSp4NonregularModularityLifting: Prevents the false inference that every singular coefficient is killed by vector theta.

Acceptance:

- The map is nonzero on some tensors with a rank-one quadratic factor.

Prerequisites: `tauceti:Representation.symmetricPower`, `tauceti:Module.Basis.symmetricPower`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/formal-series`.

Sources: Y16, Decomposition (3.31), p. 22; Proposition 3.12 and the Fourier computation, pp. 23–24 — The lowest symmetric-degree summand gives θ₁; the scalar normalization is pinned here.; CG20, Proposition 8.9(2), internal p. 61 (861) — Uses the SL₂ contraction; its Fourier determinant factor is corrected in the next node.

### Scalar and vector theta operators

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/theta-operators` (construction).

Over k₀ of characteristic p>3 there is a scalar map Θ:M_(k,k)(k₀)→M_(k+p+1,k+p+1)(k₀), k≥2, whose Fourier coefficient is det(Q)a(F,Q). For d=j−k≥2 with p>d+2 and k≥2 there is a map θ₁:M_(j,k)(k₀)→M_(j+p−1,k+p+1)(k₀), whose coefficient is con_d(a(F,Q)⊗Q). Normalize the source differential operators by the unit making these exact formulas hold. The vector formula has no extra det(Q). Both preserve cusp forms. They are defined by the Gauss–Manin/Kodaira–Spencer construction with Hasse multiplication removing poles, and descend from principal neat tame level by étale descent. These are characteristic-p operators, with scalar extension to characteristic-p coefficient algebras; no construction modulo p² is asserted.

Hypotheses and conventions:

- For the vector formula Q corresponds to m x²+rxy+n y² in Sym²E in the chosen cusp frame.
- The principal level N≥3 is prime to p; descent uses equivariance, not division by a cover degree.

Construction or proof route:

1. Import the Hodge bundle, Gauss–Manin connection and Kodaira–Spencer map with their polarization compatibility.
2. Use the unit-root splitting on the ordinary open, project via con_d (or the scalar second differential), and multiply by h to remove the poles.
3. Verify regularity in the superspecial first-order charts following Yamauchi, then compute at the Mumford cusp; extend over the boundary using Koecher.
4. Use étale descent and q-expansion uniqueness to compare the chosen unit normalization.

API required by the uses:

- `theta_scalar_coeff` (simp): a(ΘF,Q)=det(Q)a(F,Q).
- `theta_vector_coeff` (simp): a(θ₁F,Q)=con_d(a(F,Q)⊗Q).
- `theta_cusp` (structure): Both operators carry cusp forms to cusp forms.
- `theta_descent` (functoriality): They commute with tame-level étale pullback and descent, retaining the marked cusp transports.
- `theta_hasse_product` (relation): For scalar forms, Θ(hF)=hΘF by their coefficient formulas and equal target weights.
- `theta_coefficients` (functoriality): The construction commutes with extension of characteristic-p coefficient fields, and with flat scalar extension where the section/cohomology base-change comparison is available.

Discriminating checks:

- `hasse_kernel` (computation): The nonzero form h of weight p−1 has Θh=0.
- `theta_rank_one` (non-example): A coefficient y² at Q=x² can give nonzero θ₁ even though its scalar Θ coefficient is zero.
- `scalar_determinant_p7` (computation): At p=7 and Q=x²+y², the scalar theta coefficient equals a(F,Q), since det Q=1; using Δ(Q)=−4 would instead multiply it by 3.

Uses:

- S8 injectivity: The coefficient formulas and local nonvanishing give the repaired low-weight theorems.
- GSp4NonregularModularityLifting: Uses the scalar and nonparallel theta maps, with their different supports.

Acceptance:

- Θ(h)=0 follows from the constant expansion of h.
- The vector target symmetric degree is d−2, agreeing with con_d.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S8/contraction`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/q-expansion-principle`, `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham`.

Sources: Y16, Propositions 3.9, 3.11, 3.12, pp. 21–24 — Constructs the characteristic-p operators and computes their Fourier coefficients.; CG20, Proposition 8.9, internal p. 61 (861) — Uses these operators; the coefficient ring and vector formula require the stated corrections.

Open obligations: R5.

### Theta nonvanishing at superspecial points

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/superspecial-nonvanishing` (theorem).

If a scalar form of weight k≥2 is nonzero on SS and p does not divide k(2k−1), then ΘF≠0. For vector weight (j,k) with d=j−k≥2, p>d+2, a nonzero superspecial value gives θ₁F≠0 when j−3k is nonzero modulo p. In weight (6,2), the same conclusion holds for p>7 by choosing a local SL₂(F_p) frame in which the coefficient F₂ is nonzero; the local linear term has nonzero coefficient j−3=3. This is a change of fiber frame at the fixed point, not a Γ̄-action on global modular forms.

Hypotheses and conventions:

- The superspecial point and its coefficients may be taken over an algebraic closure.
- For the exceptional frame argument, 0≤d<p makes Sym^d of the natural SL₂(F_p) representation irreducible; prove the needed coordinate-detection statement by unipotent interpolation.

Construction or proof route:

1. Use the generic first-order superspecial deformation to evaluate the scalar constant term as a nonzero unit times k(2k−1)F|_x.
2. For vectors compute the three linear coefficients involving (j−3k)F₀/2, (j−3k)F₁/2 and (j−3)F₂.
3. When j=6,k=2, use the nonzero symmetric-power orbit to arrange F₂≠0 in the local frame, then use the last coefficient.
4. For frame detection, vary upper and lower unipotents and use a polynomial of degree <p that vanishes on all of F_p only when all its coefficients vanish.

Acceptance:

- The exceptional case requires only a local frame change.
- The irreducibility check is in the stated small-degree characteristic-p range.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S8/theta-operators`, `tauceti:Representation.symmetricPower`, `AbelianSchemesAndArithmeticModuli:A4`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/small-symmetric-power`.

Sources: Y16, Theorem 4.7 and proof, p. 38; Theorem 4.9 and proof, p. 39 — Computes the superspecial scalar and vector leading terms and uses a local unipotent frame change.; CG20, Proof of Theorem 8.11, internal p. 62 (862) — Identifies the exceptional (6,2) case; the reference is Yamauchi v5 Theorem 4.9.

Open obligations: R5.

### Negative-weight section vanishing

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/negative-weight-vanishing` (theorem).

At spherical good level over an algebraic closure, if a≥b and pa−b<0, then H⁰(Z_red,ω(a,b))=H⁰(S,ω(a,b))=H⁰(X₁,ω(a,b))=0; the same holds for their cusp subsheaves. On each P¹ component of Z_red, every summand of ω(a,b) has degree at most pa−b. A section zero on Z_red is divisible on S by its Cartier equation b₀ of weight m₀=(p²−1)/2; iterating decreases pa−b by (p−1)m₀ and Krull intersection forces zero. On X₁ repeat with the primary equation h, decreasing pa−b by (p−1)². The relevant divisors meet every component, and reducedness/density then propagates vanishing.

Hypotheses and conventions:

- p>3; use the spherical Cartier-root target, with its descent over an algebraic closure.
- The letter b₀ here denotes the secondary root, not the second weight b.

Construction or proof route:

1. Compute the split Hodge-bundle degrees on every supersingular P¹.
2. Use the Cartier exact sequence on S and inductively divide by b₀, then apply Krull intersection at its generic divisor points.
3. Use the same argument with h on each component of X₁. Verify the divisors meet every component via the positive Hodge power on the minimal model; no empty divisor is allowed in the argument.

Acceptance:

- A negative second weight alone is not used as a vanishing criterion.
- After either division step the strict inequality remains strict.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-square-root`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `SchemeAndStackFoundations:SF.0`.

Sources: CG20, Proofs of Theorems 8.10–8.11, internal pp. 62–63 (862–863) — Uses the supersingular splitting and negative weights; the criterion pa−b<0 and the iteration make the missing vanishing argument explicit.

Open obligations: G2 — global secondary square root and descent, R6.

### Scalar theta injectivity in low weight

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/scalar-theta-injective` (theorem).

Let p>3, 2≤k≤p+1, k≠p−1 and p∤k(2k−1). Then Θ:M_(k,k)(k₀)→M_(k+p+1,k+p+1)(k₀) is injective, and so is its restriction to cusp forms. The exclusion k=p−1 is essential because h is nonzero with Θh=0. The result is over characteristic p, not an asserted injection modulo arbitrary powers of ϖ.

Hypotheses and conventions:

- All components and auxiliary tame levels are retained; prove after a faithfully flat algebraic closure and descend.

Construction or proof route:

1. If ΘF=0, superspecial nonvanishing gives F|_SS=0. On each supersingular P¹ its degree k(p−1)<p²+1 forces F|_Zred=0.
2. The Cartier sequence and negative-weight criterion then give F|_S=0, hence F=hG.
3. For k≤p−2 the residual weight k−p+1 is negative, so G=0. The case k=p is excluded by p∤k.
4. At k=p+1, G has weight 2 and ΘF=hΘG, so the already proved weight-two case gives G=0. The excluded weight p−1 would instead leave a constant G.

Acceptance:

- At p=5, k=4 is excluded despite 5∤4·7.
- The k=p+1 step reduces to weight two instead of discarding the residual Hasse factor.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S8/theta-operators`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/superspecial-nonvanishing`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/negative-weight-vanishing`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-square-root`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`.

Sources: CG20, Theorem 8.10 and proof, internal pp. 61–62 (861–862) — Its geometric argument yields the stated corrected range after the Hasse counterexample and characteristic-p restriction are included.; Y16, Theorem 4.7(2), p. 38 — Provides the superspecial nonvanishing step.

Open obligations: G2 — global secondary square root and descent.

### Vector theta injectivity in weight (j,2)

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/vector-theta-injective` (theorem).

Let p>3 and 4≤j<p−1. Then θ₁:M_(j,2)(k₀)→M_(j+p−1,p+3)(k₀) is injective, also on cusp forms. This includes j=6 whenever the range permits it. The proof uses the closed nonordinary divisor S, not just its rank-one open, and does not infer that θ₁ annihilates every coefficient of singular Q.

Hypotheses and conventions:

- The weight range gives d=j−2<p−2, so the contraction normalization is integral at p.

Construction or proof route:

1. If θ₁F=0, use the superspecial nonvanishing theorem and its exceptional j=6 frame argument to show F|_SS=0.
2. On each supersingular P¹, the largest degree of ω(j,2) is pj−2<p²+1, hence F|_Zred=0.
3. On S divide by b₀ of weight m₀. The new weights (j−m₀,2−m₀) satisfy pa−b<0, so F|_S=0 by the negative-weight theorem.
4. Then F=hG with weights (j−p+1,3−p), again satisfying pa−b<0; therefore G=0.

Acceptance:

- At j=6 the frame argument uses p≥11 under j<p−1.
- No Lan–Suh vanishing or Serre-dual weight computation is needed after the explicit negative-weight argument.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S8/theta-operators`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/superspecial-nonvanishing`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/negative-weight-vanishing`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-square-root`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/small-symmetric-power`.

Sources: CG20, Theorem 8.11 and proof, internal pp. 62–63 (862–863) — Provides the supersingular degree bound; the explicit negative-weight steps repair the omitted vanishings.; Y16, Theorem 4.9 and proof, p. 39 — Gives the vector superspecial calculation, used with a local frame rather than a cusp-stabilizer action.

Open obligations: G2 — global secondary square root and descent.

### Small symmetric powers of SL₂(F_p)

Target `AlgebraicModularFormsAndSerreWeightsPartII:S8/small-symmetric-power` (theorem).

For 0≤d≤p−1 and an algebraically closed field k of characteristic p, the natural representation Sym^d(k²) of SL₂(F_p) is irreducible. In the range d<p−1 needed here, every nonzero homogeneous polynomial P has a nonzero value at a primitive vector of F_p²; hence an SL₂(F_p) change of local frame can make its chosen extreme coefficient nonzero. The change is in a geometric fiber and is not a global action on the modular-form space.

Hypotheses and conventions:

- p is prime; only d<p−1 is needed for the exceptional vector-theta frame step.

Construction or proof route:

1. The upper and lower unipotent subgroup operators are polynomials in t∈F_p of degree at most d<p. Interpolation isolates their divided-power coefficients.
2. On a nonzero invariant subspace, an appropriate highest nonzero coefficient and the raising operator produce x^d; lowering operators then produce every monomial, since binomial(d,i) is nonzero modulo p for d<p.
3. For the frame assertion restrict P to P¹(F_p): a nonzero degree-d binary form has at most d distinct projective zeros, fewer than p+1. Complete a vector where P is nonzero to an SL₂(F_p) matrix.

Acceptance:

- The interpolation uses degrees <p, including d=p−1.
- For d=p+1, x^p y−xy^p vanishes on all F_p-vectors, so the frame assertion would fail.

Prerequisites: `tauceti:Representation.symmetricPower`, `tauceti:Module.Basis.symmetricPower`.

Sources: CG20, Proof of Theorem 8.11, internal p. 63 (863) — Invokes small symmetric-power irreducibility; the proof above gives the precise finite-group statement needed for a local frame.; Y16, Theorem 4.9 and proof, p. 39 — Its superspecial coordinates identify the extreme coefficient tested after a frame change.

## S9. Ordinary p-adic forms and coefficient comparison

Use the full ordinary GL₂ Igusa tower requested from its existing owner. Fix action, Borel, character and limit order together, compare classical algebraic coefficients with continuous frame functions, and isolate the additional Klingen geometric normalization comparison from analytic control.

### Degree-zero p-adic Siegel forms

Target `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-forms` (definition).

Use the imported full ordinary genus-two Igusa tower Ig_(m,n) over X_m^ord. Put V_m=colim_n H⁰(Ig_(m,n),O) and V=lim_m V_m, with its p-adic topology and left function action (g·f)(ψ)=f(ψ∘g). Let U⁺ be the upper triangular unipotent subgroup of GL₂(Z_p). For a continuous character κ:Z_p×→O× and integer r, put χ_(κ,r)(diag(t₁,t₂))=κ(t₁)(t₁t₂)^r, and define V_(κ,r)={f∈V^(U⁺):t·f=χ_(κ,r)(t)f for every diagonal t}. Cusp forms use the inverse-image boundary ideal before taking colimits and inverse limits. Thus the algebraic specialization κ(t)=t^d has classical weight (d+r,r). This is Pilloni’s upper-unipotent convention: his weights are indexed from the bottom diagonal entry, κ′=(−k,−j), and −κ′ in those coordinates is exactly t₁^j t₂^k. The inverse-transpose frame map accounts for this character. An opposite-Borel convention must also reverse the two diagonal exponents.

Hypotheses and conventions:

- Limits are in the order inverse coefficient level, direct Igusa level; the character action is continuous.
- For scalar extensions to O, use the corresponding ϖ-adic completed tower functions with the same order of limits.

Construction or proof route:

1. Form the specified direct and inverse limits, using the imported tower action.
2. Take the invariant submodule and character equations as a closed weight submodule of the complete function module.
3. Use ω(ψg)=ω(ψ)g^(−t). Evaluating the highest-coordinate algebraic coefficient gives upper-unipotent invariance and character t₁^(d+r)t₂^r; check against Pilloni’s bottom-to-top weight indexing.

API required by the uses:

- `padic_form_weight` (characterisation): f(ψ∘u)=f(ψ) for u∈U⁺ and f(ψ∘t)=χ_(κ,r)(t)f(ψ).
- `padic_form_complete` (structure): V and its closed weight submodules are separated and complete for the coefficient-adic topology.
- `padic_form_multiplication` (structure): Multiplication sends weights (κ,r),(κ′,r′) to (κκ′,r+r′); cusp forms form an ideal.
- `padic_form_transition` (functoriality): Tower pullbacks and coefficient reductions are equivariant and define the indicated limits.
- `padic_form_borel_comparison` (equivalence): With source coordinates κ=(j,k) indexed from the bottom, κ′=(−k,−j) and the source character −κ′ equals χ=t₁^j t₂^k for the fixed upper unipotent.

Discriminating checks:

- `padic_constants` (degenerate): The constant function 1 has weight (κ=1,r=0).
- `algebraic_character` (computation): For κ(t)=t^d the diagonal character is t₁^(d+r)t₂^r, giving weight (d+r,r).
- `full_tower_rank` (non-example): At n=1 the full tower has group GL₂(F_p), rather than F_p× or (F_p×)²; using only diagonal frames changes the space.

Uses:

- HigherHidaAndColemanTheory, degree-zero comparison: Imports the space into which its overconvergent degree-zero forms embed.
- S9 q-expansion: Uses all frames to detect vector-weight coefficients.

Acceptance:

- A Hilbert (O_F/p^n)× torsor is not substituted for the full GL₂ torsor.
- The Borel, frame map and bottom-to-top source character indexing are fixed together.

Prerequisites: `HodgeTateAndCanonicalSubgroups:T5`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/integral-siegel-forms`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`.

Sources: P12, Definition 4.3, p. 352; frame comparison §4.2.1, pp. 353–354 — Defines ordinary Igusa functions, their invariant weight spaces and the inverse-transpose frame comparison.; T06, §3.2, pp. 808–810 — Describes the functions, group action and classical comparison in genus two.

Open obligations: G5 — full-frame Klingen coefficient comparison, R7.

### p-adic q-expansion and saturation

Target `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-q-expansion` (construction).

The canonical multiplicative trivialization of the split Mumford torus lifts each marked cusp to the full Igusa tower. For f∈V evaluate every g-translate at this lift, obtaining coefficients a_c(f,Q)(g) continuous in g∈GL₂(Z_p), locally constant at each finite coefficient level. For U⁺-invariant f these functions factor through GL₂(Z_p)/U⁺ with the stated left/right action convention. The family over every component and all frame translates is injective and saturated: f∈V[1/p] is integral iff all these coefficients are integral. The analogous finite-level statement has injective coefficient map with flat cokernel after the tower’s component-detection hypothesis, supplied by T5, is verified.

Hypotheses and conventions:

- Do not infer connectedness of an arbitrary full-level Igusa cover without the monodromy input.
- For a single connected principal-level tower with its proved irreducibility, one marked canonical lift can detect sections; the all-frame formulation accommodates the general tame setting.

Construction or proof route:

1. Evaluate on the canonical multiplicative torus frame and its g-translates and check compatibility in both indices.
2. Use finite-level component detection/irreducibility and the toroidal chart expansion to obtain injectivity.
3. Use injectivity after every finite coefficient reduction to prove saturation, then pass in the stated limit order.

API required by the uses:

- `padic_coeff` (data): Each coefficient is a continuous function on GL₂(Z_p), with the U⁺ quotient in the invariant subspace.
- `padic_coeff_ext` (extensionality): All component/frame coefficients determine f uniquely.
- `padic_coeff_integral` (characterisation): Their integrality is equivalent to f belonging to the integral function lattice.
- `padic_coeff_action` (functoriality): Translation of the frame is the corresponding translation of the coefficient function.
- `padic_coeff_cusp` (compatibility): Cusp functions have support only at positive-definite indices, with every boundary component tested.

Discriminating checks:

- `constant_expansion` (computation): The constant function 1 has constant coefficient function 1 at Q=0.
- `frame_translation` (compatibility): The expansion of g·f at the canonical frame is the expansion of f at the frame translated by g.
- `denominator_detection` (non-example): A coefficient 1/p at one marked frame prevents f from lying in the integral lattice even when coefficients at other frames vanish.

Uses:

- HigherHidaAndColemanTheory, Proposition 13.3.1.1 interface: Detects degree-zero integrality after embedding into ordinary functions.
- S9 Klingen operator: Identifies the operator by its coefficient action.

Acceptance:

- For nonparallel weights evaluating only the identity frame need not record the entire coefficient representation.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-forms`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/fourier-expansion`, `HodgeTateAndCanonicalSubgroups:T5`.

Sources: T06, Proposition 3.3 and preceding construction, pp. 808–809 — Defines the continuous-function-valued expansion and its saturated q-expansion principle.; P12, §4.2.1, pp. 353–354 — Fixes the relation between Igusa and differential frames.

Open obligations: G5 — full-frame Klingen coefficient comparison, R7.

### Classical-to-p-adic comparison

Target `AlgebraicModularFormsAndSerreWeightsPartII:S9/classical-padic-comparison` (construction).

Restriction to the ordinary formal locus followed by evaluation on its Igusa-induced differential frames defines an injective map M_(d+r,r)(O)→V_(t↦t^d,r), and similarly for cusp forms. It is compatible with classical and continuous-function-valued Fourier expansions under the algebraic symmetric-power coefficient inclusion. At finite coefficient level the analogous evaluation map is defined, but its injectivity is a separate property and is not inferred from the integral limit: integer-valued polynomial functions can vanish on all finite-level frames in characteristic p. The inverse limit map is injective by the expansion principle and the density of p-adic frames in the algebraic representation.

Hypotheses and conventions:

- d≥0; the Hodge–Tate differential frame is taken at n sufficiently large for the coefficient level m.
- Use ω(ψ∘g)=ω(ψ)∘g^(−t), fixing the Borel/sign convention of the definition.

Construction or proof route:

1. Use the Igusa trivialization to produce the differential frame and evaluate a classical bundle section on the frame torsor.
2. Check the inverse-transpose character law and use the classical expansion map to prove injectivity over O.
3. Compare expansions as functions on the full p-adic group, not by evaluating one coordinate of a nonparallel coefficient.

API required by the uses:

- `classical_padic_map` (data): The map sends the algebraic weight (d+r,r) to χ=t₁^(d+r)t₂^r.
- `classical_padic_injective` (characterisation): The integral inverse-limit map has zero kernel.
- `classical_padic_q` (compatibility): Its expansion equals the classical coefficient under the algebraic-function embedding into continuous frame functions.
- `classical_padic_tame` (functoriality): Tame level pullbacks and prime-to-p Hecke actions commute with evaluation.
- `classical_padic_finite` (other): Finite-level maps commute with reduction, but their kernels are not assumed zero without a degree or representation-theoretic hypothesis.

Discriminating checks:

- `parallel_character` (computation): For d=0, the diagonal character is det^r and its coefficient is scalar.
- `inverse_transpose` (compatibility): An Igusa frame change ψ→ψg sends the differential frame to ω(ψ)g^(−t).
- `finite_level_polynomial` (non-example): The nonzero characteristic-p homogeneous polynomial x^p y−xy^p vanishes on every F_p-frame column; finite-level evaluation cannot be declared injective in arbitrary algebraic degree.

Uses:

- HigherHidaAndColemanTheory: Provides its ordinary degree-zero target; its analytic embedding and control theorem remain its own targets.
- S9 normalized Klingen U: Compares classical ordinary coefficients with tower functions.

Acceptance:

- No finite-level injectivity theorem is obtained merely by reducing the integral injection.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-forms`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S1/q-expansion-principle`, `HodgeTateAndCanonicalSubgroups:T5`.

Sources: P12, §4.2.1, pp. 353–354 — Constructs the maps and explicitly distinguishes finite-level behavior from the injective inverse-limit comparison.; T06, Comparison diagram, pp. 809–810 — Relates classical algebraic coefficients to continuous-function-valued expansions.

Open obligations: G5 — full-frame Klingen coefficient comparison, R7.

### Klingen ordinary coefficient operator

Target `AlgebraicModularFormsAndSerreWeightsPartII:S9/klingen-coefficient-operator` (theorem).

On the ordinary genus-two Igusa function space, normalize the Klingen degree-zero operator U_(p,2)^ord so that its formal coefficient action is Z₂=UZ: a(U_(p,2)^ord f,Q)=Σ_Mρ_d(M)a(f,M⁻¹·pQ) at an algebraic weight of symmetric degree d, and the corresponding finite-coset action on continuous frame functions at continuous weight. It preserves integral expansions and hence the integral function lattice by saturation. This operator is distinct from the diagonal formal U₂=−1+pX₂. The analytic Klingen operator p^(3−r)U_(Kli(p),1) and its identification under the overconvergent-to-Igusa embedding are supplied by HigherHidaAndColemanTheory; its raw normalization must be compared before using the same symbol.

Hypotheses and conventions:

- The ordinary finite-level correspondence and its trace/action on full Igusa frames must realize the stated normalized finite-coset action; this additional interface is recorded in G5.
- The matrices ρ_d(M) at continuous weight mean their full-frame induced function action, not an undefined evaluation of κ at the nonunit det M.

Construction or proof route:

1. Lift the ordinary Klingen correspondence to the full Igusa tower and express its finite cosets in the frame functions.
2. Match the algebraic specialization with the Z₂ coefficient identity from S5; the p-powers are determined by the rational Hecke normalization.
3. Use the saturated expansion principle to prove preservation of the integral lattice. The comparison with the analytic Klingen normalization is a downstream equality, not assumed here.

Acceptance:

- A continuous character of Z_p× is never evaluated at p.
- The diagonal U₂ is not silently substituted for Z₂.

Prerequisites: `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/classical-padic-comparison`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/u-z-v`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/characteristic-p-relations`, `HodgeTateAndCanonicalSubgroups:T5`.

Sources: T06, §3.2, p. 810 — Gives integral ordinary U operators on Igusa functions.; CG20, §5.5, internal p. 33 (833); Lemmas 8.3–8.4, pp. 58–59 (858–859) — Distinguishes the ordinary U_(p,2) congruence from the formal diagonal U₂.; P20, §13.3.1, p. 89 — Uses integral p-adic expansions for the analytic degree-zero comparison.

Open obligations: G5 — full-frame Klingen coefficient comparison, R7.

## Worked normalization checks

At (j,k)=(2,2), the separate rational terms contain negative p-powers. Combining U₂+1 first gives Q₂=X₂+Z₂+pV₂+p. The integral paramodular composite has C₂−Q₂=1+p². Thus its construction acts on torsion forms and the coefficient reduction is Q₂=X₂+Z₂ modulo p.

At (3,3), T₂=−1+pX₂+Z₂+p³V₂ and Q₂=pX₂+Z₂+p³V₂+p². Therefore T₂ reduces to Z₂−1 and Q₂ to Z₂. Also C₃−Q₂=p+p³. A proof of Hasse equivariance at this weight must use Q₂ rather than the incorrect bare-generator congruence.

For p=3 and Q=x²+y², Δ=−4≡2, so the projective-zero count is zero, X₂ has integral multiplier −1 and U₂ has multiplier −4. For Q=3(x²+y²), the zero reduction has four projective zeros and X₂ has multiplier 3, not the Legendre value zero until reduction. For p=5 and the primitive form x²+y², the two isotropic lines give two neighbor occurrences even though their integral SL₂(Z) classes coincide.

For the tame-orientation check take Γ̄=Γ(5), p=3, Q=x² and M=[[3,5],[30,51]]. Then M=[[1,5],[10,51]]diag(3,1), with the left factor in Γ(5), and the normalized inverse image is 3(17x−10y)². Its coefficients reduce to (2,0,0) modulo 5. Every determinant-three matrix in the forward double coset reduces to diag(3,1), so a second forward neighbor has coefficients (4,0,0) modulo 5. Γ(5) preserves these reductions. Thus it cannot recover the Γ(5)-class of Q; the reciprocal relation must use the reverse double coset unless level transport identifies the two.

For the normalized contraction at d=2, con₂(x²⊗y²)=1/3 and con₂(y²⊗x²)=1/3 in the determinant-square target. The second input has rank one, showing why the vector theta coefficient has no extra det Q. In the scalar case the Hasse invariant has expansion 1 and Θh=0. At p=5 its weight k=4 satisfies the other numerical conditions from the uncorrected injectivity statement; the excluded Hasse weight is therefore essential.

A formal H¹ comparison requires the Milnor sequence. The finite-level H⁰ restriction isomorphisms identify the lim¹H⁰ terms, and finite-level H¹ injections then give an injection on their inverse limits. This yields the formal H¹ injection by the diagram of short exact Milnor sequences; it does not rely on a general identity H¹(lim F_n)=lim H¹(F_n).

## Supplier obligations and existing upstream import

R1–R7 are open extensions. R8 records an existing upstream import and is not an unproved supplier obligation.

### R1. AbelianSchemesAndArithmeticModuli:A4

Extend the imported A4/grothendieck-messing, A4/serre-tate-equivalence and A4/ordinary-serre-tate-coordinates interfaces to explicit genus-two p-rank-one polarized deformation coordinates and the ordinary trace ideals for Lagrangian p-isogenies. In the basis specified in S2 the three tangent constraints are X=Z (principal) and Z=0 or X=0 (paramodular). The deformation equivalences and generic ordinary coordinates themselves are already supplied.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/ordinary-trace`.

### R2. AutomorphicBundles:B5

Rational spherical GSp₄ pullback-and-trace actions on canonical and subcanonical bundles, including the similitude^(−3) twist, β₁=diag(1,1,p,p), β₂=diag(1,p,p,p²), pI₄ and their cusp/component transports. After p is inverted these identify the geometric actions with the double-coset coefficient formulas.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S5/hecke-decomposition`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/integral-h0-action`.

### R3. SchemeAndStackFoundations:SF.2

Extend the existing finite-level depth/local-cohomology Hartogs theorem by a compatible formal Milnor/derived-inverse-limit sequence on the open, and filtered-colimit compatibility on qcqs opens for K/O coefficients. Proper coherent formal functions is imported separately from SF.4/theorem-on-formal-functions; neither existing result alone supplies the open formal-limit comparison.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S7/siegel-hartogs`.

### R4. SchemeAndStackFoundations:SF.2

Extend the imported SF.2 relative-dualizing complex/module and sheafified Grothendieck duality interfaces by the determinant-of-cotangent-complex identification and fundamental class for projectively embeddable proper maps between flat lci schemes of equal relative dimension, including the projection formula with perfect coefficients. For normal source smooth outside codimension two, extend det(df) and compare with finite flat trace on the smooth finite locus. Include logarithmic boundary ideal compatibility and O-linear derived reduction. Generic coherent duality is imported; this requests the lci fundamental-class and boundary specialization, including nonflat correspondence maps.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S7/paramodular-composite`.

### R5. AbelianSchemesAndArithmeticModuli:A4

Extend A4/abelian-h1-de-rham (which already supplies the abelian Gauss–Manin connection and polarized pairing) to genus-two semiabelian logarithmic degeneration, with Kodaira–Spencer Sym²E≅Ω¹(log D), the ordinary unit-root splitting and the first-order superspecial Hasse–Witt matrix in the normalization of Yamauchi Propositions 3.9–3.12. Generic abelian de Rham theory is imported.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S8/theta-operators`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/superspecial-nonvanishing`.

### R6. SchemeAndStackFoundations:SF.0

Krull intersection for a locally free module along a proper effective Cartier ideal in a Noetherian local ring, and the componentwise propagation of a section vanishing on a dense open of a reduced scheme.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S8/negative-weight-vanishing`.

### R7. HodgeTateAndCanonicalSubgroups:T5

Extend the currently Hilbert-specific Igusa node to the full ordinary genus-two multiplicative tower Ig_(m,n)=Isom(μ_(p^n)^2,G[p^n]^0) over X_m^ord, as a finite étale GL₂(Z/p^n)-torsor including toroidal boundary charts, with transition maps and compatible full-frame q-expansions. Supply connected-component/ordinary monodromy detection sufficient for the saturated expansion principle on each component. The present request is an additional Siegel interface, not a claim that the Hilbert node already proves it.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-forms`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/classical-padic-comparison`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/klingen-coefficient-operator`.

### R8. tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra

Import: generic double-coset representative independence, index-p lattice/projective-line parametrization and the full-group p+1 count. This is existing upstream roadmap ownership. S5 owns only the normalized binary-index integrality criterion and any additional arbitrary prime-to-p congruence-level specialization.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S5/determinant-p-cosets`.

## Mathematical verification gaps

These are unresolved mathematical or source-comparison steps. They prevent the affected layers from being closed, even though every target is planned.

### G1 — genus-two reduction and local-model comparison

C14 supplies the integral models and their lci/normal properties, but not a checked theorem identifying their deformation coordinates with the spherical/paramodular rank stratification used here. The Dieudonné classification, supersingular P¹ splitting/counts, explicit local rings away from SS, and boundary-compatible finite-fiber classification are targeted by S2/S3/S7; their bridge to the existing moduli models has not been verified from a full reduction-theory source. The unpublished/proposed ShimuraVarietiesHondaTatePartII is not treated as a supplied stage. Before closure assign these exact reduction inputs to that proposed owner or prove their specializations here, with primary-source locators.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S2/rank-geometry`, `AlgebraicModularFormsAndSerreWeightsPartII:S2/hasse-simple-zero`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/local-model-identifications`, `AlgebraicModularFormsAndSerreWeightsPartII:S3/global-secondary`, `AlgebraicModularFormsAndSerreWeightsPartII:S7/finite-rank-one-correspondence`.

### G2 — global secondary square root and descent

Pilloni Remark 6.4.1 and CG20 Theorem 8.10 use a square root of the spherical secondary invariant. The local Koblitz computation proves the genus-two singularity and supports the local multiplicity, but does not by itself construct a global section b₀ of λ^((p²−1)/2) on S or prove its tame-level descent. A root after an arbitrary étale cover is insufficient for the stated global Cartier sequence. Verify transition functions and descent at the chosen level, or restrict the later vanishing/injectivity targets to a level where this construction is proved. No paramodular or p=2 square-root claim is made.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S3/secondary-square-root`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/negative-weight-vanishing`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/scalar-theta-injective`, `AlgebraicModularFormsAndSerreWeightsPartII:S8/vector-theta-injective`.

### G3 — secondary minimal descent and comparison

Boxer Theorems 6.2.2–6.2.3 construct boundary-compatible generalized Hasse sections and descent after powers. To use exactly the two-section cover here, identify a positive power of the particular h′ of S3 with the appropriate descended section on the nonordinary minimal stratum. Equality of nonvanishing loci is not an identification of their line-bundle sections. Verify this comparison, including paramodular assertions only where needed; until then S4’s spherical two-affine cover is conditional.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S4/minimal-hasse-cover`.

### G4 — explicit integral residual V₂ cosets

CG20 Lemma 8.4 asserts integrality of V₂ but does not print its complete finite-coset formula. S5 defines V₂ unambiguously over K as a residual of the rational double coset, and identifies the exact integrality target. Compute its remaining determinant-p² cosets and symmetric-power weights, showing that the rational residual is the scalar extension of a coefficient operator over O, natural in every O-module. This is needed to establish the full formal Q₂ formula independently on arbitrary formal series. The geometric torsion Q₂ map in S7 has a separate integral construction via Pilloni §7 and does not rely on lifting torsion sections.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S5/hecke-decomposition`, `AlgebraicModularFormsAndSerreWeightsPartII:S5/corrected-q2`.

### G5 — full-frame Klingen coefficient comparison

The genus-two Igusa tower requested from T5 and its component detection are not furnished by the existing Hilbert torsor node. In addition, verify the normalized Klingen finite-coset action on its full frame functions, showing its algebraic specialization is Z₂ and identifying its scalar normalization with the downstream analytic p^(3−r)U_(Kli(p),1). A formal Z₂ operator alone does not construct the ordinary geometric correspondence. This remains an explicit comparison obligation of S9, without a cyclic import of analytic control from HigherHidaAndColemanTheory.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-forms`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/padic-q-expansion`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/classical-padic-comparison`, `AlgebraicModularFormsAndSerreWeightsPartII:S9/klingen-coefficient-operator`.

### G6 — tame-level identification of reverse neighbors

The normalized adjugate sends Γ̄ diag(p,1)Γ̄ to Γ̄ diag(1,p)Γ̄. These coincide for SL₂(Z), but need not for an arbitrary prime-to-p principal subgroup. At Γ(5), p=3, Q=x², the forward neighbor reduces to 2x² modulo 5 and a second forward neighbor to 4x²; neither Γ(5)-equivalence nor prime-to-p approximation identifies that with Q. S6 proves the correct oriented reciprocity and the self-dual specialization. Before a downstream all-tame-level binary-form vanishing proof imports symmetric reciprocity, supply its exact diamond/cusp transport identification, pass to an appropriately invariant coefficient sector, or replace that proof with one using both orientations. This is a new qualification, not a claimed repair of the downstream roadmap.

Needed by: `AlgebraicModularFormsAndSerreWeightsPartII:S6/neighbor-reciprocity`.

## Source corrections applied

The following findings concern exactly the hashed versions below. E1–E9 are carried from the extraction and rechecked here; E10 is a new tame-level qualification found in this design pass. Their status in a later journal revision has not been established. No source passage is reproduced.

- **E1**, CG20, §8.1, internal p. 56 (journal 856), author typeset copy: Use completed cone-monoid modules; in q,q′,ζ coordinates allow finite Laurent support in ζ at each fixed (q,q′) coefficient. Check: The semidefinite indices include arbitrarily negative middle exponents; localization by one variable permits only a globally bounded negative exponent.
- **E2**, CG20, Lemma 8.4 and Definition 8.5, internal pp. 58–59 (858–859), author copy: Use Δ(Q)=−4det Q, and use divisibility by p at a contributing integral transformed index. Check: At p=3,Q=x²+y², (det Q/p)=1 whereas (Δ/p)=−1; determinant scaling gives p²det Q, which need not be zero over Q.
- **E3**, CG20, Proposition 8.9, internal p. 61 (861), author copy: Restrict the asserted construction to characteristic p and use con(a(F,Q)⊗Q), with its determinant-square GL₂ twist. Check: Yamauchi v5 Propositions 3.9–3.12 give the characteristic-p construction. For d=2, con(y²⊗x²)=1/3 is nonzero although det(x²)=0; an extra determinant would erase this coefficient.
- **E4**, CG20, Theorem 8.10, internal pp. 61–62 (861–862), author copy: Exclude k=p−1 and assert the result over characteristic p with p∤k(2k−1). Check: The nonzero primary Hasse invariant has constant expansion 1, so Θh=0. At p=5,k=4 the other displayed numerical conditions hold.
- **E5**, CG20, Proofs of Theorems 8.10–8.11, internal pp. 62–63 (862–863), author copy: Use the explicit pa−b<0 vanishing target, the closed S divisor and a local SL₂(F_p) frame change at SS. Check: The splitting on each supersingular P¹ gives largest degree pa−b; a global cusp-stabilizer action on forms is unnecessary and is not supplied.
- **E6**, CG20, Lemma 6.2(2), internal p. 36 (836), compared with Lemma 8.12, p. 64 (864): Prove at-p Hasse equivariance using the cancelled Q₂ formula, whose reduction is Z₂ at (3,3). Check: At (3,3), T₂=−1+pX₂+Z₂+p³V₂, while Q₂=pX₂+Z₂+p³V₂+p². Their mod-p actions differ by the identity.
- **E7**, P20, §6.3.3, Lemmas 6.3.3.3–6.3.3.5, pp. 32–34, 17 June 2019 author version: The zero set of V*_H, W and A is multiplicative rank zero; the dual section has zero set étale rank zero. Z is an isomorphism. Their product still has the required zero set, so the final extension theorem survives. Check: If the multiplicative rank stays one while the étale rank drops, H is still multiplicative and V*_H and W are units. Such fibers occur in μ_p times a height-three dimension-one formal-group degeneration. The crystalline image/kernel identities make Z an isomorphism, so A is a unit there as well.
- **E8**, P20, §6.4, pp. 35–36, 17 June 2019 author version: The rank-r locus is dense in its rank-at-most-r closure, of dimension r+1. The ≥r and ≤r loci use inclusive inequalities. Check: The ordinary rank-two locus is open of dimension three, whereas 3−2=1. A rank-one point belongs to both ≥1 and ≤1, contradicting strict inequalities in those definitions.
- **E9**, P20, Proof of Lemma 6.4.1, p. 35, 17 June 2019 author version: Use Fe₂=−pe₃, Fe₃=e₂ and the symplectic convention yielding X=Z in the principal case; in the paramodular alternatives the constraints are Z=0 or X=0. Check: With the stated pairing, moving F across it requires the p-similitude relation; the changed sign restores it and gives nonzero Hasse differential −Y on the polarized tangent spaces.
- **E10**, CG20, Lemma 8.20 and proof, internal p. 72 (872), author copy: Use the reverse double coset, or impose/prove the self-duality and level-transport identification. The symmetric statement is valid for SL₂(Z). Check: For Γ(5), p=3 and Q=x², a forward neighbor is 2x² modulo 5 and a second forward neighbor is 4x², so Q cannot be its Γ(5)-class. An adjugate reverses diag(p,1) to diag(1,p), whose reductions differ modulo 5.

## Sources and reading ledger

- **CG20**. Frank Calegari and David Geraghty, *Minimal modularity lifting for nonregular symplectic representations*. Duke Mathematical Journal 169 (2020), 801–896; author typeset copy, internal page N = journal page 800+N. [Text](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Read: §5.2, internal pp. 21–22; §5.5, pp. 33–34; §6.1, pp. 35–37; §7.1, pp. 48–50; §§8.1–8.5, pp. 56–64; §8.7, pp. 72–73. SHA-256 `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`, accessed 2026-10-19.
- **P20**. Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*. Duke Mathematical Journal 169 (2020), 1647–1807; author version 17 June 2019, 113 pp.; journal revision not compared. [Text](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Read: §4, pp. 16–19; §5.1.3, p. 21; §§6.2–6.4, pp. 30–37; §7, pp. 38–40; §8.2, p. 53; §11.2, pp. 69–71; §13.3.1, p. 89; §14.8, p. 101; §14.9, pp. 103–104. SHA-256 `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`, accessed 2026-10-19.
- **Y16**. Takuya Yamauchi, *The weight reduction of mod p Siegel modular forms for GSp4*. arXiv:1410.7894v5, 30 August 2016; locators refer to v5. [Text](https://arxiv.org/pdf/1410.7894v5). Read: Propositions 3.9, 3.11, 3.12 and the Fourier computation, pp. 21–24; Theorems 4.7 and 4.9, pp. 38–39. SHA-256 `1fe3e4cf26907fae70b05a209e79cdff42aac93cff6410f98438fe7c89373c39`, accessed 2026-10-19.
- **T06**. Jacques Tilouine, *Siegel varieties and p-adic Siegel modular forms*. Documenta Mathematica, Extra Volume Coates (2006), 781–817. [Text](https://ems.press/content/book-chapter-files/27485?nt=1). Read: §3.1, pp. 805–808, Definition 3.1 and Proposition 3.2; §3.2, pp. 808–810, Proposition 3.3 and the comparison diagram. SHA-256 `a257a1dfd9a8d89c43ae60b10d122ae8f7189a897cda455ead514dffd16dfcd9`, accessed 2026-10-19.
- **P12**. Vincent Pilloni, *Sur la théorie de Hida pour le groupe GSp2g*. Bulletin de la Société Mathématique de France 140 (2012), 335–400. [Text](https://www.numdam.org/article/BSMF_2012__140_3_335_0.pdf). Read: §1.1, p. 336, weight and unipotent conventions; §4.1.3, pp. 351–352, Definition 4.3; §4.2.1–4.2.2, pp. 353–356, frame and character comparison. SHA-256 `605f046df3f91c6405fa5b18d377e0ef3eb913398220238291a76bc16ed266c2`, accessed 2026-10-19.
- **K75**. Neal Koblitz, *p-adic variation of the zeta-function over families of varieties defined over finite fields*. Compositio Mathematica 31 (1975), 119–218. [Text](https://www.numdam.org/article/CM_1975__31_2_119_0.pdf). Read: §V.11, pp. 192–193, genus-two local singularities. SHA-256 `da8f16af7a9ae10ea7c872e0f34d36cd265284e6de5eef08e45e8f6ba60b117f`, accessed 2026-10-19.
- **B15**. George Boxer, *Torsion in the coherent cohomology of Shimura varieties and Galois representations*. Harvard PhD thesis, 2015; public author copy, printed pagination seven below PDF page. [Text](https://www.ma.imperial.ac.uk/~gboxer/thesis.pdf). Read: Theorem 4.5.4(3), printed pp. 122–123; Theorems 6.2.2–6.2.3, printed pp. 188–190. SHA-256 `14b7b7a72d3db86fe6586ccb2f7b538348bb3a166b49aa846a04aefef11dbe40`, accessed 2026-10-19.

## Routing and restructuring

- **merge** `AlgebraicModularFormsAndSerreWeightsPartII`, `SiegelModularFormsModPn`: CG20 and Pilloni20 propose the same genus-two continuation under the alias SiegelModularFormsModPn. Their 51 and 32 routed items overlap in forms, rank strata, Hasse geometry and integral operators. Use the issue’s assigned Part II id for layers S1–S9. sourceRouting accounts for all 83 item ids. Import the existing C14 bundles/correspondence, R07 filtration/duality and T0 primary invariant; do not create duplicate geometry or primary-Hasse definitions.
- **split** `AlgebraicModularFormsAndSerreWeightsPartII`, `GenericGL3SerreWeightsAndLattices`: The generic GL₃ automorphic weights and Breuil lattice problem uses definite unitary completed cohomology, modular representations and local deformation rings. It is independent of the Siegel threefold and theta direction planned here. Give the independent direction its proposed id GenericGL3SerreWeightsAndLattices, parent AlgebraicModularFormsAndSerreWeights, area automorphic. Preserve its complete 165-item brief by exact reference to research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json, routes entry with roadmap=GenericGL3SerreWeightsAndLattices (the route’s brief and items are authoritative). A fresh design job must cover every item in that route and reconcile the later LLHLM23 direction; no GL₃ mathematics is claimed covered by S1–S9.
- **rescope** `AlgebraicModularFormsAndSerreWeightsPartII`, `HodgeTateAndCanonicalSubgroups`: The current T5 exact Igusa node has a Hilbert torus group, whereas HigherHidaAndColemanTheory already requests full ordinary genus-g frames from T5. Keep the full genus-two ordinary GL₂ tower, boundary extension, transitions and monodromy at T5. This Part II owns function weight spaces, coefficient comparison and the normalized degree-zero Klingen coefficient target in S9. Its request states the missing Siegel specialization explicitly. HigherHidaAndColemanTheory retains analytic sheaves, projectors, eigenvarieties, overconvergent embedding and control.
- **rescope** `AlgebraicModularFormsAndSerreWeightsPartII`, `IntegralCoherentHeckeComplexes`: The latter is proposed in paper routes but has no defined atlas stages. A fake dependency on it would conceal closure. For now S7 owns the genus-two normalized paramodular composite and its torsion Q₂ specialization; coherent duality is requested from the existing SF.2 stage. When IntegralCoherentHeckeComplexes is designed, transfer the general formalism there and import it here. S7 is not a plan of a second general coherent-duality theory.

The packet contains an individual sourceRouting row for all 51 CG20 and 32 Pilloni20 routed items. The GL₃ split preserves the existing 165-item brief by reference to its exact route, rather than assigning those items to the Siegel layers. No additional issue was claimed.

## Suggested Lean boundary

The accompanying file suggests names and signatures only for light coefficient definitions and a few milestones expressible using existing carriers at the pins. All geometric targets, their full APIs and their checks are specified above. In particular it does not introduce placeholder types for Siegel schemes, BT₁ groups, symmetric-power bundles or Igusa towers. No implementation status is changed by elaboration of a proposed statement.
