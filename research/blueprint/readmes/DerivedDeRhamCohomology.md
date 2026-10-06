# Derived de Rham cohomology and its algebraic foundations

This roadmap constructs derived de Rham cohomology from ordinary polynomial differential algebra, then supplies the completion, Cartier, crystalline and descent results needed by the rest of the atlas. Its logarithmic branch uses the same resolution and completion conventions. The accepted RS-01 ownership keeps all seven DD stages. Generic enhanced categories and animation belong to EnhancedDerivedSheaves; integral perfectoid algebra belongs to PerfectoidQuotients Q0; ordinary PD envelopes, crystalline sites and the early log algebra belong to CrystallineCohomology. This roadmap imports them and proves the derived comparisons that go beyond them.

The companion [packet](../packets/DerivedDeRhamCohomology.json) gives the dependency graph, source evidence, API contracts, tests and coverage. The [suggested file](../suggested/DerivedDeRhamCohomology.lean) gives proposed names and available carrier views. This document is definitive. A complete planning pass means that every scoped target has a statement and a route to its sources, suppliers or a precise gap. It does not mean that any proposed result has been implemented or that a stage with open gaps is closed. All seven stages are **planned**, and none is closed.

## Conventions and acceptance boundaries

Complexes use cohomological indexing: a simplicial degree n contributes in degree −n, a connective cotangent complex lies in nonpositive degrees, and M[1] has its degree-zero module in degree −1. Derived exterior powers are unshifted power functors. Both Hodge and conjugate de Rham graded pieces include [−i]. Thus a degree-zero differential module contributes in de Rham degree i, while the degree −1 conormal of a regular quotient produces divided powers in degree zero after the two shifts cancel.

All general ring pushouts and module tensors are derived. An ordinary pushout computes a derived one only after the required Tor independence is proved. A map of ordinary rings is a permitted input, but this does not justify truncating its cotangent complex to the existing naive two-term model. The full cotangent complex detects the negative homology of non-lci quotients.

The ordinary de Rham differential is A-linear on an A-algebra B and is generally not B-linear. Its graded terms and its Hodge associated graded are B-modules; the full complex is an A-complex. This distinction controls ordinary and logarithmic base change. A tensor of the full relative de Rham complex over B cannot be introduced merely because its individual forms are B-modules.

Write dR for direct-sum realization of polynomial de Rham complexes. Its decreasing Hodge filtration has gr_H^i dR = L∧^i L[−i]. Hodge completion is the inverse limit of Hodge quotients. Write Λ_p dR for its derived p-completion. These operations have different universal properties. Over rational algebras uncompleted dR collapses to the base; ordinary smooth rational de Rham is recovered by Hodge completion. Over nilpotent-p smooth algebras the uncompleted smooth comparison holds in its separate range.

An increasing conjugate filtration is explicitly reindexed; Fil_−1 = 0. Its graded term is the cofiber of Fil_(i−1) → Fil_i. A decreasing filtration F has gr^i = cofib(F^(i+1) → F^i). Exhaustiveness of an affine increasing filtration does not by itself prove strong convergence after arbitrary inverse limits or global totalizations. Completed filtered objects use completed Day convolution, rather than tensoring equal-index terms.

“Flat,” “completely flat,” “faithfully flat,” “projective,” and “finite projective” retain their distinct meanings. Complete flatness is a condition on derived reduction and does not require that the input object be complete. Tor amplitude is not a finite-generation theorem. Proper-smooth perfectness uses finite-level coherent cohomology and a separately identified lifting theorem; it gives no blanket finite-projectivity assertion for the individual cohomology modules.

The logarithmic cotangent is Gabber's. Identifications with ordinary logarithmic differentials or Olsson's complex retain the integral morphism and log-smooth conditions of their sources. Homological log flatness is the derived-pushout condition; it is not substituted by Kato log flatness. The general prelog quasisyntomic sites do not impose integrality on every monoid. Integrality and Cartier type are stated when an application needs them.

## Reading and dependency order

Start with the ordinary differential presentation in DD.2 and the independent cotangent and Koszul constructions in DD.0–DD.1. DD.3 then identifies conjugate graded pieces. DD.5 supplies the elementary compatible-root cover and descent arguments without Q3. The generic PD comparison in DD.4 uses the early CR.0/CR.2 inputs; its BMS2 derived Witt and canonical Čech applications also use the early CR.4 data and DD.5. DD.6 imports the early CR.5 algebra/exactification prefix, then builds its own derived log constructions. No subsequent prismatic, trace or finite-flat classification theorem is an input to these foundations.

Cross-roadmap stage requests identify a particular early prefix or missing theorem, not all the subsequent applications in that stage. In particular CR.4's classical smooth de Rham–Witt/Nygaard input precedes its derived uses here, and CR.5's early prelog algebra precedes the log derived comparison. The accepted fine-node dependencies are the unit of this order. Applications to non-lci examples can use a subsequent Cartier splitting calculation without making the foundational cotangent definition depend on it.

The following layer descriptions explain the proof architecture. The declaration catalogue under each description records every packet statement, direct prerequisite, source passage, API item, unit test and acceptance property. Source quotations in the packet are short matching evidence; the contracts below are independently written mathematical statements.

## Coverage and baseline

The packet has **132 nodes**: 16 definitions, 34 constructions, 14 lemmas, 13 comparisons, 50 theorems and 5 applications. Its definition/construction contracts contain **190 API items and 151 tests**. It selects **39 planets**. All 27 node IDs from the earlier checkpoint are retained. Every node has unchecked implementation status.

| Stage | Nodes | API items | Tests | Planets | Coverage |
|---|---:|---:|---:|---:|---|
| DD.0 | 22 | 26 | 21 | 6 | planned |
| DD.1 | 21 | 34 | 24 | 6 | planned |
| DD.2 | 32 | 40 | 37 | 5 | planned |
| DD.3 | 10 | 10 | 9 | 6 | planned |
| DD.4 | 14 | 16 | 12 | 6 | planned |
| DD.5 | 13 | 20 | 15 | 5 | planned |
| DD.6 | 20 | 44 | 33 | 5 | planned |

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit has no DD entry. Unreviewed search leads were screened independently. The following **45 declarations** were checked by reading their statements at the pins. A carrier or truncation in this table supplies only the stated boundary; it is never treated as its missing derived or enhanced analogue.

| Existing declaration | What it supplies |
|---|---|
| `mathlib:AlternatingMap.map_eq_zero_of_eq` | Strict alternation, valid also in characteristic two. |
| `mathlib:AlternatingMap.map_swap` | Exchanging two distinct slots negates an alternating map. |
| `mathlib:CochainComplex.of` | Constructs the nonnegative complex from an adjacent differential and its square-zero proof. |
| `mathlib:Derivation.leibniz` | The universal derivation obeys the coefficient product rule. |
| `mathlib:Derivation.leibniz_pow` | D(b^n)=n·b^(n−1)Db, used for Frobenius scalar linearity. |
| `mathlib:Derivation.map_algebraMap` | An R-derivation vanishes on the image of R. |
| `mathlib:Derivation.map_one_eq_zero` | The universal derivation kills 1. |
| `mathlib:ExteriorAlgebra.exteriorPower` | The degree-n existing submodule of the exterior algebra; no new carrier of forms is required. |
| `mathlib:ExteriorAlgebra.gradedAlgebra` | The existing graded algebra structure on exterior powers supplies wedge multiplication. |
| `mathlib:Finsupp.linearCombination` | Linear map from the existing free module evaluating a prescribed generator family. |
| `mathlib:KaehlerDifferential.D` | The existing universal derivation B→Ω_(B/A), linear over A and a derivation over B. |
| `mathlib:KaehlerDifferential.kerTotal` | The existing Kähler relation submodule: additivity, Leibniz and base constants. |
| `mathlib:KaehlerDifferential.mvPolynomialBasis` | The existing basis of multivariate polynomial Kähler differentials, with basis vectors DX_i, detects dX∧dY≠0 in the two-variable test. |
| `mathlib:KaehlerDifferential.polynomialEquiv_D` | Under the existing polynomial differential-module equivalence, DP maps to the formal derivative of P. |
| `mathlib:KaehlerDifferential.quotKerTotalEquiv` | Identifies the presented module of Kähler symbols with the pinned Kähler differential module. |
| `mathlib:KaehlerDifferential.span_range_derivation` | Exact one-forms span the Kähler module over B, not generally over A. |
| `mathlib:Module.Presentation.restrictScalars` | Given a B-module presentation, an A-module presentation of B and lifting data, constructs the A-module presentation. |
| `mathlib:Polynomial.derivative_X` | The formal derivative of X is 1, detecting a wrongly zero de Rham differential. |
| `mathlib:Submodule.liftQ` | Descends a semilinear map annihilating a submodule to its quotient. |
| `mathlib:exteriorPower.alternatingMapLinearEquiv` | Universal property of existing exterior powers. |
| `mathlib:exteriorPower.oneEquiv` | Identifies the existing first exterior power with the module. |
| `mathlib:exteriorPower.presentation` | The existing exterior-power presentation by multilinearity and strict alternation. |
| `mathlib:exteriorPower.zeroEquiv` | Identifies the existing zeroth exterior power with the coefficient ring. |
| `mathlib:exteriorPower.ιMulti` | The canonical alternating map to the existing exterior power. |
| `mathlib:exteriorPower.ιMulti_span_of_span` | Wedges from a spanning family span each existing exterior power. |
| `tauceti:KaehlerDifferential.mapSemilinear` | The already implemented f-semilinear map along an arbitrary A-algebra homomorphism f:B→C. |
| `tauceti:KaehlerDifferential.mapSemilinear_D` | The pinned semilinear map sends Db to D(fb). |
| `mathlib:Algebra.Extension.cotangentComplex` | The existing conormal-to-Kähler map of a presentation; only the naive two-term object. |
| `mathlib:Algebra.Extension.toKaehler` | Projection from the presentation cotangent space to the existing Kähler module. |
| `mathlib:Algebra.Extension.exact_cotangentComplex_toKaehler` | Exactness of the conormal, presentation cotangent-space and Kähler sequence. |
| `mathlib:Algebra.H1Cotangent` | The presentation-independent kernel of the naive conormal differential; cohomological H^−1 here. |
| `mathlib:Algebra.Generators.equivH1Cotangent` | The equivalence between presentation H1 and the existing presentation-independent H1Cotangent. |
| `mathlib:derivationToSquareZeroEquivLift` | Ordinary derivations correspond to lifts to a fixed square-zero extension under its scalar-tower hypotheses; not an enhanced mapping space. |
| `mathlib:DividedPowers` | A divided-power structure on an ordinary ideal, with integral relations and no factorial division. |
| `mathlib:DividedPowerAlgebra` | The ordinary divided-power algebra carrier on a module, defined by a polynomial ring congruence; not a PD envelope or derived functor. |
| `mathlib:WittVector` | The existing p-typical Witt-vector carrier; its ring maps are imported, not redefined. |
| `mathlib:DerivedCategory` | The ordinary derived category obtained by localization of integer-indexed cochain complexes at quasi-isomorphisms. |
| `mathlib:DerivedCategory.Q` | The localization functor from existing cochain complexes to the ordinary derived category. |
| `mathlib:DerivedCategory.singleFunctor` | Places an existing module in a specified cohomological degree. |
| `mathlib:DerivedCategory.homologyFunctor` | Cohomology of an object of the ordinary derived category in each integer degree. |
| `mathlib:DerivedCategory.isIso_iff` | A derived-category map is an isomorphism exactly when all induced cohomology maps are isomorphisms. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | Injectivity modulo each preceding initial subsequence; existing regular-sequence test used in the corrected quotient signature. |
| `mathlib:RingTheory.Sequence.IsRegular` | Weak regularity together with nonzero final quotient; no full lci predicate or log factorization is provided. |
| `mathlib:PadicInt` | The existing ring of p-adic integers, the norm-at-most-one subtype of p-adic numbers under a prime fact. |
| `mathlib:LaurentPolynomial` | The existing Laurent polynomial ring, an additive monoid algebra on the integer exponent group. |

## Imported owners and requested prefixes

EnhancedDerivedSheaves supplies enhanced derived categories, animation and the generic categorical constructions. Fine nodes are cited wherever their statements suffice. The early integral-perfectoid node retained under the historical Q0 name “semiperfectoid-quasisyntomic-and-qrsp-rings” supplies **integral perfectoid rings only** after RS-01; DD.5 owns the QSyn/QRSP notions themselves.

The requests below are the exact remaining supplier contracts. A request for a prefix does not import the entire stage or its subsequent comparisons. This is necessary because a collapsed stage graph can hide the independent classical/derived or algebraic/application order.

| Supplier | Required output | Consumers |
|---|---|---|
| `CrystallineCohomology:CR.0` | Ordinary divided power algebra Γ_B(M), with its flat-module base change and γ_n(ax)=a^nγ_n(x). This is the polynomial operation animated by DD.0, not a new PD-envelope owner. | derived-divided-powers |
| `PerfectoidQuotients:Q0:integral-algebra` | Early integral perfectoid carrier and examples; F_∞ obtained by adjoining roots of p and coordinates; bounded torsion and completed cotangent criterion. This is Q0:integral-algebra only, never Q0:animated-application or Q3. | quasiregular-semiperfectoid-rings, elementary-semiperfectoid-covers |
| `CrystallineCohomology:CR.0` | Ordinary PD envelopes and filtered universal maps; Bhatt Lemmas 3.37–3.38 explicit regular envelopes, derived tensor discreteness, Z/p^n flatness and reduction. Export PD-side facts only; DD.4 alone owns Corollary 3.40 and Theorem 3.27. | regular-pd-comparison, crystalline-comparison-map, acrys-structure |
| `CrystallineCohomology:CR.2` | The PD Poincaré de Rham model, scheme descent and crystalline transitivity/base-change maps with their nilpotent base and PD hypotheses; no duplicate derived de Rham comparison. | crystalline-comparison-map, lci-crystalline-comparison |
| `CrystallineCohomology:CR.4` | Early classical smooth F_p WΩ with Nygaard filtration, divided Frobenius and BMS2 Lemmas 8.2–8.3, plus classical smooth crystalline comparison. This prefix does not depend on DD.4’s derived Witt/QRSP comparison. | derived-de-rham-witt, regular-fp-crystalline-cech |
| `AInfCohomology:AI.0:integral` | Shared A_inf, θ with regular principal kernel, relatively perfect mod-p input, p-completed PD period ring and its actual unit/Frobenius/Galois maps; this is the early integral prefix. | acris-derived-description |
| `PadicHodgeTheory:R06.1` | The shared B_dR⁺, B_dR and B_cris objects and maps with G_K actions and filtration; use them after DD.4 identifies the integral derived period object. | rational-hodge-period-comparison |
| `AlgebraicModuliForArithmeticGeometry:A0-extension` | Proper flat finite-presentation coherent-cohomology perfectness and arbitrary derived base change, including the nonnoetherian approximation theorem Stacks 0A1G. DD.5 applies it to differential bundles; it does not plan coherent cohomology again. | proper-smooth-cohomological-control, completed-base-change-cup-products |
| `SchemeAndStackFoundations:SF.0` | Schemes, affine charts, proper/smooth finite-presentation morphism predicates and p-adic formal schemes; formal chart groundwork may need the early SF.4 extension, without subsequent arithmetic comparisons. | de-rham-sheaves, formal-etale-realization |
| `CrystallineCohomology:CR.5:log-algebra` | Early prelog/log algebra with integral, fine, saturated, strict/exact and Cartier-type predicates; ordinary log differential universal property; exactification followed by strict PD envelopes; log PD Poincaré comparison. This is an algebraic prefix independent of DD.6’s subsequent derived/crystalline comparison. | free-prelog-resolutions, gabber-log-cotangent, log-crystalline-comparison-map, semistable-chart-example |
| `ArithmeticGaloisRepresentations:R01.1` | The G_K action, Tate module Z_p(1) of compatible p-power roots of unity, and coherent equivariant morphisms; period invariant/vanishing statements stay in PadicHodgeTheory. | log-period-dlog |
| `SchemeAndStackFoundations:SF.4` | The early formal-scheme and affine-chart prefix: p-adic formal spectra, compatible finite reductions, proper smooth finite-presentation formal schemes and their étale sites. No algebraization, alterations or late model-comparison theorem is an input to this prefix. | de-rham-sheaves, formal-ordinary-derham, proper-smooth-cohomological-control, formal-etale-realization |

The ownership links are CR.4 → DD.4 for the early smooth de Rham–Witt input, DD.5 → DD.4 for the QRSP Čech calculation, DD.4 → RT.6 for the downstream relative comparison, and DD.3 → DD.5 for Cartier control. Generic PD envelopes and site cohomology stay in CR.0/CR.2. DD.4 alone proves the natural derived-to-classical filtered comparison and its flat/lci isomorphism range. No duplicate comparison is requested from a crystalline supplier.

A recursive fine-node audit reaches 162 nodes and 779 prerequisite edges, ending in 78 baseline leaves and the recorded stage frontier. It found no unresolved reference or fine-node cycle. This does not close the supplier requests or certify all proofs of the external plans.

## DD.0 — Cotangent complexes and derived powers

The cotangent construction has two independent entrances. Normalize the differential modules of a simplicial polynomial resolution after extending coefficients to the target, or represent derived derivations into split square-zero extensions. The agreement theorem identifies these constructions and fixes the universal derivation. Its H⁰ agrees with the existing Kähler module; H⁻¹ agrees with the existing naive cotangent homology, but higher negative groups remain in the full object. Transitivity is a triangle, and base change is an equivalence on a homotopy pushout. Localization and filtered colimits are consequences of this construction, rather than replacements for the pushout hypothesis.

For a polynomial algebra, L is free in degree zero. For a regular quotient P/J, the relative complex is J/J²[1]; over a smaller base it is the two-term conormal-to-differentials presentation. A singular hypersurface already needs both terms. A nonregular quotient such as F_p[x,y]/(x,y)² has additional homology, and the source's Frobenius-split calculation subsequent makes the corresponding uncompleted de Rham unbounded below. This example tests the use of the full cotangent complex.

Derived exterior, symmetric and divided powers are sifted extensions from finite free modules. Integral décalage is essential: a shifted line contributes divided powers, not an exterior algebra with its positive degrees deleted. The triangle-power filtration supplies the pieces used in Hodge and conjugate calculations. The integral proof is a precise gap pending the corrected Illusie argument; the author errata disallow the deleted general dg extension.

The routed absolute complete-intersection, André regularity and F-finiteness statements keep their different scopes. The absolute Noetherian lci criterion is broader than finite-presentation lci morphisms. Bhatt–Mathew's regularity lemma is applied to a local complete-intersection ring. The forward F-finiteness argument gives finite cotangent homology in each degree; almost-perfectness also uses connective bounded-above conventions. The SAG converse is recorded as a separate unread proof input. P-bases give the exact dimension of field differentials. Finally quasisyntomic maps require complete flatness in addition to mod-p amplitude, with bounded torsion and completeness imposed on objects. F_p is a QSyn object, whereas Z_p → F_p is not a QSyn map.

### Target coverage

- Polynomial and derived-derivation constructions; agreement, H0 and naive comparison: cotangent-complex, derived-derivations, derivations-cotangent-comparison, cotangent-naive-comparison.
- Transitivity, derived base change, localization, colimits and smooth/regular computations: cotangent-transitivity, cotangent-base-change, cotangent-localization-colimits, smooth-cotangent, regular-quotient-cotangent.
- Derived powers, triangle filtration and lci amplitude: derived-exterior-powers, derived-symmetric-powers, derived-divided-powers, power-triangle-filtration, lci-amplitude.
- AQ and the routed Noetherian/F-finite criteria, square-zero and non-lci tests: andre-quillen-homology, absolute-complete-intersection, andre-regularity, f-finite-cotangent, p-bases-differentials, square-zero-deformations, nonregular-quotient-homology.
- Quasisyntomic morphism and object conventions: quasisyntomic-condition.

**Atlas planets:** Cotangent complex; Derived derivations; Regular quotient cotangent complex; Derived exterior powers; André–Quillen homology; Avramov complete-intersection criterion.

### The full cotangent complex

**Construction — `TauCeti.DerivedDeRham.cotangentComplex`**

For A→B in animated commutative rings construct the connective B-module L_(B/A). For ordinary rings and a cofibrant simplicial polynomial A-algebra resolution P•→B its underlying cochain complex is the normalized realization of Ω¹_(P•/A)⊗_(P•)B, with simplicial degree n placed in cohomological degree −n. Comparisons between free resolutions and naturality in commutative base squares are coherent. The full object retains all negative cohomology.

**Node:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`. **Direct prerequisites:** `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `mathlib:KaehlerDifferential.D`, `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Q`, `mathlib:DerivedCategory.singleFunctor`, `mathlib:DerivedCategory.homologyFunctor`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), Definition 3.2, Lemmas 4.3–4.7, Remark 5.5; tags 08PN,08PU,08QF,08QH,08QI. Polynomial resolution construction and the stated cotangent comparison. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix B, Construction B.1 and Remark B.2. Animation of polynomial differentials supplies the coherent module, not only a triangulated object.

**Construction or proof route.**

1. Normalize the polynomial simplicial differential module using the EDS Dold–Kan/resolution comparison; use the corrected normalization in Illusie I errata.
2. Use the animation universal property for the polynomial module assignment in the category of pairs (B,M); its sifted-colimit extension gives the coherent construction.
3. Compare an arbitrary cofibrant free resolution with the canonical resolution using contractible resolution categories, as in Stacks Remark 5.5.

**Uses that determine the API.**

- DD.2 Hodge graded pieces; DD.3 Cartier; BMS2 §4: The full connective module controls derived powers and amplitude.

**API contract.**

- `TauCeti.DerivedDeRham.cotangentMap` (functoriality). Every commutative square (A→B)→(A′→B′) gives L_(B/A)⊗^L_B B′→L_(B′/A′), with identity and composition coherences.
- `TauCeti.DerivedDeRham.cotangentResolutionEquiv` (equivalence). Every free resolution gives the normalized differential model, naturally and coherently in comparison maps.
- `TauCeti.DerivedDeRham.cotangentH0` (compatibility). For ordinary A→B, H⁰L_(B/A)≃KaehlerDifferential A B, preserving the universal derivation.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_cotangent_identity` (degenerate). L_(A/A)=0.
- `TauCeti.DerivedDeRham.test_cotangent_polynomial` (computation). L_(A[t]/A)≃A[t]·dt in degree 0.
- `TauCeti.DerivedDeRham.test_cotangent_dual_numbers` (non-example). For k a field of characteristic different from 2 and B=k[ε]/ε², L_(B/k) is [B→B·dε], in degrees −1,0 with map multiplication by 2ε; H^−1 is nonzero.

**Acceptance checks.**

- L_(A/A)=0; polynomial differentials have no negative cohomology.
- A non-lci quotient must retain the homology detected by André–Quillen theory.

### Derived derivations and square-zero extensions

**Definition — `TauCeti.DerivedDeRham.derivedDerivations`**

For A→B animated and a connective B-module M, define Der_A(B,M) as Map_(CAlg_A/B)(B,B⊕M), the space of sections of the split square-zero A-algebra extension. The multiplication is (b,m)(b′,m′)=(bb′,bm′+b′m). This mapping space, including its higher homotopy, is the intrinsic derivation functor.

**Node:** `DerivedDeRhamCohomology:DD.0/derived-derivations`. **Direct prerequisites:** `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix B, Construction B.1; cotangent universal property. The polynomial differential module extends to the derived derivation universal property. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Remark 2.8, trivial monoids. The displayed mapping-space universal property specializes to ordinary animated rings.

**Construction or proof route.**

1. Form B⊕M using square-zero multiplication in the enhanced animated algebra category.
2. Take the homotopy fibre of maps into B⊕M over the identity of B; polynomial maps are determined by their coordinate derivations.
3. Retain mapping spaces throughout; ordinary derivations recover only degree-zero information.

**Uses that determine the API.**

- BS Footnote 6; DD.0 deformation theory: Square-zero lift spaces yield cotangent obstruction classes.

**API contract.**

- `TauCeti.DerivedDeRham.squareZero` (constructor). B⊕M has projection to B and zero section, with square-zero augmentation ideal M.
- `TauCeti.DerivedDeRham.derivationZero` (data). The zero derivation is the canonical base point of Der_A(B,M).
- `TauCeti.DerivedDeRham.derivationPostcompose` (functoriality). A B-linear map M→N induces Der_A(B,M)→Der_A(B,N), preserving the zero section.
- `TauCeti.DerivedDeRham.derivationDiscrete` (compatibility). For ordinary B and an ordinary module M, π₀ Der_A(B,M) is the usual A-derivation set.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_derivation_base` (degenerate). Der_A(A,M) is contractible.
- `TauCeti.DerivedDeRham.test_derivation_coordinate` (characterisation). For B=A[t], Der_A(B,M) is the underlying anima of M via δ↦δ(t).
- `TauCeti.DerivedDeRham.test_derivation_product_rule` (compatibility). For discrete M, a section sends t² to (t²,2tδ(t)); replacing the square-zero product by a product ring fails.

**Acceptance checks.**

- The zero section is the base point; a polynomial coordinate may map to any element of M.

### The cotangent universal property

**Comparison — `TauCeti.DerivedDeRham.derivationsCotangentComparison`**

For A→B animated and connective M there is a natural equivalence Map_(Mod_B)(L_(B/A),M)≃Der_A(B,M), compatible with base squares and module maps. This compares the independent square-zero characterization with the polynomial-resolution object, including higher homotopies.

**Node:** `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derived-derivations`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `mathlib:derivationToSquareZeroEquivLift`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Remark 2.8, trivial monoids. The independent mapping-space property is explicit; ordinary lifts agree with the pinned equivalence.

**Construction or proof route.**

1. Prove the coordinate derivation equivalence for free polynomial A-algebras; its π₀ is the pinned derivation/lift equivalence.
2. Both sides turn the relevant sifted algebra resolutions into limits of mapping spaces, with modules base changed along each term.
3. Extend the polynomial equivalence coherently via ANIM_UP, rather than choosing isomorphisms separately in the homotopy category.

**Acceptance checks.**

- For B=A[t], the equivalence evaluates at dt; for B=A it identifies two contractible spaces.

### Degree zero and the naive cotangent complex

**Comparison — `TauCeti.DerivedDeRham.cotangentNaiveComparison`**

For ordinary A→B, H⁰L_(B/A)≃Ω¹_(B/A). If P→B is a polynomial presentation with kernel J, τ≥−1L_(B/A) is represented by [J/J²→Ω¹_(P/A)⊗_P B] in degrees −1,0. Its H^−1 agrees with the pinned Algebra.H1Cotangent; the displayed two-term complex is not the full cotangent complex for an arbitrary quotient.

**Node:** `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `mathlib:Algebra.Extension.cotangentComplex`, `mathlib:Algebra.Extension.toKaehler`, `mathlib:Algebra.Extension.exact_cotangentComplex_toKaehler`, `mathlib:Algebra.H1Cotangent`, `mathlib:Algebra.Generators.equivH1Cotangent`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), Lemmas 4.5 and 11.3, Proposition 14.4; tags 08QF,08RA,08RB. The truncation comparison preserves the baseline boundary and its kernel.

**Construction or proof route.**

1. Compute H⁰ by the coequalizer of the first two polynomial differential modules, Stacks Lemma 4.5.
2. Use the explicit first two simplicial degrees to identify the conormal arrow with the baseline naive cotangent map.
3. Compare kernels and cokernels; no assertion removes H^−2 and lower cohomology.

**Acceptance checks.**

- For k[x,y]→k[x,y]/(x,y)², the naive truncation misses nonzero lower cotangent homology.

### The cotangent transitivity triangle

**Theorem — `TauCeti.DerivedDeRham.cotangentTransitivity`**

For composable maps A→B→C of animated commutative rings there is a coherent natural fibre sequence L_(B/A)⊗^L_B C→L_(C/A)→L_(C/B)→(L_(B/A)⊗^L_B C)[1] in Mod_C.

**Node:** `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §7, Proposition 7.4; tag 08QX. The fundamental triangle uses derived scalar extension.

**Construction or proof route.**

1. For polynomial B/A and polynomial C/B use the split exact differential sequence.
2. Resolve the composable pair by a bisimplicial polynomial pair and realize that sequence coherently.
3. Identify all three terms by the cotangent universal property and derived scalar extension; apply Illusie I derived-extension correction.

**Acceptance checks.**

- For Z→Z[x]→Z[x]/(x), the boundary identifies the relative quotient complex with B[1].

### Derived base change of the cotangent complex

**Theorem — `TauCeti.DerivedDeRham.cotangentBaseChange`**

For a derived pushout B′=B⊗^L_A A′, L_(B′/A′)≃L_(B/A)⊗^L_B B′ naturally. For ordinary ring squares this formula applies to the ordinary pushout only when Tor_i^A(B,A′)=0 for i>0. Without Tor independence the degree-zero pushout need not satisfy it.

**Node:** `DerivedDeRhamCohomology:DD.0/cotangent-base-change`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §6, Lemmas 6.2–6.4; tag 08QQ. The ordinary square requires Tor independence; animated pushouts retain the derived terms.

**Construction or proof route.**

1. Base change a polynomial resolution using the animated pushout.
2. Identify polynomial differential modules after extension and realize the equivalences.
3. Under Tor independence identify the animated pushout with its degree-zero ordinary ring; otherwise retain its positive homotopy.

**Acceptance checks.**

- Z→F_p base changed along Z→F_p has Tor₁=F_p; the ordinary pushout F_p would incorrectly erase it.

### Localization and filtered colimits of cotangent complexes

**Theorem — `TauCeti.DerivedDeRham.cotangentLocalizationColimits`**

For an ordinary ring B and multiplicative set S, L_(S⁻¹B/B)=0 and L_(S⁻¹B/A)≃L_(B/A)⊗^L_B S⁻¹B. Cotangent complexes commute with filtered colimits of animated A-algebras in the module-pair category: if B=colim_j B_j, L_(B/A)≃colim_j(L_(B_j/A)⊗^L_(B_j)B).

**Node:** `DerivedDeRhamCohomology:DD.0/cotangent-localization-colimits`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §8, Lemma 8.6, and §9 localization; tags 08QZ,08SF. Étale/localization vanishing and the polynomial-colimit model.

**Construction or proof route.**

1. Prove localization is formally étale by the unique lifting of inverses across square-zero extensions, then use the cotangent universal property.
2. Apply transitivity to obtain the localization formula.
3. Use the compact polynomial generators and colimit-preserving left Kan extension for the filtered-colimit statement.

**Acceptance checks.**

- For Z[x]→Z[x,x⁻¹], dx remains a free generator and no new negative cotangent term appears.

### The smooth cotangent computation

**Theorem — `TauCeti.DerivedDeRham.smoothCotangent`**

For a smooth finitely presented ordinary ring map A→B, L_(B/A)≃Ω¹_(B/A)[0], where Ω¹ is finite projective. For an étale map it vanishes. Polynomial rings on arbitrary sets have a free differential module in degree zero without a finiteness claim.

**Node:** `DerivedDeRhamCohomology:DD.0/smooth-cotangent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.0/cotangent-localization-colimits`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §9, Lemma 9.1; tags 08R2,08R5. The smooth/étale computation is a cotangent statement, independent of characteristic-zero de Rham completion.

**Construction or proof route.**

1. Compute polynomial rings directly.
2. Use the étale-local polynomial presentation of a smooth map and cotangent base change.
3. Descend the degree-zero finite projective module and vanishing of lower cohomology.

**Acceptance checks.**

- For A[t₁,…,t_r], obtain B^r in degree zero; for A→A the result is zero.

### Regular quotients and two-term models

**Theorem — `TauCeti.DerivedDeRham.regularQuotientCotangent`**

If J⊂P is generated by a finite regular sequence f₁,…,f_r and B=P/J, then L_(B/P)≃(J/J²)[1], with J/J² free on the classes of f_i. If P is smooth over A, L_(B/A) is the two-term complex [J/J²→Ω¹_(P/A)⊗_P B] with f_i↦df_i in degrees −1,0. Flatness of B over A is not needed for this computation.

**Node:** `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §14, Lemma 14.2 and Proposition 14.4; tags 08SJ,08SL. Regularity makes the full cotangent complex two-term.

**Construction or proof route.**

1. Resolve a single nonzerodivisor by the polynomial bar resolution; its differential module realizes to B[1].
2. Tensor the coordinate resolutions using regularity and transitivity.
3. Apply the transitivity triangle through P and identify its connecting differential with f↦df.

**Acceptance checks.**

- For B=k[x]/x² obtain multiplication by 2x; in characteristic 2 that map is zero, retaining both terms.
- The quotient by (x,y)² is excluded and has lower homology.

### Derived exterior powers

**Construction — `TauCeti.DerivedDeRham.derivedExteriorPowers`**

For an animated ring B and a connective B-module M define L∧^n_B(M), n≥0, by the sifted-colimit extension of the ordinary exterior power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary exterior power. The exterior operation imposes x∧x=0 even at 2.

**Node:** `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`. **Direct prerequisites:** `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.ιMulti`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix B, Construction B.1, Remark B.5. Left-derived polynomial operations on connective modules; the symmetric/divided variants use the same animation construction.

**Construction or proof route.**

1. Resolve M by free simplicial B-modules in the module-pair category.
2. Apply the ordinary exterior power degreewise and realize; normalization uses the corrected Illusie I comparison.
3. Use the animation universal property to prove independence and base change; the integral décalage and triangle-filtration proofs are explicitly recorded source gaps.

**Uses that determine the API.**

- DD.2/DD.3 graded pieces; BMS2 Theorem 3.1 and CR.0 PD calculations: Derived operations and integral décalage preserve singular and torsion terms.

**API contract.**

- `TauCeti.DerivedDeRham.exteriorPowerZero` (simp). L∧⁰_B(M)≃B naturally.
- `TauCeti.DerivedDeRham.exteriorPowerOne` (equivalence). L∧¹_B(M)≃M.
- `TauCeti.DerivedDeRham.exteriorPowerBaseChange` (functoriality). L∧ⁿ_B(M)⊗^L_B B′≃L∧ⁿ_(B′)(M⊗^L_B B′).
- `TauCeti.DerivedDeRham.exteriorPowerFlat` (compatibility). For flat discrete M, L∧ⁿ_B(M) is the ordinary exterior power in degree zero.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_derived-exterior-powers_zero_weight` (degenerate). L∧⁰_B(0)=B and L∧ⁿ_B(0)=0 for n>0.
- `TauCeti.DerivedDeRham.test_derived-exterior-powers_rank_one` (computation). For the flat rank-one B-module Be, L∧²(Be)=0, including B=F₂.
- `TauCeti.DerivedDeRham.test_derived-exterior-powers_integral_boundary` (non-example). For flat M=B and n≥0, L∧ⁿ(M[1])≃Γⁿ(M)[n], so positive powers of a shifted line are nonzero.

**Acceptance checks.**

- Weight zero is B; weight one is M.
- Integral divided powers and symmetric powers are not identified merely by forgetting factorials.

### Derived symmetric powers

**Construction — `TauCeti.DerivedDeRham.derivedSymmetricPowers`**

For an animated ring B and a connective B-module M define LSym^n_B(M), n≥0, by the sifted-colimit extension of the ordinary symmetric power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary symmetric power. The exterior operation imposes x∧x=0 even at 2.

**Node:** `DerivedDeRhamCohomology:DD.0/derived-symmetric-powers`. **Direct prerequisites:** `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix B, Construction B.1, Remark B.5. Left-derived polynomial operations on connective modules; the symmetric/divided variants use the same animation construction.

**Construction or proof route.**

1. Resolve M by free simplicial B-modules in the module-pair category.
2. Apply the ordinary symmetric power degreewise and realize; normalization uses the corrected Illusie I comparison.
3. Use the animation universal property to prove independence and base change; the integral décalage and triangle-filtration proofs are explicitly recorded source gaps.

**Uses that determine the API.**

- DD.2/DD.3 graded pieces; BMS2 Theorem 3.1 and CR.0 PD calculations: Derived operations and integral décalage preserve singular and torsion terms.

**API contract.**

- `TauCeti.DerivedDeRham.symmetricPowerZero` (simp). LSym⁰_B(M)≃B naturally.
- `TauCeti.DerivedDeRham.symmetricPowerOne` (equivalence). LSym¹_B(M)≃M.
- `TauCeti.DerivedDeRham.symmetricPowerBaseChange` (functoriality). LSymⁿ_B(M)⊗^L_B B′≃LSymⁿ_(B′)(M⊗^L_B B′).
- `TauCeti.DerivedDeRham.symmetricPowerFlat` (compatibility). For flat discrete M, LSymⁿ_B(M) is the ordinary symmetric power in degree zero.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_derived-symmetric-powers_zero_weight` (degenerate). LSym⁰_B(0)=B and LSymⁿ_B(0)=0 for n>0.
- `TauCeti.DerivedDeRham.test_derived-symmetric-powers_rank_one` (computation). For the flat rank-one Z-module Ze, LSym² is free of rank one on e²; its coefficient map is quadratic.
- `TauCeti.DerivedDeRham.test_derived-symmetric-powers_integral_boundary` (non-example). Over F₂, Sym²(F₂e) is generated by e², whereas the square of e in the divided power algebra is zero.

**Acceptance checks.**

- Weight zero is B; weight one is M.
- Integral divided powers and symmetric powers are not identified merely by forgetting factorials.

### Derived divided powers

**Construction — `TauCeti.DerivedDeRham.derivedDividedPowers`**

For an animated ring B and a connective B-module M define LΓ^n_B(M), n≥0, by the sifted-colimit extension of the ordinary divided power on finite free modules, computed using a simplicial projective module resolution. It is a connective B-module, with coherent base change and graded multiplication. Use derived operations; for a flat discrete M this agrees with the ordinary divided power. The exterior operation imposes x∧x=0 even at 2.

**Node:** `DerivedDeRhamCohomology:DD.0/derived-divided-powers`. **Direct prerequisites:** `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `CrystallineCohomology:CR.0`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix B, Construction B.1, Remark B.5. Left-derived polynomial operations on connective modules; the symmetric/divided variants use the same animation construction.

**Construction or proof route.**

1. Resolve M by free simplicial B-modules in the module-pair category.
2. Apply the ordinary divided power degreewise and realize; normalization uses the corrected Illusie I comparison.
3. Use the animation universal property to prove independence and base change; the integral décalage and triangle-filtration proofs are explicitly recorded source gaps.

**Uses that determine the API.**

- DD.2/DD.3 graded pieces; BMS2 Theorem 3.1 and CR.0 PD calculations: Derived operations and integral décalage preserve singular and torsion terms.

**API contract.**

- `TauCeti.DerivedDeRham.dividedPowerZero` (simp). LΓ⁰_B(M)≃B naturally.
- `TauCeti.DerivedDeRham.dividedPowerOne` (equivalence). LΓ¹_B(M)≃M.
- `TauCeti.DerivedDeRham.dividedPowerBaseChange` (functoriality). LΓⁿ_B(M)⊗^L_B B′≃LΓⁿ_(B′)(M⊗^L_B B′).
- `TauCeti.DerivedDeRham.dividedPowerFlat` (compatibility). For flat discrete M, LΓⁿ_B(M) is the ordinary divided power in degree zero.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_derived-divided-powers_zero_weight` (degenerate). LΓ⁰_B(0)=B and LΓⁿ_B(0)=0 for n>0.
- `TauCeti.DerivedDeRham.test_derived-divided-powers_rank_one` (computation). For the flat rank-one Z-module Ze, LΓ² is free of rank one on γ₂(e), and e·e=2γ₂(e).
- `TauCeti.DerivedDeRham.test_derived-divided-powers_integral_boundary` (non-example). Over F_p, γ_p(e) in Γ(F_pe) is nonzero although e^p=p!γ_p(e)=0.

**Acceptance checks.**

- Weight zero is B; weight one is M.
- Integral divided powers and symmetric powers are not identified merely by forgetting factorials.

### Exterior powers of a triangle

**Theorem — `TauCeti.DerivedDeRham.powerTriangleFiltration`**

For a fibre sequence K→L→M of connective B-modules, L∧ⁿL has a natural finite filtration of length n+1 with graded pieces L∧^jK⊗^L_B L∧^(n−j)M, 0≤j≤n. For a flat discrete module N, L∧ⁿ(N[1])≃Γⁿ(N)[n]. The finite filtration is functorial and its multiplication is compatible with the weight grading.

**Node:** `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/derived-divided-powers`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bjørn Ian Dundas and Matthew Morrow, Finite generation and continuity of topological Hochschild and cyclic homology](https://arxiv.org/pdf/1403.0534), Lemma 3.3 and proof. The filtration argument is the integral input to the AQ finiteness proof. [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Lemma 3.22, Corollary 3.43 and proof. The triangle filtration and regular quotient décalage are used in de Rham comparisons.

**Construction or proof route.**

1. Replace the triangle by a degreewise split short exact sequence of simplicial projective modules.
2. Filter an exterior power by the number of factors from K; degreewise graded pieces are the exterior tensor factors.
3. Realize the finite filtration, preserving its graded pieces; prove the shifted-flat décalage using the corrected Illusie simplicial formulas.

**Acceptance checks.**

- For L=K⊕M, the filtration gives the direct-sum exterior decomposition.
- For K=B[1], every weight is Γⁿ(B)[n], not zero above weight one.

### The finite-presentation lci amplitude criterion

**Theorem — `TauCeti.DerivedDeRham.lciAmplitude`**

For a flat finitely presented map A→B of ordinary rings, A→B is locally complete intersection precisely when L_(B/A) is perfect of Tor-amplitude [−1,0]. A local regular-sequence presentation gives the two-term model. No unrestricted converse for arbitrary nonnoetherian, non-finitely-presented maps is asserted.

**Node:** `DerivedDeRhamCohomology:DD.0/lci-amplitude`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §14, Proposition 14.4 and local-complete-intersection criterion; tag 08SL. The regular-sequence computation supplies the stated finite-presentation range.

**Construction or proof route.**

1. From a smooth presentation with regular kernel apply the full regular-quotient computation.
2. For the converse use the local finite-presentation cotangent criterion and finite conormal presentation; its commutative algebra proof is recorded separately as a gap.
3. Descend perfection and amplitude along the smooth presentation.

**Acceptance checks.**

- A smooth map has amplitude [0,0]; a flat hypersurface has [−1,0].
- A non-lci quotient does not pass by checking only its naive complex.

### André–Quillen homology

**Definition — `TauCeti.DerivedDeRham.andreQuillenHomology`**

For an ordinary map A→B, a B-module N and n≥0 define D_n(B|A,N)=H^−n(L_(B/A)⊗^L_B N). Coefficients are derived-tensored, even if the cotangent module has a two-term presentation. Transitivity gives the homological long exact sequence.

**Node:** `DerivedDeRhamCohomology:DD.0/andre-quillen-homology`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Srikanth Iyengar, André–Quillen homology of commutative algebras](https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf), §§4–5 definitions and §8.10–8.14 applications. The chapter uses the homological cotangent conventions and the local criteria.

**Construction or proof route.**

1. Use the full cotangent object with cohomological degree −n for homological index n.
2. Derive tensor with N using K-flat replacements, then take homology.
3. Apply the homology sequence to the transitivity triangle with coefficients.

**Uses that determine the API.**

- Avramov Theorem 1.2; Iyengar Proposition 8.12; BM Lemma 4.18: Full AQ homology detects lci and regularity beyond naive cotangent modules.

**API contract.**

- `TauCeti.DerivedDeRham.andreQuillenZero` (compatibility). D₀(B|A,N)≃Ω¹_(B/A)⊗_B N.
- `TauCeti.DerivedDeRham.andreQuillenCoefficients` (functoriality). A B-linear coefficient map induces natural maps on D_n.
- `TauCeti.DerivedDeRham.andreQuillenTransitivity` (structure). The cotangent transitivity triangle induces the exact sequence of D_n with the appropriate scalar extensions.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_aq_polynomial` (computation). D₀(A[t]|A,N)≃N and D_n=0 for n>0.
- `TauCeti.DerivedDeRham.test_aq_regular_quotient` (computation). D₁(F_p|Z,F_p)≃F_p and D_n=0 for n≠1.
- `TauCeti.DerivedDeRham.test_aq_nonregular_local` (non-example). For A=k[ε]/ε² and its residue field k, D₂(k|A,k)≃k; A is not regular.

**Acceptance checks.**

- The coefficient tensor is not ordinary tensor of H^−n alone.

### Avramov’s absolute complete-intersection criterion

**Theorem — `TauCeti.DerivedDeRham.absoluteCompleteIntersection`**

For a Noetherian ring A, A is locally a complete-intersection ring (each completed local ring is a quotient of a regular local ring by a regular sequence) if and only if L_(A/Z) has Tor-amplitude [−1,0]. This is the absolute Noetherian criterion, without a finite-presentation hypothesis over Z. Local map versions use Cohen factorizations and D₂ with all coefficients.

**Node:** `DerivedDeRhamCohomology:DD.0/absolute-complete-intersection`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/andre-quillen-homology`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 4.13, p.222. The absolute Noetherian statement is attributed to Avramov. [Luchezar L. Avramov, Locally complete intersection homomorphisms and a conjecture of Quillen on the vanishing of cotangent homology](https://arxiv.org/pdf/math/9909192), Definitions §1, Theorem 1.2 and local criterion 1.8. Cohen-factorization AQ criterion supplies the general ring-map input.

**Construction or proof route.**

1. Localize and complete the Noetherian local ring using cotangent base-change and the Cohen-factorization criterion.
2. A complete-intersection factorization gives amplitude [−1,0] through transitivity.
3. Conversely AQ D₂ vanishing and Avramov’s local criterion force the kernel in a Cohen factorization to be a regular sequence; the complete proof interior remains a recorded source gap.

**Acceptance checks.**

- Z_p and a Noetherian p-complete hypersurface qualify without finite presentation over Z.
- F_p[x,y]/(x,y)² is excluded.

### André’s regularity criterion and the cotangent injection test

**Theorem — `TauCeti.DerivedDeRham.andreRegularity`**

For a Noetherian local ring (A,m,k), A is regular iff D₂(k|A,k)=0. If A is a complete-intersection local ring, this is equivalent to injectivity of H^−1(L_(A/Z)⊗^L_A k)→H^−1(L_(k/Z)). The injection reformulation retains the complete-intersection hypothesis; it is not a criterion obtained by truncating L_(A/Z) for arbitrary A.

**Node:** `DerivedDeRhamCohomology:DD.0/andre-regularity`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/andre-quillen-homology`, `DerivedDeRhamCohomology:DD.0/absolute-complete-intersection`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`.

**Sources:** [Srikanth Iyengar, André–Quillen homology of commutative algebras](https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf), Proposition 8.12 and proof, pp.228–229. The residue-field AQ criterion is proved using completion and a minimal Cohen presentation. [Bhargav Bhatt and Akhil Mathew, Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818), Lemma 4.18 and proof, printed pp.18–19. Transitivity converts D₂ vanishing into the cotangent injection when A is lci.

**Construction or proof route.**

1. Use a minimal Cohen presentation after completion to compute D₂(k|A,k); its dimension is the number of minimal equations.
2. Apply the Noetherian completion invariance in Iyengar’s proof; record any unavailable Cohen-factorization interior as a gap.
3. For lci A, the transitivity exact sequence and amplitude of L_(A/Z)⊗k and L_(k/Z) identify H^−2L_(k/A) with the kernel of the displayed map.

**Acceptance checks.**

- A field is regular; k[ε]/ε² has D₂(k|A,k)=k and fails the injection test.

### F-finiteness and almost perfect cotangent complexes

**Theorem — `TauCeti.DerivedDeRham.fFiniteCotangent`**

For a Noetherian F_p-algebra S, Frobenius S→S is finite if and only if L_(S/F_p) is almost perfect. In particular each H^−nL_(S/F_p) is a finite S-module for F-finite S. Here almost perfect means bounded above with finitely generated homology (equivalently over a Noetherian ring a bounded-above resolution by finite projectives); it does not mean bounded or perfect.

**Node:** `DerivedDeRhamCohomology:DD.0/f-finite-cotangent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`.

**Sources:** [Bjørn Ian Dundas and Matthew Morrow, Finite generation and continuity of topological Hochschild and cyclic homology](https://arxiv.org/pdf/1403.0534), Theorem 3.6 with Lemma 3.3 and proof. The Frobenius finiteness argument establishes finite AQ homology in every degree. [Dustin Clausen, Akhil Mathew and Matthew Morrow, K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/pdf/1803.10897), Definition 5.1 and paragraph following, p.38. The paper uses finite generation of every cotangent homotopy group. [Bhargav Bhatt and Akhil Mathew, Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818), F-finiteness discussion before §4, citing DM17 and SAG Theorem 3.5.1. The reverse implication is a cited SAG theorem, retained as a precise proof gap.

**Construction or proof route.**

1. For finite Frobenius, factor and compare polynomial resolutions of the Frobenius map; its cotangent map is zero.
2. Use the triangle exterior-power filtration of Dundas–Morrow Lemma 3.3 to prove finite generation of the AQ groups degree by degree.
3. Apply the Noetherian almost-perfect characterization. The converse uses SAG Theorem 3.5.1; its proof is not reconstructed from the paper’s citation.

**Acceptance checks.**

- F_p[t] is F-finite with L a finite free degree-zero module.
- An imperfect field with an infinite p-basis has an infinite-dimensional differential module and fails almost perfectness.

### p-bases and the dimension of differentials

**Theorem — `TauCeti.DerivedDeRham.pBasesDifferentials`**

For a field k of characteristic p with finite degree [k:k^p]=p^r, a p-basis b₁,…,b_r gives a basis db₁,…,db_r of Ω¹_(k/F_p), so dim_kΩ¹_(k/F_p)=r=log_p[k:k^p]. A p-basis means the p-monomials ∏b_i^e_i, 0≤e_i<p, form a k^p-basis; arbitrary transcendence bases are not substituted.

**Node:** `DerivedDeRhamCohomology:DD.0/p-bases-differentials`. **Direct prerequisites:** `mathlib:KaehlerDifferential.D`.

**Sources:** [Dustin Clausen, Akhil Mathew and Matthew Morrow, K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/pdf/1803.10897), §5.2, Footnote 10 and the paragraph before Lemma 5.8, PDF pp.39–40. The differentials of a finite p-basis give the stated dimension.

**Construction or proof route.**

1. Differentiate the unique p-monomial expansions; coefficients in k^p have derivative zero.
2. Define coordinate derivations by differentiating exponents, proving linear independence of db_i by the universal property.
3. Use spanning and independence to identify the rank with log_p of the Frobenius degree.

**Acceptance checks.**

- For k=F_p(t), dt is a basis and [k:k^p]=p.
- For a perfect field Ω¹=0 and [k:k^p]=1.

### Cotangent obstruction theory for square-zero lifts

**Theorem — `TauCeti.DerivedDeRham.squareZeroDeformations`**

Let A′→A be a square-zero extension with ideal J and let B be an ordinary A-algebra. The obstruction to a flat lift B′ over A′ with B′⊗_(A′)A≃B is a natural class in Ext²_B(L_(B/A),J⊗_A B). When it vanishes, isomorphism classes of lifts form a torsor under Ext¹ and automorphisms under Ext⁰. For smooth B/A, finite projectivity of L in degree zero gives existence and uniqueness up to the stated automorphisms. Derived lift spaces use the full module-valued square-zero extension, not just the Ext set.

**Node:** `DerivedDeRhamCohomology:DD.0/square-zero-deformations`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf), §21, Lemma 21.1; tag 08SP. The obstruction/torsor/automorphism degrees supply the deformation input to Elkik’s lifting argument.

**Construction or proof route.**

1. Express a square-zero extension by the corresponding cotangent extension class.
2. Lift polynomial generators and compare their equations; the resulting degree-two class is independent of choices.
3. Identify differences of lifts and their automorphisms using the derived derivation mapping space and its first two homotopy groups.

**Acceptance checks.**

- For A[t], arbitrary coordinate lifts exist; their differences are J⊗_A A[t].
- For étale B/A all three Ext groups vanish, giving unique lifting.

### The quasisyntomic cotangent condition

**Definition — `TauCeti.DerivedDeRham.quasisyntomicCondition`**

Fix a prime p. A quasisyntomic ring A is an ordinary p-adically complete ring with bounded p-power torsion and L_(A/Z)⊗^L_A A/p of Tor-amplitude [−1,0]. A quasisyntomic map A→B between such objects is p-completely flat and L_(B/A)⊗^L_B B/p has Tor-amplitude [−1,0]; a cover is p-completely faithfully flat. The mod-p ring in this formula is the ordinary A/p while the module tensor is derived. Object and morphism conditions are distinct.

**Node:** `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/absolute-complete-intersection`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/bounded-torsion-criterion`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Definitions 4.1, 4.10 and Lemmas 4.11–4.12. The amplitude condition is mod p and the object has bounded torsion.

**Construction or proof route.**

1. Use DD.1 complete flatness and the full relative cotangent complex to formulate the morphism condition.
2. Use BMS2 Lemmas 4.11–4.12 to prove closure under completed tensor products and faithfully flat detection.
3. Compare the absolute formulation with the relative one using the transitivity triangle, preserving all object hypotheses.

**Uses that determine the API.**

- BMS2 §4; DD.5 site; RT.1/6 HKR descent: The exact object and cover predicates define the site and its amplitude bounds.

**API contract.**

- `TauCeti.DerivedDeRham.quasisyntomicCover` (characterisation). A quasisyntomic map is a cover precisely when its mod-p map is faithfully flat.
- `TauCeti.DerivedDeRham.quasisyntomicComp` (structure). Composites and p-completed base changes of quasisyntomic maps are quasisyntomic, with bounded-torsion hypotheses inherited from the objects.
- `TauCeti.DerivedDeRham.quasisyntomicNoetherianLci` (compatibility). A p-complete Noetherian lci ring is a quasisyntomic object by Avramov’s criterion and bounded torsion.
- `TauCeti.DerivedDeRham.quasisyntomicRelative` (equivalence). Use the transitivity formulations of BMS2 Lemmas 4.11–4.12 for maps between the specified objects; do not erase p-complete flatness.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_qsyn_zp` (computation). Z_p is quasisyntomic.
- `TauCeti.DerivedDeRham.test_qsyn_fp_map_boundary` (non-example). F_p is a quasisyntomic object, but Z_p→F_p is not p-completely flat and is not a quasisyntomic map.
- `TauCeti.DerivedDeRham.test_qsyn_smooth` (compatibility). A p-completed smooth finitely presented algebra over a bounded-torsion quasisyntomic base gives a quasisyntomic map.

**Acceptance checks.**

- F_p is an object but Z_p→F_p is not a quasisyntomic map, since it is not p-completely flat.

### The square-zero non-lci quotient

**Application — `TauCeti.DerivedDeRham.nonregularQuotientHomology`**

For k=F_p and B=k[x,y]/(x²,xy,y²), L_(B/k) is unbounded in negative cohomological degrees. The polynomial-presentation complex [I/I²→B dx⊕B dy] computes only τ≥−1L; it cannot replace the full complex. The quotient has a flat Z/p² lift with the same equations and a compatible p-power Frobenius lift; derived Cartier then makes dR_(B/k) unbounded on the left. Classical crystalline cohomology, computed as sheaf cohomology in nonnegative degrees, cannot be equivalent to this object.

**Node:** `DerivedDeRhamCohomology:DD.0/nonregular-quotient-homology`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`, `DerivedDeRhamCohomology:DD.0/absolute-complete-intersection`, `DerivedDeRhamCohomology:DD.3/frobenius-lift-splitting`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Example 3.21, printed p.11. The source supplies the explicit non-lci liftable quotient and the unboundedness counterexample.

**Construction or proof route.**

1. Localize at (x,y); the ideal (x,y)² has height two and three minimal generators, hence is not generated by a regular sequence.
2. Apply the Noetherian absolute complete-intersection cotangent criterion to get unbounded full cotangent homology.
3. The evident flat Z/p² quotient and p-power maps give the split derived Cartier object; its weight-one summand already has unbounded negative homology.
4. Compare with the lower bound of ordinary crystalline sheaf cohomology to reject the unrestricted comparison.

**Acceptance checks.**

- The ordinary Kähler module and H¹Cotangent truncation do not detect all the negative terms.
- This same example disproves the printed strict-surjection-only G-lci claim in DD.6.

### What keeps DD.0 open

- Cohen factorization and cotangent lci converses: The statement and local proof route of Avramov Theorem 1.2 and Iyengar 8.12 were read. The complete Cohen-factorization interior and the finite-presentation converse in Stacks’ cited commutative algebra are not yet checked against a supplier or reconstructed. These are proof gaps, not changes to the theorem hypotheses.
- Integral derived powers and décalage proof: Animation gives the definition and polynomial API. The complete Illusie proof of the integral triangle/décalage comparison was not available; both author errata are binding. Dundas–Morrow and Bhatt use these formulas. Verify the corrected simplicial argument before claiming the shifted-flat divided-power equivalence proved.
- The converse F-finiteness theorem: Bhatt–Mathew cites Lurie SAG Theorem 3.5.1 for almost perfect L_(S/F_p)⇒F-finite S. Its proof was not read in this pass. The Noetherian hypothesis and forward Dundas–Morrow proof are explicit; the converse needs a primary-source proof decomposition.
- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.
- Supplier CrystallineCohomology:CR.0: Ordinary divided power algebra Γ_B(M), with its flat-module base change and γ_n(ax)=a^nγ_n(x). This is the polynomial operation animated by DD.0, not a new PD-envelope owner.

## DD.1 — Koszul completion and filtered algebra

The general Koszul complex contracts exterior powers along a linear functional. Its finite-sequence model lives in degrees [−r,0] and supplies derived quotients even when a sequence is not regular. A zero single coordinate leaves negative homology, which an ordinary quotient would lose. Derived ideal completeness is vanishing of derived Hom from localizations; it depends only on the radical of a finitely generated ideal. The reflector is modeled by the dual stable Koszul complex, has its actual adjunction and unit, and gives derived Nakayama.

The completion tower consists of derived Koszul quotients. Ordinary A/I^n quotients compute it in the proved regular, Noetherian or principal bounded-torsion ranges. Artin–Rees and a general weak-proregular proof remain named refinements; no formula for arbitrary non-Noetherian rings is inferred. Animated ring completion keeps the negative module information and the compatible algebra unit. Its (p,d) polynomial example must retain both generators. The Berthelot–Ogus Appendix B correction is binding: derived replacement is an isomorphism in the derived category, and an unqualified termwise-surjective replacement is unavailable.

Complete flatness and complete faithful flatness are tested after derived reduction. They are stable under the stated complete base changes and detected by descent. Bounded p-torsion supplies the discrete ordinary-module and finite Tor-amplitude criteria. Bhatt's Noetherian complete-flatness-to-flatness theorem and the quotient-completeness application retain their extra hypotheses. Completely smooth and étale algebraization follows the derived deformation proof of Bhatt–Scholze's footnote and Stacks' smooth-lift theorem; it does not acquire an invented Noetherian-base assumption.

Filtered modules are coherent Z^op diagrams in the enhanced category. Their reflection subtracts the inverse-limit tail, preserves graded pieces, and makes graded detection conservative in the complete category. Rees uses degree −i for F^i and a degree-one t acting through transitions. Graded t-completeness does not mean completeness of an ungraded direct sum. Day convolution followed by reflection gives the completed tensor. The Beilinson heart consists of actual complexes, including nonzero acyclic complexes; it is not the ordinary derived category. The supporting Ext formula is Ext_A^(i+c) for c≤0, with negative Ext zero. Weak Postnikov towers require their connectivity bounds before a t-exact functor is moved through a limit.

### Target coverage

- Koszul model, completeness reflector, adjunction, radical invariance and Nakayama: koszul-complex, derived-completeness, derived-completion, koszul-completion-tower.
- Ordinary quotient limits, animated p/(p,d) completion, bounded torsion and descent: ordinary-quotient-completion, animated-ring-completion, complete-flatness, bounded-torsion-criterion, complete-flat-descent.
- Routed algebraization and completeness applications: ordinary-flatness-from-complete-flatness, quotient-completeness, completely-smooth-algebraization.
- Coherent filtered modules, Rees, completion and completed tensor: filtered-modules, filtered-completion, rees-description, completed-filtered-tensor.
- Beilinson heart, corrected Ext, weak towers and valid exchanges: beilinson-t-structure, beilinson-heart, complex-heart-ext, weak-postnikov-towers, completion-exchanges.

**Atlas planets:** Koszul complex; Derived ideal completeness; Derived completion; Complete flatness; Elkik algebraization; Filtered derived category.

### The Koszul complex

**Construction — `TauCeti.DerivedDeRham.koszulComplex`**

For a commutative ring A, an A-module E and a linear map φ:E→A, construct the homological Koszul complex K_A(φ) with degree n term ∧ⁿ_A E and differential d(e₁∧…∧e_n)=Σ_j(−1)^(j−1)φ(e_j)e₁∧…∧ê_j∧…∧e_n. Its exterior multiplication is a differential graded A-algebra. For a finite sequence f₁,…,f_r take E=A^r, φ(e_i)=f_i; the equivalent cochain complex occupies [−r,0]. General E is allowed; perfectness is asserted only for finite projective E.

**Node:** `DerivedDeRhamCohomology:DD.1/koszul-complex`. **Direct prerequisites:** `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.ιMulti`, `mathlib:AlternatingMap.map_swap`, `mathlib:CochainComplex.of`.

**Sources:** [The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf), §29, Definition 29.1, Lemmas 29.3–29.12; tags 0621–062D. The exterior contraction construction, differential identity and tensor-factor model.

**Construction or proof route.**

1. Extend φ as the degree −1 alternating contraction on exterior powers, including diagonal relations in characteristic 2.
2. Compute d² on decomposable wedges: the two terms deleting any pair cancel with opposite signs.
3. Check graded Leibniz on wedges and functoriality for ψ with φ′ψ=φ. For E=A^r identify K with the tensor product of [A→A] factors.

**Uses that determine the API.**

- BS §1.2; DD.1 completion; PR.0 boundedness; EDS E4 coefficients: The same general Koszul complex supplies all ideal and coefficient completion models.

**API contract.**

- `TauCeti.DerivedDeRham.koszulDifferential` (data). The differential has the displayed alternating contraction formula.
- `TauCeti.DerivedDeRham.koszulMap` (functoriality). A linear map ψ:E→E′ satisfying φ′ψ=φ induces a dg algebra map K(φ)→K(φ′).
- `TauCeti.DerivedDeRham.koszulTensor` (equivalence). K(f₁,…,f_r)≃⊗_i K(f_i), using the cochain Koszul signs.
- `TauCeti.DerivedDeRham.koszulRegular` (compatibility). For a regular sequence f_i, K(f_i)→A/(f_i) is a quasi-isomorphism.
- `TauCeti.DerivedDeRham.koszulHomotopy` (relation). Multiplication by φ(e) is null-homotopic via wedge multiplication by e.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_koszul_empty` (degenerate). K_A(())=A in degree 0.
- `TauCeti.DerivedDeRham.test_koszul_one` (computation). K_Z(p) is [Z→Z] with differential p, and H⁰=F_p, H^−1=0.
- `TauCeti.DerivedDeRham.test_koszul_zero` (non-example). K_A(0) has zero differential, H⁰=A and H^−1=A; it is not the ordinary quotient A alone.

**Acceptance checks.**

- The one-element complex has differential f, not zero; a regular sequence resolves its quotient.

### Derived ideal completeness

**Definition — `TauCeti.DerivedDeRham.derivedCompleteness`**

Let I=(f₁,…,f_r)⊂A be finitely generated. A complex M∈D(A) is derived I-complete if RHom_A(A[1/f_i],M)=0 for each i, equivalently Hom_D(A)(A[1/f_i][n],M)=0 for every integer n and i. This depends only on √I and is equivalent to each H^j(M) being a derived I-complete module. Completeness is a homotopical condition, not ordinary separatedness.

**Node:** `DerivedDeRhamCohomology:DD.1/derived-completeness`. **Direct prerequisites:** `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf), §93, Lemmas 93.1–93.4 and Definition 93.4; tags 091P,091S. Localization orthogonality and finite-generator/radical independence.

**Construction or proof route.**

1. Use the telescope resolution of A[1/f] to identify its derived Hom with the fibre of 1−shift on a product.
2. Show vanishing is stable under products, fibres and cohomological truncations; compare the cohomology-module conditions.
3. Use the localization triangle and finite radical containment to show the conditions are independent of the generating set.

**Uses that determine the API.**

- DD.1–DD.6; PR.0 bounded prisms; EDS E4 sheaf completion: Orthogonality defines the single generic completion owner.

**API contract.**

- `TauCeti.DerivedDeRham.isDerivedCompleteGenerators` (characterisation). The condition is RHom-vanishing for any finite generating set of I.
- `TauCeti.DerivedDeRham.isDerivedCompleteRadical` (equivalence). If √I=√J for finite-generated ideals, I-complete and J-complete objects coincide.
- `TauCeti.DerivedDeRham.isDerivedCompleteCohomology` (characterisation). M is I-complete iff every H^j(M) is derived I-complete.
- `TauCeti.DerivedDeRham.isDerivedCompleteLimits` (structure). Derived I-complete objects are closed under all limits and finite colimits in D(A).

**Unit tests.**

- `TauCeti.DerivedDeRham.test_complete_zero_ideal` (degenerate). For I=0, every complex is derived complete.
- `TauCeti.DerivedDeRham.test_complete_unit_ideal` (non-example). For I=A, only the zero object is complete.
- `TauCeti.DerivedDeRham.test_complete_zp` (computation). Z_p is derived p-complete, while Q_p is not: RHom_Zp(Q_p,Q_p) has a nonzero identity class.

**Acceptance checks.**

- Ordinary I-adic separatedness alone is insufficient; all cohomological degrees occur in the Hom test.

### The derived completion reflector

**Construction — `TauCeti.DerivedDeRham.derivedCompletion`**

For finite-generated I⊂A construct Λ_I:D(A)→D_I-comp(A) left adjoint to the inclusion, with natural unit η_M:M→Λ_I M. For I=(f_i), put C_I=⊗_i[A→A[1/f_i]] in cochain degrees 0,1 and Λ_I M=RHom_A(C_I,M). This is exact, independent of generators, idempotent and preserves colimits formed in the complete category. Derived Nakayama: if M is complete and M⊗^L_A A/I=0 then M=0.

**Node:** `DerivedDeRhamCohomology:DD.1/derived-completion`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completeness`, `DerivedDeRhamCohomology:DD.1/koszul-complex`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `mathlib:PadicInt`.

**Sources:** [The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf), §93, Proposition 93.6, Lemmas 93.7–93.9; tags 091V,0920,0G1U. The Čech RHom reflector and derived Nakayama.

**Construction or proof route.**

1. Construct C_I from the localization complexes and prove the unit and orthogonality by the telescope computation.
2. For complete N, apply RHom and the localization vanishing to show Map(Λ_I M,N)≃Map(M,N).
3. Obtain idempotence from the adjunction; prove Nakayama first for the finite Koszul complex, then use generator independence to detect zero.

**Uses that determine the API.**

- BS §1.2; all completed comparisons; EDS E4: The reflector and Nakayama are imported by every subsequent completion.

**API contract.**

- `TauCeti.DerivedDeRham.completionUnit` (constructor). η_M is the universal map from M to an I-complete object.
- `TauCeti.DerivedDeRham.completionAdjunction` (universal-property). Map_(D_I-comp)(Λ_I M,N)≃Map_D(A)(M,N), naturally for complete N.
- `TauCeti.DerivedDeRham.completionIdempotent` (simp). Λ_IΛ_I M≃Λ_I M, compatibly with both units.
- `TauCeti.DerivedDeRham.completeNakayama` (characterisation). A complete M with M⊗^L_A A/I=0 vanishes.
- `TauCeti.DerivedDeRham.completedColimit` (structure). The colimit of a diagram of complete objects is Λ_I of its colimit in D(A).

**Unit tests.**

- `TauCeti.DerivedDeRham.test_completion_z` (computation). Λ_(p)Z≃Z_p in degree 0.
- `TauCeti.DerivedDeRham.test_completion_inverted` (non-example). Λ_(p)Z[1/p]=0, although Z[1/p] is nonzero.
- `TauCeti.DerivedDeRham.test_completion_torsion` (computation). Λ_(p)(Z/p^m)≃Z/p^m for m≥1.

**Acceptance checks.**

- Λ_I preserves finite exact sequences; it need not preserve raw colimits in D(A).

### The derived Koszul completion tower

**Comparison — `TauCeti.DerivedDeRham.koszulCompletionTower`**

For M∈D(A), I=(f₁,…,f_r), Λ_I M≃Rlim_n(M⊗^L_A K_A(f₁^n,…,f_r^n)), with the quotient-direction transition induced by e_i↦f_i e_i and the identity in degree zero. These are derived Koszul quotients. Replacing them by ordinary A/I^n for an arbitrary ring is invalid.

**Node:** `DerivedDeRhamCohomology:DD.1/koszul-completion-tower`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/koszul-complex`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Sources:** [The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf), Lemma 93.7; tag 0920. Dual finite Koszul complexes present C_I as a filtered colimit.

**Construction or proof route.**

1. Express C_I as colim_n K_A(f_i^n)^∨ using localization telescopes.
2. Move the colimit across RHom to get Rlim of RHom(K^∨,M).
3. Use finite perfect duality to identify each term with M⊗K; keep the transition maps and all derived-limit terms.

**Acceptance checks.**

- For f=0, the transition in degree −1 is zero and the limit is M.
- For M=Q_p/Z_p, Λ_pM≃Z_p[1]; termwise ordinary quotients would give zero.

### When ordinary quotient towers compute completion

**Comparison — `TauCeti.DerivedDeRham.ordinaryQuotientCompletion`**

For finite I generated by a regular sequence, Λ_I M≃Rlim_n(M⊗^L_A A/I^n), using cofinal ideals (f₁^n,…,f_r^n). The same comparison holds for Noetherian A by Artin–Rees. For principal I=(f), it holds for every complex M if A has bounded f-power torsion. Without these hypotheses use the Koszul tower; a general weak-proregular model requires its separate pro-zero theorem.

**Node:** `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/koszul-completion-tower`, `DerivedDeRhamCohomology:DD.1/koszul-complex`.

**Sources:** [The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf), §95, Lemmas 95.1–95.4; tags 091X,0923. The principal bounded-torsion comparison identifies the pro-Koszul and quotient systems. [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), §1.2 Footnote 5, pp.10–11. The regular-sequence and Noetherian ranges are explicit in the source.

**Construction or proof route.**

1. For regular sequences, powers remain regular and finite Koszul complexes resolve the cofinal quotient ideals.
2. For bounded principal torsion, show the negative Koszul homology system is pro-zero; compare the towers before taking Rlim.
3. For the Noetherian range, apply the Artin–Rees pro-zero argument rather than asserting ordinary completion is exact for arbitrary complexes.

**Acceptance checks.**

- For A=Z, I=(p), retain derived tensors of M with Z/p^n.
- An unbounded f-torsion ring is not covered by the quotient formula.

### Completion of animated rings

**Construction — `TauCeti.DerivedDeRham.animatedRingCompletion`**

For an animated A-algebra B and finite I⊂π₀A, construct its derived I-completion as the inverse limit of animated Koszul quotients B⊗^L_(Z[x₁,…,x_r])Z[x₁,…,x_r]/(x₁^n,…,x_r^n), with x_i acting through f_i. Its underlying A-module is Λ_I B; the unit is a map of animated algebras, and the construction is a reflector onto complete animated algebras. Specialize to (p) and (p,d). Limits are taken in animated rings, not degree-zero rings.

**Node:** `DerivedDeRhamCohomology:DD.1/animated-ring-completion`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/koszul-completion-tower`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), §1.2 and Footnote 6, pp.10–11. The Koszul tower has simplicial algebra structure and computes derived ring completion.

**Construction or proof route.**

1. Form each derived quotient by the polynomial variables using the animated ring pushout.
2. Identify its underlying module with the finite Koszul complex; the forgetful functor preserves limits.
3. Use the universal property against complete animated algebras and the module adjunction; check connectivity using the surjective π₀ tower, not by truncating first.

**Uses that determine the API.**

- BS bounded prism conventions; DD.4/6 p-completed algebras: Ring completion agrees with module completion and supports (p,d) base change.

**API contract.**

- `TauCeti.DerivedDeRham.ringCompletionUnit` (constructor). B→Λ_I B is an animated algebra map with the module completion unit underneath.
- `TauCeti.DerivedDeRham.ringCompletionUnderlying` (compatibility). The underlying module is the DD.1 derived completion, including negative cochain degrees.
- `TauCeti.DerivedDeRham.ringCompletionMap` (functoriality). A map of animated algebras respecting the ideal induces the completed map.
- `TauCeti.DerivedDeRham.ringCompletionIdempotent` (simp). Completing a complete animated algebra gives it back.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_ring_completion_z` (computation). The p-completion of Z is the ordinary Z_p.
- `TauCeti.DerivedDeRham.test_ring_completion_pd` (computation). The (p,d)-completion of Z[d] is Z_p[[d]], with both generators retained.
- `TauCeti.DerivedDeRham.test_ring_completion_unit` (degenerate). Completion at the unit ideal is the zero ring.

**Acceptance checks.**

- The construction carries multiplication and coherent units; no new ordinary ring structure is chosen on cohomology.

### Complete flatness and complete faithful flatness

**Definition — `TauCeti.DerivedDeRham.completeFlatness`**

For finite I⊂A, an object M∈D(A) is I-completely flat when M⊗^L_A A/I is a flat A/I-module in degree zero, equivalently M⊗^L_A N is discrete for every I-power-torsion A-module N. It is I-completely faithfully flat if that reduction is faithfully flat. The predicate itself does not require M to be complete. Define finite I-complete Tor-amplitude [a,b] using the derived reduction and all discrete A/I-modules.

**Node:** `DerivedDeRhamCohomology:DD.1/complete-flatness`. **Direct prerequisites:** `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `DerivedDeRhamCohomology:DD.1/derived-completeness`.

**Sources:** [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), §1.2, p.11. The source separates complete flatness from actual completeness. [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Definition 4.1, Lemmas 4.3–4.8. BMS2 specializes the definition to p-complete Tor-amplitude.

**Construction or proof route.**

1. Define reduction and test its flat discrete-module condition.
2. Use dévissage for modules killed by I^n and filtered colimits of torsion modules to obtain the equivalent torsion criterion.
3. Define faithful flatness on the ordinary degree-zero reduction, retaining it in base changes.

**Uses that determine the API.**

- DD.0 quasisyntomic maps; BS completely smooth algebras; DD.5 covers: Flatness and faithfulness are separate from completion.

**API contract.**

- `TauCeti.DerivedDeRham.completeFlatReduction` (characterisation). Complete flatness is equivalent to flat discrete derived reduction.
- `TauCeti.DerivedDeRham.completeFlatCompletion` (compatibility). The derived I-completion of a flat A-module is I-completely flat.
- `TauCeti.DerivedDeRham.completeFlatBaseChange` (functoriality). Derived base change followed by completion preserves complete flatness and complete faithful flatness.
- `TauCeti.DerivedDeRham.completeTorAmplitude` (characterisation). Amplitude [a,b] means every tensor with a discrete A/I-module has cohomology in [a,b].

**Unit tests.**

- `TauCeti.DerivedDeRham.test_complete_flat_z` (compatibility). Z as a Z-module is p-completely flat even though it is not p-complete.
- `TauCeti.DerivedDeRham.test_complete_flat_zp` (computation). Z_p is p-completely faithfully flat over Z.
- `TauCeti.DerivedDeRham.test_complete_flat_fp_boundary` (non-example). F_p is not p-completely flat over Z_p: F_p⊗^L_Zp F_p has a nonzero degree −1 term.

**Acceptance checks.**

- A complete-flat module need not be a complete object.

### Bounded torsion and complete Tor-amplitude

**Theorem — `TauCeti.DerivedDeRham.boundedTorsionCriterion`**

Assume A has bounded p-power torsion. If M is derived p-complete and has p-complete Tor-amplitude [a,b], then M has ordinary cohomological amplitude [a,b] and bounded p-power torsion in its cohomology. In particular derived p-complete, p-completely flat M is an ordinary p-adically complete bounded-torsion module with M/p^n flat over A/p^n and M[p^n]≃M⊗_A A[p^n]. Conversely an ordinary p-complete bounded-torsion module satisfying these flatness/torsion conditions is p-completely flat.

**Node:** `DerivedDeRhamCohomology:DD.1/bounded-torsion-criterion`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/koszul-completion-tower`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemmas 4.6–4.8, pp.219–221. Bounded torsion kills the pro-torsion and derived-limit terms in these amplitude estimates.

**Construction or proof route.**

1. Compare the Koszul reduction with ordinary p^n reduction using the bounded torsion pro-zero system.
2. Apply derived completeness and the Milnor sequence to transfer the mod-p amplitude to M.
3. For amplitude [0,0], compute the torsion kernel and flat reductions; use BMS2 Lemma 4.7 for the converse.

**Acceptance checks.**

- If A is p-torsion-free, a complete-flat complete M is p-torsion-free.
- No bounded-torsion conclusion is drawn after removing bounded torsion on A.

### Complete faithful-flat module descent

**Theorem — `TauCeti.DerivedDeRham.completeFlatDescent`**

Let A→B be a p-completely faithfully flat map of ordinary p-complete rings with bounded p-power torsion. For derived p-complete M, the augmentation M→Tot((M⊗^L_A B•)^∧_p) is an equivalence, where B• is the p-completed derived Čech nerve. Complete flatness and fixed finite p-complete Tor-amplitude are detected after this base change. These statements concern Čech descent; arbitrary hyperdescent is not inferred.

**Node:** `DerivedDeRhamCohomology:DD.1/complete-flat-descent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/bounded-torsion-criterion`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Remark 4.9 and §3 flat-descent argument. Completed faithfully flat Čech descent is reduced to the mod-p and torsion layers.

**Construction or proof route.**

1. Reduce the completed Čech augmentation modulo derived p, and use faithful-flat descent on its ordinary torsion layers.
2. Use the torsion comparison from Lemma 4.7 to retain the derived reduction, including A[p].
3. Apply derived Nakayama to its complete fibre; detect amplitude by faithful-flat reduction.

**Acceptance checks.**

- For A→A the augmented Čech nerve is split.
- A map with nonfaithful mod-p reduction does not satisfy the detection assertion.

### Bhatt’s ordinary flatness criterion

**Theorem — `TauCeti.DerivedDeRham.ordinaryFlatnessFromCompleteFlatness`**

Let A be Noetherian, π∈A, and suppose A and an A-algebra B are π-torsion-free and classically π-adically complete. If A/π→B/π is flat, then A→B is flat; if it is faithfully flat, then A→B is faithfully flat. This is the Noetherian algebra criterion of Bhatt Proposition 5.1, not a general identification of complete flatness and ordinary flatness.

**Node:** `DerivedDeRhamCohomology:DD.1/ordinary-flatness-from-complete-flatness`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

**Sources:** [Bhargav Bhatt, On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882), Proposition 5.1 and proof. Noetherianity and torsion-free complete algebras are explicit assumptions.

**Construction or proof route.**

1. For a finite A-module resolve it by finite free modules and tensor with B.
2. Use Artin–Rees to bound the pro-torsion terms and compare ordinary inverse limits with the derived tensor.
3. Conclude Tor₁ vanishes for finite modules, hence flatness; use π in the Jacobson radical and faithful mod-π reduction for faithfulness.

**Acceptance checks.**

- Z_p→Z_p⟨x⟩ satisfies the criterion.
- Dropping the stated Noetherian/torsion hypotheses requires a different theorem.

### Quotient completeness under a nonzerodivisor condition

**Theorem — `TauCeti.DerivedDeRham.quotientCompleteness`**

Let N be an A-module, f,g∈A. If N is classically f-adically complete and f acts injectively on N/gN, then N/gN is classically f-adically complete. Derived completeness of cokernels supplies the intermediate assertion; f-separatedness follows from injectivity and derived completeness. No unconditional claim that every quotient of a classically complete module is separated is made.

**Node:** `DerivedDeRhamCohomology:DD.1/quotient-completeness`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completeness`.

**Sources:** [Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and Jakub Witaszek, Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic](https://arxiv.org/pdf/2012.15801), Lemmas 2.7–2.8 and proof. The nonzerodivisor-on-the-quotient hypothesis upgrades derived to ordinary completeness.

**Construction or proof route.**

1. Classical completeness gives derived completeness of N.
2. Derived complete modules form an abelian subcategory, so the cokernel of multiplication by g is derived complete.
3. Use f-injectivity on the quotient to identify derived completeness with ordinary f-adic completeness as in Lemma 2.8.

**Acceptance checks.**

- For N=Z_p[[x]], f=p and g=x, the quotient is Z_p and is p-complete.

### Elkik algebraization of completely smooth and étale algebras

**Theorem — `TauCeti.DerivedDeRham.completelySmoothAlgebraization`**

For an ordinary ring A, finite-generated I⊂A and a derived I-complete animated A-algebra R, if R⊗^L_A A/I is a discrete smooth (respectively étale) A/I-algebra, then R is the derived I-completion of a smooth (respectively étale) ordinary A-algebra R′. Conversely such completions are completely smooth (respectively étale). No Noetherian hypothesis is imposed in the derived deformation-theoretic proof of BS Footnote 6.

**Node:** `DerivedDeRhamCohomology:DD.1/completely-smooth-algebraization`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/animated-ring-completion`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/koszul-completion-tower`, `DerivedDeRhamCohomology:DD.0/square-zero-deformations`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`.

**Sources:** [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), §1.2 Footnote 6 and Lemma 2.18 usage. The footnote proves the exact algebraization statement by derived square-zero lifting. [The Stacks Project Authors, Smoothing ring maps: lifting smooth algebras](https://stacks.math.columbia.edu/tag/07M8), Proposition 16.3.2, Tag 07M8. The proof supplies the needed smooth lift without a Noetherian-base assumption.

**Construction or proof route.**

1. Lift the smooth A/I-algebra to a smooth A-algebra using the now-read proof of Stacks Tag 07M8: lift a standard-smooth cover and its relations along the given surjection, then patch the presentations.
2. Compare R with the completed lift over the animated Koszul quotients A_n. Each transition, and A₁→π₀A₁, is a finite composite of square-zero extensions with bounded-above ideals.
3. The obstruction Ext¹_B(P,M) vanishes because P is finite projective and M lies in D≤0; lift a compatible system of equivalences and take the derived limit.
4. For the étale case the cotangent complex vanishes, giving unique compatible lifts.

**Acceptance checks.**

- The completion of A[t] gives a completely smooth algebra.
- A merely smooth degree-zero reduction without the derived Tor-flat condition is insufficient.

### Coherent filtered modules

**Definition — `TauCeti.DerivedDeRham.filteredModules`**

For a commutative ring A define DF(A)=Fun(Z^op,D(A)) in the stable enhanced category. A filtered object F has F^i→F^(i−1), underlying object colim_(i→−∞)F^i, and gr^iF=cofib(F^(i+1)→F^i). Filtration shifts satisfy (F{n})^i=F^(i+n). Increasing filtrations are reindexed explicitly. This is a category of coherent diagrams; a diagram in the ordinary triangulated derived category does not encode the same data.

**Node:** `DerivedDeRhamCohomology:DD.1/filtered-modules`. **Direct prerequisites:** `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §5.1, p.233, with the gr-index correction. BMS2 uses decreasing coherent filtrations. [Owen Gwilliam and Dmitri Pavlov, Enhancing the filtered derived category](https://arxiv.org/pdf/1602.01515v3), Definitions 2.1–2.3, pp.5–7, reindex by i↦−i. The enhancement and graded-equivalence localization retain homotopy coherence.

**Construction or proof route.**

1. Form the enhanced functor category with decreasing integer indexing.
2. Define the associated graded by cofibres and the underlying object by the filtered colimit.
3. Keep evaluation, shifts and multiplication as coherent functors; apply the source index correction to BMS2’s initial display.

**Uses that determine the API.**

- DD.2 Hodge and DD.3 conjugate filtrations; BMS2 §5: The exact direction and enhanced diagrams control the completion and tensor APIs.

**API contract.**

- `TauCeti.DerivedDeRham.filtrationAt` (projection). Evaluation F↦F^i is exact.
- `TauCeti.DerivedDeRham.associatedGraded` (data). gr^iF=cofib(F^(i+1)→F^i).
- `TauCeti.DerivedDeRham.filteredShift` (structure). F{n} has i-th value F^(i+n) and shifts the graded pieces by the same convention.
- `TauCeti.DerivedDeRham.filteredMapExt` (extensionality). A map of coherent filtered objects is an equivalence iff every evaluation is an equivalence.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_filtered_step` (computation). For the step filtration F^i=M for i≤0 and 0 for i>0, gr⁰=M and all other graded pieces vanish.
- `TauCeti.DerivedDeRham.test_filtered_constant` (non-example). A nonzero constant filtration has every graded piece zero although its underlying object is nonzero.
- `TauCeti.DerivedDeRham.test_filtered_shift` (computation). For the preceding step F, F{1} has its sole graded piece in index −1.

**Acceptance checks.**

- The cofiber uses F^(i+1)→F^i; reversing it changes the shift.

### Completion of a filtered object

**Construction — `TauCeti.DerivedDeRham.filteredCompletion`**

A coherent decreasing filtration F is complete when Rlim_(i→+∞)F^i=0. Its reflection is (F^∧)^i=cofib(Rlim_jF^j→F^i); its underlying object is Rlim_i(cofib(F^i→F)), where F=colim_(i→−∞)F^i. Completion leaves every gr^i unchanged and gr is conservative on complete filtrations. Colimits in complete filtered modules are formed by completing colimits in DF(A). Classical separatedness alone does not imply this completeness.

**Node:** `DerivedDeRhamCohomology:DD.1/filtered-completion`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/filtered-modules`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [Owen Gwilliam and Dmitri Pavlov, Enhancing the filtered derived category](https://arxiv.org/pdf/1602.01515v3), Definition 2.8, Lemma 2.9, Proposition 2.14, Lemma 2.15, pp.6–7. The source proves the reflector and the exact relation to quotient-tower completion. [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 5.2, p.234. Complete filtered colimits and graded conservativity.

**Construction or proof route.**

1. Construct the cofiber of the constant limit diagram and calculate its limit as zero.
2. For complete G, every F→G uniquely factors in mapping spaces through this cofiber; conclude adjunction and idempotence.
3. Calculate cofibres of consecutive values to prove gr is unchanged; zero graded pieces imply a complete object is zero.
4. Apply the finite-limit calculation of GP Lemma 2.9 to identify the underlying completed object.

**Uses that determine the API.**

- DD.2 Hodge completion; HQ.2 Hodge specialization; BMS2 §5: Completion is a reflection preserving graded pieces, not intersection of ordinary submodules.

**API contract.**

- `TauCeti.DerivedDeRham.filteredCompletionUnit` (constructor). F→F^∧ is universal among maps to complete filtered objects.
- `TauCeti.DerivedDeRham.filteredCompletionGraded` (equivalence). gr^iF≃gr^i(F^∧) for every i.
- `TauCeti.DerivedDeRham.filteredCompletionIdempotent` (simp). (F^∧)^∧≃F^∧.
- `TauCeti.DerivedDeRham.gradedDetectsComplete` (characterisation). A map between complete filtered objects is an equivalence exactly when all its graded maps are equivalences.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_filtered_complete_step` (degenerate). The step filtration of an object is already complete.
- `TauCeti.DerivedDeRham.test_filtered_complete_constant` (non-example). The completion of a nonzero constant filtration is zero.
- `TauCeti.DerivedDeRham.test_filtered_separated_boundary` (non-example). The t-adic filtration of k[t] is classically separated; its completed underlying object is k[[t]], so it is not derived complete as a filtered object.

**Acceptance checks.**

- Completion changes a constant nonzero filtration to zero.

### The Rees description of filtered modules

**Comparison — `TauCeti.DerivedDeRham.reesDescription`**

For a coherent decreasing filtration F, define its Rees graded A[t]-module with grading-deg(t)=1 by degree −i term F^i and t-action the transition F^i→F^(i−1). This yields a symmetric monoidal equivalence DF(A)≃D_gr(A[t]). Derived quotient by t has degree −i term gr^iF, and inversion of t recovers the underlying object after forgetting weights. Filtered completeness corresponds to derived t-completeness in the graded category; it is not completeness of the ungraded direct sum.

**Node:** `DerivedDeRhamCohomology:DD.1/rees-description`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt, Prismatic F-gauges](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf), §2.2.1, Proposition 2.2.6 and inverse, Remark 2.2.7, pp.13–17. The lecture notes pin the weight sign, specializations and graded completeness.

**Construction or proof route.**

1. Identify graded modules with diagrams whose t-action shifts degree by +1.
2. Recover the filtered coherent diagram by taking its degree −i terms; the mutually inverse constructions preserve tensor by Day convolution.
3. Compute derived t=0 and t-inverted fibres; compare graded telescopes with the filtered limit for completeness.

**Acceptance checks.**

- Graded A[t] is t-complete weightwise, although its ungraded module A[t] is not ordinarily t-complete.

### Completed filtered tensor products

**Construction — `TauCeti.DerivedDeRham.completedFilteredTensor`**

Define (F⊗_filG)^n=colim_(i+j≥n)(F^i⊗^L_A G^j) by Day convolution. On complete filtered objects use F⊗̂_filG=(F⊗_filG)^∧. These form a symmetric monoidal category; gr^n(F⊗̂_filG)≃⊕_(i+j=n)gr^iF⊗^L_A gr^jG. The tensor unit is the step filtration of A. Complete filtered algebras and their modules use this tensor, not levelwise tensor.

**Node:** `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Owen Gwilliam and Dmitri Pavlov, Enhancing the filtered derived category](https://arxiv.org/pdf/1602.01515v3), §2.23, Theorem 2.25, Proposition 2.26, pp.9–10. Completed Day convolution and its monoidal associated graded are proved. [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §5.1 and Lemma 5.2. BMS2 uses the decreasing convention and completed monoidal reflection.

**Construction or proof route.**

1. Use the Day convolution of addition on Z and colimit-preserving enhanced tensor.
2. Check graded equivalences are stable under tensor by computing their cofibres as constant diagrams.
3. Apply the monoidal reflection and compute gr on step generators, extending by colimits.

**Uses that determine the API.**

- DD.2 E∞ multiplication and Hodge base change; HQ.2/5: The completed tensor preserves weight grading and derived Tor.

**API contract.**

- `TauCeti.DerivedDeRham.filteredTensorAt` (data). The n-th term is the colimit over i+j≥n before completion.
- `TauCeti.DerivedDeRham.filteredTensorGraded` (equivalence). The n-th graded piece is the direct sum of tensor products with i+j=n.
- `TauCeti.DerivedDeRham.filteredTensorUnit` (instance). The step filtration of A is the tensor unit.
- `TauCeti.DerivedDeRham.filteredTensorSteps` (simp). The tensor of steps in weights i,j is the step of the module tensor in weight i+j.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_filtered_tensor_unit` (degenerate). Tensor with the step filtration of A returns F.
- `TauCeti.DerivedDeRham.test_filtered_tensor_two_steps` (computation). Two filtrations with sole graded pieces A in weight 1 have tensor with sole graded piece A in weight 2.
- `TauCeti.DerivedDeRham.test_filtered_tensor_derived` (non-example). For step filtrations of F_p over Z_p, the tensor has the degree −1 Tor term of F_p⊗^L_ZpF_p, so ordinary module tensor is wrong.

**Acceptance checks.**

- Levelwise tensor would put the tensor of steps in the wrong weight.

### The Beilinson t-structure

**Theorem — `TauCeti.DerivedDeRham.beilinsonTStructure`**

DF(A) has the Beilinson t-structure with DF≤0_Beil={F:gr^iF∈D≤i(A) for all i} and DF≥0_Beil={F:F^i∈D≥i(A) for all i}. On complete filtered objects the latter can equivalently be tested on gr^iF∈D≥i. These conventions use cohomological grading and decreasing filtrations.

**Node:** `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 5.4, pp.234–235. The source identifies both halves and the heart. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix D, Theorem D.1 and Proposition D.6. The proof uses finite truncations and the completed limit with these shifts.

**Construction or proof route.**

1. Construct truncations first for finite-support filtrations by inductively gluing usual cohomological truncations of graded pieces.
2. Extend to all coherent filtrations using completed limits and the constant-filtration part, as in BL Appendix D.
3. Verify orthogonality and the triangle axiom with the stated gr versus evaluation conditions.

**Acceptance checks.**

- A stupid-filtered cochain complex lies in the heart; a constant filtration requires the evaluation condition and is not detected by gr alone.

### The Beilinson heart is the category of complexes

**Comparison — `TauCeti.DerivedDeRham.beilinsonHeart`**

The Beilinson heart is equivalent to the abelian category Ch(A) of actual unbounded cochain complexes. A complex M• maps to its stupid filtration F^i=M≥i with gr^iF=M^i[−i]. Conversely H^i(gr^iF) are its terms, and the connecting maps of adjacent cofibres give a differential squaring to zero. Acyclic complexes can be nonzero in this heart.

**Node:** `DerivedDeRhamCohomology:DD.1/beilinson-heart`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `mathlib:CochainComplex.of`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 5.4 and Remark 5.5. The equivalence retains actual complexes, not their derived isomorphism classes. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix D, Remark D.4. The differential is a connecting map between graded pieces.

**Construction or proof route.**

1. Extract the terms and differential from the coherent consecutive filtration triangles.
2. Use the octahedral/coherent square to prove the differential squares to zero.
3. Construct the inverse stupid filtration and verify equivalence termwise, including exactness.

**Acceptance checks.**

- The acyclic complex [A→A] with identity differential remains a nonzero heart object.

### Ext groups in the category of complexes

**Theorem — `TauCeti.DerivedDeRham.complexHeartExt`**

For ordinary A-modules M,N regarded as cochain complexes in degree zero and integers i≥0,c, Ext^i_(Ch(A))(M,N[c])=0 if c>0, while for c≤0 it is naturally Ext^(i+c)_A(M,N). This is BMS2 Proposition 5.6; it is not an Ext computation in D(A) after quotienting acyclic complexes.

**Node:** `DerivedDeRhamCohomology:DD.1/complex-heart-ext`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/beilinson-heart`, `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 5.6 and proof, p.236. The graded dual-number resolution gives the shift-dependent Ext formula.

**Construction or proof route.**

1. Identify Ch(A) with graded modules over the square-zero algebra A[ε]/ε² with ε of grading +1.
2. Resolve A by the infinite ε-resolution and compute the graded derived Hom into N[c].
3. Read off the zero range c>0 and the corrected exponent i+c from RHom_A(M,N)[c]; the printed i−c in the stated proposition is a recorded source misprint.

**Acceptance checks.**

- For a field k, Ext¹_(Ch(k))(k,k[−1])=k, represented by the identity differential two-term complex; the printed exponent i−c would incorrectly give Ext²_k(k,k)=0.

### The weak Postnikov tower lemma

**Theorem — `TauCeti.DerivedDeRham.weakPostnikovTowers`**

Let S be connective and K∈D(S) have a weak Postnikov tower K_n with K≃Rlim_nK_n and fibre(K_n→K_(n−1)) n-connective in homological grading. For an exact t-exact functor F:D(S)→D(S′), the canonical map F(K)→Rlim_nF(K_n) is an equivalence. The uniform connectivity of the fibres is essential; t-exactness does not assert preservation of every inverse limit.

**Node:** `DerivedDeRhamCohomology:DD.1/weak-postnikov-towers`. **Direct prerequisites:** `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 3.3 and proof, pp.217–218. Connectivity makes the inverse-limit discrepancy invisible in every fixed truncation.

**Construction or proof route.**

1. The fibre of K→K_n has connectivity tending to infinity by the Postnikov hypothesis.
2. Exactness and t-exactness preserve these connectivity estimates after F.
3. For each degree choose n large enough, identify both sides with F(K_n) on that degree and use completeness of the ordinary module t-structure.

**Acceptance checks.**

- The lemma does not justify commuting an arbitrary functor with an arbitrary tower.

### Valid exchanges of completion and derived operations

**Theorem — `TauCeti.DerivedDeRham.completionExchanges`**

Derived ideal and filtered completion are exact and commute with limits on complete objects through their reflector descriptions. A perfect A-complex P satisfies P⊗^L_A Λ_I M≃Λ_I(P⊗^L_A M). A filtered colimit in the complete category is completed after the raw colimit. For a uniformly cohomologically bounded-below cosimplicial diagram, filtered colimits commute with its totalization degreewise; the connectivity bound is necessary. The Milnor exact sequence 0→lim¹ H^(j−1)M_n→H^j(Rlim M_n)→lim H^jM_n→0 retains the derived-limit term.

**Node:** `DerivedDeRhamCohomology:DD.1/completion-exchanges`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `mathlib:DerivedCategory.isIso_iff`.

**Sources:** [The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf), §93 and §95; completion and Milnor computations. Completion uses derived inverse limits and finite perfect duality. [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Example 5.12 and Lemma 3.3. Uniform connectivity is the stated reason for the colimit/totalization exchange. [Owen Gwilliam and Dmitri Pavlov, Enhancing the filtered derived category](https://arxiv.org/pdf/1602.01515v3), Lemma 2.9 and Proposition 2.14. The filtered completion comparison uses limits of fibres.

**Construction or proof route.**

1. Use finite perfect duality to commute P⊗− with the Čech RHom completion.
2. Use the universal property for completed colimits, rather than commuting raw colimits with a right adjoint.
3. In each cohomological degree, a uniformly bounded-below totalization uses finitely many cosimplicial columns; then filtered colimits commute with finite limits.
4. Apply the EDS Milnor sequence and the corrected BO tower replacement: termwise surjective replacement maps need surjectivity of the original transition maps.

**Acceptance checks.**

- The p-completion of Q_p/Z_p is Z_p[1].
- For the tower Z→Z→… with maps multiplication by p, lim=0 but lim¹≃Z_p/Z, so its Rlim has nonzero H¹.

### What keeps DD.1 open

- Noetherian and weak-proregular completion proof: The principal bounded-torsion proof and regular-sequence Koszul model are checked. BS Footnote 5 cites Artin–Rees for arbitrary finite ideals in Noetherian rings. Its complete pro-zero proof, and a general weak-proregular variant outside these ranges, are not yet decomposed; no such variant is used without that hypothesis.
- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.

## DD.2 — Derived de Rham and Hodge completion

Ordinary differential algebra is constructed before any realization. Present forms by symbols b₀ db₁ ∧ … ∧ db_n, impose additive/base-linear, Leibniz, base-constant and diagonal-alternation relations, and differentiate the coefficient. Diagonal relations themselves must vanish at characteristic two. Prove that the free differential kills all relations, then descend it to the exterior-power carrier. The elementary formula gives uniqueness, square zero and the graded Leibniz identity. Semilinear pullback agrees in degree one with the pinned Tau Ceti Kähler map and becomes a map of A-complexes.

The ordinary universal property uses strictly graded-commutative differential algebras with odd squares zero, including at two. Polynomial base change and tensor decomposition provide the signed model for derived base change. Extend the polynomial filtered functor by the animation universal property and direct-sum realization. Multiplication and the differential are formed before realization; cohomology of a resolution is not substituted for its chain-level differential.

The decreasing Hodge graded piece is L∧^i L[−i]. Hodge completion is a separate quotient limit with the same graded pieces. Derived p-completion gives another object, and continuous formal differentials are constructed from a completely smooth lift. The smooth nilpotent-p, rational Hodge-completed and formal p-completed comparisons are separate statements. Q[t,t⁻¹] detects the false unrestricted uncompleted rational comparison. F_p[t]/(t²) detects omission of the conormal divided-power terms and the cohomological shift.

Transitivity first filters by base forms. Its boundaries encode the Gauss–Manin connection, so a list of graded pieces cannot supply a splitting. Bhatt's relative conjugate filtration is a second construction with Frobenius-descent coefficients and the actual B → B^(1) scalar-extension map. Scheme and formal objects are constructed from descent of finite Hodge quotients and their specified completions. Their global complexes are base-ring-linear, while their Hodge pieces are coherent modules on the scheme. Recovering a raw uncompleted affine value requires the restricted descent theorem, not an arbitrary unbounded-totalization exchange.

### Target coverage

- Ordinary differential, diagonal alternation at two, functorial dg algebra and universal property: symbol-relations, symbol-map, ordinary-differential, ordinary-de-rham-complex, ordinary-complex-map, ordinary-base-change-kunneth, ordinary-de-rham-universal-property.
- Coherent uncompleted realization, Hodge pieces and singular divided-power test: polynomial-resolution-derham, hodge-graded-pieces, singular-hypersurface-hodge.
- Distinct Hodge/p/formal completions and scope of smooth comparison: hodge-completed-derham, p-completed-derham, formal-ordinary-derham, smooth-de-rham-comparison, characteristic-zero-completion-boundary.
- Base change, transitivity, descent and scheme/formal sheaves: derived-base-change-kunneth, de-rham-transitivity, de-rham-sheaves.

**Atlas planets:** Algebraic de Rham differential; Ordinary de Rham complex; Derived de Rham cohomology; Hodge filtration; Hodge-completed derived de Rham.

### Relations for ordinary differential symbols

**Definition — `TauCeti.DeRham.symbolRelations`**

Let Sₙ be the free A-module on pairs (c,v) with c∈B and v:{1,…,n}→B, written [c;v]. Define Rₙ⊂Sₙ as the A-span of six families: [c+e;v]−[c;v]−[e;v]; [ac;v]−a[c;v] for a∈A; slot additivity [c;v(i↦x+y)]−[c;v(i↦x)]−[c;v(i↦y)]; slot Leibniz [c;v(i↦xy)]−[cx;v(i↦y)]−[cy;v(i↦x)]; [c;v(i↦a)] for a∈A; and [c;v] when v_i=v_j with i≠j. There is no B-linearity requirement in the coefficient before applying d.

**Node:** `DerivedDeRhamCohomology:DD.2/symbol-relations`. **Direct prerequisites:** `mathlib:KaehlerDifferential.kerTotal`, `mathlib:exteriorPower.presentation`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use the existing Finsupp free A-module and Submodule.span.
2. The first two families express the coefficient B as an A-module; the next three are the pinned KaehlerDifferential.kerTotal relations in a slot; the last is strict alternation.
3. For n=0 only the coefficient relations remain. Repeated slots vanish in characteristic two without dividing by 2.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.symbolRelations_eq_span` (characterisation). Rₙ is exactly the A-span of the six explicitly displayed relation families.
- `TauCeti.DeRham.symbolRelations_coeff_add` (relation). Coefficient additivity belongs to Rₙ.
- `TauCeti.DeRham.symbolRelations_slot_mul` (relation). The slot Leibniz relation belongs to Rₙ for every slot.

**Unit tests.**

- `TauCeti.DeRham.test_relations_degree_zero` (degenerate). The degree-zero relation [0;()] belongs to R₀.
- `TauCeti.DeRham.test_relations_constant_slot` (computation). A differential slot filled with an element from A is zero in the quotient.
- `TauCeti.DeRham.test_relations_diagonal_char_two` (non-example). Over F₂, the diagonal degree-two symbol is itself a relation, not merely twice that symbol.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Evaluation of differential symbols

**Construction — `TauCeti.DeRham.symbolMap`**

Define qₙ:Sₙ→Ωⁿ as the A-linear map [c;v]↦c·Dv₁∧…∧Dvₙ. In degree zero it sends [c;()] to c under Ω⁰≃B.

**Node:** `DerivedDeRhamCohomology:DD.2/symbol-map`. **Direct prerequisites:** `mathlib:Finsupp.linearCombination`, `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.zeroEquiv`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Apply Finsupp.linearCombination over A to the displayed family in the existing exterior power.
2. Use exteriorPower.ιMulti and the universal derivation; do not construct a second module of forms.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.symbolMap_single` (simp). qₙ([c;v])=c Dv₁∧…∧Dvₙ.
- `TauCeti.DeRham.symbolMap_add` (simp). qₙ is additive.
- `TauCeti.DeRham.symbolMap_smul` (simp). For a∈A, qₙ(a s)=a qₙ(s).

**Unit tests.**

- `TauCeti.DeRham.test_symbolMap_zero_degree` (compatibility). Evaluation in weight zero agrees with the existing zeroEquiv.
- `TauCeti.DeRham.test_symbolMap_one_degree` (compatibility). Evaluation in weight one agrees with c times the universal derivation.
- `TauCeti.DeRham.test_symbolMap_repeated` (computation). The image of [c;x,x] is zero in every characteristic.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Differential symbols generate all forms

**Lemma — `TauCeti.DeRham.symbolMap_surjective`**

The map qₙ is surjective for every n≥0; equivalently the forms c Dv₁∧…∧Dvₙ span Ωⁿ as an A-module.

**Node:** `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/symbol-map`, `mathlib:KaehlerDifferential.span_range_derivation`, `mathlib:exteriorPower.ιMulti_span_of_span`, `mathlib:exteriorPower.zeroEquiv`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. For n=0 use exteriorPower.zeroEquiv.
2. For n>0 use KaehlerDifferential.span_range_derivation and exteriorPower.ιMulti_span_of_span to write every form as a finite B-linear combination of wedges of exact one-forms.
3. Each B coefficient is part of the symbol index c, so this is an A-linear combination of qₙ-images, without asserting that the exact one-forms alone span over A.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The differential-symbol presentation

**Lemma — `TauCeti.DeRham.symbolRelations_ker`**

For every n, ker(qₙ)=Rₙ. Thus Sₙ/Rₙ is canonically Ωⁿ as an A-module, including n=0.

**Node:** `DerivedDeRhamCohomology:DD.2/symbol-relations-kernel`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/symbol-relations`, `DerivedDeRhamCohomology:DD.2/symbol-map`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:KaehlerDifferential.quotKerTotalEquiv`, `mathlib:exteriorPower.presentation`, `mathlib:Submodule.liftQ`, `mathlib:Module.Presentation.restrictScalars`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Check qₙ kills each relation using Derivation.leibniz, vanishing on A, and strict alternation. This proves Rₙ⊂ker(qₙ).
2. For the reverse containment, use the existing Kähler presentation separately in each slot and the existing exterior-power presentation. Their composite B-linear presentation has generators Dv₁∧…∧Dvₙ and relations slot additivity, slot Leibniz, constants and alternation.
3. Restrict scalars by replacing each B coefficient with an index c and imposing coefficient additivity and A-scalar relations. This is the standard free-module restriction-of-scalars presentation: a map out is an additive A-linear family in c satisfying exactly the four slot relation families.
4. The two successive quotient universal properties identify Sₙ/Rₙ with Ωⁿ. In degree zero the same argument is simply the presentation of B as an A-module. Riou’s direct-presentation proof is a design reference; the missing general presentation combinator is not cited as baseline.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check both kernel inclusions, not just that the listed relations map to zero.
- In characteristic two keep diagonal alternation; antisymmetry alone is insufficient.

### Differentiating a free differential symbol

**Construction — `TauCeti.DeRham.freeDifferential`**

Define δₙ:Sₙ→Ωⁿ⁺¹ as the A-linear map [c;v]↦Dc∧Dv₁∧…∧Dvₙ. This uses the coefficient as the first slot, with positive sign.

**Node:** `DerivedDeRhamCohomology:DD.2/free-symbol-differential`. **Direct prerequisites:** `mathlib:Finsupp.linearCombination`, `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use Finsupp.linearCombination over A and prepend Dc to the n-tuple of universal differentials.
2. No quotient descent or B-linearity is built into this free map.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.freeDifferential_single` (simp). δₙ([c;v])=Dc∧Dv₁∧…∧Dvₙ.
- `TauCeti.DeRham.freeDifferential_add` (simp). The free differential preserves sums.
- `TauCeti.DeRham.freeDifferential_smul` (simp). The free differential is A-linear on free-module coefficients.

**Unit tests.**

- `TauCeti.DeRham.test_freeDifferential_unit` (degenerate). Symbols with coefficient one have zero differential.
- `TauCeti.DeRham.test_freeDifferential_zero_degree` (compatibility). In weight zero the free differential agrees with D after oneEquiv.
- `TauCeti.DeRham.test_freeDifferential_diagonal` (computation). δ₁([x;x])=Dx∧Dx=0.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The free differential kills every relation

**Lemma — `TauCeti.DeRham.freeDifferential_relations`**

For every n, Rₙ⊂ker(δₙ), so δₙ depends only on the represented ordinary form.

**Node:** `DerivedDeRhamCohomology:DD.2/free-differential-relations`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/symbol-relations`, `DerivedDeRhamCohomology:DD.2/free-symbol-differential`, `mathlib:Derivation.leibniz`, `mathlib:Derivation.map_algebraMap`, `mathlib:AlternatingMap.map_eq_zero_of_eq`, `mathlib:AlternatingMap.map_swap`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. A-span induction reduces to the six relation families. Coefficient additivity and A-linearity follow from the universal derivation; slot additivity and constant slots follow from its corresponding identities.
2. For a slot product xy, expand D(xy), D(cx) and D(cy). Terms involving Dc cancel directly. The remaining c·Dx∧Dy terms cancel after exchanging the leading and specified slot; retain the sign and use antisymmetry deduced from strict alternation.
3. For a repeated slot the output still has two identical differential slots, so it is zero. No division by 2 is used.
4. This is the direct-symbol version of the relation computation in Stacks and the final descent proof in Riou’s proposed d.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The ordinary de Rham differential

**Construction — `TauCeti.DeRham.d`**

For every n≥0 define dₙ:Ωⁿ→Ωⁿ⁺¹, A-linear, as the descent of δₙ along qₙ. It is characterised by dₙ(c Dv₁∧…∧Dvₙ)=Dc∧Dv₁∧…∧Dvₙ. The scalar ring is A; in general it is not B-linear.

**Node:** `DerivedDeRhamCohomology:DD.2/ordinary-differential`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/symbol-relations-kernel`, `DerivedDeRhamCohomology:DD.2/free-differential-relations`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:Submodule.liftQ`, `mathlib:exteriorPower.oneEquiv`, `mathlib:KaehlerDifferential.polynomialEquiv_D`, `mathlib:Polynomial.derivative_X`, `mathlib:KaehlerDifferential.mvPolynomialBasis`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use the kernel equality and annihilation of relations to descend δₙ to Sₙ/Rₙ by Submodule.liftQ.
2. Use the surjective presentation qₙ to transport the descended map to Ωⁿ.
3. The displayed generator formula and uniqueness follow from the same quotient universal property; the next lemma promotes the formula for subsequent proofs.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.d_add` (simp). dₙ(α+β)=dₙα+dₙβ.
- `TauCeti.DeRham.d_base_smul` (simp). For a∈A, dₙ(aα)=a dₙα.
- `TauCeti.DeRham.d_zero_degree` (compatibility). Transport d₀ along Ω⁰≃B and Ω¹≃Ω to recover the pinned universal derivation.

**Unit tests.**

- `TauCeti.DeRham.test_d_base_constant` (degenerate). The differential of the image of a base-ring constant is zero.
- `TauCeti.DeRham.test_d_polynomial_X` (non-example). The differential of X in Z[X] over Z is nonzero, so the zero operator fails.
- `TauCeti.DeRham.test_d_polynomial_X_char_two` (non-example). The differential of X in F₂[X] over F₂ is still nonzero.
- `TauCeti.DeRham.test_d_two_variables` (computation). In Z[X,Y], d(X dY)=dX∧dY and this two-form is nonzero. This detects a zero positive-degree differential and fixes the leading-slot sign.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Differential of an elementary form

**Lemma — `TauCeti.DeRham.d_elementary`**

dₙ(c Dv₁∧…∧Dvₙ)=Dc∧Dv₁∧…∧Dvₙ, for every n including zero.

**Node:** `DerivedDeRhamCohomology:DD.2/differential-generator-formula`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/ordinary-differential`, `DerivedDeRhamCohomology:DD.2/symbol-map`, `DerivedDeRhamCohomology:DD.2/free-symbol-differential`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Evaluate the quotient lift defining d on a single free symbol.
2. Use qₙ([c;v])=c Dv₁∧…∧Dvₙ and the definition of δₙ.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Uniqueness from elementary forms

**Lemma — `TauCeti.DeRham.d_unique`**

An A-linear map Ωⁿ→Ωⁿ⁺¹ satisfying the displayed elementary-form rule equals dₙ.

**Node:** `DerivedDeRhamCohomology:DD.2/differential-uniqueness`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/differential-generator-formula`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Precompose both maps with the surjection qₙ.
2. Free-module extensionality and the elementary-form formula make the composites equal; cancel the surjection.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The de Rham differential squares to zero

**Lemma — `TauCeti.DeRham.d_squared`**

For every n, dₙ₊₁∘dₙ=0 as an A-linear map Ωⁿ→Ωⁿ⁺².

**Node:** `DerivedDeRhamCohomology:DD.2/differential-square-zero`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:Derivation.map_one_eq_zero`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Reduce to elementary forms using qₙ-surjectivity.
2. After one application, the result is an elementary (n+1)-form with coefficient one.
3. A second application inserts D1=0 and therefore vanishes by multilinearity.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The graded Leibniz identity

**Lemma — `TauCeti.DeRham.d_leibniz`**

For α∈Ωᵐ and β∈Ωⁿ, d(α∧β)=dα∧β+(−1)ᵐα∧dβ. The product is the existing graded multiplication of the exterior algebra.

**Node:** `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:Derivation.leibniz`, `mathlib:ExteriorAlgebra.gradedAlgebra`, `mathlib:AlternatingMap.map_swap`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use bilinearity and the symbol surjection to reduce both factors to elementary forms c Dx₁∧…∧Dxₘ and e Dy₁∧…∧Dyₙ.
2. Their product has coefficient ce. Expand D(ce)=c De+e Dc.
3. The e Dc term is dα∧β; move De through m one-forms to obtain the sign (−1)ᵐ in the other term. Strict alternation makes this valid also in characteristic two.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The ordinary algebraic de Rham complex

**Construction — `TauCeti.DeRham.complex`**

Define Ω•_(B/A) as the nonnegative cochain complex of A-modules with degree n object Ωⁿ and differential dₙ. Its multiplication is the existing wedge product and satisfies the graded Leibniz identity. This is the ordinary complex, not a claim of a derived smooth comparison in characteristic zero.

**Node:** `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/ordinary-differential`, `DerivedDeRhamCohomology:DD.2/differential-square-zero`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`, `mathlib:CochainComplex.of`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Package the modules and differential with CochainComplex.of using d²=0.
2. Record the adjacent differential and the zero maps between nonadjacent degrees.
3. The previously proved graded Leibniz identity equips the concrete complex with its multiplicative compatibility. An enhanced commutative algebra model is a separate inherited prerequisite.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.complex_d_apply` (data). The adjacent differential of Ω• is dₙ.
- `TauCeti.DeRham.complex_d_nonadjacent` (simp). Every nonadjacent differential is zero.
- `TauCeti.DeRham.complex_X` (data). The object in degree n is the existing module Ωⁿ, restricted to A.

**Unit tests.**

- `TauCeti.DeRham.test_complex_degree_zero` (compatibility). The first arrow agrees with the universal derivation after the existing degree-one equivalence.
- `TauCeti.DeRham.test_complex_two_steps` (computation). The first two arrows compose to zero on each b.
- `TauCeti.DeRham.test_complex_base_ring` (degenerate). Over A→A the first differential is zero.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Pullback of ordinary differential forms

**Construction — `TauCeti.DeRham.pullback`**

For an A-algebra homomorphism f:B→C, extend the pinned KaehlerDifferential.mapSemilinear to f-semilinear maps f*ₙ:Ωⁿ_(B/A)→Ωⁿ_(C/A). On elementary forms, c Dv₁∧…∧Dvₙ maps to f(c)D(fv₁)∧…∧D(fvₙ). These are A-linear as well, but in general are not B-linear for an unrelated B-action on C.

**Node:** `DerivedDeRhamCohomology:DD.2/forms-pullback`. **Direct prerequisites:** `tauceti:KaehlerDifferential.mapSemilinear`, `tauceti:KaehlerDifferential.mapSemilinear_D`, `mathlib:exteriorPower.alternatingMapLinearEquiv`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use Tau Ceti’s semilinear map on one-forms. Locally equip C and its forms with the B-action through f.
2. The exterior universal property gives the map on forms; discard the local algebra instance and package the scalar law as f-semilinearity.
3. Prove elementary evaluation using the existing one-form generator formula. Degree zero is f and degree one is the pinned semilinear map.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.pullback_smul` (compatibility). Pullback is f-semilinear in B-scalars.
- `TauCeti.DeRham.pullback_base_smul` (compatibility). Pullback is linear in A-scalars.
- `TauCeti.DeRham.pullback_add` (simp). Pullback preserves sums of forms.

**Unit tests.**

- `TauCeti.DeRham.test_pullback_zero_degree` (compatibility). Degree-zero pullback agrees with f under the existing zero equivalence.
- `TauCeti.DeRham.test_pullback_one_degree` (compatibility). Degree-one pullback agrees with the pinned Kaehler mapSemilinear.
- `TauCeti.DeRham.test_pullback_identity_two` (computation). The identity fixes an arbitrary degree-two form.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Pullback commutes with the differential

**Lemma — `TauCeti.DeRham.pullback_d`**

For every A-algebra map f:B→C and n, f*ₙ₊₁(dₙω)=dₙ(f*ₙω).

**Node:** `DerivedDeRhamCohomology:DD.2/pullback-differential`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use A-linearity and qₙ-surjectivity to reduce to elementary forms.
2. Both sides are D(f(c))∧D(f(v₁))∧…∧D(f(vₙ)) by elementary pullback and the differential formula.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Pullback preserves wedge products

**Lemma — `TauCeti.DeRham.pullback_wedge`**

For every A-algebra homomorphism f, f*(α∧β)=f*α∧f*β, with the existing exterior products.

**Node:** `DerivedDeRhamCohomology:DD.2/pullback-wedge`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:ExteriorAlgebra.gradedAlgebra`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use the exterior universal property, or reduce both factors to elementary forms and apply multiplicativity of f to their coefficient product.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Identity pullback

**Lemma — `TauCeti.DeRham.pullback_id`**

For every n, pullback along id_B is the identity on Ωⁿ.

**Node:** `DerivedDeRhamCohomology:DD.2/pullback-identity`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Reduce to elementary forms by the symbol surjection, and use the identity/composition law of the algebra homomorphisms.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Composition of pullbacks

**Lemma — `TauCeti.DeRham.pullback_comp`**

For f:B→C and g:C→E of A-algebras, pullback along g∘f equals g*∘f* in every degree.

**Node:** `DerivedDeRhamCohomology:DD.2/pullback-composition`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Reduce to elementary forms by the symbol surjection, and use the identity/composition law of the algebra homomorphisms.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### The functorial map of ordinary de Rham complexes

**Construction — `TauCeti.DeRham.complexMap`**

An A-algebra homomorphism f:B→C induces a morphism Ω•_(B/A)→Ω•_(C/A) in CochainComplex(ModuleCat A), whose degree-n map is f*ₙ. These maps preserve identities, composition and wedge multiplication.

**Node:** `DerivedDeRhamCohomology:DD.2/ordinary-complex-map`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/pullback-differential`, `DerivedDeRhamCohomology:DD.2/pullback-wedge`, `DerivedDeRhamCohomology:DD.2/pullback-identity`, `DerivedDeRhamCohomology:DD.2/pullback-composition`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use the A-linearity of pullback to form ModuleCat A morphisms degree by degree.
2. The chain-map square is pullback-differential. Identity and composition follow from their promoted degreewise lemmas. Wedge compatibility uses pullback-wedge.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**API contract.**

- `TauCeti.DeRham.complexMap_apply` (data). The degree-n component is pullback f n.
- `TauCeti.DeRham.complexMap_id` (functoriality). The complex map of id is the identity.
- `TauCeti.DeRham.complexMap_comp` (functoriality). The complex map of g∘f is the categorical composite of the two complex maps.

**Unit tests.**

- `TauCeti.DeRham.test_complexMap_constant` (computation). In degree zero, the complex map takes b to f(b).
- `TauCeti.DeRham.test_complexMap_identity` (degenerate). The identity map of B induces the identity in degree one.
- `TauCeti.DeRham.test_complexMap_d` (compatibility). The degree-one image of db is d(fb).

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### Pullback on elementary differential forms

**Lemma — `TauCeti.DeRham.pullback_elementary`**

Pullback sends c Dv₁∧…∧Dvₙ to f(c) D(fv₁)∧…∧D(fvₙ).

**Node:** `DerivedDeRhamCohomology:DD.2/pullback-elementary`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/forms-pullback`, `tauceti:KaehlerDifferential.mapSemilinear_D`.

**Sources:** [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks. [Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), DeRham.lean, presentationDifferentialsDown through deRhamComplex, head 5888c0081ba867ede5c60d3060f2d674d932b53c. An unmerged design lead supplies an independent direct-presentation proof of the same differential. Its proposed APIs are not baseline declarations.

**Construction or proof route.**

1. Use the one-form generator formula of KaehlerDifferential.mapSemilinear_D in each slot of the exterior lift, and its f-semilinearity on the coefficient.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

### De Rham cohomology from polynomial resolutions

**Construction — `TauCeti.DerivedDeRham.ofPolynomialResolution`**

For a map of animated commutative rings A→B, define dR_(B/A) by the sifted-colimit extension of the polynomial ordinary de Rham functor: for a free resolution P•→B use |Ω•_(P•/A)| with direct sums along antidiagonals. This is a coherent E∞ A-algebra with a decreasing multiplicative Hodge filtration, natural in the base square and independent of a free resolution. No derived Hodge completeness is imposed; its completion is a separate reflection. The construction is not the ordinary smooth de Rham complex over every base.

**Node:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-complex-map`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `DerivedDeRhamCohomology:DD.1/filtered-modules`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 2.1, its explanatory paragraph and Remark 2.2, p.5; extracted lines 239–256. The source specifies the totalization and explains its coherent resolution interpretation.

**Construction or proof route.**

1. Use the polynomial ordinary differential and functoriality already planned in this packet.
2. Apply the animation universal property to the polynomial filtered E∞-algebra functor; use direct-sum realization, not a product totalization.
3. Resolution comparison is the coherent sifted-colimit universal property. Extend the exterior multiplication and differential before realization.
4. The source assertion about arbitrary free resolutions is checked using this enhancement; the Illusie book proof remains a recorded gap, with both author errata applied.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**API contract.**

- `TauCeti.DerivedDeRham.map` (functoriality). A morphism of A-algebras induces a map of the coherent Hodge-filtered derived de Rham objects, with identity and composition coherences.
- `TauCeti.DerivedDeRham.resolutionEquiv` (equivalence). Two free simplicial resolutions of B give equivalent Hodge-filtered multiplicative objects; the comparison respects the augmentation and is coherent in maps of resolutions.
- `TauCeti.DerivedDeRham.hodgeFiltration` (data). The value Fil_H^i is the realization of the subcomplex of polynomial forms of degrees at least i, with decreasing transition maps and multiplication Fil_H^i⊗Fil_H^j→Fil_H^(i+j).

**Unit tests.**

- `TauCeti.DerivedDeRham.test_identity_algebra` (degenerate). For A→A, dR_(A/A) is A concentrated in degree zero.
- `TauCeti.DerivedDeRham.test_hodge_zero_quotient` (compatibility). For an ordinary A-algebra B, the degree-zero Hodge quotient gr_H^0 dR_(B/A) is B in degree zero.
- `TauCeti.DerivedDeRham.test_rational_laurent_boundary` (non-example). For Q→Q[t,t⁻¹], uncompleted dR is Q, whereas ordinary degree-one de Rham cohomology is Q·dt/t. The unrestricted uncompleted smooth comparison fails.

**Acceptance checks.**

- Identify the complex for a polynomial algebra in its permitted computation model.
- Make the direct-sum versus Hodge-completed construction explicit in the API and examples.

### Derived base change and Künneth

**Comparison — `TauCeti.DerivedDeRham.baseChangeKunneth`**

There are natural equivalences dR_(B⊗^L_A C/A)≃dR_(B/A)⊗^L_A dR_(C/A) and dR_(B/A)⊗^L_A C≃dR_(B⊗^L_A C/C). All tensor products, including the algebra pushout, are derived.

**Node:** `DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/ordinary-base-change-kunneth`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 2.7 and proof, p.6; extracted lines 313–323. The statement and proof expressly use derived tensor and reduction to polynomial resolutions.

**Construction or proof route.**

1. Check the polynomial-algebra identities by the decomposition of differential forms and the signed tensor differential.
2. Resolve B and C by free simplicial A-algebras.
3. Realize the polynomial identities and use the coherent colimit description of dR.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**Acceptance checks.**

- Test a Tor-independent polynomial square and a nonflat derived pushout.
- Do not replace B⊗^L_A C by B⊗_A C without a Tor calculation.

### Why Hodge completion matters

**Lemma — `TauCeti.DerivedDeRham.rationalCollapse`**

For a map of Q-algebras A→B the direct-sum (uncompleted) derived de Rham complex satisfies dR_(B/A)≃A (Corollary 2.5). Hence the uncompleted theory cannot be identified with ordinary de Rham cohomology of smooth Q-algebras: for B=Q[t,t^{−1}] over Q the ordinary de Rham complex has the nonzero class dt/t in degree one while dR_(B/Q)≃Q (the source states exactly this example in Remark 3.12, p.8). Remark 2.6 identifies the Hodge-completed complex (product totalisation) as the variant whose Hodge-to-de Rham spectral sequence converges and which 'specialises to classical de Rham cohomology for smooth maps'; that completed comparison is asserted there, not proved in the inspected range. Hodge completion and p-adic completion are distinct operations. In characteristic p the uncompleted smooth comparison dR_(B/A)≃Ω*_(B/A) for smooth maps of Z/p^n-algebras is a separate theorem (Corollary 3.10, p.8; statement and proof read in review R2, imported inputs unread), not a consequence of this node.

**Node:** `DerivedDeRhamCohomology:DD.2/characteristic-zero-completion-boundary`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `mathlib:LaurentPolynomial`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Corollary 2.5, proof and Remark 2.6, pp.5–6; extracted lines 290–310. The source proves collapse in characteristic zero and identifies Hodge completion as the relevant different variant, asserting (not proving) that the completed theory specialises to classical de Rham cohomology for smooth maps. [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Remark 3.12 and Corollary 3.10, p.8; extracted lines 428–446 (read in review R2). Remark 3.12 gives the Laurent-polynomial example verbatim; Corollary 3.10 states the uncompleted smooth comparison for Z/p^n-algebras that fails in characteristic zero, fixing the exact boundary DD.2 must respect.

**Construction or proof route.**

1. In every polynomial resolution degree, ordinary polynomial de Rham cohomology is A in degree zero and zero above.
2. The conjugate graded pieces therefore vanish above zero; use exhaustiveness/convergence to identify the uncompleted total complex with A.
3. In Q[t,t^{−1}], d(t^n)=n t^{n−1}dt for n≠0 and d kills constants, so t^{−1}dt is not exact and the ordinary degree-one class is nonzero; Remark 3.12 (p.8, lines 442–446) records this example ('a one-dimensional (usual) de Rham cohomology group of degree 1 (with generator dx/x), but no derived de Rham cohomology').
4. The one-variable integration calculation over Q is elementary; the arbitrary-polynomial tensor and filtered-colimit comparison still needs the ordinary Künneth input recorded in the gap.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**Acceptance checks.**

- Use the Laurent-polynomial example to prevent an unrestricted uncompleted-to-ordinary equivalence.
- Keep Hodge completion and p-completion as distinct operations.

### Ordinary polynomial base change and Künneth

**Theorem — `TauCeti.DerivedDeRham.ordinaryBaseChangeKunneth`**

For an ordinary base square A→A′, B′=B⊗_A A′, the ordinary differential graded de Rham algebra satisfies Ω•_(B/A)⊗_A A′≃Ω•_(B′/A′), with its ordinary tensor and Hodge filtration. For polynomial A-algebras B,C, Ω•_(B⊗_A C/A)≃Ω•_(B/A)⊗_AΩ•_(C/A), including the signed differential and degree-sum filtration. In the polynomial case these complexes are termwise flat, so the derived tensor computes the same object. The ordinary formula does not justify replacing a derived algebra pushout by an ordinary pushout outside Tor independence.

**Node:** `DerivedDeRhamCohomology:DD.2/ordinary-base-change-kunneth`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-complex-map`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`, `DerivedDeRhamCohomology:DD.2/forms-pullback`, `mathlib:KaehlerDifferential.D`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 2.7 proof, p.6. The source reduces derived base change and Künneth to these polynomial calculations.

**Construction or proof route.**

1. Use the Kähler universal property to identify base-changed one-forms and exterior powers.
2. For a polynomial tensor product split the coordinate differentials into the two sets; exterior multiplication gives the graded tensor isomorphism.
3. Check d(b⊗c)=db⊗c+b⊗dc and the signed Leibniz rule, then compare all Hodge filtration terms.

**Acceptance checks.**

- For A[x,y], d(x dy)=dx∧dy and dx∧dx=0 even at 2.
- The nonflat Z→F_p pushout is not substituted into the derived formula.

### The universal differential graded algebra

**Theorem — `TauCeti.DerivedDeRham.ordinaryDeRhamUniversalProperty`**

For an ordinary A-algebra B, Ω•_(B/A) is initial among nonnegatively graded strictly graded-commutative differential graded A-algebras D with odd squares zero and an A-algebra map B→D⁰. The unique dg map sends b to its degree-zero image and db to its differential, hence b₀ db₁∧…∧db_n to f(b₀)d f(b₁)…d f(b_n). The odd-square condition is part of the target even in characteristic 2.

**Node:** `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/symbol-relations-kernel`, `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/differential-square-zero`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`.

**Sources:** [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), §4, construction of the Hodge–Tate map after Lemma 4.10. The map uses the strict exterior/odd-square condition, including at 2. [The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, differential construction. The polynomial-form presentation supplies the universal differential.

**Construction or proof route.**

1. Factor the degree-one derivation through the pinned Kähler module.
2. Use the exterior universal property, imposing the diagonal square-zero relation.
3. Check the form generator formula intertwines differentials; uniqueness follows from the symbol presentation.

**Acceptance checks.**

- In F₂[x], the image of dx must square to zero; graded commutativity alone would not force this.

### Hodge graded pieces of derived de Rham

**Theorem — `TauCeti.DerivedDeRham.hodgeGradedPieces`**

For A→B animated, gr_H^i dR_(B/A)≃L∧^i_B L_(B/A)[−i] naturally as B-modules for every i≥0. The degree-zero quotient is B. The differential of the filtered algebra induces the universal derivation in the first Hodge boundary; the full de Rham differential is formed before realization, not defined only on cotangent homology.

**Node:** `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.1/filtered-modules`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix E, Construction E.2. The filtered polynomial left Kan extension has the derived exterior cotangent graded pieces.

**Construction or proof route.**

1. On a polynomial algebra, gr_H^i is Ω^i[−i], with B-linearity and zero internal de Rham differential.
2. Extend the polynomial identification through the same animation of modules and derived exterior powers.
3. Check multiplication matches the derived wedge product and weight zero recovers the augmentation.

**Acceptance checks.**

- For the regular hypersurface B=k[x]/x², the two-term cotangent model produces divided-power terms in arbitrarily high weights.

### Hodge-completed derived de Rham

**Construction — `TauCeti.DerivedDeRham.hodgeCompletedDerham`**

Define dR^hc_(B/A)=Rlim_i(dR_(B/A)/Fil_H^i), with its complete decreasing filtration as the DD.1 reflection of the Hodge-filtered object. The natural dR→dR^hc map is universal among maps to complete Hodge-filtered objects and leaves every graded piece L∧^i L_(B/A)[−i] unchanged. Hodge completion and p-completion are different operations.

**Node:** `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix E, Variant E.14 and Remark E.15. The inverse limit of Hodge quotients is a separate object from the uncompleted realization.

**Construction or proof route.**

1. Apply the DD.1 complete-filtered reflection to the Hodge diagram.
2. Identify its underlying object by the quotient tower and inherit its coherent E∞ multiplication.
3. Prove the universal map and graded formula using the reflection APIs, without an unjustified colimit/limit exchange.

**Uses that determine the API.**

- BL Appendix E; HQ.2 Hodge specialization; CC comparison maps: The universal completion is retained with its filtration and rational boundary.

**API contract.**

- `TauCeti.DerivedDeRham.hodgeCompletionMap` (constructor). The canonical filtered algebra map dR→dR^hc is the DD.1 reflection unit.
- `TauCeti.DerivedDeRham.hodgeCompletionGraded` (equivalence). gr_H^i dR^hc≃L∧^i L_(B/A)[−i].
- `TauCeti.DerivedDeRham.hodgeCompletionUniversal` (universal-property). Maps to complete Hodge-filtered algebras factor through dR^hc in the enhanced mapping space.
- `TauCeti.DerivedDeRham.hodgeCompletionFunctorial` (functoriality). The unit and completion are coherent in commutative base squares, with completed base-change comparisons under the separate stated hypotheses.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_hodge_complete_base` (degenerate). dR^hc_(A/A)=A.
- `TauCeti.DerivedDeRham.test_hodge_complete_rational_laurent` (computation). For Q[t,t⁻¹]/Q, the completed complex is ordinary de Rham, with H¹=Q·dt/t, whereas uncompleted dR=Q.
- `TauCeti.DerivedDeRham.test_hodge_complete_dual_numbers` (non-example). For R=F_p[x]/x², the Hodge filtration on uncompleted dR_(R/F_p) need not be complete; a complete object is not obtained merely by claiming its filtration is separated.

**Acceptance checks.**

- The singular dual-number example separates Hodge completeness from p-completeness.

### p-completed derived de Rham

**Construction — `TauCeti.DerivedDeRham.pCompletedDerham`**

For A→B define dR̂_(B/A)=Λ_(p)dR_(B/A)=Rlim_n(dR_(B/A)⊗^L_Z Z/p^n). Apply p-completion to every specified filtration term, and use completed tensor for its multiplication. A p-completed increasing conjugate diagram is not automatically exhaustive before a bounded-connectivity argument. For maps of p-completely flat bounded-torsion algebras the mod-p computation uses the ordinary reductions; general reductions are animated.

**Node:** `DerivedDeRhamCohomology:DD.2/p-completed-derham`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 8.1, Lemmas 8.2–8.3, pp.31–32. Derived p-completion is defined by the derived finite reductions. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix E, Variant E.3 and Remark E.4. The construction is insensitive to completing the rings.

**Construction or proof route.**

1. Complete the underlying algebra and each filtration using the ring/module completion agreement.
2. Compute modulo derived p^n using derived base change; reduction is Z/p^n tensor, not H⁰ followed by quotient.
3. Prove insensitivity to p-completion of the input from the mod-p equivalence and derived Nakayama; handle exhaustive conjugate limits only in the DD.5 bound.

**Uses that determine the API.**

- DD.4 p-adic comparison; DD.5 QSyn descent; AI.0 period interfaces: The derived finite reductions determine a p-complete algebra and filtered versions.

**API contract.**

- `TauCeti.DerivedDeRham.pCompletedDeRhamMod` (compatibility). The reduction of dR̂ modulo p^n is the derived de Rham reduction, compatibly in n.
- `TauCeti.DerivedDeRham.pCompletedDeRhamInputs` (equivalence). Completing A and B at p does not change the p-completed de Rham construction with the derived base-change conventions.
- `TauCeti.DerivedDeRham.pCompletedDeRhamKunneth` (equivalence). The base-change/Künneth comparison uses p-completed derived tensor and animated pushouts.
- `TauCeti.DerivedDeRham.pHodgeCompletionCommute` (compatibility). Applying p-completion and Hodge completion in either order gives the same specified quotient-limit object, since the relevant completion functors commute with limits.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_p_derham_identity` (degenerate). For A=A, dR̂_(A/A) is Λ_p A.
- `TauCeti.DerivedDeRham.test_p_derham_inverted` (non-example). For Q_p→Q_p, p-completed de Rham is zero, while Hodge-completed de Rham is Q_p.
- `TauCeti.DerivedDeRham.test_p_derham_fp_over_zp` (computation). For F_p/Z_p, dR̂ is the p-completed PD two-term model in DD.4, retaining the extra completed torsion summands in H⁰ and the actual two-term differential; it is not just Z_p.

**Acceptance checks.**

- Preserve derived p-torsion in completion; do not identify this with Hodge completion.

### The de Rham algebra of a completely smooth formal algebra

**Construction — `TauCeti.DerivedDeRham.formalOrdinaryDerham`**

Let A be p-complete with bounded p-power torsion and B a p-completely smooth p-complete A-algebra. Define continuous differentials Ω̂¹_(B/A)=L̂_(B/A) in degree zero, finite projective over B; define Ω̂^n=∧^n_BΩ̂¹ and the continuous differential by d(b₀db₁∧…∧db_n)=db₀∧…∧db_n. These form the p-complete ordinary de Rham dg algebra. Its universal property is among termwise p-complete strictly graded-commutative A-dg algebras with odd squares zero, continuous differential and a continuous map B→D⁰.

**Node:** `DerivedDeRhamCohomology:DD.2/formal-ordinary-derham`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/completely-smooth-algebraization`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), §1.2; §4 Hodge–Tate universal map after Lemma 4.10. The completely smooth formal de Rham algebra supplies the universal differential map used by Hodge–Tate comparison.

**Construction or proof route.**

1. Choose the smooth algebra lift from DD.1 and complete its ordinary differential algebra termwise.
2. Identify its completed differentials with L̂ and use finite projectivity to compare exterior powers and completion.
3. Extend the ordinary universal property to continuous maps by p-adic limits; retain the strict odd-square requirement at 2.
4. Glue affine formal algebras with the same continuous construction.

**Uses that determine the API.**

- PAPER-BHATT-SCHOLZE-22/102; PR.1 Hodge–Tate map: The formal ordinary universal differential and strict odd squares construct the actual Hodge–Tate map.

**API contract.**

- `TauCeti.DerivedDeRham.continuousDerivation` (data). The continuous derivation B→Ω̂¹ agrees with the completed polynomial universal derivation.
- `TauCeti.DerivedDeRham.formalDeRhamUniversal` (universal-property). A continuous degree-zero map into the stated dg target extends uniquely by b₀db₁…db_n↦f(b₀)df(b₁)…df(b_n).
- `TauCeti.DerivedDeRham.formalDeRhamMap` (functoriality). Continuous maps of completely smooth formal algebras induce the differential-algebra pullback.
- `TauCeti.DerivedDeRham.formalDeRhamReduction` (compatibility). Modulo p^n this is the ordinary smooth de Rham algebra of the corresponding finite reduction.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_formal_derham_base` (degenerate). For B=A, Ω̂¹=0 and the complex is A.
- `TauCeti.DerivedDeRham.test_formal_derham_coordinate` (computation). For B=Z_p⟨t⟩, d(t)=dt generates the finite projective continuous differential module.
- `TauCeti.DerivedDeRham.test_formal_derham_char_two_square` (non-example). Over a 2-complete base, (dt)²=0 in the exterior dg algebra; mere graded commutativity is insufficient.

**Acceptance checks.**

- The continuous cotangent module is not the unrestricted ordinary Ω¹ of the abstract complete ring.

### Smooth ordinary and completed de Rham comparisons

**Comparison — `TauCeti.DerivedDeRham.smoothDeRhamComparison`**

For a smooth map of Z/p^n-algebras with n≥1, uncompleted dR_(B/A)≃Ω•_(B/A). For smooth finitely presented Q-algebras, the Hodge-completed dR^hc_(B/A)≃Ω•_(B/A); the uncompleted dR_(B/A)≃A instead. For p-completely smooth bounded-torsion formal algebras, p-completed derived de Rham identifies with the continuous ordinary complex. Each equivalence preserves the indicated Hodge filtration and multiplication.

**Node:** `DerivedDeRhamCohomology:DD.2/smooth-de-rham-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.2/formal-ordinary-derham`, `DerivedDeRhamCohomology:DD.2/characteristic-zero-completion-boundary`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Corollary 3.10, Remarks 2.6 and 3.12. The smooth uncompleted comparison is restricted to the nilpotent-p range. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix E, Proposition E.12, Variant E.14. The completed comparison requires the specified completely flat and Cartier-smooth reductions.

**Construction or proof route.**

1. Over F_p compare conjugate graded pieces by smooth Cartier; use exhaustiveness.
2. Extend to Z/p^n via the finite p-filtration and derived base change, preserving Hodge terms.
3. For rational smooth maps compare Hodge graded pieces and apply complete graded conservativity; do not invoke the uncompleted comparison.
4. For the formal case reduce modulo p^n and take the derived limit using complete flatness and finite projective differentials.

**Acceptance checks.**

- Q[t,t⁻¹] distinguishes rational Hodge completion from uncompleted realization.
- No characteristic-p Hodge-to-de Rham degeneration theorem is asserted.

### Derived de Rham transitivity filtrations

**Theorem — `TauCeti.DerivedDeRham.deRhamTransitivity`**

For A→B→C animated construct the base-forms filtration on dR_(C/A), whose weight-i graded term is dR_(C/B)⊗^L_B L∧^i_B L_(B/A)[−i]. Its boundary maps encode the Gauss–Manin connection; it does not canonically split. Separately, for composable F_p-algebras, Proposition 3.22 gives an increasing relative conjugate filtration with gr_n=dR_(B/A)⊗^L_(B^(1)) Frob_A^*(L∧^n_B L_(C/B)[−n]), where Frob_A^* is extension along the base-change map B→B^(1), b↦b⊗1. This uses the Frobenius-descent connection. Finite Hodge quotients and specified completions retain the extension data; no unrestricted de Rham-with-coefficients theory is inferred from Remark 3.23.

**Node:** `DerivedDeRhamCohomology:DD.2/de-rham-transitivity`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`, `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/ordinary-base-change-kunneth`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.22 and Remark 3.23. The source constructs the relative conjugate filtration with Frobenius-descent coefficients; it is distinct from the base-forms Hodge filtration. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix E, Construction E.2. The common polynomial filtered construction supplies the Hodge transitivity filtration.

**Construction or proof route.**

1. For a composable polynomial pair filter absolute forms by the number of forms from the base B.
2. Compute the graded differential as the relative C/B differential; adjacent filtration boundaries give the connection.
3. Resolve the composable pair and realize; use the triangle exterior filtration to identify derived base forms.
4. For the relative conjugate variant use polynomial relative truncation, classical Cartier and the Frobenius-descent connection of Bhatt Lemma 3.24 before realization. For complete variants apply DD.1 reflection to the specified filtration, keeping its extension data.

**Acceptance checks.**

- For A→A[t]→A[t,u], the first base form is dt and relative form du; the wedge sign is fixed.
- Vanishing or splitting of graded pieces alone does not split the filtered complex.

### Derived de Rham on schemes and formal schemes

**Construction — `TauCeti.DerivedDeRham.deRhamSheaves`**

For a qcqs scheme X over an ordinary ring A, sheafify each finite Hodge quotient of the affine functor B↦dR_(B/A), then form its Hodge-completed quotient limit. It has gr_H^i=RΓ(X,L∧^i L_(X/A))[−i]. The uncompleted functor can be sheafified separately; recovering its raw affine values requires the particular uncompleted descent theorem and is not asserted for arbitrary unbounded flat totalizations. For p-adic formal schemes use the specified p-complete affine charts, derived reductions and Hodge/p-completions. Global de Rham is an A-linear complex with cup products; its full differential is not O_X-linear, although Hodge graded pieces are O_X-modules.

**Node:** `DerivedDeRhamCohomology:DD.2/de-rham-sheaves`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`, `DerivedDeRhamCohomology:DD.5/filtered-de-rham-descent`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Appendix B, Remark B.7–B.8; Appendix E, Proposition E.16. The affine enhanced construction extends by descent and coherent graded modules.

**Construction or proof route.**

1. Use affine flat/étale covers and the DD.5 descent theorem for each specified Hodge quotient.
2. Apply coherent descent to the cotangent exterior modules, then take RΓ and the quotient limits.
3. Glue E∞ multiplication and pullbacks via the enhanced descent equivalence, preserving the base ring and filtration.
4. For formal schemes use derived finite reductions and p-completion on affine charts before global totalization.

**Uses that determine the API.**

- DD.4 scheme comparison; DD.5 proper smooth control; CC/HQ global interfaces: The common affine functor and its specified completion glue to global cup products.

**API contract.**

- `TauCeti.DerivedDeRham.schemeDeRhamAffine` (equivalence). On Spec B the Hodge-completed global object is dR^hc_(B/A). Recovery of the p-completed uncompleted affine object uses the precise DD.5 relative/big-slice hypotheses.
- `TauCeti.DerivedDeRham.schemeDeRhamGraded` (compatibility). For Hodge-completed global de Rham, gr_H^i≃RΓ(X,L∧^iL_(X/A))[−i].
- `TauCeti.DerivedDeRham.schemeDeRhamPullback` (functoriality). A morphism over A induces coherent pullback preserving cup products and the Hodge filtration.
- `TauCeti.DerivedDeRham.formalDeRhamLimit` (characterisation). The p-completed formal object is the derived inverse limit of its finite reductions under the stated descent and bounded-torsion hypotheses.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_scheme_derham_affine_base` (degenerate). For X=Spec A over A the object is A, with no positive Hodge pieces.
- `TauCeti.DerivedDeRham.test_scheme_derham_affine_line` (computation). For X=Spec F_p[t], H¹ of ordinary smooth de Rham is F_p[t^p]·t^(p−1)dt.
- `TauCeti.DerivedDeRham.test_scheme_derham_product_boundary` (non-example). For X affine quasisyntomic of unbounded dimension, no finite-projective global-cohomology assertion follows from the sheaf construction.

**Acceptance checks.**

- On an affine scheme recover the Hodge-completed affine object; do not infer arbitrary uncompleted descent.
- For a separated two-affine cover, the Čech cup product agrees with the global product.

### Hodge pieces of a singular hypersurface

**Application — `TauCeti.DerivedDeRham.singularHypersurfaceHodge`**

For k=F_p and B=k[t]/(t²), the full cotangent complex is [B e --2t→ B dt] in degrees −1,0. Thus gr_H¹ dR_(B/k)=L_(B/k)[−1] has B e in degree zero and B dt in degree one. Its higher Hodge pieces are the derived exterior powers of this two-term complex, with divided powers of the degree −1 generator. For p=2 the displayed differential vanishes; replacing L by Ω¹ loses the nonzero degree-zero Hodge-weight-one term. This is a singular lci algebra, distinguished from the non-lci square-zero example.

**Node:** `DerivedDeRhamCohomology:DD.2/singular-hypersurface-hodge`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/derived-divided-powers`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`, `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), §3.3, regular quotient computations and Lemma 3.42. The regular quotient model and derived powers determine this explicit hypersurface test.

**Construction or proof route.**

1. Resolve B by the polynomial k[t] presentation and its regular element t².
2. Identify the conormal generator e and derivative d(t²)=2t dt in the transitivity complex.
3. Apply the Hodge graded formula with the cohomological [−1] shift.
4. Use the triangle-power filtration to retain divided powers in each higher weight.

**Acceptance checks.**

- At p=2 both terms survive in their distinct degrees.
- At odd p the differential is multiplication by 2t; its kernel and cokernel each contain the expected residue-field contribution.

### What keeps DD.2 open

- Resolution independence and complete rational comparison interiors: Bhatt states arbitrary-resolution independence with an Illusie reference and the rational Hodge-completed comparison in Remark 2.6. BL Appendix E supplies the animation/graded proof route. The complete corrected Illusie construction and filtered algebra coherence are not yet independently established from a checked supplier proof.
- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.
- Supplier SchemeAndStackFoundations:SF.0: Schemes, affine charts, proper/smooth finite-presentation morphism predicates and p-adic formal schemes; formal chart groundwork may need the early SF.4 extension, without subsequent arithmetic comparisons.
- Supplier SchemeAndStackFoundations:SF.4: The early formal-scheme and affine-chart prefix: p-adic formal spectra, compatible finite reductions, proper smooth finite-presentation formal schemes and their étale sites. No algebraization, alterations or late model-comparison theorem is an input to this prefix.

## DD.3 — Conjugate filtration and Cartier theory

The conjugate filtration is defined from cohomological truncations of polynomial de Rham complexes and then realized. It is increasing and exhaustive for the uncompleted construction. Its coefficient ring in characteristic p is B^(1) = B ⊗_(A,Frob_A)^L A, together with relative Frobenius to B. A Tor-dependent Frobenius twist cannot be replaced by an ordinary tensor; the dual-numbers example detects this loss.

Polynomial inverse Cartier is a coordinate calculation followed by tensor products and arbitrary polynomial colimits. The usual dt ↦ [t^(p−1)dt] formula then identifies the smooth relative Cartier map, even over imperfect fields. Animation gives gr_i^conj dR = L∧^i L_(B^(1)/A)[−i]. This is an isomorphism of graded pieces, rather than a canonical splitting of the filtration.

The exact-couple spectral sequence has E₁^(i,j) = H^j(L∧^i L), with total degree i+j. Each completed or global application carries a finite-contribution or derived-limit convergence argument. For regular quotients the conormal shift and exterior décalage cancel, leaving divided powers in degree zero. This supplies the PD-side comparison in DD.4 but does not reconstruct a PD envelope here.

The first conjugate extension is the W₂ lifting obstruction in Ext² after fixing the base lift. Compatible flat Z/p² lifts and Frobenius lifts produce the chosen multiplicative splitting of Proposition 3.17. Liftability is part of that theorem. None of these constructions asserts Hodge-to-de Rham degeneration for every smooth proper characteristic-p scheme or imports a degeneration theorem with its hypotheses removed.

### Target coverage

- Exhaustive conjugate construction and genuine Frobenius twist: conjugate-filtration, derived-frobenius-twist.
- Coordinate Cartier, arbitrary-field smooth Cartier and derived graded powers: polynomial-cartier-map, smooth-cartier, derived-cartier-graded-pieces, frobenius-linear-differential.
- Convergence, regular quotient calculation and lift-dependent obstruction/splitting: conjugate-spectral-sequence, regular-quotient-divided-powers, cartier-extension-obstruction, frobenius-lift-splitting.

**Atlas planets:** Conjugate filtration; Derived Frobenius twist; Polynomial Cartier isomorphism; Derived Cartier isomorphism; Cartier isomorphism; Conjugate spectral sequence.

### Frobenius-linear ordinary differential

**Lemma — `TauCeti.DeRham.d_frobenius_smul`**

Let p be prime and A→B a map of characteristic-p commutative rings. For every b∈B and ω∈Ωⁿ_(B/A), dₙ(bᵖω)=bᵖdₙω. Thus the ordinary differential is linear for the B-action through Frobenius, the algebraic input to the B^(1)-action.

**Node:** `DerivedDeRhamCohomology:DD.3/frobenius-linear-differential`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`, `mathlib:Derivation.leibniz_pow`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Notation 3.1, final paragraph, printed p.6. The source identifies the twisted module structure. The displayed scalar identity is its elementary polynomial-level proof, obtained from the pinned derivation power rule and graded Leibniz.

**Construction or proof route.**

1. The pinned power rule gives D(bᵖ)=p·b^(p−1)Db=0 in characteristic p.
2. Apply the degree-zero case of graded Leibniz to bᵖ times ω.

**Uses that determine the API.**

- Bhatt, Definition 2.1; DD.2 polynomial-resolution-derham: The affine ordinary complex and its functoriality are applied to each polynomial algebra in a coherent resolution.
- MotivicEtaleKTheory:M.5d differential-symbol construction: Ordinary d, its square-zero and Leibniz identities, and scalar-correct pullback supply the requested generic differential algebra; Milnor theory is never a prerequisite here.

**Acceptance checks.**

- For F₂[X]/F₂, d(X²)=0 although dX≠0.
- For arbitrary n, Frobenius scalar linearity is not ordinary B-linearity.

### The conjugate filtration

**Construction — `TauCeti.DerivedDeRham.conjugateFiltration`**

Construct Fil_i^conj dR_(B/A)=|τ≤i Ω•_(P•/A)| for i≥0, with Fil_−1=0, natural increasing maps, and colim_i Fil_i^conj≃dR_(B/A). Its graded piece is |H^i(Ω•_(P•/A))|[−i]. The filtration is multiplicative and is B^(1)-linear over F_p via Cartier; an exhaustive direct-sum realization is not an unrestricted completed or global convergence assertion.

**Node:** `DerivedDeRhamCohomology:DD.3/conjugate-filtration`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 2.3, proof and Remark 2.4, p.5; extracted lines 258–290. The proof constructs the filtration column by column and checks independence of the resolution.

**Construction or proof route.**

1. Filter each polynomial de Rham column by its canonical cohomological truncations.
2. Realize these filtered columns using direct-sum totalization.
3. Compare another free resolution through a homotopy equivalence; it induces homotopy equivalences on the simplicial cohomology columns.
4. Invoke the source general spectral-sequence construction for increasing exhaustive filtrations.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**API contract.**

- `TauCeti.DerivedDeRham.conjugateAt` (data). The ith stage is |τ≤i Ω•_(P•/A)|, with the canonical maps from truncation.
- `TauCeti.DerivedDeRham.conjugateInclusion` (functoriality). The map from stage i to stage j for i≤j is induced by cohomological truncation; the maps compose and are natural in A→B.
- `TauCeti.DerivedDeRham.conjugateColimit` (characterisation). The filtered homotopy colimit over i≥0 of these stages is dR_(B/A). This is an uncompleted exhaustiveness assertion.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_conjugate_identity` (degenerate). For A→A, stage zero is A and every successive positive graded piece is zero.
- `TauCeti.DerivedDeRham.test_conjugate_weight_zero` (compatibility). The zeroth graded piece is |H⁰(Ω•_(P•/A))|, with no cohomological shift.
- `TauCeti.DerivedDeRham.test_conjugate_rational` (computation). For Q→Q[t], every positive conjugate graded piece vanishes and stage zero is Q.

**Acceptance checks.**

- Retain a filtered object, e.g. in D(Fun(N,Mod_A)), rather than a filtration only on the final cohomology.
- Check that a map inducing equivalences on all conjugate graded pieces induces an equivalence of the uncompleted total objects.

### The derived Frobenius twist

**Definition — `TauCeti.DerivedDeRham.frobeniusTwist`**

For A→B of F_p-algebras define B^(1)=B⊗^L_(A,Frob_A) A, together with the relative Frobenius B^(1)→B. The derived de Rham complex and its conjugate filtration are naturally B^(1)-linear.

**Node:** `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`. **Direct prerequisites:** `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Notation 3.1 and following paragraph, p.6; extracted lines 331–353. The source defines precisely this derived pushout and states when it is underived. [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.5 statement, p.7; extracted lines 392–394. The B^(1)-linearity of the conjugate filtration is asserted in Proposition 3.5, not in Notation 3.1; Notation 3.1 only gives the B^(1)-module structure on dR_(B/A) via polynomial algebras (lines 352–353).

**Construction or proof route.**

1. Form the pushout of A→B and Frobenius A→A in animated commutative rings.
2. The polynomial Frobenius maps give its relative Frobenius into B, compatibly with both structural maps.
3. Ordinary tensor computes this pushout under the displayed Tor-vanishing condition. Its action on de Rham is supplied by the separate Cartier/action construction.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**API contract.**

- `TauCeti.DerivedDeRham.relativeFrobenius` (data). The canonical map B⊗^L_(A,Frob_A)A→B is induced at polynomial level by b⊗a↦bᵖf(a).
- `TauCeti.DerivedDeRham.twistMap` (functoriality). A map B→C of A-algebras induces B^(1)→C^(1) and a commuting square with the two relative Frobenius maps.
- `TauCeti.DerivedDeRham.twistUnderived` (compatibility). If Tor_i^A(B,Frob_*A)=0 for all i>0, the derived twist agrees with the ordinary tensor-product twist, compatibly with relative Frobenius.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_twist_base` (degenerate). For B=A, B^(1)=A⊗^L_(A,Frob_A)A is canonically A and the relative Frobenius is the identity under this identification.
- `TauCeti.DerivedDeRham.test_twist_polynomial` (computation). For B=F_p[t] over F_p, the derived twist is the ordinary polynomial algebra and relative Frobenius sends its coordinate t to tᵖ.
- `TauCeti.DerivedDeRham.test_twist_no_underived_shortcut` (non-example). Let A=F_p[ε]/ε² and B=F_p. For p≥2, Tor₁^A(B,Frob_*A) is nonzero (indeed isomorphic to Frob_*A as an A-module with ε acting by zero); therefore B^(1) has positive homotopy and cannot be replaced by its ordinary tensor product.

**Acceptance checks.**

- Keep the source and target structure maps in the Frobenius square.
- Test a case with nonzero higher Tor so that the twist cannot be replaced by its degree-zero ring.

### The polynomial Cartier map

**Theorem — `TauCeti.DerivedDeRham.polynomialCartier`**

For a free (polynomial) algebra F over an F_p-algebra A, construct the canonical isomorphism of F^(1)-modules C^{-1}:∧^k L_(F^(1)/A)≃H^k(Ω*_(F/A)) for every k, extending to a graded F^(1)-algebra isomorphism ⊕_k ∧^k L_(F^(1)/A)[−k]→⊕_k H^k(Ω*_(F/A))[−k] (for polynomial F^(1), ∧^k L_(F^(1)/A)=Ω^k_(F^(1)/A)). In one variable, applying the source recipe with the lift t↦t^p gives dt↦[t^{p−1}dt] in degree one; that formula is a consequence of the recipe and is not displayed in the source.

**Node:** `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Theorem 3.2, proof and Remark 3.3, p.7; extracted lines 355–385. The proof gives the divided Frobenius construction and the distinction between choices at chain and cohomology levels.

**Construction or proof route.**

1. Reduce the polynomial calculation to A=F_p by base change.
2. Choose a polynomial lift to W_2 and a compatible Frobenius lift.
3. Divide its action on one-forms by p and reduce modulo p; extend by exterior products.
4. Compute the one-coordinate de Rham complex, then tensor the coordinate calculations.
5. Use the source independence statement on cohomology; retain choice dependence of any chain-level decomposition.
6. The one-coordinate kernel/cokernel calculation, tensor-product decomposition and independence-of-lift comparison must be split into declaration-sized nodes before this inherited aggregate is complete; they are recorded in the Cartier gap.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**Acceptance checks.**

- Check the one-variable formula and the signed exterior-product formula.
- Distinguish a canonical Cartier isomorphism from a chosen formality equivalence.

### Derived Cartier graded pieces

**Theorem — `TauCeti.DerivedDeRham.conjugateGradedCartier`**

For every map A→B of F_p-algebras, gr^conj_i dR_(B/A)≃L∧^i L_(B^(1)/A)[−i], naturally as B^(1)-modules. The exterior power and Frobenius twist are derived.

**Node:** `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.5 and proof, p.7; extracted lines 392–408. The entire proof is the stated polynomial Cartier-to-cotangent realization chain.

**Construction or proof route.**

1. Use the conjugate-filtration description as the realization of H^i of polynomial de Rham complexes.
2. Apply the natural polynomial Cartier isomorphism in every simplicial degree.
3. Identify realization of the polynomial i-forms on the Frobenius-twisted resolution with L∧^i L_(B^(1)/A).
4. Realize the canonical cohomological Cartier maps to identify the graded B^(1)-modules with L∧^i L_(B^(1)/A)[−i]; use the independent spectral-sequence node for convergence.

**Uses that determine the API.**

- DerivedDeRhamCohomology:DD.4–DD.6: The same coherent filtered construction supplies crystalline, completed-descent and logarithmic extensions; the remaining list specifies the unbuilt comparisons.

**Acceptance checks.**

- Keep the shift [−i] and B^(1)-module structure.
- Do not substitute the untwisted cotangent complex or infer Hodge-to-de Rham degeneration.

### The classical smooth Cartier isomorphism

**Theorem — `TauCeti.DerivedDeRham.smoothCartier`**

For any F_p-algebra A and a smooth A-algebra B, inverse Cartier gives ∧^i_(B^(1))Ω¹_(B^(1)/A)≃H^i(Ω•_(B/A)), as B^(1)-modules and graded algebras. The ordinary Frobenius twist suffices here because B/A is flat. Over an arbitrary characteristic-p field this is the relative Cartier theorem, including imperfect fields and the actual relative twist.

**Node:** `DerivedDeRhamCohomology:DD.3/smooth-cartier`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.2/ordinary-base-change-kunneth`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Corollary 3.4 and proof, p.7. Étale localization of the polynomial coordinate calculation supplies smooth Cartier.

**Construction or proof route.**

1. Compute C⁻¹(dt)=[t^(p−1)dt] in each polynomial coordinate and tensor the coordinate calculations.
2. Use the étale-local polynomial presentation and naturality of Cartier to descend the map.
3. Keep the B^(1)-action and relative base Frobenius; the degree-zero map is the relative Frobenius.

**Acceptance checks.**

- For k[t], H⁰=k[t^p] and H¹=k[t^p]·t^(p−1)dt with the relative twist action.
- For imperfect k, Ω_(k/F_p) and Ω_(k/k)=0 are different base choices.

### The conjugate spectral sequence and convergence

**Construction — `TauCeti.DerivedDeRham.conjugateSpectralSequence`**

For A→B over F_p the increasing exhaustive filtration gives the exact-couple spectral sequence with E₁^(i,j)=H^(i+j)(L∧^i L_(B^(1)/A)[−i])=H^j(L∧^i L_(B^(1)/A)), abutting conditionally to H^(i+j)dR_(B/A). Strong convergence in a given degree is asserted when only finitely many filtration indices contribute there (for example a bounded smooth affine complex); alternatively state and prove the needed complete/lim¹ conditions. Global and completed variants retain their actual totalization and convergence hypotheses.

**Node:** `DerivedDeRhamCohomology:DD.3/conjugate-spectral-sequence`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 2.3 and Remark 2.4; Proposition 3.5. The source gives the exact-couple construction; completion alone does not imply global strong convergence. [Owen Gwilliam and Dmitri Pavlov, Enhancing the filtered derived category](https://arxiv.org/pdf/1602.01515v3), Proposition 2.18, pp.7–8. The spectral sequence depends on the cofiber diagram and is invariant under filtered completion.

**Construction or proof route.**

1. Construct the coherent exact couple from consecutive increasing filtration triangles.
2. Use derived Cartier to compute E₁ with the displayed cohomological indexing.
3. For each application prove finite contribution in a fixed total degree, or exhibit its completion and derived-limit obstruction groups.
4. Use DD.5’s uniformly bounded-below conjugate stages for the quasisyntomic descent totalization exchange.

**Uses that determine the API.**

- DD.3; DD.4 regular quotient comparison; DD.5 descent: Exact indexing and connectivity distinguish affine direct-sum convergence from completed/global claims.

**API contract.**

- `TauCeti.DerivedDeRham.conjugateSpectralE1` (data). E₁^(i,j)=H^j(L∧^iL_(B^(1)/A)).
- `TauCeti.DerivedDeRham.conjugateSpectralFunctorial` (functoriality). Base-compatible algebra maps induce maps of exact couples and spectral sequences.
- `TauCeti.DerivedDeRham.conjugateSpectralFiniteConvergence` (characterisation). Finite contribution in each total degree gives a separated exhaustive finite filtration on the abutment.
- `TauCeti.DerivedDeRham.conjugateSpectralCompletion` (compatibility). Filtered reflection leaves the cofiber exact couple unchanged; the abutment still requires its own convergence check.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_conjugate_spectral_base` (degenerate). For A→A, only E₁^(0,0)=A is nonzero.
- `TauCeti.DerivedDeRham.test_conjugate_spectral_line` (computation). For F_p[t]/F_p, weights 0,1 compute the classical Cartier modules in total degrees 0,1.
- `TauCeti.DerivedDeRham.test_conjugate_spectral_nonlci` (non-example). For B=F_p[x,y]/(x,y)², uncompleted dR has unbounded negative cohomology; a first-quadrant bounded smooth convergence argument cannot apply.

**Acceptance checks.**

- For B=F_p[t], the only nonzero weights are 0,1.
- For a singular quotient there may be infinitely many weights in a fixed degree; equality of graded pieces alone gives no arbitrary strong-convergence theorem.

### Regular quotient divided-power calculations

**Theorem — `TauCeti.DerivedDeRham.regularQuotientDividedPowers`**

Let A→B=A/I be a regular-sequence quotient of F_p-algebras. Put B^(1)=B⊗^L_(A,Frob_A)A; in the Tor-independent case this is A/(f₁^p,…,f_r^p). Then L_(B^(1)/A)≃(I^(1)/(I^(1))²)[1], and gr_i^conj dR_(B/A)≃Γ^i_(B^(1))(I^(1)/(I^(1))²), in degree zero. Hence dR_(B/A) is discrete by exhaustive realization. The eventual identification with the classical PD envelope is owned only by DD.4.

**Node:** `DerivedDeRhamCohomology:DD.3/regular-quotient-divided-powers`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Lemma 3.42 and Remark 3.43 and the regular quotient computation §§3.3. Shifted exterior powers become divided powers and determine the conjugate graded pieces.

**Construction or proof route.**

1. Apply derived Frobenius base change to the regular quotient resolution.
2. Use the regular quotient cotangent model and shifted-flat décalage.
3. Cancel the [i] and [−i] shifts; exhaustive increasing realization of degree-zero stages is discrete.
4. Retain the module bases needed by DD.4’s PD-side comparison, without rebuilding that comparison here.

**Acceptance checks.**

- For F_p[x]→F_p, the weight-i piece is rank one on a divided-power generator.
- A quotient by (x,y)² does not meet the regular-sequence hypothesis.

### The first conjugate extension and W₂ lifting

**Theorem — `TauCeti.DerivedDeRham.cartierExtensionObstruction`**

For A→B over F_p, the extension B^(1)→Fil₁^conj dR_(B/A)→L_(B^(1)/A)[−1] determines an Ext² obstruction class. Given a compatible W₂ lift of A, this is the obstruction to a compatible W₂ lift of the Frobenius-twisted B as in Bhatt Proposition 3.15. The first conjugate extension need not split; a canonical isomorphism of graded pieces does not supply a canonical splitting.

**Node:** `DerivedDeRhamCohomology:DD.3/cartier-extension-obstruction`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/square-zero-deformations`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.15 and Example 3.16, pp.9–10. The first extension is identified with the square-zero lifting obstruction.

**Construction or proof route.**

1. Extract the connecting map L_(B^(1)/A)→B^(1)[2] from the first filtration triangle.
2. Compare the polynomial divided-Frobenius construction with the W₂ square-zero extension class.
3. Identify the class under the cotangent derivation obstruction equivalence, retaining the chosen base lift.

**Acceptance checks.**

- A polynomial algebra with its standard W₂ lift has zero obstruction.
- Nonliftable examples in Bhatt Example 3.16 have a nonsplit first extension.

### A splitting from compatible Frobenius lifts

**Theorem — `TauCeti.DerivedDeRham.frobeniusLiftSplitting`**

If a map A→B of F_p-algebras has compatible flat Z/p² lifts and compatible lifts of the absolute Frobenius on both rings, these choices produce a multiplicative splitting dR_(B/A)≃⊕_(i≥0)L∧^iL_(B^(1)/A)[−i] of the conjugate filtration. The chain-level splitting depends on the lift data; the cohomological Cartier map is canonical. Liftability and Frobenius compatibility are retained.

**Node:** `DerivedDeRhamCohomology:DD.3/frobenius-lift-splitting`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.17 and proof, pp.10–11. The compatible Frobenius lift constructs the multiplicative splitting.

**Construction or proof route.**

1. Choose compatible polynomial resolutions over the flat W₂ lifts with their Frobenius lifts.
2. Divide Frobenius on one-forms by p and extend through exterior multiplication.
3. Realize the resulting maps and identify their conjugate graded maps as Cartier, giving the filtered splitting by exhaustiveness.

**Acceptance checks.**

- The standard lift t↦t^p gives the polynomial splitting.
- Without compatible Frobenius lift data, Cartier graded pieces do not imply a splitting or Hodge degeneration.

### What keeps DD.3 open

- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.

## DD.4 — Crystalline and period comparisons

Construct the comparison map on polynomial resolutions using the ordinary PD envelope and PD Poincaré inputs. It maps Hodge terms to crystalline PD terms and respects base-compatible maps and products. The map exists beyond the isomorphism range; the equivalence theorem requires an lci morphism between flat Z/p^n algebras or schemes. A strict regular quotient is its explicit PD model. This roadmap is the sole owner of that derived-versus-classical comparison; CR.0 provides ordinary universal envelopes and basis/reduction facts. The current CR.0 overlap is recorded for the maintainer.

Compatible flat lci reductions allow the p-adic comparison by derived limits. The period application compares the completed de Rham objects over W and A_inf with the regular-kernel PD envelope A_cris. Its Frobenius, Galois action and filtration use the imported period data. The rational period construction inverts p inside each Hodge quotient before taking the inverse limit; pulling inversion outside that limit is not asserted. The corrected F_p/Z_p model retains the completed torsion direct sum. Coordinates p^floor(n/2), rather than p^(n−1), give the source's nontorsion boundary example.

BMS2 adds the explicit increasing PD conjugate filtration, with conjugate weight k for γ_(pk). Its factorial factors are p-adic units. For quasiregular semiperfect algebras no finite regular-sequence presentation is assumed: the PD envelope of the perfect tilt gives discrete de Rham by Proposition 8.12. The p-torsion-free root-quotient proof remains an exact CR.0 request.

Derived de Rham–Witt is a p-complete left Kan extension of CR.4's classical smooth WΩ/Nygaard data. The early supplier comes first; the late comparison is not an input. Divided Frobenius has the stated fiber sequences, and injectivity modulo p is on the Nygaard graded quotient, not its entire level. The structure theorem identifies A_crys with derived Witt, distinguishes Nygaard completion from PD-ideal completion, and supplies the canonical crystalline Čech complex for regular F_p-algebras after perfection and QRSP unfolding. Kunz/Popescu proof inputs remain visible refinements. RT.6 consumes this package for its own subsequent trace comparison.

### Target coverage

- Natural filtered comparison, regular PD and lci/flat isomorphism range: crystalline-comparison-map, regular-pd-comparison, lci-crystalline-comparison.
- Compatible p-adic reductions, Frobenius and torsion boundary: p-adic-crystalline-comparison, de-rham-frobenius, fp-over-zp-torsion.
- A_cris and rational quotient-limit B_dR+ period maps: acris-derived-description, rational-hodge-period-comparison.
- Routed BMS2 PD conjugate filtration, arbitrary quasiregular comparison and derived Witt: pd-conjugate-filtration, qrsp-pd-derham, derived-de-rham-witt, qrsp-witt-control, acrys-structure.
- Canonical regular-F_p crystalline Cech complex: regular-fp-crystalline-cech.

**Atlas planets:** Crystalline comparison map; Regular quotient PD comparison; Lci crystalline comparison; Derived de Rham periods; Quasiregular crystalline structure; Canonical crystalline Čech complex.

### The derived de Rham to crystalline map

**Construction — `TauCeti.DerivedDeRham.crystallineComparisonMap`**

For an ordinary map A→B of Z/p^n-algebras, n≥1, construct Comp_(B/A):dR_(B/A)→RΓ((B/A)_crys,O_crys) as a natural map of Hodge-filtered E∞ A-algebras. The crystalline site has nilpotent PD thickenings compatible with the canonical divided powers on p. On a surjective free resolution P•→B, map Ω•_(P•/A) into Ω•_(P•/A)⊗_(P•)D_(P•)(ker(P•→B)) and use the PD Poincaré comparison. The target is classical crystalline cohomology of B (of π₀B for the separately specified animated extension).

**Node:** `DerivedDeRhamCohomology:DD.4/crystalline-comparison-map`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `CrystallineCohomology:CR.0`, `CrystallineCohomology:CR.2`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.25 and Remark 3.26, p.12. The polynomial PD models construct an actual natural filtered comparison map.

**Construction or proof route.**

1. Import the ordinary PD envelope and PD de Rham model from CR.0–2 with the chosen base PD structure.
2. Use the standard surjective free resolution, whose every term admits the displayed kernel ideal.
3. The CR.2 PD Poincaré comparison makes the target simplicial diagram coherently equivalent to the constant crystalline object.
4. Realize the polynomial maps, then descend to schemes and check naturality and the Hodge/PD filtration maps.

**Uses that determine the API.**

- DD.4; CR.2; DD.6 strict quotient step; CohomologyComparisons: All subsequent identifications use this constructed map and its filtered naturality.

**API contract.**

- `TauCeti.DerivedDeRham.crystallineComparisonNatural` (functoriality). A base-compatible square induces a commuting square of the specified comparison maps.
- `TauCeti.DerivedDeRham.crystallineComparisonHodge` (compatibility). The map carries Hodge filtration to the crystalline PD filtration.
- `TauCeti.DerivedDeRham.crystallineComparisonSmooth` (compatibility). For a smooth map in the nilpotent-p range this is the PD Poincaré equivalence.
- `TauCeti.DerivedDeRham.crystallineComparisonSheaf` (compatibility). Affine comparison maps glue over the common scheme site and preserve cup products.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_crys_map_base` (degenerate). For A→A over Z/p^n, Comp is the identity on A.
- `TauCeti.DerivedDeRham.test_crys_map_polynomial` (computation). For F_p→F_p[t], Comp identifies the ordinary complex with the crystalline PD de Rham model.
- `TauCeti.DerivedDeRham.test_crys_map_nonlci` (non-example). For F_p→F_p[x,y]/(x,y)², the map exists but cannot be an equivalence: source cohomology is unbounded negatively and the classical target is coconnective.

**Acceptance checks.**

- The unit map on a polynomial algebra agrees with the classical smooth comparison.
- No isomorphism for arbitrary singular or nonflat maps is part of this construction.

### Regular quotients and classical PD envelopes

**Theorem — `TauCeti.DerivedDeRham.regularPdComparison`**

If A→B=A/I is a quotient of flat Z/p^n-algebras and I is generated locally by a finite regular sequence, Comp identifies dR_(B/A) with the ordinary PD envelope D_A(I), compatible with divided powers on p. The Hodge filtration becomes its PD filtration; modulo p the conjugate filtration becomes the explicit PD conjugate filtration. This Corollary 3.40 is owned here together with Theorem 3.27. CR.0 supplies only the explicit ordinary PD envelopes, derived tensor discreteness, flatness and reduction lemmas.

**Node:** `DerivedDeRhamCohomology:DD.4/regular-pd-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/crystalline-comparison-map`, `DerivedDeRhamCohomology:DD.3/regular-quotient-divided-powers`, `DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth`, `CrystallineCohomology:CR.0`, `CrystallineCohomology:CR.2`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Lemma 3.29, Claim 3.30, Lemmas 3.37–3.38, Corollary 3.40, pp.13–17. The one-variable calculation and PD-side base change give the regular quotient comparison.

**Construction or proof route.**

1. In F_p[x]→F_p, calculate the simplicial boundary of the divided-power classes; Wilson gives (p−1)!=−1 in F_p.
2. Identify the resulting map to F_p⟨x⟩ on the divided-power generators, including the sign in Claim 3.30 (normalize the totalization sign before using its generator formula; its printed Wilson equality has the sign error E8).
3. Use CR.0 Lemma 3.37 to tensor the independent regular generators and identify the ordinary PD target.
4. Use CR.0 Lemma 3.38 and derived base change to reduce a flat Z/p^n case to p; descend the comparison from local regular presentations.

**Acceptance checks.**

- For F_p[x]→F_p, Comp is an equivalence to F_p⟨x⟩ with both filtrations.
- Neither nonregular ideals nor F_p/Z_p are covered by this finite nilpotent-p regular-quotient statement.

### The lci crystalline comparison theorem

**Theorem — `TauCeti.DerivedDeRham.lciCrystallineComparison`**

For n≥1 and an lci morphism of flat Z/p^n-schemes f:X→S (finite-presentation/local regular-immersion convention), the natural Comp_f is an equivalence of Hodge-filtered E∞ algebras and is compatible with base change in its Tor-independent crystalline range, products and Frobenius. This is Bhatt Theorem 3.27; the general singular and nonflat cases remain outside its isomorphism assertion.

**Node:** `DerivedDeRhamCohomology:DD.4/lci-crystalline-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/crystalline-comparison-map`, `DerivedDeRhamCohomology:DD.4/regular-pd-comparison`, `DerivedDeRhamCohomology:DD.2/smooth-de-rham-comparison`, `DerivedDeRhamCohomology:DD.2/de-rham-transitivity`, `DerivedDeRhamCohomology:DD.2/de-rham-sheaves`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `CrystallineCohomology:CR.2`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Theorem 3.27, Lemmas 3.39 and 3.44–3.45, proof pp.18–19. The theorem retains flatness and regular quotient hypotheses.

**Construction or proof route.**

1. Locally factor f as a smooth/free map followed by a regular quotient.
2. Use the ordinary PD model and CR.0 flatness to prove reduction of crystalline cohomology modulo p as in Lemma 3.39.
3. In characteristic p use the relative conjugate filtration of Proposition 3.22, with the Frobenius descent connection on the PD conjugate graded pieces.
4. The regular quotient comparison identifies the graded maps; bounded-below exhaustive realization gives the result.
5. Lift through the finite p-filtration and glue the actual maps on schemes, preserving the Hodge filtration and products.

**Acceptance checks.**

- The polynomial smooth lift and a regular hypersurface both pass.
- The square-zero non-lci quotient from Example 3.21 fails the comparison; its strict surjectivity is insufficient.

### p-adic crystalline comparison by derived limits

**Comparison — `TauCeti.DerivedDeRham.pAdicCrystallineComparison`**

Let A→B be a map of p-complete bounded-torsion algebras whose derived reductions are ordinary flat Z/p^n-algebras and lci for every n, compatibly. Then Λ_p dR_(B/A)≃Rlim_n RΓ((B/p^n over A/p^n)_crys,O). The same assertion applies to compatible p-adic formal schemes with the analogous finite-level hypotheses. The filtration is the derived limit of the specified Hodge/PD filtration. Each limit and base-change map is derived; reduction of arbitrary rings to π₀ is not allowed.

**Node:** `DerivedDeRhamCohomology:DD.4/p-adic-crystalline-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth`, `DerivedDeRhamCohomology:DD.4/lci-crystalline-comparison`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 8.1, Lemma 8.3, Theorem 8.4, pp.31–32. The finite-level theorem is passed to compatible derived p-adic limits.

**Construction or proof route.**

1. Compare the actual derived reductions of the source with finite-level derived de Rham.
2. Apply the finite-level natural comparison under the flat/lci hypotheses.
3. Take Rlim of the compatible equivalences, including every indicated filtration quotient.
4. Use the DD.1 reduction-conservativity and limit APIs, rather than an underived inverse-limit argument.

**Acceptance checks.**

- A p-completely smooth formal lift has the expected crystalline comparison.
- No nonflat animated reduction is replaced by its ordinary quotient.

### Frobenius on nilpotent-p derived de Rham

**Construction — `TauCeti.DerivedDeRham.deRhamFrobenius`**

For a Z/p^n-algebra B, polynomial crystalline Frobenius gives a natural endomorphism φ of dR_(B/(Z/p^n)), commuting with the crystalline comparison map. For p-completed algebras use the compatible finite reductions. On characteristic-p Cartier graded pieces record the actual Frobenius twist. This construction does not identify the Hodge filtration with the conjugate or Nygaard filtration.

**Node:** `DerivedDeRhamCohomology:DD.4/de-rham-frobenius`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/crystalline-comparison-map`, `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `CrystallineCohomology:CR.2`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.47 and proof, p.19; Remark 9.8. The canonical Frobenius is induced on polynomial de Rham models by the crystalline interpretation.

**Construction or proof route.**

1. Identify a polynomial de Rham complex with its crystalline lift model.
2. Import crystalline Frobenius on that model with the correct base and coefficient maps.
3. Realize the coherently natural maps and check compatibility with Comp; take the compatible p-adic limit.

**Uses that determine the API.**

- DD.4 period identifications and BMS2 §8.2; RT.6: The comparison needs a specified canonical Frobenius, not only an underlying algebra equivalence.

**API contract.**

- `TauCeti.DerivedDeRham.deRhamFrobeniusNatural` (functoriality). Algebra maps over Z/p^n commute with φ.
- `TauCeti.DerivedDeRham.deRhamFrobeniusCrystalline` (compatibility). Comp intertwines φ and crystalline Frobenius.
- `TauCeti.DerivedDeRham.deRhamFrobeniusLimit` (compatibility). The finite φ maps induce the endomorphism of Λ_p dR.
- `TauCeti.DerivedDeRham.deRhamFrobeniusDegreeZero` (simp). Modulo p, degree-zero polynomial functions map by b↦b^p.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_derham_frob_base` (degenerate). On the base Z/p^n, the canonical Frobenius is the base identity.
- `TauCeti.DerivedDeRham.test_derham_frob_coordinate` (computation). Modulo p on F_p[t], t maps to t^p and the differential of t^p is zero.
- `TauCeti.DerivedDeRham.test_derham_frob_filtration_boundary` (non-example). The Hodge and conjugate filtrations have opposite directions and are not equated by existence of φ.

**Acceptance checks.**

- The map is canonical, whereas a conjugate splitting still needs compatible W₂ lifts.

### The derived de Rham description of A_cris

**Theorem — `TauCeti.DerivedDeRham.acrisDerivedDescription`**

In Bhatt Notation 9.1, let W=W(k), K/Frac(W) finite, C=widehat(bar K), A_inf=W(O_C^♭) with θ:A_inf→O_C and regular kernel ξ supplied by AI.0. Then Λ_p dR_(O_barK/W)≃Λ_p dR_(O_C/W)≃Λ_p dR_(O_C/A_inf)≃widehat D_(A_inf)(ker θ)=A_cris. The Hodge filtration is the completed PD filtration, the map A_inf→A_cris is the PD structure map, and the equivalence preserves Frobenius and the G_K action. The integral perfectoid generalization keeps the regular θ-kernel and relatively perfect mod-p input.

**Node:** `DerivedDeRhamCohomology:DD.4/acris-derived-description`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/p-adic-crystalline-comparison`, `DerivedDeRhamCohomology:DD.4/regular-pd-comparison`, `DerivedDeRhamCohomology:DD.4/de-rham-frobenius`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `AInfCohomology:AI.0:integral`, `CrystallineCohomology:CR.0`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 9.3(2)–(5), Definition 9.7, Proposition 9.9, Remark 9.10, pp.34–35. The relatively perfect A_inf map and regular θ-kernel identify the actual PD-period maps.

**Construction or proof route.**

1. Import A_inf, θ, the regular kernel and the Galois/Frobenius structure; do not define a second period carrier.
2. Relatively perfect reduction gives Λ_p L_(A_inf/W)=0 and invariance of p-completed de Rham under this intermediate base.
3. Replace O_barK by O_C using p-completion invariance.
4. Reduce the regular θ-quotient modulo p^n, where the flat regular comparison applies, then take the compatible p-adic limit.
5. Identify the filtration, action and unit maps with the imported completed PD period ring.

**Acceptance checks.**

- The one-generator θ-kernel computes every Hodge graded term by completed divided powers.
- A_cris is supplied by AI.0/CR.0; this node identifies it rather than introducing another definition.

### The torsion boundary for F_p over Z_p

**Application — `TauCeti.DerivedDeRham.fpOverZpTorsion`**

The p-completed de Rham complex of F_p/Z_p is the derived completion of [Z_p⟨x⟩ --(x−p)→ Z_p⟨x⟩] in degrees −1,0. Its decompleted model is Z_p⊕⊕_(j>0) Z_p/j in degree zero; the completion of the torsion direct sum need not be torsion. In the factors Z_p/p^n the coordinates p^floor(n/2) tend p-adically to zero and have unbounded orders, hence define a nontorsion completed-sum element. This corrects Remark 8.7; the printed p^(n−1) coordinates are all killed by p. For a perfect F_p-algebra A₀, the Witt summand in Corollary 8.6 is W(A₀).

**Node:** `DerivedDeRhamCohomology:DD.4/fp-over-zp-torsion`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `CrystallineCohomology:CR.0`, `mathlib:WittVector`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 8.5, Corollary 8.6, Remark 8.7, p.32. The completed torsion calculation is used with both previously registered source corrections.

**Construction or proof route.**

1. Use the explicit derived regular-quotient PD two-term construction before p-completion; the finite nilpotent-p lci theorem is not applied directly to F_p/Z_p.
2. Compute the decompleted cokernel by the divided-power basis and the x−p relation.
3. Apply derived completion to the torsion direct sum and describe the restricted product.
4. Verify each printed p^(n−1) coordinate is p-torsion; replace it by p^floor(n/2), which tends to zero but has unbounded p-power order.

**Acceptance checks.**

- The result is not just Z_p.
- The presence of the degree −1 term in a model alone does not assert nonzero H^(−1).

### Hodge completion and B_dR⁺

**Comparison — `TauCeti.DerivedDeRham.rationalHodgePeriodComparison`**

For the same W,K,C as above, the rational Hodge completion of the p-completed derived de Rham period object, Rlim_i(((Λ_p dR_(O_barK/W))/Fil_H^i)[1/p]), identifies with the ker(θ)[1/p]-adic completion of A_inf[1/p], namely the shared B_dR⁺. Precisely use Rlim_i(((Λ_p dR)/Fil_H^i)[1/p]); inversion outside the limit is not identified with it. The natural map A_cris→B_dR⁺ preserves the filtration and G_K action; passage to B_dR and B_cris uses the period owner’s specified localization maps.

**Node:** `DerivedDeRhamCohomology:DD.4/rational-hodge-period-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/acris-derived-description`, `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `PadicHodgeTheory:R06.1`, `AInfCohomology:AI.0:integral`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Remark 9.17, p.38. The θ-adic rational construction and natural PD map are distinct from integral p-completion.

**Construction or proof route.**

1. Identify each finite Hodge quotient of A_cris with its θ-PD quotient.
2. After inverting p, divided powers become ordinary powers in the finite quotient, yielding A_inf[1/p]/(ker θ)^i.
3. Take the rational quotient limit, then identify it with the imported B_dR⁺.
4. Use the PD universal map to compare A_cris with B_dR⁺ and import the rational localization and action interfaces.

**Acceptance checks.**

- The placement of [1/p] inside the inverse limit is retained.
- This is not a new construction of the rational period rings or their Galois invariants.

### The conjugate filtration of a PD envelope

**Construction — `TauCeti.DerivedDeRham.pdConjugateFiltration`**

For an F_p-algebra A, ideal I and ordinary PD envelope D_A(I), define Fil_n^conj as the A-submodule generated by products ∏ a_j^[l_j] with a_j∈I and Σl_j<(n+1)p, with Fil_(−1)=0. It is increasing, multiplicative and exhaustive; equivalently use products ∏a_j^[p k_j] with Σk_j≤n. There is a canonical surjective graded map Γ^*_(A/I)(I/I²)⊗_(A/I,Frob) A/φ(I)→gr_*^conj D_A(I), sending divided-power monomials to ∏((p k_j)!/(p^k_j k_j!))a_j^[p k_j]. Here φ(I) is the ideal generated by a^p for a∈I. These factors are p-adic units.

**Node:** `DerivedDeRhamCohomology:DD.4/pd-conjugate-filtration`. **Direct prerequisites:** `CrystallineCohomology:CR.0`, `mathlib:DividedPowers`, `mathlib:DividedPowerAlgebra`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Definitions 8.10 and Proposition 8.11, pp.271–272. The filtration and its graded map use the actual p-divided exponent and unit factors.

**Construction or proof route.**

1. Define the A-submodules by the stated weight condition and prove multiplication and exhaustiveness using PD identities.
2. Reduce l_j=p k_j+r_j with 0≤r_j<p; the factorial coefficients give the equivalent generators.
3. Check elements of I² have positive divided powers in filtration zero as required for the graded map.
4. Prove the factorial unit formula, linearity, multiplication and surjectivity.

**Uses that determine the API.**

- BMS2 §§8.2,10; DD.4 lci and quasiregular comparisons; RT.6: The conjugate graded pieces determine the Frobenius/Nygaard comparison.

**API contract.**

- `TauCeti.DerivedDeRham.pdConjugateMembership` (characterisation). The two displayed generator descriptions define the same filtration level.
- `TauCeti.DerivedDeRham.pdConjugateProduct` (compatibility). Fil_i·Fil_j⊆Fil_(i+j) and colim Fil_i=D_A(I).
- `TauCeti.DerivedDeRham.pdConjugateGradedMap` (data). The divided-power graded map has the displayed Frobenius base change and factorial factors.
- `TauCeti.DerivedDeRham.pdConjugateNatural` (functoriality). Maps of F_p PD envelope problems preserve all levels and the graded map.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_pd_conj_zero_ideal` (degenerate). For I=0 only weight zero survives, and D_A(0)=A.
- `TauCeti.DerivedDeRham.test_pd_conj_coordinate` (computation). For A=F_p[x], I=(x), γ_(p k)(x) has conjugate weight k and γ_(p−1)(x) belongs to weight zero.
- `TauCeti.DerivedDeRham.test_pd_conj_two_filtrations` (non-example). γ_p(x) has conjugate weight 1 but PD/Hodge weight p; the two filtrations are different.

**Acceptance checks.**

- The Hodge PD filtration is decreasing; this conjugate filtration is increasing.

### Quasiregular semiperfect derived de Rham and PD envelopes

**Comparison — `TauCeti.DerivedDeRham.qrspPdDerham`**

For every quasiregular semiperfect F_p-algebra S, put S^♭=lim_φ S and I=ker(S^♭→S). Then dR_(S/F_p)≃dR_(S/S^♭) is discrete and naturally identifies with D_(S^♭)(I)=A_crys(S)/p. The Hodge filtration is the PD filtration and the increasing conjugate filtration agrees with the PD conjugate filtration, with gr_*≃Γ^*_S(I/I²). No finite-generation or regular-sequence hypothesis on I is imposed. A_crys(S) is the imported completed PD envelope of W(S^♭)→S.

**Node:** `DerivedDeRhamCohomology:DD.4/qrsp-pd-derham`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/derived-divided-powers`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.4/regular-pd-comparison`, `DerivedDeRhamCohomology:DD.4/pd-conjugate-filtration`, `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`, `CrystallineCohomology:CR.0`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 8.12 and proof, pp.272–273. The comparison extends to all quasiregular semiperfect rings through the compatible-root presentation and a PD universal inverse.

**Construction or proof route.**

1. Perfectness gives L_(S^♭/F_p)=0; the quasiregular cotangent module in degree −1 makes every conjugate graded piece a degree-zero flat divided power.
2. Choose the source’s universal root quotient S̃=S^♭[X_i^(1/p^∞)]/(X_i) mapping surjectively to S and on conormal modules.
3. Obtain the comparison for S̃ by filtered colimits of finite regular quotient comparisons, retaining both filtrations.
4. Show LWΩ_S→S is a PD thickening using the root-quotient case and divisibility of powers.
5. The ordinary PD universal property produces the inverse map for general S; do not assert that every quasiregular ideal is a finite regular sequence.

**Acceptance checks.**

- A perfect S gives dR=S, A_crys(S)=W(S).
- S=F_p[t^(1/p^∞)]/(t) has nontrivial divided-power weights.
- The comparison covers arbitrary quasiregular conormal modules, including non-finitely-generated ones.

### Derived de Rham–Witt with Nygaard filtration

**Construction — `TauCeti.DerivedDeRham.derivedDeRhamWitt`**

Import the classical smooth F_p de Rham–Witt complex WΩ and its Nygaard filtration from the early CR.4 supplier. Define LWΩ on animated F_p-algebras by the common left Kan extension into p-complete filtered E∞ Z_p-algebras, using p-completed colimits. Extend the CR.4 divided Frobenius maps to obtain fiber sequences N^(≥i+1)LWΩ→N^(≥i)LWΩ --φ_i mod p→Fil_i^conj dR, and LWΩ/N^(≥i) --p→LWΩ/N^(≥i+1)→dR/Fil_H^(i+1). The source’s smooth WΩ and subsequent derived comparison are different ownership steps.

**Node:** `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`. **Direct prerequisites:** `CrystallineCohomology:CR.4`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.2 opening, p.270, equations (4)–(5); Lemmas 8.2–8.3. The early classical WΩ identities animate to the derived Nygaard/Hodge fiber sequences.

**Construction or proof route.**

1. Request the CR.4 smooth WΩ functor, Nygaard filtration and divided Frobenius, without depending on its subsequent derived comparison.
2. Extend along polynomial/smooth algebras by the enhanced animation universal property and complete the colimits at p.
3. Extend the natural finite fiber/cofiber sequences using exactness of stable colimits.
4. Identify conjugate and Hodge terms with the DD.2–3 objects and record φ_i only on its stated Nygaard domain.

**Uses that determine the API.**

- BMS2 §8.2; CR.4 integration; RefinedTraceMethods RT.6: This derived functor supplies the QRSP period ring and its Nygaard graded Frobenius maps.

**API contract.**

- `TauCeti.DerivedDeRham.derivedWittSmooth` (equivalence). On a smooth F_p-algebra, LWΩ is the imported classical WΩ with its Nygaard filtration.
- `TauCeti.DerivedDeRham.derivedWittModP` (equivalence). LWΩ_S⊗^L_Zp F_p≃dR_(S/F_p).
- `TauCeti.DerivedDeRham.derivedWittDividedFrobenius` (data). φ_i:N^(≥i)LWΩ→LWΩ has the displayed modulo-p fiber sequence.
- `TauCeti.DerivedDeRham.derivedWittHodgeQuotient` (compatibility). Multiplication by p on Nygaard quotients has cofiber dR/Fil_H^(i+1).

**Unit tests.**

- `TauCeti.DerivedDeRham.test_derived_witt_perfect` (computation). For perfect S, LWΩ_S=W(S), with Nygaard filtration p^iW(S).
- `TauCeti.DerivedDeRham.test_derived_witt_fp` (degenerate). For S=F_p, LWΩ=Z_p and reduction is F_p.
- `TauCeti.DerivedDeRham.test_derived_witt_singular_boundary` (non-example). For non-lci S, mod-p dR can have negative cohomology, so LWΩ is not asserted discrete for every animated S.

**Acceptance checks.**

- No second classical WΩ or generic Nygaard carrier is introduced.

### Quasiregular semiperfect derived Witt control

**Theorem — `TauCeti.DerivedDeRham.qrspWittControl`**

For quasiregular semiperfect S over F_p, LWΩ_S is degree zero and p-torsion-free, N^(≥i)LWΩ_S is a degree-zero submodule, φ_i mod p on gr_N^i LWΩ injects into dR_(S/F_p) with image Fil_i^conj, and LWΩ_S→S is a PD thickening. The injectivity is on the Nygaard graded term; it is not an injectivity claim for φ_i mod p on the entire level N^(≥i).

**Node:** `DerivedDeRhamCohomology:DD.4/qrsp-witt-control`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`, `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `CrystallineCohomology:CR.0`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 8.13 and the end of Proposition 8.12 proof, pp.273–274. The preceding fiber sequence identifies the injective graded map and the PD thickening.

**Construction or proof route.**

1. Use the degree-zero flat conjugate graded modules to see dR_S is discrete and apply p-complete Nakayama/complete flatness to LWΩ.
2. The derived Nygaard fiber sequence identifies gr_N^i LWΩ with Fil_i^conj dR and embeds the latter in dR.
3. Use the ordinary root-quotient PD model to show n! divides powers in the augmentation ideal; descend along the source’s surjection.
4. Keep the graded term in the divided Frobenius injectivity statement.

**Acceptance checks.**

- For S=F_p, N^(≥i)=p^iZ_p and gr_N^i=F_p; φ_i mod p is injective on the graded term and kills pN^(≥i).

### The structure theorem for A_crys(S)

**Theorem — `TauCeti.DerivedDeRham.acrysStructure`**

For every quasiregular semiperfect F_p-algebra S, the imported A_crys(S) is p-torsion-free and has a natural φ-equivariant identification A_crys(S)≃LWΩ_S matching Nygaard filtrations. Its N^(≥i) is {x:φ(x)∈p^iA_crys}; the divided Frobenius gr_N^i→A_crys/p injects with conjugate image Fil_i^conj. The image of N^(≥i) modulo p is Fil_H^i dR. Nygaard completion modulo p is Hodge-completed dR, and φ mod p is x↦x^p. Nygaard completion and completion at the PD ideal are not identified; at p=2 the latter can collapse Z₂ to F₂.

**Node:** `DerivedDeRhamCohomology:DD.4/acrys-structure`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/qrsp-pd-derham`, `DerivedDeRhamCohomology:DD.4/qrsp-witt-control`, `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`, `DerivedDeRhamCohomology:DD.4/pd-conjugate-filtration`, `CrystallineCohomology:CR.0`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 8.14 and proof, pp.274–275. All five structure assertions and the completion warning form the derived PD/Witt comparison.

**Construction or proof route.**

1. The PD thickening LWΩ_S→S induces the canonical map A_crys(S)→LWΩ_S.
2. Prove the root-quotient model is p-torsion-free by the PD-side argument used in Proposition 8.12; retain that proof input rather than deducing it from an underived mod-p isomorphism.
3. Use the universal root quotient and PD relations to extend the identification and p-torsion-freeness to S.
4. Use the Nygaard fiber sequences inductively to identify Frobenius divisibility, conjugate graded images, Hodge images and the completed modulo-p object.
5. Check φ(x)=x^p on the root divided-power generators and descend.

**Acceptance checks.**

- For perfect S this gives W(S), with N^(≥i)=p^iW(S).
- For F₂, Nygaard completion is Z₂ while its PD completion along (2) is F₂.

### The canonical crystalline Čech complex

**Theorem — `TauCeti.DerivedDeRham.regularFpCrystallineCech`**

For a regular F_p-algebra A in BMS2 Remark 8.15’s convention, let S=A_perf be its direct-limit perfection. The map A→S is a quasisyntomic cover and its completed Čech terms are quasiregular semiperfect. The canonical cochain complex A_crys(S)→A_crys(S⊗_A S)→… computes RΓ_crys(A/Z_p), through the unfolding of LWΩ on QSyn_(F_p). Regularity is essential for faithful flatness of perfection; this formula is not asserted for arbitrary singular A.

**Node:** `DerivedDeRhamCohomology:DD.4/regular-fp-crystalline-cech`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.4/acrys-structure`, `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`, `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `DerivedDeRhamCohomology:DD.5/qrsp-refinement`, `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`, `DerivedDeRhamCohomology:DD.5/uncompleted-p-de-rham-descent`, `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.4`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Remark 8.15, p.275. The canonical representative uses the DD.5 descent/unfolding package, Kunz and Popescu, then the smooth Witt comparison.

**Construction or proof route.**

1. Use the easy direction of Kunz to obtain faithfully flat A→A_perf; use Popescu to control L_(S/A).
2. Apply DD.5 closure and unfolding to the Čech nerve, preserving the D(Z_p)-valued limit.
3. Show LWΩ is a sheaf by mod-p derived de Rham descent and p-completeness.
4. On smooth F_p-algebras import CR.4 WΩ≃crystalline; extend to regular algebras through Popescu’s filtered smooth approximation.
5. The unfolded A_crys sheaf identifies the desired normalized/cochain Čech model.

**Acceptance checks.**

- For perfect A, the nerve contracts and the result is W(A).
- The required supplier direction is DD.5→DD.4; no DD.4 input occurs in the construction of QSyn covers.

### What keeps DD.4 open

- PD root-quotient p-torsion-freeness proof: BMS2 Proposition 8.12 uses Scholze–Weinstein 2013 Proposition 4.1.11 for the p-torsion-free PD root quotient. That precise proof was not read in this pass. CR.0 must supply it or a complete direct PD-basis proof before the general A_crys structure theorem closes.
- Regular perfection and smooth approximation: The canonical crystalline Čech calculation invokes Kunz’s regular-ring Frobenius flatness direction and Popescu’s theorem Stacks 07GB. No atlas supplier with these exact proofs was verified; the DD.4 target records this proof gap instead of asserting them from generic cotangent amplitude.
- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.
- Supplier CrystallineCohomology:CR.0: Ordinary PD envelopes and filtered universal maps; Bhatt Lemmas 3.37–3.38 explicit regular envelopes, derived tensor discreteness, Z/p^n flatness and reduction. Export PD-side facts only; DD.4 alone owns Corollary 3.40 and Theorem 3.27.
- Supplier CrystallineCohomology:CR.2: The PD Poincaré de Rham model, scheme descent and crystalline transitivity/base-change maps with their nilpotent base and PD hypotheses; no duplicate derived de Rham comparison.
- Supplier CrystallineCohomology:CR.4: Early classical smooth F_p WΩ with Nygaard filtration, divided Frobenius and BMS2 Lemmas 8.2–8.3, plus classical smooth crystalline comparison. This prefix does not depend on DD.4’s derived Witt/QRSP comparison.
- Supplier AInfCohomology:AI.0:integral: Shared A_inf, θ with regular principal kernel, relatively perfect mod-p input, p-completed PD period ring and its actual unit/Frobenius/Galois maps; this is the early integral prefix.
- Supplier PadicHodgeTheory:R06.1: The shared B_dR⁺, B_dR and B_cris objects and maps with G_K actions and filtration; use them after DD.4 identifies the integral derived period object.

## DD.5 — Quasisyntomic descent

The big QSyn slice and relative qSyn_R site have different object sets. Covers are completely faithfully flat quasisyntomic maps. Define QRSP rings using a QSyn object, an integral perfectoid source from Q0 and surjective Frobenius on the mod-p reduction. In characteristic p this becomes a quasiregular quotient of a perfect tilt with flat conormal, not necessarily a finite regular quotient. The historical fine-node name in Q0 does not transfer QSyn/QRSP ownership there: its verified statement supplies only integral perfectoid algebra.

A free p-complete presentation followed by adjoining compatible roots of p and every coordinate gives the elementary perfectoid source. Completed derived base change gives a QRSP cover. This argument is independent of Q3's stronger absolutely-integrally-closed extension. Completed base change, common refinements and all Čech terms establish the basis property. Sheaves on the QRSP basis unfold by enhanced totalization and are independent of the chosen cover.

Completed cotangent powers descend; finite Hodge quotients descend by finite extensions, and Hodge completion descends by its quotient limit. For p-completed uncompleted dR, the conjugate stages must have the uniform lower bound that permits filtered colimit through Čech totalization. This proves descent on qSyn_R, and on the big slice only for the specified Z_p or integral-perfectoid bases. A merely exhaustive increasing filtration is insufficient outside that range. Tor amplitude of L∧^i L is [−i,0], and its [−i] shift has amplitude [0,i] before the extra derived mod-p tensor bound.

Proper-smooth control starts from the shared proper-flat finite-presentation coherent-cohomology theorem, valid without a Noetherian-base assumption. The finite Hodge filtration and bounded dimension give perfect finite reductions. Lifting the compatible uniformly bounded system to a perfect p-complete complex is a separate gap. Completed base change and cup products preserve that finite filtration. The projective site over O_C requires projective reduction and cotangent amplitude, without pretending they are finite. Finally QSyn sheaves restrict to formal étale sites through their affine charts; charts with unbounded p-torsion do not silently qualify.

### Target coverage

- Distinct sites, Q0-based QRSP definition, independent root covers, refinements/unfolding: quasisyntomic-site, quasiregular-semiperfectoid-rings, elementary-semiperfectoid-covers, qrsp-refinement, qrsp-unfolding.
- Completed cotangent, finite Hodge and restricted uncompleted p-de Rham descent: completed-cotangent-descent, filtered-de-rham-descent, uncompleted-p-de-rham-descent.
- Tor amplitude, proper-smooth perfectness, completed base change and cups: relative-tor-amplitude, proper-smooth-cohomological-control, completed-base-change-cup-products.
- Projective site and formal etale realization: proj-quasisyntomic-site, formal-etale-realization.

**Atlas planets:** Quasisyntomic site; Quasiregular semiperfectoid rings; Compatible-root covers; Proper smooth de Rham perfectness; Proj-quasisyntomic site.

### The quasisyntomic sites

**Definition — `TauCeti.DerivedDeRham.quasisyntomicSite`**

Fix p. QSyn has p-complete bounded-p-torsion rings whose L_(A/Z_p) has p-complete Tor amplitude [−1,0]; its opposite has singleton covers given by the DD.0 quasisyntomic morphism condition with complete faithful flatness. Construct the big slices QSyn_R (all maps R→A with A∈QSyn) and the relative subsite qSyn_R (quasisyntomic R-algebras). Their completed fiber products for covers, composition and base-change stability define the site; the full ring category need not have every finite limit. These two relative categories are distinguished.

**Node:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Definition 4.10; Lemmas 4.15–4.17; Variants 4.33 and 4.35, pp.223–225,231–232. The site applies the owned cotangent/complete flatness condition and distinguishes big slices from relative maps.

**Construction or proof route.**

1. Use DD.0’s condition without introducing another cotangent or completion definition.
2. Prove composition/base change with the transitivity triangle and completed tensor reductions.
3. Show bounded p-torsion is stable along complete-flat covers by DD.1.
4. Prove object membership descends along a cover and establish the Grothendieck pretopology on the opposite category.

**Uses that determine the API.**

- BMS2 §§4–5; PR.2; Q3; DD.4 unfolding; RT.1/6: The relative/big distinction controls the amplitude and boundedness used in descent.

**API contract.**

- `TauCeti.DerivedDeRham.qSynCoverComposition` (compatibility). Identity covers and composites are covers.
- `TauCeti.DerivedDeRham.qSynCoverBaseChange` (compatibility). The p-completed derived pushout of a cover is an ordinary bounded-torsion quasisyntomic cover under complete flatness.
- `TauCeti.DerivedDeRham.qSynObjectCoverDescent` (characterisation). For a quasisyntomic cover A→B, A∈QSyn iff B∈QSyn.
- `TauCeti.DerivedDeRham.qSynRelativeInclusion` (data). qSyn_R embeds in QSyn_R; for R=Z_p or integral perfectoid R, the relative cotangent amplitude is automatically [−1,0] on the big slice.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_qsyn_site_zp` (computation). Z_p lies in QSyn and its identity is a cover.
- `TauCeti.DerivedDeRham.test_qsyn_site_smooth` (computation). The p-completion of a smooth algebra over an integral perfectoid ring is an object.
- `TauCeti.DerivedDeRham.test_qsyn_site_nonlci` (non-example). F_p[x,y]/(x,y)² is not an object because the full absolute cotangent complex has unbounded negative homology.

**Acceptance checks.**

- Objects need not be finitely presented or noetherian; every theorem retains its own additional hypotheses.

### Quasiregular semiperfectoid rings

**Definition — `TauCeti.DerivedDeRham.quasiregularSemiperfectoidRings`**

A quasiregular semiperfectoid ring S is a QSyn object admitting a map from an integral perfectoid ring R and having surjective Frobenius on S/p. Equivalently it is a quotient of an integral perfectoid ring by a p-completely quasiregular ideal, with bounded p-torsion and relative cotangent in degree −1. QRSPerfd carries the induced cover topology. In characteristic p these are exactly quasiregular semiperfect F_p-algebras: S^♭=lim_φ S→S is surjective and L_(S/F_p)≃L_(S/S^♭)≃(I/I²)[1] with I/I² flat, I=ker(S^♭→S). Quasiregularity here need not mean a finite regular sequence.

**Node:** `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.0/derived-divided-powers`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Definition 4.20, Remarks 4.21–4.24, Lemma 4.25 with proof; Definition 8.8, pp.227–229,270. The perfectoid existence condition is an explicit imported integral prerequisite.

**Construction or proof route.**

1. Import the integral perfectoid carrier, examples, bounded torsion and rank-one completed cotangent theorem from Q0.
2. For a semiperfect reduction, Ω¹ vanishes; combine absolute and relative transitivity to locate the cotangent in degree −1.
3. Use the pure-injectivity argument of Lemmas 4.25–4.26 to obtain the relative degree −1 criterion for every perfectoid map.
4. Construct a perfectoid surjection R completed-tensor W(S^♭)→S and compare the characterizations.
5. In characteristic p use the perfectness of S^♭ and the flat shifted conormal computation.

**Uses that determine the API.**

- DD.5 basis covers and unfolding; BMS2 §8.2; RT.6: The correct basis includes the explicit perfectoid source and carries a degree −1 flat cotangent module.

**API contract.**

- `TauCeti.DerivedDeRham.qrspPerfectoidQuotient` (characterisation). The quotient characterization uses a p-completely quasiregular ideal and an integral perfectoid source.
- `TauCeti.DerivedDeRham.qrspCotangentDegree` (characterisation). For S and any integral perfectoid R→S, Λ_p L_(S/R) is a shifted complete-flat module.
- `TauCeti.DerivedDeRham.qrspCharacteristicP` (equivalence). In characteristic p, QRSPerfd equals quasiregular semiperfect F_p-algebras with flat I/I².
- `TauCeti.DerivedDeRham.qrspPerfectoidExample` (example). Every integral perfectoid ring is a QRSPerfd object.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_qrsp_perfect_fp` (computation). Every perfect F_p-algebra is quasiregular semiperfect, with I=0.
- `TauCeti.DerivedDeRham.test_qrsp_root_quotient` (computation). F_p[t^(1/p^∞)]/(t) is quasiregular semiperfect, with its nonzero conormal module in degree −1.
- `TauCeti.DerivedDeRham.test_qrsp_zp_boundary` (non-example). Z_p meets the QSyn and semiperfect-reduction conditions but admits no map from an integral perfectoid ring, so is excluded.

**Acceptance checks.**

- Z_p has semiperfect reduction and is quasisyntomic but is not semiperfectoid: the integral perfectoid map condition is necessary.

### Compatible-root quasisyntomic covers

**Construction — `TauCeti.DerivedDeRham.elementarySemiperfectoidCovers`**

For A∈QSyn, choose a surjective free p-complete polynomial algebra F→A. Adjoin compatible p-power roots of p and all polynomial coordinates to obtain the integral perfectoid F_∞. Put S=Λ_p(A⊗^L_F F_∞). Then A→S is a quasisyntomic cover and S∈QRSPerfd. Its mod-p module is free faithfully flat over A/p, and L_(S/p over A/p)[−1] is free. The cover is elementary; it does not use Q3’s absolutely-integrally-closed extension theorem.

**Node:** `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`, `DerivedDeRhamCohomology:DD.1/animated-ring-completion`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `PerfectoidQuotients:Q0:integral-algebra`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 4.28 and Remark 4.29 with proof, p.229. The independent compatible-root cover has free mod-p module and shifted relative cotangent.

**Construction or proof route.**

1. Choose F by generators of A and form the filtered compatible-root extension.
2. At each finite stage the monic root relations give free modules and regular relative relations; pass to the p-completed filtered colimit.
3. Import Q0’s proof that F_∞ is integral perfectoid.
4. Base change to A in the completed animated category and use complete flatness to show the underlying pushout is the stated ordinary bounded-torsion ring.
5. The surjection F_∞→S and the transitivity/amplitude calculation put S in QRSPerfd.

**Uses that determine the API.**

- DD.5 basis theorem; BMS2 unfolding; Q3 prerequisite: Every QSyn object obtains a cover without any dependency on a subsequent perfectoid extension theorem.

**API contract.**

- `TauCeti.DerivedDeRham.rootCoverFaithfullyFlat` (characterisation). S/p is free faithfully flat over A/p.
- `TauCeti.DerivedDeRham.rootCoverCotangent` (simp). L_(S/p over A/p)[−1] is a free S/p-module.
- `TauCeti.DerivedDeRham.rootCoverPerfectoidSource` (data). The cover comes with an integral perfectoid surjection F_∞→S.
- `TauCeti.DerivedDeRham.rootCoverFunctorialRefinement` (functoriality). Maps between choices of generators produce a common refinement of the resulting covers.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_root_cover_zp` (computation). For A=Z_p, adjoining all compatible roots of p and completing gives a perfectoid cover.
- `TauCeti.DerivedDeRham.test_root_cover_coordinate` (computation). For A=Z_p⟨t⟩, roots of p and t give the stated free mod-p module and shifted free relative cotangent.
- `TauCeti.DerivedDeRham.test_root_cover_finite_roots` (non-example). Adjoining only t^(1/p) leaves elements without p-power roots in the next stage and does not establish semiperfectness.

**Acceptance checks.**

- No finite number of roots makes the reduction semiperfect; the compatible infinite system is part of the construction.

### Refinement and Čech stability of QRSP covers

**Theorem — `TauCeti.DerivedDeRham.qrspRefinement`**

Completed base change of a QSyn cover with QRSP target by a QRSP object is QRSP; each term of the completed Čech nerve of A→S with S∈QRSPerfd is QRSP. Any two such covers admit a common QRSP refinement by applying the elementary cover to their completed fiber product. Relative and big-slice variants retain the same statement. This establishes the basis condition needed for unfolding.

**Node:** `DerivedDeRhamCohomology:DD.5/qrsp-refinement`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`, `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemmas 4.27 and 4.30, pp.229–230; Variant 4.33. The completed Čech terms retain the integral perfectoid map and semiperfect reduction.

**Construction or proof route.**

1. Use complete-flat pushouts to retain bounded torsion and the QSyn morphism condition.
2. The target inherits a perfectoid map; its mod-p Frobenius is surjective by the tensor/quotient description.
3. Induct on Čech degree and use the elementary cover once for a common refinement.

**Acceptance checks.**

- The perfection cover of a regular F_p-algebra has QRSP Čech terms.
- The existence of a common refinement does not choose a canonical cover.

### Sheaves and unfolding from the QRSP basis

**Comparison — `TauCeti.DerivedDeRham.qrspUnfolding`**

For a presentable enhanced target category C, restriction gives Shv_C(QSyn^op)≃Shv_C(QRSPerfd^op). Its inverse sends F to the unfolding F^unf(A)=Tot(F(S•)) for any QRSP cover A→S; this is independent of the cover by common refinement. The same applies to the specified relative and big-slice sites. In a complete filtered module target, evaluation and graded pieces commute with unfolding; the underlying object commutes for nonnegative filtrations that are constant below zero.

**Node:** `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `DerivedDeRhamCohomology:DD.5/qrsp-refinement`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 4.31 and Remark 4.32, pp.230–231. The actual sheaf equivalence and compatible filtered evaluation supply the unfolding used in BMS2.

**Construction or proof route.**

1. The QRSP basis covers every object and is stable on the required Čech nerves.
2. Use the basis comparison of enhanced sheaf categories; construct the inverse as maps out of the representable sheaf.
3. Identify that mapping object with the displayed totalization using effective descent and check both composites.
4. Use exact evaluation/graded functors in the complete filtered category for the stated compatibility.

**Acceptance checks.**

- For an object already in the basis the unfolding recovers F.
- This is a limit construction; an unrelated colimit-totalization interchange is not implicit.

### Descent of completed cotangent powers

**Theorem — `TauCeti.DerivedDeRham.completedCotangentDescent`**

For a fixed ordinary base R and a p-completely faithfully flat map A→B between bounded-torsion p-complete rings, the completed cotangent exterior-power functor A↦Λ_p L∧^i_A L_(A/R) satisfies Čech descent: its value at A is Tot of the values at the completed Čech terms. Finite Hodge quotients inherit descent by finite exact extensions. The mod-p proof keeps the derived reductions and the completed base ring; no freeness of the cotangent complex is assumed.

**Node:** `DerivedDeRhamCohomology:DD.5/completed-cotangent-descent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 3.1 and p-completed use in Example 5.11, pp.215–218,240. The derived-power faithfully-flat descent theorem supplies the Hodge graded modules.

**Construction or proof route.**

1. Use the polynomial resolution and finite exterior-power filtrations to prove ordinary flat descent of cotangent powers.
2. Apply reduction modulo p and complete faithful-flat descent to the actual animated base-change square.
3. Lift the mod-p equivalence by p-completeness and Nakayama.
4. Descend finite extensions and multiplicative compatibility using the enhanced Čech limit.

**Acceptance checks.**

- For i=0 the assertion is complete-flat descent of the ring/module.
- Infinite products or arbitrary unbounded colimits are not interchanged with Tot.

### Descent of Hodge quotients and completion

**Theorem — `TauCeti.DerivedDeRham.filteredDeRhamDescent`**

The functors A↦dR_(A/R)/Fil_H^m for finite m, their p-completions, and the complete Hodge-filtered object dR^hc_(A/R) satisfy their flat or p-completely flat Čech descent assertions. For Hodge completion, Tot commutes with the quotient inverse limit because both are limits. Graded conservativity is used only in the complete filtered category. There is no assertion here that uncompleted derived de Rham commutes with every unbounded totalization.

**Node:** `DerivedDeRhamCohomology:DD.5/filtered-de-rham-descent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/completed-cotangent-descent`, `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`, `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.1/filtered-completion`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Example 5.11, p.240. Graded complete-filtered descent proves Hodge-completed p-adic descent. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Proposition E.16 with proof, p.231. Flat descent is first proved for the bounded Hodge quotients and then their limit.

**Construction or proof route.**

1. Prove each finite quotient by its finite filtration with cotangent exterior graded modules.
2. Apply DD.1 completion and derived reduction for the p-adic assertion.
3. Take the Hodge quotient limit and commute the two derived limits.
4. Glue products and filtration maps as enhanced descent data; retain the separate uncompleted theorem.

**Acceptance checks.**

- The Hodge-completed and p-completed objects remain different functors.
- This theorem supplies DD.2 sheafification without needing the crystalline stage.

### Descent of p-completed uncompleted de Rham

**Theorem — `TauCeti.DerivedDeRham.uncompletedPDeRhamDescent`**

For a fixed R∈QSyn, Λ_p dR_(−/R) is a sheaf on the relative site qSyn_R. If R=Z_p or R is integral perfectoid, it is also a sheaf on the big slice QSyn_R. Modulo p, its increasing exhaustive conjugate filtration has sheaf stages uniformly in D^(≥−1); hence filtered colimits commute with the Čech totalization in the required bounded-below category. The same conclusion holds in BL Variant E.17’s p-quasisyntomic range. The uniform bound and relative-site restriction are explicit.

**Node:** `DerivedDeRhamCohomology:DD.5/uncompleted-p-de-rham-descent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5/completed-cotangent-descent`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.3/conjugate-spectral-sequence`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Example 5.12 and Lemma 4.34, pp.231,240. The bounded-below conjugate argument distinguishes the relative and big sites. [Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120), Variant E.17 with proof, pp.231–232. The completed conjugate stages lie uniformly in D≥−1, allowing the totalization exchange.

**Construction or proof route.**

1. Reduce the p-complete descent map modulo p, where reduction is derived and finite tensor preserves limits.
2. The relative cotangent amplitude and derived Cartier yield a lower bound −1 for all conjugate stages.
3. Apply cotangent-power descent and the bounded-below filtered-colimit/Tot exchange.
4. Use exhaustive realization and derived p-complete conservativity to lift the equivalence.
5. For the larger sites use Lemma 4.34, which supplies the relative amplitude for the two displayed bases.

**Acceptance checks.**

- No arbitrary fixed QSyn base is silently assigned the large-slice theorem.
- This is the DD.5 input to DD.4’s regular crystalline Čech calculation.

### Relative Tor-amplitude estimates

**Theorem — `TauCeti.DerivedDeRham.relativeTorAmplitude`**

For a quasisyntomic R-algebra A, Λ_p L_(A/R) has p-complete Tor amplitude [−1,0]; thus Λ_p L∧^i L_(A/R) has amplitude [−i,0], its Hodge/conjugate shift [−i] has [0,i] before the additional derived Z/p tensor bound, and each finite quotient has a specified finite amplitude bound. For a quasismooth map the completed L is a flat module in degree zero. For relative QRSP algebras the shifted cotangent and divided-power terms are complete-flat in degree zero. These are Tor-amplitude assertions, not finite-projectivity assertions without finiteness.

**Node:** `DerivedDeRhamCohomology:DD.5/relative-tor-amplitude`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/derived-divided-powers`, `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`, `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.1/complete-flatness`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 4.7, Lemma 4.34 and Lemma 5.14(1), pp.222,231,241. The shifted powers over the relative QRSP basis are complete-flat; general QSyn uses the wider bounded amplitude.

**Construction or proof route.**

1. Resolve the amplitude [−1,0] cotangent by flat two-term models and use the derived power filtration.
2. Track cohomological shifts and the extra degree −1 from derived tensor with Z/p.
3. Use vanishing of ordinary differentials and the relative QRSP criterion to improve the shifted powers to complete-flat degree zero.
4. Record each bound with its base and relative-map hypotheses.

**Acceptance checks.**

- A non-finitely-presented quasisyntomic algebra can have an infinite-rank cotangent module.
- Amplitude alone never gives perfectness.

### Proper smooth de Rham perfectness

**Theorem — `TauCeti.DerivedDeRham.properSmoothCohomologicalControl`**

Let A be p-complete with bounded p-torsion and X a proper p-completely smooth formal A-scheme of finite presentation, with compatible proper smooth ordinary reductions X_n/A_n of bounded relative dimension d. Then the p-completed continuous de Rham global object is a perfect derived p-complete A-complex. Each RΓ(X_n,Ω^i_(X_n/A_n)) is perfect by the shared proper-flat coherent-cohomology theorem, its Hodge quotient is a finite extension of these pieces, and Ω^i=0 for i>d. No degeneration or finite-projective individual H^j is asserted. The same finite-filtration argument applies to an ordinary proper smooth finite-presentation A-scheme with its smooth ordinary/Hodge-completed comparison in the appropriate characteristic.

**Node:** `DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.2/formal-ordinary-derham`, `DerivedDeRhamCohomology:DD.2/smooth-de-rham-comparison`, `DerivedDeRhamCohomology:DD.2/de-rham-sheaves`, `DerivedDeRhamCohomology:DD.5/relative-tor-amplitude`, `DerivedDeRhamCohomology:DD.5/filtered-de-rham-descent`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [The Stacks Project Authors, Cohomology and base change, III](https://stacks.math.columbia.edu/tag/0A1G), Tags 0A1G/0A1H, Lemma 36.30.1 and 36.30.4 with proof. The general proper-flat coherent-cohomology supplier proves perfectness and arbitrary base change without requiring a noetherian base. [The Stacks Project Authors, Cohomology and base change, III](https://stacks.math.columbia.edu/tag/0A1G), Lemmas 36.30.1 and 36.30.4, Tag 0A1G. Proper flat finite-presentation coherent cohomology is perfect and commutes with arbitrary derived base change, including non-Noetherian bases.

**Construction or proof route.**

1. Import the proper-flat finite-presentation coherent-cohomology theorem from its unique owner, including the nonnoetherian approximation version.
2. Apply it to each finite-projective differential bundle on every reduction X_n.
3. Use the finite Hodge filtration of the smooth complex, with at most d+1 pieces, to obtain perfectness and uniform bounds.
4. Use the compatible perfect derived-complete lifting theorem for the inverse system over A/p^n.
5. Retain the actual cohomology complex; singular, affine or merely QSyn objects do not satisfy these finiteness hypotheses.

**Acceptance checks.**

- Properness and finite presentation are used; A[t] as an affine QSyn algebra does not qualify.
- For a proper smooth relative curve, the result is perfect even when torsion prevents its cohomology groups from being finite projective.

### Completed base change and cup products

**Theorem — `TauCeti.DerivedDeRham.completedBaseChangeCupProducts`**

Under the proper smooth finite-presentation hypotheses of the preceding node, a bounded-torsion p-complete base map A→A′ gives a natural equivalence RΓ_dR(X/A) completed-tensor^L_A A′≃RΓ_dR(X completed-base-change A′/A′), compatibly with Hodge filtrations and cup products. All completed tensor and reductions are derived. For general QSyn algebras the affine base-change/Künneth and descent products remain available, but neither proper global perfectness nor a finite-projective cohomology conclusion follows.

**Node:** `DerivedDeRhamCohomology:DD.5/completed-base-change-cup-products`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control`, `DerivedDeRhamCohomology:DD.5/filtered-de-rham-descent`, `DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth`, `DerivedDeRhamCohomology:DD.2/de-rham-sheaves`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

**Sources:** [The Stacks Project Authors, Cohomology and base change, III](https://stacks.math.columbia.edu/tag/0A1G), Tag 0A1G, Lemma 36.30.1 and Remark 36.30.2. The underlying coherent differential pieces have derived base change; finite filtrations and completion transfer it to de Rham.

**Construction or proof route.**

1. Reduce the comparison to each finite-level differential bundle and use imported proper-flat coherent base change.
2. Assemble the finite Hodge filtration, preserving the wedge product and differential.
3. Use perfectness to justify completed tensor commuting with the finite-level inverse limit.
4. Check the product diagrams in the enhanced category before global totalization.

**Acceptance checks.**

- Base change to A/p retains derived torsion contributions.
- Cup products commute with pullback; no Hodge degeneration is used.

### The proj-quasisyntomic variant over O_C

**Definition — `TauCeti.DerivedDeRham.projQuasisyntomicSite`**

For O_C with C a characteristic-zero perfectoid field, a map A→B of p-complete p-torsion-free O_C-algebras is proj-quasisyntomic if B/p is a projective A/p-module and L_(B/p over A/p) has projective amplitude [−1,0]; it is a cover if B/p is also faithfully flat. Form the relative proj-qSyn_(O_C) and proj-qrsPerfd_(O_C) sites. They have completed base-change/composition stability, compatible-root basis covers and the sheaf-unfolding equivalence. Projective amplitude is stronger than Tor amplitude and does not imply finite generation.

**Node:** `DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `DerivedDeRhamCohomology:DD.5/qrsp-refinement`, `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Variant 4.36 and Footnotes 12–13, p.232. The projective replacement of complete flatness supplies the subsequent cohomological variant.

**Construction or proof route.**

1. Define projective amplitude by a two-term projective model or its Ext vanishing criterion.
2. Use the mod-p projective/free root-cover calculations to prove the pretopology and basis statements.
3. Repeat the basis sheaf comparison retaining projectivity rather than merely flatness.
4. Import the valuation-ring argument that finitely presented flat O_C/p-algebras are free for the smooth examples.

**Uses that determine the API.**

- BMS2 Variant 4.36; Theorem 9.6 cohomological application: The stronger projective site is supplied independently of the trace-theoretic theorem.

**API contract.**

- `TauCeti.DerivedDeRham.projQSynCover` (characterisation). A cover has projective faithfully flat reduction and projective cotangent amplitude [−1,0].
- `TauCeti.DerivedDeRham.projQSynSmooth` (example). The p-completion of a smooth O_C-algebra is in the relative projective site.
- `TauCeti.DerivedDeRham.projQSynRootBasis` (constructor). Every such object admits a compatible-root cover by proj-QRSP objects.
- `TauCeti.DerivedDeRham.projQSynUnfolding` (equivalence). Restriction to the proj-QRSP basis is a sheaf equivalence in presentable targets.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_proj_qsyn_identity` (degenerate). O_C→O_C has rank-one projective reduction and zero relative cotangent.
- `TauCeti.DerivedDeRham.test_proj_qsyn_smooth` (computation). O_C⟨t⟩ has the free coordinate differential module and qualifies.
- `TauCeti.DerivedDeRham.test_proj_qsyn_torsion` (non-example). An O_C-algebra with nonzero p-torsion is excluded even if its reduction happens to be projective.

**Acceptance checks.**

- The objects and all covers are p-torsion-free in this variant.

### From quasisyntomic sheaves to formal étale sites

**Construction — `TauCeti.DerivedDeRham.formalEtaleRealization`**

For a p-complete formal scheme X with QSyn affine charts, a C-valued sheaf F on QSyn defines a sheaf F_X on X_ét by F_X(U)=lim_(Spf A⊆U)F(A), the limit over affine formal opens. Smooth/étale maps of such charts are quasisyntomic covers, so the local values glue. The construction is natural in X and retains the coefficient category and any complete filtration carried by F; a small site is used only after chart hypotheses are checked.

**Node:** `DerivedDeRhamCohomology:DD.5/formal-etale-realization`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`, `DerivedDeRhamCohomology:DD.5/filtered-de-rham-descent`, `SchemeAndStackFoundations:SF.0`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SchemeAndStackFoundations:SF.4`.

**Sources:** [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Remark 10.4 and its construction, p.288. The formal étale restriction uses limits over affine formal charts.

**Construction or proof route.**

1. Verify the affine formal coordinate rings and their étale/smooth cover maps satisfy the QSyn hypotheses.
2. Define the value by the chart limit, using the enhanced target’s limits.
3. Check étale descent by refining covers to affine formal opens and applying the QSyn sheaf condition.
4. Construct morphism functoriality and carry evaluation/graded functors through their exact limits.

**Uses that determine the API.**

- BMS2 Remark 10.4; PR.2 and global period sheaves: The same quasisyntomic objects become sheaves on the indicated formal étale site.

**API contract.**

- `TauCeti.DerivedDeRham.formalEtaleAffine` (equivalence). On Spf A the restricted sheaf recovers F(A).
- `TauCeti.DerivedDeRham.formalEtaleCoverDescent` (compatibility). An étale affine-chart cover gives the enhanced Čech descent equivalence.
- `TauCeti.DerivedDeRham.formalEtalePullback` (functoriality). Compatible morphisms of formal schemes induce the specified sheaf pullback maps.
- `TauCeti.DerivedDeRham.formalEtaleFiltered` (compatibility). For complete filtered targets, evaluation and graded pieces commute with the chart-limit construction.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_formal_etale_affine` (degenerate). For X=Spf Z_p and its identity chart, the value is F(Z_p).
- `TauCeti.DerivedDeRham.test_formal_etale_smooth_chart` (computation). Smooth p-complete polynomial charts over an integral perfectoid base satisfy the required QSyn hypothesis.
- `TauCeti.DerivedDeRham.test_formal_etale_bad_chart` (non-example). A chart with unbounded p-torsion is not accepted as a QSyn chart without additional construction.

**Acceptance checks.**

- The coefficient category is fixed throughout the chart limit.

### What keeps DD.5 open

- Perfect lifting over a p-complete base: DD.5 proper smooth control needs the theorem that a compatible system of perfect A/p^n complexes with uniform bounds lifts to a perfect derived-complete A-complex. The supplier for this derived perfect-complex effectivity, beyond the checked coherent finite-level theorem, remains to be established.
- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.
- Supplier PerfectoidQuotients:Q0:integral-algebra: Early integral perfectoid carrier and examples; F_∞ obtained by adjoining roots of p and coordinates; bounded torsion and completed cotangent criterion. This is Q0:integral-algebra only, never Q0:animated-application or Q3.
- Supplier AlgebraicModuliForArithmeticGeometry:A0-extension: Proper flat finite-presentation coherent-cohomology perfectness and arbitrary derived base change, including the nonnoetherian approximation theorem Stacks 0A1G. DD.5 applies it to differential bundles; it does not plan coherent cohomology again.
- Supplier SchemeAndStackFoundations:SF.0: Schemes, affine charts, proper/smooth finite-presentation morphism predicates and p-adic formal schemes; formal chart groundwork may need the early SF.4 extension, without subsequent arithmetic comparisons.
- Supplier SchemeAndStackFoundations:SF.4: The early formal-scheme and affine-chart prefix: p-adic formal spectra, compatible finite reductions, proper smooth finite-presentation formal schemes and their étale sites. No algebraization, alterations or late model-comparison theorem is an input to this prefix.

## DD.6 — Logarithmic derived de Rham

Free prelog objects have ordinary ring generators and monoid generators whose ring images agree with their structure maps. Resolve the two sorts together. Derived log derivations are sections of the logarithmic square-zero extension; in degree zero they are pairs D, δ with Dα(n)=α(n)δ(n). Gabber's complex represents this functor and retains the negative homology that ordinary log differentials would lose. Olsson comparison and associated-log invariance use their actual integral ranges. The nonintegral log-étale counterexample has unbounded Gabber homology.

Homological log flatness means derived prelog pushouts agree with ordinary pushouts. It is distinct from Kato log flatness in both directions. Apply the same free resolution to the ordinary log de Rham algebra, with closed d log and both filtrations. Hodge and conjugate graded pieces include [−i]. Base change of the full de Rham algebra is over the base ring; the invalid intermediate tensor over S₁ in KY is omitted. Ordinary inverse Cartier sends dy to [y^(p−1)dy], while logarithmic coordinates have d log x ↦ [d log x]. Logification invariance in the integral nilpotent-p range does not erase the characteristic-zero counterexample.

For log crystalline comparison, exactify the effective epimorphism before taking a strict PD envelope. The corrected G-lci factorization has a log-smooth Cartier-type first factor and a strict quotient by a regular sequence second factor, with flat Z/p^n endpoints. Strict effective epimorphism alone is insufficient. The square-zero non-lci quotient tests this repair, and Bhatt Example 7.23 tests the missing Cartier condition. Filtered presentations and Fontaine's period examples remain a precise proof refinement.

The end-to-end examples fix the base chart. The log point over a trivial prelog field has L_log=[k →₀ k] in degrees −1,0. It does not use the degree-zero integral log-smooth comparison. The semistable chart has base N → O_K, 1 ↦ π, target N^r → B, e_i ↦ x_i, and diagonal monoid map 1 ↦ Σe_i. Its relative differential module has relation Σd log x_i=0 and rank d−1. General prelog log QSyn/QRSP descent keeps the hlf and exact tilt-surjectivity conditions P^♭ → P/P×. Compatible-root covers can have nonintegral target monoids. The period d log uses the actual arithmetic Tate module and completed PD logarithm, and agrees with log([ε]) in Fil_H¹ A_cris.

### Target coverage

- Free prelog resolution, log derivations, Gabber cotangent and restricted Olsson comparison: free-prelog-resolutions, log-derived-derivations, gabber-log-cotangent, log-cotangent-functoriality.
- Actual hlf, log de Rham, filtrations, Cartier, base change and logification boundaries: homological-log-flatness, log-derived-de-rham, log-de-rham-base-change, log-cartier, logification-boundaries, log-smooth-cartier-comparison.
- Exactification before strict PD, corrected G-lci, Cartier and failure boundary: log-crystalline-comparison-map, corrected-log-lci-condition, log-lci-crystalline-comparison.
- General prelog log QSyn, exact QRSP tilt condition, compatible roots and descent: log-quasisyntomic-sites, log-power-de-rham-descent, log-quasiregular-semiperfectoid, log-compatible-root-covers.
- Log point, actual semistable chart and period d log: log-point-example, semistable-chart-example, log-period-dlog.

**Atlas planets:** Free prelog resolutions; Gabber log cotangent complex; Homological log flatness; Log derived de Rham; Log Cartier isomorphism.

### Free prelog resolutions and animation

**Construction — `TauCeti.DerivedDeRham.freePrelogResolutions`**

For a prelog base (A,M), import its ring/monoid carrier from the early CR.5 prefix and use free objects (A[T₀,N^(T₁)],M⊕N^(T₁)) with finite generator sets. The free/forgetful cotriple gives a canonical surjective simplicial resolution of (B,N), free termwise as both ring and monoid algebra. Its realization recovers the prelog object, and comparison maps between projective resolutions are coherent homotopy equivalences. Apply the EDS nonabelian animation universal property to this prelog-specific compact-projective subcategory.

**Node:** `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`. **Direct prerequisites:** `CrystallineCohomology:CR.5:log-algebra`, `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), §§4–5, Propositions 5.3–5.5; Remark 6.10. The forgetful functors preserve the common projective resolutions. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), §2.1, Definition 2.4 and Remark 2.8, pp.12–14. The free prelog generators give the compact-projective animation presentation.

**Construction or proof route.**

1. Import integral/fine/saturated prelog algebra and strict/exact predicates from CR.5.
2. Construct the free prelog adjunction and its simplicial cotriple with both generator types.
3. Use the underlying ring/monoid resolution comparisons to establish augmentation equivalence and homotopy independence.
4. Use EDS’s generic animation theorem once, applied to these compact projectives; the generic theorem is not re-planned.

**Uses that determine the API.**

- DD.6 Gabber cotangent, derived de Rham and logarithmic Cartier: One common two-sort resolution supports all log constructions and their naturality.

**API contract.**

- `TauCeti.DerivedDeRham.freePrelogUniversal` (universal-property). A base prelog map from the free object is uniquely determined by its ordinary ring generators and compatible monoid generators.
- `TauCeti.DerivedDeRham.prelogResolutionAugmentation` (data). The canonical resolution has a surjective augmentation on ring and monoid in every simplicial degree.
- `TauCeti.DerivedDeRham.prelogResolutionComparison` (equivalence). Projective resolutions compare coherently after realization.
- `TauCeti.DerivedDeRham.prelogAnimationExtend` (universal-property). A sifted-colimit preserving enhanced prelog functor is determined on the finite free objects.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_prelog_free_empty` (degenerate). With both generator sets empty the free object is (A,M).
- `TauCeti.DerivedDeRham.test_prelog_free_two_generators` (computation). One ordinary t and one monoid x give (A[t,x],M⊕N), with x the image of the monoid generator.
- `TauCeti.DerivedDeRham.test_prelog_free_no_identification` (non-example). The monoid generator x is not freely mapped independently of its ring image; forgetting this compatibility gives the wrong adjunction.

**Acceptance checks.**

- The monoid generators and the extra ordinary polynomial generators are distinct.

### Derived logarithmic derivations

**Definition — `TauCeti.DerivedDeRham.logDerivedDerivations`**

For a map (A,M)→(B,N) and a connective animated B-module P, define the derived log derivation space as the space of base-compatible sections of (B⊕P,N⊕P)→(B,N). The ring is the split square-zero extension, the monoid operation is (n,u)(n′,u′)=(nn′,u+u′), and its structure sends (n,u) to (α(n),α(n)u). For discrete modules the sections are a ring derivation D:B→P and additive log derivative δ:N→P satisfying D(α(n))=α(n)δ(n), with both zero on the base.

**Node:** `DerivedDeRhamCohomology:DD.6/log-derived-derivations`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.0/derived-derivations`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Remark 6.6 and displayed equivalence (6), pp.25–26. The split prelog square-zero extension gives an independent functor-of-points description.

**Construction or proof route.**

1. Import the ring square-zero extension and equip its monoid factor with the displayed operation and structure.
2. Form the enhanced relative section space, using a projective prelog replacement.
3. For discrete modules identify sections with the compatible pair (D,δ), including base vanishing.
4. Check homotopy naturality in the module and the prelog map.

**Uses that determine the API.**

- DD.6 Gabber characterization and log deformation interfaces: The intrinsic description detects both d log and the extra homology of singular/nonintegral charts.

**API contract.**

- `TauCeti.DerivedDeRham.logDerivationsDiscrete` (characterisation). π₀ for a discrete module is the compatible pair (D,δ) satisfying Dα=αδ.
- `TauCeti.DerivedDeRham.logDerivationsModuleMap` (functoriality). A B-linear P→P′ induces the coherent map of section spaces.
- `TauCeti.DerivedDeRham.logDerivationsFree` (simp). For finite free prelog generators the sections are freely specified by ordinary D(t) and logarithmic δ(x).
- `TauCeti.DerivedDeRham.logDerivationsRepresented` (universal-property). The Gabber cotangent represents this functor by Map_B(L_log,P).

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_derivations_identity` (degenerate). For the identity prelog map, the section space is contractible.
- `TauCeti.DerivedDeRham.test_log_derivations_coordinate` (computation). For (A,0)→(A[x],N), a log derivation has D(x)=xδ(1).
- `TauCeti.DerivedDeRham.test_log_derivations_log_point` (computation). For (k,0)→(k,N→0), discrete derivations have D=0 and arbitrary δ(1)∈P; the representing derived object still has an additional negative cotangent term.

**Acceptance checks.**

- The section space is not replaced by its set of connected components.

### The Gabber logarithmic cotangent complex

**Construction — `TauCeti.DerivedDeRham.gabberLogCotangent`**

For an animated prelog map (A,M)→(B,N), define L_log by realizing Ω¹_log of the common free prelog resolution and derived-extending its module coefficients to B. It represents the independently defined log derivation space, is natural and resolution-independent, and has the universal ring derivation d and monoid map d log. For ordinary rings H⁰ is the imported ordinary logarithmic differential module, with dα(n)=α(n)d log n. This is Gabber’s complex; Olsson’s complex is identified only in the proved integral morphism range, not for all log smooth maps.

**Node:** `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/log-derived-derivations`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `CrystallineCohomology:CR.5:log-algebra`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 6.3, Remark 6.4, Proposition 6.5 and Remark 6.6, pp.24–26. Gabber’s free-resolution and derivation characterizations keep the convention separate from Olsson’s. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Definition 2.5, Lemmas 2.9–2.10, Remark 2.13, pp.13–15. The source warns that Gabber cotangent can be unbounded even for a nonintegral log étale map.

**Construction or proof route.**

1. Use CR.5’s ordinary log differential module and its free-generator formula.
2. Animate that module functor on the same free prelog category.
3. For free objects identify maps out of Ω_log with the section space, then extend by the animation universal property.
4. Identify H⁰ for ordinary inputs, the universal d and d log, and the strict ordinary specialization.
5. State any Gabber–Olsson comparison with its integral morphism hypotheses and imported proof gap.

**Uses that determine the API.**

- DD.6 log derived de Rham; KY §§2–3; PR.8: The full Gabber complex and convention-specific universal maps supply the derived log Hodge pieces.

**API contract.**

- `TauCeti.DerivedDeRham.logCotangentUniversal` (universal-property). Map_B(L_log,P)≃Der_log((B,N)/(A,M),P).
- `TauCeti.DerivedDeRham.logCotangentH0` (equivalence). For ordinary inputs H⁰L_log≃Ω¹_log with the displayed d/d log relation.
- `TauCeti.DerivedDeRham.logCotangentOrdinaryMap` (data). There is a natural map L_(B/A)→L_log, an equivalence when the monoid map is an isomorphism.
- `TauCeti.DerivedDeRham.logCotangentNaturality` (functoriality). Base-compatible prelog squares give coherent maps of the complexes and the universal d/d log.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_cotangent_identity` (degenerate). An identity prelog map has zero cotangent complex.
- `TauCeti.DerivedDeRham.test_log_cotangent_free` (computation). For (A,0)→(A[t,x],N), L_log is free in degree zero on dt and d log x, with dx=x d log x.
- `TauCeti.DerivedDeRham.test_log_cotangent_nonintegral` (non-example). KY Remark 2.13 with P generated by (2,0),(0,2),(1,1) inside N² and char(k)≠2 is log étale but has unbounded Gabber cotangent homology.

**Acceptance checks.**

- The nonintegral log étale example in KY Remark 2.13 is not assigned a degree-zero Gabber complex.

### Log cotangent transitivity, base change and invariance

**Theorem — `TauCeti.DerivedDeRham.logCotangentFunctoriality`**

For composable animated prelog maps R→S→T, L_log(S/R)⊗^L_S T→L_log(T/R)→L_log(T/S) is a canonical fiber sequence. A homotopy pushout of prelog rings gives the corresponding derived cotangent base-change equivalence, and filtered colimits commute with L_log. Passage to the associated log structure preserves the Gabber cotangent complex in the source’s established log-equivalence range; a map inducing an isomorphism of associated log rings has relative cotangent zero. For an integral morphism of integral prelog rings that is log smooth after logification, L_log≃Ω¹_log. The derived pushout is replaced by the ordinary one only under the homological log-flat condition.

**Node:** `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Lemmas 2.10,2.14, Theorem 2.11 and Remark 2.12, pp.14–16. The cotangent base-change and integral log-smooth statements retain the correct hypotheses.

**Construction or proof route.**

1. Prove the transitivity sequence on free composable prelog resolutions and realize the module sequence.
2. Use the universal derivation characterization for the homotopy-pushout base change and filtered colimits.
3. Apply the source’s associated-log comparison using the log derivation section description.
4. Import the qualified integral Gabber–Olsson/smooth identification; do not infer it from log smoothness alone.

**Acceptance checks.**

- Strict maps with identical monoids specialize to the ordinary full cotangent triangle.
- The KY nonintegral log étale example defeats the unqualified smooth degree-zero conclusion.

### Homological logarithmic flatness

**Definition — `TauCeti.DerivedDeRham.homologicalLogFlatness`**

A prelog map R→S is homologically log flat (hlf) if every prelog base map R→S′ makes the derived pushout S′⊔^L_R S equivalent to its ordinary pushout. It is hlf faithfully flat if additionally the underlying ring map is faithfully flat. Equivalently require ordinary ring flatness and the monoid homotopy-pushout flatness of Bhatt Definition 4.8. This is different from Kato log flatness in both directions. Coverings define the hlf topology on prelog algebras.

**Node:** `DerivedDeRhamCohomology:DD.6/homological-log-flatness`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Definition 2.44 and Remarks 2.45–2.46, pp.23–24. The homotopy-pushout flatness condition is explicitly distinct from Kato log flatness. [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 4.8 and Proposition 4.9, pp.20–21. The monoid flatness condition controls underived coproducts.

**Construction or proof route.**

1. Define the universal derived-versus-ordinary pushout condition in the enhanced prelog category.
2. Use the underlying ring and monoid forgetful functors to prove the equivalent pair of flatness conditions.
3. Prove composition and base-change stability and the hlf pretopology.
4. Check both examples of inequivalence with Kato log flatness in KY Remark 2.46.

**Uses that determine the API.**

- KY §§2.5–3; DD.6 base change and descent: The precise flatness notion decides when ordinary Čech terms compute derived prelog pushouts.

**API contract.**

- `TauCeti.DerivedDeRham.hlfUnderlyingCriteria` (characterisation). Hlf iff ring-flat and monoid homotopy-pushout-flat.
- `TauCeti.DerivedDeRham.hlfPushoutOrdinary` (equivalence). Every base change has the displayed derived-to-ordinary pushout equivalence.
- `TauCeti.DerivedDeRham.hlfCompositionBaseChange` (compatibility). Hlf and hlf faithful-flat maps are stable under composition and base change.
- `TauCeti.DerivedDeRham.hlfIntegralSufficient` (characterisation). An underlying flat ring map with injective integral map of integral monoids is hlf.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_hlf_strict_flat` (computation). A strict map with flat underlying ring is hlf.
- `TauCeti.DerivedDeRham.test_hlf_diagonal` (computation). The diagonal (k,N→0)→(k,N²→0) is hlf but not Kato log flat.
- `TauCeti.DerivedDeRham.test_hlf_nonintegral_kato` (non-example). For P generated by (2,0),(0,2),(1,1) in Q=N², (k[P],P)→(k[Q],Q) is Kato log flat but not hlf.

**Acceptance checks.**

- Log flatness is never used as a synonym for hlf in a derived base-change proof.

### Logarithmic derived de Rham

**Construction — `TauCeti.DerivedDeRham.logDerivedDeRham`**

For an animated prelog map (A,M)→(B,N), realize the ordinary log de Rham dg algebra of the common free prelog resolution with direct sums along antidiagonals. This gives an E∞ A-algebra dR_log with universal ordinary d and closed d log:N→dR_log[1]. It has a decreasing multiplicative Hodge filtration with gr_H^i≃L∧^i_B L_log[−i], an increasing exhaustive conjugate filtration, a separate Hodge completion and the DD.1 p-completion. Strict maps with identical monoids recover ordinary derived de Rham. The derived algebra is A-linear; its full differential is generally not B-linear.

**Node:** `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-universal-property`, `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 6.8, Proposition 6.9, Remarks 6.10–6.11, pp.25–26. The log differential and both filtration directions are constructed before realization. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Construction 2.6, p.13. The source’s unshifted definition of LΩ^i requires the explicit [−i] in its Hodge graded formula.

**Construction or proof route.**

1. Import Ω_log with its universal relation and construct the free log dg algebra, retaining odd squares zero.
2. Realize the common simplicial diagram and carry multiplication and both filtrations through the enhancement.
3. Identify the Hodge graded pieces by the same derived-power animation as the log cotangent complex.
4. Realize the closed d log maps into the shifted complex and apply the separate completion functors.
5. Keep the [−i] convention despite the omitted shifts in KY Construction 2.6.

**Uses that determine the API.**

- DD.6 Cartier/crystalline maps; HQ.2; PR.8: The same filtered enhanced object carries the universal d log used in logarithmic periods.

**API contract.**

- `TauCeti.DerivedDeRham.logDeRhamHodgeGraded` (equivalence). gr_H^i dR_log≃L∧^i L_log[−i].
- `TauCeti.DerivedDeRham.logDeRhamDLog` (data). The additive monoid map d log is closed and lands in dR_log[1].
- `TauCeti.DerivedDeRham.logDeRhamStrict` (equivalence). For identical base and target monoids, dR_log is ordinary derived de Rham.
- `TauCeti.DerivedDeRham.logDeRhamCompletions` (data). Hodge and p-completion are separate functors with their specified universal maps and quotient towers.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_derham_identity` (degenerate). An identity prelog map gives the base ring with no positive Hodge pieces.
- `TauCeti.DerivedDeRham.test_log_derham_free_coordinate` (computation). For (F_p,0)→(F_p[x],N), d(x)=x d log x and d(d log x)=0.
- `TauCeti.DerivedDeRham.test_log_derham_rational_logification` (non-example). Bhatt Example 6.15: strict Q→Q[x,x⁻¹] gives uncompleted dR=Q, while logifying the units adds a degree-one conjugate class.

**Acceptance checks.**

- Uncompleted log de Rham can fail logification invariance over Q; completion or characteristic hypotheses are separate.

### Log de Rham base change and Künneth

**Theorem — `TauCeti.DerivedDeRham.logDeRhamBaseChange`**

For a homotopy pushout of prelog A-algebras S₁,S₂ with result S, dR_log(S₁/A)⊗^L_A S₂≃dR_log(S/S₂), and dR_log(S₁/A)⊗^L_A dR_log(S₂/A)≃dR_log(S/A), compatibly with the Hodge filtrations and multiplication. The p-completed versions use completed derived tensor. The first tensor is over the base ring A; dR_log(S₁/A) is not generally an S₁-module, so the additional S₁-relative tensor printed in KY Theorem 2.11 is not used.

**Node:** `DerivedDeRhamCohomology:DD.6/log-de-rham-base-change`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/homological-log-flatness`, `DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth`, `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 6.12 and proof, p.26. The primary proof tensors de Rham over the base ring A. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Theorem 2.11, second displayed formula p.15. Only the valid base-linear de Rham comparison is retained; the extra target-ring tensor is a source misprint.

**Construction or proof route.**

1. On two free prelog algebras split ordinary and log generators and compute the differential forms.
2. Form the homotopy coproduct of projective replacements and realize the signed tensor isomorphisms.
3. Use hlf only when identifying that pushout with an ordinary one.
4. Apply the specified p/Hodge completions and their exact base-change hypotheses.

**Acceptance checks.**

- The differential on A[t] has d(t)=dt, so it is not A[t]-linear; tensoring the full complex over A[t] is not defined without a different coefficient construction.

### Derived logarithmic Cartier theory

**Theorem — `TauCeti.DerivedDeRham.logCartier`**

For a map (A,M)→(B,N) of prelog F_p-algebras, define the Frobenius of the base by p on M and Frobenius on A and form the homotopy prelog pushout (B,N)^(1). The relative Frobenius maps it to (B,N). The increasing conjugate filtration of dR_log is linear over its twisted underlying ring and gr_i^conj≃L∧^i L_log((B,N)^(1)/(A,M))[−i]. On free ordinary coordinates y, inverse Cartier sends dy to [y^(p−1)dy]; on free log coordinates x it sends d log x to [d log x]. All twists are derived unless the ring and monoid flatness criteria are proved.

**Node:** `DerivedDeRhamCohomology:DD.6/log-cartier`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Notation 7.1, Lemma 7.2, Theorem 7.3 and Proposition 7.4, pp.27–28. The log-coordinate Cartier calculation extends along the common resolution. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Notation 2.15 and Construction 2.6, pp.13,16. The same prelog twist is used with the corrected cohomological shifts.

**Construction or proof route.**

1. Form the prelog derived Frobenius pushout and its relative map before computing any graded pieces.
2. Compute free coordinate Cartier with both generator types and the actual twisted module action.
3. Realize canonical cohomological Cartier maps, obtaining coherent linearity and the derived power formula.
4. Use the DD.3 convergence conditions for each log spectral-sequence application; no arbitrary strong convergence is automatic.

**Acceptance checks.**

- For a free log coordinate, d log x survives Cartier without the ordinary x^(p−1) factor.
- Frobenius on monoids is p multiplication; it is not omitted from the base twist.

### The boundary of logification invariance

**Theorem — `TauCeti.DerivedDeRham.logificationBoundaries`**

For maps of integral prelog Z/p^n-algebras, n≥1, passage to associated log structures preserves uncompleted log derived de Rham with its specified Hodge and conjugate filtrations. The proof uses the derived logarithmic Cartier pieces modulo p and finite p-devissage. The p-completed statement follows under the corresponding integral and compatible derived-reduction hypotheses. No characteristic-zero uncompleted invariance is asserted: Bhatt Example 6.15 is a required counterexample. Cotangent logification invariance and this de Rham assertion have different ranges.

**Node:** `DerivedDeRhamCohomology:DD.6/logification-boundaries`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Corollary 7.5 and proof, pp.28–29; Example 6.15, p.27. The source restricts de Rham logification invariance to integral monoids in the nilpotent-p range.

**Construction or proof route.**

1. Use the associated-log invariance of the Gabber complex in the actual derived Frobenius pushout.
2. For integral monoids, compare the twisted logifications as in the source’s pushout argument.
3. Compare conjugate graded pieces modulo p and use exhaustiveness.
4. Lift through the finite p-filtration, then take specified p-adic limits.

**Acceptance checks.**

- Over Q the Laurent unit-logification example adds a class that strict uncompleted de Rham misses.

### Integral log smooth Cartier-type comparison

**Comparison — `TauCeti.DerivedDeRham.logSmoothCartierComparison`**

For a map of integral prelog F_p-algebras that is integral and log smooth of Cartier type after associated logification, Gabber L_log is the ordinary log differential module and derived log de Rham agrees with the ordinary log complex. Nilpotent-p extensions retain flatness and finite devissage hypotheses. Cartier type is the source’s condition on the relative Frobenius exactness and twist; it is not inferred from fs log smoothness alone.

**Node:** `DerivedDeRhamCohomology:DD.6/log-smooth-cartier-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.6/logification-boundaries`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Corollary 7.6 and Remark 7.7, p.29. The integral log smooth Cartier-type comparison keeps the log cotangent convention. [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Lemma 2.14, pp.15–16. Integral log smoothness is the stated Gabber degree-zero comparison range.

**Construction or proof route.**

1. Import the integral log smooth differential computation.
2. Use classical logarithmic Cartier on the ordinary complex and derived Cartier on its resolution.
3. Compare graded pieces with their actual Frobenius twist and apply exhaustive realization.
4. For Z/p^n use flat finite devissage; apply p-completion only to the compatible reductions.

**Acceptance checks.**

- Bhatt Example 7.23 is log étale but nonintegral and not Cartier type, and lies outside this theorem.

### The log crystalline comparison map

**Construction — `TauCeti.DerivedDeRham.logCrystallineComparisonMap`**

For a prelog Z/p^n-map f:(A,M)→(B,N), use the standard free prelog resolution P•→(B,N). For every effective epimorphism P_i→(B,N), first exactify it, then form the ordinary strict PD envelope compatible with p. The natural map Ω•_log(P•/(A,M))→Ω•_log(P•/(A,M))⊗_(P•,Alg)D_log(P•→(B,N)) yields Comp_log:dR_log(f)→RΓ(f_log-crys,O_crys) via the imported log PD Poincaré equivalence. It is natural, multiplicative and respects Hodge/PD filtrations. Strictification is performed before taking the PD envelope.

**Node:** `DerivedDeRhamCohomology:DD.6/log-crystalline-comparison-map`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.4/crystalline-comparison-map`, `CrystallineCohomology:CR.5:log-algebra`, `CrystallineCohomology:CR.0`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 7.18 and proof, p.30. The source explicitly requires exactification before the strict logarithmic PD envelope.

**Construction or proof route.**

1. Import the early CR.5 exactification, strict PD envelope and log PD Poincaré maps.
2. Apply those functors to each surjective free-resolution term, keeping the monoid as well as ring epimorphism.
3. Map the log de Rham algebra to the log PD model and use the coherent comparison to the constant classical log crystalline object.
4. Realize and descend the map; check strict specialization agrees with DD.4 Comp.

**Uses that determine the API.**

- DD.6 corrected G-lci theorem; CR.5 integration; PR.8: This supplies the actual compatible log comparison map before imposing its isomorphism hypotheses.

**API contract.**

- `TauCeti.DerivedDeRham.logCrystallineComparisonNatural` (functoriality). Prelog base squares induce the commuting comparison-map squares.
- `TauCeti.DerivedDeRham.logCrystallineComparisonFiltered` (compatibility). Hodge terms map to the log crystalline PD filtration.
- `TauCeti.DerivedDeRham.logCrystallineComparisonStrict` (compatibility). For strict maps with fixed log structure the map is the ordinary Comp.
- `TauCeti.DerivedDeRham.logCrystallineComparisonExactification` (characterisation). The target model uses the exactification followed by the strict PD envelope, functorially.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_crys_identity` (degenerate). For an identity log map, Comp is the base identity.
- `TauCeti.DerivedDeRham.test_log_crys_strict_regular` (computation). A strict regular quotient in the nilpotent-p flat range agrees with the DD.4 PD comparison.
- `TauCeti.DerivedDeRham.test_log_crys_noncartier` (non-example). Bhatt Example 7.23 has a comparison map but its relative Frobenius-twisted source and ordinary crystalline target differ.

**Acceptance checks.**

- The map exists beyond its subsequent isomorphism range.

### The corrected logarithmic lci condition

**Definition — `TauCeti.DerivedDeRham.correctedLogLciCondition`**

For n≥1, call a prelog Z/p^n-map corrected G-lci when its underlying source and target are Z/p^n-flat and it admits, locally or compatibly as an inductive limit, a factorization a followed by b: a is log smooth and of Cartier type modulo p (or an inductive limit of such maps), and b is strict with underlying surjection whose kernel is generated by a regular sequence. For an inductive factorization require the corresponding filtered regular-sequence presentations and compatibility of the comparison construction. Strict effective epimorphism alone, as printed in Bhatt Definition 7.20, is insufficient.

**Node:** `DerivedDeRhamCohomology:DD.6/corrected-log-lci-condition`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-smooth-cartier-comparison`, `DerivedDeRhamCohomology:DD.6/log-crystalline-comparison-map`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `CrystallineCohomology:CR.5:log-algebra`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:RingTheory.Sequence.IsRegular`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 7.20, Example 7.21 and Theorem 7.22 proof sketch, p.31. The corrected condition inserts exactly the regular quotient hypothesis used by the proof and the accepted RT-AREA-padic-2/7 finding.

**Construction or proof route.**

1. Define the explicit factorization witness, including flatness, Cartier type, strictness and regular kernel.
2. Record the local/filtered variants separately and carry the comparison maps through their filtered colimits.
3. Check every one of Example 7.21’s three intended applications against the stronger quotient condition.
4. Reject the trivial-log non-lci square-zero quotient even though it satisfies the printed condition.

**Uses that determine the API.**

- DD.6 Bhatt Theorem 7.22; semistable and period examples: The corrected factorization makes the ordinary DD.4 lci comparison applicable to the strict step.

**API contract.**

- `TauCeti.DerivedDeRham.correctedGLciFactorization` (data). The condition returns the chosen factorization with its regular quotient and modulo-p Cartier witnesses.
- `TauCeti.DerivedDeRham.correctedGLciStrictRegular` (example). A strict regular quotient of flat Z/p^n-algebras is in the condition, with identity first factor.
- `TauCeti.DerivedDeRham.correctedGLciLocalFiltered` (compatibility). Local regular presentations and the specified compatible filtered colimit factorizations retain the comparison criterion.
- `TauCeti.DerivedDeRham.correctedGLciExample721` (example). All three source examples are supplied with the appropriate finite or filtered regular quotient presentation.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_corrected_glci_identity` (degenerate). The identity map has empty regular sequence and Cartier-type first factor.
- `TauCeti.DerivedDeRham.test_corrected_glci_hypersurface` (computation). The strict quotient F_p[t]→F_p by the regular element t qualifies.
- `TauCeti.DerivedDeRham.test_corrected_glci_square_zero` (non-example). F_p→F_p[x,y]→F_p[x,y]/(x,y)² with trivial logs satisfies the printed condition but fails this corrected regular quotient condition.

**Acceptance checks.**

- Both the Cartier-type and regular-kernel hypotheses are essential.

### The corrected log crystalline comparison theorem

**Theorem — `TauCeti.DerivedDeRham.logLciCrystallineComparison`**

For a corrected G-lci prelog Z/p^n-map, Comp_log is an equivalence of Hodge-filtered E∞ algebras. Its compatible p-adic version uses derived limits of flat finite reductions with the same corrected factorization. The proof combines integral Cartier-type log smooth comparison for a with the DD.4 regular quotient comparison for b and the logarithmic relative conjugate filtration. This is the valid scope of Bhatt Theorem 7.22 after repairing Definition 7.20. Neither arbitrary strict surjections nor every fs log smooth map are included.

**Node:** `DerivedDeRhamCohomology:DD.6/log-lci-crystalline-comparison`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/corrected-log-lci-condition`, `DerivedDeRhamCohomology:DD.6/log-crystalline-comparison-map`, `DerivedDeRhamCohomology:DD.6/log-smooth-cartier-comparison`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.6/log-de-rham-base-change`, `DerivedDeRhamCohomology:DD.4/regular-pd-comparison`, `DerivedDeRhamCohomology:DD.4/lci-crystalline-comparison`, `DerivedDeRhamCohomology:DD.4/p-adic-crystalline-comparison`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Theorem 7.22 proof sketch and Corollary 7.8, pp.29,31. The proof needs the strict regular quotient repaired in the definition.

**Construction or proof route.**

1. For the log smooth Cartier-type first factor use the ordinary log comparison and finite p-devissage.
2. For the strict regular quotient use the DD.4 ordinary PD comparison; the two log structures agree on this step.
3. Construct the logarithmic relative conjugate filtration and compare the Gauss–Manin/Frobenius descent connections as in Corollary 7.8.
4. For filtered factorizations prove the actual comparison and classical PD model commute with the prescribed filtered colimits; retain this as a proof interior if unavailable.
5. Glue local factorizations and take the compatible derived p-adic limit.

**Acceptance checks.**

- Bhatt Example 7.23 fails the Cartier-type hypothesis.
- The trivial-log non-lci quotient from Example 3.21 fails the regular-kernel hypothesis.
- All three intended Example 7.21 cases remain covered by explicit regular quotient presentations.

### Log quasisyntomic sites and QRSP bases

**Definition — `TauCeti.DerivedDeRham.logQuasisyntomicSites`**

A log-quasisyntomic prelog ring (R,P) has R p-complete with bounded p-torsion and Gabber L_log((R,P)/Z_p) of p-complete Tor amplitude [−1,0]; P need not be integral in KY Definition 3.2. A map A→B between bounded-torsion p-complete prelog rings is p-completely homologically log flat when B⊗^L_A A/p≃B/p is discrete and A/p→B/p is hlf. It is log-quasisyntomic when additionally L_log(B/A)⊗^L_B B/p has Tor amplitude [−1,0], and a cover when the mod-p map is hlf faithfully flat. These covers define QSyn_prelog and the relative qSyn_(R,P) of log-quasisyntomic maps. For a perfectoid prelog base, the big slice has the analogous amplitude/descent package. Integral monoids are an additional restriction of the subsequent log-smooth/prismatic applications, not built into the general site definition.

**Node:** `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/homological-log-flatness`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`, `DerivedDeRhamCohomology:DD.1/complete-flatness`, `PerfectoidQuotients:Q0:integral-algebra`, `CrystallineCohomology:CR.5:log-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Definitions 3.1–3.3, Lemmas 3.5–3.6, Corollary 3.7 and Remarks 3.8–3.9, pp.27–28. The site keeps the exact completed hlf condition; integrality is separate.

**Construction or proof route.**

1. Require discreteness of B⊗^L_A A/p and hlf of the actual mod-p prelog map, with both ring and monoid conditions.
2. Use log cotangent transitivity/base change for stability and object descent.
3. Use the separate compatible-root cover construction on ring and monoid generators; keep general prelog and integral application categories distinct.
4. Use KY Lemma 3.6 for the site pretopology and the precise relative/big-slice distinction, without a log-prismatic theorem.

**Uses that determine the API.**

- KY §§2–3; PR.8: The log site supplies the exact descent input to the subsequent logarithmic prismatic branch.

**API contract.**

- `TauCeti.DerivedDeRham.logQSynCover` (characterisation). A cover retains complete faithful-flatness, completed hlf and relative log cotangent amplitude [−1,0].
- `TauCeti.DerivedDeRham.logQSynBaseChange` (compatibility). The completed homotopy prelog base change preserves the stated covers.
- `TauCeti.DerivedDeRham.logQSynQrspBasis` (constructor). The separate compatible-root construction gives general prelog QRSP basis objects; integrality of an output is checked separately when an application needs it.
- `TauCeti.DerivedDeRham.logQSynUnfolding` (equivalence). Restriction to the KY general prelog QRSP basis and enhanced totalization are inverse sheaf constructions.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_qsyn_strict` (computation). With identical monoids and the strict conventions, the ordinary QSyn condition is recovered.
- `TauCeti.DerivedDeRham.test_log_qsyn_semistable` (computation). The p-complete integral semistable chart is log quasisyntomic over its logarithmic O_K base.
- `TauCeti.DerivedDeRham.test_log_qsyn_hlf_boundary` (non-example). A Kato log-flat map that is not hlf fails the log QSyn cover condition, even if its ring reduction is flat.

**Acceptance checks.**

- The general site permits nonintegral monoids; application-specific integral restrictions and Kato log flatness remain separate.

### Log cotangent powers and completed de Rham descent

**Theorem — `TauCeti.DerivedDeRham.logPowerDeRhamDescent`**

For a fixed prelog base, derived exterior powers of the Gabber log cotangent satisfy hlf faithfully-flat Čech descent. Finite Hodge quotients of log derived de Rham inherit descent; the Hodge-completed object descends by its quotient limit. In the log-quasisyntomic range, p-completed uncompleted log de Rham descends using the uniformly bounded-below conjugate filtration. The completion and totalization exchanges retain their boundedness hypotheses and the actual prelog homotopy Čech nerve.

**Node:** `DerivedDeRhamCohomology:DD.6/log-power-de-rham-descent`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/homological-log-flatness`, `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`, `DerivedDeRhamCohomology:DD.6/log-compatible-root-covers`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`, `DerivedDeRhamCohomology:DD.5/completed-cotangent-descent`, `DerivedDeRhamCohomology:DD.5/filtered-de-rham-descent`, `DerivedDeRhamCohomology:DD.5/uncompleted-p-de-rham-descent`, `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Proposition 2.47 and Corollaries 2.48–2.49, pp.24–26. The length-i+1 power filtration proves hlf descent; the completed versions use the specified reductions.

**Construction or proof route.**

1. Filter the log cotangent power of each Čech term by the transitivity triangle, with i+1 finite pieces.
2. The base piece descends by ordinary ring faithful-flatness; positive relative pieces totalize to zero using the split Čech comparison.
3. Take finite Hodge extensions, then Hodge inverse limits.
4. Reduce the p-complete map modulo p; use log Cartier and the log QSyn uniform amplitude before exchanging filtered colimit with Tot.

**Acceptance checks.**

- The hlf hypothesis identifies ordinary and homotopy prelog Čech nerves.
- Unbounded p-torsion or uncontrolled totalizations do not satisfy the stated completion/descent proof.

### The log point and its full cotangent complex

**Application — `TauCeti.DerivedDeRham.logPointExample`**

For a field k, the standard log point is (k,N) with every positive monoid element sent to 0. Over the trivial prelog base (k,0), its Gabber complex is [k --0→ k] in cohomological degrees −1,0: factor through the free log line (k[t],N), then the strict regular quotient t=0, whose conormal maps to t d log t=0. H⁰ is k·d log 1 and H^(−1) is k; the log point over this trivial base is not assigned the integral log-smooth degree-zero theorem. Over itself the relative complex is zero and derived de Rham is k. Over F_p its Hodge/conjugate powers retain both cotangent degrees and the actual derived twist.

**Node:** `DerivedDeRhamCohomology:DD.6/log-point-example`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Example 6.2, Proposition 6.5 and the strict regular quotient calculation §§3.3,6. The free log-coordinate module and strict quotient transitivity give the explicit two-term log-point computation.

**Construction or proof route.**

1. Use the free log line cotangent generator d log t in degree zero.
2. Use the regular quotient t=0 with identical monoids for the degree −1 conormal.
3. Compute its map as dt=t d log t and reduce t=0, giving the zero differential.
4. Use the separate identity-base case as a degenerate check and derive both filtrations by their full cotangent formulas.

**Acceptance checks.**

- The ordinary ring map k→k has zero ordinary cotangent, but the logarithmic map over the trivial log base has two nonzero degrees.
- The base log structure is specified in every result.

### The semistable chart with its actual monoid map

**Application — `TauCeti.DerivedDeRham.semistableChartExample`**

Let O_K be a complete mixed-characteristic DVR with uniformizer π and perfect residue field. For 1≤r≤d, B=O_K[x₁,…,x_d]/(x₁…x_r−π), or its p-adic completion, carries the chart N^r→B, e_i↦x_i. The base chart is N→O_K, 1↦π, and the monoid map sends 1↦e₁+…+e_r. This is an integral log smooth Cartier-type chart; its relative Gabber cotangent is the finite free module on d log x₁,…,d log x_r, dx_(r+1),…,dx_d modulo Σd log x_i=0, in degree zero and rank d−1. For the completed chart use continuous completed differentials. The log de Rham Hodge and conjugate pieces, finite reductions and crystalline comparison retain this base chart; the unrelated trivial log base has a different cotangent complex.

**Node:** `DerivedDeRhamCohomology:DD.6/semistable-chart-example`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-smooth-cartier-comparison`, `DerivedDeRhamCohomology:DD.6/log-lci-crystalline-comparison`, `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.2/formal-ordinary-derham`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Example 7.21, third example, p.31. The source’s semistable example is retained with its actual diagonal base monoid map.

**Construction or proof route.**

1. Check the monoid chart, its group quotient Z^(r−1), integrality and the log smooth Cartier-type condition in the source’s range.
2. Use the qualified Gabber smooth comparison and compute the universal log differential relation from x₁…x_r=π.
3. Construct the exterior differential algebra and its two filtrations on the specified chart.
4. Reduce modulo p^n and apply the corrected log crystalline comparison; for formal charts take the compatible p-adic limit.

**Acceptance checks.**

- For r=d=2, L_log is rank one with d log x₁=−d log x₂.
- For r=1, d log x₁=0 and the remaining d−1 ordinary coordinates give a smooth relative algebra.
- Replacing the base monoid N by 0 removes the relation d log π=0 and changes the result.

### Logarithmic period d log and the Tate map

**Construction — `TauCeti.DerivedDeRham.logPeriodDlog`**

In the W,K,C period setup, the canonical uniquely divisible log structure on O_barK gives Λ_p L_(O_barK/W)≃Λ_p L_log((O_barK,can)/W) and Λ_p dR_log≃A_cris. Completing d log:μ_(p^∞)→dR_log[1] yields β:Z_p(1)→Fil_H¹ A_cris, G_K-equivariantly. Under the shared period identification β sends a compatible root-of-unity system ε to log([ε]); the logarithm converges in the imported completed PD ring. Z_p(1), the Galois action, and Tate’s period invariant theorem are imported from their arithmetic/period owners.

**Node:** `DerivedDeRhamCohomology:DD.6/log-period-dlog`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.6/log-cartier`, `DerivedDeRhamCohomology:DD.6/logification-boundaries`, `DerivedDeRhamCohomology:DD.4/acris-derived-description`, `DerivedDeRhamCohomology:DD.4/rational-hodge-period-comparison`, `DerivedDeRhamCohomology:DD.1/derived-completion`, `AInfCohomology:AI.0:integral`, `PadicHodgeTheory:R06.1`, `ArithmeticGaloisRepresentations:R01.1`.

**Sources:** [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 9.11, Proposition 9.13, Construction 9.15 and Proposition 9.16, pp.35–38. The derived d log map constructs the actual Tate-period map and identifies Fontaine’s logarithm.

**Construction or proof route.**

1. Use the uniquely p-divisible quotient monoid computation to prove the completed log cotangent agrees with the ordinary one.
2. Apply conjugate modulo-p comparison and p-completion to identify log derived de Rham with A_cris.
3. Complete the μ_(p^∞) d log map, tracking the [1] shift and the Tate module; take the induced degree-zero map β.
4. Use the explicit completed cotangent/conormal identification to compare the first Hodge classes with [ε]−1.
5. Import Tate’s theorem to show a G_K-equivariant difference in Fil_H² is zero after embedding in B_dR; keep convergence and separatedness supplied by the period owner.

**Uses that determine the API.**

- DD.6 log period interface; PadicHodgeTheory; CohomologyComparisons: The closed d log and its completed shift give a concrete comparison map into the first Hodge period filtration.

**API contract.**

- `TauCeti.DerivedDeRham.logPeriodOrdinaryComparison` (equivalence). The completed canonical log and ordinary period de Rham objects agree in this uniquely divisible setup.
- `TauCeti.DerivedDeRham.periodDLogTate` (data). β:Z_p(1)→Fil_H¹ A_cris is G_K-equivariant.
- `TauCeti.DerivedDeRham.periodDLogFormula` (simp). β(ε)=log([ε]) in the shared completed PD period ring.
- `TauCeti.DerivedDeRham.periodDLogFirstGraded` (compatibility). The first Hodge graded map agrees with the completed d log cotangent/conormal class.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_period_dlog_identity` (degenerate). The identity compatible root-of-unity system maps to log(1)=0.
- `TauCeti.DerivedDeRham.test_period_dlog_roots` (computation). For compatible ε, β(ε^a)=aβ(ε) and G_K acts through the Tate twist.
- `TauCeti.DerivedDeRham.test_period_dlog_logarithm_domain` (non-example). An arbitrary A_inf unit whose image is not 1 under θ is not assigned this Fil_H¹ PD logarithm by the construction.

**Acceptance checks.**

- The Tate twist and the first Hodge filtration are retained; β is not an ungraded scalar map.

### Log quasiregular semiperfectoid objects

**Definition — `TauCeti.DerivedDeRham.logQuasiregularSemiperfectoid`**

For a p-complete prelog ring (S,P), let P^♭=lim_(×p)P and P× be its units. It is log semiperfectoid in KY Definition 3.11 if (1) S admits a map from an integral perfectoid ring, (2) Frobenius on S/p is surjective, and (3) P^♭→P/P× is surjective. It is log quasiregular semiperfectoid if also (S,P) is log quasisyntomic. Integrality of P is a separately stated additional hypothesis, and is not imposed by this definition. The tilt-surjectivity clause is stronger than p-divisibility of P/P× and weaker than p-divisibility of P; these are not interchanged. Such objects have Λ_p L_log((S,P)/Z_p)[−1] complete-flat. Equivalently, with the log-semiperfect assumptions, require this shifted relative cotangent criterion for a perfectoid ring source equipped with trivial prelog structure.

**Node:** `DerivedDeRhamCohomology:DD.6/log-quasiregular-semiperfectoid`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `PerfectoidQuotients:Q0:integral-algebra`, `CrystallineCohomology:CR.5:log-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Definition 3.11, Remarks 3.12–3.15 and Lemma 3.16, pp.29–31. The exact monoid tilt-surjectivity condition and the separate integrality hypotheses are retained.

**Construction or proof route.**

1. Define the inverse-limit monoid tilt and its map to the sharp quotient.
2. Keep all three semiperfectoid clauses and the log QSyn condition separate.
3. Use semiperfectness and tilt-surjectivity to show the mod-p log differential module vanishes.
4. Apply the pure cotangent comparison of Lemma 3.16 for the shifted complete-flat criterion.
5. Construct the source prelog ring R completed-tensor W(S^♭) completed-tensor Z_p⟨P^♭⟩, with monoid P^♭, which surjects on rings and modulo monoid units.

**Uses that determine the API.**

- KY §3.2; DD.6 log descent; PR.8: The exact log QRSP basis supplies shifted flat cotangent powers while retaining the separate integrality hypotheses.

**API contract.**

- `TauCeti.DerivedDeRham.logQrspTiltCondition` (characterisation). P^♭→P/P× is surjective, with the ring perfectoid-source and semiperfectness conditions.
- `TauCeti.DerivedDeRham.logQrspCotangent` (characterisation). Under log semiperfectness, the shifted relative log cotangent is complete-flat exactly in the log QRSP range.
- `TauCeti.DerivedDeRham.logQrspPerfectoidSource` (data). The stated completed source prelog ring surjects on rings and modulo monoid units.
- `TauCeti.DerivedDeRham.logQrspDivisibilityRelations` (relation). P p-divisible implies tilt-surjectivity, which implies P/P× p-divisible; for sharp monoids the three conditions agree.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_qrsp_trivial` (compatibility). For trivial monoids the condition reduces to the ordinary QRSP ring condition.
- `TauCeti.DerivedDeRham.test_log_qrsp_divisible` (computation). If S is ordinary QRSP and P is uniquely p-divisible, then (S,P) is log QRSP by KY Example 3.15(1).
- `TauCeti.DerivedDeRham.test_log_qrsp_missing_ring_source` (non-example). (Z_p,0) has semiperfect reduction and the tilt condition, but lacks a perfectoid ring map and is excluded.

**Acceptance checks.**

- The monoid condition is not replaced by ring semiperfectness.
- The general definition does not promise integral monoids.

### Compatible-root covers of prelog rings

**Construction — `TauCeti.DerivedDeRham.logCompatibleRootCovers`**

For (R,P)∈QSyn_prelog, choose ring generators Z_p[X_i]→R and monoid generators N^(J)→P. Use the free p-complete prelog source (Z_p⟨X_i,Y_j⟩,N^(J)), with e_j↦Y_j, and its compatible-root cover (O_C⟨X_i^(1/p^∞),Y_j^(1/p^∞)⟩,N[1/p]^(J)) over an integral perfectoid O_C. The p-completed homotopy prelog base change to (R,P) gives a log QSyn cover by log QRSP objects, and its target monoid is p-divisible. The target need not be integral. All completed Čech terms remain log QRSP; restriction to this basis is an equivalence of sheaf categories in any presentable enhanced target.

**Node:** `DerivedDeRhamCohomology:DD.6/log-compatible-root-covers`. **Direct prerequisites:** `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`, `DerivedDeRhamCohomology:DD.6/log-quasiregular-semiperfectoid`, `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`, `DerivedDeRhamCohomology:DD.6/homological-log-flatness`, `DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers`, `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`.

**Sources:** [Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364), Lemmas 3.17–3.19 and Corollary 3.20 with proof, pp.31–32. The source’s two-sort compatible-root cover and Čech stability prove the general prelog basis theorem.

**Construction or proof route.**

1. Choose the two sets of generators and the free prelog source with the matching monoid-variable images.
2. At finite root stages use ring freeness, monoid flatness and relative log cotangent calculations to verify completed log QSyn.
3. Take the completed homotopy base change; the target is a quotient of the perfectoid source and its monoid a quotient of N[1/p]^(J), hence satisfies the exact semiperfect conditions.
4. Use Lemmas 3.17 and 3.19 to prove QRSP completed Čech stability.
5. Repeat the representable-sheaf argument of Corollary 3.20 for the sheaf equivalence and enhanced unfolding.

**Uses that determine the API.**

- KY §3.2; DD.6 completed log descent; PR.8: The log basis is built without assuming all quotient monoids are integral or invoking a log-prismatic theorem.

**API contract.**

- `TauCeti.DerivedDeRham.logRootCover` (constructor). The displayed completed two-sort pushout gives a log QSyn cover with log QRSP target.
- `TauCeti.DerivedDeRham.logRootCoverMonoid` (simp). The target monoid is p-divisible and satisfies the tilt-surjectivity condition.
- `TauCeti.DerivedDeRham.logRootCoverCech` (compatibility). Every completed Čech term is log QRSP.
- `TauCeti.DerivedDeRham.logRootCoverUnfolding` (equivalence). General prelog log QRSP basis sheaves unfold by the corresponding Čech totalization, independently of the cover.

**Unit tests.**

- `TauCeti.DerivedDeRham.test_log_root_cover_trivial` (compatibility). With no monoid generators, the construction specializes to the ordinary ring compatible-root cover.
- `TauCeti.DerivedDeRham.test_log_root_cover_coordinate` (computation). A free monoid coordinate x acquires compatible monoid roots and matching ring roots x^(1/p^n).
- `TauCeti.DerivedDeRham.test_log_root_cover_finite` (non-example). One finite root stage does not make the monoid p-divisible or the ring reduction semiperfect.

**Acceptance checks.**

- No integrality of the target monoid follows solely from being a quotient of a free p-divisible monoid.

### What keeps DD.6 open

- Gabber–Olsson and exactification proof interiors: Bhatt and KY cite Olsson’s full logification/transitivity/integral log-smooth results and Kato exactification/PD Poincaré. Those original papers were not fully read here. The exact theorem hypotheses are retained and CR.5 is requested to supply the original proofs, with no equality of cotangent conventions outside the integral range.
- Filtered corrected G-lci applications: The corrected finite regular-quotient theorem is explicit, but the filtered-colimit log crystalline comparison and all three Example 7.21 factorizations require a checked construction of compatible regular presentations. The complete Fontaine ind-lci proof and exact filtered PD/site exchange are not yet discharged; no claim follows merely from strict epimorphism.
- Two-sort log-quasisyntomic completion and root descent: KY §§2–3 state the completed hlf pushouts, general prelog QRSP root covers and descent; the full proof decomposition still needs the monoid derived-reduction and boundedness lemmas supplied by CR.5/EDS. The exact tilt-surjectivity clause, completed hlf condition and relative/big site conventions are stated, and the full monoid proof interiors remain to be decomposed.
- Enhanced signatures beyond the ordinary derived prototype: The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.
- Supplier CrystallineCohomology:CR.5:log-algebra: Early prelog/log algebra with integral, fine, saturated, strict/exact and Cartier-type predicates; ordinary log differential universal property; exactification followed by strict PD envelopes; log PD Poincaré comparison. This is an algebraic prefix independent of DD.6’s subsequent derived/crystalline comparison.
- Supplier ArithmeticGaloisRepresentations:R01.1: The G_K action, Tate module Z_p(1) of compatible p-power roots of unity, and coherent equivariant morphisms; period invariant/vanishing statements stay in PadicHodgeTheory.

## Source versions, corrections and access

The complete source inventory follows. It distinguishes the sections read from their cited proof inputs. Downloaded files are fingerprinted in the packet; a browser-only passage or metadata check has no invented hash. The three inherited author errata retain their earlier access dates and fingerprints. They were not the full original books.

- **[Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1)** (`bhatt-ddr-2012`). arXiv:1204.6560v1, 30 April 2012, 50-page PDF. Read: Printed/PDF pp.4–38 in full: conventions, §§2–3, free prelog resolutions §§4–6, log §7, p-completion §8, period comparison §9 through Proposition 9.20.; Earlier checkpoint read pp.3–8 and the author errata; full Illusie books remain unavailable proof inputs.
- **[The Stacks Project Authors, The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF)** (`stacks-0FKF`). Online version accessed 2026-09-26. Read: Inherited entire-section reading: differential construction, naturality, Lemmas 10.132.1–2 and comments. The original checkpoint supplied fixed-base naturality; this pass plans general base squares and the separate flat-base comparison.
- **[The Stacks Project Authors, Kernel of the tensor-to-exterior map, Lemma 10.13.4](https://stacks.math.columbia.edu/tag/0H1C)** (`stacks-0H1C`). Online version accessed 2026-09-26. Read: Entire lemma; its proof is omitted in the source. This is a proof-route cross-check, not a claim that the tensor-kernel presentation has been proved at the baseline.
- **[Joël Riou, feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551)** (`riou-pr18551`). Unmerged Mathlib PR 18551, head 5888c0081ba867ede5c60d3060f2d674d932b53c. Read: The complete 432-line proposed DeRham.lean reconstructed from the fetched patch, including tautological algebra presentation, scalar restriction, d, d_d and deRhamComplex.; This hash is of the reconstructed added source file. The PR is a design reference, not a pinned declaration, not a module imported by the suggested file, and not a mergeability certification.
- **[Luc Illusie, Errata: Complexe cotangent et déformations I](https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf)** (`illusie-I-errata`). Author erratum. Read: All pages and the replacement argument read. The original book chapters have not been fully read in this job.
- **[Luc Illusie, Errata: Complexe cotangent et déformations II](https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf)** (`illusie-II-errata`). Author erratum. Read: All pages and the replacement argument read. The original book chapters have not been fully read in this job.
- **[Pierre Berthelot and Arthur Ogus, Erratum to Notes on crystalline cohomology](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf)** (`bo-2013-erratum`). Author erratum dated 21 August 2013. Read: All pages and the replacement argument read. The original book chapters have not been fully read in this job.
- **[Bhargav Bhatt, Matthew Morrow and Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf)** (`bms2`). Published, Publ. Math. IHÉS 129 (2019), pp.199–310. Read: §3.1–3.3, §4 in full; §5.1–5.7, Examples 5.11–5.12; §8.2 in full, pp.270–275; §9.2 through Theorem 9.6 proof; Remark 10.4
- **[Bhargav Bhatt and Jacob Lurie, Absolute prismatic cohomology](https://arxiv.org/pdf/2201.06120)** (`bhatt-lurie`). arXiv:2201.06120, downloaded revision. Read: Appendices A–E in full; selected cited assertions retained as proof gaps rather than book proofs
- **[The Stacks Project Authors, The cotangent complex](https://stacks.math.columbia.edu/download/cotangent.pdf)** (`cotangent-stacks`). PDF build 88ff78, 14 July 2026. Read: §§3–9, 13–15, 21–22; printed pp.1–21 and 29–32
- **[The Stacks Project Authors, More on Algebra: Koszul complexes and derived completion](https://stacks.math.columbia.edu/download/more-algebra.pdf)** (`derived-completion-stacks`). PDF downloaded 6 October 2026. Read: §29 in full; §93 in full; §95 through Lemma 95.9; tags 091P,091S,091V,0920,0G1U,091X,0923,09AT,0G3F,0BKG,0H32,0CQY
- **[Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229)** (`prisms`). arXiv:1905.08229, downloaded revision; compare Ann. Math.196 (2022). Read: §2 conventions and Footnote 6 in full, Lemma 2.18 usage; §4 universal Hodge–Tate map and Lemma 4.10
- **[Bhargav Bhatt and Akhil Mathew, Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818)** (`bhatt-mathew`). arXiv:2202.04818; publisher-copy download unavailable at the checked Chicago URL. Read: pp.18–20, cotangent/complete-intersection and F-finiteness discussion, Lemma 4.18 and proof
- **[Dustin Clausen, Akhil Mathew and Matthew Morrow, K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/pdf/1803.10897)** (`cmm`). arXiv:1803.10897, downloaded revision. Read: Definition 5.1 and the cotangent finiteness paragraph, p.38; p-basis Footnote 10 and its differential calculation, PDF pp.39–40
- **[Bjørn Ian Dundas and Matthew Morrow, Finite generation and continuity of topological Hochschild and cyclic homology](https://arxiv.org/pdf/1403.0534)** (`dundas-morrow`). arXiv:1403.0534, downloaded revision. Read: Lemma 3.3 and Theorem 3.6 with proof
- **[Luchezar L. Avramov, Locally complete intersection homomorphisms and a conjecture of Quillen on the vanishing of cotangent homology](https://arxiv.org/pdf/math/9909192)** (`avramov99`). arXiv:math/9909192; EMIS publisher mirror refused access. Read: §1, definitions, Theorem 1.2, local criterion 1.8, proof beginning; full Cohen-factorization proof remains a gap
- **[Srikanth Iyengar, André–Quillen homology of commutative algebras](https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf)** (`iyengar07`). Contemporary Mathematics 436 (2007), freely accessible MIT chapter copy. Read: §8.10–8.14 with proofs, pp.228–229; §9.2–9.14
- **[Bhargav Bhatt, On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882)** (`bhatt18`). arXiv:1608.08882, downloaded revision. Read: Proposition 5.1 and its proof
- **[Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and Jakub Witaszek, Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic](https://arxiv.org/pdf/2012.15801)** (`bhatt-etal23`). arXiv:2012.15801, downloaded revision. Read: Lemmas 2.7–2.8 and proofs
- **[Teruhisa Koshikawa and Zijian Yao, Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364)** (`log-ky`). arXiv:2306.00364, downloaded revision. Read: §§2–3: Gabber conventions, Theorem 2.11, Remark 2.13, Lemma 2.14, hlf Definition 2.44 and descent 2.47–2.49, log quasisyntomic/QRSP definitions and covers
- **[Owen Gwilliam and Dmitri Pavlov, Enhancing the filtered derived category](https://arxiv.org/pdf/1602.01515v3)** (`gp18`). arXiv:1602.01515v3, 1 May 2018. Read: §1 and §2.1–2.28 with proofs, pp.1–11; completeness, localization and completed Day convolution
- **[Bhargav Bhatt, Prismatic F-gauges](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf)** (`bhatt-lectures`). Author lecture notes, MAT 549, Fall 2022; downloaded 6 October 2026. Read: §2.2.1, Constructions 2.2.1–2.2.5, Proposition 2.2.6 and inverse, Remark 2.2.7, pp.13–17
- **[The Stacks Project Authors, Cohomology and base change, III](https://stacks.math.columbia.edu/tag/0A1G)** (`stacks-proper-cohomology`). Live primary text, read 6 October 2026. Read: Section 36.30 in full, especially Lemmas 36.30.1, 36.30.4 and 36.30.6 and their proofs; proper flat finite presentation does not require a Noetherian base
- **[The Stacks Project Authors, Smoothing ring maps: lifting smooth algebras](https://stacks.math.columbia.edu/tag/07M8)** (`stacks-smooth-lift`). Live primary text, read 6 October 2026. Read: Proposition 16.3.2 and complete proof: smooth and syntomic algebras lift along an arbitrary surjection

Bhatt’s arXiv v1 and affected passages in the author copy were compared. BMS2 index findings were checked in the published Numdam version and arXiv v2. Koshikawa–Yao’s 2025 version-of-record PDF was not served; the three §2 findings below concern **arXiv v1 only**. The October 2026 corrigendum metadata and abstract name subsequent prismatic Theorems 7.35–7.36. Its unavailable full text is not asserted to settle the §2 findings. The original Illusie and Berthelot–Ogus book proofs remain precise proof gaps where needed.

The packet records **11 source issues**. E1–E3 were inherited; E4 applies an already confirmed roadmap correction; all new source findings await an independent verdict. An existing erratum search is recorded for each issue, with novelty left unestablished where the search cannot settle it.

### DerivedDeRhamCohomology/E1

**Misprint; affects a stated result.** Proposition 2.3, printed/PDF p.5 in arXiv:1204.6560v1; checked on the rendered page

**Correction:** Replace the augmentation target by B: P•→B is a free A-algebra resolution of B.

**Check:** The construction is dR_(B/A); the immediately following proof uses P•→B. A resolution of A would instead construct the base algebra case.

**Existing-correction status:** No correction identified in the checks below; novelty is not established. Finding is scoped to arXiv v1, not to an unidentified published text.

**Search:** https://arxiv.org/abs/1204.6560: submission history lists only v1, read 2026-09-26; https://www.math.ias.edu/~bhatt/: author homepage and link to arXiv papers, read 2026-09-26; Targeted search for this title with errata/correction; no correction identified.; Fresh atlas source-issues/register screen found no match to these pp.5–7 findings; two confirmed corrections on pp.32–33 are imported separately in the correction ledger..

### DerivedDeRhamCohomology/E2

**Misprint; affects nothing.** Notation 3.1, printed/PDF p.6 in arXiv:1204.6560v1; checked on the rendered page

**Correction:** Read Frobenius twist of B relative to A. The displayed derived tensor formula remains unchanged.

**Check:** The object displayed is B⊗^L_(A,Frob_A)A, and its relative Frobenius has target B.

**Existing-correction status:** No correction identified in the checks below; novelty is not established. Finding is scoped to arXiv v1, not to an unidentified published text.

**Search:** https://arxiv.org/abs/1204.6560: submission history lists only v1, read 2026-09-26; https://www.math.ias.edu/~bhatt/: author homepage and link to arXiv papers, read 2026-09-26; Targeted search for this title with errata/correction; no correction identified.; Fresh atlas source-issues/register screen found no match to these pp.5–7 findings; two confirmed corrections on pp.32–33 are imported separately in the correction ledger..

### DerivedDeRhamCohomology/E3

**Misprint; affects the proof.** Proof of Proposition 3.5, printed/PDF p.7 in arXiv:1204.6560v1; checked on the rendered page

**Correction:** Either shift both sides by [−i] or remove the shift from the left side in this intermediate Cartier display. The following realized graded-piece formula correctly includes [−i].

**Check:** The Cartier isomorphism identifies two modules in degree zero; placing only one side in cohomological degree i is incompatible for nonzero polynomial i-forms.

**Existing-correction status:** No correction identified in the checks below; novelty is not established. Finding is scoped to arXiv v1, not to an unidentified published text.

**Search:** https://arxiv.org/abs/1204.6560: submission history lists only v1, read 2026-09-26; https://www.math.ias.edu/~bhatt/: author homepage and link to arXiv papers, read 2026-09-26; Targeted search for this title with errata/correction; no correction identified.; Fresh atlas source-issues/register screen found no match to these pp.5–7 findings; two confirmed corrections on pp.32–33 are imported separately in the correction ledger..

### DerivedDeRhamCohomology/E4

**Error; affects a stated result.** Definition 7.20 and Theorem 7.22, arXiv v1 printed p.31/PDF p.31; also author copy printed p.30

**Correction:** Require the strict quotient factor to be lci, locally generated by a finite regular sequence; a filtered version requires compatible regular-quotient presentations. Keep flat Z/p^n endpoints and log-smooth Cartier-type first factor.

**Check:** With trivial logs, F_p→F_p[x,y]→F_p[x,y]/(x²,xy,y²) meets the printed conditions. Example 3.21 makes its derived de Rham unbounded below, while ordinary crystalline sheaf cohomology is coconnective. The cited Theorem 3.27/Corollary 3.40 does not apply to the arbitrary strict quotient.

**Existing-correction status:** Confirmed RT-AREA-padic-2/7; no author-published correction identified

**Search:** https://arxiv.org/abs/1204.6560, v1 only, checked 6 October 2026; https://websites.umich.edu/~bhattb/math/padicddr.pdf, affected author-copy passages read 6 October 2026; Author homepage and targeted title/errata/correction search; no correction of this passage identified; Atlas source-issue register and RT-AREA-padic-2 result: distinguish existing confirmed omissions from new sign finding.

### DerivedDeRhamCohomology/E5

**Misprint; affects a stated result.** Definition 5.1, published p.233; arXiv v2 printed p.28

**Correction:** Use gr^i(F)=cofib(F(i+1)→F(i)) for the displayed decreasing Z^op-indexed filtration.

**Check:** There is a structure map F(i+1)→F(i), not F(i−1)→F(i). A filtration with F(0)=R,F(1)=0 has gr^0=R. All subsequent Hodge/conjugate reindexing uses this correction.

**Existing-correction status:** new

**Search:** Published numdam/Springer article 10.1007/s10240-019-00106-9, affected pages read visually and as text; https://arxiv.org/abs/1802.03261, v1/v2 history; affected v2 passages collated; https://www.imo.universite-paris-saclay.fr/~matthew.morrow/, paper link and author PDF; no separate erratum listed; Targeted title with errata/correction, exact Ext/Nygaard clauses, and atlas source register; no matching correction found.

### DerivedDeRhamCohomology/E6

**Misprint; affects a stated result.** Proposition 5.6, published p.237 and proof p.238; arXiv v2 pp.31–32; companion display in Theorem 5.5 proof p.236

**Correction:** Replace i−c by i+c, with negative Ext groups zero. In the companion display replace a−i+j by a+i−j. Keep vanishing for c>0.

**Check:** The proof gives RHom_R(M,N)[c], whose i-th cohomology is Ext_R^(i+c). For R=k, i=1,c=−1, the nonsplit exact sequence 0→k[−1]→[k --id→ k]→k→0 gives Ext_Ch^1=k, while the printed Ext_k^2 is zero.

**Existing-correction status:** new

**Search:** Published numdam/Springer article 10.1007/s10240-019-00106-9, affected pages read visually and as text; https://arxiv.org/abs/1802.03261, v1/v2 history; affected v2 passages collated; https://www.imo.universite-paris-saclay.fr/~matthew.morrow/, paper link and author PDF; no separate erratum listed; Targeted title with errata/correction, exact Ext/Nygaard clauses, and atlas source register; no matching correction found.

### DerivedDeRhamCohomology/E7

**Misprint; affects a stated result.** Proposition 8.13(3), published p.274; arXiv v2 p.60

**Correction:** Replace the domain by gr_N^i LWΩ_S=N^≥i/N^≥(i+1); the graded divided-Frobenius map identifies it with Fil_i^conj dR_(S/F_p). The whole-level map has the fiber N^≥(i+1).

**Check:** For S=F_p,i=0 the whole-level map is Z_p→F_p and is not injective. Equation (4) gives its fiber, and Theorem 8.14(2) uses the correct graded domain.

**Existing-correction status:** new

**Search:** Published numdam/Springer article 10.1007/s10240-019-00106-9, affected pages read visually and as text; https://arxiv.org/abs/1802.03261, v1/v2 history; affected v2 passages collated; https://www.imo.universite-paris-saclay.fr/~matthew.morrow/, paper link and author PDF; no separate erratum listed; Targeted title with errata/correction, exact Ext/Nygaard clauses, and atlas source register; no matching correction found.

### DerivedDeRhamCohomology/E8

**Misprint; affects the proof.** Claim 3.30 proof, arXiv v1 printed p.14; author copy p.13

**Correction:** For odd p use (p−1)!=−1 mod p, so this equality has a minus sign. Normalize the horizontal/vertical totalization signs before asserting an exact signed generator image; the unit-based comparison remains the proof route.

**Check:** Wilson’s theorem contradicts the last equality for odd p. The preceding formula d_v((p−1)!γ_p(t))=t^(p−1)dt is valid. This finding addresses the displayed proof equality, not a claim that the comparison isomorphism fails.

**Existing-correction status:** new

**Search:** https://arxiv.org/abs/1204.6560, v1 only, checked 6 October 2026; https://websites.umich.edu/~bhattb/math/padicddr.pdf, affected author-copy passages read 6 October 2026; Author homepage and targeted title/errata/correction search; no correction of this passage identified; Atlas source-issue register and RT-AREA-padic-2 result: distinguish existing confirmed omissions from new sign finding.

### DerivedDeRhamCohomology/E9

**Misprint; affects a stated result.** Construction 2.6 and formula (2.1), arXiv:2306.00364v1 printed p.13

**Correction:** With the explicit definition LΩ^i=L∧^iL, put [−i] on the Hodge graded piece and the corresponding conjugate formula (2.1). If using shifted LΩ^i notation instead, change the defining convention consistently.

**Check:** A free log coordinate has log differential module in degree zero but its weight-one de Rham graded piece is in cohomological degree one. The displayed unshifted graded identification cannot hold under the stated convention.

**Existing-correction status:** No matching correction identified; scoped to arXiv v1, published text not served

**Search:** https://arxiv.org/abs/2306.00364, v1-only history checked 6 October 2026; ScienceDirect version of record, DOI 10.1016/j.aim.2025.110446: metadata read, text declined; Inoue–Koshikawa–Yao corrigendum DOI 10.1016/j.aim.2026.111223: abstract names 7.35/7.36; text declined; Author institutional pages and targeted title/correction search; no §2 correction identified. Novelty against the inaccessible published text is not established..

### DerivedDeRhamCohomology/E10

**Error; affects a stated result.** Theorem 2.11, arXiv:2306.00364v1 printed pp.14–15, second parenthesized base-change formula

**Correction:** Remove this middle expression for derived de Rham. The valid base-change equivalence is LΩ_(S₁/R)⊗^L_R S₂≃LΩ_(S/S₂), for the two-sort derived coproduct. The analogous S₁-module tensor expression for the cotangent complex is valid.

**Check:** The de Rham differential is R-linear and generally not S₁-linear: on k[t]/k, d(t·1)=dt but t·d(1)=0. Hence the middle derived-module tensor is not defined with its intended differential. Bhatt Proposition 6.12 gives the valid R-linear expression.

**Existing-correction status:** No matching correction identified; scoped to arXiv v1, published text not served

**Search:** https://arxiv.org/abs/2306.00364, v1-only history checked 6 October 2026; ScienceDirect version of record, DOI 10.1016/j.aim.2025.110446: metadata read, text declined; Inoue–Koshikawa–Yao corrigendum DOI 10.1016/j.aim.2026.111223: abstract names 7.35/7.36; text declined; Author institutional pages and targeted title/correction search; no §2 correction identified. Novelty against the inaccessible published text is not established..

### DerivedDeRhamCohomology/E11

**Misprint; affects nothing.** Lemma 2.14 proof, arXiv:2306.00364v1 printed p.15

**Correction:** Use X=(Spec S,M_S)^a and Y=(Spec R,M_R)^a for the subsequent morphism X→Y and complex L_(X/Y).

**Check:** A ring map R→S induces Spec S→Spec R; the next application of Olsson’s comparison uses that direction. The theorem statement is unchanged.

**Existing-correction status:** No matching correction identified; scoped to arXiv v1, published text not served

**Search:** https://arxiv.org/abs/2306.00364, v1-only history checked 6 October 2026; ScienceDirect version of record, DOI 10.1016/j.aim.2025.110446: metadata read, text declined; Inoue–Koshikawa–Yao corrigendum DOI 10.1016/j.aim.2026.111223: abstract names 7.35/7.36; text declined; Author institutional pages and targeted title/correction search; no §2 correction identified. Novelty against the inaccessible published text is not established..

The registered Bhatt Corollary 8.6/Remark 8.7 corrections are also binding: PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/E17 replaces the torsion exponent by p^floor(n/2), and E18 uses W(A₀) for the perfect residue algebra. They are reused findings, not new discoveries. In particular the p-adic derived de Rham object of F_p over Z_p is neither identified with W(F_p) nor declared torsion. It contains the checked unbounded torsion and non-torsion coordinates of the PD model; the node does not infer nonzero negative cohomology from that fact.

## Exact open gaps

There are **12 gaps and 12 open supplier requests**. Each gap has the affected nodes in the packet; stage coverage carries the same outstanding work. All seven stages remain planned. They can become closed only after those proofs, full signatures and supplier contracts are discharged.

### Cohen factorization and cotangent lci converses

The statement and local proof route of Avramov Theorem 1.2 and Iyengar 8.12 were read. The complete Cohen-factorization interior and the finite-presentation converse in Stacks’ cited commutative algebra are not yet checked against a supplier or reconstructed. These are proof gaps, not changes to the theorem hypotheses.

**Affected:** `DerivedDeRhamCohomology:DD.0/absolute-complete-intersection`, `DerivedDeRhamCohomology:DD.0/andre-regularity`, `DerivedDeRhamCohomology:DD.0/lci-amplitude`.

### Integral derived powers and décalage proof

Animation gives the definition and polynomial API. The complete Illusie proof of the integral triangle/décalage comparison was not available; both author errata are binding. Dundas–Morrow and Bhatt use these formulas. Verify the corrected simplicial argument before claiming the shifted-flat divided-power equivalence proved.

**Affected:** `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/derived-symmetric-powers`, `DerivedDeRhamCohomology:DD.0/derived-divided-powers`, `DerivedDeRhamCohomology:DD.0/power-triangle-filtration`.

### The converse F-finiteness theorem

Bhatt–Mathew cites Lurie SAG Theorem 3.5.1 for almost perfect L_(S/F_p)⇒F-finite S. Its proof was not read in this pass. The Noetherian hypothesis and forward Dundas–Morrow proof are explicit; the converse needs a primary-source proof decomposition.

**Affected:** `DerivedDeRhamCohomology:DD.0/f-finite-cotangent`.

### Noetherian and weak-proregular completion proof

The principal bounded-torsion proof and regular-sequence Koszul model are checked. BS Footnote 5 cites Artin–Rees for arbitrary finite ideals in Noetherian rings. Its complete pro-zero proof, and a general weak-proregular variant outside these ranges, are not yet decomposed; no such variant is used without that hypothesis.

**Affected:** `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

### Resolution independence and complete rational comparison interiors

Bhatt states arbitrary-resolution independence with an Illusie reference and the rational Hodge-completed comparison in Remark 2.6. BL Appendix E supplies the animation/graded proof route. The complete corrected Illusie construction and filtered algebra coherence are not yet independently established from a checked supplier proof.

**Affected:** `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`, `DerivedDeRhamCohomology:DD.2/smooth-de-rham-comparison`.

### PD root-quotient p-torsion-freeness proof

BMS2 Proposition 8.12 uses Scholze–Weinstein 2013 Proposition 4.1.11 for the p-torsion-free PD root quotient. That precise proof was not read in this pass. CR.0 must supply it or a complete direct PD-basis proof before the general A_crys structure theorem closes.

**Affected:** `DerivedDeRhamCohomology:DD.4/qrsp-pd-derham`, `DerivedDeRhamCohomology:DD.4/acrys-structure`.

### Regular perfection and smooth approximation

The canonical crystalline Čech calculation invokes Kunz’s regular-ring Frobenius flatness direction and Popescu’s theorem Stacks 07GB. No atlas supplier with these exact proofs was verified; the DD.4 target records this proof gap instead of asserting them from generic cotangent amplitude.

**Affected:** `DerivedDeRhamCohomology:DD.4/regular-fp-crystalline-cech`.

### Perfect lifting over a p-complete base

DD.5 proper smooth control needs the theorem that a compatible system of perfect A/p^n complexes with uniform bounds lifts to a perfect derived-complete A-complex. The supplier for this derived perfect-complex effectivity, beyond the checked coherent finite-level theorem, remains to be established.

**Affected:** `DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control`, `DerivedDeRhamCohomology:DD.5/completed-base-change-cup-products`.

### Gabber–Olsson and exactification proof interiors

Bhatt and KY cite Olsson’s full logification/transitivity/integral log-smooth results and Kato exactification/PD Poincaré. Those original papers were not fully read here. The exact theorem hypotheses are retained and CR.5 is requested to supply the original proofs, with no equality of cotangent conventions outside the integral range.

**Affected:** `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`, `DerivedDeRhamCohomology:DD.6/log-crystalline-comparison-map`.

### Filtered corrected G-lci applications

The corrected finite regular-quotient theorem is explicit, but the filtered-colimit log crystalline comparison and all three Example 7.21 factorizations require a checked construction of compatible regular presentations. The complete Fontaine ind-lci proof and exact filtered PD/site exchange are not yet discharged; no claim follows merely from strict epimorphism.

**Affected:** `DerivedDeRhamCohomology:DD.6/corrected-log-lci-condition`, `DerivedDeRhamCohomology:DD.6/log-lci-crystalline-comparison`, `DerivedDeRhamCohomology:DD.6/log-period-dlog`.

### Two-sort log-quasisyntomic completion and root descent

KY §§2–3 state the completed hlf pushouts, general prelog QRSP root covers and descent; the full proof decomposition still needs the monoid derived-reduction and boundedness lemmas supplied by CR.5/EDS. The exact tilt-surjectivity clause, completed hlf condition and relative/big site conventions are stated, and the full monoid proof interiors remain to be decomposed.

**Affected:** `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`, `DerivedDeRhamCohomology:DD.6/log-power-de-rham-descent`.

### Enhanced signatures beyond the ordinary derived prototype

The suggested file types ordinary ring inputs and the underlying objects/maps in the pinned DerivedCategory of modules. It omits genuinely unavailable enhanced mapping spaces, animated ring pushouts, coherent E∞ algebra structures, derived-power functor coherences, and infinity-categorical limit/colimit universal properties. These omissions are listed per declaration family in the reader and handoff; they require the exact EDS suppliers before full-scope signatures can be elaborated. The typed underlying forms do not implement or certify these targets.

**Affected:** 112 declaration nodes across the seven stages.

## Suggested forms and verification limits

Twenty retained differential-algebra nodes, 21 APIs and 22 examples keep their original precise Kähler/exterior-power signatures.

All remaining declaration/API/test names occur with signatures on existing small ordinary derived-category, complex, ring, monoid or scheme carriers. Full mathematical contracts are included in comments, with omitted conditions explicitly identified.

The suggested file passed the prescribed Lean check against the existing pinned libraries: **0 errors, 463 admitted-declaration warnings, and no other warnings**. No library build or language server was started. The read-only pre-existing Tau Ceti semilinear Kähler artifact was checked against the pinned source. This is an elaboration result for the available carrier views and admissions, with no implementation claim.

- Ordinary Hom sets represent only pi_0 of derivation mapping spaces, not their higher homotopy.
- FilteredModel and IncreasingModel are augmented ordinary derived-category diagrams. Their coherence, enhanced limits, algebra multiplication and genuine realizations are omitted.
- Scalar extension, tensor, graded, totalization, resolution and external PD/period operators are actual-data parameters; their unavailable coherent construction and identifying hypotheses are omitted, not postulated as isomorphism conclusions.
- The prototype quasisyntomic predicate displays only the cotangent amplitude test. Complete flatness, bounded torsion and completeness remain requirements of the packet, including the negative Z_p-to-F_p map test.
- The QRSP prototype displays only cotangent amplitude and mod-p surjectivity; an integral perfectoid source is omitted. Its Z_p exclusion test instead displays the genuine absence of a p-th root of p in the existing p-adic-integer ring, not a false exclusion from the weaker amplitude predicate.
- Corrected G-lci displays the existing regular-sequence kernel condition only. The log-smooth Cartier factor, strictness, endpoint flatness, localization and compatible filtered presentations are omitted.
- Prelog resolutions/sites/root covers display their two underlying ring/monoid components; their structure map, commuting chart squares, exactification, associated-log and hlf coherence conditions are omitted.
- Geometric/formal/period examples using external carriers or parameters keep their model-identification hypotheses in the mathematical comments; those missing identifications are not certified by elaboration.
- Some API views express an evaluation, existence, E1-term, generator-determined uniqueness or underlying cohomology property rather than the full coherent universal property. Complete signatures require the requested suppliers. The ordinary/formal universal-property views retain uniqueness only, without asserting a unique map to an arbitrary complex.

The packet checker with the supplied pinned declaration index reports **0 errors and 0 warnings**. The recursive dependency audit, source-excerpt matching, retained-ID check, name inventory and deliverable-path checks accompany it. These checks do not replace the independent mathematical review. The handoff names the proof and supplier work that each open-stage continuation must resolve.
