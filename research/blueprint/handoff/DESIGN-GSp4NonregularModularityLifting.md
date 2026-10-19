# DESIGN-GSp4NonregularModularityLifting

Issue: #3449. Agent: Codex. Session: codex-8MPq4f.

The target-level design pass is complete and ready for independent review. It is not a checkpoint. All twelve stages NR0–NR11 are **planned**, none closed. All implementation statuses remain unchecked. A planned stage can end in an explicit supplier request or proof gap; this submission makes no formalisation claim.

The five deliverables are the new roadmap definition, blueprint packet, mathematical reader, compact suggested file and this handoff. The reader is definitive and contains every target, hypothesis, proof outline, locator, definition/construction API, discriminating checks and a worked example for every layer. The suggested file follows the current WORKERS compact shape from the start: three light definitions over existing carriers, seven API theorem signatures and six examples, with no invented geometric carriers or admitted data definitions.

## Inventory and validation

- 60 nodes: 9 definitions, 11 constructions, 38 theorems, 1 comparison, 1 application.
- 62 API items; 60 unit-test specifications; 52 planets, at most six per stage.
- 6 checked baseline declarations; 28 exact supplier-stage requests; 14 proof/ownership gaps; 24 source issues described in our own words.
- All 130 extracted route items accounted for exactly once: 107 CG20, 4 Pilloni20 and 19 BCGP25. `routeCoverage` distinguishes specialized targets, imports and exclusions.
- `scripts/check_blueprint.py` reports zero errors and zero warnings.
- `scripts/check_sorry_data.py` passes. The suggested file elaborated successfully with `lean-check` at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Its only warnings are the permitted admitted-theorem warnings.
- The final intake file check, JSON/schema checks, acyclic prerequisite check, definition/API/test coverage and whitespace check are recorded in the PR validation. No source file or source passage is included.

## Build and ownership decisions

NR0–NR1 fix the residual/local data, q-enlarged minimal levels and actual selected Hecke actions. NR2 separates characteristic-zero coherent interpolation, qualified crystalline specialization and dual-spin higher-Coleman interpolation. NR3 transfers selected finite-level Hecke quotients through supplied Hasse lifts. NR4 contains the two doubling injections and their explicit proof gates; NR5 obtains the actual invariant unramified isotropic two-plane and minimal Hecke-valued deformation. NR6 is the Klingen degree-zero level comparison, using degree-one control in its proof. NR7 separates whole-module balance from selected-summand balance. NR8 assembles the conditional minimal theorem and its classical corollary. NR9 treats ordinary p-adic modularity as a separate family result. NR10 obtains characteristic-zero local freeness, which may have rank zero; NR11 separately proves support and rank one in each of four chambers before classicality.

The current TauCetiRoadmap and Tau Ceti library were read-only inputs. The nine upstream roadmaps absent from the atlas snapshot were screened, as were the nearby general representation, Hecke and Galois roadmaps. Nothing existing there is replanned. In particular, IntegralHeckeAndGaloisDeterminants already owns general images/projectors, reconstruction, spin/dual-spin normalizations and compatible determinants. Its Layers 3a–3b refine atlas IHG.3; its current Layer 1 coefficient descent assumes odd residual characteristic. The dyadic extension is a request, not a supplied theorem.

Apply these link/ownership amendments when the respective owners are registered or reviewed; this job changes none of their files:

- The amended Pilloni20 routing moves the CG20 boundary vanishing, Arthur exclusions, general-type/cuspidality argument and characteristic-zero H¹/H⁰ dimension equality to IntegralCoherentHeckeComplexes. This roadmap consumes that group in its specialized defect calculation.
- SiegelModularFormsModPn supplies the geometric Hasse/secondary-Hasse, integral p-operators, Fourier and theta constructions. The specialized doubling kernel deduction belongs here.
- GSp4LocalLanglandsAndGaloisRepresentations supplies the exact Steinberg, Klingen, paramodular and refinement calculations; generic Satake statements do not discharge them.
- OrdinaryAutomorphicFormsAndModularityLiftingPartII supplies BCGP25 regular ordinary lifting/finiteness and solvable descent. OpenImageTheoremsForAbelianVarieties supplies the geometric nonisogeny Weil-restriction illustration. Both are unregistered proposals here.
- A finite-classical-group owner is still needed for the exceptional S₆/Sp₄(F₂) identification and conjugacy dictionary used only in an illustration.
- HigherHidaAndColemanTheory is a supplier, with no reverse dependency. The lifting endpoints serve ModularityAndLanglandsExtensions ML.1/ML.5, not ML.0. GLn complex patching does not replace the selected GSp4 balanced-module argument.

## Remaining proof gates

The independent review should check the conditional statements and source corrections first. Follow-ups must discharge these gates in their owners before any affected stage is called closed:


1. **Integral coherent input and moved ownership.** IntegralCoherentHeckeComplexes is still a proposal without stable stages in this checkout. It owns integral coherent homology/duality, Hochschild–Serre, the Lan–Suh specialization, localized boundary vanishing and CG20 Lemma 7.10, Arthur-type exclusions and dim H¹=dim H⁰. The amended PAPER-PILLONI-20 route moved that entire group here from the original CG20 brief. Obtain exact stage/node contracts before packaging; no invented stage ids are cited.

2. **Siegel mod-ϖᵐ geometric operators.** SiegelModularFormsModPn has no stable stages yet. It must construct the actual integral normalized Tp,1 and Qp,2, Hasse lifts with finite-level congruences, the secondary Hasse invariant and reduced-stratum nonzerodivisor theorem, Fourier expansions and the corrected scalar/vector theta operators with injectivity. Generic bundle/Fourier supplier stages do not prove these genus-two statements.

3. **Selected summand balance.** CG20 Theorem 7.11 proves balance of the full diamond module; step (c) of Theorem 9.1 uses its eαβ part. Construct an integral p-idempotent compatible with H₀,H₁, duality and Hochschild–Serre, and prove the rank inequality on that summand. Counterexample to the abstract inference: for S=O[Cp], the residue module k has defect −1, S has defect 1, so S⊕k has defect 0 while its k-summand is unbalanced. This gate propagates through every CG minimal R=T conclusion.

4. **All-index contraction and scalar kernel proof.** Verify the integral transvectant covariance with the precise dual binary-form action, then deduce θ₁Z=0 at every Fourier index. The source’s selected-coefficient computation does not establish an all-coefficient assertion. Independently spell out the scalar p-primitive neighbor recurrence and the weight-(p+1,p+1) theta comparison, retaining the F₀ term. Until then the two doubling injections and every dependent Galois/minimal theorem are conditional.

5. **Regular p-polynomial assertion outside the transported proof.** Away-p Hecke-equivariance of Hasse multiplication does not establish the full p-Hecke characteristic-polynomial identity in Theorem 6.13(3). The roadmap retains the local ordinary characters and all good-prime identities actually needed by Theorem 6.17. Prove the additional p-polynomial equality through a separate normalized p-action comparison before exporting that stronger clause.

6. **Dyadic symplectic reconstruction.** The current upstream prescribed-multiplier symplectic coefficient-descent theorem assumes p>2. For the BCGP25 dyadic branch supply the actual GSp4 invariant/pseudorepresentation reconstruction over its Hecke coefficient rings, including a full multiplier and integral local ordinary conditions. Neither a determinant square nor an exterior-square character nor density of field points proves this.

7. **Corrected characteristic-zero patching.** Replace augmentation-only ideal powers by a genuinely cofinal system of open ideals with weight/maximal-ideal control; construct the compatible patched-ring action on the patched module; prove the characteristic-zero completed-ring lift and depth/dimension comparison. The source’s §7.2 does not supply these details. The request belongs to R03.5/R03.3; NR10 local freeness and NR11 rank one remain conditional on that corrected abstract theorem.

8. **Regular ordinary support and solvable descent.** OrdinaryAutomorphicFormsAndModularityLiftingPartII is a proposal without stable stages. Request BCGP25 Theorems 5.7.14 and 6.3.4 with their exact near-adequate/reasonable/tidy, oddness, weight and ordinary component hypotheses, and the solvable descent theorem 7.5.3. The seed is not itself a proof that the target point lies in Hecke support. The lifting roadmap owns the local-through-q deduction, not the regular automorphy theorem.

9. **Local paramodular and Klingen interfaces.** GSp4LocalLanglandsAndGaloisRepresentations remains a proposal. Export the local Steinberg normalized U-eigenvalue, Genestier–Tilouine Klingen no-newforms calculation, generic paramodular newvector uniqueness at conductor and the one-dimensional regular p/r refinement blocks. Attach the exact sources and coefficient hypotheses; generic smooth induction/Satake stages alone do not provide these computations.

10. **Completed eigenspace exactness.** In BCGP25 Lemma 4.12.3, prove the relevant finite-length generalized spectral-factor comparison and nonzero eigenspace specialization. Taking an mf-eigenspace of an exact sequence need not remain exact. Supply the local spectral algebra argument before claiming V[mf]=ρf⊗W with W nonzero.

11. **Analytic classification and adjoint input.** The selected source route retains Arthur/GSp4 packet classification, multiplicity and twisted weighted fundamental-lemma hypotheses through ML.4. The pure general-type monodromy upgrade additionally needs adjoint L-function regularity at 1, beyond AL.4’s unramified local-factor scope. Provide the actual theorem owners and proof status before removing these gates.

12. **Pilloni flag orientation and edition comparison.** The accessible September-2009 author text uses r>r′ in Definition 3.2 and r<r′ in the deformation FOR condition after Definition 5.3. These exclude inverse cyclotomic ratios and are not identical. Resolve the orientation with the chosen flag and local Ext convention. The J. reine angew. Math. 666 (2012), pp.35–82 publication has not been compared; do not claim its theorem is corrected merely from the older author text.

13. **Pilloni–Stroh integral lattice comparison.** Theorem 3.6 factors the characteristic-zero action using modified integral models. Remark 3.10 distinguishes their lattice from the usual integral model. A comparison with the specific CG20 mod-ϖᵐ cuspidal lattice is needed for a unified torsion interpolation proof; the present plan uses CG20’s independent Hasse transfer and does not make that deduction.

14. **Arithmetic and finite-group illustrations.** OpenImageTheoremsForAbelianVarieties is a proposal without stable stages. The Weil-restriction big-image example needs the theorem for a non-CM elliptic curve not geometrically isogenous to its conjugate, not just nonisogeny over K. The separate mod-2 illustration needs an explicit supplier for the exceptional identification S₆≅Sp₄(F₂), its conjugacy-class dictionary and the invariant alternating form. These examples remain requested applications and are not used to close the lifting proof.


## Supplier requests

Each request in the packet gives the exact required contract and its consumers; a stage reference does not assert that the contract is already implemented. The requested stable interfaces are:


- `ArithmeticGaloisRepresentations:G7`: Export continuous rank-four symplectic representations, full multiplier/pairing and coefficient-change APIs; separate CG20 Assumption 4.1, P12 H1–H3 and BCGP25 Definition 7.1.1 integral enormousness. Include near adequacy, strong residual oddness, GSp4-reasonable and tidy predicates with their actual definitions. ACC+ residual enormousness does not supply the dyadic integral condition.

- `AutomorphicBundles:B3`: Provide canonical/subcanonical extensions, the actual boundary divisor and the integral Serre-duality bundle identity needed here. The pending IntegralCoherentHeckeComplexes supplier owns coherent homology, spectral sequences and the localized boundary calculation.

- `AutomorphicBundles:B4`: Supply the genus-two Hodge Schur weights and their analytic/classical section comparison, including Ω(k,r)=ω(k+r,r) and central-character conventions.

- `AutomorphicBundles:B5`: Export the Hecke-equivariant Fourier expansion principle and integral trace correspondences in genus two. The proposed SiegelModularFormsModPn owner must supply the normalized p-actions, Hasse/secondary-Hasse and theta APIs, not just generic Fourier expansions.

- `AutomorphicGaloisRepresentationsPartII:AG2.5`: Export the semisimplified local comparison and the separately proved pure general-type monodromy upgrade in the GSp4 transfer specialization, with every |ν| twist and classification hypothesis.

- `AutomorphicGaloisRepresentationsPartII:AG2.6`: Supply the actual family/geometric crystalline-period theorem underlying Mok Proposition 4.16, including the simple-generic, spherical and four-distinct-inverse-root hypotheses. The singular specialization is owned here; the general period comparison is imported.

- `AutomorphicLFunctionsAndLocalFactors:AL.4`: Supply the Satake/Weil–Deligne local-factor comparison. The pure general-type upgrade also needs the relevant adjoint L-function regularity theorem, recorded as a separate analytic gap; AL.4 by itself does not assert it.

- `DeformationAndDerivedPatchingAlgebra:P9`: Supply the amplitude-one defect calculation and support/freeness conclusion actually furnished by balanced patching, preserving torsion and distinguishing whole-module balance from a selected idempotent summand.

- `DeformationAndDerivedPatchingAlgebra:R03.3`: Supply the exact regular-local depth/dimension and Auslander–Buchsbaum theorem, finite projective-to-free comparison on localized factors, and the characteristic-zero completed-ring lift criterion with stated coefficient/base hypotheses.

- `DeformationAndDerivedPatchingAlgebra:R03.5`: Supply CG20 Proposition 3.3 (balanced module patching, precise Tor defect, numerology, augmentation and faithfulness hypotheses), the P12 defect-zero module specialization, and the corrected BCGP25 §7.2 open-ideal patching theorem with compatible ring action and justified characteristic-zero lift. These are three different applications of the same owner’s abstract machinery.

- `DeformationAndDerivedPatchingAlgebra:R03.6`: Export support transport and finite-module freeness on the characteristic-zero component through q, with exact reduced/faithful hypotheses; do not deduce full support from local freeness or global reduced R=T from one component.

- `GlobalGaloisDeformations:G7`: Specialize the existing general functor framework to CG20 Definition 4.6 and BCGP25 §7.1.5, with fixed full multiplier, strict symplectic conjugacy, the ordinary two-plane/flag and the stated tame types. Export representability, exact Selmer numerology/presentation, classifying maps and the integral-enormity cotangent bounds. Do not substitute GLn polarized data for the symplectic datum.

- `GlobalGaloisDeformations:R04.5`: Export labelled GSp4 Taylor–Wiles sets from the exact CG20 image hypotheses, with cardinality equal to dual Selmer dimension, depths x≡1 mod pᴺ and compatible universal scalar inertia. Keep the Klingen rank-one diamond choice separate from BCGP25 rank-two torus diamonds.

- `HigherHidaAndColemanTheory:A0`: Supply the ordered two-character weight space, central-character normalization and the four genus-two shifted Weyl chambers. Compare its Hodge–Tate weights with BCGP25 Definition 7.5.7.

- `HigherHidaAndColemanTheory:I3`: Export ordinary Borel and GL2-parabolic Hida modules, horizontal/derived arithmetic control and dual Iwasawa finiteness for P12, and the four integral higher-Hida modules with the partial central-condition projectivity used by BCGP25 §7.3.

- `HigherHidaAndColemanTheory:X8`: Supply all four genus-two ordinary higher-Coleman graded pieces, regular arithmetic control, projectivity compatible with the partial central condition, smooth torus localization and the exact classicality theorem BCGP25 4.12.4: image condition, de Rhamness, equal four graded dimensions n and total dimension 4n. This roadmap consumes these exports; it supplies no prerequisite back to HigherHidaAndColemanTheory.

- `HodgeTateAndCanonicalSubgroups:T0`: Supply the Hodge–Tate map and Hecke-compatible sections used in the Pilloni–Stroh interpolation construction; coordinate with the Hodge-type/perfectoid and compactification suppliers for the actual cover and modified integral models. The original Kottwitz-lattice comparison is separate.

- `IntegralHeckeAndGaloisDeterminants:IHG.1`: Import the current upstream README §§1.2,1.5,1.6: field and complete-local reconstruction, prescribed-multiplier symplectic coefficient descent (p>2) and Cayley–Hamilton isotypy. Request a separately proved p=2-compatible GSp4 reconstruction interface for BCGP25; the odd-p theorem does not cover it.

- `IntegralHeckeAndGaloisDeterminants:IHG.2`: Import the current upstream README §§2.1–2.3: actual Hecke images, local factors, specified derived idempotent splittings and factorial-power ordinary projectors. Supply the finite quotient/reduction and annihilator comparisons used by the specialized root selectors. These general objects are already upstream plans and are not new nodes here.

- `IntegralHeckeAndGaloisDeterminants:IHG.3`: Use current upstream Layer 3a for GSp4 spin/dual-spin polynomials and the full central multiplier, and Layer 3b for Galois-type residual ideals. The atlas stage IHG.3 predates that split; resolve to those current exports when packaging. Retain the full multiplier at trace zero.

- `IntegralHeckeAndGaloisDeterminants:IHG.4`: Provide compatible finite-quotient determinants with actual uniform congruence bounds, continuity, reconstruction compatibility and inverse-limit uniqueness. A dense characteristic-zero set without integral congruence witnesses is insufficient.

- `LocalGaloisDeformationRings:L7`: Supply the concrete GSp4 local minimal U/P/H conditions, ordinary flags and unramified plane; the pure p-distinguished ordinary semistable weight-two local regularity and dimension theorem used at the characteristic-zero point; inertia rigidity, conductor constancy on the relevant pure component and unique-component comparisons. Include dyadic coefficient and chosen stabilization hypotheses. Resolve P12’s flag-ratio orientation before identifying its two ordinary predicates.

- `ModularityAndLanglandsExtensions:ML.4`: Export the exact GSp4 classification/packet/multiplicity input and its analytic status, including the remaining twisted weighted fundamental-lemma gate in the selected source route. The unitary theorem alone does not discharge this input. Register resulting lifting endpoints in ML.1/ML.5, never in ML.0 which is an input of ML.4.

- `PadicHodgeTheory:R06.2`: Supply de Rham/crystalline/semistable admissibility with coefficient change, descent and dual/twist operations, and the semisimple Sen-operator consequence used in higher-Coleman classicality.

- `ShimuraCompactifications:C3`: Provide compatible fans and extensions of the selected Klingen-level pullback and trace maps, with their composition/scalar formulas and the exact good-prime hypotheses.

- `ShimuraCompactifications:C5`: Supply the integral genus-two compactifications and finite covers at these tame levels, their Hodge positivity and the model-specific vanishing/base-change input. A smooth integral model is not silently inferred for arbitrary higher p-level.

- `SmoothRepresentationsOfLocalGroups:SR.2`: Import the current upstream normalized parabolic induction/Jacquet conventions and local invariant-vector interfaces. Coordinate the GSp4-specific Klingen and Steinberg calculations with GSp4LocalLanglandsAndGaloisRepresentations; no local Langlands construction is replanned here.

- `SmoothRepresentationsOfLocalGroups:SR.4`: Import the current upstream spherical Satake normalization and compare the GSp4 Klingen and regular Iwahori blocks. Request the exact Genestier–Tilouine Proposition 11.1.2 specialization and BCGP25 projective finite-group Satake comparison; an abstract Satake isomorphism alone does not prove either.


## Sources read and missing

Sources were read on 19 October 2026. The packet and reader record the URL, version checksum, theorem/section/page locators and read sections for each:

- CG20: the 96-page author PDF of the Duke 169 (2020), pp.801–896 paper; §§3–9 and the relevant coefficient-comparison appendix. Published page numbers are internal PDF pages plus 800.
- Pilloni20: the maintainer-cleared 17 June 2019 author version, read in place, especially the introduction and §5.3, author pp.24–27. Its public author URL is a bibliographic pointer, not a claim that the URL serves the same bytes. The final 15 October 2019 revision was not compared. No cleared file or passage was copied into the repository.
- Pilloni12: the publicly accessible September 2009 author text, particularly §§3,5,7. The 2012 journal edition was not compared. The ordered-ratio discrepancy is attributed only to the author version actually read.
- Pilloni–Stroh: introduction and §3, including Theorem 3.6 and Remark 3.10. The modified-model lattice is not identified with the CG torsion lattice without a comparison.
- Mok: §4 setup, Theorem 4.14 and Proposition 4.16. The simple-generic, spherical and distinct-inverse-root qualifications are retained.
- BCGP25 arXiv:2502.20645v1: §§1.8,4.12,7.1–7.5. The p=2 neat-prime issue, patching action/topology/lift obligations, spectral exactness and support versus local freeness are retained explicitly.
- BCGP21 arXiv:1812.09269v3: §§7.7–7.8 setup and Proposition 7.9.8. This is a separately qualified ordinary-module coinvariant comparison, whose proof uses derived comparisons; it is not exported as an arbitrary all-degree isomorphism.

The specialized Genestier–Tilouine and paramodular/newvector theorems, regular ordinary automorphy-lifting proofs, analytic classification/adjoint inputs and geometric open-image theorem are requested supplier results, rather than newly proved or fully source-audited results here. Their exact theorem-level interfaces must be established by the named owners. No published correction beyond the existing reviewed extraction records is claimed.

## Where the next worker resumes

Begin with the complete packet and reader, not a source extraction or scratch file. Review the three different endpoint hypotheses, the source-issue ledger and the fourteen gates; then check all 130 route dispositions and supplier ownership. The plan is ready for its independent review. Packaging must wait for the required supplier layers and must preserve these gates until proved. No second issue was claimed in this run.
