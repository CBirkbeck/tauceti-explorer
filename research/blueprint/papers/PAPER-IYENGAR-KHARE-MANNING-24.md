# Iyengar–Khare–Manning: congruence modules in higher codimension

**Extraction partial after completed independent review.** This report accompanies `PAPER-IYENGAR-KHARE-MANNING-24.result.json`. See the [independent review](../reviews/REV-PAPER-IYENGAR-KHARE-MANNING-24.md) for the checked source findings, exact reading limits, route decisions and ten remaining gaps.

The paper extends the Wiles–Lenstra–Diamond numerical criterion from finite augmented O-algebras to higher-codimension split augmentations A→O with A regular at the augmentation prime p. It constructs the torsion-free Ext functors F, congruence modules Ψ, cotangent torsion Φ and the Wiles defect δ. The numerical criterion requires depth_A M≥c+1 and positive generic rank μ: δ_A(M)=0 characterizes a complete intersection and a free summand A^μ with complementary module vanishing at p. The separate nonnegativity theorem requires grade(p,M)≥c. The paper also studies deformation invariance, the exterior algebra of torsion-free Ext, duality and free-summand criteria.

Its arithmetic applications combine these invariants with derived Taylor–Wiles patching to target integral non-minimal R=T in positive defect, including PGL₂ over number fields under arithmetic conjectures and weight-one Shimura-curve coherent homology. Those targets must retain the source gates identified in the review: patching finiteness, all-level scalar relations, weight-one determinant/Hecke transport, nilpotent-free Galois representations and orientation where real places occur. In particular the safe Bianchi endpoint retains Conjecture A(ii) until its actual trivial-coefficient supplier is established.

The reviewer read the full [published paper](https://par.nsf.gov/servlets/purl/10585269) and [arXiv v3](https://arxiv.org/pdf/2206.08212v3). Original item locators refer to v3. The JSON preserves the extractor's earlier reading claims separately and records the reviewer's bounded supporting-source reading, pinned declaration statements and stage contracts.

## Inventory and existing suppliers

The corrected inventory contains **184 items: 4 library, 35 planned, 145 missing**. The four library items are definition-level torsion-free quotients, augmented-ring data, regularity at a prime, and the cotangent/torsion carrier. Their extra functorial, dimension and codimension-zero consequences have been split into missing theorem bridges. The full patching theorem is marked missing because its finite coefficient-map clause has not been supplied by the cited stage contracts.

Mathlib already has ordinary Ext/Tor and derived categories, regular sequences, projective dimension, conormal modules, divided powers and related scalar infrastructure. Tau Ceti has generic mixed-double-coset convolution. They do not directly give the arithmetic chain action, the DG Γ Tate resolution or local-ring Tate cohomology. Generic Koszul complexes import DerivedDeRhamCohomology:DD.1. Complete resolutions and Buchweitz comparison import upstream StablePeriodicCurved layer 2. Existing roadmap work is not replanned.

The accepted Calegari–Geraghty paper routes now supply the distinct proposed minimal defect-one lifting package and integral coherent Hecke-complex package. The IKM continuation must import both, owning only the additional Shimura-curve/non-minimal/positive-defect results. The JSON does not count a pending design proposal as a built stage.

## Routing

1. **CongruenceModulesHigherCodimension — reject.** The numerical-criterion direction is justified, but generic local duality/Tate ownership and cited-source closure remain unresolved (G1–G3), with incomplete definition APIs (G10). Do not activate a consumer-owned duplicate foundation.

2. **GL2ModularityLiftingPositiveDefect — reject.** The continuation must import the accepted CG defect-one and coherent-complex proposals. Its arithmetic endpoints still need the joint patching, determinant, scalar, Galois and orientation suppliers (G4–G8); the revised brief exposes them but is not yet buildable.

3. **DeformationAndDerivedPatchingAlgebra — reject.** The source route bundles ordinary commutative algebra with a normalized-duality package not explicitly in the named stage contracts. Resolve G2, complete G1, and then split or extend the supplier precisely.

4. **DeformationAndDerivedPatchingAlgebra — accept.** P7–P9 are the existing owners of derived actions, perfect complexes and fixed-ultrafilter patching. Accept the corrected source request, including the explicit E34/E35 proof obligations and E39 coherence contract; this does not certify the printed finiteness or duality proof.

5. **LocalGaloisDeformationRings — accept.** The local framed, Steinberg and unipotent deformation-ring inputs fit the existing R08.2/L7 contracts. Retain their exact determinant, residual-eigenvalue and residue-characteristic assumptions; do not duplicate the local ring owner.

6. **GlobalGaloisDeformations — reject.** The general deformation/Taylor–Wiles imports are appropriate, but the bundled level-raising supply assertion still conflates image and coefficient fields after rejection of E42. Resolve G9 before activating this combined route.

7. **ArithmeticLocallySymmetricSpaces — accept.** ALS.0/.3/.5 own the coefficient systems, double cosets and finite-level duality. The corrected request keeps orientation coefficients, ordered degeneracy maps and the precise Atkin–Lehner level convention. Untwisted arithmetic self-duality remains conditional on its additional proof.

8. **SerreWeightAndLevelOptimisation — reject.** R20.3 is a plausible owner, but the exact Gross/Coleman–Voloch exceptional hypotheses and supplier proof were not independently closed. Keep G1 open rather than certify the broad companion-form request.

## Source issues and remaining work

All 65 input findings have independent verdicts: 64 confirmed, one rejected (E42). Confirmed findings include narrow typographical corrections, false intermediate formulas and proof gaps; their `affects` fields distinguish them. E34/E35 no longer claim an unproved repair. E57 no longer infers H₀-freeness from perfectness. E64 no longer treats ramification as an omitted hypothesis. E65 is recorded as a missing orientation input, not a universal counterexample after Hecke localization. The theorem notes and ordered U-matrix now agree with the corrected statements.

Twenty-six definition interfaces now have supplier-driven APIs, named consumers and at least three acceptance tests. Thirty-three interfaces remain to be written. The 40 prerequisite requests are retained; they are not a fully read or closed proof DAG. Generic duality and the extra local-ring Tate sequence still need unique owner contracts. These omissions and the arithmetic proof gates are explicit gaps G1–G10. The extraction is therefore partial even though this independent review is finished.

The paper checker and five-path intake check passed with 0 problems. Seventy-nine exact algebraic diagnostics passed. No suggested Lean file is part of this review issue, and no Lean file was compiled. Nothing is claimed formalized.
