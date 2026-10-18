# Quadratic forms and cohomological invariants, Part II

This continuation of Tau Ceti’s QuadraticFormInvariants develops nonsingular quadratic Pfister theory in every characteristic and applies it to henselian fields of finite Kronecker dimension. Its endpoints are the invariant-zero criterion, Dittmann–Pop’s three non-dyadic isotropy criteria, and patch openness of isotropy over henselizations. The path goes through characteristic-two Witt modules, polynomial representation, the Arason–Pfister dimension theorem, graded invariants and a finite descent of real-place conditions.

This is a target-level plan. Every target below has implementation status **unchecked**. The planning pass is complete; Q2.0–Q2.7 have coverage **planned**, with the exact supplier contracts and two unresolved deep proof-input audits stated below. “Planned” records an explicit chain ending in library results, another owner’s contract or a named gap; it does not assert proof closure.

The definitive statements, APIs, Checks and worked examples are in this reader. The packet records the same target graph. The suggested file contains only the two light definitions over existing carriers and statements that can be expressed at the pins; the missing Witt, quadric and cohomology carriers remain mathematical targets here.

## Scope and ownership

The parent owns odd-characteristic Witt theory, its ring and fundamental ideal, all-length odd-characteristic Pfister constructions and additive generation, signatures, Clifford/quaternion invariants and low-degree cohomology. Current Tau Ceti already has more of that construction than the pinned snapshot. Those results are imported. This continuation adds the characteristic-two interfaces and the missing high-length proofs. It uses bilinear Witt rings acting on quadratic Witt groups; it does not ask a characteristic-two quadratic form to carry an artificial ring multiplication.

The issue permits separating independent directions. The proposed roadmap **QuadraticFormsRealFunctionFields** receives the two ordering-sensitive routes, from Benoist and Benoist–Wittenberg, as one coherent design. The full assignment of every routed item appears below. Its ordering/real-closure adapter imports the current RealAlgebraicGeometry Layer 1; shared C_i and Tsen–Lang results import Q2.5 here. RealSurfacePeriodIndex continues to own the real-surface period-index theorems and their applications. The proposed foundation supplies it; this roadmap does not import its consumer. The proposal requires a maintainer decision and creates no second roadmap file.

## Conventions

- All fields are arbitrary unless a target states a characteristic, finiteness or valuation hypothesis. Quadratic spaces are finite-dimensional. An isotropic form has a nonzero vector of value zero. “Nonzero represented values” and similarity factors are subsets of F×; Mathlib/Tau Ceti’s ordinary representation predicate also permits zero.
- Nonsingular means zero kernel of the polar bilinear form. The spaces in the quadratic Witt group are even-dimensional. On these spaces this agrees with the pinned quadratic Nondegenerate predicate; the agreement must be proved with the parity hypothesis. It does not cover the extra odd-dimensional characteristic-two convention.
- The hyperbolic plane is xy. The binary block [a,b] is ax²+xy+by². In characteristic two the mixed term is essential. Symmetric bilinear forms carry a subscript b where confusion with quadratic forms is possible.
- For n≥1, I_q^n=I_b^(n−1) I_q. A quadratic n-fold Pfister form has dimension 2^n. In characteristic two its terminal block is [1,a₀], with a₀ allowed to be zero, and its n−1 outer factors are bilinear ⟨1,−aᵢ⟩_b, aᵢ∈F×. In odd characteristic the parent minus-sign convention gives ⟨1,−a⟩.
- H_q^n means H^n(F,Z/2(n−1)). In characteristic two this is H¹_et(F,Ω^(n−1)_log), including the coefficient-complex shift. It is not ordinary étale μ₂ cohomology and not the degree-zero logarithmic sections appearing in BGK.
- Valuations may have arbitrary rank. “Non-dyadic” here excludes the mixed-characteristic profile (0,2), and includes equal characteristic two. All residue/unit statements carry this restriction; the two patch-openness theorems do not.
- Finite Kronecker dimension does not imply finite generation. Algebraic henselizations at finite places and analytic completions are distinct fields; the named comparison contract is required where they are compared.

## Layer overview

| Layer | Targets | Nodes | Planets | Coverage |
| --- | --- | ---: | ---: | --- |
| Q2.0 | Nonsingular forms and quadratic Witt modules in characteristic two | 6 | 5 | planned |
| Q2.1 | Quadratic Pfister forms in every characteristic | 5 | 3 | planned |
| Q2.2 | Polynomial representation and the Arason–Pfister bound | 11 | 5 | planned |
| Q2.3 | Higher quadratic cohomological invariants | 9 | 5 | planned |
| Q2.4 | Non-dyadic henselian unit and value criteria | 3 | 3 | planned |
| Q2.5 | C_i fields and finite Kronecker dimension | 7 | 4 | planned |
| Q2.6 | Coefficient fields and finite descent at real places | 4 | 4 | planned |
| Q2.7 | Patch-open henselization loci | 2 | 2 | planned |

The main chain is Q2.0 → Q2.1 → Q2.2 → Q2.3. Unit reduction Q2.4 and the C_i/dimension chain Q2.5 feed Q2.6, where cohomological vanishing is descended to a finitely generated characteristic-zero subfield before applying the requested local–global injectivity. Q2.7 uses scalar extension and the valuation suppliers; it does not need the high cohomological comparison.

## Libraries and existing roadmaps

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read with its surrounding hypotheses at the pin. The reviewed library-coverage audit was read before planning: the parent’s low layers are partly built, its pinned ring layer does not supply the high theory, and its cohomology layers do not provide the all-degree comparison.

| Baseline declaration | What it supplies | Source module |
| --- | --- | --- |
| mathlib:QuadraticMap.proj | Coordinate monomial x_i x_j over a commutative semiring; supplies the real-bodied binary form. | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean |
| mathlib:QuadraticMap.polarBilin | Bilinear polarization q(x+y)−q(x)−q(y) over a commutative ring, without dividing by 2. | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean |
| mathlib:QuadraticMap.Anisotropic | The only vector with q(x)=0 is x=0; negation gives a nonzero isotropic vector. | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean |
| mathlib:QuadraticMap.Nondegenerate | Quadratic radical zero and rank of polar kernel at most one; in even dimension the nonsingular spaces used here have polar kernel zero. Do not identify the definitions without the parity restriction. | Mathlib/LinearAlgebra/QuadraticForm/Radical.lean |
| mathlib:QuadraticForm.dualProd | q(f,x)=f(x) on V*×V, giving xy in rank one in every characteristic. | Mathlib/LinearAlgebra/QuadraticForm/Dual.lean |
| mathlib:QuadraticMap.prod | Orthogonal product on the product module, given by the sum of the two component forms. | Mathlib/LinearAlgebra/QuadraticForm/Prod.lean |
| mathlib:LinearMap.BilinForm | Scalar-valued bilinear maps over the ring; symmetric nonsingular instances are the bilinear input carrier. | Mathlib/LinearAlgebra/BilinearMap.lean |
| mathlib:MvPolynomial.IsHomogeneous | All monomials have fixed total degree, defined through constant weight one. | Mathlib/RingTheory/MvPolynomial/Homogeneous.lean |
| mathlib:MvPolynomial.eval | Ring-homomorphism evaluation at a variable assignment. | Mathlib/Algebra/MvPolynomial/Eval.lean |
| mathlib:Algebra.trdeg | Cardinal supremum of algebraically independent subsets of a commutative algebra; specialize to finite field transcendence degree. | Mathlib/RingTheory/AlgebraicIndependent/Basic.lean |
| mathlib:char_dvd_card_solutions_of_sum_lt | For finite-field polynomial families whose total degrees sum to less than the variable count, the characteristic divides the number of common zeros. | Mathlib/FieldTheory/ChevalleyWarning.lean |
| tauceti:QuadraticMap.Represents | A scalar value lies in the image of the quadratic map; zero is allowed, so D/G arguments separately restrict to units. | TauCeti/LinearAlgebra/QuadraticForm/Representation.lean |
| tauceti:QuadraticMap.IsRepresentedBy | An injective quadratic isometry into another form, giving the subform relation. | TauCeti/LinearAlgebra/QuadraticForm/Representation.lean |
| mathlib:nonempty_sections_of_finite_inverse_system | For a functor from the opposite of a directed preorder to types, with every object finite and nonempty, the set of compatible sections is nonempty. Transition maps need not be surjective. | Mathlib/CategoryTheory/CofilteredSystem.lean |

A separate read-only audit used TauCetiRoadmap current main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti current main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current parent construction is imported even when it postdates the pins. Searches covered binary forms/polar radicals, quadratic base change, Witt modules, Pfister generation/roundness/hyperbolicity, representation, cohomological coefficients, valuations, homogeneous polynomials and transcendence degree.

| Audit result | Ownership consequence |
| --- | --- |
| Current TauCeti/LinearAlgebra/QuadraticForm/Witt/Pfister/Basic.lean: pfisterForm and fundamentalIdeal_pow_eq_addClosure | Import the odd-characteristic all-length construction and generation from parent Layer 4. |
| Current Witt/Round.lean: oneFold, twoFold; Witt/Pfister/Hyperbolic.lean: the two-fold criterion | Prove the remaining all-length induction here, with the characteristic-two base and tensor action. |
| Pinned quadratic baseChange interfaces use invertibility of two in the relevant general form | Construct coordinate-polynomial scalar extension here and prove comparison where the pinned carrier applies. |
| Current Transfer/Basic.lean:48–54,188–190 has QuadraticMap.scharlauTransfer and its polar identity in every characteristic; Transfer/Witt.lean:147,186–190 has the odd-characteristic Witt transfer and projection formula | Import parent Layer9 and these existing APIs; add only the missing characteristic-two module extensions and norm-Pfister calculation. |
| Current Witt RegularFormClass is diagonal and belongs to the odd-characteristic construction | Do not reuse it as the characteristic-two quadratic Witt carrier. |
| Current RealAlgebraicGeometry Layer 1 supplies orderings/real-closure existence; AdicSpaces Layer 1 supplies Spv and patch topology | Import both owners; the proposed real branch adds Harrison/signature applications, and Q2.7 adds only the henselization loci. |
| No matching current all-characteristic high Pfister module, all-degree graded quadratic comparison, or finite-descent theorem was found | These are targets or explicit proof-input gaps, not asserted missing library declarations based only on a name search. |

## Sources and versions

Locators use the printed page numbering of the linked version. Source descriptions and target statements are in our own words. The source list records the portions actually used; it does not claim a full audit of the independent real-function-field direction.

**ekm — [The Algebraic and Geometric Theory of Quadratic Forms](https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf), Richard Elman, Nikita Karpenko and Alexander Merkurjev.** Freely available author book PDF, final manuscript; AMS 2008 bibliographic edition. Locators use the PDF’s printed page numbers. Read 2026-10-18.

- §§1–4 pp.17–24 (metabolic splitting and bilinear Witt quotient); §7 pp.39–46; §8 pp.47–51; §9 pp.52–54; §15 pp.64–67; §16 pp.67–69; §17 pp.71–74; §§18–20 pp.75–87; §22 pp.93–94; §23 Theorem23.7 p.100; §97 pp.385–386; §101 pp.402–404. Targeted definitions and the proof chains named in nodes; Fact16.2 states rather than proves the deep comparisons.

**dp — [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307v2), Philip Dittmann and Florian Pop.** arXiv:2012.01307v2, final author version 27 April 2023. Published Annals198 (2023), 1203–1227; published text not collated. Read 2026-10-18.

- §1 dimension convention p.1; §2 coefficient convention and Fact2.1 pp.3–4; §3 Pfister conventions and Fact3.1, Proposition3.2 with its full proof pp.6–8; valuation patch topology and Lemma3.9 pp.10–11.

**morel — [Milnor’s conjecture on quadratic forms and mod 2 motivic complexes](https://www.numdam.org/item/RSMUP_2005__114__63_0.pdf), Fabien Morel.** Rendiconti del Seminario Matematico della Università di Padova114 (2005), 63–101; publisher digitization. Read 2026-10-18.

- §1 pp.63–69; §2.1 Theorems2.2–2.3 pp.70–72; §2.2 Theorem2.11 pp.76–78; §3.3 Theorem3.10 pp.87–89; §3.4 pp.89–93; Theorem3.4 and Lemmas3.5–3.9 pp.83–87. Read the actual theorem statements and lifting argument; the externally cited Witt purity/Rost and prime-field computations are recorded as a proof-input gap.

**ovv — [An exact sequence for K_*^M/2 with applications to quadratic forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v165-n1-p01.pdf), Dmitri Orlov, Alexander Vishik and Vladimir Voevodsky.** Annals165 (2007), 1–13; published PDF. Read 2026-10-18.

- §4.1 Theorem4.1 and its proof, printed p.11; §1 standing characteristic-zero hypothesis. Used to check the boundary of that alternative proof, not as a proof for all odd characteristics.

**benoist — [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), Olivier Benoist.** Publications Mathématiques de l’IHÉS130 (2019), 63–110; published PDF. Read 2026-10-18.

- §0.5 pp.65–66; §6.4 proof of Theorem0.12 pp.95–96, to determine the boundary and supplier direction of the split. The independent real-function-field proof inputs are assigned to the proposed design job, not audited here.

**bw — [On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Olivier Benoist and Olivier Wittenberg.** Published-layout author PDF; Inventiones222 (2020), 1–77. Read 2026-10-18.

- §2.3, Example2.5, pp.37–38, and Lemma3.7 proof p.50, for the quadric and real-curve boundary. The level/ω equivalence is located instead in Benoist17 Proposition3.3. Full proof audit of the split belongs to its proposed design.

**upstream-qfi — [Quadratic forms and cohomological invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md), Tau Ceti Roadmap contributors.** Current upstream checkout 0d144d044dacebca17b654695b6f1ad58f159b27, read 18 October 2026; current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read-only audit, separate from pins. Read 2026-10-18.

- Scope and baseline; Layers1,4,7A–B,9 and the corresponding Suggested.lean sections, including current-main Pfister construction/generation and transfer. Current Tau Ceti Witt/Pfister and Transfer/{Basic,Frobenius,Class,Witt}.lean declarations read separately from the pins. Related RealAlgebraicGeometry Layer1, AdicSpaces Layer1, ProfiniteCohomology Layers10–12 and ClassFieldTheory Layer6 contracts read at the same checkout.

**benoist17 — [On Hilbert’s 17th problem in low degree](https://www.math.ens.psl.eu/~benoist/articles/Hilbert17.pdf), Olivier Benoist.** Published-layout author PDF; Algebra & Number Theory11 (2017), 929–959. Read 2026-10-18.

- §3B, Proposition3.3 and proof, pp.939–940: smooth integral variety over a real closed field, n≥1, level/mod-two/unramified integral 2-adic comparison. Used only to verify the routed split’s boundary, not to claim its integral-cohomology proof dependencies are closed.

## Supplier contracts

Each entry is an exact request to an existing owner, not a claim that its current stage has already proved the result. Every use below lists the corresponding stage or node. Contracts may require refinement by their owner before this plan can become closed.

**S1. `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`.** Import the existing characteristic-not-two Witt extension, cancellation and hyperbolic decomposition. The characteristic-two extension is owned here; no second odd-characteristic decomposition is requested.

Consumers: `Q2.0/nonsingular-witt-decomposition`.

**S2. `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.** Import the existing odd-characteristic Witt ring and fundamental ideal, scalar extension, all-length pfisterForm/pfisterClass and additive I^n generation for n≥1, plus the landed one-/two-fold roundness and length-two hyperbolicity criterion. Consume current-main results even where post-pin; do not reimplement them.

Consumers: `Q2.0/bilinear-witt-ring`, `Q2.0/quadratic-witt-module`, `Q2.0/quadratic-filtration`, `Q2.1/quadratic-pfister`, `Q2.1/all-length-roundness`, `Q2.1/pfister-hyperbolicity`, `Q2.3/milnor-witt-map`, `Q2.3/unramified-witt-sheaves`, `Q2.3/odd-graded-comparison`, `Q2.6/coefficient-field`.

**S3. `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7a-the-mod-2-operations-consumed-and-the-μ₂-adapters`.** Import the existing odd-characteristic μ₂ coefficient and Kummer-character adapters, with the parent minus-sign convention. The quaternion/Brauer interpretation is a separate Layer7B contract.

Consumers: `Q2.3/cohomology-coefficients`.

**S4. `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.** Use all-degree continuous cohomology on the canonical discrete coefficient carriers, functorial restriction and finite-quotient/filtered-coefficient constructions; no second cohomology carrier.

Consumers: `Q2.3/cohomology-coefficients`.

**S5. `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.** Use the graded cup product and its restriction compatibility on μ₂ tensor powers; keep the last quadratic character Z/2 distinct from the outer Kummer twists.

Consumers: `Q2.3/cohomology-coefficients`.

**S6. `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.** Import the existing cohomological-dimension invariant, closed-subgroup monotonicity and Hochschild–Serre dimension inequality for profinite group extensions. The field-specific transcendence-degree estimate is a target here.

Consumers: `Q2.6/local-function-field-cd`.

**S7. `LogicAndDefinabilityInNumberTheory:LD.1`.** Supply general-rank valued-field residue/value interfaces; multivariable simple-root Hensel lifting; henselization as an immediate separable algebraic extension described by pointed étale neighborhoods; finite subextensions have an integral primitive generator with derivative a unit; unique valuation extension to algebraic henselian extensions. For a number field at every finite place, including dyadic places, supply comparison of its algebraic henselization with its completion for finite étale 2-primary cohomology. Do not replace these with discrete local-field hypotheses.

Consumers: `Q2.2/odd-divisor-specialization`, `Q2.4/unit-reduction`, `Q2.5/kronecker-dimension`, `Q2.6/coefficient-field`, `Q2.6/real-place-descent`, `Q2.7/henselian-embedding-open`, `Q2.6/local-function-field-cd`.

**S8. `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`.** Specialize existing Spv(A) to a field F: valuation equivalence classes and patch clopens v(a)≥0, v(a)>0, v(a)=0. Use its patch topology and Boolean operations. No fresh valuation-space carrier, compactness proof or topology is planned here.

Consumers: `Q2.7/henselian-embedding-open`, `Q2.7/henselian-isotropy-open`.

**S9. `SchemeAndStackFoundations:SF.2`.** Use Zariski/étale sheaf categories, their Ext groups, and continuity of finite étale cohomology along filtered unions of fields. Supply the geometric estimate cd₂(L)≤trdeg_K L for finitely generated L over algebraically closed characteristic-zero K (via affine-curve vanishing/induction); together with Hochschild–Serre this is the field-specific proof input requested by local-function-field-cd.

Consumers: `Q2.3/cohomology-coefficients`, `Q2.3/unramified-witt-sheaves`, `Q2.3/milnor-kernel-ext`, `Q2.6/local-function-field-cd`, `Q2.6/real-place-descent`.

**S10. `MotivicEtaleKTheory:M.5a`.** Supply the existing effective motivic complexes over a perfect field of characteristic ≠2, their equidimensional-cycle models and A¹ homotopies, derived-category operations and filtered-colimit reductions used in Morel3.4–3.10. The quadratic Witt sheaves/kernel and their Ext argument are targets here.

Consumers: `Q2.3/unramified-witt-sheaves`, `Q2.3/milnor-kernel-ext`.

**S11. `MotivicEtaleKTheory:M.5d`.** Supply the actual natural mod-two norm-residue isomorphism in every characteristic ≠2 and the motivic/étale (Beilinson–Lichtenbaum) comparison giving τ-surjectivity in Morel1.3; include the positive-characteristic/filtered-field reductions. Its proof engines remain M.5a–d, not a local hypothesis named norm residue.

Consumers: `Q2.3/milnor-kernel-ext`, `Q2.3/odd-graded-comparison`.

**S12. `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.** Import cd₂(G_K)=2 for a finite extension K/Q_p, for every p including p=2, from existing Layer6. Use the supplied algebraic-henselization/completion comparison to apply this to local base fields in the descent argument.

Consumers: `Q2.6/local-function-field-cd`.

**S13. `HigherLocalFieldsAndHigherClassFieldTheory:HL.6`.** Prove/export the precise Jannsen local–global injectivity used in Dittmann–Pop Fact2.1 (pp.3–4): if K is finitely generated of characteristic ≠2, δ(K)=d≥1 and k₁⊂K is a relatively algebraically closed global subfield, H^(d+1)(K,Z/2(d))→∏_(v∈P(k₁))H^(d+1)(Kk₁v,Z/2(d)) is injective, using algebraic henselization at finite places, real closure at real places and algebraic closure at complex places. It follows from Jannsen Theorem0.4 for completions and the comparison square. Here it is consumed only with char K=0. Existing generic HL.6 nodes do not already establish this statement.

Consumers: `Q2.6/dimension-unit-isotropy`.

**S14. `K2SymbolsBrauer:T.2`.** Supply algebraic Milnor K-theory in all degrees as the tensor algebra on F× modulo Steinberg relations, with mod-two quotients and natural field maps; use the existing T.2 graded-symbol direction, without asserting higher Quillen/Milnor comparison.

Consumers: `Q2.3/milnor-witt-map`.

**S15. `HigherLocalFieldsAndHigherClassFieldTheory:HL.2`.** Alongside logarithmic-de-rham-witt-coefficients, provide H¹_et(F,Ω^j_log) and its Frobenius-minus-one/differential quotient presentation in every characteristic-two field, with Artin–Schreier H¹ at j=0 and functorial differential-symbol action. This is a coefficient request; Kato’s quadratic Witt kernel theorem is owned here, not supplied by BGK.

Consumers: `Q2.3/cohomology-coefficients`, `Q2.3/kato-graded-comparison`.

**S16. `SchemeAndStackFoundations:SF.0`.** Supply projective hypersurface charts and their function fields; also the projective dimension theorem: over an algebraically closed field, r positive-degree homogeneous equations in N>r variables have a common nonzero zero. This is the exact geometric input to the algebraically closed case of the systems theorem, separate from SF.2 cohomology.

Consumers: `Q2.2/quadric-function-field`, `Q2.5/ci-systems`.

**S17. `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`.** Reuse current QuadraticMap.scharlauTransfer and polar_scharlauTransfer in every characteristic, together with their identity, product, isometry and tower API. Import existing odd-characteristic WittRing.scharlauTransfer and scharlauTransfer_baseChange_mul for any finite field extension and nonzero linear functional. Q2.2 adds the missing characteristic-two bilinear/quadratic-Witt-module descent and reciprocity and the power-basis norm-Pfister calculation.

Consumers: `Q2.2/quadratic-transfer`.

**S18. `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.** Import the parent’s Kummer cup/quaternion Brauer-class comparison, with its canonical μ₂/ZMod2 coefficients and minus-sign convention, for the n=2 compatibility test of the higher invariant. The all-degree comparison is proved here; no low-degree quaternion comparison is re-planned.

Consumers: `Q2.3/pfister-invariant`.

## Open proof-input audits

**G1. Primary proof audit for Kato’s quadratic comparison.** EKM Fact16.2 states the exact comparison and cites Kato, Inventiones66 (1982), 493–510, DOI10.1007/BF01389226. The publisher page was accessible but the full proof was not served; no copy was in the cleared source index. Read an authorized/public primary proof, audit the differential presentation and kernel=I_q^(n+1) in every n, and refine this target. The BGK coefficient theorem does not discharge this gap.

Direct targets: `Q2.3/kato-graded-comparison`.

**G2. External proof leaves in Morel’s all-odd-characteristic argument.** Morel’s construction and induction have been read. The unaudited external proof leaves are: Ojanguren–Panin Witt purity (Morel2.2, pp.70–71); Arason Satz3.3, used in Morel2.11 (pp.76–78) for transfer preservation of I^n and independence of the functional on the associated graded; quadratic-extension generation of Milnor K-theory cited there as [5, Corollary5.3, p.29]; generic Rost cycle-module residue/transfer axioms, Gersten resolutions and homotopy invariance; and the prime-field computations cited on p.66. Audit their primary proofs, assign generic infrastructure once after cross-roadmap search, and record the resulting declarations or requests. The elementary transfer target does not discharge Arason’s filtration theorem. The local Witt presentation and extension-lifting argument are specified here, with no implicit purity or prime-field-Milnor assumption.

Direct targets: `Q2.3/unramified-witt-sheaves`, `Q2.3/milnor-kernel-ext`, `Q2.3/odd-graded-comparison`.

Q2.3 inherits both G1 and G2. The invariant-dependent descent targets in Q2.6 inherit them through Q2.3. Q2.0–Q2.2, Q2.4, Q2.5 and Q2.7 still have explicit supplier obligations; none is labelled closed.

## Q2.0 — Nonsingular forms and quadratic Witt modules in characteristic two

**Direct layer inputs:** `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

### Q2.0/binary — Nonsingular binary blocks

**Definition.** On F² set [a,b](x,y)=a x²+xy+b y². Its polar matrix is [[2a,1],[1,2b]]; it is nonsingular exactly when 1−4ab≠0. Throughout, nonsingular means that the polar bilinear map has zero kernel; for these even spaces it agrees with Mathlib Nondegenerate. The hyperbolic plane is xy, including in characteristic two.

**Prerequisites:** `mathlib:QuadraticMap.proj`, `mathlib:QuadraticMap.polarBilin`, `mathlib:QuadraticMap.Nondegenerate`, `mathlib:QuadraticForm.dualProd`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §7, Notation 7.3 and Examples 7.5–7.6, pp.40–41; Proposition 7.19, pp.43–44; Proposition 7.31, pp.45–46.

**Construction / proof route.**

- Use the existing quadratic-map sum and scalar actions on coordinate monomials. Compute the polar matrix and its determinant.
- Identify xy with the rank-one dual-product form. In characteristic two the off-diagonal pairing remains nonzero although the diagonal vanishes.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `binary` (constructor): The quadratic map [a,b] on Fin 2 → F.
- `binary_apply` (simp): Evaluation is a x₀²+x₀x₁+b x₁².
- `binary_polar` (simp): Polarization has the displayed 2×2 matrix.
- `binary_nondegenerate_iff` (characterisation): Nondegenerate iff 1−4ab≠0.
- `binary_hyperbolic` (compatibility): [0,0] is isometric to QuadraticForm.dualProd F F.

**Uses.**

- EKM §9, pp.52–54: The last factor of a quadratic Pfister form is a binary norm form.
- Q2.4: Unit reduction needs a nonsingular residue polynomial, not a diagonal characteristic-two surrogate.

**Check — discriminating unit tests.**

- [a,b](1,0)=a, [a,b](0,1)=b and [0,0](1,1)=1.
- [1,1] over F₂ is anisotropic; [1,0] is isotropic, while both have nonsingular polar form.
- In odd characteristic [a,b] with a≠0 diagonalizes to ⟨a,b−1/(4a)⟩; in F₂ its polar pairing of the coordinate vectors is 1.

**Acceptance.**

- [1,1] over F₂ is anisotropic and nonsingular.
- The proposed nonsingularity convention excludes odd-dimensional radical-free forms peculiar to characteristic two.

**Planet:** Nonsingular binary forms.

### Q2.0/scalar-extension — Quadratic scalar extension in characteristic two

**Construction.** For a field extension E/F and a finite-dimensional quadratic map q on V, construct q_E on E⊗F V by extending its degree-two coordinate polynomial. The result is independent of a basis and satisfies q_E(c⊗v)=c²q(v), with scalar extension of the polar form. Preserve nonsingularity, orthogonal sums and isometries; give coherent identity and tower isometries.

**Prerequisites:** `Q2.0/binary`, `mathlib:QuadraticMap.prod`, `mathlib:QuadraticMap.polarBilin`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §7, scalar extension before Lemma 7.15, p.42; §8, Remark 8.18, p.51.

**Construction / proof route.**

- In a basis write q as square monomials plus off-diagonal polar coefficients and extend coefficients. The quadratic identities show this expression agrees after a change of basis.
- Tensor the linear maps witnessing isometries; matrix invertibility preserves nonsingularity. Identify the polynomial extension with Mathlib quadratic baseChange wherever its invertibility-of-two hypotheses hold.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `extend` (constructor): The quadratic map on E⊗F V.
- `extend_tmul` (simp): q_E(c⊗v)=c²·algebraMap(q(v)).
- `extend_polar` (compatibility): polar(q_E) is the scalar extension of polar(q).
- `extend_tower` (functoriality): (q_E)_L is canonically isometric to q_L.
- `extend_eq_baseChange` (compatibility): For 2 invertible the coordinate construction agrees with Mathlib baseChange.

**Uses.**

- EKM §§17–23: Function-field arguments require genuine scalar extension in every characteristic.
- Dittmann–Pop §3, pp.6–8: Residue/coefficient-field comparisons extend these same forms.

**Check — discriminating unit tests.**

- Extending [1,a] gives x²+xy+image(a)y², not x²+image(a)y².
- Extending xy gives the hyperbolic dual-product form over E.
- [1,1] from F₂ becomes isotropic over F₄; scalar extension preserves nonsingularity but need not preserve anisotropy.

**Acceptance.**

- The characteristic-two mixed coefficient is retained.
- Identity and composable field extensions commute up to the canonical tensor associator.

**Planet:** Quadratic scalar extension.

### Q2.0/nonsingular-witt-decomposition — Witt cancellation and splitting in characteristic two

**Theorem.** For finite-dimensional nonsingular quadratic spaces over a field, split off hyperbolic planes until the complement is anisotropic. The anisotropic complement and Witt index are unique up to isometry; cancellation holds for an orthogonal nonsingular summand. Extend the existing odd-characteristic theorems to characteristic two, using xy for the hyperbolic plane.

**Prerequisites:** `Q2.0/binary`, `Q2.0/scalar-extension`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`, `tauceti:QuadraticMap.IsRepresentedBy`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §8, Witt Extension Theorem 8.3, Cancellation Theorem 8.4 and Witt Decomposition Theorem 8.5, pp.47–49.

**Construction / proof route.**

- For an isotropic vector v choose w with polar(v,w)=1 and replace w by w−q(w)v, splitting an xy plane.
- For cancellation extend an isometry of the common nonsingular subspace by the Witt extension argument, then restrict to its orthogonal complement. Iterate and compare maximal hyperbolic summands. The characteristic-two proof uses binary symplectic blocks, not division by 2.

**Acceptance.**

- Dimension 2m and Witt index m characterize hyperbolicity.
- No new odd-characteristic Witt decomposition is claimed.

**Planet:** Witt decomposition in characteristic two.

### Q2.0/bilinear-witt-ring — Bilinear Witt ring in characteristic two

**Construction.** In characteristic two construct W_b(F), the Grothendieck ring of nonsingular symmetric bilinear spaces modulo metabolic classes; addition is orthogonal sum and multiplication is tensor product. Let I_b(F) be the kernel of dimension modulo two. Odd-characteristic W_b and I_b are imported from the parent roadmap through polarization; this node adds only the characteristic-two carrier and comparison interface.

**Prerequisites:** `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `mathlib:LinearMap.BilinForm`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §2, Lemma 2.1, Proposition 2.4 and Corollary 2.5, pp.19–21; §4, Theorem 4.8 and dimension map, pp.23–24; §8 p.51.

**Construction / proof route.**

- Form the isometry-class semiring, its group completion and the metabolic ideal. A lagrangian tensor any nonsingular bilinear form is again metabolic, so tensor descends.
- Use dimension parity to define I_b. A characteristic-two alternating nonsingular bilinear space is metabolic; diagonal nonsingular symmetric forms supply the remaining classes. Reuse the parent ring when 2 is invertible.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `BilinearWitt.classOf` (constructor): Class of a nonsingular symmetric bilinear form.
- `BilinearWitt.class_tensor` (compatibility): Tensor classes multiply and orthogonal sums add.
- `BilinearWitt.fundamentalIdeal` (data): Kernel of rank modulo two.
- `BilinearWitt.oddEquiv` (equivalence): For char≠2 identify with the imported parent Witt ring.

**Uses.**

- EKM §8, p.51: Acts on the quadratic Witt group.
- EKM §9, p.54: Its fundamental ideal defines the quadratic filtration.

**Check — discriminating unit tests.**

- [⟨1⟩_b] is the multiplicative unit and has odd dimension parity.
- The alternating bilinear plane has class zero.
- Over F₂, ⟨1⟩_b has nonzero parity while ⟨1,1⟩_b is metabolic; a quotient killing every diagonal form is wrong.

**Acceptance.**

- The identity is ⟨1⟩_b.
- A metabolic alternating plane has zero class even in characteristic two.

**Planet:** Bilinear Witt ring.

### Q2.0/quadratic-witt-module — Quadratic Witt module and bilinear tensor action

**Construction.** Construct I_q(F), the group of even-dimensional nonsingular quadratic spaces modulo hyperbolic spaces, with its W_b(F)-module action. For a symmetric bilinear form b and q, define b⊗q by its quadratic polynomial and the rule (b⊗q)(w⊗v)=b(w,w)q(v); its polar form is b⊗polar(q). The tensor is nonsingular when b and q are. A metabolic b or hyperbolic q acts by a hyperbolic tensor. Equal Witt class plus equal dimension implies isometry. For char≠2 identify I_q with the fundamental ideal of the imported Witt ring.

**Prerequisites:** `Q2.0/binary`, `Q2.0/scalar-extension`, `Q2.0/nonsingular-witt-decomposition`, `Q2.0/bilinear-witt-ring`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §8, Lemma 8.16, Remark 8.17 and Remark 8.18, pp.50–51.

**Construction / proof route.**

- Define the polynomial tensor including the mixed terms fixed by its polar form; the pure-tensor formula alone is supplemented by those quadratic identities.
- A lagrangian tensored with the other space gives the required hyperbolic dimension. Thus the action descends through metabolic and hyperbolic classes.
- Use Witt cancellation to compare representatives of equal class and dimension; use polarization for the odd-characteristic ideal identification.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `QuadraticWitt.classOf` (constructor): Class of an even nonsingular quadratic space.
- `bilinearTensorQuadratic` (constructor): Quadratic tensor on W⊗V, with the pure-tensor and polar formulas.
- `QuadraticWitt.action` (structure): The bilinear Witt ring acts on I_q.
- `QuadraticWitt.eq_iff` (characterisation): Equal class iff the anisotropic parts are isometric.
- `QuadraticWitt.oddEquiv` (compatibility): I_q(F) identifies with the parent fundamental ideal when 2 is invertible.

**Uses.**

- EKM §9: Defines characteristic-two quadratic Pfister forms.
- EKM §23, Theorem 23.7: Witt sums and anisotropic parts occur in the dimension-bound induction.

**Check — discriminating unit tests.**

- ⟨c⟩_b⊗[1,a] is c[1,a], of dimension 2.
- xy has zero quadratic Witt class, whereas [1,1] over F₂ has nonzero class.
- In odd characteristic the module action agrees with multiplication of the imported Witt classes.

**Acceptance.**

- The characteristic-two quadratic group is a module, with no unjustified product of two quadratic forms.
- Tensoring the bilinear line ⟨c⟩_b scales q by c.

**Planet:** Quadratic Witt module.

### Q2.0/quadratic-filtration — Quadratic fundamental filtration

**Definition.** For n≥1 put I_q^n(F)=I_b(F)^(n−1)·I_q(F) as subgroups of I_q(F). Thus I_q^1=I_q and I_q^(n+1)⊆I_q^n. In odd characteristic this is exactly the parent I(F)^n. There is no characteristic-two quadratic Witt ring whose n-th ideal power can replace this module filtration.

**Prerequisites:** `Q2.0/bilinear-witt-ring`, `Q2.0/quadratic-witt-module`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §9 after Example 9.4 and equation (9.5), pp.53–54.

**Construction / proof route.**

- Define the subgroup spanned by the indicated module products and derive the descending inclusions.
- Transport the odd-characteristic polarization isomorphism and compare module products with ideal powers.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `quadraticFiltration` (constructor): I_b^(n−1)·I_q, indexed only for n≥1.
- `quadraticFiltration_one` (simp): The first term is all I_q.
- `quadraticFiltration_succ_le` (structure): Each successive term is a subgroup of the previous term.
- `quadraticFiltration_odd` (compatibility): It corresponds to I^n in the parent Witt ring.

**Uses.**

- EKM Fact16.2, p.68: The invariant is defined on successive quotients.
- EKM Theorem23.7, p.100: Controls the minimum anisotropic dimension.

**Check — discriminating unit tests.**

- Over F₂ the anisotropic [1,1] lies in I_q^1, although its polar form is alternating and metabolic as a bilinear form.
- For odd characteristic the second term is I², not I³.
- The zero quadratic class lies in every term and its extension is zero.

**Acceptance.**

- The exponent shift by one survives the n=1 test.
- The filtration and scalar extension commute by the tensor and quotient maps.

### Worked example — Characteristic-two binary norm

Over F₂, [1,1] has value 1 at each of (1,0), (0,1), (1,1), hence is anisotropic. Its polar matrix is [[0,1],[1,0]], of determinant 1. Dropping xy instead gives the square (x+y)², which vanishes at (1,1) and has zero polar form. Thus the same example distinguishes the correct scalar-extension, nonsingularity and Witt-module carriers.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations are resolved.

## Q2.1 — Quadratic Pfister forms in every characteristic

**Direct layer inputs:** `Q2.0`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

### Q2.1/quadratic-pfister — All-characteristic quadratic Pfister forms

**Construction.** For n≥1 define an n-fold quadratic Pfister form as an (n−1)-fold bilinear Pfister tensor with a quadratic étale norm form. In char 2 its slots are a₁,…,a_(n−1)∈F× and a₀∈F, and its last factor is [1,a₀]; outer factors are ⟨1,−aᵢ⟩_b. In char≠2 use the existing n-fold parent construction with last factor ⟨1,−a₀⟩, a₀∈F×. The dimension is 2^n, the form represents 1, and its class belongs to I_q^n. Scaled n-fold forms generate I_q^n; unscaled forms generate additively for n>1. Do not assert the latter for n=1.

**Prerequisites:** `Q2.0/binary`, `Q2.0/scalar-extension`, `Q2.0/quadratic-witt-module`, `Q2.0/quadratic-filtration`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §9, Examples 9.3–9.4 and equation (9.5), pp.52–54; Dittmann–Pop §3, p.6.

**Construction / proof route.**

- In characteristic two iterate the bilinear tensor action on the binary last factor. Bilinear Pfister forms themselves are diagonal tensors, so no characteristic-two diagonal quadratic carrier is substituted.
- Prove the dimension and represented unit by tensor bases. Binary-block decomposition and I_b generation give scaled Pfister generation; the difference identity (9.5) removes scalars for n>1.
- For odd characteristic reuse the parent pfisterForm and its generation theorem. Compare [1,a] with ⟨1,−(1−4a)⟩ when 1−4a≠0 by completing the square.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `quadraticPfister` (constructor): The displayed bilinear tensor with the binary quadratic last factor.
- `quadraticPfister_dim` (simp): An n-fold form has dimension 2^n.
- `quadraticPfister_extend` (functoriality): Field extension applies to the same slots.
- `quadraticPfister_odd` (compatibility): Odd-characteristic tuples are the imported parent Pfister family.
- `quadraticPfister_generate` (structure): Scaled n-fold classes generate I_q^n; unscaled classes suffice for n>1.

**Uses.**

- Dittmann–Pop Proposition3.2: All three henselian isotropy assertions use this family.
- EKM §§16,23: Provides the generators for invariants and the Hauptsatz induction.

**Check — discriminating unit tests.**

- Over F₂ the one-fold form with a₀=1 is anisotropic of dimension 2.
- a₀=0 in characteristic two gives [1,0], which is hyperbolic; outer units do not change hyperbolicity.
- In odd characteristic a two-fold tuple is ⟨1,−a,−b,ab⟩, matching Tau Ceti current main, not the plus-sign convention.

**Acceptance.**

- Zero terminal parameter in characteristic two gives a hyperbolic form.
- The empty outer list gives the binary norm form, never a one-dimensional quadratic form.

**Planet:** Quadratic Pfister forms.

### Q2.1/binary-norm-roundness — Roundness of quadratic étale norms

**Theorem.** The norm form of a quadratic étale F-algebra is round: its nonzero represented values equal its similarity factors. In char 2 the algebra F[t]/(t²+t+a) has norm [1,a]; in char≠2 F[t]/(t²−a) has norm ⟨1,−a⟩. The split algebra gives the hyperbolic case.

**Prerequisites:** `Q2.0/binary`, `tauceti:QuadraticMap.Represents`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §9, Examples 9.3 and 9.4, pp.52–53.

**Construction / proof route.**

- Multiplication by an element of nonzero norm is an invertible linear similarity, so represented units are similarity factors.
- A norm form represents 1, so any similarity factor is represented. This proof also applies to the split étale algebra.

**Acceptance.**

- Over F₂, [1,1] is the norm of F₄/F₂.
- Represented values and similarity factors here range over F×.

### Q2.1/binary-tensor-roundness — The Pfister roundness induction step

**Theorem.** If ρ is nonsingular and round then ⟨1,−a⟩_b⊗ρ is round, for a∈F×. Its isotropy, hyperbolicity and the condition a∈D(ρ) are equivalent. This includes an isotropic round ρ: it is universal, so every a is represented and every such tensor is hyperbolic.

**Prerequisites:** `Q2.0/quadratic-witt-module`, `Q2.0/nonsingular-witt-decomposition`, `Q2.1/binary-norm-roundness`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §9, Proposition 9.8, p.54.

**Construction / proof route.**

- Write a represented value as ρ(v)−aρ(w). Use roundness to normalize nonzero block values and the binary norm identity to obtain a similarity of the tensor.
- If ρ is anisotropic, an isotropic vector of ρ⊥−aρ gives two nonzero represented values with ratio a. Roundness then identifies aρ with ρ, so the tensor is isometric to ρ⊥−ρ and is hyperbolic. If ρ is isotropic, nonsingularity splits off a hyperbolic plane, hence D(ρ)=F×. Roundness gives G(ρ)=F× and the same tensor identity; it does not require ρ itself to be hyperbolic.

**Acceptance.**

- The parameter test also covers isotropic round ρ; it does not assert that ρ itself is hyperbolic.
- No division by 2 occurs in the tensor argument.

### Q2.1/all-length-roundness — Roundness in every Pfister length

**Theorem.** Every n-fold quadratic Pfister form, n≥1, is round in every characteristic: D_F(ρ)=G_F(ρ) as subsets of F×. Import the parent one-fold and two-fold odd-characteristic cases and extend the induction to every length and to characteristic two.

**Prerequisites:** `Q2.1/quadratic-pfister`, `Q2.1/binary-norm-roundness`, `Q2.1/binary-tensor-roundness`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §9, Corollary 9.9, p.54.

**Construction / proof route.**

- Start with the quadratic étale norm case and apply the binary tensor roundness step n−1 times.
- The form represents 1; this supplies the reverse inclusion from similarity factors to represented units.

**Acceptance.**

- The result is stable under arbitrary field extension.
- Zero belongs to the ordinary value image but is excluded from D_F and G_F.

**Planet:** Pfister roundness.

### Q2.1/pfister-hyperbolicity — Pfister isotropy and hyperbolicity

**Theorem.** For a quadratic Pfister form ρ of length n≥1 over any field, isotropy, hyperbolicity, maximal Witt index 2^(n−1), and vanishing of its class in I_q(F) are equivalent. In odd characteristic reuse the existing length-two equivalence and prove the all-length extension.

**Prerequisites:** `Q2.1/quadratic-pfister`, `Q2.1/binary-tensor-roundness`, `Q2.1/all-length-roundness`, `Q2.0/nonsingular-witt-decomposition`, `Q2.0/quadratic-witt-module`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §9, Corollary 9.10, p.54; Dittmann–Pop §3, p.6.

**Construction / proof route.**

- Induct through binary outer factors; an anisotropic inner form uses the represented-parameter criterion, and a hyperbolic inner form stays hyperbolic under tensor.
- Witt decomposition and dimension identify the other two conditions.

**Acceptance.**

- This equivalence is false for a general nonsingular isotropic quadratic form.
- In characteristic two use xy planes, not diagonal ⟨1,−1⟩.

**Planet:** Pfister isotropy criterion.

### Worked example — Terminal zero and outer signs

In characteristic two [1,0](0,1)=0 and its polar form is nonsingular, so it is hyperbolic. Every outer bilinear tensor remains hyperbolic. In odd characteristic the two-fold tensor expands as ⟨1,−a,−b,ab⟩; this fixes the sign convention used by the parent and by the valuation-block expansion.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations are resolved.

## Q2.2 — Polynomial representation and the Arason–Pfister bound

**Direct layer inputs:** `Q2.0`, `LogicAndDefinabilityInNumberTheory:LD.1`, `SchemeAndStackFoundations:SF.0`, `Q2.1`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`.

### Q2.2/purely-transcendental-anisotropy — Pure transcendental preservation

**Theorem.** If q is anisotropic over F then q_F(T) is anisotropic for a finite algebraically independent tuple T. Scalar extension I_q(F)→I_q(F(T)) is injective.

**Prerequisites:** `Q2.0/scalar-extension`, `Q2.0/nonsingular-witt-decomposition`, `Q2.0/quadratic-witt-module`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §7, Lemma 7.15, p.43; §8, Remark 8.18, p.51.

**Construction / proof route.**

- Clear denominators in a hypothetical isotropic vector. In one variable let v_d be its highest nonzero coefficient. The coefficient of degree 2d in q(v(T)) is q(v_d), which anisotropy makes nonzero, a contradiction.
- Iterate one variable at a time and apply uniqueness of anisotropic representatives to the Witt kernel.

**Acceptance.**

- No infinitude assumption on F.
- Applies to characteristic-two nonsingular binary blocks.

### Q2.2/cassels-pfister — The Cassels–Pfister polynomial representation theorem

**Theorem.** For anisotropic q over F and h∈F[t] nonzero, if q represents h over F(t), there is a polynomial vector w∈V[t] with q(w)=h. More precisely, for s∈V and an existing v∈V(F(t)) such that q(v) and polar(q)(s,v) both lie in F[t], one can choose w∈V[t] retaining both values.

**Prerequisites:** `Q2.0/scalar-extension`, `Q2.2/purely-transcendental-anisotropy`, `Q2.0/nonsingular-witt-decomposition`, `tauceti:QuadraticMap.Represents`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §17, Theorem 17.3 and Proposition 17.9, pp.71–73.

**Construction / proof route.**

- Choose a rational representing vector with minimal denominator degree. Divide its polynomial numerator by that denominator.
- Reflect in the remainder vector; the quadratic identity produces a smaller denominator unless the original denominator was constant. The remainder is nonisotropic by anisotropy.
- For the constrained version start with the given rational vector v. Write its numerator as d·u+r with deg r<deg d. Since polar(s,v) is polynomial, polar(s,r) is divisible by d and has smaller degree, hence is zero. Reflection in r fixes s and retains the pairing while decreasing the denominator.

**Acceptance.**

- The output is a polynomial vector, stronger than a rational representation.
- The polar constraint supports binary block removal in characteristic two.

**Planet:** Cassels–Pfister theorem.

### Q2.2/representation-theorem — The representation theorem for anisotropic forms

**Theorem.** For anisotropic q,ψ over F, dim ψ=m, the following are equivalent: D(ψ_E)⊆D(q_E) for every extension E/F; the generic polynomial ψ(T) is represented by q_F(T); ψ admits an injective isometry into q. Consequently dim ψ≤dim q.

**Prerequisites:** `Q2.2/cassels-pfister`, `Q2.2/purely-transcendental-anisotropy`, `Q2.0/nonsingular-witt-decomposition`, `tauceti:QuadraticMap.IsRepresentedBy`, `Q2.0/binary`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §7, Example 7.2, pp.39–40, and Corollary 7.29/Proposition 7.31, pp.45–46; §8, reflection identity (8.1), p.47; §17, Lemma 17.10, Corollary 17.11 and Theorem 17.12, pp.73–74.

**Construction / proof route.**

- Choose the quadratic normal form of ψ: nonsingular binary blocks together with a diagonal polar-radical part in characteristic two, or a diagonal form in odd characteristic (EKM7.29–7.31). Use polynomial representation and its fixed-pairing version to remove a binary block while retaining its mixed term.
- For the remaining diagonal part, isolate one variable and apply the polynomial representation theorem over the field in the other variables. Align two vectors of the same nonzero value directly: if x≠y, reflection in x−y maps x to y because anisotropy ensures q(x−y)≠0. Restrict the remaining polynomial vector to the appropriate orthogonal complement and induct. This works for anisotropic complements even if their polar forms are singular; no unrestricted Witt extension theorem is assumed.
- An injective isometry gives value inclusion after every extension. Conversely apply value inclusion over F(T) to the generic vector of ψ; anisotropy under pure transcendence makes its value nonzero. The preceding induction gives the injective isometry and its dimension bound.

**Acceptance.**

- In the nonsingular scope the characteristic-two binary blocks suffice.
- The result retains anisotropy of both forms.

### Q2.2/quadratic-transfer — Transfer and Frobenius reciprocity

**Construction.** For a finite field extension E/F and nonzero F-linear s:E→F, use the current library’s QuadraticMap.scharlauTransfer for q↦s∘q on restriction of scalars; construct its symmetric bilinear counterpart and extend the nonsingularity, hyperbolicity, Witt-module descent and Frobenius reciprocity results to characteristic two. Import the parent’s existing odd-characteristic Witt transfer and projection formula. In every characteristic obtain s_*(b_E⊗q)=b⊗s_*q. For E=F(θ), θ≠0, the functional s(1)=1, s(θ^i)=0 for 1≤i<[E:F] sends the one-fold bilinear Pfister class of θ to that of N_E/Fθ.

**Prerequisites:** `Q2.0/scalar-extension`, `Q2.0/bilinear-witt-ring`, `Q2.0/quadratic-witt-module`, `Q2.0/nonsingular-witt-decomposition`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §20.A, Lemmas 20.1, 20.4–20.5, Proposition 20.2 and Corollary 20.13, pp.82–86; Tau Ceti Roadmap contributors, Layer9, transfer milestones; current Tau Ceti Transfer/Basic.lean:48–54,188–190; Transfer/Frobenius.lean:102; Transfer/Witt.lean:147,186–190 at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

**Construction / proof route.**

- Reuse current QuadraticMap.scharlauTransfer and polar_scharlauTransfer, which require no inverse of two. The tensor reassociation map identifies the Frobenius-reciprocity forms by evaluation. A nonzero functional gives a nondegenerate pairing (x,y)↦s(xy), even for inseparable field extensions; do not substitute a possibly zero field trace.
- Transfer a half-dimensional lagrangian and count the restricted-scalar dimension to descend to Witt groups.
- In the power basis compute the two transferred lines and cancel metabolic pairs; their difference gives the norm Pfister class.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `QuadraticMap.scharlauTransfer` (compatibility): Reuse the current library constructor q↦s∘q; no second quadratic-transfer constructor is introduced.
- `quadraticTransfer_frobenius` (compatibility): Transfer commutes with the displayed bilinear module action.
- `quadraticTransfer_hyperbolic` (characterisation): A hyperbolic input has hyperbolic transfer.
- `bilinearTransfer_normPfister` (simp): The specified power-basis functional sends ⟨⟨θ⟩⟩ to ⟨⟨Nθ⟩⟩.
- `bilinearTransfer` (constructor): Compose a symmetric bilinear form’s values with s after restricting scalars; give the evaluation formula and descend through metabolic classes.

**Uses.**

- EKM Theorem20.14: The similarity norm principle applies transfer to a vanishing Pfister tensor.
- Morel §2.2: Odd-characteristic graded Witt transfers are required for cycle-module compatibility.

**Check — discriminating unit tests.**

- For E=F and s=id, transfer is the identity.
- In an inseparable characteristic-two extension the field trace may vanish; choosing it in place of a nonzero s would destroy nonsingularity.
- Transfer of xy over E is a sum of [E:F] hyperbolic planes over F.

**Acceptance.**

- Separability is not required when using a nonzero functional.
- The zero functional is excluded.

### Q2.2/odd-degree-anisotropy — Springer odd-degree preservation

**Theorem.** An anisotropic quadratic form remains anisotropic under every finite extension of odd degree, in all characteristics. Hence restriction on I_q is injective for such extensions.

**Prerequisites:** `Q2.2/purely-transcendental-anisotropy`, `Q2.0/nonsingular-witt-decomposition`, `Q2.0/quadratic-witt-module`, `Q2.0/scalar-extension`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §18, Lemma 18.1, Theorem 18.3 and Corollaries 18.5–18.6, pp.75–77.

**Construction / proof route.**

- Induct through a tower of simple extensions; all their degrees are odd. For a counterexample of least odd degree n>1, write E=F(θ) with monic minimal polynomial p of degree n. Lift an isotropic vector to polynomial coordinates of degree <n and divide their common gcd to obtain a primitive vector v still nonzero modulo p.
- Anisotropy over F makes q(v) nonzero of degree 2d, where d is the largest coordinate degree. Write q(v)=p·g. Then deg g=2d−n is nonnegative, odd and <n. An odd-degree irreducible factor h of g exists. Primitivity makes v modulo h nonzero, so it is an isotropic vector over F[t]/(h), contradicting minimality. This also covers inseparable simple extensions.
- Use the anisotropic representative of a quadratic Witt class to deduce injectivity of restriction on I_q.

**Acceptance.**

- Purely inseparable odd-degree extensions are included.
- This is distinct from Springer complete-DVR anisotropy assigned to the real-function-field split.

### Q2.2/similarity-norm — The similarity norm principle

**Theorem.** For nonsingular even-dimensional q and a finite extension E/F, N_E/F(G(q_E))⊆G(q), with no characteristic restriction.

**Prerequisites:** `Q2.2/quadratic-transfer`, `Q2.2/odd-degree-anisotropy`, `Q2.0/quadratic-witt-module`, `Q2.0/nonsingular-witt-decomposition`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §20.B, Theorem 20.14, p.86.

**Construction / proof route.**

- For E=F(a), transfer the zero Witt class ⟨⟨a⟩⟩_b·q_E using the norm-transfer identity and Frobenius reciprocity. Equal dimension turns Witt equality into similarity.
- For a general E reduce to F(a). If [E:F(a)] is even the norm is a square; if odd use Witt injectivity to descend the similarity first.

**Acceptance.**

- The norm is of a nonzero similarity factor.
- The functional is chosen as above, rather than assuming a separable trace.

### Q2.2/odd-divisor-specialization — Odd-divisor hyperbolic specialization

**Theorem.** Let q be nonsingular of even dimension over F and f∈F[T] nonzero. If q_F(T)≅f q_F(T), then q over Frac(F[T]/(p)) is hyperbolic for each irreducible p dividing f to an odd exponent.

**Prerequisites:** `Q2.0/scalar-extension`, `Q2.0/nonsingular-witt-decomposition`, `Q2.0/quadratic-witt-module`, `Q2.2/purely-transcendental-anisotropy`, `LogicAndDefinabilityInNumberTheory:LD.1`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §19, Lemmas 19.2–19.5, Proposition 19.7 and Proposition 19.8, pp.79–80.

**Construction / proof route.**

- Pass to the henselization of the DVR F[T]_(p), preserving residue field and value group. A nonsingular integral form splits off every residue hyperbolic plane: a residue isotropic vector lifts by the simple-root Hensel argument because its polar gradient is nonzero.
- After removing square factors, f=uπ for a unit u and uniformizer π. If the residual anisotropic complement were nonzero, its sum with its uπ multiple would be anisotropic by reducing a primitive vector and comparing even and odd valuations. This contradicts q≅uπq. The unit cannot simply be discarded; it can instead be absorbed into the chosen uniformizer.

**Acceptance.**

- The complete DVR is an auxiliary proof device, not an assertion that the original valuation has rank one.
- This treats residue characteristic two because the integral polar form remains nonsingular.

### Q2.2/quadratic-similarity — The quadratic similarity theorem

**Theorem.** For nonsingular even-dimensional q over F and nonzero f∈F[T], there exists a∈F× such that af is a similarity factor of q_F(T) iff q_F(p) is hyperbolic for every irreducible divisor p occurring oddly in f. Equivalently f* f is a similarity factor, where f* is the leading coefficient in the successive variable order used by EKM.

**Prerequisites:** `Q2.2/odd-divisor-specialization`, `Q2.2/similarity-norm`, `Q2.2/purely-transcendental-anisotropy`, `Q2.0/scalar-extension`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §20.B, Lemma 20.15 and Theorem 20.16, pp.86–87.

**Construction / proof route.**

- Necessity is odd-divisor specialization. For one variable a monic irreducible p is the norm of t−θ from its residue field extended by t. Hyperbolicity makes t−θ a similarity factor upstairs, and the similarity norm principle supplies p downstairs. Products and square factors reduce the general polynomial to irreducible factors.
- For the multivariable induction take f irreducible of positive first-variable degree, set E=F(T′), and let g∈F[T′] be its leading coefficient. Gauss’s lemma makes f/g monic irreducible in E[t₁]; its residue field is F(f). The one-variable argument gives f/g, hence fg, as a similarity factor over F(T).
- For an irreducible p of odd multiplicity in g, irreducibility of f gives p∤f. Apply the already proved necessity to the similarity factor fg: q is hyperbolic over F(p)(t₁). Pure-transcendental Witt injectivity descends this to F(p). Induct on g in fewer variables to get g*·g; multiplying by f/g gives f*·f, since g*=f*.

**Acceptance.**

- The statement fixes even dimension and nonsingularity.
- This is a theorem on actual similarity factors, not only a Witt relation.

**Planet:** Quadratic similarity theorem.

### Q2.2/quadric-function-field — Function field of a quadratic form

**Construction.** For an anisotropic nonsingular quadratic form ψ of dimension m≥2, define F(ψ) as the degree-zero field of fractions of the integral graded ring Sym(V*)/(ψ), equivalently the function field of its projective quadric. Then ψ becomes isotropic over F(ψ). In dimension two this is the quadratic étale field attached to ψ; in dimension at least three nonsingularity makes the quadric geometrically smooth and anisotropy ensures the required integral equation. Define the generic point and its universal quadratic relation.

**Prerequisites:** `Q2.0/scalar-extension`, `Q2.0/binary`, `Q2.2/purely-transcendental-anisotropy`, `SchemeAndStackFoundations:SF.0`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §22.A, pp.93–94, including Proposition 22.1.

**Construction / proof route.**

- Choose a homogeneous coordinate, pass to the affine chart and take its fraction field; chart changes give canonical identifications.
- Anisotropy implies irreducibility of the quadratic equation. The degree-zero fractions of the coordinate ratios give a nonzero generic isotropic vector. For a binary form this recovers the field defined by its irreducible quadratic polynomial.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `quadricFunctionField` (constructor): The projective function field of anisotropic nonsingular ψ.
- `quadricFunctionField_isotropic` (characterisation): ψ extended to this field has a nonzero zero.
- `quadricFunctionField_chart` (equivalence): The fraction-field descriptions on nonempty affine charts agree.
- `quadricFunctionField_binary` (compatibility): In rank two identify with the quadratic étale field.

**Uses.**

- EKM Subform Theorem22.5: Passes from splitting over a quadric to an embedded subform.
- EKM Theorem23.7: A final Pfister summand is killed over its own quadric field.

**Check — discriminating unit tests.**

- The quadric field for [1,1] over F₂ is the quadratic extension F₄, not F₂(t).
- For m≥3 its transcendence degree over F is m−2.
- An isotropic split binary equation has a reducible projective quadric and is excluded from this constructor.

**Acceptance.**

- Do not take the full affine cone fraction field, which has an extra variable.
- For [1,1] over F₂ the field is F₄.

**Planet:** Quadric function field.

### Q2.2/subform-theorem — The subform theorem

**Theorem.** Let q be nonzero anisotropic nonsingular, and ψ anisotropic nonsingular of dimension ≥2. If q_F(ψ) is hyperbolic, then for every a∈D(q), b∈D(ψ), the form abψ admits an injective isometry into q. In particular dim ψ≤dim q.

**Prerequisites:** `Q2.2/quadric-function-field`, `Q2.2/quadratic-similarity`, `Q2.2/representation-theorem`, `Q2.1/all-length-roundness`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §22, Proposition 22.4 and Theorem 22.5, p.94.

**Construction / proof route.**

- Normalize using a and b. Hyperbolicity over F(ψ) and the quadratic similarity theorem make bψ(T) a similarity factor of q_F(T).
- Apply the similarity to a vector representing a. The resulting vector represents abψ(T).
- The representation theorem embeds abψ into q and gives the dimension inequality.

**Acceptance.**

- All dimension comparisons use injective isometries.
- Anisotropy of q is essential.

**Planet:** Subform theorem.

### Q2.2/arason-pfister — The Arason–Pfister Hauptsatz

**Theorem.** For n≥1 and a nonzero anisotropic nonsingular quadratic form q with [q]∈I_q^n(F), dim q≥2^n. Equivalently a nonsingular form of dimension less than 2^n with class in I_q^n is hyperbolic.

**Prerequisites:** `Q2.0/quadratic-filtration`, `Q2.1/quadratic-pfister`, `Q2.2/quadric-function-field`, `Q2.2/subform-theorem`, `Q2.1/pfister-hyperbolicity`, `Q2.0/quadratic-witt-module`, `Q2.0/nonsingular-witt-decomposition`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §23, Theorem 23.7, p.100.

**Construction / proof route.**

- Write [q] as a finite sum of scaled n-fold Pfister classes and induct on the number of summands. For one summand use equal class and anisotropic representatives.
- Extend to the function field of the final anisotropic Pfister summand, where that summand vanishes. If q remains nonhyperbolic, its nonzero anisotropic part has dimension ≥2^n by the induction hypothesis.
- If q becomes hyperbolic, the subform theorem embeds a scalar multiple of that Pfister form into q and gives the same bound. A hyperbolic final summand is removed outright.

**Acceptance.**

- For n=1 the lower bound is 2, including characteristic two.
- The equivalent formulation permits isotropic q but concludes hyperbolicity below the strict bound.

**Planet:** Arason–Pfister Hauptsatz.

### Worked example — Projective rather than affine quadric field

For the anisotropic binary form [1,1] over F₂, the projective chart y≠0 has coordinate t=x/y and equation t²+t+1=0. Its function field is F₄, with no extra transcendental coordinate. The affine cone’s fraction field would instead retain a free scaling coordinate. The projective construction is required by the subform argument.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations are resolved.

## Q2.3 — Higher quadratic cohomological invariants

**Direct layer inputs:** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7a-the-mod-2-operations-consumed-and-the-μ₂-adapters`, `K2SymbolsBrauer:T.2`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `Q2.0`, `Q2.1`, `MotivicEtaleKTheory:M.5a`, `Q2.2`, `MotivicEtaleKTheory:M.5d`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.

### Q2.3/cohomology-coefficients — Quadratic cohomology coefficients

**Construction.** For n≥1 define the notation H_q^n(F)=H^n_et(F,Z/2(n−1)). If char F≠2 use continuous Galois cohomology with μ₂^(⊗(n−1)). If char F=2 interpret the coefficient complex by H_q^n(F)=H¹_et(F,Ω^(n−1)_log), using length-one logarithmic differentials and the shift by n−1. At n=1 this is H¹(F,Z/2), including the Artin–Schreier quotient in characteristic two. Import the coefficient objects, restriction and cup products from their existing owners; construct only the uniform notation/comparison adapter.

**Prerequisites:** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7a-the-mod-2-operations-consumed-and-the-μ₂-adapters`.

**Source:** Philip Dittmann and Florian Pop, §2 conventions and footnote on Z/l(i), pp.3–4; §3 p.6; EKM §101, definitions and Example101.1, pp.402–404.

**Construction / proof route.**

- Use the prime-to-characteristic étale/Galois comparison for the odd-characteristic branch. At characteristic two use the logarithmic coefficient complex and its degree shift, not the ordinary étale μ₂ group.
- Transport restriction and the action of Milnor symbols from the supplied cohomology functors. Identify the degree-one Artin–Schreier description.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `QuadraticCohomology` (constructor): The specified H_q^n(F), n≥1.
- `QuadraticCohomology.restrict` (functoriality): A field embedding induces restriction; identity and tower laws hold.
- `QuadraticCohomology.oddEquiv` (compatibility): Identify with H^n(F,μ₂^(⊗(n−1))) when 2 is invertible.
- `QuadraticCohomology.logEquiv` (compatibility): In characteristic two identify with H¹_et(F,Ω^(n−1)_log).

**Uses.**

- Dittmann–Pop §3: Target of the Pfister invariant and the local–global restrictions.
- EKM Fact16.2: The graded quadratic Witt comparison has this target in both characteristic branches.

**Check — discriminating unit tests.**

- H_q^1(F₂)=F₂/(x²+x)≅Z/2, so it is not killed by using μ₂(F₂)=1.
- For odd characteristic the last quadratic character is in H¹(F,Z/2); each outer unit contributes a Kummer degree-one class.
- For separably closed F, H_q^n=0 for n≥1, even though logarithmic differential sections in degree n−1 need not vanish in an arbitrary imperfect field.

**Acceptance.**

- The wild target is H¹ of log forms, not the degree-n logarithmic sections themselves.
- BGK supplies logarithmic symbols; it does not by itself prove the quadratic graded-Witt comparison.

**Planet:** Quadratic cohomology.

### Q2.3/milnor-witt-map — The quadratic Milnor homomorphism in odd characteristic

**Construction.** When char F≠2, construct the surjective graded ring map s:K_*^M(F)/2→⊕ I(F)^n/I(F)^(n+1), sending {a₁,…,aₙ} to the imported parent n-fold Pfister class. Prove the Steinberg and multiplicativity relations; this construction establishes surjectivity, not injectivity.

**Prerequisites:** `K2SymbolsBrauer:T.2`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `Q2.0/quadratic-filtration`, `Q2.1/quadratic-pfister`.

**Source:** Fabien Morel, §1, equations (1)–(2), pp.64–65.

**Construction / proof route.**

- The Witt identities for ⟨⟨u⟩⟩ show additivity modulo I² and the Steinberg relation. Thus the tensor-algebra map factors through mod-two Milnor K-theory.
- Parent Pfister generation gives surjectivity in every positive degree; dimension parity treats degree zero.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `milnorWittMap` (constructor): The displayed graded ring map s.
- `milnorWittMap_symbol` (simp): A pure symbol maps to its n-fold Pfister class modulo I^(n+1).
- `milnorWittMap_natural` (functoriality): Field restriction commutes with s.
- `milnorWittMap_surjective` (characterisation): Every graded Witt class is in the image.

**Uses.**

- Morel Theorem1.1: The theorem proves injectivity of this actual map.
- Q2.3/pfister-invariant: The invariant is the inverse of s followed by norm residue in odd characteristic.

**Check — discriminating unit tests.**

- In degree zero, 1 maps to the rank-parity class of ⟨1⟩.
- {u,1−u} maps to zero for u≠0,1.
- In degree one, s({a}) is ⟨1,−a⟩ modulo I²; the square class of 1 maps to zero.

**Acceptance.**

- The positive-degree map uses the same minus-sign Pfister convention as the parent.
- Injectivity is a separate theorem.

### Q2.3/unramified-witt-sheaves — Unramified Witt sheaves for the Milnor proof

**Construction.** Fix a perfect k with char k≠2. On smooth k-schemes take the Zariski sheaf W associated to the Witt-group presheaf. For integral X with function field F put I^n(X)=W(X)∩I^n(F), and use the product over components for general X. Let i_n=I^n/I^(n+1), let k_n be the unramified mod-two Milnor sheaf, and set j_n=ker(k_n→i_n). Establish the 0-purity descriptions by intersections over codimension-one local rings and the residue/transfer cycle-module compatibility needed by Morel’s proof. These are sheaves built from the parent Witt functor, not another field Witt ring.

**Prerequisites:** `Q2.3/milnor-witt-map`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `MotivicEtaleKTheory:M.5a`, `SchemeAndStackFoundations:SF.2`, `Q2.2/quadratic-transfer`, `Q2.2/odd-degree-anisotropy`.

**Source:** Fabien Morel, §2.1, Definition2.1 and Theorems2.2–2.3, pp.70–72; §2.2, Theorem2.11, pp.76–78.

**Construction / proof route.**

- Sheafify the Witt presheaf and identify its restriction to fields with the imported field-level carrier. The required Witt purity theorem identifies sections with the codimension-one intersection.
- Use DVR residues and transfer compatibility to descend the Milnor map to a map of cycle modules; define its kernel. When lower j degrees vanish, j_N is birational and flasque.
- Morel2.11 also uses Arason’s transfer theorem to preserve I^n and make graded transfer independent of the chosen nonzero functional, and quadratic-extension generation for Milnor K-theory. The recorded proof-input gap includes these precise external leaves, Ojanguren–Panin Witt purity, and the generic Rost residue/transfer/Gersten and homotopy infrastructure; the elementary transfer node alone does not prove them.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `unramifiedWitt` (constructor): The Zariski Witt sheaf W over Sm_k.
- `unramifiedWitt_power` (data): The intersection subsheaf I^n.
- `milnorWittKernel` (constructor): j_n=ker(k_n→I^n/I^(n+1)) as a sheaf.
- `milnorWittKernel_birational` (characterisation): If j_(N−1)=0 in the induction, j_N is invariant under dense open restriction.

**Uses.**

- Morel §3.3: Birational kernel sheaves give the Ext vanishing.
- Morel §3.4: The extension lifting produces the inverse invariant.

**Check — discriminating unit tests.**

- At Spec F, I^n has value the imported I(F)^n and j_n has value ker(s_n).
- At a smooth integral curve, W(X) is the intersection of the unramified local Witt groups inside W(F).
- If s_n is injective on every field extension, j_n is the zero sheaf by 0-purity; using the entire Milnor sheaf as j_n fails this test.

**Acceptance.**

- Do not define i_n(X) as I^n(W(X)) on arbitrary schemes: the intersection construction is what is required.
- The field value of j_n is the kernel of the already named s_n.

### Q2.3/milnor-kernel-ext — Vanishing for the kernel of the Milnor map

**Theorem.** In Morel’s induction fix N>0 and perfect k of characteristic ≠2. Assume s_n is an isomorphism for all fields over k in weights n<N, s_n(k) is an isomorphism for n≤N, and cup with τ=−1 makes H^(n−1)(F,Z/2(n−1))→H^(n−1)(F,Z/2(n)) surjective for every finite-type F/k and 1≤n<N. Then Ext^a_Ab(Sm_k,Zar)(k_n,j_N)=0 for 0≤n<N and a=0,1,2.

**Prerequisites:** `Q2.3/unramified-witt-sheaves`, `MotivicEtaleKTheory:M.5a`, `SchemeAndStackFoundations:SF.2`, `MotivicEtaleKTheory:M.5d`.

**Source:** Fabien Morel, §3.1–3.3, Theorem3.4 and Lemmas3.5–3.9, pp.81–87; Theorem3.10, pp.87–89.

**Construction / proof route.**

- The Rost cycle-module kernel has the lower-weight vanishing required by Morel3.10. Its contraction values at k vanish by the prime-field induction assumptions.
- Model motivic complexes by equidimensional-cycle complexes. Remove cycle supports in X×A^n; the explicit A¹ translation homotopy gives derived Hom(Z/2(n),j_N[*])=0 in the needed weight range.
- The universal-coefficient spectral sequence with top homology k_n gives Ext⁰ and Ext¹ zero. The τ-surjectivity makes the next Hom group inject into Hom(k_(n−1),j_N)=0, giving Ext². For n=0 use 0→Z→Z→k_0→0 and j_N(k)=0.

**Acceptance.**

- τ has motivic degree (0,1), rather than the Galois H¹ Kummer class of −1.
- The asserted vanishing is exactly the input for the extension-lifting construction.

### Q2.3/odd-graded-comparison — The Milnor conjecture for the quadratic Witt ring

**Theorem.** For every field F of characteristic ≠2 and every n≥0 the Milnor homomorphism s_n:K_n^M(F)/2→I(F)^n/I(F)^(n+1) is an isomorphism, naturally in F. Composing its inverse with the separately imported norm-residue isomorphism gives I_q^n/I_q^(n+1)≅H_q^n(F) for n≥1.

**Prerequisites:** `Q2.3/milnor-witt-map`, `Q2.3/unramified-witt-sheaves`, `Q2.3/milnor-kernel-ext`, `MotivicEtaleKTheory:M.5d`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `Q2.3/cohomology-coefficients`.

**Source:** Fabien Morel, Theorems1.1 and1.3, pp.65–66; §3.4, Lemmas3.11–3.16 and Corollary3.17, pp.89–93.

**Construction / proof route.**

- Choose the prime field k, whose quadratic Milnor comparison is computed directly from finite-field Witt classes and the rational-field arithmetic residue sequence. The precise prime-field computation is included in the recorded Morel proof-input gap until its primary source is audited.
- The motivic/étale norm-residue comparison gives τ-surjectivity. Use the kernel Ext vanishing to lift 0→i_N→W/I^(N+1)→W/I^N→0 to an extension by k_N.
- The Witt presentation by units and relations on opens of tori lifts W to this extension. Its restriction to I^N kills I^(N+1) and sends an N-fold Pfister form to its symbol, giving a left inverse to s_N. Induct on N and pass to general field extensions by the supplied limit results.
- Use norm residue only after the quadratic comparison. For characteristic zero OVV4.1 supplies an independent route; its standing characteristic-zero assumption is not extended to positive characteristic.

**Acceptance.**

- Two distinct deep inputs remain visible: quadratic Witt comparison and norm residue.
- Odd positive characteristic is covered by Morel, not by applying OVV4.1 outside its hypotheses.

**Planet:** Quadratic Milnor conjecture.

### Q2.3/kato-graded-comparison — Kato’s characteristic-two quadratic comparison

**Theorem.** For char F=2 and n≥1 there is a natural additive isomorphism ē_n:I_q^n(F)/I_q^(n+1)(F)→H¹_et(F,Ω^(n−1)_log). On ⟨⟨a₁,…,a_(n−1),a₀]] it sends the class to the cohomology class represented by a₀ dlog(a₁)∧…∧dlog(a_(n−1)), equivalently the outer differential symbol acting on the Artin–Schreier character a₀.

**Prerequisites:** `Q2.0/quadratic-filtration`, `Q2.1/quadratic-pfister`, `Q2.3/cohomology-coefficients`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/logarithmic-de-rham-witt-coefficients`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §16, Proposition16.1 and Fact16.2, pp.67–68, citing Kato [78], Inventiones66 (1982), pp.493–510.

**Construction / proof route.**

- The quadratic Pfister identities give the indicated candidate differential symbol on the associated graded module. The coefficient target is the H¹ quotient, not the BGK logarithmic section group.
- The remaining content is Kato’s kernel computation: the relations on differential representatives are exactly the next filtration term. The complete primary proof was not accessible in the cleared/public sources; this is an explicit source/proof gap, not an appeal to BGK as a substitute.

**Acceptance.**

- For n=1 recover the Arf/Artin–Schreier class of [1,a₀].
- A square outer parameter gives a hyperbolic form and a zero dlog factor.

**Planet:** Kato quadratic comparison.

### Q2.3/pfister-invariant — The higher Pfister invariant

**Definition.** For a nonsingular quadratic n-fold Pfister form ρ, n≥1, define e_n(ρ)=ē_n([ρ] mod I_q^(n+1))∈H_q^n(F), using the odd-characteristic comparison followed by norm residue or the characteristic-two Kato comparison. It depends only on the isometry class. In odd characteristic it is the cup of the outer Kummer symbols with the final quadratic étale character; in characteristic two the last character is Artin–Schreier.

**Prerequisites:** `Q2.1/quadratic-pfister`, `Q2.3/cohomology-coefficients`, `Q2.3/odd-graded-comparison`, `Q2.3/kato-graded-comparison`, `Q2.0/quadratic-filtration`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §16, Proposition16.1 and Fact16.2, pp.67–68; Dittmann–Pop §3, p.6.

**Construction / proof route.**

- Take the quotient class under the existing Witt-class map and apply the appropriate comparison. Thus isometry invariance follows without defining the invariant by an unproved relation on slot tuples.
- Evaluate on Pfister generators using the symbol formulas of the two comparisons.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `pfisterInvariant` (constructor): The class e_n(ρ) in H_q^n(F).
- `pfisterInvariant_symbol` (simp): Evaluation on slot tuples is the Kummer/Artin–Schreier cup symbol as specified.
- `pfisterInvariant_isometry` (compatibility): Isometric Pfister forms have equal invariant.
- `pfisterInvariant_extend` (functoriality): Extension of the form corresponds to cohomological restriction.

**Uses.**

- Dittmann–Pop Proposition3.2(3): Detect isotropy after proving a high-degree class vanishes.
- Proposed QuadraticFormsRealFunctionFields: Supplies the higher-Pfister input to the level/ω comparison; no second invariant is planned there.

**Check — discriminating unit tests.**

- For F₂, e₁([1,1]) is the nonzero Artin–Schreier class.
- e₁([1,0])=0 and every Pfister tensor of it has invariant zero.
- For odd characteristic and n=2, the invariant identifies with the parent quaternion/Brauer cup class under its μ₂ comparison.

**Acceptance.**

- Scalar-isometric presentations give the same invariant.
- The twist is n−1, matching the last Z/2 character.

**Planet:** Higher Pfister invariant.

### Q2.3/invariant-naturality — Naturality of the higher invariant

**Theorem.** For every field embedding F→E and quadratic n-fold Pfister form ρ, n≥1, res_E/F(e_n(ρ))=e_n(ρ_E), in the correctly twisted groups H_q^n.

**Prerequisites:** `Q2.3/pfister-invariant`, `Q2.0/scalar-extension`, `Q2.3/cohomology-coefficients`, `Q2.3/odd-graded-comparison`, `Q2.3/kato-graded-comparison`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §16, invariant construction and Fact16.2, pp.67–68; Dittmann–Pop §3 p.6.

**Construction / proof route.**

- Witt class, its filtration quotient and both comparison maps commute with field restriction. Compose their naturality squares.
- In characteristic two use the field map on logarithmic differentials and the étale H¹ restriction; in odd characteristic use the Galois cup-product restriction.

**Acceptance.**

- Composition of two field embeddings gives the same square.
- This includes inseparable characteristic-two embeddings.

### Q2.3/invariant-zero — The invariant-zero isotropy criterion

**Theorem.** For a quadratic n-fold Pfister form ρ, n≥1, e_n(ρ)=0 iff ρ is isotropic iff ρ is hyperbolic. This holds over every field in the H_q convention.

**Prerequisites:** `Q2.3/pfister-invariant`, `Q2.1/pfister-hyperbolicity`, `Q2.2/arason-pfister`, `Q2.0/quadratic-filtration`, `Q2.3/odd-graded-comparison`, `Q2.3/kato-graded-comparison`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §16, Fact16.2, p.68; §23, Theorem23.7, p.100; Dittmann–Pop §3 p.6.

**Construction / proof route.**

- Zero invariant places [ρ] in I_q^(n+1). If ρ were anisotropic, the Hauptsatz would give dimρ≥2^(n+1), contradicting dimρ=2^n.
- Conversely isotropy gives hyperbolicity and zero Witt class, so the invariant vanishes.

**Acceptance.**

- No claim that an arbitrary Witt-class invariant vanishes exactly on isotropic forms.
- The dimension argument uses n+1, rather than reapplying the bound at n.

**Planet:** Pfister invariant-zero criterion.

### Worked example — Weight and last character

For a one-fold characteristic-two form [1,a], e₁ is the Artin–Schreier class of a in F/(x²+x). Over F₂, a=1 is nonzero; over F₄ it becomes zero and the form splits. For length two the class is a₀ dlog(a₁) in the H¹ differential quotient. Ordinary étale μ₂(F) is trivial in characteristic two and would incorrectly kill the F₂ one-fold example.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations and named proof-input gaps are resolved.

## Q2.4 — Non-dyadic henselian unit and value criteria

**Direct layer inputs:** `Q2.1`, `Q2.0`, `LogicAndDefinabilityInNumberTheory:LD.1`.

### Q2.4/unit-reduction — Unit Pfister reduction over henselian fields

**Theorem.** Let w be a henselian valuation of arbitrary rank on F with residue field κ and (char F,char κ)≠(0,2). Let ε be the unit slots of a quadratic Pfister form. Then q_ε is isotropic over F iff q_ε̄ is isotropic over κ. Equal characteristic two is included.

**Prerequisites:** `Q2.1/quadratic-pfister`, `Q2.0/scalar-extension`, `LogicAndDefinabilityInNumberTheory:LD.1`, `Q2.0/binary`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2, beginning of proof and assertion (*), pp.6–7.

**Construction / proof route.**

- The integral Pfister polynomial has nonsingular polar form modulo the maximal ideal in precisely the stated characteristic profiles. A nonzero residual zero has a nonzero polar partial derivative; a multivariable simple-root Hensel argument lifts it.
- For the converse, divide an isotropic vector by a coordinate of minimum value among its finitely many coordinates. Its primitive reduction remains nonzero and isotropic.

**Acceptance.**

- No rank-one, completeness, finite generation or finite residue field assumption.
- Mixed characteristic (0,2) is excluded; equicharacteristic (2,2) is allowed.

**Planet:** Henselian unit reduction.

### Q2.4/principal-unit — The principal-unit isotropy criterion

**Theorem.** Under the unit-reduction hypotheses, if ε₁−1 has positive valuation then the two-fold q_(ε₁,ε₀) is isotropic, and every Pfister tensor containing it is isotropic. Require at least two slots.

**Prerequisites:** `Q2.4/unit-reduction`, `Q2.1/pfister-hyperbolicity`, `Q2.1/quadratic-pfister`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(1), pp.6–7.

**Construction / proof route.**

- The first outer slot reduces to 1, so the residual factor ⟨1,−1⟩_b is metabolic and its quadratic tensor is hyperbolic.
- Lift residue isotropy using unit reduction, and extend the isotropic vector through the remaining outer factors.

**Acceptance.**

- In characteristic two the residual bilinear factor ⟨1,1⟩_b is metabolic.
- No assertion is made for a one-fold form with only a terminal principal unit.

**Planet:** Principal-unit isotropy.

### Q2.4/independent-values — Independent-value Pfister anisotropy

**Theorem.** Under the unit-reduction hypotheses let π₁,…,π_s∈F× have F₂-linearly independent images w(π_i) in Γ/2Γ. Then q_ε̄ over κ, q_ε over F, and q_(π,ε) over F are isotropic simultaneously. The empty π-list is allowed.

**Prerequisites:** `Q2.4/unit-reduction`, `Q2.1/quadratic-pfister`, `Q2.0/scalar-extension`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(2), pp.6–7.

**Construction / proof route.**

- For anisotropic residual q_ε̄, every nonzero block vector x has w(q_ε(x))=2 min_j w(x_j), by normalizing to a primitive vector.
- Expand the outer tensor as the orthogonal sum over subsets χ with coefficients (−1)^|χ| π^χ. The nonzero block values belong to pairwise distinct cosets modulo 2Γ, hence attain a unique minimum and cannot cancel.
- The reverse implication follows by inserting an isotropic vector into one block, together with unit reduction. The printed omission of signs is recorded in sourceIssues.

**Acceptance.**

- The argument uses only finitely many blocks and works for any ordered value group.
- Independence is in Γ/2Γ, not Γ⊗Q.

**Planet:** Independent-value criterion.

### Worked example — Distinct valuation cosets

Take F=F₂((t)) with its t-adic valuation and residual [1,1]. For a nonzero vector x, w([1,1](x))=2 min(w(x₀),w(x₁)), an even integer, because the primitive residual value is nonzero. In [1,1] ⊥ t[1,1] the nonzero block values have opposite parity and cannot cancel. This yields an anisotropic two-fold form; it does not assert isotropy from the presence of any positive-valued slot.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations are resolved.

## Q2.5 — C_i fields and finite Kronecker dimension

**Direct layer inputs:** `SchemeAndStackFoundations:SF.0`, `LogicAndDefinabilityInNumberTheory:LD.1`, `Q2.4`, `Q2.1`.

### Q2.5/ci — C_i fields

**Definition.** For i≥0, a field F is C_i if every homogeneous polynomial of positive degree d in N>d^i variables has a nonzero zero over F. Zero polynomials count as homogeneous; degree zero is excluded. This is a property of actual polynomial evaluation, not a packaged existence assumption for quadratic forms only.

**Prerequisites:** `mathlib:MvPolynomial.IsHomogeneous`, `mathlib:MvPolynomial.eval`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §97, definition and examples, p.385.

**Construction / proof route.**

- Use the existing multivariate polynomial carrier and homogeneous predicate with the strict numerical bound.
- Monotonicity C_i⇒C_j for i≤j follows from d≥1. Characterize C_0 by algebraic closedness using homogenized one-variable equations in one direction; in the other, restrict a homogeneous form in at least two variables to a coordinate plane and use a root of the resulting binary form over the algebraically closed field.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `IsCi` (constructor): The displayed homogeneous-zero predicate.
- `IsCi.mono` (structure): C_i implies C_j when i≤j.
- `IsCi.zero_iff` (characterisation): C_0 iff algebraically closed.
- `IsCi.quadratic_zero` (other): Every homogeneous quadratic polynomial in >2^i variables has a nontrivial zero over a C_i field.

**Uses.**

- Dittmann–Pop Proposition3.2(3): Positive-residue-characteristic dimension bounds force isotropy.
- PAPER-BENOIST-19/25–26: Shared C_i/Tsen–Lang input; that direction imports this node.

**Check — discriminating unit tests.**

- F₂ is C₁.
- F₂ is not C₀: X²+XY+Y² has no nonzero zero in two variables.
- An algebraically closed field is C₀, and no C₀ assertion is imposed on the one-variable form X^d at the excluded equality N=1.

**Acceptance.**

- The threshold is strict and degree positive.
- This owns the shared input for the real-function-field proposal.

**Planet:** C_i fields.

### Q2.5/finite-fields-ci — Finite fields are C₁

**Theorem.** Every finite field is C₁. For a homogeneous f of positive degree d<N, Chevalley–Warning makes the number of zeros divisible by the characteristic; the origin is a zero, so another zero exists.

**Prerequisites:** `Q2.5/ci`, `mathlib:char_dvd_card_solutions_of_sum_lt`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §97, examples, p.385; pinned Mathlib ChevalleyWarning theorem.

**Construction / proof route.**

- Apply the pinned one-polynomial instance of Chevalley–Warning using the total-degree bound from homogeneity.
- The zero vector is a solution. If it were the only solution, the positive prime characteristic would divide 1, a contradiction.

**Acceptance.**

- Applies to all finite prime-power fields.
- The argument counts solutions, so it gives more than the origin.

**Planet:** Finite-field C₁ theorem.

### Q2.5/ci-systems — The C_i theorem for systems of forms

**Theorem.** If F is C_i and f₁,…,f_r are homogeneous of the same positive degree d in N>r d^i variables, they have a common nonzero zero.

**Prerequisites:** `Q2.5/ci`, `SchemeAndStackFoundations:SF.0`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §97, Lemma97.1 and Theorem97.2, pp.385–386.

**Construction / proof route.**

- If F is not algebraically closed, finite extensions provide anisotropic normic forms of some degree >1; compose them to obtain arbitrarily large degrees.
- Pack copies of the system into a normic form. Iteration gives degrees d_j and variable counts N_j; the strict inequality N>r d^i forces N_j/d_j^i to grow until the C_i hypothesis supplies a zero.
- Choose the first such zero. Anisotropy of the outer normic form forces the desired common zero. For algebraically closed F use the projective dimension theorem, and handle linear systems by linear algebra.

**Acceptance.**

- The number of equations is part of the strict bound.
- This is not the unjustified claim that one-form C_i immediately handles systems.

### Q2.5/algebraic-ci — Algebraic extension preserves C_i

**Theorem.** If F is C_i then every algebraic extension E/F is C_i, including infinite algebraic extensions.

**Prerequisites:** `Q2.5/ci`, `Q2.5/ci-systems`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §97, Corollary97.5, p.386.

**Construction / proof route.**

- The finitely many coefficients descend to a finite extension E₀/F of degree r. Expand every variable in an F-basis of E₀.
- A degree-d equation in N variables becomes r degree-d equations in rN variables. Apply the system theorem, since rN>r d^i. The coordinate basis takes a nonzero coordinate solution to a nonzero E₀-vector.
- Include E₀ into E.

**Acceptance.**

- No finite-generation assumption on E itself.
- An algebraic extension does not increase the C_i index.

### Q2.5/transcendental-ci — The Tsen–Lang C_i bound

**Theorem.** If F is C_i and E/F has finite transcendence degree t, then E is C_(i+t). In particular a field of characteristic p>0 and finite absolute transcendence degree t is C_(t+1), and a finite-transcendence-degree extension of an algebraically closed field is C_t.

**Prerequisites:** `Q2.5/ci`, `Q2.5/ci-systems`, `Q2.5/algebraic-ci`, `Q2.5/finite-fields-ci`.

**Source:** Richard Elman, Nikita Karpenko and Alexander Merkurjev, §97, Corollary97.6 and Theorem97.7, p.386.

**Construction / proof route.**

- For F(t), clear coefficient denominators and substitute degree-m polynomial vectors. The coefficient equations have degree d and at most dm+c+1 equations in N(m+1) variables.
- For N>d^(i+1), choose m large enough that N(m+1)>(dm+c+1)d^i. The system theorem gives a nonzero polynomial-vector solution.
- Iterate a finite transcendence basis and apply algebraic-extension preservation to the remaining algebraic extension. For characteristic p start with F_p, a C₁ field.

**Acceptance.**

- The arbitrary algebraic tail is justified by coefficient descent.
- The real-function-field route imports the C_t conclusion and must separately connect C₁ to its Brauer-theoretic reduced norm input.

**Planet:** Tsen–Lang theorem.

### Q2.5/kronecker-dimension — Finite Kronecker dimension and valuation drop

**Definition.** For a field of finite absolute transcendence degree t, define δ(F)=t in positive characteristic and δ(F)=t+1 in characteristic zero. Prove δ(κ(w))<δ(F) for every nontrivial valuation w of such F. The relative algebraic closure of the prime field is called the constant field and has δ 0 or 1, respectively.

**Prerequisites:** `mathlib:Algebra.trdeg`, `LogicAndDefinabilityInNumberTheory:LD.1`.

**Source:** Philip Dittmann and Florian Pop, §1, dimension convention, p.1; Proposition3.2(3), proof on p.7.

**Construction / proof route.**

- For w trivial on the prime field lift a residue transcendence basis and adjoin an element with nonzero value. A polynomial relation is impossible by taking a term with unique smallest value; hence trdegκ+1≤trdegF.
- If the residue characteristic changes from 0 to p, normalize integer coefficients by their smallest p-adic value. Reduction proves that lifted residue-independent elements are algebraically independent over Q, so trdegκ≤trdegF; the extra +1 in δ(F) gives strictness.
- Algebraic extensions of the prime field and their valuations account for the constant subfield; no finite generation is assumed.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `kroneckerDimension` (constructor): δ(F) for finite absolute transcendence degree, with the characteristic-zero shift.
- `kroneckerDimension_alg` (compatibility): Algebraic field extensions preserve δ.
- `constantField` (data): Relative algebraic closure of the prime field in F.
- `kroneckerDimension_residue_lt` (characterisation): For a nontrivial valuation, δ(residue)<δ(field).

**Uses.**

- Dittmann–Pop Proposition3.2(3): Supplies the strict numerical inequality for residual C_i and local cohomological bounds.
- Q2.6: Defines the constant field and the finite-generation dimensions in descent.

**Check — discriminating unit tests.**

- δ(F_p(t))=1 whereas δ(Q(t))=2. The constant fields of F_p(t) and Q(t) are F_p and Q, respectively.
- An algebraic extension of Q still has δ=1.
- The trivial valuation has the same residue field and does not satisfy strict dimension drop.

**Acceptance.**

- δ(F_p)=0 and δ(Q)=1.
- An arbitrary valuation is allowed; no discrete-rank reduction.

**Planet:** Kronecker dimension.

### Q2.5/positive-residue-isotropy — Dimension isotropy in positive residue characteristic

**Application.** Let F have finite δ(F)=r and a nontrivial non-dyadic henselian valuation with residue characteristic p>0. Any unit quadratic Pfister form of length r+1 is isotropic over F.

**Prerequisites:** `Q2.5/kronecker-dimension`, `Q2.5/transcendental-ci`, `Q2.4/unit-reduction`, `Q2.1/quadratic-pfister`, `Q2.5/ci`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(3), Case1, p.7.

**Construction / proof route.**

- Write e=δ(κ)<r. The residue field is C_(e+1), by the positive-characteristic Tsen–Lang bound.
- The residual form has 2^(r+1)>2^(e+1) variables, so it has a nonzero zero. Lift by unit reduction.

**Acceptance.**

- No condition involving real closures is needed in this case.
- Includes equal characteristic two; mixed (0,2) remains excluded.

### Worked example — Strict C_i bound

F_p(t) is C₂, with δ=1. Its t-adic residue F_p is C₁. A length-two unit Pfister form reduces to a four-variable quadratic polynomial over F_p; 4>2¹ forces a nonzero residual zero and unit reduction lifts it. The one-variable polynomial X^d has no nonzero zero and lies at N=d⁰=1, exactly the excluded equality in C₀.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations are resolved.

## Q2.6 — Coefficient fields and finite descent at real places

**Direct layer inputs:** `LogicAndDefinabilityInNumberTheory:LD.1`, `Q2.5`, `Q2.0`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `SchemeAndStackFoundations:SF.2`, `Q2.3`, `Q2.4`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6`.

### Q2.6/coefficient-field — Equicharacteristic-zero coefficient fields

**Construction.** For a henselian valued F with char F=char κ=0, construct a subfield E⊂O_w whose reduction E→κ is an isomorphism. E is relatively algebraically closed in F and contains the constant field k. If ε_i are units, lift their residues to η_i∈E×. Then ε_i/η_i are squares in F and the odd-characteristic Pfister forms q_ε and q_η are isometric.

**Prerequisites:** `LogicAndDefinabilityInNumberTheory:LD.1`, `Q2.5/kronecker-dimension`, `Q2.0/scalar-extension`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(3), Case2, p.7.

**Construction / proof route.**

- Lift a transcendence basis of κ/Q to O_w; the induced rational-function subfield reduces injectively. Extend the section across the separable algebraic residue extension by Hensel lifting (or a maximal partial-section argument).
- An element algebraic over E has value zero; its residual root lies in E and the separable simple-root uniqueness shows the element already belongs to E. Thus E is relatively closed and contains all constants.
- Each ε_i/η_i reduces to 1. Apply Hensel to X²−ε_i/η_i, whose derivative 2 is a unit, and rescale the corresponding Pfister coordinates.

**API.** Names have the prefix `TauCeti.QuadraticFormInvariantsPartII` unless an existing declaration is written in full.

- `coefficientField` (constructor): A subfield E⊂O_w with reduction isomorphism E≅κ.
- `coefficientField_relativelyClosed` (characterisation): Every element of F algebraic over E lies in E.
- `coefficientField_containsConstants` (compatibility): k⊂E for the constant field k of F.
- `unitPfister_coefficient_isometry` (equivalence): Lifted residue units give q_ε≅q_η over F.

**Uses.**

- Dittmann–Pop Proposition3.2(3): Moves the unit Pfister form to a field of smaller Kronecker dimension.
- Q2.6/real-place-descent: Identifies residue composita with coefficient-field composita at real places.

**Check — discriminating unit tests.**

- For Q((t)) with its t-adic valuation one may take E=Q.
- For Q₂ with residue F₂ this construction is excluded; Q₂ has no coefficient field mapping isomorphically to F₂.
- For ε=1+t in Q((t)), its lift is 1 and ε/1 is a square, while a general unit need not itself be a square.

**Acceptance.**

- The coefficient field is a chosen section, not a canonical subfield.
- The square-lifting step requires residue characteristic zero.

**Planet:** Coefficient fields.

### Q2.6/local-function-field-cd — Cohomological bounds after a nonreal local base change

**Theorem.** Let k′ be a number field and E′/k′ finitely generated of transcendence degree t with k′ relatively algebraically closed. At a finite place v let k′_v be its algebraic henselization; at a complex place use an algebraic closure. Then cd₂(E′k′_v)≤t+2 at finite places and ≤t at complex places. Thus H_q^m(E′k′_v)=0 for m>t+2. This does not assert cd₂(E′)<∞ if E′ has orderings.

**Prerequisites:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `SchemeAndStackFoundations:SF.2`, `Q2.3/cohomology-coefficients`, `Q2.5/kronecker-dimension`, `LogicAndDefinabilityInNumberTheory:LD.1`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(3), Claim, p.7, corrected nonreal-place argument.

**Construction / proof route.**

- Import the local-field cd₂≤2 result and the comparison for an algebraic henselization with its completion; the complex algebraic closure has cd₂=0.
- For a characteristic-zero field K and finitely generated L/K of transcendence degree t, the absolute-Galois exact sequence and Hochschild–Serre give cd₂(L)≤cd₂(K)+t from the geometric bound cd₂(L K̄)≤t. Request the precise geometric-cohomology input from SF.2.
- Apply this to the local base field. The printed intermediary cd₂(E′) bound is invalid for formally real E′, as recorded in sourceIssues.

**Acceptance.**

- For t=0 the finite-place bound is 2.
- Finite-place algebraic henselization is distinguished from its analytic completion.

**Planet:** Local cohomological bound.

### Q2.6/real-place-descent — Finite descent of the real-place condition

**Theorem.** Let F,w be equicharacteristic-zero henselian of finite δ(F)=r, w nontrivial, with constants k and coefficient field E. Let q_η be a length r+1 Pfister form over E obtained from unit residues. If q_η is isotropic over Fk_v for every real closure k_v of k, there exists a finitely generated E′⊂E containing η such that, for k′=E′∩k, its invariant vanishes over E′k′_v for every place v of the number field k′.

**Prerequisites:** `Q2.6/coefficient-field`, `Q2.5/kronecker-dimension`, `Q2.6/local-function-field-cd`, `Q2.3/pfister-invariant`, `Q2.3/invariant-naturality`, `Q2.3/invariant-zero`, `Q2.4/unit-reduction`, `Q2.3/cohomology-coefficients`, `SchemeAndStackFoundations:SF.2`, `LogicAndDefinabilityInNumberTheory:LD.1`, `mathlib:nonempty_sections_of_finite_inverse_system`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(3), Claim and its proof, pp.7–8.

**Construction / proof route.**

- Index by finitely generated subfields E′ containing η. Nonreal places contribute zero by the local cohomological bound since δ(E′)≤δ(E)<r.
- For each E′ let Σ_E′ be the finite set of real places of k′ where the invariant is nonzero. If E′⊂E″, restriction of a bad real place of k″ is a bad place of k′, since the corresponding classes restrict compatibly; this defines Σ_E″→Σ_E′. If all sets were nonempty, the finite inverse-system theorem gives a coherent real ordering of the union k.
- Extend w to Fk_v. The residue field is κk_v and Ek_v is a coefficient field. Unit reduction and the assumed isotropy over Fk_v give zero invariant over Ek_v.
- Along that coherent real place the fields E′k′_v form a directed union Ek_v and the invariant classes are compatible. Étale cohomological continuity says their zero image over Ek_v is zero at some later finite stage. That stage still lies in its bad-place set, a contradiction. Thus some Σ_E′ is empty, and the nonreal bounds handle all remaining places.

**Acceptance.**

- The inverse-limit objects are finite sets of bad places, not Harrison spaces of all orderings.
- The composita and real closures are chosen compatibly; changing the choices transports the statement by field isomorphisms.

**Planet:** Real-place finite descent.

### Q2.6/dimension-unit-isotropy — The finite-dimensional unit Pfister theorem

**Theorem.** Let F have finite δ(F)=r and let w be nontrivial non-dyadic henselian, with no finite-generation hypothesis on F. Let ε be r+1 unit slots. If q_ε is isotropic over Fk_v for every real closure k_v of the constant field k, then q_ε is isotropic over F. The hypothesis is vacuous when k has no ordering.

**Prerequisites:** `Q2.5/positive-residue-isotropy`, `Q2.6/coefficient-field`, `Q2.6/real-place-descent`, `Q2.5/kronecker-dimension`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.6`, `Q2.3/pfister-invariant`, `Q2.3/invariant-naturality`, `Q2.3/invariant-zero`, `Q2.0/scalar-extension`.

**Source:** Philip Dittmann and Florian Pop, Proposition3.2(3), pp.6–8, including final paragraph of proof.

**Construction / proof route.**

- Positive residue characteristic is already proved in Q2.5. In residue characteristic zero replace q_ε by the coefficient-field form q_η and choose E′ by finite real-place descent.
- Choose a finite transcendence basis of F/E′ and put F′=E′(T)⊂F. Then F′ is finitely generated, δ(F′)=r, and its algebraic constant field k′ is a number field. The local vanishing over E′k′_v implies local vanishing over F′k′_v.
- Apply the precisely requested Jannsen local–global injectivity in H^(r+1)(F′,Z/2(r)), not an unconditional arbitrary-characteristic Hasse principle. The invariant is zero over F′, so the invariant-zero criterion and extension to F prove isotropy.

**Acceptance.**

- The use of the Hasse principle occurs only in characteristic zero.
- The theorem includes arbitrary algebraic and non-finitely-generated extensions of finite-transcendence-degree fields.

**Planet:** Dimension-unit isotropy.

### Worked example — Dimension in the nonreal local bound

If δ(F)=r and w has residue characteristic zero, its coefficient field E has δ(E)≤r−1. For a finitely generated E′/k′ inside E, put t=trdeg_(k′)E′. Then t≤r−2 and at a finite place cd₂(E′k′_v)≤t+2≤r. Hence degree r+1 cohomology vanishes. A real E′ itself can have infinite cd₂; the proof bounds the local compositum and uses the real-place hypothesis only on real closures.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations and named proof-input gaps are resolved.

## Q2.7 — Patch-open henselization loci

**Direct layer inputs:** `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`, `LogicAndDefinabilityInNumberTheory:LD.1`, `Q2.0`.

### Q2.7/henselian-embedding-open — Patch openness of henselization embedding loci

**Theorem.** On Val_F=Spv(F), using the imported patch topology on valuation equivalence classes, let F_w^h denote a henselization. For every finite E/F, the locus of w admitting an F-embedding E→F_w^h is patch open. This is independent of the chosen henselization; a nonempty locus implies E/F separable.

**Prerequisites:** `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`, `LogicAndDefinabilityInNumberTheory:LD.1`.

**Source:** Philip Dittmann and Florian Pop, Lemma3.9(1), p.11; topology conventions preceding the lemma, p.10.

**Construction / proof route.**

- A finite extension inside a henselization has an integral primitive presentation with derivative a unit, using the étale description of henselization. This is a special generator, not an arbitrary primitive element.
- At such w approximate its residue by x∈F; immediate residue extension suffices. For its monic minimal polynomial p impose v(a_i)≥0, v(p(x))>0 and v(p′(x))=0. These are finitely many patch clopen conditions from Spv(F).
- Every valuation in this neighborhood has a simple Hensel root of p, giving the required embedding. Union over witnesses proves openness. An inseparable E has the empty locus.

**Acceptance.**

- Use the existing valuation-spectrum quotient and topology.
- Only openness is asserted for the full union; individual witness neighborhoods are clopen.

**Planet:** Henselian embedding loci.

### Q2.7/henselian-isotropy-open — Patch openness of henselian isotropy

**Theorem.** For every quadratic form q over F, the set {w∈Val_F : q becomes isotropic over F_w^h} is patch open. No nonsingularity, Pfister, characteristic or rank assumption is required.

**Prerequisites:** `Q2.7/henselian-embedding-open`, `Q2.0/scalar-extension`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`, `mathlib:QuadraticMap.Anisotropic`.

**Source:** Philip Dittmann and Florian Pop, Lemma3.9(2), p.11.

**Construction / proof route.**

- An isotropic vector over an algebraic henselization has finitely many coordinates and descends to a finite subextension E/F.
- The entire embedding locus for E is an open neighborhood on which that vector transports to each henselization. Take the union over such finite witnesses.

**Acceptance.**

- A one-dimensional anisotropic form may have the empty locus.
- An already isotropic form has the whole valuation spectrum as its locus.

**Planet:** Henselian isotropy locus.

### Worked example — A clopen witness for embedding

For F=Q at the 7-adic valuation, p(T)=T²−2 and x=3 satisfy w(p(x))>0 and w(p′(x))=0; p is monic with integral coefficients. The finite intersection imposing these three kinds of conditions is a patch clopen neighborhood. Every valuation in it has a Hensel root of p and admits Q(√2). For the trivial valuation on Q the same extension cannot embed into its henselization Q, showing that the embedding locus need not be the whole valuation spectrum.

**Layer completion Check:** every target above must have its displayed API and acceptance assertions, and each direct supplier contract must be discharged. Coverage remains planned until its transitive supplier obligations are resolved.

## Complete route assignment and proposed real-function-field layers

Every one of the 30 input items is assigned below. The shared C_i items have this roadmap as owner and are imported by the real-function-field proposal. The remaining real-field items form RF.0–RF.4; those labels describe a proposal, not stages already created in the atlas.

| Routed item | Owner | Target / disposition |
| --- | --- | --- |
| PAPER-DITTMANN-POP-23/pfister-two | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.1/quadratic-pfister (planned) |
| PAPER-DITTMANN-POP-23/pfister-hyperbolic | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.1/pfister-hyperbolicity (planned) |
| PAPER-DITTMANN-POP-23/pfister-invariant | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.3/pfister-invariant (planned) |
| PAPER-DITTMANN-POP-23/pfister-invariant-zero | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.3/invariant-zero (planned) |
| PAPER-DITTMANN-POP-23/pfister-invariant-natural | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.3/invariant-naturality (planned) |
| PAPER-DITTMANN-POP-23/unit-reduction-isotropy | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.4/unit-reduction (planned) |
| PAPER-DITTMANN-POP-23/principal-unit-isotropy | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.4/principal-unit (planned) |
| PAPER-DITTMANN-POP-23/independent-values-isotropy | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.4/independent-values (planned) |
| PAPER-DITTMANN-POP-23/finite-characteristic-c-field | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.5/transcendental-ci (planned) |
| PAPER-DITTMANN-POP-23/real-place-finite-descent | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.6/real-place-descent (planned) |
| PAPER-DITTMANN-POP-23/dimension-unit-isotropy | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.6/dimension-unit-isotropy (planned) |
| PAPER-DITTMANN-POP-23/henselian-isotropy-open | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.7/henselian-isotropy-open (planned) |
| PAPER-DITTMANN-POP-23/pfister-roundness | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.1/all-length-roundness (planned) |
| PAPER-DITTMANN-POP-23/arason-pfister-bound | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.2/arason-pfister (planned) |
| PAPER-DITTMANN-POP-23/graded-witt-invariant | QuadraticFormInvariantsPartII | QuadraticFormInvariantsPartII:Q2.3/kato-graded-comparison (planned) |
| PAPER-BENOIST-19/14 | QuadraticFormsRealFunctionFields | RF.1: Elman–Lam u invariant (zero signatures at all orderings). (proposed-split) |
| PAPER-BENOIST-19/25 | QuadraticFormInvariantsPartII | Import Q2.5/ci here. (shared-import) |
| PAPER-BENOIST-19/26 | QuadraticFormInvariantsPartII | Import Q2.5/transcendental-ci; RF.2 proves the reduced-norm C₁→Br=0 adapter. (shared-import) |
| PAPER-BENOIST-19/94 | QuadraticFormsRealFunctionFields | RF.3: Pfister Proposition9 Brauer/index-two criterion in transcendence degree two. (proposed-split) |
| PAPER-BENOIST-19/95 | QuadraticFormsRealFunctionFields | RF.1: finite descent through Harrison compactness. (proposed-split) |
| PAPER-BENOIST-19/141 | QuadraticFormsRealFunctionFields | RF.2: Witt real-curve local–global input over R, allowing ramification; compare the arbitrary-real-closed-base BW curve theorem. (proposed-split) |
| PAPER-BENOIST-19/142 | QuadraticFormsRealFunctionFields | RF.2: Springer complete-DVR anisotropy, residue characteristic ≠2. (proposed-split) |
| PAPER-BENOIST-19/143 | QuadraticFormsRealFunctionFields | RF.2: Amer–Brumer common-zero theorem, characteristic ≠2. (proposed-split) |
| PAPER-BENOIST-19/186 | QuadraticFormsRealFunctionFields | RF.4: Lang C_i conjecture recorded as a conjecture, never a theorem dependency. (proposed-split) |
| PAPER-BENOIST-19/187 | QuadraticFormsRealFunctionFields | RF.4: Pfister u conjecture recorded as a conjecture, never a theorem dependency. (proposed-split) |
| PAPER-BENOIST-19/191 | QuadraticFormsRealFunctionFields | RF.0: realClosureAt adapter imports current upstream RealAlgebraicGeometry Layer1 real-closure existence at a chosen ordering. (proposed-split) |
| PAPER-BENOIST-19/192 | QuadraticFormsRealFunctionFields | RF.1: Harrison topology and closed Brauer nonvanishing locus. (proposed-split) |
| PAPER-BENOIST-WITTENBERG-20/level-omega | QuadraticFormsRealFunctionFields | RF.3: level<2^n iff mod-two ω^n vanishes at the generic point iff the integral 2-adic ω^n class has coniveau≥1, with the smooth-integral real-closed-base hypotheses and supplied étale comparison. Locator: Benoist17 §3B, Proposition3.3, pp.939–940 (cited by BW20 Example2.5); n≥1. (proposed-split) |
| PAPER-BENOIST-WITTENBERG-20/quadric-level | QuadraticFormsRealFunctionFields | RF.3: for an anisotropic projective n-dimensional quadric over a real closed field, −1 is a sum of seven squares in its function field iff n≤6. (proposed-split) |
| PAPER-BENOIST-WITTENBERG-20/witt-curve | QuadraticFormsRealFunctionFields | RF.2: for a smooth proper geometrically integral curve B over any real closed field with B(R)=∅, −1 is a sum of two squares in R(B), equivalently the Hamilton class dies in Br(B). Compare with Benoist19/141 without narrowing the base. (proposed-split) |

Keep Q2.0–Q2.7 in QuadraticFormInvariantsPartII. Create QuadraticFormsRealFunctionFields with RF.0 ordering/real-closure adapters importing upstream RealAlgebraicGeometry Layer1, RF.1 Harrison spaces and the zero-signature u invariant, RF.2 Tsen/Brauer and real-curve/DVR/common-zero inputs, RF.3 the exact Pfister criterion and level/cohomology/quadric applications, and RF.4 conjectural-bound statements. Import this roadmap’s Q2.1–Q2.3 and shared Q2.5 C_i/Tsen–Lang; import the parent quaternion, Witt, signature and Brauer/H² layers. RF.4 conjectures are never used as proved dependencies. RealSurfacePeriodIndex consumes RF.3 and owns Benoist0.10/0.12 and their sharp/application examples; this foundation never imports RealSurfacePeriodIndex. The maintainer decides the proposal; no second roadmap file is created in this job.

The real-curve statements keep their different hypotheses: the Benoist route uses a Witt input over R and can involve ramified quadratic extensions; Benoist–Wittenberg’s curve lemma works over any real closed base and requires a smooth proper geometrically integral curve with no real points. The proposed design must prove the exact comparisons rather than identify these statements by name. The Elman–Lam invariant in RF.1 uses anisotropic forms with all signatures zero in characteristic zero. RF.4 records Lang/Pfister conjectures as conjectures and exports no theorem depending on them.

## Source corrections used by the plan

These findings are inherited from the Dittmann–Pop extraction and checked against arXiv v2, SHA-256 `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`. The Annals landing page was checked; the published PDF was not obtained, and no journal/preprint collation is claimed. No published corrigendum was located by the searches recorded in the packet.

**E1 — §3 definition of characteristic-two Pfister forms, p.6 (arXiv v2 only; journal text not collated).** The same two-angle outer notation as quadratic factors is used before the characteristic-two terminal factor. Interpret the outer factors as symmetric bilinear ⟨1,−a_i⟩_b and tensor them with [1,a₀]; this removes the ambiguity. A diagonal quadratic factor in characteristic two has zero polar form and cannot yield the asserted nonsingular quadratic tensor. EKM §9 explicitly distinguishes bilinear outer factors.

**E2 — Proposition3.2(3), Case2, Claim, p.7 (arXiv v2 only; journal text not collated).** The proof bounds cd₂(E′k′_v) through cd₂(E′)≤δ(E′)+1 at nonreal v. Bound the local compositum directly by trdeg_(k′)E′+cd₂(k′_v)≤trdeg_(k′)E′+2. A formally real E′ has cd₂(E′)=∞. The finite-place henselian local base has cd₂=2, and the complex base has cd₂=0; the corrected argument proves the required bound without the false intermediary.

**E3 — Proposition3.2(2), tensor expansion in the proof, p.7 (arXiv v2 only; journal text not collated).** The coefficients of the subset-indexed block sum are written as π^χ. In odd characteristic the coefficient is (−1)^|χ|π^χ with the paper’s ⟨1,−π⟩ convention. Already one outer factor gives q⊥−πq. The missing signs have valuation zero, so the distinct-value proof is unchanged.

**E4 — Lemma3.9(2), final neighborhood sentence, p.11 (arXiv v2 only; journal text not collated).** The neighborhood is attached to the quadratic form in the sentence proving openness of a valuation locus. It is a neighborhood of the chosen valuation w. The ambient topology is Val_F; the quadratic form is fixed and is not a point of that space.

## Independent review and remaining work

The independent review verified all 47 target statements at their cited locators or corrected them in place, re-read all 14 baseline declarations at the pins, and checked the current upstream/library boundary. All four source findings above are independently confirmed for arXiv v2. The completed review accepts this planning pass; it does not close its two proof-input audits or 18 supplier contracts. The proposed real-function-field split still needs the maintainer’s decision. All 47 nodes remain unchecked implementation targets. See [the review report](../reviews/REV-DESIGN-QuadraticFormInvariantsPartII.md) for the correction inventory and checks.
