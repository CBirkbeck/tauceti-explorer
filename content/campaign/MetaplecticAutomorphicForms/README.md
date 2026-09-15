# Metaplectic groups, Weil representations and automorphic theta kernels

Construct genuine automorphic theory on the metaplectic cover, with local/global Weil representations and the theta and half-integral-weight interfaces needed for quadratic-twist nonvanishing and Gross–Zagier. A central cover of a reductive group is not itself the reductive algebraic group supplied by the ordinary automorphic roadmap. The cocycle, splitting, topology and genuine central character are part of the construction.

## Ownership and scope

Use [AdelicAlgebraicGroups](../AdelicAlgebraicGroups/README.md) for local fields, adeles, Haar measures and quotient integration; existing Fourier analysis for Fourier transforms and Poisson summation; [SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md) for smooth admissible module methods; and [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md) for ordinary linear-group automorphic spaces. This area owns the extension to the metaplectic cover and the Weil representation. [GrossZagierAndArithmeticHeights](../GrossZagierAndArithmeticHeights/README.md) GZ.4–6 continues to own toric distinction, the exact Waldspurger formula and arithmetic/incoherent derivative comparisons. [RankZeroOneBSD](../RankZeroOneBSD/README.md) BSD.2 owns the twist-nonvanishing proof, not the common oscillator representation.

Begin over characteristic-zero local fields, with nontrivial continuous additive character and self-dual Haar measure. Develop the nonarchimedean smooth and archimedean Schwartz/Fréchet realizations separately and prove their adelic restricted-product compatibility. Positive-characteristic and arbitrary higher-degree covers require a separately sourced extension; the word metaplectic does not supply them.

## MP.0 — Symplectic and Heisenberg groups with topology

For a finite-dimensional symplectic space W, construct the Heisenberg central extension with group law determined by half the alternating pairing, its inverse and symplectic automorphisms. State the characteristic-not-two hypothesis for that formula; do not infer a residue-characteristic restriction from it over Q₂. Construct polarizations, their change maps, local compactness and Haar normalization. Build induced Schrödinger models on Schwartz–Bruhat functions and, at infinity, their Hilbert and smooth-vector realizations. Prove the central character and translation/modulation relations with the chosen Fourier convention.

## MP.1 — Stone–von Neumann and the metaplectic extension

Prove uniqueness of the irreducible Heisenberg representation with the specified nontrivial central character in the exact smooth or unitary category. Construct intertwining operators under symplectic transformations and their scalar ambiguity. From composition construct the topological central extension; identify the usual double cover by the normalized Weil-index cocycle. Prove associativity, continuity, independence under a coboundary change and the comparison between the scalar central extension and double-cover model. A chosen lift of each matrix is not a group homomorphism. Export genuine representations with central −1 acting as −1, rather than ordinary representations of Sp(W).

## MP.2 — Weil index and explicit operator formulas

Define the Weil index of a nondegenerate quadratic form by the correctly normalized oscillatory/Fourier integral. Prove orthogonal-sum, scaling, discriminant and Hilbert-symbol identities, including dyadic factors; work with the source's precise quadratic versus bilinear discriminant convention. Compute the Weil representation on unipotent, Levi and Fourier generators, prove their relations, and show that the formulas agree with MP.1's intrinsic representation. Supply change-of-additive-character and dual/conjugate formulas. The Weil index is not a globally chosen square root with no compatibility proof.

## MP.3 — Dual pairs and local theta modules

Construct orthogonal–symplectic and unitary dual-pair embeddings and the restrictions of the cover. Prove the splitting statements with the required auxiliary characters, dimensions and parity; odd-dimensional quadratic spaces generally give a genuine metaplectic, not linear symplectic, action. Define big theta modules by the appropriate coinvariants and small theta quotients when justified. Prove the elementary equivariance, admissibility/finite-length statements in the source's range, see-saw identities, Jacquet filtrations and the explicitly needed first-occurrence/vanishing comparisons. Kudla's 1996 notes supply these local constructions and their scoped theorems; a full all-residual-characteristic Howe-duality theorem is a separately source-qualified extension, not an assumed consequence of the definitions.

## MP.4 — Adelic cover and global Weil representation

Construct the restricted product of the local covers, including distinguished splittings over almost all integral maximal compact groups. Prove the product formula for Weil indices and the resulting canonical splitting of the rational symplectic group. Define the adelic Weil representation on the actual restricted tensor product of Schwartz spaces. Show compatibility with the rational splitting, local choices and changes of additive character. Treat the finite central quotient in the restricted product explicitly; an unrestricted product of local double covers is not the adelic metaplectic group.

## MP.5 — Theta kernels, convergence and automorphic spaces

For a rational quadratic/symplectic datum define the theta series by summing the transformed Schwartz function over rational vectors. Prove local uniform/absolute convergence in the permitted range, smoothness, transformation under rational points, moderate growth and the specified central character using Poisson summation. Construct genuine cusp and Eisenstein spaces on the cover, constant terms and Fourier–Whittaker expansions with the required splitting over unipotents. Prove convergence of the theta lift where used and give a named truncation/regularization construction when convergence fails. No unrestricted interchange of divergent theta integrals is permitted.

## MP.6 — Local–global comparison and reusable theta integrals

Prove factorization of pure-tensor theta kernels and the local integral decompositions needed by toric pairings, with compatible self-dual measures and ramified test functions. Construct spectral projection and see-saw identities under verified convergence or regularization hypotheses. Export the quadratic-character and quaternionic-norm-form instances to GZ.5; export the coherent/incoherent local sections and functional-equation conventions to GZ.6. The Waldspurger or arithmetic derivative identity itself remains there. A local theta-correspondence statement alone is not the global period formula.

## MP.7 — Half-integral weight, metaplectic Fourier coefficients and twists

Compare adelic genuine forms on the rank-one cover with classical half-integral-weight forms for the relevant congruence subgroups and multiplier systems. Define the metaplectic Eisenstein/Whittaker kernels used in Bump–Friedberg–Hoffstein and Friedberg–Hoffstein, including ramified local characters and test functions. Prove their transformation, Fourier coefficient and Euler-factor identities. Export the input to BSD.2, which proves the double-Dirichlet-series continuation, residues and nonvanishing with prescribed local conditions. A half-integral weight formal symbol is not a replacement for this cover or these kernels; no Goldfeld density assertion is imported.

## MP.8 — Genus-two similitudes, Jacobi forms and cover-specific Eisenstein analysis

Construct the specific double cover of GSp(4,R) and its arithmetic/adelic realization used by BFH, including the similitude action and the compatible Heisenberg semidirect product defining the Jacobi group. The rank-one Mp₂ comparison and even-dimensional quaternionic theta kernel do not supply this object. Define Jacobi modular forms, theta decomposition, half-integral-weight automorphy factors and the genus-two genuine Eisenstein series attached to the elliptic newform. Prove the Fourier–Jacobi/Whittaker expansions with actual local test functions.

Develop the cover-specific constant-term, continuation, functional-equation and residue calculations required by BFH. Import analytic estimates from AutomorphicSpectralTheory only after proving their adaptation to this cover; linear-reductive-group results are not automatic suppliers. Prove convergence in the initial chamber, meromorphic continuation through the prescribed intertwining operators and the permitted Fourier-coefficient/residue interchanges. BSD.2 owns the final twist residue/positivity argument and local-condition selection. This is the BFH route budgeted: a proposed alternative does not erase its prerequisites without a proved replacement.

## Tests and source contract

Test the Heisenberg commutator, cocycle identity and a change of polarization; verify the Fourier-generator relation at an odd place, Q₂ and R. Check that a genuine form cannot descend to an ordinary function on Sp. Compare the adelic rational splitting and product of local Weil indices, and test the theta transformation for a one-dimensional quadratic lattice with its actual multiplier. For each consumer verify that its central character, square-root and Haar factors agree before using an integral identity.

Primary foundations are Weil, *Sur certains groupes d'opérateurs unitaires* (Acta Math. 111, 1964), Chapters I–III; Kudla, *Notes on the local theta correspondence* (1996), Chapters I–IV; and the exact Bump–Friedberg–Hoffstein/Friedberg–Hoffstein papers already recorded for BSD.2. Their full proofs, not a summary's assertion of a theta correspondence, are implementation targets. The round-two source register records access and version checks. Stronger Howe-duality/regularized-integral results must be pinned to an actual theorem before broadening the named range.

Suggested.lean proves elementary cocycle algebra on actual Mathlib rings. It is a non-exhaustive prototype, not a formalization of the locally compact or analytic construction. Unavailable advanced carriers remain precise README contracts, never axioms or arbitrary predicates storing the target theorem.

## Completion contracts added on 2026-09-15

**Applies to:** `MP.0`, `MP.1`, `MP.2`, `MP.3`, `MP.4`, `MP.5`, `MP.8`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct the scalar cocycle from intertwining Schrödinger models, then prove the normalization to the double cover using the Weil index; the polarized bilinear cocycle seed only addresses the Heisenberg group. For each dual pair state the cover splitting character and prove how changing it twists the theta representation. In MP.8 construct the similitude/Jacobi action and its cover-specific intertwining integrals before importing any ordinary spectral estimate.

### Producer–consumer contract

Return genuine representations and the rational adelic splitting with local self-dual measures. Theta lifts have a specified convergence range or a constructed regularization. The local oscillator representation does not by itself prove a global period formula or nonvanishing theorem.

### Acceptance and source route

At Q_2, the field has characteristic zero even though residue characteristic is two. Check Weil-index factors there, at R, and under change of additive character; verify the central −1 acts genuinely.

**Source route:** Weil 1964 Chapters I–III; Kudla 1996 Chapters I–IV; BFH/FH cover-specific sources. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
