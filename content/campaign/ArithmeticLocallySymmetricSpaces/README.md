# Arithmetic locally symmetric spaces and their cohomology

## Scope and ownership

Construct locally symmetric arithmetic quotients, finite-level coefficient systems, Borel–Serre boundaries and their cohomology as Hecke-equivariant complexes. Work with connected reductive groups over number fields; pass through restriction of scalars to ℚ when required by the source. AdelicAlgebraicGroups owns quotient topology and reduction; AutomorphicFormsOnReductiveGroups owns the real group and relative Lie algebra theory. This roadmap builds topological cohomology and boundary geometry, while EnhancedDerivedSheaves owns the general enhanced category machinery and DeformationAndDerivedPatchingAlgebra owns patching.

Use X_K=G(F)\(X∞×G(A_f)/K), with X∞ the symmetric space after the chosen split-center quotient. Neat compact opens give manifolds; general levels require groupoid/orbifold cohomology with stabilizer contributions. The coarse quotient's ordinary cohomology does not automatically equal orbifold cohomology in torsion coefficients.

## Milestones

### ALS.0. Symmetric spaces and components

Construct Cartan involutions, maximal compact subgroups and the contractible symmetric space with G(F∞)-action. Prove the finite decomposition of X_K into arithmetic Γ-components, with explicit stabilizers and component maps. Prove proper discontinuity and, at neat level, freeness. Include oriented and nonorientable cases by retaining the orientation local system. The reductive center correction is part of the definition, not silently absorbed into K∞.

### ALS.1. Local systems and chain complexes

Construct local systems from discrete integral coefficient modules and finite-dimensional algebraic representations with stable lattices. Define singular/cellular cochains, compact-support cochains and relative cochains; prove comparison with sheaf cohomology. Under finite-CW/neat hypotheses and finite-projective coefficient stalks, build bounded finite projective models over the coefficient ring, including base change at complex level. Extend to perfect coefficient complexes with a stated uniform amplitude; finite CW type alone does not make arbitrary coefficient modules projective. Prove the universal-coefficient spectral sequence with all Tor terms. Torsion-free cochains do not imply torsion-free cohomology.

### ALS.2. Borel–Serre compactification

Construct rational parabolic boundary components from unipotent radicals, Levi symmetric spaces and split torus corners. Glue them by the parabolic incidence relation and prove the manifold-with-corners structure at neat level, compactness of the quotient and the homotopy equivalence from the interior. Prove boundary strata are fibrations with nilmanifold fibers over Levi arithmetic quotients; retain nontrivial monodromy of their cohomology. Build a finite stratification filtration and its spectral sequence with explicit differentials and indexing.

### ALS.3. Hecke correspondences on complexes

For g and K construct the two finite-level maps through K∩gKg⁻¹, pullback and trace, and their induced chain maps. Prove independence of coset representatives, composition via the double-coset algebra and compatibility with cup products, compact support and boundary restriction. Lift relations to the derived category with their coherence data, not merely equalities on each H^i. Prove change-of-level and groupoid versions with stabilizer factors.

### ALS.4. Boundary and Levi cohomology

Prove RΓ_c→RΓ→RΓ_boundary→RΓ_c[1], functorially in level and coefficients. Develop the Hochschild–Serre spectral sequence for each unipotent/Levi stratum and compare its Hecke action with parabolic induction and Satake transforms, including modulus and Tate shifts. Prove gluing across intersections, filtration convergence and compatibility with localization at a Hecke ideal. Describe conditions under which boundary localization vanishes or admits a useful summand by an actual eigenvalue argument; the phrase non-Eisenstein alone is not a proof of vanishing for arbitrary groups.

### ALS.5. Duality and comparison

<a id="stage-ALS.5:finite-level-duality"></a>

**ALS.5:finite-level-duality (early).** On the actual finite-level manifolds with corners and their compactification/orientation systems, construct Poincaré–Lefschetz/Verdier duality for perfect coefficient complexes, keeping derived Hom and orientation twists. Construct evaluation, relative/compact-support pairings, and restriction/corestriction and Hecke adjoint formulas on the complexes. Prove compatibility with the ALS.4 boundary triangle and coefficient change. Retain stabilizer hypotheses at non-neat level rather than asserting a manifold theorem for every quotient. This consumes ALS.1–4 and the shared topological/sheaf enhancement, not the automorphic spectral comparison or completed cohomology; CC.7 imports exactly these finite-level maps before passing to limits.

The later full ALS.5 compares Betti, de Rham and relative Lie algebra cohomology in characteristic zero via local systems, using AF.1a. It consumes AS.5 only for the further comparison with automorphic forms. These extra identifications are not prerequisites of the early finite-level duality prefix.

### ALS.6. Reusable tower API

Assemble direct/inverse systems in tame and p-power level, including corestriction, restriction and compatible Hecke actions. Prove finite-level descent and the finite-cover Hochschild–Serre application. Reexport CompletedCohomologyPartII:CC.2/CC.4/CC.7 for completed/derived inverse limits, finite-level chain models and completed boundary triangles, retaining lim¹. That general owner consumes the early finite-level ALS.0–4 prefix, and ALS.5:finite-level-duality for its support/duality suffix, not this late reexport or the automorphic comparison; the older CompletedCohomologyAndLocalGlobalCompatibility owns the GL₂/Q_p arithmetic specialization. Test the tower on modular curves and an anisotropic compact quotient.

The generic continuous cochain/Hochschild–Serre and derived-limit interfaces in
ALS.4/ALS.6 are imported from ArithmeticGaloisDuality R02.1–R02.2. This roadmap
proves the particular unipotent/Levi, finite-cover and arithmetic-tower applications
and their Hecke comparisons, not a second generic profinite cohomology theory.

## Sources and acceptance

[Borel–Serre](https://www.e-periodica.ch/cntmng?pid=com-001%3A1973%3A48%3A%3A32), §§4–11, and [ACC+](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §§2.1–2.2,2.4, organize the targets. ACC+ §2.4 is a specialization to the groups used there, not a proof for arbitrary parabolics in all groups. [Franke](https://www.numdam.org/item/10.1016/s0012-9593%2898%2980015-3.pdf) supplies the separate analytic comparison. Acceptance requires the three cohomology theories, the boundary triangle, integral base change and Hecke compatibility on one shared complex API. Suggested.lean is representative.

## Completion contracts added on 2026-09-15

**Applies to:** `ALS.1`, `ALS.2`, `ALS.3`, `ALS.4`, `ALS.5:finite-level-duality`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct chain-level restriction and transfer from a common equivariant cell decomposition, refining it for a finite correspondence. Prove homotopy independence of the refinement and the double-coset identity. In the Borel–Serre boundary spectral sequence include the incidence maps between parabolics and the orientation local system on nilmanifold fibers; its E1-page alone is not a boundary complex.

### Producer–consumer contract

Return perfect finite-level complexes only for finite-projective coefficient systems and finite-CW/neat hypotheses. Hecke adjoints use inverse double cosets with orientation and modulus factors. ALS.5:finite-level-duality remains earlier than the automorphic comparison.

### Acceptance and source route

A nonorientable quotient, a finite stabilizer at a prime dividing its order, and a modular-curve boundary circle detect loss of orientation, orbifold cohomology or compact support.

**Source route:** Borel–Serre §§8–11; ACC+ §2.1–2.4; Franke later comparison. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
