# Automorphic L-functions and local factors

## Scope

Develop reusable analytic local factors and zeta-integral machinery: Tate's GL_1 theory, standard GL_n theory and GL_n×GL_m Rankin–Selberg theory, together with the general unramified L-group definition. The general definition of a partial L-function L^S(s,π,r) does not assert meromorphic continuation or a functional equation for every reductive group and every r. Named analytic theorems in this roadmap concern the families specified in AL.2–4.

Consume GlobalNumberFields character/adeles APIs, ArithmeticDirichletSeries for common convergence and Dirichlet-series arguments, AdelicAlgebraicGroups measures, SmoothRepresentationsOfLocalGroups Whittaker/induction/Satake, and AutomorphicFormsOnReductiveGroups cusp forms. The p-adic analytic functions are owned by the p-adic L-function branch; this roadmap supplies their complex interpolation inputs and normalization identities.

## Conventions

Fix a nontrivial additive character ψ of A/F and self-dual local additive Haar measures. Record the resulting multiplicative measure separately. Use ψ-hat Fourier transform with a declared sign; prove Fourier inversion including the reflected argument. Local gamma factors depend on ψ and measure; epsilon factors have explicit twist and conductor formulas. Distinguish arithmetic and unitary normalizations of π and all powers of |det|. Complex L-functions have complex-analytic domains; formal Euler products and p-adic functions are separate carriers connected by evaluation theorems.

## Milestones

### AL.0. Schwartz–Bruhat and Fourier theory

Construct local Schwartz–Bruhat spaces at finite and infinite places, Fourier transforms, self-duality of local additive groups and the restricted tensor-product adelic space. Prove Fourier inversion, change-of-character/change-of-measure formulas and adelic Poisson summation, with the diagonal lattice and volume from GlobalNumberFields. Develop holomorphic parameter integrals, Mellin transforms and the estimates that justify differentiation under integration.

### AL.1. Tate zeta integrals

For a quasi-character χ and Schwartz–Bruhat f construct ∫f(x)χ(x)|x|^s d×x, prove convergence in the stated half-plane, rationality in q⁻ˢ at finite places and meromorphic continuation at infinite places. Define L, epsilon and gamma through their exact normalizations and prove the local functional equation. Compute unramified and ramified characters, Gauss sums, real/complex gamma factors, conductor and character twists. Prove the global integral Euler factorization, continuation and functional equation using Poisson summation, retaining the trivial-character poles.

### AL.2. Godement–Jacquet standard GL_n factors

Use Schwartz functions on M_n(E) and matrix coefficients of irreducible admissible representations to construct local zeta integrals. At nonarchimedean places prove rationality in q^(-s), the fractional-ideal characterization and local functional equation. At real and complex places use the Casselman–Wallach globalization, Schwartz estimates and meromorphic parameter integrals to construct the gamma factors and prove their functional equation; a Laurent-polynomial gcd is not an archimedean construction. Prove the unramified spherical calculation and compare with Satake. Build the adelic global integral for cuspidal GL_n representations, prove Euler factorization, analytic continuation and functional equation with the n=1 exceptional pole separated. Supply bounds and normalization conversions usable in interpolation formulas; integrals on arbitrary reductive groups do not follow from the matrix-space proof.

### AL.3. Rankin–Selberg factors and period comparisons

Import the nonarchimedean Whittaker/derivative constructions from SmoothRepresentationsOfLocalGroups SR.5 and compare their complex specialization with the classical Whittaker model. Construct the GL_n×GL_m local zeta integrals, convergence, nonarchimedean rationality and gcd-normalized factors. Separately develop the archimedean Whittaker functional and uniqueness/continuity API on the AF.1 globalization, including completed tensor products and the estimates in Jacquet's *Archimedean Rankin–Selberg Integrals*, §§2–16. Prove holomorphic-multiple, vertical-strip, gamma-factor and functional-equation statements there without a finite-place gcd argument. Prove unramified calculations and the global unfolding for cuspidal data. Retain poles in the contragredient/twist case and state analytic nonvanishing results only in their proved regions. Compare integral rational structures, Gauss sums and complex periods with the chosen cohomological normalization. A period is defined up to its actual scalar ambiguity; canonical equalities require additional comparison theorems.

### AL.4. General unramified L-group factors

For an unramified place and an algebraic representation r of the relevant L-group define the Euler polynomial from the Satake semisimple conjugacy class. Prove invariance under conjugacy, direct sum, tensor product, duality and scalar extension. Construct the partial Euler product and prove convergence where a supplied eigenvalue bound ensures it. Provide comparison with AL.1–3 and with Weil–Deligne factors on the Galois side under an actual local-compatibility theorem. No generic analytic continuation or local Langlands correspondence is inserted as an axiom.

### AL.5. Interfaces for p-adic interpolation

Supply finite-set Euler-factor removal/reinsertion, imprimitive/primitive comparisons, critical-value normalization, functional-equation sign and algebraicity inputs for the precise GL_2/Rankin families already in AutomorphicPadicLFunctions. Prove compatibility of conductor exponents, local test vectors and character twists. Handle vanishing Euler factors by an explicit limiting or derivative result where needed; never cancel an exceptional zero. Export formulas both as formal local polynomials and as complex evaluations.

## Sources and acceptance

[Tate's thesis](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf) supplies AL.0–1. Godement–Jacquet, *Zeta functions of simple algebras*, LNM 260, and Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions*, supply AL.2–3; [Jacquet's archimedean treatment](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf) supplies the separate infinite-place proof. These are separately listed in the reference acquisition register. The split torus, a ramified GL_1 character, unramified GL_2 and a vanishing interpolation Euler factor are mandatory validation examples. Suggested.lean contains representative local-polynomial and Mellin-integral signatures.

## Completion contracts added on 2026-09-15

**Applies to:** `AL.0`, `AL.1`, `AL.2`, `AL.3`, `AL.4`, `AL.5`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Give each local factor three separate constructions: a convergent integral with its half-plane, its rational/meromorphic continuation, and its normalized generator or gamma factor. Prove uniqueness only after specifying normalization. At ramified places supply the Whittaker model and nonzero test-vector calculation; a spherical calculation supplies no ramified factor. For Rankin–Selberg periods retain the comparison of contragredient versus complex-conjugate coefficients and the actual scalar ambiguity.

### Producer–consumer contract

Export L, epsilon and gamma with the equation gamma(s)=epsilon(s)L(1−s,dual)/L(s), after fixing additive character, normalization and measure. Prove change-of-character formulas and the local-global product of measures. The Bochner-integral seed can return zero for nonintegrable inputs; theorem interfaces must carry convergence and identify continuation in the initial region.

### Acceptance and source route

Check a ramified character, the trivial-character pole, an archimedean gamma factor, and an exceptional interpolation zero. A zero factor may not be canceled in AL.5.

**Source route:** Tate thesis local/global functional equations; Godement–Jacquet; Jacquet archimedean Rankin–Selberg §§2–16. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
