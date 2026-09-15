# Reusable infrastructure for potential automorphy over CM fields

## Scope and source

Build the reusable cohomological, representation-theoretic and patching interfaces required by Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne, *Potential automorphy over CM fields*, Annals 197 (2023), 897–1113. Use the [published paper](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), whose section numbering differs from some earlier preprints.

The scope is general-dimensional infrastructure and its exact specializations to CM/unitary settings. The final potential-automorphy assembly has downstream owner ModularityAndLanglandsExtensions ML.2; symmetric powers and Sato–Tate have downstream owner ML.3. Those source-qualified endpoints require their own complete proof decomposition and do not become prerequisites of the infrastructure below. Specific endpoints already in the Serre pack retain their existing owners. In particular the paper does **not** establish the general expected mod-p cohomology vanishing conjecture; its derived Ihara-avoidance method circumvents that need.

## Source-to-owner matrix

| Source | Supplier | Contract consumed here |
| --- | --- | --- |
| §§2.1–2.2,2.4 | ArithmeticLocallySymmetricSpaces | Hecke-equivariant arithmetic/Levi complexes, boundary filtration and coefficient change |
| §2.3; §3 | AutomorphicGaloisRepresentationsPartII; PadicHodgeTheory; IntegralHeckeAndGaloisDeterminants | Characteristic-zero Galois systems, exact Weil–Deligne compatibility packages and integral interpolation |
| §4.2 | ArithmeticLocallySymmetricSpaces; TC.3 | Boundary summands and Hecke-normalized Levi maps |
| §4.3 | IgusaVarietiesAndTorsionConcentration | Generic localized geometric cohomology statements via compactified Igusa varieties, Hodge–Tate fibers and semiperversity, with the source's exact hypotheses |
| §§4.4–4.5 | PA.1 | Degree shifting and Fontaine–Laffaille comparison |
| §§5.2–5.3 | PA.2; PadicFamilies (finite-module projector only) | General-rank CM/unitary ordinary towers and characteristic-p ordinary parts of parabolic induction |
| §§5.4–5.5 | PA.2 | Ordinary degree shifting/local compatibility |
| §6.2 | LocalGaloisDeformationRings; GlobalGaloisDeformations | General-rank polarized/nonpolarized deformation problems and local conditions |
| §§6.3–6.4 | DeformationAndDerivedPatchingAlgebra | Derived Ihara avoidance, ultraproduct patching, support and amplitude |
| §7.1 | PotentialModularityAndCompatibleSystems | Compatible-system operations and change of field |

## Standing conventions

Separate coefficient prime p from residue characteristic l at an auxiliary place. Work over a CM field F with maximal totally real subfield F⁺ when unitary geometry is used. Track ramification, splitting, residue characteristic, residual image and regularity hypotheses per result. Fontaine–Laffaille and ordinary local conditions are distinct branches; neither automatically includes all potentially semistable representations. Use geometric input for the actual signature and compact/noncompact unitary group of the theorem.

### PA.0. A common integral cohomology interface

Compare algebraic coefficient local systems, finite-level cellular complexes and the integral Hecke actions used by each source. Prove derived coefficient change, level change and boundary localization compatibilities. Construct the summand/filtration maps entering the unitary boundary argument and identify their twists and degree shifts. A splitting must be proved under the source's genericity condition; replace none by a formal direct-summand assumption. Keep a non-neat groupoid model available until the source selects a sufficiently small level.

### PA.1. Fontaine–Laffaille weights and degree shifting

Construct integral algebraic coefficient modules over O, reduction modulo p, Weyl/dual Weyl modules, their highest-weight filtrations and the relevant short exact sequences. Prove the linkage and weight bounds actually used for degree shifting. Build the cohomological connecting morphisms and spectral-sequence comparison, with their Hecke equivariance and precise shifted degrees. Combine with IgusaVarietiesAndTorsionConcentration's geometric concentration theorem to transfer the local p-adic Hodge condition. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 supplies the integral Fontaine–Laffaille classification and lattice comparison; PadicHodgeTheory supplies the rational period comparison. Retain their weight-interval, coefficient and unramified-base inequalities at every use.

### PA.2. Ordinary induction and degree shifting

Consume PadicFamilies:L0a's group-independent ordinary projector from stabilized factorial powers on finite quotients and compatible profinite limits. Prove the finite-quotient and continuity hypotheses for this tower; an arbitrary complete Noetherian ring alone is insufficient. The degree-shifting application also imports IgusaVarietiesAndTorsionConcentration:IG.7's concentration theorem, independently of PA.1's application, as in ACC+ §5.4. This layer owns its additional general-rank CM/unitary arithmetic application: construct the parabolic level tower, its commuting positive-monoid operators and the ordinary summand of the arithmetic complexes, and prove the stabilization hypotheses. Construct the local ordinary-parts functor in the coefficient regime of ACC+ §§5.2–5.3, its maps on parabolic induction and the required adjunction/control statements. At coefficient characteristic equal to residue characteristic it is not the exact Jacquet functor of the ell-not-p theory. Track positive monoids, normalization, central characters, derived limits and the needed duality/finite-generation bounds. The GL₂ modular/Hilbert/quaternionic tower in OrdinaryAutomorphicFormsAndModularityLifting is a comparison example, not a supplier for this higher-rank construction. Prove the ordinary degree-shifting comparison independently of PA.1, preserving the resulting filtration of the Galois representation and its characters. An eigenvalue called a unit is not sufficient to assert an ordinary Galois filtration.

### PA.3. Derived support and changes of local deformation condition

Use the general patching owner to compare patched complexes for two systems of local conditions which agree modulo a chosen coefficient ideal. Prove compatibility of Hecke and deformation-ring actions, component support, characteristic-zero localization and the specialization of cohomological amplitude. Establish the generic support implication used for derived Ihara avoidance, with the exact hypotheses on local rings and residual images. Keep equality of reduced supports, equality after inverting p, near faithfulness and integral ring isomorphisms distinct. Do not demand or infer integral R=T from a support comparison alone.

### PA.4. Auxiliary primes and ultraproduct compatibility

Construct Taylor–Wiles auxiliary sets using the existing Chebotarev and arithmetic duality roadmaps with the required residual image hypothesis. Track the size of the sets, congruences on residue cardinalities, selected eigenvalues and framed local deformation data. Fix a nonprincipal ultrafilter as in ACC+ §6.4.1. Prove that the system of finite-level complexes satisfies the boundedness and compatibility hypotheses of ultrapatching; identify its specialization with the original complex. The patching owner proves the abstract construction, support statements and independence from the permitted transition-map choices for that fixed ultrafilter, as in Remark 6.4.13. Do not claim independence from the ultrafilter itself without a separate theorem. This layer proves the arithmetic tower meets those statements, not merely that an ultrafilter exists.

### PA.5. Compatible systems and reusable transport

Import PotentialModularityAndCompatibleSystems:R24.5:operations, not its
two-dimensional existence theorem. This is the general-rank operation interface
with the representation-theoretic and local period/monodromy suppliers named.

Provide comparison lemmas for restriction to field extensions, tensor products, duals, characters and symmetric powers using the compatible-system owner. State regularity, purity and polarization only where proved; do not assume all symmetric powers of all systems are automorphic. Verify compatibility of Frobenius polynomials, Hodge–Tate multisets, local monodromy and integral lattices under each permitted operation. Supply a reusable checklist theorem which records that the input package for a chosen lifting argument survives a specified base change, while leaving the lifting theorem with its dedicated owner.

## Acceptance

The ordinary and Fontaine–Laffaille branches each export a proved complex-level comparison with explicit local conditions. The patching interface accepts cohomology in more than one degree and retains nilpotent error ideals. A reviewer can follow every row of the matrix to a constructive supplier milestone. No source-specific conclusion is smuggled in as a field of a hypothesis structure. Suggested.lean prototypes elementary algebraic interfaces; higher geometric objects are identified in comments and specified above. Primary supporting source: [Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/CG.pdf); the ACC+ paper supplies its unconditional specialized arithmetic inputs rather than making the general CG conjectures true.

## Implementation handoff: Complex-level ordinary and Fontaine–Laffaille transport

**Stages:** PA.0, PA.1, PA.2, PA.3, PA.4, PA.5. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each branch construct a diagram of actual integral arithmetic complexes with Hecke and deformation actions. PA.1 supplies the highest-weight exact sequences and range needed for degree shifting; PA.2 supplies ordinary parabolic induction and its compatible finite projectors. PA.3 compares support after changing local conditions with the precise derived coefficient map.

**Acceptance and consumer contract.** PA.4 verifies enormous-image auxiliary primes and uniform amplitude/bounds before ultraproduct patching. PA.5 carries only the regularity and polarization properties proved under the operation used. Record every nilpotent quotient and its exponent in the handoff. Export PA.5 to ModularityAndLanglandsExtensions ML.2 for final potential-automorphy assembly and ML.3 for the proved symmetric-power/Sato–Tate applications. Source conditionality and all image, polarization and local hypotheses persist until the chosen endpoint theorem is verified; these downstream owners are not prerequisites of PA.0–PA.5.
