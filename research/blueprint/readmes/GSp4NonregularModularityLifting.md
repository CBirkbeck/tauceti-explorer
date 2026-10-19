# Roadmap: minimal modularity lifting for GSp₄ in nonregular weight

**Summary.** Build ordinary symplectic modularity lifting in the singular Siegel weights (a,2). Start with integral cuspidal coherent sections, interpolate Galois systems through regular weights, prove the two Fourier-doubling injections and Klingen Taylor–Wiles comparison, and assemble the selected balanced patching module. The resulting minimal R=T theorem is conditional on precisely identified proof gates. A separate ordinary-family branch gives p-adic modularity, and the characteristic-zero higher-Hida branch combines local freeness, automorphic nonvanishing and four-chamber multiplicity one to obtain classical weight-two modularity under its stated gates.

## Scope and ownership

This roadmap owns the genus-two *application*: its residual data and levels, selected Hecke actions, singular-weight Galois specialization, cuspidal doubling, level comparison, the selected-balance requirement, and the three lifting endpoints. It does not reconstruct general deformation, Hida, coherent-complex, local Langlands or Hecke-determinant theories. Those are consumed through the exact contracts below.

The current TauCetiRoadmap IntegralHeckeAndGaloisDeterminants already owns general coefficient descent, prescribed-multiplier reconstruction, Hecke image algebras, local factors, factorial projectors, spin/dual-spin normalization and compatible determinants. Its current Layers 3a and 3b refine the atlas's older IHG.3 interface. In particular its odd-prime symplectic descent theorem does not supply the dyadic case; the GSp₄ descent valid at p=2 is BCGP25 Lemma 7.4.8, planned here as a target of Layer NR10. The current SmoothRepresentationsOfLocalGroups roadmap supplies induction/Jacquet and Satake conventions. The current library and the additional upstream roadmaps missing from the atlas snapshot supply no singular Siegel lifting theorem; their general material is not planned again.

The amended Pilloni-2020 route assigns the integral boundary/Arthur/dimension-equality group to the proposed IntegralCoherentHeckeComplexes roadmap. Thus the full/interior comparison, localized boundary vanishing, Arthur exclusions, general-type cuspidality and dim H¹=dim H⁰ are supplier results, not targets re-created here. The proposed SiegelModularFormsModPn owns the integral Hasse, secondary-Hasse, normalized p-action and theta constructions. HigherHidaAndColemanTheory supplies all four higher-Hida/Coleman chambers; no dependency points from it back to this roadmap.

## Conventions

Work over a finite extension E/Qp with ring of integers O, uniformizer ϖ and residue field k, enlarged to contain the stated eigenvalues. Distinguish finite quotients O/ϖᵐ, the divisible coefficient module E/O, and characteristic-zero fibers. X denotes a supplied compatible toroidal compactification and D its boundary; a cuspidal section means a section of the subcanonical bundle ω(μ)(−D). At a finite diamond quotient Δ, XΔ is the supplied intermediate cover. Every anemic localization is at a specified Galois-type maximal ideal; the two p-root conditions are imposed jointly by a product of commuting idempotents.

Use geometric Frobenius and let ε have Hodge–Tate weight −1. The CG representation has full multiplier ε^(1−a) and Hodge–Tate weights 0,0,a−1,a−1. The BCGP25 arithmetic representation has multiplier ε⁻¹ in weight two; the coherent representation associated to its form is the dual-spin normalization ρf=ρπ∨ε⁻³. The determinant determines only the square of the multiplier, so the full central character is always carried separately. Write Ω(k,r)=ω(k+r,r) for Pilloni's notation, and use the corrected infinity parameter λ=(1−k−r,2−r;k+2r). Thus Ω(0,2) means ω(2,2).

The CG branch has p≥5, a=2 or a≥4 and p−1>a; oddness and the multiplier can impose additional parity restrictions. Its a=2 endpoint retains the explicit coherent-H² hypothesis. The p-adic family branch has its own P12 image and well-ramified hypotheses and its own ordered-flag comparison. The BCGP25 branch permits p=2, assumes integral enormousness and uses two torus-diamond directions per auxiliary prime. None of these three sets of assumptions is silently substituted for another.

## Exact supplier contracts

### Existing Mathlib and Tau Ceti used

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The following statements were read at those pins. The compact suggested file uses only light predicates and specializations of these existing carriers; the full geometric targets remain in this document.

- `mathlib:ZMod` (Mathlib/Data/ZMod/Defs.lean): The existing integer-mod-n carrier; prime-field examples use ZMod 11 and ZMod 13.
- `mathlib:Module.End.genEigenspace` (Mathlib/LinearAlgebra/Eigenspace/Basic.lean): For a commutative ring and module, the monotone family of kernels of powers of f−μ; exponent ∞ is their union. No finite-dimensional decomposition is built into the definition.
- `mathlib:Module.End.mem_genEigenspace_nat` (Mathlib/LinearAlgebra/Eigenspace/Basic.lean): At a natural exponent, membership is membership in the kernel of the corresponding power.
- `mathlib:Matrix.symplecticGroup` (Mathlib/LinearAlgebra/SymplecticGroup.lean): Existing multiplier-one matrix group on l⊕l with its standard J; this is not a GSp4 Galois/deformation or Siegel modular-form interface.
- `mathlib:IsIdempotentElem` (Mathlib/Algebra/Group/Idempotent.lean): The actual multiplication equation e·e=e, usable for module endomorphisms.
- `tauceti:TauCeti.ContCohomology.H1` (TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): Existing continuous degree-one cohomology as Z¹/B¹ for a continuously acting topological additive group; no global GSp4 Selmer/deformation computation is claimed.

### Roadmap inputs

**From `ArithmeticGaloisRepresentations:G7`.** Export continuous rank-four symplectic representations, full multiplier/pairing and coefficient-change APIs; separate CG20 Assumption 4.1, P12 H1–H3 and BCGP25 Definition 7.1.1 integral enormousness. Include near adequacy, strong residual oddness, GSp4-reasonable and tidy predicates with their actual definitions. ACC+ residual enormousness does not supply the dyadic integral condition.

**From `ArithmeticGaloisRepresentations:R01.5`.** BCGP25 Propositions 4.11.1–4.11.2 (pp.109–110): let ρ:G_Q→GSp₄(Q̄p) be continuous with Zariski closure of the image containing Sp₄, or absolutely irreducible, reducible on an index-two subgroup and with Zariski closure containing SL₂×SL₂; if a continuous finite-dimensional s:G_Q→GLₙ(Q̄p) satisfies, on a density-one set of unramified primes, that the characteristic polynomial of ρ(Frobℓ) annihilates s(Frobℓ), then s is a direct sum of copies of ρ. The reviewed BCGP25 extraction routes these to R01.1–R01.5; Frobenius-only annihilation is weaker than the Cayley–Hamilton hypothesis of IntegralHeckeAndGaloisDeterminants Layer 1.6.

**From `AutomorphicBundles:B3`.** Provide canonical/subcanonical extensions, the actual boundary divisor and the integral Serre-duality bundle identity needed here. The pending IntegralCoherentHeckeComplexes supplier owns coherent homology, spectral sequences and the localized boundary calculation.

**From `AutomorphicBundles:B4`.** Supply the genus-two Hodge Schur weights and their analytic/classical section comparison, including Ω(k,r)=ω(k+r,r) and central-character conventions.

**From `AutomorphicBundles:B5`.** Export the Hecke-equivariant Fourier expansion principle and integral trace correspondences in genus two. The proposed SiegelModularFormsModPn owner must supply the normalized p-actions, Hasse/secondary-Hasse and theta APIs, not just generic Fourier expansions.

**From `AutomorphicGaloisRepresentationsPartII:AG2.5`.** Export the semisimplified local comparison and the separately proved pure general-type monodromy upgrade in the GSp4 transfer specialization, with every |ν| twist and classification hypothesis. Also export the regular-weight Siegel cusp-form representations used in CG20 Proposition 6.8 (Taylor, Laumon, Weissauer; symplectic by Bellaïche–Chenevier; local–global compatibility at ramified primes by Sorensen, through Mok Theorem 3.5).

**From `AutomorphicGaloisRepresentationsPartII:AG2.6`.** Supply the actual family/geometric crystalline-period theorem underlying Mok Proposition 4.16, including the simple-generic, spherical and four-distinct-inverse-root hypotheses. The singular specialization is owned here; the general period comparison is imported. For regular weight also export crystallinity at spherical p with Frobenius characteristic polynomial Q_p (Mok Theorem 3.5, used in CG20 Proposition 6.8(3)).

**From `AutomorphicLFunctionsAndLocalFactors:AL.4`.** Supply the Satake/Weil–Deligne local-factor comparison. The monodromy upgrade NR2/monodromy also needs holomorphy at s=1 of the local adjoint L-factor of a generic GSp₄ L-packet (Gan–Takeda, main theorem part vii); that is a local Langlands statement recorded with the local paramodular and Klingen gate, and AL.4 by itself does not assert it.

**From `DeformationAndDerivedPatchingAlgebra:P9`.** Supply the amplitude-one defect calculation and support/freeness conclusion actually furnished by balanced patching, preserving torsion and distinguishing whole-module balance from a selected idempotent summand.

**From `DeformationAndDerivedPatchingAlgebra:R03.3`.** Supply the exact regular-local depth/dimension and Auslander–Buchsbaum theorem, finite projective-to-free comparison on localized factors, and the characteristic-zero completed-ring lift criterion with stated coefficient/base hypotheses.

**From `DeformationAndDerivedPatchingAlgebra:R03.5`.** Supply CG20 Proposition 3.3 (balanced module patching, precise Tor defect, numerology, augmentation and faithfulness hypotheses), the P12 defect-zero module specialization, and the corrected BCGP25 §7.2 open-ideal patching theorem with compatible ring action and justified characteristic-zero lift. These are three different applications of the same owner’s abstract machinery.

**From `DeformationAndDerivedPatchingAlgebra:R03.6`.** Export support transport and finite-module freeness on the characteristic-zero component through q, with exact reduced/faithful hypotheses; do not deduce full support from local freeness or global reduced R=T from one component.

**From `EndoscopicTransferAndUnitaryTraceComparison:ET.7`.** BCGP25 Proposition 7.5.3 (p.175), with its hypotheses: (1) a |·|²-self-dual regular algebraic cuspidal GL₄/Q representation is of symplectic type; (2) if F/Q is solvable Galois and CM, ρ|G_F is irreducible and ρ|G_F≅r_{π_F}⊗ε for an RACSDC π_F on GL₄/F, then ρ comes from a regular algebraic cuspidal GSp₄/Q form of central character |·|²; (3) the same descent along a solvable totally real F⁺ from a GSp₄/F⁺ form. The cyclic base-change and descent steps are ET.7a's Arthur–Clozel inputs; part (1) also uses the classification of ML.4. The reviewed BCGP25 extraction routes Proposition 7.5.3 to ET.4–ET.7.

**From `GlobalGaloisDeformations:G7`.** Specialize the existing general functor framework to CG20 Definition 4.6 and BCGP25 §7.1.5, with fixed full multiplier, strict symplectic conjugacy, the ordinary two-plane/flag and the stated tame types. Export representability, exact Selmer numerology/presentation, classifying maps and the integral-enormity cotangent bounds. Do not substitute GLn polarized data for the symplectic datum.

**From `GlobalGaloisDeformations:R04.5`.** Export labelled GSp4 Taylor–Wiles sets from the exact CG20 image hypotheses, with cardinality equal to dual Selmer dimension, depths x≡1 mod pᴺ and compatible universal scalar inertia. Keep the Klingen rank-one diamond choice separate from BCGP25 rank-two torus diamonds.

**From `HigherHidaAndColemanTheory:A0`.** Supply the ordered two-character weight space, central-character normalization and the four genus-two shifted Weyl chambers. Compare its Hodge–Tate weights with BCGP25 Definition 7.5.7.

**From `HigherHidaAndColemanTheory:I3`.** Export ordinary Borel and GL2-parabolic Hida modules, horizontal/derived arithmetic control and dual Iwasawa finiteness for P12, and the four integral higher-Hida modules with the partial central-condition projectivity used by BCGP25 §7.3.

**From `HigherHidaAndColemanTheory:X8`.** Supply all four genus-two ordinary higher-Coleman graded pieces, regular arithmetic control, projectivity compatible with the partial central condition, smooth torus localization and the exact classicality theorem BCGP25 4.12.4: image condition, de Rhamness, equal four graded dimensions n and total dimension 4n. This roadmap consumes these exports; it supplies no prerequisite back to HigherHidaAndColemanTheory.

**From `HodgeTateAndCanonicalSubgroups:T0`.** Supply the Hodge–Tate map and Hecke-compatible sections used in the Pilloni–Stroh interpolation construction; coordinate with the Hodge-type/perfectoid and compactification suppliers for the actual cover and modified integral models. The original Kottwitz-lattice comparison is separate.

**From `IntegralHeckeAndGaloisDeterminants:IHG.1`.** Import the upstream README §§1.2 and 1.5: field and complete-local reconstruction, GL coefficient descent and Carayol's lemma (all p) and prescribed-multiplier symplectic coefficient descent (p>2). The dyadic GSp₄ descent needed by BCGP25 is its Lemma 7.4.8, planned here as NR10/dyadic-descent on top of the all-p GL descent. GSp₄ pseudocharacter reconstruction over Q̄p (BCGP25 Theorem 1.8.17) is not in Layer 1.7, which reconstructs GL only; it is recorded as a gap.

**From `IntegralHeckeAndGaloisDeterminants:IHG.2`.** Import the current upstream README §§2.1–2.3: actual Hecke images, local factors, specified derived idempotent splittings and factorial-power ordinary projectors. Supply the finite quotient/reduction and annihilator comparisons used by the specialized root selectors. These general objects are already upstream plans and are not new nodes here.

**From `IntegralHeckeAndGaloisDeterminants:IHG.3`.** Use current upstream Layer 3a for GSp4 spin/dual-spin polynomials and the full central multiplier, and Layer 3b for Galois-type residual ideals. The atlas stage IHG.3 predates that split; resolve to those current exports when packaging. Retain the full multiplier at trace zero.

**From `IntegralHeckeAndGaloisDeterminants:IHG.4`.** Provide compatible finite-quotient determinants with actual uniform congruence bounds, continuity, reconstruction compatibility and inverse-limit uniqueness. A dense characteristic-zero set without integral congruence witnesses is insufficient.

**From `LocalGaloisDeformationRings:L7`.** Supply the concrete GSp4 local minimal U/P/H conditions, ordinary flags and unramified plane; the pure p-distinguished ordinary semistable weight-two local regularity and dimension theorem used at the characteristic-zero point; inertia rigidity, conductor constancy on the relevant pure component and unique-component comparisons. Include dyadic coefficient and chosen stabilization hypotheses. Resolve P12’s flag-ratio orientation before identifying its two ordinary predicates.

**From `ModularityAndLanglandsExtensions:ML.4`.** Export the exact GSp4 classification/packet/multiplicity input and its analytic status, including the remaining twisted weighted fundamental-lemma gate in the selected source route. The unitary theorem alone does not discharge this input. Register resulting lifting endpoints in ML.1/ML.5, never in ML.0 which is an input of ML.4.

**From `PadicHodgeTheory:R06.2`.** Supply de Rham/crystalline/semistable admissibility with coefficient change, descent and dual/twist operations, and the semisimple Sen-operator consequence used in higher-Coleman classicality.

**From `ShimuraCompactifications:C3`.** Provide compatible fans and extensions of the selected Klingen-level pullback and trace maps, with their composition/scalar formulas and the exact good-prime hypotheses.

**From `ShimuraCompactifications:C5`.** Supply the integral genus-two compactifications and finite covers at these tame levels, their Hodge positivity and the model-specific vanishing/base-change input. A smooth integral model is not silently inferred for arbitrary higher p-level.

**From `SmoothRepresentationsOfLocalGroups:SR.2`.** Import the current upstream normalized parabolic induction/Jacquet conventions and local invariant-vector interfaces. Coordinate the GSp4-specific Klingen and Steinberg calculations with GSp4LocalLanglandsAndGaloisRepresentations; no local Langlands construction is replanned here.

**From `SmoothRepresentationsOfLocalGroups:SR.4`.** Import the current upstream spherical Satake normalization and compare the GSp4 Klingen and regular Iwahori blocks. Request the exact Genestier–Tilouine Proposition 11.1.2 specialization and BCGP25 projective finite-group Satake comparison; an abstract Satake isomorphism alone does not prove either.

### Proposed suppliers with no stable stage identifiers

IntegralCoherentHeckeComplexes, SiegelModularFormsModPn, GSp4LocalLanglandsAndGaloisRepresentations, OrdinaryAutomorphicFormsAndModularityLiftingPartII and OpenImageTheoremsForAbelianVarieties are named ownership requirements. They have no stable stages in this checkout. Their exact missing contracts are given with the proof gates below; no invented reference discharges them. The finite-group identification S₆≅Sp₄(F₂) used in one illustration also needs an explicit finite-classical-group supplier before that illustration can be packaged.

## How to read the build

Layers NR0–NR1 fix conventions, levels and selected actions. NR2 provides characteristic-zero interpolation independently of the minimal patching theorem. NR3 transfers the selected finite-level Hecke quotients and constructs regular Galois systems. NR4 proves the two cuspidal doubling maps; NR5 then produces the singular Hecke-valued minimal deformation. NR6 controls Klingen level and NR7 isolates the coherent defect and selected-balance gate. NR8 assembles the conditional minimal theorem. NR9 is an independent ordinary p-adic family branch. NR10 constructs characteristic-zero local freeness and NR11 proves nonzero rank one before invoking higher-Coleman classicality. Dependency references in each layer specify the precise build order inside a layer.

## Layer NR0: Conventions, residual data and tame levels

Fix the full multiplier and the weight/Frobenius dictionaries, the four-factor ordinary-root condition, the exact CG residual/local data and the q-enlarged minimal tame level. Specify symplectically labelled Klingen Taylor–Wiles refinements, including their product separation. Generic Galois and deformation objects are imported.

### NR0.1 Nondegenerate ordinary roots

For a field k and α,β ∈ k, NondegenerateOrdinaryRoots(α,β) means (α²−1)(β²−1)(α−β)(α²β²−1) ≠ 0. In arithmetic uses α,β are specified units, not merely an unordered pair of roots. This is the CG20 condition; it is stronger than α≠β and is unrelated to the regular-semisimple condition at an auxiliary prime.

Define the product on the existing field carrier; derive the four nonvanishing factors using absence of zero divisors. Show invariance under exchanging the two roots and under injective field extension.

(CG20, Theorem 1.1(2), p.802; §4, pp.812–813.)

Provide the following API for this object:

- `nondegenerateOrdinaryRoots_iff`: Over a field the predicate is equivalent to α²≠1, β²≠1, α≠β, and α²β²≠1.
- `nondegenerateOrdinaryRoots_swap`: Exchanging α and β preserves the predicate.
- `nondegenerateOrdinaryRoots_map`: An injective field map preserves and reflects the predicate.

In NR4/doubling-injection, this object is used as follows: Separates the two p-root lines and excludes the exceptional scalar-weight kernel. In NR0/lifting-data, this object is used as follows: Pins the admissible residual ordinary shape.

**Checks.**

- In F₁₁, α=2 and β=3 satisfy the predicate: the product is 7.
- In F₁₁, 2 and 6 are distinct and neither square is 1, but their product is 1; reject them.
- In F₁₁, 1 and 3 are rejected although the roots are distinct.

The target is accepted when the following checks hold: Expose all four exclusions and preserve the distinction between units at p and four auxiliary eigenvalues.

*Needs:* `mathlib:ZMod`.

### NR0.2 Weight and Frobenius dictionary

Use ε of Hodge–Tate weight −1 and geometric Frobenius throughout the CG branch. Its bundle ω(a,b) is the supplied rank-two Hodge bundle representation Sym^(a−b)⊗det^b. Pilloni’s Ω(k,r) is ω(k+r,r), with infinity parameter λ=(1−k−r,2−r;k+2r). In BCGP25, scalar weight two corresponds to λ=(1,1;2) and central character |·|²; its overconvergent Galois convention is dual-spin ρπ∨ε⁻³. Import the good-prime spin/dual-spin and full multiplier conversion from the current upstream Hecke roadmap, preserving every central operator.

Compute the highest weight of the Hodge bundle representation and compare each infinity-parameter convention. Use the upstream dual/twist and full multiplier identities rather than rediscover the spin polynomial. Keep the correction to the first infinity-coordinate sign explicit in the source ledger.

(P20, §5.3, author pp.24–25; CG20 Remarks 5.10–5.11, pp.833–834; BCGP25 §1.8.12, p.12, Definition 1.8.16, p.13 and Lemma 4.12.1, p.112.)

The target is accepted when the following checks hold: Test Ω(0,2)=ω(2,2) and its λ=(−1,0;4) in the Pilloni convention; it is not literally BCGP’s λ without its separate normalization. Record the precise conversion on polynomials and the full central character, even at trace zero.

*Needs:* `IntegralHeckeAndGaloisDeterminants:IHG.3`; `AutomorphicBundles:B4`; `HigherHidaAndColemanTheory:A0`.

### NR0.3 Nonregular lifting data

A CG lifting datum consists of an odd prime p≥5, a finite extension E/Qp with integers O, uniformizer ϖ and residue field k; an integer a with p−1>a≥2; a continuous absolutely irreducible odd residual representation r̄:GQ→GSp₄(k) with multiplier ε̄^(1−a); chosen nondegenerate roots α,β; and a local basis at p with diagonal λ(α),λ(β),ε̄^(1−a)λ(β⁻¹),ε̄^(1−a)λ(α⁻¹), zero (1,2) and (3,4) entries and an unramified isotropic two-plane. It also records CG20 Assumptions 4.1–4.3, the minimal local deformation conditions and a chosen nonzero cuspidal residual eigensystem. The generic deformation functors, representations and pairings are supplied objects, not new definitions here.

Use the supplier representation, pairing and deformation objects and impose this particular conjunction of conditions. Keep three image conditions separate: Q(ad⁰r̄) excludes ζp; for every m there is σ∈GQ(ζpᵐ) with four distinct roots and eigenvalue 1 on each irreducible adjoint constituent; the images of ad⁰r̄ and ad⁰r̄(1) have no quotient of order p. Record away-p types U₁,U₂,U₃ by unipotent monodromy ranks 1,2,3; P by two isotropic inertia-character planes with x−1 prime to p; H by absolutely irreducible inertia with x⁴−1 prime to p. Under the fixed cyclotomic multiplier the P case is empty. The local minimal functor fixes the full multiplier, preserves those inertia conditions and, at p, has the split unramified two-plane with characters lifting the specified roots, as in Definition 4.6. Representability remains a supplier obligation.

(CG20, §4, Assumptions 4.1–4.3 and Definition 4.6, pp.812–816; Definition 6.15, p.844.)

Provide the following API for this object:

- `liftingDatum_local_shape`: Extract the specified residual local matrix, pairing and ordered roots.
- `liftingDatum_minimal_functor`: Return the supplied fixed-multiplier minimal functor with the exact U/P/H conditions.
- `liftingDatum_change_coefficients`: Extend coefficients and transport the basis, pairing and root labels without changing local types.

In NR5/nonregular-representation, this object is used as follows: Specifies the deformation problem represented by the nonregular Hecke representation. In NR8/minimal-rt, this object is used as follows: Supplies the complete residual and local hypotheses.

**Checks.**

- For p=7, a=4 passes the weight range while a=6 fails the strict bound.
- A lift that changes a U₁ inertia generator to rank-two monodromy fails minimality.
- For a=2 the multiplier is ε⁻¹; a representation with multiplier ε has the wrong normalization.

The target is accepted when the following checks hold: Do not replace Assumption 4.1 by adequacy, or the selected ordinary plane by an arbitrary filtration. The multiplier is ε^(1−a), with ε of Hodge–Tate weight −1 and geometric Frobenius ε(Frobℓ)=ℓ⁻¹.

*Needs:* `NR0 (nondegenerate ordinary roots)`; `ArithmeticGaloisRepresentations:G7`; `GlobalGaloisDeformations:G7`; `LocalGaloisDeformationRings:L7`.

### NR0.4 Minimal tame levels and the neat auxiliary prime

From a CG lifting datum satisfying Assumption 4.2 choose q≥3, q∉S(r̄)∪{p}, with q≠1 mod p and no ratio of residual Frobenius eigenvalues equal to q. At U₁,U₂,U₃ primes choose respectively paramodular, Klingen and Iwahori level; at P choose strict Klingen level; at H choose full congruence level at x; impose full level q and hyperspecial level elsewhere. For Q disjoint from S(r̄)∪{p,q}, form K₀(Q) and K₁(Q) (Klingen Π(x) and Π(x)⁺ at x∈Q), the group ΔQ=∏x∈Q(Z/xZ)^× of the étale cover X₁(Q)→X₀(Q) (through Π(x)/Π(x)⁺≅(Z/xZ)^×), and the intermediate cover XΔ(Q) for any quotient Δ of ΔQ; the patching argument uses quotients of p-power order. The prime q makes these moduli problems neat.

Choose the Frobenius class by Chebotarev from the stated neatness witness, then choose a prime outside the finite excluded set. Use the suppliers for integral models, compatible fans and bundles; specify the local compact subgroups and their Klingen-character kernels. The no-eigenvalue-ratio condition gives H²(Qq,ad⁰r̄)=0 and forces every relevant lift to be unramified at q.

(CG20, Assumption 4.2, p.813; §§5.1–5.2, pp.820–822; §6.3, pp.840–841; proof of Theorem 6.13, p.843; §7.2, p.851.)

Provide the following API for this object:

- `minimalLevel_local`: Give the local compact subgroup at each ramification type and at q.
- `klingenCover_deck`: Identify the deck group with the specified quotient of ΔQ, including the trivial quotient.
- `minimalLevel_pullback_trace`: Supply compatible pullback and trace maps on the chosen compactifications and bundles.

In NR6/tw-comparison, this object is used as follows: Defines the pullback and trace comparison. In NR8/patching-datum, this object is used as follows: Provides the finite diamond covers and their base specialization.

**Checks.**

- For Q=∅ the diamond group is trivial and X₀(Q)=X₁(Q)=X.
- A U₂ prime uses Klingen, not the U₁ paramodular subgroup.
- A q with a residual eigenvalue ratio q is rejected even when q≠1 mod p.

The target is accepted when the following checks hold: State the auxiliary-prime unramifiedness for the lift itself, and identify the trivial Q cover with the base level.

*Needs:* `NR0 (nonregular lifting data)`; `ShimuraCompactifications:C3`; `ShimuraCompactifications:C5`; `AutomorphicBundles:B3`.

### NR0.5 Klingen Taylor–Wiles refinements

A CG Taylor–Wiles refinement at x∉S∪{p} consists of x≡1 mod pᴺ, four distinct residual Frobenius roots (αx,βx,γx,δx), two specified complementary isotropic planes, the pairing labels αxδx=βxγx=ν(Frobx), and the extra separation αxβx≠γxδx. Roots lift uniquely in the appropriate henselian Hecke factor. The pairing labels and product separation are additional requirements, not consequences of the two isotropic planes.

Use the supplier auxiliary-prime theorem with the precise CG image hypothesis, not a dimension-general theorem with different assumptions. Label roots respecting the symplectic pairing, and exchange βx and γx when necessary to get the product separation. Track the chosen isotropic plane through scalar inertia deformations.

(CG20, §4, p.815; Proposition 4.10, p.818; Assumption 7.1 and Theorem 7.2, pp.846–847.)

Provide the following API for this object:

- `twRefinement_pairing`: Extract the multiplier equalities and isotropic-plane labels.
- `twRefinement_henselian_roots`: Return the unique lifted four roots with their reductions.
- `twRefinement_relabel`: Transport the selected refinement under a permitted symplectic relabelling and update the selected projector.

In NR6/tw-projector, this object is used as follows: The product separation selects the desired Klingen block. In NR8/patching-datum, this object is used as follows: Identifies the inertia characters represented by the diamond algebra.

**Checks.**

- In F₁₃ roots (2,4,11,9) have paired products 5 and four distinct entries, but 2·4=11·9; reject this ordering.
- The pairing constraints involve αδ and βγ, not αβ and γδ.
- A prime satisfying only x≡1 mod p fails a requested depth N=2 when x≢1 mod p².

The target is accepted when the following checks hold: Keep the one-dimensional Klingen diamond factor here distinct from the two-dimensional torus factor in NR10.

*Needs:* `NR0 (nonregular lifting data)`; `GlobalGaloisDeformations:R04.5`.

### Examples

In F₁₁, α=2 and β=3 satisfy the predicate: the product is 7.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations:G7`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:R04.5`, `HigherHidaAndColemanTheory:A0`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `LocalGaloisDeformationRings:L7`, `ShimuraCompactifications:C3`, `ShimuraCompactifications:C5`.

## Layer NR1: Selected cuspidal Hecke images

Construct the specialized anemic, full and p-enlarged Hecke images on the actual cuspidal modules, their invariant-level restrictions and joint generalized-root selectors. Define nonzero cuspidal Katz modularity at the prescribed level. The underlying image, determinant and projector theory is imported from the current upstream Hecke roadmap.

### NR1.1 The three nonregular Hecke images

For the supplied cuspidal coherent sections H⁰(X₁(Q),ω(μ)(−D)⊗E/O), define Tanμ(Q) as the O-subalgebra image generated by spherical operators away from S∪Q∪{p}; Tμ(Q) adds Ux,i and ΔQ; T̃μ(Q) adds the integral p-operators Tp,1 and Qp,2=(pTp,2+(p+p³)Sp)p^(2−b) for μ=(a,b). Restrict these actual images to the invariant X₀(Q) subspace when that level is used. Define ordinary images by restriction to the invertible Tp,1Qp,2 summand, rather than by simply adjoining inverses to an unrelated ring.

Import abstract Hecke images, spin-polynomial normalizations and factorial projectors; specify the generating double cosets and their actual action. Require the integral geometric construction of normalized p-operators before using their image; Fourier identities alone do not define higher-degree actions. Prove the X₀(Q) subspace is stable and that the three ring maps are induced by their common faithful image action.

(CG20, Definitions 5.13–5.14, pp.834–835; Lemma 8.8, p.860.)

Provide the following API for this object:

- `anemicHecke_generator`: Give the image of every good spherical operator and its spin polynomial.
- `fullHecke_diamond`: Give Ux,i and the homomorphism O[ΔQ]→Tμ(Q).
- `normalizedPHecke_action`: Identify Tp,1 and Qp,2 on integral sections with their Fourier formulas.
- `heckeImage_change_level`: Pullback/trace maps intertwine all generators for which the correspondence is defined.

In NR3/annihilator-transfer, this object is used as follows: Transfers actual finite-quotient Hecke actions under Hasse multiplication. In NR5/nonregular-representation, this object is used as follows: The target coefficient algebra is the localized selected image.

**Checks.**

- For Q=∅ the diamond generators contribute only the identity.
- In weight (a,2), Qp,2=pTp,2+(p+p³)Sp; dropping the central summand is rejected.
- If two abstract operators act identically on the chosen module they have identical elements in its Hecke image.

The target is accepted when the following checks hold: A relation in an abstract double-coset algebra is transported to the actual image; no faithfulness of that abstract algebra is assumed.

*Needs:* `NR0 (minimal tame levels and the neat auxiliary prime)`; `IntegralHeckeAndGaloisDeterminants:IHG.2`; `IntegralHeckeAndGaloisDeterminants:IHG.3`; `AutomorphicBundles:B5`.

### NR1.2 Joint ordinary root selectors

On a finite O-Hecke algebra, with its adic topology, or compatibly on its finite quotients, let e(T,c)=1−limn(T−c)^(n!) be the generalized c-root selector. Define eβ=e(Tp,1,β)e(Qp,2,αβ) in the regular-weight setting used by CG20, and eαβ=e(Tp,1,α+β)e(Qp,2,αβ) in weight (a,2). The selected module is the intersection of the two generalized root submodules. The two complementary limits are multiplied separately; taking one complement of their product selects an incorrect union.

Apply the upstream factorial-powers theorem in each finite quotient and then take the compatible adic limit. Use commuting p-operators to multiply commuting idempotents and identify the image with the intersection. The regular β selector uses the regular residual Qp,2 value αβ; retain the source weight and normalization when transferring selectors.

(CG20, §6.3, p.841; §6.4, p.845, with the joint-selector correction.)

Provide the following API for this object:

- `jointSelector_image`: An element lies in the selected image exactly when both generalized root conditions hold. Over a field, singularRootSubmodule(T,Q,α,β) is the intersection of Mathlib’s generalized (α+β)-eigenspace of T and generalized αβ-eigenspace of Q; membership allows separate finite exponents.
- `jointSelector_idempotent`: The product selector squares to itself and commutes with the Hecke algebra.
- `jointSelector_reduce`: Reduction to O/ϖᵐ commutes with the selector and with its image splitting.

In NR4/doubling-injection, this object is used as follows: Defines the singular source and the regular β target. In NR7/selected-balance, this object is used as follows: Specifies the exact summand whose integral balance needs proof.

**Checks.**

- On k² with T=diag(c,c+1), Q=diag(d+1,d), the joint (c,d) selector is zero, whereas the erroneous union formula is the identity.
- For T=diag(c,c+1), Q=diag(d,d), the selector is diag(1,0).
- A nonzero nilpotent Jordan block for T−c belongs entirely to the generalized c part; a simple eigenspace would lose vectors.

The target is accepted when the following checks hold: Verify the scalar root pairs directly, including points satisfying exactly one of the two conditions.

*Needs:* `NR1 (the three nonregular hecke images)`; `IntegralHeckeAndGaloisDeterminants:IHG.2`; `mathlib:Module.End.genEigenspace`.

### NR1.3 Katz modularity in weight (a,2)

For the fixed level from NR0, say that r̄ is Katz modular of weight (a,2) with ordered roots α,β when there is a nonzero section η∈H⁰(X,ω(a,2)(−D)k)[m∅] satisfying Tp,1η=(α+β)η and Qp,2η=αβη. The anemic ideal m∅ is of Galois type r̄ using the imported residual-polynomial interface. The cuspidal condition, the actual level and nonzeroness are all part of the predicate.

Specialize the supplied Galois-type maximal-ideal predicate to the coherent cuspidal space and the normalized two p-operators. Relate existence of such η to nonzero residual selected eigenspace, after the coefficient field contains the required eigenvalues.

(CG20, Definition 6.15 and Assumption 6.16, pp.844–845, corrected nonzero cuspidal formulation.)

Provide the following API for this object:

- `katzModular_witness`: Extract a nonzero cuspidal simultaneous eigensection at the specified level.
- `katzModular_selected_nonzero`: Identify Katz modularity with nonvanishing of the selected residual eigenspace under the splitting hypotheses.
- `katzModular_extend_coefficients`: Extend a witness along an injective residue-field extension.

In NR5/nonregular-representation, this object is used as follows: Ensures the selected Hecke algebra is supported and has the chosen residual representation. In NR8/minimal-rt, this object is used as follows: Provides the residual modularity assumption and positive-rank input.

**Checks.**

- A zero selected space has no witness.
- A noncuspidal Eisenstein eigenform with matching p-eigenvalues is not a witness.
- A nonzero class with Tp,1=α+β but Qp,2≠αβ is rejected.

The target is accepted when the following checks hold: The zero section never witnesses modularity; an eigenclass at an unspecified larger level does not meet the minimal-level hypothesis.

*Needs:* `NR1 (the three nonregular hecke images)`; `NR1 (joint ordinary root selectors)`; `IntegralHeckeAndGaloisDeterminants:IHG.3`.

### Examples

For Q=∅ the diamond generators contribute only the identity.

### Dependencies

This layer uses `AutomorphicBundles:B5`, `GSp4NonregularModularityLifting:NR0`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.3`.

Its direct proof gates are Siegel mod-ϖᵐ geometric operators. The full contracts are stated below.

## Layer NR2: Singular-weight Galois interpolation

Construct number fields for coherent eigensystems and apply the all-degree Pilloni–Stroh interpolation to their characteristic-zero actions. State the precise qualified Mok crystalline specialization, the no-Steinberg scalar-weight obstruction, ordinary weight-two Galois systems, the pure general-type monodromy upgrade, dual-spin overconvergent interpolation and completed-eigenspace isotypy through the GSp₄ semisimplicity criteria. Preserve every classification and local qualification.

### NR2.1 Coefficient fields of coherent eigensystems

Let K be neat and Ω(k,r)=ω(k+r,r), k≥0, r∈Z, on the Siegel threefold. Every simultaneous characteristic-zero Hecke character Θ occurring in any finite-dimensional Hⁱ of its canonical or subcanonical extension has values in a number field E. For every λ|p choose an embedding E→Q̄p. Finite-dimensionality is used for this actual Hecke image, so an arbitrary character of a free algebra is not covered.

Use the rational structure on the algebraic variety and bundle, finite coherent cohomology and the rational Hecke action. The image of the commutative Hecke algebra in EndQ(Hⁱ) is finite-dimensional; the residue field of its characteristic-zero character is finite over Q. Identify all eigenvalues with this common finite field and transport along each chosen p-adic embedding.

(P20, Theorem 5.3.1, author p.25; weight convention, author p.24.)

The target is accepted when the following checks hold: Treat both extension conventions and each degree; do not appeal only to a coefficient-field theorem for classical H⁰ forms.

*Needs:* `AutomorphicBundles:B3`; `AutomorphicBundles:B4`; `IntegralHeckeAndGaloisDeterminants:IHG.2`.

### NR2.2 No Steinberg component in scalar weight two

If π is the cuspidal automorphic representation of a classical Siegel form of weight (2,2), then no finite local component is Steinberg in the source’s normalized central-character convention. At a Steinberg place x, the normalized Ux,1 eigenvalue in weight (j,k) is x^((j+k−6)/2), and in weight (2,2) it is x⁻¹, contradicting integrality of the Fourier-normalized Hecke action. Include any allowed finite unramified unit twist in the local calculation; its valuation does not change the contradiction.

Request the local Steinberg parameter and its U-eigenvalue in the exact geometric normalization from the GSp₄ local representation supplier. Establish integrality of the action on the Fourier lattice and hence integrality of its eigenvalue. At the residue characteristic x the proposed Steinberg eigenvalue has negative valuation; conclude it cannot occur.

(CG20, Theorem 5.9 and proof, p.832.)

The target is accepted when the following checks hold: The proof is an integral Hecke-eigenvalue obstruction, not a consequence of an unproved association of an abelian variety to every weight-two form.

*Needs:* `NR0 (weight and frobenius dictionary)`; `AutomorphicBundles:B5`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.4`.

### NR2.3 All-degree characteristic-zero interpolation

For the characteristic-zero coherent eigensystems of NR2, the away-p Hecke action factors continuously through the inverse limit of finite free integral Hecke images on cuspidal H⁰ at varying p-levels and finite sets of regular weights. The resulting continuous semisimple ρΘ,λ:GQ→GL₄(Q̄p) is unramified outside Np and satisfies det(1−XρΘ,λ(Frobℓ))=Θ(Qℓ(X)) at ℓ∤Np. This applies to every coherent degree and both canonical and subcanonical extensions. It does not identify the unusual integral models in Pilloni–Stroh with a chosen Kottwitz lattice.

Import the geometric interpolation input for the modified ample Hodge bundle: Hodge–Tate sections give a Hecke-stable cover, and Čech localization modulo pˢ reduces classes to sections. Clear denominators with high powers, use positivity and Serre vanishing to lift regular-weight sections, and pass through the finite integral Hecke images. Use duality for the other extension convention; reconstruct the semisimple representation from the continuous determinant and good-prime identities. Record an independent lattice-comparison obligation before applying this theorem to a specific torsion integral lattice.

(PS16, Theorem 0.1, pp.1–2; Theorem 3.6 and Remark 3.10, pp.16–17; Corollary 3.14, p.19; P20 Theorem 5.3.1, author p.25.)

The target is accepted when the following checks hold: Do not infer CG20 Lemma 6.9 for its torsion lattice solely from this characteristic-zero theorem. Symplectic descent and de Rhamness are separate conclusions requiring their own hypotheses.

*Needs:* `NR2 (coefficient fields of coherent eigensystems)`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `IntegralHeckeAndGaloisDeterminants:IHG.3`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `AutomorphicBundles:B5`; `HodgeTateAndCanonicalSubgroups:T0`; `ModularityAndLanglandsExtensions:ML.4`.

### NR2.4 Qualified crystalline specialization

For a simple-generic cuspidal GSp₄ representation over a totally real field with archimedean parameter φ(w,m₁,m₂), m₁>m₂≥0 and w+1≡m₁+m₂ mod 2, assume spherical level at every v|p and four distinct inverse Hecke roots there. Under the classification hypotheses, Mok’s associated p-adic representation is crystalline at v|p, hence de Rham, including the stated limit-of-discrete-series cases. This theorem does not assert de Rhamness for every ordinary singular coherent eigensystem.

Use the finite-slope family and crystalline-period continuation with its distinct-root hypothesis from the supplier geometric Galois construction. Carry the central character and archimedean parity through the weight dictionary. Apply coefficient extension and de Rham descent from the period-functor API.

(M14, §4, Theorem 4.14 and Proposition 4.16, pp.40–42; P20 §5.3, author pp.25–26.)

The target is accepted when the following checks hold: A repeated-root ordinary representation is outside this specialization; do not remove the distinct inverse-root condition.

*Needs:* `NR2 (all-degree characteristic-zero interpolation)`; `PadicHodgeTheory:R06.2`; `AutomorphicGaloisRepresentationsPartII:AG2.6`; `ModularityAndLanglandsExtensions:ML.4`.

### NR2.5 Ordinary weight-two Galois representation

Let F⁺ be totally real with p completely split, and let π be an ordinary cuspidal weight-two GSp₄(A_F⁺) representation in the BCGP25 convention λ=(1,1;2), with central character |·|². There is a continuous semisimple ρπ:G_F⁺→GSp₄(Q̄p), multiplier ε⁻¹. Away from p its Weil–Deligne semisimplification equals recGT(πv|ν|^(−3/2))ss. At v|p it is upper triangular with diagonal α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹, where α and β are potentially unramified. Neither full monodromy equality nor de Rhamness follows from this basic interpolation statement.

Use the ordinary families with dense regular classical points and the fixed central-character identity. Interpolate the symplectic Galois object; at p retain the four ordered ordinary characters and potential unramifiedness. Apply the semisimplified local comparison with its explicit |ν| twist. When ρπ is irreducible, the ε⁻¹-line in ∧²ρπ gives a nondegenerate alternating pairing; in general the GSp₄-valued output comes from GSp₄ pseudocharacters (recorded gap).

(BCGP25, §1.8.12, p.12; Definition 1.8.16 and Theorem 1.8.17, pp.13–14.)

The target is accepted when the following checks hold: The statement is over Q̄p, so no integral descent is involved, also at p=2; the GSp₄-valued interpolation uses Lafforgue's GSp₄ pseudocharacters and their reconstruction over Q̄p.

*Needs:* `NR2 (all-degree characteristic-zero interpolation)`; `IntegralHeckeAndGaloisDeterminants:IHG.3`; `AutomorphicGaloisRepresentationsPartII:AG2.5`; `HigherHidaAndColemanTheory:X8`; `ModularityAndLanglandsExtensions:ML.4`.

### NR2.6 Pure general-type monodromy upgrade

In NR2/weight-two, if π is of general type and the corresponding ρπ is pure, upgrade the away-p comparison to an equality of Frobenius-semisimplified Weil–Deligne representations retaining monodromy N. The general-type and purity assumptions are not omitted.

General type means the transfer to GL₄ is cuspidal, hence locally generic, so the L-packet of πv⊗|ν|^(−3/2) is generic; by the GSp₄ local Langlands correspondence of Gan–Takeda (main theorem, part vii) the adjoint L-factor of its parameter is holomorphic at s=1. Purity of ρπ makes its Frobenius-semisimplified Weil–Deligne representation pure; by Taylor–Yoshida Lemma 1.4 a pure Weil–Deligne representation with the given semisimplification carries the unique monodromy compatible with that holomorphy, which is the monodromy of the automorphic side. Keep the N-bearing comparison distinct from the basic semisimplified interpolation theorem.

(BCGP25, Remark 1.8.20 and its argument, p.14.)

The target is accepted when the following checks hold: An unramified-trace identity alone cannot certify this target. The adjoint input is local (holomorphy at s=1 of a local adjoint L-factor), not a global analytic statement.

*Needs:* `NR2 (ordinary weight-two galois representation)`; `AutomorphicGaloisRepresentationsPartII:AG2.5`; `AutomorphicLFunctionsAndLocalFactors:AL.4`; `ModularityAndLanglandsExtensions:ML.4`.

### NR2.7 Dual-spin overconvergent interpolation

For an ordinary overconvergent eigenform f∈H⁰⁰_w(Sh_Kp,ω(2,2;−w),sm), with w even and smooth torus character χ=χ₁⊗χ₂⊗χ₃⊗χ₄, construct its semisimple GSp₄ representation ρf with good-prime polynomial Pℓ in BCGP25’s dual-spin convention: at classical points it is ρπ∨ε⁻³. Under local reciprocity the ordered p-diagonal characters on z∈Qp× are χ₄(z)⁻¹z^(−1−w/2), χ₃(z)⁻¹z^(−1−w/2), χ₂(z)⁻¹z^(−2−w/2), χ₁(z)⁻¹z^(−2−w/2). Specify the reciprocity convention on p as well as Zp×.

Import higher-Hida/overconvergent spaces and their local torus action. Interpolate the dual-spin polynomial with the central operator and compare with the classical dual-and-twist formula. Read the local characters from the ordered torus eigensystem, correcting the double inverse printed in the final two entries of BCGP25 Lemma 4.12.1.

(BCGP25, Lemma 4.12.1 and its proof, p.112; Remark 4.12.2, p.112.)

The target is accepted when the following checks hold: Never identify this dual-spin representation with the geometric-spin ρπ without the indicated dual and cyclotomic twist.

*Needs:* `NR2 (ordinary weight-two galois representation)`; `IntegralHeckeAndGaloisDeterminants:IHG.3`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `HigherHidaAndColemanTheory:X8`.

### NR2.8 Completed eigenspace isotypy

Let V=H³(RHom_b(λ,RΓ(Sh_Kp^tor,Qp)^la)^ord_mρ̄), λ=(1,1;w), with the algebraic torus character removed as in BCGP25. Assume residual absolute irreducibility, ρf irreducible, and either Zariski image containing Sp₄, or image containing SL₂×SL₂ with ρf becoming reducible on an index-two subgroup. For an occurring eigenform f, the eigenspace V[mf] is nonzero, finite-dimensional and isomorphic to ρf⊗W for a finite-dimensional nonzero multiplicity space W.

Use the four higher-Coleman graded pieces and exactness of χ-isotypic parts for smooth T(Zp)-modules in characteristic zero: (V⊗Cp)[χ] is finite-dimensional, with Gr⁰ the ordinary overconvergent H⁰. The maximal ideal mf lies in the support of the finite-length module (V⊗Cp)[χ], through its quotient Gr⁰, so its mf-torsion is nonzero; no exactness of the eigenspace functor is needed. Each Frobℓ satisfies Pℓ mod mf on V[mf] by the Eichler–Shimura relation. Apply the GSp₄ semisimplicity criteria for representations annihilated by the Frobenius characteristic polynomials of ρf (BCGP25 Propositions 4.11.1–4.11.2); the Cayley–Hamilton recognition of IntegralHeckeAndGaloisDeterminants Layer 1.6 needs annihilation by the whole Cayley–Hamilton ideal and does not apply directly.

(BCGP25, Lemma 4.12.3 and proof, p.113; Propositions 4.11.1–4.11.2, pp.109–110; Theorem 1.8.29, p.17.)

The target is accepted when the following checks hold: The conclusion includes W≠0, not only a multiple-of-four dimension assertion. Only the Frobenius characteristic polynomials are known to annihilate V[mf]; the image hypothesis is what makes this enough.

*Needs:* `NR2 (dual-spin overconvergent interpolation)`; `HigherHidaAndColemanTheory:X8`; `IntegralHeckeAndGaloisDeterminants:IHG.2`; `ArithmeticGaloisRepresentations:R01.5`.

### Examples

In scalar weight two, a geometric-spin representation with Hodge–Tate multiset {0,0,1,1} becomes a coherent dual-spin representation with multiset {2,2,3,3}: duality negates the weights and twisting by ε⁻³ adds 3. Its multiplier changes from ε⁻¹ to ε⁻⁵, because duality inverts the multiplier and a rank-four scalar twist squares its character. This checks both normalizations and does not infer de Rhamness from an ordinary filtration.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `AutomorphicLFunctionsAndLocalFactors:AL.4`, `GSp4NonregularModularityLifting:NR0`, `HigherHidaAndColemanTheory:X8`, `HodgeTateAndCanonicalSubgroups:T0`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `ModularityAndLanglandsExtensions:ML.4`, `PadicHodgeTheory:R06.2`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.4`.

Its direct proof gates are GSp₄ pseudocharacter reconstruction in characteristic zero; Local paramodular and Klingen interfaces; Classification input; Pilloni–Stroh integral lattice comparison. The full contracts are stated below.

## Layer NR3: Finite-level Hasse transfer and regular Galois systems

Use supplied Hasse lifts with finite-level congruences and vanishing thresholds to transfer actual selected image quotients. The annihilator belongs to the selected summand. Construct central characters, residual Galois systems and regular Hecke-valued representations with ordered ordinary local characters. A stronger p-polynomial identity is recorded separately as a proof gap.

### NR3.1 Hasse shifts and the vanishing threshold

For μ=(a,b), use the supplied scalar Hasse invariant h of weight (p−1,p−1), a characteristic-zero lift A of hʳ with r>0, and a threshold N(μ) for higher-cohomology vanishing after a sufficiently positive scalar shift. For coefficients O/ϖᵐ choose s divisible by p^(m−1) with t=rs(p−1)≥N(μ), and set μ′=μ+(t,t). Multiplication by Aˢ is injective on sections and is equivariant for the normalized away-p Hecke action. Equivariance for the normalized p-operators is a separate assertion and is not inferred from this construction.

Import Hasse invariants, their lift and its finite-level congruences from the proposed Siegel modular-forms supplier. Choose the shift using the supplied positivity/vanishing theorem, preserving the difference a−b. Prove integral injectivity using that the multiplier is a nonzerodivisor on the appropriate model; identify precisely the operators with which it commutes.

(CG20, Definition 6.1, Definition 6.3, Lemma 6.4 and Remark 6.5, pp.836–837.)

Provide the following API for this object:

- `hasseShift_weight`: Return the exact shifted pair μ′ and preserve a−b.
- `hasseShift_injective`: The multiplication map on sections has zero kernel under the supplied geometric hypotheses.
- `hasseShift_awayHecke`: Intertwine the good-prime normalized Hecke operators modulo ϖᵐ.

In NR3/annihilator-transfer, this object is used as follows: Transfers finite-level eigensystems to a high-weight image. In NR6/hasse-descent, this object is used as follows: Supplies the multiplication sequences for level comparison.

**Checks.**

- A scalar shift takes (4,2) to (4+t,2+t), preserving difference 2.
- For p=5,m=3 choose s divisible by 25; s=5 alone does not meet this finite-level requirement.
- A nonconstant Hasse shift does not by itself identify the two normalized p-operator eigenvalues.

The target is accepted when the following checks hold: Track m and the divisibility of s; a lift merely congruent to hʳ modulo ϖ need not have the required equivariance modulo ϖᵐ.

*Needs:* `NR1 (the three nonregular hecke images)`; `AutomorphicBundles:B4`; `AutomorphicBundles:B5`; `ShimuraCompactifications:C5`.

### NR3.2 Selected annihilator quotients

For the selected finite-level module Hμ,m^sel define Jμ,m^sel=Ann(Tμ^sel,Hμ,m^sel), and its enlarged-image counterpart. The regular-weight comparison uses the composite e′β∘Aˢ on the β-part. Once this composite is proved injective, it induces a surjection from the high-weight Hecke image to Tμ^sel/Jμ,m^sel for the operators whose actions intertwine. The target ideal is the annihilator of the selected module, not that of the full coherent module.

Define the annihilator using the actual action on the named summand. For regular β-parts prove injectivity on the socle using the residual p-operator formulas, and then on the finite local module. Factor the intertwining action through the image quotient; show surjectivity on the specified generating operators. In singular weight postpone the corresponding injection until NR4/doubling-injection.

(CG20, Remark 6.5, p.837; proof of Theorem 6.13, pp.842–843; selected-annihilator correction.)

Provide the following API for this object:

- `selectedAnn_mem`: An operator belongs to J exactly when it annihilates every vector of the selected O/ϖᵐ module.
- `selectedAnn_reduce`: Compatible finite-level actions give the correct transition homomorphisms of image quotients.
- `hasseSelected_heckeSurjection`: An injective intertwiner induces the specified surjection onto the selected image quotient.

In NR3/regular-representation, this object is used as follows: Constructs compatible regular finite-quotient Galois systems. In NR5/nonregular-representation, this object is used as follows: Uses the singular selected annihilator after doubling.

**Checks.**

- For T=k×k acting on k² and selector onto the first coordinate, Jsel=0×k, whereas the full annihilator is zero.
- For a zero selected module the annihilator is the entire ring and the selected image quotient is the zero ring.
- An injective linear map that does not intertwine a chosen generator supplies no image-algebra surjection for that generator.

The target is accepted when the following checks hold: Do not claim that Aˢ alone preserves the β-summand, or that the full p-characteristic-polynomial identity descends by away-p equivariance.

*Needs:* `NR1 (joint ordinary root selectors)`; `NR3 (hasse shifts and the vanishing threshold)`; `IntegralHeckeAndGaloisDeterminants:IHG.2`.

### NR3.3 Central characters and residual Galois systems

For every maximal ideal of the anemic image in NR1 there is a continuous semisimple residual GL₄ representation matching the good-prime spin polynomial. It is unique up to isomorphism; if absolutely irreducible, it has an alternating pairing and the full prescribed central multiplier, and is non-Eisenstein. Its pullbacks along T→T̃ and ordinary/selected image maps have the same residual representation. The central character is constructed independently from the full spherical central operators, not inferred from the determinant square.

Use the Hasse transfer of NR3 for finite-quotient residual systems, characteristic-zero regular eigenforms and the imported reconstruction theorem. The arrow to NR3 is a proof dependency; the statement is first available after NR3. For simple-generic characteristic-zero systems use the alternating pairing theorem; in the reducible non-simple-generic cases specify each constituent and its pairing before reducing. Do not assert that reducibility itself implies symplecticity. Interpolate the full central Hecke character and compare it with the representation multiplier; transport to the other image rings by the shared good polynomials.

(CG20, Proposition 6.6, pp.837–838; Proposition 6.8 and Lemma 6.9, pp.838–840; Definition 6.11, p.840.)

The target is accepted when the following checks hold: Keep Arthur/classification assumptions visible from Lemma 6.9 onward. Absolute irreducibility, not irreducibility over the residue field alone, is required for the integral reconstruction and unique pairing.

*Needs:* `NR1 (the three nonregular hecke images)`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `IntegralHeckeAndGaloisDeterminants:IHG.3`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `ModularityAndLanglandsExtensions:ML.4`; `NR3 (selected annihilator quotients)`.

### NR3.4 Regular-weight Hecke-valued Galois representation

For regular μ=(a,b), a≥b≥3, a non-Eisenstein maximal ideal with residual r̄, the prescribed tame level and labelled auxiliary primes, construct rβμ,m:GQ→GSp₄(Tμ(Q)β_m). It matches every good-prime spin polynomial away from S∪Q∪{p}; has multiplier χμ,0ε^(−(a+b−3)) with χμ,0 finite order and residually trivial; and is upper triangular at p with diagonal λ(dp,1), ε^(−(b−2))λ(dp,2), ε^(−(a−1))λ(dp,3), ε^(−(a+b−3))λ(dp,4), where dp,1≡β and dp,2≡α. After an odd-p square-root character twist it has the required weakly minimal away-p local conditions. The additional equality involving the complete Hecke polynomial at p is not included without a separate proof.

At high regular weight use vanishing, a torsion-free characteristic-zero eigenform decomposition and the supplied regular Galois representations. The Hecke image embeds into the product of their integer rings. Import the regular-weight eigenform representations of CG20 Proposition 6.8 (existence, crystalline at p with Frobenius polynomial Qp, ordinary shape, symplectic pairing, local–global compatibility) from the automorphic Galois suppliers. Descend traces and the full multiplier into the integral image by the upstream p>2 symplectic descent theorem; pass to selected finite-quotient image rings. Obtain the ordered ordinary characters from the regular ordinary theory, carrying their four cyclotomic exponents. Take the compatible inverse limit and use the unique finite-character square root congruent to 1 to fix the multiplier; verify weak minimality prime by prime, including unramifiedness at q.

(CG20, Theorem 6.13(1)–(4) and proof, pp.841–844, restricted to the assertions transported by the proof.)

The target is accepted when the following checks hold: The proof must identify the local characters on the selected quotient; a p-polynomial identity requires more than a good-prime trace descent. Do not use the unproved torsion-freeness expectation of Remark 6.14.

*Needs:* `NR3 (selected annihilator quotients)`; `NR3 (central characters and residual galois systems)`; `NR2 (qualified crystalline specialization)`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `LocalGaloisDeformationRings:L7`; `AutomorphicGaloisRepresentationsPartII:AG2.5`; `AutomorphicGaloisRepresentationsPartII:AG2.6`; `ModularityAndLanglandsExtensions:ML.4`.

### Examples

A scalar shift takes (4,2) to (4+t,2+t), preserving difference 2.

### Dependencies

This layer uses `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `GSp4NonregularModularityLifting:NR1`, `GSp4NonregularModularityLifting:NR2`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `LocalGaloisDeformationRings:L7`, `ModularityAndLanglandsExtensions:ML.4`, `ShimuraCompactifications:C5`.

Its direct proof gates are Siegel mod-ϖᵐ geometric operators; Regular p-polynomial assertion outside the transported proof; Classification input. The full contracts are stated below.

## Layer NR4: Cuspidal Fourier doubling

Specialize the formal U,Z,Z₂,X₂ operators and Hasse spaces in characteristic p. Prove ordinary-envelope control and the two kernel systems. Use corrected scalar/vector theta inputs, an all-index contraction obligation and a separately checked scalar recurrence to obtain both root-labelled Hasse-projection injections. Keep all needed weight bounds and restrict the minimal-discriminant argument to cuspidal forms.

### NR4.1 Formal operators in the doubling argument

Work over k of odd characteristic p, with tame level prime to p and trivialized auxiliary Nebentypus, in weights (j,2) with j≥4 or j=2. Let q-series have coefficients in Sym^(j−2)(k²), indexed by p-integral positive-semidefinite binary forms Q with bounded tame denominators and the prescribed Γ-equivariance. Set a(UF;Q)=a(F;pQ). For integral representatives M of Γ diag(p,1) Γ, set a(ZF;Q)=ΣM Sym^(j−2)(M)a(F;M⁻¹·Q), interpreting nonintegral indices as zero, where M·Q=det(M)⁻¹MQMᵗ. Put Z₂=UZ and a(X₂F;Q)=(disc(Q)/p)a(F;Q). An integral binary-form index Q is p-primitive when its three coefficients are not all divisible by p; this is a condition on the index, not on a series over k.

Import the general Fourier-series, q-expansion and symmetric-power coefficient APIs from the proposed Siegel modular-forms supplier. Define these specialized operators by the displayed finite sums and coefficient functions, and prove independence of the double-coset representatives. Use the discriminant of the binary form consistently; the Legendre multiplier is zero when p divides the discriminant. Prove Z₂X₂=0, UX₂=0 and X₂³=X₂ in characteristic p.

(CG20, §§8.1–8.3, Theorem 8.1, Lemmas 8.3–8.6 and Definition 8.7, pp.856–859.)

Provide the following API for this object:

- `doublingOperators_coeff`: Give the U,Z,Z₂,X₂ coefficient formulas at each index.
- `doublingOperators_relations`: Prove Z₂=UZ, Z₂X₂=0, UX₂=0 and X₂³=X₂ over k.
- `doublingOperators_change_representatives`: Show Γ-equivariance makes the finite-sum Z action independent of coset representatives.

In NR4/ordinary-control, this object is used as follows: Uses the formal relations to control U on M and N. In NR4/cuspidal-vanishing, this object is used as follows: Reduces a kernel vector to explicit U and Z equations.

**Checks.**

- Over F₅, X₂ multiplies a coefficient of discriminant 1 by 1, of discriminant 2 by −1, and of discriminant 0 by 0.
- A series supported at pQ contributes its coefficient to a(UF;Q), not to a(UF;p²Q).
- The binary-form index with coefficients (1,0,p) is p-primitive but has discriminant divisible by p; these conditions must not be conflated.

The target is accepted when the following checks hold: Do not assert that every formal series is modular. The modularity of T and Q₂ is a separate supplied geometric result.

*Needs:* `AutomorphicBundles:B5`; `NR1 (the three nonregular hecke images)`.

### NR4.2 Theta operators with corrected weights

Import the scalar theta operator Θ with Fourier multiplier det(Q) and its injectivity in the range 2≤k≤p+1, p∤k(2k−1), excluding k=p−1. Import the vector operator θ₁ from weight (j,k) to (j+p−1,k+p+1) with coefficient con(a(F;Q)⊗Q), with no extra determinant factor. For the doubling use p>3 and p−1>j≥4, where θ₁ is injective on the required modular forms. These are supplier theorems, recorded here as the precise specialization needed for the kernel argument.

Request the geometric theta construction and its holomorphy, weight and injectivity from SiegelModularFormsModPn. Separate the scalar determinant multiplier from the vector contraction; the contraction is a nonzero integral transvectant in the valid coefficient range. Test Θ on the Hasse invariant to exclude the erroneous k=p−1 case; for the scalar-weight argument use precisely k=p+1.

(CG20, Proposition 8.9 and Theorems 8.10–8.11, pp.861–863, with the scalar Hasse exception and vector-formula correction.)

The target is accepted when the following checks hold: The vector contraction has no determinant prefactor, and all stated theta identities are in characteristic p.

*Needs:* `NR4 (formal operators in the doubling argument)`; `AutomorphicBundles:B5`.

### NR4.3 The source and enlarged q-expansion spaces

Let M be the q-expansions of the localized selected cuspidal weight-(j,2) k-space and let N be its Hasse embedding into a sufficiently regular modular-form space, viewed in the same formal coefficient space because h has expansion 1. Keep the finite-dimensional ambient Hecke-stable space and its U-generalized decomposition N=Nα⊕Nβ⊕N₀. Let πβ be the normalized idempotent projection onto Nβ. A power of U−α can have the same kernel in the relevant subspace, but is not defined to be πβ.

Use the q-expansion principle to regard Hasse multiplication as an inclusion of the same coefficient vectors. Enlarge to a finite-dimensional U-stable modular space before discussing generalized eigenspaces. Import the ordinary regular root calculation to prove that U(U−α)(U−β) acts nilpotently; use distinct α,β,0 to split N.

(CG20, §8.6, Theorem 8.13 and Lemmas 8.15–8.17, pp.864–870.)

Provide the following API for this object:

- `hasseSpaces_inclusion`: The source coefficient vector equals its Hasse-multiplied vector in N.
- `hasseSpaces_three_factors`: Decompose N as its α, β and zero generalized U-parts, with sum of normalized projections equal to 1.
- `hasseSpaces_projection_kernel`: Identify ker πβ as Nα⊕N₀ and give the corresponding kernel criterion for powers of U−α on the relevant ordinary subspace.

In NR4/kernel-equations, this object is used as follows: Supplies the exact decomposition of a vector killed by πβ. In NR4/doubling-injection, this object is used as follows: Defines the map whose injectivity is required.

**Checks.**

- A nilpotent Jordan block for U lies in N₀ even though its nonzero vectors need not be killed by U itself.
- On a β-eigenvector, πβ acts by 1; (U−α)ᵐ acts by (β−α)ᵐ, which need not equal 1.
- The construction records an ambient U-stable envelope instead of asserting U(M)⊂M.

The target is accepted when the following checks hold: The input M need not be U-stable; every use of U iteration must take place in its finite U-stable envelope.

*Needs:* `NR1 (joint ordinary root selectors)`; `NR3 (hasse shifts and the vanishing threshold)`; `NR4 (formal operators in the doubling argument)`; `mathlib:Module.End.genEigenspace`.

### NR4.4 Invertible Q₂ and the U-ordinary envelope

For the spaces M⊂N of NR4, use T=U+Z and, in characteristic p and weight (j,2), Q₂=Z₂ for j>2 and Q₂=Z₂+X₂ for j=2. If Q₂ is invertible on M, then for j>2 M is contained in the U-invertible part of N. For j=2, Z₂ is injective on M and its image is contained in the U-invertible part. The proof uses W=Σi≥0UⁱM, which is finite-dimensional and U-stable, and Z₂W⊂UW.

Enlarge M to W and use UZ=Z₂ with commutation of U and Z₂ to obtain Z₂W⊂UW, then iterate inside W. For j>2 use invertibility of Q₂=Z₂ to place M in ∩nUⁿW. For j=2 use X₂³=X₂, Z₂X₂=0 and the eigenvalue Q₂=αβ with (αβ)²≠1 to deduce injectivity of Z₂, before applying the same envelope argument.

(CG20, Lemma 8.15 and proof, pp.867–868; Lemma 8.16, p.868.)

The target is accepted when the following checks hold: Do not use Q₂-invertibility on a larger unrelated space; the envelope argument repairs the missing stability step.

*Needs:* `NR4 (the source and enlarged q-expansion spaces)`; `NR4 (formal operators in the doubling argument)`.

### NR4.5 Contraction on all Fourier indices

For j≥4 in the theta range, prove the formal characteristic-p identity θ₁(ZF)=0 for every Γ-equivariant integral q-expansion of weight (j,2), including coefficients whose discriminant is divisible by p. This is the strengthened coefficient lemma needed to replace the incomplete all-coefficient step in CG20 Proposition 8.25. Its proof obligation is the integral transvectant equivariance identity: contraction of Sym^(j−2)(M)v against M·Q equals det(M) times the transported contraction of v against Q, in the exact dual-form convention, when det(M)=p.

Write the contraction in the chosen binary-form coordinates over Z localized away from the required factorial denominators. Verify the GL₂ covariance with the precise determinant-normalized action on indices and the dual/contraction conventions; reduce modulo p only after clearing justified denominators. Apply the identity term by term to the finite Z sum for every index, not only a minimal-discriminant coefficient. If this covariance identity does not supply the asserted all-index annihilation, retain the target as a gap and supply a correct replacement for the doubling theorem.

(CG20, Proposition 8.25, contraction claim and proof, pp.876–877; Proposition 8.9, p.861.)

The target is accepted when the following checks hold: This target is a proof obligation, not a claimed new proof of Proposition 8.25. A vanishing contraction at one chosen Fourier index does not imply θ₁F=0.

*Needs:* `NR4 (theta operators with corrected weights)`; `NR4 (formal operators in the doubling argument)`.

### NR4.6 The two constrained kernel systems

A nonzero kernel of πβ∘h on the selected source yields a nonzero constrained vector after simultaneous finite-dimensional spectral reduction. For j>2, take F with UF=αF, TF=(α+β)F and hence ZF=βF. For j=2, write F=Fα+F₀ with UFα=αFα, UF₀=0, X₂F=αβF₀ and ZF=βF+αF₀, while Q₂F=αβF. These are consequences for a reduced kernel vector, not equalities asserted on every generalized eigenvector.

Use the commuting selected Hecke action on the nonzero kernel to pass to a simultaneous eigenvector over a splitting field. In j>2 eliminate N₀ with the ordinary-envelope theorem and identify the remaining α-eigenvector. In j=2 retain the zero-root component and derive its X₂ and Z relations from the formal operators; never discard F₀ without proof.

(CG20, Lemma 8.17 and proof, pp.868–871.)

The target is accepted when the following checks hold: The scalar-weight system contains the extra αF₀ term; omitting it would falsely simplify the hardest case.

*Needs:* `NR4 (invertible q₂ and the u-ordinary envelope)`; `NR4 (the source and enlarged q-expansion spaces)`.

### NR4.7 Vanishing of constrained cuspidal vectors

Under the root condition and p−1>j≥4, a cuspidal vector satisfying UF=αF and ZF=βF vanishes, using NR4/contraction and theta injectivity. In weight (2,2), a cuspidal vector satisfying the full scalar system of NR4/kernel-equations also vanishes. The planned statement is restricted to cusp forms, so the minimal-discriminant argument starts with a positive-definite coefficient and does not assume a nonzero discriminant for an arbitrary noncuspidal series.

For j>2 use βθ₁F=θ₁ZF=0 and β≠0, then the imported vector theta injectivity. The all-index contraction obligation must be discharged first. For the scalar case show coefficients at nonsquare discriminants vanish by the Z-neighbor relation and β²≠1; handle p-divisible discriminants via a minimal positive discriminant and a p-primitive neighbor argument. Represent the scalar difference F−X₂F in weight (p+1,p+1) by hF−hQ₂F+Q₂(hF), then use the scalar theta injectivity at k=p+1. Do not claim that X₂F is modular of weight (2,2). Conclude F=X₂F; UX₂=0 and the retained scalar kernel relations, together with (αβ)²≠1, force F=0. Neighbor cycles and Lemma 8.24 supply checks on the coefficient recurrence, not a substitute for all-index contraction.

(CG20, Theorem 8.22 and §§8.7–8.9, pp.873–877, with the cuspidal restriction and scalar correction.)

The target is accepted when the following checks hold: The theta weight is exactly p+1 in the scalar step; an arbitrary large Hasse shift is not interchangeable with it. The scalar p-primitive/minimal-discriminant recurrence remains an explicit verification obligation.

*Needs:* `NR4 (the two constrained kernel systems)`; `NR4 (contraction on all fourier indices)`; `NR4 (theta operators with corrected weights)`.

### NR4.8 The two Hasse-projection injections

For cuspidal weight (j,2), j=2 or 4≤j<p−1, residual roots satisfying NR0 and the chosen non-Eisenstein eigensystem, the maps from the selected source to the regular β-part given by e′β∘Aˢ are injective, and likewise with α and β exchanged. This holds at the stated finite coefficient quotients after lifting the residual injectivity through the torsion filtration. It is conditional on the corrected Fourier contraction and scalar kernel obligations recorded in NR4.

Reduce a nonzero kernel modulo ϖ to the constrained systems of NR4/kernel-equations. Apply cuspidal kernel vanishing in the two distinct weight regimes. Lift injectivity using successive ϖ-torsion layers and repeat after exchanging the roots. Use these actual composite injections, rather than bare Hasse multiplication, to obtain the selected image-algebra quotient maps.

(CG20, Theorem 8.13, pp.864–865; reduction pp.867–873; proof completed pp.874–877.)

The target is accepted when the following checks hold: Both root-labelled injections are required by the unramified-plane argument; a single ordinary line is insufficient.

*Needs:* `NR4 (vanishing of constrained cuspidal vectors)`; `NR3 (selected annihilator quotients)`.

### Examples

Over F₅, X₂ multiplies a coefficient of discriminant 1 by 1, of discriminant 2 by −1, and of discriminant 0 by 0.

### Dependencies

This layer uses `AutomorphicBundles:B5`, `GSp4NonregularModularityLifting:NR1`, `GSp4NonregularModularityLifting:NR3`.

Its direct proof gates are Siegel mod-ϖᵐ geometric operators; All-index contraction and scalar kernel proof. The full contracts are stated below.

## Layer NR5: Nonregular Hecke-valued minimal deformations

Use the two independent ordinary lines in the same reconstructed representation to obtain its invariant unramified isotropic two-plane. Construct compatible selected finite-quotient Galois deformations, normalize the full multiplier and pass to the inverse limit. Verify every minimal local condition before invoking the universal classifying map.

### NR5.1 The unramified ordinary two-plane

Over each selected finite Hecke quotient in weight (a,2), the regular α- and β-ordinary constructions yield two unramified rank-one local subrepresentations whose reductions are the two specified independent residual lines. They span a rank-two direct summand, invariant and unramified at p, and the symplectic pairing vanishes on it. Thus the two lines yield the precise ordinary local condition in CG20 Definition 4.6(6), not just two unrelated subquotients.

Use the two selected quotient maps to identify the global Galois representation uniquely, then regard both local lines inside this same representation. Residual independence and Nakayama imply that their sum is a direct summand; verify compatibility with coefficient quotient transitions. Use the fixed symplectic multiplier and the residual tame-character separation ensured by p−1>a to prove isotropy. Identify the quotient characters by the pairing and preserve the source ordinary ordering.

(CG20, Theorem 6.17 and proof, pp.845–846.)

The target is accepted when the following checks hold: Two unramified characters appearing only as semisimplified constituents do not suffice; actual stable submodules and their independence are required.

*Needs:* `NR4 (the two hasse-projection injections)`; `NR3 (regular-weight hecke-valued galois representation)`; `NR0 (nonregular lifting data)`; `IntegralHeckeAndGaloisDeterminants:IHG.1`.

### NR5.2 Minimal Galois deformation over the singular Hecke algebra

For a CG lifting datum and every labelled Q, construct a continuous rσ,m:GQ→GSp₄(Tσ(Q)αβ_m), σ=(a,2), lifting r̄, matching the good-prime spin polynomials and satisfying the fixed-multiplier minimal deformation condition outside Q. This includes the split unramified two-plane at p, weakly minimal inertia away p, unramifiedness at q, and inverse scalar inertia on the two isotropic Q-planes. Consequently the universal minimal-outside-Q ring RQ maps to this Hecke image. The theorem depends on the corrected doubling argument.

Construct representations over the selected O/ϖᵐ image quotients by the two regular comparisons and absolute-irreducible reconstruction. Normalize the full multiplier with the compatible finite-character square root, which uses p odd. Check the p-condition via the actual two-plane theorem; check each away-p condition via the regular local representation and the finite scalar twist. Use uniqueness and compatible quotient actions to take the inverse limit, then invoke the supplied universal property of RQ.

(CG20, Theorem 6.17, pp.845–846; Definition 4.6, pp.815–816.)

The target is accepted when the following checks hold: Do not identify a torsion-ring representation merely from a characteristic-zero product embedding. The ring map is not yet an isomorphism.

*Needs:* `NR5 (the unramified ordinary two-plane)`; `NR3 (selected annihilator quotients)`; `NR3 (central characters and residual galois systems)`; `GlobalGaloisDeformations:G7`; `LocalGaloisDeformationRings:L7`; `IntegralHeckeAndGaloisDeterminants:IHG.4`.

### Examples

For roots 2 and 3 over F₁₁, the two residual unramified lines are independent. Lifts of their generators therefore extend to a basis over each local Artin Hecke quotient by Nakayama, so their sum is a rank-two direct summand. Independence is essential: two copies of the same residual line give no such conclusion. Isotropy still uses the multiplier and the nontrivial residual cyclotomic separation, rather than this basis calculation alone.

### Dependencies

This layer uses `GSp4NonregularModularityLifting:NR0`, `GSp4NonregularModularityLifting:NR3`, `GSp4NonregularModularityLifting:NR4`, `GlobalGaloisDeformations:G7`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `LocalGaloisDeformationRings:L7`.

Its direct proof gates are All-index contraction and scalar kernel proof. The full contracts are stated below.

## Layer NR6: Klingen Taylor–Wiles level control

Construct the labelled Klingen block projector. Prove the high-weight integral pullback/trace comparison, with inverse (tr∘pr_Q∘i)⁻¹∘tr rather than the degree-normalized trace, descend through Hasse and secondary-Hasse strata with explicit H¹ reverse induction, and induct over O/ϖᵐ before passing to E/O. Separate this degree-zero comparison from the BCGP21 derived comparison and module-coinvariant supplier interface.

### NR6.1 Klingen block projector and trace

For the labelled roots of NR0/tw-refinement, let Rx=(xUx,2−α′xγ′x)(xUx,2−β′xδ′x)(xUx,2−γ′xδ′x), and let prx be the compatible factorial-power projector of Rx onto its unit factors. Put prQ=∏x∈Qprx and define the level-raising map prQ∘i from hyperspecial to Klingen level. Let m be the maximal ideal generated by m∅, xUx,2−α′xβ′x, Ux,1−α′x−β′x and ⟨u⟩−1 for u∈ΔQ; without the diamond generators the quotient is only a finite k[ΔQ]-algebra. Use Rx consistently; an undefined R′x is not a separate operator.

Evaluate each polynomial factor on the possible Klingen Satake blocks using the supplied local calculation. Use the root and product separations to distinguish the desired unit block; apply the upstream factorial-power construction. Prove compatibility with pullback and trace and multiplicativity across different x.

(CG20, Theorem 7.2 and definition of prx, p.847.)

Provide the following API for this object:

- `klingenProjector_idempotent`: prQ squares to itself and commutes with good Hecke operators and the diamonds.
- `klingenProjector_empty`: For Q=∅, prQ is the identity.
- `klingenProjector_block`: The image is exactly the labelled Klingen block, with all other Satake blocks killed.

In NR6/tw-comparison, this object is used as follows: Defines the map and the inverse trace on its selected image. In NR8/patching-datum, this object is used as follows: Identifies the augmented diamond-level module with the base module.

**Checks.**

- The empty product gives the identity and the original residual ideal.
- If αxβx=γxδx, the selected block calculation loses its required separation; reject this refinement.
- For two distinct auxiliary primes the projectors commute and pr{x,y}=prx·pry.

The target is accepted when the following checks hold: The ideal m is the labelled block lying over the given residual system, not an arbitrary maximal ideal of the enlarged Hecke algebra. The diamond operators act trivially on H⁰(X₀(Q),·) and unipotently on the p-power covers, so adding ⟨u⟩−1 changes none of the localizations used later.

*Needs:* `NR0 (klingen taylor–wiles refinements)`; `NR1 (the three nonregular hecke images)`; `IntegralHeckeAndGaloisDeterminants:IHG.2`.

### NR6.2 High-weight Klingen level comparison

For sufficiently regular shifted weight and the labelled non-Eisenstein block, prQ∘i is an isomorphism on cuspidal H⁰ at the base and Klingen levels. Its inverse is v_Q⁻¹∘tr, where v_Q=tr∘prQ∘i is a p-adic limit of spherical Hecke operators at the primes of Q and is congruent to 1 modulo m∅ under the Taylor–Wiles labelling; d_Q⁻¹tr, with d_Q=[K:K₀(Q)] the degree of X₀(Q)→X, is not an inverse. At each x the characteristic-zero no-newforms calculation is the Genestier–Tilouine Klingen result used by CG20; its integral extension uses torsion-freeness and cohomology/base-change in the vanishing range.

Request the exact local Klingen invariant-vector and eigenvalue computation, not a general Satake theorem alone. Apply regular-weight cohomological vanishing and identify the integral lattice in the characteristic-zero decomposition. Show that v_Q=tr∘prQ∘i lies in the completed spherical Hecke algebra at Q, compute it modulo m∅ from the regular residual Satake parameters (each prime contributes d_x·(1/4)≡1, using x≡1 mod p), and deduce that v_Q⁻¹∘tr is an O-integral inverse commuting with h.

(CG20, Theorem 7.3 and proof, pp.847–848, invoking Genestier–Tilouine Proposition 11.1.2; inverse corrected as in design E25.)

The target is accepted when the following checks hold: A characteristic-zero isomorphism alone does not give the integral comparison. In the GL₂ analogue (q+1)⁻¹tr(prα f)=(qα−β)f/((q+1)(α−β)), which is not f; the degree-normalized trace is not the inverse.

*Needs:* `NR6 (klingen block projector and trace)`; `NR3 (hasse shifts and the vanishing threshold)`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.4`; `AutomorphicBundles:B5`.

### NR6.3 Descent through the nonordinary strata

For the same levels and block, the comparison holds on H⁰ over k in all required weights, on the relevant nonordinary divisor sections, and on H¹ over k, with the inverse v_Q⁻¹∘tr of NR6/high-comparison. Use the h multiplication sequences and a secondary Hasse invariant on the nonordinary locus. Multiplication by h is injective on H⁰ because each connected component of the smooth special fibre is integral and h is nonzero on it; multiplication by the secondary invariant is injective because the nonordinary locus is a Cartier divisor in a smooth threefold, without embedded components, and the invariant is nonzero on each irreducible component. Smoothness alone does not imply irreducibility. The H¹ comparison is proved by reverse induction from the high-weight vanishing range.

Use a cartesian Hasse multiplication square and injectivity of q-expansions to descend the H⁰ comparison. Apply the secondary Hasse multiplier on the nonordinary divisor; verify its nonzerodivisor property component by component. Write the two long exact sequences at consecutive Hasse-shifted weights. With H⁰ and divisor H⁰ comparisons established and high-weight H¹=0, descend the H¹ comparison through the exact sequence; do not assert it directly from H⁰.

(CG20, Lemmas 7.4–7.6 and proofs, pp.848–850.)

The target is accepted when the following checks hold: Keep the geometric secondary-Hasse input explicit until its supplier is defined. The reverse induction must name the starting vanishing weight and every group used by the five-lemma argument.

*Needs:* `NR6 (high-weight klingen level comparison)`; `NR3 (hasse shifts and the vanishing threshold)`; `AutomorphicBundles:B3`; `AutomorphicBundles:B5`.

### NR6.4 Finite-level Taylor–Wiles comparison

For every m≥1, prQ∘i gives the labelled-block isomorphism on H⁰(X,ω(μ)(−D)O/ϖᵐ) and H⁰(X₀(Q),ω(μ)(−D)O/ϖᵐ), with inverse v_Q⁻¹∘tr (not d_Q⁻¹tr). Passing to the direct limit yields the E/O comparison of CG20 Theorem 7.2. BCGP21 Proposition 7.9.8 supplies a separate ordinary-module coinvariant comparison under its own setup; its proof uses derived cohomological comparisons. Neither that proposition nor this degree-zero theorem is exported here as an unrestricted all-degree isomorphism.

For m=1 use the established H⁰ comparison and the H¹ comparison over k. For m>1 use the exact coefficient sequence 0→k→O/ϖᵐ→O/ϖᵐ⁻¹→0 and the two long exact cohomology sequences, with the H¹ control needed to compare the connecting maps. Check compatibility with the transition maps, then pass to E/O and dualize only after recording the direction of the maps.

(CG20, Theorem 7.2, p.847; proof pp.850–851; Appendix A.3.2, Lemma A.6, pp.887–888; BCGP21, Hypothesis 7.8.1, pp.211–212; Proposition 7.9.8, pp.222–223.)

The target is accepted when the following checks hold: The degree-one input cannot be omitted from the induction. Do not label this result an all-degree isomorphism.

*Needs:* `NR6 (descent through the nonordinary strata)`; `NR6 (klingen block projector and trace)`.

### Examples

The empty product gives the identity and the original residual ideal.

### Dependencies

This layer uses `AutomorphicBundles:B3`, `AutomorphicBundles:B5`, `GSp4NonregularModularityLifting:NR0`, `GSp4NonregularModularityLifting:NR1`, `GSp4NonregularModularityLifting:NR3`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.4`.

Its direct proof gates are Siegel mod-ϖᵐ geometric operators; Local paramodular and Klingen interfaces. The full contracts are stated below.

## Layer NR7: Coherent defect and the selected balance gate

Identify the dual cuspidal module via L=ω(1,3−a) and supplied integral coherent duality. Deduce torsion-freeness from the appropriate H² vanishing and reduce whole-module balance to the supplied localized characteristic-zero dimension equality. The boundary/Arthur argument belongs to IntegralCoherentHeckeComplexes. State the additional integral p-idempotent and selected-rank obligations needed to prove balance of the αβ summand.

### NR7.1 The dual coherent Taylor–Wiles module

For L=ω(1,3−a) and a quotient Δ of ΔQ, define the coherent homology module MΔ=H₀(XΔ(Q),L)m as the O-dual of H⁰(XΔ(Q),ω(a,2)(−D)E/O)m via the supplied integral Serre duality convention. The bundle identity is ω³⊗L∨(−D)=ω(a,2)(−D). Put S=O[Δ]. Keep this full module distinct from its eαβ-summand. In the source range use p>a−2, with the stronger p−1>a imposed in the final theorem.

Import coherent homology, completed duals and integral Serre duality from the proposed integral coherent supplier. Calculate the two weights using the actual duality formula, including the cusp boundary. Transport the Hecke/diamond action with its contragredient convention and preserve the αβ labels.

(CG20, §7.2, p.851; Theorem 7.11, p.853, corrected duality bound.)

Provide the following API for this object:

- `dualModule_serre`: Identify MΔ with the specified dual cuspidal E/O-section space, including boundary and action conventions.
- `dualModule_diamonds`: Give its finite O[Δ]-module action and its augmentation maps.
- `dualModule_selected`: Identify the dual of the selected sections with the transported idempotent summand, after the action comparison is proved.

In NR7/whole-balance, this object is used as follows: Computes the defect over the diamond algebra. In NR8/patching-datum, this object is used as follows: The selected dual module becomes the balanced patching module.

**Checks.**

- For a=4, L=ω(1,−1), not ω(1,1).
- Replacing subcanonical sections by canonical sections requires the separate localized boundary theorem.
- For Δ=1, S=O and MΔ is the dual module at X₀(Q).

The target is accepted when the following checks hold: No theorem about balance of MΔ is silently inherited by an idempotent summand.

*Needs:* `NR0 (minimal tame levels and the neat auxiliary prime)`; `NR1 (the three nonregular hecke images)`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `AutomorphicBundles:B3`.

### NR7.2 H² vanishing and torsion-free coherent homology

Assume H²(X₀(Q),ω(a,2)(−D)k)m∅=0. Then H₁(X₀(Q),L)m is O-torsion-free by the supplied duality and coefficient sequence. For the balance calculation this vanishing is needed at X₀(Q), not at every intermediate XΔ(Q). For the final minimal theorem retain its stated uniform H² hypothesis for i=0,1 and all required Taylor–Wiles Q. The a≥4 vanishing theorem is imported with its full good-prime and weight hypotheses; in weight (2,2) this remains an assumption.

The coefficient sequence and H² vanishing imply divisibility of H¹ of the E/O-valued dualizing cusp bundle. Duality turns divisibility into absence of ϖ-torsion in H₁. Use the supplier vanishing theorem for a≥4 in its actual range. Do not infer full H² vanishing from an interior-cohomology expectation.

(CG20, Assumption 7.7, Remark 7.8 and Lemma 7.9, pp.851–852; Theorem 5.1, pp.822–823; Theorem 9.1(6), p.878.)

The target is accepted when the following checks hold: The uniform condition used in NR8 and the narrower condition used in the balance proof are separately recorded.

*Needs:* `NR7 (the dual coherent taylor–wiles module)`; `AutomorphicBundles:B3`.

### NR7.3 Defect reduction and whole-module balance

For S=O[Δ] and MΔ as in NR7, assume the H² vanishing at X₀(Q), the supplied Hochschild–Serre identification (MΔ)Δ≅H₀(X₀(Q),L)m and the surjection H₁(X₀(Q),L)m→Tor₁^S(MΔ,O). Let r=rankO H₀(X₀(Q),L)m. The defect dS(MΔ)=dimk(MΔ/mS MΔ)−dimk Tor₁^S(MΔ,k) is nonnegative if dimE H₁(X₀(Q),L)m,E≤r. The localized boundary/Arthur theorem supplies equality of the characteristic-zero dimensions. Hence the full MΔ is balanced, with all classification assumptions retained.

Use the supplied homological Hochschild–Serre low-degree exact sequence with its actual direction; bound the O-rank of the Tor term by the torsion-free H₁ rank. Reduce the S-module defect to the displayed characteristic-zero inequality using the precise Tor coefficient sequence from R03.5. Import localized subcanonical/canonical agreement, exclusion of Arthur types (b)–(f), the general-type limit-of-discrete-series contribution and dim H¹=dim H⁰ from IntegralCoherentHeckeComplexes. These moved targets are not replanned here.

(CG20, Theorem 7.11 and proof, pp.853–855; Lemma 7.10, pp.852–853, imported under the ownership amendment.)

The target is accepted when the following checks hold: Show the exact rank/defect calculation; a qualitative appeal to Hochschild–Serre is insufficient. This conclusion concerns the full module only.

*Needs:* `NR7 (h² vanishing and torsion-free coherent homology)`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `DeformationAndDerivedPatchingAlgebra:P9`; `ModularityAndLanglandsExtensions:ML.4`.

### NR7.4 Balance of the selected Hecke summand

Under the final lifting hypotheses prove dS(eαβMΔ)≥0. Required additional input: an integral eαβ action on the coherent complex or on H₀ and H₁, commuting with diamonds, duality and the Hochschild–Serre comparison, together with the characteristic-zero rank inequality on this very summand. Whole-module balance alone is insufficient. This is the unresolved selected-summand proof obligation in the final patching argument; the endpoint is conditional on it.

Construct the geometric normalized p-actions integrally in the needed degrees and compare their idempotents through duality and the cover spectral sequence. Apply the rank/defect calculation to the selected exact sequence, not to the full sequence followed by an unsupported inference. Either prove the selected characteristic-zero H¹/H⁰ inequality, or give an independent direct proof of selected-module balance. Until these steps are supplied, retain the conditional balance hypothesis in every theorem using this patching module.

(CG20, Theorem 9.1 proof, step (c), p.880; Theorem 7.11, pp.853–855.)

The target is accepted when the following checks hold: An abstract finite O[Δ]-module may have nonnegative total defect while a direct summand has negative defect. The generic idempotent-splitting theorem does not itself construct a geometric p-action in degree one.

*Needs:* `NR7 (defect reduction and whole-module balance)`; `NR1 (joint ordinary root selectors)`; `IntegralHeckeAndGaloisDeterminants:IHG.2`.

### Examples

For a=4, L=ω(1,−1), not ω(1,1).

### Dependencies

This layer uses `AutomorphicBundles:B3`, `DeformationAndDerivedPatchingAlgebra:P9`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `GSp4NonregularModularityLifting:NR0`, `GSp4NonregularModularityLifting:NR1`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `ModularityAndLanglandsExtensions:ML.4`.

Its direct proof gates are Integral coherent input and moved ownership; Selected summand balance; Classification input. The full contracts are stated below.

## Layer NR8: Conditional minimal lifting and examples

Assemble the GSp4 balanced patching datum, including its fixed-multiplier diamond-inertia identity and universal augmentation kernel. Deduce Rmin=T and positive-rank dual cuspidal freeness under the corrected proof gates, then the a≥4 and crystalline classical corollaries at the actual minimal level. Keep scalar-weight H² vanishing and the mod-2 illustration conjectural; check the Weil-restriction and local level examples with their exact limitations.

### NR8.1 The nonregular balanced patching datum

For qTW=dimk of the dual Selmer group, choose labelled QN of cardinality qTW with x≡1 mod pᴺ and a quotient ΔN≅(Z/pᴺ)^qTW. Let HN be the dual selected cuspidal module at the corresponding ΔN-cover; H is its base-level counterpart. The supplied presentation gives R∞=O[[x₁,…,x_(qTW−1)]]→RQN→Rmin, with qTW≥1 justified by the fixed-multiplier Selmer dimension formula. Equip HN with the compatible S_N=O[ΔN] and R∞ actions. Their augmentations identify (HN)ΔN≅H. The modules are finite balanced by NR7/selected-balance, conditional on its explicit proof obligation.

Take the exact CG fixed-multiplier Taylor–Wiles rings and presentation from the global supplier; do not substitute a GLn polarized problem with different real-place dimensions. For each QN use the nonregular Galois representation and the selected dual module to construct compatible actions. After the fixed-multiplier twist, inertia is diag(χ,χ,χ⁻¹,χ⁻¹) and χ⁻²=⟨u⟩. This proves the diamond action factors through the deformation-ring action. Identify the augmentation kernel using universal inertia matrix entries; scalar identities in the Hecke image alone do not prove the universal-ring assertion. Use the degree-zero level comparison for the coinvariants and the selected balance theorem for the defect condition.

(CG20, Theorem 9.1 proof, items (1)–(4), pp.879–880; Proposition 3.3, pp.811–812.)

Provide the following API for this object:

- `patchingDatum_diamond_action`: The two actions coincide via the universal scalar-inertia character with χ⁻²=⟨u⟩.
- `patchingDatum_augmentation`: Coinvariants of HN are H and the corresponding deformation specialization is Rmin.
- `patchingDatum_balanced`: Supply finite presentation and nonnegative defect for every HN, together with the named selected-balance hypothesis.

In NR8/minimal-rt, this object is used as follows: Checks the three hypotheses of the imported balanced patching theorem.

**Checks.**

- The inertia multiplier of diag(χ,χ,χ⁻¹,χ⁻¹) is 1 in the prescribed paired ordering.
- The untwisted shape diag(1,1,⟨u⟩,⟨u⟩) has multiplier ⟨u⟩ and cannot represent the fixed-multiplier datum.
- At the trivial diamond character χ=1 near the residual identity for p odd, so auxiliary scalar inertia disappears.

The target is accepted when the following checks hold: Verify the exact diamond-inertia exponent and that augmentation recovers Rmin. The finite modules may have torsion; no unproved global torsion-free Hecke-ring claim is used.

*Needs:* `NR5 (minimal galois deformation over the singular hecke algebra)`; `NR6 (finite-level taylor–wiles comparison)`; `NR7 (balance of the selected hecke summand)`; `GlobalGaloisDeformations:G7`; `GlobalGaloisDeformations:R04.5`; `DeformationAndDerivedPatchingAlgebra:R03.5`.

### NR8.2 Conditional minimal R = T and freeness

For a CG lifting datum, the uniform hypothesis H²(Xi(Q),ω(a,2)(−D)k)m∅=0 for i=0,1 and all required labelled Q, the classification input and the corrected doubling and selected-balance proof obligations, the classifying map Rmin→Tσ(∅)αβ_m is an isomorphism. The O-dual of H⁰(X,ω(a,2)(−D)E/O)αβ_m is a finite free module over this Hecke algebra. Its rank is positive because Katz modularity supplies a nonzero residual selected section. All conditional inputs are part of the theorem contract.

Apply the imported balanced-module patching theorem with the verified ring-action, augmentation and defect data. Obtain freeness over Rmin; use the nonzero residual module to rule out rank zero. The Hecke image acts faithfully by definition; a positive free Rmin-module has faithful Rmin-action, so the surjective classifying map has zero kernel and Rmin=T.

(CG20, Theorem 9.1, pp.878–879; proof pp.879–880.)

The target is accepted when the following checks hold: Keep the two unresolved proof obligations and classification hypotheses in the endpoint; do not mark weight (2,2) unconditional.

*Needs:* `NR8 (the nonregular balanced patching datum)`; `NR1 (katz modularity in weight (a,2))`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `DeformationAndDerivedPatchingAlgebra:P9`.

### NR8.3 The a≥4 minimal theorem

For 4≤a<p−1 in the same fixed-multiplier residual setting, the supplied coherent vanishing theorem discharges the uniform H² hypothesis. With the corrected doubling, selected-balance and classification inputs, deduce minimal R=T and dual cuspidal freeness at the §6.3 level, including q. Absolute irreducibility and the global cyclotomic multiplier remain hypotheses. Neatness may be deduced from CG Assumption 4.1(H1) with its explicit scalar witness, rather than added to the introduction theorem without explanation.

Check that the vanishing range covers both levels and every Q used by the patching construction. Give the neatness witness from the cyclotomic/ad⁰ field condition, or retain Assumption 4.2 if that implication has not been established in the supplier interface. Identify the actual §6.3 level and cuspidal Hecke image in the introduction notation.

(CG20, Theorem 1.2, p.803; Theorem 9.1, pp.878–880; Assumption 4.2, p.813.)

The target is accepted when the following checks hold: No unspecified level N(r̄) replaces the actual q-enlarged minimal level.

*Needs:* `NR8 (conditional minimal r = t and freeness)`; `NR7 (h² vanishing and torsion-free coherent homology)`.

### NR8.4 Arithmetic examples and excluded conjectures

Check the level recipe on the source genus-two Jacobian example: Iwahori at 5 and paramodular at 3 and 19. Its proposed nonliftable mod-2 weight-(2,2) class is an illustration of conjectural modularity, not an application of the odd-p minimal theorem. The exceptional S₆≅Sp₄(F₂) identification is imported from finite classical-group theory. For Res_K/Q(E), with K imaginary quadratic and E non-CM, the eventual big-image illustration requires E and its conjugate to be nonisogenous over K̄. Weight-(2,2) interior-H² vanishing and the Hecke-ring torsion-freeness expectation remain unproved and unused.

Separate the arithmetic level calculation from the conjectural existence of a mod-2 modular eigensystem. Import the finite-group exceptional isomorphism rather than construct it in the lifting roadmap. Request the Weil-restriction open-image theorem from its proposed owner, with geometric nonisogeny. Use the two regular root lines and the zero-root factor to explain the scalar-weight tripling phenomenon without asserting classicality of every p-adic lift.

(CG20, Remark 4.12, pp.819–820; §5.4, pp.831–832; §1.2, p.804; Remark 6.14, p.842; Remark 8.18, p.871.)

The target is accepted when the following checks hold: A mod-2 illustration cannot be used to test a p≥5 lifting theorem. Do not introduce a dependency from the classification registry ML.0 back to this endpoint.

*Needs:* `NR0 (minimal tame levels and the neat auxiliary prime)`; `NR8 (conditional minimal r = t and freeness)`; `ArithmeticGaloisRepresentations:G7`.

### NR8.5 Classical modularity from the minimal theorem

Let r:GQ→GSp₄(Q̄p) have a stable lattice with a CG residual lifting datum, ordinary crystalline local representation at p with Hodge–Tate multiset [0,0,a−1,a−1], and the corresponding minimal away-p ramification. For 4≤a<p−1 and the corrected theorem inputs, r is the Galois representation of a cuspidal Siegel eigenform of weight (a,2) at the stated minimal level. State the Hodge–Tate convention explicitly: ε has weight −1, so the representation with multiplier ε^(1−a) has weights 0,0,a−1,a−1. The good-prime Euler polynomials agree. Equality of every bad Euler factor requires the separate full local–global compatibility theorem.

Use the classifying O-valued point of Rmin and transport it through R=T. Pass from its characteristic-zero eigensystem to a cuspidal characteristic-zero section using coherent base change in the proved range; identify the attached representation by good-prime uniqueness. Use the assumed crystalline condition where Frobenius unit roots and the classical ordinary comparison require it. State the Euler-factor consequence only at the primes covered by the proved local comparison.

(CG20, Theorem 1.1, p.802; Theorem 9.1, pp.878–880, with the crystalline and level qualifications.)

The target is accepted when the following checks hold: Ordinary plus numerical Hodge–Tate weights is not a replacement for the required crystalline hypothesis.

*Needs:* `NR8 (the a≥4 minimal theorem)`; `NR2 (qualified crystalline specialization)`; `AutomorphicLFunctionsAndLocalFactors:AL.4`.

### Examples

The inertia multiplier of diag(χ,χ,χ⁻¹,χ⁻¹) is 1 in the prescribed paired ordering.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations:G7`, `AutomorphicLFunctionsAndLocalFactors:AL.4`, `DeformationAndDerivedPatchingAlgebra:P9`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `GSp4NonregularModularityLifting:NR0`, `GSp4NonregularModularityLifting:NR1`, `GSp4NonregularModularityLifting:NR2`, `GSp4NonregularModularityLifting:NR5`, `GSp4NonregularModularityLifting:NR6`, `GSp4NonregularModularityLifting:NR7`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:R04.5`.

Its direct proof gates are Selected summand balance; Arithmetic and finite-group illustrations. The full contracts are stated below.

## Layer NR9: Ordinary p-adic lifting in families

Specialize Pilloni’s admissibility data, keeping its image conditions distinct and its ordered-flag discrepancy explicit. Import Hida horizontal control and generic deformation/defect-zero patching to prove ordinary variable-weight R=T and integral-weight specialization. Deduce ordinary cuspidal p-adic modularity and the parallel GL2-parabolic variant, without asserting classicality of singular specializations.

### NR9.1 Pilloni ordinary admissibility data

An ordinary admissibility datum in the P12 branch consists of p≥5, N prime to p, K⊃K(N), either K neat or p≥7, and an ordinary cuspidal eigenform f of weight κ₀ with its residual Galois system. Require absolute irreducibility (a strengthening of the source’s irreducibility wording), SYMP (the invariant nondegenerate bilinear similitude form is unique up to scalar and alternating), and the exact P12 §5.7 image conditions. These are ζp∉L₀ for the adjoint fixed field; for every m a four-distinct-root σ∈GQ(ζpᵐ) having eigenvalue 1 on every irreducible adjoint constituent; dim H⁰(GQ,gsp₄)=1 and H⁰(GQ,gsp₄(1))=0. Impose the well-ramified χℓ, ε₂, ε, TR local conditions and their chosen tame levels, and strong ordinarity for the ordered four local characters. Fix the flag orientation explicitly before identifying the automorphic and deformation versions.

Specialize the supplier residual pairing, ordinary flags and local deformation conditions; do not identify these image conditions with CG20 H1–H3. At χℓ primes use two isotropic inertia-character planes, χℓ nontrivial and ℓ−1 prime to p, with strict Klingen level; ε₂ uses Klingen and ε uses Iwahori; TR requires irreducible inertia and p∤ℓ⁴−1. The automorphic definition excludes λ̄r/λ̄r′ equal to 1 or ε̄ for r>r′; the deformation paragraph prints the reverse index direction. Record and resolve that orientation discrepancy in the supplier comparison rather than treating the two predicates as identical.

(P12, Definitions 3.2–3.3, p.14; Definitions 5.1–5.3, pp.19–20; §5.7, pp.23–24; §7.1, pp.35–36 (author pagination).)

Provide the following API for this object:

- `ordinaryAdmissible_seed`: Extract f, its actual level and its residual symplectic Galois representation.
- `ordinaryAdmissible_local`: Extract the inertia type and chosen compact subgroup at each bad prime.
- `ordinaryAdmissible_flag`: Give the ordered ordinary characters, their residual exclusions and the verified comparison between the automorphic and deformation orientations.

In NR9/ordinary-family-rt, this object is used as follows: Supplies the exact residual, local and Hida hypotheses for ordinary R=T. In NR9/parallel-family, this object is used as follows: Supplies the common residual assumptions for the GL₂-parabolic variant.

**Checks.**

- For p=5 retain neatness; for p=7 the source permits the stated alternative.
- CG20’s no-order-p-quotient condition is not substituted for P12’s H⁰ dimension condition.
- If λ̄r/λ̄r′=ε̄ but its inverse differs from ε̄, reversing r and r′ changes the predicate; the comparison must detect this.

The target is accepted when the following checks hold: This branch has no dyadic case and does not use the CG weight-(a,2) balanced module. Admissibility includes the actual automorphic seed, not only an abstract residual representation.

*Needs:* `ArithmeticGaloisRepresentations:G7`; `GlobalGaloisDeformations:G7`; `LocalGaloisDeformationRings:L7`; `HigherHidaAndColemanTheory:I3`.

### NR9.2 Variable-weight ordinary R = T

For a P12 admissibility datum with the flag-orientation comparison established, let R̃ be the supplied universal variable-weight ordinary minimal deformation ring and T̃ the localized ordinary cuspidal Hida Hecke image over its two-weight Iwasawa algebra Λ. The natural map R̃→T̃ is an isomorphism; T̃ is finite flat over Λ and the dual ordinary module M̃ is finite free over T̃. For every integral weight κ lifting the residual weight, T̃⊗Λ,κO→Tκ is an isomorphism. These are p-adic ordinary family conclusions, not a claim of classicality in every specialization.

Use the supplied horizontal Hida control theorem to build fixed-weight finite free O[ΔQ] modules and identify their augmentation with the base module. Verify the equality of diamond and universal-inertia actions, then apply the defect-zero Taylor–Wiles criterion supplied by the commutative-algebra roadmap. At each integral κ obtain fixed-weight Rκ=Tκ and freeness. Use finiteness, constant rank and density of integral weights over Λ to prove the family isomorphism, flatness and module freeness, without using the singular coherent balance theorem.

(P12, Theorems 7.1–7.2 and §7.3, pp.36–37 (author pagination).)

The target is accepted when the following checks hold: The source orientation discrepancy is a named hypothesis until the local comparison is verified.

*Needs:* `NR9 (pilloni ordinary admissibility data)`; `HigherHidaAndColemanTheory:I3`; `GlobalGaloisDeformations:G7`; `GlobalGaloisDeformations:R04.5`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `IntegralHeckeAndGaloisDeterminants:IHG.1`.

### NR9.3 Modularity as an ordinary p-adic form

Let ρ:GQ→GSp₄(O) have the same residual representation as the P12 seed, inertia isomorphic to the seed at every v∤p, and an ordinary local filtration of weight iκ′=(0,2−k₂′,1−k₁′,3−k₁′−k₂′), for integral κ′=(k₁′,k₂′). Under NR9/ordinary-family-rt, ρ is attached to a cuspidal ordinary p-adic eigenform f′ of weight κ′ and level K. Overconvergence, when supplied by ordinary analytic continuation, is recorded separately from classicality.

The local and residual conditions define an O-valued point of R̃ over κ′. Transport the point through R̃=T̃ and use Hida control to obtain the p-adic cuspidal eigenform. Identify the full Galois representation by absolute irreducibility and the good-prime polynomial identities. Use an actual analytic-continuation theorem if overconvergence is claimed.

(P12, Theorem 7.1, p.36; P20 introduction, author pp.5–6.)

The target is accepted when the following checks hold: For κ′=(2,2), the conclusion remains p-adic; the 2025 classicality branch needs additional geometric and multiplicity inputs.

*Needs:* `NR9 (variable-weight ordinary r = t)`; `HigherHidaAndColemanTheory:X8`; `LocalGaloisDeformationRings:L7`.

### NR9.4 Parallel-weight parabolic ordinary lifting

For a parallel-weight P12 seed and the corresponding GL₂-parabolic ordinary space, let Λ′ be its one-weight Iwasawa algebra and R̃′ the universal well-ramified ordinary deformation ring with its unique ordered flag satisfying λA,0|Ip=1 and λA,2/λA,1=ε. Then R̃′≅T̃′ is finite flat over Λ′ and M̃′ is finite free. A lift with seed inertia and parallel weight (0,2−k′,1−k′,3−2k′) is attached to a GL₂-parabolic ordinary cuspidal p-adic form of weight (k′,k′). Here GL₂ denotes the parabolic in the genus-two construction, not a change to a rank-two Galois representation.

Use the supplied parabolic horizontal-control theorem instead of the Borel Hida theorem. Impose the two explicit inertia-character relations in the same universal ordinary deformation framework. Repeat the fixed-weight and weight-density steps over Λ′, preserving the rank-four symplectic representation and the chosen tame level.

(P12, §7.4 and Theorem 7.3, pp.37–38 (author pagination).)

The target is accepted when the following checks hold: Do not transfer a regular-weight classicality assertion to the parallel singular specialization.

*Needs:* `NR9 (pilloni ordinary admissibility data)`; `NR9 (variable-weight ordinary r = t)`; `HigherHidaAndColemanTheory:I3`; `LocalGaloisDeformationRings:L7`.

### Examples

For p=5 retain neatness; for p=7 the source permits the stated alternative.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations:G7`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:R04.5`, `HigherHidaAndColemanTheory:I3`, `HigherHidaAndColemanTheory:X8`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `LocalGaloisDeformationRings:L7`.

Its direct proof gates are Pilloni flag orientation and edition comparison. The full contracts are stated below.

## Layer NR10: Characteristic-zero higher-Hida patching

Fix the distinct BCGP25 weight-two and integral-enormity data, including its dyadic neat-prime condition. Construct four localized higher-Hida modules and their two-direction torus diamonds, prove weight/diamond freeness, construct the full-multiplier deformation action (with the GSp₄ coefficient descent valid at p=2, BCGP25 Lemma 7.4.8) and the projective Satake coinvariant comparison. Apply a corrected open-ideal patching theorem to obtain local freeness at the characteristic-zero point; rank zero remains possible.

### NR10.1 Characteristic-zero weight-two patching data

A BCGP characteristic-zero datum consists of p≥2 and ρ:GQ→GSp₄(O), unramified outside finitely many primes, with multiplier ε⁻¹, absolutely irreducible residual representation, pure, ordinary semistable of weight two and p-distinguished at p, with a chosen p-stabilization (αp,βp). Require ρ(GQ(ζp∞)) integrally enormous in Definition 7.1.1, meaning absolute irreducibility on E⁴ and, for every simple E[H]-submodule W⊂E⊗ad⁰ with H=ρ(GQ(ζp∞)), existence of h∈H whose reduction has four distinct roots and whose action on W has eigenvalue 1. For p=2 require ρ̄(GQ(i))=ρ̄(GQ); for odd p require a regular-semisimple element in ρ̄(GQ) outside Sp₄(Fp). Choose the neat prime r>5 with ρ itself unramified at r, residual regular-semisimple Frobenius, r≢1 mod p if p is odd and r≢1 mod 4 if p=2. Order its symplectic Frobenius roots as αr,1,αr,2,rαr,2⁻¹,rαr,1⁻¹.

Specialize the global and local deformation objects with the exact weight-two ordinary semistable condition and chosen unramified plane. Use the integral enormous-image condition of this source, which is not ACC+ enormous image; the latter has different mod-p adjoint cohomology conditions and cannot be substituted at p=2. Choose the neat r under the appropriate odd/dyadic congruence and verify unramifiedness of ρ, not merely of ρ̄.

(BCGP25, Definitions 7.1.1–7.1.2 and Hypothesis 7.1.3, pp.152–154; Definition 7.4.1, p.167.)

Provide the following API for this object:

- `charZeroDatum_local`: Extract the ordinary semistable weight-two representation and ordered p-stabilization.
- `charZeroDatum_image`: Extract integral enormousness and the separate odd/dyadic residual image condition.
- `charZeroDatum_neatPrime`: Return r, the correct congruence, unramifiedness of ρ and the four ordered symplectic roots.

In NR10/multiplicity-modules, this object is used as follows: Determines the localized higher-Hida eigensystems and the local deformation ring. In NR11/rank-one, this object is used as follows: Supplies the running hypotheses, separately from an automorphic seed.

**Checks.**

- For p=2 use r≢1 mod 4, rather than the impossible condition r≢1 mod 2 for an odd r.
- A lift ramified at r is rejected even if its residual representation is unramified there.
- A verification of ACC+ residual enormousness does not establish the integral condition used here.

The target is accepted when the following checks hold: The definition is independent of CG20’s small-weight and odd-p conditions.

*Needs:* `ArithmeticGaloisRepresentations:G7`; `LocalGaloisDeformationRings:L7`; `GlobalGaloisDeformations:G7`; `PadicHodgeTheory:R06.2`.

### NR10.2 Four localized higher-Hida multiplicity modules

Let S={r}∪Ram(ρ) and retain its p-part, and choose tame compacts Kℓ (hyperspecial outside S, Iw₁(r) at r). At QN use Iwahori and pro-p-Iwahori levels, with ΔQN=∏ℓ∈QN((Fℓ×)(p))² modulo the fixed center convention. For each of the four genus-two Weyl chambers w separately, construct the higher-Hida dual module M_w and auxiliary M_N,w over ΛGSp₄,Q using (7.4.6), the partial central condition before the full character |·|², and localization at the common anemic ideal, the r-refinement and the p-ideal (Up,0−1,Up,1−αp,Up,2−αpβp). The two torus characters of the ordinary deformation define its Λ action.

Use the supplied four higher-Hida complexes and duality; impose exactly the stated central and smooth torus conditions. Localize successively at the good polynomial and central system, at the r-refinement, and at the normalized p-eigenvalues. At each QN identify the rank-two diamond torus per prime; do not reuse the rank-one Klingen diamonds of CG20. Keep all four w modules individually named through base change and patching.

(BCGP25, Definitions 7.4.2–7.4.3 and equations (7.4.4)–(7.4.6), pp.167–169.)

Provide the following API for this object:

- `multiplicityModule_chamber`: Give M_w and M_N,w for every one of the four chambers, with their Hecke and Λ actions.
- `multiplicityModule_refinement`: Identify the r- and p-localization through the displayed eigenvalue ideals.
- `multiplicityModule_central_basechange`: Compare partial central condition followed by full specialization with the module in (7.4.6).
- `multiplicityModule_diamonds`: Give the Λ[ΔQN]-action with two independent torus directions at each auxiliary prime.

In NR10/diamond-freeness, this object is used as follows: Provides the finite modules whose projectivity is proved. In NR11/classicality, this object is used as follows: Supplies one multiplicity for each of the four graded pieces.

**Checks.**

- There are four modules indexed by w; their ranks are not added before the classicality criterion.
- For a single Q-prime with p-part cyclic of order pᴺ, the torus diamond group has order p^(2N), subject to the stated center convention.
- Replacing the intermediate partial-central construction with an unsupported full-center eigenspace is not the same definition.

The target is accepted when the following checks hold: The fixed-center partial character condition is part of the construction; taking full central eigenspaces too early can destroy the projectivity argument.

*Needs:* `NR10 (characteristic-zero weight-two patching data)`; `HigherHidaAndColemanTheory:I3`; `HigherHidaAndColemanTheory:X8`; `IntegralHeckeAndGaloisDeterminants:IHG.2`.

### NR10.3 Freeness over weight and diamond algebras

For each w, M_w is finite free over Λ and M_N,w is finite free over Λ[ΔQN]. This uses the projectivity of the higher-Hida module after the partial central condition, and the specified subsequent base changes. It holds for p=2 as well as odd p; no averaging by the genus-two Weyl-group order 8 is used.

Import the finite projective complex/module theorem with the same torus and central conditions. Carry out the Λ[ΔQN] specialization through the supplied projectivity-compatible maps. Use the relevant complete-local semilocal decomposition to pass from projective to free on each localized coefficient factor.

(BCGP25, Lemma 7.3.8, p.167; Lemma 7.4.7, p.169.)

The target is accepted when the following checks hold: Finite freeness does not imply positive rank. No division by the Weyl order is valid in the dyadic case.

*Needs:* `NR10 (four localized higher-hida multiplicity modules)`; `HigherHidaAndColemanTheory:X8`; `DeformationAndDerivedPatchingAlgebra:R03.3`.

### NR10.4 Characteristic-zero auxiliary Hecke image

Define TSQ as the image of the abstract Hecke generators in EndΛ(M_N,w), using the localizations and full central character just specified; at Q=∅ denote it TS. It is the faithful action image, permitted to be the zero algebra before nonvanishing is proved. Retain the full central operator in the good-prime polynomial system. Compatibility with chamber duality is a comparison theorem, not a definition equating all four modules.

Take the actual endomorphism image rather than assert injectivity of the abstract Hecke algebra. Keep its Λ[ΔQN] structure and full central system, with zero-ring behavior allowed. Compare compatible changes of coefficients and level through the intertwining maps.

(BCGP25, Definition 7.4.9, p.170.)

Provide the following API for this object:

- `auxHeckeImage_faithful`: The image acts faithfully on its module, including the zero-ring/zero-module case.
- `auxHeckeImage_good_polynomial`: Give the complete good-prime polynomial and the full multiplier determined by the central character.
- `auxHeckeImage_level`: An equivariant module comparison induces the required map on the corresponding Hecke images.

In NR10/deformation-action, this object is used as follows: Is the target of the classifying deformation-ring map. In NR11/nonvanishing, this object is used as follows: Its support is compared with the deformation component through ρ.

**Checks.**

- For M_N,w=0 its endomorphism image is the zero ring; the construction remains defined.
- In odd residue characteristic, multipliers ν and −ν have the same square; a determinant identity alone does not identify the central character.
- Two Hecke generators differing by an element of the action kernel have equal images.

The target is accepted when the following checks hold: Nonvanishing of this image is a conclusion of NR11/nonvanishing.

*Needs:* `NR10 (four localized higher-hida multiplicity modules)`; `IntegralHeckeAndGaloisDeterminants:IHG.2`; `IntegralHeckeAndGaloisDeterminants:IHG.3`.

### NR10.5 Symplectic coefficient descent in every residue characteristic

Let S⊂R be complete local noetherian rings with m_R∩S=m_S and the same residue field k, of any characteristic, including 2. Let Γ be profinite and ρ:Γ→GSp₄(R) continuous, with ρ mod m_R absolutely irreducible, tr ρ(Γ)⊂S and multiplier ν∘ρ(Γ)⊂S^×. Then ρ is conjugate, by an element of GSp₄(R) congruent to 1 modulo m_R, to a representation with values in GSp₄(S) and the same multiplier.

Conjugate ρ by some B≡1 mod m_R into GL₄(S) by the GL coefficient descent of IntegralHeckeAndGaloisDeterminants Layer 1.5 ([CHT08] Lemma 2.1.10), which has no restriction on p; call the result ρ′. ρ′ and ν·(ρ′)^{−t} are S-valued, residually absolutely irreducible and have equal traces, so Carayol's lemma (same layer) gives A∈GL₄(S) intertwining them. Over R, Schur's lemma makes A an R^×-multiple of the transported form BJBᵗ, which is alternating; since S⊂R, A is alternating over S (zero diagonal, Aᵗ=−A). No division by 2 occurs. Choose a symplectic basis of the nondegenerate alternating S-form A (possible over any local ring) to conjugate ρ′ into GSp₄(S) with multiplier ν∘ρ. By Schur's lemma ([CHT08] Lemma 2.1.8) the composite conjugating element lies in GSp₄(R) and is congruent to 1 modulo m_R.

(BCGP25, Lemma 7.4.8 and proof, p.170 (arXiv v1).)

The target is accepted when the following checks hold: At p=2 this replaces the odd-p symplectic descent of IntegralHeckeAndGaloisDeterminants Layer 1.5, whose cited argument splits invariant forms into symmetric and alternating parts. The hypothesis that the multiplier is S-valued is used; for Hecke-valued representations it holds because the central Hecke operators lie in the Hecke image.

*Needs:* `IntegralHeckeAndGaloisDeterminants:IHG.1`.

### NR10.6 Deformation action on the higher-Hida modules

For every N,w construct the Λ[ΔQN]-algebra map RSQN→TSQN classifying the interpolated symplectic Galois representation with the full multiplier ε⁻¹ and the source’s local ordinary and tame conditions. The maps commute with augmentation to RS→TS and with the actions on M_N,w and M_w. At p=2 the descent step uses NR10/dyadic-descent (BCGP25 Lemma 7.4.8) in place of the upstream odd-p symplectic descent.

If the localized module is zero, use the unique algebra map to its zero image. Otherwise argue as in BCGP21 Theorem 7.9.4: the Hecke image embeds in a product of fields given by dense regular classical points, the product of their GSp₄-valued representations has traces and multiplier in the Hecke image (the central operators lie there), and NR10/dyadic-descent descends it to the Hecke image for every p. Verify ordinary local characters and every tame local deformation condition, then apply the universal property. Check the two diamond actions agree and pass to the full-center specialization. At p=2 no further supplier is needed for the descent: NR10/dyadic-descent holds in residue characteristic 2.

(BCGP25, Lemma 7.4.8 and Proposition 7.4.10 with proof, p.170.)

The target is accepted when the following checks hold: Dense field-valued points do not automatically provide an integral GSp₄-valued representation over a nonreduced ring.

*Needs:* `NR10 (characteristic-zero auxiliary hecke image)`; `NR10 (symplectic coefficient descent in every residue characteristic)`; `NR2 (ordinary weight-two galois representation)`; `GlobalGaloisDeformations:G7`; `LocalGaloisDeformationRings:L7`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `IntegralHeckeAndGaloisDeterminants:IHG.4`.

### NR10.7 Projective Satake comparison and diamond coinvariants

On the regular residual Satake block, use the projective finite-group module comparison of Lemmas 7.4.11–7.4.12 to identify spherical and selected Iwahori invariants without dividing by 8. After partial-central specialization and then the full central character, (M_N,w)ΔQN≅M_w equivariantly for RSQN→RS. This is the exact augmentation comparison required in Hypothesis 7.2.1(4).

Apply the norm/invariants/coinvariants comparison only to the supplied projective finite-group module. Calculate the regular Satake block at each auxiliary prime and verify that the selected character factor is the spherical one. Impose the central conditions in the order used by the projectivity theorem, then identify the augmented Hecke and Galois actions.

(BCGP25, Lemmas 7.4.11–7.4.12, pp.171–172; Lemma 7.4.15, p.173.)

The target is accepted when the following checks hold: A blanket assertion that invariants commute with quotient or base change is not valid here.

*Needs:* `NR10 (freeness over weight and diamond algebras)`; `NR10 (deformation action on the higher-hida modules)`; `SmoothRepresentationsOfLocalGroups:SR.4`; `HigherHidaAndColemanTheory:X8`.

### NR10.8 Characteristic-zero local freeness

Let q⊂RS be the characteristic-zero prime defined by ρ. For each w, (M_w)q is a finite free (RS)q-module, with rank possibly zero. Apply the abstract characteristic-zero patching theorem to the finite Λ[ΔN]-free modules with compatible augmentation. Its proof must use a cofinal system of open ideals suitable for both the weight variables and diamond variables, a constructed compatible action of the patched deformation ring, the cotangent bound, and a justified lift through the completed regular local ring. These extra proof obligations are recorded explicitly; the printed assertion that powers of the augmentation ideal alone form the needed cofinal system is insufficient.

Request the corrected abstract patching construction from the commutative-algebra owner, with open ideals containing weight/maximal-ideal powers and large enough diamond kernels. Construct the ring action before using the patched module; compare the quotient topology with the module topology. At q invert p, use the bounded relative cotangent module to get the completed-ring surjection. Justify the S∞-algebra lift and the dimension/depth calculation with the same coefficient ring. Apply Auslander–Buchsbaum and specialize the augmentation to obtain finite local freeness. Do not infer automorphy, positive support, global freeness or rank one at this stage.

(BCGP25, Hypothesis 7.2.1, Lemma 7.2.2 and Proposition 7.2.3, pp.161–163; Proposition 7.4.16, p.174.)

The target is accepted when the following checks hold: The proof obligations on the patched ring action and lift remain open supplier contracts; this target is conditional on them.

*Needs:* `NR10 (projective satake comparison and diamond coinvariants)`; `DeformationAndDerivedPatchingAlgebra:R03.3`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `DeformationAndDerivedPatchingAlgebra:R03.6`; `LocalGaloisDeformationRings:L7`.

### Examples

For p=2 use r≢1 mod 4, rather than the impossible condition r≢1 mod 2 for an odd r.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations:G7`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `GSp4NonregularModularityLifting:NR2`, `GlobalGaloisDeformations:G7`, `HigherHidaAndColemanTheory:I3`, `HigherHidaAndColemanTheory:X8`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `LocalGaloisDeformationRings:L7`, `PadicHodgeTheory:R06.2`, `SmoothRepresentationsOfLocalGroups:SR.4`.

Its direct proof gates are Corrected characteristic-zero patching. The full contracts are stated below.

## Layer NR11: Rank one and classical weight-two lifting

Define the two-wall R-regular weight condition and compute multiplicity one only at nonzero regular points on the relevant component. Retain all five conditions of each dyadic/odd automorphic-seed alternative. Prove support through the singular point using the appropriate regular ordinary lifting and solvable descent suppliers, then rank one separately in all four chambers. Apply the image/de Rham/four-multiplicity higher-Coleman criterion to deduce classical weight-two modularity, retaining all unresolved proof gates.

### NR11.1 R-regular classical weights

For an integer parameter R≥1 and ordered integral Hodge–Tate weights h₁,h₂ of the two ordinary torus characters, RRegularWeight(R,h₁,h₂) means h₂−h₁≥R and 1−2h₂≥R. For a weight-space point also require that the two inertia characters are algebraic with these weights. The light numerical predicate is separate from the existence of those algebraic characters.

Use a positive natural bound R and the existing integer carrier for the two inequalities; transport the resulting condition to the supplied weight-space characters. Derive monotonicity in R and preserve the order of the two characters.

(BCGP25, Definition 7.5.7, p.176.)

Provide the following API for this object:

- `rRegularWeight_iff`: Unfold the predicate into its two exact integer inequalities.
- `rRegularWeight_mono`: If 1≤R′≤R then R-regular implies R′-regular.
- `rRegularWeight_weightSpace`: A supplied algebraic weight-space point is R-regular precisely when its ordered Hodge–Tate pair satisfies the numerical predicate.

In NR11/regular-multiplicity, this object is used as follows: Defines the sufficiently regular points at which classical control computes multiplicity. In NR11/nonvanishing, this object is used as follows: Selects a dense classical set on the relevant deformation components.

**Checks.**

- For R=3, h₁=−4,h₂=−1 satisfy both inequalities with equality.
- For R=3, h₁=0,h₂=3 satisfies the first inequality but fails the second.
- Swapping (−4,−1) to (−1,−4) fails the first inequality for R=3.

The target is accepted when the following checks hold: Do not replace the second inequality by a difference of the weights, or apply the predicate to arbitrary smooth characters.

*Needs:* `NR10 (characteristic-zero weight-two patching data)`; `HigherHidaAndColemanTheory:A0`.

### NR11.2 The dyadic and odd-prime automorphic seeds

For NR10 data require one of two seed alternatives. A: p=2, a solvable CM extension F/Q and ordinary RACSDC π on GL₄/F with r̄π,2≅ρ̄|GF, nearly adequate residual image over F, a residual regular-semisimple element there, a strongly residually odd polarized pair (ρ̄|GF,1) at an infinite place of F⁺, and ρ̄(GQ(i))=ρ̄(GQ). B: p>2, an ordinary cuspidal GSp₄/Q seed π with central |·|² and ρ̄π,p≅ρ̄, GSp₄-reasonable and tidy residual representation, a regular-semisimple element outside Sp₄(Fp), and compatible p-stabilizations such that the seed local representation lies on a unique ordinary component and ρ lies on that same component. The initial matching is residual, not equality of the target p-adic representation with an automorphic one.

Use the residual image and polarized-oddness notions from their supplier APIs with their actual coefficient fields. Record all five conditions in each alternative and the exact residual restriction field. In alternative B include the unique-component property for the seed local representation in addition to shared component membership.

(BCGP25, Proposition 7.5.10, hypotheses (A1)–(A5) and (B1)–(B5), p.177.)

Provide the following API for this object:

- `automorphicSeed_cases`: Expose exactly the dyadic A or odd-prime B alternative, retaining all five conditions.
- `automorphicSeed_residual_match`: Return the specified residual isomorphism over GF or GQ, as appropriate.
- `automorphicSeed_component`: In B return the unique seed ordinary component and membership of the target point on it.

In NR11/nonvanishing, this object is used as follows: Supplies the regular automorphy-lifting and solvable-descent input needed to put the component through q in Hecke support.

**Checks.**

- A seed with matching residual system but different characteristic-zero Hecke eigenvalues may satisfy the initial matching condition.
- Shared membership on one of several seed components does not meet B5’s unique-component clause.
- The p=2 seed is rejected when A4 is absent even if residual matching and near adequacy hold.

The target is accepted when the following checks hold: Do not strengthen residual matching to p-adic matching in a way that would assume the conclusion. Nearly adequate, reasonable and tidy are separate imported predicates with definition-level supplier requests.

*Needs:* `NR10 (characteristic-zero weight-two patching data)`; `ArithmeticGaloisRepresentations:G7`; `LocalGaloisDeformationRings:L7`.

### NR11.3 Multiplicity one at a nonzero regular point

Choose Kℓ=Par(ℓ^a(ρ|GQℓ)) at ℓ∉{p,r}. Let q′ be a characteristic-zero point on a common irreducible component of RS[1/p] with q. For sufficiently large R, if q′ has R-regular classical weight and (M_w)q′≠0, then dimE(M_w/q′M_w)[1/p]=1 for each w. The nonzero hypothesis is essential; this theorem does not construct a classical point in the support.

Use regular arithmetic control to identify the fiber with the sum of cuspidal automorphic representations having the same Galois point and the specified refinements. Use localized boundary/interior comparison and global multiplicity one for general-type packets; these are supplier inputs, not new classification theorems here. At ℓ≠p,r use the unique generic paramodular newvector at the conductor and constancy of the relevant pure local conductor on the component. At p use the one-dimensional simultaneous ordinary refinement eigenspace of the regular principal series; at r use the one-dimensional selected Iwahori block and residual regular semisimplicity.

(BCGP25, Proposition 7.5.1 and Lemma 7.5.2, pp.174–175; equation (7.5.5) and Lemma 7.5.8, pp.176–177.)

The target is accepted when the following checks hold: A point on another local deformation component is not covered by the conductor/refinement argument.

*Needs:* `NR11 (r-regular classical weights)`; `NR10 (four localized higher-hida multiplicity modules)`; `NR2 (pure general-type monodromy upgrade)`; `HigherHidaAndColemanTheory:X8`; `ModularityAndLanglandsExtensions:ML.4`; `LocalGaloisDeformationRings:L7`.

### NR11.4 Support through the singular point

With NR10 data and one seed alternative, prove (M_w)q≠0 for all four w by exhibiting a deformation component through q contained in Hecke support. The dyadic route uses ordinary unitary deformation finiteness and regular automorphy lifting after solvable CM base change, followed by solvable descent. The odd-prime route uses the component selected by B5 and regular GSp₄ ordinary automorphy lifting. Only the component through q is required; no global identification of all reduced deformation components with the Hecke algebra is asserted.

Request the precise regular ordinary automorphy-lifting/finiteness theorems from the proposed ordinary modularity-lifting Part II owner, including the dyadic near-adequacy and local component hypotheses. Use finiteness and the dimension lower bound to make a component through q dominate the relevant weight component, then prove density of regular arithmetic points there. Apply the appropriate regular automorphy theorem at those points and the source’s solvable descent Proposition 7.5.3 to put them in Hecke support. Pass from dense supported points to support of the selected component; since M_w is finite and locally free at q, infer its positive local rank.

(BCGP25, Proposition 7.5.10 proof, pp.177–179; Lemma 7.5.4, p.176; Proposition 7.5.3, p.175; Theorems 5.7.14 (p.134) and 6.3.4 (p.148) as imported inputs.)

The target is accepted when the following checks hold: This is the nonvanishing proof; local freeness alone gives no support. The regular lifting theorems are an explicit missing interface (regular ordinary support gate) and the solvable descent is requested from EndoscopicTransferAndUnitaryTraceComparison ET.7; neither is hidden in the word seed.

*Needs:* `NR11 (the dyadic and odd-prime automorphic seeds)`; `NR10 (characteristic-zero local freeness)`; `GlobalGaloisDeformations:G7`; `LocalGaloisDeformationRings:L7`; `HigherHidaAndColemanTheory:X8`; `EndoscopicTransferAndUnitaryTraceComparison:ET.7`.

### NR11.5 Rank one at the weight-two point

Under the running NR10 data, the complete seed alternative and the corrected patching/supplier proof obligations, (M_w)q is finite free of rank one over (RS)q for every one of the four w. The deduction combines local freeness, positive support through q and a sufficiently regular nonzero classical point on a relevant component; it does not equate total rank across the four chambers with one.

Use finite local freeness at q to obtain a neighborhood on which each module has constant rank. Choose a dense R-regular arithmetic point on the supported component in that neighborhood. Apply regular multiplicity one at this nonzero point and identify the free-module fiber dimension with the constant rank. Repeat for each w, retaining all four one-dimensional fibers.

(BCGP25, Proposition 7.5.10 conclusion and final proof paragraph, pp.177–179.)

The target is accepted when the following checks hold: The argument needs the regular point in the free neighborhood and in support, not merely somewhere on the deformation space.

*Needs:* `NR11 (support through the singular point)`; `NR11 (multiplicity one at a nonzero regular point)`; `NR10 (characteristic-zero local freeness)`.

### NR11.6 Ordinary weight-two modularity lifting

Assume NR10 data, the full dyadic or odd seed alternative, the explicit corrected patching and interpolation proof obligations, and either Zariski image containing Sp₄ or image containing SL₂×SL₂ with ρ irreducible and becoming reducible over an index-two subgroup. Then ρ is the representation of a classical cuspidal Siegel modular form of weight (2,2). Use the local semistable weight-two hypothesis to supply de Rhamness and the four rank-one multiplicities to verify the higher-Coleman classicality criterion. The theorem is not obtained by removing the H² hypothesis from CG20’s integral R=T theorem.

At q use the arithmetic specialization/control theorem to obtain the ordinary overconvergent eigensystem with the same full good-prime data. Use isotypy to identify its completed eigenspace with ρ⊗W, not just an unspecified four-dimensional representation. The four rank-one graded pieces give equal multiplicities n=1 and total dimension 4. Semistability gives de Rhamness and semisimplicity of the required Sen operator. Apply the imported classicality theorem; retain the classification/packet input used to pass from higher-degree classicality to the degree-zero cusp form. Compare the geometric and dual-spin conventions before concluding that the form realizes the original ρ.

(BCGP25, Theorem 7.5.11, p.179; Theorem 4.12.4 and Remarks 4.12.5–4.12.6, pp.113–114.)

The target is accepted when the following checks hold: Classicality requires both de Rhamness and the four matching multiplicities. All unresolved source and supplier gates of NR10–NR11 propagate to this endpoint.

*Needs:* `NR11 (rank one at the weight-two point)`; `NR2 (completed eigenspace isotypy)`; `NR2 (dual-spin overconvergent interpolation)`; `HigherHidaAndColemanTheory:X8`; `PadicHodgeTheory:R06.2`; `ModularityAndLanglandsExtensions:ML.4`.

### Examples

For R=3, h₁=−4,h₂=−1 satisfy both inequalities with equality.

### Dependencies

This layer uses `ArithmeticGaloisRepresentations:G7`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7`, `GSp4NonregularModularityLifting:NR10`, `GSp4NonregularModularityLifting:NR2`, `GlobalGaloisDeformations:G7`, `HigherHidaAndColemanTheory:A0`, `HigherHidaAndColemanTheory:X8`, `LocalGaloisDeformationRings:L7`, `ModularityAndLanglandsExtensions:ML.4`, `PadicHodgeTheory:R06.2`.

Its direct proof gates are Integral coherent input and moved ownership; Corrected characteristic-zero patching; Regular ordinary support; Local paramodular and Klingen interfaces; Classification input. The full contracts are stated below.

## Proof gates and scope of the conditional conclusions

### Integral coherent input and moved ownership

IntegralCoherentHeckeComplexes is still a proposal without stable stages in this checkout. It owns integral coherent homology/duality, Hochschild–Serre, the Lan–Suh specialization, localized boundary vanishing and CG20 Lemma 7.10, Arthur-type exclusions and dim H¹=dim H⁰. The amended PAPER-PILLONI-20 route moved that entire group here from the original CG20 brief. Obtain exact stage/node contracts before packaging; no invented stage ids are cited.

This is required by NR7 (the dual coherent taylor–wiles module); NR7 (h² vanishing and torsion-free coherent homology); NR7 (defect reduction and whole-module balance); NR11 (multiplicity one at a nonzero regular point).

### Siegel mod-ϖᵐ geometric operators

SiegelModularFormsModPn has no stable stages yet. It must construct the actual integral normalized Tp,1 and Qp,2, Hasse lifts with finite-level congruences, the secondary Hasse invariant and reduced-stratum nonzerodivisor theorem, Fourier expansions and the corrected scalar/vector theta operators with injectivity. Generic bundle/Fourier supplier stages do not prove these genus-two statements.

This is required by NR1 (the three nonregular hecke images); NR3 (hasse shifts and the vanishing threshold); NR4 (formal operators in the doubling argument); NR4 (theta operators with corrected weights); NR6 (descent through the nonordinary strata).

### Selected summand balance

CG20 Theorem 7.11 proves balance of the full diamond module; step (c) of Theorem 9.1 uses its eαβ part. Construct an integral p-idempotent compatible with H₀,H₁, duality and Hochschild–Serre, and prove the rank inequality on that summand. Counterexample to the abstract inference: for S=O[Cp], the residue module k has defect −1, S has defect 1, so S⊕k has defect 0 while its k-summand is unbalanced. This gate propagates through every CG minimal R=T conclusion.

This is required by NR7 (balance of the selected hecke summand); NR8 (the nonregular balanced patching datum); NR8 (conditional minimal r = t and freeness); NR8 (the a≥4 minimal theorem); NR8 (classical modularity from the minimal theorem).

### All-index contraction and scalar kernel proof

Verify the integral transvectant covariance with the precise dual binary-form action, then deduce θ₁Z=0 at every Fourier index. The source’s selected-coefficient computation does not establish an all-coefficient assertion. Independently spell out the scalar p-primitive neighbor recurrence and the weight-(p+1,p+1) theta comparison, retaining the F₀ term. Until then the two doubling injections and every dependent Galois/minimal theorem are conditional.

This is required by NR4 (contraction on all fourier indices); NR4 (vanishing of constrained cuspidal vectors); NR4 (the two hasse-projection injections); NR5 (minimal galois deformation over the singular hecke algebra).

### Regular p-polynomial assertion outside the transported proof

Away-p Hecke-equivariance of Hasse multiplication does not establish the full p-Hecke characteristic-polynomial identity in Theorem 6.13(3). The roadmap retains the local ordinary characters and all good-prime identities actually needed by Theorem 6.17. Prove the additional p-polynomial equality through a separate normalized p-action comparison before exporting that stronger clause.

This is required by NR3 (regular-weight hecke-valued galois representation).

### GSp₄ pseudocharacter reconstruction in characteristic zero

BCGP25 Theorem 1.8.17 interpolates GSp₄-valued pseudorepresentations in Lafforgue's sense over an ordinary affinoid and specializes them at the weight-two point. Upstream IntegralHeckeAndGaloisDeterminants plans reductive pseudocharacters and their invariant evaluations (Layer 0.7) but reconstructs representations only for GL (Layer 1.7). Supply reconstruction of a semisimple GSp₄(Q̄p)-valued representation with its multiplier from a GSp₄ pseudocharacter over an algebraically closed field of characteristic zero, or restrict NR2/weight-two to irreducible ρπ, where the ε⁻¹-line of ∧²ρπ gives the pairing. The integral dyadic descent used in NR10 is BCGP25 Lemma 7.4.8, planned here as NR10/dyadic-descent, so it is not part of this gate.

This is required by NR2 (ordinary weight-two galois representation).

### Corrected characteristic-zero patching

Replace augmentation-only ideal powers by a genuinely cofinal system of open ideals with weight/maximal-ideal control; construct the compatible patched-ring action on the patched module; prove the characteristic-zero completed-ring lift and depth/dimension comparison. The source’s §7.2 does not supply these details. The request belongs to R03.5/R03.3; NR10 local freeness and NR11 rank one remain conditional on that corrected abstract theorem.

This is required by NR10 (characteristic-zero local freeness); NR11 (support through the singular point); NR11 (rank one at the weight-two point); NR11 (ordinary weight-two modularity lifting).

### Regular ordinary support

OrdinaryAutomorphicFormsAndModularityLiftingPartII is a proposal without stable stages. Request BCGP25 Theorems 5.7.14 and 6.3.4 with their exact near-adequate/reasonable/tidy, oddness, weight and ordinary component hypotheses. The seed is not itself a proof that the target point lies in Hecke support. The solvable descent Proposition 7.5.3 is requested separately from EndoscopicTransferAndUnitaryTraceComparison ET.7, where the reviewed BCGP25 extraction routes it. The lifting roadmap owns the local-through-q deduction, not the regular automorphy theorem.

This is required by NR11 (the dyadic and odd-prime automorphic seeds); NR11 (support through the singular point).

### Local paramodular and Klingen interfaces

GSp4LocalLanglandsAndGaloisRepresentations remains a proposal. Export the local Steinberg normalized U-eigenvalue, Genestier–Tilouine Klingen no-newforms calculation, generic paramodular newvector uniqueness at conductor, the one-dimensional regular p/r refinement blocks, and holomorphy at s=1 of the local adjoint L-factor of a generic L-packet (Gan–Takeda, main theorem part vii, used with Taylor–Yoshida Lemma 1.4 in BCGP25 Remark 1.8.20). Attach the exact sources and coefficient hypotheses; generic smooth induction/Satake stages alone do not provide these computations. The reviewed BCGP25 extraction also routes the regular-weight GSp₄ Galois representations of its Theorem 1.8.13 to this owner, so their export must be reconciled with AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6.

This is required by NR2 (no steinberg component in scalar weight two); NR6 (high-weight klingen level comparison); NR11 (multiplicity one at a nonzero regular point); NR2 (pure general-type monodromy upgrade).

### Classification input

The selected source route retains Arthur's GSp₄ classification, multiplicity formula and the twisted weighted fundamental-lemma hypothesis through ML.4 (CG20 Lemma 6.9 and Theorem 7.11; BCGP25 Remark 1.8.20, Lemma 7.5.8 and Remark 4.12.6). Provide the theorem owners and proof status before removing this gate. The adjoint input of the monodromy upgrade is local and is part of the local paramodular and Klingen gate.

This is required by NR3 (central characters and residual galois systems); NR2 (pure general-type monodromy upgrade); NR7 (defect reduction and whole-module balance); NR11 (multiplicity one at a nonzero regular point); NR11 (ordinary weight-two modularity lifting).

### Pilloni flag orientation and edition comparison

The accessible September-2009 author text uses r>r′ in Definition 3.2 and r<r′ in the deformation FOR condition after Definition 5.3. These exclude inverse cyclotomic ratios and are not identical. Resolve the orientation with the chosen flag and local Ext convention. The J. reine angew. Math. 666 (2012), pp.35–82 publication has not been compared; do not claim its theorem is corrected merely from the older author text.

This is required by NR9 (pilloni ordinary admissibility data); NR9 (variable-weight ordinary r = t); NR9 (modularity as an ordinary p-adic form); NR9 (parallel-weight parabolic ordinary lifting).

### Pilloni–Stroh integral lattice comparison

Theorem 3.6 factors the characteristic-zero action using modified integral models. Remark 3.10 distinguishes their lattice from the usual integral model. A comparison with the specific CG20 mod-ϖᵐ cuspidal lattice is needed for a unified torsion interpolation proof; the present plan uses CG20’s independent Hasse transfer and does not make that deduction.

This is required by NR2 (all-degree characteristic-zero interpolation).

### Arithmetic and finite-group illustrations

OpenImageTheoremsForAbelianVarieties is a proposal without stable stages. The Weil-restriction big-image example needs the theorem for a non-CM elliptic curve not geometrically isogenous to its conjugate, not just nonisogeny over K. The separate mod-2 illustration needs an explicit supplier for the exceptional identification S₆≅Sp₄(F₂), its conjugacy-class dictionary and the invariant alternating form. These examples remain requested applications and are not used to close the lifting proof.

This is required by NR8 (arithmetic examples and excluded conjectures).

## Source corrections used in the targets

All descriptions here are in our own words. Each correction is tied to the version actually read; no comparison with an unexamined final publication is implied. Each entry carries the verdict of the independent review in the packet; one recorded issue (BCGP25 Lemma 4.12.3) was rejected there and is not listed.

**CG20 §§6.3–6.4, pp.841,845.** The displayed factorial expressions do not select the simultaneous generalized roots required by the argument. Use the product of the two complementary factorial limits, one for each root equation. On two coordinates satisfying exactly one equation each, the complement-of-product formula selects both; the required intersection is zero. Already identified as PAPER-CALEGARI-GERAGHTY-20/E59; specialized formulas checked here.

**CG20 Definition 6.15, p.844.** The modularity witness is not explicitly required to be nonzero and cuspidal at the minimal level. Require a nonzero simultaneous eigensection in the subcanonical space at the §6.3 level. The zero vector satisfies every eigenvalue equation and cannot certify support; the patching module is cuspidal. Already identified in the CG20 route, including E158 and the cuspidal correction.

**CG20 Remark 6.5, p.837; proof of Theorem 6.13, pp.842–843.** The weight-transfer quotient uses the full-module annihilator when the intertwiner controls a selected summand. Use the annihilator of the selected finite-level module, and the composite selected projection after Hasse multiplication. For k×k acting on k² the full action is faithful but the first-coordinate summand has annihilator 0×k. Already identified as CG20 E60/E160 and related route corrections.

**CG20 Theorem 6.13(3) and proof, pp.842–843.** The full p-Hecke polynomial identity is carried through a Hasse transfer justified only for away-p operators. Retain the ordinary local characters and good-prime identities used downstream; prove a separate normalized p-action comparison for the stronger polynomial clause. Intertwining a set of away-p generators imposes no relation on an additional p-operator. Already identified as CG20 E61; the stronger clause is not used to close this plan.

**CG20 Theorem 9.1 proof, step (c), p.880.** Balance of the entire coherent diamond module is used as though it implied balance of its selected p-root summand. Prove an integral idempotent-compatible homology/spectral-sequence comparison and the selected rank inequality, or prove selected balance independently. Over S=O[Cp], d(S)=1 and d(k)=−1, so S⊕k is balanced but its k-summand is not. Already identified as CG20 E131; remains a genuine proof obligation.

**CG20 Theorem 7.11, p.853.** The printed numerical weight bound is stronger than the bound used for the dual bundle identity. Use p>a−2 for this local duality/balance statement, and retain p−1>a in the final lifting theorem. The duality calculation is governed by the symmetric-power degree a−2; these are different uses of the prime bound. Theorem 9.1 assumes only p−1>a, so read literally the printed bound p−2>a would exclude a=p−2 there; the proof of Theorem 7.11 uses only p>a−2, the standing assumption of §7.2 (p.851), so the intended statement is right. Already identified as CG20 E161.

**CG20 proof of Lemma 7.4, pp.848–849; proof of Lemma 7.5, pp.849–850.** Lemma 7.4's proof justifies injectivity of multiplication by the Hasse invariant on H⁰ by calling the smooth schemes X and X₀(Q) irreducible over k; Lemma 7.5's proof reruns that argument for the secondary Hasse invariant on the non-ordinary loci without saying why multiplication by its powers is injective there. For X and X₀(Q), use that each connected component of a smooth k-scheme is integral and the Hasse invariant is nonzero on each (the ordinary locus is dense). For the non-ordinary loci, use that they are Cartier divisors in smooth threefolds, hence without embedded components, and that the secondary invariant vanishes on no irreducible component. A smooth scheme can be disconnected, and a section that vanishes on a whole component is a zero divisor; the non-ordinary locus is not known to be smooth or irreducible. Recorded as CG20 extraction E76 (Lemma 7.4, affects nothing) and E77 (Lemma 7.5, gap).

**CG20 Proposition 8.9(2), p.861.** The displayed vector theta coefficient carries an extra determinant factor. The coefficient is the contraction con(a(F;Q)⊗Q), without multiplying by det(Q). The corrected integral contraction has the stated weight transformation; the extra factor changes the operator and its degeneracy behavior. Already identified as CG20 E95.

**CG20 Theorem 8.10, pp.861–862.** The scalar theta injectivity range includes the Hasse weight k=p−1. Exclude k=p−1 from the printed range; retain the separate arithmetic exclusions and use k=p+1 in the scalar doubling argument. The nonzero Hasse invariant has constant expansion 1 and is annihilated by theta. Already identified in the CG20 extraction; the plan uses only the corrected range.

**CG20 proof of Lemma 8.15, pp.867–868.** Iteration of U is used before stability of the source space has been supplied. Pass to W=ΣUⁱM, prove it is finite-dimensional and U-stable, and use Z₂W⊂UW. The intersection of the Uⁿ-images is an ordinary subspace only in a U-stable finite-dimensional ambient space. Already identified in CG20 E107 and the route corrections.

**CG20 Theorem 8.22 and Proposition 8.25, pp.873–877.** A positive minimal-discriminant coefficient and a selected contraction calculation are used to support a conclusion for all coefficients of an unrestricted form. Restrict the lifting application to cuspidal forms and prove the all-index contraction identity, including p-divisible discriminants; keep the scalar F₀ component and the exact weight-p+1 theta comparison. Noncuspidal support can be degenerate, and vanishing at one coefficient does not establish theta-annihilation of a series. Related CG20 E113–E115/E121–E125. This plan does not adopt a proposed repair that restores the erroneous determinant factor.

**CG20 Theorems 1.1–1.2, pp.802–803.** The introduction abbreviates the level and local p-hypotheses more than the proof supports. Use the q-enlarged §6.3 cuspidal level, global residual absolute irreducibility and multiplier, and a crystalline local representation for the characteristic-zero modularity corollary. The proof constructs that particular minimal Hecke algebra and uses crystalline Frobenius roots; ordinary numerical weights alone do not provide those data. Already recorded in the CG20 route (including E1–E4 and the crystalline qualification).

**P20 §5.3, author p.24 (17 June 2019 version).** The first coordinate in the displayed infinity-parameter dictionary has the wrong sign. For Ω(k,r)=ω(k+r,r), use λ=(1−k−r,2−r;k+2r). Substitution in the bundle/infinity-weight conversion gives this first coordinate and preserves the central coordinate. Already recorded by PAPER-PILLONI-20; the paywalled final revision has not been compared.

**BCGP25 Lemma 4.12.1(2), p.112 (arXiv v1).** The last two local-character entries contain a duplicated inverse. Use χ₂⁻¹z^(−2−w/2) and χ₁⁻¹z^(−2−w/2), matching the first two entries and the dual-spin convention. The classical identity ρf=ρπ∨ε⁻³ fixes the dual torus-character orientation. Already recorded in PAPER-BOXER-CALEGARI-GEE-PILLONI-25.

**BCGP25 Definition 7.4.1, p.167, and the paragraph before Lemma 7.3.8, p.167 (arXiv v1).** The neat-prime congruence is written in a way that also imposes r≢1 mod p in the dyadic case. For odd p require r≢1 mod p; for p=2 require r≢1 mod 4. Every odd prime is 1 modulo 2, so the unqualified conjunction would make the dyadic condition impossible. new: BCGP25 extraction E031 raised the same point, but its review rejected it on the ground that the first condition is redundant at p=2, which is mistaken (it is never satisfied by an odd prime).

**BCGP25 §7.2, pp.161–162 (arXiv v1).** Powers of the augmentation ideal are asserted eventually to contain the diamond quotient kernels and provide the required patching quotients. Use open ideals with weight/maximal-ideal powers and diamond control, and explicitly compare the resulting module and ring topologies. The group-ring relation (1+t)^(pᴺ)−1 contains pᴺt; for every N it is not in (t²) over a characteristic-zero coefficient ring. Augmentation powers alone are not cofinal open ideals. Already identified in the BCGP25 extraction; the replacement action/lift proof remains open.

**BCGP25 Proposition 7.2.3 proof, pp.162–163 (arXiv v1).** The patched deformation-ring action and a compatible lift from S∞ to the completed regular deformation ring are used without a complete construction. Construct the action using the corrected inverse system and prove the required local-algebra lifting statement with its coefficient and continuity hypotheses before applying Auslander–Buchsbaum. A cotangent-induced surjection does not alone specify a compatible algebra lift from an arbitrary source. Already highlighted in the BCGP25 routing brief; requested from the abstract patching supplier.

**BCGP25 Proposition 7.5.10 proof, p.178 (arXiv v1).** The dyadic proof claims a reduced R=T statement on all components, while the local multiplicity argument only controls support on relevant components. Prove the supported component-through-q statement sufficient for local nonvanishing and rank one; do not export global reduced R=T. Control of a specified component and density of its regular points does not identify all components of the global deformation spectrum. Already recorded in the BCGP25 route; the local conclusion suffices here.

**P12 Definitions 3.2 and 5.3/FOR, author pp.14,20 (September 2009 text).** The automorphic and deformation strong-ordinarity clauses use opposite ordered-character ratio directions. Fix the flag and Ext convention, then verify which ratio is excluded in the local deformation theorem and prove the comparison with the seed hypothesis. The conditions χ≠ε̄ and χ⁻¹≠ε̄ are different when ε̄²≠1; reindexing the same ordered flag is not harmless. Discrepancy observed in the author text read here; no claim is made about a correction in the unexamined 2012 publication.

**CG20 Lemma 8.4 and Definition 8.5, p.859; §8.8, p.874.** The quadratic-character formula alternates between the discriminant and a matrix determinant without the required sign. For Q with binary coefficients m,r,n use d(Q)=r²−4mn=−4det(Q) in the Legendre multiplier. Use the same d throughout the neighbor calculation. The isotropic-line count is governed by the discriminant square class, which need not equal the determinant square class. Already identified as CG20 E90; the corrected Fourier operators use the discriminant.

**CG20 §5.5, p.833; Lemma 6.2 proof, p.836; §8.3, p.858.** The ordinary second p-operator is identified with the Gauss-sum term using an incompatible power of p. In the regular shifted range, p^(3−k)Tp,2 reduces to Z₂=UZ; the auxiliary formal U₂=−1+pX₂ is not that ordinary operator. The three-term Tp,2 expansion makes the Z₂ coefficient a unit only under this normalization; the Gauss-sum term reduces to −1. Already identified as CG20 E52. Keep this distinction in every Hasse/ordinary comparison.

**CG20 Theorem 9.1 proof, step (a), p.879.** The inertial shape used for the fixed-multiplier representation is the shape before its square-root twist. Use diag(χ,χ,χ⁻¹,χ⁻¹) with χ⁻² equal to the diamond character, in the selected Artin normalization. The printed untwisted shape has a nontrivial multiplier on tame inertia, whereas the fixed cyclotomic multiplier is unramified there. Already identified as CG20 E129; the patching datum uses the corrected shape.

**CG20 Proposition 3.3(a), p.812; Theorem 9.1 proof, step (a), p.879.** The proof verifies containment of the diamond action in the deformation action but omits the augmentation-kernel containment. Use the universal inertia matrix entries in ker(RQN→Rmin), then pass their generated ideal to the Hecke image to obtain each diamond-minus-one element. The entries after specialization live in the Hecke ring, so their scalar identities alone cannot prove a statement in the universal deformation-ring kernel. Already identified as CG20 E130; the correction is included in the patching construction.

**CG20 Theorem 7.3, p.847 (the explicit inverse) and its proof; Lemmas 7.4–7.6, pp.848–850.** The level-raising isomorphism pr_Q∘i is said to have inverse d_Q⁻¹tr, where d_Q is the degree of X₀(Q)→X; Lemma 7.4 calls the vertical maps mutually inverse and Lemmas 7.5–7.6 reuse this inverse. pr_Q∘i is an isomorphism, but its inverse is v_Q⁻¹∘tr with v_Q=tr∘pr_Q∘i, a p-adic limit of spherical Hecke operators at the primes of Q that is congruent to 1 modulo m∅ under Assumption 7.1; d_Q⁻¹tr is not an inverse. The isomorphisms and the proof of Theorem 7.2 are unaffected. GL₂ analogue: for a level-one eigenform f with U_q-roots α,β, pr_α f=αf_α/(α−β) with f_α=f−βVf, and tr(f_α)=(q−β/α)f, so (q+1)⁻¹tr(pr_α f)=(qα−β)f/((q+1)(α−β)), which is f only when α=qβ and is f/2 modulo p when q≡1 mod p. In genus two the admissible labellings give projections summing to the identity on old forms, so the composites d_Q⁻¹tr∘pr∘i sum to the identity and cannot each be the identity. Recorded as CG20 extraction E72 (confirmed by its review); no published correction. Missed by the design and added by this review.

**CG20 Theorem 7.2, p.847; used in the proof of Theorem 9.1, step (4), p.879.** The ideal of T_μ(Q) generated by m∅, xU_{x,2}−α′β′ and U_{x,1}−α′−β′ is asserted to be maximal, although T_μ(Q) also contains the diamond operators, whose images in the quotient are not shown to be scalars. Add ⟨u⟩−1 for u∈Δ_Q to the generators (the diamonds act trivially on H⁰(X₀(Q),·) and unipotently on the p-power covers, so no later localization changes), or prove ⟨u⟩≡1 modulo every maximal ideal over m∅ by local–global compatibility at x∈Q. Modulo the printed ideal the quotient is a finite k-algebra generated by the images of the diamond operators, a quotient of k[Δ_Q], which need not be a field. Recorded as CG20 extraction E74 (confirmed by its review); no published correction. Missed by the design and added by this review.

## Downstream consumers

The minimal and ordinary-family lifting statements serve the GSp4 modularity endpoints of ModularityAndLanglandsExtensions ML.1/ML.5 and arithmetic applications to abelian surfaces. They are not prerequisites of ML.0. The characteristic-zero branch supplies the weight-two rank-one and classicality input for the abelian-surface programme, conditional on the corrected patching and regular ordinary support gates; its dyadic descent is BCGP25 Lemma 7.4.8, planned in NR10. Its four chambers are consumers of higher-Hida/Coleman theory, not alternate constructions of that theory.

## References

The source locations attached to each target are the provenance of that target, not a section-by-section account of a paper. Source files and source passages are not included. All sources were read on 19 October 2026. CG20 published page numbers equal the author PDF's internal page number plus 800; the other page numbers are those of the specified author PDFs.

- **CG20:** Frank Calegari and David Geraghty, *Modularity lifting for non-regular symplectic representations*. Duke Math. J. 169 (2020), 801–896; author-hosted published typeset text, read 2026-10-19. Internal page n is published page 800+n. [Source](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Read: §§1,3–9, published pp.801–880; Appendix A.3.2, pp.887–889, for the downstream comparison interface. Checksum of the version read: `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`.
- **P20:** Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*. Author version of 17 June 2019, read in the maintainer-cleared library on 2026-10-19; author pagination. The final 15 October 2019 revision published in Duke Math. J. 169 (2020), 1647–1807 was not compared. The checksum identifies the cleared author copy read; the public author URL is a bibliographic pointer, not a verified byte match. [Source](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Read: Introduction, author pp.5–6; §5.3, author pp.24–27; Bibliography, author pp.111–113. Checksum of the version read: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.
- **P12:** Vincent Pilloni, *Modularité, formes de Siegel et surfaces abéliennes*. Public September 2009 author text, 39 pages, read 2026-10-19; author pagination. J. reine angew. Math. 666 (2012), 35–82 was not compared. [Source](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Mod.pdf). Read: Introduction, pp.2–4; §3, pp.13–19; §5.1–5.7, pp.19–24; §7.1–7.4, pp.35–38. Checksum of the version read: `dd382d42c077aac2064d145311981b0d25038dbd1d8aa639dcac36449bbd804c`.
- **PS16:** Vincent Pilloni and Benoît Stroh, *Cohomologie cohérente et représentations galoisiennes*. Public author text, 30 pages, read 2026-10-19; author pagination. [Source](https://webusers.imj-prg.fr/~benoit.stroh/coco.pdf); the same file (identical checksum) is at [Pilloni's page](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Read: Theorem 0.1 and Remarks 0.2–0.3, pp.1–2; §3, especially Theorem 3.6 and Remark 3.10, pp.16–17, and Corollary 3.14, p.19. Checksum of the version read: `2c9f90c39f0efacd3fa076ef189b1d552da900d1968e34c3c8b3e551dcb4e3a1`.
- **M14:** Chung Pang Mok, *Galois representations attached to automorphic forms on GSp(4)*. arXiv:1109.5392v4, read 2026-10-19; PDF pagination. [Source](https://arxiv.org/pdf/1109.5392v4). Read: §4 hypotheses, pp.24–25; Theorem 4.14 and Proposition 4.16, pp.40–42. Checksum of the version read: `6db29e74332261f70fe4a42ec47e6c4fb8e4147c8f6af49b419f9f38b25e693a`.
- **BCGP25:** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1, read 2026-10-19; PDF pagination. No claim is made about unexamined revisions. [Source](https://arxiv.org/pdf/2502.20645v1). Read: §1.8.12–1.8.20, pp.12–14; §4.12, pp.112–114; §7.1–7.5, pp.152–179; detailed reading of §7.2 and §§7.4–7.5. Checksum of the version read: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.
- **BCGP21:** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. arXiv:1812.09269v3, read 2026-10-19; PDF pagination. Read as a supplier-interface check, not replanned as another roadmap. [Source](https://arxiv.org/pdf/1812.09269v3). Read: §§7.7–7.8 setup and Proposition 7.8.11, pp.210–216; Proposition 7.9.8 and proof, pp.222–223. Checksum of the version read: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.
