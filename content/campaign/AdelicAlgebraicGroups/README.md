# Adelic algebraic groups and arithmetic quotients

## Scope and dependencies

Build algebraic groups on adeles, Haar and quotient measures, reduction theory and arithmetic quotient geometry for connected reductive groups. This supplies the owner already named in the existing GlobalNumberFields roadmap. Consume its adeles, ideles, places and product formula; use ReductiveGroups for algebraic groups and ReductiveGroupsPartII for local topologies and integral compact subgroups. Do not rebuild the adele ring or replace it by an unrelated restricted-product carrier.

Work over arbitrary number fields. Reduction and finite-volume assertions are stated for connected reductive groups, with split-center corrections. Strong approximation is a theorem with additional simply-connected almost-simple and noncompactness hypotheses, never an assumption for arbitrary G. The elementary restricted-product lemmas apply more generally to locally compact groups; a full arithmetic function-field development is not assumed from the number-field suppliers.

## Conventions

For a finite set S large enough for a smooth affine reductive model, G(A_F) is identified with the restricted product of G(F_v) with respect to G(O_v) outside S. Include the comparison to evaluating the affine group functor on A_F. Use left Haar measures, right translation on automorphic functions and explicit modular-function factors for nonunimodular subgroups. Put G(A)^1=intersection of kernels of absolute values of F-rational characters. Removing the real split central factor and passing to G(A)^1 are related constructions, not definitionally the same quotient for every group.

## Milestones

### AA.0. Restricted products of locally compact groups

Starting with the existing restricted-product topology, prove continuity of multiplication and inversion, local compactness, compact-open cylinders and continuity criteria for homomorphisms. Construct restricted products of Haar measures normalized to give chosen compact opens volume one at almost all places; prove change-of-finite-set and Fubini statements. Distinguish normalized product measures from Tamagawa measures with convergence factors.

### AA.1. Adelic points and functoriality

Prove independence of spreading-out model and finite exceptional set. Construct G(F)→G(A), local projections, base change and restriction-of-scalars equivalences. Prove compatibility with closed subgroups, centers and products. Rational points form a discrete subgroup in full adeles; do not assert discreteness in finite adeles alone. Prove G(A) is unimodular for reductive G. Test GL_1 against GlobalNumberFields.IdeleGroup and additive groups against the existing adele API.

### AA.2. Characters, heights and integration

Define the real character space a_G and logarithmic map H_G, including the product-formula vanishing on G(F). Construct invariant quotient measures by Weil's integral formula and prove their independence of measurable fundamental-domain choices. Develop central-character sections and L² spaces with a unitary central character, including change of central quotient. Construct Tamagawa measures from invariant differential forms and convergence factors; prove independence under rescaling by F×. Computing every Tamagawa number is outside this scope.

### AA.3. Reduction theory

Construct minimal rational parabolics, relative positive chambers, Siegel sets and their height estimates. Prove finitely many Siegel sets cover the arithmetic quotient, finite intersection properties and finite volume of G(F)\G(A)^1. Prove compactness of the appropriate quotient for F-anisotropic groups modulo center and state the converse with its exact formulation. Establish moderate-growth estimates under changes of faithful representation and maximal compact subgroup. Supply the finiteness of G(F)\G(A_f)/K modulo the archimedean connected component needed for locally symmetric components.

### AA.4. Approximation and level maps

Prove weak approximation only in the cases justified by the relevant group theorem; keep failures for tori visible. Develop strong approximation for simply connected almost-simple groups outside S with the required noncompact local factor. Construct finite covering maps for nested compact opens at neat levels, calculate degrees through stabilizer indices and prove Cartesian diagrams for Hecke correspondences. In non-neat cases retain quotient groupoids and stabilizers, using AlgebraicModuliForArithmeticGeometry for stack language.

### AA.5. General-purpose validation

Identify the GL_1 quotient with the idele class construction and the split-center normalization with its norm-one subgroup. Identify the GL_2/Q upper-half-plane component using ModularCurvesPartII uniformization. Check compactness for a definite quaternion inner form and compare volumes under finite-index level changes. Export these comparisons, so both analytic automorphic forms and arithmetic cohomology use the same adelic quotient.

## Sources and Lean boundary

[Borel–Serre](https://www.e-periodica.ch/cntmng?pid=com-001%3A1973%3A48%3A%3A32), §§0–3,6,9–10, supplies the arithmetic action and reduction framework. [Arthur, *An introduction to the trace formula*](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §§2–5, fixes the adelic conventions and explains the split-center correction. Borel–Jacquet's Corvallis chapter is requested in the books register for full general analytic foundations. The finite-level topology API can be prototyped now in Suggested.lean; the advanced quotient statements depend on AA.0–4.

## Completion contracts added on 2026-09-15

**Applies to:** `AA.0`, `AA.1`, `AA.2`, `AA.3`, `AA.4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct the modulus character of each parabolic from its action on the Lie algebra of the unipotent radical. Prove its product formula on rational points, and prove the quotient integration formula first for compactly supported functions, then for integrable functions by a justified limit. Supply measurable sections or a section-free disintegration construction with sigma-finiteness hypotheses. Reduction theory must also produce the finite-index arithmetic stabilizers in the component decomposition.

### Producer–consumer contract

Export one Haar normalization and change-of-level formula to AF, AS and ALS. The finite-adelic double-coset set is generally not the entire arithmetic quotient; retain the archimedean factor and split-center quotient. The function-field extension uses FunctionFieldArithmetic, not automatic transportation of number-field reduction proofs.

### Acceptance and source route

For G_m compare norm-one ideles; for a parabolic in GL_2 calculate the nontrivial modulus; for nested neat levels compare quotient volumes and covering degree.

**Source route:** Arthur, introduction §§2–5; Borel–Serre reduction/corners; Tate thesis quotient measures. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
