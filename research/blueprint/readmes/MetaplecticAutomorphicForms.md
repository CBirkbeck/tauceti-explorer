# Metaplectic groups, Weil representations and automorphic theta kernels

*Roadmap `MetaplecticAutomorphicForms`: the whole-roadmap document.*

This roadmap builds the metaplectic side of automorphic forms. It starts from the Heisenberg group of a symplectic space and ends at the theta kernels, theta integrals, half-integral-weight forms and genus-two Eisenstein series that other roadmaps consume: Waldspurger's formula and the Gross–Zagier kernels (GrossZagierAndArithmeticHeights GZ.5–GZ.7), quadratic-twist nonvanishing with prescribed local conditions (RankZeroOneBSD BSD.2), Jacobi forms, theta functions and mock modular forms (QSeriesPartitionsAndMockModularForms), Fourier–Jacobi calculations for unitary Eisenstein series (AutomorphicCongruences), and the theta lifts behind the local Langlands correspondence for GSp₄ (ModularityAndLanglandsExtensions ML.4).

A central cover of a symplectic group is not a reductive group. Its cocycle, its splittings over unipotent and rational subgroups, its topology and the genuine central character have to be constructed; none of them follows from the theory of linear groups. The roadmap therefore proves the adaptation of every imported linear-group result (smooth representations, automorphic forms, Eisenstein series, spectral theory) to the cover, and states each source theorem with the range in which its source proves it.

## How this document is organised

The roadmap is planned in three packets: the two accepted parts `MetaplecticAutomorphicForms--MP.0` (layers MP.0–MP.7, 176 targets) and `MetaplecticAutomorphicForms--MP.8` (layer MP.8, 85 targets), and the whole-roadmap packet `MetaplecticAutomorphicForms`, which adds five targets and records the edits a whole-roadmap reading found necessary in the parts. The atlas builds the roadmap from all three, so the effective roadmap has 266 targets. Every node section below is generated from those packets, so that document and packets agree node for node: its statement, hypotheses, proof outline, sources (locator and what the place states, in our words), uses, API, Checks (the unit tests), acceptance properties and prerequisites. A section marked **New in the whole-roadmap pass** belongs to the whole-roadmap packet; a line **Routed edit** gives a change that a restructure record of the whole-roadmap packet asks the part's owner to apply. The parts themselves are unchanged, so prerequisites are printed as the parts state them.

## Purpose and scope

- **MP.0, Heisenberg groups and Schrödinger models.** The Heisenberg group as Tau Ceti's factor-set extension of a bilinear form, in characteristic two as well, with its inverse, commutator and centre; the half-alternating convention B = ½ω when 2 is invertible; the action of the isometry group and polarized coordinates; the central character extended trivially along the canonical section; the topology, the product Haar measure, the Schrödinger model on Schwartz–Bruhat functions, its induced form, the Hilbert model on L² and its smooth vectors.
- **MP.1, Stone–von Neumann and the metaplectic extension.** The smooth and unitary Stone–von Neumann theorems, the intertwiner lines with their scalar ambiguity, and Weil's normalizer extension of Sp(W) by the circle. As planned in the part, MP.1 also contains Rao's normalized factor set, the double cover Mp(W) = ker λ₂ and the genuine Weil representation; restructure R1 moves these three targets to MP.2, because they use the Weil index and the Leray cocycle.
- **MP.2, Weil index and explicit operator formulas.** The Weil index γ_ψ(q) as the Fourier scalar of an oscillatory distribution, its Hilbert-symbol identities including the dyadic case, the Leray invariant and Leray cocycle, the Weil operators on Levi, unipotent and Fourier generators and their relations, change of character and duality, and the quadratic uncertainty principle; after R1, also the Rao cocycle, the double cover and the genuine Weil representation.
- **MP.3, dual pairs and local theta modules.** Orthogonal–symplectic and unitary dual pairs with their splittings; big and small theta; finite length and Howe duality in their sourced ranges; see-saws, persistence, first occurrence, Kudla's Jacquet filtration, the doubling filtration and the conservation relations; unitary dichotomy, unramified parameters and Hecke compatibility; Ichino–Prasanna's quaternionic similitude splittings; and the classical theta lifts that the exceptional correspondences of Gan–Savin use as inputs. After R1 it also holds the Hermitian uncertainty principle and the Hermitian operator normalizations.
- **MP.4, the adelic cover and the global Weil representation.** Unramified compact splittings, the adelic cover as a restricted product modulo the product-one central subgroup, Weil's product formula, the canonical rational splitting, the adelic and finite Weil representations, compatibility with every choice, and Lafforgue's conditional function-field programme recorded as a programme.
- **MP.5, theta kernels, convergence and automorphic spaces.** The theta kernel, its smoothness and moderate growth, genuine automorphic forms with their constant terms and Whittaker coefficients, genuine Eisenstein families, the global theta lift, Weil's convergence criterion and the regularized theta integral; Yuan–Zhang's extended Schwartz spaces and unit-quotiented theta series; and the ideal-class theta series of an imaginary quadratic field with its modularity and transformation law.
- **MP.6, local–global comparison and reusable theta integrals.** Measure conventions, Siegel–Weil sections, the anisotropic Siegel–Weil formula and the regularized first- and second-term identities of Gan–Qiu–Takeda, coherent and incoherent sections, the doubling form of the theta pairing and the Rallis inner product formula, the global see-saw, the norm-form theta integrals and toric pairing exported to Gross–Zagier, and the Jacobi theory: the adelic Jacobi group, Jacobi spaces, central Fourier–Jacobi extraction and theta decomposition from the part, and from the whole-roadmap pass the metaplectic modular group Mp(2,ℤ) with vector-valued forms of half-integral weight, classical Jacobi forms of lattice index, the unitary Jacobi group and the theta-paired Fourier–Jacobi coefficients.
- **MP.7, half-integral weight, metaplectic Fourier coefficients and twists.** The theta multiplier (with the product formula and nonvanishing of the theta function), weight-one-half Maass forms and Eisenstein series, the Kohnen plus space, half-weight Kloosterman sums, resolvent and Poincaré series, the Kohnen–Salié identity and the three cycle-integral cases of Duke–Imamoḡlu–Tóth, the Shimura correspondence with its trace formulas and Duke's coefficient bound, Biró's lift, and the comparison of adelic and classical half-weight forms.
- **MP.8, genus-two similitudes, Jacobi forms and cover-specific Eisenstein analysis.** Integral Fourier-index arithmetic; the Siegel space of degree two, positive similitudes and their square-root double cover; the BFH arithmetic Jacobi realization, genus-two theta series and theta decomposition; the elliptic-newform seed and the Jacobi Eisenstein series; archimedean Whittaker functions, the Novodvorsky transform and the nonvanishing local tests; matrix Möbius inversion, two-cusp unfolding and local Euler factors; the genuine continuation, constant terms and two-variable polar formula; and, after R1, the two interfaces through which the genus-two kernel reaches BSD.2.

The proved endpoints are local and global constructions with their source-qualified theorems: the oscillator and metaplectic constructions of Weil and Kudla, Howe duality in the ranges of Gan–Takeda, the Siegel–Weil and Rallis formulas in the ranges of Gan–Qiu–Takeda, the Shimura correspondence and trace formulas of Duke–Imamoḡlu–Tóth, the genus-two analysis of Bump–Friedberg–Hoffstein, the theta decomposition of Jacobi forms of lattice index (Skoruppa) and the Fourier–Jacobi periods of Gan–Gross–Prasad. Lafforgue's metaplectic programme is recorded as a programme. Wherever a source's proof was not read, or a supplier does not yet state what is needed, the node says so and a gap records the missing input. Every layer is planned and none is closed.

## Boundaries

### What this roadmap imports

- **The pinned libraries.** Mathlib supplies bilinear maps and forms with their isometries, multiplicative 2-cocycles, semidirect products, roots of unity, representation coinvariants, continuous representations, Schwartz functions, quadratic maps and forms, the symplectic and unitary matrix groups, positive definite matrices, the one- and two-variable Jacobi theta functions and their transformation laws, infinite products and their nonvanishing criterion, the Gamma function, Γ₀(N), modular forms of integral weight, the Möbius function, Smith normal form, the Gaussian integral, uniqueness of power series and Artinian modules. Tau Ceti supplies the group extension of a factor set (with its inclusion, projection, canonical section, rescaling equivalence and central inclusion for the trivial action), the trivial multiplicative action and the isometry group of a bilinear form.
- **Tau Ceti roadmaps**, cited and never planned here: QuadraticFormInvariants layer 6C (Hilbert symbols and local Hasse invariants, including the dyadic case); GlobalQuadraticForms layers 3, 4, 7 and 8 (real symbols, admissible local systems, existence and classification of global forms); ClassicalGroups layer 0 (classical groups and standard representations); Completed IntegralLattices layer 3 (finite bilinear and quadratic modules); ModularForms layers 0, 2, 4, 6 and 7 (Nebentypus forms, Hecke operators, newforms, Fricke operators, L-functions); FuchsianOrbifolds layer 6 (the level-one modular quotient); CompactGroups layer 5 (Peter–Weyl density on U(2)).
- **AutomorphicLFunctionsAndLocalFactors AL.0–AL.3.** Local and adelic Schwartz–Bruhat spaces, Fourier inversion and Poisson summation, the K-Bessel kernel (AL.0); Tate and Godement–Jacquet factors (AL.1, AL.2); Rankin–Selberg factors (AL.3). The finite-dimensional, joint archimedean and oscillatory extensions of AL.0 are requested as a Part II of it; the Bessel functions I_ν and J_ν are requested from AL.0 by the whole-roadmap packet.
- **AdelicAlgebraicGroups AA.0–AA.3.** Restricted-product Haar measures and factorizable integrals, adelic groups and quotient integration, Tamagawa measures, Siegel sets and adelic reduction theory.
- **SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3.** The abelian category of smooth representations, compact and normalized parabolic induction, Jacquet modules, Frobenius reciprocity and the geometric lemma, admissibility and finite length.
- **AutomorphicFormsOnReductiveGroups AF.1–AF.3, AF.5.** Harish-Chandra modules and globalization (AF.1); automorphic forms and uniform moderate growth (AF.2); constant terms, compact unipotent quotients and the rapid decay of cusp forms (AF.3); the classical-to-adelic GL₂ dictionary (AF.5).
- **AutomorphicSpectralTheory AS.0–AS.2.** Laplacian domains, resolvents and spectral residues, induced families, Eisenstein convergence, intertwining operators and continuation on linear groups. The weight-k hyperbolic Laplacian is requested from AS.0 by the whole-roadmap packet.
- **Local Langlands inputs**, after restructure R2: tempered local packets for unitary groups (EndoscopicTransferAndUnitaryTraceComparison ET.4), Deligne–Langlands local constants (ArithmeticGaloisRepresentations R01.2), the quaternionic local Jacquet–Langlands comparison (GL2AutomorphicRepresentationsAndTransfer R17.1) and the Arthur–Mok extended Langlands parameters (ModularityAndLanglandsExtensions ML.4).
- **Newforms**, after restructure R3: the dictionary between primitive newforms and cuspidal automorphic GL₂ classes (GL2AutomorphicRepresentationsAndTransfer R16.6).
- **Other roadmaps.** MordellLawrenceVenkatesh LV.3 for Lagrangian complements and symplectic bases (a characteristic-free lemma that LV.3 owns); GeometryOfNumbersAndQuadraticArithmetic GN.2 and GN.3 for genus characters, ideal classes, trace duals and oriented cycles; ClassicalArithmeticCompletion CA.4 for the formal theta product; GeometricSatakeAndFusion GS3 and GlobalShtukasAndFunctionFieldLanglands GS.5 for the function-field programme of MP.4 (see R7).

### What other roadmaps import from it

- GrossZagierAndArithmeticHeights takes the norm-form theta integrals and Siegel–Weil identities (MP.6 → GZ.5), the coherent and incoherent sections (GZ.6), the ideal-class theta series and the extended Weil action (MP.5).
- RankZeroOneBSD BSD.2 takes the BFH metaplectic kernel and the two-variable polar formula (MP.7 and MP.8; after R1 both interfaces sit in MP.8).
- QSeriesPartitionsAndMockModularForms takes the theta multiplier, half-integral weight forms and multiplier systems, the finite Weil representation, Jacobi forms and the theta decomposition (MP.4, MP.6, MP.7). The whole-roadmap pass plans the general objects it asks for in MP.6 and MP.7, so that it can cite them by node.
- AutomorphicCongruences L2s takes the Jacobi and Fourier–Jacobi structures (MP.6), including the unitary instance planned by the whole-roadmap pass.
- GL2AutomorphicRepresentationsAndTransfer R17.4 takes the theta series attached to a quadratic character and the genuine Eisenstein series on the rank-one cover (MP.5); GeometryOfNumbersAndQuadraticArithmetic GN.3 and GN.4 take the lattice theta kernel and the half-integral theta coefficients (MP.5, MP.7); ModularityAndLanglandsExtensions ML.4 and ML.5 take the similitude theta correspondences and local descent inputs (MP.3).

### Upstream roadmaps that border this one

- **Theta Series** (TauCetiRoadmap pull request #286, open). It owns Poisson summation for a full-rank lattice, the theta series of positive definite lattices and the Hecke–Schoeneberg theorem. The binary ideal-class instance of MP.5 is a special case (restructure R8); the atlas does not yet track that roadmap, so no node can cite it.
- **IntegralLattices** (TauCetiRoadmap main). It lists the Weil representation of SL(2,ℤ) on ℂ[L^∨/L] and half-integral weight forms as unowned upstream; here MP.4/finite-weil-representation and MP.6–MP.7 plan them. It names a successor for indefinite theta and the Siegel–Weil theorem, whose scope would overlap MP.5–MP.6 (see the upstream notes at the end).

### What is not here

- The Shimura–Waldspurger correspondence for Mp₂ₙ, anomaly criteria for splittings, and Weil representations over local fields of odd positive characteristic and global function fields: the Part II directions of DESIGN-MetaplecticAutomorphicFormsPartII.
- The general doubling method for classical groups: AutomorphicLFunctionsAndLocalFactors, Part II (doubling). MP.6 plans only the theta-pairing case in Gan–Qiu–Takeda's normalization.
- Weak and weakly holomorphic Jacobi forms, Rankin–Cohen brackets, eta quotients and q-series identities: QSeriesPartitionsAndMockModularForms, building on MP.6 and MP.7.
- Waldspurger's formula itself (GZ.5), incoherent Eisenstein derivatives (GZ.6) and the final residue and positivity argument for quadratic twists (BSD.2).
- Metaplectic geometric Satake and metaplectic shtukas: requested as Part II extensions of GeometricSatakeAndFusion GS3 and GlobalShtukasAndFunctionFieldLanglands GS.5.

## Conventions

The parts were written separately and from different sources, and in a few places they write the same object in different coordinates. Node text keeps its packet's notation; this list fixes what the letters mean and how the conventions convert.

- **Heisenberg coordinates.** Part MP.0 writes the Heisenberg group of a bilinear form B : W × W → C as Tau Ceti's factor-set extension E_B in coefficient-first coordinates, (t, x)(s, y) = (t + s + B(x, y), x + y). No division by 2 is needed, so E_B exists in characteristic two. When 2 is invertible and ω is alternating, the Heisenberg group of (W, ω) is E_{½ω}; only the characteristic matters, so this holds over ℚ₂. Kudla and part MP.8 write the space coordinate first: H(W) = W × ℝ with (w, t)(w′, t′) = (w + w′, t + t′ + ω(w, w′)/2) is E_{½ω} after the swap. Polarized coordinates E_{½(B−Bᵀ)} ≃ E_B are MP.0/polarization-equivalence; the BFH translation operators are written in such polarized coordinates (restructure R5, row 4).
- **Actions.** Native actions are left actions. Kudla's right action of Sp(W) is converted by x·g = g⁻¹x, and the metaplectic cover uses T_g(w) = wg⁻¹ to compare Rao's coordinates with the native left action. Similitudes act on the Siegel space on the left, gZ = (AZ + B)(CZ + D)⁻¹, with J = [[0, −I], [I, 0]].
- **Additive characters and Fourier transforms.** ψ is a nontrivial continuous unitary character of the local field, or of 𝔸/F globally, with self-dual Haar measures; e(t) = exp(2πit) and ψ_m(t) = e(mt). Over ℚ the standard global character has ψ_∞(q) = e(q) and ψ_f(q) = e(−q), which fixes the phases of the finite Weil representation ω_L and of its complex conjugate ρ_L. The Weil index uses the positive Fourier kernel ψ(x·y); Kudla's long Weyl element acts by the negative-kernel transform; Mathlib's Fourier integral has kernel e(−⟨v, w⟩). Each node names its kernel.
- **Quadratic forms.** B_q(x, y) = q(x + y) − q(x) − q(y). The Weil-index formula uses det q = ∏ a_i for q = Σ a_i x_i², not det B_q = 2^d ∏ a_i, and η = ψ/2 with γ(a, η) = γ(η·ax²)/γ(η·x²). A half-integral matrix has integral even diagonal after doubling: 2F integral with even diagonal. The Hermitian quadratic form of a Hermitian space is q(x) = ½Tr⟨x, x⟩ = ⟨x, x⟩; the symplectic form of a skew-Hermitian space W regarded over k₀ is Tr_{k/k₀}⟨ , ⟩.
- **Covers and genuineness.** S_ψ is Weil's normalizer extension of Sp(W) by U(1) acting on L²(X); λ₂ is its continuous character restricting to z ↦ z² on the circle; Mp(W) = ker λ₂ is the metaplectic double cover. Unitary groups split into S_ψ (after the choice of auxiliary characters), not in general into the double cover: over ℝ the double cover restricted to SO(2) = U(1) is the connected double cover of the circle. A function or representation on a cover is genuine when the nontrivial central element acts by −1. The adelic cover is the restricted product of local covers modulo the product-one subgroup of ⊕_v μ₂. Mp(2,ℤ) is the group of pairs (A, w) with w² = cτ + d.
- **Gan–Qiu–Takeda parameters (MP.5, MP.6).** For a type-I pair, dim V = m = m₀ + 2r with r the Witt index, dim W = n, d(n) = n + ε₀, s₀ = (m − d(n))/2 and ρ_H = (m − r − ε₀)/2; A_k and B_k are the Laurent coefficients of the Siegel Eisenstein series at s₀ and of the regularized theta integral at ρ_H; τ(H) = 1 for orthogonal groups except O(1) and split O(1, 1), where it is 1/2, and τ(H) = 2 for unitary groups.
- **Gan–Gross–Prasad conventions (MP.6).** The Fourier–Jacobi period pairs f with θ_ν(φ), without complex conjugation; a source pairing with the conjugate theta function uses the data (ψ⁻¹, µ⁻¹). In the skew-Hermitian case µ is a character with µ|_{k₀^×} = ω_{k/k₀}.
- **Half-integral weight (MP.6, MP.7).** θ(z) = Σ_n e(n²z) = jacobiTheta(2z); its unitary normalization is y^{1/4}θ(z) and the multiplier is J(γ, z) = θ(γz)/θ(z) on Γ₀(4). Weight-k slash operators of half-integral k are taken on Mp(2,ℤ), (f|_k(A, w))(τ) = w(τ)^{−2k} f(Aτ); the principal-branch section of SL(2,ℤ) has a ±1-valued cocycle. A holomorphic form f corresponds to y^{k/2}f, and the conjugation by y^{k/2} changes the Laplacian by (k/2)(1 − k/2), which is 3/16 at k = 1/2. The weight-one-half Laplacian has eigenvalue 1/4 + (r/2)², so the spectral parameter is r/2 in weight one half and r in weight zero. The plus space is cut out by n ≡ 0, 1 mod 4. The Petersson product is ∫_{Γ₀(4)\ℍ} |F|² dμ, not divided by the area.
- **Jacobi forms of lattice index (MP.6).** F is a positive definite half-integral n × n matrix, F[x] = xᵗFx, ϑ_{F,x}(τ, z) = Σ_{r ≡ x mod 2Fℤⁿ} e(τF⁻¹[r]/4 + rᵗz), and W(F) is the Weil representation of Mp(2,ℤ) on ℂ[ℤⁿ/2Fℤⁿ] with (T, 1)e_x = e(F⁻¹[x]/4)e_x; it equals ρ_{L_F} for L_F = (ℤⁿ, 2F).
- **Bump–Friedberg–Hoffstein data (MP.8).** f is a normalized newform of even weight k ≥ 2, trivial character and conductor M; N is an auxiliary level with 8M | N; the index m satisfies N | m and 4m | N², and a = m/N. The auxiliary transform f̂(τ) = τ^{−k} f(−1/(Nτ)) uses N, while the Fricke involution and the completed L-function of f use M. K = Sp₄(ℝ) ∩ O₄(ℝ) ≅ U(2). The genus-two theta series θᵃ_ν(Z, W) = Σ_{R ≡ ν mod 2a} e(Z[R]/(4a) + RᵀW) has squared norm √det(Y)/(4a) for Lebesgue measure on ℂ²/(ZZ² + Z²) against exp(−4πa Y⁻¹[Im W]); BFH Proposition 2.1 prints 2a (source issue E-WR-1, restructure R6).
- **Locators.** "printed p. n" is the page number on the page; "PDF n" is the physical page of the file whose hash is recorded. In the published BFH scan used here, the PDF page is the printed page minus 541 (the earlier reader of this roadmap gave 542; pp. 550–554 and 580–581 were checked).
- **Identifiers.** Node ids are `MetaplecticAutomorphicForms:<layer>/<slug>` and are written below without the roadmap prefix. A node keeps its id when a routed edit moves it to another layer.

## Dependency order of the layers

The declared order MP.0 → MP.1 → … → MP.8 is a dependency order only after restructure R1. As the parts stand, fifteen prerequisites run from a later layer to an earlier one:

| Target (layer as planned) | Uses (later layer) | After R1 |
|---|---|---|
| MP.1/rao-factor-set | MP.2/leray-cocycle, MP.2/weil-index-identities | moves to MP.2 |
| MP.1/metaplectic-double-cover | MP.2/leray-cocycle | moves to MP.2 |
| MP.1/genuine-oscillator | (uses the double cover) | moves to MP.2 with it |
| MP.2/hermitian-uncertainty | MP.3/unitary-splitting | moves to MP.3 |
| MP.2/hermitian-operator-normalizations | MP.3/unitary-splitting | moves to MP.3 |
| MP.5/ideal-class-theta-general-transform | MP.6/ideal-lattice-poisson | MP.6/ideal-lattice-poisson moves to MP.5 |
| MP.7/bfh-kernel-import | five MP.8 targets | moves to MP.8 |
| MP.7/ramified-quadratic-twist-kernel-inputs | four MP.8 targets | moves to MP.8 |

MP.1 and MP.2 were mutually dependent: MP.2's Leray cocycle uses MP.1's scalar extension and MP.1's double cover uses MP.2's Weil index. After R1, MP.1 is Stone–von Neumann with Weil's scalar extension (the metaplectic extension of its title) and MP.2 identifies the double cover by the Rao cocycle of normalized Weil indices. A simulation over all 266 targets with R1 and R5 applied finds no prerequisite running backwards and at most six planets per layer.

## Layer overview

| Layer | Title | Targets in the parts | New targets | Definitions and constructions | Theorems and comparisons | Planets |
|---|---|---:|---:|---:|---:|---:|
| [MP.0](#layer-mp-0) | Symplectic and Heisenberg groups with topology | 18 | 0 | 9 | 9 | 4 |
| [MP.1](#layer-mp-1) | Stone–von Neumann and the metaplectic extension | 7 | 0 | 4 | 3 | 5 |
| [MP.2](#layer-mp-2) | Weil index and explicit operator formulas | 10 | 0 | 2 | 8 | 4 |
| [MP.3](#layer-mp-3) | Dual pairs and local theta modules | 44 | 0 | 7 | 37 | 6 |
| [MP.4](#layer-mp-4) | Adelic cover and global Weil representation | 8 | 0 | 4 | 4 | 5 |
| [MP.5](#layer-mp-5) | Theta kernels, convergence and automorphic spaces | 16 | 0 | 9 | 7 | 6 |
| [MP.6](#layer-mp-6) | Local–global comparison and reusable theta integrals | 22 | 4 | 12 | 14 | 6 |
| [MP.7](#layer-mp-7) | Half-integral weight, metaplectic Fourier coefficients and twists | 51 | 1 | 16 | 36 | 6 |
| [MP.8](#layer-mp-8) | Genus-two similitudes, Jacobi forms and cover-specific Eisenstein analysis | 85 | 0 | 34 | 51 | 6 |

Counts are by the layer each target has in its packet today; restructure R1 moves eight targets (see the dependency order above).

<a id="layer-mp-0"></a>

## MP.0 — Symplectic and Heisenberg groups with topology

**Layer statement.** For a finite-dimensional symplectic space W, construct the Heisenberg central extension with group law determined by half the alternating pairing, its inverse and symplectic automorphisms. State the characteristic-not-two hypothesis for that formula; do not infer a residue-characteristic restriction from it over Q₂. Construct polarizations, their change maps, local compactness and Haar normalization. Build induced Schrödinger models on Schwartz–Bruhat functions and, at infinity, their Hilbert and smooth-vector realizations. Prove the central character and translation/modulation relations with the chosen Fourier convention.

**Status.** Planned. 18 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 18 accepted targets of MP.0 are those of the part MetaplecticAutomorphicForms--MP.0, assembled with this packet. No routed edit changes an MP.0 target; R5 makes MP.8/bfh-translation cite MP.0/bilinear-factor-set and MP.0/polarization-equivalence by id.
- (accepted part) The finite-dimensional vector-space Fourier transform, self-dual measures and joint archimedean Schwartz carriers come from an AL.0 Part II request; the Hilbert and smooth-vector models need the native L² and Fréchet inputs the part names.

**Planets.** Heisenberg group ([`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set)); Symplectic action ([`MP.0/isometry-action`](#n-mp-0-isometry-action)); Heisenberg central character ([`MP.0/central-character`](#n-mp-0-central-character)); Schrödinger representation ([`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model)).

**Dependencies.**

- AutomorphicFormsOnReductiveGroups:AF.1: `AutomorphicFormsOnReductiveGroups:AF.1`.
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`.
- MordellLawrenceVenkatesh:LV.3: `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`.
- SmoothRepresentationsOfLocalGroups:SR.0:abelian-category: `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.
- SmoothRepresentationsOfLocalGroups:SR.2: `SmoothRepresentationsOfLocalGroups:SR.2`.
- Pinned libraries: 41 declarations, listed under each target.

**Acceptance tests of the layer.**

- Heisenberg group: No division by 2 is used; the construction works in characteristic two.
- Symplectic action: This is an honest action on E_B; it does not construct an honest symplectic action on an irreducible representation space.
- Heisenberg central character: Uniqueness is asserted only with both the central restriction and triviality on the chosen section.
- Schrödinger representation: The center acts by ψ, and modulation and translation have the required ordered commutator.

<a id="n-mp-0-bilinear-factor-set"></a>

### Bilinear Heisenberg factor set — `MP.0/bilinear-factor-set`

construction · from the MP.0 part · planet “Heisenberg group”

**Statement.** Construct α_B(x,y)=B(x,y), viewed multiplicatively, as a native normalized factor set on Multiplicative W with coefficients Multiplicative C and trivial action. Its existing extension E_B has multiplication (t,x)(s,y)=(t+s+B(x,y),x+y). The maps t↦(t,0) and (t,x)↦x and their exactness are the native inl, rightHom and groupExtension.

**Hypotheses.**

- R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.
- Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

**Proof outline.**

1. Bilinearity gives B(x+y,z)+B(x,y)=B(y,z)+B(x,y+z), the native multiplicative cocycle identity after type tagging and using the trivial action.
2. B(0,0)=0 gives normalization. Supply these two fields to FactorSet; use its existing group instance, exact sequence, section and central inclusion without rebuilding them.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Uses.**

- Kudla I.1, p.3; MP.0–1: Provide the exact Heisenberg group and central embedding before choosing a smooth representation.
- Weil I.§§3–4, pp.148–149; MP.0 and MP.8: Support polarized bilinear cocycles and the Heisenberg input to Jacobi semidirect products.
- Kudla I.2, p.6: Allow a lattice domain over Z with coefficient module in the ambient local field; no division operation on the lattice is assumed.

**API.**

- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_apply` (simp): The additive value of α_B(x,y) is B(x,y).
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_mul_left` (projection): The coefficient coordinate of pq is t+s+B(x,y).
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_mul_right` (projection): The quotient coordinate of pq is x+y.

**Checks.**

- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_zero` (degenerate): For B=0 on W=C=Z, the coefficient coordinate of pq is t+s.
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_cross` (computation): For W=Z² and B(x,y)=x₀y₁, α_B(e₀,e₁)=1 in additive coefficient coordinates.
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_reversed` (non-example): For the same native matrix form, α_B(e₁,e₀)=0. Replacing B by its transpose fails the two ordered tests.

**Acceptance.**

- No division by 2 is used; the construction works in characteristic two.
- For C=R and B=½ω, with ω alternating and 2 invertible, the multiplication is exactly Kudla’s convention after swapping the written coordinate order.
- For B=0 the native multiplication is addition on C×W.

**Prerequisites.** `mathlib:LinearMap.BilinMap`, `mathlib:LinearMap.map_add₂`, `mathlib:Multiplicative`, `mathlib:groupCohomology.IsMulCocycle₂`, `tauceti:TauCeti.trivialMulDistribMulAction`, `tauceti:TauCeti.trivialMulDistribMulAction_smul`, `tauceti:TauCeti.FactorSet`, `tauceti:TauCeti.FactorSet.Extension`, `tauceti:TauCeti.FactorSet.groupExtension`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-inverse"></a>

### Inverse in the bilinear extension — `MP.0/inverse`

lemma · from the MP.0 part

**Statement.** For p=(t,x) in E_B, p⁻¹=(−t+B(x,x),−x).

**Hypotheses.**

- R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.
- Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

**Proof outline.**

1. Specialize the native inverse coordinate formulas to the trivial action. Bilinearity gives B(x,−x)=−B(x,x); simplify coefficient inversion into additive negation.
2. Alternatively multiply the proposed inverse on either side using the native product formulas; both coordinates are zero.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Acceptance.**

- For B=0 the inverse is ordinary negation.
- For B(x,y)=x₀y₁ over Z and p=(0,(2,3)), the inverse has coefficient 6, not 0.
- For an alternating B the diagonal correction vanishes.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), `tauceti:TauCeti.FactorSet.Extension.inv_left`, `tauceti:TauCeti.FactorSet.Extension.inv_right`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-commutator"></a>

### Commutator in a bilinear central extension — `MP.0/commutator`

lemma · from the MP.0 part

**Statement.** For p=(t,x),q=(s,y), with commutator convention pqp⁻¹q⁻¹, the commutator is inl(B(x,y)−B(y,x)).

**Hypotheses.**

- R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.
- Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

**Proof outline.**

1. Substitute inverse and the native multiplication coordinate formulas into the fourfold product.
2. The quotient coordinate is zero. Expand B(x+y,−x) and B(y,−y) by bilinearity; diagonal terms cancel and the coefficient becomes B(x,y)−B(y,x). Identify the resulting pair with native inl.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Acceptance.**

- The coefficient does not depend on t or s.
- For B(x,y)=x₀y₁ and x=e₀,y=e₁ over Z, the commutator is central 1.
- The same triangular form over Z/2Z is noncommutative; the generic bilinear construction still applies.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/inverse`](#n-mp-0-inverse), `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`, `tauceti:TauCeti.FactorSet.inl`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-center-criterion"></a>

### Center criterion for a bilinear extension — `MP.0/center-criterion`

lemma · from the MP.0 part

**Statement.** An element (t,x) belongs to the center of E_B iff B(x,y)=B(y,x) for every y∈W.

**Hypotheses.**

- R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.
- Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

**Proof outline.**

1. Use Subgroup.mem_center_iff. Compare (t,x)(s,y) and (s,y)(t,x) using the native product coordinates.
2. The quotient coordinates agree. Cancel t+s in C; this leaves precisely equality of the two bilinear values. For necessity it suffices to take s=0; for sufficiency allow arbitrary s.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Acceptance.**

- For symmetric B the entire group is central.
- For B=0 on Z the center strictly contains the coefficient subgroup, detected by (0,1).
- The criterion uses the radical of B−Bᵀ and does not assume 2 invertible.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), `mathlib:Subgroup.mem_center_iff`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-half-form-commutator"></a>

### Commutator for the half-alternating convention — `MP.0/half-form-commutator`

lemma · from the MP.0 part

**Statement.** Let ω be alternating and let 2 be invertible in R. In E_{½ω}, pqp⁻¹q⁻¹=inl(ω(x,y)).

**Hypotheses.**

- R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.
- E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.
- ω is alternating; 2 is invertible in R.

**Proof outline.**

1. Apply commutator to B=½ω. Native IsAlt.neg_eq gives ω(y,x)=−ω(x,y).
2. The coefficient is ½(ω(x,y)−ω(y,x))=ω(x,y), using invOf_mul_self for 2.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Acceptance.**

- For the standard alternating form over Q, the two standard basis vectors have commutator central 1.
- No residue-characteristic restriction occurs: the field Q₂ has invertible 2.
- The convention p⁻¹q⁻¹pq must not be substituted into a calculation using a different bracket convention without checking the resulting identity.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/commutator`](#n-mp-0-commutator), `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.IsAlt.neg_eq`, `mathlib:invOf_mul_self`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-half-form-center"></a>

### Center of the Heisenberg group — `MP.0/half-form-center`

theorem · from the MP.0 part

**Statement.** If ω is alternating and nondegenerate and 2 is invertible in R, the center of E_{½ω} is exactly the range of its native coefficient injection.

**Hypotheses.**

- R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.
- E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.
- ω is alternating and nondegenerate; 2 is invertible in R.

**Proof outline.**

1. Native centrality of inl gives one inclusion. For a central (t,x), half-form-commutator and injectivity of inl imply ω(x,y)=0 for every y.
2. Apply the separation property in native Nondegenerate to obtain x=0. The element is then inl(t), proving the other inclusion.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Acceptance.**

- A zero form on a nonzero module violates nondegeneracy and has a larger center.
- For the zero module the statement still identifies the whole extension with its coefficient subgroup.
- No finite-dimensionality, topology, or field hypothesis is used in this algebraic theorem.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/half-form-commutator`](#n-mp-0-half-form-commutator), `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:Subgroup.mem_center_iff`, `tauceti:TauCeti.FactorSet.inl_injective`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-isometry-extension"></a>

### Extension isomorphism induced by an isometry — `MP.0/isometry-extension`

construction · from the MP.0 part

**Statement.** For scalar forms B on W and D on W′ and a native isometry e:B≃D, construct the group isomorphism E_B≃E_D sending (t,x) to (t,e(x)).

**Hypotheses.**

- R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.
- E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

**Proof outline.**

1. Use the underlying linear equivalence on the quotient coordinate and identity on the coefficient coordinate, with e inverse giving the inverse map.
2. Preservation of multiplication follows from linear additivity and native IsometryEquiv.map_app: D(e(x),e(y))=B(x,y).

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Uses.**

- Kudla I.1, p.3; MP.0: Transport Heisenberg coordinates under symplectic isometries.
- Kudla I.2, pp.7–9; MP.0–1: Compare polarizations and conjugate induced models while preserving their central character.

**API.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_apply` (projection): The coordinate formula is (t,x)↦(t,e(x)).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_refl` (functoriality): The identity native isometry gives the identity group isomorphism.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_trans` (functoriality): Extension of the composite f∘e is extension of f composed with extension of e, with the same order as native IsometryEquiv.trans.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_inl` (compatibility): Extension of e sends inl_B(t) to inl_D(t).

**Checks.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_identity` (computation): The identity isometry of the zero form on Z fixes (3,4).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_negation` (computation): Negation preserves any scalar bilinear form on Z and sends (3,4) to (3,−4), preserving the coefficient 3.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_inverse` (compatibility): Extension of the native inverse isometry undoes extension of e, including when the underlying modules differ.

**Acceptance.**

- Different underlying modules are allowed.
- The map fixes the native central injection pointwise.
- Applied to half an alternating form, this supplies the symplectic automorphisms in Kudla p.3.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), `mathlib:LinearMap.BilinForm.IsometryEquiv`, `mathlib:LinearMap.BilinForm.IsometryEquiv.map_app`, `mathlib:LinearMap.BilinForm.IsometryEquiv.symm`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-isometry-action"></a>

### Isometry action on the Heisenberg group — `MP.0/isometry-action`

construction · from the MP.0 part · planet “Symplectic action”

**Statement.** For a scalar form B, construct a group homomorphism from the native TauCeti.BilinForm.isometryGroup B to automorphisms of E_B, sending e to (t,x)↦(t,e(x)).

**Hypotheses.**

- R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.
- E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

**Proof outline.**

1. Use the native equivalence from the isometry subgroup to self-isometries and the preceding extension construction.
2. Verify the identity and multiplication laws by the coordinate formula, using the left-composition convention of linear automorphisms. No projective scalar ambiguity occurs in this action on the Heisenberg group.

**Sources.**

- Kudla96, I.1, p.3, Heisenberg group and symplectic action: An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

**Uses.**

- Kudla I.1, pp.3–4; MP.1: Supply the group automorphism used to twist the irreducible Heisenberg representation before choosing an intertwiner.
- MetaplecticAutomorphicForms:MP.8: Supply the symplectic part of a Jacobi action. The similitude action that scales the center is an additional MP.8 obligation.

**API.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_apply` (projection): The group element e acts by (t,x)↦(t,e(x)).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_inl` (compatibility): Every e fixes each inl(t).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_injective` (characterisation): The action homomorphism is injective: evaluation on all (0,x) determines e.

**Checks.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_identity` (computation): The native group identity for the zero form on Z fixes (3,4).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_negation` (non-example): The negation element of the native isometry group of the zero form on Z sends (3,4) to (3,−4); a constant identity action fails.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_center` (compatibility): Every native isometry-group element fixes the native coefficient injection, for all t.

**Acceptance.**

- This is an honest action on E_B; it does not construct an honest symplectic action on an irreducible representation space.
- The action is faithful, including degenerate forms: equality on (0,x) recovers the linear automorphism.
- Kudla uses a right action; translate it by x·e=e⁻¹(x) before comparing multiplication order.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/isometry-extension`](#n-mp-0-isometry-extension), `tauceti:TauCeti.BilinForm.isometryGroup`, `tauceti:TauCeti.BilinForm.mem_isometryGroup`, `tauceti:TauCeti.BilinForm.isometryGroupEquivIsometryEquiv`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-polarization-cocycle"></a>

### Quadratic correction between Heisenberg cocycles — `MP.0/polarization-cocycle`

lemma · from the MP.0 part

**Statement.** For scalar B and invertible 2, put q(x)=½B(x,x) and ω=B−Bᵀ. Then ½ω(x,y)+q(x+y)=B(x,y)+q(x)+q(y).

**Hypotheses.**

- R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.
- E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.
- 2 is invertible in R.

**Proof outline.**

1. Expand B(x+y,x+y)=B(x,x)+B(x,y)+B(y,x)+B(y,y) by bilinearity.
2. Collect terms and cancel the transpose terms; use ½·2=1. This is exactly the rescaling identity for α=½(B−Bᵀ), β=B and cochain q.

**Sources.**

- Weil64, I.§3 equation(3), printed148, PDF6: Weil uses the polarized cocycle pairing the first primal coordinate with the second dual coordinate. The displayed algebra derives the exact additive coboundary relating it to Kudla’s half-alternating convention; neither source is claimed to state this native-library formulation verbatim.

**Acceptance.**

- For B(x,y)=x₀y₁ and x=e₀,y=e₁ over Q, the left side is ½+½=1.
- The plus sign before q(x+y) is required for the forward coordinate map t↦t+q(x).
- The identity holds for degenerate and symmetric forms.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), `mathlib:LinearMap.BilinForm.flip`, `mathlib:LinearMap.BilinForm.flip_apply`, `mathlib:invOf_mul_self`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-polarization-equivalence"></a>

### Polarized Heisenberg coordinates — `MP.0/polarization-equivalence`

construction · from the MP.0 part

**Statement.** For scalar B and invertible 2, construct E_{½(B−Bᵀ)}≃E_B by (t,x)↦(t+½B(x,x),x), with inverse (t,x)↦(t−½B(x,x),x). This is a specialization of the native equivalence of rescaled extensions.

**Hypotheses.**

- R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated.
- E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.
- 2 is invertible in R.

**Proof outline.**

1. Use polarization-cocycle as the cochain identity required by native FactorSet.rescaleEquiv, under the trivial action.
2. Extract its underlying group isomorphism. Native forward and inverse rescaling formulas give the two coordinate descriptions; q(0)=0 shows compatibility with the central inclusion.

**Sources.**

- Weil64, I.§3 equation(3), printed148, PDF6; comparison with Kudla I.2 Lemma2.2 PDF7: Weil’s polarized cocycle and Kudla’s half-pairing Schrödinger phase determine this quadratic change of coordinates. The construction is proved directly with the native rescaling equivalence.

**Uses.**

- Weil I.§4, p.149; Kudla I.2 Lemma 2.2, p.7: Reconcile the polarized translation/modulation convention with the half-alternating Heisenberg law and its ½ω(x,y) phase.
- MetaplecticAutomorphicForms:MP.0–2: Fix the sign and coordinate dictionary before proving Fourier and generator operator identities.

**API.**

- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_apply` (projection): The forward coefficient is t+½B(x,x), and the quotient coordinate remains x.
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_symm_apply` (projection): The inverse coefficient is t−½B(x,x), and the quotient coordinate remains x.
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_inl` (compatibility): The equivalence fixes the native coefficient injection.

**Checks.**

- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_zero` (degenerate): For B=0 on Q, the equivalence fixes (3,4).
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_cross` (computation): For B(x,y)=x₀y₁ on Q², the image of (0,(2,3)) is (3,(2,3)).
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_sign` (non-example): For the same B, the inverse image of (0,(2,3)) is (−3,(2,3)); using a plus sign for both directions fails.

**Acceptance.**

- For the standard polarization W=X⊕Y with B((x,y),(x′,y′))=ω(x,y′), the correction is ½ω(x,y).
- This construction assumes a chosen polarized bilinear representative; existence of a Lagrangian complement belongs to the existing LV.3 node.
- It changes group coordinates. It does not define a Fourier transform or prove an equivalence of Schrödinger representations.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/polarization-cocycle`](#n-mp-0-polarization-cocycle), `tauceti:TauCeti.FactorSet.rescaleEquiv`, `tauceti:TauCeti.FactorSet.rescaleEquiv_apply`, `tauceti:TauCeti.FactorSet.rescaleEquiv_symm_apply`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-central-character-criterion"></a>

### Criterion for the section-trivial central character — `MP.0/central-character-criterion`

theorem · from the MP.0 part

**Statement.** For any group A and homomorphism χ:Multiplicative C→A, the function E_B→A given by (t,x)↦χ(t) preserves multiplication iff χ(B(x,y))=1 for every x,y∈W.

**Hypotheses.**

- R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.
- Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.
- A is any group; χ is a group homomorphism from Multiplicative C to A.

**Proof outline.**

1. Necessity: test multiplicativity on (0,x) and (0,y). Both proposed character values are one, and the product has coefficient B(x,y).
2. Sufficiency: apply χ to t+s+B(x,y), use its homomorphism law, and use χ(B(x,y))=1. Its value at the identity is already one. No commutativity of A is required.

**Sources.**

- Kudla96, I.2, p.6, the asserted extension ψ_Y; corrected statement: The source formula requires exactly the cocycle-killing condition proved here. For an isotropic F-subspace it holds because the form itself vanishes; character-self-duality of an arbitrary additive subgroup alone does not suffice.

**Acceptance.**

- For B=0 every χ satisfies the criterion.
- For B(x,y)=x₀y₁ over Z and χ the identity on Multiplicative Z, the proposed scalar projection is not multiplicative.
- For B=½ω restricted to a lattice, killing ω on the lattice is insufficient unless χ also kills ½ω; the Q₂ counterexample is recorded in E-MP0-3.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), `tauceti:TauCeti.FactorSet.Extension.mul_left`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-central-character"></a>

### Section-trivial extension of a central character — `MP.0/central-character`

construction · from the MP.0 part · planet “Heisenberg central character”

**Statement.** Given χ:Multiplicative C→A with χ(B(x,y))=1 for all x,y, construct the group homomorphism E_B→A, (t,x)↦χ(t). It extends χ on native inl and is trivial on the native canonical section.

**Hypotheses.**

- R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map.
- Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.
- A is any group; χ:Multiplicative C→A is a group homomorphism, and χ(B(x,y))=1 for every x,y.

**Proof outline.**

1. Use central-character-criterion to establish multiplicativity and the homomorphism law for χ to establish the identity value.
2. Use the coordinate formula to check the two prescribed restrictions. For uniqueness among homomorphisms satisfying both restrictions, factor each p as inl(p.left) times canonicalSection(p.right) using the native decomposition theorem.

**Sources.**

- Kudla96, I.2, p.6, extension ψ_Y; corrected normalization and hypothesis: This is the distinguished character intended in the induced model, with the missing cocycle hypothesis and the normalization needed for uniqueness made explicit.

**Uses.**

- Kudla I.2, pp.6–7; MP.0: Supply the inducing character of H(Y) when Y is an isotropic subspace, or when an explicit splitting condition has been established.
- Kudla I.1 Theorem 1.1, p.3; MP.1: Specify the central character of the chosen model. This construction does not prove irreducibility or Stone–von Neumann uniqueness.

**API.**

- `TauCeti.Metaplectic.Heisenberg.centralCharacter_apply` (projection): At (t,x) the homomorphism evaluates to χ(t).
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_inl` (compatibility): Its restriction along native inl is χ.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_canonicalSection` (simp): Its value on each native canonicalSection(x) is one.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_unique` (universal-property): If ρ:E_B→A agrees with χ on native inl and is one on every native canonicalSection(x), then ρ equals centralCharacter B χ. Both conditions are required.

**Checks.**

- `TauCeti.Metaplectic.Heisenberg.centralCharacter_value` (computation): For B=0 on Z and χ the identity of Multiplicative Z, the value at (3,4) is additive 3.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_trivial` (degenerate): For every bilinear B, the trivial character into Multiplicative Z gives the trivial homomorphism on E_B.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_zero` (compatibility): For B=0 on Z and χ the native identity homomorphism, the value at the native extension identity is one.

**Acceptance.**

- Uniqueness is asserted only with both the central restriction and triviality on the chosen section.
- The section need not itself be a homomorphism; the cocycle condition makes its image trivial under this character.
- An arbitrary extension of the same χ may be multiplied by a nontrivial character of the quotient.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/central-character-criterion`](#n-mp-0-central-character-criterion), `tauceti:TauCeti.FactorSet.inl`, `tauceti:TauCeti.FactorSet.canonicalSection`, `tauceti:TauCeti.FactorSet.inl_mul_canonicalSection`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`, namespace `TauCeti.Metaplectic.Heisenberg`.

<a id="n-mp-0-topological-heisenberg"></a>

### Topological Heisenberg extension — `MP.0/topological-heisenberg`

construction · from the MP.0 part

**Statement.** Give the existing bilinear FactorSet.Extension E_B the topology transported from C×W by its coordinate equivalence. If C,W are Hausdorff topological modules and B is continuous, multiplication and inversion are continuous. For finite-dimensional modules over a nondiscrete local field it is locally compact and second countable. For B=½ω, the native isometry action is jointly continuous provided evaluation on W is jointly continuous; in the finite-dimensional local-field case give isometries their subspace topology in GL(W).

**Hypotheses.**

- The local-field specialization has characteristic different from two; W is finite dimensional and ω is alternating. Continuity of B is required in the general topological-module case; joint continuity of the isometry evaluation is a separate hypothesis for the action.

**Proof outline.**

1. Use the inherited coordinate multiplication and inverse formulas; sums, B and negation are continuous.
2. Transport the product topology and local compactness, then identify isometries with the closed subgroup of the finite-dimensional general linear group preserving ω.

**Sources.**

- Kudla96, I.1 pp.3–4; I.2 p.6: The existing algebraic carrier receives the topology of W×F; the coordinate order is swapped.

**Uses.**

- Weil III.§§31–36; MP.1: Form a topological, rather than merely abstract, normalizer extension.

**API.**

- `TauCeti.Metaplectic.heisenbergCoordinates` (equivalence): The native extension coordinate equivalence E_B≃C×W is a homeomorphism.
- `TauCeti.Metaplectic.heisenberg_continuous_mul` (structure): Multiplication is continuous for the transported product topology.
- `TauCeti.Metaplectic.heisenberg_continuous_action` (compatibility): Joint continuity of native isometry action when its evaluation on the vector module is jointly continuous.

**Checks.**

- `TauCeti.Metaplectic.heisenbergTopology_zero` (degenerate): For W=0 over R the coordinate homeomorphism identifies E with the additive topological group R.
- `TauCeti.Metaplectic.heisenbergTopology_q2` (compatibility): For any topological additive coefficient/vector groups and continuous bilinear B, the extension has the product-coordinate homeomorphism and continuous multiplication. A Q₂ instance is an additional supplier specialization.
- `TauCeti.Metaplectic.heisenbergTopology_projection` (characterisation): The central inclusion is a closed embedding and the quotient projection is an open continuous surjection.

**Acceptance.**

- Q₂ is admitted: the field element 2 is invertible although it is not an integral unit.

**Prerequisites.** [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/inverse`](#n-mp-0-inverse), [`MP.0/isometry-action`](#n-mp-0-isometry-action).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage0`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-0-heisenberg-haar"></a>

### Product Haar measure on the Heisenberg group — `MP.0/heisenberg-haar`

theorem · from the MP.0 part

**Statement.** For C=F, W=F^{2n}, B continuous bilinear, the product of additive Haar measures μ_F and μ_W transported to E_B is both left and right Haar measure. With self-dual measures for ψ and ω, every symplectic automorphism preserves it; rescaling the central or vector measure rescales their product.

**Hypotheses.**

- F is a nondiscrete local field; for symplectic invariance ω is nondegenerate.

**Proof outline.**

1. Fix one coordinate in the left-translation formula and apply translation invariance in the coefficient coordinate, then in W; use Fubini. Repeat on the right.
2. In the symplectic case determinant one gives vector-measure invariance. Import finite-dimensional self-dual Haar and change of variables from the Fourier supplier.

**Sources.**

- Kudla96, I.2 pp.6–10: The quotient integrals require translation invariant and self-dual normalizations.

**Acceptance.**

- For n=0 the measure is μ_F. No arbitrary probability normalization is imposed on a noncompact field.

**Prerequisites.** [`MP.0/topological-heisenberg`](#n-mp-0-topological-heisenberg), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `mathlib:MeasureTheory.Measure.IsAddLeftInvariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage0`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-0-schroedinger-model"></a>

### Schrödinger representation — `MP.0/schroedinger-model`

construction · from the MP.0 part · planet “Schrödinger representation”

**Statement.** For W=X⊕Y with X,Y Lagrangian, define on S(X) the representation ρψ(x+y,t)φ(u)=ψ(t+ω(u,y)+½ω(x,y))φ(u+x). Here S(X) is the actual locally constant compactly supported space at nonarchimedean places and the joint real Schwartz space at archimedean places. The formula preserves S(X) and gives central character ψ.

**Hypotheses.**

- F is a nondiscrete local field of characteristic different from two; ψ is nontrivial continuous unitary; the polarization identifies Y with the algebraic dual of X by ω.

**Proof outline.**

1. Import the Lagrangian complement and basis theorem from LV.3 and the concrete finite-dimensional Schwartz carrier from AL.0.
2. Compose the two displayed operators; the cross term is exactly ½ω(w,w′), hence the inherited group law. Translation and multiplication by a character preserve the appropriate Schwartz space.

**Sources.**

- Kudla96, I.2 Lemma2.2, PDF7, translation and phase action: Formula (2.1), using the packet’s coefficient-first coordinates.

**Uses.**

- Kudla I.2 Prop.2.3; MP.1–2: Supply the concrete oscillator carrier for intertwiners and generators.

**API.**

- `TauCeti.Metaplectic.schroedinger_apply` (simp): Evaluation is the displayed translation and modulation formula.
- `TauCeti.Metaplectic.schroedinger_center` (simp): ρψ(0,t)φ=ψ(t)φ.
- `TauCeti.Metaplectic.schroedinger_mul` (relation): ρψ(hh′)=ρψ(h)ρψ(h′).
- `TauCeti.Metaplectic.schroedinger_isUnitary` (compatibility): For the displayed phase/translation operator, a unit-norm character and an additive invariant measure give equality of the squared-norm integrals. L² descent is supplied separately.

**Checks.**

- `TauCeti.Metaplectic.schroedinger_zero` (degenerate): When X=Y=0, ρψ(t) is multiplication by ψ(t) on C.
- `TauCeti.Metaplectic.schroedinger_translation` (computation): For w=x∈X, ρψ(x,0)φ(u)=φ(u+x).
- `TauCeti.Metaplectic.schroedinger_modulation` (computation): For w=y∈Y, ρψ(y,0)φ(u)=ψ(ω(u,y))φ(u).
- `TauCeti.Metaplectic.schroedinger_commutator` (non-example): For x∈X,y∈Y, ρ(x)ρ(y)=ψ(ω(x,y))ρ(y)ρ(x), with this positive sign.

**Acceptance.**

- The center acts by ψ, and modulation and translation have the required ordered commutator.

**Prerequisites.** [`MP.0/topological-heisenberg`](#n-mp-0-topological-heisenberg), [`MP.0/half-form-commutator`](#n-mp-0-half-form-commutator), `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `mathlib:MeasureTheory.Measure.IsAddLeftInvariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage0`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-0-induced-schroedinger"></a>

### Induced and coordinate Schrödinger models — `MP.0/induced-schroedinger`

construction · from the MP.0 part

**Statement.** Identify S(X) with the smooth functions f on H(W) satisfying f(h_Yh)=ψ_Y(h_Y)f(h), whose support is compact modulo H(Y), by evaluation on the X section; here H(Y)=Y×F and ψ_Y(y,t)=ψ(t). The inverse is the extension determined by covariance. Right translation gives exactly the Schrödinger formula.

**Hypotheses.**

- F is nonarchimedean; ψ is continuous nontrivial unitary; Y is an isotropic F-subspace, not merely a character-self-dual lattice.

**Proof outline.**

1. Use unique H(Y) times X decomposition, calculate its central coordinate and impose covariance.
2. Support modulo H(Y) is precisely compact support on X. Import smooth induction from SR.2; check sign using Kudla’s right-translation convention.

**Sources.**

- Kudla96, I.2 Lemma2.2, PDF7, polarization realization: The isotropic-subspace instance satisfies the corrected character condition E-MP0-3.

**Uses.**

- Kudla I.2 Prop.2.3; MP.1: Derive quotient-integral intertwiners from the induced realization.

**API.**

- `TauCeti.Metaplectic.inducedSchroedingerEquiv_apply` (simp): The coordinate map is f↦(u↦f(u,0)).
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_covariance` (characterisation): The inverse section-evaluation map satisfies f(t,u)=ψ(t)φ(u); smoothness and compact support are additional source obligations.
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_intertwines` (compatibility): The explicitly constructed coordinate translation intertwines section evaluation with the same Schrödinger phase/translation operator.

**Checks.**

- `TauCeti.Metaplectic.inducedSchroedingerEquiv_zero` (degenerate): The inverse evaluation map sends φ to a covariant function with value φ(0) at (0,0).
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_indicator` (computation): The evaluation equivalence recovers the same indicator function from its covariant inverse; compact-open support is a separate local-field assertion.
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_dyadic` (non-example): A character on additive ℚ taking 1/2 to −1 cannot take 1/2 to 1. The Q₂ conductor instance is a source obligation.

**Acceptance.**

- This is an equivalence of actual smooth representations, not the algebraic polarization cochain map.

**Prerequisites.** [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model), `SmoothRepresentationsOfLocalGroups:SR.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage0`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-0-hilbert-schroedinger"></a>

### Hilbert Schrödinger model — `MP.0/hilbert-schroedinger`

construction · from the MP.0 part

**Statement.** Extend translation and modulation to unitary operators on the actual Hilbert space L²(X,μselfdual), using almost-everywhere classes. This is a strongly continuous unitary representation of H(W); its dense Schwartz subspace carries the preceding formula.

**Hypotheses.**

- F is a local field of characteristic different from two; X is finite dimensional; ψ is continuous unitary.

**Proof outline.**

1. Translations preserve Haar measure and modulation has absolute value one, so the operators descend to L² and preserve its inner product.
2. Prove strong continuity first on Schwartz vectors by dominated convergence and then by density. Native ContRepresentation requires an additional strong-continuity assertion in the group variable.

**Sources.**

- Weil64, I.§4, printed149, PDF7; I.§10 Théorème1, printed157, PDF15: The unitary Weyl model is completed in L²; group-variable continuity is an extra condition.

**Uses.**

- Weil I.§10; MP.1: Define the normalizer in the unitary group with the strong operator topology.

**API.**

- `TauCeti.Metaplectic.hilbertSchroedinger_norm` (simp): Every ρψ(h) preserves the L² norm.
- `TauCeti.Metaplectic.hilbertSchroedinger_schwartz` (compatibility): The Schwartz-to-L² dense inclusion intertwines the two actions.
- `TauCeti.Metaplectic.hilbertSchroedinger_stronglyContinuous` (structure): For every ξ∈L², h↦ρψ(h)ξ is continuous.
- `TauCeti.Metaplectic.hilbertSchroedinger_aeFormula` (characterisation): The representative of the constructed L² isometry equals ψ(t+uy+xy/2) times the translated representative almost everywhere for Lebesgue measure.
- `TauCeti.Metaplectic.hilbertSchroedinger_realSchwartz` (constructor): Construct the real-line Schwartz phase/translation operator.
- `TauCeti.Metaplectic.hilbertSchroedinger_realSchwartz_apply` (simp): Evaluate the real-line Schwartz operator by the same phase/translation formula.

**Checks.**

- `TauCeti.Metaplectic.hilbertSchroedinger_zero` (degenerate): For the real-line L² model, central coordinates (t,0,0) act by the supplied scalar ψ(t).
- `TauCeti.Metaplectic.hilbertSchroedinger_gaussian` (computation): On X=R, translation of e^{−πu²} gives e^{−π(u+x)²} with identical L² norm.
- `TauCeti.Metaplectic.hilbertSchroedinger_ae` (compatibility): Changing a measurable representative on a null set does not change any represented L² vector.

**Acceptance.**

- Continuity is not inferred from native ContRepresentation’s name.

**Prerequisites.** [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model), [`MP.0/heisenberg-haar`](#n-mp-0-heisenberg-haar), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `mathlib:ContRepresentation`, `mathlib:ContRepresentation.toRepresentation`, `mathlib:MeasureTheory.Lp`, `mathlib:SchwartzMap.toLp`, `mathlib:SchwartzMap.coeFn_toLp`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage0`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-0-smooth-vectors"></a>

### Smooth vectors of the oscillator model — `MP.0/smooth-vectors`

comparison · from the MP.0 part

**Statement.** At nonarchimedean places the smooth vectors of the Hilbert oscillator model are precisely S(X). Over R, and over C viewed as a real field, the C∞ vectors for the Heisenberg group action are precisely the Schwartz functions on the underlying real X, with their Schwartz Fréchet topology.

**Hypotheses.**

- The local unitary model has nontrivial central character. Archimedean smoothness means all orbit derivatives for the full Heisenberg group, not just smooth pointwise representatives.

**Proof outline.**

1. Nonarchimedean compact-open stabilizers force local constancy and compact support using translations and modulations.
2. In the real model the infinitesimal operators are partial derivatives and coordinate multiplications. Joint Sobolev estimates identify their common domain with Schwartz space.

**Sources.**

- Kudla96, I.2 p.10: The nonarchimedean comparison is stated after the unitary completion.

**Acceptance.**

- Smooth vectors include modulation derivatives; arbitrary smooth L² functions need not be Schwartz.

**Prerequisites.** [`MP.0/hilbert-schroedinger`](#n-mp-0-hilbert-schroedinger), [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model), `AutomorphicFormsOnReductiveGroups:AF.1`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `mathlib:SchwartzMap`, `mathlib:ContRepresentation`, `mathlib:MeasureTheory.Lp`, `mathlib:SchwartzMap.toLp`, `mathlib:SchwartzMap.coeFn_toLp`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage0`, namespace `TauCeti.Metaplectic`.

<a id="layer-mp-1"></a>

## MP.1 — Stone–von Neumann and the metaplectic extension

**Layer statement.** Prove uniqueness of the irreducible Heisenberg representation with the specified nontrivial central character in the exact smooth or unitary category. Construct intertwining operators under symplectic transformations and their scalar ambiguity. From composition construct the topological central extension; identify the usual double cover by the normalized Weil-index cocycle. Prove associativity, continuity, independence under a coboundary change and the comparison between the scalar central extension and double-cover model. A chosen lift of each matrix is not a group homomorphism. Export genuine representations with central −1 acting as −1, rather than ordinary representations of Sp(W).

**Status.** Planned. 7 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 7 accepted targets of MP.1 are those of the part MetaplecticAutomorphicForms--MP.0. R1 moves MP.1/rao-factor-set, MP.1/metaplectic-double-cover and MP.1/genuine-oscillator to MP.2, because they use the Leray cocycle and Weil-index identities of MP.2; after it MP.1 holds Stone–von Neumann, the intertwiner lines and the scalar metaplectic extension. The edit is routed, not applied.
- (accepted part) The smooth Stone–von Neumann proof rests on MVW 2.I.2, unread; the strong-operator topology of the normalizer extension is to be supplied on native unitary automorphisms.

**Planets.** Stone–von Neumann theorem ([`MP.1/smooth-stone-von-neumann`](#n-mp-1-smooth-stone-von-neumann)); Unitary normalizer ([`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension)); Rao cocycle ([`MP.1/rao-factor-set`](#n-mp-1-rao-factor-set)); Metaplectic group ([`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover)); Weil representation ([`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator)).

**Dependencies.**

- Inside the roadmap: MP.0 (5 citations), MP.2 (3 citations).
- SmoothRepresentationsOfLocalGroups:SR.0:abelian-category: `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.
- SmoothRepresentationsOfLocalGroups:SR.3: `SmoothRepresentationsOfLocalGroups:SR.3`.
- Tau Ceti TauCetiRoadmap/QuadraticFormInvariants: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.
- Pinned libraries: 5 declarations, listed under each target.

**Acceptance tests of the layer.**

- Stone–von Neumann theorem: The trivial central character is excluded; the zero symplectic space still has the one-dimensional ψ representation.
- Unitary normalizer: The projection to Sp is onto and a local continuous section exists on the big cell.
- Rao cocycle: The formula is independent of ψ after normalization.
- Metaplectic group: The projection is a local homeomorphism with two-point fibers; real positive-rank cover is nonsplit.
- Weil representation: The representation does not descend to Sp(W) when its central element acts nontrivially.

<a id="n-mp-1-smooth-stone-von-neumann"></a>

### Smooth Stone–von Neumann theorem — `MP.1/smooth-stone-von-neumann`

theorem · from the MP.0 part · planet “Stone–von Neumann theorem”

**Statement.** For a finite-dimensional symplectic space over a nonarchimedean local field of characteristic different from two and a nontrivial continuous unitary ψ, every irreducible smooth complex representation of H(W) with central character ψ is isomorphic to the Schrödinger model. Its Heisenberg intertwining endomorphism algebra is C.

**Hypotheses.**

- No odd-residue-characteristic assumption is imposed. For the use of Sun–Zhu’s formulation restrict to characteristic zero; Kudla’s statement allows characteristic different from two.

**Proof outline.**

1. Existence is the explicit model. Apply the smooth Stone–von Neumann theorem in the exact smooth category, then Dixmier’s Schur lemma for the scalar ambiguity.
2. A proof reading matching the indicated characteristic range is required, rather than treating the theorem citation as a proof.

**Sources.**

- Kudla96, I.1 Theorem1.1 p.3: The precise nonarchimedean smooth uniqueness target.

**Acceptance.**

- The trivial central character is excluded; the zero symplectic space still has the one-dimensional ψ representation.

**Prerequisites.** [`MP.0/induced-schroedinger`](#n-mp-0-induced-schroedinger), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-1-unitary-stone-von-neumann"></a>

### Unitary Stone–von Neumann theorem — `MP.1/unitary-stone-von-neumann`

theorem · from the MP.0 part

**Statement.** Every irreducible strongly continuous unitary representation of the real Heisenberg group with nontrivial unitary central character is unitarily equivalent to L²(X); all unitary representations with that character are Hilbert multiplicities of it. The complex local-field Heisenberg statement is obtained by viewing its alternating pairing and character on the underlying real group.

**Hypotheses.**

- Finite-dimensional real symplectic space and nontrivial central character; strong continuity is required.

**Proof outline.**

1. Use the Weyl transform to identify Schwartz kernels with finite-rank/Hilbert–Schmidt operators. Their rank-one relations show irreducibility and force every representation to be a Hilbert multiple.
2. For F=C use ψ∘ω as a real nondegenerate alternating pairing, with the correct real central quotient.

**Sources.**

- Weil64, I.§10 Théorème1, printed157, PDF15 (scalar commutant); classification proof is Garrett20: Weil proves normalizer surjectivity and scalar commutants; the full classification has an additional proof source.
- Garrett20, Author notes23March2020, Claims0.1–0.7, PDF1–4: The real proof route; the two p4 corrections are recorded. The Schwartz Fourier-density step remains an analytic gap.

**Acceptance.**

- A discontinuous abstract action of H(W) does not meet the theorem’s hypotheses.

**Prerequisites.** [`MP.0/hilbert-schroedinger`](#n-mp-0-hilbert-schroedinger).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-1-scalar-normalizer-extension"></a>

### Unitary normalizer extension — `MP.1/scalar-normalizer-extension`

construction · from the MP.0 part · planet “Unitary normalizer”

**Statement.** Inside Sp(W)×U(L²(X)), take pairs (g,A) satisfying Aρ(h)A⁻¹=ρ(g·h) for every h. Composition gives the scalar extension Sψ, with kernel z↦(1,z·id), z∈U(1). Equip the unitary group with strong operator topology and Sψ with the subspace topology. Its oscillator action is the second projection.

**Hypotheses.**

- The Hilbert Schrödinger model is strongly continuous; g acts by the inherited center-fixing Heisenberg automorphism.

**Proof outline.**

1. Covariance is stable under pair multiplication and inversion, hence defines a native subgroup.
2. Stone–von Neumann gives surjectivity and Schur gives precisely the unit-circle kernel. Local Bruhat charts in Weil III establish local compactness and openness; product topology on arbitrary cocycle coordinates is not asserted.

**Sources.**

- Weil64, I.§10 Théorème1, printed157, PDF15; III.§§31–36, PDF39–45: The topological unitary normalizer, with central circle rather than a chosen matrix lift.

**Uses.**

- Weil IV.§§43–45; MP.2 and MP.4: Construct and compare the double cover and global finite central quotient.

**API.**

- `TauCeti.Metaplectic.scalarNormalizer_projection` (projection): The covariance subgroup projects by a group homomorphism to G; openness, surjectivity, continuity and its scalar kernel require the actual irreducible model.
- `TauCeti.Metaplectic.scalarNormalizer_covariance` (simp): Aρ(h)=ρ(g·h)A.
- `TauCeti.Metaplectic.scalarNormalizer_oscillator` (data): The covariance subgroup acts by its unitary-operator projection.

**Checks.**

- `TauCeti.Metaplectic.scalarNormalizer_zero` (degenerate): With G trivial and H=ℂ, every unitary normalizer operator is multiplication by a unique scalar of norm1.
- `TauCeti.Metaplectic.scalarNormalizer_kernel` (characterisation): Any pair above g=1 is exactly a unique scalar z·id with |z|=1.
- `TauCeti.Metaplectic.scalarNormalizer_nonsplitting` (non-example): For W≠0 over R the normalized μ₂ subextension does not admit a continuous homomorphic section; arbitrary lift choice does not prove a splitting.

**Acceptance.**

- The projection to Sp is onto and a local continuous section exists on the big cell.

**Prerequisites.** [`MP.0/hilbert-schroedinger`](#n-mp-0-hilbert-schroedinger), [`MP.0/isometry-action`](#n-mp-0-isometry-action), [`MP.1/unitary-stone-von-neumann`](#n-mp-1-unitary-stone-von-neumann), [`MP.1/smooth-stone-von-neumann`](#n-mp-1-smooth-stone-von-neumann).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-1-intertwiner-lines"></a>

### Scalar ambiguity and composition of intertwiners — `MP.1/intertwiner-lines`

theorem · from the MP.0 part

**Statement.** For each g∈Sp(W), the smooth intertwiner space between ρ and its g-twist is a one-dimensional C vector space; its nonzero operators are invertible. Choosing A_g with A_1=1 yields A_gA_h=c(g,h)A_{gh}, where c is a normalized scalar factor set. Rescaling A_g by b(g) changes c by b(g)b(h)/b(gh). If the chosen A_g are unitary operators, the resulting cocycle scalars have norm one; arbitrary nonzero intertwiners need not have that normalization.

**Hypotheses.**

- Nontrivial ψ; the exact smooth or strongly continuous unitary category is fixed. No global continuity of the chosen A_g is assumed.

**Proof outline.**

1. Use uniqueness to produce an isomorphism, then scalar Schur to compare all maps.
2. Associativity of operator composition gives the cocycle equation; use the native FactorSet and rescaleEquiv for abstract algebraic packaging.

**Sources.**

- Kudla96, I.1, PDF3–5, irreducibility and intertwiners: Scalar ambiguity is derived from uniqueness, not chosen as an axiom.

**Acceptance.**

- c changes under a section change; its extension isomorphism class does not.

**Prerequisites.** [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.1/smooth-stone-von-neumann`](#n-mp-1-smooth-stone-von-neumann), [`MP.1/unitary-stone-von-neumann`](#n-mp-1-unitary-stone-von-neumann), `tauceti:TauCeti.FactorSet`, `tauceti:TauCeti.FactorSet.rescaleEquiv`, `mathlib:Representation.IntertwiningMap`, `mathlib:Representation.Equiv`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-1-rao-factor-set"></a>

### Rao factor set — `MP.1/rao-factor-set`

construction · from the MP.0 part · planet “Rao cocycle”

**Statement.** Relative to Y, write j(g)=rank(c_g) and x(g)∈F×/(F×)² for the Bruhat square class. For q=L(Y,Yg₂⁻¹,Yg₁), let t=(j(g₁)+j(g₂)−j(g₁g₂)−dim q)/2. Define the μ₂-valued Rao factor set by (x₁,x₂)(−x₁x₂,x₁₂)(−1,det(2q))^t(−1,−1)^{t(t−1)/2}Hasse(2q). Its normalization and cocycle equation make a native FactorSet with trivial μ₂ action.

**Hypotheses.**

- F is nonarchimedean of characteristic different from two; the Bruhat representatives, j,x and the nonsingular Leray quotient use Kudla I.4’s normalization. Rank-zero determinants equal one.

**Proof outline.**

1. Use Kudla I.4 formula (4.3) and the Weil-index identities to reduce c_Y by the explicit cochain β(g)=γ(x(g),ψ/2)⁻¹γ(ψ/2)⁻j(g).
2. The identity c_Y=β(g₁g₂)c_Rao/(β(g₁)β(g₂)) transports the cocycle equation and normalization to c_Rao.

**Sources.**

- Kudla96, I.4 pp.19–22 Proposition4.3 and Theorem4.5: The explicit μ₂-valued cocycle, not an arbitrary square root of c_Y.

**Uses.**

- Kudla I.5–6; MP.2 and MP.4: Supply a precise local double cover and its normalized generators.

**API.**

- `TauCeti.Metaplectic.raoFactorSet_values` (data): Its values lie in μ₂.
- `TauCeti.Metaplectic.raoFactorSet_cocycle` (relation): c(g,h)c(gh,k)=c(g,hk)c(h,k).
- `TauCeti.Metaplectic.raoFactorSet_beta` (compatibility): The displayed β cochain converts it to the integral-operator cocycle.

**Checks.**

- `TauCeti.Metaplectic.raoFactorSet_identity` (degenerate): c(1,g)=c(g,1)=1.
- `TauCeti.Metaplectic.raoFactorSet_rankOne` (computation): For SL₂, x(g)=c if c≠0 and x(g)=d otherwise; the factor is (x₁,x₂)(−x₁x₂,x₁₂).
- `TauCeti.Metaplectic.raoFactorSet_levi` (non-example): In rank one, restriction to diagonal matrices has factor (a,b)F and generally does not split over the entire Levi.

**Acceptance.**

- The formula is independent of ψ after normalization.

**Prerequisites.** [`MP.2/leray-cocycle`](#n-mp-2-leray-cocycle), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `tauceti:TauCeti.FactorSet`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.2 (realises MP.2). verified: its prerequisites MP.2/leray-cocycle and MP.2/weil-index-identities are MP.2 targets; its only consumer, MP.1/metaplectic-double-cover, moves with it.

<a id="n-mp-1-metaplectic-double-cover"></a>

### Metaplectic double cover — `MP.1/metaplectic-double-cover`

construction · from the MP.0 part · planet “Metaplectic group”

**Statement.** For nonarchimedean F take the native extension E_{c_Rao} and identify (g,ε) with (T_g,εβ(g)r_Y(g)) in Sψ, where T_g(w)=wg⁻¹ converts Kudla’s right matrix action to the native left action. Give it the topology of ker λ₂⊂Sψ, where λ₂ is the continuous character restricting to z↦z² on the scalar circle. Over R use the same kernel construction. Over C Sψ≃Sp(W)×U(1), and the double cover is Sp(W)×μ₂. It is a topological central extension by μ₂, nonsplit when W≠0 and F≠C.

**Hypotheses.**

- Local field characteristic different from two, finite-dimensional symplectic W. The zero-dimensional cover is μ₂. The discontinuous global Bruhat section does not define a product topology on Sp×μ₂.

**Proof outline.**

1. Weil IV.§43 constructs λ₂ by checking a big-cell relation and the generation/gluing lemma; IV.§44 proves nonsplitting in the stated range.
2. For nonarchimedean fields use the Rao cochain comparison; the image of εβr is exactly the kernel. Transport its subgroup topology, not a falsely continuous cocycle-coordinate topology.

**Sources.**

- Weil64, IV.§§42–44, printed194–199, PDF52–57: The continuous squared scalar character and its double-cover kernel.

**Uses.**

- Weil IV.§45; Kudla II.3; MP.3–5: Provide the genuine local cover and its adelic restricted product.

**API.**

- `TauCeti.Metaplectic.metaplecticCover_kernel` (characterisation): Membership in the native kernel subgroup is equivalent to lambda2(s)=1; its identification as the μ₂ cover of Sp is a source obligation.
- `TauCeti.Metaplectic.metaplecticCover_toNormalizer` (compatibility): The native subgroup inclusion maps ker lambda2 into the supplied normalizer carrier.
- `TauCeti.Metaplectic.metaplecticCover_coboundary` (equivalence): A group equivalence carrying one character to the other induces an equivalence of their kernel subgroups. Source cochain and topological comparisons remain separate.

**Checks.**

- `TauCeti.Metaplectic.metaplecticCover_zero` (degenerate): The kernel of the square character on ℂˣ consists exactly of z with z²=1.
- `TauCeti.Metaplectic.metaplecticCover_complex` (computation): For the square character on ℂˣ, membership in its kernel is equivalent to membership in native rootsOfUnity 2 ℂ. This does not state splitting over complex Sp.
- `TauCeti.Metaplectic.metaplecticCover_real` (non-example): The scalar −1 belongs to the square-character kernel on ℂˣ. Real Sp nonsplitting requires the actual normalized cover and remains an acceptance obligation.

**Acceptance.**

- The projection is a local homeomorphism with two-point fibers; real positive-rank cover is nonsplit.

**Prerequisites.** [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.1/rao-factor-set`](#n-mp-1-rao-factor-set), [`MP.2/leray-cocycle`](#n-mp-2-leray-cocycle), `mathlib:rootsOfUnity`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.2 (realises MP.2). verified: it uses MP.2/leray-cocycle and the Rao factor set; its consumers are MP.1/genuine-oscillator (moved), MP.2/operator-relations, MP.4/unramified-compact-splittings, MP.4/adelic-metaplectic-cover and MP.5/unipotent-splitting, all in MP.2 or later.

<a id="n-mp-1-genuine-oscillator"></a>

### Genuine Weil representation — `MP.1/genuine-oscillator`

construction · from the MP.0 part · planet “Weil representation”

**Statement.** Restrict the normalizer’s second projection to Mp(W)=ker λ₂. This gives the unitary Weil representation ωψ on L²(X) and its smooth/Schwartz subrepresentation; the nontrivial central element acts as −id. With the Rao coordinates ωψ(g,ε)=εβ(g)r_Y(g).

**Hypotheses.**

- The local-field cover and actual Schrödinger model are fixed.

**Proof outline.**

1. Restriction of a native representation supplies the action and its group laws.
2. Use the cover embedding to compute the central action; apply the smooth-vector comparison to obtain the required model.

**Sources.**

- Kudla96, I.5 pp.23–24; II.4 pp.37–39: The normalized cover acts genuinely on the concrete model.

**Uses.**

- Kudla II.3–4; Weil III.39; MP.2–6: Restrict to dual pairs, tensor globally and form theta kernels.

**API.**

- `TauCeti.Metaplectic.weilRepresentation_apply` (simp): The action on ker lambda2 is the restriction of the supplied normalizer oscillator; identification with εβ(g)rY(g) is separate.
- `TauCeti.Metaplectic.weilRepresentation_central` (simp): ωψ(1,−1)=−id.
- `TauCeti.Metaplectic.weilRepresentation_modelChange` (equivalence): A unitary Heisenberg model intertwiner conjugates the intrinsic cover action; changing its scalar leaves this equivalence unchanged.

**Checks.**

- `TauCeti.Metaplectic.weilRepresentation_zero` (degenerate): For W=0, μ₂ acts on C by its sign character.
- `TauCeti.Metaplectic.weilRepresentation_genuine` (non-example): In a nonzero model the two lifts of the same g have opposite operators.
- `TauCeti.Metaplectic.weilRepresentation_identity` (compatibility): The identity lift acts by the identity native linear isometry.

**Acceptance.**

- The representation does not descend to Sp(W) when its central element acts nontrivially.

**Prerequisites.** [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.0/smooth-vectors`](#n-mp-0-smooth-vectors).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage1`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.2 (realises MP.2). verified: it uses the double cover; its consumers MP.2/generator-operators, MP.2/character-and-dual, MP.3/orthogonal-cover-restriction, MP.4/adelic-weil-representation and MP.6/jacobi-group are in MP.2 or later. The new MP.6/unitary-jacobi-group uses MP.1/scalar-normalizer-extension instead, which stays in MP.1.

<a id="layer-mp-2"></a>

## MP.2 — Weil index and explicit operator formulas

**Layer statement.** Define the Weil index of a nondegenerate quadratic form by the correctly normalized oscillatory/Fourier integral. Prove orthogonal-sum, scaling, discriminant and Hilbert-symbol identities, including dyadic factors; work with the source's precise quadratic versus bilinear discriminant convention. Compute the Weil representation on unipotent, Levi and Fourier generators, prove their relations, and show that the formulas agree with MP.1's intrinsic representation. Supply change-of-additive-character and dual/conjugate formulas. The Weil index is not a globally chosen square root with no compatibility proof.

**Status.** Planned. 10 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 10 accepted targets of MP.2 are those of the part MetaplecticAutomorphicForms--MP.0. R1 moves three MP.1 targets in and the two Hermitian targets out to MP.3, and removes the planet of MP.2/weil-index-identities so that MP.2 shows six planets.
- (accepted part) The Weil index needs the AL.0 Part II Fourier transform of oscillatory distributions; the Leray composition proof (Rao) and Weil's big-cell continuation for the generator relations are unread inputs.

**Planets.** Weil index ([`MP.2/weil-index`](#n-mp-2-weil-index)); Weil index identities ([`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities)); Leray invariant ([`MP.2/leray-form`](#n-mp-2-leray-form)); Weil operators ([`MP.2/generator-operators`](#n-mp-2-generator-operators)).

**Dependencies.**

- Inside the roadmap: MP.0 (1 citations), MP.1 (5 citations), MP.3 (2 citations).
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.
- AutomorphicLFunctionsAndLocalFactors:AL.2: `AutomorphicLFunctionsAndLocalFactors:AL.2`.
- MordellLawrenceVenkatesh:LV.3: `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`.
- Tau Ceti TauCetiRoadmap/GlobalQuadraticForms: `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-4-global-square-norm-and-approximation-lemmas`.
- Tau Ceti TauCetiRoadmap/QuadraticFormInvariants: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Acceptance tests of the layer.**

- Weil index: The index of the zero-dimensional form is one, and dyadic lattices require ψq triviality, not only polar self-duality.
- Weil index identities: Over R, (−1,−1)=−1 and γ(−1,ψ)=−i; the square identity detects a missing phase.
- Leray invariant: Repeated Lagrangians give the zero form.
- Weil operators: At an unramified odd place the integral indicator is fixed. At Q₂ no unsupported integral splitting is inferred.

<a id="n-mp-2-weil-index"></a>

### Weil index — `MP.2/weil-index`

construction · from the MP.0 part · planet “Weil index”

**Statement.** For a nondegenerate quadratic form q on F^d, define γψ(q)∈U(1) as the scalar in the Fourier transform of the oscillatory distribution ψ∘q: with positive Fourier kernel ψ(x·y) and coordinate self-dual Haar, its transform at y is γψ(q)|det Bq|⁻¹/²ψ(−q(Bq⁻¹y)), where Bq(x,y)=q(x+y)−q(x)−q(y). In the Bq-self-dual measure this is γψ(q)ψ(−q(y)). This is not an absolutely convergent integral over F^d.

**Hypotheses.**

- F is a nondiscrete local field of characteristic different from two, ψ continuous nontrivial unitary, q nondegenerate, Bq its full polar form.

**Proof outline.**

1. Weil I.§14 Théorème2 defines the scalar by the Fourier distribution identity and proves it has absolute value one.
2. At nonarchimedean places choose L with ψq trivial on L and stabilize the integral over L′, the Bq-annihilator of L; normalize its finite Gauss sum to unit norm. At real places evaluate the Gaussian oscillatory integral.

**Sources.**

- Weil64, I.§14 Théorème2, printed161–162, PDF19–20; II.§§24–28: The quadratic character’s Fourier scalar, with the polar matrix and self-dual measure pinned.

**Uses.**

- Kudla I.3–4; Weil II.30 and IV.43; MP.1,4,6: Normalize the cocycle, prove its global product formula and compare Siegel–Weil sections.

**API.**

- `TauCeti.Metaplectic.weilIndex_distribution` (characterisation): The Fourier transform identity above characterizes γψ(q).
- `TauCeti.Metaplectic.weilIndex_norm` (structure): |γψ(q)|=1.
- `TauCeti.Metaplectic.weilIndex_isometry` (functoriality): Isometric quadratic forms have equal Weil index.
- `TauCeti.Metaplectic.weilIndex_gaussSum` (compatibility): For ψq-trivial L, γ is the unit normalization of vol(L)Σ_{L′/L}ψ(q(x)).

**Checks.**

- `TauCeti.Metaplectic.weilIndex_zero` (degenerate): The zero-dimensional form has γ=1.
- `TauCeti.Metaplectic.weilIndex_real` (computation): For ψ(t)=e^{2πit} on R, γψ(ax²)=e^{πi sgn(a)/4} for a≠0.
- `TauCeti.Metaplectic.weilIndex_q2` (computation): For ψ₂(t)=e^{−2πi frac₂(t)} on Q₂, γψ₂(x²)=(1−i)/√2, from the lattice quotient ½Z₂/Z₂.
- `TauCeti.Metaplectic.weilIndex_hyperbolic` (compatibility): The hyperbolic form xy has index one with the same Fourier convention.

**Acceptance.**

- The index of the zero-dimensional form is one, and dyadic lattices require ψq triviality, not only polar self-duality.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-weil-index-identities"></a>

### Weil index and Hilbert symbol — `MP.2/weil-index-identities`

theorem · from the MP.0 part · planet “Weil index identities”

**Statement.** The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with γψ(−q)=γψ(q)⁻¹. For η=ψ/2 define γ(a,η)=γ(η a x²)/γ(η x²). Then γ(ab,η)=(a,b)F γ(a,η)γ(b,η), γ(a,ηb)=(a,b)F γ(a,η), γ(a,η)²=(−1,a)F and γ(a,η)⁴=1. If q=Σa_ix_i², γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F; det q means ∏a_i, not det Bq=2^d∏a_i.

**Hypotheses.**

- F is a local field of characteristic different from two, including Q₂ and R; all a_i and a,b are nonzero. At nonarchimedean F, dyadic fields included, the Hilbert symbol and local Hasse invariant are those of QuadraticFormInvariants 6C. At F=ℝ the same norm-equation symbol is used with the archimedean computation of GlobalQuadraticForms Layer 4.4 ((a,b)_ℝ=−1 exactly when a<0 and b<0), from which the real symmetry, bimultiplicativity and Hasse product are read off; 6C's theorems, which assume a nonarchimedean local field, are not applied at ℝ.

**Proof outline.**

1. Weil II.§25 gives the Witt-group character and II.§§27–28 reduce nonarchimedean evaluation to Gauss sums and the quaternion norm.
2. Apply the two-variable identity and induction on a diagonalization to obtain Kudla I.4 Lemmas4.1–4.2. Keep the factors of 2 in converting between q and Bq.

**Sources.**

- Kudla96, I.4 pp.17–18 Lemmas4.1–4.2: The normalized index identities, with real and dyadic places included.

**Acceptance.**

- Over R, (−1,−1)=−1 and γ(−1,ψ)=−i; the square identity detects a missing phase.

**Prerequisites.** [`MP.2/weil-index`](#n-mp-2-weil-index), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-4-global-square-norm-and-approximation-lemmas`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: its planet is removed (the target stays). planet bookkeeping only: MP.2 then shows Weil index, Leray invariant, Weil operators, Rao cocycle, Metaplectic group and Weil representation; MP.1 keeps Stone–von Neumann theorem and Unitary normalizer.

<a id="n-mp-2-leray-form"></a>

### Leray quadratic form — `MP.2/leray-form`

construction · from the MP.0 part · planet “Leray invariant”

**Statement.** For Lagrangians L₀,L₁,L₂ in a symplectic W, form the nondegenerate Leray quadratic space after quotienting by R=(L₀∩L₁)+(L₁∩L₂)+(L₂∩L₀). The reduced Lagrangians are the images ((L_i∩R⊥)+R)/R in R⊥/R. For transverse pairs, express L₂ as the graph of T:L₁→L₀ and use q_T(y)=½ω(y,Ty), with the sign chosen to match Kudla’s cocycle formula.

**Hypotheses.**

- Characteristic different from two; use the symplectic quotient by the isotropic R and quotient out the radical of the resulting quadratic form if needed.

**Proof outline.**

1. The transverse graph construction is invariant under symplectic isomorphisms.
2. Reduce arbitrary triples by their pairwise intersections, using image subspaces rather than an invalid quotient of L_i by all of R. Verify cyclic and sign conventions against the explicit three-line example.

**Sources.**

- Kudla96, I.3 pp.11–13: The quadratic space of a Lagrangian triple; quotient notation is corrected as recorded in sourceIssues.

**Uses.**

- Kudla I.3 Prop.3.1; MP.1: Describe composition of unitary polarization intertwiners by the Weil index.

**API.**

- `TauCeti.Metaplectic.lerayForm_graph` (simp): On the transverse graph model its quadratic value is ½ω(y,Ty).
- `TauCeti.Metaplectic.lerayForm_isometry` (functoriality): A common symplectic isometry induces an isometry of Leray forms.
- `TauCeti.Metaplectic.lerayForm_reduction` (compatibility): The general triple is the transverse construction on its reduced symplectic quotient.

**Checks.**

- `TauCeti.Metaplectic.lerayForm_repeated` (degenerate): For L₀=L₁, the Leray form is zero.
- `TauCeti.Metaplectic.lerayForm_rankOne` (computation): In W=F² with ω(e₀,e₁)=1, L₀=Fe₀,L₁=Fe₁,L₂=F(e₀+e₁) gives q(y)=−½y².
- `TauCeti.Metaplectic.lerayForm_quotient` (non-example): With L₀=L₁ transverse to L₂, R=L₀ is not contained in L₂; the image formula is defined whereas (L₂∩R⊥)/R is not.

**Acceptance.**

- Repeated Lagrangians give the zero form.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, [`MP.2/weil-index`](#n-mp-2-weil-index).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-leray-cocycle"></a>

### Leray cocycle of intertwiners — `MP.2/leray-cocycle`

theorem · from the MP.0 part

**Statement.** For the unitary normalized integral operators r_Y(g), their factor set is c_Y(g₁,g₂)=γψ(L(Y,Yg₁⁻¹,Yg₂⁻¹g₁⁻¹))=γψ(L(Y,Yg₂⁻¹,Yg₁)). This obeys normalization and the two-cocycle identity because it computes actual operator composition.

**Hypotheses.**

- Use Kudla’s right action on W and the same q-versus-polar-form convention as the index and Leray nodes; source convention conversion is explicit.

**Proof outline.**

1. Evaluate the double intertwining integral by Fourier inversion, then identify its residual oscillatory integral with the reduced Leray form.
2. The unitary scalar is the Weil index. Associativity of operators supplies the cocycle identity even across Bruhat boundaries.

**Sources.**

- Kudla96, I.3 Theorem3.1 p.13: The factor set is tied to the actual intertwining operators.

**Acceptance.**

- For g₁=1 or g₂=1 the Leray form is zero and the factor is one.

**Prerequisites.** [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model), [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.2/weil-index`](#n-mp-2-weil-index), [`MP.2/leray-form`](#n-mp-2-leray-form).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-generator-operators"></a>

### Weil operators on generators — `MP.2/generator-operators`

theorem · from the MP.0 part · planet “Weil operators”

**Statement.** In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy r(m(a))φ(x)=|det a|^{1/2}φ(xa), r(n(b))φ(x)=ψ(½x bᵗx)φ(x), and r(w) is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is εβ(g)r(g), hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space V of dimension m, ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa), ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x), and ω(w)φ=γ(ψ∘V)^{−n} times the negative-kernel Fourier transform for Kudla’s w.

**Hypotheses.**

- F is nonarchimedean, char≠2, b symmetric; the self-dual measure is fixed. χV,ψ depends on m parity and the signed discriminant. Source right-action matrices are used consistently.

**Proof outline.**

1. Kudla I.2 Prop.2.3 gives the quotient integral and its unique positive Haar normalization; on generators compute it by substitution and Fourier inversion.
2. Apply β and tensor m copies to get II.4 Proposition4.3. Kudla and Zhang print the same Weyl matrix but use different group-action conventions; convert the source action by inversion, then use reflection to compare positive and negative Fourier kernels.

**Sources.**

- Kudla96, I.2 pp.8–10; II.4 pp.35–39: The scalar and μ₂ normalizations are distinguished; the Fourier sign is fixed by the actual Weyl matrix.

**Acceptance.**

- At an unramified odd place the integral indicator is fixed. At Q₂ no unsupported integral splitting is inferred.

**Prerequisites.** [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator), [`MP.2/weil-index`](#n-mp-2-weil-index), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-operator-relations"></a>

### Generator relations and intrinsic comparison — `MP.2/operator-relations`

comparison · from the MP.0 part

**Statement.** The unipotent, Levi and Fourier operators satisfy their presentation relations with exactly the Rao central factors; their action is the intrinsic genuine representation obtained from the normalizer. In particular Fourier squared is reflection times its Weil scalar, and conjugating a unipotent by Fourier gives the opposite unipotent with its prescribed phase.

**Hypotheses.**

- Use the same Weyl element, Haar measure, q and character as the generator theorem; the cover lift is part of the data.

**Proof outline.**

1. Use the intertwiner covariance and one-dimensionality to reduce each relation to a scalar. Evaluate that scalar by the Weil-index Fourier identity.
2. Check the Bruhat generation and relations, using Weil V.§§46–47 for the big cell; identify the normalized intertwining operators.

**Sources.**

- Weil64, I.§13, printed160, PDF18; I.§14 relation(9), PDF19: The presentation check ties explicit operators to the intrinsic representation.

**Acceptance.**

- Over R positive Fourier applied twice is reflection; omitting the index phase fails the cover’s central relation.

**Prerequisites.** [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), [`MP.1/intertwiner-lines`](#n-mp-1-intertwiner-lines).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-character-and-dual"></a>

### Character change and dual Weil models — `MP.2/character-and-dual`

comparison · from the MP.0 part

**Statement.** For ψa(t)=ψ(at), compare the oscillator model with the one for the scaled symplectic form aω; if a=b² the coordinate scaling by b gives an intertwiner and theta modules are unchanged up to the stated group conjugation. Complex conjugation changes ψ to ψ⁻¹; the contragredient Weil action is the ψ⁻¹ action. On scalar-circle covers, the tensor product of two weight-one models needs λ₂⁻¹, and the dual model needs λ₂, to give scalar weight zero for the descended tensor and scalar weight one for the normalized dual.

**Hypotheses.**

- a∈F×; for unitary models use continuous ψ and Hilbert dual/conjugate. The μ₂ cover and scalar-circle cover are distinguished.

**Proof outline.**

1. Compute translations and modulations under coordinate scaling, using the self-dual measure change.
2. Complex conjugate every operator and normalize by the index conjugation law. On the scalar cover use λ₂(z)=z² to check the corrected weights.

**Sources.**

- Kudla96, I.1 p.5; II.4 Remark4.1 p.37: Character/dual conversion and corrected scalar-circle tensor twists.

**Acceptance.**

- The scalar weights are 2−2=0 for a descended tensor product and −1+2=1 for its normalized dual.

**Prerequisites.** [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator), [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-quadratic-uncertainty"></a>

### Quadratic uncertainty principle — `MP.2/quadratic-uncertainty`

theorem · from the MP.0 part

**Statement.** Let (V,q) be a positive-dimensional nondegenerate quadratic space over nonarchimedean F, char F≠2, with conductor-zero ψ and self-dual Fourier transform. If φ∈S(V) has support in {q>0 in valuation, i.e. q∈p_F} and its Fourier transform has support in {q∈O_F}, then φ=0 identically. Corollary8.1.4 says that supp φ⊂{val q>0} and a scalar-multiple Fourier eigenfunction condition also force φ=0.

**Hypotheses.**

- dim_F V>0. Let q(x)=(x,x)/2, V^int={x | val_F(q(x))≥0} and V^int_+={x | val_F(q(x))>0}, with val_F(0)=∞. F is nonarchimedean of characteristic ≠2 (residue characteristic 2 is allowed); ψ has conductor O_F and the Fourier kernel is ψ((x,y)) with self-dual measure. φ is locally constant and compactly supported, supp φ⊆V^int_+, supp φ̂⊆V^int. Positive dimension is necessary for the null cone to have empty interior; the zero space is excluded.

**Proof outline.**

1. The support hypotheses make φ and its Fourier transform fixed by the two specified unipotent groups.
2. These generate SL₂, hence invariance under N(F) forces support on the null cone; local constancy then forces φ=0. For odd dimension reduce by the doubling argument.

**Sources.**

- PAPER-LI-ZHANG-22-B, Proposition8.1.2, Corollary8.1.4 PDF56–57: The quadratic support theorem uses valuation inequalities.

**Acceptance.**

- Dyadic F is not excluded solely by char F≠2; the generated-unipotent argument and normalization must be checked there.

**Prerequisites.** [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.2/operator-relations`](#n-mp-2-operator-relations), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-2-hermitian-uncertainty"></a>

### Hermitian uncertainty principle — `MP.2/hermitian-uncertainty`

theorem · from the MP.0 part

**Statement.** For a positive-dimensional nondegenerate Hermitian space V over E/F with conjugation c, set q(x)=½Tr_E/F⟨x,x⟩=⟨x,x⟩∈F. Use the Fourier kernel ψ(Tr_E/F⟨x,y⟩) and its self-dual measure. If supp φ⊆{x | val_F⟨x,x⟩>0} and supp φ̂⊆{x | val_F⟨x,x⟩≥0}, then φ=0 by the quadratic uncertainty principle. The half-trace form is the Hermitian norm, not its unscaled trace 2⟨x,x⟩.

**Hypotheses.**

- dim_E V>0; nonarchimedean F of characteristic ≠2 and the quadratic Hermitian extension/datum of Li–Zhang §8.1. Conductor-zero ψ, locally constant compactly supported φ, val_F(0)=∞ and exactly the strict/non-strict support cones above.

**Proof outline.**

1. Identify the F-quadratic form from the Hermitian pairing.
2. Check the Fourier characters and measure under that identification, then apply Proposition8.1.2.

**Sources.**

- PAPER-LI-ZHANG-22-B, Proposition8.1.6 PDF57–58: Hermitian-to-quadratic Fourier adapter.

**Acceptance.**

- A factor of2 in the trace form changes its self-dual Haar measure.

**Prerequisites.** [`MP.2/quadratic-uncertainty`](#n-mp-2-quadratic-uncertainty), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.3 (realises MP.3). verified: it uses MP.3/unitary-splitting for the Hermitian Fourier normalization and has no consumer.

<a id="n-mp-2-hermitian-operator-normalizations"></a>

### Hermitian oscillator normalizations — `MP.2/hermitian-operator-normalizations`

comparison · from the MP.0 part

**Statement.** Compare the Hermitian Weil operators in Li–Liu22, Li–Zhang22B, Disegni–Liu24 and Zhang21 with MP.2: m(a) has the specified character and |det a|_E^{dim_E V/2}, n(b) has ψ(tr bT(x)), and w has γ_V^{rank} times the positive Fourier transform for the source’s chosen trace pairing. Zhang’s even quadratic formula uses χV(a)=(a,(−1)^{dim V/2}det q)_F. His AppendixA gives γ_V=η(det Hermitian V)ε(η,1/2,ψ)^{dim_E V} and the hyperbolic constant1.

**Hypotheses.**

- Even dimension where descent is asserted; exact quadratic determinant versus polar determinant; each source’s w and group action converted before comparing signs.

**Proof outline.**

1. Expand the trace pairing in a diagonal basis and apply Weil-index/Hilbert identities.
2. Compare unipotent and Levi generators directly and Fourier generators with the inverse/right-action dictionary; import the epsilon-factor evaluation from AL.2.

**Sources.**

- PAPER-LI-LIU-22, §§2.1,3.1 PDF11,43–44: Ramified Hermitian Fourier convention.
- PAPER-LI-ZHANG-22-B, §§1.7,8.1,12.3 PDF8–9,56,78–79: Hermitian generator normalization.
- PAPER-DISEGNI-LIU-24, §4.1 H7 PDF40–41: Coefficient-valued finite-place formulas.
- PAPER-ZHANG-21, §11.1 PDF70–71 and AppendixA PDF108–109: Even quadratic and Hermitian phase conventions.

**Acceptance.**

- Do not identify a source’s w matrix with an opposite matrix when the difference is actually left versus right action.

**Prerequisites.** [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage2`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.3 (realises MP.3). verified: it uses MP.3/unitary-splitting; its consumer MP.6/unitary-siegel-weil-measure is later.

<a id="layer-mp-3"></a>

## MP.3 — Dual pairs and local theta modules

**Layer statement.** Construct orthogonal–symplectic and unitary dual-pair embeddings and the restrictions of the cover. Prove the splitting statements with the required auxiliary characters, dimensions and parity; odd-dimensional quadratic spaces generally give a genuine metaplectic, not linear symplectic, action. Define big theta modules by the appropriate coinvariants and small theta quotients when justified. Prove the elementary equivariance, admissibility/finite-length statements in the source's range, see-saw identities, Jacquet filtrations and the explicitly needed first-occurrence/vanishing comparisons. Kudla's 1996 notes supply these local constructions and their scoped theorems; a full all-residual-characteristic Howe-duality theorem is a separately source-qualified extension, not an assumed consequence of the definitions.

**Status.** Planned. 44 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 44 accepted targets of MP.3 are those of the part MetaplecticAutomorphicForms--MP.0. R2 replaces the bare citation of ModularityAndLanglandsExtensions:ML.4 in three targets by ET.4/tempered-unitary-local-packets with R01.2/local-epsilon-factor, R17.1/local-quaternionic-comparison and ML.4/extended-langlands-parameter, which closes the part's remaining items asking for an exact owner mapping of these inputs; R1 moves the two Hermitian targets of MP.2 here.
- The PGSp₆–PGSO₈ citation of ML.4 stays a stage cycle until ModularityAndLanglandsExtensions moves its theta-dependent GSp₄ targets to a sub-layer (gap recorded here, proposal in R2).
- (accepted part) Howe duality, the type-II input, MVW and the archimedean categories remain proof-closure inputs with the original sources unread, as the part records them (45 remaining items).

**Planets.** Reductive dual pairs ([`MP.3/orthogonal-symplectic-dual-pair`](#n-mp-3-orthogonal-symplectic-dual-pair)); Metaplectic parity ([`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction)); Unitary Weil representation ([`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting)); Big theta module ([`MP.3/big-theta-module`](#n-mp-3-big-theta-module)); Howe duality ([`MP.3/howe-duality`](#n-mp-3-howe-duality)); See-saw identity ([`MP.3/local-see-saw`](#n-mp-3-local-see-saw)).

**Dependencies.**

- Inside the roadmap: MP.0 (1 citations), MP.1 (3 citations), MP.2 (16 citations).
- AdelicAlgebraicGroups:AA.2: `AdelicAlgebraicGroups:AA.2`.
- AutomorphicFormsOnReductiveGroups:AF.1: `AutomorphicFormsOnReductiveGroups:AF.1`.
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0`.
- ModularityAndLanglandsExtensions:ML.4: `ModularityAndLanglandsExtensions:ML.4`.
- SmoothRepresentationsOfLocalGroups:SR.0:abelian-category: `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.
- SmoothRepresentationsOfLocalGroups:SR.2: `SmoothRepresentationsOfLocalGroups:SR.2`.
- SmoothRepresentationsOfLocalGroups:SR.3: `SmoothRepresentationsOfLocalGroups:SR.3`.
- Tau Ceti TauCetiRoadmap/QuadraticFormInvariants: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.
- Tau Ceti TauCetiRoadmap/RepresentationTheory/ClassicalGroups: `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.
- Pinned libraries: 5 declarations, listed under each target.

**Consumers outside the roadmap.** `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`, `ModularityAndLanglandsExtensions:ML.5/local-descent-mp2n`.

**Acceptance tests of the layer.**

- Reductive dual pairs: For V=F with b=1 the tensor space is W; (−1,−I) is in the product kernel.
- Metaplectic parity: m=1 gives a genuine action of Mp(W), while a hyperbolic plane has m=2 and gives a linear Sp(W) action.
- Unitary Weil representation: The resulting correspondence depends on ψ only through its norm-class orbit; dependence on arbitrary choices is not silently suppressed.
- Big theta module: Do not replace Θ by its irreducible quotient or claim Θ is always irreducible.
- Howe duality: Q₂ orthogonal–symplectic pairs are covered; general quaternionic pairs require Gan–Sun, not a changed hypothesis on Kudla’s odd-residue theorem.
- See-saw identity: Tensoring by the determinant/auxiliary character of a different splitting changes both sides by that twist.

<a id="n-mp-3-orthogonal-symplectic-dual-pair"></a>

### Orthogonal–symplectic dual pair — `MP.3/orthogonal-symplectic-dual-pair`

construction · from the MP.0 part · planet “Reductive dual pairs”

**Statement.** For a nondegenerate symmetric space (V,b) and symplectic space (W,ω) over F, give V⊗F W the alternating form b⊗ω and embed O(V)×Sp(W) into its native isometry group by tensoring the two actions. The images commute. When V,W are nonzero, each is the full centralizer of the other; for zero factors state only the embedding map, with its actual kernel.

**Hypotheses.**

- char F≠2; finite-dimensional spaces; b and ω nondegenerate. The tensor-product map can have diagonal scalar kernel, so injectivity of the product map is not asserted.

**Proof outline.**

1. Construct the tensor pairing from the native tensor-product universal property and prove nondegeneracy in supplied bases.
2. Use double-centralizer linear algebra for the nonzero case, or import the matching classical-group result from upstream.

**Sources.**

- Kudla96, II.1, PDF29–30, tensor orthogonal–symplectic pair: Tensor embedding and its centralizers.

**Uses.**

- Kudla II.4; MP.3 local theta: Restrict the oscillator representation to commuting groups.

**API.**

- `TauCeti.Metaplectic.tensorSymplecticForm` (constructor): The form evaluates on pure tensors as b(v,v′)ω(w,w′).
- `TauCeti.Metaplectic.dualPair_commute` (compatibility): The O(V) and Sp(W) actions commute on V⊗W.
- `TauCeti.Metaplectic.dualPair_kernel` (characterisation): For nonzero factors the kernel is the simultaneous scalar pairs (aI,a⁻¹I) admitted by the two groups.

**Checks.**

- `TauCeti.Metaplectic.dualPair_line` (computation): For V=F, the Sp(W) action is its native defining action.
- `TauCeti.Metaplectic.dualPair_zero` (degenerate): For V=0 the target space and its isometry group are trivial; the product map need not be injective.
- `TauCeti.Metaplectic.dualPair_minus` (non-example): The pair (−I,−I) acts trivially on V⊗W, so the product homomorphism is not an embedding with trivial kernel.

**Acceptance.**

- For V=F with b=1 the tensor space is W; (−1,−I) is in the product kernel.

**Prerequisites.** [`MP.0/isometry-action`](#n-mp-0-isometry-action), `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-orthogonal-cover-restriction"></a>

### Cover over orthogonal–symplectic pairs — `MP.3/orthogonal-cover-restriction`

theorem · from the MP.0 part · planet “Metaplectic parity”

**Statement.** The scalar cover pulls back to O(V)×Sp(W). O(V) has the Schrödinger splitting h↦[φ(x)↦φ(h⁻¹x)]. The restriction over Sp(W) of the μ₂ cover is trivial when m=dim V is even and is the metaplectic cover of W when m is odd. The tensor Weil representation consequently descends to O(V)×Sp(W) for even m and is genuine on O(V)×Mp(W) for odd m.

**Hypotheses.**

- F is a characteristic-not-two local field; a nontrivial continuous ψ and compatible Haar measures are fixed. The orthogonal action is the specified splitting, not a uniqueness claim.

**Proof outline.**

1. Compute the pullback cocycle using orthogonal diagonalization and the Weil-index identities.
2. Use Kudla II.2–4 to compare its scalar weight and λ₂; record the actual splitting over O(V).

**Sources.**

- Kudla96, II.3 Corollary3.3, PDF36; cocycle comparison Proposition3.2 PDF35: Parity of the symplectic restriction and the orthogonal splitting.

**Acceptance.**

- m=1 gives a genuine action of Mp(W), while a hyperbolic plane has m=2 and gives a linear Sp(W) action.

**Prerequisites.** [`MP.3/orthogonal-symplectic-dual-pair`](#n-mp-3-orthogonal-symplectic-dual-pair), [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-unitary-splitting"></a>

### Unitary dual-pair splittings — `MP.3/unitary-splitting`

construction · from the MP.0 part · planet “Unitary Weil representation”

**Statement.** For E/F quadratic, an ε-Hermitian V and a −ε-Hermitian W, construct their commuting actions on the F-symplectic tensor space with trace pairing. A pair of characters χV,χW of E× with χV|F×=ωE/F^dim V and χW|F×=ωE/F^dim W gives the two compatible scalar-cover splittings and the Weil representation ωψ,χV,χW. Record dependence on ψ and the auxiliary characters. With the trace symplectic pairing fixed, the splitting is independent of the trace-zero δ used to express the construction.

**Hypotheses.**

- Characteristic zero local F; E/F quadratic field or split étale algebra. Hermitian forms nondegenerate. Each splitting uses the matching dimension and character restriction.

**Proof outline.**

1. Form the trace pairing after obtaining the requested ClassicalGroups Part-II Hermitian carriers over the general quadratic E/F; the existing complex-group roadmap alone does not supply them.
2. Apply Kudla’s unitary splitting construction with the dimension characters; verify δ-independence on the same fixed trace symplectic space, as specified in Gan–Ichino §4.

**Sources.**

- GanIchino16, §4 local theta setup, arXiv-v2 PDF11–12: The character restrictions in the unitary setup.
- GQT, §2.9, equation(2.2), PDF13: In zero Hermitian dimension the remaining unitary group acts by the auxiliary determinant character, not necessarily trivially.

**Uses.**

- Gan–Ichino §§3–4; Li–Liu Proposition3.6: Normalize the unitary theta modules and root-number dichotomy.

**API.**

- `TauCeti.Metaplectic.unitarySplitting_cocycle` (characterisation): Each splitting cochain cancels the pulled-back scalar cocycle.
- `TauCeti.Metaplectic.unitarySplitting_character_change` (functoriality): If χ is replaced by χη with η|F×=1, transport η to η̃:E¹→C× by η̃(x/xᶜ)=η(x). Changing χV twists the W-factor by η̃∘det; changing χW twists the V-factor by η̃∘det.
- `TauCeti.Metaplectic.unitarySplitting_delta` (compatibility): For the fixed trace symplectic space and ψ,χV,χW, changing the auxiliary trace-zero δ leaves the splitting unchanged.

**Checks.**

- `TauCeti.Metaplectic.unitarySplitting_zero` (degenerate): For V=0 the oscillator carrier is the line ℂ. On the unitary W factor its action is χV∘ι⁻¹∘det, where ι:E×/F×→E¹ sends x to x/xᶜ. For χV=1 this line is trivial; a valid nontrivial character trivial on F× need not act trivially.
- `TauCeti.Metaplectic.unitarySplitting_restriction` (non-example): A character whose restriction to F× is not ωE/F^dim V is rejected as splitting data.
- `TauCeti.Metaplectic.unitarySplitting_twist` (compatibility): Two valid characters differing by η trivial on F× produce η̃∘det, where η̃(x/xᶜ)=η(x). Testing ξ directly on det∈E¹ would miss the Hilbert-90 transport.

**Acceptance.**

- The resulting correspondence depends on ψ only through its norm-class orbit; dependence on arbitrary choices is not silently suppressed.

**Prerequisites.** [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-big-theta-module"></a>

### Big theta module — `MP.3/big-theta-module`

construction · from the MP.0 part · planet “Big theta module”

**Statement.** For commuting G×H actions on the oscillator space S and an irreducible admissible smooth G-representation π over C, define Θ(π)=(S⊗π∨)G using algebraic smooth coinvariants. Equivalently the maximal π-isotypic quotient of S is π⊗Θ(π). Restrict to the matched central characters so that the central kernel acts trivially. The H action descends by its commutation with G.

**Hypotheses.**

- Nonarchimedean local field and the specified dual pair/splittings. π∨ is the smooth contragredient, not the full algebraic dual. The maximal-isotypic comparison uses admissibility and Schur’s lemma.

**Proof outline.**

1. Import coinvariants, smooth dual and quotient actions from SR.0/SR.2.
2. Prove the Hom adjunction for the tensor coinvariants and use admissible Schur to identify the maximal π-isotypic quotient.

**Sources.**

- Kudla96, II.2, PDF32–33, maximal isotypic quotient and its theta factor: The maximal isotypic quotient definition and its theta multiplicity space.

**Uses.**

- Kudla II.3; Gan–Takeda Theorem1.1: State finite length, Howe duality, and see-saw without conflating big and small lifts.

**API.**

- `TauCeti.Metaplectic.bigTheta_hom` (universal-property): Linear maps from native tensor coinvariants are equivalent to invariant linear maps from the tensor product; the smooth G×H Hom comparison additionally needs the supplied smooth dual.
- `TauCeti.Metaplectic.bigTheta_equivariant` (structure): If the H action commutes with the G tensor action, it sends each coinvariant relation into the coinvariant kernel.
- `TauCeti.Metaplectic.bigTheta_isotypic` (compatibility): The maximal π-isotypic quotient of S is π⊗Θ(π).

**Checks.**

- `TauCeti.Metaplectic.bigTheta_character_mismatch` (non-example): If the common central element acts oppositely on S and π, the coinvariant quotient is zero.
- `TauCeti.Metaplectic.bigTheta_trivial_factor` (degenerate): For G=1 and π=C the quotient is S with its H action.
- `TauCeti.Metaplectic.bigTheta_quotient` (characterisation): Every G-equivariant map S→π⊗σ factors uniquely through the maximal π-isotypic quotient.

**Acceptance.**

- Do not replace Θ by its irreducible quotient or claim Θ is always irreducible.

**Prerequisites.** [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:Representation.Coinvariants`, `mathlib:Representation.Coinvariants.mk`, `mathlib:Representation.Coinvariants.lift`, `mathlib:Representation.IntertwiningMap`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-small-theta-module"></a>

### Small theta quotient — `MP.3/small-theta-module`

construction · from the MP.0 part

**Statement.** Define θ(π) as the maximal semisimple quotient of the finite-length big theta module in the source category. Under a stated Howe theorem, it is zero or irreducible. Define no arbitrary chosen irreducible summand when Howe duality has not been established.

**Hypotheses.**

- The big theta module is finite length. The semisimple quotient and radical are imported from SR.0/SR.3; archimedean variants use AF.1.

**Proof outline.**

1. Take the radical quotient and prove its universal property among semisimple quotients.
2. Apply the source-qualified multiplicity-one theorem for the zero-or-irreducible assertion.

**Sources.**

- GanTakeda16, §1 PDF1–2: Definition of small theta as the maximal semisimple quotient.

**Uses.**

- Gan–Takeda Theorem1.1 and Gan–Ichino theta parameters: Use Howe duality on the small lift with its exact quotient convention.

**API.**

- `TauCeti.Metaplectic.smallTheta_projection` (constructor): The natural Θ(π)→θ(π) is surjective.
- `TauCeti.Metaplectic.smallTheta_semisimple` (structure): θ(π) is semisimple in the supplied smooth category.
- `TauCeti.Metaplectic.smallTheta_factor` (universal-property): Every linear map killing the chosen quotient submodule factors uniquely through the native quotient. Identifying that submodule as the maximal semisimple radical is a separate source obligation.

**Checks.**

- `TauCeti.Metaplectic.smallTheta_zero` (degenerate): The radical quotient of the zero big lift is zero.
- `TauCeti.Metaplectic.smallTheta_simple` (compatibility): For an irreducible big lift the projection is an isomorphism.
- `TauCeti.Metaplectic.smallTheta_extension` (non-example): For a nonsplit extension 0→A→M→B→0 with unique simple quotient B, the maximal semisimple quotient is B, not A⊕B.

**Acceptance.**

- A nonzero big lift may be a nonsplit extension even though its small quotient is irreducible.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Representation.Coinvariants.mk`, `mathlib:Representation.IntertwiningMap`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-theta-finite-length"></a>

### Finite length of theta modules — `MP.3/theta-finite-length`

theorem · from the MP.0 part

**Statement.** For a type-I reductive dual pair over a nonarchimedean characteristic-zero local field and irreducible admissible π, Θ(π) is an admissible smooth H-module of finite length. At archimedean places state the corresponding finitely generated admissible (g,K)-module result on the oscillator Harish-Chandra module, with its own source gate.

**Hypotheses.**

- The matched central character and source splittings are fixed. Generic admissibility, Jacquet exactness and finite-length criteria belong to SR.2/SR.3; Harish-Chandra modules belong to AF.1.

**Proof outline.**

1. Use the finite-generation/compact-open argument for the oscillator quotient; apply the smooth admissibility theorem cited in Kudla II.3.
2. For the archimedean comparison use the K-finite oscillator module and the matching Howe module theorem; do not infer it from the nonarchimedean proof.

**Sources.**

- Kudla96, II.2 pp31–33, isotypic quotient and admissibility: Admissibility and finite length are assertions about the big module.

**Acceptance.**

- The source’s finite-length theorem does not make a big lift irreducible.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, `mathlib:IsArtinian`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-howe-duality"></a>

### Howe duality — `MP.3/howe-duality`

theorem · from the MP.0 part · planet “Howe duality”

**Statement.** For an orthogonal–symplectic or unitary type-I pair over a nonarchimedean local field of characteristic different from two, θ(π) is zero or irreducible, and nonzero θ(π)≃θ(π′) implies π≃π′. This includes residue characteristic two. For quaternionic pairs use the additional theorem explicitly, rather than treating Gan–Takeda’s partial quaternionic statement as full Howe duality. For real or complex type-I pairs, use the archimedean Howe theorem in the appropriate Harish-Chandra/smooth-globalization category; this is a separate original-source input, not a consequence of Gan–Takeda’s nonarchimedean theorem.

**Hypotheses.**

- The smooth representations are irreducible admissible and genuine where required. Gan–Takeda Theorem1.2 is the full orthogonal/symplectic/unitary theorem; its Theorem1.3 only gives scoped quaternionic conclusions.
- Archimedean Harish-Chandra modules/globalizations and Howe’s original theorem require AF.1 and the stated source gap; no extension to arbitrary algebraic representations is asserted.

**Proof outline.**

1. Apply the normalized doubling filtration to reduce nonboundary π to the regular representation quotient and multiplicity one.
2. In boundary cases use the oscillator Jacquet filtration and induction on the smaller dual pair; the type-II input is supplied separately.

**Sources.**

- GanTakeda16, Theorem1.2 and(HD), PDF2; proof §§4–6 PDF9 onward: Full theorem with characteristic and pair scope separated.
- PAPER-GAN-ICHINO-18, §2.2, arXiv-v3 PDF8: Classical local Howe input across characteristic-zero places. The archimedean original source and category comparison remain explicit gaps.
- PAPER-GAN-SAVIN-23, §14.1–14.3, arXiv-v1 PDF50–51: The classical input to the exceptional argument; the exceptional Howe theorem itself stays at its proposed separate owner.

**Acceptance.**

- Q₂ orthogonal–symplectic pairs are covered; general quaternionic pairs require Gan–Sun, not a changed hypothesis on Kudla’s odd-residue theorem.

**Prerequisites.** [`MP.3/small-theta-module`](#n-mp-3-small-theta-module), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-local-see-saw"></a>

### Local see-saw identity — `MP.3/local-see-saw`

theorem · from the MP.0 part · planet “See-saw identity”

**Statement.** For a see-saw of commuting dual pairs inside one symplectic space with compatible splittings, identify HomH1(ΘG1(π1),π2) with HomH2(ΘG2(π2∨),π1∨), after writing the common oscillator Hom space and its exact tensor/dual conventions. State the identity first for big theta coinvariants; a small-theta version needs semisimplicity/Howe hypotheses.

**Hypotheses.**

- Smooth admissible modules; compatible restrictions of the same oscillator representation; archimedean version in AF.1.

**Proof outline.**

1. Apply the coinvariant tensor-Hom adjunction twice to the common restricted oscillator module.
2. Transport the identifications through the orthogonal-sum tensor oscillator isomorphism.

**Sources.**

- Kudla96, IV.1 pp59–66, see-saw examples and oscillator Hom route: The standard see-saw statement; its use is checked independently in Gan–Ichino §5.

**Acceptance.**

- Tensoring by the determinant/auxiliary character of a different splitting changes both sides by that twist.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `AutomorphicFormsOnReductiveGroups:AF.1`, [`MP.2/character-and-dual`](#n-mp-2-character-and-dual).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-persistence-and-stable-range"></a>

### Persistence and stable range — `MP.3/persistence-and-stable-range`

theorem · from the MP.0 part

**Statement.** In a fixed orthogonal Witt tower V_r=V_0⊕H^r paired with Sp(W), dim W=2n, a nonzero theta lift persists for larger r. Every irreducible admissible genuine π has nonzero theta lift in stable range r≥2n; in the reverse direction a fixed O(V)-representation has nonzero lift when n≥dim V. These are sufficient bounds, not minimal first-occurrence formulas.

**Hypotheses.**

- Nonarchimedean local F in Kudla’s stated odd-residue range; broader fields use the separately qualified nonvanishing sources.

**Proof outline.**

1. Use the zero-rank term in Kudla’s Jacquet filtration for persistence.
2. Construct the stable-range quotient on the open full-rank orbit and apply induction/Frobenius reciprocity.

**Sources.**

- Kudla96, III.4 Propositions4.1,4.3–4.5, PDF44–49: Persistence and the safe stable-range bounds.

**Acceptance.**

- A tower label includes the anisotropic kernel and oscillator enhancement; dimension alone does not distinguish towers.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-first-occurrence"></a>

### First occurrence in a Witt tower — `MP.3/first-occurrence`

definition · from the MP.0 part

**Statement.** For a supplied tower V_r and π define the first-occurrence rank as the least r with ΘV_r(π)≠0, in WithTop N before nonvanishing is proved. Define the dimension index m_0+2r separately. Record the tower’s discriminant, Hasse invariant, anisotropic kernel and auxiliary splitting characters.

**Hypotheses.**

- Tower supplied by QuadraticFormInvariants and classical groups; nonvanishing at a finite rank is a theorem input, not part of the definition.

**Proof outline.**

1. Use the least element of the nonempty set after stable-range nonvanishing; retain ⊤ without that hypothesis.
2. Convert between rank and dimension only with the fixed m_0.

**Sources.**

- SunZhu15, §1.5 PDF5–8: Enhanced towers and their dimension-index convention.

**Uses.**

- Sun–Zhu conservation; Gan–Ichino smaller odd towers: State vanishing and first occurrence without an implicit finite-index assumption.

**API.**

- `TauCeti.Metaplectic.firstOccurrence_nonzero` (characterisation): For finite first occurrence r₀, ΘV_r₀(π) is nonzero.
- `TauCeti.Metaplectic.firstOccurrence_vanishing` (characterisation): For r<r₀ the big lift is zero.
- `TauCeti.Metaplectic.firstOccurrence_dimension` (compatibility): The dimension index is m_0+2r₀ when r₀ is finite.

**Checks.**

- `TauCeti.Metaplectic.firstOccurrence_zero` (computation): If ΘV_0(π) is nonzero, the rank index is 0 and the dimension index is m_0.
- `TauCeti.Metaplectic.firstOccurrence_empty` (degenerate): If every lift vanishes, the index in WithTop N is ⊤.
- `TauCeti.Metaplectic.firstOccurrence_anisotropic` (non-example): Two towers with distinct anisotropic dimensions and equal rank index need not have equal dimension index.

**Acceptance.**

- Rank and dimension differ by m_0+2r and cannot share one unqualified numerical conservation formula.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), [`MP.3/persistence-and-stable-range`](#n-mp-3-persistence-and-stable-range), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-supercuspidal-first-occurrence"></a>

### Supercuspidal first occurrence — `MP.3/supercuspidal-first-occurrence`

theorem · from the MP.0 part

**Statement.** For a supercuspidal π in Kudla’s nonarchimedean orthogonal–symplectic range, let r₀ (respectively n₀ in the reverse direction) be first occurrence. At every larger rank the big lift is irreducible admissible and equals the small lift. At first occurrence it is supercuspidal; above first occurrence it is not supercuspidal and embeds in the normalized parabolic induction of the first lift with the explicit tower characters of III.6 Theorems6.1–6.2. Do not extend this big=small assertion to arbitrary nonsupercuspidal π.

**Hypotheses.**

- Nonarchimedean odd residue characteristic as in Kudla III; π irreducible supercuspidal, fixed tower and splittings.

**Proof outline.**

1. Apply the Jacquet filtration: all proper-radical terms vanish before the first occurrence.
2. Use the first-occurrence quotient and Howe theorem, then identify higher-rank Jacquet terms by induction.

**Sources.**

- Kudla96, III.6 Theorems6.1–6.2 pp52–53; proof sketch IV.3 pp70–74: First occurrence and higher tower behavior.

**Acceptance.**

- No claim that every irreducible big theta module is supercuspidal.

**Prerequisites.** [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), [`MP.3/howe-duality`](#n-mp-3-howe-duality), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-kudla-jacquet-filtration"></a>

### Kudla’s Jacquet filtration — `MP.3/kudla-jacquet-filtration`

theorem · from the MP.0 part

**Statement.** For Q(X_a)⊂G(W_n), the normalized Jacquet module of ω has a finite filtration with kth quotient, 0≤k≤min(a,q_V), equal to normalized induction from Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k) of χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}. Here s_{m,n}=(m−n−ε₀)/2 and (b,c) acts on f(g) by χV(det b)χW(det c)f(c⁻¹gb).

**Hypotheses.**

- Gan–Takeda §2 conventions; normalized induction/Jacquet functor and modulus characters; the metaplectic Levi has its genuine χψ factor. Unipotent radicals split canonically.

**Proof outline.**

1. Stratify the oscillator support by rank of the X_a→V coordinate and take successive quotient spaces.
2. Compute the stabilizer, its modulus and determinant characters; invoke SR.2/3 geometric lemma and induction rather than re-proving those functors.

**Sources.**

- GanTakeda16, Lemma3.1 PDF7–8: Rank-orbit normalized Jacquet quotients and their exponents.

**Acceptance.**

- k=0 has no Isom-factor; the nonempty kth quotient vanishes for k larger than the Witt index.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-doubling-filtration"></a>

### Doubling principal-series filtration — `MP.3/doubling-filtration`

theorem · from the MP.0 part

**Statement.** For I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s, its restriction to G(W)×G(W) has rank-t quotients induced from Q_t×Q_t with characters χV|det X_t|^{s+t/2} on both GL_t factors and χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t})) on the remaining factors. The open-orbit quotient R_0=χV(det W⁻)⊗Cc∞G(W) is independent of s.

**Hypotheses.**

- Gan–Takeda normalized induction conventions; actual group dimensions and ε-Hermitian type fixed.

**Proof outline.**

1. Filter the doubled flag variety by orbit rank under the product group.
2. Apply the stabilizer modulus computation; regular-representation duality treats R_0 and Jacquet reciprocity treats t>0.

**Sources.**

- GanTakeda16, Lemma3.2, PDF7–8, filtration of degenerate principal series: Doubling filtration separating boundary and nonboundary cases.

**Acceptance.**

- Boundary detection uses Hom_{GL_t}(χV|det|^{s+t/2},R_Qbar π)≠0, including the normalized sign.

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-type-ii-theta"></a>

### Type-II theta input — `MP.3/type-ii-theta`

theorem · from the MP.0 part

**Statement.** For the split type-II pair GL_m(F)×GL_n(F), the small theta lift of an irreducible smooth representation is zero or irreducible, and nonzero lifts determine the source representation uniquely. The unequal-rank parameter formula used by a boundary argument is a separately requested Mínguez input; no general n<m vanishing is asserted.

**Hypotheses.**

- Smooth irreducible representations; the pair orientation and normalized action are those of Gan–Takeda’s cited Mínguez theorem.

**Proof outline.**

1. Identify the full-rank orbit with the regular representation at equal rank.
2. Import the generic GL representation classification from SR.3; collate the unequal-rank Mínguez theorem before using it.

**Sources.**

- GanTakeda16, §3 proof strategy, PDF9, cited general-linear Howe input; original Mínguez statement is a gap: The type-II input is source-qualified.

**Acceptance.**

- A rank comparison alone does not force the lift of every irreducible representation to vanish.

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-mvw-and-cover-induction"></a>

### MVW involution and metaplectic induction — `MP.3/mvw-and-cover-induction`

comparison · from the MP.0 part

**Statement.** Transport the native smooth dual/induction operations to the canonical split unipotent radicals of Mp. The MVW involution is an exact covariant functor and for irreducible π gives π^MVW≃π∨; it is not the contragredient functor on every module. On a standard Levi GL_k×Mp_{2n−2k}, τ̃ψ=(τ∘projection)⊗χψ has central −1 acting by −1 and determines normalized parabolic induction.

**Hypotheses.**

- Nonarchimedean characteristic-zero F for the smooth comparison; real Lie-group variants use AF.1 and their own proof. χψ is the Weil-index genuine character on the covered GL factor.

**Proof outline.**

1. Apply the anti-isometry of the form and the corresponding automorphism of the cover to define the covariant twist.
2. Use the irreducible MVW theorem and induction covariance with the modulus and character factors explicit.

**Sources.**

- PAPER-GAN-ICHINO-18, §5.2–5.3 PDF18–20, Lemma5.2: Contragredient and induction are used with distinct variance.

**Acceptance.**

- For any short exact sequence the MVW twist retains arrow direction; algebraic dual reverses it.

**Prerequisites.** [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-nonarchimedean-conservation"></a>

### Nonarchimedean conservation relations — `MP.3/nonarchimedean-conservation`

theorem · from the MP.0 part

**Statement.** For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}. Here d is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic U. In particular an Sp_{2n} representation in the two even-orthogonal towers has dimension sum 4n+4, and for O(V) the symplectic rank indices of π and π⊗det sum dim V.

**Hypotheses.**

- Characteristic-zero nonarchimedean F, including residue characteristic two; towers enhanced by their oscillator character; genuine π as in Theorem1.10.

**Proof outline.**

1. Prove the Kudla homomorphism and its kernel on enhanced Witt data.
2. Use the nonoccurrence lower bound and degenerate principal-series quotients to prove the matching upper bound; convert dimension to rank with each anisotropic kernel explicit.

**Sources.**

- SunZhu15, Theorem1.10 PDF8–10; §§5–6: Dimension-index conservation, not a universal rank-only formula.

**Acceptance.**

- For Sp₂ the even-orthogonal dimension sum is 8; a formula summing their Witt ranks to 4 would be wrong.

**Prerequisites.** [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/doubling-filtration`](#n-mp-3-doubling-filtration), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-archimedean-conservation"></a>

### Archimedean first-occurrence cases — `MP.3/archimedean-conservation`

theorem · from the MP.0 part

**Statement.** For real/complex orthogonal U, n_t₁(π)+n_t₂(π)=2 dim U for the towers differing by the sign class. For complex symplectic or real quaternionic Hermitian U there is no two-tower conservation relation: the parity-compatible first occurrence is at most dim U or dim U+1. For real symplectic, complex unitary, or real quaternionic skew-Hermitian U, each K_U-coset T has a distinct pair with dimension sum 2 dim U+d; every other pair has sum at least 2 dim U+d|t₃−t₄|, and the two minima modulo 2K_U sum 2 dim U+d.

**Hypotheses.**

- Irreducible admissible genuine Harish-Chandra/smooth representations with the enhancement of Sun–Zhu §7; no claim across inequivalent oscillator cosets.

**Proof outline.**

1. Use the three distinct kernels of the archimedean Kudla homomorphism.
2. Apply Theorems7.1,7.3,7.6 and the scoped degenerate-principal-series statements; import the (g,K) category from AF.1.

**Sources.**

- SunZhu15, §7.2 Theorems7.1,7.3,7.6 PDF43–46: Exceptional archimedean cases and the coset formula.

**Acceptance.**

- Complex symplectic spaces satisfy the parity bound, not the nonarchimedean two-tower equality.

**Prerequisites.** [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), `AutomorphicFormsOnReductiveGroups:AF.1`, [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-unitary-equal-almost-equal-rank"></a>

### Unitary equal and almost equal rank — `MP.3/unitary-equal-almost-equal-rank`

theorem · from the MP.0 part

**Statement.** For tempered π of U(W_n) over a nonarchimedean characteristic-zero F, equal-rank theta to U(V_n^ε) is nonzero in exactly one sign, determined by ε(1/2,φπχV⁻¹,ψ₂^E)=εε′, and its parameter is φπχV⁻¹χW. For rank n+1, if χV is absent from φπ both signs are nonzero, while if χV occurs exactly one sign is nonzero; the lifted parameter is (φπχV⁻¹χW)⊕χW. In these stated tempered ranges the big nonzero lift is irreducible.

**Hypotheses.**

- Auxiliary χ restrictions and ψ₂^E as in Gan–Ichino; LLC, component groups and epsilon factors are imported, not defined by this packet.

**Proof outline.**

1. Use Kudla’s Jacquet filtration to reduce nontempered assertions only where the source does so.
2. For the tempered theorem use unitary dichotomy and the specified LLC/root-number comparison, separately for equal and almost equal rank.

**Sources.**

- GanIchino16, Theorems4.1 and4.4 PDF11–15: Precise tempered big-lift irreducibility and the two rank ranges.

**Acceptance.**

- The irreducibility assertion cannot be extended to every tempered big lift in every rank from these theorems.

**Prerequisites.** [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation), `SmoothRepresentationsOfLocalGroups:SR.3`, `ModularityAndLanglandsExtensions:ML.4`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R2: replace `ModularityAndLanglandsExtensions:ML.4` by `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tempered-unitary-local-packets`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`. verified: the target needs, for tempered π of U(W_n) over a nonarchimedean field of characteristic zero, the L-parameter, the component-group characters over both pure inner forms V_n^±, and the root number ε(1/2, φ_π χ_V⁻¹, ψ₂^E). ET.4/tempered-unitary-local-packets states the tempered packets and their pairing for every extended pure inner twist (KMSW Theorem* 1.6.1), and R01.2/local-epsilon-factor the Deligne–Langlands local constants. Neither has an ancestor in this roadmap.

<a id="n-mp-3-unitary-doubling-dichotomy"></a>

### Unitary doubling multiplicity and dichotomy — `MP.3/unitary-doubling-dichotomy`

theorem · from the MP.0 part

**Statement.** In Li–Liu Assumption3.1’s rank-2r skew-Hermitian setting, the two equal-rank Hermitian theta choices give the local dichotomy of Proposition3.6 and the local doubling Hom space has dimension at most one. Keep its assertion that the relevant big theta module is semisimple as a separate source/proof gate; Gan–Ichino’s scoped irreducibility theorem alone does not prove that broader assertion.

**Hypotheses.**

- Characteristic zero local fields, the exact relevant tempered representation and splitting data of Li–Liu; archimedean case uses AF.1.

**Proof outline.**

1. Compare the regular and boundary doubled principal-series quotients with the relevant π.
2. Apply the equal-rank dichotomy and source-qualified semisimplicity argument; no arbitrary direct sum decomposition is used.

**Sources.**

- PAPER-LI-LIU-21, Proposition3.6 PDF15–17: Dichotomy and the distinct semisimplicity proof obligation.

**Acceptance.**

- A unique irreducible quotient does not establish semisimplicity of the big module.

**Prerequisites.** [`MP.3/doubling-filtration`](#n-mp-3-doubling-filtration), [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), `AutomorphicFormsOnReductiveGroups:AF.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-mp-odd-orthogonal-unramified"></a>

### Unramified metaplectic theta and induction — `MP.3/mp-odd-orthogonal-unramified`

theorem · from the MP.0 part

**Statement.** For nonarchimedean odd-residue F and ψ of conductor O_F, the standard compact splitting identifies unramified genuine Mp₂n representations with unramified principal-series constituents induced from χψ|·|^{s_i}. The ψ-relative parameter is ⊕i(|·|^{s_i}⊕|·|^{−s_i}). Smaller odd-orthogonal towers obey the first-occurrence vanishing and induction principle of Gan–Ichino Lemmas6.3,6.8,6.10, with the removed character pairs and their modulus factors explicit.

**Hypotheses.**

- For almost tempered induction require |Re s_i|<1/2. The smaller-tower statements retain the exact lemma hypotheses; ψ changes act through its square class and the associated orthogonal-space scaling.

**Proof outline.**

1. Use the standard unramified oscillator vector and the compact splitting to calculate its torus Hecke eigenvalues.
2. Apply the rank filtration/induction principle, then the first-occurrence and conservation formulas to exclude or identify smaller towers.

**Sources.**

- PAPER-GAN-ICHINO-18, Remark5.3 PDF19–20; Lemmas6.3,6.8,6.10 PDF21,24–27: Unramified principal series and smaller odd towers.

**Acceptance.**

- No standard integral compact splitting is asserted at dyadic places by this unramified statement.

**Prerequisites.** [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), [`MP.2/character-and-dual`](#n-mp-2-character-and-dual), `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-rallis-unramified-satake"></a>

### Rallis unramified theta parameters — `MP.3/rallis-unramified-satake`

comparison · from the MP.0 part

**Statement.** Relate the spherical Hecke characters of a nonzero local theta lift by Rallis’s L-group map, including the additional SL₂/principal-series segment specified by the dimension difference. For the orthogonal–symplectic instances of Chenevier–Taïbi §5.3.2, keep the local Satake relation separate from their global level-one multiplicity computation.

**Hypotheses.**

- Unramified local datum, compatible integral lattices, ψ conductor zero, compact splitting and the exact source dimension/parity.

**Proof outline.**

1. Compute the Hecke action on the spherical oscillator vector and its joint annihilator.
2. Translate the Satake map with the normalized induction convention; import Satake and Hecke algebras from their owners.

**Sources.**

- PAPER-CHENEVIER-TAIBI-20, §5.3.2 PDF50; §5.4 PDF54–55: The local theta Satake input; global level-one results stay in their owner.

**Acceptance.**

- At equal rank the relation has no extra segment; changing normalized to unnormalized induction changes the powers of q.

**Prerequisites.** [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction), [`MP.2/generator-operators`](#n-mp-2-generator-operators), `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-unitary-hecke-compatibility"></a>

### Unitary theta Hecke compatibility — `MP.3/unitary-hecke-compatibility`

comparison · from the MP.0 part

**Statement.** For Li–Liu’s unramified/almost-unramified and split local places, the oscillator spherical module induces the surjective Hecke map θ^R:H^R_W→T^R, and the π Hecke character factors through it. The operator on the theta output has the contragredient/conjugate character χπ(s)^c. At ramified odd places of Li–Liu22, use the special compact K_r and the trace-self-dual lattice indicator, not the unramified hyperspecial vector.

**Hypotheses.**

- Exact Assumption3.1 and compact subgroups; rank2r Hermitian target. Ramified E/F has odd residue characteristic, ψ conductor O_F and the source’s trivial splitting characters.

**Proof outline.**

1. Use the spherical oscillator module and joint Satake annihilator to obtain the map.
2. Apply adjunction to transfer Hecke operators through the theta integral, keeping the dual/conjugate character.

**Sources.**

- PAPER-LI-LIU-21, Definition6.8, Proposition6.10 PDF31–32; Lemma11.1 PDF49–50: Hecke character factorization and its dual convention.
- PAPER-LI-LIU-22, Definition3.2, Lemma3.3, Proposition3.4 PDF43–45: Ramified special-compact oscillator module.

**Acceptance.**

- The special compact K_r in a ramified unitary group is not automatically hyperspecial.

**Prerequisites.** [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-similitude-datum"></a>

### Quaternionic similitude dual pair — `MP.3/quaternionic-similitude-datum`

construction · from the MP.0 part

**Statement.** Let B=E⊕Ej over F, E=F(i), i²=u, j²=J. For a right skew-Hermitian B-space V of rank m with diagonal κ_i i and the left Hermitian line W=B, construct the F-symplectic space V⊗B W with pairing (1/2)Tr_{B/F}(the tensor product of the skew-Hermitian and Hermitian pairings). The matched subgroup G={(g,h)∈GU(V)^0×B×:ν(g)=ν(h)∈N_{E/F}(E×)} acts by g⁻¹v⊗wh. The bases e_i⊗1,e_i⊗j and e_i⊗i,e_i⊗ij give X,Y.

**Hypotheses.**

- Characteristic-zero local or global F; E embedded in B; nondegenerate forms; connected similitude factor and norm-image condition retained.

**Proof outline.**

1. Check the alternating nondegenerate trace tensor pairing in the stated quaternion basis.
2. Matched multipliers cancel in the pairing; convert the source’s right action to a left action by inversion.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA.1, (A.1)–(A.2), arXiv-v2 PDF87–89: Quaternionic tensor pairing, matched similitudes and polarization.

**Uses.**

- Ichino–Prasanna PropositionA.1: Define the scalar-cover pullback and similitude theta lift.

**API.**

- `TauCeti.Metaplectic.quaternionTensor_pairing` (simp): The pairing is half the reduced trace.
- `TauCeti.Metaplectic.quaternionSimilitude_invariant` (structure): Matched multipliers preserve the tensor pairing.
- `TauCeti.Metaplectic.quaternionPolarization` (constructor): X,Y span complementary Lagrangians.

**Checks.**

- `TauCeti.Metaplectic.quaternionTensor_rankOne` (computation): At m=1 each Lagrangian has F-dimension2.
- `TauCeti.Metaplectic.quaternionTensor_zero` (degenerate): At m=0 the tensor space is zero.
- `TauCeti.Metaplectic.quaternionTensor_mismatch` (non-example): Unequal multipliers rescale the pairing, hence do not give a symplectic isometry.

**Acceptance.**

- The F-dimension is4m and the two Lagrangians have dimension2m.

**Prerequisites.** [`MP.3/orthogonal-symplectic-dual-pair`](#n-mp-3-orthogonal-symplectic-dual-pair), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-splitting"></a>

### Quaternionic similitude splitting — `MP.3/quaternionic-splitting`

construction · from the MP.0 part

**Statement.** Construct s_v:G_v→C¹ with z_Y(g₁,g₂)=s_v(g₁g₂)/(s_v(g₁)s_v(g₂)). It obeys s_v(zg)=ξE_v(z)^m s_v(g), agrees with the standard compact splitting almost everywhere, and ∏v s_v(γ)=1 for γ∈G(F). This splits the scalar-circle cover on the norm-image subgroup; no μ₂ splitting is inferred.

**Hypotheses.**

- AppendixA.1 datum; global ψ trivial on F for the product assertion; compatible local measures.

**Proof outline.**

1. Multiply the two doubled cochains on G^sharp and the polarization correction μ.
2. Divide by the norm-one kernel correction to descend independently of α and auxiliary χ.
3. Use the local computations and global Weil-index product for the central, compact and rational properties.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, PropositionA.1 and §§A.2–A.7 PDF89–99: Scalar splitting and its central, compact and rational properties.

**Uses.**

- Ichino–Prasanna §§7–9: Define adelic similitude theta kernels and their central character.

**API.**

- `TauCeti.Metaplectic.quaternionSplitting_cocycle` (characterisation): The cochain cancels z_Y in the stated quotient direction.
- `TauCeti.Metaplectic.quaternionSplitting_central` (simp): Central scalars give ξE(z)^m.
- `TauCeti.Metaplectic.quaternionSplitting_auxiliary` (compatibility): The result is independent of α and auxiliary χ.

**Checks.**

- `TauCeti.Metaplectic.quaternionSplitting_identity` (degenerate): s_v(1)=1.
- `TauCeti.Metaplectic.quaternionSplitting_character` (non-example): An odd-rank scalar with ξE(z)=−1 acts by −1.
- `TauCeti.Metaplectic.quaternionSplitting_product` (compatibility): For rational γ the product of local values is1.

**Acceptance.**

- For odd m a scalar z with ξE(z)=−1 gives −1.

**Prerequisites.** [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum), [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-first-doubled-splitting"></a>

### First doubled quaternionic splitting — `MP.3/quaternionic-first-doubled-splitting`

theorem · from the MP.0 part

**Statement.** On U(V⊕V⁻), ŝ₁ is1 for split B and (−1)^j on a Bruhat stratum for division B. It cancels z_{V△}, is invariant under E× conjugation, and on the norm-one scalar embedding α has value1 if α=1 and (−1)^m otherwise in the division case.

**Hypotheses.**

- AppendixA.2–A.3 bases and Bruhat index; α∈E¹.

**Proof outline.**

1. Compare doubled and diagonal polarizations.
2. Compute the Bruhat index and split/division Weil index.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.3–A.4, PDF90: Conjugation invariance and norm-one evaluation.

**Acceptance.**

- Keep the special identity element case.

**Prerequisites.** [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum), [`MP.2/leray-cocycle`](#n-mp-2-leray-cocycle), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-second-doubled-splitting"></a>

### Second doubled quaternionic splitting — `MP.3/quaternionic-second-doubled-splitting`

theorem · from the MP.0 part

**Statement.** For the doubled unitary W-model, ŝ₂(h)=χ(x(h))^mγ^{−j(h)}, γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}. It is invariant under E× conjugation. The diagonal norm-one scalar gives χ(α)^{−2m}; the mixed embedding of A.7 gives χ(α)^{−m} times1 for split B and (−1)^m for division B.

**Hypotheses.**

- Exact embeddings ι and bases of §§A.4–A.5; χ|F×=ξE, α∈E¹.

**Proof outline.**

1. Calculate rank and x invariant of the embedded matrices.
2. Apply normalized Weil-index identities.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.5–A.7, PDF92: The two distinct norm-one scalar embeddings.

**Acceptance.**

- Their χ exponents differ: −2m and −m.

**Prerequisites.** [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-sharp-descent"></a>

### Sharp splitting and norm-one descent — `MP.3/quaternionic-sharp-descent`

comparison · from the MP.0 part

**Statement.** On G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}, set ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹,1))ŝ₂(ι(hα⁻¹,1))z_{V△}(ι(gα⁻¹,1),ι(hα⁻¹,1)). Define μ(σ)=z_{Y□}(σ₀,σ)⁻¹z_{Y□}(σ₀σσ₀⁻¹,σ₀), so z_{Y□}=z_{V△}δμ. Put s^sharp=ŝ^sharp·μ and s₂=ŝ₂·μ on their respective embedded groups. Descend s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α])). LemmaA.10 proves independence of the norm lift using LemmaA.9; LemmaA.12 cancels auxiliary χ.

**Hypotheses.**

- Exact α lift of the common norm multiplier and polarization σ₀.

**Proof outline.**

1. Multiply the cocycle identities on G^sharp.
2. Compute the kernel action and χ-change factors, then descend.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.8–A.12, PDF93–96: Sharp cochain, polarization correction and descent.

**Acceptance.**

- Replacing μ by μ⁻¹ fails the stated coboundary direction.

**Prerequisites.** [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting), [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting), [`MP.2/leray-cocycle`](#n-mp-2-leray-cocycle).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-see-saw-compatibility"></a>

### Quaternionic see-saw and Periods-II comparison — `MP.3/quaternionic-see-saw-compatibility`

comparison · from the MP.0 part

**Statement.** For an orthogonal sum V=V′⊕V″ with matched similitude triple, s=s′s″ on the see-saw restriction. In rank-one Periods-II conventions, s^natural(α,h)=s(α,h)χ(α)⁻¹.

**Hypotheses.**

- Compatible polarizations, ψ and χ; exact norm-image subgroups and components.

**Proof outline.**

1. Apply orthogonal-sum multiplicativity of the Leray/Weil indices.
2. Compare the rank-one diagonal matrices and auxiliary character.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA.8 LemmaA.13, PDF97: See-saw restriction and the Periods-II character twist.

**Acceptance.**

- Retain χ(α)⁻¹ in the Periods-II comparison.

**Prerequisites.** [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent), [`MP.3/local-see-saw`](#n-mp-3-local-see-saw).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-periods-i-comparison"></a>

### Periods-I splitting comparison — `MP.3/periods-i-comparison`

theorem · from the MP.0 part

**Statement.** For m=2, V=B₁⊗E B₂, J₁J₂=J, κ₁=1, κ₂=−J₁, the ratio ζ=tilde s/s is an automorphic character. If F is totally real, E totally imaginary and B₁,B₂ split at one common real place, ζ=1 at every local place.

**Hypotheses.**

- All global hypotheses of A.14, including the common split real place.

**Proof outline.**

1. Reduce ζ to the norm-image quotient and kill the derived subgroup.
2. Check both E× embeddings and the negative real generator; the common split real place removes the residual sign character.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA PropositionA.14, equations(A.9)–(A.11), PDF98–99: Global character argument and its real-place hypothesis.

**Acceptance.**

- Do not claim the equality after deleting that real-place hypothesis.

**Prerequisites.** [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting), [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, [`MP.3/periods-i-first-scalar-calculation`](#n-mp-3-periods-i-first-scalar-calculation), [`MP.3/periods-i-second-scalar-calculation`](#n-mp-3-periods-i-second-scalar-calculation), [`MP.3/periods-i-square-quaternion-calculation`](#n-mp-3-periods-i-square-quaternion-calculation).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-periods-i-first-scalar-calculation"></a>

### First scalar splitting calculation — `MP.3/periods-i-first-scalar-calculation`

theorem · from the MP.0 part

**Statement.** For α=a+bi with a,b≠0, tilde s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F; ŝ₂(ι([α,α],1))=χ(α)⁻²(u,J₁)_F; μ on that matrix is γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F. Together these give s=tilde s on the first E× embedding.

**Hypotheses.**

- Rank-two Periods-I datum and exact embeddings.

**Proof outline.**

1. Factor the matrices into Bruhat generators.
2. Compute x,j,μ and cancel u using Hilbert identities.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.15–A.17, PDF100–104: Three calculations for (A.9).

**Acceptance.**

- At m=2 the χ power is −4.

**Prerequisites.** [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting), [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-periods-i-second-scalar-calculation"></a>

### Second scalar splitting calculation — `MP.3/periods-i-second-scalar-calculation`

theorem · from the MP.0 part

**Statement.** For α=a+bi with a,b≠0, tilde s(α,α⁻¹,1)=γ_F(J,ψ/2)(−2abJ₁,J)_F; ŝ₁(ι([α,α⁻¹],1))=(u,J)_F; μ is γ_F(J,ψ/2)(−2abuJ₁,J)_F. Together these give s=tilde s on the second E× embedding.

**Hypotheses.**

- Rank-two datum; both a,b nonzero before continuous extension.

**Proof outline.**

1. Use the quaternionic Bruhat factorization.
2. Evaluate the Leray form under σ₀ and cancel the Weil-index factors.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.18–A.20, PDF104–106: Three calculations for (A.10).

**Acceptance.**

- Treat a=0 or b=0 by local continuity.

**Prerequisites.** [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting), [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-periods-i-square-quaternion-calculation"></a>

### Square quaternion splitting calculation — `MP.3/periods-i-square-quaternion-calculation`

theorem · from the MP.0 part

**Statement.** When J_i=t_i², the normalized generators j_i^natural=j_i/t_i have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11).

**Hypotheses.**

- Specified square roots and the global real-place argument of A.14.

**Proof outline.**

1. Evaluate x,j,μ on the normalized quaternion matrices.
2. Use the generating quotient argument of A.14.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.21–A.23, PDF106–108: Square-quaternion generators.

**Acceptance.**

- A change of square root changes the normalized matrix.

**Prerequisites.** [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent), [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting), [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-harris-kudla-morita-comparison"></a>

### Harris–Kudla splitting comparison — `MP.3/harris-kudla-morita-comparison`

comparison · from the MP.0 part

**Statement.** For split B and idempotent e, V^dagger=Ve and W^dagger=eW have dimensions2m and2; V^dagger has symmetric diagonal (κ_i u/2,−κ_i/2). Set s^dagger(h)=ξE(x(h))^m(γ′)^{−j(h)}, γ′=γ_F(ψ/2)^{2m}γ_F(det V^dagger,ψ/2)Hasse(V^dagger). Extend to similitudes by h↦h d(ν(h))⁻¹. The polarization correction gives s₀=s^daggerμ₀=s.

**Hypotheses.**

- Exact split quaternion idempotent and bases; norm-image multipliers; source quadratic determinant.

**Proof outline.**

1. Check the Morita pairings and A.24 cocycle.
2. Use A.26 s=s′μ₀ and A.27 s^dagger=s′ with the explicit matrices.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, AppendixA LemmasA.24–A.27, PDF108–115: Morita comparison and polarization correction.

**Acceptance.**

- For generic α=a+bi, retain γ_F(u)^m∏i(2bκ_i,u)_F.

**Prerequisites.** [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), [`MP.3/orthogonal-symplectic-dual-pair`](#n-mp-3-orthogonal-symplectic-dual-pair).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-similitude-theta-howe"></a>

### Similitude theta correspondence — `MP.3/similitude-theta-howe`

theorem · from the MP.0 part

**Statement.** For the matched multiplier subgroup R⊂G×H^+ and its extended oscillator action, Ω=compact Ind_R^{G×H^+}ω has finite-length big theta quotients. In the classical pairs scoped by Ichino–Prasanna, the small lift is zero or irreducible and injective on its nonzero domain. H^+ is the multiplier-image subgroup.

**Hypotheses.**

- Characteristic-zero local F; isometry-group Howe, Clifford and compact-induction inputs; AF.1 at infinity.

**Proof outline.**

1. Restrict to isometry groups and apply Howe duality.
2. Apply Clifford theory and conservation to pass through the multiplier quotient and O/SO components.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, §7.2 and Lemma9.3 arXiv PDF41–42,50–52: Similitude extension on its multiplier-image subgroup.

**Acceptance.**

- The inducing subgroup projects onto H^+, not necessarily all H.

**Prerequisites.** [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-real-discrete-series-theta"></a>

### Real discrete-series theta lifts — `MP.3/real-discrete-series-theta`

comparison · from the MP.0 part

**Statement.** For ψ_R(t)=exp(2πit), k≥2 and holomorphic SL₂(R) discrete series of weight k+1, theta to O(4,2) restricts to the identity component as A_q₀(0,0,k−2), while its dual lifts as A_q₁(k−2,0,0). q₀ has Levi so(4)+so(2); q₁ has Levi so(2)+so(2,2) and minimal K-type(k,0,0). To O(0,6) the holomorphic lift has highest weight(k−2,0,0), and the dual lift is zero.

**Hypotheses.**

- Positive ψ; exact root basis, components and cohomological induction conventions of the source.

**Proof outline.**

1. Use real first occurrence and oscillator K-types.
2. Import cohomological induction from AF.1 and collate the cited module identification.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, §7.2.1–7.2.2 arXiv PDF41–42: Holomorphic/dual distinction at the two signatures.

**Acceptance.**

- At k=2 the O(0,6) highest weight is zero but the dual lift still vanishes.

**Prerequisites.** [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), `AutomorphicFormsOnReductiveGroups:AF.1`, [`MP.2/character-and-dual`](#n-mp-2-character-and-dual).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-quaternionic-unramified-theta"></a>

### Quaternionic unramified theta lift — `MP.3/quaternionic-unramified-theta`

comparison · from the MP.0 part

**Statement.** In Lemma9.4’s odd-residue unramified E/F, split B, self-dual V^dagger and conductor-zero ψ setup, an unramified H^+ constituent of normalized GL₂ induction χ₁⊗χ₂ lifts to the GSO(3,3)-form constituent induced from (χ₁χ₂⁻¹ξE)⊗|·|⊗((χ₂|·|⁻¹/²)∘N_{E/F}), on the source’s torus coordinates.

**Hypotheses.**

- Norm-image subgroup, exact Borel and integral splitting.

**Proof outline.**

1. Use the Harris–Kudla/Morita comparison on the spherical vector.
2. Calculate the normalized torus Hecke map.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, Lemma9.4 arXiv PDF53: Unramified similitude lift and characters.

**Acceptance.**

- The |·|⁻¹/² factor is retained.

**Prerequisites.** [`MP.3/harris-kudla-morita-comparison`](#n-mp-3-harris-kudla-morita-comparison), `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-rank-one-oscillator-constituents"></a>

### Rank-one oscillator constituents — `MP.3/rank-one-oscillator-constituents`

comparison · from the MP.0 part

**Statement.** On S(F), the genuine rank-one oscillator splits into even and odd functions ρψ⁺,ρψ⁻. For the split O₃ pair, the corrected Gan–Savin convention uses the conjugate oscillator: Θ(ρbarψ⁻)=St⁻ and 0→St⁺→Θ(ρbarψ⁺)→1→0. These are big-lift assertions; the even big lift is an extension, while its small lift is1.

**Hypotheses.**

- Characteristic-zero nonarchimedean F and Gan–Savin’s ψ and O₃ extensions of the Steinberg representation.

**Proof outline.**

1. Decompose by x↦−x and compare dual ψ by the operator formulas.
2. Use the rank-one Jacquet calculation and exact sequence of the degenerate principal series.

**Sources.**

- PAPER-GAN-SAVIN-23, §8.4 PDF26–28; corrected §11.4, existing source finding E36: Even/odd oscillator and the corrected additive character.

**Acceptance.**

- The nonsplit even big lift is not1.

**Prerequisites.** [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), [`MP.3/small-theta-module`](#n-mp-3-small-theta-module), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.2/character-and-dual`](#n-mp-2-character-and-dual).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-gl2-gso4-theta"></a>

### GL₂–GSO₄ theta correspondence — `MP.3/gl2-gso4-theta`

theorem · from the MP.0 part

**Statement.** For irreducible generic π of GL₂(F), the similitude theta lift of π∨ to GSO₄≃(GL₂×GL₂)/diagonal center is π⊗π, and theta back from π⊗π is π∨, in Gan–Savin Lemma13.2’s action convention.

**Hypotheses.**

- Characteristic-zero nonarchimedean F, generic irreducible π and compatible similitude oscillator action.

**Proof outline.**

1. Compute the Jacquet module on the open full-rank orbit.
2. Use the regular-representation quotient and Ext¹_SO₄(1,St⊗St)=0 to treat the boundary; apply Howe injectivity.

**Sources.**

- PAPER-GAN-SAVIN-23, Lemma13.2 PDF40–41: Generic GL₂ similitude correspondence and its dual convention.

**Acceptance.**

- For Steinberg, retain the Ext argument rather than discarding the boundary.

**Prerequisites.** [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), `SmoothRepresentationsOfLocalGroups:SR.3`, [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-minimal-orthogonal-theta"></a>

### Minimal orthogonal theta lift — `MP.3/minimal-orthogonal-theta`

theorem · from the MP.0 part

**Statement.** For split SO₂n with n=5 or6, the big theta lift of the trivial SL₂ representation is the minimal representation Π_n (the irreducibility is the cited Yamana input). For tempered π of G₂ its Π_n lift to SO₂n−7 has finite length, as in Proposition14.2. For the tensor restriction Sp(V₂)×Sp(V₆)→SO(V₂⊗V₆), the see-saw identifies the relevant Hom module with Hom_{Sp(V₂′)}(Θ′(σ),1); it has finite length as an Sp(V₂)-module, as in §14.3. This is a finite-length assertion, not finite-dimensionality of the entire Hom space.

**Hypotheses.**

- Characteristic-zero nonarchimedean F, split forms n=5,6 and the exact minimal-representation realization. π is tempered where Proposition14.2 requires it; σ is the stated irreducible Sp(V₆) representation. Exceptional representations are supplied by their owner.

**Proof outline.**

1. Import the minimal representation from its exceptional-representation owner.
2. Apply Yamana’s classical theta identification and the big-theta finite-length/see-saw argument to the restriction.

**Sources.**

- PAPER-GAN-SAVIN-23, §14.2 Proposition14.2 and §14.3, arXiv-v1 PDF50–51: The source explicitly invokes [Y, Prop.8.4]; the original proof remains unread. Classical finite length supplies the §14.3 Hom module, not finite dimension.

**Acceptance.**

- The assertion is scoped to n=5,6 and the specified tensor restriction.

**Prerequisites.** [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), [`MP.3/local-see-saw`](#n-mp-3-local-see-saw), `SmoothRepresentationsOfLocalGroups:SR.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-division-ternary-theta"></a>

### Division ternary theta lift — `MP.3/division-ternary-theta`

theorem · from the MP.0 part

**Statement.** Let ρ be an irreducible supercuspidal representation of PGL₂(F), for characteristic-zero nonarchimedean F. If B is the division quaternion algebra, JL(ρ) is its representation on PB×≃SO(B₀,N). With fixed nontrivial ψ, the rank-one theta lift σ_ρ=θ_ψ(JL(ρ)) to Mp₂ is nonzero irreducible, genuine and supercuspidal. This is the classical input in Gan–Savin §15.1; the exceptional lift to G₂ is separately owned.

**Hypotheses.**

- ρ is supercuspidal on PGL₂, and the exact ψ and splitting normalization in §15.1 is used. No claim is made for all irreducible representations of PB×.

**Proof outline.**

1. Identify the trace-zero norm space and its compact orthogonal group.
2. Use the original Waldspurger rank-one local theorem and Jacquet–Langlands matching.

**Sources.**

- PAPER-GAN-SAVIN-23, §15.1 preceding Lemma15.4, arXiv-v1 PDF54: Precisely the supercuspidal PGL₂ domain stated before Lemma15.4. The original rank-one/Jacquet–Langlands proofs remain explicit gaps.

**Acceptance.**

- The source introduces ρ on PGL₂ and JL(ρ) on PB×; its undeclared JL(τ) is read as JL(ρ). The trivial PB× representation is outside this supercuspidal PGL₂ input.

**Prerequisites.** [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `ModularityAndLanglandsExtensions:ML.4`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R2: replace `ModularityAndLanglandsExtensions:ML.4` by `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`. verified: the only classification input is the local Jacquet–Langlands transfer ρ ↦ JL(ρ) from supercuspidal representations of PGL₂(F) to representations of the division algebra with trivial central character; R17.1 states the correspondence with matching central characters. Its ancestors (R16.3, ET.6, Tau Ceti quaternion algebras) do not involve this roadmap.

<a id="n-mp-3-pgsp6-pgso8-similitude-theta"></a>

### PGSp₆–PGSO₈ similitude theta — `MP.3/pgsp6-pgso8-similitude-theta`

theorem · from the MP.0 part

**Statement.** For generic irreducible σ of PGSp₆(F), its classical similitude theta lift to PGSO₈ is nonzero. If σ_b is a constituent on Sp₆, its SO₈ theta lift occurs in the similitude restriction and has standard parameter φ_b⊕1. At unramified places the Satake embedding is Spin₇→Spin₈ with standard representation 1⊕std₇ and the corresponding spin restrictions.

**Hypotheses.**

- Characteristic-zero nonarchimedean F; generic σ; exact LLC/Satake conventions and multiplier subgroup.

**Proof outline.**

1. Use the generic Whittaker quotient of the oscillator to show nonzero lift.
2. Apply isometry/similitude restriction and the unramified Satake map; import the parameter theory.

**Sources.**

- PAPER-GAN-SAVIN-23-B, §4.2 PDF17–18: Classical similitude lift used by the G₂ parameter construction.

**Acceptance.**

- The exceptional G₂ correspondence remains in its owner; this is the classical theta input.

**Prerequisites.** [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/rallis-unramified-satake`](#n-mp-3-rallis-unramified-satake), [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe), `SmoothRepresentationsOfLocalGroups:SR.3`, `ModularityAndLanglandsExtensions:ML.4`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R2: replace `ModularityAndLanglandsExtensions:ML.4` by `ModularityAndLanglandsExtensions:ML.4/extended-langlands-parameter`. verified with a condition: the target needs the Arthur–Mok local Langlands correspondence for Sp₆ and SO₈ (standard parameters φ_b and φ_b ⊕ 1), which ML.4/extended-langlands-parameter states, with the conditional status recorded in ML.4/symplectic-branch-status carried as a hypothesis. The citation is acyclic at the level of nodes; at the level of stages it is acyclic once ML.4/gan-takeda-llc-gsp4 moves to the sub-layer proposed above.

<a id="n-mp-3-pgsp6-theta-dichotomy"></a>

### PGSp₆ theta dichotomy — `MP.3/pgsp6-theta-dichotomy`

theorem · from the MP.0 part

**Statement.** Every irreducible σ of PGSp₆(F) has nonzero theta lift to exactly one of PGO₈ and PGO_{5,1} in Gan–Savin’s two matched towers. Some representations already occur at PGO₆≃PGL₄⋊{±1}; first occurrence determines this case.

**Hypotheses.**

- Characteristic-zero nonarchimedean F, the source’s two discriminant-compatible orthogonal towers.

**Proof outline.**

1. Use persistence and conservation in the two orthogonal towers.
2. Apply similitude restriction/Clifford theory to identify the allowed components.

**Sources.**

- PAPER-GAN-SAVIN-23-B, §12.2 PDF34–35: The classical similitude dichotomy used by the exceptional programme.

**Acceptance.**

- The smaller PGO₆ occurrence is not excluded by the dichotomy.

**Prerequisites.** [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation), [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-relevant-unitary-dichotomy"></a>

### Relevant unitary local dichotomy — `MP.3/relevant-unitary-dichotomy`

theorem · from the MP.0 part

**Statement.** For a relevant tempered L-representation π_v in Disegni–Liu’s rank n=2r setting, there is a unique rank-n Hermitian space V_πv for which theta is nonzero, for every embedding L→C. Its lift is tempered irreducible admissible and the double-theta Hom recovers π_v. Keep the stated semisimplicity/irreducibility reference gate separate from Howe duality.

**Hypotheses.**

- Nonarchimedean places, exact relevance and coefficient-field hypotheses of §4.1; specified ψ,χ and Hermitian invariant.

**Proof outline.**

1. Use the equal-rank local dichotomy and change-of-character norm orbit.
2. Apply the source-qualified tempered big-lift irreducibility argument and the dual Hom identity.

**Sources.**

- PAPER-DISEGNI-LIU-24, Lemma4.1 arXiv PDF41: Relevant representation dichotomy and the recovery Hom.

**Acceptance.**

- Do not replace “relevant” by every tempered representation.

**Prerequisites.** [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/unitary-equal-almost-equal-rank`](#n-mp-3-unitary-equal-almost-equal-rank), [`MP.3/unitary-doubling-dichotomy`](#n-mp-3-unitary-doubling-dichotomy).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-3-theta-coefficient-rationality"></a>

### Rationality of local theta lifting — `MP.3/theta-coefficient-rationality`

comparison · from the MP.0 part

**Statement.** For the same relevant π, let U_π be the finite-place set where π_v is not invariant under every similitude conjugation †a, a∈F_v×. Define Q_π by the open subgroup {a∈Zhat×:a_v∈N(E_v×) for every v∈U_π}. For σ∈Aut(C/Q_π), θ(σιπ_v)≃σθ(ιπ_v). The comparison changes ψ to ψ_a and π to π^{†a}; the norm/symmetry condition removes that change.

**Hypotheses.**

- Exact coefficient field L and embeddings; finite nonsymmetric set so the subgroup is open; class-field construction is imported.

**Proof outline.**

1. Conjugate the explicit oscillator matrices coefficientwise, producing ψ_a.
2. Transport by the similitude and use the defining norm/symmetry condition for Q_π.

**Sources.**

- PAPER-DISEGNI-LIU-24, Lemma4.5 and (4.2) arXiv PDF42: Coefficient conjugation with its finite abelian field.

**Acceptance.**

- The symmetry definition quantifies over F_v×, not just its units.

**Prerequisites.** [`MP.3/relevant-unitary-dichotomy`](#n-mp-3-relevant-unitary-dichotomy), [`MP.2/character-and-dual`](#n-mp-2-character-and-dual), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage3`, namespace `TauCeti.Metaplectic`.

<a id="layer-mp-4"></a>

## MP.4 — Adelic cover and global Weil representation

**Layer statement.** Construct the restricted product of the local covers, including distinguished splittings over almost all integral maximal compact groups. Prove the product formula for Weil indices and the resulting canonical splitting of the rational symplectic group. Define the adelic Weil representation on the actual restricted tensor product of Schwartz spaces. Show compatibility with the rational splitting, local choices and changes of additive character. Treat the finite central quotient in the restricted product explicitly; an unrestricted product of local double covers is not the adelic metaplectic group.

**Status.** Planned. 8 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 8 accepted targets of MP.4 are those of the part MetaplecticAutomorphicForms--MP.0. R7 proposes that the function-field programme move to the function-field Part II when it is designed; it stays here as routed.
- (accepted part) Exact restricted-product topology, the finite central quotient and the dyadic integral splittings remain as the part records them.

**Planets.** Adelic metaplectic group ([`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover)); Weil product formula ([`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product)); Rational splitting ([`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting)); Adelic Weil representation ([`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation)); Finite Weil representation ([`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation)).

**Dependencies.**

- Inside the roadmap: MP.1 (3 citations), MP.2 (5 citations).
- AdelicAlgebraicGroups:AA.1: `AdelicAlgebraicGroups:AA.1`.
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`.
- GeometricSatakeAndFusion:GS3: `GeometricSatakeAndFusion:GS3`.
- GeometricSatakeAndFusion:GS3:fusion: `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`.
- GlobalShtukasAndFunctionFieldLanglands:GS.5: `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`.
- Tau Ceti Completed/IntegralLattices: `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.
- Tau Ceti TauCetiRoadmap/QuadraticFormInvariants: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.
- Pinned libraries: 1 declarations, listed under each target.

**Consumers outside the roadmap.** `QSeriesPartitionsAndMockModularForms:QM.5/lawrence-zagier-theta-transformation`.

**Acceptance tests of the layer.**

- Adelic metaplectic group: An unrestricted product has an infinite central kernel and is rejected.
- Weil product formula: For q=ax² the product includes the real phase and every finite ramified factor.
- Rational splitting: A collection of arbitrary local sections is not a rational group homomorphism.
- Adelic Weil representation: The global central −1 acts by −1.
- Finite Weil representation: The discriminant quadratic form itself belongs to IntegralLattices.

<a id="n-mp-4-unramified-compact-splittings"></a>

### Unramified compact splittings — `MP.4/unramified-compact-splittings`

theorem · from the MP.0 part

**Statement.** For a nonarchimedean odd-residue local field, conductor-zero ψ and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of Sp(W)(O) into Mp(W), fixing the lattice indicator in its Schrödinger model. For a global datum these conditions hold at all but finitely many places.

**Hypotheses.**

- The lattice is integral self-dual for the specified ψ-pairing; no assertion of this splitting over every dyadic maximal compact.

**Proof outline.**

1. Check the generators on the lattice indicator and its positive Fourier transform.
2. Use the normalized cocycle to show its chosen lifts form a subgroup; isolate finitely many bad places.

**Sources.**

- Weil64, III.§36, printed186–187, PDF44–45: Distinguished almost-everywhere compact lift.

**Acceptance.**

- At a dyadic place the naive half-form lattice character can fail; use an explicitly checked smaller compact instead.

**Prerequisites.** [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), [`MP.2/generator-operators`](#n-mp-2-generator-operators), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-adelic-metaplectic-cover"></a>

### Adelic metaplectic cover — `MP.4/adelic-metaplectic-cover`

construction · from the MP.0 part · planet “Adelic metaplectic group”

**Statement.** Take the restricted product ∏′_v Mp(W_v) relative to the distinguished integral splittings at good finite places. Its central restricted subgroup is the finite-support product ⊕_v μ₂. Quotient by the subgroup {ε:∏_v ε_v=1} to obtain Mp(W)(A), with exact projection to Sp(W)(A) and a single μ₂ kernel. Equip it with the quotient topology and local compactness inherited from the restricted product.

**Hypotheses.**

- Global field char≠2 with the characteristic-zero source used for number-field assertions; finitely many bad places retained; topological restricted-product input from AA.1.

**Proof outline.**

1. Construct the restricted product using the compact subgroups supplied at good places.
2. The finite-support central product map has kernel as stated; quotient it and prove the projection exact/topological.

**Sources.**

- Weil64, III.§§37–38, printed187–189, PDF45–47; IV.§42 for the twofold reduction: Restricted adelic extension and its finite central identification.

**Uses.**

- Weil III.40 and MP.5: Use one global genuine central character and rational splitting.

**API.**

- `TauCeti.Metaplectic.adelicMetaplectic_projection` (structure): A supplied group projection descends through the native quotient when the quotient subgroup lies in its kernel. The restricted-product topology and μ₂ kernel require source data.
- `TauCeti.Metaplectic.adelicMetaplectic_local` (functoriality): A specified homomorphism into the group followed by the native quotient map gives the local-to-global adapter.
- `TauCeti.Metaplectic.adelicMetaplectic_center_product` (characterisation): A finite collection of local central signs has global value their product.

**Checks.**

- `TauCeti.Metaplectic.adelicCover_twoSigns` (computation): Central −1 at two distinct places becomes the identity in the global quotient.
- `TauCeti.Metaplectic.adelicCover_oneSign` (non-example): Central −1 at one place remains nontrivial.
- `TauCeti.Metaplectic.adelicCover_finiteSupport` (characterisation): Every central representative differs from a single-place sign by the product-one subgroup.

**Acceptance.**

- An unrestricted product has an infinite central kernel and is rejected.

**Prerequisites.** [`MP.4/unramified-compact-splittings`](#n-mp-4-unramified-compact-splittings), [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), `AdelicAlgebraicGroups:AA.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-global-weil-index-product"></a>

### Weil product formula — `MP.4/global-weil-index-product`

theorem · from the MP.0 part · planet “Weil product formula”

**Statement.** For a nondegenerate quadratic form q over a global field F and the factorizable additive character ψ of A/F with compatible self-dual measures, γψ_v(q_v)=1 almost everywhere and ∏_vγψ_v(q_v)=1. This is the analytic Weil-index product formula; local Hilbert/Hasse formulas are its local adapters.

**Hypotheses.**

- F has char≠2; every dyadic and archimedean factor included. Character is trivial on F and Haar measures are globally compatible.

**Proof outline.**

1. Apply adelic Poisson summation to the quadratic Gaussian distributions after the source’s regularization.
2. Compare both sides using local Fourier index factors and cancel the global self-dual covolume.

**Sources.**

- Weil64, II.§30 Proposition5, printed179–180: Analytic product formula, including all local places.

**Acceptance.**

- For q=ax² the product includes the real phase and every finite ramified factor.

**Prerequisites.** [`MP.2/weil-index`](#n-mp-2-weil-index), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-rational-symplectic-splitting"></a>

### Rational symplectic splitting — `MP.4/rational-symplectic-splitting`

construction · from the MP.0 part · planet “Rational splitting”

**Statement.** The product formula gives a canonical homomorphism Sp(W)(F)→Mp(W)(A) splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization.

**Hypotheses.**

- Global ψ trivial on F; rational symplectic space and a compatible adelic Schrödinger realization.

**Proof outline.**

1. Evaluate the rational Leray cocycle and apply the global index product.
2. Normalize the scalar lift using Poisson/theta invariance and check the generating rational matrices.

**Sources.**

- Weil64, III.§40, printed190–193, PDF48–51; §41 rational invariance: Rational splitting and the theta summation functional.

**Uses.**

- Weil Theorem6; MP.5 rational invariance: Form the genuine automorphic quotient.

**API.**

- `TauCeti.Metaplectic.rationalSplitting_projection` (compatibility): Projection of the rational lift is the diagonal adelic symplectic element.
- `TauCeti.Metaplectic.rationalSplitting_mul` (structure): The rational lift is a group homomorphism.
- `TauCeti.Metaplectic.rationalSplitting_polarization` (compatibility): Changing rational polarization conjugates the model and preserves the lift.

**Checks.**

- `TauCeti.Metaplectic.rationalSplitting_identity` (degenerate): The rational identity maps to the adelic identity.
- `TauCeti.Metaplectic.rationalSplitting_fourier` (compatibility): The rational Fourier generator preserves theta summation by global Poisson.
- `TauCeti.Metaplectic.rationalSplitting_section` (non-example): An arbitrary single-place sign change of a rational lift generally destroys theta preservation.

**Acceptance.**

- A collection of arbitrary local sections is not a rational group homomorphism.

**Prerequisites.** [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), [`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product), [`MP.2/leray-cocycle`](#n-mp-2-leray-cocycle), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-adelic-weil-representation"></a>

### Adelic Weil representation — `MP.4/adelic-weil-representation`

construction · from the MP.0 part · planet “Adelic Weil representation”

**Statement.** Construct the global oscillator action on S(X(A))=S(X_∞)⊗(∏′_{v finite}S(X_v)), the algebraic finite-place restricted tensor product with standard lattice indicators and the full joint archimedean Schwartz space. Pure tensor operators use the product of local Weil actions; the product-one central subgroup acts trivially, so the action descends to Mp(W)(A).

**Hypotheses.**

- Number field, global ψ, finite-dimensional rational X and compatible polarizations/measures. The archimedean space is the joint Schwartz space, not merely the span of products over individual real/complex places.

**Proof outline.**

1. Construct the finite restricted tensor action because all but finitely many factors fix the standard vector.
2. Use the common central sign and the central quotient; prove continuity and rational-splitting compatibility on the joint archimedean space.

**Sources.**

- Weil64, III.§§38–39, printed188–190, PDF46–48: Actual adelic model with joint archimedean Schwartz space.

**Uses.**

- Weil III.40; theta kernels and finite Weil modules: Supply actual transformed functions for the rational sum.

**API.**

- `TauCeti.Metaplectic.adelicWeil_pureTensor` (simp): On a factorizable vector, each local operator acts on its own factor.
- `TauCeti.Metaplectic.adelicWeil_central` (characterisation): The single adelic central −1 acts as scalar −1.
- `TauCeti.Metaplectic.adelicWeil_characterChange` (compatibility): Changing the global additive character gives the scaled quadratic/symplectic datum with compatible local operators.

**Checks.**

- `TauCeti.Metaplectic.adelicWeil_goodVector` (compatibility): At a good place the integral compact splitting fixes the standard indicator.
- `TauCeti.Metaplectic.adelicWeil_twoCenters` (characterisation): Two local central −1 operators cancel on a pure tensor and descend to the quotient identity.
- `TauCeti.Metaplectic.adelicWeil_jointSchwartz` (non-example): In two archimedean coordinates there exists a joint Schwartz function outside every finite sum of products of one-coordinate Schwartz functions. The adelic model must accept it.

**Acceptance.**

- The global central −1 acts by −1.

**Prerequisites.** [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-adelic-choice-compatibility"></a>

### Adelic choice compatibility — `MP.4/adelic-choice-compatibility`

comparison · from the MP.0 part

**Statement.** Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing ψ to ψ_a, a∈F×, is the scaled rational datum and respects the product formula.

**Hypotheses.**

- The changed local choices agree at almost all places or have explicitly transported reference compacts; no unrestricted infinite rescaling.

**Proof outline.**

1. Use native FactorSet.rescaleEquiv locally.
2. Take the restricted product of the local comparisons, descend its central quotient and compare rational theta functionals.

**Sources.**

- Weil64, III.§§38–40, printed188–193, PDF46–51: Local-to-global transport of the chosen models.

**Acceptance.**

- An infinite rescaling that does not preserve the reference subgroups need not define a restricted-product map.

**Prerequisites.** [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), [`MP.2/character-and-dual`](#n-mp-2-character-and-dual), `tauceti:TauCeti.FactorSet.rescaleEquiv`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-finite-weil-representation"></a>

### Finite Weil representation — `MP.4/finite-weil-representation`

construction · from the MP.0 part · planet “Finite Weil representation”

**Statement.** For an even integral lattice L with discriminant module D=L∨/L, realize C[D] as the finite adelic Schwartz subspace S_L supported on Lhat∨ and periodic under Lhat. Restrict the adelic Weil action along the rational lift whose real component is γ̃∈Mp₂(Z). In the AGHMP convention this is ω_L, while the frequently cited ρ_L is its complex conjugate. Since ψ_Q is trivial on Q and ψ_Q,∞(q)=exp(2πiq), ψ_Q,f(q)=exp(−2πiq). Thus T in ω_L multiplies e_μ by exp(−2πiq(μ)); in ρ_L it multiplies by exp(2πiq(μ)). S in ω_L has the positive discriminant-pairing exponential and the conjugate of the usual ρ_L Weil phase, namely it is the discriminant-pairing finite Fourier transform with the signature/Weil phase dictated by ψ.

**Hypotheses.**

- Nondegenerate even lattice, ψ_Q with positive real exponential and globally compatible finite character; discriminant form and signature imported from IntegralLattices.

**Proof outline.**

1. Identify each coset basis vector with its lattice-coset indicator.
2. Apply the local unipotent and Fourier formulas with the finite global character ψ_Q,f(q)=exp(−2πiq), then use the rational splitting and conjugate to compare ω_L with ρ_L.

**Sources.**

- PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18, §4.7 published452–453, PDF62–63: Finite adelic subspace and conjugate-representation convention.

**Uses.**

- AGHMP §4.7 and vector-valued half-weight forms: Supply the finite oscillator representation; harmonic Maass spaces remain with their owner.

**API.**

- `TauCeti.Metaplectic.finiteWeil_T` (simp): T e_μ=exp(−2πiq(μ))e_μ in ω_L; ρ_L has the positive exponent.
- `TauCeti.Metaplectic.finiteWeil_S` (simp): In ω_L, S uses exp(2πi(μ,ν))/sqrt(|D|), multiplied by its specified Weil phase. Conjugation gives the negative pairing exponential and conjugate phase in ρ_L.
- `TauCeti.Metaplectic.finiteWeil_conjugate` (compatibility): ρ_L is the complex conjugate of ω_L; T exponents change sign.
- `TauCeti.Metaplectic.finiteWeil_TOperator` (constructor): Construct the diagonal native linear operator with negative quadratic exponential on D→ℂ.
- `TauCeti.Metaplectic.finiteWeil_SOperator` (constructor): Construct the native finite Fourier linear operator with positive pairing exponential and specified Weil phase.

**Checks.**

- `TauCeti.Metaplectic.finiteWeil_unimodular` (degenerate): On a singleton index set, the T operator with zero quadratic value is the identity; the source S signature phase is not suppressed.
- `TauCeti.Metaplectic.finiteWeil_Tbasis` (computation): For q(μ)=1/4, T e_μ=−i e_μ in ω_L and +i e_μ in ρ_L. This distinguishes the two conventions.
- `TauCeti.Metaplectic.finiteWeil_conjugation` (non-example): On Unit with zero pairing and phase1, the S operator is the identity. T-conjugation is tested separately by the quarter-value basis test.

**Acceptance.**

- The discriminant quadratic form itself belongs to IntegralLattices.

**Prerequisites.** [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), [`MP.2/generator-operators`](#n-mp-2-generator-operators), `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-4-function-field-metaplectic-programme"></a>

### Function-field metaplectic programme — `MP.4/function-field-metaplectic-programme`

comparison · from the MP.0 part

**Statement.** Lafforgue §14 sketches a conditional extension of shtuka excursion constructions to metaplectic groups: replace ordinary geometric Satake by its metaplectic version and use the modified dual group and gerbe/twisting data of (14.1)–(14.5). Record this as a programme with explicit missing hypotheses and constructions, not as a proved metaplectic global Langlands theorem.

**Hypotheses.**

- Function field, a covering/gerbe datum and the required metaplectic Satake equivalences, fusion and shtuka sheaves supplied. The section’s indications and remarks are not a full proof.

**Proof outline.**

1. Import the ordinary excursion/shtuka construction from its existing owner.
2. Identify the points where the twisting datum changes Satake and the dual group; request the metaplectic Part-II extension there.

**Sources.**

- PAPER-LAFFORGUE-18, §14, Remarks14.1–14.2, (14.1)–(14.5), arXiv-v10 PDF169–173: Conditional indications, with no theorem promoted beyond the source.

**Acceptance.**

- No number-field adelic proof is used to claim the function-field shtuka programme is established.

**Prerequisites.** `GeometricSatakeAndFusion:GS3`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage4`, namespace `TauCeti.Metaplectic`.

<a id="layer-mp-5"></a>

## MP.5 — Theta kernels, convergence and automorphic spaces

**Layer statement.** For a rational quadratic/symplectic datum define the theta series by summing the transformed Schwartz function over rational vectors. Prove local uniform/absolute convergence in the permitted range, smoothness, transformation under rational points, moderate growth and the specified central character using Poisson summation. Construct genuine cusp and Eisenstein spaces on the cover, constant terms and Fourier–Whittaker expansions with the required splitting over unipotents. Prove convergence of the theta lift where used and give a named truncation/regularization construction when convergence fails. No unrestricted interchange of divergent theta integrals is permitted.

**Status.** Planned. 16 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 16 accepted targets of MP.5 are those of the part MetaplecticAutomorphicForms--MP.0. R1 moves MP.6/ideal-lattice-poisson here, which its consumer MP.5/ideal-class-theta-general-transform needs. R8 records that the binary ideal-class instance is a special case of the Hecke–Schoeneberg theorem of the upstream Theta Series roadmap (pull request #286), to be cited once the atlas tracks it.
- (accepted part) Uniform differentiated lattice estimates and the regularization of divergent theta integrals remain as the part records them.

**Planets.** Theta kernel ([`MP.5/theta-kernel`](#n-mp-5-theta-kernel)); Genuine automorphic forms ([`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces)); Global theta lift ([`MP.5/global-theta-lift`](#n-mp-5-global-theta-lift)); Weil convergence criterion ([`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence)); Regularized theta integral ([`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral)); Ideal class theta series ([`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta)).

**Dependencies.**

- Inside the roadmap: MP.1 (1 citations), MP.2 (4 citations), MP.3 (2 citations), MP.4 (8 citations), MP.6 (1 citations).
- AdelicAlgebraicGroups:AA.1: `AdelicAlgebraicGroups:AA.1`.
- AdelicAlgebraicGroups:AA.3: `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.3/adelic-siegel-set`, `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`.
- AutomorphicFormsOnReductiveGroups:AF.1: `AutomorphicFormsOnReductiveGroups:AF.1`.
- AutomorphicFormsOnReductiveGroups:AF.2: `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-forms-uniform-growth`.
- AutomorphicFormsOnReductiveGroups:AF.3: `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay`.
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`.
- AutomorphicSpectralTheory:AS.1: `AutomorphicSpectralTheory:AS.1`.
- AutomorphicSpectralTheory:AS.2: `AutomorphicSpectralTheory:AS.2`.
- Tau Ceti Completed/IntegralLattices: `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.
- Tau Ceti TauCetiRoadmap/ModularForms: `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.
- Tau Ceti TauCetiRoadmap/QuadraticFormInvariants: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Consumers outside the roadmap.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta`, `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes`.

**Acceptance tests of the layer.**

- Theta kernel: The zero-dimensional configuration has θφ(g)=ω(g)φ(0).
- Genuine automorphic forms: The genuine condition is a linear equation, not a claim of linear reductive algebraic-group structure.
- Global theta lift: A source central character that mismatches the kernel cannot produce the advertised output representation.
- Weil convergence criterion: For rank-one target n=1, split binary m=2,r=1 fails 1>2; anisotropic binary r=0 converges.
- Regularized theta integral: An unregularized divergent integral cannot be used in place of B_{n,r}.
- Ideal class theta series: The constant coefficient is1/w, not the number of ideals of norm0.

<a id="n-mp-5-theta-kernel"></a>

### Theta kernel — `MP.5/theta-kernel`

construction · from the MP.0 part · planet “Theta kernel”

**Statement.** For a rational polarized symplectic space W with configuration space X, define θφ(g)=Σx∈X(F)(ωψ(g)φ)(x), φ∈S(X(A)). For a split dual-pair realization write θ(g,h;φ) for its pullback. This is a genuine function on Sp(W)(F)\Mp(W)(A), with the rational subgroup embedded by the canonical splitting; the nontrivial global central sign acts by −1. On an even orthogonal dual pair the pulled-back kernel is linear in the symplectic factor.

**Hypotheses.**

- Number field, characteristic-zero source, compatible ψ and self-dual measures; actual joint archimedean Schwartz functions. For a dual pair its splitting characters are fixed.

**Proof outline.**

1. Establish absolute and locally uniform summability of every transformed Schwartz function on the rational lattice.
2. Apply rational Poisson summation to the rational Fourier generator, and the direct translation/Levi identities to the other generators.
3. Use the genuine central action before restricting to a split dual pair.

**Sources.**

- Weil64, III.§41 Théorème6, printed193–194, PDF51–52: Rational sum, continuity and rational invariance.

**Uses.**

- Weil Theorem6; Zhang21 §8; GQT §2: Integrate against automorphic forms or extract unipotent Fourier coefficients.

**API.**

- `TauCeti.Metaplectic.thetaKernel_apply` (simp): The kernel is the rational sum of the transformed Schwartz function.
- `TauCeti.Metaplectic.thetaKernel_rational` (compatibility): The sum is invariant under an element whose action on the same function representation reindexes by an explicit bijection; the canonical rational lift must be identified with this action.
- `TauCeti.Metaplectic.thetaKernel_central` (characterisation): θφ(zg)=−θφ(g) for the global central z=−1.

**Checks.**

- `TauCeti.Metaplectic.thetaKernel_zero` (degenerate): For X=0 the rational sum has one term.
- `TauCeti.Metaplectic.thetaKernel_fourier` (compatibility): The rational Fourier generator preserves the sum by Poisson with covolume1.
- `TauCeti.Metaplectic.thetaKernel_sign` (non-example): A nonzero genuine θφ cannot descend to a function on Sp(W)(A).

**Acceptance.**

- The zero-dimensional configuration has θφ(g)=ω(g)φ(0).

**Prerequisites.** [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-theta-growth-transfer"></a>

### Theta smoothness and growth transfer — `MP.5/theta-growth-transfer`

theorem · from the MP.0 part

**Statement.** The theta kernel is smooth at infinity, locally constant at finite places, and every archimedean differential operator can be applied termwise on compact subsets. On the specified adelic Siegel sets its derivatives satisfy a common polynomial height bound for each finite Schwartz seminorm family. With fixed finite level and finite K-type this gives uniform moderate growth in the AF.2 sense, after comparison of the cover height with the base-group height.

**Hypotheses.**

- Number field; finite-dimensional quadratic/symplectic datum; fixed finite-level vector and K-type where an automorphic-form space requires them. The height, central-character restriction and Schwartz seminorms must be matched to the supplier.

**Proof outline.**

1. Use a compact-uniform summable Schwartz majorant for each differentiated operator.
2. Apply AA.3’s rational lattice counting/reduction bounds on a Siegel set.
3. Transport those estimates through the finite cover and compare the single-exponent all-derivatives definition in AF.2; establish the needed seminorm estimate before using it.

**Sources.**

- Weil64, III.§41 Lemmas4–5 and compact normal convergence, printed193–194, PDF51–52: Compact-family Schwartz majorants underlying continuity; stronger growth requires the stated supplier comparison.

**Acceptance.**

- A bound for each derivative with unrelated exponents does not establish the requested uniform-growth condition.

**Prerequisites.** [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), `AdelicAlgebraicGroups:AA.3/adelic-siegel-set`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-forms-uniform-growth`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-genuine-automorphic-spaces"></a>

### Genuine automorphic spaces — `MP.5/genuine-automorphic-spaces`

definition · from the MP.0 part · planet “Genuine automorphic forms”

**Statement.** Inside smooth finite-level functions on Sp(W)(F)\Mp(W)(A), take the subspace of infinitesimal-character-finite, uniformly moderate-growth functions f with f(zg)=−f(g), using AF.2’s fixed central-character convention. Its cuspidal subspace has vanishing constant term along every proper rational parabolic, computed through the canonical unipotent splitting. Following GQT §2.10, this smooth space imposes no K-finiteness and carries the full right G(A)-action. Its K-finite part is instead a (g,K)-module with the finite-adelic action; full real-group translation is not claimed to preserve K-finiteness.

**Hypotheses.**

- Use the actual adelic cover, rational splitting and AF.1–3 analytic conventions; require the same split-center/central-character normalization as the base automorphic space.

**Proof outline.**

1. Intersect explicit invariant function subspaces, importing the linear-group smoothness/growth notions.
2. Prove right-translation invariance of the smooth space by transporting growth and infinitesimal-character operators through the finite cover. Then take the K-finite (g,K)-module and distinguish its available actions.
3. Use the unipotent splitting and AA quotient probability measure to define the cusp equations.

**Sources.**

- Weil64, III.§41 Théorème6, printed193, PDF51; AF.2/3 supplies finiteness and growth conditions: The actual cover carries genuine theta functions; analytic automorphic-space conditions are imported and compared.
- GQT, §2.10, arXiv-v3 PDF13: Separates full smooth group action from the K-finite Harish–Chandra core; the cover transfer remains MP-specific.

**Uses.**

- MP.5 theta lift; MP.7 classical comparison; MP.8 genuine Eisenstein: State the actual output space and its cusp/central conditions.

**API.**

- `TauCeti.Metaplectic.genuineAutomorphic_eval` (data): Elements evaluate as functions on the actual cover quotient.
- `TauCeti.Metaplectic.genuineAutomorphic_right` (structure): Right translation preserves the smooth genuine automorphic and cusp subspaces. The K-finite part is stable under its (g,K) and finite-adelic actions.
- `TauCeti.Metaplectic.genuineCusp_iff` (characterisation): Membership in the cusp subspace is the vanishing of all proper parabolic constant terms.

**Checks.**

- `TauCeti.Metaplectic.genuineAutomorphic_zero` (degenerate): The zero function belongs to both automorphic and cusp subspaces.
- `TauCeti.Metaplectic.genuineAutomorphic_descend` (non-example): A function that is both genuine and descends to the base group is zero over C.
- `TauCeti.Metaplectic.genuineAutomorphic_translation` (compatibility): Translating a genuine function preserves its central sign equation.

**Acceptance.**

- The genuine condition is a linear equation, not a claim of linear reductive algebraic-group structure.

**Prerequisites.** [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), [`MP.5/theta-growth-transfer`](#n-mp-5-theta-growth-transfer), `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicFormsOnReductiveGroups:AF.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-unipotent-splitting"></a>

### Unipotent splittings — `MP.5/unipotent-splitting`

theorem · from the MP.0 part

**Statement.** Each rational unipotent subgroup U of Sp(W) has the canonical continuous splitting in the local and adelic metaplectic double cover, compatible with conjugation and the rational splitting. On the Siegel unipotent this is the phase-multiplication operator. Uniqueness is in the characteristic-zero unipotent setting and follows from absence of nontrivial continuous μ₂-valued characters.

**Hypotheses.**

- Characteristic zero; the unipotent subgroup and cover topology are fixed.

**Proof outline.**

1. On root subgroups use the normalized operator and its additive group law.
2. Compare root relations and conjugation; use connected real groups and uniquely two-divisible nonarchimedean unipotents for uniqueness.
3. Take restricted products and compare rational elements.

**Sources.**

- Kudla96, I.6 Lemma6.3, PDF25–26 (unique unipotent lift); compare I.6 formulas PDF26–27: Generator splitting and its extension to unipotent radicals.

**Acceptance.**

- For n(b₁)n(b₂), the canonical lifts multiply to the lift of n(b₁+b₂).

**Prerequisites.** [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-metaplectic-constant-and-whittaker"></a>

### Metaplectic constant terms and Whittaker coefficients — `MP.5/metaplectic-constant-and-whittaker`

construction · from the MP.0 part

**Statement.** For a continuous genuine automorphic f, a rational unipotent U, and a unitary character η on U(F)\U(A), define W_U,η(f)(g)=∫U(F)\U(A) f(ũg)η(u)⁻¹du using the canonical splitting and probability quotient Haar. The trivial η gives the constant term. Right translation and differentiation commute with the integral under the AF.3 regularity hypotheses; central genuineness is retained.

**Hypotheses.**

- U(F)\U(A) compact; η trivial on rational points; f smooth for derivative assertions. Fourier expansion requires the appropriate abelian U and the supplier’s convergence topology.

**Proof outline.**

1. Pull f back along the actual splitting and integrate on the compact quotient.
2. Use AA quotient Haar and AF.3 differentiation under the integral.
3. For abelian U apply Fourier completeness with its normalization; no L¹-equivalence-class point evaluation is used.

**Sources.**

- Weil64, III.§41 Théorème6, printed193, PDF51 (theta realization); AA.1 and AF.3 supply the quotient-integral API: Theta continuity permits compact unipotent integration; spectral expansion inputs are separate.

**Uses.**

- MP.7 Fourier expansion; MP.8 genuine constant terms: Supply a normalized compact-quotient extraction, retaining cover splittings.

**API.**

- `TauCeti.Metaplectic.metaplecticWhittaker_trivial` (compatibility): The trivial-character coefficient equals the constant term.
- `TauCeti.Metaplectic.metaplecticWhittaker_right` (functoriality): Coefficient extraction commutes with right translation.
- `TauCeti.Metaplectic.metaplecticWhittaker_central` (compatibility): The coefficient is genuine in its remaining cover variable.

**Checks.**

- `TauCeti.Metaplectic.metaplecticWhittaker_zeroU` (degenerate): For the trivial U the integral is f(g).
- `TauCeti.Metaplectic.metaplecticWhittaker_character` (computation): For f on a compact abelian U equal to η, its η coefficient is1.
- `TauCeti.Metaplectic.metaplecticWhittaker_orthogonal` (non-example): A distinct unitary character has zero η coefficient.

**Acceptance.**

- A nontrivial unipotent character coefficient of a constant function is zero.

**Prerequisites.** [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.5/unipotent-splitting`](#n-mp-5-unipotent-splitting), `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, `AdelicAlgebraicGroups:AA.1`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-global-theta-lift"></a>

### Global theta lift — `MP.5/global-theta-lift`

construction · from the MP.0 part · planet “Global theta lift”

**Statement.** For a dual pair G,H, define θφ(f)(g)=∫[H] θ(g,h;φ) conjugate(f(h))dh whenever the displayed product is absolutely integrable. Its span is the global theta-lift module; the oscillator splitting fixes its central character and equivariance. If f is cuspidal with the required unitary central character, AF.3 rapid decay combined with the theta-growth estimate supplies convergence in the source’s permitted range.

**Hypotheses.**

- Quotient and measure normalized as in GQT; use either anisotropic H, the convergent range, or a cusp/decay bound proved sufficient. No arbitrary regularized value is substituted for a divergent integral.

**Proof outline.**

1. Prove an integrable majorant on AA.3’s covering Siegel sets using AF.3’s rapid decay in G(A)^1.
2. Apply Fubini/dominated convergence only after that bound; unfold rational invariance to obtain equivariance.
3. Take the invariant span in the appropriate genuine/linear automorphic output space.

**Sources.**

- GQT, §11.1, PDF52, cuspidal theta lift; §2.11 PDF13 gives the kernel: The actual theta integral and its convergence/automorphic output.

**Uses.**

- GQT §11 Rallis; GZ.5 toric pairing; IP §§7–9: Supply the actual global module and theta pairing.

**API.**

- `TauCeti.Metaplectic.globalThetaLift_apply` (simp): The lift evaluates by the integrable theta pairing.
- `TauCeti.Metaplectic.globalThetaLift_equivariant` (functoriality): Right translation acts through the kernel’s two commuting actions.
- `TauCeti.Metaplectic.globalThetaLift_central` (characterisation): The output central character is determined by the chosen oscillator splitting and input character.

**Checks.**

- `TauCeti.Metaplectic.globalThetaLift_zero` (degenerate): Zero input or zero Schwartz vector gives zero output.
- `TauCeti.Metaplectic.globalThetaLift_compact` (compatibility): On the Unit group with Dirac measure, the integral is exactly θ(g,()) times conjugate f(()).
- `TauCeti.Metaplectic.globalThetaLift_divergent` (non-example): For nonintegrable kernel/input data the raw native Bochner integral returns zero. This default value does not satisfy the integrability contract for a mathematical theta lift.

**Acceptance.**

- A source central character that mismatches the kernel cannot produce the advertised output representation.

**Prerequisites.** [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), [`MP.5/theta-growth-transfer`](#n-mp-5-theta-growth-transfer), [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay`, `AdelicAlgebraicGroups:AA.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-theta-integral-convergence"></a>

### Weil convergence criterion — `MP.5/theta-integral-convergence`

theorem · from the MP.0 part · planet “Weil convergence criterion”

**Statement.** For the GQT type-I datum with dim_E V=m=m₀+2r, dim_E W=n, ε₀∈{−1,0,1}, d(n)=n+ε₀, the theta integral of every Schwartz vector over H(V)(F)\H(V)(A) converges absolutely if r=0 or m−r>d(n). The borderline and second-term cases require the regularized construction. This is a criterion for the theta integral, not for the pointwise rational theta sum.

**Hypotheses.**

- Number field; GQT §2 groups, splitting characters and Tamagawa measure; the exceptional split O(1,1) normalization is retained.

**Proof outline.**

1. Use the rational theta estimate and reduction of H(V) to a Siegel set.
2. Compare the boundary exponents against the cusp volume exponent; the anisotropic quotient is compact.
3. Invoke Weil’s precise convergence theorem after matching m,r,n,ε₀.

**Sources.**

- GQT, §3.1, PDF14, Weil convergent range: Convergence inequality with anisotropic exception.

**Acceptance.**

- For rank-one target n=1, split binary m=2,r=1 fails 1>2; anisotropic binary r=0 converges.

**Prerequisites.** [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), [`MP.5/theta-growth-transfer`](#n-mp-5-theta-growth-transfer), `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-regularized-theta-integral"></a>

### Regularized theta integral — `MP.5/regularized-theta-integral`

construction · from the MP.0 part · planet “Regularized theta integral”

**Statement.** In the GQT nonconvergent range r>0, m−r≤d(n), r≤n, choose a compatible regularizing Hecke/central operator z making ω(z)φ rapidly decreasing and acting on the normalized auxiliary H-Eisenstein series E_H(s,h) by P_z(s). Define B_{n,r}(s,φ)=1/(τ(H)κ_r P_z(s)) ∫[H] θ(g,h;ω(z)φ)E_H(s,h)dh. It is independent of the admissible regularizer, meromorphic, and satisfies the source functional equation. Laurent coefficients B_k at ρ_H=(m−r−ε₀)/2 retain the source’s indexing.

**Hypotheses.**

- GQT datum; E_H normalized from the parabolic |det|^s; κ_r its residue/constant normalization. For split O(1,1), κ_r=2 and ρ_H=0.

**Proof outline.**

1. Construct z and an integrable differentiated majorant; prove its eigenvalue P_z on E_H.
2. Compare two admissible z by their commuting product, then use the spectral continuation of E_H.
3. Extract Laurent coefficients in the correct local coordinate s−ρ_H.

**Sources.**

- GQT, §§3.2–3.7, PDF14–18; definition §3.5 and functional equation(3.7): Named regularizer, eigenvalue denominator and Laurent convention.

**Uses.**

- GQT §§7–10; MP.6 second-term identity and GZ.5 split norm examples: Supply genuine Laurent coefficients for a divergent theta integral.

**API.**

- `TauCeti.Metaplectic.regularizedTheta_regularizer` (compatibility): The meromorphic family is independent of the admissible z.
- `TauCeti.Metaplectic.regularizedTheta_convergent` (compatibility): In a matched convergent case its specified coefficient equals the ordinary theta integral.
- `TauCeti.Metaplectic.regularizedTheta_laurent` (data): B_k is the coefficient of (s−ρ_H)^k with no reindexing.

**Checks.**

- `TauCeti.Metaplectic.regularizedTheta_zero` (degenerate): Zero Schwartz vector gives the zero meromorphic family.
- `TauCeti.Metaplectic.regularizedTheta_scale` (computation): Multiplying z by a nonzero scalar multiplies numerator and P_z equally.
- `TauCeti.Metaplectic.regularizedTheta_splitBinary` (non-example): The split O(1,1) case uses κ_r=2 at ρ_H=0, rather than a generic simple-pole normalization.

**Acceptance.**

- An unregularized divergent integral cannot be used in place of B_{n,r}.

**Prerequisites.** [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence), [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `AdelicAlgebraicGroups:AA.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-extended-schwartz-weil"></a>

### Extended Schwartz Weil action — `MP.5/extended-schwartz-weil`

construction · from the MP.0 part

**Statement.** For a totally real F and even-dimensional positive-definite (V,q), form the YZ extended adelic space in (x,u)∈V(A)×A×. At finite places use locally constant compactly supported functions; at real places use (P₁(uq(x))+sgn(u)P₂(uq(x)))exp(−2π|u|q(x)), where P₁,P₂ are complex polynomials in the one real argument uq(x). The action of GL₂(A)×GO(V)(A) extends the usual even oscillator action and rescales the u variable by the similitude multiplier.

**Hypotheses.**

- YZ published §6.1 exact extended real test class P₁,P₂∈C[t], evaluated at uq(x); u≠0; GL₂/GO matched action and quadratic character conventions.

**Proof outline.**

1. Import the usual even oscillator action and compute the extra diagonal/similitude generators.
2. Verify the real test class is preserved by the prescribed extended operators.
3. Use the finite restricted tensor product and the joint archimedean realization; the full extended space is not an arbitrary Schwartz space on V×A×.

**Sources.**

- PAPER-YUAN-ZHANG-18, Published §6.1, printed578–579, PDF46–47; recalled definitions originate in YZZ13 §§2.1.3,4.1: Extended real test functions and similitude action.

**Uses.**

- YZ published §6.1 and GZ.6–7: Form unit-quotiented theta functions with an auxiliary similitude variable.

**API.**

- `TauCeti.Metaplectic.extendedSchwartzWeil_similitude` (simp): A similitude transports the u parameter with the source’s multiplier convention.
- `TauCeti.Metaplectic.extendedSchwartzWeil_restrict` (compatibility): At u=1 and in the isometry subgroup the usual even oscillator action is recovered.
- `TauCeti.Metaplectic.extendedSchwartzWeil_real` (data): The real factors have the displayed polynomial-times-Gaussian form.

**Checks.**

- `TauCeti.Metaplectic.extendedSchwartzWeil_zero` (degenerate): Zero polynomial data give the zero vector.
- `TauCeti.Metaplectic.extendedSchwartzWeil_sign` (computation): At u<0 the P₂ contribution changes sign.
- `TauCeti.Metaplectic.extendedSchwartzWeil_gaussian` (compatibility): For P₁=1,P₂=0,u=1 the real vector is exp(−2πq(x)).

**Acceptance.**

- u↦−u changes the P₂ sign and the character convention.

**Prerequisites.** [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-unit-quotiented-theta"></a>

### Unit-quotiented theta series — `MP.5/unit-quotiented-theta`

construction · from the MP.0 part

**Statement.** For extended φ invariant under a finite-index unit subgroup μ via (x,u)↦(αx,α⁻²u), define θ_μ(g,φ)=Σu∈μ²\F× Σx∈V(F) r(g)φ(x,u). The ±1 stabilizer normalization is w_K=|{±1}∩K|. With the exact real test class, the series is normally convergent and transforms under GL₂(F) and the prescribed finite-level GO action as in YZ published §6.1.

**Hypotheses.**

- YZ totally real positive-definite even V; finite-index unit subgroup preserving φ; compact level K; retain u-orbits and w_K.

**Proof outline.**

1. Use Dirichlet-unit reduction of u with finite adelic support and Gaussian decay in x.
2. Prove independence of orbit representatives from the assumed unit action.
3. Apply the extended rational generator identities and Poisson summation.

**Sources.**

- PAPER-YUAN-ZHANG-18, Published §6.1, printed578–579, PDF46–47: The unit quotient and multiplicity normalization.

**Uses.**

- YZ published §6.2 and averaged Colmez theta integral: Integrate the convergent extended theta kernel.

**API.**

- `TauCeti.Metaplectic.unitTheta_representative` (compatibility): The term is independent of the μ²-orbit representative after the simultaneous x substitution.
- `TauCeti.Metaplectic.unitTheta_rational` (compatibility): The series satisfies the stated GL₂(F) transformation.
- `TauCeti.Metaplectic.unitTheta_multiplicity` (simp): w_K is1 or2 according to −1∈K.

**Checks.**

- `TauCeti.Metaplectic.unitTheta_zero` (degenerate): Zero test function gives zero.
- `TauCeti.Metaplectic.unitTheta_minusOne` (computation): A level containing −1 has w_K=2.
- `TauCeti.Metaplectic.unitTheta_orbit` (non-example): Repeating a nonzero unit-orbit term infinitely often is not summable: the constant sequence 1 indexed by Z is a native non-example.

**Acceptance.**

- Summing over every u∈F× instead of μ²-orbits repeats an infinite unit orbit.

**Prerequisites.** [`MP.5/extended-schwartz-weil`](#n-mp-5-extended-schwartz-weil), [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), `AdelicAlgebraicGroups:AA.3`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-extended-restriction-comparison"></a>

### Extended restriction comparison — `MP.5/extended-restriction-comparison`

comparison · from the MP.0 part

**Statement.** For V₁⊂V nondegenerate even-dimensional spaces of dimensions d₁,d, restrict a standard tensor test vector along V₁ and compare its transformed restrictions. In the finite-place normalized model the modulus ratio is δ(g)^((d−d₁)/2), where δ(diag(a,d))=|a/d|^{1/2}; at infinity include the prescribed ρ(g) power. The quadratic-character/Weil-index ratio must also be retained unless the two splitting characters agree.

**Hypotheses.**

- YZ published §6.2 standard complementary Gaussian/indicator; explicit common splitting characters for any statement containing only the modulus factor.

**Proof outline.**

1. Factor the oscillator representation over V₁⊕V₁⊥.
2. Evaluate the complementary standard vector at0 and compute Levi and Fourier factors.
3. Compare the finite and archimedean normalizations; δ is a positive modulus, not a character.

**Sources.**

- PAPER-YUAN-ZHANG-18, Published §6.2, printed580–581, PDF48–49, restriction formula preceding(6.2.1): Restriction factors and the positive Iwasawa modulus.

**Acceptance.**

- Different signed discriminants require their character ratio on Levi elements.

**Prerequisites.** [`MP.5/extended-schwartz-weil`](#n-mp-5-extended-schwartz-weil), [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-ideal-class-theta"></a>

### Ideal-class theta series — `MP.5/ideal-class-theta`

construction · from the MP.0 part · planet “Ideal class theta series”

**Statement.** For K=Q(√D), negative fundamental discriminant D, ideal class A and w=|O_K×|, define θ_A(z)=1/w+Σn≥1 r_A(n)exp(2πinz). Equivalently, for an integral ideal a∈A, θ_A(z)=(1/w)Σλ∈a exp(2πiN(λ)z/N(a)); the latter first counts A⁻¹, and conjugation identifies its coefficients with A. The series is independent of a and normally convergent on the upper half plane.

**Hypotheses.**

- D<0 fundamental; actual ideal-class/norm arithmetic supplied by GN.3; z in the native upper half plane.

**Proof outline.**

1. Use positive-definite binary norm and lattice Gaussian decay.
2. Map nonzero λ to (λ)a⁻¹, with each ideal counted w times.
3. Apply ideal conjugation to exchange A and A⁻¹; handle the zero vector separately.

**Sources.**

- PAPER-GROSS-ZAGIER-86, I.§5(5.2), printed229, PDF6; IV.§1(1.1), printed270, PDF47: Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Uses.**

- GZ IV.§2 Lemma2.3; GZ.5 kernel inputs: Supply the classical weight-one binary theta form.

**API.**

- `TauCeti.Metaplectic.idealClassTheta_coeff` (simp): The positive n coefficient is r_A(n).
- `TauCeti.Metaplectic.idealClassTheta_constant` (simp): The constant coefficient is1/w.
- `TauCeti.Metaplectic.idealClassTheta_lattice` (compatibility): The w-normalized lattice sum equals the ideal-count series.

**Checks.**

- `TauCeti.Metaplectic.idealClassTheta_gaussianUnits` (computation): For K=Q(i), w=4 and the constant coefficient is1/4.
- `TauCeti.Metaplectic.idealClassTheta_conjugate` (compatibility): A and A⁻¹ give the same theta series.
- `TauCeti.Metaplectic.idealClassTheta_zeroIdeal` (non-example): Changing the norm-index coefficient at zero does not change the series, because its index-zero term is excluded. Identification of the source constant term requires actual ideal arithmetic.

**Acceptance.**

- The constant coefficient is1/w, not the number of ideals of norm0.

**Prerequisites.** [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-ideal-class-theta-modularity"></a>

### Ideal-class theta modularity — `MP.5/ideal-class-theta-modularity`

theorem · from the MP.0 part

**Statement.** θ_A is holomorphic of weight1 on Γ₀(|D|) with Nebentypus ε_D: θ_A(γz)=ε_D(d)(cz+d)θ_A(z), and it is holomorphic at every cusp. This holds for every negative fundamental D; the explicit all-SL₂(Z) transformation node below is restricted to odd D.

**Hypotheses.**

- Negative fundamental D; γ∈Γ₀(|D|); source lattice and character conventions.

**Proof outline.**

1. Use the adelic binary oscillator section and local integral lattice stabilizer.
2. Compare its positive real Gaussian with the weight1 slash action.
3. Prove all-cusp holomorphy by the transformed lattice Gaussian expansion.

**Sources.**

- PAPER-GROSS-ZAGIER-86, IV.§1 after(1.1), printed270, PDF47: Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Acceptance.**

- For even D the odd-D Gauss-factor formula is not asserted.

**Prerequisites.** [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta), [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-ideal-class-theta-conjugation"></a>

### Ideal-class theta conjugation — `MP.5/ideal-class-theta-conjugation`

theorem · from the MP.0 part

**Statement.** For every ideal class A and n≥1, conjugation gives r_A(n)=r_{A⁻¹}(n), hence θ_A=θ_{A⁻¹}. For the ramified ideal d₁ in an odd-discriminant factorization, d₁²=(D₁), so its class D₁ has square1; consequently θ_{A⁻¹D₁⁻¹}=θ_{AD₁}.

**Hypotheses.**

- Imaginary quadratic K; the ramified ideal is the one in GZ Lemma2.3.

**Proof outline.**

1. Use aā=(N(a)) for the norm-preserving ideal conjugation bijection.
2. Use the ramified prime factorization to compute d₁².
3. Compare Fourier coefficients, including the shared constant1/w.

**Sources.**

- PAPER-GROSS-ZAGIER-86, IV.§2 proof of Lemma(2.3), printed275, PDF52: Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Acceptance.**

- The inverse-class equality uses a bijection, not an assumption that every class has order2.

**Prerequisites.** [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-ideal-class-theta-general-transform"></a>

### Ideal-class theta transformation — `MP.5/ideal-class-theta-general-transform`

theorem · from the MP.0 part

**Statement.** For odd negative fundamental D=D₁D₂, δ_i=|D_i|, γ=[[a,b],[c,d]]∈SL₂(Z) with gcd(c,|D|)=δ₂, and c* inverse to c modulo δ₁ chosen0 modulo δ₂, (θ_A|₁γ)(z)=ε_{D₁}(c/δ₂)ε_{D₂}(d)κ(D₁)⁻¹δ₁⁻¹/²χ_{D₁,D₂}(A)θ_{A D₁}((z+c*d)/δ₁). Here κ(D₁)=1 or i by its sign, and D₁ also denotes the class of the ideal of normδ₁ only in the last subscript. Use SL₂, correcting the printed PSL₂ because weight1 detects −I.

**Hypotheses.**

- D odd squarefree, D≡1 mod4; D_i fundamental with1 allowed; c* convention and exact genus character; no even-discriminant extension asserted.

**Proof outline.**

1. Apply the ideal-lattice Poisson identity and reduce the finite Gauss sums.
2. Evaluate the two quadratic Gauss factors with the correct δ_i indices.
3. Use the norm-class conjugation equality and d₁²=(D₁).

**Sources.**

- PAPER-GROSS-ZAGIER-86, IV.§2 Lemma(2.3), printed274, PDF51; proof275, PDF52: Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Acceptance.**

- At γ=−I, the weight1 action and odd ε_D character have the same sign.

**Prerequisites.** [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta), [`MP.5/ideal-class-theta-conjugation`](#n-mp-5-ideal-class-theta-conjugation), [`MP.6/ideal-lattice-poisson`](#n-mp-6-ideal-lattice-poisson), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-5-genuine-eisenstein-family"></a>

### Genuine Eisenstein families — `MP.5/genuine-eisenstein-family`

construction · from the MP.0 part

**Statement.** For a rational parabolic of Mp(W), an actual genuine Levi cuspidal datum and a normalized section in its covered induced representation, define E(g,s,F)=Σγ∈P(F)\Sp(W)(F)F_s(γg) in a proved absolute-convergence chamber. The rational/unipotent splittings are canonical; the covered Levi and genuine inducing character are retained. The span of the continued families/residues is an Eisenstein space only after the cover-specific intertwining/constant-term comparison is established.

**Hypotheses.**

- Specified covered parabolic, genuine Levi representation, actual section and source-qualified convergence chamber; no automatic linear reductive-group continuation theorem.

**Proof outline.**

1. Use MP.3’s covered Levi induction and MP.4 rational splitting to make the summand well-defined.
2. Prove compact-uniform convergence via the corresponding finite-cover comparison and AS.1 estimates.
3. Use the normalized cover intertwining operators and AS.2 adaptation for meromorphic continuation and residues.

**Sources.**

- GQT, §§5.3,6.1–6.2, PDF25,28; pole statement Proposition6.1 excludes O(1,1): Siegel family as the scoped worked case; general covered induction/continuation remains requested.

**Uses.**

- MP.6 regularization and MP.7 rank-one Eisenstein coefficients: Provide actual cover sections and their qualified family/residue space.

**API.**

- `TauCeti.Metaplectic.genuineEisenstein_sum` (simp): In the verified chamber the value is the rational coset sum.
- `TauCeti.Metaplectic.genuineEisenstein_central` (characterisation): The inducing central sign is retained in E.
- `TauCeti.Metaplectic.genuineEisenstein_constantTerm` (compatibility): Its constant term is expressed by the specified normalized cover intertwiners.

**Checks.**

- `TauCeti.Metaplectic.genuineEisenstein_zero` (degenerate): The zero section gives the zero family.
- `TauCeti.Metaplectic.genuineEisenstein_sign` (non-example): A nonzero genuine family cannot descend to the linear base group.
- `TauCeti.Metaplectic.genuineEisenstein_siegel` (compatibility): A singleton coset sum with value3 evaluates to3; the source Siegel parameter theorem belongs to the actual evaluation-section construction.

**Acceptance.**

- For an odd orthogonal datum the inducing character is genuine, not an ordinary linear-group character.

**Prerequisites.** [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.5/unipotent-splitting`](#n-mp-5-unipotent-splitting), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage5`, namespace `TauCeti.Metaplectic`.

<a id="layer-mp-6"></a>

## MP.6 — Local–global comparison and reusable theta integrals

**Layer statement.** Prove factorization of pure-tensor theta kernels and the local integral decompositions needed by toric pairings, with compatible self-dual measures and ramified test functions. Construct spectral projection and see-saw identities under verified convergence or regularization hypotheses. Export the quadratic-character and quaternionic-norm-form instances to GZ.5; export the coherent/incoherent local sections and functional-equation conventions to GZ.6. The Waldspurger or arithmetic derivative identity itself remains there. A local theta-correspondence statement alone is not the global period formula.

**Status.** Planned. 26 targets (4 new in the whole-roadmap pass).

What remains for this layer:

- The 22 accepted targets of MP.6 are those of the part MetaplecticAutomorphicForms--MP.0; this packet adds the four targets that RT-AREA-automorphic-1/20 asked MP.6 to plan and the part does not contain (the part's own restructure proposal names the classical lattice-index instance and the unitary instance as still to be added): Mp(2,ℤ) with vector-valued forms of half-integral weight, classical Jacobi forms of lattice index, the unitary Jacobi group and the theta-paired Fourier–Jacobi coefficients. R1 moves MP.6/ideal-lattice-poisson to MP.5.
- Weak and weakly holomorphic Jacobi forms, Rankin–Cohen brackets and the Kohnen plus space of weakly holomorphic forms, which QSeriesPartitionsAndMockModularForms also requests, stay with that roadmap's revision: they relax or extend the conditions of MP.6/classical-jacobi-forms and MP.6/metaplectic-modular-group and are not used by any target of this roadmap.
- The agreement of the product of local unitary splittings with the rational splitting is Kudla's global splitting theorem, an unread input of MP.3/unitary-splitting (gap recorded here).
- (accepted part) Normalized sections, quotient measures, the justified see-saw interchange and the toric Shimizu comparison remain as the part records them.

**Planets.** Siegel–Weil section ([`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section)); Siegel–Weil formula ([`MP.6/anisotropic-siegel-weil`](#n-mp-6-anisotropic-siegel-weil)); Second term identity ([`MP.6/second-term-identity`](#n-mp-6-second-term-identity)); Rallis inner product formula ([`MP.6/rallis-inner-product`](#n-mp-6-rallis-inner-product)); Norm form theta integrals ([`MP.6/quadratic-quaternionic-norm-instances`](#n-mp-6-quadratic-quaternionic-norm-instances)); Jacobi group ([`MP.6/jacobi-group`](#n-mp-6-jacobi-group)).

**Dependencies.**

- Inside the roadmap: MP.0 (6 citations), MP.1 (4 citations), MP.2 (3 citations), MP.3 (4 citations), MP.4 (9 citations), MP.5 (16 citations).
- AdelicAlgebraicGroups:AA.0: `AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral`.
- AdelicAlgebraicGroups:AA.1: `AdelicAlgebraicGroups:AA.1`.
- AdelicAlgebraicGroups:AA.2: `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `AdelicAlgebraicGroups:AA.2/tamagawa-number`.
- AutomorphicFormsOnReductiveGroups:AF.1: `AutomorphicFormsOnReductiveGroups:AF.1`.
- AutomorphicFormsOnReductiveGroups:AF.3: `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay`, `AutomorphicFormsOnReductiveGroups:AF.3/unipotent-quotient-compact`.
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.
- AutomorphicSpectralTheory:AS.0: `AutomorphicSpectralTheory:AS.0`.
- AutomorphicSpectralTheory:AS.1: `AutomorphicSpectralTheory:AS.1`.
- AutomorphicSpectralTheory:AS.2: `AutomorphicSpectralTheory:AS.2`.
- SmoothRepresentationsOfLocalGroups:SR.2: `SmoothRepresentationsOfLocalGroups:SR.2`.
- Tau Ceti Completed/IntegralLattices: `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.
- Tau Ceti TauCetiRoadmap/GlobalQuadraticForms: `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-3-admissible-systems-of-local-invariants`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-7-existence-from-compatible-local-invariants`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences`.
- Tau Ceti TauCetiRoadmap/QuadraticFormInvariants: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.
- Pinned libraries: 6 declarations, listed under each target.

**Consumers outside the roadmap.** `FunctionFieldArithmetic:FA.6/unitary-whittaker-density-comparison`, `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`, `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-cusp-form`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-elliptic-slash`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-form`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-group-law`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-modular-slash`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-rank-one-specialisation`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-index`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-decomposition`.

**Acceptance tests of the layer.**

- Siegel–Weil section: For orthogonal m=2,n=1, d(n)=2, s₀=0.
- Siegel–Weil formula: Binary anisotropic norm form at n=1 has s₀=0 and uses the c=2 branch.
- Second term identity: At n=1,m=3,r=1 the complementary m′=1 is anisotropic: correction zero, but the residual-image quotient qualification remains.
- Rallis inner product formula: Neither a nonzero local theta module nor a formal Euler product proves this global identity.
- Norm form theta integrals: The split binary integral fails the convergence inequality 1>2.
- Jacobi group: The two central coordinates have distinct roles.

<a id="n-mp-6-theta-measure-normalizations"></a>

### Theta measure conventions — `MP.6/theta-measure-normalizations`

comparison · from the MP.0 part

**Statement.** Match self-dual additive measures, restricted-product Haar and GQT quotient Tamagawa measures before theta integration. Write I=τ(H)⁻¹∫[H]θ. For a covering quotient map π use π* dĝ=dg as stipulated. The orthogonal τ is1 in the source convention except O(1) (m₀=1,r=0) and split O(1,1) (m₀=0,r=1), each of which has τ=1/2; unitary τ is2. Disconnected O(V) needs its component normalization explicitly, and cannot be imported from a connected reductive Tamagawa theorem.

**Hypotheses.**

- GQT §2 exact groups and quotient conventions; GL/GO central quotient data where used.

**Proof outline.**

1. Compare all local self-dual measures and their almost-everywhere unit-volume vectors.
2. Apply AA.0’s restricted-Haar integral and AA.2’s connected group results only within their hypotheses.
3. Supply the separate disconnected-orthogonal component formula, then compare the normalized theta pairing.

**Sources.**

- GQT, §2.5, PDF11, cover pushforward measure and orthogonal exceptions: Normalized theta measure, including split orthogonal exception.

**Acceptance.**

- Both O(1) and split O(1,1) have τ=1/2 in GQT §2.5; omitting either exception changes the normalized scalar by2.

**Prerequisites.** [`MP.0/heisenberg-haar`](#n-mp-0-heisenberg-haar), `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `AdelicAlgebraicGroups:AA.2/tamagawa-number`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-siegel-weil-section"></a>

### Siegel–Weil section — `MP.6/siegel-weil-section`

construction · from the MP.0 part · planet “Siegel–Weil section”

**Statement.** For a type-I dual pair, send φ to Φφ(g)=(ω(g)φ)(0) in the normalized Siegel degenerate principal series I_n(s₀,χV), s₀=(m−d(n))/2. Extend by the source’s standard flat section to a meromorphic Eisenstein family E(g,s,Φφ), and write A_k(φ) for its Laurent coefficients at s₀. The inducing cover and χV depend on orthogonal parity and the chosen splitting characters.

**Hypotheses.**

- Number field GQT datum; normalized induction δ_P^{1/2}|det|^s, compatible measures and oscillator convention.

**Proof outline.**

1. Compute the evaluation-at-zero Levi and unipotent covariance using the generator formulas.
2. Identify its normalized inducing parameter; import the induced-section/meromorphic Eisenstein spaces from AS with the cover comparison.
3. Extract coefficients in s−s₀.

**Sources.**

- GQT, §§5.3–5.4, PDF25; global §6.2 PDF28: Evaluation section and the normalized parameter.

**Uses.**

- GQT §§7–11; LZ §12; DL §4.1; GZ.6: Supply coherent/incoherent sections and normalized local integrals.

**API.**

- `TauCeti.Metaplectic.siegelWeilSection_apply` (simp): Φφ(g)=ω(g)φ(0).
- `TauCeti.Metaplectic.siegelWeilSection_covariance` (characterisation): Its Levi covariance has the normalized parameter s₀.
- `TauCeti.Metaplectic.siegelWeilSection_laurent` (data): A_k is indexed by powers of s−s₀.

**Checks.**

- `TauCeti.Metaplectic.siegelWeilSection_zero` (degenerate): Zero vector maps to the zero section.
- `TauCeti.Metaplectic.siegelWeilSection_identity` (computation): Φφ(1)=φ(0).
- `TauCeti.Metaplectic.siegelWeilSection_parameter` (non-example): The binary orthogonal/rank-one example has s₀=0, not the unnormalized Levi exponent m/2.

**Acceptance.**

- For orthogonal m=2,n=1, d(n)=2, s₀=0.

**Prerequisites.** [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-ikeda-map"></a>

### Ikeda map — `MP.6/ikeda-map`

construction · from the MP.0 part

**Statement.** For V=H^{r−r′}⊕V′ in the same Witt tower, define Ik_{r,r′}φ(a)=∫ φ(x,a,0)dx in the corresponding polarized configuration coordinates. The self-dual measures and splitting-character twists are fixed. The map preserves Schwartz functions, is equivariant for the smaller dual pair, and composes as Ik_{r′,r″}∘Ik_{r,r′}=Ik_{r,r″}.

**Hypotheses.**

- 0≤r″≤r′≤r; fixed isotropic splitting and source measures.

**Proof outline.**

1. Integrate the Schwartz function in the removed isotropic coordinates.
2. Use Fubini for the composition and generator formulas for equivariance.
3. Compare with the standard-vector normalization at good places.

**Sources.**

- GQT, §2.7 equation(2.1), PDF12; equivariance PDF13: Integration along isotropic coordinates and its composition.

**Uses.**

- GQT Theorems7.1,8.1,9.1: Define the complementary-tower correction in regularized identities.

**API.**

- `TauCeti.Metaplectic.ikedaMap_apply` (simp): The map integrates φ(x,a,0) in x.
- `TauCeti.Metaplectic.ikedaMap_comp` (relation): Fubini identifies successive integrals with the product-measure integral under SFinite and joint Integrable hypotheses for the displayed function.
- `TauCeti.Metaplectic.ikedaMap_equivariant` (functoriality): The smaller dual-pair action intertwines with its prescribed character.

**Checks.**

- `TauCeti.Metaplectic.ikedaMap_identity` (degenerate): Removing zero hyperbolic planes gives the identity.
- `TauCeti.Metaplectic.ikedaMap_product` (computation): For φ=φ₁(x)φ₂(a)φ₃(y), the result is (∫φ₁)φ₂(a)φ₃(0).
- `TauCeti.Metaplectic.ikedaMap_measure` (non-example): Scaling dx scales the map, so unspecified Haar measure cannot give the same normalized operator.

**Acceptance.**

- For r=r′ the map is the identity.

**Prerequisites.** [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), `mathlib:MeasureTheory.integral_prod`, `mathlib:MeasureTheory.integral_prod_symm`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-anisotropic-siegel-weil"></a>

### Anisotropic Siegel–Weil formula — `MP.6/anisotropic-siegel-weil`

theorem · from the MP.0 part · planet “Siegel–Weil formula”

**Statement.** For anisotropic H(V), E(g,s₀,Φφ)=c_{m,n} τ(H)/[E:F]·I_{n,0}(φ), with the source’s definition of I and its measure comparison, c=1 for s₀>0 and c=2 for s₀≤0. Retain the split exceptional-group normalization wherever it enters a boundary comparison; do not transfer this anisotropic formula to a split divergent norm form.

**Hypotheses.**

- GQT Theorem7.1 hypotheses; r=0; section and normalized quotient measure fixed.

**Proof outline.**

1. Use absolute convergence and the source’s anisotropic Siegel–Weil comparison.
2. Match all measure and inducing normalizations rather than absorbing the scalar into I.

**Sources.**

- GQT, Theorem7.1, PDF33–34: Anisotropic formula and source scalar.

**Acceptance.**

- Binary anisotropic norm form at n=1 has s₀=0 and uses the c=2 branch.

**Prerequisites.** [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-first-term-identity"></a>

### Regularized first-term identity — `MP.6/first-term-identity`

theorem · from the MP.0 part

**Statement.** For r>0 and 0<m≤d(n), the GQT normalized Laurent coefficients satisfy A₀(φ)=2B₋₁(φ), both in the strict first-term range 0<m<d(n) (Theorem7.4) and at the boundary m=d(n) (Theorem7.3(ii)). In the split O(1,1) exception in either range, A₀=B₋₁=0 and A₁=B₀. All coefficients are evaluated at their respective s₀ and ρ_H. The r=0 anisotropic identity is the separate Theorem7.1 node.

**Hypotheses.**

- GQT number-field type-I datum, r>0 and 0<m≤d(n); retain the exceptional split O(1,1) group and the source κ and τ.

**Proof outline.**

1. Use the regularized first-term comparison and its boundary refinement.
2. Evaluate the source constants after matching normalized sections and measures.

**Sources.**

- GQT, Theorems7.3(ii) and7.4, §7.2, PDF34–35: First-term and exceptional boundary coefficients.

**Acceptance.**

- The split binary rank-one norm-form example uses A₁=B₀, never an ordinary divergent theta integral.

**Prerequisites.** [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral), [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-second-term-identity"></a>

### Regularized second-term identity — `MP.6/second-term-identity`

theorem · from the MP.0 part · planet “Second term identity”

**Statement.** In d(n)<m≤d(n)+r with r≤n, let m+m′=2d(n), V′ the complementary Witt-tower space of index r′. Then A₋₁(φ)=B₋₂(φ), and A₀(φ)=B₋₁(φ)−κ_{r,r′}B₀(Ik_{r,r′}(π_KHφ)) modulo Im A₋₁. The correction is zero for r′=0 or H(V′)=O(1,1), with the source’s stipulated interpretation. Equality of A₀ and B₋₁ is only a quotient identity unless the residual image vanishes.

**Hypotheses.**

- GQT Theorems1.2/8.1 exact range, compact averaging π_KH and coefficient/measure normalizations.

**Proof outline.**

1. Use the induction in n and the constant-term computation for complementary towers.
2. Apply the Ikeda map and matching compact average.
3. Separate the leading-term equality from the quotient-valued second-term equality.

**Sources.**

- GQT, Theorem1.2, PDF5–6, quotient-valued second-term identity; proof refinements remain gaps: Leading and quotient second-term identities with complementary-tower correction.

**Acceptance.**

- At n=1,m=3,r=1 the complementary m′=1 is anisotropic: correction zero, but the residual-image quotient qualification remains.

**Prerequisites.** [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral), [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.6/ikeda-map`](#n-mp-6-ikeda-map), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations), `AutomorphicSpectralTheory:AS.2`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-coherent-incoherent-sections"></a>

### Coherent and incoherent sections — `MP.6/coherent-incoherent-sections`

construction · from the MP.0 part

**Statement.** A local collection of nondegenerate quadratic/Hermitian spaces with fixed dimension/discriminant and standard good-place lattices gives a restricted tensor of local evaluation sections. Call it coherent only when it is the localization of a global space, with all real signatures and local invariant product constraints matched. An incoherent collection still gives sections in the common induced representation; it does not give a global rational theta sum. Export their functional-equation and normalization data to GZ.6.

**Hypotheses.**

- Number-field local collection, common inducing character, matching archimedean data. For quadratic spaces, admissible invariant systems, global existence and classification come from GlobalQuadraticForms Layers3,7,8; QFI6C supplies only local Hilbert/Hasse invariants and its cohomological comparison. The global Hermitian analogue requires a separate source-qualified extension, not an assumed consequence of local theta nonvanishing.

**Proof outline.**

1. Construct local evaluation sections and their almost-everywhere standard tensors.
2. For quadratic spaces import GlobalQuadraticForms 3.1–3.3,7.2–7.4 and8.1: one global discriminant, real signatures, local small-rank realizability, finite support and the product constraint, with actual localization isometries. A Hermitian version needs its own exact supplier theorem.
3. Use the normalized Eisenstein functional equation for both kinds of section without assigning an incoherent global V(F).

**Sources.**

- PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18, Published §6.1 equations(6.1.1)–(6.1.2), printed466–467, PDF76–77: The finite Weil and incoherent Eisenstein conventions consumed by the arithmetic application.

**Uses.**

- GZ.6–7; AGHMP big-CM; DL π-coherence: Supply reusable analytic sections without duplicating arithmetic derivative identities.

**API.**

- `TauCeti.Metaplectic.thetaSectionCollection_tensor` (constructor): Almost-everywhere standard local sections give the restricted tensor section.
- `TauCeti.Metaplectic.thetaSectionCollection_global` (compatibility): For a coherent datum the section equals that of the global Schwartz vector.
- `TauCeti.Metaplectic.thetaSectionCollection_incoherent` (characterisation): When global localizations satisfy the explicit invariant product constraint, a finite-support sign system with product −1 cannot be such a localization. This is a necessary obstruction, not the global classification theorem.

**Checks.**

- `TauCeti.Metaplectic.thetaSectionCollection_globalExample` (compatibility): A finite-support invariant system whose every entry is1 has product1. Identifying actual global localization invariants is a supplier gate.
- `TauCeti.Metaplectic.thetaSectionCollection_oneFlip` (non-example): A single incompatible local Hasse invariant violates the global product constraint.
- `TauCeti.Metaplectic.thetaSectionCollection_standard` (computation): At every good place the spherical evaluation section has value1 at the identity.

**Acceptance.**

- Changing one finite invariant can destroy coherence while preserving the local section carrier.

**Prerequisites.** [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `AutomorphicSpectralTheory:AS.2`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-3-admissible-systems-of-local-invariants`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-7-existence-from-compatible-local-invariants`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-unitary-siegel-weil-measure"></a>

### Unitary Siegel–Weil measure — `MP.6/unitary-siegel-weil-measure`

comparison · from the MP.0 part

**Statement.** For DL’s rank n=2r unitary local datum and a nonsingular moment matrix T, use the unique rationally normalized H(F_v)-Haar measure stipulated in §4.1(H8): I_T(φ)=b_{2r,v}(1)·W_T(SW(φ)), with the source Whittaker character and local standard section. At an unramified hyperspecial place the designated compact subgroup has volume1. This equality specifies a normalization; it is not an arbitrary Haar choice.

**Hypotheses.**

- DL §4.1(H1)–(H9); the local Fourier character and the source’s b_{2r,v} factor; nonsingular T in the indicated orbit.

**Proof outline.**

1. Compare orbital integration with the local Siegel–Weil Whittaker functional.
2. Prove uniqueness of the Haar scalar and evaluate it on the unramified standard vector.
3. Track this measure through the global restricted product.

**Sources.**

- PAPER-DISEGNI-LIU-24, §4.1(H8), PDF41–42: Rational measure specified by the exact orbital/Whittaker comparison.

**Acceptance.**

- Hyperspecial volume1 is checked only at the source’s good places.

**Prerequisites.** [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations), [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations), `AdelicAlgebraicGroups:AA.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-pi-coherence-parity"></a>

### Unitary theta coherence parity — `MP.6/pi-coherence-parity`

theorem · from the MP.0 part

**Statement.** For DL’s tempered relevant π with rank n=2r, prescribed infinity signature (n−1,1) at one place and (n,0) elsewhere, the locally distinguished finite Hermitian spaces V_{π_v} form a coherent global collection exactly when ∏_{v finite}η_v((−1)^r det V_{π_v})=−(−1)^{r[F:Q]}. Retain the ordinary norm-character conventions at every v. This global form-existence test is distinct from the local theta dichotomy.

**Hypotheses.**

- DL Assumption3.2 and §4.1, F totally real, E/F CM; relevant tempered local representations and the stated archimedean signatures.

**Proof outline.**

1. Use the unique local theta spaces from MP.3.
2. Compute the real local invariants in the specified signature.
3. Apply a separately sourced global Hermitian existence criterion (Landherr: a family of local Hermitian spaces of one dimension, almost all with trivial local sign, comes from a global Hermitian space exactly when the product of the local signs is 1). It is the source-qualified Hermitian extension recorded at MP.6/coherent-incoherent-sections; QFI6C supplies local quadratic symbols only.

**Sources.**

- PAPER-DISEGNI-LIU-24, Definition4.2 and Remark4.3, PDF41–42: The exact parity condition defining π-coherence.

**Acceptance.**

- Flipping one finite η(det) changes coherence.

**Prerequisites.** [`MP.3/relevant-unitary-dichotomy`](#n-mp-3-relevant-unitary-dichotomy), [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-doubling-schwartz-map"></a>

### Doubling Schwartz map — `MP.6/doubling-schwartz-map`

construction · from the MP.0 part

**Statement.** Identify the doubled oscillator space for W⊕W⁻ with the tensor of the ψ and ψ⁻¹ oscillator models. Define δ:S(V^n)⊗conjugate(S(V^n))→S(V^n⊕V^n) by the source partial Fourier/polarization transform. Normalize it so δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩. Under G×G its action is the two commuting Weil actions with the explicit χV determinant twist in the doubled embedding.

**Hypotheses.**

- Compatible self-dual measures, doubled polarization and GQT §11.3 splitting convention.

**Proof outline.**

1. Take the tensor oscillator representation and correct its scalar-cover weight as in MP.2.
2. Apply the partial Fourier polarization equivalence.
3. Evaluate at0 to identify the Hilbert pairing and compute the doubled character.

**Sources.**

- GQT, §11.3, unnumbered doubled-space and δ displays, PDF52: The doubled map and evaluation inner-product normalization.

**Uses.**

- GQT Proposition11.1 and Theorem11.4: Convert the theta inner product to a doubled Eisenstein integral.

**API.**

- `TauCeti.Metaplectic.doublingSchwartz_eval_zero` (simp): δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩.
- `TauCeti.Metaplectic.doublingSchwartz_equivariant` (functoriality): δ intertwines the doubled action with the stipulated χV determinant twist.
- `TauCeti.Metaplectic.doublingSchwartz_pureTensor` (data): δ is the source partial Fourier transform of a pure tensor.

**Checks.**

- `TauCeti.Metaplectic.doublingSchwartz_zero` (degenerate): A zero factor maps to zero.
- `TauCeti.Metaplectic.doublingSchwartz_norm` (computation): For equal φ the value at0 is its squared L² norm.
- `TauCeti.Metaplectic.doublingSchwartz_conjugate` (non-example): Replacing conjugate φ₂ by φ₂ changes a Hermitian pairing into a bilinear one.

**Acceptance.**

- Without the conjugate/ψ⁻¹ factor the evaluation is not the Hermitian pairing.

**Prerequisites.** [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.2/character-and-dual`](#n-mp-2-character-and-dual), [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-local-doubling-integral"></a>

### Local doubling zeta integral — `MP.6/local-doubling-integral`

construction · from the MP.0 part

**Statement.** For local π and a section Φ_s of the doubled normalized induced representation, define Z_v(s,Φ_s,f₁,f₂)=∫G(F_v)Φ_s((g,1))⟨π(g)f₁,f₂⟩dg in its absolute-convergence chamber. Its meromorphic continuation is the local doubling functional. Define Z_v*=Z_v/L_v(s+1/2,π⊗χV) using the GQT normalization; for the standard good-place section Z_v=L_v/d_v, hence Z_v*=d_v⁻¹. Do not silently multiply the local section by d_v.

**Hypotheses.**

- Generic good section in the source’s normalized induction, compatible Haar and matrix-coefficient pairing; L/d convention fixed.

**Proof outline.**

1. Prove initial absolute convergence and equivariance.
2. Apply the local doubling continuation and normalized L-factor theorem.
3. Compute the unramified standard vector, then match all ramified factors rather than infer them from the Euler product.

**Sources.**

- GQT, §11.6, local integral and normalized unramified displays, PDF54; global factorization (11.3), PDF53: Local integral, normalized factor and unramified denominator.

**Uses.**

- GQT Theorem11.4; GZ.5 factorized pairings: Provide the actual local factors and nonvanishing tests.

**API.**

- `TauCeti.Metaplectic.localDoublingZeta_integral` (simp): In absolute convergence Z is the displayed group integral.
- `TauCeti.Metaplectic.localDoublingZeta_unramified` (simp): The designated spherical data give L_v/d_v.
- `TauCeti.Metaplectic.localDoublingZeta_normalized` (compatibility): Z_v*=Z_v/L_v(s+1/2,π⊗χV).

**Checks.**

- `TauCeti.Metaplectic.localDoublingZeta_zero` (degenerate): Zero vector or section gives zero.
- `TauCeti.Metaplectic.localDoublingZeta_spherical` (compatibility): For the Unit group, the trivial complex representation, Dirac measure, constant section1 and both vectors1 give integral1. General spherical zeta ratios are a separate source theorem.
- `TauCeti.Metaplectic.localDoublingZeta_measure` (non-example): Changing Haar without transporting the normalization rescales Z_v.

**Acceptance.**

- The normalized good-place value is1/d_v, unless the section has explicitly been normalized by d_v.

**Prerequisites.** [`MP.6/doubling-schwartz-map`](#n-mp-6-doubling-schwartz-map), [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-theta-integral-factorization"></a>

### Factorization of theta pairings — `MP.6/theta-integral-factorization`

theorem · from the MP.0 part

**Statement.** For pure tensor Schwartz vectors, matrix coefficients and sections in a proved absolute-convergence chamber, the unfolded doubled theta pairing equals the product of its normalized local integrals times the designated partial/global L-factor and almost-everywhere denominators. Restricted-product Fubini uses AA.0’s countability, second-countability, open compact and cofinite indicator hypotheses; ramified and real factors are computed independently. A rational theta sum itself is generally not the product of local theta sums.

**Hypotheses.**

- Pure-tensor input; all integrability/unfolding hypotheses proved; compatible local measures and good-place reference vectors.

**Proof outline.**

1. Unfold using rational invariance and a dominated majorant.
2. Apply the exact restricted-Haar factorization theorem.
3. Extract the AL Euler factor and retain every local normalizing denominator; continue only through an established meromorphic identity.

**Sources.**

- GQT, Proposition11.1 and §11.3, PDF52–54: Factorization applies to unfolded integrals under verified convergence.

**Acceptance.**

- The product assertion is about local operators/sections/integrals, not an unrestricted product of rational lattice sums.

**Prerequisites.** [`MP.5/global-theta-lift`](#n-mp-5-global-theta-lift), [`MP.6/doubling-schwartz-map`](#n-mp-6-doubling-schwartz-map), [`MP.6/local-doubling-integral`](#n-mp-6-local-doubling-integral), `AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-rallis-inner-product"></a>

### Rallis inner product formula — `MP.6/rallis-inner-product`

theorem · from the MP.0 part · planet “Rallis inner product formula”

**Statement.** In the GQT positive range d(n)<m≤2d(n), r≤n, allowing both its second-term and convergent cases, for cuspidal π whose lower theta lifts vanish, the theta inner product is [E:F]·Val_{s=s_{m,n}} L(s+1/2,π⊗χV)·Z*(s,Φ,f₁,f₂), with the exact normalized doubled section and global measures. If every relevant local theta lift is nonzero, the stated L-factor is holomorphic at that point and the formula uses its value. The lower-lift vanishing is essential to the cuspidal and residual-term elimination.

**Hypotheses.**

- GQT Theorem11.4 hypotheses; first-occurrence theta lift; s_{m,n}=(m−d(n))/2>0; good sections and local/global normalization.

**Proof outline.**

1. Use the doubled Schwartz map to express the theta pairing via Proposition11.1.
2. Use the second-term identity or the convergent Siegel–Weil identity according to the Witt index, with lower-lift vanishing eliminating the complementary correction and residual image where present.
3. Unfold and apply the normalized local factor theorem.

**Sources.**

- GQT, Theorem11.4, PDF54: Source-qualified Rallis formula in its positive range, including the convergent case.

**Acceptance.**

- Neither a nonzero local theta module nor a formal Euler product proves this global identity.

**Prerequisites.** [`MP.6/second-term-identity`](#n-mp-6-second-term-identity), [`MP.6/doubling-schwartz-map`](#n-mp-6-doubling-schwartz-map), [`MP.6/local-doubling-integral`](#n-mp-6-local-doubling-integral), [`MP.6/theta-integral-factorization`](#n-mp-6-theta-integral-factorization), [`MP.5/global-theta-lift`](#n-mp-5-global-theta-lift), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-global-theta-nonvanishing"></a>

### Global theta nonvanishing criterion — `MP.6/global-theta-nonvanishing`

theorem · from the MP.0 part

**Statement.** In the same first-occurrence range, the global theta lift is nonzero exactly when the relevant normalized local functionals and the special L-value are nonzero. Replacing local-functional nonvanishing by local-theta nonvanishing requires GQT’s extra archimedean/range hypotheses: ε₀=−1, or all unitary archimedean places split, or orthogonal F totally complex, or m=d(n)+1. In the remaining cases the source permits modifying real signatures; it does not prove the unrestricted assertion for the original V.

**Hypotheses.**

- GQT Theorem11.7 and Proposition11.6; the exact local-functional hypotheses and first-occurrence cuspidality.

**Proof outline.**

1. Use the nonnegative norm given by the Rallis formula.
2. Choose test vectors with nonzero normalized local factors in the established local range.
3. Use only the stated cases for the archimedean local-theta/functional comparison.

**Sources.**

- GQT, §§11.8–11.9, Proposition11.6 and Theorem11.7, PDF55–57: Nonvanishing criterion with its archimedean qualifications.

**Acceptance.**

- A general local-to-global theta claim without the real-signature qualification is rejected.

**Prerequisites.** [`MP.6/rallis-inner-product`](#n-mp-6-rallis-inner-product), [`MP.6/local-doubling-integral`](#n-mp-6-local-doubling-integral), [`MP.3/first-occurrence`](#n-mp-3-first-occurrence).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-global-see-saw-and-projection"></a>

### Global see-saw and spectral projection — `MP.6/global-see-saw-and-projection`

theorem · from the MP.0 part

**Statement.** For a nested global dual-pair see-saw with compatible splittings, the two iterated theta pairings agree when the double integrand is absolutely integrable; with regularization use the specifically proved regularized see-saw identity and its coefficient convention. Orthogonal projection onto a specified discrete cuspidal eigenspace commutes with the equivariant lift under the Hilbert-domain/integrability hypotheses. No projection through a divergent or merely totalized integral is asserted.

**Hypotheses.**

- Compatible see-saw characters; cusp/decay or compact-source estimates sufficient for Fubini; actual closed Hilbert subspace for projection.

**Proof outline.**

1. Use equality of the restricted oscillator actions.
2. Prove a double-integral majorant and apply Fubini.
3. For projection use the bounded Hilbert projection and kernel pairing; retain regularized coefficient calculations as separate identities.

**Sources.**

- PAPER-ICHINO-PRASANNA-23, §§7–9, PDF41–42,50–53: Global theta pairings using compatible quaternionic splittings.

**Acceptance.**

- A regularized pairing is compared through its Laurent coefficient, not ordinary Fubini on a divergent integral.

**Prerequisites.** [`MP.3/local-see-saw`](#n-mp-3-local-see-saw), [`MP.5/global-theta-lift`](#n-mp-5-global-theta-lift), [`MP.6/theta-integral-factorization`](#n-mp-6-theta-integral-factorization), [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral), `AutomorphicSpectralTheory:AS.0`, `AutomorphicFormsOnReductiveGroups:AF.3`, `mathlib:MeasureTheory.integral_prod`, `mathlib:MeasureTheory.integral_prod_symm`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-quadratic-quaternionic-norm-instances"></a>

### Norm-form theta integrals — `MP.6/quadratic-quaternionic-norm-instances`

theorem · from the MP.0 part · planet “Norm form theta integrals”

**Statement.** Export to GZ.5 the rank-one theta kernel for the binary quadratic norm of E/F and the ternary trace-zero quaternion norm. For anisotropic binary (m=2,r=0,n=1) and division ternary (m=3,r=0), the ordinary integral converges. Split binary (m=2,r=1) lies at the exceptional boundary A₁=B₀. Split ternary (m=3,r=1) lies in the second-term range and uses A₋₁=B₋₂ and A₀=B₋₁ modulo Im A₋₁, with the anisotropic complementary correction zero. Export explicit Haar/splitting factors, not the Waldspurger identity itself.

**Hypotheses.**

- Orthogonal ε₀=1,d(1)=2; nondegenerate norm/trace-zero forms; exact GQT convention and source’s quaternion split/division cases.

**Proof outline.**

1. Construct the norm forms from upstream quadratic/quaternion arithmetic.
2. Compute m and Witt index and apply the convergence test.
3. Use the corresponding ordinary, boundary or second-term comparison with its coefficient/measure normalization.

**Sources.**

- GQT, §3.1, PDF14; anisotropic Theorem7.1 PDF33; exceptional boundary Theorem7.3(ii) PDF34; second-term Theorem1.2 PDF5–6 and Theorem8.1 PDF35: The dimension/Witt-index criterion selects the actual theta integral for each norm-form instance.

**Acceptance.**

- The split binary integral fails the convergence inequality 1>2.

**Prerequisites.** [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence), [`MP.6/anisotropic-siegel-weil`](#n-mp-6-anisotropic-siegel-weil), [`MP.6/first-term-identity`](#n-mp-6-first-term-identity), [`MP.6/second-term-identity`](#n-mp-6-second-term-identity), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-jacobi-group"></a>

### Jacobi group — `MP.6/jacobi-group`

construction · from the MP.0 part · planet “Jacobi group”

**Statement.** Construct J(W)=H(W)⋊Mp(W) using the native center-fixing action induced by Mp(W)→Sp(W). The central H(F) embeds as the additive center, while the metaplectic sign is the second factor. The Schrödinger–Weil representation is (h,g)↦ρψ(h)ωψ(g), with multiplication (h,g)(h′,g′)=(h(g·h′),gg′). A positive similitude transports the Heisenberg central character/index; it is not an action preserving a fixed ψ without that transport.

**Hypotheses.**

- Characteristic-zero local/adelic symplectic datum; chosen genuine oscillator model and its covariance.

**Proof outline.**

1. Use the already constructed Heisenberg action and native semidirect product.
2. Compute the representation group law by covariance.
3. Compare the coordinate Jacobi action in BFH with the intrinsic action, keeping the order of factors explicit.

**Sources.**

- BFH90Invent, §1 equations(1.1)–(1.5), printed547, PDF6: Visual transcription. The two slash actions and their compatibility motivate the intrinsic semidirect product; the semidirect product itself reuses the native library.

**Uses.**

- MP.8 BFH slash/translation; Fourier–Jacobi coefficients: Supply the common group and oscillator action before the genus-two specialization.

**API.**

- `TauCeti.Metaplectic.jacobiGroup_mul` (simp): Multiplication uses h(g·h′),gg′.
- `TauCeti.Metaplectic.schroedingerWeil_apply` (simp): The action is ρψ(h)ωψ(g).
- `TauCeti.Metaplectic.jacobiGroup_similitude` (compatibility): A similitude transports the central character by its multiplier.

**Checks.**

- `TauCeti.Metaplectic.jacobiGroup_identity` (degenerate): With W=0, H(W)=F and the cover is μ₂. The μ₂ action on the zero symplectic space Heisenberg center is trivial; the corresponding generic semidirect-product example explicitly assumes act=1.
- `TauCeti.Metaplectic.jacobiGroup_translation` (compatibility): On the H subgroup the action is the native Schrödinger representation.
- `TauCeti.Metaplectic.jacobiGroup_covariance` (non-example): Using an ordinary direct product would require symplectic and Heisenberg operators to commute, contrary to covariance.

**Acceptance.**

- The two central coordinates have distinct roles.

**Prerequisites.** [`MP.0/topological-heisenberg`](#n-mp-0-topological-heisenberg), [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator), [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.0/isometry-action`](#n-mp-0-isometry-action), `mathlib:SemidirectProduct`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-jacobi-spaces"></a>

### Jacobi spaces — `MP.6/jacobi-spaces`

definition · from the MP.0 part

**Statement.** For an arithmetic lattice in J(W), integral central index m and a specified finite-dimensional weight/multiplier representation, define the space of smooth automorphic sections with ψ_m central character, holomorphic dependence on the complex Heisenberg variable, the exact symplectic weight covariance, and the prescribed elliptic-lattice transformations. Fourier growth/holomorphy at cusps is part of the relevant holomorphic/cuspidal subspace. The genus-two BFH coordinates are supplied by MP.8/bfh-jacobi-specialization.

**Hypotheses.**

- A fixed Jacobi lattice and compatible central index; exact weight and multiplier, not inferred from the lattice equations alone.

**Proof outline.**

1. Take the invariant subspace of actual smooth sections.
2. Translate the intrinsic central and group covariance into slash/elliptic coordinate laws.
3. Compare the BFH lattice, vector-valued K-type and the two cusps using the supplier’s exact specialization.

**Sources.**

- BFH90Invent, §1 equations(1.6)–(1.9), printed547, PDF6: Visual transcription. Central/elliptic covariance; full weight and cusp conditions are stated separately in the generic definition.

**Uses.**

- MP.8/bfh-jacobi-specialization and theta-decomposition: Provide actual common weight/index sections, avoiding a genus-two duplicate.

**API.**

- `TauCeti.Metaplectic.jacobiSpace_central` (characterisation): The additive center acts by ψ_m.
- `TauCeti.Metaplectic.jacobiSpace_elliptic` (relation): The coordinate elliptic law has the prescribed quadratic phase.
- `TauCeti.Metaplectic.jacobiSpace_weight` (compatibility): The symplectic covariance agrees with the specified weight/multiplier.

**Checks.**

- `TauCeti.Metaplectic.jacobiSpace_zero` (degenerate): The zero section belongs to every specified Jacobi space.
- `TauCeti.Metaplectic.jacobiSpace_index` (non-example): A nonzero section with distinct central character is outside the fixed-index space.
- `TauCeti.Metaplectic.jacobiSpace_bfh` (compatibility): At the BFH lattice the translation periods are Z² and N⁻¹Z², as in MP.8.

**Acceptance.**

- The index and weight are independent input data.

**Prerequisites.** [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), `AutomorphicFormsOnReductiveGroups:AF.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-fourier-jacobi-extraction"></a>

### Fourier–Jacobi extraction — `MP.6/fourier-jacobi-extraction`

construction · from the MP.0 part

**Statement.** Extract a Fourier–Jacobi coefficient of a smooth automorphic form by integration over the compact rational center of the relevant Heisenberg unipotent against ψ_m⁻¹. Its remaining transformation is the Jacobi action of index m, with the inherited weight/multiplier. The coefficient of a normally convergent Fourier family is recovered termwise; further Fourier extraction in the elliptic variable uses its designated compact torus and probability/Lebesgue normalization.

**Hypotheses.**

- Compact central quotient; actual unipotent splitting; smoothness and normal convergence for termwise extraction.

**Proof outline.**

1. Apply the compact unipotent Whittaker construction to the Heisenberg center.
2. Use normalizer covariance to obtain the Jacobi law.
3. Apply character orthogonality for the remaining elliptic Fourier coefficient.

**Sources.**

- BFH90Invent, §2 equations(2.2)–(2.3), printed551–552, PDF10–11: Visual transcription. Actual compact fibre Fourier extraction and its measure; arithmetic genus-two specialization remains MP.8.

**Uses.**

- MP.8/fourier-coefficient and theta-decomposition: Supply compact coefficient extraction and its Jacobi transformation.

**API.**

- `TauCeti.Metaplectic.fourierJacobi_index` (characterisation): The coefficient has ψ_m central character.
- `TauCeti.Metaplectic.fourierJacobi_equivariant` (functoriality): It transforms under the common Jacobi action.
- `TauCeti.Metaplectic.fourierJacobi_coefficient` (simp): A character term of matching index is recovered by compact orthogonality.

**Checks.**

- `TauCeti.Metaplectic.fourierJacobi_zero` (degenerate): The zero automorphic form has zero coefficient.
- `TauCeti.Metaplectic.fourierJacobi_matching` (computation): Integration of ψ_m against ψ_m⁻¹ over the probability center gives1.
- `TauCeti.Metaplectic.fourierJacobi_mismatch` (non-example): A distinct central character gives zero coefficient.

**Acceptance.**

- The normalization of each compact variable must be retained.

**Prerequisites.** [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces), `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-jacobi-theta-decomposition-interface"></a>

### Jacobi theta decomposition interface — `MP.6/jacobi-theta-decomposition-interface`

comparison · from the MP.0 part

**Statement.** For a positive integral index and normally convergent Jacobi section, elliptic invariance decomposes its Fourier indices into finitely many discriminant residues; its unique theta components transform through the finite Weil module. Prove the general statement using compact torus orthogonality and Poisson summation. MP.8/theta-decomposition, theta-pairing and theta-fourier-transform specialize this interface to the exact genus-two BFH formulas, including the positive-on-iY determinant-root branch; this node does not use them.

**Hypotheses.**

- Positive index; compatible integral lattice; normal Fourier convergence and all weight/multiplier data fixed. The generic lattice/discriminant carrier is imported from IntegralLattices.

**Proof outline.**

1. Group coefficients by their elliptic orbits using the invariant quadratic form.
2. Use the finite Weil representation and torus orthogonality for existence/uniqueness.
3. Use positive Fourier Poisson to compute the component transformation; compare the genus-two specialization without duplicating it.

**Sources.**

- BFH90Invent, §2 Proposition2.2, equations(2.4)–(2.10), printed552–553, PDF11–12: Visual transcription. Finite component transformation, positive-on-pure-imaginary determinant branch; the genus-two theorem is MP.8’s specialization of this interface.

**Acceptance.**

- For BFH dimension2 the finite Fourier normalization is1/(2a), not1/sqrt(2a).

**Prerequisites.** [`MP.6/fourier-jacobi-extraction`](#n-mp-6-fourier-jacobi-extraction), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces), [`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-ideal-lattice-poisson"></a>

### Ideal-lattice Poisson comparison — `MP.6/ideal-lattice-poisson`

comparison · from the MP.0 part

**Statement.** For an imaginary quadratic K, fractional ideal b, λ∈C and z∈H, Σμ∈b exp(2πiN(λ+μ)z)=i/(sqrt(|D|)N(b)z) Σν∈b⁻¹d⁻¹ exp(−2πiN(ν)/z)exp(2πiTr(λν)). The trace-dual ideal is b⁻¹d⁻¹, and the additive measure is matched to its discriminant covolume. This is an adapter of the supplied finite-dimensional Poisson theorem.

**Hypotheses.**

- D<0 fundamental; d the different, N(d)=|D|; the complex norm and trace conventions fixed.

**Proof outline.**

1. Compute the trace-dual lattice from ideal arithmetic.
2. Compute the positive Fourier transform of the shifted complex Gaussian.
3. Apply AL Poisson with the exact covolume and identify the prefactor.

**Sources.**

- PAPER-GROSS-ZAGIER-86, IV.§2 proof of Lemma(2.3), printed274–275, PDF51–52: Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Acceptance.**

- For K=Q(i), the trace-dual Z[i] lattice is (1/2)Z[i] up to its unit.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.5 (realises MP.5). verified: its prerequisites are AL.0 nodes and MP.5/ideal-class-theta; its only consumer is MP.5/ideal-class-theta-general-transform.

<a id="n-mp-6-toric-theta-pairing-interface"></a>

### Toric theta pairing interface — `MP.6/toric-theta-pairing-interface`

comparison · from the MP.0 part

**Statement.** For an anisotropic norm torus T and a compatible quadratic/quaternionic theta kernel, unfold the toric theta pairing into the local oscillator/orbital integrals only after proving the product integrand absolutely integrable on [T] and the companion quotient. Match the torus character, rational splitting, self-dual additive measures and quotient Haar. Export these local factors and the global see-saw to GZ.5; the exact Waldspurger special-value identity and its arithmetic comparisons stay there.

**Hypotheses.**

- Actual anisotropic torus and unitary character trivial on T(F); cusp or compactness/decay bound; ramified test functions and source parity fixed. For a quadratic field K/F its binary norm remains anisotropic even if the containing quaternion algebra is split. A split-quaternion Shimizu/Petersson comparison requires the separate source-qualified factorization described in the gap; a GQT residual-image identity alone is insufficient.

**Proof outline.**

1. Apply the ordinary binary norm identity for a quadratic field and, in the division case, the ordinary trace-zero ternary identity. The generic split binary/ternary GQT exports retain their exceptional/quotient terms; identifying them with a split Shimizu pairing needs a separate proved comparison.
2. Unfold the rational orbit sum with the supplied torus orbit dictionary and a dominated majorant.
3. Apply restricted-product Haar factorization and match each ramified factor; use the exact global see-saw.

**Sources.**

- PAPER-GROSS-ZAGIER-86, I.§5(5.2), printed229, PDF6; IV.§2 printed273–275, PDF50–52: Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.
- yzz-gross-zagier-shimura-curves-2011-draft, 6 November 2011 draft, §2.2.1 Proposition2.2.1 and proof pp.48–50; §§2.3–2.4 pp.51–55: The draft proves its Shimizu contraction by ternary Siegel–Weil in the nonsplit case, explicitly refers the split case to Waldspurger’s different proof, and supplies the torus unfolding/measure comparison. It does not establish an automatic split regularization adapter.

**Acceptance.**

- An anisotropic compact torus alone does not prove integrability on an additional noncompact group quotient.

**Prerequisites.** [`MP.6/quadratic-quaternionic-norm-instances`](#n-mp-6-quadratic-quaternionic-norm-instances), [`MP.6/global-see-saw-and-projection`](#n-mp-6-global-see-saw-and-projection), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations), [`MP.6/theta-integral-factorization`](#n-mp-6-theta-integral-factorization), `AdelicAlgebraicGroups:AA.1`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage6`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-metaplectic-modular-group"></a>

### The metaplectic modular group and vector-valued forms of half-integral weight — `MP.6/metaplectic-modular-group`

definition · **New in the whole-roadmap pass**

**Statement.** Mp(2,ℤ) is the group of pairs (A, w) with A = [a, b; c, d] ∈ SL(2,ℤ) and w a holomorphic function on the upper half plane with w(τ)² = cτ + d, under (A, w)(B, v) = (AB, τ ↦ w(Bτ) v(τ)). The projection (A, w) ↦ A is surjective with kernel {(1, 1), (1, −1)}, which is central. For k ∈ ½ℤ the weight-k slash operator (f|_k(A, w))(τ) = w(τ)^{−2k} f(Aτ) is a right action of Mp(2,ℤ) on functions on the upper half plane, and (1, −1) acts by (−1)^{2k}. For a subgroup Γ ⊂ Mp(2,ℤ) of finite index and a finite-dimensional unitary representation ρ of Γ on V, a modular form of weight k and type (Γ, ρ) is a holomorphic f : ℍ → V with f|_k α = ρ(α) f for all α ∈ Γ such that, for every α ∈ Mp(2,ℤ), f|_k α has an expansion Σ c(l) q^l (q^l = e(lτ)) over real l ≥ 0 lying in finitely many cosets of (1/h)ℤ, h the width of the cusp α∞; cusp forms have l > 0 only, and weakly holomorphic forms allow finitely many l < 0. One-dimensional ρ are the multiplier systems. Mp(2,ℤ) is the preimage of SL(2,ℤ) in the real metaplectic double cover of MP.2 (MP.1/metaplectic-double-cover before restructure R1), the pair (A, w) corresponding to the lift whose weight-1/2 automorphy factor is w.

**Hypotheses.**

- w ranges over holomorphic square roots of cτ + d on the simply connected upper half plane; there are exactly two for each A.
- Expansions at the cusps are taken after slashing by every α ∈ Mp(2,ℤ), so the growth condition is imposed at every cusp. ρ is unitary, so ρ restricted to the stabilizer of a cusp is diagonalizable with eigenvalues e(κ_j), and the exponents lie in the cosets κ_j/h + (1/h)ℤ; they are rational when ρ has finite image, which the theta decomposition of MP.6/classical-jacobi-forms assumes. Non-unitary types, whose expansions acquire logarithmic terms, are not covered.

**Proof outline.**

1. The composition is well defined and associative because the factors compose as automorphy factors: (w(Bτ)v(τ))² = (c(Bτ) + d)(c_Bτ + d_B), which is the bottom-row factor of AB at τ. The identity is (1, 1) and the inverse of (A, w) is (A⁻¹, τ ↦ 1/w(A⁻¹τ)).
2. Two square roots of the same nowhere-vanishing holomorphic function on a connected domain differ by a constant sign, so the kernel of the projection is {(1, ±1)}; it is central because constants commute with the composition.
3. The slash law (f|_kα)|_kβ = f|_k(αβ) is the composition rule raised to the power −2k; at α = (1, −1) the factor is (−1)^{−2k} = (−1)^{2k}.
4. Comparison with the real double cover: the lifts of SL(2,ℝ) acting on the weight-1/2 automorphy factor form the classical model of the double cover; MP.8/similitude-cover makes the same comparison in genus two. Restricting to SL(2,ℤ) gives Mp(2,ℤ). The comparison is made on generators and preserves the central sign.

**Sources.**

- Skoruppa07, §2, pp. 4–5 (notation: Mp(2,ℤ), the standard multiplier j(A, τ) = θ(Aτ)/θ(τ), M_k(Γ)): Defines Mp(2,ℤ) as pairs (A, w) with w² = cτ + d and the composition used here, and the spaces of modular forms of half-integral weight on subgroups of Γ₀(4) through the theta multiplier.
- Skoruppa07, §4, pp. 10–12 and p. 14: The weight-k action of Mp(2,ℤ) through w(τ)^{−2k}, the action of (1, −1) by (−1)^{2k}, the induction isomorphism (Lemma 1) and vector-valued forms M_k(ρ) with transformation law h(Aτ) w(τ)^{−2k} = ρ(α)h(τ).

**Uses.**

- Skoruppa, Jacobi forms of critical weight, §§2–4: Jacobi forms of half-integral weight, the Weil representations W(F) of finite quadratic modules and the vector-valued forms of the theta decomposition are all stated over Mp(2,ℤ).
- MP.6/classical-jacobi-forms: the modular part of the Jacobi group J_n(Γ) and the half-integral weight slash operator.
- MP.7/theta-multiplier and MP.7/adelic-classical-half-weight: the theta multiplier J(γ, τ) = θ(γτ)/θ(τ) is the weight-1/2 automorphy factor of a section of Mp(2,ℤ) over Γ₀(4), and classical half-integral weight forms are forms of type (Γ₀(4)*, χ).
- QSeriesPartitionsAndMockModularForms:QM.1 (requests to MP.7): half-integral weight automorphy factors, multiplier systems on finite-index subgroups, the classical Mp₂(ℤ) and vector-valued forms for a Weil representation; QM.1 imports them from here.

**API.**

- `TauCeti.Metaplectic.Mp2Z.mul_def` (simp): (A, w)(B, v) = (AB, τ ↦ w(Bτ) v(τ)).
- `TauCeti.Metaplectic.Mp2Z.ker_proj` (characterisation): The kernel of Mp(2,ℤ) → SL(2,ℤ) is {(1, ±1)} and it is central.
- `TauCeti.Metaplectic.Mp2Z.genS_genT` (relation): S̃ = (S, √τ) and T̃ = (T, 1) generate Mp(2,ℤ), with S̃² = (S̃T̃)³ = (−1, i) and S̃⁸ = 1.
- `TauCeti.Metaplectic.Mp2Z.principalSection_cocycle` (relation): The principal-branch section A ↦ (A, (cτ + d)^{1/2}) has a ±1-valued 2-cocycle σ(A, B), independent of τ, with (f|_{1/2}A)|_{1/2}B = σ(A, B)^{−1} f|_{1/2}(AB) for the principal-branch slash on SL(2,ℤ).
- `TauCeti.Metaplectic.Mp2Z.slash_mul` (structure): (f|_kα)|_kβ = f|_k(αβ), and f|_k(1, −1) = (−1)^{2k} f.
- `TauCeti.Metaplectic.Mp2Z.modularForm_induce` (equivalence): Forms of type (Γ, ρ) correspond to forms of type (Mp(2,ℤ), Ind ρ) (Skoruppa's Lemma 1, stated there for Jacobi forms).
- `TauCeti.Metaplectic.Mp2Z.modularForm_integral` (compatibility): For k ∈ ℤ, Γ the preimage of a finite-index subgroup Γ′ of SL(2,ℤ) and ρ trivial, the forms of type (Γ, ρ) are Mathlib's ModularForm of weight k for the image of Γ′ in GL(2,ℝ).
- `TauCeti.Metaplectic.Mp2Z.toRealCover` (compatibility): Mp(2,ℤ) embeds in the real metaplectic double cover over SL(2,ℤ) ⊂ SL(2,ℝ), compatibly with the projections and the central signs.

**Checks.**

- `TauCeti.Metaplectic.Mp2Z.genS_sq` (computation): (S, √τ)² = (−1, i): the constant √(−1/τ)·√τ equals i (check at τ = i: e^{iπ/4}·e^{iπ/4} = i), and (S, √τ)⁴ = (1, −1).
- `TauCeti.Metaplectic.Mp2Z.principalSection_minusOne` (non-example): The principal-branch section is not a homomorphism: σ(−1, −1) = −1, since (−1)^{1/2} = i and i·i = −1 while the factor of the identity is 1.
- `TauCeti.Metaplectic.Mp2Z.halfIntegral_trivialType` (degenerate): For k ∈ ½ + ℤ and a type ρ with ρ(1, −1) = 1, every form of type (Γ, ρ) vanishes, because (1, −1) acts by −1 on the weight-k slash.
- `TauCeti.Metaplectic.Mp2Z.integralWeight_compat` (compatibility): For k = 12, Γ = Mp(2,ℤ) and ρ trivial the space of cusp forms is spanned by Δ, matching Mathlib's level-one cusp forms of weight 12.

**Acceptance.**

- S̃ = (S, √τ) with the principal root and T̃ = (T, 1) satisfy S̃² = (−1, i) = (S̃T̃)³ and S̃⁴ = (1, −1), so S̃ has order 8.
- For integral k and ρ trivial on (1, −1) the forms of type (Γ, ρ) are the classical vector-valued forms on the image of Γ in SL(2,ℤ).

**Prerequisites.** [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), `mathlib:ModularForm`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:UpperHalfPlane`.

**Library.** module `TauCeti/NumberTheory/ModularForms/Metaplectic/Basic`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-unitary-jacobi-group"></a>

### Unitary Jacobi group and its Schrödinger–Weil representation — `MP.6/unitary-jacobi-group`

construction · **New in the whole-roadmap pass**

**Statement.** Let k/k₀ be a quadratic extension of local fields of characteristic zero, or the split algebra k₀ × k₀, with involution σ and quadratic character ω_{k/k₀}. Let (W, ⟨ , ⟩) be a nondegenerate skew-Hermitian k-space and let W₀ be W regarded as a k₀-space with the symplectic form Tr_{k/k₀}⟨ , ⟩. Then U(W) ⊂ Sp(W₀), and U(W) acts on the Heisenberg group H(W₀) = W₀ × k₀ of MP.0 by isometries of W₀, fixing the centre. The unitary Jacobi group is the semidirect product J_U(W) = H(W₀) ⋊ U(W). For a nontrivial unitary character ψ of k₀ and a character µ of k^× with µ|_{k₀^×} = ω_{k/k₀}, the splitting s_{ψ,µ} : U(W) → S_ψ into the scalar metaplectic extension of MP.1 (MP.3/unitary-splitting, for the dual pair formed by W and the Hermitian line of discriminant 1) gives a linear representation ω_{ψ,µ}(h, g) = ρ_ψ(h) A_{s_{ψ,µ}(g)} of J_U(W) on the smooth Schrödinger model, where A_s is the unitary operator component of s ∈ S_ψ. Its restriction to H(W₀) is the Stone–von Neumann representation with central character ψ, and its restriction to U(W) is the Weil representation ω_{ψ,µ}. Over a quadratic extension E/F of number fields, with ψ a character of 𝔸/F and µ a character of 𝔸_E^×/E^× restricting to ω_{E/F} on 𝔸^×, the local representations assemble into the restricted tensor product representation of J_U(W)(𝔸) on S(Y(𝔸)) for a Lagrangian Y ⊂ W₀, and Weil's theta distribution φ ↦ Σ_{ξ∈Y(F)} (ω_{ψ,µ}(j)φ)(ξ) is an automorphic realization θ_{ψ,µ} of it on J_U(W)(F)\J_U(W)(𝔸), with central character ψ.

**Hypotheses.**

- Characteristic zero; W nondegenerate skew-Hermitian over k, of any dimension (W = 0 allowed); ψ nontrivial; µ|_{k₀^×} = ω_{k/k₀} exactly. The auxiliary Hermitian space is the line of discriminant 1, so the restriction condition has exponent 1, not dim W.
- The symplectic form on W₀ is Tr_{k/k₀}⟨ , ⟩, as for V₁ ⊗ W with V₁ the Hermitian line of discriminant 1. Rescaling the form rescales ψ by the same factor, and the rescaling must be transported, not ignored.
- Globally the local splittings are the standard ones at almost all places (where W₀ has a self-dual lattice stable under the integral unitary group and ψ, µ are unramified), so that their restricted product is defined.

**Proof outline.**

1. U(W) preserves Tr_{k/k₀}⟨ , ⟩, so it embeds in Sp(W₀); its action on H(W₀) is the restriction of MP.0/isometry-action and fixes the centre.
2. Form the semidirect product with Mathlib's SemidirectProduct; the multiplication is (h, g)(h′, g′) = (h · (g · h′), gg′).
3. The covariance A_s ρ_ψ(h) A_s⁻¹ = ρ_ψ(g · h) for s = s_{ψ,µ}(g), which is the defining property of S_ψ (MP.1/scalar-normalizer-extension), shows that (h, g) ↦ ρ_ψ(h) A_{s_{ψ,µ}(g)} is multiplicative; it is linear, not projective, because s_{ψ,µ} is a homomorphism into S_ψ.
4. Globally, at almost all places the local splitting fixes the standard lattice vector, so the restricted tensor product of the local representations is defined (MP.4/adelic-weil-representation). For γ in U(W)(F) the product over all places of the local splittings agrees with the canonical rational splitting of MP.4/rational-symplectic-splitting, because µ is trivial on E^× and the Weil indices satisfy the product formula (MP.4/global-weil-index-product). The theta distribution is invariant under the rationally split Sp(W₀)(F) (MP.5/theta-kernel) and under the rational points of H(W₀) (Poisson summation along Y), hence under J_U(W)(F).
5. Degenerate cases: if W = 0 the group is the centre k₀ and ω_{ψ,µ} = ψ, with no dependence on µ; if k = k₀ × k₀, U(W) is a general linear group of a polarization of W₀ and the splitting is the standard linear one.

**Sources.**

- GGP12, §12, 'Symplectic and skew-Hermitian cases (Fourier–Jacobi models)', pp. 46–52, case (ii): Defines the homomorphism from the unipotent group N to the Heisenberg group of W regarded over k₀ with the trace form, and states that the projective Weil representation of U(W) becomes linear after choosing a character µ of k^× restricting to ω_{k/k₀}; the representation ν_{ψ,µ} of H = N ⋊ U(W) is built from it.
- GGP12, §22, pp. 84–85: The Jacobi group J_W = Sp(W) ⋉ H(W), its adelic double cover, Jacobi forms as functions with central character ψ, and Weil's automorphic realization θ_ψ of the global Weil representation.
- GGP12, §23, pp. 88–89: In the skew-Hermitian case an automorphic character µ with µ|_{𝔸^×} = ω_{E/F} gives a splitting H(𝔸) → J̃_W(𝔸) and the automorphic realization θ_{ψ,µ}.

**Uses.**

- Gan–Gross–Prasad, Astérisque 346, §12, skew-Hermitian case, and §23: H = N ⋊ U(W) maps to J_U(W); the representation ν_{ψ,µ} = ω_{ψ,µ} ⊗ λ and its automorphic realization θ_{ψ,µ} are pulled back from J_U(W).
- MP.6/fourier-jacobi-period: supplies the theta functions θ_{ψ,µ}(φ) that are paired with automorphic forms on unitary groups.
- AutomorphicCongruences L2 and L2s (Fourier–Jacobi calculations for unitary Eisenstein series): RT-AREA-automorphic-1/20 names the unitary analogue of the Jacobi group as their input from MP.6.
- MP.6/jacobi-group: the symplectic Jacobi group is the parallel object for Sp(W); through s_{ψ,µ}, J_U(W) maps into its scalar-extension form H(W₀) ⋊ S_ψ.

**API.**

- `TauCeti.Metaplectic.unitaryJacobiGroup_mul` (simp): In J_U(W), (h, g)(h′, g′) = (h · (g · h′), g g′).
- `TauCeti.Metaplectic.unitaryJacobiGroup.toScalarJacobi` (functoriality): For fixed ψ and µ, (h, g) ↦ (h, s_{ψ,µ}(g)) is an injective homomorphism from J_U(W) to H(W₀) ⋊ S_ψ, the scalar-extension version of the Jacobi group of MP.6/jacobi-group (S_ψ acting on H(W₀) through its projection to Sp(W₀)).
- `TauCeti.Metaplectic.unitarySchroedingerWeil_apply` (simp): ω_{ψ,µ}(h, g) = ρ_ψ(h) A_{s_{ψ,µ}(g)}; it is the pullback along toScalarJacobi of the representation (h, (g, A)) ↦ ρ_ψ(h) A of H(W₀) ⋊ S_ψ.
- `TauCeti.Metaplectic.unitarySchroedingerWeil_heisenberg` (characterisation): The restriction of ω_{ψ,µ} to H(W₀) is irreducible with central character ψ (Stone–von Neumann, MP.1).
- `TauCeti.Metaplectic.unitarySchroedingerWeil_character_change` (relation): Replacing µ by another character with the same restriction to k₀^× changes s_{ψ,µ} by a character of U(W), as recorded by MP.3/unitary-splitting; ω changes by that character on U(W) and not at all on H(W₀).
- `TauCeti.Metaplectic.unitaryTheta_invariant` (characterisation): Globally θ_{ψ,µ}(φ) is left invariant under J_U(W)(F) and the centre 𝔸 acts on it by ψ.

**Checks.**

- `TauCeti.Metaplectic.unitaryJacobiGroup_zero` (degenerate): For W = 0, J_U(0) is the centre k₀ and ω_{ψ,µ} is the character ψ, independent of µ.
- `TauCeti.Metaplectic.unitaryJacobiGroup_restrict` (compatibility): On H(W₀) the representation is the Schrödinger representation ρ_ψ of MP.0/schroedinger-model for the chosen polarization; on U(W) it is the Weil representation of MP.3/unitary-splitting for the pair (V₁, W).
- `TauCeti.Metaplectic.unitaryJacobiGroup_line` (computation): For k = ℂ, k₀ = ℝ and W = ℂ with ⟨x, y⟩ = i x ȳ, W₀ = ℝ² with symplectic form Tr_{ℂ/ℝ}(i x ȳ) = −2 Im(x ȳ), which takes the value 2 on (1, i); U(W) = S¹ acts by rotations and is SO(2) ⊂ SL₂(ℝ) = Sp(W₀).
- `TauCeti.Metaplectic.unitaryJacobiGroup_not_product` (non-example): The direct product H(W₀) × U(W) with the same operators is not a representation: for g acting nontrivially on W₀ the operators ρ_ψ(h) and ω(s(g)) do not commute, by covariance.
- `TauCeti.Metaplectic.unitaryJacobiGroup_not_doubleCover` (non-example): The splitting cannot be taken into the metaplectic double cover: for k = ℂ, k₀ = ℝ and dim W = 1, the double cover Mp₂(ℝ) restricted to U(W) = SO(2) is the connected double cover of the circle, which has no continuous section. Splittings exist only into the scalar extension S_ψ, and each requires a choice of µ (GGP §12(ii)).

**Acceptance.**

- For W = 0, J_U(W) is the centre k₀ and ω_{ψ,µ} is the character ψ.
- For dim_k W = 1, W₀ is a symplectic plane and U(W) = k¹ = {z : zσ(z) = 1} acts on it as an anisotropic torus of SL₂(k₀); for k = ℂ, k₀ = ℝ it is the maximal compact subgroup SO(2) of SL₂(ℝ).

**Prerequisites.** [`MP.0/topological-heisenberg`](#n-mp-0-topological-heisenberg), [`MP.0/isometry-action`](#n-mp-0-isometry-action), [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model), [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), [`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product), [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), `mathlib:SemidirectProduct`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/UnitaryJacobi`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-fourier-jacobi-period"></a>

### Fourier–Jacobi coefficients along Heisenberg parabolics, symplectic and unitary — `MP.6/fourier-jacobi-period`

construction · **New in the whole-roadmap pass**

**Statement.** Let F be a number field and let W ⊂ V be nondegenerate spaces over E of one of the two Fourier–Jacobi types: both symplectic (E = F), or both skew-Hermitian for a quadratic extension E/F. Assume W^⊥ = X ⊕ X^∨ with X, X^∨ isotropic and in duality, dim_E X = n ≥ 0. Let H = N ⋊ G(W) ⊂ G(V) be the subgroup attached to a full isotropic flag in X: N is the unipotent radical of the parabolic stabilizing the flag, λ the G(W)-invariant generic character of N, and N → H(W₀) the G(W)-equivariant homomorphism to the Heisenberg group of W₀ (W over F with the form 2⟨ , ⟩ in the symplectic case and Tr_{E/F}⟨ , ⟩ in the skew-Hermitian case). Through MP.6/jacobi-group (symplectic case, on the metaplectic cover of Sp(W)) or MP.6/unitary-jacobi-group and a character µ (skew-Hermitian case), the theta functions θ(φ), φ ∈ S(Y(𝔸)), pull back to H(F)\H(𝔸); put θ_ν(φ) = θ(φ) · λ. For a cuspidal automorphic form f on G(V)(𝔸) (and, in the symplectic case, the appropriate cover), the Fourier–Jacobi coefficient is FJ(f, φ)(g) = ∫_{N(F)\N(𝔸)} f(ng) θ_ν(φ)(ng) dn for g in G(W)(𝔸) (its metaplectic cover in the symplectic case), and the Fourier–Jacobi period of f ⊗ f′ ⊗ φ, for f′ an automorphic form on G(W) (a genuine form on the metaplectic cover of Sp(W) in the symplectic case, so that f′ · θ_ν(φ) descends), is 𝒫(f, f′, φ) = ∫_{H(F)\H(𝔸)} f(h) f′(h) θ_ν(φ)(h) dh. FJ(f, φ) is left G(W)(F)-invariant and rapidly decreasing, the period converges absolutely, and 𝒫(f, f′, φ) = ∫_{G(W)(F)\G(W)(𝔸)} FJ(f, φ)(g) f′(g) dg.

**Hypotheses.**

- Fourier–Jacobi type in the sense of GGP §§12 and 23: V and W both symplectic, or both skew-Hermitian, with W^⊥ split of even dimension 2n; n = 0 is allowed (then N = 1 and H = G(W) = G(V)).
- f is a smooth cusp form; f′ is of moderate growth; the measure on N(F)\N(𝔸) is the probability measure and the measure on G(W)(F)\G(W)(𝔸) is fixed in advance. In the skew-Hermitian case µ is an automorphic character of 𝔸_E^× with µ|_{𝔸^×} = ω_{E/F}.
- The pairing convention is GGP's (f · θ, no complex conjugate). Sources that pair with the conjugate theta function use the data (ψ⁻¹, µ⁻¹), since complex conjugation carries ω_{ψ,µ} to ω_{ψ⁻¹,µ⁻¹} (MP.2/character-and-dual); the two conventions must not be mixed.

**Proof outline.**

1. GGP §12 constructs, for n ≥ 1, the G(W)-equivariant homomorphism from N to H(W₀) and the generic character λ; with the Jacobi group of MP.6/jacobi-group, or MP.6/unitary-jacobi-group and µ, this gives a homomorphism from H to the Jacobi group (on the metaplectic cover in the symplectic case).
2. Pull back Weil's theta functions (MP.5/theta-kernel, MP.6/unitary-jacobi-group) and multiply by λ; the result is smooth and of uniform moderate growth on H(F)\H(𝔸) (MP.5/theta-growth-transfer).
3. N(F)\N(𝔸) is compact (AF.3/unipotent-quotient-compact), so FJ(f, φ) is defined; left G(W)(F)-invariance follows from the invariance of f and of θ_ν under H(F). A cusp form is rapidly decreasing (AF.3/cusp-form-rapid-decay), which dominates the moderate growth of θ_ν and f′; hence the period converges absolutely and Fubini over N gives the stated equality.
4. Equivariance: replacing (f, f′, φ) by their translates under h′ ∈ H(𝔸) through R(h′), R(h′) and ν(h′) leaves 𝒫 unchanged; FJ(R(g′)f, ω(g′)φ)(g) = FJ(f, φ)(g g′) for g′ in G(W)(𝔸).
5. Integrating first over the centre of the Heisenberg group against ψ⁻¹ isolates the ψ-isotypic part of f, the central Fourier–Jacobi coefficient of MP.6/fourier-jacobi-extraction; FJ pairs that part with θ_ν(φ).
6. Degenerate cases: if W = 0, ν is a generic character of the unipotent radical of a Borel subgroup and FJ is the corresponding Whittaker coefficient (MP.5/metaplectic-constant-and-whittaker); if n = 0, FJ(f, φ) = f · θ(φ) on G(W) = G(V).

**Sources.**

- GGP12, §23, pp. 86–89: The global Fourier–Jacobi coefficients F(ν_ψ) (symplectic case) and F(ν_{ψ,µ}) (skew-Hermitian case): integrals over H(F)\H(𝔸) of a cusp form against the automorphic realization of ν = ω ⊗ λ.
- GGP12, §12, pp. 46–52: The subgroup H = N ⋊ G(W), the generic character λ and the homomorphism N → H(W₀), including the degenerate cases W = 0 (a generic character of the unipotent radical of a Borel subgroup) and n = 0 (H = G(W)).

**Uses.**

- Gan–Gross–Prasad, §23 and §24: the Fourier–Jacobi periods F(ν_ψ) and F(ν_{ψ,µ}) of the global restriction problem, whose nonvanishing on tempered cuspidal π is related to central L-values.
- AutomorphicCongruences L2 and L2s: degenerate and nondegenerate Fourier–Jacobi coefficients of Eisenstein series on unitary groups are instances of FJ(f, φ) (RT-AREA-automorphic-1/20).
- QSeriesPartitionsAndMockModularForms:QM.1: Fourier–Jacobi coefficients of Siegel-type forms in rank one are the symplectic case with n = 1.
- MP.8 (BFH genus-two Jacobi forms): the BFH Jacobi functions are central Fourier–Jacobi coefficients in the sense of MP.6/fourier-jacobi-extraction; this node adds the theta-paired coefficient that MP.8 does not need.

**API.**

- `TauCeti.Metaplectic.fourierJacobiCoeff_automorphic` (characterisation): FJ(f, φ) is left G(W)(F)-invariant, smooth and rapidly decreasing on a Siegel domain.
- `TauCeti.Metaplectic.fourierJacobiCoeff_equivariant` (functoriality): FJ(R(g′)f, ω(g′)φ) = R(g′) FJ(f, φ) for g′ in G(W)(𝔸), and FJ(R(n′)f, ν(n′)φ) = FJ(f, φ) for n′ in N(𝔸).
- `TauCeti.Metaplectic.fourierJacobiPeriod_eq_integral` (relation): 𝒫(f, f′, φ) = ∫_{[G(W)]} FJ(f, φ) f′, the inner integral over the compact N(F)\N(𝔸) with probability measure.
- `TauCeti.Metaplectic.fourierJacobiCoeff_central` (compatibility): FJ(f, φ) depends only on the ψ-isotypic central coefficient of f along the Heisenberg centre (MP.6/fourier-jacobi-extraction).
- `TauCeti.Metaplectic.fourierJacobiCoeff_whittaker` (example): For W = 0, FJ(f) is the Whittaker coefficient of f for the generic character λ.
- `TauCeti.Metaplectic.fourierJacobiCoeff_equalRank` (example): For n = 0, FJ(f, φ) = f · θ(φ) on G(W)(𝔸).

**Checks.**

- `TauCeti.Metaplectic.fourierJacobiCoeff_zero` (degenerate): FJ(0, φ) = 0 and FJ(f, 0) = 0.
- `TauCeti.Metaplectic.fourierJacobiCoeff_sl2` (computation): For V a symplectic plane and W = 0, so G(V) = SL₂ and N is the upper unipotent group, FJ(f)(g) = ∫_{F\𝔸} f(n(x)g) ψ(x) dx is the Whittaker coefficient of f for the character ψ.
- `TauCeti.Metaplectic.fourierJacobiCoeff_equalRank_test` (compatibility): For n = 0 the period 𝒫(f, f′, φ) is the integral of f f′ θ(φ) over G(W)(F)\G(W)(𝔸), the equal-rank pairing of the GGP Fourier–Jacobi case.
- `TauCeti.Metaplectic.fourierJacobiCoeff_needs_theta` (non-example): Integrating f against ψ⁻¹ over the Heisenberg centre alone does not give a scalar automorphic form on G(W): that coefficient transforms under H(W₀)(𝔸) by the infinite-dimensional representation ρ_ψ, and only the pairing with θ_ν(φ) produces a function on G(W)(F)\G(W)(𝔸).

**Acceptance.**

- W = 0 recovers the Whittaker coefficient of f for a generic character; n = 0 recovers the equal-rank pairing ∫ f f′ θ(φ).
- The skew-Hermitian construction depends on µ only through the character of U(W) by which the splitting changes (MP.6/unitary-jacobi-group).

**Prerequisites.** [`MP.6/unitary-jacobi-group`](#n-mp-6-unitary-jacobi-group), [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/fourier-jacobi-extraction`](#n-mp-6-fourier-jacobi-extraction), [`MP.5/theta-kernel`](#n-mp-5-theta-kernel), [`MP.5/theta-growth-transfer`](#n-mp-5-theta-growth-transfer), [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `AutomorphicFormsOnReductiveGroups:AF.3/unipotent-quotient-compact`, `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay`.

**Library.** module `TauCeti/NumberTheory/AutomorphicForms/FourierJacobi`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-6-classical-jacobi-forms"></a>

### Classical Jacobi forms of lattice index and their theta decomposition — `MP.6/classical-jacobi-forms`

definition · **New in the whole-roadmap pass**

**Statement.** Let F be a symmetric positive definite half-integral n × n matrix (2F integral with even diagonal) and F[x] = xᵗFx. For a subgroup Γ ⊂ Mp(2,ℤ) of finite index, J_n(Γ) = Γ ⋉ (ℤⁿ × ℤⁿ), with (α, (λ, µ))(α′, (λ′, µ′)) = (αα′, (λ, µ)A′ + (λ′, µ′)) and (λ, µ)A = (aλ + cµ, bλ + dµ) for A = [a, b; c, d] the image of α′. For k ∈ ½ℤ, J_n(Γ) acts on the right on functions on ℍ × ℂⁿ by φ|_{k,F}(A, w)(τ, z) = w(τ)^{−2k} e(−c F[z]/(cτ + d)) φ(Aτ, z/(cτ + d)) and φ|_{k,F}[λ, µ](τ, z) = e(τ F[λ] + 2zᵗFλ) φ(τ, z + λτ + µ). A Jacobi form of weight k, index F and type (Γ, ρ), for a finite-dimensional representation ρ of Γ on V, is a holomorphic φ : ℍ × ℂⁿ → V with φ|_{k,F} g = ρ(g)φ for g ∈ J_n(Γ) (ℤⁿ × ℤⁿ acting trivially on V) such that, for every α ∈ Mp(2,ℤ), φ|_{k,F}α = Σ c(l, r) q^l e(zᵗr) over l ∈ ℚ and r ∈ ℤⁿ with 4l − F⁻¹[r] ≥ 0; cusp forms have 4l − F⁻¹[r] > 0. With the theta functions ϑ_{F,x}(τ, z) = Σ_{r ≡ x mod 2Fℤⁿ} e(τ F⁻¹[r]/4 + rᵗz), every Jacobi form is uniquely Σ_{x ∈ ℤⁿ/2Fℤⁿ} h_x(τ) ϑ_{F,x}(τ, z), and when ρ has finite image the map φ ↦ (h_x) is an isomorphism J_{k,F}(Γ, ρ) ≅ (M_{k−n/2} ⊗ W(F)^*) ⊗_{ℂ[Mp(2,ℤ)]} Ind ρ. Here W(F) is the Weil representation of Mp(2,ℤ) on ℂ[ℤⁿ/2Fℤⁿ] for the quadratic form x ↦ F⁻¹[x]/4 mod ℤ; it is ρ_{L_F} for the even lattice L_F = (ℤⁿ, 2F) and the complex conjugate of the representation ω_{L_F} of MP.4/finite-weil-representation. Consequently J_{k,F}(Γ, ρ) = 0 for k < n/2, and J_{n/2,F}(Γ, ρ) ≅ Hom_{Mp(2,ℤ)}(W(F), Ind ρ).

**Hypotheses.**

- F positive definite and half-integral in the even-diagonal sense; a half-integral scalar index such as 1/2 is not covered and is reached by rescaling z (ϑ(τ, 2z) has index 2).
- k ∈ ½ℤ; for k ∉ ℤ the slash operator uses the Mp(2,ℤ) factor w(τ)^{−2k}; the decomposition theorem needs ρ of finite image (so that the components are modular forms on a subgroup of finite index).
- W(F) is normalized by (T, 1)e_x = e(F⁻¹[x]/4)e_x and (S, √τ)e_x = σ|D_F|^{−1/2} Σ_y e(−B(y, x)) e_y with σ = |D_F|^{−1/2} Σ_x e(−F⁻¹[x]/4) = e(−n/8) (Milgram).

**Proof outline.**

1. The group law and the right action are checked on generators. Composing [λ, µ] and then [λ′, µ′] gives [λ + λ′, µ + µ′] up to the phase e(2µ′ᵗFλ) = e(µ′ᵗ(2F)λ), which is 1 because 2F is integral; this is why the integral Jacobi group needs no central coordinate.
2. Invariance under ℤⁿ × ℤⁿ makes the coefficients c(l, r) depend only on 4l − F⁻¹[r] and on r mod 2Fℤⁿ, which groups the expansion into Σ_x h_x ϑ_{F,x}; uniqueness is the linear independence of the ϑ_{F,x} (their orthogonality, the n-variable form of the Gaussian pairing of MP.8/theta-pairing and of MP.6/jacobi-theta-decomposition-interface).
3. The span Θ(F) of the ϑ_{F,x} is stable under |_{n/2,F} and is isomorphic to W(F)^* by λ ↦ Σ λ(x)ϑ_{F,x} (Poisson summation gives the S-transformation); the components h_x therefore form a vector-valued form of weight k − n/2 for W(F)^* ⊗ Ind ρ, and the cusp conditions match.
4. W(F) = ρ_{L_F}: the discriminant module of L_F = (ℤⁿ, 2F) is (2F)⁻¹ℤⁿ/ℤⁿ ≅ ℤⁿ/2Fℤⁿ with q(y) = yᵗFy = F⁻¹[x]/4 for y = (2F)⁻¹x; complex conjugation of ω_{L_F} is recorded on MP.4/finite-weil-representation.
5. Weight k < n/2 leaves M_{k−n/2} = 0; at k = n/2 the constants give the Hom description.

**Sources.**

- Skoruppa07, §4, pp. 10–14: the Jacobi group J_n(Γ), the actions |_{k,F}, the Definition, Lemma 1, Theorem 5 and its Corollary: Defines Jacobi forms of half-integral weight and matrix index with a typus (Γ, V) and proves that they are vector-valued modular forms of weight k − n/2 for W(F)^* tensored with the induced module.
- Skoruppa07, §2, pp. 4–5 (ϑ_{F,x}) and §3, pp. 5–8 (Weil representations W(M), D_F, σ(M), Milgram's formula): The theta functions with characteristic and the Weil representation of Mp(2,ℤ) of a finite quadratic module by its action of T̃ and S̃, with σ(D_F) = e(−signature(2F)/8).

**Uses.**

- Skoruppa, Jacobi forms of critical weight, §4: the Jacobi group J_n(Γ), the actions |_{k,F}, Jacobi forms of type (Γ, V) and Theorem 5 (Jacobi forms as vector-valued forms for W(F)^*).
- QSeriesPartitionsAndMockModularForms:QM.1: QM.1's Jacobi forms, Jacobi cusp forms, theta functions of index m and theta decomposition are the case n = 1; its weak and weakly holomorphic variants relax the condition 4l − F⁻¹[r] ≥ 0 and are added there.
- MP.8/bfh-jacobi-specialization and MP.8/theta-decomposition: the BFH genus-two Jacobi functions have matrix index on the Siegel space; their rank-one analogue and the n-variable theta decomposition are this node.
- RT-AREA-automorphic-1/20: Jacobi forms of given weight and index with multiplier systems, in the generality QM.1 needs, planned once before the consumers.

**API.**

- `TauCeti.Metaplectic.JacobiZ.mul_def` (simp): (α, (λ, µ))(α′, (λ′, µ′)) = (αα′, (λ, µ)A′ + (λ′, µ′)).
- `TauCeti.Metaplectic.JacobiZ.slash_mul` (structure): |_{k,F} is a right action of J_n(Γ); (1, −1) acts by (−1)^{2k}.
- `TauCeti.Metaplectic.JacobiZ.jacobiForm_mem` (characterisation): φ ∈ J_{k,F}(Γ, ρ) iff φ is holomorphic, φ|_{k,F}g = ρ(g)φ on J_n(Γ), and every φ|_{k,F}α has coefficients supported on 4l − F⁻¹[r] ≥ 0.
- `TauCeti.Metaplectic.JacobiZ.thetaF` (data): ϑ_{F,x}(τ, z) = Σ_{r ≡ x mod 2Fℤⁿ} e(τ F⁻¹[r]/4 + rᵗz), depending only on x mod 2Fℤⁿ.
- `TauCeti.Metaplectic.JacobiZ.thetaDecomposition` (equivalence): For ρ of finite image, J_{k,F}(Γ, ρ) ≅ (M_{k−n/2} ⊗ W(F)^*) ⊗_{ℂ[Mp(2,ℤ)]} Ind ρ, compatibly with the cusp subspaces.
- `TauCeti.Metaplectic.JacobiZ.weilRep_eq_lattice` (compatibility): W(F) = ρ_{L_F} = conj(ω_{L_F}) for L_F = (ℤⁿ, 2F), with ω_{L_F} the finite Weil representation of MP.4.
- `TauCeti.Metaplectic.JacobiZ.eq_zero_of_lt` (other): J_{k,F}(Γ, ρ) = 0 for k < n/2, and J_{n/2,F}(Γ, ρ) ≅ Hom_{Mp(2,ℤ)}(W(F), Ind ρ).
- `TauCeti.Metaplectic.JacobiZ.toJacobiSpace` (compatibility): J_{k,F}(Γ, ρ) is the rank-one, index-F instance of the Jacobi spaces of MP.6/jacobi-spaces, read in the coordinates (τ, z), with the Heisenberg centre acting through the character attached to F.

**Checks.**

- `TauCeti.Metaplectic.JacobiZ.below_critical` (degenerate): J_{k,F}(Γ, ρ) = 0 whenever k < n/2; in particular J_{0,F} = 0 for every F of size n ≥ 1.
- `TauCeti.Metaplectic.JacobiZ.theta_index_one` (computation): For n = 1 and F = (1), ℤ/2Fℤ = ℤ/2, the two theta functions are ϑ_{1,0} = Σ_{r even} q^{r²/4}ζ^r and ϑ_{1,1} = Σ_{r odd} q^{r²/4}ζ^r, and σ(D_1) = e(−1/8).
- `TauCeti.Metaplectic.JacobiZ.eichlerZagier` (compatibility): For n = 1, F = (m), k ∈ ℤ, Γ = SL(2,ℤ) and ρ trivial, J_{k,F}(Γ, ρ) is Eichler–Zagier's space J_{k,m} of Jacobi forms of weight k and index m.
- `TauCeti.Metaplectic.JacobiZ.halfIndex_excluded` (non-example): The Jacobi theta function ϑ(τ, z) has index 1/2, which is not half-integral in the even-diagonal sense, so it is not a Jacobi form here; ϑ(τ, 2z) is one, of weight 1/2 and index 2 with the character ε³ of Mp(2,ℤ) (ε(A, w) = η(Aτ)/(w(τ)η(τ))).

**Acceptance.**

- For n = 1, F = (m), k ∈ ℤ, Γ = SL(2,ℤ) and ρ trivial, the definition is Eichler–Zagier's J_{k,m}, and ϑ_{m,x} are their theta functions Σ_{r ≡ x (2m)} q^{r²/4m} ζ^r.
- For F = (1), σ(D_1) = 2^{−1/2}(1 + e(−1/4)) = e(−1/8), matching Milgram's formula with signature 1.

**Prerequisites.** [`MP.6/metaplectic-modular-group`](#n-mp-6-metaplectic-modular-group), [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces), [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface), [`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`.

**Library.** module `TauCeti/NumberTheory/ModularForms/Jacobi/Basic`, namespace `TauCeti.Metaplectic`.

<a id="layer-mp-7"></a>

## MP.7 — Half-integral weight, metaplectic Fourier coefficients and twists

**Layer statement.** Compare adelic genuine forms on the rank-one cover with classical half-integral-weight forms for the relevant congruence subgroups and multiplier systems. Define the metaplectic Eisenstein/Whittaker kernels used in Bump–Friedberg–Hoffstein and Friedberg–Hoffstein, including ramified local characters and test functions. Prove their transformation, Fourier coefficient and Euler-factor identities. Export the input to BSD.2, which proves the double-Dirichlet-series continuation, residues and nonvanishing with prescribed local conditions. A half-integral weight formal symbol is not a replacement for this cover or these kernels; no Goldfeld density assertion is imported.

**Status.** Planned. 52 targets (1 new in the whole-roadmap pass).

What remains for this layer:

- The 51 accepted targets of MP.7 are those of the part MetaplecticAutomorphicForms--MP.0; this packet adds the product formula and nonvanishing of jacobiTheta, moved down from QSeriesPartitionsAndMockModularForms QM.1. R4 re-points the seven QM citations of MP.7 to it and to AL.0 and AS.0, for which the two requests of this packet ask. R1 moves the two BFH export interfaces to MP.8.
- (accepted part) Three-cusp L² Maass spaces, the Fourier coefficient maps and the source arithmetic trace objects remain as the part records them.

**Planets.** Theta multiplier ([`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier)); Kohnen plus space ([`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space)); Half weight resolvent ([`MP.7/half-weight-resolvent`](#n-mp-7-half-weight-resolvent)); Kohnen–Salié identity ([`MP.7/kohnen-salie-identity`](#n-mp-7-kohnen-salie-identity)); Shimura correspondence ([`MP.7/shimura-eigenline-bijection`](#n-mp-7-shimura-eigenline-bijection)); Half integral weight forms ([`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight)).

**Dependencies.**

- Inside the roadmap: MP.5 (38 citations), MP.6 (1 citations), MP.8 (9 citations).
- AdelicAlgebraicGroups:AA.1: `AdelicAlgebraicGroups:AA.1`.
- AutomorphicFormsOnReductiveGroups:AF.1: `AutomorphicFormsOnReductiveGroups:AF.1`.
- AutomorphicFormsOnReductiveGroups:AF.2: `AutomorphicFormsOnReductiveGroups:AF.2`.
- AutomorphicFormsOnReductiveGroups:AF.3: `AutomorphicFormsOnReductiveGroups:AF.3`.
- AutomorphicLFunctionsAndLocalFactors:AL.0: `AutomorphicLFunctionsAndLocalFactors:AL.0`.
- AutomorphicSpectralTheory:AS.0: `AutomorphicSpectralTheory:AS.0`, `AutomorphicSpectralTheory:AS.0/dit-112`.
- AutomorphicSpectralTheory:AS.1: `AutomorphicSpectralTheory:AS.1`.
- ClassicalArithmeticCompletion:CA.4: `ClassicalArithmeticCompletion:CA.4/theta-product-specialisations`.
- QSeriesPartitionsAndMockModularForms:QM.1: `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing`.
- QSeriesPartitionsAndMockModularForms:QM.2: `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`, `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`.
- QSeriesPartitionsAndMockModularForms:QM.3: `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`.
- Tau Ceti TauCetiRoadmap/FuchsianOrbifolds: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`.
- Tau Ceti TauCetiRoadmap/ModularForms: `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.
- Pinned libraries: 7 declarations, listed under each target.

**Consumers outside the roadmap.** `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-multiplier-gamma0-four`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-multiplier-is-multiplier-system`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-cusp-form`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-form`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-rank-one-specialisation`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-decomposition-weil-representation`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-eta-multiplier-matches-shimura`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-multiplier-is-multiplier-system`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-transformation-theta-group`, `QSeriesPartitionsAndMockModularForms:QM.1/weak-jacobi-form`, `QSeriesPartitionsAndMockModularForms:QM.1/weakly-holomorphic-jacobi-form`, `QSeriesPartitionsAndMockModularForms:QM.5/lawrence-zagier-theta-transformation`, `QSeriesPartitionsAndMockModularForms:QM.5/nonholomorphic-eichler-integral`, `QSeriesPartitionsAndMockModularForms:QM.5/nonholomorphic-eichler-nontangential-limit`, `QSeriesPartitionsAndMockModularForms:QM.5/nonholomorphic-eichler-transformation`, `QSeriesPartitionsAndMockModularForms:QM.5/twisted-cusp-form-l-function`, `QSeriesPartitionsAndMockModularForms:QM.5/zagier-trace-form`, `QSeriesPartitionsAndMockModularForms:QM.5/zagier-trace-form-recursions`, `RankZeroOneBSD:BSD.2/prescribed-local-conditions-value-branch`, `RankZeroOneBSD:BSD.2/twist-series-residue`.

**Acceptance tests of the layer.**

- Theta multiplier: Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.
- Kohnen plus space: Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.
- Half weight resolvent: Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.
- Kohnen–Salié identity: Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.
- Shimura correspondence: Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.
- Half integral weight forms: The half-weight unitary Laplace eigenvalue is1/4+(r/2)².

<a id="n-mp-7-theta-multiplier"></a>

### Theta multiplier — `MP.7/theta-multiplier`

definition · from the MP.0 part · planet “Theta multiplier”

**Statement.** For γ∈Γ₀(4), J(γ,z)=θ(γz)/θ(z), where θ=y^(1/4)Σ_ne(n²z). Prove θ(z)≠0, |J|=1 and the cocycle law, using the exact principal square-root branch and Kronecker multiplier.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the nonvanishing scalar theta seed from QM.1 and its exact Γ₀(4) transformation.
2. Conjugate by y^{1/4}; the absolute automorphy factor cancels, leaving the unitary multiplier and its cocycle.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §5, (5.14) and the next display, p964: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/96: Define the multiplier inverse in a Poincaré sum.

**API.**

- `TauCeti.Metaplectic.thetaMultiplier_thetaRatio` (constructor): Form J from the nonvanishing theta seed.
- `TauCeti.Metaplectic.thetaMultiplier_cocycle` (relation): J(γδ, z)=J(γ,δz)J(δ, z).
- `TauCeti.Metaplectic.thetaMultiplier_unitary` (characterisation): |J(γ, z)|=1, with the precise branch giving the Γ₀(4)theta multiplier.

**Checks.**

- `TauCeti.Metaplectic.thetaMultiplier_test1` (computation): J(1, z)=1.
- `TauCeti.Metaplectic.thetaMultiplier_test2` (degenerate): A phase change of the theta seed does not change J.
- `TauCeti.Metaplectic.thetaMultiplier_test3` (non-example): Replacing the principal square-root by independent local choices can violate the cocycle law.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing`, [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `mathlib:CongruenceSubgroup.Gamma0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R4: replace `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing` by [`MP.7/jacobi-theta-nonvanishing`](#n-mp-7-jacobi-theta-nonvanishing). verified: θ(z) = Σ e(n²z) = jacobiTheta(2z), and MP.7/jacobi-theta-nonvanishing states its nonvanishing on the whole upper half plane. The first proof step should read 'use MP.7/jacobi-theta-nonvanishing and the Γ₀(4) transformation of θ'.

<a id="n-mp-7-half-weight-maass-space"></a>

### Weight-one-half Maass space — `MP.7/half-weight-maass-space`

definition · from the MP.0 part

**Statement.** Let Δ_{1/2}=−y²(∂_x²+∂_y²)+(i/2)y∂_x. Then (Δ_{1/2}F)(γz)=J(γ,z)(Δ_{1/2}F)(z) for γ∈Γ₀(4) when F has weight 1/2. A Maass form of weight 1/2 for Γ₀(4) is a smooth F of weight 1/2, i.e. F(γz)=J(γ,z)F(z), with Δ_{1/2}F=λF, where λ=1/4+(r/2)². A Maass cusp form is also in L²(Γ₀(4)\H,dμ) and has zero constant term at each of the three cusps. V_r is the space of Maass cusp forms of weight 1/2 with λ=1/4+(r/2)². Its members have expansions (8.8): ψ(z)=Σ_{n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use QM.3’s differential operator and compute covariance through the exact unitary multiplier.
2. Impose the eigenfunction, all-cusp, smoothness and Petersson-L² conditions on actual functions.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, printed975, PDF27: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/81: Provide the actual ambient eigenspace for the plus condition.

**API.**

- `TauCeti.Metaplectic.halfWeightMaass_automorphy` (projection): F(γz)=J(γ, z)F(z).
- `TauCeti.Metaplectic.halfWeightMaass_allCusps` (characterisation): Cuspidality means zero constant term at each of ∞,0,1/2, in normalized cusp coordinates.
- `TauCeti.Metaplectic.halfWeightMaass_eigenParameter` (compatibility): Weight-one-half eigenvalue is 1/4+(r/2)² when its Shimura lift has 1/4+r².

**Checks.**

- `TauCeti.Metaplectic.halfWeightMaass_test1` (computation): Vanishing only at ∞ is insufficient without a proved plus-space cusp comparison.
- `TauCeti.Metaplectic.halfWeightMaass_test2` (degenerate): An ordinary Γ-invariant function does not satisfy the genuine half-weight condition automatically.
- `TauCeti.Metaplectic.halfWeightMaass_test3` (non-example): Using the weight-zero parameter r directly in W produces the wrong eigenvalue.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier), `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`, [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R4: replace `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian` by `AutomorphicSpectralTheory:AS.0`. conditional on the AS.0 request: the target uses Δ_{1/2} = −y²(∂_x² + ∂_y²) + (i/2) y ∂_x and its covariance under weight-1/2 slash operators; the covariance under the theta multiplier stays in this node.

<a id="n-mp-7-half-weight-fourier-expansion"></a>

### Whittaker Fourier expansion — `MP.7/half-weight-fourier-expansion`

theorem · from the MP.0 part

**Statement.** A cuspidal weight-one-half eigenform has F(z)=Σ_{n≠0}b(n)W_{sgn(n)/4,ir/2}(4π|n|y)e(nx), with convergence and coefficient recovery. The spectral parameter is r/2 here, versus r in weight zero.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Integrate in the periodic x variable to recover coefficients.
3. Solve the resulting Whittaker ODE and use the cusp/L² condition to eliminate growing terms; apply the supplier’s differentiated convergence estimate.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Theorem 4, p965 (display before (5.16)); (8.8), p976; (10.1), p981: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `AutomorphicSpectralTheory:AS.0/dit-112`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-half-weight-eisenstein"></a>

### Completed half-weight Eisenstein family — `MP.7/half-weight-eisenstein`

construction · from the MP.0 part

**Statement.** Construct E*_{1/2}(z,s) with constant term Λ(2s)2^s y^(s/2+1/4)+Λ(2−2s)2^(1−s)y^(3/4−s/2) and Whittaker parameter s/2−1/4. Prove automorphy and meromorphic continuation; its parameter differs from that in F_{1/2,n}(z,w).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Define the three-cusp Eisenstein family in its convergence half plane, then project to plus space in the fixed order.
2. Compute the constant term and its normalized functional equation; identify each nonzero coefficient in the Whittaker basis.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §5, unnumbered display after (5.14) and the Shimura relation, p964, quoting [16, Prop. 2 p. 959] (coefficient evaluation from [16, Lemma 4, (2.23)–(2.25), pp. 961–962]); PDF p.16: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/79: Produce the two Dirichlet L-factors through half-weight coefficients.

**API.**

- `TauCeti.Metaplectic.halfWeightEisenstein_initialSeries` (constructor): Construct the Eisenstein family on Γ₀(4) with the theta multiplier and its prescribed cusp data.
- `TauCeti.Metaplectic.halfWeightEisenstein_constantTerms` (simp): Expose both powers y^(s/2+1/4) and y^(3/4−s/2), with 2^s and 2^(1−s).
- `TauCeti.Metaplectic.halfWeightEisenstein_fourierTransport` (compatibility): Its W parameter s/2−1/4 equals w−1/2 under w=s/2+1/4.

**Checks.**

- `TauCeti.Metaplectic.halfWeightEisenstein_test1` (computation): Zero completed-zeta and coefficient functions give the zero Fourier-series adapter.
- `TauCeti.Metaplectic.halfWeightEisenstein_test2` (degenerate): With all nonconstant coefficients zero, the series equals its explicitly displayed constant-term expression.
- `TauCeti.Metaplectic.halfWeightEisenstein_test3` (non-example): Changing b(0,s) leaves the series unchanged because index0 is excluded.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicSpectralTheory:AS.1`, [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier), [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `mathlib:Complex.Gamma`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-fundamental-eisenstein-coefficient"></a>

### Fundamental-discriminant Eisenstein coefficient — `MP.7/fundamental-eisenstein-coefficient`

construction · from the MP.0 part

**Statement.** For fundamental d, b(d,s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d), where Λ(s,χ_d)=π^(−s/2)Γ((s+α)/2)|d|^(s/2)L(s,χ_d), α=(1−sgn d)/2. Compare with Mathlib’s gamma normalization, including its π^(−α/2) difference.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Express the coefficient at a fundamental discriminant as its quadratic Dirichlet series.
2. Insert the native completed Dirichlet L-function and the exact sign-dependent Gamma and |d| factors.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §5, (5.13) (Λ(s,χ_d)) and the unnumbered definition of b(d,s), p964: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/78: Extend fundamental coefficients to all discriminants.

**API.**

- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_fundamentalValue` (simp): b(d, s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d).
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_parityFactor` (compatibility): The paper completion is |d|^(s/2)π^(α/2) times Mathlib completed L.
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_product` (relation): The product of two such coefficients has factor (4π)^(−1/2)|D|^(−3/4).

**Checks.**

- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test1` (computation): d=1 gives the completed zeta factor.
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test2` (degenerate): At d=−3 the coefficient prefactor uses the positive magnitude3 raised to −3/4.
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test3` (non-example): At d=d′=1, multiplying the product of coefficient adapters by 2√π recovers Λ(1,s)²; this tests the normalization on the construction.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0`, [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `mathlib:Complex.Gamma`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-eisenstein-divisor-coefficients"></a>

### Half-weight Eisenstein coefficient expansion — `MP.7/eisenstein-divisor-coefficients`

theorem · from the MP.0 part

**Statement.** The nonconstant coefficients of E*_{1/2} are b(n,s), supported on n≡0,1 mod4. For fundamental d and m>0, mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Compute local divisor factors for d times a square and use the plus-space Hecke relation.
2. Match the two Whittaker/Eisenstein normalizations, retaining m and n^{-3/2}.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §5, the two unnumbered displays after (5.14) (Shimura relation for b(dm²,s) and E*_{1/2}), p964: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-eisenstein`](#n-mp-7-half-weight-eisenstein), [`MP.7/fundamental-eisenstein-coefficient`](#n-mp-7-fundamental-eisenstein-coefficient), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-eisenstein-product-normalization"></a>

### Eisenstein product normalization — `MP.7/eisenstein-product-normalization`

theorem · from the MP.0 part

**Statement.** For coprime fundamental d,d′ and D=d′d, Λ(s,χ_{d′})Λ(s,χ_d)=2√π|D|^(3/4)b(d′,s)b(d,s). This is a bilinear product without complex conjugation, unlike Theorem4.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Multiply the two fundamental coefficient formulas.
2. Cancel the two (4π)^{-1/4} factors against 2sqrt(π), retaining |D|^{3/4} and the bilinear product.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (5.15): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/fundamental-eisenstein-coefficient`](#n-mp-7-fundamental-eisenstein-coefficient), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-theta-residue-normalization"></a>

### Theta residue and Petersson normalization — `MP.7/theta-residue-normalization`

theorem · from the MP.0 part

**Statement.** Res_{s=1}E*_{1/2}(z,s) = ½θ(z) (the pole comes from Λ(2−2s) in the constant term and from Λ(s,χ_1)=Λ(s) in the coefficients b(m²,s); checked). The paper states ⟨½θ,½θ⟩ = 6 citing [7], but with the paper's product ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ one has ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), hence ⟨½θ,½θ⟩ = π/2. The number 6 = [Γ:Γ_0(4)] is (3/π)⟨θ,θ⟩, i.e. ⟨θ,θ⟩ for the product normalized by area(Γ\H)=π/3. Rescaling F from ⟨F,F⟩=1 to ⟨F,F⟩=6 does turn 12 into 2 on the left of (5.16). The remark is heuristic and used in no proof.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Extract the pole at s=1 in the constant term and square-index coefficients.
2. Use the source’s actual hyperbolic measure and Rankin–Selberg norm comparison: ||θ||²=2π and ||θ/2||²=π/2. Record the printed 6 as source issue DIT-E22, not as the Petersson norm in this measure.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Remarks after Theorem4, p965: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AdelicAlgebraicGroups:AA.1`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing`, [`MP.7/half-weight-eisenstein`](#n-mp-7-half-weight-eisenstein), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R4: replace `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing` by [`MP.7/jacobi-theta-nonvanishing`](#n-mp-7-jacobi-theta-nonvanishing). verified: only the nonvanishing of θ is used, for the residue ½θ.

<a id="n-mp-7-kohnen-plus-space"></a>

### Kohnen plus subspace — `MP.7/kohnen-plus-space`

definition · from the MP.0 part · planet “Kohnen plus space”

**Statement.** V_r^+ is the subspace of the weight-one-half cuspidal eigenspace V_r whose Fourier coefficients vanish outside n≡0,1 mod4. It is a linear subspace defined by coefficient kernels, not by a chosen basis.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Intersect the kernels of inadmissible coefficient maps in the actual Maass cusp eigenspace.
2. Use Fourier coefficient uniqueness and linearity to obtain the plus subspace.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, p976: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/100: Project the finite-rank residue to the appropriate subspace.

**API.**

- `TauCeti.Metaplectic.kohnenPlus_coefficientKernels` (constructor): Intersect kernels of b(n) for n≡2,3 mod 4.
- `TauCeti.Metaplectic.kohnenPlus_membership` (characterisation): Membership means exactly the forbidden coefficients vanish, together with the ambient cusp/eigen conditions.
- `TauCeti.Metaplectic.kohnenPlus_linearStructure` (structure): The common kernel of forbidden coefficient maps is closed under addition and complex scalar multiplication. Actual Hecke preservation requires the source ambient space.

**Checks.**

- `TauCeti.Metaplectic.kohnenPlus_test1` (computation): If the forbidden coefficient at −1 is the identity coordinate, a nonzero vector is excluded from the common kernel.
- `TauCeti.Metaplectic.kohnenPlus_test2` (degenerate): If all forbidden coefficient maps are zero, the common kernel is the whole ambient module. Actual cuspidality is still an ambient condition.
- `TauCeti.Metaplectic.kohnenPlus_test3` (non-example): A form with zero forbidden coefficients but a nonzero cusp constant is not a plus cusp form.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space), [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-operators"></a>

### Plus projection operators — `MP.7/plus-operators`

construction · from the MP.0 part

**Statement.** On the unitary-weight space set UF(z)=(√2/4)Σ_{ν=0}^3F((z+ν)/4), WF(z)=exp(iπ/4)(z/|z|)^(−1/2)F(−1/(4z)), and pr⁺=(2/3)WU+1/3. Record operator composition order and the factor √2 caused by y^(1/4).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Define U by four translates and W by the principal square-root Fricke factor.
2. Compute their action on the automorphic domain and define the fixed DIT16 order pr+=(2/3)WU+1/3.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, printed976, PDF28, U,W and footnote6: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/99: Recover the principal-term coefficient of the projected family.

**API.**

- `TauCeti.Metaplectic.plusOperators_uFormula` (simp): U=(√2/4)Σ_{ν mod 4}F((z+ν)/4) in the unitary normalization.
- `TauCeti.Metaplectic.plusOperators_wFormula` (simp): W uses exp(iπ/4)(z/|z|)^(−1/2) and z↦−1/(4 z).
- `TauCeti.Metaplectic.plusOperators_projectionComparison` (compatibility): The supplied U,W formulas define (2/3)WU+(1/3)id on functions; proving that it is the orthogonal plus projection requires the actual Maass domain and relations.

**Checks.**

- `TauCeti.Metaplectic.plusOperators_test1` (computation): Dropping √2 changes U after conjugation by y^(1/4).
- `TauCeti.Metaplectic.plusOperators_test2` (degenerate): On the constant function1, the WU combination at z has value (2/3)phaseW(z)√2+1/3. At z=i this is not1, so it is not an unrestricted projection theorem.
- `TauCeti.Metaplectic.plusOperators_test3` (non-example): Compare WU and UW on a form outside the plus space; equality is not an assumption.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier), [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space), [`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-projection"></a>

### Plus projection and old normalization bridge — `MP.7/plus-projection`

theorem · from the MP.0 part

**Statement.** Prove pr⁺ is the orthogonal projection onto V_r^+, with the same extension on the relevant Poincaré families. DIT11 (2.19) must read P_d^+=(3/2)pr⁺P_d; DIT16 footnote7 corrects it. The principal term of pr⁺F_{1/2,d} thus has factor2/3.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the exact four-coset action and Petersson adjoint relations.
2. Identify image and fixed vectors by Fourier support; compare the DIT11 (3/2) normalization without commuting U and W silently.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8 equation(8.10) and footnote7, printed977, PDF29; projection definition printed976 PDF28: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-operators`](#n-mp-7-plus-operators), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-half-weight-kloosterman"></a>

### Half-weight Kloosterman sum — `MP.7/half-weight-kloosterman`

definition · from the MP.0 part

**Statement.** For c>0 divisible by4, K_{1/2}(m,n;c)=Σ_{a mod c,(a,c)=1}(c/a)ε_a e((m a+n ā)/c), where aā≡1 modc and ε_a=1 or i according as a≡1 or3 mod4. The extended Kronecker symbol convention is part of the data.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Choose units modulo c and their inverses in the finite group.
2. Check the Kronecker/ε_a phase is independent of admissible odd representatives, then sum the character terms.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, p.976; DIT11 p.964 (unnumbered display just before (3.4)); DIT11 (3.4), p.965, is K⁺: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/104: Keep the dyadic multiplier in the divisor identity.

**API.**

- `TauCeti.Metaplectic.halfWeightKloosterman_unitSum` (constructor): Sum over units mod c with a chosen inverse and the extended Kronecker symbol.
- `TauCeti.Metaplectic.halfWeightKloosterman_inverseIndependence` (characterisation): Changing the integer lift of a⁻¹ by c does not change the phase.
- `TauCeti.Metaplectic.halfWeightKloosterman_modulusData` (projection): Require 4|c and distinguish ε_a for a residue 1 or 3 mod 4.

**Checks.**

- `TauCeti.Metaplectic.halfWeightKloosterman_modFour` (computation): K_{1/2}(0,0;4)=1+i.
- `TauCeti.Metaplectic.halfWeightKloosterman_period` (compatibility): Adding c to either index leaves the sum unchanged.
- `TauCeti.Metaplectic.halfWeightKloosterman_phase` (non-example): Omitting ε_a gives2 instead of1+i at m=n=0,c=4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-kloosterman"></a>

### Modified plus Kloosterman sum — `MP.7/plus-kloosterman`

definition · from the MP.0 part

**Statement.** K⁺(m,n;c)=(1−i)K_{1/2}(m,n;c) times1 if8|c, and times2 ifc≡4 mod8. Only the discriminant-indexed symmetry statement is used.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Multiply the half-weight sum by (1−i) and the source’s c modulo8 factor.
2. Compare the source plus projection coefficient calculation.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, p976: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/98: Match the plus-projected Fourier coefficients.

**API.**

- `TauCeti.Metaplectic.plusKloosterman_dyadicFactor` (simp): Use 2 when c≡4 mod 8 and 1 when 8|c.
- `TauCeti.Metaplectic.plusKloosterman_weightHalfComparison` (compatibility): K⁺/(1−i) equals the dyadic multiple of K_{1/2}.
- `TauCeti.Metaplectic.plusKloosterman_discriminantSymmetry` (relation): For allowed indices, K⁺ is real and symmetric.

**Checks.**

- `TauCeti.Metaplectic.plusKloosterman_modFour` (computation): K+(0,0;4)=4.
- `TauCeti.Metaplectic.plusKloosterman_oneOne` (computation): K+(1,1;4)=−4.
- `TauCeti.Metaplectic.plusKloosterman_exception` (non-example): Omitting the c≡4 mod8 factor gives2 rather than4 at zero indices,c=4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-kloosterman`](#n-mp-7-half-weight-kloosterman).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-kloosterman-symmetry"></a>

### Reality and symmetry of plus sums — `MP.7/plus-kloosterman-symmetry`

theorem · from the MP.0 part

**Statement.** For c>0 with 4|c and all m,n∈ℤ, K⁺(m,n;c)=K⁺(n,m;c)=conj(K⁺(n,m;c)). This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Invert the summation variable to exchange the two indices.
2. Apply the exact quadratic phase/complex-conjugation calculation; the claim is the stated K+ identity, not an ordinary Kloosterman symmetry without phase.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (8.9): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-kloosterman`](#n-mp-7-plus-kloosterman).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-half-weight-resolvent"></a>

### Half-weight resolvent kernel — `MP.7/half-weight-resolvent`

construction · from the MP.0 part · planet “Half weight resolvent”

**Statement.** Construct the resolvent G_{1/2}(z,z′;s) on the Γ₀(4) unitary-multiplier L² space, with its three-cusp domain, hermitian kernel symmetry and discrete polar projectors. This is a cover-specific adaptation of AS.0, not an ordinary scalar kernel on Γ\H.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Apply the AS.0 resolvent to the closed three-cusp unitary-multiplier Laplacian domain.
2. Prove the finite-cover/multiplier adaptation and identify the kernel’s Fourier expansion and spectral poles.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (8.5): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/100: Transport resolvent theory to the genuine multiplier space.

**API.**

- `TauCeti.Metaplectic.halfWeightResolvent_weightedDomain` (constructor): Use functions with J automorphy and all three cusps in the self-adjoint domain.
- `TauCeti.Metaplectic.halfWeightResolvent_covariance` (relation): Transform each kernel variable with its J or conjugate J factor.
- `TauCeti.Metaplectic.halfWeightResolvent_polarProjection` (compatibility): The residue is the orthogonal projector onto the weighted eigenspace, before plus projection.

**Checks.**

- `TauCeti.Metaplectic.halfWeightResolvent_test1` (computation): The kernel cannot be an ordinary invariant scalar in both variables.
- `TauCeti.Metaplectic.halfWeightResolvent_test2` (degenerate): Changing the phase of an orthonormal basis vector leaves its rank-one projector unchanged.
- `TauCeti.Metaplectic.halfWeightResolvent_test3` (non-example): Projection to V⁺ changes the basis sum and must precede the coefficient identity 100.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space), `AutomorphicSpectralTheory:AS.0`, [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-half-weight-poincare"></a>

### Half-weight Poincaré family — `MP.7/half-weight-poincare`

construction · from the MP.0 part

**Statement.** For n≠0, Re(s)>1, F_{1/2,n}(z,s)=Γ(s−sgn(n)/4)/(4π|n|Γ(2s)) times Σ_{Γ∞\Γ₀(4)}J(γ,z)⁻¹ M_{sgn(n)/4,s−1/2}(4π|n|Imγz)e(n Reγz).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Form the Γ∞\Γ₀(4) orbit sum of the normalized Whittaker-M seed.
3. Prove absolute/compact-uniform convergence for Re(s)>1, covariance, and its Fourier expansion.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (8.6): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/99: Produce the exact gamma normalization of Φ⁺.

**API.**

- `TauCeti.Metaplectic.halfWeightPoincare_seedNormalization` (simp): The prefactor is Γ(s−sgn n/4)/(4π|n|Γ(2 s)).
- `TauCeti.Metaplectic.halfWeightPoincare_multiplierInverse` (structure): J(γ, z)⁻¹ in the coset sum gives the correct automorphy.
- `TauCeti.Metaplectic.halfWeightPoincare_parameter` (compatibility): The Whittaker parameter is s−1/2. Comparing with weight zero requires the substitution w=s/2+1/4.

**Checks.**

- `TauCeti.Metaplectic.halfWeightPoincare_test1` (computation): n=1 and n=−3 use different gamma arguments.
- `TauCeti.Metaplectic.halfWeightPoincare_test2` (degenerate): n=0 cannot be inserted into the prefactor.
- `TauCeti.Metaplectic.halfWeightPoincare_test3` (non-example): Missing 4π|n| changes both the residue and the constant 12 in Theorem 4. The prefactor cancellation check is made only in Re(s)>1, where Γ(2s) is nonzero; totalized Gamma values at poles must not be cancelled.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `mathlib:QuotientGroup.rightRel`, `mathlib:CongruenceSubgroup.Gamma0`, `AutomorphicSpectralTheory:AS.0/dit-112`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-poincare-residues"></a>

### Half-weight Poincaré residues — `MP.7/poincare-residues`

theorem · from the MP.0 part

**Statement.** At s₀=1/2+ir/2, r>0, Res[(2s−1)F_{1/2,n}(z,s)]=Σ_ψ conj(b_ψ(n))ψ(z) over an orthonormal cuspidal eigenbasis, in the kernel convention verified from Fay. Preserve conjugation; raw PDF text drops bars.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the resolvent spectral projection at s=1/2+ir/2.
2. Apply its coefficient extraction with an orthonormal Petersson basis and retain conjugation on the source coefficient.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8 equation(8.7), printed976, PDF28: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/half-weight-resolvent`](#n-mp-7-half-weight-resolvent), [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-bessel-coefficient"></a>

### Plus Bessel coefficient family — `MP.7/plus-bessel-coefficient`

construction · from the MP.0 part

**Statement.** For nonzero discriminant indices n,d and Re(s)>1, Φ⁺(n,d;s) equals [Γ(s−sgn n/4)Γ(s−sgn d/4)/(3√π·2^(2−2s)Γ(2s−1/2)√|nd|)] Σ_{c>0,4|c}K⁺(n,d;c)c⁻¹ B_{2s−1}(4π√|nd|/c), with I for nd<0, J for nd>0.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Compute the projected Poincaré Fourier coefficient by orbit unfolding.
3. Apply the Whittaker–Bessel integral, selecting I for nd<0 and J for nd>0 and retaining all Gamma and power factors.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8 equation(8.11), printed977, PDF29: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/119: Convert the finite root sums into metaplectic spectral coefficients.

**API.**

- `TauCeti.Metaplectic.plusBesselCoefficient_besselSeries` (constructor): Use the explicit prefactor and K⁺ series of 98 in Re(s)>1.
- `TauCeti.Metaplectic.plusBesselCoefficient_signs` (simp): Each gamma factor uses its own index sign; the Bessel function depends on the product sign.
- `TauCeti.Metaplectic.plusBesselCoefficient_continuation` (compatibility): Extend using the projected resolvent coefficient, preserving its initial series.

**Checks.**

- `TauCeti.Metaplectic.plusBesselCoefficient_test1` (computation): With K supported at c=4 with value1, indices −3,−4 give the exact Γ(s+1/4)² prefactor times J(2s−1,π√12)/4.
- `TauCeti.Metaplectic.plusBesselCoefficient_test2` (degenerate): With K supported at c=4 with value1, indices1,−3 give the exact Γ(s−1/4)Γ(s+1/4) prefactor times I(2s−1,π√3)/4.
- `TauCeti.Metaplectic.plusBesselCoefficient_test3` (non-example): Doubling the c=4 input K doubles the constructed coefficient; this detects the dyadic factor on the series itself.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-kloosterman`](#n-mp-7-plus-kloosterman), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`, `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R4: replace `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`, `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j` by `AutomorphicLFunctionsAndLocalFactors:AL.0`. conditional on the AL.0 request: the target uses I_{2s−1} for nd < 0 and J_{2s−1} for nd > 0 with the principal branch, and the Whittaker–Bessel integral formulas.

<a id="n-mp-7-projected-poincare-expansion"></a>

### Projected Fourier expansion — `MP.7/projected-poincare-expansion`

theorem · from the MP.0 part

**Statement.** Let Re(s)>1 and let d≠0 with d≡0,1 mod 4. Then pr⁺F_{1/2,d}(z,s)=(2/3)Γ(s−sgn(d)/4)/(4π|d|Γ(2s))·M_{sgn(d)/4,s−1/2}(4π|d|y)e(dx)+Σ_{n≡0,1(4),n≠0}Φ⁺(n,d;s)W_{sgn(n)/4,s−1/2}(4π|n|y)e(nx)+(a constant term that the paper does not display). Φ⁺ is given by (8.11). The paper's sum over n≡0,1(4) formally includes n=0, where W(4π|n|y) is meaningless.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Apply the fixed plus projection to the Poincaré family.
2. Separate its leading M term with coefficient2/3 from the W Fourier terms defined by Φ+.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8 equations(8.10)–(8.11), printed977, PDF29: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-projection`](#n-mp-7-plus-projection), [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare), [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-coefficient-residue"></a>

### Plus coefficient residue theorem — `MP.7/plus-coefficient-residue`

theorem · from the MP.0 part

**Statement.** Φ⁺(d′,d;s) continues meromorphically to Re(s)>0 and Res_{s=1/2+ir/2}[(2s−1)Φ⁺(d′,d;s)]=Σ_ψ b_ψ(d′)conj(b_ψ(d)), for an orthonormal basis of V_r^+.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Continue the projected coefficient through the resolvent and use its discrete spectral residue.
2. Recover the product b(d′)conjugate(b(d)); r=0 needs its distinct pole analysis.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Proposition4, p977: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space), [`MP.7/poincare-residues`](#n-mp-7-poincare-residues), [`MP.7/projected-poincare-expansion`](#n-mp-7-projected-poincare-expansion), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-quadratic-root-weyl-sum"></a>

### Quadratic-root Weyl sum — `MP.7/quadratic-root-weyl-sum`

definition · from the MP.0 part

**Statement.** For c>0 divisible by4, S_m(d′,d;c)=Σ_{b mod c,b²≡D modc}χ_d([c/4,b,(b²−D)/c])e(2mb/c). Prove representative independence, reality and S_{−m}=S_m using the exact factor2 in the exponential.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Import the invariant genus character on possibly imprimitive forms from GN.2.
2. Use b²≡D modc to form [c/4,b,(b²−D)/c]; prove independence, reality and m↦−m symmetry.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (9.1): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/106: Parametrize unfolded cycles by roots of a congruence.

**API.**

- `TauCeti.Metaplectic.quadraticRootWeylSum_rootIndex` (constructor): Sum over b mod c with b²≡d′d mod c.
- `TauCeti.Metaplectic.quadraticRootWeylSum_formEvaluation` (simp): Associate [c/4, b,(b²−D)/c] of discriminant D.
- `TauCeti.Metaplectic.quadraticRootWeylSum_evenness` (relation): S_{−m}=S_m=conj(S_m) under the stated genus character convention.

**Checks.**

- `TauCeti.Metaplectic.quadraticRootWeylSum_test1` (computation): The quadratic form discriminant computes to D exactly.
- `TauCeti.Metaplectic.quadraticRootWeylSum_test2` (degenerate): The phase is e(2 mb/c), not e(mb/c).
- `TauCeti.Metaplectic.quadraticRootWeylSum_test3` (non-example): Passing from b modulo 2a to b modulo 4a doubles the count and requires a factor 1/2.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-kohnen-salie-identity"></a>

### Kohnen–Salié divisor identity — `MP.7/kohnen-salie-identity`

theorem · from the MP.0 part · planet “Kohnen–Salié identity”

**Statement.** For c>0 divisible by4, d fundamental, d′≡0,1 mod4 and integer m, S_m(d′,d;c)=Σ_{n|gcd(m,c/4),n>0}(d/n)√(n/c)K⁺(d′,m²d/n²;c/n). Include even-prime factors and the c≡4 mod8 multiplier.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Evaluate the finite quadratic-root sum prime by prime using the same genus character convention.
2. Assemble the divisor decomposition, including p=2; the unread original Kohnen computation remains a gap.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Lemma 8, p.980; the same as DIT11 Proposition 3, p.965, with DIT11's (d,D) renamed (d′,d): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-kloosterman`](#n-mp-7-plus-kloosterman), [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-weight-two-cycle-unfolding"></a>

### Weight-two cycle unfolding — `MP.7/weight-two-cycle-unfolding`

theorem · from the MP.0 part

**Statement.** Let d be fundamental, d′,d<0, D=d′d nonsquare, and let φ be as in item 105. Put Φ_m(t)=−it∫_0^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ (9.3). For every m∈ℤ, Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ=ε·Σ_{0<c≡0(4)}S_m(d′,d;c)Φ_m(2√D/c). With this corrected −it kernel, ε=+1 when C_Q runs from z to γ_Qz (clockwise on S_Q for a>0, the C_A orientation of §2 under which Lemma5 holds), and ε=−1 for z→g_Qz=γ_Q⁻¹z (DIT11's counterclockwise orientation for a>0). The paper's printed +it kernel uses the opposite sign: its Lemma6 needs a leading minus for z→γ_Qz. Correcting the kernel and also inserting that minus would double-correct E28. Work in a proved convergence range (or with the weaker actual decay O(y^ε)); the printed stronger decay hypothesis is not inferred automatically for Re(s)>1.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Unfold the oriented quadratic cycle using GN.3’s actual z→γ_Qz orientation.
2. The weight-two differential contributes −it in the corrected kernel; justify convergence first on the valid decay range and continue as needed.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Lemma6, (9.3); DIT11 Lemmas6–8: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum), `AutomorphicSpectralTheory:AS.0`, [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-cm-poincare-sum"></a>

### CM Poincaré sum — `MP.7/cm-poincare-sum`

theorem · from the MP.0 part

**Statement.** For m≠0, Re(s)>1 and d′d=D<0, Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c). The square root is of |D|.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Unfold the weight-zero Poincaré orbit at the CM point with its stabilizer weight.
2. Identify the quadratic-root sum and evaluate the I-Bessel radial integral.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Lemma3, p978; DIT11 Proposition4: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicSpectralTheory:AS.0`, [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-positive-cycle-poincare-sum"></a>

### Positive cycle Poincaré sum — `MP.7/positive-cycle-poincare-sum`

theorem · from the MP.0 part

**Statement.** For m≠0, Re(s)>1 and d,d′>0, D nonsquare, Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s) times Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)J_{s−1/2}(4π|m|√D/c).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Parametrize the positively factored oriented closed cycle.
2. Unfold its scalar Poincaré integral and evaluate the J-Bessel integral with Γ(s/2)².

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Lemma4, p979: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicSpectralTheory:AS.0`, [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-negative-cycle-poincare-sum"></a>

### Negative-factor cycle Poincaré sum — `MP.7/negative-cycle-poincare-sum`

theorem · from the MP.0 part

**Statement.** Let m≠0, Re(s)>1, d fundamental, d′,d<0 and D=d′d nonsquare. Orient C_Q from z to γ_Qz, with γ_Q from (2.11); this is clockwise on S_Q when a>0 and is the orientation of C_A in §2. Then Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}i∂_zF_m(z,s)dz=2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}Σ_{0<c≡0(4)}S_m(d′,d;c)c^{−1/2}J_{s−1/2}(4π|m|√D/c). With DIT11's orientation (z to γ_Q⁻¹z) the right side changes sign.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Use the corrected weight-two oriented unfolding.
3. Evaluate the differentiated Whittaker integral, retaining Γ((s+1)/2)² and the source’s oriented differential.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Lemma5, p979: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R4: replace `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j` by `AutomorphicLFunctionsAndLocalFactors:AL.0`. conditional on the AL.0 request: the target uses J_{s−1/2} at positive real arguments.

<a id="n-mp-7-three-case-poincare-identity"></a>

### Exact three-case Poincaré identity — `MP.7/three-case-poincare-identity`

theorem · from the MP.0 part

**Statement.** Let m≠0 and Re(s)>1, let d be a fundamental discriminant and d′ a discriminant with D=d′d nonsquare. Then 6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²;s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q, where X_Q=2√πω_Q⁻¹F_m(z_Q,s) if d′d<0, X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz| if d′,d>0, and X_Q=∫_{C_Q}i∂_zF_m(z,s)dz if d′,d<0. In the third case C_Q runs from z to γ_Qz, as in item 109.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Insert the Kohnen–Salié divisor identity into Φ+.
2. Compare each sign case with its independently unfolded CM/scalar-cycle/weight-two-cycle formula.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Proposition5, p978: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient), [`MP.7/kohnen-salie-identity`](#n-mp-7-kohnen-salie-identity), [`MP.7/cm-poincare-sum`](#n-mp-7-cm-poincare-sum), [`MP.7/positive-cycle-poincare-sum`](#n-mp-7-positive-cycle-poincare-sum), [`MP.7/negative-cycle-poincare-sum`](#n-mp-7-negative-cycle-poincare-sum), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-hecke-basis"></a>

### Plus Hecke eigenbasis — `MP.7/plus-hecke-basis`

theorem · from the MP.0 part

**Statement.** V_r^+ has an orthonormal basis B_r of simultaneous eigenforms for T_{p²}, p>2. Supply the p=2 plus-space convention needed for the Euler product over all primes; diagonalization away from2 alone does not define that factor. The all-prime version explicitly includes the plus-space p=2 Hecke operator; an odd-prime eigenbasis alone is insufficient.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use finite-dimensionality and the self-adjoint commuting Hecke family on the plus cusp space.
2. Include the separately verified p=2 plus operator before asserting an all-prime Euler product.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §10, pp980–981; Katok–Sarnak[34]: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space), [`MP.7/plus-operators`](#n-mp-7-plus-operators), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-shimura-eigenline-lift"></a>

### Shimura lift from an eigenline — `MP.7/shimura-eigenline-lift`

construction · from the MP.0 part

**Statement.** For ψ∈B_r, choose a fundamental d with b_ψ(d)≠0, define a_ψ(n) from the Hecke Euler factors, and form Shim(ψ)(z)=2√yΣ_{n≠0}a_ψ(|n|)K_ir(2π|n|y)e(nx). Prove independence from the selected d and from scaling ψ; define it first on the eigenline.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Choose a fundamental coefficient that is nonzero, then use the coefficient/Hecke relation to define the normalized weight-zero Fourier series.
2. Prove its automorphy via the finite Fourier certificate; normalized output depends on the eigenline, not a unit-phase choice of input.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (10.1)–(10.3): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/127: Separate eigenline existence from phase selection.

**API.**

- `TauCeti.Metaplectic.shimuraEigenlineLift_heckeSeries` (constructor): Form the even K-Bessel series from the Hecke eigenvalues.
- `TauCeti.Metaplectic.shimuraEigenlineLift_scaleIndependence` (characterisation): Multiplying ψ by a nonzero scalar leaves all a_ψ(n) and Shim(ψ) unchanged.
- `TauCeti.Metaplectic.shimuraEigenlineLift_fundamentalChoice` (compatibility): Different nonzero fundamental coefficients produce the same a_ψ(n), using the Hecke relations.

**Checks.**

- `TauCeti.Metaplectic.shimuraEigenlineLift_test1` (computation): ψ and −ψ have the same Shimura lift.
- `TauCeti.Metaplectic.shimuraEigenlineLift_test2` (degenerate): A selected coefficient b(d)=0 cannot be used as a denominator.
- `TauCeti.Metaplectic.shimuraEigenlineLift_test3` (non-example): The p=2 Euler factor needs its own plus-space convention even when the basis was diagonalized only for p>2.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.2`, [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/shimura-coefficient-relation`](#n-mp-7-shimura-coefficient-relation).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-shimura-coefficient-relation"></a>

### Shimura coefficient relation — `MP.7/shimura-coefficient-relation`

theorem · from the MP.0 part

**Statement.** For m>0 and fundamental d, mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d). Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Apply the half-weight T_{p²} recurrence at every prime with the specified p=2 convention.
2. Induct on m and use coprime multiplicativity; prove some fundamental coefficient is nonzero rather than assuming a normalization b(d)=1.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Theorem4; §10, pp981–982: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-spectral-residue-substitution"></a>

### Spectral substitution residue factor four — `MP.7/spectral-residue-substitution`

theorem · from the MP.0 part

**Statement.** Set w=s/2+1/4, s₀=1/2+ir and w₀=1/2+ir/2, r>0. Then Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)] for H with a simple pole at w₀. One factor2 is the derivative of the coordinate change, the other the linear spectral factor.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Set w=s/2+1/4 and convert the simple-pole local coordinate.
2. The residue change contributes2 and (2s−1)/(2w−1) contributes2, hence the factor4.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §10, p982: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-spectral-trace-identity"></a>

### Spectral trace identity before multiplicity one — `MP.7/spectral-trace-identity`

theorem · from the MP.0 part

**Statement.** Taking residues in119 and using93,100,122,123 yields 12√π|D|^(3/4)Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φa_φ(m)T(φ,χ), where T is ||φ||⁻² times the appropriate three-case geometric trace. Keep the finite eigenspace sums until the Shimura bijection is proved.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Take residues in the three-case Poincaré identity with the permitted coefficient/interchange estimate.
2. Use the weight-zero and half-weight orthonormal spectral projections, coefficient relation and residue factor4.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, (10.4)–(10.6): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicSpectralTheory:AS.0`, [`MP.7/plus-coefficient-residue`](#n-mp-7-plus-coefficient-residue), [`MP.7/three-case-poincare-identity`](#n-mp-7-three-case-poincare-identity), [`MP.7/shimura-coefficient-relation`](#n-mp-7-shimura-coefficient-relation), [`MP.7/spectral-residue-substitution`](#n-mp-7-spectral-residue-substitution), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-shimura-series-automorphy"></a>

### Automorphy of the Shimura series — `MP.7/shimura-series-automorphy`

theorem · from the MP.0 part

**Statement.** Use the family of trace identities and the Biró linear-independence argument to prove Shim(ψ) is an even level-one Hecke–Maass cusp form with eigenvalue1/4+r². Formal Fourier series with the right Euler factors alone do not imply automorphy.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Apply the finite Fourier separation argument to the invisible-kernel orthogonal complement.
2. Use the trace identities for all positive test indices to express the candidate as a finite combination of actual automorphic forms.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §10, p982, citing Biró[3]p129: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/shimura-eigenline-lift`](#n-mp-7-shimura-eigenline-lift), [`MP.7/spectral-trace-identity`](#n-mp-7-spectral-trace-identity), [`MP.7/finite-fourier-automorphy`](#n-mp-7-finite-fourier-automorphy), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-shimura-eigenline-bijection"></a>

### Shimura bijection of eigenlines — `MP.7/shimura-eigenline-bijection`

theorem · from the MP.0 part · planet “Shimura correspondence”

**Statement.** The weight-one-half Kohnen-plus Hecke eigenlines at parameter r/2 correspond bijectively to normalized even level-one Hecke–Maass forms at parameter r. On a previously chosen orthonormal basis B_r this gives one selected vector for each line; it does not produce a phase-independent unit vector.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the proved automorphy and normalized coefficient relation.
2. Import the Baruch–Mao multiplicity-one and existence theorem with the exact even/plus eigenline conventions; no uniqueness of a unit-phase vector is asserted.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Proposition6 proof, [1]Theorem1.2: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis), [`MP.7/shimura-series-automorphy`](#n-mp-7-shimura-series-automorphy), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-extended-shimura-trace"></a>

### Extended trace formula for all discriminants — `MP.7/extended-shimura-trace`

theorem · from the MP.0 part

**Statement.** For a normalized even φ and a unit ψ on its corresponding plus eigenline, T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d)) for fundamental d, discriminant d′, D=d′d nonsquare. General negative D requires |D|^(3/4).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Identify the two spectral sides by eigenline multiplicity one.
2. Retain the norm denominator in the geometric trace and the 12sqrt(π)|D|^{3/4} factor.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Proposition6, pp981–982: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/spectral-trace-identity`](#n-mp-7-spectral-trace-identity), [`MP.7/shimura-eigenline-bijection`](#n-mp-7-shimura-eigenline-bijection), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-negative-factor-trace"></a>

### Theorem4 negative factors — `MP.7/negative-factor-trace`

theorem · from the MP.0 part

**Statement.** Let φ(z)=2y^{1/2}Σ_{n≠0}a(n)K_{ir}(2π|n|y)e(nx) be an even Hecke–Maass cusp form for Γ=PSL(2,Z) with a(1)=1 and Laplace eigenvalue λ=1/4+r², and let F(z)=Σ_{n≡0,1 (mod 4), n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx) be the weight-1/2 form for Γ_0(4) of Theorem 4, with ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ=1 and b(dm²) given by m Σ_{n|m} n^{−3/2}(d/n) b(m²d/n²) = a(m)b(d) (F is unique only up to a unimodular constant). For coprime negative fundamental discriminants d′, d, D=d′d>0 and χ the genus character of D=d′d: 12√π D^{3/4} b(d′) conj(b(d)) = ⟨φ,φ⟩^{−1}(λ/2)Σ_{A∈Cl⁺(K)} χ(A)∫_{F_A}φ(z)dμ(z).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the negative-factor oriented differential trace.
2. Apply the corrected Stokes identity from the geometric owner to express it as the required surface integral.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Theorem4, (5.16) first branch: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/extended-shimura-trace`](#n-mp-7-extended-shimura-trace), `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`, [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-positive-factor-trace"></a>

### Theorem4 positive factors — `MP.7/positive-factor-trace`

theorem · from the MP.0 part

**Statement.** For coprime positive fundamental d,d′, 12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds, with the same normalized φ and unit half-weight eigenline.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the scalar closed-cycle term in the extended trace identity.
2. Match the GN.3 length measure y^{-1}|dz| and the genus character.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Theorem4, (5.16) second branch: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/extended-shimura-trace`](#n-mp-7-extended-shimura-trace), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-cm-trace"></a>

### Theorem4 CM factors — `MP.7/cm-trace`

theorem · from the MP.0 part

**Statement.** For coprime fundamental d,d′ of opposite sign, 12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A). Keep both 2√π and ω_D; the paper explicitly corrects the earlier CM constant.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the CM-point term of the extended trace identity.
2. Match the inverse stabilizer weight and the factor2sqrt(π).

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, Theorem4, (5.16) third branch and footnote4: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/extended-shimura-trace`](#n-mp-7-extended-shimura-trace), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-duke-coefficient-bound"></a>

### Duke coefficient estimate with spectral factor — `MP.7/duke-coefficient-bound`

theorem · from the MP.0 part

**Statement.** For an L²-unit weight k=1/2 spectral cusp form on fixed Γ₀(4), eigenvalue1/4+t², its standard W coefficient at a fundamental discriminant n satisfies |b(n)|≪_ε(1+|t|)^C cosh(πt/2)|n|^(−2/7+ε). Here the half-weight form in Theorem4 has t=r/2. The exponential factor is explicitly present in Duke88 Theorem5. The bound is for unit Petersson norm; translating to the a(1)=1 lift keeps the norm and its spectral factor. No unverified r^ε symmetric-square estimate is imported.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Apply Duke’s original coefficient estimate to a unit Petersson vector.
2. For the a(1)=1 weight-zero normalization retain its norm/spectral conversion; only a proved polynomial spectral estimate is targeted.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §6, (6.6), printed968–969/PDF20–21: The inverse-norm-squared trace bound requires the separately sourced Duke coefficient normalization and its missing exponential factors.
- Duke88, §2 spectral normalization, printed77–78/PDF5–6; Theorem5 printed85–86/PDF13–14: Unit Petersson coefficient bound with cosh(πt/2); no unproved r^ε symmetric-square estimate.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/half-weight-kloosterman`](#n-mp-7-half-weight-kloosterman), [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-plus-normalization-conjugation"></a>

### Exact conjugation of the two U and W normalizations — `MP.7/plus-normalization-conjugation`

theorem · from the MP.0 part

**Statement.** On functions on H let C f(z)=Im(z)^(1/4)f(z), U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4), W₄f(z)=(2z/i)^(−1/2)f(−1/(4z)) with the principal square root. Then CU₄C⁻¹=U and CW₄C⁻¹=W for the U,W displayed in DIT16 p976, and C(U₄∘W₄)C⁻¹=U∘W. This calculation alone does not identify U∘W with W∘U on the automorphic subspace.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Compute the two positive y^{1/4} conjugations directly using Im((z+ν)/4)=y/4 and Im(−1/(4z))=y/(4|z|²).
2. Use arg(z/i)=arg(z)−π/2 to obtain exp(+iπ/4); preserve composition order.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, printed976, PDF28, U,W and footnote6; DIT11 §2 printed959 PDF13: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.
- DIT11, §2, printed959, PDF13: The old and new scalar conjugations preserve composition order.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-positive-fourier-kernel"></a>

### Positive Fourier kernel and orthogonal complement — `MP.7/positive-fourier-kernel`

definition · from the MP.0 part

**Statement.** In the finite-dimensional fixed-eigenvalue plus cusp space W, let W₀=⋂_{n>0,n≡0,1(4)}ker(b_n) and W₁=W₀⊥. Use W=W₀⊕W₁ with the inherited Petersson inner product. No hypothesis or conclusion W₀=0 is imposed.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Intersect kernels of positive admissible coefficient maps.
2. Take its orthogonal complement in the finite-dimensional Petersson space; do not assume the common kernel is zero.

**Sources.**

- Biro00, Proof of Theorem1, printed128–129, PDF26–27: Finite Fourier separation, preserving the positive-coefficient kernel.

**Uses.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/182: Apply dual separation on W₁, where the common kernel is zero.
- PAPER-DUKE-IMAMOGLU-TOTH-16/184: Prove automorphy while allowing a nontrivial invisible kernel.

**API.**

- `TauCeti.Metaplectic.positiveFourierKernel_memKernel` (characterisation): Membership in W₀ means every positive admissible Fourier coefficient vanishes.
- `TauCeti.Metaplectic.positiveFourierKernel_orthogonalSplit` (constructor): Choose an orthonormal basis adapted to W₀⊕W₁ using finite dimensionality.
- `TauCeti.Metaplectic.positiveFourierKernel_liftZero` (compatibility): For positive fundamental D, the Biró lift is zero on W₀ because every DQ² index is positive and admissible.

**Checks.**

- `TauCeti.Metaplectic.positiveFourierKernel_test1` (computation): If every positive coefficient is the identity functional on ℂ, a nonzero vector is excluded from the common kernel.
- `TauCeti.Metaplectic.positiveFourierKernel_test2` (degenerate): If the common positive-coefficient kernel is the whole module, all positive coefficient values on every vector are zero.
- `TauCeti.Metaplectic.positiveFourierKernel_test3` (non-example): A family with only a negative-index identity coefficient has full positive-coefficient kernel; negative coefficients need not vanish.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-finite-fourier-certificate"></a>

### Finite Fourier certificate with conjugated trace coefficients — `MP.7/finite-fourier-certificate`

theorem · from the MP.0 part

**Statement.** For an orthonormal basis f₁,…,f_m of W₁, there exist m positive admissible indices n_i for which the matrix (conj(b_{f_j}(n_i))) is invertible. This uses all positive admissible coefficients, not only fundamental indices.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use separation of W₁ by the coefficient linear functionals.
2. Choose finitely many indices whose coefficient matrix has rank dim W₁; solve the dual system with the conjugated trace coefficients.

**Sources.**

- Biro00, Proof of Theorem1, printed128–129, PDF26–27: Finite Fourier separation, preserving the positive-coefficient kernel.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/positive-fourier-kernel`](#n-mp-7-positive-fourier-kernel).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-finite-fourier-automorphy"></a>

### Automorphy from finite Fourier separation — `MP.7/finite-fourier-automorphy`

theorem · from the MP.0 part

**Statement.** At N=1, assume convergence of the source-defined Biró Fourier series and equation(14) on printed129/PDF27 for every positive admissible n=s/D. This identity states that the conjugated-coefficient linear combination of Sh_D f_j equals the stated finite genus-weighted weight-zero cusp trace combination. Then each Sh_D f is a level-one weight-zero cusp eigenform at parameter r (possibly zero), for every f∈W. If D>0 the coefficient formula is even in the Fourier index, so the lift is even.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.
- D>0 is fundamental. The trace identity(14) and its convergence are hypotheses of this conditional node, not consequences of finite-dimensional coefficient separation. Their missing proof route is recorded as a gap; for N>1 use Γ₀(N) and the corresponding V*_{1/2}(4N).

**Proof outline.**

1. Build the finite trace combination from that certificate.
2. The candidate’s difference has all separating coefficients zero, so vanishes on W₁; on W₀ the positive-D lift is already zero.

**Sources.**

- Biro00, Proof of Theorem1, printed128–129, PDF26–27: Finite Fourier separation, preserving the positive-coefficient kernel.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.7/positive-fourier-kernel`](#n-mp-7-positive-fourier-kernel), [`MP.7/finite-fourier-certificate`](#n-mp-7-finite-fourier-certificate).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-dit11-eisenstein-comparison"></a>

### Coefficients of the weight-1/2 plus-space Eisenstein series (black box from [16]) — `MP.7/dit11-eisenstein-comparison`

theorem · from the MP.0 part

**Statement.** In the notation of DIT11 ([16]): for m∈Z⁺ and D a fundamental discriminant, Σ_{n|m}(D/n) b_0(Dm²/n², s) = 2^{2−4s}π^{s+1/4}m^{3/2−2s}|D|^{s−1/4}σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1), and b_0(0,s)=π^{1/2}2^{5/2−6s}Γ(2s)ζ(4s−2)/ζ(4s−1), where b_0(n,s) are the Fourier coefficients of P⁺_0(τ,s) in [16, (2.20)–(2.21)]. Consequently E*_{1/2}(z,s) = 2^sΛ(2s) y^{1/4} P⁺_0(z, s/2+1/4) has the expansion displayed on DIT16 p964, with b(d,s)=(4π)^{−1/4}|d|^{−3/4}Λ(s,χ_d) for fundamental d and the stated Shimura relation.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the normalized half-weight Fourier expansion and compare the exact source formula.
2. Import the ordinary Dirichlet/spectral input from its supplier; retain the stated pole, Gamma and Fourier conventions.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, DIT11 Lemma 4, (2.23)–(2.25), pp961–962; used for the E*_{1/2} display, DIT16 p964, which cites only [16, Prop. 2 p. 959]: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/half-weight-eisenstein`](#n-mp-7-half-weight-eisenstein), [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/plus-normalization-conjugation`](#n-mp-7-plus-normalization-conjugation).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-resolvent-fourier-comparison"></a>

### Fourier expansion and residues of the weight-1/2 resolvent (Fay, cited) — `MP.7/resolvent-fourier-comparison`

theorem · from the MP.0 part

**Statement.** Let Re(s)>1 and Im z′>Im z, with z in reduced position. Then G_{1/2}(z′,z;s)=Σ_{n≠0}F_{1/2,n}(z,s)W_{sgn(n)/4,s−1/2}(4π|n|y′)e(−nx′) plus the n=0 (Eisenstein) term, with F_{1/2,n} as in (8.6). G_{1/2} continues meromorphically in s, and Res_{s=1/2+ir/2}(2s−1)G_{1/2}(z′,z;s)=Σ_ψ conj(ψ(z′))ψ(z) over an orthonormal basis of V_r. By Fay [20, Cor. 3.6, p.178], Φ⁺(n,d;s) continues meromorphically to all s.

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Proof outline.**

1. Use the normalized half-weight Fourier expansion and compare the exact source formula.
2. Import the ordinary Dirichlet/spectral input from its supplier; retain the stated pole, Gamma and Fourier conventions.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §8, pp.975–977, citing Fay [20, Thm 3.1] and footnote 5; Fay Cor. 3.6 p.178: Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/half-weight-resolvent`](#n-mp-7-half-weight-resolvent), [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare), [`MP.7/poincare-residues`](#n-mp-7-poincare-residues).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-shimura-dirichlet-series"></a>

### Shimura Dirichlet-series identity for ψ∈B_r — `MP.7/shimura-dirichlet-series`

theorem · from the MP.0 part

**Statement.** Let ψ∈B_r have coefficients b(n) as in (10.1), and let d be a fundamental discriminant. Then L_d(s+1/2)Σ_{n≥1}b(dn²)n^{1−s}=b(d)Π_p(1−a_ψ(p)p^{−s}+p^{−2s})⁻¹, where L_d(s)=L(s,χ_d)=Σ_{n≥1}(d/n)n^{−s} and a_ψ(p) is the T_{p²}-eigenvalue for odd p and the specified plus-space Hecke eigenvalue at p=2. Comparing coefficients gives mΣ_{n|m}n^{−3/2}(d/n)b(m²d/n²)=a_ψ(m)b(d) (item 122).

**Hypotheses.**

- Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.
- Use the all-prime simultaneous eigenbasis, including the separately supplied plus-space operator at2 (E33); an odd-prime eigenbasis does not define the displayed Euler product.

**Proof outline.**

1. Use the normalized half-weight Fourier expansion and compare the exact source formula.
2. Import the ordinary Dirichlet/spectral input from its supplier; retain the stated pole, Gamma and Fourier conventions.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §10, p.981 (display after (10.1)): Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion), [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis), [`MP.7/shimura-coefficient-relation`](#n-mp-7-shimura-coefficient-relation).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-geometric-trace"></a>

### Geometric trace — `MP.7/geometric-trace`

definition · from the MP.0 part

**Statement.** For an even Hecke–Maass cusp form φ, fundamental d, discriminant d′ and nonsquare D=d′d, define T(φ,χ)=||φ||⁻²Σ_{Q∈Γ\Q_D}χ(Q)Y_Q. Here Y_Q=2sqrt(π)ω_Q⁻¹φ(z_Q) for D<0, ∫C_Qφ y⁻¹|dz| for d,d′>0, and ∫C_Q i∂_zφ dz for d,d′<0, with the corrected z→γ_Qz orientation. The sums and cycles are the supplied arithmetic geometric objects; for odd φ the paired trace vanishes.

**Hypotheses.**

- Nonzero actual cusp eigenform so ||φ||²>0; the genus character on possibly imprimitive forms; invariant cycle/stabilizer conventions.

**Proof outline.**

1. Import CM points, closed cycles and genus characters from GN.2–3.
2. Form their finite genus-weighted pairing with the actual scalar or differential integrand.
3. Divide by the fixed Petersson norm; use Q↦[a,−b,c] for odd parity.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §10 geometric trace display preceding Proposition6, printed981, PDF33: The three-case norm-normalized trace used by the spectral identity.

**Uses.**

- DIT Proposition6 and Theorem4: Name the geometric output in the spectral and individual trace formulas.

**API.**

- `TauCeti.Metaplectic.geometricTrace_cm` (simp): The negative-D branch is the inverse-stabilizer weighted CM value sum.
- `TauCeti.Metaplectic.geometricTrace_cycle` (simp): The two positive-D branches use scalar length integration or the oriented weight-two differential.
- `TauCeti.Metaplectic.geometricTrace_odd` (compatibility): A finite involution preserving trace weights and negating paired function values forces the normalized weighted trace to vanish. Actual source CM/cycle reflection must instantiate these data.

**Checks.**

- `TauCeti.Metaplectic.geometricTrace_scale` (computation): For nonzero a, T(aφ)=T(φ)/conjugate(a).
- `TauCeti.Metaplectic.geometricTrace_oddTest` (non-example): For two paired points p,q with equal weights and φ(q)=−φ(p), the actual weighted two-point trace cancels before norm normalization.
- `TauCeti.Metaplectic.geometricTrace_norm` (compatibility): At Petersson norm1 the norm denominator is1; at other norms it is retained.

**Acceptance.**

- Multiplying φ by a nonzero scalar changes its trace by the expected inverse conjugate scalar, rather than leaving the norm-normalized trace unchanged.

**Prerequisites.** [`MP.7/three-case-poincare-identity`](#n-mp-7-three-case-poincare-identity), `AutomorphicSpectralTheory:AS.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-biro-shintani-lift"></a>

### Biró lift — `MP.7/biro-shintani-lift`

construction · from the MP.0 part

**Statement.** For every positive level N, take f∈V*_{1/2}(4N), a cusp form with eigenvalue λ=−1/4−t²<−3/16 in Biró’s negative-Laplacian convention, and a positive fundamental discriminant D. Define Sh_D f(z)=Σ_{k≠0}a_Sh(k)W_{1/2+2it}(kz), with a_Sh(k)=Σ_{PQ=k,P>0,(N,P)=1}|Q|^{1/2}P⁻¹(D/P)b_f(DQ²). It is a weight-zero cusp form for Γ₀(N) of eigenvalue −1/4−(2t)². Here V*=V^+ for odd N and V*=V for even N. This is Biró’s Fourier-series construction; no theta-kernel definition is asserted.

**Hypotheses.**

- N>0, D>0 fundamental, f∈V*_{1/2}(4N), λ<−3/16. Use Biró’s own Whittaker W_s(kz) normalization, with its |k|^{1/2} factor when compared to a 2sqrt(y)K series. The general-level coefficient and trace spaces must be instantiated, not identified with the N=1 space.
- λ is real and t²=−λ−1/4; t may be real or purely imaginary. The complex parameter retains the source complementary range −1/4<λ<−3/16, rather than silently restricting Theorem1 to real t.

**Proof outline.**

1. Define the Fourier series with the stated coefficients and prove its convergence. Biró explicitly says his proof does not use theta-functions or kernel functions (PDF1).
2. Derive Lemma10 and equation(14) via the source trace/Kuznetsov and special-function argument, then apply finite coefficient separation on W₁; the positive-D series vanishes on W₀. These analytic identities are the explicit outstanding proof gate.
3. Repair the passage to meromorphic parameters by Vitali using convergence on a positive interval with an interior accumulation point, not convergence at one point.

**Sources.**

- Biro00, §1 and Theorem1, printed105–106, PDF3–4; proof128–129, PDF26–27: Lift, spectral rescaling and finite Fourier proof with repaired Vitali argument.

**Uses.**

- DIT §10 finite Fourier automorphy argument: Supply the original theorem and its normalization comparison.

**API.**

- `TauCeti.Metaplectic.biroLift_coeff` (simp): The source-normalized divisor expression is used in the series over all k≠0, with positive-D inputs b_f(DQ²); actual Fourier coefficient extraction requires the analytic carrier.
- `TauCeti.Metaplectic.biroLift_spectral` (compatibility): Half-weight parameter t gives weight-zero parameter2t in the negative Laplacian convention.
- `TauCeti.Metaplectic.biroLift_kernel` (characterisation): The positive-coefficient common kernel maps to zero for positive D.

**Checks.**

- `TauCeti.Metaplectic.biroLift_zero` (degenerate): Zero f has zero lift.
- `TauCeti.Metaplectic.biroLift_kernelTest` (non-example): A nonzero vector in W₀ is invisible to positive-D lifts.
- `TauCeti.Metaplectic.biroLift_parameter` (computation): The output spectral term is (2t)², rather than t².
- `TauCeti.Metaplectic.biroLift_coefficientTwo` (computation): At N=1, χ(1)=χ(2)=1, b(D)=1 and b(4D)=0, the source coefficient a_Sh(2)=1/2. Using P^(−1/2) in place of |Q|^(1/2)/P fails this test.

**Acceptance.**

- Positive-D coefficients vanish on W₀; no assertion W₀=0 is made.

**Prerequisites.** [`MP.7/positive-fourier-kernel`](#n-mp-7-positive-fourier-kernel), [`MP.7/finite-fourier-certificate`](#n-mp-7-finite-fourier-certificate), [`MP.7/finite-fourier-automorphy`](#n-mp-7-finite-fourier-automorphy), `AutomorphicSpectralTheory:AS.0`, `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

<a id="n-mp-7-adelic-classical-half-weight"></a>

### Adelic and classical half-weight comparison — `MP.7/adelic-classical-half-weight`

theorem · from the MP.0 part · planet “Half integral weight forms”

**Statement.** For the actual rank-one adelic cover and a specified finite-level genuine vector, evaluate along the real Iwasawa section over H to obtain a classical half-integral-weight form with its theta multiplier. Conversely adelize a classical form with the compatible congruence/character and cusp conditions. The comparison intertwines right Hecke actions and matches the positive Fourier e(nx), chosen Whittaker normalization, and the y^{k/2} holomorphic-to-unitary weight change. At weight1/2 the conjugated Laplacian is Δ_unit,1/2=y^{1/4}Δ_hol,1/2 y^{−1/4}+3/16.

**Hypotheses.**

- Rank-one genuine central sign, specified K-weight and finite-level splitting; exact classical multiplier/character; archimedean and all-cusp growth conditions.

**Proof outline.**

1. Compute the real cover section and its cocycle, then compare with the nonvanishing theta multiplier.
2. Use rational and finite-level invariance to establish the classical slash law and the inverse adelization.
3. Compare Fourier coefficients, Petersson measure, Hecke double cosets and the explicit differential conjugation.

**Sources.**

- PAPER-DUKE-IMAMOGLU-TOTH-16, §5(5.14)–(5.16), PDF16–17; §8, PDF27–29: Classical multiplier and Fourier/spectral conventions; full adelization proof is a gap.

**Acceptance.**

- The half-weight unitary Laplace eigenvalue is1/4+(r/2)².

**Prerequisites.** [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier), [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space), `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.2`, `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R4: replace `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian` by `AutomorphicSpectralTheory:AS.0`. conditional on the AS.0 request: the target uses the holomorphic and unitary normalizations of Δ_{1/2} and their conjugation by y^{1/4}.

<a id="n-mp-7-bfh-kernel-import"></a>

### BFH metaplectic kernel interface — `MP.7/bfh-kernel-import`

comparison · from the MP.0 part

**Statement.** Import the genuine genus-two BFH kernel, its theta components, two-cusp Whittaker expansions, actual local test vectors and unramified Euler-factor ratio from MP.8. Its normalized Siegel parameter is s−2 and its original newform conductor is M, while the auxiliary arithmetic level is N. MP.7 supplies the common multiplier/Fourier conventions and compares their restriction with the rank-one half-weight theory; BSD.2 consumes MP.8/bsd2-export and owns the final twist nonvanishing argument.

**Hypotheses.**

- MP.8 exact arithmetic datum: even weightk≥2, trivial character,8M|N,N|m,4m|N²; vector-valued K-type and specified two-cusp transforms.

**Proof outline.**

1. Use the read BFH §1 theta-component construction to identify the common Jacobi/finite Weil interfaces.
2. Import the existing MP.8 declarations rather than reconstruct the GSp₄ cover or its Eisenstein proof.
3. Match the sign, Whittaker and local factor conventions before passing the supplier’s explicit export to BSD.2.

**Sources.**

- BFH90Invent, §1 construction printed549, PDF8; §2 Proposition2.2 printed552, PDF11: Visual transcription. Initial Jacobi Eisenstein construction and finite components; subsequent analytic kernel results are supplied by MP.8, not claimed read here.

**Acceptance.**

- The rank-one comparison does not supply the genus-two similitude double cover.

**Prerequisites.** [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight), [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface), [`MP.8/jacobi-eisenstein`](#n-mp-8-jacobi-eisenstein), [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition), [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison), [`MP.8/unramified-euler-factors`](#n-mp-8-unramified-euler-factors), [`MP.8/bsd2-export`](#n-mp-8-bsd2-export).

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.8 (realises MP.7, MP.8). verified: it uses MP.8/jacobi-eisenstein, theta-decomposition, genuine-induced-comparison, unramified-euler-factors and bsd2-export, and has no consumer in this roadmap; it keeps realising MP.7's export target from its new place.

<a id="n-mp-7-ramified-quadratic-twist-kernel-inputs"></a>

### Ramified quadratic-twist kernel inputs — `MP.7/ramified-quadratic-twist-kernel-inputs`

comparison · from the MP.0 part

**Statement.** For the BFH route, export the supplier’s actual ramified local character/test-vector integrals and nonzero finite K-type tests together with its normalized Euler factors. For the separate Friedberg–Hoffstein route, require the original kernel, its exact level/character restrictions, each ramified and dyadic integral, and its Fourier coefficient comparison before an identification with this common interface is asserted. The unavailable original FH kernel formula is an explicit source gap; no generic formal half-weight symbol is used in its place.

**Hypotheses.**

- A specified original paper route and actual newform/local vectors; original character and conductor hypotheses must be collated. No all-local-condition nonvanishing theorem is concluded here.

**Proof outline.**

1. Import the read MP.8 local test-vector contracts for the BFH specialization.
2. Match finite additive and quadratic characters and their conductor-dependent Haar factors.
3. For FH95, acquire and read the original construction, then prove its adapter; until then keep that target’s exact statement/proof boundary as the recorded gap.

**Sources.**

- BFH90Invent, §1 quadratic-twist completion, printed551, PDF10: Visual transcription. This condition gates the printed functional equation; the separate FH95 original-kernel adaptation remains a source gap, not an import from the consuming BSD.2 theorem.

**Acceptance.**

- Unramified Euler identities alone do not establish a ramified/dyadic local input.

**Prerequisites.** [`MP.8/bsd2-export`](#n-mp-8-bsd2-export), [`MP.8/local-test-nonzero-f`](#n-mp-8-local-test-nonzero-f), [`MP.8/local-test-nonzero-tau`](#n-mp-8-local-test-nonzero-tau), [`MP.8/local-test-nonzero-m`](#n-mp-8-local-test-nonzero-m), [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Library.** module `TauCeti/RepresentationTheory/Metaplectic/Stage7`, namespace `TauCeti.Metaplectic`.

**Routed edit.** R1: moves to layer MP.8 (realises MP.7, MP.8). verified: it uses MP.8/bsd2-export and the three local-test-nonzero targets of MP.8, and has no consumer in this roadmap.

<a id="n-mp-7-jacobi-theta-nonvanishing"></a>

### Product formula and nonvanishing of the Jacobi theta function — `MP.7/jacobi-theta-nonvanishing`

theorem · **New in the whole-roadmap pass**

**Statement.** For τ in the upper half plane put w = exp(πiτ), so that |w| < 1. Then Mathlib's jacobiTheta τ = Σ_{n∈ℤ} exp(πin²τ) equals the absolutely convergent product ∏_{n≥1}(1 − w^{2n})(1 + w^{2n−1})². No factor vanishes, so jacobiTheta τ ≠ 0 for every τ with Im τ > 0. Consequently the theta series θ(z) = Σ_{n∈ℤ} e(n²z) = jacobiTheta(2z) of MP.7 has no zero on the upper half plane, and neither has the unitary normalization y^{1/4}θ(z), y = Im z.

**Hypotheses.**

- τ ∈ ℂ with Im τ > 0; e(x) = exp(2πix). No square root or other branch enters the statement.
- The product is over n ≥ 1 and converges absolutely because Σ_n |w|^n < ∞; the identity is an identity of complex numbers, not only of formal power series.

**Proof outline.**

1. Formal identity. ClassicalArithmeticCompletion:CA.4/theta-product-specialisations, part (ii), gives Σ_{n∈ℤ} x^{n²} = ∏_{n≥1}(1 + x^{2n−1})²(1 − x^{2n}) in ℤ⟦x⟧ with the pi topology. Equivalently, for each j the coefficient of x^j in the finite products over n ≤ M is eventually (for M large) the number of n ∈ ℤ with n² = j.
2. Analytic identity. On the open unit disc the finite products converge locally uniformly to the infinite product, since Σ_n (2|x|^{2n−1} + |x|^{4n−2} + |x|^{2n}) converges locally uniformly there. A locally uniform limit of holomorphic functions is holomorphic, and its Taylor coefficients at 0 are the limits of the coefficients (Cauchy estimates); by the first step they are the coefficients of Σ x^{n²}, which is holomorphic on the disc. Two holomorphic functions on the disc with the same power series at 0 coincide (uniqueness of power series, HasFPowerSeriesAt.eq_formalMultilinearSeries, and the identity theorem on the connected disc). Kong–Teo prove the same analytic identity directly by a two-variable argument (Theorem 3.1); either proof may be used.
3. Substitute x = w = exp(πiτ): the defining series of jacobiTheta is Σ_n w^{n²}. jacobiTheta_eq_jacobiTheta₂ identifies it with jacobiTheta₂ 0 τ when the two-variable form is preferred.
4. Nonvanishing. Write the product as ∏_i (1 + f_i) over the interleaved family f = (−w^{2n}, w^{2n−1}, w^{2n−1})_{n≥1}. Each 1 + f_i is nonzero because |f_i| < 1, and Σ_i |f_i| < ∞; tprod_one_add_ne_zero_of_summable gives a nonzero product.
5. θ(z) = Σ_n exp(2πi n² z) = Σ_n exp(πi n² (2z)) = jacobiTheta(2z), and 2z lies in the upper half plane when z does; y^{1/4} > 0.

**Sources.**

- KongTeo23, §3, Theorem 3.1, pp. 4–6, and Corollary 3.2, p. 6: The analytic Jacobi triple product for |w| < 1 and nonzero z, proved by comparing the Laurent coefficients in z and showing the constant coefficient is 1; Corollary 3.2 is its form in the variables τ and z. At z = 1 (z = 0 in the corollary) it is the product formula of this node; nonvanishing then follows from absolute convergence.

**Uses.**

- MP.7/theta-multiplier: θ(z) ≠ 0 makes J(γ, z) = θ(γz)/θ(z) defined on the whole upper half plane, for γ ∈ Γ₀(4).
- MP.7/theta-residue-normalization: the residue ½θ of the half-weight Eisenstein family is a nowhere vanishing form, used for its Petersson normalization.
- QSeriesPartitionsAndMockModularForms:QM.1 (theta and eta multipliers, Jacobi forms): QM.1 requires MP.7 and MP.8; it imports this theorem rather than planning it, which removes the citation of QM.1 from MP.7.

**Acceptance.**

- At τ = i: jacobiTheta i = π^{1/4}/Γ(3/4) ≈ 1.0864, and the product truncated at n = 2 agrees with it to three decimal places.
- Consistency with Mathlib: norm_jacobiTheta_sub_one_le gives ‖jacobiTheta τ − 1‖ < 1, hence nonvanishing, only where exp(−π Im τ) < 1/3. The theorem covers the whole half plane, including the region near the cusp τ = 1, where jacobiTheta tends to 0 and no such bound can apply.
- Non-example: the two-variable function vanishes, jacobiTheta₂ ((1 + τ)/2) τ = 0, because the factor with n = 1 of the two-variable triple product vanishes there. Nonvanishing is special to the specialisation z = 0.

**Prerequisites.** `ClassicalArithmeticCompletion:CA.4/theta-product-specialisations`, `mathlib:jacobiTheta`, `mathlib:jacobiTheta_eq_jacobiTheta₂`, `mathlib:tprod_one_add_ne_zero_of_summable`, `mathlib:HasFPowerSeriesAt.eq_formalMultilinearSeries`.

**Library.** module `TauCeti/NumberTheory/ModularForms/JacobiTheta/ProductFormula`, namespace `TauCeti`.

<a id="layer-mp-8"></a>

## MP.8 — Genus-two similitudes, Jacobi forms and cover-specific Eisenstein analysis

**Layer statement.** Construct the specific double cover of GSp(4,R) and its arithmetic/adelic realization used by BFH, including the similitude action and the compatible Heisenberg semidirect product defining the Jacobi group. The rank-one Mp₂ comparison and even-dimensional quaternionic theta kernel do not supply this object. Define Jacobi modular forms, theta decomposition, half-integral-weight automorphy factors and the genus-two genuine Eisenstein series attached to the elliptic newform. Prove the Fourier–Jacobi/Whittaker expansions with actual local test functions.

Develop the cover-specific constant-term, continuation, functional-equation and residue calculations required by BFH. Import analytic estimates from AutomorphicSpectralTheory only after proving their adaptation to this cover; linear-reductive-group results are not automatic suppliers. Prove convergence in the initial chamber, meromorphic continuation through the prescribed intertwining operators and the permitted Fourier-coefficient/residue interchanges. BSD.2 owns the final twist residue/positivity argument and local-condition selection. This is the BFH route budgeted: a proposed alternative does not erase its prerequisites without a proved replacement.

**Status.** Planned. 85 targets (0 new in the whole-roadmap pass).

What remains for this layer:

- The 85 accepted targets of MP.8 are those of the part MetaplecticAutomorphicForms--MP.8. R5 replaces its sixteen bare citations of MP.1, MP.2, MP.4 and MP.6 by node ids; R3 replaces the whole-stage GL₂ citation by R16.6/primitive-classical-bijection; R6 corrects the Gaussian norm of the genus-two theta series in MP.8/theta-pairing and MP.8/theta-components and certifies that the unfolding prefactor 1/(2mN³) needs no change; R1 moves the two BFH export interfaces of MP.7 here.
- (accepted part) The genuine induced topology, the dyadic comparison, the rank-two meromorphic continuation and the global compact transition of the Novodvorsky majorant remain as the part records them.

**Planets.** Genus-two symplectic similitudes ([`MP.8/positive-similitudes`](#n-mp-8-positive-similitudes)); Genus-two metaplectic double cover ([`MP.8/similitude-cover`](#n-mp-8-similitude-cover)); Genus-two theta series ([`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta)); Genus-two Jacobi Eisenstein series ([`MP.8/jacobi-eisenstein`](#n-mp-8-jacobi-eisenstein)); Novodvorsky transform ([`MP.8/novodvorsky-transform`](#n-mp-8-novodvorsky-transform)); BFH two-variable polar formula ([`MP.8/two-variable-polar-combination`](#n-mp-8-two-variable-polar-combination)).

**Dependencies.**

- AutomorphicFormsOnReductiveGroups:AF.1: `AutomorphicFormsOnReductiveGroups:AF.1`.
- AutomorphicFormsOnReductiveGroups:AF.5: `AutomorphicFormsOnReductiveGroups:AF.5`.
- AutomorphicLFunctionsAndLocalFactors:AL.3: `AutomorphicLFunctionsAndLocalFactors:AL.3`.
- AutomorphicSpectralTheory:AS.1: `AutomorphicSpectralTheory:AS.1`.
- AutomorphicSpectralTheory:AS.2: `AutomorphicSpectralTheory:AS.2`.
- GL2AutomorphicRepresentationsAndTransfer:R16.2: `GL2AutomorphicRepresentationsAndTransfer:R16.2`.
- MetaplecticAutomorphicForms:MP.1: `MetaplecticAutomorphicForms:MP.1`.
- MetaplecticAutomorphicForms:MP.2: `MetaplecticAutomorphicForms:MP.2`.
- MetaplecticAutomorphicForms:MP.4: `MetaplecticAutomorphicForms:MP.4`.
- MetaplecticAutomorphicForms:MP.6: `MetaplecticAutomorphicForms:MP.6`.
- Tau Ceti TauCetiRoadmap/ModularForms: `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.
- Tau Ceti TauCetiRoadmap/RepresentationTheory/CompactGroups: `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`.
- Pinned libraries: 23 declarations, listed under each target.

**Consumers outside the roadmap.** `RankZeroOneBSD:BSD.2/twist-series-residue`.

**Acceptance tests of the layer.**

- Genus-two symplectic similitudes: μ=1 recovers the native symplectic group.
- Genus-two metaplectic double cover: Central −1 acts as −1 on theta component vectors.
- Genus-two theta series: The denominator is 4a and the vector period is 2a.
- Genus-two Jacobi Eisenstein series: The detQ>0 restriction avoids identifying an extra component.
- Novodvorsky transform: The exponent is u−3/2 with dy₁/y₁.
- BFH two-variable polar formula: The three denominators are distinct functions of (u,s).

<a id="n-mp-8-fourier-shift"></a>

### Integral genus-two Fourier-index shift — `MP.8/fourier-shift`

construction · from the MP.8 part

**Statement.** For ℓ∈V and p=(Q,R), S_{a,c,ℓ}(p)=(Q′,R′), where R′=R−2aℓ and Q′(x)=Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)). This is a pair of a native integral quadratic form and an integral vector, for all integers a,c. Construct the new form using products of the native linear functionals x↦ℓ·x and x↦R·x, addition and integer scalar multiplication.

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

**Proof outline.**

1. Use dotProductBilin to obtain the two linear forms. Use QuadraticMap.linMulLin twice to obtain their square and product; combine them with Q using the existing Z-module operations on quadratic maps.
2. Pair that quadratic form with R−2aℓ. No half-integer division occurs in the native type. The BFH matrix expression follows by evaluating the associated polynomial: its symmetric cross term has coefficient −c/2.

**Sources.**

- BFH90, (2.9), printed p.552; lattice parameter in the proof on p.553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Uses.**

- BFH Proposition 2.2, (2.9)–(2.10): Express the elliptic-translation orbit of the Fourier index in integral coordinates.
- BFH (2.5)–(2.6), pp.552–554: Move an integral vector R to a prescribed lift ν of its residue class when defining C_j(g;U,ν). The analytic equality of coefficients is a separate obligation.
- RankZeroOneBSD:BSD.2, through MetaplecticAutomorphicForms:MP.8: Supply the indexing arithmetic used before actual genus-two Fourier coefficients enter the twist-series comparison; no nonvanishing is deduced from it.

**API.**

- `TauCeti.Jacobi.GenusTwo.fourierShift_fst_apply` (compatibility): For x∈V, the first projection evaluates to Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)); this is an equality in Z with the native quadratic-map evaluation.
- `TauCeti.Jacobi.GenusTwo.fourierShift_snd` (projection): The vector projection is R−2aℓ.
- `TauCeti.Jacobi.GenusTwo.fourierShift_zero` (simp): S_{a,c,0}(p)=p.
- `TauCeti.Jacobi.GenusTwo.fourierShift_add` (functoriality): S_{a,c,ℓ+k}(p)=S_{a,c,k}(S_{a,c,ℓ}(p)) for all ℓ,k,p.
- `TauCeti.Jacobi.GenusTwo.fourierShift_neg` (relation): S_{a,c,−ℓ}(S_{a,c,ℓ}(p))=p, including a=0 and c=0.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.fourierShift_zero_data` (computation): For a=1,c=8, p=(0,0) and ℓ=e₀, the output is (8x₀²,−2e₀), with x₀² the native coordinate quadratic form.
- `TauCeti.Jacobi.GenusTwo.fourierShift_other_cusp` (computation): For a=1,c=1 and the same zero data and shift, the output is (x₀²,−2e₀). This detects using c=N at both cusps.
- `TauCeti.Jacobi.GenusTwo.fourierShift_mixed_term` (computation): For a=c=1, Q=x₀x₁, R=e₀ and ℓ=e₁, the output is (x₁²,e₀−2e₁). Here Q has symmetric matrix off-diagonal entries 1/2, not 1.

**Acceptance.**

- The output remains integral for odd mixed coefficients and arbitrary c.
- Changing from j=0 to j=1 changes c from N to 1; it does not change the modulus 2a.
- For c=0 the quadratic part is fixed, but the vector still changes by −2aℓ.

**Prerequisites.** `mathlib:QuadraticForm`, `mathlib:QuadraticMap.linMulLin`, `mathlib:dotProductBilin`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-fourier-discriminant"></a>

### Discriminant quadratic form of a Fourier index — `MP.8/fourier-discriminant`

construction · from the MP.8 part

**Statement.** Define Δ_{a,c}(Q,R)=4aQ−c(R·−)² as a native integral quadratic form on V. The invariant is the entire quadratic form, not its determinant. Under BFH a=m/N, c=N^(1−j), its symmetric matrix is 4aT−cRRᵀ; multiplying that matrix by N gives exactly U=4mT−N^(2−j)RRᵀ in (2.10).

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

**Proof outline.**

1. Construct (R·−) with dotProductBilin and its square with QuadraticMap.linMulLin; combine with Q by the native quadratic-map module operations.
2. The BFH relation U=N·matrix(Δ) is an algebraic substitution. Native integral quadratic forms are represented by half-integral symmetric matrices, by the ordered-basis expansion; the particular Δ matrix has integral entries.

**Sources.**

- BFH90, (2.6), p.552, and (2.10), p.553: The source uses the integral symmetric matrix U. The native quadratic-form invariant is U/N, with the level factor kept explicit; the definitions are identified through the polynomial Q(x)=xᵀTx.

**Uses.**

- BFH (2.10), printed p.553: Classify exactly the integral translation orbits together with the vector residue class.
- BFH Proposition 2.2, (2.5)–(2.6): Index theta-expansion coefficients by U and ν without losing the level factor N.
- BFH Corollary 2.8 and RankZeroOneBSD:BSD.2: Provide the matrix-valued indexing convention before specialized scalar discriminants and twist coefficients are extracted.

**API.**

- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_apply` (compatibility): Δ_{a,c}(Q,R)(x)=4aQ(x)−c(R·x)² as an equality in Z under native quadratic-map evaluation.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero` (simp): Δ_{a,c}(0,0)=0 for all integers a,c.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero_vector` (compatibility): Δ_{a,c}(Q,0)=4a·Q in the native Z-module of quadratic forms.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_mixed` (computation): For a=c=1,Q=x₀x₁,R=0 and x=e₀+e₁, Δ(Q,R)(x)=4.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_negative` (non-example): For a=1,c=8,Q=0,R=e₀, Δ(Q,R)(e₀)=−8; positive definiteness is not part of the index type.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero_index` (degenerate): At a=0,c=1, Δ(x₀²,0)=Δ(0,0); this boundary case is excluded from orbit classification by a≠0.

**Acceptance.**

- The factor is 4a, not 2a; it retains mixed coefficients of a half-integral symmetric index.
- Δ is allowed to be zero, degenerate or negative on nonzero vectors.
- For N≠0, equality of the BFH matrices U is equivalent to equality of the corresponding Δ forms, by cancellation and quadratic-form extensionality.

**Prerequisites.** `mathlib:QuadraticForm`, `mathlib:QuadraticMap.linMulLin`, `mathlib:dotProductBilin`, `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-discriminant-shift"></a>

### Discriminant invariance under an integral shift — `MP.8/discriminant-shift`

lemma · from the MP.8 part

**Statement.** For every a,c∈Z, ℓ∈V and p, Δ_{a,c}(S_{a,c,ℓ}(p))=Δ_{a,c}(p).

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

**Proof outline.**

1. Unfold the two constructions and evaluate on x using native product-linear-form evaluation. Set r=R·x and t=ℓ·x.
2. Expand 4a[Q(x)+c(at²−rt)]−c(r−2at)². The cross and square terms cancel, leaving 4aQ(x)−cr². Use QuadraticMap.ext to conclude.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- The identity holds at a=0, c=0 and negative a,c; no cancellation by a is used.
- For p=(0,0),a=1,c=8,ℓ=e₀ the shifted data (8x₀²,−2e₀) still have zero discriminant.
- Changing only the sign of the cross term in the shift destroys the cancellation.

**Prerequisites.** [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), [`MP.8/fourier-discriminant`](#n-mp-8-fourier-discriminant), `mathlib:QuadraticMap.linMulLin_apply`, `mathlib:QuadraticMap.ext`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-residue-shift"></a>

### Residue invariance of the vector index — `MP.8/residue-shift`

lemma · from the MP.8 part

**Statement.** For all a,c∈Z, p, ℓ and i∈{0,1}, the vector coordinate of S_{a,c,ℓ}(p) is congruent to R_i modulo 2a.

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

**Proof outline.**

1. Unfold the vector projection. The difference R_i−(R_i−2aℓ_i)=2aℓ_i is divisible by 2a.
2. Apply Int.modEq_iff_dvd. This argument also works at a=0, when congruence modulo zero means equality.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- At a=2, shifting R by any ℓ changes each coordinate by a multiple of 4.
- At a=0 every vector index stays unchanged.
- The modulus is 2m/N at both cusps, rather than 2m.

**Prerequisites.** [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), `mathlib:Int.ModEq`, `mathlib:Int.modEq_iff_dvd`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-recover-quadratic"></a>

### Recovery from a discriminant and fixed vector — `MP.8/recover-quadratic`

lemma · from the MP.8 part

**Statement.** Assume a≠0. If p=(Q,R) and q=(Q′,R′) satisfy R=R′ and Δ_{a,c}(p)=Δ_{a,c}(q), then p=q.

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.
- a≠0.

**Proof outline.**

1. Evaluate the discriminant equality at arbitrary x with QuadraticMap.congr_fun and substitute R=R′. Cancel the identical square term by integer addition.
2. This leaves 4aQ(x)=4aQ′(x). Since 4a≠0 in Z, apply mul_left_cancel₀.
3. Use QuadraticMap.ext and equality of the vector components to conclude equality of pairs.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- At a=0, p=(0,0) and q=(x₀²,0) have equal discriminants and vectors but are different pairs.
- No condition on c is needed, including c=0.
- Equality of determinants of Δ is not enough: when R=0,a=1, Q=x₀² and Q′=x₁² have equal zero determinants but are different forms.

**Prerequisites.** [`MP.8/fourier-discriminant`](#n-mp-8-fourier-discriminant), `mathlib:QuadraticMap.congr_fun`, `mathlib:QuadraticMap.ext`, `mathlib:mul_left_cancel₀`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-shift-parameter-injective"></a>

### Uniqueness of the integral shift parameter — `MP.8/shift-parameter-injective`

lemma · from the MP.8 part

**Statement.** Assume a≠0. For a fixed p, the map ℓ↦S_{a,c,ℓ}(p) is injective.

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.
- a≠0.

**Proof outline.**

1. Equality of shifted pairs implies equality of vector projections. Cancel R coordinatewise to obtain 2aℓ_i=2ak_i.
2. Since 2a≠0, use mul_left_cancel₀ in each coordinate and function extensionality. The quadratic component is not needed.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- For p=(0,0),a=0 all shifts give p, showing why nonzero a is required.
- The result includes c=0, when only the vector part detects the shift.
- For a=1, vector −2e₀ can be reached from 0 only by ℓ=e₀.

**Prerequisites.** [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), `mathlib:mul_left_cancel₀`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-orbit-classification"></a>

### Classification of genus-two Fourier-index orbits — `MP.8/orbit-classification`

theorem · from the MP.8 part

**Statement.** Assume a≠0. For p=(Q,R) and q=(Q′,R′), there exists ℓ∈V with S_{a,c,ℓ}(p)=q if and only if Δ_{a,c}(p)=Δ_{a,c}(q) and R_i≡R′_i modulo 2a for both coordinates.

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.
- a≠0.

**Proof outline.**

1. Forward: discriminant-shift and residue-shift give the two invariants, after replacing the shifted pair by q and reversing equalities/congruences as needed.
2. Reverse: use Int.modEq_iff_dvd to choose t_i with R′_i−R_i=2at_i and put ℓ_i=−t_i. Then the shifted pair p₁ has vector R′.
3. Discriminant-shift and the assumed equality give Δ(p₁)=Δ(q). Apply recover-quadratic to p₁ and q. No analytic Fourier expansion, division in Z, or representative selection beyond the two divisibility witnesses is needed.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- Equal residues alone fail for p=(0,0),q=(x₀²,0),a=c=1.
- Equal discriminants alone fail for p=(0,e₀),q=(0,−e₀),a=2,c=1: their vector residues modulo 4 differ.
- At a=0,c=1, the distinct pairs (0,0) and (x₀²,0) satisfy both invariant conditions but are not shift-equivalent.
- Substituting the two BFH cusp scalings gives exactly (2.10) with U=N·matrix(Δ).

**Prerequisites.** [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), [`MP.8/fourier-discriminant`](#n-mp-8-fourier-discriminant), [`MP.8/discriminant-shift`](#n-mp-8-discriminant-shift), [`MP.8/residue-shift`](#n-mp-8-residue-shift), [`MP.8/recover-quadratic`](#n-mp-8-recover-quadratic), `mathlib:Int.modEq_iff_dvd`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-unique-residue-lift"></a>

### Unique Fourier index with a prescribed residue lift — `MP.8/unique-residue-lift`

theorem · from the MP.8 part

**Statement.** Assume a≠0. Given p=(Q,R) and ν∈V with ν_i≡R_i modulo 2a, there exists exactly one integral quadratic form Q_ν such that Δ_{a,c}(Q_ν,ν)=Δ_{a,c}(p).

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.
- a≠0.

**Proof outline.**

1. Use Int.modEq_iff_dvd to choose ℓ with R−2aℓ=ν. Take Q_ν to be the quadratic component of S_{a,c,ℓ}(p).
2. Discriminant-shift proves the required equality. For two candidates, recover-quadratic applies because both vector components equal ν; their quadratic components are equal.
3. The theorem prescribes an arbitrary lift ν. It neither selects a canonical residue representative nor asserts that every arbitrary pair (Δ,ν) is represented by an integral Fourier index.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- For p=(0,0),a=1,c=8 and ν=−2e₀, the unique form is 8x₀².
- For ν=R the unique form is Q.
- At a=0 the pair p=(0,0),ν=0 admits every integral quadratic form and uniqueness fails.

**Prerequisites.** [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), [`MP.8/fourier-discriminant`](#n-mp-8-fourier-discriminant), [`MP.8/discriminant-shift`](#n-mp-8-discriminant-shift), [`MP.8/recover-quadratic`](#n-mp-8-recover-quadratic), `mathlib:Int.modEq_iff_dvd`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-coefficient-invariants"></a>

### Coefficient equality from shift invariance — `MP.8/coefficient-invariants`

lemma · from the MP.8 part

**Statement.** Assume a≠0. Let A be any type and B a function from the native Fourier data pairs to A. Assume explicitly B(S_{a,c,ℓ}(p))=B(p) for every ℓ,p. If p and q have equal discriminant forms and coordinatewise congruent vector indices modulo 2a, then B(p)=B(q).

**Hypotheses.**

- V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V.
- The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.
- a≠0.

**Proof outline.**

1. Use orbit-classification to choose ℓ with S_{a,c,ℓ}(p)=q.
2. Substitute that equality into the assumed shift-invariance identity. Symmetry gives B(p)=B(q). The codomain needs no linear, topological or analytic structure.

**Sources.**

- BFH90, Proposition 2.2 proof, (2.9)–(2.10) and the paragraph defining C_j, pp.552–553: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

**Acceptance.**

- A constant function satisfies the premise for every codomain with a chosen value.
- Taking B(p)=R₀ violates shift invariance at a≠0 and cannot be used as an actual invariant coefficient.
- This lemma does not establish BFH (2.9) for the analytic coefficient B_j: that premise requires its holomorphy and contour-translation argument.

**Prerequisites.** [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), [`MP.8/fourier-discriminant`](#n-mp-8-fourier-discriminant), [`MP.8/orbit-classification`](#n-mp-8-orbit-classification).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-siegel-space"></a>

### Siegel upper half-space of degree two — `MP.8/siegel-space`

definition · from the MP.8 part

**Statement.** H₂ is the subtype of complex symmetric 2×2 matrices Z with native positive-definite real matrix Im Z. It has the induced topology and the complex-manifold structure on the three independent symmetric coordinates. The positivity condition is strict.

**Proof outline.**

1. Use the symmetric subspace of M₂(C), with coordinates (Z₂₂,Z₁₂,Z₁₁). Strict positive definiteness cuts out an open convex domain.
2. Use native Matrix.PosDef; identify real quadratic positivity with its finite-dimensional dot-product criterion.

**Sources.**

- BFH90, §1, p.546, definition of H₂: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §1, pp.545–546, unnumbered GSp⁺ definition and fractional-linear action: Uses siegel upper half-space of degree two in positive genus-two symplectic similitudes: GSp₄⁺(R) consists of pairs (g,μ), g∈GL₄(R), μ∈Rˣ positive, satisfying gᵀJg=μJ for native J=[[0,−I],[I,0]]. Multiplication multiplies both components. μ is uniquely determined by g. On H₂, gZ=(AZ+B)(CZ+D)⁻¹; CZ+D is invertible and Im(gZ)=μ(C conjugate(Z)+D)⁻ᵀ Im(Z)(CZ+D)⁻¹.
- BFH §2, p.551, (2.1): Uses siegel upper half-space of degree two in bfh genus-two theta series: For positive integer a and ν∈Z², specialize the MP.6 theta kernel to θᵃ_ν(Z,W)=Σ_{R∈Z², R≡ν mod 2a} e(Z[R]/(4a)+RᵀW). The series is normally convergent on H₂×C². Its finite residue set is (Z/(2a)Z)², of size (2a)². No rank-one Jacobi-form definition is introduced here.
- BFH §2, pp.551–553, definition of θ and Proposition 2.1: Control the least eigenvalue of Im Z on compact subsets, giving uniform Gaussian majorants for the theta series and its coordinate derivatives.

**API.**

- `TauCeti.Jacobi.GenusTwo.siegelSpace_mem` (characterisation): Membership is Zᵀ=Z and (Im Z).PosDef.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_im_pos` (projection): For Z∈H₂, (Im Z).PosDef.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_base` (constructor): iI₂ is in H₂.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.siegelSpace_diagonal` (computation): diag(i,2i) belongs to H₂.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_real` (non-example): I₂ is not in H₂.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_asymmetric` (non-example): [[i,1],[0,i]] is not in H₂.

**Acceptance.**

- iI₂ belongs; zero imaginary part does not.
- A positive imaginary part cannot excuse an asymmetric complex matrix.

**Prerequisites.** `mathlib:Matrix.PosDef`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-positive-similitudes"></a>

### Positive genus-two symplectic similitudes — `MP.8/positive-similitudes`

construction · from the MP.8 part · planet “Genus-two symplectic similitudes”

**Statement.** GSp₄⁺(R) consists of pairs (g,μ), g∈GL₄(R), μ∈Rˣ positive, satisfying gᵀJg=μJ for native J=[[0,−I],[I,0]]. Multiplication multiplies both components. μ is uniquely determined by g. On H₂, gZ=(AZ+B)(CZ+D)⁻¹; CZ+D is invertible and Im(gZ)=μ(C conjugate(Z)+D)⁻ᵀ Im(Z)(CZ+D)⁻¹.

**Proof outline.**

1. The relation defines a subgroup of GL₄(R)×Rˣ; positivity is multiplicative and inverse-stable.
2. Use symplectic block equations after μ⁻¹/² normalization to prove denominator invertibility, symmetry and the imaginary-part formula.

**Sources.**

- BFH90, §1, pp.545–546, unnumbered GSp⁺ definition and fractional-linear action: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §1, p.546, unnumbered fractional-linear action; §2, p.552, (2.7): Uses positive genus-two symplectic similitudes in positive similitude action on siegel space: Define the continuous left action of GSp₄⁺(R) on H₂ by the fractional formula. The factor d(g,Z)=det(CZ+D)/μ(g) is nonzero, holomorphic in Z, satisfies d(gh,Z)=d(g,hZ)d(h,Z), and equals 1 for positive scalar matrices.
- BFH §1, pp.546–549, (1.4)–(1.9): Track the Heisenberg center under t↦μ(g)t and the resulting central-character transport; pull the action back along the rank-two cover projection.

**API.**

- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_mem` (characterisation): (g,μ) is a member exactly when μ>0 and gᵀJg=μJ.
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_multiplier_mul` (functoriality): The multiplier of gh is μ(g)μ(h).
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_symplectic` (compatibility): The μ=1 matrix relation agrees with SymplecticGroup.mem_iff'.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_scalar` (computation): 2I₄ satisfies the relation with μ=4.
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_reflection` (non-example): diag(I₂,−I₂) has μ=−1 and is excluded.
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_base_action` (computation): fractional(2I₄,iI₂)=iI₂.

**Acceptance.**

- μ=1 recovers the native symplectic group.
- Positive scalar tI₄ has μ=t² and fixes every Z.

**Prerequisites.** [`MP.8/siegel-space`](#n-mp-8-siegel-space), `mathlib:Matrix.symplecticGroup`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-siegel-action"></a>

### Positive similitude action on Siegel space — `MP.8/siegel-action`

construction · from the MP.8 part

**Statement.** Define the continuous left action of GSp₄⁺(R) on H₂ by the fractional formula. The factor d(g,Z)=det(CZ+D)/μ(g) is nonzero, holomorphic in Z, satisfies d(gh,Z)=d(g,hZ)d(h,Z), and equals 1 for positive scalar matrices.

**Proof outline.**

1. Use the positive-similitude imaginary-part formula to construct an H₂-valued map.
2. Multiply block matrices to prove the action and determinant cocycle laws; divide by the multiplicative positive multiplier.

**Sources.**

- BFH90, §1, p.546, unnumbered fractional-linear action; §2, p.552, (2.7): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §2, pp.552–554, (2.7)–(2.14); §8, p.601: Use the Siegel action in the square-root cocycle h(g′Z)h′(Z) and compare the μ=1 restriction with the intrinsic metaplectic cover.
- BFH §1, pp.548–549, (1.12)–(1.17): Uses positive similitude action on siegel space in compact stabilizer and positive scalar factor: Let K=Sp₄(R)∩O₄(R). The stabilizer of iI₂ in Sp₄(R) is K, K≅U(2) by A+iB↦[[A,B],[−B,A]], and the stabilizer in GSp₄⁺(R) is R_{>0}·K. The Iwasawa representation g=t n(X)diag(Q,Q⁻ᵀ)κ with t>0, Q upper triangular with positive diagonal, κ∈K is unique.
- BFH §1, p.547, (1.1): Evaluate the transformed Siegel coordinate and CZ+D factor in the BFH realization of the imported symplectic Jacobi action.

**API.**

- `TauCeti.Jacobi.GenusTwo.siegelAction_one` (simp): 1 acts identically.
- `TauCeti.Jacobi.GenusTwo.siegelAction_mul` (functoriality): (gh)Z=g(hZ).
- `TauCeti.Jacobi.GenusTwo.siegelFactor_cocycle` (relation): d(gh,Z)=d(g,hZ)d(h,Z).
- `TauCeti.Jacobi.GenusTwo.siegelAction_apply` (projection): The underlying matrix of the native Siegel-space action is (AZ+B)(CZ+D)⁻¹, matching the raw block formula.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.siegelAction_scalar` (computation): 2I₄ fixes iI₂.
- `TauCeti.Jacobi.GenusTwo.siegelAction_translation` (computation): n(I₂) sends iI₂ to (1+i)I₂.
- `TauCeti.Jacobi.GenusTwo.siegelAction_fourier` (computation): J sends iI₂ to iI₂ (JZ=−Z⁻¹).

**Acceptance.**

- Normalization removes the positive scalar action on automorphy factors.
- No pointwise choice of square root is asserted to be multiplicative.

**Prerequisites.** [`MP.8/positive-similitudes`](#n-mp-8-positive-similitudes).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-similitude-cover"></a>

### Genus-two square-root double cover — `MP.8/similitude-cover`

construction · from the MP.8 part · planet “Genus-two metaplectic double cover”

**Statement.** The positive real cover consists of (g,h), g∈GSp₄⁺(R), h:H₂→C continuous with h(Z)²=d(g,Z). Multiplication is (g,h)(g',h')=(gg',Z↦h(g'Z)h'(Z)). Its projection is a continuous surjective homomorphism with kernel {(1,1),(1,−1)}. On μ=1 compare it with MP.1's intrinsic metaplectic double cover, preserving the central sign; positive scalars split by h=1.

**Proof outline.**

1. Nonzero determinant factors have continuous square roots on the simply connected H₂; the cocycle makes multiplication well defined.
2. A continuous square root of 1 is constant because H₂ is connected, giving exactly two lifts. Compare generator lifts with MP.1, rather than identify two covers just because both have degree two.

**Sources.**

- BFH90, §2, pp.552–554, (2.7)–(2.14); §8, p.601: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, pp.557–559, (3.1)–(3.8): Use the BFH section and its chosen cover branch in the archimedean Whittaker integral, with the prescribed finite K-type.
- BFH §1, pp.546–549, (1.4)–(1.9): Track the Heisenberg center under t↦μ(g)t and the resulting central-character transport; pull the action back along the rank-two cover projection.
- BFH §1, pp.545–546, definition of GSp⁺(4,R): Use the positive-cover cocycle to construct the conjugation involution and its chosen split extension across the negative real component; comparison with adelic lifts remains separate.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

**API.**

- `TauCeti.Jacobi.GenusTwo.similitudeCover_square` (projection): h(Z)²=d(g,Z).
- `TauCeti.Jacobi.GenusTwo.similitudeCover_mul_root` (relation): The root of the product at Z is h(g'Z)h'(Z).
- `TauCeti.Jacobi.GenusTwo.similitudeCover_kernel` (characterisation): For g=1, the root is identically 1 or identically −1.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.similitudeCover_two_lifts` (non-example): The constant roots 1 and −1 are distinct lifts of the identity.
- `TauCeti.Jacobi.GenusTwo.similitudeCover_base_branch` (computation): √(−det(iI₂))=1.
- `TauCeti.Jacobi.GenusTwo.similitudeCover_scaled_branch` (computation): √(−det(2iI₂))=2, detecting the determinant rather than entrywise square root.

**Acceptance.**

- Central −1 acts as −1 on theta component vectors.
- Fourier lift has root i√(−det Z), with √(−det Z) positive at Z=iY; the theta S-matrix includes the compensating Weil phase; normalized positive scalars have the canonical lift 1.

**Prerequisites.** [`MP.8/siegel-action`](#n-mp-8-siegel-action), `MetaplecticAutomorphicForms:MP.1`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Cover`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 1: replace the bare stage `MP.1` by [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover). verified: the node compares its square-root cover on μ = 1 with the intrinsic double cover, which is MP.1/metaplectic-double-cover (moved to MP.2 by R1, id unchanged).

<a id="n-mp-8-compact-stabilizer"></a>

### Compact stabilizer and positive scalar factor — `MP.8/compact-stabilizer`

theorem · from the MP.8 part

**Statement.** Let K=Sp₄(R)∩O₄(R). The stabilizer of iI₂ in Sp₄(R) is K, K≅U(2) by A+iB↦[[A,B],[−B,A]], and the stabilizer in GSp₄⁺(R) is R_{>0}·K. The Iwasawa representation g=t n(X)diag(Q,Q⁻ᵀ)κ with t>0, Q upper triangular with positive diagonal, κ∈K is unique.

**Proof outline.**

1. Solve the stabilizer block equations after dividing g by √μ; the equations are exactly unitarity of A+iB.
2. Use real positive-definite Cholesky coordinates for Im(g·iI₂), then solve the residual compact factor. The source stabilizer sentence is corrected as E-MP8-2.

**Sources.**

- BFH90, §1, pp.548–549, (1.12)–(1.17): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- 2I₄ fixes iI₂ and is outside K.
- K-type decomposition uses K, not its noncompact positive-scalar enlargement.

**Prerequisites.** [`MP.8/siegel-action`](#n-mp-8-siegel-action), `tauceti:TauCeti.choleskyEquiv`, `mathlib:Matrix.unitaryGroup`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-arithmetic-subgroup"></a>

### BFH arithmetic subgroup — `MP.8/arithmetic-subgroup`

definition · from the MP.8 part

**Statement.** For N>0, Γ_N is the subgroup of Sp₄(Z) with C≡0 mod N, A₂₁≡D₁₂≡0 mod N. Conjugate by J to obtain the second cusp group. The elliptic lattices are (λ,ρ)∈Z²×N⁻¹Z² at cusp zero and N⁻¹Z²×Z² at cusp one; the center is fixed by ψ_m(t)=e(mt).

**Proof outline.**

1. Take the inverse image of the corresponding block subgroup over Z/NZ under reduction of the native integral symplectic group.
2. Conjugation by J swaps the two translation lattices. Check the central phase with N|m before identifying the arithmetic Jacobi subgroup.

**Sources.**

- BFH90, §1, p.547, (1.6)–(1.9): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §1, p.547, (1.6)–(1.9): Specialize the MP.6 Jacobi carrier to Γ_N and J⁻¹Γ_NJ and the two BFH elliptic lattices, retaining smoothness and W-holomorphy for scalar and finite-dimensional vector coefficients.
- BFH §1, p.549, definition of E_s: Use the actual intersection P∩Γ_N to index the Eisenstein sum and prove representative independence from the seed covariance before asserting convergence.
- BFH §1, pp.545–549; §2, p.553, (2.6): Identify the real lift of Γ_N with the MP.4 rational splitting and the prescribed finite theta vector, including its dyadic compact-open stabilizer.

**API.**

- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_mem` (characterisation): Membership has exactly the three printed block congruences.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_one` (simp): Identity is a member for every N.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_upper` (characterisation): n(X) is a member for each integral symmetric X.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_upper_example` (computation): n([[0,1],[1,0]])∈Γ₈.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_lower_example` (non-example): [[I,0],[I,I]] is not in Γ₈.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_level_one` (compatibility): Γ₁ equals the native Sp₄(Z).

**Acceptance.**

- The off-diagonal restrictions are A₂₁ and D₁₂, not both positions in each block.
- The two translation lattices are different.

**Prerequisites.** `mathlib:Matrix.symplecticGroup`, `MetaplecticAutomorphicForms:MP.6`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 2: replace the bare stage `MP.6` by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group). verified: the node defines Γ_N in Sp₄(ℤ) and the two Heisenberg lattices of the arithmetic Jacobi subgroup; the group in which they live is MP.6/jacobi-group.

<a id="n-mp-8-bfh-slash"></a>

### BFH symplectic Jacobi slash operator — `MP.8/bfh-slash`

construction · from the MP.8 part

**Statement.** For m∈Z and γ∈Sp₄(R), on functions Φ(g,W) define (Φ|γ)(g,W)=e(−m Wᵀ(CZ_g+D)⁻¹CW) Φ(γg,(CZ_g+D)⁻ᵀW). This is the coordinate realization of the imported MP.6 Jacobi action with central character ψ_m. The operator is restricted to the symplectic factor; extending it to similitudes requires scaling the central character.

**Proof outline.**

1. Specialize the imported Jacobi action to W=R⁴ with its standard polarization, then read its Schrödinger multiplier in BFH coordinates.
2. Prove the right slash composition identity using the determinant-free quadratic cocycle and the transformed W.

**Sources.**

- BFH90, §1, p.547, (1.1): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §1, p.547, (1.2)–(1.5): Check the central phase when combining a symplectic slash with elliptic translations; the BFH lattice kills the phase under N|m.
- BFH §2, pp.551–553, (2.2)–(2.3): Use the slash covariance to identify the normalized two-cusp Fourier coefficient, retaining both its level factors and the exponential in the Siegel coordinate.
- BFH Proposition 2.2, p.552, (2.7)–(2.8): Uses bfh symplectic jacobi slash operator in fourier law for bfh theta components: For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

**API.**

- `TauCeti.Jacobi.GenusTwo.bfhSlash_one` (simp): Φ|1=Φ on positive-similitude arguments.
- `TauCeti.Jacobi.GenusTwo.bfhSlash_mul` (functoriality): (Φ|γ)|γ'=Φ|(γγ').
- `TauCeti.Jacobi.GenusTwo.bfhSlash_fourier` (compatibility): Φ|J=e(−m Z_g⁻¹[W])Φ(Jg,Z_g⁻¹W).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.bfhSlash_zero` (degenerate): The slash of the zero function is zero.
- `TauCeti.Jacobi.GenusTwo.bfhSlash_unipotent` (computation): At γ=n(B), symmetric B, there is no quadratic multiplier and W is unchanged.
- `TauCeti.Jacobi.GenusTwo.bfhSlash_fourier_at_base` (computation): At g=I and γ=J, the W argument is −iW and the multiplier is e(mi WᵀW).

**Acceptance.**

- The inverse transpose on W is essential.
- Slash by a positive scalar outside Sp is not silently part of this operator.

**Prerequisites.** [`MP.8/siegel-action`](#n-mp-8-siegel-action), `MetaplecticAutomorphicForms:MP.6`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 3: replace the bare stage `MP.6` by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces). verified: the BFH slash operator is the coordinate form of the Jacobi action of MP.6/jacobi-group on the functions of MP.6/jacobi-spaces with central character ψ_m.

<a id="n-mp-8-bfh-translation"></a>

### BFH elliptic translation operator — `MP.8/bfh-translation`

construction · from the MP.8 part

**Statement.** Define (Φ||[λ;ρ])(g,W)=e(m Z_g[λ]+2m Wᵀλ) Φ(g,W+Z_gλ+ρ), for real λ,ρ. For the order (Φ||[λ;ρ])||[κ;ν], the operator at [λ+κ;ρ+ν] is multiplied by e(2mνᵀλ). The lattice used by BFH kills this scalar because N|m. This is an explicit specialization of the MP.6 Heisenberg central character, not a commutative translation action over arbitrary reals.

**Proof outline.**

1. Substitute twice and expand the quadratic polynomial to obtain the central phase.
2. Compare with the chosen MP.0/MP.6 polarization and use the congruence N|m for the two arithmetic lattices.

**Sources.**

- BFH90, §1, p.547, (1.2)–(1.5): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §2, pp.551–553, (2.2)–(2.3): Fix the two elliptic periods and the N-dependent vector frequency in normalized Fourier extraction; retain the exponential in Z_g removed from the coefficient.
- BFH §2, pp.552–553, (2.9): Uses bfh elliptic translation operator in holomorphic contour shift for fourier coefficients: If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).
- BFH §1, p.547, (1.6)–(1.9): Impose translation invariance at cusp j for N^(−j)Z²×N^(j−1)Z² and prove that its central phase is integral when N divides m.

**API.**

- `TauCeti.Jacobi.GenusTwo.bfhTranslate_zero` (simp): Translation by [0;0] is identity.
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_comp` (relation): The order (Φ||[λ;ρ])||[κ;ν] has central phase e(2mνᵀλ).
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_linear` (functoriality): Translation preserves pointwise addition.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.bfhTranslate_integer_phase` (computation): At m=8, ν=e₀/8, λ=e₀ the phase is e(2)=1.
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_real_phase` (non-example): At m=1, ν=e₀/4, λ=e₀ the phase is −1.
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_constant_at_base` (computation): At m=1, λ=e₀, ρ=0, g=I, W=0, translation of constant 1 is exp(−2π).

**Acceptance.**

- Nonintegral central phase remains in real translation composition.
- Cusp-one translation invariance follows by J covariance, not by reusing the cusp-zero lattice.
- With the composition order (Φ||[λ;ρ])||[κ;ν], the central phase is e(2m ν·λ).

**Prerequisites.** [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), `MetaplecticAutomorphicForms:MP.6`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 4: replace the bare stage `MP.6` by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.0/bilinear-factor-set`](#n-mp-0-bilinear-factor-set), [`MP.0/polarization-equivalence`](#n-mp-0-polarization-equivalence). verified: the translation operators are the Heisenberg part of the Jacobi action. The phase e(2mνᵀλ) of their composition is ψ_m of the bilinear cocycle B((λ, ρ), (κ, ν)) = 2νᵀλ, the group law of the extension E_B of MP.0/bilinear-factor-set, which MP.0/polarization-equivalence identifies with the half-form Heisenberg group used by MP.6/jacobi-group.

<a id="n-mp-8-genus-two-theta"></a>

### BFH genus-two theta series — `MP.8/genus-two-theta`

construction · from the MP.8 part · planet “Genus-two theta series”

**Statement.** For positive integer a and ν∈Z², specialize the MP.6 theta kernel to θᵃ_ν(Z,W)=Σ_{R∈Z², R≡ν mod 2a} e(Z[R]/(4a)+RᵀW). The series is normally convergent on H₂×C². Its finite residue set is (Z/(2a)Z)², of size (2a)². No rank-one Jacobi-form definition is introduced here.

**Proof outline.**

1. Use the general theta convergence theorem at the positive-definite rank-two lattice; alternatively the least eigenvalue supplies a locally uniform Gaussian majorant.
2. Identify the coset sum with the imported theta convention and prove residue representative independence. In diagonal coordinates factor the sum into the existing two-variable classical theta functions.

**Sources.**

- BFH90, §2, p.551, (2.1): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH Proposition 2.1, p.551: Uses bfh genus-two theta series in gaussian orthogonality of genus-two theta series: For a>0, Z=X+iY∈H₂ and μ,ν∈Z², the Lebesgue integral over C²/(Z Z²+Z²) of θᵃ_μ(Z,W) conjugate(θᵃ_ν(Z,W)) exp(−4πa Y⁻¹[Im W]) is √det(Y)/(2a) if μ≡ν mod 2a, and zero otherwise. In W=Zλ+ρ coordinates the measure is det(Y)dλdρ on [0,1)^4.
- BFH §2, p.554, (2.12)–(2.13): Uses bfh genus-two theta series in genus-two theta fourier transform: For a>0 and Z∈H₂, θᵃ_ν(−Z⁻¹,Z⁻¹W)=e(aZ⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod2a} e(−νᵀμ/(2a))θᵃ_μ(Z,W). The holomorphic branch √(−det Z) is positive when Z=iY. The finite Fourier matrix has square equal to residue negation after normalization by 1/(2a).
- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Project onto the finite residue-indexed theta basis using the Gaussian pairing, and prove reconstruction only after the elliptic transformation and normal-convergence arguments.

**API.**

- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_residue` (relation): θᵃ_{ν+2aℓ}=θᵃ_ν.
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_elliptic` (compatibility): θ(Z,W)=e(aZ[λ]+2aWᵀλ)θ(Z,W+Zλ+ρ) for integral λ,ρ.
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_diagonal` (compatibility): At ν=0 and diagonal Z, θ=∏i jacobiTheta₂(2aW_i,2aZ_ii).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_negation` (characterisation): θᵃ_{−ν}(Z,−W)=θᵃ_ν(Z,W).
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_period` (computation): θ¹_(2,0)=θ¹_(0,0).
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_product` (compatibility): θ¹_0(iI₂,0)=jacobiTheta₂(0,2i)².

**Acceptance.**

- The denominator is 4a and the vector period is 2a.
- Normal convergence includes all derivatives on compact subsets.

**Prerequisites.** [`MP.8/siegel-space`](#n-mp-8-siegel-space), `MetaplecticAutomorphicForms:MP.6`, `mathlib:jacobiTheta₂`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 5: replace the bare stage `MP.6` by [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface), [`MP.5/theta-kernel`](#n-mp-5-theta-kernel). verified: θᵃ_ν are the Jacobi theta functions of index a of the decomposition interface, and the convention for summing a transformed Schwartz function over a lattice is that of MP.5/theta-kernel; normal convergence is the node's own Gaussian estimate (MP.8/theta-normal-convergence).

<a id="n-mp-8-quadratic-matrix"></a>

### Half-integral matrix dictionary — `MP.8/quadratic-matrix`

construction · from the MP.8 part

**Statement.** For native Q:QuadraticForm Z Z², put A=Q(e₀), C=Q(e₁), B=Q(e₀+e₁)−A−C. Define T(Q)=[[A,B/2],[B/2,C]] in M₂(Q). This identifies native integral quadratic forms with symmetric rational matrices having integral diagonal and twice-integral off-diagonal. Q(x)=xᵀT(Q)x for integral x.

**Proof outline.**

1. Expand Q in the ordered coordinate basis by the native basis expansion, valid without inverting 2 over Z.
2. Only after embedding coefficients into Q divide the mixed term by two. The reverse construction uses native products of coordinate linear forms.

**Sources.**

- BFH90, §2, pp.551–553, (2.2),(2.9): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §2, pp.551–553, (2.2)–(2.3): Convert a native integral quadratic form into the half-integral matrix T in the Fourier phase, keeping each mixed coefficient as twice the corresponding matrix entry.
- BFH §2, pp.552–553, before Proposition 2.2: Recover the Fourier index from U=4mT−N^(2−j)R Rᵀ only when the resulting T is half integral; use the shift theorem to justify residue independence for BFH coefficients.
- BFH §5, p.580, definition of H before Proposition 5.1: Insert the half-integral matrix into tr(TZ) and verify the discriminant substitution that cancels the quadratic R term in the unfolded kernel.

**API.**

- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_symmetric` (projection): T(Q) is symmetric.
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_eval` (compatibility): For integral x, xᵀT(Q)x=Q(x).
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_injective` (characterisation): The matrix dictionary is injective.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_mixed` (computation): T(x₀x₁)=[[0,1/2],[1/2,0]].
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_square` (computation): T(x₀²)=diag(1,0).
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_negative` (non-example): T(−x₀²)=diag(−1,0); no positivity condition is included.

**Acceptance.**

- Q=x₀x₁ maps to off-diagonal 1/2.
- U=4mT−N^(2−j)RRᵀ equals N times the rational matrix of the retained discriminant form with a=m/N,c=N^(1−j).

**Prerequisites.** `mathlib:QuadraticForm`, `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`, `mathlib:QuadraticMap.toQuadraticMap_toBilin`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-fourier-coefficient"></a>

### BFH Fourier coefficient extraction — `MP.8/fourier-coefficient`

definition · from the MP.8 part

**Statement.** For j=0 or 1, define B_j(g;T,R)=N^(−3j)∫_{[0,N^j)^3}∫_{[0,1)^2} Φ_j(n(X)g,W)e(−N^(−j)tr(T(Z_g+X))−N^(1−j)RᵀW)dW dX. X=[[x₄,x₃],[x₃,x₁]], T is the half-integral matrix of Q, R∈Z², and both measures are coordinate Lebesgue measures. The coefficient excludes the exponential in Z_g; it is not the unnormalized torus Fourier integral.

**Proof outline.**

1. Transport coordinate Lebesgue measures from R³ and R²; integrate over half-open fundamental boxes.
2. The three X periods contribute N^(3j), explaining the normalization. Exponentials use the full trace, hence the mixed entry appears twice.

**Sources.**

- BFH90, §2, pp.551–553, (2.2)–(2.3): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §2, pp.552–553, (2.9): Uses bfh fourier coefficient extraction in holomorphic contour shift for fourier coefficients: If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).
- BFH §2, pp.552–553, before Proposition 2.2: Specialize B_j to T=(U+N^(2−j)ννᵀ)/(4m), setting the coefficient to zero for a nonintegral quadratic index; invoke the shift theorem for residue independence.
- BFH §2, pp.556–557, Proposition 2.7, Corollary 2.8: Uses bfh fourier coefficient extraction in fourier coefficient levi covariance: For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.

**API.**

- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_zero` (simp): The zero function has every coefficient zero.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_add` (functoriality): Extraction is additive for integrable summands on the boxes.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_scalar` (functoriality): Extraction commutes with complex scalar multiplication.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_constant` (degenerate): For constant 1, the coefficient at Q=0,R=0 is 1 at both cusps.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_vector_mode` (computation): For Φ(g,W)=e(N^(1−j)RᵀW), Q=0 and matching R, the coefficient is 1.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_wrong_vector` (non-example): For constant 1 and nonzero R, the coefficient at Q=0 is 0 (N>0).

**Acceptance.**

- For a single Fourier mode with a matching index, coefficient extraction returns its amplitude.
- At cusp one the X period is N, not 1.

**Prerequisites.** [`MP.8/quadratic-matrix`](#n-mp-8-quadratic-matrix), [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), [`MP.8/bfh-translation`](#n-mp-8-bfh-translation).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/FourierExtraction`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-theta-pairing"></a>

### Gaussian orthogonality of genus-two theta series — `MP.8/theta-pairing`

theorem · from the MP.8 part

**Statement.** For a>0, Z=X+iY∈H₂ and μ,ν∈Z², the Lebesgue integral over C²/(Z Z²+Z²) of θᵃ_μ(Z,W) conjugate(θᵃ_ν(Z,W)) exp(−4πa Y⁻¹[Im W]) is √det(Y)/(2a) if μ≡ν mod 2a, and zero otherwise. In W=Zλ+ρ coordinates the measure is det(Y)dλdρ on [0,1)^4.

**Proof outline.**

1. Integrate in ρ first; character orthogonality kills different residues and forces equal summation vectors.
2. Unfold the λ sum to R². The real Gaussian integral is det(Y)⁻¹/²/(2a); multiply by the fundamental-domain Jacobian det(Y). BFH omits the proof, but this argument specifies the needed multivariate Gaussian input. Use the pinned Cholesky equivalence, its determinant Jacobian, Fubini and the existing root-namespace integral_gaussian/integrable_exp_neg_mul_sq; GN.0 contains lattices/covolume, not this Gaussian integral.

**Sources.**

- BFH90, Proposition 2.1, p.551: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- At Y=4I₂ the norm square is 2/a, not 8/a.
- The orthogonality proves linear independence of theta components.

**Prerequisites.** [`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta), [`MP.8/theta-normal-convergence`](#n-mp-8-theta-normal-convergence), `mathlib:integral_gaussian`, `mathlib:integrable_exp_neg_mul_sq`, `tauceti:TauCeti.choleskyEquiv`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Pairing`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R6: correct statement, proofSteps, acceptance from “√det(Y)/(2a); Gaussian integral det(Y)^{−1/2}/(2a); at Y = 4I₂ the value 2/a” to “√det(Y)/(4a); Gaussian integral 1/(4a√det Y); at Y = 4I₂ the value 1/a”. verified by the computation in the detail; the measure convention (Lebesgue measure on ℂ², period lattice ZZ² + Z²) is the node's and BFH's.

<a id="n-mp-8-coefficient-shift-analytic"></a>

### Holomorphic contour shift for Fourier coefficients — `MP.8/coefficient-shift-analytic`

theorem · from the MP.8 part

**Statement.** If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).

**Proof outline.**

1. Substitute the lattice translation law in the coefficient integral.
2. Move the W contour by −(Z_g+X)λ using holomorphy and cancellation on opposite periodic faces. Expand the quadratic exponent, then use the native matrix dictionary.

**Sources.**

- BFH90, §2, pp.552–553, (2.9): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The analytic invariance premise of the nine-node component is proved here.
- Each contour face cancellation is justified before changing integration paths.

**Prerequisites.** [`MP.8/fourier-coefficient`](#n-mp-8-fourier-coefficient), [`MP.8/bfh-translation`](#n-mp-8-bfh-translation), [`MP.8/fourier-shift`](#n-mp-8-fourier-shift), [`MP.8/coefficient-invariants`](#n-mp-8-coefficient-invariants), [`MP.8/bfh-jacobi-specialization`](#n-mp-8-bfh-jacobi-specialization).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/FourierExtraction`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-theta-decomposition"></a>

### BFH two-cusp theta decomposition — `MP.8/theta-decomposition`

theorem · from the MP.8 part

**Statement.** Under the Jacobi regularity and lattice hypotheses above, there are unique components E_j(g;ν), ν mod 2a, satisfying Φ_j(g,W)=Σν E_j(g;ν) θᵃ_ν(N^(1−2j)Z_g,N^(1−j)W). Put C_j(g;U,ν)=B_j(g;T,ν) if T=(U+N^(2−j)ννᵀ)/(4m) is half-integral, and 0 otherwise. Then E_j(g;ν)=Σ_{U integral symmetric} C_j(g;U,ν)e(tr(UZ_g)/(4mN^j)), with the convergence inherited from the Fourier expansion.

**Proof outline.**

1. Apply coefficient shift and the orbit classification to regroup the absolutely locally convergent Fourier series by ν and U.
2. If an orbit exists, the prescribed residue lift produces a unique half-integral T; no arbitrary U is assumed representable. Gaussian orthogonality proves uniqueness.

**Sources.**

- BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Vanishing at non-half-integral recovered T is part of C_j.
- The components depend on g, including its K-coordinate, rather than just Z_g.

**Prerequisites.** [`MP.8/theta-pairing`](#n-mp-8-theta-pairing), [`MP.8/coefficient-shift-analytic`](#n-mp-8-coefficient-shift-analytic), [`MP.8/orbit-classification`](#n-mp-8-orbit-classification), [`MP.8/unique-residue-lift`](#n-mp-8-unique-residue-lift), `MetaplecticAutomorphicForms:MP.6`, [`MP.8/theta-components`](#n-mp-8-theta-components), [`MP.8/theta-coefficient`](#n-mp-8-theta-coefficient), [`MP.8/bfh-jacobi-specialization`](#n-mp-8-bfh-jacobi-specialization), [`MP.8/theta-normal-convergence`](#n-mp-8-theta-normal-convergence).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Decomposition`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 6: replace the bare stage `MP.6` by [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface). verified: the node is the genus-two BFH specialization of the general theta decomposition stated there.

<a id="n-mp-8-theta-fourier-transform"></a>

### Genus-two theta Fourier transform — `MP.8/theta-fourier-transform`

theorem · from the MP.8 part

**Statement.** For a>0 and Z∈H₂, θᵃ_ν(−Z⁻¹,Z⁻¹W)=e(aZ⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod2a} e(−νᵀμ/(2a))θᵃ_μ(Z,W). The holomorphic branch √(−det Z) is positive when Z=iY. The finite Fourier matrix has square equal to residue negation after normalization by 1/(2a).

**Proof outline.**

1. Use the rank-two Poisson theorem supplied by MP.6, with the complex Gaussian Fourier transform and self-dual coordinate measures.
2. Split the dual lattice by residues. Compare the branch with the Fourier-generator Weil phase from MP.2 and the lift i√(−det Z) in the actual cover.

**Sources.**

- BFH90, §2, p.554, (2.12)–(2.13): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The prefactor is 1/(2a), not 1/√(2a).
- At Z=iI₂ the indicated branch is 1.

**Prerequisites.** [`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta), `MetaplecticAutomorphicForms:MP.2`, `MetaplecticAutomorphicForms:MP.6`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Decomposition`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 7: replace the bare stage `MP.2` by [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.2/weil-index`](#n-mp-2-weil-index). verified: the branch √(−det Z) is compared with the Weil phase of the Fourier generator, which MP.2/generator-operators expresses through the Weil index.

**Routed edit.** R5 row 8: replace the bare stage `MP.6` by [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface), `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`. verified: the rank-two Poisson theorem is AL.0's (its real lattice case), and the finite Fourier matrix acting on theta components is the transformation law of the decomposition interface. MP.6 has no separate rank-two Poisson node.

<a id="n-mp-8-theta-component-fourier-law"></a>

### Fourier law for BFH theta components — `MP.8/theta-component-fourier-law`

theorem · from the MP.8 part

**Statement.** For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

**Proof outline.**

1. Insert theta decomposition into Φ₁=Φ₀|J and apply the rank-two theta Fourier formula at N⁻¹Z_g.
2. Compare independent theta components by Gaussian orthogonality, keeping the positive-real scaling in the square root.

**Sources.**

- BFH90, Proposition 2.2, p.552, (2.7)–(2.8): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Use opposite signs for the two finite Fourier kernels.
- Normalized theta vectors yield a genuine cover representation, not a representation of the linear Sp group.

**Prerequisites.** [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition), [`MP.8/theta-fourier-transform`](#n-mp-8-theta-fourier-transform), [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), [`MP.8/theta-components`](#n-mp-8-theta-components), [`MP.8/bfh-jacobi-specialization`](#n-mp-8-bfh-jacobi-specialization).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Decomposition`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-bfh-jacobi-specialization"></a>

### BFH Jacobi coordinate space — `MP.8/bfh-jacobi-specialization`

construction · from the MP.8 part

**Statement.** Specialize the MP.6 Jacobi space to the BFH lattice and cusp j. Its coordinate functions Φ_j:GSp₄⁺(R)×C²→C are smooth in the real group variables, holomorphic in W, invariant under Γ_N at cusp zero or J⁻¹Γ_NJ at cusp one, and invariant under ||[N^(−j)ℓ;N^(j−1)r] for ℓ,r∈Z². For vector values take each continuous linear functional on the finite-dimensional K-type space. Weight and multiplier are inherited from MP.6; these conditions alone do not assert a new weight.

**Proof outline.**

1. Evaluate the imported Jacobi form on BFH group coordinates and compare the Heisenberg central character and the two translation lattices.
2. Construct the coordinate space as a native subspace of functions with the stated analytic and covariance properties; establish the J transport using slash covariance.

**Sources.**

- BFH90, §1, p.547, (1.6)–(1.9): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §2, pp.552–553, (2.9): Uses bfh jacobi coordinate space in holomorphic contour shift for fourier coefficients: If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).
- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Supply the actual elliptic invariance, smoothness and W-holomorphy needed to reconstruct a BFH Jacobi function from its theta projections.
- BFH Proposition 2.2, p.552, (2.7)–(2.8): Uses bfh jacobi coordinate space in fourier law for bfh theta components: For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

**API.**

- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_zero` (constructor): The zero coordinate function belongs.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_translation` (projection): Every member satisfies its scaled elliptic lattice law.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_fourier_cusp` (compatibility): Slash by J transports cusp zero to cusp one.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_zero_test` (degenerate): Zero belongs for N=8,m=16 at each cusp.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_constant_zero_index` (degenerate): Constant 1 belongs at index m=0.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_constant_positive_index` (non-example): Constant 1 is excluded at N=8,m=16.

**Acceptance.**

- The specialization imports, rather than owns, general Jacobi forms and theta decomposition.
- At positive m the constant function 1 fails the elliptic law.

**Prerequisites.** [`MP.8/arithmetic-subgroup`](#n-mp-8-arithmetic-subgroup), [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), [`MP.8/bfh-translation`](#n-mp-8-bfh-translation), `MetaplecticAutomorphicForms:MP.6`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 9: replace the bare stage `MP.6` by [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces). verified: the node evaluates the Jacobi spaces of MP.6 on BFH coordinates.

<a id="n-mp-8-theta-components"></a>

### BFH theta component projection — `MP.8/theta-components`

construction · from the MP.8 part

**Statement.** For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition theorem.

**Proof outline.**

1. Integrate against the conjugate theta kernel and its Gaussian torus density in the specified W′ coordinates.
2. Gaussian orthogonality fixes the norm and proves that a basis theta function projects to its Kronecker coordinate.

**Sources.**

- BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Use the defined projections, Gaussian orthogonality and elliptic invariance to reconstruct the original Jacobi function as its finite theta expansion.
- BFH Proposition 2.2, p.552, (2.7)–(2.8): Uses bfh theta component projection in fourier law for bfh theta components: For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.
- BFH §6, pp.583,585–586, definitions before Propositions 6.1–6.2: Extract the finite theta/Fourier coefficients at the two cusps before the normalized x₂ Whittaker integral, preserving the opposite-cusp finite Fourier sum.

**API.**

- `TauCeti.Jacobi.GenusTwo.thetaComponent_zero` (simp): Zero function has component zero.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_residue` (relation): Components only depend on ν mod 2a.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_scalar` (functoriality): Scaling the Jacobi coordinate function scales its Gaussian component projection.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.thetaComponent_basis` (characterisation): Projecting θᵃ_μ yields 1 at congruent ν and 0 otherwise.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_zero_test` (degenerate): The component of the zero coordinate function is zero.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_period` (computation): At N=8,a=2,j=1, the residue vectors (0,5) and (0,1) give the same component.

**Acceptance.**

- A single theta basis vector projects to its Kronecker coordinate.
- Residue vectors differing by 2a have identical projection kernels.

**Prerequisites.** [`MP.8/theta-pairing`](#n-mp-8-theta-pairing), [`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Components`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R6: correct statement from “divided by its norm √det(Im Z′)/(2a)” to “divided by its squared norm √det(Im Z′)/(4a)”. verified: projecting Σ_ν E(ν) θᵃ_ν onto θᵃ_μ gives E(μ) · √det(Im Z′)/(4a), so this divisor returns E(μ).

<a id="n-mp-8-theta-coefficient"></a>

### Theta-component Fourier coefficients — `MP.8/theta-coefficient`

construction · from the MP.8 part

**Statement.** C_j(g;U,ν) is the Fourier coefficient B_j(g;T,ν) with T=(U+N^(2−j)ννᵀ)/(4m); set it to zero if this is not an integral quadratic form, equivalently a half-integral symmetric matrix. This computational construction is defined before imposing Jacobi invariance. For the actual BFH family, the shift theorem makes the residue choice independent.

**Proof outline.**

1. Use the native quadratic-form/matrix equivalence, not entrywise integrality.
2. Extract B at the unique quadratic form representing the candidate T, or use zero if it fails the diagonal/mixed parity test.

**Sources.**

- BFH90, §2, pp.552–553, before Proposition 2.2: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Express each theta projection through its Fourier coefficients indexed by representable U and residue ν; the coefficient shift establishes independence of the chosen lift.
- BFH §2, pp.556–557, Proposition 2.7, Corollary 2.8: Uses theta-component fourier coefficients in fourier coefficient levi covariance: For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.
- BFH §6, pp.583,585–586, definitions before Propositions 6.1–6.2: Extract the finite theta/Fourier coefficients at the two cusps before the normalized x₂ Whittaker integral, preserving the opposite-cusp finite Fourier sum.

**API.**

- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_recovered` (compatibility): If U=4mT−N^(2−j)ννᵀ, recover B_j(g;T,ν).
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_zero` (simp): The zero coordinate function has zero C_j.
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_scalar` (functoriality): C_j(cΦ)=cC_j(Φ).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_zero_test` (degenerate): All theta Fourier coefficients of zero vanish.
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_parity` (non-example): For N=8,m=16,j=1,U=I,ν=0 the coefficient is zero for any coordinate function.
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_integral_index` (computation): At N=8,m=16,j=1,U=diag(0,56),ν=(0,1), the recovered index is T=diag(0,1).

**Acceptance.**

- At N=8,m=16,j=1,U=I,ν=0 the candidate diagonal 1/64 is not half-integral, so C=0.
- A change of residue is accompanied by the BFH index shift; this invariance requires the actual Jacobi function.

**Prerequisites.** [`MP.8/quadratic-matrix`](#n-mp-8-quadratic-matrix), [`MP.8/fourier-coefficient`](#n-mp-8-fourier-coefficient), [`MP.8/coefficient-shift-analytic`](#n-mp-8-coefficient-shift-analytic).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Components`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-bfh-seed"></a>

### Elliptic-newform section on genus-two similitudes — `MP.8/bfh-seed`

construction · from the MP.8 part

**Statement.** Let f be the normalized even-weight k≥2 newform of level M with trivial character, N divisible by 8M, and f̂(τ)=τ^(−k)f(−1/(Nτ)). Set F(Q)=f̂(Qi)(ci+d)^(−k)det(Q)^(k/2). For a continuous finite-dimensional right K-representation σ trivial on −I and v with vσ(κ)=ρ_k(κ)v on the embedded SO(2), construct the unique I(t n(X)diag(Q,Q⁻ᵀ)κ)=F(Q)vσ(κ). Positive central scalars act trivially. The original f has level M in its Fricke and completed L-function equations.

**Proof outline.**

1. Construct I on the unique positive triangular Iwasawa coordinates; independence under the larger GL₂⁺ coordinate description follows from F's SO(2) weight law.
2. Check left Γ₀(N) invariance and right K equivariance. Use f̂ at auxiliary N while keeping the original f's level M as recorded in E-MP8-3.

**Sources.**

- BFH90, §1, pp.547–550, (1.11)–(1.16): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §1, p.549, (1.17): Uses elliptic-newform section on genus-two similitudes in bfh normalized section family: For the seed I, set I_s(g)=det(Im Z_g)^(s/2) I(g), using the positive-real logarithm, g∈GSp₄⁺(R). This is the precise BFH parameter s; no shift to a generic spectral parameter is implicit. The Levi exponent and positive-scalar behavior determine the comparison with normalized induced spaces.
- BFH §3, pp.557–559, (3.1)–(3.8): Use the BFH section and its chosen cover branch in the archimedean Whittaker integral, with the prescribed finite K-type.
- BFH §3, p.559, Proposition 3.2: Uses elliptic-newform section on genus-two similitudes in whittaker integral convergence: For k≥2 even, a continuous finite-dimensional BFH K-type σ, weight-k v, T linear, φ(κ)=T(vσ(κ)), ε∈{−1,0,1}, y₁,y₂>0, the integral defining W^ε is absolutely convergent for Re s>2, locally uniformly with derivatives in s on compact subsets of that half-plane.

**API.**

- `TauCeti.Jacobi.GenusTwo.bfhSeed_identity` (projection): I(I₄)=F(I₂)v.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_zero` (simp): F=0 gives I=0.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_scalar` (functoriality): Scaling F scales I.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.bfhSeed_base` (computation): F(I₂)=1 implies I(I₄)=v.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_zero_vector` (degenerate): v=0 gives I=0.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_central` (computation): I(2I₄)=I(I₄).

**Acceptance.**

- The representation need not be one dimensional.
- At I₄ the seed is F(I₂)v; the zero elliptic datum produces zero seed.

**Prerequisites.** [`MP.8/compact-stabilizer`](#n-mp-8-compact-stabilizer), `AutomorphicFormsOnReductiveGroups:AF.5`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Seed`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R3: replace `GL2AutomorphicRepresentationsAndTransfer:R16.2` by nothing (the citation is dropped). verified: the seed is built from f, f̂(τ) = τ^{−k} f(−1/(Nτ)) and a K-type; no local representation theory of GL₂ enters its construction or proof.

<a id="n-mp-8-induced-seed-family"></a>

### BFH normalized section family — `MP.8/induced-seed-family`

definition · from the MP.8 part

**Statement.** For the seed I, set I_s(g)=det(Im Z_g)^(s/2) I(g), using the positive-real logarithm, g∈GSp₄⁺(R). This is the precise BFH parameter s; no shift to a generic spectral parameter is implicit. The Levi exponent and positive-scalar behavior determine the comparison with normalized induced spaces.

**Proof outline.**

1. Use strict positive definiteness to take the real logarithm of det(Im Z_g).
2. Compute the Levi and center covariance directly, and differentiate the scalar factor in s.

**Sources.**

- BFH90, §1, p.549, (1.17): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §1, p.549, definition of E_s: Insert det(Y)^(s/2) times the original finite-dimensional BFH seed into the parabolic and lattice sum; test convergence and representative independence separately.

**API.**

- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_zero` (simp): I₀=I.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_add` (relation): I_(s+t)=det(Y)^(t/2) I_s.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_holomorphic` (structure): For each positive g the section is entire in s.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_identity` (computation): At g=I₄ the section is I(I₄) for every s.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_levi` (computation): At diag(2I₂,(1/2)I₂) the scalar is 4^s.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_zero_seed` (degenerate): A zero seed yields the zero family.

**Acceptance.**

- At s=0 the family recovers I.
- At g=diag(2I₂,(1/2)I₂), detY=16 and the factor is 4^s, not 16^s.

**Prerequisites.** [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/siegel-action`](#n-mp-8-siegel-action).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Seed`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-jacobi-eisenstein"></a>

### Genus-two Jacobi Eisenstein series — `MP.8/jacobi-eisenstein`

construction · from the MP.8 part · planet “Genus-two Jacobi Eisenstein series”

**Statement.** For the genuine elliptic-newform seed, define E_s(g,W)=Σ_{γ∈(P∩Γ_N)\Γ_N} Σ_{λ∈Z²} (I_s||[λ;0])|γ(g,W), where P consists of n(X)diag(Q,Q⁻ᵀ) with detQ>0. The sum is initially defined in a right half-plane of s. For finite-dimensional vector values use the original seed, not a scalar replacement; continuous linear functionals commute with convergent sums. Its theta components are genuine half-integral-weight automorphic forms on the double cover.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Prove invariance of the summand under the specified parabolic stabilizer using seed covariance and the elliptic central character.
2. Form the native quotient and the lattice sum. Convergence is a separate theorem, and genuineness belongs to the theta-component comparison. Native G/H has representatives gH; the BFH H\G has representatives Hg. Inversion converts the former into the latter, and cosetMatrix chooses that inverse representative.

**Sources.**

- BFH90, §1, p.549, definition of E_s: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §5, pp.580–582, Proposition 5.1: Uses genus-two jacobi eisenstein series in cusp-one full-rank fourier unfolding: For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.
- BFH §1, p.549, I_s; §2, pp.553–554; §8, p.601: Lift the actual theta-component family by h(iI₂), verify its genuine central sign, and compare its Levi exponent with normalized induction at ν=s−2.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

**API.**

- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_zero` (simp): Zero seed gives zero series.
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_scalar` (functoriality): Scaling the seed scales the series.
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_summand` (projection): The identity coset,λ=0 summand is I_s(g).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_zero_test` (degenerate): Every coefficient of the zero-seed E_s is zero.
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_identity_term` (computation): At g=I,W=0 the identity-coset,λ=0 summand is I(I).
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_nonzero_translation` (computation): At g=I,W=0,m=1,λ=e₀ the identity-coset summand is exp(−2π)I(I).

**Acceptance.**

- The detQ>0 restriction avoids identifying an extra component.
- No summability or continuation is a field of the definition.

**Prerequisites.** [`MP.8/induced-seed-family`](#n-mp-8-induced-seed-family), [`MP.8/arithmetic-subgroup`](#n-mp-8-arithmetic-subgroup), [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), [`MP.8/bfh-translation`](#n-mp-8-bfh-translation), `MetaplecticAutomorphicForms:MP.6`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 10: replace the bare stage `MP.6` by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces). verified: the Eisenstein series is a sum of Jacobi-action translates of the seed, landing in the Jacobi space.

<a id="n-mp-8-whittaker-functions"></a>

### Genus-two archimedean Whittaker functions — `MP.8/whittaker-functions`

definition · from the MP.8 part

**Statement.** For k≥2 even and φ(κ)=T(vσ(κ)) with the BFH SO(2) weight k, define W^ε(y₁,y₂;s)=(y₁y₂)^(4−s)y₂^(k/2)∫_{R³} √(−det(X+iI))/|det(X+iI)|^s e(εy₁x₁)e(y₂(x₂'+iy₂'))(y₂')^(k/2)φ(κ(X))dX. Here ε=+1,−1 or 0, X=[[x₄,x₃],[x₃,x₁]], x₂'=−x₃(x₁+x₄)/(1+x₁²+x₃²), y₂'=√(1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)²)/(1+x₁²+x₃²)>0. κ(X) is uniquely specified by (3.2) with Q' positive triangular and the root is 1 at X=0. ε=0 is the degenerate W⁰.

**Proof outline.**

1. Use the unique Iwasawa factors of [[0,w],[−w,0]]n(X), w=[[0,−1],[1,0]], from BFH (3.2) to define κ(X). This off-diagonal block matrix is symplectic.
2. Insert the explicit real coordinates and positive square-root branch. Define the Bochner integral without placing its convergence or continuation in the data.

**Sources.**

- BFH90, §3, pp.557–559, (3.1)–(3.8): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, p.559, Proposition 3.1: Uses genus-two archimedean whittaker functions in three-variable whittaker majorant: Put D(X)=1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)². The positive function D(X)^−α(1+x₁²+x₃²)^−β(1+x₁²)^−γ is integrable on R³ if α>1/2, 2α+β>3/2 and α+β+γ>1. These are sufficient conditions; no necessity assertion is made.
- BFH §3, pp.559–561, (3.11)–(3.15): Relate the initial Whittaker integral to the two-parameter Jacquet integral in its absolute-convergence chamber, then continue it using the reflected identities.
- BFH §3, pp.567–569, Propositions 3.7–3.8: Choose actual finite U(2) matrix coefficients of the prescribed SO(2) weight and use the global signed divisor to control the local analytic tests.

**API.**

- `TauCeti.Jacobi.GenusTwo.whittakerFunction_zero` (simp): φ=0 implies W=0.
- `TauCeti.Jacobi.GenusTwo.whittakerFunction_scalar` (functoriality): Scaling φ scales W.
- `TauCeti.Jacobi.GenusTwo.whittakerFunction_degenerate_scale` (relation): W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.whittakerFunction_zero_test` (degenerate): W^+ of the zero matrix coefficient is zero.
- `TauCeti.Jacobi.GenusTwo.whittakerKernel_base` (computation): At X=0 and φ=1 the kernel is exp(−2πy₂) for every sign.
- `TauCeti.Jacobi.GenusTwo.whittakerFunction_degenerate_test` (computation): W⁰(2,y₂;s)=2^(4−s)W⁰(1,y₂;s).

**Acceptance.**

- W⁰ omits e(εy₁x₁), retaining all other factors.
- At X=0, x₂'=0,y₂'=1 and the kernel root is 1.

**Prerequisites.** [`MP.8/compact-stabilizer`](#n-mp-8-compact-stabilizer), [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/similitude-cover`](#n-mp-8-similitude-cover).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-whittaker-majorant"></a>

### Three-variable Whittaker majorant — `MP.8/whittaker-majorant`

lemma · from the MP.8 part

**Statement.** Put D(X)=1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)². The positive function D(X)^−α(1+x₁²+x₃²)^−β(1+x₁²)^−γ is integrable on R³ if α>1/2, 2α+β>3/2 and α+β+γ>1. These are sufficient conditions; no necessity assertion is made.

**Proof outline.**

1. Complete the square in x₄, substitute x₄ scaled by 1+x₁², and integrate the one-variable beta majorant (requires α>1/2).
2. Scale x₃ by √(1+x₁²); the remaining integrals converge under 2α+β>3/2 and α+β+γ>1. Keep Tonelli for this positive integrand.

**Sources.**

- BFH90, §3, p.559, Proposition 3.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- α=1,β=0,γ=1 satisfies all inequalities.
- Equality α=1/2 is excluded from the theorem.

**Prerequisites.** [`MP.8/whittaker-functions`](#n-mp-8-whittaker-functions).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-whittaker-initial-convergence"></a>

### Whittaker integral convergence — `MP.8/whittaker-initial-convergence`

theorem · from the MP.8 part

**Statement.** For k≥2 even, a continuous finite-dimensional BFH K-type σ, weight-k v, T linear, φ(κ)=T(vσ(κ)), ε∈{−1,0,1}, y₁,y₂>0, the integral defining W^ε is absolutely convergent for Re s>2, locally uniformly with derivatives in s on compact subsets of that half-plane.

**Proof outline.**

1. Finite-dimensional compact K-coefficients are bounded. Absorb exp(−2πy₂y₂') times (y₂')^(k/2) by a power majorant.
2. Apply Proposition 3.1 with a strict margin. Logarithmic factors from s-derivatives are absorbed by reducing the margin; dominated differentiation gives local holomorphy.

**Sources.**

- BFH90, §3, p.559, Proposition 3.2: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- No initial-convergence claim is made at Re s=2.
- The degenerate sign ε=0 has the same initial half-plane.

**Prerequisites.** [`MP.8/whittaker-majorant`](#n-mp-8-whittaker-majorant), [`MP.8/bfh-seed`](#n-mp-8-bfh-seed).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-jacquet-two-parameter"></a>

### Two-parameter Jacquet integral — `MP.8/jacquet-two-parameter`

definition · from the MP.8 part

**Statement.** For the BFH K-type, let F_v(n(E(x₂))m(Y)κ)=|det Y|^s y₂^r vσ(κ), Y=√y₁ diag(y₂,1). Define V^ε(y₁,y₂;s,r)= (−1)^(k/2)y₁^(4−s)y₂^(5−r−s)∫_{R×R³} F_v(Jm(E(x₂))n(X))√(−det(X+iI))e(εy₁x₁)e(y₂x₂)dX dx₂. Set W^ε(s,r)=π^−r Γ(r+k/2)V^ε(s,r). The section is homogeneous exactly as (3.11); both integrals are initially interpreted in their absolute-convergence chamber.

**Proof outline.**

1. Use the same unique Iwasawa factors as the seed to define F_v and the four-dimensional Bochner integral.
2. Apply the one-variable confluent-hypergeometric integral before extending parameters; do not exchange a conditionally convergent integral.

**Sources.**

- BFH90, §3, pp.559–561, (3.11)–(3.15): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, pp.560–561, Proposition 3.3: Uses two-parameter jacquet integral in jacquet reflection in the auxiliary parameter: The V-family continues analytically to Re(s+r)>5/2 and Re(s−r)>3/2. Its gamma-normalized W-family satisfies W^ε(s,r)=W^ε(s,1−r). At r=k/2 and Re s>(3+k)/2 this is the original Whittaker function. This uses the classical identity W_{κ,μ}=W_{κ,−μ} and its specialization W_{k/2,(1−k)/2}(y)=y^(k/2)e^−y/2.
- BFH §3, pp.574–576, Proposition 3.14, (3.46)–(3.47): Uses two-parameter jacquet integral in degenerate whittaker continuation and decay: W⁰ continues holomorphically to Re s>3/2. For each fixed y₁>0 and compact parameter sets it decreases rapidly as y₂→∞, with polynomial control at y₂→0; W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s). No rapid decay in y₁ follows, because its x₁ character is trivial.

**API.**

- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_linear` (functoriality): Scaling v or T scales V and W; additive linearity is asserted in a common convergence chamber and then by analytic continuation.
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_normalization` (projection): W(s,r)=π^−r Γ(r+k/2)V(s,r).
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_specialize` (compatibility): For Re s>(3+k)/2 and r=k/2, W(s,r)=W(s).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_zero` (degenerate): v=0 gives V=W=0.
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_weight_two` (computation): At k=2,r=1 the normalizing factor is π^−1 Γ(2)=π^−1.
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_specialization_test` (computation): The special-function factor becomes y^(k/2)e^−y/2 at r=k/2, retaining the k/2 exponent.

**Acceptance.**

- At r=k/2 the W-family specializes to (3.1) in Re s>(3+k)/2.
- The normalization includes Γ(r+k/2), not Γ(r).

**Prerequisites.** [`MP.8/whittaker-functions`](#n-mp-8-whittaker-functions), [`MP.8/bfh-seed`](#n-mp-8-bfh-seed).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-jacquet-r-reflection"></a>

### Jacquet reflection in the auxiliary parameter — `MP.8/jacquet-r-reflection`

theorem · from the MP.8 part

**Statement.** The V-family continues analytically to Re(s+r)>5/2 and Re(s−r)>3/2. Its gamma-normalized W-family satisfies W^ε(s,r)=W^ε(s,1−r). At r=k/2 and Re s>(3+k)/2 this is the original Whittaker function. This uses the classical identity W_{κ,μ}=W_{κ,−μ} and its specialization W_{k/2,(1−k)/2}(y)=y^(k/2)e^−y/2.

**Proof outline.**

1. Integrate the x₂ variable using GR 3.384.9 and obtain the confluent Whittaker function in (3.14).
2. Use its symmetry in μ=r−1/2 and the majorant for the asserted cone; analytic uniqueness proves the reflection. The precise classical special-function inputs remain a recorded gap.

**Sources.**

- BFH90, §3, pp.560–561, Proposition 3.3: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Both inequalities constrain s and r; this is not yet Re s>3/2.

**Prerequisites.** [`MP.8/jacquet-two-parameter`](#n-mp-8-jacquet-two-parameter).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-jacquet-weyl-reflection"></a>

### Gamma-normalized Jacquet Weyl relation — `MP.8/jacquet-weyl-reflection`

theorem · from the MP.8 part

**Statement.** For a finite K-matrix coefficient of torus weight n, φ(θ_tκ)=exp(−int)φ(κ), set V̂^ε=2^−s π^−s Γ(A_ε(s,r,n))Γ(B_ε(s,r,n))V^ε, where A_ε=(s−r+εn+(ε−1)/2)/2 and B_ε=(s+r+εn+(ε+1)/2)/2. Thus for ε=+1 the arguments are (s−r+n)/2,(s+r+n+1)/2; for ε=−1 they are (s−r−n−1)/2,(s+r−n)/2. This corrects the p.562 normalizer using the explicit integral evaluations (3.26)–(3.27) and the subsequent V̂ displays on p.565 (E-MP8-6). It satisfies V̂^ε(s,r)=V̂^ε(r+3/2,s−3/2). The unnormalized family continues analytically to Re r>1/2, Re s>2. Interpret the identity meromorphically at gamma poles. Torus components need not retain the original SO(2) weight k.

**Proof outline.**

1. Project the original finite K-representation to the torus characters, retaining arbitrary projected vectors rather than imposing the original SO(2) weight on each component.
2. Cancel the inverse gamma factors in (3.26)–(3.27) using Aε,Bε above. The remaining gamma argument and powers depend on s+r; the confluent Whittaker parameter changes sign under (s,r)↦(r+3/2,s−3/2).
3. Glue through the convergence-cone overlap. The exact special-function integral and joint meromorphic topology remain explicitly recorded gaps.

**Sources.**

- BFH90, §3, p.562, Proposition 3.4, (3.18)–(3.19); pp.563–565, (3.26)–(3.27) and explicit V̂ displays: The p.562 printed normalizer needs correction E-MP8-6; the p.565 evaluated formulas determine the corrected two signs.

**Acceptance.**

- The parameter map is an involution.
- The root and torus character determine the two gamma shifts.

**Prerequisites.** [`MP.8/jacquet-r-reflection`](#n-mp-8-jacquet-r-reflection).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-whittaker-continuation"></a>

### Whittaker holomorphy beyond convergence — `MP.8/whittaker-continuation`

theorem · from the MP.8 part

**Statement.** For the BFH weight-k matrix coefficients and either ε=±1, W^ε(y₁,y₂;s) has a holomorphic continuation to Re s>3/2. Its initial integral need not be absolutely convergent throughout this domain. At s=2 the apparent gamma singularities from the two-parameter reflections cancel.

**Proof outline.**

1. Apply the two reflections to move (s,k/2) to the overlapping cones. Cover the asserted half-plane with these overlaps.
2. Track gamma poles at s=2 weight by weight and use the opposite reflection to remove each apparent pole; glue by uniqueness.

**Sources.**

- BFH90, §3, pp.565–566, Proposition 3.5: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Holomorphic, not merely meromorphic, at s=2.

**Prerequisites.** [`MP.8/whittaker-initial-convergence`](#n-mp-8-whittaker-initial-convergence), [`MP.8/jacquet-r-reflection`](#n-mp-8-jacquet-r-reflection), [`MP.8/jacquet-weyl-reflection`](#n-mp-8-jacquet-weyl-reflection).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-whittaker-rapid-decay"></a>

### Whittaker decay in both positive variables — `MP.8/whittaker-rapid-decay`

theorem · from the MP.8 part

**Statement.** On compact parameter sets in Re s>3/2, for ε=±1 there are C and a Schwartz function ξ on R² with ||W^ε(y₁,y₂;s)||≤(y₁y₂)^−C ξ(y₁,y₂), y₁,y₂>0; the corresponding differentiated estimates hold where the convolution argument applies. The degenerate W⁰ does not have this two-variable decay conclusion.

**Proof outline.**

1. First derive polynomial bounds away from Re s=2 using the two-parameter integrals and uniform gamma estimates.
2. Represent the smooth vector by convolution with a compactly supported smooth function. The nondegenerate unipotent character supplies a Schwartz Fourier factor in both variables (JPSS 8.3.3).
3. Extend over s=2 by holomorphy and compact-parameter bounds; record the unavailable exact convolution theorem rather than silently assuming it.

**Sources.**

- BFH90, §3, pp.566–567, Proposition 3.6: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Bounds justify sums and Mellin integrals later; scalar boundedness is insufficient.

**Prerequisites.** [`MP.8/whittaker-continuation`](#n-mp-8-whittaker-continuation), `AutomorphicSpectralTheory:AS.1`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Bounds`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-degenerate-whittaker-continuation"></a>

### Degenerate Whittaker continuation and decay — `MP.8/degenerate-whittaker-continuation`

theorem · from the MP.8 part

**Statement.** W⁰ continues holomorphically to Re s>3/2. For each fixed y₁>0 and compact parameter sets it decreases rapidly as y₂→∞, with polynomial control at y₂→0; W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s). No rapid decay in y₁ follows, because its x₁ character is trivial.

**Proof outline.**

1. Set the first character to zero in the Jacquet integral, integrate the elementary beta factors, and continue the remaining Bessel integrals. BFH omits this calculation and refers to its distinct Annals paper §5; this exact input remains a gap.
2. Use smooth convolution with the character nondegenerate only in x₂; this proves only y₂ decay.

**Sources.**

- BFH90, §3, pp.574–576, Proposition 3.14, (3.46)–(3.47): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Homogeneity rules out claiming Schwartz decay in y₁.

**Prerequisites.** [`MP.8/whittaker-initial-convergence`](#n-mp-8-whittaker-initial-convergence), [`MP.8/jacquet-two-parameter`](#n-mp-8-jacquet-two-parameter).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-test-coefficient-algebra"></a>

### Whittaker test coefficient algebra — `MP.8/test-coefficient-algebra`

construction · from the MP.8 part

**Statement.** Let R_k be the algebraic span of actual finite-dimensional U(2) matrix coefficients with the prescribed SO(2) weight k and trivial action of −I₄; its closure is taken in the uniform topology. In the κ(X) chart the three weight-zero polynomial coefficients are φ₁=det B=|det(X+iI)|^−1, φ₂=(det(X)²−1)x₁/|det(X+iI)|⁴ and φ₃=x₃(1−det X)/|det(X+iI)|². Multiplication by each preserves R_k. They are global compact-group matrix coefficients, not arbitrary functions invented on R³. Globally in the native U(2) model, φ₁(q)=det(Im q); it may change sign under right rotation. Divisibility φ=φ₁ψ means equality on all of K, including the chart boundary.

**Proof outline.**

1. Import Peter–Weyl density and tensor products of finite-dimensional compact representations. Weight conditions are preserved under multiplication by R₀.
2. Express φ₁,φ₂,φ₃ as polynomials in the A,B blocks of κ; then verify the chart formulas (3.29). Their global polynomial realization is necessary at chart boundaries.

**Sources.**

- BFH90, §3, pp.567–569, Propositions 3.7–3.8: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, p.568, Proposition 3.9; p.571, (3.41): Extend finite compact matrix coefficients to |Im x₁|≤ε<1 uniformly in the other real coordinates and compact right translates, as needed for the upward contour shift.
- BFH §3, p.576, (3.48)–(3.49): Uses whittaker test coefficient algebra in degenerate boundary mellin coefficients: Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.
- BFH §3, pp.573–574, Proposition 3.12: Choose a weight-compatible coefficient with the global divisor required for nonzero continued nondegenerate transforms and identically vanishing rank-zero transform.

**API.**

- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_mul` (structure): R₀R_k⊆R_k via tensor product of K-types.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_dense` (structure): R_k is dense in continuous weight-k compact-group functions.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_chart` (characterisation): The three global coefficients have the displayed chart formulas.
- `TauCeti.Jacobi.GenusTwo.globalTestPhi1_chart` (compatibility): The global polynomial det(Im q) restricts to the positive testPhi1(X) on κ(X).
- `TauCeti.Jacobi.GenusTwo.globalTestPhi1_rotated` (compatibility): The right-rotated global value is (1+zx₁)φ₁(X)/Δ_z, retaining its sign on both branches.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_base` (computation): The chart values at zero are (1,0,0).
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_nonzero_phi2` (computation): At (x₁,x₃,x₄)=(1,0,0), φ₂=−1/4.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_nonzero_phi3` (computation): At (0,1,0), φ₃=1/2.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_negative_branch` (non-example): For X=diag(0,−2),z=1, the global coefficient at κ(X)κ_z is −1/√10, whereas the positive chart coefficient at X(z)=diag(0,3) is +1/√10. They cannot be identified without the compact transition.

**Acceptance.**

- At X=0, (φ₁,φ₂,φ₃)=(1,0,0).
- At x₁=1,x₃=x₄=0, (φ₁,φ₂,φ₃)=(1/√2,−1/4,0).

**Prerequisites.** [`MP.8/whittaker-functions`](#n-mp-8-whittaker-functions), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/TestCoefficients`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-test-coefficient-strip"></a>

### Bounded holomorphic strip for test coefficients — `MP.8/test-coefficient-strip`

theorem · from the MP.8 part

**Statement.** Every finite matrix coefficient h, including its right translate by κ₀∈K, admits a bounded holomorphic extension in x₁ on |Im x₁|≤ε, uniformly for real x₃,x₄ and κ₀, for each 0<ε<1. This includes polynomials in φ₁,φ₂,φ₃ and suffices for the upward contour shift in (3.41). The printed one-sided region includes the singularity −i and is false.

**Proof outline.**

1. Factor det(X+iI) and its conjugate real polynomial as functions of complex x₁. Their zeros lie outside the strict strip |Im x₁|<1.
2. Choose the branch extending the real positive square root. Bound the inverse factors uniformly on each smaller closed strip. Extend polynomial products and use the upward strip for the later contour shift.

**Sources.**

- BFH90, §3, p.568, Proposition 3.9; p.571, (3.41): Proposition 3.9 is used with the corrected bounded strip from E-MP8-4; the source contour shift uses only the upward portion of that strip.

**Acceptance.**

- Exclude −i explicitly; do not preserve the false one-sided region.

**Prerequisites.** [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/TestCoefficients`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-rotated-whittaker-bound"></a>

### Rotated Whittaker scalar estimate — `MP.8/rotated-whittaker-bound`

theorem · from the MP.8 part

**Statement.** Let κ_z correspond in U(2) to diag(1,(1−iz)/Δ_z), Δ_z=√(1+z²). For φ∈R_k globally divisible by φ₁, use the actual compact product φ(κ(X)κ_z) in the scalar W integral (3.38), including its (y₁y₂)^(4−s)y₂^(k/2) prefactor. Proposition 3.10 targets absolute convergence for Re s>3/2 and, for y₂>C,y₁>0,z∈R, the bound C′y₁^(4−Re s), uniform on compact s-sets. At 1+zx₁=0 the global divisor vanishes. Away from this boundary φ₁(κ(X)κ_z)=(1+zx₁)φ₁(X)/Δ_z, while φ₁(X(z))=|1+zx₁|φ₁(X)/Δ_z. General coefficients require the missing compact transition; the blanket chart equality (3.31) cannot be used (E-MP8-7). The repaired global uniform-bound proof is a recorded gap.

**Proof outline.**

1. Work first with the genuine compact product in (3.38). Check the three rational coordinate transforms and the determinant identity, distinguishing its signed global coefficient from the positive chart value.
2. Compute the residual compact factor on both signs of 1+zx₁ and show how it acts on the coefficient vector. At the boundary use global divisibility to deduce zero; do not extend arbitrary coefficients by zero.
3. After that comparison, justify the absolute majorant uniformly in z and compact s-sets, then the large-y₂ bound. This proof repair is not established here and remains an explicit gap.

**Sources.**

- BFH90, §3, pp.569–571, Proposition 3.10, (3.31)–(3.39): The source states Proposition 3.10, but its global chart substitution needs E-MP8-7. The revised target retains the actual compact product; its uniform majorant remains a gap.

**Acceptance.**

- The zero-extension statement is false without φ₁ divisibility.

**Prerequisites.** [`MP.8/test-coefficient-strip`](#n-mp-8-test-coefficient-strip), [`MP.8/whittaker-continuation`](#n-mp-8-whittaker-continuation).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/RotatedBounds`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-novodvorsky-transform"></a>

### Novodvorsky Mellin transform — `MP.8/novodvorsky-transform`

definition · from the MP.8 part · planet “Novodvorsky transform”

**Statement.** For ε=±1 define F^ε(u,s;y₂)=∫_{y₁>0}∫_{z∈R} T(W^ε(Δ_z^−2 y₁,Δ_z y₂;s)σ(κ_z)) e(−ε y₁z/(1+z²)) y₁^(u−3/2)√(1+iz) dz dy₁/y₁, with the continuous root equal to 1 at z=0. This is an iterated integral in that order; substituting the R³ kernel does not give a jointly absolutely convergent integral.

**Proof outline.**

1. Keep the z integral inner and the positive Mellin measure outer. The continuation construction uses the φ₁ divisibility and strip shift.
2. Only apply Fubini after proving a separate majorant. BFH explicitly warns that the expanded integral is not absolutely convergent.

**Sources.**

- BFH90, §3, p.570, (3.37); pp.571–574, Propositions 3.11–3.12: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, pp.571–574, Propositions 3.11–3.12: Split the iterated Mellin transform into large and small y₁ tails; use nondegenerate rapid decay and the repaired rotated bound with global φ₁ divisibility to continue it.
- BFH §3, p.571, (3.39)–(3.41): Uses novodvorsky mellin transform in rank-zero laplace coefficient: Define τ(s,y₂;v,σ)=∫_R Δ_z^(−s+k/2)e^(−2πy₂Δ_z)√(1+iz)vσ(ηw^−1κ_z wJ)dz, where η,w,J are exactly the compact matrices in §1 and (3.40). It is the rank-zero boundary contribution, distinct from the degenerate W⁰ term. Apply T only after forming the vector-valued integral.
- BFH §3, p.576, (3.48)–(3.49): Uses novodvorsky mellin transform in degenerate boundary mellin coefficients: Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.

**API.**

- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_zero` (simp): The transform of the zero coefficient is zero.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_scalar` (functoriality): F is linear in the matrix coefficient.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_sign` (projection): The + Whittaker function uses e(−y₁z/(1+z²)); the − one uses its inverse.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_zero_test` (degenerate): F of zero vanishes for both signs.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_root` (computation): At z=0 the extra square-root factor is 1.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_sign_test` (computation): At y₁=z=1, the two oscillatory factors both equal −1.

**Acceptance.**

- The exponent is u−3/2 with dy₁/y₁.
- The oscillatory sign is opposite to the W sign.

**Prerequisites.** [`MP.8/rotated-whittaker-bound`](#n-mp-8-rotated-whittaker-bound).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Novodvorsky`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-novodvorsky-continuation"></a>

### Novodvorsky analytic continuation — `MP.8/novodvorsky-continuation`

theorem · from the MP.8 part

**Statement.** For φ divisible by φ₁, the Novodvorsky transforms continue holomorphically for Re s>3/2 and Re(u−s+5/2)>0, initially agreeing with the iterated integral for Re u large. The large-y₁ tail uses nondegenerate rapid decay and the small-y₁ tail uses Proposition 3.10. This assertion is not joint absolute convergence of the expanded R³×R×R₊ kernel.

**Proof outline.**

1. For the continued scalar W, integrate its bounded compact-parameter kernel; Proposition 3.10 gives y₁^(u−s+5/2) at zero.
2. Use the rapid-decay bound at infinity. Apply the bounded holomorphic strip to shift the x₁ contour as (3.41), controlling the rectangular boundary tails.
3. Glue with the initial iterated-integral region by uniqueness.

**Sources.**

- BFH90, §3, pp.571–574, Propositions 3.11–3.12: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The Mellin domain includes (u,s)=(1/2,2).

**Prerequisites.** [`MP.8/novodvorsky-transform`](#n-mp-8-novodvorsky-transform), [`MP.8/rotated-whittaker-bound`](#n-mp-8-rotated-whittaker-bound), [`MP.8/whittaker-rapid-decay`](#n-mp-8-whittaker-rapid-decay).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Novodvorsky`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-tau-transform"></a>

### Rank-zero Laplace coefficient — `MP.8/tau-transform`

definition · from the MP.8 part

**Statement.** Define τ(s,y₂;v,σ)=∫_R Δ_z^(−s+k/2)e^(−2πy₂Δ_z)√(1+iz)vσ(ηw^−1κ_z wJ)dz, where η,w,J are exactly the compact matrices in §1 and (3.40). It is the rank-zero boundary contribution, distinct from the degenerate W⁰ term. Apply T only after forming the vector-valued integral.

**Proof outline.**

1. Insert the BFH fixed compact matrices and use the exponential in Δ_z to obtain absolute convergence for y₂>0.
2. Differentiate in s under a compact-parameter majorant.

**Sources.**

- BFH90, §3, p.571, (3.39)–(3.41): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, pp.573–574, Proposition 3.12: Choose a weight-compatible coefficient with the global divisor required for nonzero continued nondegenerate transforms and identically vanishing rank-zero transform.
- BFH §3, p.574, Proposition 3.13: Uses rank-zero laplace coefficient in nonzero rank-zero test: For each Re s>3/2 there exist actual finite-dimensional σ, weight-k v, T and y₂>0 with Tτ(s,y₂)≠0, while both TF^± have the continuation domain of Proposition 3.12. Choose φ divisible by φ₁ and nonzero on the rank-zero chart. No simultaneous F-nonvanishing is asserted in this proposition.
- BFH §3, p.577, Proposition 3.15: Uses rank-zero laplace coefficient in nonzero degenerate residue test: There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

**API.**

- `TauCeti.Jacobi.GenusTwo.tauTransform_zero` (simp): Zero v gives τ=0.
- `TauCeti.Jacobi.GenusTwo.tauTransform_scalar` (functoriality): Scaling v or T scales the Laplace coefficient.
- `TauCeti.Jacobi.GenusTwo.tauTransform_holomorphic` (structure): For y₂>0 the coefficient is entire in s.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.tauTransform_zero_test` (degenerate): τ of the zero coefficient is zero.
- `TauCeti.Jacobi.GenusTwo.tauTransform_base_factor` (computation): The scalar integrand factor at z=0 is e^−2πy₂.
- `TauCeti.Jacobi.GenusTwo.tauTransform_weight_two` (computation): For k=2,s=1 the Δ_z power is zero.

**Acceptance.**

- φ divisible by φ₂ makes Tτ identically zero through (3.41).

**Prerequisites.** [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/novodvorsky-transform`](#n-mp-8-novodvorsky-transform).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-degenerate-mellin-coefficients"></a>

### Degenerate boundary Mellin coefficients — `MP.8/degenerate-mellin-coefficients`

construction · from the MP.8 part

**Statement.** Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.

**Proof outline.**

1. Use the continued W⁰, not its out-of-chamber totalized integral. Rapid decay in Δ_z y₂ gives an integrable z-majorant.
2. Keep the wκ_zJ order in M̃; derive parameter holomorphy on compact subsets.

**Sources.**

- BFH90, §3, p.576, (3.48)–(3.49): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §3, p.577, Proposition 3.15: Uses degenerate boundary mellin coefficients in nonzero degenerate residue test: There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.
- BFH §8, pp.601–614, Proposition 8.1: Supply the degenerate Mellin coefficients in the three boundary fractions, with transforms evaluated at N⁻¹y₂ and their stated parameter powers.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

**API.**

- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_linear` (functoriality): M and M̃ are linear in v and T.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_holomorphic` (structure): Both are holomorphic for Re s>3/2 at fixed y₂>0.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_kernel` (projection): The multiplier is Δ_z^(2s−8)√(1+iz).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_zero` (degenerate): Zero v gives M=M̃=0.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_s_two` (computation): At s=2 the Δ_z multiplier is (1+z²)^−2.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_z_zero` (computation): At z=0 the additional multiplier is 1.

**Acceptance.**

- At s=2 the extra factor is Δ_z^−4.
- No y₁ Mellin integral occurs here.

**Prerequisites.** [`MP.8/degenerate-whittaker-continuation`](#n-mp-8-degenerate-whittaker-continuation), [`MP.8/novodvorsky-transform`](#n-mp-8-novodvorsky-transform), [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-local-test-nonzero-f"></a>

### Nonzero Novodvorsky tests with vanishing rank zero — `MP.8/local-test-nonzero-f`

theorem · from the MP.8 part

**Statement.** For every even k≥2 and (u,s) with Re s>3/2, Re(u−s+5/2)>0, there exist an actual finite-dimensional σ, weight-k v and T for which both continued TF⁺ and TF⁻ are analytic in the asserted domain and Tτ is identically zero. For each sign ε separately there is a positive y₂^ε with TF^ε(u,s,y₂^ε)≠0. One may take the coefficient divisible by φ₁φ₂; a common y₂ for the two signs is not asserted.

**Proof outline.**

1. Use φ₁φ₂ times high powers of weight-zero polynomial coefficients to preserve convergence and kill τ via its chart restriction.
2. If every test vanished, Peter–Weyl density would force the transformed integral (3.45) to vanish on all compact-group test vectors.
3. Concentrate its Laplace mass at the unique minimum shown on p.574; the remaining nonzero integrand contradicts universal vanishing. Keep the sign separately.

**Sources.**

- BFH90, §3, pp.573–574, Proposition 3.12: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The output is an existential finite K-type, not an axiom named nonzero.

**Prerequisites.** [`MP.8/novodvorsky-continuation`](#n-mp-8-novodvorsky-continuation), [`MP.8/tau-transform`](#n-mp-8-tau-transform), [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-local-test-nonzero-tau"></a>

### Nonzero rank-zero test — `MP.8/local-test-nonzero-tau`

theorem · from the MP.8 part

**Statement.** For each Re s>3/2 there exist actual finite-dimensional σ, weight-k v, T and y₂>0 with Tτ(s,y₂)≠0, while both TF^± have the continuation domain of Proposition 3.12. Choose φ divisible by φ₁ and nonzero on the rank-zero chart. No simultaneous F-nonvanishing is asserted in this proposition.

**Proof outline.**

1. Use Peter–Weyl density after projection to the prescribed SO(2) weight and multiplication by the global divisor. Choose a phase-aligned localized coefficient whose even pushforward under z↦Δ_z is nonzero.
2. Laplace injectivity applies to that pushforward, not merely to a nonzero function of z: an odd integrable function has zero transform for every y₂. Establish the compatible localized finite-K-type construction and integrability; this is an explicit gap.

**Sources.**

- BFH90, §3, p.574, Proposition 3.13: The source states Proposition 3.13. Its nonzero-restriction argument does not establish a nonzero even Laplace pushforward; the revised proof requires the explicitly recorded weight/divisor-compatible construction.

**Acceptance.**

- Keep this test separate from the τ-killing test.

**Prerequisites.** [`MP.8/novodvorsky-continuation`](#n-mp-8-novodvorsky-continuation), [`MP.8/tau-transform`](#n-mp-8-tau-transform), [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-local-test-nonzero-m"></a>

### Nonzero degenerate residue test — `MP.8/local-test-nonzero-m`

theorem · from the MP.8 part

**Statement.** There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.

**Proof outline.**

1. Carry out the degenerate Bessel formula from the recorded Proposition 3.14 source gap.
2. Choose a φ₁φ₂-divisible finite K-type and show its scalar M-transform is nonzero by the explicit Bessel/Laplace calculation. BFH only states this input, so the construction is an exact gap pending verification.

**Sources.**

- BFH90, §3, p.577, Proposition 3.15: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The nonzero value is at s=2.

**Prerequisites.** [`MP.8/degenerate-mellin-coefficients`](#n-mp-8-degenerate-mellin-coefficients), [`MP.8/novodvorsky-continuation`](#n-mp-8-novodvorsky-continuation), [`MP.8/tau-transform`](#n-mp-8-tau-transform), [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-similitude-heisenberg-comparison"></a>

### Similitude action on the Jacobi group — `MP.8/similitude-heisenberg-comparison`

comparison · from the MP.8 part

**Statement.** For the MP.6 Heisenberg group H(W)=W×R with law (w,t)(w',t')=(w+w',t+t'+ω(w,w')/2), every g∈GSp₄(R) acts by (w,t)↦(gw,μ(g)t). Pulling this action back along the double-cover projection gives the native semidirect product H(W)⋊G̃Sp₄. A fixed central character e(mt) is preserved only by μ=1; general positive similitudes transport index m to μm. The two BFH slash lattices are specializations of the MP.6 Jacobi action, with their actual central phases and genus-two index m/N.

**Proof outline.**

1. Import the general Heisenberg group, Schrödinger–Weil action and Jacobi forms from MP.6, following confirmed RT-AREA-automorphic-1/20.
2. Check ω(gw,gw')=μω(w,w'), hence multiplication and inverse compatibility; then use native SemidirectProduct.
3. Compute the central character after transport and specialize the (λ,ρ) coordinates. Do not claim a fixed-index representation of all similitudes.

**Sources.**

- BFH90, §1, pp.546–549, (1.4)–(1.9): BFH gives the slash law and its central multiplier. The general Heisenberg statement is the required comparison with the MP.6 supplier, derived from the similitude identity, not a claimed new BFH definition.

**Acceptance.**

- g=2I₄ scales the Heisenberg center by 4.
- For μ=1 the fixed-index Schrödinger representation is recovered.

**Prerequisites.** [`MP.8/positive-similitudes`](#n-mp-8-positive-similitudes), [`MP.8/similitude-cover`](#n-mp-8-similitude-cover), [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), [`MP.8/bfh-translation`](#n-mp-8-bfh-translation), `MetaplecticAutomorphicForms:MP.6`, `mathlib:SemidirectProduct`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 11: replace the bare stage `MP.6` by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces). verified: the node imports the Heisenberg group, the Schrödinger–Weil action and the Jacobi forms of MP.6 (as its proof says, following RT-AREA-automorphic-1/20) and transports the index under similitudes.

<a id="n-mp-8-full-real-cover"></a>

### Full real similitude extension — `MP.8/full-real-cover`

construction · from the MP.8 part

**Statement.** Let r=diag(I₂,−I₂) with μ(r)=−1. Every negative similitude is uniquely g₊r. On H₂ put c(Z)=−conjugate Z. Conjugation by r acts on the positive cover by (g,ρ(Z))↦(rgr,conjugate(ρ(c(Z)))); this is an involution because d(rgr,Z)=conjugate d(g,c(Z)). Define the split extension G̃Sp₄(R)=G̃Sp₄⁺(R)⋊C₂ using this involution. Its projection onto GSp₄(R) has kernel {±1}; r has a chosen order-two lift. BFH only uses the positive component: comparison with a prescribed adelic extension is an additional input, not proved by this construction.

**Proof outline.**

1. Separate by the sign of μ and verify c(gZ)=rgr·c(Z).
2. Conjugate the continuous square-root function to construct the actual automorphism of the positive cover, and check its square is identity.
3. Use the native semidirect product for this chosen real extension. Record the local/adelic normalization comparison as a gap.

**Sources.**

- BFH90, §1, pp.545–546, definition of GSp⁺(4,R): This is an explicitly derived real extension of BFH's positive component. BFH does not assert its finite-place compatibility; that boundary remains a supplier request.

**Uses.**

- BFH §1, pp.545–549; §2, p.553, (2.6): Compare the real arithmetic cover lift with the MP.4 restricted product and rational splitting, including the prescribed finite theta vector and dyadic compact-open lift.

**API.**

- `TauCeti.Jacobi.GenusTwo.fullRealCover_positive` (constructor): The positive cover embeds as the identity-component subgroup.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_kernel` (characterisation): The projection kernel is exactly {±1}.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_reflection` (relation): The chosen lift of r has square 1 and conjugates by the stated involution.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.fullRealCover_reflection_test` (computation): μ(r)=−1 and r²=I₄.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_base` (computation): c(iI₂)=iI₂.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_central` (characterisation): The involution fixes both kernel elements.

**Acceptance.**

- The reflection is excluded from GSp⁺ but included in the extension.
- The chosen reflection lift squares to 1, a convention that must be matched at finite places.

**Prerequisites.** [`MP.8/similitude-cover`](#n-mp-8-similitude-cover), `mathlib:SemidirectProduct`, `MetaplecticAutomorphicForms:MP.4`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Cover`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 12: replace the bare stage `MP.4` by [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover). verified: MP.4 is cited only for the adelic extension with which the chosen real reflection convention must later be compared; that comparison stays a recorded gap of the part.

<a id="n-mp-8-arithmetic-adelic-comparison"></a>

### Arithmetic and adelic cover compatibility — `MP.8/arithmetic-adelic-comparison`

comparison · from the MP.8 part

**Statement.** Use the MP.4 restricted product of normalized local rank-two metaplectic covers, the rational splitting on Sp₄(Q), and the Schrödinger–Weil lattice model. Construct the map from the BFH real arithmetic lift of Γ_N into the quotient by the rational splitting with the finite vector fixed by its specified compact-open subgroup. Prove that its archimedean theta multiplier equals the θ-S law and that the two cusp splittings differ by the prescribed J lift. The finite multiplier, dyadic splitting at N divisible by 8M, and extension to Qˣ similitudes must be specified explicitly before this comparison is usable.

**Proof outline.**

1. Import the local cocycle, genuine oscillator representation and restricted-product construction, never reconstruct them in MP.8.
2. Compare on the unipotent generators, integral Levi generators and J, using the Fourier transform of the same self-dual measure.
3. Check the product formula and the finite lattice stabilizer, especially at 2; compare the chosen full-real reflection convention separately. Exact finite similitude cocycle and splitting data are recorded as an open input.

**Sources.**

- BFH90, §1, pp.545–549; §2, p.553, (2.6): BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

**Acceptance.**

- Agreement on Sp₄ is insufficient to assert agreement on all GSp₄ similitudes.
- An unramified odd-prime vector cannot justify the dyadic arithmetic splitting.

**Prerequisites.** [`MP.8/full-real-cover`](#n-mp-8-full-real-cover), [`MP.8/arithmetic-subgroup`](#n-mp-8-arithmetic-subgroup), [`MP.8/theta-fourier-transform`](#n-mp-8-theta-fourier-transform), `MetaplecticAutomorphicForms:MP.1`, `MetaplecticAutomorphicForms:MP.2`, `MetaplecticAutomorphicForms:MP.4`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/AdelicComparison`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 13: replace the bare stage `MP.1` by [`MP.1/rao-factor-set`](#n-mp-1-rao-factor-set), [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover), [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator). verified: the node imports the local cocycle, the double cover and the genuine oscillator representation (all moved to MP.2 by R1, ids unchanged).

**Routed edit.** R5 row 14: replace the bare stage `MP.2` by [`MP.2/generator-operators`](#n-mp-2-generator-operators), [`MP.2/operator-relations`](#n-mp-2-operator-relations). verified: the comparison is made on unipotent, integral Levi and Fourier generators, whose operators and relations are these two nodes.

**Routed edit.** R5 row 15: replace the bare stage `MP.4` by [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting), [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation), [`MP.4/unramified-compact-splittings`](#n-mp-4-unramified-compact-splittings), [`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product), [`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation). verified: the node uses the restricted product, the rational splitting, the global Schrödinger model, the integral splittings at good places, the product formula and the finite vector fixed by a compact-open subgroup, which are these six MP.4 targets.

<a id="n-mp-8-theta-levi-transform"></a>

### Theta component Levi transformations — `MP.8/theta-levi-transform`

theorem · from the MP.8 part

**Statement.** Let E(n)=[[1,n],[0,1]], N|n. Then E₁(m(E(n))g;ν)=E₁(g;E(n)ᵀν), and E₀(m(E(n)ᵀ)g;μ)=E₀(g;E(n)μ). For ν=(0,r), the first component and the finite Fourier combination Σμ e(−Nν·μ/(2m))E₀(g;μ) are invariant under the relevant E(n) action. This is Proposition 2.3 and its Corollary 2.4, with the transpose on the correct cusp.

**Proof outline.**

1. Change the theta summation vector by the integral unimodular Levi matrix.
2. Compare coefficients of the independent theta basis. Reindex the finite Fourier sum for ν=(0,r).

**Sources.**

- BFH90, §2, pp.554–555, Proposition 2.3, Corollary 2.4: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The cusp-0 and cusp-1 Levi matrices are transposes.

**Prerequisites.** [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition), [`MP.8/theta-component-fourier-law`](#n-mp-8-theta-component-fourier-law).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Covariance`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-theta-unipotent-transforms"></a>

### Theta component unipotent transformations — `MP.8/theta-unipotent-transforms`

theorem · from the MP.8 part

**Statement.** For ν=(0,r), E₁(n(V)g;ν)=E₁(g;ν) if V is integral symmetric, N|V₁₁,V₁₂ and 4m|V₂₂. E₀(n(V)g;μ)=E₀(g;μ) for every integral symmetric V and every μ. For N|n the lower-unipotent laws are √det(I+U₁(n)Z_g)E₁(lower(U₁(n))g;ν)=E₁(g;ν) and √det(I+U₀(n)Z_g)Σμ e(−Nν·μ/(2m))E₀(lower(U₀(n))g;μ)=Σμ e(−Nν·μ/(2m))E₀(g;μ), U₁(n)=diag(0,n), U₀(n)=diag(n,0). Roots are the cover lifts continued from n=0.

**Proof outline.**

1. For upper unipotents compute the exponential on each residue class; the displayed divisibilities make it 1.
2. Conjugate by J, apply the finite theta Fourier transform twice, and track the root and phase to obtain the lower laws.

**Sources.**

- BFH90, §2, pp.555–556, Propositions 2.5–2.6: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The 4m divisibility on V₂₂ cannot be weakened to N alone.
- The lower law contains the determinant root, unlike the upper law.

**Prerequisites.** [`MP.8/theta-levi-transform`](#n-mp-8-theta-levi-transform), [`MP.8/theta-component-fourier-law`](#n-mp-8-theta-component-fourier-law).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Covariance`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-coefficient-levi-transform"></a>

### Fourier coefficient Levi covariance — `MP.8/coefficient-levi-transform`

theorem · from the MP.8 part

**Statement.** For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.

**Proof outline.**

1. Change variables on the X,W quotient tori; unimodularity preserves Haar volume and the respective congruence subgroup preserves the period lattice.
2. Transport the native quadratic form by y, then recover its discriminant form and residue. Specialize the triangular generators for Corollary 2.8.

**Sources.**

- BFH90, §2, pp.556–557, Proposition 2.7, Corollary 2.8: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The coefficient index is the full conjugated matrix, not only its scalar determinant.

**Prerequisites.** [`MP.8/fourier-coefficient`](#n-mp-8-fourier-coefficient), [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition), [`MP.8/theta-levi-transform`](#n-mp-8-theta-levi-transform), [`MP.8/theta-coefficient`](#n-mp-8-theta-coefficient), `mathlib:Matrix.toLin'`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Covariance`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-matrix-mobius"></a>

### Matrix Möbius function — `MP.8/matrix-mobius`

definition · from the MP.8 part

**Statement.** For a nonsingular integral 2×2 matrix H, choose positive Smith invariants a|b with UHV=diag(a,b), U,V∈GL₂(Z), and define μ₂(H)=gcd(a,b)μ(a)μ(b), using the native integer Möbius function. The value is independent of the Smith presentation and invariant under left and right unimodular multiplication. Matrix divisors H|C mean H⁻¹C integral, modulo right multiplication of H by GL₂(Z). Set μ₂(H)=0 for singular H; the divisor theorems only use nonsingular C and full-rank divisors.

**Proof outline.**

1. Use native Submodule.exists_smith_normal_form_of_le for the image lattice in Z²; normalize its two nonzero integer coefficients by units. Prove presentation independence by the gcd/product invariants argument on p.578, without re-planning Smith normal form.
2. Evaluate native ArithmeticFunction.moebius on the two positive invariants. Right-unimodular invariance of divisor representatives is separate from left/right invariance of μ₂.

**Sources.**

- BFH90, §4, pp.577–578, definition before Proposition 4.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §4, pp.577–578, paragraph before Proposition 4.1 and Proposition 4.2: Remove primitive-pair constraints by the matrix Möbius inversion, using full row rank and CDᵀ=DCᵀ and the required integral completion.
- BFH §4, p.578, Proposition 4.1: Uses matrix möbius function in matrix möbius divisor identity: For nonsingular C∈M₂(Z), the finite sum Σ_{H|C / right GL₂(Z)} μ₂(H) is 1 if C is unimodular and 0 otherwise.

**API.**

- `TauCeti.Jacobi.GenusTwo.matrixMobius_unimodular` (simp): A unimodular H has μ₂(H)=1.
- `TauCeti.Jacobi.GenusTwo.matrixMobius_smith` (characterisation): On Smith diagonal a|b, μ₂=gcd(a,b)μ(a)μ(b).
- `TauCeti.Jacobi.GenusTwo.matrixMobius_equiv` (functoriality): μ₂(UHV)=μ₂(H) for U,V unimodular.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.matrixMobius_identity` (computation): μ₂(I₂)=1.
- `TauCeti.Jacobi.GenusTwo.matrixMobius_scalar_prime` (computation): μ₂(pI₂)=p for a prime p.
- `TauCeti.Jacobi.GenusTwo.matrixMobius_square_prime` (computation): μ₂(diag(p²,1))=0.

**Acceptance.**

- μ₂(I₂)=1, μ₂(pI₂)=p for prime p, μ₂(diag(p²,1))=0.

**Prerequisites.** `mathlib:ArithmeticFunction.moebius`, `mathlib:Submodule.exists_smith_normal_form_of_le`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-primitive-symplectic-pairs"></a>

### Primitive symmetric pairs and symplectic completion — `MP.8/primitive-symplectic-pairs`

theorem · from the MP.8 part

**Statement.** For an integral pair (C,D) of full row rank two satisfying CDᵀ=DCᵀ, call it primitive if every rational G with GC,GD integral is integral. It is primitive exactly when it occurs as the bottom row of a matrix in Sp₄(Z). Every such full-rank symmetric pair factors (C,D)=H(C₀,D₀) with H nonsingular integral and (C₀,D₀) primitive; a matrix H₁ divides both C,D iff it divides H, and H is unimodular iff the pair is primitive.

**Proof outline.**

1. The superscript t in BFH is prefixed to D: the condition is CDᵀ symmetric, not CᵀD symmetric.
2. Use Smith normal form of the full-row-rank 2×4 matrix (C,D) to extract the image lattice and its content H. Full row rank is essential to nonsingularity.
3. Complete a primitive isotropic rank-two lattice to an integral symplectic basis; BFH cites Maass §11. Record that exact completion theorem as a gap.

**Sources.**

- BFH90, §4, pp.577–578, paragraph before Proposition 4.1 and Proposition 4.2: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The zero pair is excluded by full row rank.
- The bottom pair (0,I₂) is primitive and completes to the identity.

**Prerequisites.** `mathlib:Matrix.symplecticGroup`, [`MP.8/matrix-mobius`](#n-mp-8-matrix-mobius).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-matrix-mobius-divisor-identity"></a>

### Matrix Möbius divisor identity — `MP.8/matrix-mobius-divisor-identity`

theorem · from the MP.8 part

**Statement.** For nonsingular C∈M₂(Z), the finite sum Σ_{H|C / right GL₂(Z)} μ₂(H) is 1 if C is unimodular and 0 otherwise.

**Proof outline.**

1. Unimodular left and right changes reduce C to positive Smith diagonal diag(a,b).
2. Use representatives H=[[r,s],[0,t]], r,t>0, 0≤s<r. The divisor conditions are r|a,t|b,rt|sb.
3. Separate relatively prime elementary factors and check prime-power cases, where only r=1,p give nonzero contributions.

**Sources.**

- BFH90, §4, p.578, Proposition 4.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- At C=pI₂ the divisor sum vanishes although μ₂(C)=p.

**Prerequisites.** [`MP.8/matrix-mobius`](#n-mp-8-matrix-mobius).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-matrix-mobius-inversion"></a>

### Primitive matrix Möbius inversion — `MP.8/matrix-mobius-inversion`

theorem · from the MP.8 part

**Statement.** For a function h on rational symmetric matrices periodic under integral symmetric translations, define S_h(C)=Σ_{D mod C,CDᵀ=DCᵀ}h(C⁻¹D) and S_h# by restricting to primitive pairs. For nonsingular C, S_h#(C)=Σ_{H|C}μ₂(H)S_h(H⁻¹C). If C≡0 mod N, restrict S_h,N to gcd(det D,N)=1 and D₁₂≡0 mod N; the primitive restricted sum equals Σ_{H|C,gcd(det H,N)=1}μ₂(H)S_h,N(H⁻¹C). The restricted formula uses the common content factor; the congruence must be tracked after division. In the N-restricted formula choose N-adapted upper Hermite representatives H=[[r,s],[0,t]] with gcd(rt,N)=1 and s≡0 mod N: choose the representative of the ordinary s mod r in N·Z (possible uniquely modulo Nr). Then H is diagonal modulo N and H⁻¹ preserves D₁₂≡0 mod N. An arbitrary equivalent matrix divisor representative is insufficient.

**Proof outline.**

1. Insert the divisor identity for the common content H of each pair. Finite reindexing proves unrestricted inversion.
2. For the congruence-restricted sum, primitive C≡0N forces detD coprime to N; only content factors prime to N survive. Preserve D₁₂ congruence when transporting the representatives. Use these N-adapted representatives before dividing; do not infer congruence preservation from the unrestricted GL₂-invariance of μ₂.

**Sources.**

- BFH90, §4, p.579, Propositions 4.3–4.4: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- N=1 reduces to the unrestricted formula.

**Prerequisites.** [`MP.8/primitive-symplectic-pairs`](#n-mp-8-primitive-symplectic-pairs), [`MP.8/matrix-mobius-divisor-identity`](#n-mp-8-matrix-mobius-divisor-identity).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-finite-exponential-sums"></a>

### Genus-two finite exponential sums — `MP.8/finite-exponential-sums`

definition · from the MP.8 part

**Statement.** For det C≠0, T half integral symmetric and R∈Z², define S₁(C;T,R)=Σ_{D mod NC,CDᵀ=DCᵀ, primitive(C,D),D≡0 mod N} Σ_{λ∈Z²/CᵀZ²} e(−RᵀC⁻¹Dλ+m(C⁻¹D)[λ]+N⁻¹tr(TC⁻¹D)). Define S₀ by D mod C, D₁₂≡0N and the phase −NRᵀC⁻¹Dλ+m(C⁻¹D)[λ]+tr(TC⁻¹D), requiring C≡0N. Here D mod LC means D'=D+LC S for an integral symmetric S. The quotient is taken inside the symmetric pairs; the second quotient is the image lattice CᵀZ². Phases must descend before summing.

**Proof outline.**

1. Use exact native quotient sets for the D translation relation and for the λ lattice relation; prove finiteness from detC≠0.
2. Prove phase independence under both choices using T half integral, m divisible by N and primitive symmetric-pair congruences.
3. Sum the actual additive characters over finite quotients, not a table assigned as data.

**Sources.**

- BFH90, §5, p.580, (5.2); p.582, (5.4): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §5, p.580, definition of H before Proposition 5.1: Separate the finite arithmetic phase sum from the archimedean unfolded kernel, retaining the level normalization (2mN³)⁻¹ and the quadratic discriminant substitution.
- BFH §5, pp.580–582, Proposition 5.1: Uses genus-two finite exponential sums in cusp-one full-rank fourier unfolding: For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.
- BFH §6, pp.583–584; §7, p.589, (7.1): Form the first-cusp Dirichlet coefficient from the primitive exponential sum and a(n) of the original newform, with the actual β modulus and α-divisibility constraint.

**API.**

- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_well_defined` (characterisation): Changing either representative leaves the character and sum unchanged under the stated conditions.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_identity` (simp): S₁(I₂;T,R)=1.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_bad_determinant` (simp): If gcd(det C,N)>1 then S₁(C;T,R)=0.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_identity_test` (computation): S₁(I₂;0,0)=1.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_bad_prime` (non-example): For p|N, S₁(pI₂;T,R)=0.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_gauss` (computation): For N=1,m=1,C=diag(1,3),T=R=0, S₁=0: the two primitive D₂₂ classes yield opposite quadratic Gauss phases.

**Acceptance.**

- S₁ vanishes unless gcd(det C,N)=1.
- At C=I₂ there is one admissible D class and one λ class, so S₁=1.

**Prerequisites.** [`MP.8/primitive-symplectic-pairs`](#n-mp-8-primitive-symplectic-pairs), [`MP.8/arithmetic-subgroup`](#n-mp-8-arithmetic-subgroup), [`MP.8/matrix-mobius-inversion`](#n-mp-8-matrix-mobius-inversion).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/ExponentialSums`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-fourier-unfolding-kernel"></a>

### Genus-two Fourier unfolding kernel — `MP.8/fourier-unfolding-kernel`

definition · from the MP.8 part

**Statement.** For Y=QQᵀ positive definite, Z=X+iY, detC≠0, define H(Q,s;C,T,R)=(2mN³)^−1∫_{R³}√(−detZ)(detY/|detZ|²)^(s/2) I([[0,−C⁻ᵀ],[C,0]][[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]) e(Z[R]/(4m)−N⁻¹tr(TZ))dX. The positive-base power is exp((s/2)log(detY/|detZ|²)). Its quadratic shift identity is H(Q,s;C,N^(1−j)T,N^(1−j)R)=H(Q,s;C,N^(1−j)U/(4m),0) when T=(U+N^(2−j)RRᵀ)/(4m).

**Proof outline.**

1. Define the vector-valued Bochner integral with the same determinant-root branch as W.
2. Combine its two exponential quadratic terms algebraically to obtain the U identity; convergence and unfolding are separate claims.

**Sources.**

- BFH90, §5, p.580, definition of H before Proposition 5.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §5, pp.580–582, Proposition 5.1: Uses genus-two fourier unfolding kernel in cusp-one full-rank fourier unfolding: For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.

**API.**

- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_zero` (simp): A zero seed gives H=0.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_linear` (functoriality): H is linear in the seed and commutes with continuous linear functionals in its convergence chamber.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_discriminant` (compatibility): Substituting T=(U+N^(2−j)RRᵀ)/(4m) gives the stated R=0 kernel.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_zero_test` (degenerate): H of zero is zero.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_base_root` (computation): At X=0,Y=I₂ the root factor is 1.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_shift_test` (computation): N=8,m=16,j=1,R=(0,1),U=0 gives T=diag(0,1/8); its two exponent terms cancel.

**Acceptance.**

- The prefactor is 1/(2mN³), and the real power uses s/2.

**Prerequisites.** [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/finite-exponential-sums`](#n-mp-8-finite-exponential-sums), [`MP.8/quadratic-matrix`](#n-mp-8-quadratic-matrix).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/Unfolding`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R6: checked, no change. checked, no change: the prefactor (2mN³)⁻¹ comes from BFH (2.3) and the Gaussian integral on p. 581, both correct and independent of the theta norm.

<a id="n-mp-8-cusp-one-unfolding"></a>

### Cusp-one full-rank Fourier unfolding — `MP.8/cusp-one-unfolding`

theorem · from the MP.8 part

**Statement.** For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Classify the P∩Γ left cosets by primitive bottom pairs (C,D), modulo left Γ⁰(N).
2. Unravel the X torus using D↦D+NC S, then unravel the W integral using λ↦λ+Cᵀλ₀. Prove absolute convergence before these changes.
3. Shift X by C⁻¹D and evaluate the Gaussian W integral; its determinant and 2m factors give H.

**Sources.**

- BFH90, §5, pp.580–582, Proposition 5.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The W Gaussian produces √(−detZ)/(2m), not detZ/(2m).

**Prerequisites.** [`MP.8/fourier-coefficient`](#n-mp-8-fourier-coefficient), [`MP.8/finite-exponential-sums`](#n-mp-8-finite-exponential-sums), [`MP.8/fourier-unfolding-kernel`](#n-mp-8-fourier-unfolding-kernel), [`MP.8/jacobi-eisenstein`](#n-mp-8-jacobi-eisenstein).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/Unfolding`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-cusp-zero-rank-expansion"></a>

### Cusp-zero Fourier rank expansion — `MP.8/cusp-zero-rank-expansion`

theorem · from the MP.8 part

**Statement.** For Re s sufficiently large, B₀ is the full-rank sum Σ_{C nonsingular,C≡0N / left Γ₀(N)}S₀(C;T,R)|detC|^−s N³H(Q,s;C,NT,NR), plus the rank-one coset contribution, plus δ_{NR/(2m)∈Z²}detY^(s/2)∫_{X mod integral symmetric} [I(g)+I(m(η)g)]e(N²Z[R]/(4m)−tr(TZ))dX. The rank-one term is the original coset sum with rank C=1, before its cuspidal Whittaker cancellation.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Separate cosets by rank C=0,1,2. For rank zero the W integral is the lattice delta and leaves the two η-related Levi terms.
2. For full rank repeat the proven unfolding with the cusp-zero periods, giving N³H with NT,NR.
3. Keep the rank-one contribution explicitly until §6 integrates the elliptic cusp character.

**Sources.**

- BFH90, §5, pp.582–583, Proposition 5.2: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The rank-zero lattice condition is NR/(2m) integral.
- A rank-one term is not zero as a Jacobi coefficient before the further Whittaker extraction.

**Prerequisites.** [`MP.8/cusp-one-unfolding`](#n-mp-8-cusp-one-unfolding), [`MP.8/primitive-symplectic-pairs`](#n-mp-8-primitive-symplectic-pairs).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/Unfolding`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-whittaker-coefficient-extraction"></a>

### Genus-two Whittaker coefficient extraction — `MP.8/whittaker-coefficient-extraction`

definition · from the MP.8 part

**Statement.** For ν=(0,r), D∈Z, n₂=q/N>0 and n₁=N(r²−D)/(4m) integral, define C₁(s;D,n₂,r;y₁,y₂)=N⁻¹∫₀ᴺ C₁(m(E(x₂))m(√y₁diag(y₂,1));U₁(−ND),ν)e(−n₂x₂)dx₂. Define C₀ by the finite Fourier sum Σμ e(−Nν·μ/(2m)) of C₀ at m(E(−x₂)ᵀ)m(√y₁diag(y₂,1)), index U₀(−D), and the same normalized x₂ integral. The latter vanishes unless 4m|D; both are well defined by the coefficient covariance and periods. At cusp zero extend the extracted function by zero outside 4m|D before using its parity API.

**Proof outline.**

1. Use the proven x₂ period, not an unproved torus quotient. Construct the normalized interval integral and finite residue Fourier sum.
2. Translate the half-integral index condition via the native quadratic-form dictionary; it yields n₁ integral at cusp one and 4m|D at cusp zero.

**Sources.**

- BFH90, §6, pp.583,585–586, definitions before Propositions 6.1–6.2: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §6, pp.583–584; §7, p.589, (7.1): Use the first-cusp Whittaker extraction to identify its arithmetic coefficient with the Dirichlet series of the original newform, preserving congruence and divisibility restrictions.

**API.**

- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_linear` (functoriality): Extraction is linear in the theta-component family.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_period` (characterisation): The value is independent of the interval representative of length N under the proven period law.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_parity` (simp): The cusp-zero coefficient is zero if 4m does not divide D.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_zero` (degenerate): The zero component has zero extraction.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_frequency` (computation): A component e(qx₂/N)c extracts c at frequency q/N.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_wrong_frequency` (non-example): A component e(qx₂/N)c extracts zero at a distinct integral frequency q'/N.

**Acceptance.**

- Cusp-zero extraction includes every μ, not just ν.

**Prerequisites.** [`MP.8/coefficient-levi-transform`](#n-mp-8-coefficient-levi-transform), [`MP.8/theta-unipotent-transforms`](#n-mp-8-theta-unipotent-transforms), [`MP.8/theta-components`](#n-mp-8-theta-components), [`MP.8/theta-coefficient`](#n-mp-8-theta-coefficient).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-bfh-l-dirichlet-series"></a>

### BFH first-cusp Dirichlet series — `MP.8/bfh-l-dirichlet-series`

definition · from the MP.8 part

**Statement.** For the preceding parameters and the original normalized newform f with Fourier coefficients a(n), set L(s,D,n₂)=Σ_{α,δ>0; β mod Nδ;N|β;α|Nn₂δ} S₁([[α,β],[0,δ]];U₁(n₁),ν)(αδ)^−s(α/δ)^(k/2)a(Nn₂δ/α)e(n₂β/α). Put L(s,D)=L(s,D,N⁻¹). Positive real powers use the real logarithm. The congruence and divisibility constraints are part of the actual summation set.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Read a(n) as the original f coefficients from p.547. The auxiliary Fricke transform in the induced seed is turned back into f by the cusp-one unfolding on p.585; transformed cusp coefficients remain separately in P.
2. Use positive integer α,δ and a finite β residue set, with the divisor constraint making the coefficient index integral.
3. Prove β-representative independence from S₁ and the additive character. Initial convergence is inherited only after the actual unfolding estimate.

**Sources.**

- BFH90, §6, pp.583–584; §7, p.589, (7.1): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §6, pp.585–586, definition of P: Compare the two cusp Dirichlet coefficients without identifying their elliptic data: L uses the original f, while P uses transformed cusp coefficients and its finite theta phase.
- BFH §6, pp.584–585, Proposition 6.1: Uses bfh first-cusp dirichlet series in first-cusp whittaker expansion: In the common initial convergence chamber, for D≠0 the extracted coefficient is (n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m)) L(s,D,n₂) W^{sgn D}(|D|y₁/(4m),n₂y₂;s). For D=0 it is n₂^(s−4−k/2)L(s,0,n₂)W⁰(y₁,n₂y₂;s). These are vector identities, and applying T preserves them under convergence.
- BFH §7, pp.590–594, Lemma 7.2, (7.9),(7.12)–(7.16): Apply matrix Möbius inversion to the local unrestricted sums; retain all three exponents a,b,d and the four possible prime-power divisor contributions.

**API.**

- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_scalar` (functoriality): Scaling a scales L.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_identity_term` (projection): The α=δ=1,β=0 term is a(q) when n₂=q/N.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_specialize` (compatibility): L(s,D)=L(s,D,N⁻¹).

**Checks.**

- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_zero` (degenerate): a=0 gives L=0.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_normalized_term` (computation): For q=1 and a(1)=1 the identity term is 1.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_divisibility` (non-example): For q=1,α=2,δ=1 there is no summand.

**Acceptance.**

- At n₂=N⁻¹ the α constraint is α|δ.
- The identity α=δ=1,β=0 term is a(Nn₂).

**Prerequisites.** [`MP.8/finite-exponential-sums`](#n-mp-8-finite-exponential-sums), [`MP.8/whittaker-coefficient-extraction`](#n-mp-8-whittaker-coefficient-extraction), `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-bfh-p-dirichlet-series"></a>

### BFH opposite-cusp Dirichlet series — `MP.8/bfh-p-dirichlet-series`

definition · from the MP.8 part

**Statement.** For 4m|D, set P(s,D,n₂,r)=Σ_{μ mod 2m/N}e(−Nν·μ/(2m))Σ_{γ∈Γ₀(N)\SL₂(Z)}Σ_{αδ>0;β mod δ;α|Nn₂δ} S₀(Nγ⁻ᵀCw;T,μ)(N²αδ)^−s(α/δ)^(k/2)a_γ(Nn₂δ/α)e(n₂β/α), C=[[α,β],[0,δ]], T=(U₀(−D)+N²μμᵀ)/(4m), and omit a term when T is not half integral. The a_γ are the Fourier coefficients of the actual transformed elliptic seed at the indicated cusp; w=[[0,−1],[1,0]]. Put P(s,D,r)=P(s,D,N⁻¹,r). Extend P by zero outside its allowed condition 4m|D; this convention makes the non-integral-index tests unambiguous.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Import arbitrary-cusp/Fricke coefficients from upstream ModularForms layer 6; the classical-to-automorphic comparison is supplied by AF.5, not MP.7.
2. Take the finite μ and cusp quotient sums, retaining the half-integral index test and the (N²αδ)^−s factor. The dependence on r is in the finite Fourier character.

**Sources.**

- BFH90, §6, pp.585–586, definition of P: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §6, pp.586–588, Proposition 6.2: Uses bfh opposite-cusp dirichlet series in opposite-cusp whittaker rank expansion: For D≠0, C₀=N³(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m))P(s,D,n₂,r)W^{sgn D}(|D|y₁/(4m),n₂y₂;s)σ(w). For D=0, C₀=N³n₂^(s−k/2−4)P(s,0,n₂,r)W⁰(y₁,n₂y₂;s)σ(w)+(y₁y₂)^s y₂^(k/2)a(Nn₂)e(in₂y₂)vσ(η). The rank-one contribution to this extracted Whittaker coefficient is zero by cuspidality.
- BFH §7, p.589, Remark following Proposition 7.1: Compute the actual ramified cusp factors and prove their denominators nonzero near s=2 before using P-regularity in full Eisenstein regularity.

**API.**

- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_scalar` (functoriality): P is linear in all the transformed cusp coefficient sequences.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_residue` (relation): P is periodic in r modulo 2m/N.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_parity` (simp): Non-half-integral T contributes zero.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_zero` (degenerate): Zero coefficients at every cusp give P=0.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_residue_test` (characterisation): Replacing r by r+2m/N leaves P unchanged.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_nonintegral` (non-example): N=8,m=16,D=0,μ=(1,0) gives T=diag(1,0), hence is admitted; μ=(1,1) gives off-diagonal 1, also admitted. At D=1,μ=0 the index is not half integral and is omitted.

**Acceptance.**

- Replacing all a_γ by a silently loses the cusp data.
- Terms with non-half-integral T are zero.

**Prerequisites.** [`MP.8/finite-exponential-sums`](#n-mp-8-finite-exponential-sums), [`MP.8/bfh-l-dirichlet-series`](#n-mp-8-bfh-l-dirichlet-series), `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-first-cusp-whittaker-expansion"></a>

### First-cusp Whittaker expansion — `MP.8/first-cusp-whittaker-expansion`

theorem · from the MP.8 part

**Statement.** In the common initial convergence chamber, for D≠0 the extracted coefficient is (n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m)) L(s,D,n₂) W^{sgn D}(|D|y₁/(4m),n₂y₂;s). For D=0 it is n₂^(s−4−k/2)L(s,0,n₂)W⁰(y₁,n₂y₂;s). These are vector identities, and applying T preserves them under convergence.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Reduce C by left Γ⁰(N) to positive upper-triangular Hermite representatives α,β,δ.
2. Use the elliptic Fourier expansion to perform the x₂ integral; its period produces α|Nn₂δ, its coefficient a(Nn₂δ/α), and the phase e(n₂β/α).
3. Apply the scaled Whittaker integral (3.52)–(3.54) and track every n₂,|D|,4m power.

**Sources.**

- BFH90, §6, pp.584–585, Proposition 6.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The D=0 formula is separate; substituting D=0 into the nonzero formula is invalid.

**Prerequisites.** [`MP.8/cusp-one-unfolding`](#n-mp-8-cusp-one-unfolding), [`MP.8/bfh-l-dirichlet-series`](#n-mp-8-bfh-l-dirichlet-series), [`MP.8/whittaker-functions`](#n-mp-8-whittaker-functions).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-opposite-cusp-whittaker-expansion"></a>

### Opposite-cusp Whittaker rank expansion — `MP.8/opposite-cusp-whittaker-expansion`

theorem · from the MP.8 part

**Statement.** For D≠0, C₀=N³(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m))P(s,D,n₂,r)W^{sgn D}(|D|y₁/(4m),n₂y₂;s)σ(w). For D=0, C₀=N³n₂^(s−k/2−4)P(s,0,n₂,r)W⁰(y₁,n₂y₂;s)σ(w)+(y₁y₂)^s y₂^(k/2)a(Nn₂)e(in₂y₂)vσ(η). The rank-one contribution to this extracted Whittaker coefficient is zero by cuspidality.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Treat full-rank and rank-zero terms separately; apply the finite Fourier μ sum before the parabolic reduction.
2. For rank one import the integral rank-one normal form cited from Maass p.160, unfold its remaining x₃ period and use the elliptic constant coefficient a(0)=0.
3. The rank-zero term survives only at D=0 and supplies the additional η-vector. Never absorb it into P or W⁰.

**Sources.**

- BFH90, §6, pp.586–588, Proposition 6.2: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The factor N³ and the extra rank-zero term are required.

**Prerequisites.** [`MP.8/cusp-zero-rank-expansion`](#n-mp-8-cusp-zero-rank-expansion), [`MP.8/bfh-p-dirichlet-series`](#n-mp-8-bfh-p-dirichlet-series), [`MP.8/first-cusp-whittaker-expansion`](#n-mp-8-first-cusp-whittaker-expansion).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-local-prime-root-counts"></a>

### Prime-power congruence counts — `MP.8/local-prime-root-counts`

definition · from the MP.8 part

**Statement.** For p prime, p∤2mN, put b≥0 and a,d≥0. In cases Σ₁:a≤d,a≤b and Σ₂:a>d,a≤b, N₁₂ is the number of (λ₁ mod p^a,λ₂ mod p^d) satisfying mλ₁²≡0 mod p^a, 2mλ₁λ₂−rλ₁≡0 mod p^min(a,d), mλ₂²−rλ₂+n₁/N≡0 mod p^d. For Σ₃:a>b, N₃ counts (λ₁ mod p^b,λ₂ mod p^(a+d−b)) satisfying mλ₁²+rλ₁+n₁/N≡0 mod p^b, 2mλ₁λ₂+rλ₂−rp^(a−b)λ₁−2p^(a−b)n₁/N≡0 mod p^b, mλ₂²−rp^(a−b)λ₂+p^(2(a−b))n₁/N≡0 mod p^(a+d−b). Interpret N⁻¹ in these finite rings, since p∤N.

**Proof outline.**

1. Use native ZMod finite rings and the canonical inverse of N, never rational division in an integer congruence.
2. Count the actual solution subtype with Nat.card. The x₀ residue modulus α₁β₃δ₂ in the p.591 parametrization gives p^min(a,d) after the p.590–592 character sum. The printed p^min(a,b) in (7.10) is E-MP8-8; keep the independently checked table of Lemma 7.3 unchanged.

**Sources.**

- BFH90, §7, pp.592–593, (7.10)–(7.11): Correct the mixed modulus in published (7.10) as E-MP8-8, using the preceding matrix parametrization and direct finite cardinalities.

**Uses.**

- BFH §7, pp.595–597, Lemma 7.3: Evaluate N₁,N₂,N₃ by completing squares and counting prime-power roots, with the corrected mixed modulus min(a,d), parity factors and separate discriminant-valuation ranges.

**API.**

- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_zero_exponents` (simp): N₁₂(p,0,b,0)=1.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_finite` (structure): The counts are cardinalities of finite congruence solution sets.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_quadratic` (compatibility): At a=0, N₁₂ counts the quadratic roots mλ₂²−rλ₂+n₁/N modulo p^d.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_base` (computation): N₁₂(3,0,0,0;1,1,0,0)=1.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_split` (computation): For p=3,m=N=1,r=0,n₁=−1,a=0,d=1 there are two roots λ₂=±1, so the count is 2.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_nonsplit` (non-example): For p=3,m=N=1,r=0,n₁=1,a=0,d=1 the count is 0.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_mixed_modulus` (computation): For p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1 there are six solutions: λ₁∈{0,3,6},λ₂∈{0,1}. The printed min(a,b) modulus leaves only two.

**Acceptance.**

- At a=d=0, N₁₂=1.
- p=2 and p|m are excluded from the unramified calculation.

**Prerequisites.** [`MP.8/finite-exponential-sums`](#n-mp-8-finite-exponential-sums).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/RootCounts`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-local-root-count-table"></a>

### Prime-power root-count evaluation — `MP.8/local-root-count-table`

theorem · from the MP.8 part

**Statement.** Write D=D'p^(2h), p²∤D', χ=χ_{D'}(p), ε(t)=t mod2, p∤2mN. For i=1,2 and a≤d+1, the count N_i is: p^((a−ε(a)+d−ε(d))/2) if d≤2h; for d≥2h+1 and χ=1, N₁=2p^(h+min((a−ε(a))/2,h)), N₂=2p^(2h+1); for d=2h+1 and χ=0, N₁=p^(h+(a−ε(a))/2), N₂=p^(2h+1); otherwise 0. Here i=1 uses a≤d and i=2 uses a>d, so the two identical defining congruence systems have different permitted a,d ranges. For N₃ at a=b+1,b≤d−1,d≥1: p^((d+ε(d)+b−ε(b))/2) if d≤2h+1,b≤2h; 2p^(h+1+(b−ε(b))/2) if χ=1,d≥2h+2,b≤2h; p^(h+1+(b−ε(b))/2) if χ=0,d=2h+2,b≤2h; 4p^(2h+1) if χ=1,d≥2h+2,b=2h+1; 2p^(2h+1) if χ=1,d≥2h+2,b≥2h+2; p^(2h+1) if χ=0,d=2h+2,b=2h+1; otherwise 0.

**Proof outline.**

1. For d≤2h factor λ₂ by p^ceil(d/2); count λ₁ via the first quadratic congruence.
2. For d>2h substitute λ₂=p^h λ₂' and distinguish split, ramified and nonsplit roots of the remaining discriminant. Impose the mixed congruence to count λ₁.
3. For Σ₃ force λ₂=pλ₂', reduce the modulus by one and analyze the coupled roots. At the double-root threshold the two signs must be opposite, producing 2p^(2h+1), as p.597.

**Sources.**

- BFH90, §7, pp.595–597, Lemma 7.3: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- At h=0,a=0,d=1 the split count is 2 and nonsplit count is 0.
- The parity indicators change the exponents for odd a or d.

**Prerequisites.** [`MP.8/local-prime-root-counts`](#n-mp-8-local-prime-root-counts).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/RootCounts`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-local-mobius-factors"></a>

### Local primitive exponential factors — `MP.8/local-mobius-factors`

theorem · from the MP.8 part

**Statement.** For upper triangular C=[[p^a,p^b],[0,p^d]], d≥1, define S_p by μ₂-inversion of the unrestricted local S. If a=0 or b=0, S_p=S(a,b,d)−pS(a,b,d−1). If a,b≥1, S_p=S(a,b,d)−p²S(a−1,b−1,d)−pS(a,b,d−1)+p³S(a−1,b−1,d−1). The S terms are p^(2a+d)N₁, p^(a+2d)N₂ or p^(a+b+d)N₃ according to Σ₁,Σ₂,Σ₃; absent divisors contribute zero. For coprime determinant factors S is multiplicative, and S₁(C)=∏_{p|δ}S_p(C_p) in the α|δ series.

**Proof outline.**

1. Construct the explicit unimodular diagonalization of Lemma 7.2 using the displayed CRT congruences. Summing D imposes the three root equations.
2. Use CRT and β-unit independence to factor S. The only μ₂-nonzero local divisors are I,diag(p,1) with upper residues,diag(1,p),pI.
3. Insert their weights 1,−1,−1,p and count the upper residues; this gives the four-term formula. Lemma 7.4 is its arithmetic substitution table, not a new definition assigned those values.

**Sources.**

- BFH90, §7, pp.590–594, Lemma 7.2, (7.9),(7.12)–(7.16): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The p³ correction comes from the pI divisor and its residue multiplicity.
- At h=0, χ≠0: S_p([[1,p],[0,p]])=χp and S_p([[p,p],[0,p]])=p³−p².

**Prerequisites.** [`MP.8/matrix-mobius-inversion`](#n-mp-8-matrix-mobius-inversion), [`MP.8/local-root-count-table`](#n-mp-8-local-root-count-table), [`MP.8/bfh-l-dirichlet-series`](#n-mp-8-bfh-l-dirichlet-series).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/RootCounts`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-unramified-euler-factors"></a>

### Unramified genus-two Euler factors — `MP.8/unramified-euler-factors`

theorem · from the MP.8 part

**Statement.** For n₂=N⁻¹ and p∤N, the factor is L_p(s,D)=1+Σ_{d≥1,0≤a≤d}p^(d−a)[S_p([[p^a,p^a],[0,p^d]],D)−S_p([[p^a,p^(a−1)],[0,p^d]],D)]p^(−(a+d)s−(d−a)k/2)a(p^(d−a)), with the second S_p term absent when a=0. At fundamental D₀, let a(p)=σ_p+σ_p' and σ_pσ_p'=p^(k−1). Then L_p=(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))/[(1−χ_{D₀}(p)σ_pp^(2−k/2−s))(1−χ_{D₀}(p)σ_p'p^(2−k/2−s))]. At D=0 it is [(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))]/[(1−σ_p²p^(5−k−2s))(1−σ_p'²p^(5−k−2s))(1−p^(4−2s))]. These are meromorphic identities, first proved in absolute convergence.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Use β sums (7.17)–(7.18), which are p^(d−a), −p^(d−a−1), or 0, to obtain (7.20).
2. Substitute the local root counts into the μ₂ formula. For fundamental D only the explicit finite list on p.598 survives.
3. Apply the elliptic Hecke recurrence, then factor its polynomial using Satake roots. For D=0 sum the geometric series displayed on p.599. Global L-function naming is an AL.3 comparison, not a reverse BSD.2 import.

**Sources.**

- BFH90, §7, pp.594–599, (7.20),(7.33)–(7.34), and the unnumbered D=0 formulas on p.599: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The symmetric-square factors are in the numerator of the local ratio.
- At D=0 the denominator shifts by one compared with the numerator.

**Prerequisites.** [`MP.8/local-mobius-factors`](#n-mp-8-local-mobius-factors), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/EulerFactors`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-squarefactor-polynomial-bound"></a>

### Square-discriminant local polynomial and growth — `MP.8/squarefactor-polynomial-bound`

theorem · from the MP.8 part

**Statement.** For D=D₀D₁², D₀ fundamental, L(s,D)=L(s,D₀)b(s,D₁), with b a finite Dirichlet polynomial supported on p|D₁, obtained by summing the same explicit (7.20) local counts. Equivalently factor out the unramified L_p for p∤ND₁, leaving the polynomial d(s,D₁) of (7.35). For real s≥2 its coefficients have |b(s,D₁)|≪_{f,N,ε}D₁^(1/2+ε), using the weak normalized bound p^(−j(k−1)/2)|a(p^j)|≤p^(j/4+ε). Thus Σ_{D₁≥1}L(s,D₀D₁²)D₁^−2u converges for Re u>3/4; if L(2,D₀)=0 the analogous series of s-derivatives at 2 has the same convergence.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Carry out the finite prime-power sum with h=v_p(D₁); keep every parity and ramified-root case from Lemma 7.3.
2. Use the Hecke recurrence and the stated weak coefficient bound to bound each local polynomial; absorb divisor-count factors in D₁^ε.
3. Differentiate the finite factors, absorbing their logarithms. If L(2,D₀)=0 only the derivative of the fundamental factor survives.

**Sources.**

- BFH90, §7, pp.588–589, Proposition 7.1; pp.599–600, (7.35): The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- No bound for the opposite-cusp P is supplied by this unramified calculation.

**Prerequisites.** [`MP.8/unramified-euler-factors`](#n-mp-8-unramified-euler-factors), `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/EulerFactors`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-theta-normal-convergence"></a>

### Genus-two theta normal convergence — `MP.8/theta-normal-convergence`

theorem · from the MP.8 part

**Statement.** For a>0, on every compact subset of H₂×C² the θ_{a,ν} series and all coordinate derivatives converge absolutely and uniformly. Hence θ is jointly holomorphic and termwise differentiation, residue-class regrouping and compact-torus integration are valid. The bound uses the least eigenvalue of Im Z uniformly bounded below and bounded Im W.

**Proof outline.**

1. Complete the square in −2π(Im Z)[R]/(4a)−2π Im W·R. Compact positivity gives exp(−c||R||²+C||R||).
2. Coordinate derivatives add polynomial factors, still dominated by a Gaussian lattice sum. Use the MP.2 Poisson/Fourier analytic machinery rather than duplicate it.
3. Apply locally uniform holomorphic convergence and dominated integration; this closes the otherwise implicit infinite regrouping in Proposition 2.2.

**Sources.**

- BFH90, §2, pp.551–553, definition of θ and Proposition 2.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Positivity of Im Z is essential; normal convergence is not claimed at the boundary.

**Prerequisites.** [`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta), [`MP.8/siegel-space`](#n-mp-8-siegel-space), `MetaplecticAutomorphicForms:MP.2`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Basic`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R5 row 16: replace the bare stage `MP.2` by nothing (the citation is dropped). verified: drop the citation. The estimate is the node's own Gaussian majorant exp(−c‖R‖² + C‖R‖) on compacta; no MP.2 target (Weil index, operators, uncertainty) is used.

<a id="n-mp-8-genuine-induced-comparison"></a>

### Genuine normalized induced-section comparison — `MP.8/genuine-induced-comparison`

comparison · from the MP.8 part

**Statement.** For the actual BFH theta-component vector E_j, lift to the double cover by ℰ_j(g,h)=h(iI₂)E_j(g). The kernel −1 acts by −1. On the positive Siegel Levi Q, the determinant-root magnitude is |detQ|^−1/2. Thus the section derived from I_s has unnormalized real exponent |detQ|^(s−1/2), while δ_P^(1/2)=|detQ|^(3/2); its normalized parameter is ν=s−2. The genuine unitary Levi datum is the elliptic cuspidal π_f tensor the phase of the Weil determinant character. Prove an equivariant identification with normalized induction Ind_{P̃}^{G̃}(π̃_f⊗|det|^(s−2)), including finite arithmetic vectors and Haar measures.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Compute the root on diag(Q,Q⁻ᵀ), choose its unitary phase and multiply the component by that root. Derive the exponent shift rather than reuse a linear-group parameter s.
2. Check equivariance on the actual lifted parabolic, all Heisenberg and arithmetic generators, and the −1 kernel. Match the finite vector and self-dual/Haar measures.
3. Compute δ_P by its three-dimensional symmetric-matrix unipotent action. Exact cocycle/Weil phase and finite splitting verification are a recorded refinement gap; no black-box AS applicability is asserted.

**Sources.**

- BFH90, §1, p.549, I_s; §2, pp.553–554; §8, pp.601–602: BFH supplies I_s and its half-weight theta factor. The exponent s−2 is derived here from that factor and the Siegel modulus. The cover/adelic equivariant identification is a target requiring the precise recorded comparison gap, not a theorem proved by this source.

**Acceptance.**

- At Q=2I₂ the root magnitude is 1/2; the exponent shift is detectable.
- The centered normalized parameter is s−2, consistent with the BFH critical point s=2.

**Prerequisites.** [`MP.8/jacobi-eisenstein`](#n-mp-8-jacobi-eisenstein), [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition), [`MP.8/similitude-cover`](#n-mp-8-similitude-cover), [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison), `AutomorphicSpectralTheory:AS.1`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/InductionComparison`, namespace `TauCeti.Jacobi.GenusTwo`.

**Routed edit.** R3: replace `GL2AutomorphicRepresentationsAndTransfer:R16.2` by `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection`. verified: the comparison needs the cuspidal automorphic representation π_f generated by the normalized newform f of even weight k ≥ 2, trivial character and conductor M, with its finite newvector and holomorphic lowest-weight vector; R16.6/primitive-classical-bijection states exactly this dictionary (χ(−1) = (−1)^k holds for trivial χ and even k). It has no ancestor in this roadmap.

<a id="n-mp-8-genuine-eisenstein-initial-convergence"></a>

### Genuine Eisenstein initial convergence and growth — `MP.8/genuine-eisenstein-initial-convergence`

theorem · from the MP.8 part

**Statement.** For the specified finite-dimensional BFH K-type, normalized newform, arithmetic finite vector and compatible cover measures, there exists S₀∈R such that E_s and its theta-component Eisenstein sums converge absolutely and locally uniformly with all required g,W,s derivatives for Re s>S₀. In that chamber, absolute-value and Sobolev majorants are bounded by the corresponding AS.1 linear Siegel induced-section estimates after ν=s−2 and the Gaussian λ summation. The actual finite-cover comparison, not the existence of a double cover alone, must establish this bound.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Use the explicit Weil phase of modulus one and the finite arithmetic comparison to transfer majorants for the lifted section.
2. Bound the Jacobi λ sum by the uniform Gaussian lattice estimate on compact W sets, retaining any cusp-height powers.
3. Apply AS.1 at the resulting positive chamber and prove local uniform derivative bounds. The numerical chamber and height losses must be derived from the supplier estimate, not invented.

**Sources.**

- BFH90, §1, p.549, definition of E_s; §5, p.580, Proposition 5.1: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

**Acceptance.**

- An existential S₀ is the source claim; no unsupported sharp half-plane is assigned.
- All §5–7 initial unfoldings use a common strict chamber.

**Prerequisites.** [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison), [`MP.8/theta-normal-convergence`](#n-mp-8-theta-normal-convergence), `AutomorphicSpectralTheory:AS.1`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Convergence`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-genuine-intertwining-operators"></a>

### Genuine Siegel intertwining operators — `MP.8/genuine-intertwining-operators`

construction · from the MP.8 part

**Statement.** For the long Siegel Weyl element w and the induced spaces above, define M(w,s)F(g)=∫_{N_w(A)}F(w⁻¹ng)dn in its actual convergence chamber, with chosen lift of w and self-dual root-group measures. Its target is Ind(π̃_f∨⊗|det|^(2−s)); the target BFH parameter is 4−s. Continue M meromorphically as an operator between these fixed smooth genuine spaces. Record scalar normalizing factors and pole divisors at every ramified place; the cocycle makes this a genuine-cover integral, not the AS.2 linear operator. Keep the raw standard operator M used in the constant term and the unnormalized Eisenstein Weyl equation distinct from R=c(s)⁻¹M, the operator with explicitly specified scalar normalization. An equation using R instead requires the corresponding renormalization of the Eisenstein family.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Define the integral on the actual lifted unipotent subgroup and compute its parabolic covariance.
2. Compare each rank-one lifted integral with the AS.2 operator plus the explicit Weil phase. Track root ordering, Haar factors and genuine local K-types.
3. Continue the raw standard operator M using the cover comparison. Specify the scalar factors c(s) before defining R=c(s)⁻¹M; verify the composition equation in the actual local/global setting and the chosen dual cusp identification. The native composition sketch uses R, while the standard constant term and unnormalized Eisenstein Weyl equation use M. Ramified scalar factors remain an open input.

**Sources.**

- BFH90, §8, pp.601–602, continuation and constant-term discussion: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

**Uses.**

- BFH §8, p.601; pp.611–614, (8.10)–(8.16): Identify the long-Weyl contribution with the genuine intertwiner and prove that elliptic cuspidality removes the intermediate rank-one term.

**API.**

- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_equivariant` (structure): M is G̃-equivariant between the stated induced spaces.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_integral` (characterisation): In the convergence chamber M is exactly the root-group integral with the chosen Weyl lift.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_composition` (relation): For R=c(s)⁻¹M with the specified scalar factors and contragredient identification, R(w,4−s)R(w,s)=id meromorphically away from operator poles. This API is for R; M remains the raw integral operator in the standard constant term and Weyl equation.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_zero` (degenerate): Zero section maps to zero.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_central_sign` (characterisation): The output remains genuine under the cover kernel.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_reflection` (computation): The parameter map 4−s is an involution and fixes s=2.

**Acceptance.**

- The parameter reflection is s↦4−s after the half-root shift.
- The target cusp datum is contragredient; a self-dual identification needs its own Fricke normalization.

**Prerequisites.** [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison), [`MP.8/genuine-eisenstein-initial-convergence`](#n-mp-8-genuine-eisenstein-initial-convergence), `AutomorphicSpectralTheory:AS.2`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Intertwining`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-genuine-constant-term"></a>

### Genuine Eisenstein constant-term formula — `MP.8/genuine-constant-term`

theorem · from the MP.8 part

**Statement.** Along the Siegel unipotent radical, the genuine Eisenstein constant term is the identity section plus M(w,s) applied to the inducing section, initially in the common convergence chamber and then meromorphically. The intermediate rank-one Bruhat contribution vanishes by elliptic cuspidality. The theta/Fourier specialization recovers exactly the three boundary contributions L(s,0)M, P(s,0,r)M̃ and τ in Proposition 8.1, with their specified N and y₂ factors.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Unfold the constant term on the actual cover, using its unipotent splitting and the finite arithmetic comparison.
2. Classify the three relative Bruhat ranks and eliminate the intermediate rank by the elliptic constant-coefficient integral, as in Proposition 6.2.
3. Identify the surviving transformed sections and then their degenerate Whittaker transforms. Prove each scalar normalization by the earlier cusp expansions.

**Sources.**

- BFH90, §8, pp.601–602; pp.611–614, (8.10)–(8.16): BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

**Acceptance.**

- No extra pole is permitted solely because a linear-group result has one.

**Prerequisites.** [`MP.8/genuine-intertwining-operators`](#n-mp-8-genuine-intertwining-operators), [`MP.8/cusp-zero-rank-expansion`](#n-mp-8-cusp-zero-rank-expansion), [`MP.8/opposite-cusp-whittaker-expansion`](#n-mp-8-opposite-cusp-whittaker-expansion).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/ConstantTerm`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-genuine-eisenstein-continuation"></a>

### Genuine Eisenstein continuation and Weyl equation — `MP.8/genuine-eisenstein-continuation`

theorem · from the MP.8 part

**Statement.** The actual BFH genuine Eisenstein family continues meromorphically in s, satisfies E(s,F)=E(4−s,M(w,s)F) for the raw standard intertwiner M after the contragredient cusp identification, and has poles only from the proven genuine constant terms. Near s=2 the chosen BFH family is regular exactly when those constant-term coefficients are regular; its residues are automorphic genuine forms obtained from residues of the intertwining operators. This target requires the cover-specific AS.2 adaptation and the correct Fricke level M, rather than an unqualified appeal to linear Selberg–Langlands theory.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Apply the AS.2 truncation/continuation proof after the explicit genuine intertwiner comparison; finite-cover descent must preserve the required growth and compactness assumptions.
2. Compare the constant terms of the two Weyl-related families, apply the uniqueness argument and continue from a nonempty overlap.
3. Evaluate poles and residues in the actual finite K-type topology. At s=2 use the symmetric-square denominator nonvanishing supplied by AL.3 and the opposite-cusp input below.

**Sources.**

- BFH90, §8, pp.601–602, continuation and pole discussion; §1, pp.550–551, newform L-functions: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

**Acceptance.**

- The paper states E_s is analytic near s=2; a proof must justify regularity of its exact constant terms.

**Prerequisites.** [`MP.8/genuine-constant-term`](#n-mp-8-genuine-constant-term), `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, [`MP.8/opposite-cusp-zero-regularity`](#n-mp-8-opposite-cusp-zero-regularity), `mathlib:MeromorphicOn`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Continuation`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-opposite-cusp-zero-regularity"></a>

### Opposite-cusp zero coefficient regularity — `MP.8/opposite-cusp-zero-regularity`

theorem · from the MP.8 part

**Statement.** For the fixed BFH arithmetic data and r, P(s,0,r) is holomorphic in a neighborhood of s=2, and P(s,D,r) grows at most polynomially in D uniformly on compact parameter sets avoiding its poles. One route evaluates the ramified cusp factors to express P(s,0,r) as L(s,0) times a rational function in p^−s for p|N with denominators nonzero at 2. The alternative in BFH p.589 derives regularity of this coefficient from the already established full Eisenstein regularity; those two routes must not be used circularly.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Compute the finite ramified cusp sums using the restricted matrix Möbius inversion, and list their denominators at s=2. BFH omits this calculation; it remains an exact proof gap.
2. For the growth bound use the actual automorphic Whittaker coefficient estimates after cover comparison, not the unramified L-series polynomial.
3. Choose this arithmetic route before deducing E regularity, or establish E regularity independently by intertwiner normalization before using the coefficient route. The packet selects the arithmetic route to keep the graph acyclic.

**Sources.**

- BFH90, §7, p.589, Remark following Proposition 7.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- No dependency on genuine-eisenstein-continuation is used here.

**Prerequisites.** [`MP.8/bfh-p-dirichlet-series`](#n-mp-8-bfh-p-dirichlet-series), [`MP.8/matrix-mobius-inversion`](#n-mp-8-matrix-mobius-inversion), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicSpectralTheory:AS.1`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/RamifiedRegularity`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-fourier-residue-interchanges"></a>

### Fourier and residue interchange for genuine families — `MP.8/fourier-residue-interchanges`

theorem · from the MP.8 part

**Statement.** Let the continued genuine family have locally finite pole divisor in its parameter domain. After multiplying by a local holomorphic denominator, its Fourier integrals on the specified compact quotient tori, the finite theta transform and the absolutely convergent nonzero-discriminant Whittaker/Mellin tails are locally uniformly holomorphic; coefficient extraction commutes with s-residues and derivatives. Infinite theta or D sums may commute with these operations only under the proven Gaussian or rapid-decay majorants. The expanded Novodvorsky kernel is excluded from an unproved joint Fubini interchange.

**Hypotheses.**

- Fix y₂>0. The scalar coefficient φ(κ)=T(vσ(κ)) is globally divisible by φ₁ in R_k: there exists ψ∈R_k with φ(κ)=φ₁(κ)ψ(κ) for every κ∈K. This is the standing hypothesis on printed p.601 before Proposition 8.1, not merely divisibility in the positive κ(X) chart.

**Proof outline.**

1. Choose a common local pole-clearing denominator in the finite K-type space. Compact-torus Bochner integration is continuous, so differentiated Cauchy integrals commute with it.
2. Use the compact-parameter Gaussian and polynomial-times-Schwartz bounds for the infinite theta and nonzero D sums.
3. Keep the positive Mellin zero-mode integral separate; its explicit primitive produces the displayed polar denominators. Prove each contour shift and use of dominated convergence in its own domain.

**Sources.**

- BFH90, §8, pp.601–614, proof of Proposition 8.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- Residues are coefficientwise only after a common denominator and uniform majorant are provided.

**Prerequisites.** [`MP.8/genuine-eisenstein-continuation`](#n-mp-8-genuine-eisenstein-continuation), [`MP.8/theta-normal-convergence`](#n-mp-8-theta-normal-convergence), [`MP.8/whittaker-rapid-decay`](#n-mp-8-whittaker-rapid-decay), [`MP.8/novodvorsky-continuation`](#n-mp-8-novodvorsky-continuation), [`MP.8/opposite-cusp-zero-regularity`](#n-mp-8-opposite-cusp-zero-regularity).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Residues`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-two-variable-twist-series"></a>

### BFH two-variable twist series — `MP.8/two-variable-twist-series`

definition · from the MP.8 part

**Statement.** Define Z^±(u,s;r)=Σ_{D∈Z,±D>0,D≡r² mod 4m/N} L(s,D)|D|^(s−u−5/2), initially for Re u sufficiently large and Re s in the L-series convergence chamber. The integer modulus 4m/N uses N|m and 4m|N². The coefficient L includes the actual first-cusp exponential sums and the original normalized newform f, not an arbitrary list of central L-values.

**Proof outline.**

1. Use native integer congruence and positive-base complex powers. Split the two sign sets before summing.
2. Prove a common initial chamber from coefficient growth. Meromorphic continuation is the polar-combination theorem, not part of the definition.

**Sources.**

- BFH90, §8, p.601, definition before Proposition 8.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Uses.**

- BFH §8, pp.601–614, Proposition 8.1: Combine the two signed twist series with the continued Novodvorsky transforms of a fixed globally divisible coefficient at N⁻¹y₂; isolate the three zero-mode polar fractions.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

**API.**

- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_scalar` (functoriality): Scaling the elliptic seed scales both Z series.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_congruence` (characterisation): Only D≡r² modulo 4m/N occurs.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_sign` (characterisation): The plus and minus supports are disjoint and exclude D=0.

**Checks.**

- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_zero` (degenerate): The zero coefficient family gives Z⁺=Z⁻=0.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_modulus` (computation): N=8,m=16,r=1 permits D≡1 mod8; D=1 and −7 occur in opposite signs.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_excluded` (non-example): For that datum D=0,2,−1 are all excluded.

**Acceptance.**

- D=0 is excluded and must appear separately in the boundary formula.

**Prerequisites.** [`MP.8/bfh-l-dirichlet-series`](#n-mp-8-bfh-l-dirichlet-series), [`MP.8/squarefactor-polynomial-bound`](#n-mp-8-squarefactor-polynomial-bound).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/TwistSeries`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-two-variable-polar-combination"></a>

### BFH two-variable polar combination — `MP.8/two-variable-polar-combination`

theorem · from the MP.8 part · planet “BFH two-variable polar formula”

**Statement.** Put A=(4m)^(−s+u+5/2)N^(−s+4+k/2)[Z⁺ TF⁺(u,s;N⁻¹y₂)+Z⁻ TF⁻(u,s;N⁻¹y₂)]. It continues meromorphically to Re s>3/2, Re u>0 and Re u>Re s−5/2. Near (u,s)=(1/2,2), A minus the following sum is jointly holomorphic: −N^(−s+4+k/2)L(s,0)TM(s,N⁻¹y₂)/(u−s+5/2) + N^(7−s−k/2)P(s,0,r)y₂^(2s−5)TM̃(s,N⁻¹y₂)/(u+s−5/2) + N^−s y₂^(3−s+k/2)Tτ(s,N⁻¹y₂)/(u−s+3/2). Every term uses the continued scalar transforms and fixed BFH test vector. This is joint holomorphy in two complex variables, not a collection of separate one-variable statements.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.
- Fix y₂>0. The scalar coefficient φ(κ)=T(vσ(κ)) is globally divisible by φ₁ in R_k: there exists ψ∈R_k with φ(κ)=φ₁(κ)ψ(κ) for every κ∈K. This is the standing hypothesis on printed p.601 before Proposition 8.1, not merely divisibility in the positive κ(X) chart.

**Proof outline.**

1. Rewrite the Novodvorsky transform of the genuine Fourier–Jacobi components with exact x₁,x₃,x₄ periods, using Propositions 2.5–2.7. Prove the Fourier inversion identities (8.5),(8.7),(8.9) with their finite theta phases.
2. Split the positive y₁ integral at 1. The nonzero-D large tail is jointly holomorphic by polynomial coefficient bounds and Whittaker rapid decay.
3. Use the lower-unipotent/Fourier transformation for the small tail. Its three zero modes integrate to the three displayed linear polar denominators; the remaining terms are normally convergent.
4. Clear the local s pole denominator before every continuation interchange, then use the proven E regularity and coefficient regularity near 2.

**Sources.**

- BFH90, §8, pp.601–614, Proposition 8.1: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- The three denominators are distinct functions of (u,s).
- The second and third polar divisors meet at (1/2,2); cancellation must be tested by the consuming BSD.2 argument, not asserted here.

**Prerequisites.** [`MP.8/two-variable-twist-series`](#n-mp-8-two-variable-twist-series), [`MP.8/first-cusp-whittaker-expansion`](#n-mp-8-first-cusp-whittaker-expansion), [`MP.8/opposite-cusp-whittaker-expansion`](#n-mp-8-opposite-cusp-whittaker-expansion), [`MP.8/degenerate-mellin-coefficients`](#n-mp-8-degenerate-mellin-coefficients), [`MP.8/tau-transform`](#n-mp-8-tau-transform), [`MP.8/fourier-residue-interchanges`](#n-mp-8-fourier-residue-interchanges), [`MP.8/opposite-cusp-zero-regularity`](#n-mp-8-opposite-cusp-zero-regularity), [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra), [`MP.8/novodvorsky-continuation`](#n-mp-8-novodvorsky-continuation).

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/PolarFormula`, namespace `TauCeti.Jacobi.GenusTwo`.

<a id="n-mp-8-bsd2-export"></a>

### Genus-two coefficient and local-test export — `MP.8/bsd2-export`

comparison · from the MP.8 part

**Statement.** Export the exact first-cusp coefficients, unramified local factor ratio, squarefactor bound, jointly meromorphic polar combination, allowed derivative/residue interchanges and the three existential finite K-type tests. With AL.3 identify L(s,D₀)=L_N(s+k/2−2,f⊗χ_{D₀})/L_N(2s+k−4,Sym²f) for fundamental D₀, and L(s,0)=L_N(2s+k−5,Sym²f)/L_N(2s+k−4,Sym²f). At the permitted datum m=N rad(N),r=1, this is the analytic genus-two input to RankZeroOneBSD:BSD.2. The final twist residues, positivity, noncancellation, simultaneous local conditions and infinitude of fundamental twists belong to BSD.2.

**Hypotheses.**

- The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M.
- The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

**Proof outline.**

1. Identify the incomplete Euler products with the AL.3 native analytic L-function interface, retaining omitted primes p|N and the exact shifted arguments.
2. Bundle the already stated theorems as an import contract to BSD.2; do not assume its nonvanishing conclusion or add a reverse dependency.
3. Check N|m and 4m|N² for the actual §9 choice before specializing the congruence support.

**Sources.**

- BFH90, §7, pp.588–589, Proposition 7.1; §9, pp.614–617: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

**Acceptance.**

- At s=2 the first numerator is the central value L_N(k/2,fχ).
- The s-derivative brings the precise quotient derivative, not only the derivative of its numerator.

**Prerequisites.** [`MP.8/unramified-euler-factors`](#n-mp-8-unramified-euler-factors), [`MP.8/squarefactor-polynomial-bound`](#n-mp-8-squarefactor-polynomial-bound), [`MP.8/two-variable-polar-combination`](#n-mp-8-two-variable-polar-combination), [`MP.8/local-test-nonzero-f`](#n-mp-8-local-test-nonzero-f), [`MP.8/local-test-nonzero-tau`](#n-mp-8-local-test-nonzero-tau), [`MP.8/local-test-nonzero-m`](#n-mp-8-local-test-nonzero-m), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Library.** module `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Export`, namespace `TauCeti.Jacobi.GenusTwo`.

## Restructure records of the whole-roadmap pass

Each record states what was found, the proposal, and its status: routed to the part packet that owns the affected targets, or left to the maintainer. No part packet or atlas edge is modified by this pass.

### R1

Dependency order of the layers. Fifteen prerequisites of the accepted parts run from a later layer to an earlier one (REV-PKG-MetaplecticAutomorphicForms~adv, blocker B3): the Rao factor set and the metaplectic double cover (MP.1) use the Leray cocycle and the Weil-index identities (MP.2); the Hermitian uncertainty principle and the Hermitian operator normalizations (MP.2) use the unitary splitting (MP.3); the ideal-class theta transformation (MP.5) uses the ideal-lattice Poisson comparison (MP.6); the two BFH export interfaces of MP.7 use five MP.8 targets. The declared layer order MP.0 → … → MP.8 is therefore not a dependency order. MP.1 and MP.2 are mutually dependent as written: MP.2's Leray cocycle uses MP.1's scalar extension, and MP.1's double cover uses MP.2's Weil index.

**Proposal.** Move eight accepted targets to the layer where their inputs are available, keeping their ids, statements and consumers: MP.1/rao-factor-set, MP.1/metaplectic-double-cover and MP.1/genuine-oscillator to MP.2; MP.2/hermitian-uncertainty and MP.2/hermitian-operator-normalizations to MP.3; MP.6/ideal-lattice-poisson to MP.5; MP.7/bfh-kernel-import and MP.7/ramified-quadratic-twist-kernel-inputs to MP.8. Rescope the stage texts accordingly: MP.1 keeps Stone–von Neumann, the intertwiner lines and Weil's scalar (U(1)) metaplectic extension, which is the metaplectic extension of its title; MP.2 gains the identification of the double cover by the Rao cocycle of normalized Weil indices and the export of genuine representations; the clause of MP.7 exporting the BFH input to BSD.2 moves to MP.8, which already exports to BSD.2. To keep MP.2 at six planets, drop the planet of MP.2/weil-index-identities (the identities stay a target). A simulation over the 261 accepted targets with these moves leaves no prerequisite running from a later layer to an earlier one. The moved ids keep their old layer prefix; renaming them is optional, since no node outside this roadmap cites any of them. Two RankZeroOneBSD nodes (BSD.2/twist-series-residue, BSD.2/prescribed-local-conditions-value-branch) cite the bare stage MP.7 for the BFH kernel; after the move they should cite MP.7/bfh-kernel-import and MP.7/ramified-quadratic-twist-kernel-inputs by id.

**Status.** verified routed to part packet; routed to `research/blueprint/packets/MetaplecticAutomorphicForms--MP.0.json`.

| Target | Change | Verdict |
|---|---|---|
| [`MP.1/rao-factor-set`](#n-mp-1-rao-factor-set) | move to MP.2 | verified: its prerequisites MP.2/leray-cocycle and MP.2/weil-index-identities are MP.2 targets; its only consumer, MP.1/metaplectic-double-cover, moves with it. |
| [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover) | move to MP.2 | verified: it uses MP.2/leray-cocycle and the Rao factor set; its consumers are MP.1/genuine-oscillator (moved), MP.2/operator-relations, MP.4/unramified-compact-splittings, MP.4/adelic-metaplectic-cover and MP.5/unipotent-splitting, all in MP.2 or later. |
| [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator) | move to MP.2 | verified: it uses the double cover; its consumers MP.2/generator-operators, MP.2/character-and-dual, MP.3/orthogonal-cover-restriction, MP.4/adelic-weil-representation and MP.6/jacobi-group are in MP.2 or later. The new MP.6/unitary-jacobi-group uses MP.1/scalar-normalizer-extension instead, which stays in MP.1. |
| [`MP.2/hermitian-uncertainty`](#n-mp-2-hermitian-uncertainty) | move to MP.3 | verified: it uses MP.3/unitary-splitting for the Hermitian Fourier normalization and has no consumer. |
| [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) | move to MP.3 | verified: it uses MP.3/unitary-splitting; its consumer MP.6/unitary-siegel-weil-measure is later. |
| [`MP.6/ideal-lattice-poisson`](#n-mp-6-ideal-lattice-poisson) | move to MP.5 | verified: its prerequisites are AL.0 nodes and MP.5/ideal-class-theta; its only consumer is MP.5/ideal-class-theta-general-transform. |
| [`MP.7/bfh-kernel-import`](#n-mp-7-bfh-kernel-import) | move to MP.8 | verified: it uses MP.8/jacobi-eisenstein, theta-decomposition, genuine-induced-comparison, unramified-euler-factors and bsd2-export, and has no consumer in this roadmap; it keeps realising MP.7's export target from its new place. |
| [`MP.7/ramified-quadratic-twist-kernel-inputs`](#n-mp-7-ramified-quadratic-twist-kernel-inputs) | move to MP.8 | verified: it uses MP.8/bsd2-export and the three local-test-nonzero targets of MP.8, and has no consumer in this roadmap. |
| [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities) | remove its planet | planet bookkeeping only: MP.2 then shows Weil index, Leray invariant, Weil operators, Rao cocycle, Metaplectic group and Weil representation; MP.1 keeps Stone–von Neumann theorem and Unitary normalizer. |

### R2

A stage cycle between MP.3 and ML.4. Three MP.3 targets cite the bare stage ModularityAndLanglandsExtensions:ML.4 for local Langlands inputs, while ML.4/gan-takeda-llc-gsp4 and ML.5/local-descent-mp2n cite the bare stage MP.3 (Gan–Takeda's local Langlands correspondence for GSp₄ is proved through the similitude theta correspondence). The cycle is latent in the atlas only because the accepted ModularityAndLanglandsExtensions packet waits for promotion. The part's own coverage record asks for an exact owner mapping of these inputs (MP.3 remaining items on unitary equal rank and on PGSp₆–PGSO₈).

**Proposal.** Replace the bare ML.4 citation by the exact supplier nodes, none of which has an ancestor in this roadmap: the tempered local packets for unitary groups of EndoscopicTransferAndUnitaryTraceComparison ET.4 and the Deligne–Langlands local constants of ArithmeticGaloisRepresentations R01.2 for unitary equal and almost equal rank; the quaternionic local Jacquet–Langlands comparison of GL2AutomorphicRepresentationsAndTransfer R17.1 for the division ternary lift; and ML.4/extended-langlands-parameter for the PGSp₆–PGSO₈ lift. The last citation still closes a stage cycle with ML.4/gan-takeda-llc-gsp4. For the owner of ModularityAndLanglandsExtensions: move ML.4/gan-takeda-llc-gsp4, and the ML.4 targets that use it (gsp4-discrete-spectrum-types, gsp4-arthur-classification), to a sub-layer of ML.4 that requires both ML.4 and MP.3, so that ML.4's classification inputs do not depend on theta. ML.0/gsp4-galois-l-packet, which already cites the ML.4 node from an earlier layer, belongs to that sub-layer as well. With that split the stage graph is acyclic.

**Status.** verified routed to part packet; routed to `research/blueprint/packets/MetaplecticAutomorphicForms--MP.0.json`.

**For the owner of another roadmap.** ModularityAndLanglandsExtensions: split the theta-dependent GSp₄ targets of ML.4 into a sub-layer requiring MP.3 (proposal for that roadmap's next revision).

| Target | Change | Verdict |
|---|---|---|
| [`MP.3/unitary-equal-almost-equal-rank`](#n-mp-3-unitary-equal-almost-equal-rank) | `ModularityAndLanglandsExtensions:ML.4` → `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tempered-unitary-local-packets`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor` | verified: the target needs, for tempered π of U(W_n) over a nonarchimedean field of characteristic zero, the L-parameter, the component-group characters over both pure inner forms V_n^±, and the root number ε(1/2, φ_π χ_V⁻¹, ψ₂^E). ET.4/tempered-unitary-local-packets states the tempered packets and their pairing for every extended pure inner twist (KMSW Theorem* 1.6.1), and R01.2/local-epsilon-factor the Deligne–Langlands local constants. Neither has an ancestor in this roadmap. |
| [`MP.3/division-ternary-theta`](#n-mp-3-division-ternary-theta) | `ModularityAndLanglandsExtensions:ML.4` → `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison` | verified: the only classification input is the local Jacquet–Langlands transfer ρ ↦ JL(ρ) from supercuspidal representations of PGL₂(F) to representations of the division algebra with trivial central character; R17.1 states the correspondence with matching central characters. Its ancestors (R16.3, ET.6, Tau Ceti quaternion algebras) do not involve this roadmap. |
| [`MP.3/pgsp6-pgso8-similitude-theta`](#n-mp-3-pgsp6-pgso8-similitude-theta) | `ModularityAndLanglandsExtensions:ML.4` → `ModularityAndLanglandsExtensions:ML.4/extended-langlands-parameter` | verified with a condition: the target needs the Arthur–Mok local Langlands correspondence for Sp₆ and SO₈ (standard parameters φ_b and φ_b ⊕ 1), which ML.4/extended-langlands-parameter states, with the conditional status recorded in ML.4/symplectic-branch-status carried as a hypothesis. The citation is acyclic at the level of nodes; at the level of stages it is acyclic once ML.4/gan-takeda-llc-gsp4 moves to the sub-layer proposed above. |

### R3

The newform contract of MP.8. MP.8/bfh-seed and MP.8/genuine-induced-comparison cite the whole stage GL2AutomorphicRepresentationsAndTransfer:R16.2 (local smooth representation theory of GL₂). The adversarial package review (blocker B2) asks for an exact newform contract instead of a whole-stage dependency.

**Proposal.** Drop the citation from MP.8/bfh-seed, which uses only the classical newform and its Fricke transform (already cited from Tau Ceti ModularForms layers 4 and 6), and replace it in MP.8/genuine-induced-comparison by R16.6/primitive-classical-bijection.

**Status.** verified routed to part packet; routed to `research/blueprint/packets/MetaplecticAutomorphicForms--MP.8.json`.

| Target | Change | Verdict |
|---|---|---|
| [`MP.8/bfh-seed`](#n-mp-8-bfh-seed) | `GL2AutomorphicRepresentationsAndTransfer:R16.2` → dropped | verified: the seed is built from f, f̂(τ) = τ^{−k} f(−1/(Nτ)) and a K-type; no local representation theory of GL₂ enters its construction or proof. |
| [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison) | `GL2AutomorphicRepresentationsAndTransfer:R16.2` → `GL2AutomorphicRepresentationsAndTransfer:R16.6/primitive-classical-bijection` | verified: the comparison needs the cuspidal automorphic representation π_f generated by the normalized newform f of even weight k ≥ 2, trivial character and conductor M, with its finite newvector and holomorphic lowest-weight vector; R16.6/primitive-classical-bijection states exactly this dictionary (χ(−1) = (−1)^k holds for trivial χ and even k). It has no ancestor in this roadmap. |

### R4

A latent cycle with QSeriesPartitionsAndMockModularForms. QM.1 requires MP.7 and MP.8 (stage edges MP.7 → QM.1 and MP.8 → QM.1), yet seven MP.7 targets cite QM nodes: QM.1/jacobi-theta-nonvanishing (twice), QM.2/modified-bessel-function-i, QM.2/bessel-function-j (twice) and QM.3/weight-k-hyperbolic-laplacian (twice). The QSeries packet is not accepted, so the atlas does not yet draw these edges; once it is promoted they close the cycles QM.1 → MP.7 → QM.1 and its QM.2, QM.3 variants. AutomorphicSpectralTheory cites the same Bessel and Laplacian nodes, so their owner must sit below AutomorphicSpectralTheory.

**Proposal.** Theta nonvanishing moves down into this roadmap as MP.7/jacobi-theta-nonvanishing (new node of this packet; QM.1 imports it). The Bessel functions I_ν and J_ν belong beside AL.0/bessel-k in AutomorphicLFunctionsAndLocalFactors AL.0, and the weight-k hyperbolic Laplacian in AutomorphicSpectralTheory AS.0; both stages are already suppliers of MP.7, so the re-pointing adds no roadmap dependency. The two requests below ask for them.

**Status.** verified routed to part packet; routed to `research/blueprint/packets/MetaplecticAutomorphicForms--MP.0.json`.

| Target | Change | Verdict |
|---|---|---|
| [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier) | `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing` → `MP.7/jacobi-theta-nonvanishing` | verified: θ(z) = Σ e(n²z) = jacobiTheta(2z), and MP.7/jacobi-theta-nonvanishing states its nonvanishing on the whole upper half plane. The first proof step should read 'use MP.7/jacobi-theta-nonvanishing and the Γ₀(4) transformation of θ'. |
| [`MP.7/theta-residue-normalization`](#n-mp-7-theta-residue-normalization) | `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing` → `MP.7/jacobi-theta-nonvanishing` | verified: only the nonvanishing of θ is used, for the residue ½θ. |
| [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space) | `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian` → `AutomorphicSpectralTheory:AS.0` | conditional on the AS.0 request: the target uses Δ_{1/2} = −y²(∂_x² + ∂_y²) + (i/2) y ∂_x and its covariance under weight-1/2 slash operators; the covariance under the theta multiplier stays in this node. |
| [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight) | `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian` → `AutomorphicSpectralTheory:AS.0` | conditional on the AS.0 request: the target uses the holomorphic and unitary normalizations of Δ_{1/2} and their conjugation by y^{1/4}. |
| [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient) | `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`, `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j` → `AutomorphicLFunctionsAndLocalFactors:AL.0` | conditional on the AL.0 request: the target uses I_{2s−1} for nd < 0 and J_{2s−1} for nd > 0 with the principal branch, and the Whittaker–Bessel integral formulas. |
| [`MP.7/negative-cycle-poincare-sum`](#n-mp-7-negative-cycle-poincare-sum) | `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j` → `AutomorphicLFunctionsAndLocalFactors:AL.0` | conditional on the AL.0 request: the target uses J_{s−1/2} at positive real arguments. |

### R5

The accepted MP.8 part cites earlier layers of this roadmap by bare stage id sixteen times (MP.1 twice, MP.2 three times, MP.4 twice, MP.6 nine times). Each row was checked against the consumer's statement and proof and the suppliers' statements.

**Proposal.** Replace each bare stage citation by the node ids of its row; row 16 drops a citation that no step uses. The rows of MP.1 nodes refer to the same ids after the move of R1.

**Status.** verified routed to part packet; routed to `research/blueprint/packets/MetaplecticAutomorphicForms--MP.8.json`.

| Target | Change | Verdict |
|---|---|---|
| [`MP.8/similitude-cover`](#n-mp-8-similitude-cover) | row 1: `MP.1` → `MP.1/metaplectic-double-cover` | verified: the node compares its square-root cover on μ = 1 with the intrinsic double cover, which is MP.1/metaplectic-double-cover (moved to MP.2 by R1, id unchanged). |
| [`MP.8/arithmetic-subgroup`](#n-mp-8-arithmetic-subgroup) | row 2: `MP.6` → `MP.6/jacobi-group` | verified: the node defines Γ_N in Sp₄(ℤ) and the two Heisenberg lattices of the arithmetic Jacobi subgroup; the group in which they live is MP.6/jacobi-group. |
| [`MP.8/bfh-slash`](#n-mp-8-bfh-slash) | row 3: `MP.6` → `MP.6/jacobi-group`, `MP.6/jacobi-spaces` | verified: the BFH slash operator is the coordinate form of the Jacobi action of MP.6/jacobi-group on the functions of MP.6/jacobi-spaces with central character ψ_m. |
| [`MP.8/bfh-translation`](#n-mp-8-bfh-translation) | row 4: `MP.6` → `MP.6/jacobi-group`, `MP.0/bilinear-factor-set`, `MP.0/polarization-equivalence` | verified: the translation operators are the Heisenberg part of the Jacobi action. The phase e(2mνᵀλ) of their composition is ψ_m of the bilinear cocycle B((λ, ρ), (κ, ν)) = 2νᵀλ, the group law of the extension E_B of MP.0/bilinear-factor-set, which MP.0/polarization-equivalence identifies with the half-form Heisenberg group used by MP.6/jacobi-group. |
| [`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta) | row 5: `MP.6` → `MP.6/jacobi-theta-decomposition-interface`, `MP.5/theta-kernel` | verified: θᵃ_ν are the Jacobi theta functions of index a of the decomposition interface, and the convention for summing a transformed Schwartz function over a lattice is that of MP.5/theta-kernel; normal convergence is the node's own Gaussian estimate (MP.8/theta-normal-convergence). |
| [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition) | row 6: `MP.6` → `MP.6/jacobi-theta-decomposition-interface` | verified: the node is the genus-two BFH specialization of the general theta decomposition stated there. |
| [`MP.8/theta-fourier-transform`](#n-mp-8-theta-fourier-transform) | row 7: `MP.2` → `MP.2/generator-operators`, `MP.2/weil-index` | verified: the branch √(−det Z) is compared with the Weil phase of the Fourier generator, which MP.2/generator-operators expresses through the Weil index. |
| [`MP.8/theta-fourier-transform`](#n-mp-8-theta-fourier-transform) | row 8: `MP.6` → `MP.6/jacobi-theta-decomposition-interface`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation` | verified: the rank-two Poisson theorem is AL.0's (its real lattice case), and the finite Fourier matrix acting on theta components is the transformation law of the decomposition interface. MP.6 has no separate rank-two Poisson node. |
| [`MP.8/bfh-jacobi-specialization`](#n-mp-8-bfh-jacobi-specialization) | row 9: `MP.6` → `MP.6/jacobi-spaces` | verified: the node evaluates the Jacobi spaces of MP.6 on BFH coordinates. |
| [`MP.8/jacobi-eisenstein`](#n-mp-8-jacobi-eisenstein) | row 10: `MP.6` → `MP.6/jacobi-group`, `MP.6/jacobi-spaces` | verified: the Eisenstein series is a sum of Jacobi-action translates of the seed, landing in the Jacobi space. |
| [`MP.8/similitude-heisenberg-comparison`](#n-mp-8-similitude-heisenberg-comparison) | row 11: `MP.6` → `MP.6/jacobi-group`, `MP.6/jacobi-spaces` | verified: the node imports the Heisenberg group, the Schrödinger–Weil action and the Jacobi forms of MP.6 (as its proof says, following RT-AREA-automorphic-1/20) and transports the index under similitudes. |
| [`MP.8/full-real-cover`](#n-mp-8-full-real-cover) | row 12: `MP.4` → `MP.4/adelic-metaplectic-cover` | verified: MP.4 is cited only for the adelic extension with which the chosen real reflection convention must later be compared; that comparison stays a recorded gap of the part. |
| [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison) | row 13: `MP.1` → `MP.1/rao-factor-set`, `MP.1/metaplectic-double-cover`, `MP.1/genuine-oscillator` | verified: the node imports the local cocycle, the double cover and the genuine oscillator representation (all moved to MP.2 by R1, ids unchanged). |
| [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison) | row 14: `MP.2` → `MP.2/generator-operators`, `MP.2/operator-relations` | verified: the comparison is made on unipotent, integral Levi and Fourier generators, whose operators and relations are these two nodes. |
| [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison) | row 15: `MP.4` → `MP.4/adelic-metaplectic-cover`, `MP.4/rational-symplectic-splitting`, `MP.4/adelic-weil-representation`, `MP.4/unramified-compact-splittings`, `MP.4/global-weil-index-product`, `MP.4/finite-weil-representation` | verified: the node uses the restricted product, the rational splitting, the global Schrödinger model, the integral splittings at good places, the product formula and the finite vector fixed by a compact-open subgroup, which are these six MP.4 targets. |
| [`MP.8/theta-normal-convergence`](#n-mp-8-theta-normal-convergence) | row 16: `MP.2` → dropped | verified: drop the citation. The estimate is the node's own Gaussian majorant exp(−c‖R‖² + C‖R‖) on compacta; no MP.2 target (Weil index, operators, uncertainty) is used. |

### R6

Gaussian norm of the genus-two theta series (adversarial package review, blocker B4). MP.8/theta-pairing states the squared norm √det(Y)/(2a), following BFH Proposition 2.1, and MP.8/theta-components divides by it. Direct computation gives √det(Y)/(4a): with W = Zλ + ρ the Lebesgue measure is det(Y) dλ dρ, the ρ-integral forces equal summation vectors R, the exponent becomes −4πa·Y[λ + R/(2a)], the translates tile ℝ², and ∫_{ℝ²} exp(−4πa·Y[u]) du = (16a² det Y)^{−1/2}. The same computation in one variable is Eichler–Zagier's √(v/4m). The review also asked whether the prefactor 1/(2mN³) of MP.8/fourier-unfolding-kernel and the unfolding identities that follow need re-deriving. They do not: BFH obtain N⁻³ from the coefficient formula (2.3) with j = 1, and 1/(2m) from the real Gaussian integral ∫_{ℝ²} e(−m Z⁻¹[W] − RᵀW) dW = √(−det Z)/(2m) · e(Z[R]/(4m)) on p. 581, which is correct (at Z = iY both sides equal (√det Y/(2m)) exp(−π Y[R]/(2m))). Neither uses Proposition 2.1. BFH's Proposition 2.2 obtains the theta components from Fourier coefficients ((2.5)–(2.6), (2.10)–(2.11)), not by projection, and uses Proposition 2.1 once, on p. 554, to deduce (2.7) from (2.12) and (2.14); that step needs only the orthogonality of the θ_ν (their linear independence), so the misprinted constant affects no formula of BFH.

**Proposal.** Correct MP.8/theta-pairing to the value √det(Y)/(4a) (statement, proof step 'the real Gaussian integral is 1/(4a√det Y)', and acceptance 'at Y = 4I₂ the squared norm is 1/a, not 2/a') and MP.8/theta-components to divide by √det(Im Z′)/(4a). With the old divisor the projection returns half the BFH component, contrary to the node's own claim that it equals the component of Proposition 2.2. Leave MP.8/fourier-unfolding-kernel and MP.8/cusp-one-unfolding unchanged. Source issue MetaplecticAutomorphicForms/E-WR-1 records the constant in BFH Proposition 2.1.

**Status.** verified routed to part packet; routed to `research/blueprint/packets/MetaplecticAutomorphicForms--MP.8.json`.

| Target | Change | Verdict |
|---|---|---|
| [`MP.8/theta-pairing`](#n-mp-8-theta-pairing) | statement, proofSteps, acceptance: √det(Y)/(2a); Gaussian integral det(Y)^{−1/2}/(2a); at Y = 4I₂ the value 2/a → √det(Y)/(4a); Gaussian integral 1/(4a√det Y); at Y = 4I₂ the value 1/a | verified by the computation in the detail; the measure convention (Lebesgue measure on ℂ², period lattice ZZ² + Z²) is the node's and BFH's. |
| [`MP.8/theta-components`](#n-mp-8-theta-components) | statement: divided by its norm √det(Im Z′)/(2a) → divided by its squared norm √det(Im Z′)/(4a) | verified: projecting Σ_ν E(ν) θᵃ_ν onto θᵃ_μ gives E(μ) · √det(Im Z′)/(4a), so this divisor returns E(μ). |
| [`MP.8/fourier-unfolding-kernel`](#n-mp-8-fourier-unfolding-kernel) | no change | checked, no change: the prefactor (2mN³)⁻¹ comes from BFH (2.3) and the Gaussian integral on p. 581, both correct and independent of the theta norm. |

### R7

MP.4/function-field-metaplectic-programme records Lafforgue's §14 conditional programme, as the maintainer routed it (PAPER-LAFFORGUE-18/43). It cites GeometricSatakeAndFusion GS3 and GlobalShtukasAndFunctionFieldLanglands GS.5, and it has no consumer. Through it the whole of MP.4–MP.8, and every roadmap that imports them, acquires the shtuka and fusion roadmaps as ancestors, although none of their targets uses the programme.

**Proposal.** Keep the node as routed. When the function-field Part II is designed (DESIGN-MetaplecticAutomorphicFormsPartII, which carries the PAPER-DOR-23 direction 'local fields of odd positive characteristic and global function fields'), move the programme there, so that the main line of this roadmap does not depend on function-field Langlands. This is a decision for the maintainer.

**Status.** proposal for maintainer.

### R8

The open upstream roadmap Theta Series (TauCetiRoadmap pull request #286, read at head 1bc912d) owns Poisson summation for a full-rank lattice (its Layer 1), the theta series of positive definite lattices (Layer 3) and the Hecke–Schoeneberg theorem Θ_L ∈ M_k(Γ₀(N), χ_L) for even L of rank 2k and level N (Layer 7). The binary instance of MP.5 is a special case: for an integral ideal 𝔞 of an imaginary quadratic field of discriminant D < 0, the lattice L_𝔞 = (𝔞, x ↦ 2N(x)/N(𝔞)) is even of rank 2, determinant |D|, level |D| and character χ_L = χ_D, and θ_A = (1/w) Θ_{L_𝔞}. The atlas does not yet track Theta Series, so no packet can cite its layers.

**Proposal.** Once the atlas tracks Theta Series: prove MP.5/ideal-class-theta-modularity from Hecke–Schoeneberg (its 7C–7D) through θ_A = (1/w) Θ_{L_𝔞}, and MP.6/ideal-lattice-poisson (MP.5 after R1) from its Layer 1 in a Euclidean model of ℂ, reached by a real-linear equivalence that carries the trace form and the covolume, as that roadmap prescribes for number-field consumers. MP.5/ideal-class-theta (the Gross–Zagier normalization by 1/w and ideal counting) and the odd-discriminant all-SL₂(ℤ) transformation stay targets here.

**Status.** atlas edit for maintainer.

## Requests to other roadmaps

The whole-roadmap packet makes two requests; the parts' requests follow, as their packets state them.

- **Whole-roadmap packet.** `AutomorphicLFunctionsAndLocalFactors:AL.0`: The Bessel functions of the first kind, beside AL.0/bessel-k: for ν, z ∈ ℂ, J_ν(z) = (z/2)^ν Σ_{j≥0} (−1)^j (z²/4)^j/(j! Γ(ν+j+1)) and I_ν(z) = (z/2)^ν Σ_{j≥0} (z²/4)^j/(j! Γ(ν+j+1)), with the principal power, entire in z after removing (z/2)^ν; Bessel's equation; I_ν(z) = e^{−νπi/2} J_ν(iz) on the slit plane; I_ν(x) > 0 for real ν > −1 and x > 0; and the Whittaker–Bessel integral formulas that express the Fourier coefficients of Poincaré series through I and J. AutomorphicSpectralTheory needs the same functions, so they cannot live in QSeriesPartitionsAndMockModularForms. (needed by [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient), [`MP.7/negative-cycle-poincare-sum`](#n-mp-7-negative-cycle-poincare-sum)).
- **Whole-roadmap packet.** `AutomorphicSpectralTheory:AS.0`: The weight-k hyperbolic Laplacian for real k, Δ_k = −y²(∂_x² + ∂_y²) + i k y ∂_x on smooth functions on the upper half plane, its commutation with the weight-k slash operators of any multiplier system, and the relation Δ_unit,k = y^{k/2} Δ_hol,k y^{−k/2} + (k/2)(1 − k/2) between the holomorphic and unitary normalizations (at k = 1/2 the constant is 3/16). AutomorphicSpectralTheory AS.2 and AS.4 use the same operator. (needed by [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space), [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight)).
- **MP.0 part.** `AutomorphicLFunctionsAndLocalFactors:AL.0`: PartII: finite-dimensional local and adelic Schwartz–Bruhat spaces, the full joint archimedean Schwartz/Fréchet space (and completed tensor comparison), distributions/oscillatory Fourier transforms, self-dual determinant/covolume laws, Gaussian and ideal-lattice Poisson, compact Fourier completeness and Schwartz integration. The existing scalar AL.0 nodes are retained, not duplicated. (needed by [`MP.0/heisenberg-haar`](#n-mp-0-heisenberg-haar), [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model), [`MP.0/hilbert-schroedinger`](#n-mp-0-hilbert-schroedinger), [`MP.2/weil-index`](#n-mp-2-weil-index), [`MP.3/theta-coefficient-rationality`](#n-mp-3-theta-coefficient-rationality), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.6/local-doubling-integral`](#n-mp-6-local-doubling-integral), [`MP.6/theta-integral-factorization`](#n-mp-6-theta-integral-factorization), [`MP.6/rallis-inner-product`](#n-mp-6-rallis-inner-product), [`MP.7/fundamental-eisenstein-coefficient`](#n-mp-7-fundamental-eisenstein-coefficient), [`MP.7/biro-shintani-lift`](#n-mp-7-biro-shintani-lift), [`MP.7/ramified-quadratic-twist-kernel-inputs`](#n-mp-7-ramified-quadratic-twist-kernel-inputs)).
- **MP.0 part.** `SmoothRepresentationsOfLocalGroups:SR.2`: Smooth compact/normalized parabolic induction, Jacquet modules, Frobenius reciprocity and geometric lemma with precise support, coefficient and modulus hypotheses. MP supplies the cover/Weil-character adapters and rank filtrations. (needed by [`MP.0/induced-schroedinger`](#n-mp-0-induced-schroedinger), [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/local-see-saw`](#n-mp-3-local-see-saw), [`MP.3/persistence-and-stable-range`](#n-mp-3-persistence-and-stable-range), [`MP.3/supercuspidal-first-occurrence`](#n-mp-3-supercuspidal-first-occurrence), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/doubling-filtration`](#n-mp-3-doubling-filtration), [`MP.3/type-ii-theta`](#n-mp-3-type-ii-theta), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe), [`MP.6/local-doubling-integral`](#n-mp-6-local-doubling-integral)).
- **MP.0 part.** `AutomorphicFormsOnReductiveGroups:AF.1`: Real smooth-vector/Fréchet/globalization and Sobolev-differentiation carriers; archimedean theta module category. MP proves its Heisenberg/finite-cover comparison before importing these. (needed by [`MP.0/smooth-vectors`](#n-mp-0-smooth-vectors), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), [`MP.3/local-see-saw`](#n-mp-3-local-see-saw), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), [`MP.3/archimedean-conservation`](#n-mp-3-archimedean-conservation), [`MP.3/unitary-doubling-dichotomy`](#n-mp-3-unitary-doubling-dichotomy), [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe), [`MP.3/real-discrete-series-theta`](#n-mp-3-real-discrete-series-theta), [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces), [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight), [`MP.3/howe-duality`](#n-mp-3-howe-duality)).
- **MP.0 part.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`: Native smooth representation abelian category and its coinvariants/duals/smooth-vector carriers; identify the full smooth central-character category needed for Stone–von Neumann, not just finite-dimensional operators. Native algebraic Coinvariants are reused. (needed by [`MP.0/smooth-vectors`](#n-mp-0-smooth-vectors), [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), [`MP.3/small-theta-module`](#n-mp-3-small-theta-module), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), [`MP.3/local-see-saw`](#n-mp-3-local-see-saw), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), [`MP.1/smooth-stone-von-neumann`](#n-mp-1-smooth-stone-von-neumann)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`: Reuse native orthogonal/symplectic groups and defining actions. PartII: Hermitian/quaternionic and connected similitude carriers and tensor double-centralizer comparison needed by the stated dual pairs. (needed by [`MP.3/orthogonal-symplectic-dual-pair`](#n-mp-3-orthogonal-symplectic-dual-pair), [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting), [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum)).
- **MP.0 part.** `SmoothRepresentationsOfLocalGroups:SR.3`: Admissibility, finite length, smooth dual, supercuspidal/tempered and finite semisimple quotient interfaces in complex smooth modules. Supply MVW and Mínguez scope via their original proofs; MP owns only the cover/theta-specific comparisons. (needed by [`MP.3/small-theta-module`](#n-mp-3-small-theta-module), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), [`MP.3/howe-duality`](#n-mp-3-howe-duality), [`MP.3/persistence-and-stable-range`](#n-mp-3-persistence-and-stable-range), [`MP.3/supercuspidal-first-occurrence`](#n-mp-3-supercuspidal-first-occurrence), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/doubling-filtration`](#n-mp-3-doubling-filtration), [`MP.3/type-ii-theta`](#n-mp-3-type-ii-theta), [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction), [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation), [`MP.3/unitary-equal-almost-equal-rank`](#n-mp-3-unitary-equal-almost-equal-rank), [`MP.3/mp-odd-orthogonal-unramified`](#n-mp-3-mp-odd-orthogonal-unramified), [`MP.3/rallis-unramified-satake`](#n-mp-3-rallis-unramified-satake), [`MP.3/unitary-hecke-compatibility`](#n-mp-3-unitary-hecke-compatibility), [`MP.1/smooth-stone-von-neumann`](#n-mp-1-smooth-stone-von-neumann), [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe), [`MP.3/quaternionic-unramified-theta`](#n-mp-3-quaternionic-unramified-theta), [`MP.3/gl2-gso4-theta`](#n-mp-3-gl2-gso4-theta), [`MP.3/minimal-orthogonal-theta`](#n-mp-3-minimal-orthogonal-theta), [`MP.3/pgsp6-pgso8-similitude-theta`](#n-mp-3-pgsp6-pgso8-similitude-theta)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`: Use QFI6C’s native Hilbert symbol and local Hasse invariants over nonarchimedean local fields, dyadic fields included (the real-place symbol laws come from GlobalQuadraticForms 4.4, not 6C), its local identity laws and the norm-equation/cohomological comparison. Keep the plain quadratic determinant, signed discriminant and full polar determinant distinct. PartII requests here concern local Hermitian and quaternionic trace-norm invariant adapters only. Global quadratic coherent-collection existence/classification is requested separately from GlobalQuadraticForms; a global Hermitian analogue is not supplied by QFI6C. The analytic Weil index and its adelic Poisson product remain with MP. (needed by [`MP.3/first-occurrence`](#n-mp-3-first-occurrence), [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation), [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities), [`MP.1/rao-factor-set`](#n-mp-1-rao-factor-set), [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum), [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting), [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting), [`MP.3/periods-i-comparison`](#n-mp-3-periods-i-comparison), [`MP.3/division-ternary-theta`](#n-mp-3-division-ternary-theta), [`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product), [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections), [`MP.6/pi-coherence-parity`](#n-mp-6-pi-coherence-parity), [`MP.6/quadratic-quaternionic-norm-instances`](#n-mp-6-quadratic-quaternionic-norm-instances), [`MP.5/ideal-class-theta-general-transform`](#n-mp-5-ideal-class-theta-general-transform)).
- **MP.0 part.** `ModularityAndLanglandsExtensions:ML.4`: Exact local Langlands/Jacquet–Langlands/Satake normalization used by the classical similitude theta comparisons; exceptional G₂ parameters remain at their separate proposed owner. (needed by [`MP.3/unitary-equal-almost-equal-rank`](#n-mp-3-unitary-equal-almost-equal-rank), [`MP.3/division-ternary-theta`](#n-mp-3-division-ternary-theta), [`MP.3/pgsp6-pgso8-similitude-theta`](#n-mp-3-pgsp6-pgso8-similitude-theta)).
- **MP.0 part.** `AdelicAlgebraicGroups:AA.2`: PartII: disconnected orthogonal Haar/Tamagawa component and O(1) and split O(1,1) normalizations; connected reductive Tamagawa results cannot directly supply this. (needed by [`MP.3/rallis-unramified-satake`](#n-mp-3-rallis-unramified-satake), [`MP.3/unitary-hecke-compatibility`](#n-mp-3-unitary-hecke-compatibility), [`MP.3/quaternionic-unramified-theta`](#n-mp-3-quaternionic-unramified-theta), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations), [`MP.6/anisotropic-siegel-weil`](#n-mp-6-anisotropic-siegel-weil), [`MP.6/first-term-identity`](#n-mp-6-first-term-identity)).
- **MP.0 part.** `AutomorphicLFunctionsAndLocalFactors:AL.2`: Native quadratic Dirichlet completed L-functions and special-function Gamma normalization, local epsilon factors and their character/measure conventions; MP compares its coefficients to these functions. (needed by [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations)).
- **MP.0 part.** `AdelicAlgebraicGroups:AA.1`: Finite-dimensional local/adelic groups, restricted products, quotients and actual Haar/Fubini integration with topological assumptions, including unipotent compact probability quotients and covered-group comparison. (needed by [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover), [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker), [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence), [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral), [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations), [`MP.6/unitary-siegel-weil-measure`](#n-mp-6-unitary-siegel-weil-measure), [`MP.7/theta-residue-normalization`](#n-mp-7-theta-residue-normalization), [`MP.6/toric-theta-pairing-interface`](#n-mp-6-toric-theta-pairing-interface)).
- **MP.0 part.** `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`: Reuse the finite quadratic module as native QuadraticMap Z A (AddCircle (1:Q)), its half-norm convention and discriminant pairing. Supply a checked Lean carrier bridge before MP’s finite Weil action; do not re-plan the completed lattice arithmetic. (needed by [`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation), [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface), [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta)).
- **MP.0 part.** `GeometricSatakeAndFusion:GS3`: PartII: metaplectic gerbe/twisted Satake, coherent fusion and modified dual-group construction required by Lafforgue §14. Ordinary fusion is imported from its exact existing node. (needed by [`MP.4/function-field-metaplectic-programme`](#n-mp-4-function-field-metaplectic-programme)).
- **MP.0 part.** `GlobalShtukasAndFunctionFieldLanglands:GS.5`: PartII: metaplectic shtuka sheaves and modified excursion operators with exact conditionality. Ordinary excursion operators are imported; Lafforgue §14 is a programme, not full theorem proof. (needed by [`MP.4/function-field-metaplectic-programme`](#n-mp-4-function-field-metaplectic-programme)).
- **MP.0 part.** `AutomorphicFormsOnReductiveGroups:AF.2`: Finite-level K/Z-finiteness and the all-derivatives single-exponent uniform-growth API. Verify the theta seminorm estimate and finite-cover height transfer before applying the linear-group result. (needed by [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.7/shimura-eigenline-lift`](#n-mp-7-shimura-eigenline-lift), [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight)).
- **MP.0 part.** `AutomorphicFormsOnReductiveGroups:AF.3`: Actual continuous/smooth compact unipotent fibre integrals and cusp decay on Siegel sets modulo the split center with unitary central character; regularized/projection interchanges require MP-specific proofs. (needed by [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.6/global-see-saw-and-projection`](#n-mp-6-global-see-saw-and-projection), [`MP.7/biro-shintani-lift`](#n-mp-7-biro-shintani-lift)).
- **MP.0 part.** `AdelicAlgebraicGroups:AA.3`: Rational lattice counting and differentiated Schwartz majorants on the stated adelic Siegel sets/height. Supply the connected-group estimate; MP compares the finite cover and disconnected orthogonal components. (needed by [`MP.5/global-theta-lift`](#n-mp-5-global-theta-lift), [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence), [`MP.5/unit-quotiented-theta`](#n-mp-5-unit-quotiented-theta)).
- **MP.0 part.** `AutomorphicSpectralTheory:AS.1`: Normalized induced section spaces and source-qualified initial Eisenstein convergence chambers/majorants; MP must prove the genuine-cover comparison and preserve parameter/measure conventions. (needed by [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral), [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.7/half-weight-eisenstein`](#n-mp-7-half-weight-eisenstein), [`MP.5/genuine-eisenstein-family`](#n-mp-5-genuine-eisenstein-family)).
- **MP.0 part.** `AutomorphicSpectralTheory:AS.2`: Meromorphic normalized intertwining/constant-term/functional-equation families and Laurent/residue topology; supply only after the exact cover adaptation, never an unqualified linear reductive theorem. (needed by [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral), [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.6/second-term-identity`](#n-mp-6-second-term-identity), [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections), [`MP.5/genuine-eisenstein-family`](#n-mp-5-genuine-eisenstein-family)).
- **MP.0 part.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3`: Independent arithmetic PartII output (routing request, not a prerequisite edge): Ideal norm/class and trace-dual arithmetic, ramified ideal classes, CM stabilizers and the oriented z→γ_Qz closed-cycle dictionary. Establish these before the MP theta consumer; preserve GN’s existing integral-lattice/density/mass nodes and its MP.5-dependent theta interface. (needed by [`MP.5/unit-quotiented-theta`](#n-mp-5-unit-quotiented-theta), [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta), [`MP.5/ideal-class-theta-modularity`](#n-mp-5-ideal-class-theta-modularity), [`MP.5/ideal-class-theta-conjugation`](#n-mp-5-ideal-class-theta-conjugation), [`MP.6/ideal-lattice-poisson`](#n-mp-6-ideal-lattice-poisson), [`MP.5/ideal-class-theta-general-transform`](#n-mp-5-ideal-class-theta-general-transform), [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding), [`MP.7/cm-poincare-sum`](#n-mp-7-cm-poincare-sum), [`MP.7/positive-cycle-poincare-sum`](#n-mp-7-positive-cycle-poincare-sum), [`MP.7/positive-factor-trace`](#n-mp-7-positive-factor-trace), [`MP.7/cm-trace`](#n-mp-7-cm-trace), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace)).
- **MP.0 part.** `AutomorphicSpectralTheory:AS.0`: Actual unbounded three-cusp Laplacian domain, multiplier Hilbert resolvent, finite-rank spectral residues and their coefficient/interchange estimates. Ordinary weight-zero Poincaré/resolvent and finite-dimensional spectral input remain here; MP proves the half-weight adaptation. (needed by [`MP.6/global-see-saw-and-projection`](#n-mp-6-global-see-saw-and-projection), [`MP.7/half-weight-resolvent`](#n-mp-7-half-weight-resolvent), [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding), [`MP.7/cm-poincare-sum`](#n-mp-7-cm-poincare-sum), [`MP.7/positive-cycle-poincare-sum`](#n-mp-7-positive-cycle-poincare-sum), [`MP.7/spectral-trace-identity`](#n-mp-7-spectral-trace-identity), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace), [`MP.7/biro-shintani-lift`](#n-mp-7-biro-shintani-lift)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`: Classical weight/character and all-cusp holomorphy carrier for binary weight1 and half-weight adelization; the genuine multiplier/cocycle comparison is MP’s addition. (needed by [`MP.5/ideal-class-theta-modularity`](#n-mp-5-ideal-class-theta-modularity), [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight)).
- **MP.0 part.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2`: Independent arithmetic PartII output (routing request, not a prerequisite edge): Invariant genus characters χ_d on possibly imprimitive binary forms, including discriminant/conductor/parity at2; MP owns only the finite oscillator/Kohnen sum adapter. The current GN.2 lattice/genus nodes do not state this binary genus-character and extended Kronecker API; route its missing arithmetic extension and then cite exact nodes. Establish these before the MP theta consumer; preserve GN’s existing integral-lattice/density/mass nodes and its MP.5-dependent theta interface. (needed by [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum), [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`: Import the level-one orbifold geometry and the proposed FuchsianOrbifolds PartII arithmetic Nielsen-core/Stokes extension from the DIT16 routing. MP must not duplicate core surfaces or generic cycle geometry. (needed by [`MP.7/negative-factor-trace`](#n-mp-7-negative-factor-trace)).
- **MP.0 part.** `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`: Extend the I-Bessel API with differentiated bounds locally uniform for complex order ν=2s−1 in the Re(s)>1 half-plane. The existing real-order bound is not this complex-parameter estimate. (needed by [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient)).
- **MP.0 part.** `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`: Extend the J-Bessel API with the locally uniform complex-order small-argument and differentiated cycle-integral estimates. Import the existing series/ODE carrier; no second Bessel definition is planned. (needed by [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient), [`MP.7/negative-cycle-poincare-sum`](#n-mp-7-negative-cycle-poincare-sum)).
- **MP.0 part.** `AutomorphicSpectralTheory:AS.0/dit-112`: Export the displayed M/W positive-real normalization and continued parameter domains; refine the compact-parameter derivative/endpoint estimates needed by the half-weight Fourier and Poincaré adapters. DIT11 Appendix A gives fixed-parameter asymptotics, not unrestricted uniform estimates. (needed by [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare), [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-7-existence-from-compatible-local-invariants`: Use GlobalQuadraticForms 7.2–7.4, with the invariant carrier and admissibility conditions of3.1–3.3 and classification8.1: regular positive-rank quadratic forms over an arbitrary number field, one global discriminant, all real signatures, finite support, local small-rank exceptions and total Hasse product1. Return a global form and actual local isometries. Keep the unique rank-zero case separate. This is the quadratic coherence input only; source-qualified Hermitian/quaternionic extensions beyond quadratic trace-norm forms remain a separate obligation. (needed by [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-3-admissible-systems-of-local-invariants`: Use GlobalQuadraticForms 3.1–3.3: the positive-rank invariant carrier, one global discriminant, real signatures, finite-support local Hasse signs, both small-rank realization exceptions and the total product constraint. This is the input to the Layer7 form-level existence theorem, not a sufficient list with realizability omitted. (needed by [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences`: Use GlobalQuadraticForms 8.1: the complete positive-rank classification by admissible local invariants, with a separate unique rank-zero class. The quadratic coherence adapter must compare actual localizations of the global form, not unrelated local invariant records. (needed by [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections)).
- **MP.0 part.** `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-4-global-square-norm-and-approximation-lemmas`: Use GlobalQuadraticForms 4.4’s archimedean computation of the norm-equation Hilbert symbol: at a real place (a,b)=−1 exactly when a<0 and b<0, and at a complex place it is 1, with symmetry and bimultiplicativity read off that formula. MP.2 uses it for the real Weil-index identities and Hasse products; QFI6C’s symbol theorems assume a nonarchimedean local field and are not cited at ℝ. (needed by [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities)).
- **MP.8 part.** `MetaplecticAutomorphicForms:MP.1`: Intrinsic rank-two real metaplectic extension, kernel sign, generator lifts and continuous central-extension topology, to compare with the actual square-root cover of GSp₄⁺. (needed by [`MP.8/similitude-cover`](#n-mp-8-similitude-cover), [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison)).
- **MP.8 part.** `MetaplecticAutomorphicForms:MP.2`: Schrödinger–Weil operators for a rank-two symplectic real space with the specified e(t), self-dual measures and Fourier phase. Supply the generator relations used to compare the finite theta S-matrix. (needed by [`MP.8/theta-fourier-transform`](#n-mp-8-theta-fourier-transform), [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison), [`MP.8/theta-normal-convergence`](#n-mp-8-theta-normal-convergence)).
- **MP.8 part.** `MetaplecticAutomorphicForms:MP.4`: Rank-two adelic restricted product, rational splitting on Sp₄(Q), self-dual local measures and finite lattice-vector stabilizers, including the dyadic compact-open splitting at level 8M|N. MP.8 uses these existing local/global metaplectic inputs to construct and verify the additional rational-similitude extension and BFH arithmetic comparison. (needed by [`MP.8/full-real-cover`](#n-mp-8-full-real-cover), [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison)).
- **MP.8 part.** `MetaplecticAutomorphicForms:MP.6`: Under confirmed RT-AREA-automorphic-1/20, supply general H(W)⋊Sp(W), the Schrödinger–Weil action, Jacobi weight/index/multiplier spaces, Fourier–Jacobi extraction and theta decomposition before MP.7. MP.8 imports these and proves only the BFH genus-two arithmetic and similitude specializations; positive similitudes transport the central index. (needed by [`MP.8/arithmetic-subgroup`](#n-mp-8-arithmetic-subgroup), [`MP.8/bfh-slash`](#n-mp-8-bfh-slash), [`MP.8/bfh-translation`](#n-mp-8-bfh-translation), [`MP.8/genus-two-theta`](#n-mp-8-genus-two-theta), [`MP.8/theta-decomposition`](#n-mp-8-theta-decomposition), [`MP.8/theta-fourier-transform`](#n-mp-8-theta-fourier-transform), [`MP.8/bfh-jacobi-specialization`](#n-mp-8-bfh-jacobi-specialization), [`MP.8/jacobi-eisenstein`](#n-mp-8-jacobi-eisenstein), [`MP.8/similitude-heisenberg-comparison`](#n-mp-8-similitude-heisenberg-comparison)).
- **MP.8 part.** `AutomorphicFormsOnReductiveGroups:AF.5`: Classical-to-automorphic GL₂/Q dictionary for a normalized holomorphic newform, preserving weight k, trivial central character, conductor M, Hecke eigenvalues and auxiliary Fricke/cusp transforms at N. Import AF.1 for real globalization and GL₂ R16.2 for the finite conductor vector; MP.8 does the genuine-cover comparison. (needed by [`MP.8/bfh-seed`](#n-mp-8-bfh-seed)).
- **MP.8 part.** `AutomorphicLFunctionsAndLocalFactors:AL.3`: GL₂ Hecke/Satake factors, twisted L-functions and the symmetric-square factor extracted from Rankin–Selberg, including their completed/partial conventions and nonvanishing of the precise symmetric-square denominator near s=2. Supply the hypotheses for translating BFH local products into global ratios; MP.8 does the BFH comparison. (needed by [`MP.8/unramified-euler-factors`](#n-mp-8-unramified-euler-factors), [`MP.8/genuine-eisenstein-continuation`](#n-mp-8-genuine-eisenstein-continuation), [`MP.8/opposite-cusp-zero-regularity`](#n-mp-8-opposite-cusp-zero-regularity), [`MP.8/bsd2-export`](#n-mp-8-bsd2-export)).
- **MP.8 part.** `AutomorphicSpectralTheory:AS.1`: Normalized induced spaces, Haar measures, a quantified convergence chamber and compact-uniform differentiated Sobolev estimates for linear Siegel Eisenstein families. MP.8 proves the finite-cover genuine-section reduction with ν=s−2 and the Gaussian lattice majorant before invoking these bounds. (needed by [`MP.8/whittaker-rapid-decay`](#n-mp-8-whittaker-rapid-decay), [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison), [`MP.8/genuine-eisenstein-initial-convergence`](#n-mp-8-genuine-eisenstein-initial-convergence), [`MP.8/opposite-cusp-zero-regularity`](#n-mp-8-opposite-cusp-zero-regularity)).
- **MP.8 part.** `AutomorphicSpectralTheory:AS.2`: Source/target induced topologies, meromorphic standard intertwiners, normalization, singular hyperplanes, constant-term uniqueness and residue estimates. MP.8 proves their adaptation to its genuine GSp₄ double cover, contragredient cusp datum and Fourier/residue interchanges. (needed by [`MP.8/genuine-intertwining-operators`](#n-mp-8-genuine-intertwining-operators), [`MP.8/genuine-eisenstein-continuation`](#n-mp-8-genuine-eisenstein-continuation)).
- **MP.8 part.** `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`: Uniform matrix-coefficient density on U(2), finite-dimensional tensor-product closure and projection to the prescribed left SO(2) weight. These are imported inputs to the BFH test-coefficient ring, not new Peter–Weyl nodes. (needed by [`MP.8/test-coefficient-algebra`](#n-mp-8-test-coefficient-algebra)).
- **MP.8 part.** `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`: Good-prime Hecke recurrence a(p^{j+1})=a(p)a(p^j)−p^(k−1)a(p^{j−1}) for trivial character and coprime multiplicativity. The coefficient-growth bound belongs to upstream ModularForms layer 7. (needed by [`MP.8/bfh-l-dirichlet-series`](#n-mp-8-bfh-l-dirichlet-series), [`MP.8/unramified-euler-factors`](#n-mp-8-unramified-euler-factors), [`MP.8/squarefactor-polynomial-bound`](#n-mp-8-squarefactor-polynomial-bound)).
- **MP.8 part.** `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`: Native normalized Newform at conductor M, actual cusp function, a(1)=1, eigenform/newness and all-n Fourier coefficients. No opaque record of supplied L-values or vanishing Fourier invariants. (needed by [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/bfh-l-dirichlet-series`](#n-mp-8-bfh-l-dirichlet-series), [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison)).
- **MP.8 part.** `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`: Fricke and arbitrary-cusp transforms of the original weight-k newform, their coefficient functions and exact slash normalization. Original completion/Fricke involution uses M; f̂(τ)=τ^(−k)f(−1/(Nτ)) uses auxiliary N. (needed by [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/bfh-p-dirichlet-series`](#n-mp-8-bfh-p-dirichlet-series), [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison)).
- **MP.8 part.** `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`: Convergent native Dirichlet series, the distinct continued newform/twist L-function, Euler products, completed Mellin transform and conductor-M functional equation. The raw totalized sum is not its continuation outside convergence. Also supply the normalized coefficient bound a(p^j)≪p^{j(k/2−1/5)} used at BFH p.600, or a stronger applicable bound, with its hypotheses and constants for the fixed newform. (needed by [`MP.8/unramified-euler-factors`](#n-mp-8-unramified-euler-factors), [`MP.8/squarefactor-polynomial-bound`](#n-mp-8-squarefactor-polynomial-bound)).
- **MP.8 part.** `AutomorphicFormsOnReductiveGroups:AF.1`: Smooth globalization of finite K-types and compact-convolution smoothing with differentiation/Sobolev control. This is the real representation input to the JPSS §8.3.3 Whittaker decay comparison, whose exact cited passage remains a gap; AS.1 supplies the separate Eisenstein estimates. (needed by [`MP.8/whittaker-rapid-decay`](#n-mp-8-whittaker-rapid-decay)).
- **MP.8 part.** `GL2AutomorphicRepresentationsAndTransfer:R16.2`: GL₂ conductor/newvector theorem for the finite representation associated through AF.5 to the conductor-M normalized newform, including congruence-invariant vector normalization at ramified and dyadic places. MP.8 must compare that vector with the auxiliary BFH level N. (needed by [`MP.8/bfh-seed`](#n-mp-8-bfh-seed), [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison)).

## Gaps

A gap names an input that is not established, and the targets that need it. The whole-roadmap packet records two; the parts' gaps follow.

- **Whole-roadmap packet.** *Stage cycle MP.3 ⇄ ML.4 until ModularityAndLanglandsExtensions splits its GSp₄ targets.* The Arthur–Mok local Langlands correspondence for Sp₆ and SO₈ has no owner other than ML.4 (ML.4/extended-langlands-parameter), and ML.4 also contains Gan–Takeda's GSp₄ correspondence, which uses MP.3. Until the theta-dependent ML.4 targets move to a sub-layer (R2), citing ML.4 from MP.3 closes a stage cycle; the atlas would skip one of the two edges. (needed by [`MP.3/pgsp6-pgso8-similitude-theta`](#n-mp-3-pgsp6-pgso8-similitude-theta)).
- **Whole-roadmap packet.** *Unitary Fourier–Jacobi coefficients: splitting compatibility at the real places.* MP.3/unitary-splitting is stated for characteristic-zero local fields; the agreement of the product of local splittings with the rational splitting on U(W)(F) is Kudla's global splitting theorem, whose original proof the accepted part records as unread (MP.3 remaining item on Kudla's splitting formula). The two new MP.6 nodes inherit that input. (needed by [`MP.6/unitary-jacobi-group`](#n-mp-6-unitary-jacobi-group), [`MP.6/fourier-jacobi-period`](#n-mp-6-fourier-jacobi-period)).
- **MP.0 part.** *Product Haar measure on the Heisenberg group proof/signature boundary.* AL.0 currently states Fourier inversion on the scalar local field. Its finite-dimensional vector-space extension, measure determinant law, and the symplectic determinant-one bridge must be supplied and checked before this signature is closed. (needed by [`MP.0/heisenberg-haar`](#n-mp-0-heisenberg-haar)).
- **MP.0 part.** *Schrödinger representation proof/signature boundary.* The exact finite-dimensional and joint archimedean Schwartz carriers are an AL.0 Part II request; neither a formal function symbol nor the scalar supplier alone supplies them. (needed by [`MP.0/schroedinger-model`](#n-mp-0-schroedinger-model)).
- **MP.0 part.** *Hilbert Schrödinger model proof/signature boundary.* Native L² density and finite-dimensional local-field measure input must be instantiated; an abstract norm-preserving monoid homomorphism alone is not the required strongly continuous model. (needed by [`MP.0/hilbert-schroedinger`](#n-mp-0-hilbert-schroedinger)).
- **MP.0 part.** *Smooth vectors of the oscillator model proof/signature boundary.* The nonarchimedean compact-open argument and the archimedean Sobolev/Fréchet comparison require a matching proof source and a native smooth-vector carrier from SR.0/AF.1. The source citation here does not establish the archimedean conclusion. (needed by [`MP.0/smooth-vectors`](#n-mp-0-smooth-vectors)).
- **MP.0 part.** *Unitary dual-pair splittings proof/signature boundary.* The cited papers invoke Kudla’s unitary splitting formula; its original proof must be collated. Gan–Ichino §4 fixes the trace pairing and asserts δ-independence. General E/F Hermitian-space and quaternionic group carriers are requested ClassicalGroups Part-II inputs; the existing complex classical-group carriers do not provide them. (needed by [`MP.3/unitary-splitting`](#n-mp-3-unitary-splitting)).
- **MP.0 part.** *Finite length of theta modules proof/signature boundary.* The generic SR criteria are requested; the exact archimedean finite-generation proof and its globalization/automatic-continuity bridge remain unverified. (needed by [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length)).
- **MP.0 part.** *Howe duality proof/signature boundary.* Gan–Takeda proof continuation PDF11–21 and its type-II/MVW inputs need complete proof closure; the full quaternionic Gan–Sun theorem and archimedean Howe/automatic-continuity sources remain requested. (needed by [`MP.3/howe-duality`](#n-mp-3-howe-duality)).
- **MP.0 part.** *Local see-saw identity proof/signature boundary.* Kudla IV.1 pp59–66 has been read. Its common oscillator, sum tensorization and specialized application supply the route; a general native smooth tensor–Hom/dual adjunction, with the exact infinite-dimensional dual and admissibility conditions, remains to be supplied from SR and the unread original references. (needed by [`MP.3/local-see-saw`](#n-mp-3-local-see-saw)).
- **MP.0 part.** *Type-II theta input proof/signature boundary.* Mínguez’s original proof and the full unequal-rank parameter formula have not been read; only the cited input needed by Gan–Takeda is planned. (needed by [`MP.3/type-ii-theta`](#n-mp-3-type-ii-theta)).
- **MP.0 part.** *MVW involution and metaplectic induction proof/signature boundary.* Original MVW irreducible-duality proof and real-cover variant remain supplier/source requests; a cited use does not close those proofs. (needed by [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction)).
- **MP.0 part.** *Archimedean first-occurrence cases proof/signature boundary.* The cited degenerate-principal-series and archimedean Howe/automatic-continuity inputs are not proved here; §7 references are recorded as requests. (needed by [`MP.3/archimedean-conservation`](#n-mp-3-archimedean-conservation)).
- **MP.0 part.** *Unitary equal and almost equal rank proof/signature boundary.* LLC/root-number supplier stage and original theta-dichotomy proofs require an exact owner mapping; the packet requests that mapping rather than inventing an existing declaration. (needed by [`MP.3/unitary-equal-almost-equal-rank`](#n-mp-3-unitary-equal-almost-equal-rank)).
- **MP.0 part.** *Unitary doubling multiplicity and dichotomy proof/signature boundary.* Li–Liu’s broader semisimplicity assertion refers to the same argument as Gan–Ichino; matching that argument to its complete hypotheses remains open (existing paper finding E15). (needed by [`MP.3/unitary-doubling-dichotomy`](#n-mp-3-unitary-doubling-dichotomy)).
- **MP.0 part.** *Unramified metaplectic theta and induction proof/signature boundary.* PDF24 start of Lemma6.8 and every removed-pair exponent must be collated before the smaller-tower parameter signature is closed; this node does not substitute an unqualified Satake assertion. (needed by [`MP.3/mp-odd-orthogonal-unramified`](#n-mp-3-mp-odd-orthogonal-unramified)).
- **MP.0 part.** *Rallis unramified theta parameters proof/signature boundary.* Ral82 original local computation is cited but unread; the exact dimension-dependent segment remains a source gate rather than an invented formula. (needed by [`MP.3/rallis-unramified-satake`](#n-mp-3-rallis-unramified-satake)).
- **MP.0 part.** *Unitary theta Hecke compatibility proof/signature boundary.* The original Liu spherical module theorem and split-place AppendixA computation are unread; the broader tempered big-lift semisimplicity cited in Proposition3.9 remains the same explicit proof gate. (needed by [`MP.3/unitary-hecke-compatibility`](#n-mp-3-unitary-hecke-compatibility)).
- **MP.0 part.** *Smooth Stone–von Neumann theorem proof/signature boundary.* Kudla and Sun–Zhu both refer this proof to MVW 2.I.2; that book proof has not been read. The smooth uniqueness and scalar Schur step remain explicit proof gaps until a matching source is checked. (needed by [`MP.1/smooth-stone-von-neumann`](#n-mp-1-smooth-stone-von-neumann)).
- **MP.0 part.** *Unitary Stone–von Neumann theorem proof/signature boundary.* Garrett’s real proof supplies the route with the two recorded textual corrections; its Schwartz Fourier-density step, the complex reduction and nonarchimedean unitary analogue still need analytic proof closure and native irreducibility formulation. (needed by [`MP.1/unitary-stone-von-neumann`](#n-mp-1-unitary-stone-von-neumann)).
- **MP.0 part.** *Unitary normalizer extension proof/signature boundary.* Strong operator topology and the local-chart proof must be supplied on native unitary automorphisms; native ContRepresentation supplies only continuous linear operators, not continuity in g. (needed by [`MP.1/scalar-normalizer-extension`](#n-mp-1-scalar-normalizer-extension)).
- **MP.0 part.** *Weil index proof/signature boundary.* AL.0 Part II must supply Fourier transforms of oscillatory distributions and finite-dimensional self-dual measure; the native Fourier integral on integrable functions cannot itself define γ. (needed by [`MP.2/weil-index`](#n-mp-2-weil-index)).
- **MP.0 part.** *Leray quadratic form proof/signature boundary.* The general quotient’s transversality and the integral-composition proof require Rao’s argument; the graph sign is checked directly from Kudla p.11. That referenced proof has not been read. (needed by [`MP.2/leray-form`](#n-mp-2-leray-form)).
- **MP.0 part.** *Leray cocycle of intertwiners proof/signature boundary.* Kudla refers the integral-composition proof to Rao; exact quotient integral normalizations must be checked before promoting this proof route to closure. (needed by [`MP.2/leray-cocycle`](#n-mp-2-leray-cocycle)).
- **MP.0 part.** *Rao factor set proof/signature boundary.* Bruhat x(g), j(g), Leray rank and t-integrality still require their full sourced definitions/proofs; the formula specifies the target but does not conceal those data as arbitrary functions. (needed by [`MP.1/rao-factor-set`](#n-mp-1-rao-factor-set)).
- **MP.0 part.** *Metaplectic double cover proof/signature boundary.* The continuous character λ₂ and big-cell gluing proof must be turned into a concrete native topological-group signature; a raw FactorSet extension alone supplies only the algebraic group. (needed by [`MP.1/metaplectic-double-cover`](#n-mp-1-metaplectic-double-cover)).
- **MP.0 part.** *Generator relations and intrinsic comparison proof/signature boundary.* Weil’s big-cell proof continuation and the complete presentation-to-operator calculation must be checked; this node records the exact comparison target rather than assuming all generator formulas define a representation. (needed by [`MP.2/operator-relations`](#n-mp-2-operator-relations)).
- **MP.0 part.** *Quaternionic similitude dual pair proof/signature boundary.* Quaternionic Hermitian and connected similitude carriers are imported from upstream; exact layer mapping is requested. (needed by [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum)).
- **MP.0 part.** *Quaternionic similitude splitting proof/signature boundary.* Original Kudla unitary and Periods-I/II splittings remain unread inputs. Existing E6 replaces s(g₂) by s_v(g₂). (needed by [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting)).
- **MP.0 part.** *Quaternionic see-saw and Periods-II comparison proof/signature boundary.* The original Periods-II splitting remains unread; AppendixA supplies the comparison. (needed by [`MP.3/quaternionic-see-saw-compatibility`](#n-mp-3-quaternionic-see-saw-compatibility)).
- **MP.0 part.** *Periods-I splitting comparison proof/signature boundary.* The original Periods-I construction is an unread referenced input. (needed by [`MP.3/periods-i-comparison`](#n-mp-3-periods-i-comparison)).
- **MP.0 part.** *Similitude theta correspondence proof/signature boundary.* Original similitude Howe and Clifford inputs must be instantiated; compact induction is supplied by SR.2. (needed by [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe)).
- **MP.0 part.** *Real discrete-series theta lifts proof/signature boundary.* The original archimedean identification and complete root data remain an AF.1/source gate. (needed by [`MP.3/real-discrete-series-theta`](#n-mp-3-real-discrete-series-theta)).
- **MP.0 part.** *Quaternionic unramified theta lift proof/signature boundary.* Lemma9.4 omits its local calculation; an explicit Hecke computation must close it. (needed by [`MP.3/quaternionic-unramified-theta`](#n-mp-3-quaternionic-unramified-theta)).
- **MP.0 part.** *Rank-one oscillator constituents proof/signature boundary.* The §11.4 proof continuation and original rank-one extension theorem require full reading; existing E36 corrects ψ to its conjugate in the theta input. (needed by [`MP.3/rank-one-oscillator-constituents`](#n-mp-3-rank-one-oscillator-constituents)).
- **MP.0 part.** *Minimal orthogonal theta lift proof/signature boundary.* Yamana Proposition8.4 is invoked for the minimal theta realization but its original proof is unread. GS23 Proposition14.2 and §14.3 prove finite length of the specified Hom modules; the original exceptional realization and generic smooth tensor–Hom/finite-index restriction steps remain supplier inputs. (needed by [`MP.3/minimal-orthogonal-theta`](#n-mp-3-minimal-orthogonal-theta)).
- **MP.0 part.** *Division ternary theta lift proof/signature boundary.* The source domain is irreducible supercuspidal rho on PGL2 and its JL(rho) on PB×, as read before GS23 Lemma15.4. The original rank-one Waldspurger/Jacquet–Langlands proofs and exact carrier/psi comparison remain unread supplier inputs. (needed by [`MP.3/division-ternary-theta`](#n-mp-3-division-ternary-theta)).
- **MP.0 part.** *PGSp₆–PGSO₈ similitude theta proof/signature boundary.* Exact local LLC and Spin representation supplier mapping must be supplied; the generic theta theorem is cited in the source rather than reproved there. (needed by [`MP.3/pgsp6-pgso8-similitude-theta`](#n-mp-3-pgsp6-pgso8-similitude-theta)).
- **MP.0 part.** *Relevant unitary local dichotomy proof/signature boundary.* The original [20,Thm3.10]/[19,Thm1.3(ii)] proof scope and big-lift irreducibility still require collation. (needed by [`MP.3/relevant-unitary-dichotomy`](#n-mp-3-relevant-unitary-dichotomy)).
- **MP.0 part.** *Quadratic uncertainty principle proof/signature boundary.* The native valuation and finite-dimensional Schwartz carriers must be supplied by AL.0 Part II; the proof and exact strict/non-strict cone definitions were read, including residue characteristic2. (needed by [`MP.2/quadratic-uncertainty`](#n-mp-2-quadratic-uncertainty)).
- **MP.0 part.** *Hermitian oscillator normalizations proof/signature boundary.* The γ_V=−1 assertion for the specific nonsplit Hermitian datum in Li–Zhang Lemma6.3.1 and Zhang’s Deligne epsilon-factor input need original proof closure. General Fourier theory stays with AL.0/AL.2. (needed by [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations)).
- **MP.0 part.** *Adelic metaplectic cover proof/signature boundary.* Native restricted-product topology and quotient-group instances must be instantiated with AA.1; the topological cocycle charts are not supplied by a bare algebraic FactorSet. (needed by [`MP.4/adelic-metaplectic-cover`](#n-mp-4-adelic-metaplectic-cover)).
- **MP.0 part.** *Weil product formula proof/signature boundary.* The oscillatory-distribution version of AL.0 Poisson and its finite-dimensional self-dual normalization remain a Part-II request. (needed by [`MP.4/global-weil-index-product`](#n-mp-4-global-weil-index-product)).
- **MP.0 part.** *Adelic Weil representation proof/signature boundary.* AL.0’s scalar adelic space needs the finite-dimensional/joint archimedean extension; the completion and continuous action comparison must be supplied. (needed by [`MP.4/adelic-weil-representation`](#n-mp-4-adelic-weil-representation)).
- **MP.0 part.** *Function-field metaplectic programme proof/signature boundary.* Metaplectic Satake/fusion, gerbe sheaves and modified excursion operators are a proposed upstream Part-II request; §14 does not establish all of them. (needed by [`MP.4/function-field-metaplectic-programme`](#n-mp-4-function-field-metaplectic-programme)).
- **MP.0 part.** *Theta kernel proof/signature boundary.* The full finite-dimensional joint Schwartz lattice summability proof and native global function-space inclusion need the requested AL.0 extension. (needed by [`MP.5/theta-kernel`](#n-mp-5-theta-kernel)).
- **MP.0 part.** *Theta smoothness and growth transfer proof/signature boundary.* Weil’s cited continuity proof alone does not prove uniform moderate growth. The differentiated lattice majorant and finite-cover height comparison are explicit missing proof steps, requested from AA.3/AF.2 with an MP-specific transfer. (needed by [`MP.5/theta-growth-transfer`](#n-mp-5-theta-growth-transfer)).
- **MP.0 part.** *Genuine automorphic spaces proof/signature boundary.* AF.1–3 do not themselves define a cover automorphic space. Native smooth/globalized function carriers and the finite-cover comparison remain required signatures; they are not replaced by arbitrary Prop fields. (needed by [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces)).
- **MP.0 part.** *Unipotent splittings proof/signature boundary.* The complete root-relation proof and native rational-unipotent carrier are supplier/gap inputs; the Siegel formula alone is not a proof for every U. (needed by [`MP.5/unipotent-splitting`](#n-mp-5-unipotent-splitting)).
- **MP.0 part.** *Metaplectic constant terms and Whittaker coefficients proof/signature boundary.* Native unipotent quotient integration and Fourier-completeness topology must be instantiated from AA/AL; the module-level averaging prototype does not establish smooth cover expansions. (needed by [`MP.5/metaplectic-constant-and-whittaker`](#n-mp-5-metaplectic-constant-and-whittaker)).
- **MP.0 part.** *Global theta lift proof/signature boundary.* The source-qualified cuspidal growth/decay transfer and actual global automorphic module carrier must be completed; a totalized integral alone does not satisfy the convergence contract. (needed by [`MP.5/global-theta-lift`](#n-mp-5-global-theta-lift)).
- **MP.0 part.** *Weil convergence criterion proof/signature boundary.* The original convergence proof referenced by GQT is not fully read; its finite-cover/reduction comparison is retained as a proof gap. (needed by [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence)).
- **MP.0 part.** *Regularized theta integral proof/signature boundary.* Regularizer existence, independence and operator eigenvalue proofs need their original sources; the native meromorphic family and normalized Eisenstein carrier are AS requests with an MP adaptation. (needed by [`MP.5/regularized-theta-integral`](#n-mp-5-regularized-theta-integral)).
- **MP.0 part.** *Extended Schwartz Weil action proof/signature boundary.* The complete YZZ/Waldspurger extended-action reference is unread; its native carrier and operator comparison are an explicit missing input. (needed by [`MP.5/extended-schwartz-weil`](#n-mp-5-extended-schwartz-weil)).
- **MP.0 part.** *Unit-quotiented theta series proof/signature boundary.* The unit/Gaussian convergence argument and full extended rational-action comparison need a native finite-dimensional implementation and the unread extended-action source. (needed by [`MP.5/unit-quotiented-theta`](#n-mp-5-unit-quotiented-theta)).
- **MP.0 part.** *Extended restriction comparison proof/signature boundary.* The abbreviated restriction formula suppresses splitting-character data. The generator comparison and exact source convention must be reconciled; only the matching-character version is targeted without an extra ratio. (needed by [`MP.5/extended-restriction-comparison`](#n-mp-5-extended-restriction-comparison)).
- **MP.0 part.** *Theta measure conventions proof/signature boundary.* AA.2 supplies connected algebraic groups. Its Part-II disconnected orthogonal component normalization and the exact GQT measure comparison are requested, not inferred. (needed by [`MP.6/theta-measure-normalizations`](#n-mp-6-theta-measure-normalizations)).
- **MP.0 part.** *Siegel–Weil section proof/signature boundary.* Native degenerate induction, flat sections and meromorphic cover Eisenstein families are AS/SR supplier requests; evaluation on actual function spaces is prototyped without inventing those analytic carriers. (needed by [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section)).
- **MP.0 part.** *Ikeda map proof/signature boundary.* The finite-dimensional Schwartz integration carrier and exact equivariance proof must be supplied by the AL extension and GQT source comparison. (needed by [`MP.6/ikeda-map`](#n-mp-6-ikeda-map)).
- **MP.0 part.** *Anisotropic Siegel–Weil formula proof/signature boundary.* The original anisotropic identity and exact constant proof are cited by GQT but not fully read; the scalar must be rechecked against the adopted normalized I convention. (needed by [`MP.6/anisotropic-siegel-weil`](#n-mp-6-anisotropic-siegel-weil)).
- **MP.0 part.** *Regularized first-term identity proof/signature boundary.* The first-term identity proof inputs and the exceptional boundary calculation require their referenced original proofs; all ranges and coefficient conventions are retained for review. (needed by [`MP.6/first-term-identity`](#n-mp-6-first-term-identity)).
- **MP.0 part.** *Regularized second-term identity proof/signature boundary.* The induction and constant-term proof continuation after the read statements is not fully checked. The exact κ_{r,r′} evaluation and quotient carrier remain implementation/review work. (needed by [`MP.6/second-term-identity`](#n-mp-6-second-term-identity)).
- **MP.0 part.** *Coherent and incoherent sections proof/signature boundary.* Quadratic coherence uses GlobalQuadraticForms Layers3,7,8, not QFI6C alone: its exact global invariant carrier, small-rank realization conditions and form-level localization isometries are required. The global Hermitian classification and the incoherent functional-equation comparison still need separate source-qualified extensions with their arithmetic and AS owners. No arithmetic derivative identity is asserted here. (needed by [`MP.6/coherent-incoherent-sections`](#n-mp-6-coherent-incoherent-sections)).
- **MP.0 part.** *Unitary Siegel–Weil measure proof/signature boundary.* The referenced LL21 local identity proof is unread; its rational Haar scalar and native orbital-integral carrier remain precise supplier/proof inputs. (needed by [`MP.6/unitary-siegel-weil-measure`](#n-mp-6-unitary-siegel-weil-measure)).
- **MP.0 part.** *Unitary theta coherence parity proof/signature boundary.* The exact global Hermitian existence theorem needs a separate source-qualified Hermitian supplier (not QFI6C or GlobalQuadraticForms); the native local invariant carrier is a QFI Part-II adapter request; no arithmetic height assertion is part of this node. (needed by [`MP.6/pi-coherence-parity`](#n-mp-6-pi-coherence-parity)).
- **MP.0 part.** *Doubling Schwartz map proof/signature boundary.* The exact partial Fourier kernel and native completed/joint tensor comparison remain a finite-dimensional AL Part-II input. (needed by [`MP.6/doubling-schwartz-map`](#n-mp-6-doubling-schwartz-map)).
- **MP.0 part.** *Local doubling zeta integral proof/signature boundary.* The original PSR/Yamana local doubling theorem and ramified test-vector calculation are unread proof inputs; AL owns local L-factors, not this integral’s automatic normalization. (needed by [`MP.6/local-doubling-integral`](#n-mp-6-local-doubling-integral)).
- **MP.0 part.** *Factorization of theta pairings proof/signature boundary.* The complete unfolding proof and each ramified integral comparison require their original sources and native restricted quotient integration. (needed by [`MP.6/theta-integral-factorization`](#n-mp-6-theta-integral-factorization)).
- **MP.0 part.** *Rallis inner product formula proof/signature boundary.* The referenced Yamana/PSR proof, holomorphy criterion and exact Val interpretation are not fully read; statement and ranges are checked but the proof chain remains open. (needed by [`MP.6/rallis-inner-product`](#n-mp-6-rallis-inner-product)).
- **MP.0 part.** *Global theta nonvanishing criterion proof/signature boundary.* The cited real induced-module diagrams and original local comparison proofs are unread; Conjecture11.5 is not used as a theorem. The target preserves Proposition11.6/Theorem11.7’s restricted hypotheses. (needed by [`MP.6/global-theta-nonvanishing`](#n-mp-6-global-theta-nonvanishing)).
- **MP.0 part.** *Global see-saw and spectral projection proof/signature boundary.* The full global see-saw/projection proof and regularized analogue are source/spectral gaps; IP’s checked constructions provide only the stated specialized compatibility route. (needed by [`MP.6/global-see-saw-and-projection`](#n-mp-6-global-see-saw-and-projection)).
- **MP.0 part.** *Jacobi group proof/signature boundary.* The topological semidirect-product and actual smooth representation instances must be elaborated; positive similitude transport is a comparison with MP.8, not a new fixed-index action. (needed by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group)).
- **MP.0 part.** *Jacobi spaces proof/signature boundary.* The common smooth section and holomorphic Jacobi carrier is not yet present. The MP.8 specialization imports MP.6; its statement is used as a consumer contract, not as a circular proof of this definition. (needed by [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces)).
- **MP.0 part.** *Fourier–Jacobi extraction proof/signature boundary.* The exact unipotent/center quotient and weight-section carrier need supplier elaboration; genus-two half-integral Fourier matrices are already owned by MP.8. (needed by [`MP.6/fourier-jacobi-extraction`](#n-mp-6-fourier-jacobi-extraction)).
- **MP.0 part.** *Jacobi theta decomposition interface proof/signature boundary.* The generic lattice theta-decomposition proof/carrier remains open. MP.8 depends on the common MP.6 interface; cross-references record the specialization contract rather than a closed cyclic proof. (needed by [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface)).
- **MP.0 part.** *Ideal-class theta series proof/signature boundary.* Native ideal-class count/norm-lattice equivalence and normal convergence are GN/AL supplier inputs; no unary jacobiTheta theorem is substituted for this binary theta object. (needed by [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta)).
- **MP.0 part.** *Ideal-class theta modularity proof/signature boundary.* Hecke/Schoeneberg’s original all-discriminant modularity proof is not read; GZ quotes it. Its exact classical modular-form carrier and cusp comparison remain requested. (needed by [`MP.5/ideal-class-theta-modularity`](#n-mp-5-ideal-class-theta-modularity)).
- **MP.0 part.** *Ideal-lattice Poisson comparison proof/signature boundary.* The finite-dimensional complex Gaussian Fourier/covolume comparison is an AL Part-II input; ideal trace-duality belongs to GN.3. (needed by [`MP.6/ideal-lattice-poisson`](#n-mp-6-ideal-lattice-poisson)).
- **MP.0 part.** *Ideal-class theta transformation proof/signature boundary.* The finite Gauss-sum proof needs the exact quadratic-character supplier; the visually read statement and its odd-D hypothesis are retained without claiming the full computation is implemented. (needed by [`MP.5/ideal-class-theta-general-transform`](#n-mp-5-ideal-class-theta-general-transform)).
- **MP.0 part.** *Weight-one-half Maass space proof/signature boundary.* The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field. (needed by [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space)).
- **MP.0 part.** *Completed half-weight Eisenstein family proof/signature boundary.* The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field. (needed by [`MP.7/half-weight-eisenstein`](#n-mp-7-half-weight-eisenstein)).
- **MP.0 part.** *Plus projection and old normalization bridge proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/plus-projection`](#n-mp-7-plus-projection)).
- **MP.0 part.** *Half-weight resolvent kernel proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/half-weight-resolvent`](#n-mp-7-half-weight-resolvent)).
- **MP.0 part.** *Half-weight Poincaré family proof/signature boundary.* The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field. (needed by [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare)).
- **MP.0 part.** *Half-weight Poincaré residues proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/poincare-residues`](#n-mp-7-poincare-residues)).
- **MP.0 part.** *Plus Bessel coefficient family proof/signature boundary.* The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field. (needed by [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient)).
- **MP.0 part.** *Plus coefficient residue theorem proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/plus-coefficient-residue`](#n-mp-7-plus-coefficient-residue)).
- **MP.0 part.** *Kohnen–Salié divisor identity proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/kohnen-salie-identity`](#n-mp-7-kohnen-salie-identity)).
- **MP.0 part.** *Plus Hecke eigenbasis proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis)).
- **MP.0 part.** *Shimura lift from an eigenline proof/signature boundary.* The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field. (needed by [`MP.7/shimura-eigenline-lift`](#n-mp-7-shimura-eigenline-lift)).
- **MP.0 part.** *Shimura bijection of eigenlines proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/shimura-eigenline-bijection`](#n-mp-7-shimura-eigenline-bijection)).
- **MP.0 part.** *Duke coefficient estimate with spectral factor proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/duke-coefficient-bound`](#n-mp-7-duke-coefficient-bound)).
- **MP.0 part.** *Fourier expansion and residues of the weight-1/2 resolvent (Fay, cited) proof/signature boundary.* The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure. (needed by [`MP.7/resolvent-fourier-comparison`](#n-mp-7-resolvent-fourier-comparison)).
- **MP.0 part.** *Geometric trace proof/signature boundary.* The actual arithmetic cycle, genus character and differentiable Maass carriers are GN/AS inputs. Generic geometric construction and the Stokes core remain with their owners. (needed by [`MP.7/geometric-trace`](#n-mp-7-geometric-trace)).
- **MP.0 part.** *Biró lift proof/signature boundary.* The intervening kernel proof and cited Iwaniec/Whittaker theorems are not fully read. The checked theorem and finite Fourier argument are retained; the false one-point convergence sentence is corrected explicitly. (needed by [`MP.7/biro-shintani-lift`](#n-mp-7-biro-shintani-lift)).
- **MP.0 part.** *Adelic and classical half-weight comparison proof/signature boundary.* The full adelization equivalence and metaplectic Hecke comparison need an exact original proof source. QM.3 owns the holomorphic-weight Laplacian; its concrete conjugacy, not an identical formula, supplies this comparison. (needed by [`MP.7/adelic-classical-half-weight`](#n-mp-7-adelic-classical-half-weight)).
- **MP.0 part.** *BFH metaplectic kernel interface proof/signature boundary.* BFH proofs after printed553 and its local Whittaker/Euler computations have no newly checked proof in this revision. They are supplied as planned MP.8 nodes with their own open proof gates, not promoted to checked results. (needed by [`MP.7/bfh-kernel-import`](#n-mp-7-bfh-kernel-import)).
- **MP.0 part.** *Ramified quadratic-twist kernel inputs proof/signature boundary.* FH95 full public mathematical text was not obtained: only the publisher metadata was read. Its exact kernel/ramified-local adapter remains to be stated after acquisition. This records the missing MP.7 target explicitly instead of claiming the BFH family proves it. (needed by [`MP.7/ramified-quadratic-twist-kernel-inputs`](#n-mp-7-ramified-quadratic-twist-kernel-inputs)).
- **MP.0 part.** *Genuine Eisenstein families proof/signature boundary.* General covered parabolic induction, convergence and normalized meromorphic intertwiners require source-qualified SR/AS extensions. GQT’s Siegel example does not close a general cover Langlands theorem. (needed by [`MP.5/genuine-eisenstein-family`](#n-mp-5-genuine-eisenstein-family)).
- **MP.0 part.** *Toric theta pairing interface proof/signature boundary.* YZZ’s 6 November 2011 author draft §§2.2–2.4 pp.48–55 was reported read in the earlier source pass: it gives the nonsplit Shimizu contraction, toric unfolding and normalization, but sends the split quaternion case to Waldspurger’s different argument without Siegel–Weil. The original split proof and its exact normalized local/global contraction are still required. A source-qualified regularized replacement would instead have to identify the GQT quotient terms with the actual cuspidal pairing and justify every residual/projection term. MP.6 supplies that analytic adapter, never the downstream GZ.5 special-value theorem; native carriers and ramified/source-proof closure remain open. (needed by [`MP.6/toric-theta-pairing-interface`](#n-mp-6-toric-theta-pairing-interface)).
- **MP.0 part.** *Archimedean Howe duality original-source and category boundary.* Gan–Ichino18 and Gan–Savin23 invoke classical Howe duality. Their invocation is read; Howe’s archimedean original proof and its Harish-Chandra/globalization comparison have not been read here. Supply the full real/complex theorem with exact categories before closing this node. (needed by [`MP.3/howe-duality`](#n-mp-3-howe-duality)).
- **MP.0 part.** *Biró trace identity and general-level automorphy.* Supply the source Lemma10 and equation(14) (Biró printed128–129, PDF26–27), including the Kuznetsov/special-function convergence argument, actual genus-weighted traces and V*_{1/2}(4N)→Γ₀(N) spaces. Finite coefficient separation proves automorphy only after this identity; an unnamed identity183 or a nonexistent source theta kernel cannot supply it. (needed by [`MP.7/finite-fourier-automorphy`](#n-mp-7-finite-fourier-automorphy), [`MP.7/biro-shintani-lift`](#n-mp-7-biro-shintani-lift), [`MP.7/shimura-eigenline-lift`](#n-mp-7-shimura-eigenline-lift)).
- **MP.0 part.** *Arithmetic supplier routing and broad GN stage feedback.* Whole GN.2/3 prerequisite edges have been removed from the MP consumers. GN.3/theta-lattice-coefficient-interface imports MP.5 and cannot supply MP’s arithmetic input. The current GN.2/3 nodes supply integral lattices, Hermitian densities and mass, not binary genus characters, ideal-class/norm/trace-dual arithmetic or CM/oriented-cycle dictionaries. An independent arithmetic PartII extension must provide these exact outputs before the consumers can close. (needed by [`MP.5/unit-quotiented-theta`](#n-mp-5-unit-quotiented-theta), [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta), [`MP.5/ideal-class-theta-modularity`](#n-mp-5-ideal-class-theta-modularity), [`MP.5/ideal-class-theta-conjugation`](#n-mp-5-ideal-class-theta-conjugation), [`MP.6/ideal-lattice-poisson`](#n-mp-6-ideal-lattice-poisson), [`MP.5/ideal-class-theta-general-transform`](#n-mp-5-ideal-class-theta-general-transform), [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum), [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding), [`MP.7/cm-poincare-sum`](#n-mp-7-cm-poincare-sum), [`MP.7/positive-cycle-poincare-sum`](#n-mp-7-positive-cycle-poincare-sum), [`MP.7/positive-factor-trace`](#n-mp-7-positive-factor-trace), [`MP.7/cm-trace`](#n-mp-7-cm-trace), [`MP.7/geometric-trace`](#n-mp-7-geometric-trace)).
- **MP.0 part.** *Friedberg–Hoffstein adapter without the BSD consumer.* Removed BSD.2 as a prerequisite and request: RankZeroOneBSD--BSD.0.json, BSD.2/twist-series-residue imports MP.7 and MP.8, so importing the whole BSD.2 stage back into the MP.7 kernel interface creates feedback. The separate original FH95 kernel, level/character restrictions and ramified/dyadic comparison are still unread/unavailable in this packet. Establish that analytic adapter from the original source and route its own independent supplier; BSD.2 remains the owner of continuation/residue/positivity and nonvanishing. (needed by [`MP.7/ramified-quadratic-twist-kernel-inputs`](#n-mp-7-ramified-quadratic-twist-kernel-inputs)).
- **MP.0 part.** *Torus orbit dictionary before the Waldspurger consumer.* Removed GZ.5 as a prerequisite and request: this node explicitly exports the normalized pairing to the Waldspurger owner, so the consumer period identity cannot justify its input. Supply the precise norm-torus orbit/character dictionary independently (with arithmetic and AA quotient/measure owners), including ramified factors and absolute integrability on both quotients. Do not move the Waldspurger special-value theorem into MP.6. (needed by [`MP.6/toric-theta-pairing-interface`](#n-mp-6-toric-theta-pairing-interface)).
- **MP.0 part.** *Special-function uniformity beyond the exact carriers.* The broad QM.2 imports are replaced by its existing I/J nodes and AS.0/dit-112 for Whittaker M/W. The three fine-node requests retain the missing complex-order uniform differentiated bounds and continued exceptional-parameter domains. Neither a real-order I estimate nor a fixed-parameter Whittaker asymptotic proves these uniform estimates. (needed by [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient), [`MP.7/negative-cycle-poincare-sum`](#n-mp-7-negative-cycle-poincare-sum), [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare), [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion)).
- **MP.0 part.** *Classical and unitary Jacobi consumer contracts.* QM.1’s request to MP.6, items(a)–(e), is binding: the discrete J_n(Γ) and Heisenberg-center bridge; matrix-index slash action; typus(Γ,V) and Fourier cusp support; half-integral scalar index through central characters or z↦2z; the elliptic-function theta decomposition and Skoruppa Theorem5, with the dual finite Weil module and finite-image hypothesis. The existing four adelic integral-index contracts do not yet supply these outputs, so QM.1’s eight stage prerequisites remain. Also extract the unitary Jacobi/Schrödinger–Weil and Fourier–Jacobi instance needed by AutomorphicCongruences:L2s, with its unitary splitting, coefficient/index and multiplier conventions. No use by L2 itself has been established, and no L2 edge is added. BFH genus-two and QM classical q-series specializations retain their owners. (needed by [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces), [`MP.6/fourier-jacobi-extraction`](#n-mp-6-fourier-jacobi-extraction), [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface)).
- **MP.0 part.** *Topological Heisenberg extension actual carrier and prototype scope.* The native extension receives the product topology. Joint continuity of the isometry evaluation is an explicit hypothesis, rather than a consequence of algebraic isometries. Native closed-embedding and open-projection tests concern this product topology. Their finite-dimensional local-field specialization still requires the requested topological suppliers. (needed by [`MP.0/topological-heisenberg`](#n-mp-0-topological-heisenberg)).
- **MP.0 part.** *Induced and coordinate Schrödinger models actual carrier and prototype scope.* Emitted: evaluation at the section, explicit central covariance, and the coordinate translation computed from the same Schrödinger formula. The inverse is no longer paired with an independently chosen translation. Missing: local smoothness and compact support modulo the polarization subgroup, and identification with SR.2 compact induction. The rational half-argument test is an obstruction fragment; it is not a Q₂ conductor theorem. (needed by [`MP.0/induced-schroedinger`](#n-mp-0-induced-schroedinger)).
- **MP.0 part.** *Orthogonal–symplectic dual pair actual carrier and prototype scope.* Emitted: native tensor bilinear form, commuting isometry actions and scalar kernel with both tensor factors nonzero. The zero-factor test deliberately allows a larger kernel. Missing: identification of nondegenerate symmetric/alternating forms with the source classical dual pair and its pulled-back cover. (needed by [`MP.3/orthogonal-symplectic-dual-pair`](#n-mp-3-orthogonal-symplectic-dual-pair)).
- **MP.0 part.** *Cover over orthogonal–symplectic pairs actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The scalar cover pulls back to O(V)×Sp(W). O(V) has the Schrödinger splitting h↦[φ(x)↦φ(h⁻¹x)]. The restriction over Sp(W) of the μ₂ cover is trivial when m=dim V is even and is the metaplectic cover of W when m is odd. The tensor Weil representation consequently descends to O(V)×Sp(W) for even m and is genuine on O(V)×Mp(W) for odd m. (needed by [`MP.3/orthogonal-cover-restriction`](#n-mp-3-orthogonal-cover-restriction)).
- **MP.0 part.** *Big theta module actual carrier and prototype scope.* Emitted: native algebraic tensor coinvariants and invariant-map universal property. H-equivariance now requires commuting G,H actions. Missing: SR.3 smooth dual and admissibility, the actual maximal π-isotypic quotient and smooth tensor–Hom adjunction. The algebraic universal map is recorded separately from the full source Hom identity. (needed by [`MP.3/big-theta-module`](#n-mp-3-big-theta-module)).
- **MP.0 part.** *Small theta quotient actual carrier and prototype scope.* Emitted: quotient by a specified native submodule and its quotient-map universal property, including zero and simple-quotient fragments. Missing: construction of the actual maximal semisimple quotient in the finite-length smooth category and identification of its radical. No semisimplicity assertion survives for an arbitrary submodule. (needed by [`MP.3/small-theta-module`](#n-mp-3-small-theta-module)).
- **MP.0 part.** *Persistence and stable range actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: In a fixed orthogonal Witt tower V_r=V_0⊕H^r paired with Sp(W), dim W=2n, a nonzero theta lift persists for larger r. Every irreducible admissible genuine π has nonzero theta lift in stable range r≥2n; in the reverse direction a fixed O(V)-representation has nonzero lift when n≥dim V. These are sufficient bounds, not minimal first-occurrence formulas. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3. (needed by [`MP.3/persistence-and-stable-range`](#n-mp-3-persistence-and-stable-range)).
- **MP.0 part.** *First occurrence in a Witt tower actual carrier and prototype scope.* Emitted: least nonzero rank in WithTop ℕ, vanishing below it and conversion to anisotropic dimension plus twice the rank. These statements work for a supplied family; persistence and existence of a nonzero tower member are separate source theorems. (needed by [`MP.3/first-occurrence`](#n-mp-3-first-occurrence)).
- **MP.0 part.** *Supercuspidal first occurrence actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a supercuspidal π in Kudla’s nonarchimedean orthogonal–symplectic range, let r₀ (respectively n₀ in the reverse direction) be first occurrence. At every larger rank the big lift is irreducible admissible and equals the small lift. At first occurrence it is supercuspidal; above first occurrence it is not supercuspidal and embeds in the normalized parabolic induction of the first lift with the explicit tower characters of III.6 Theorems6.1–6.2. Do not extend this big=small assertion to arbitrary nonsupercuspidal π. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3. (needed by [`MP.3/supercuspidal-first-occurrence`](#n-mp-3-supercuspidal-first-occurrence)).
- **MP.0 part.** *Kudla’s Jacquet filtration actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For Q(X_a)⊂G(W_n), the normalized Jacquet module of ω has a finite filtration with kth quotient, 0≤k≤min(a,q_V), equal to normalized induction from Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k) of χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}. Here s_{m,n}=(m−n−ε₀)/2 and (b,c) acts on f(g) by χV(det b)χW(det c)f(c⁻¹gb). Supplier categories: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3. (needed by [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration)).
- **MP.0 part.** *Doubling principal-series filtration actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s, its restriction to G(W)×G(W) has rank-t quotients induced from Q_t×Q_t with characters χV|det X_t|^{s+t/2} on both GL_t factors and χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t})) on the remaining factors. The open-orbit quotient R_0=χV(det W⁻)⊗Cc∞G(W) is independent of s. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3. (needed by [`MP.3/doubling-filtration`](#n-mp-3-doubling-filtration)).
- **MP.0 part.** *Nonarchimedean conservation relations actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}. Here d is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic U. In particular an Sp_{2n} representation in the two even-orthogonal towers has dimension sum 4n+4, and for O(V) the symplectic rank indices of π and π⊗det sum dim V. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3. (needed by [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation)).
- **MP.0 part.** *Scalar ambiguity and composition of intertwiners actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For each g∈Sp(W), the smooth intertwiner space between ρ and its g-twist is a one-dimensional C vector space; its nonzero operators are invertible. Choosing A_g with A_1=1 yields A_gA_h=c(g,h)A_{gh}, where c is a normalized scalar factor set. Rescaling A_g by b(g) changes c by b(g)b(h)/b(gh). If the chosen A_g are unitary operators, the resulting cocycle scalars have norm one; arbitrary nonzero intertwiners need not have that normalization. (needed by [`MP.1/intertwiner-lines`](#n-mp-1-intertwiner-lines)).
- **MP.0 part.** *Weil index and Hilbert symbol actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with γψ(−q)=γψ(q)⁻¹. For η=ψ/2 define γ(a,η)=γ(η a x²)/γ(η x²). Then γ(ab,η)=(a,b)F γ(a,η)γ(b,η), γ(a,ηb)=(a,b)F γ(a,η), γ(a,η)²=(−1,a)F and γ(a,η)⁴=1. If q=Σa_ix_i², γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F; det q means ∏a_i, not det Bq=2^d∏a_i. (needed by [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities)).
- **MP.0 part.** *Genuine Weil representation actual carrier and prototype scope.* Emitted: restriction of the supplied unitary normalizer action to ker lambda2 and its identity test. Missing: identification of the distinguished central −1, its action on the actual nonzero oscillator, zero-dimensional sign carrier and model-change intertwiner. An arbitrary element z, particularly z=1, cannot be assigned action −id. (needed by [`MP.1/genuine-oscillator`](#n-mp-1-genuine-oscillator)).
- **MP.0 part.** *Weil operators on generators actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy r(m(a))φ(x)=|det a|^{1/2}φ(xa), r(n(b))φ(x)=ψ(½x bᵗx)φ(x), and r(w) is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is εβ(g)r(g), hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space V of dimension m, ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa), ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x), and ω(w)φ=γ(ψ∘V)^{−n} times the negative-kernel Fourier transform for Kudla’s w. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion. (needed by [`MP.2/generator-operators`](#n-mp-2-generator-operators)).
- **MP.0 part.** *Character change and dual Weil models actual carrier and prototype scope.* Emitted: unit identities showing tensor weight 2−2=0 after λ₂⁻¹ and dual weight −1+2=1 after λ₂. Missing: the actual λ-character, representation tensor/dual objects and their smooth category comparisons; the unit identities alone are not those equivalences. (needed by [`MP.2/character-and-dual`](#n-mp-2-character-and-dual)).
- **MP.0 part.** *First doubled quaternionic splitting actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: On U(V⊕V⁻), ŝ₁ is1 for split B and (−1)^j on a Bruhat stratum for division B. It cancels z_{V△}, is invariant under E× conjugation, and on the norm-one scalar embedding α has value1 if α=1 and (−1)^m otherwise in the division case. (needed by [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting)).
- **MP.0 part.** *Second doubled quaternionic splitting actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For the doubled unitary W-model, ŝ₂(h)=χ(x(h))^mγ^{−j(h)}, γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}. It is invariant under E× conjugation. The diagonal norm-one scalar gives χ(α)^{−2m}; the mixed embedding of A.7 gives χ(α)^{−m} times1 for split B and (−1)^m for division B. (needed by [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting)).
- **MP.0 part.** *Sharp splitting and norm-one descent actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: On G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}, set ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹,1))ŝ₂(ι(hα⁻¹,1))z_{V△}(ι(gα⁻¹,1),ι(hα⁻¹,1)). Define μ(σ)=z_{Y□}(σ₀,σ)⁻¹z_{Y□}(σ₀σσ₀⁻¹,σ₀), so z_{Y□}=z_{V△}δμ. Put s^sharp=ŝ^sharp·μ and s₂=ŝ₂·μ on their respective embedded groups. Descend s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α])). LemmaA.10 proves independence of the norm lift using LemmaA.9; LemmaA.12 cancels auxiliary χ. (needed by [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent)).
- **MP.0 part.** *First scalar splitting calculation actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For α=a+bi with a,b≠0, tilde s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F; ŝ₂(ι([α,α],1))=χ(α)⁻²(u,J₁)_F; μ on that matrix is γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F. Together these give s=tilde s on the first E× embedding. (needed by [`MP.3/periods-i-first-scalar-calculation`](#n-mp-3-periods-i-first-scalar-calculation)).
- **MP.0 part.** *Second scalar splitting calculation actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For α=a+bi with a,b≠0, tilde s(α,α⁻¹,1)=γ_F(J,ψ/2)(−2abJ₁,J)_F; ŝ₁(ι([α,α⁻¹],1))=(u,J)_F; μ is γ_F(J,ψ/2)(−2abuJ₁,J)_F. Together these give s=tilde s on the second E× embedding. (needed by [`MP.3/periods-i-second-scalar-calculation`](#n-mp-3-periods-i-second-scalar-calculation)).
- **MP.0 part.** *Square quaternion splitting calculation actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: When J_i=t_i², the normalized generators j_i^natural=j_i/t_i have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11). (needed by [`MP.3/periods-i-square-quaternion-calculation`](#n-mp-3-periods-i-square-quaternion-calculation)).
- **MP.0 part.** *Harris–Kudla splitting comparison actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For split B and idempotent e, V^dagger=Ve and W^dagger=eW have dimensions2m and2; V^dagger has symmetric diagonal (κ_i u/2,−κ_i/2). Set s^dagger(h)=ξE(x(h))^m(γ′)^{−j(h)}, γ′=γ_F(ψ/2)^{2m}γ_F(det V^dagger,ψ/2)Hasse(V^dagger). Extend to similitudes by h↦h d(ν(h))⁻¹. The polarization correction gives s₀=s^daggerμ₀=s. (needed by [`MP.3/harris-kudla-morita-comparison`](#n-mp-3-harris-kudla-morita-comparison)).
- **MP.0 part.** *GL₂–GSO₄ theta correspondence actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For irreducible generic π of GL₂(F), the similitude theta lift of π∨ to GSO₄≃(GL₂×GL₂)/diagonal center is π⊗π, and theta back from π⊗π is π∨, in Gan–Savin Lemma13.2’s action convention. Supplier categories: SmoothRepresentationsOfLocalGroups:SR.3. (needed by [`MP.3/gl2-gso4-theta`](#n-mp-3-gl2-gso4-theta)).
- **MP.0 part.** *PGSp₆ theta dichotomy actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Every irreducible σ of PGSp₆(F) has nonzero theta lift to exactly one of PGO₈ and PGO_{5,1} in Gan–Savin’s two matched towers. Some representations already occur at PGO₆≃PGL₄⋊{±1}; first occurrence determines this case. (needed by [`MP.3/pgsp6-theta-dichotomy`](#n-mp-3-pgsp6-theta-dichotomy)).
- **MP.0 part.** *Rationality of local theta lifting actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For the same relevant π, let U_π be the finite-place set where π_v is not invariant under every similitude conjugation †a, a∈F_v×. Define Q_π by the open subgroup {a∈Zhat×:a_v∈N(E_v×) for every v∈U_π}. For σ∈Aut(C/Q_π), θ(σιπ_v)≃σθ(ιπ_v). The comparison changes ψ to ψ_a and π to π^{†a}; the norm/symmetry condition removes that change. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0. (needed by [`MP.3/theta-coefficient-rationality`](#n-mp-3-theta-coefficient-rationality)).
- **MP.0 part.** *Hermitian uncertainty principle actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a positive-dimensional nondegenerate Hermitian space V over E/F with conjugation c, set q(x)=½Tr_E/F⟨x,x⟩=⟨x,x⟩∈F. Use the Fourier kernel ψ(Tr_E/F⟨x,y⟩) and its self-dual measure. If supp φ⊆{x | val_F⟨x,x⟩>0} and supp φ̂⊆{x | val_F⟨x,x⟩≥0}, then φ=0 by the quadratic uncertainty principle. The half-trace form is the Hermitian norm, not its unscaled trace 2⟨x,x⟩. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion. (needed by [`MP.2/hermitian-uncertainty`](#n-mp-2-hermitian-uncertainty)).
- **MP.0 part.** *Unramified compact splittings actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a nonarchimedean odd-residue local field, conductor-zero ψ and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of Sp(W)(O) into Mp(W), fixing the lattice indicator in its Schrödinger model. For a global datum these conditions hold at all but finitely many places. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion. (needed by [`MP.4/unramified-compact-splittings`](#n-mp-4-unramified-compact-splittings)).
- **MP.0 part.** *Rational symplectic splitting actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The product formula gives a canonical homomorphism Sp(W)(F)→Mp(W)(A) splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization. Supplier categories: AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation. (needed by [`MP.4/rational-symplectic-splitting`](#n-mp-4-rational-symplectic-splitting)).
- **MP.0 part.** *Adelic choice compatibility actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing ψ to ψ_a, a∈F×, is the scaled rational datum and respects the product formula. (needed by [`MP.4/adelic-choice-compatibility`](#n-mp-4-adelic-choice-compatibility)).
- **MP.0 part.** *Finite Weil representation actual carrier and prototype scope.* Emitted: native T and S linear operators on D→ℂ, negative T exponent, positive S pairing exponent, specified phase/cardinality factor and T-conjugation tests. Missing: the nondegenerate finite quadratic module, source Weil phase, metaplectic presentation relations and the resulting full representation. The one-dimensional S test uses zero pairing and phase 1; unimodularity alone does not erase a signature phase. (needed by [`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation)).
- **MP.0 part.** *Norm-form theta integrals actual carrier and prototype scope.* Emitted: integer classification for n=1,m=2 or3,r=0 or1. Missing: binary norm/ternary trace-zero quadratic spaces, actual Haar/splitting adapters and ordinary/boundary/second-term coefficients. The split ternary identity is modulo the residual image; GZ.5 is a consumer, never a prerequisite. (needed by [`MP.6/quadratic-quaternionic-norm-instances`](#n-mp-6-quadratic-quaternionic-norm-instances)).
- **MP.0 part.** *Ideal-class theta conjugation actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For every ideal class A and n≥1, conjugation gives r_A(n)=r_{A⁻¹}(n), hence θ_A=θ_{A⁻¹}. For the ramified ideal d₁ in an odd-discriminant factorization, d₁²=(D₁), so its class D₁ has square1; consequently θ_{A⁻¹D₁⁻¹}=θ_{AD₁}. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.5/ideal-class-theta-conjugation`](#n-mp-5-ideal-class-theta-conjugation)).
- **MP.0 part.** *Theta multiplier actual carrier and prototype scope.* Emitted: the native Jacobi-theta quotient multiplier, nonvanishing/unit norm and shift/inversion/phase tests on Γ₀(4). Missing: identification with the adelic cover and supplier Whittaker/Fourier normalizations; no new theta function duplicates Mathlib. (needed by [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier)).
- **MP.0 part.** *Fundamental-discriminant Eisenstein coefficient actual carrier and prototype scope.* Emitted: the |d|^(-3/4)(4π)^(-1/4) coefficient prefactor and its product formula, with direct d=1,d=−3 and 2√π product tests. Missing: actual completed Dirichlet L-function, fundamental discriminant and parity Γ-factor identification; the omitted parity API cannot equate independently chosen functions. (needed by [`MP.7/fundamental-eisenstein-coefficient`](#n-mp-7-fundamental-eisenstein-coefficient)).
- **MP.0 part.** *Half-weight Eisenstein coefficient expansion actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: The nonconstant coefficients of E*_{1/2} are b(n,s), supported on n≡0,1 mod4. For fundamental d and m>0, mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s). (needed by [`MP.7/eisenstein-divisor-coefficients`](#n-mp-7-eisenstein-divisor-coefficients)).
- **MP.0 part.** *Eisenstein product normalization actual carrier and prototype scope.* Emitted: the exact prefactor product identity with d,d′ nonzero. At d=0 totalized negative powers vanish while arbitrary Λ(0,s) need not, so nonzero discriminants are mandatory. Source completed-L-function and Eisenstein identification remain separate. (needed by [`MP.7/eisenstein-product-normalization`](#n-mp-7-eisenstein-product-normalization)).
- **MP.0 part.** *Theta residue and Petersson normalization actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Res_{s=1}E*_{1/2}(z,s) = ½θ(z) (the pole comes from Λ(2−2s) in the constant term and from Λ(s,χ_1)=Λ(s) in the coefficients b(m²,s); checked). The paper states ⟨½θ,½θ⟩ = 6 citing [7], but with the paper's product ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ one has ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), hence ⟨½θ,½θ⟩ = π/2. The number 6 = [Γ:Γ_0(4)] is (3/π)⟨θ,θ⟩, i.e. ⟨θ,θ⟩ for the product normalized by area(Γ\H)=π/3. Rescaling F from ⟨F,F⟩=1 to ⟨F,F⟩=6 does turn 12 into 2 on the left of (5.16). The remark is heuristic and used in no proof. Supplier categories: AdelicAlgebraicGroups:AA.1, QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing. (needed by [`MP.7/theta-residue-normalization`](#n-mp-7-theta-residue-normalization)).
- **MP.0 part.** *Kohnen plus subspace actual carrier and prototype scope.* Emitted: the native intersection of forbidden coefficient kernels, membership and linear closure. Missing: its ambient cusp/eigen space and actual Hecke preservation, including the prime2 convention. Vanishing forbidden coefficients alone does not impose cuspidality. (needed by [`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space)).
- **MP.0 part.** *Plus projection operators actual carrier and prototype scope.* Emitted: native linear U,W and their specified WU combination on functions, explicit √2/order tests and its value on the constant function. Missing: actual Maass domain and operator relations proving orthogonal plus projection there. The constant-function value rules out treating this combination as idempotent on every function. (needed by [`MP.7/plus-operators`](#n-mp-7-plus-operators)).
- **MP.0 part.** *Half-weight Kloosterman sum actual carrier and prototype scope.* Emitted: finite sum over native ZMod units with epsilon phase, inverse-lift independence and c=4/period tests under stated κ values. Missing: the actual extended Kronecker symbol and required source modulus/discriminant identification. κ is a finite-sum input, not an arbitrary asserted arithmetic character. (needed by [`MP.7/half-weight-kloosterman`](#n-mp-7-half-weight-kloosterman)).
- **MP.0 part.** *Modified plus Kloosterman sum actual carrier and prototype scope.* Emitted: exact dyadic scalar multiple and concrete c=4 values under the specified κ values. Missing: actual Kronecker data proving reality and symmetry in the source range; those assertions have been omitted for arbitrary κ. (needed by [`MP.7/plus-kloosterman`](#n-mp-7-plus-kloosterman)).
- **MP.0 part.** *Reality and symmetry of plus sums actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For c>0 with 4|c and all m,n∈ℤ, K⁺(m,n;c)=K⁺(n,m;c)=conj(K⁺(n,m;c)). This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5). (needed by [`MP.7/plus-kloosterman-symmetry`](#n-mp-7-plus-kloosterman-symmetry)).
- **MP.0 part.** *Projected Fourier expansion actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let Re(s)>1 and let d≠0 with d≡0,1 mod 4. Then pr⁺F_{1/2,d}(z,s)=(2/3)Γ(s−sgn(d)/4)/(4π|d|Γ(2s))·M_{sgn(d)/4,s−1/2}(4π|d|y)e(dx)+Σ_{n≡0,1(4),n≠0}Φ⁺(n,d;s)W_{sgn(n)/4,s−1/2}(4π|n|y)e(nx)+(a constant term that the paper does not display). Φ⁺ is given by (8.11). The paper's sum over n≡0,1(4) formally includes n=0, where W(4π|n|y) is meaningless. (needed by [`MP.7/projected-poincare-expansion`](#n-mp-7-projected-poincare-expansion)).
- **MP.0 part.** *Quadratic-root Weyl sum actual carrier and prototype scope.* Emitted: root-congruence finite sum, discriminant arithmetic and phase/range tests. Missing: an actual binary genus character with representative, reflection and scaling laws; evenness is not asserted for arbitrary χ. This is an independent GN PartII request, without a GN.2 stage input. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum)).
- **MP.0 part.** *Weight-two cycle unfolding actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let d be fundamental, d′,d<0, D=d′d nonsquare, and let φ be as in item 105. Put Φ_m(t)=−it∫_0^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ (9.3). For every m∈ℤ, Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ=ε·Σ_{0<c≡0(4)}S_m(d′,d;c)Φ_m(2√D/c). With this corrected −it kernel, ε=+1 when C_Q runs from z to γ_Qz (clockwise on S_Q for a>0, the C_A orientation of §2 under which Lemma5 holds), and ε=−1 for z→g_Qz=γ_Q⁻¹z (DIT11's counterclockwise orientation for a>0). The paper's printed +it kernel uses the opposite sign: its Lemma6 needs a leading minus for z→γ_Qz. Correcting the kernel and also inserting that minus would double-correct E28. Work in a proved convergence range (or with the weaker actual decay O(y^ε)); the printed stronger decay hypothesis is not inferred automatically for Re(s)>1. Supplier categories: AutomorphicSpectralTheory:AS.0. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding)).
- **MP.0 part.** *CM Poincaré sum actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For m≠0, Re(s)>1 and d′d=D<0, Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c). The square root is of |D|. Supplier categories: AutomorphicSpectralTheory:AS.0. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.7/cm-poincare-sum`](#n-mp-7-cm-poincare-sum)).
- **MP.0 part.** *Positive cycle Poincaré sum actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For m≠0, Re(s)>1 and d,d′>0, D nonsquare, Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s) times Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)J_{s−1/2}(4π|m|√D/c). Supplier categories: AutomorphicSpectralTheory:AS.0. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.7/positive-cycle-poincare-sum`](#n-mp-7-positive-cycle-poincare-sum)).
- **MP.0 part.** *Exact three-case Poincaré identity actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let m≠0 and Re(s)>1, let d be a fundamental discriminant and d′ a discriminant with D=d′d nonsquare. Then 6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²;s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q, where X_Q=2√πω_Q⁻¹F_m(z_Q,s) if d′d<0, X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz| if d′,d>0, and X_Q=∫_{C_Q}i∂_zF_m(z,s)dz if d′,d<0. In the third case C_Q runs from z to γ_Qz, as in item 109. (needed by [`MP.7/three-case-poincare-identity`](#n-mp-7-three-case-poincare-identity)).
- **MP.0 part.** *Shimura coefficient relation actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For m>0 and fundamental d, mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d). Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones. (needed by [`MP.7/shimura-coefficient-relation`](#n-mp-7-shimura-coefficient-relation)).
- **MP.0 part.** *Spectral substitution residue factor four actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Set w=s/2+1/4, s₀=1/2+ir and w₀=1/2+ir/2, r>0. Then Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)] for H with a simple pole at w₀. One factor2 is the derivative of the coordinate change, the other the linear spectral factor. (needed by [`MP.7/spectral-residue-substitution`](#n-mp-7-spectral-residue-substitution)).
- **MP.0 part.** *Spectral trace identity before multiplicity one actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Taking residues in119 and using93,100,122,123 yields 12√π|D|^(3/4)Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φa_φ(m)T(φ,χ), where T is ||φ||⁻² times the appropriate three-case geometric trace. Keep the finite eigenspace sums until the Shimura bijection is proved. Supplier categories: AutomorphicSpectralTheory:AS.0. (needed by [`MP.7/spectral-trace-identity`](#n-mp-7-spectral-trace-identity)).
- **MP.0 part.** *Automorphy of the Shimura series actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Use the family of trace identities and the Biró linear-independence argument to prove Shim(ψ) is an even level-one Hecke–Maass cusp form with eigenvalue1/4+r². Formal Fourier series with the right Euler factors alone do not imply automorphy. (needed by [`MP.7/shimura-series-automorphy`](#n-mp-7-shimura-series-automorphy)).
- **MP.0 part.** *Extended trace formula for all discriminants actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For a normalized even φ and a unit ψ on its corresponding plus eigenline, T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d)) for fundamental d, discriminant d′, D=d′d nonsquare. General negative D requires |D|^(3/4). (needed by [`MP.7/extended-shimura-trace`](#n-mp-7-extended-shimura-trace)).
- **MP.0 part.** *Theorem4 negative factors actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let φ(z)=2y^{1/2}Σ_{n≠0}a(n)K_{ir}(2π|n|y)e(nx) be an even Hecke–Maass cusp form for Γ=PSL(2,Z) with a(1)=1 and Laplace eigenvalue λ=1/4+r², and let F(z)=Σ_{n≡0,1 (mod 4), n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx) be the weight-1/2 form for Γ_0(4) of Theorem 4, with ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ=1 and b(dm²) given by m Σ_{n|m} n^{−3/2}(d/n) b(m²d/n²) = a(m)b(d) (F is unique only up to a unimodular constant). For coprime negative fundamental discriminants d′, d, D=d′d>0 and χ the genus character of D=d′d: 12√π D^{3/4} b(d′) conj(b(d)) = ⟨φ,φ⟩^{−1}(λ/2)Σ_{A∈Cl⁺(K)} χ(A)∫_{F_A}φ(z)dμ(z). (needed by [`MP.7/negative-factor-trace`](#n-mp-7-negative-factor-trace)).
- **MP.0 part.** *Theorem4 positive factors actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For coprime positive fundamental d,d′, 12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds, with the same normalized φ and unit half-weight eigenline. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.7/positive-factor-trace`](#n-mp-7-positive-factor-trace)).
- **MP.0 part.** *Theorem4 CM factors actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: For coprime fundamental d,d′ of opposite sign, 12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A). Keep both 2√π and ω_D; the paper explicitly corrects the earlier CM constant. Independent arithmetic outputs are requested as GN PartII; no whole GN.2/3 stage is a prerequisite. (needed by [`MP.7/cm-trace`](#n-mp-7-cm-trace)).
- **MP.0 part.** *Exact conjugation of the two U and W normalizations actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: On functions on H let C f(z)=Im(z)^(1/4)f(z), U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4), W₄f(z)=(2z/i)^(−1/2)f(−1/(4z)) with the principal square root. Then CU₄C⁻¹=U and CW₄C⁻¹=W for the U,W displayed in DIT16 p976, and C(U₄∘W₄)C⁻¹=U∘W. This calculation alone does not identify U∘W with W∘U on the automorphic subspace. (needed by [`MP.7/plus-normalization-conjugation`](#n-mp-7-plus-normalization-conjugation)).
- **MP.0 part.** *Positive Fourier kernel and orthogonal complement actual carrier and prototype scope.* Emitted: native coefficient-kernel intersection, finite-dimensional orthogonal complement and a zero-coefficient lift test. Missing: actual Fourier maps and source trace identity for automorphy. A nonzero invisible vector is permitted; vanishing positive coefficients does not assert vanishing negative coefficients. (needed by [`MP.7/positive-fourier-kernel`](#n-mp-7-positive-fourier-kernel)).
- **MP.0 part.** *Finite Fourier certificate with conjugated trace coefficients actual carrier and prototype scope.* Emitted: finite separation of the orthogonal complement by positive admissible coefficient coordinates under finite dimensionality and the stated common-kernel condition. Missing: identification of those maps with the source Fourier coefficients and the trace/analytic inputs for automorphy. (needed by [`MP.7/finite-fourier-certificate`](#n-mp-7-finite-fourier-certificate)).
- **MP.0 part.** *Coefficients of the weight-1/2 plus-space Eisenstein series (black box from [16]) actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: In the notation of DIT11 ([16]): for m∈Z⁺ and D a fundamental discriminant, Σ_{n|m}(D/n) b_0(Dm²/n², s) = 2^{2−4s}π^{s+1/4}m^{3/2−2s}|D|^{s−1/4}σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1), and b_0(0,s)=π^{1/2}2^{5/2−6s}Γ(2s)ζ(4s−2)/ζ(4s−1), where b_0(n,s) are the Fourier coefficients of P⁺_0(τ,s) in [16, (2.20)–(2.21)]. Consequently E*_{1/2}(z,s) = 2^sΛ(2s) y^{1/4} P⁺_0(z, s/2+1/4) has the expansion displayed on DIT16 p964, with b(d,s)=(4π)^{−1/4}|d|^{−3/4}Λ(s,χ_d) for fundamental d and the stated Shimura relation. (needed by [`MP.7/dit11-eisenstein-comparison`](#n-mp-7-dit11-eisenstein-comparison)).
- **MP.0 part.** *Shimura Dirichlet-series identity for ψ∈B_r actual carrier and prototype scope.* No target theorem is emitted against arbitrary independent data. Required source construction or proof input: Construct the source objects in the stated categories and identify the maps in the mathematical target: Let ψ∈B_r have coefficients b(n) as in (10.1), and let d be a fundamental discriminant. Then L_d(s+1/2)Σ_{n≥1}b(dn²)n^{1−s}=b(d)Π_p(1−a_ψ(p)p^{−s}+p^{−2s})⁻¹, where L_d(s)=L(s,χ_d)=Σ_{n≥1}(d/n)n^{−s} and a_ψ(p) is the T_{p²}-eigenvalue for odd p and the specified plus-space Hecke eigenvalue at p=2. Comparing coefficients gives mΣ_{n|m}n^{−3/2}(d/n)b(m²d/n²)=a_ψ(m)b(d) (item 122). (needed by [`MP.7/shimura-dirichlet-series`](#n-mp-7-shimura-dirichlet-series)).
- **MP.8 part.** *Rank-two adelic and similitude comparison.* The exact MP.4 rational/finite-place splitting and its extension to Qˣ similitudes have not been established here. Specify the finite theta lattice vector and dyadic compact-open lift at 8M|N, compare its real square-root multiplier including the J phase, and identify it with the MP.6 native Jacobi model. The real reflection extension is a chosen explicit extension, not evidence that an adelic GSp cover is canonically split. (needed by [`MP.8/arithmetic-adelic-comparison`](#n-mp-8-arithmetic-adelic-comparison), [`MP.8/similitude-heisenberg-comparison`](#n-mp-8-similitude-heisenberg-comparison), [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison)).
- **MP.8 part.** *Confluent Whittaker integral identities.* BFH pp.560–565 uses Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent Whittaker integral, its symmetry and gamma normalization. Those source entries have not been read. Establish their exact convergence domains, branch and continuation identity; retain the distinction between V holomorphy and gamma-normalized W meromorphy. (needed by [`MP.8/jacquet-r-reflection`](#n-mp-8-jacquet-r-reflection), [`MP.8/jacquet-weyl-reflection`](#n-mp-8-jacquet-weyl-reflection), [`MP.8/whittaker-continuation`](#n-mp-8-whittaker-continuation)).
- **MP.8 part.** *Compact convolution growth estimates.* BFH Propositions 3.5–3.6 invoke Jacquet–Piatetski-Shapiro–Shalika section 8.3.3 for compact-convolution nondegenerate rapid decay and the degenerate polynomial bound. That passage has not been inspected. Supply its representation, differentiation, uniform parameter and Sobolev hypotheses, including why W⁰ has only the asserted y₂ decay. (needed by [`MP.8/whittaker-rapid-decay`](#n-mp-8-whittaker-rapid-decay), [`MP.8/rotated-whittaker-bound`](#n-mp-8-rotated-whittaker-bound)).
- **MP.8 part.** *Primitive pair completion and rank-one normal form.* BFH p.577 cites Maass section 11 for completion of an integral primitive symmetric pair, and p.587 cites Maass p.160 for rank-one normal form. These passages are unread. The target includes full row rank and CDᵀ=DCᵀ, not CᵀD symmetry. Prove the integral completion and the exact congruence/coset reductions or verify those sources. (needed by [`MP.8/primitive-symplectic-pairs`](#n-mp-8-primitive-symplectic-pairs), [`MP.8/cusp-one-unfolding`](#n-mp-8-cusp-one-unfolding), [`MP.8/cusp-zero-rank-expansion`](#n-mp-8-cusp-zero-rank-expansion)).
- **MP.8 part.** *Degenerate Bessel formula and residue test.* BFH Inventiones Proposition 3.14 (pp.575–576) directs its omitted Bessel calculation to section 5 of the distinct BFH Annals 131 (1990), 53–127 paper, DOI 10.2307/1971508. Only that paper’s publisher metadata has been inspected. Read its formula, reconcile k,s,y₂ and measures with W⁰, and give the explicit finite K-type construction proving Proposition 3.15, whose proof Inventiones also omits. (needed by [`MP.8/degenerate-mellin-coefficients`](#n-mp-8-degenerate-mellin-coefficients), [`MP.8/local-test-nonzero-m`](#n-mp-8-local-test-nonzero-m)).
- **MP.8 part.** *Ramified opposite-cusp regularity.* The argument asserted and omitted at BFH p.589 must establish P(s,0,r) regular near 2 and polynomial coefficient growth for the actual ramified cusp data. Choose the independent arithmetic route: compute factors at p|N and show their denominators do not vanish at 2. Do not first derive P-regularity from E-regularity and then use P-regularity to prove E-regularity. (needed by [`MP.8/opposite-cusp-zero-regularity`](#n-mp-8-opposite-cusp-zero-regularity), [`MP.8/genuine-eisenstein-continuation`](#n-mp-8-genuine-eisenstein-continuation)).
- **MP.8 part.** *Cover-specific spectral adaptation and joint meromorphy.* BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input. (needed by [`MP.8/genuine-induced-comparison`](#n-mp-8-genuine-induced-comparison), [`MP.8/genuine-eisenstein-initial-convergence`](#n-mp-8-genuine-eisenstein-initial-convergence), [`MP.8/genuine-intertwining-operators`](#n-mp-8-genuine-intertwining-operators), [`MP.8/genuine-constant-term`](#n-mp-8-genuine-constant-term), [`MP.8/genuine-eisenstein-continuation`](#n-mp-8-genuine-eisenstein-continuation), [`MP.8/fourier-residue-interchanges`](#n-mp-8-fourier-residue-interchanges), [`MP.8/two-variable-polar-combination`](#n-mp-8-two-variable-polar-combination)).
- **MP.8 part.** *Global compact rotation and uniform majorant.* Repair the false published (3.31) global-to-chart equality: compute the residual compact transition on both signs of 1+zx₁, retain φ₁(q)=det(Im q) globally and show divisibility at the boundary. Prove a z-uniform integrable majorant for the actual kernel (3.38), including its prefactor, for compact s-sets in Re s>3/2. The rational coordinate map and signed determinant calculation alone do not prove the stated rotated bound or its subsequent continuation consequences. (needed by [`MP.8/rotated-whittaker-bound`](#n-mp-8-rotated-whittaker-bound), [`MP.8/novodvorsky-continuation`](#n-mp-8-novodvorsky-continuation), [`MP.8/local-test-nonzero-f`](#n-mp-8-local-test-nonzero-f), [`MP.8/local-test-nonzero-tau`](#n-mp-8-local-test-nonzero-tau)).
- **MP.8 part.** *Nonzero even Laplace pushforward.* For the rank-zero τ test, construct an actual finite K-coefficient with the prescribed SO(2) weight and global divisor whose even pushforward under z↦√(1+z²), including the branch/amplitude factors, is nonzero. Establish its weighted integrability before applying Laplace injectivity. A nonzero restriction in z is insufficient because odd contributions cancel. Peter–Weyl localization must respect both weight and divisor. (needed by [`MP.8/local-test-nonzero-tau`](#n-mp-8-local-test-nonzero-tau)).

## Sources added by the maintainer

Every item the maintainer routed to this roadmap in issue #10223 (fifteen sources, 111 items) is planned by a target of the accepted part MP.0 (its node sourceItems); the map is repeated here for the whole roadmap. None is planned in MP.8.

| Extraction item | Planned by |
|---|---|
| `PAPER-ZHANG-21/89` | [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) |
| `PAPER-ZHANG-21/90` | [`MP.5/theta-kernel`](#n-mp-5-theta-kernel) |
| `PAPER-ZHANG-21/127` | [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) |
| `PAPER-LI-LIU-21/17` | [`MP.3/unitary-doubling-dichotomy`](#n-mp-3-unitary-doubling-dichotomy) |
| `PAPER-LI-LIU-21/50` | [`MP.3/unitary-hecke-compatibility`](#n-mp-3-unitary-hecke-compatibility) |
| `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/finite-weil` | [`MP.4/finite-weil-representation`](#n-mp-4-finite-weil-representation) |
| `PAPER-YUAN-ZHANG-18/extended-schwartz` | [`MP.5/extended-schwartz-weil`](#n-mp-5-extended-schwartz-weil) |
| `PAPER-YUAN-ZHANG-18/unit-theta` | [`MP.5/unit-quotiented-theta`](#n-mp-5-unit-quotiented-theta) |
| `PAPER-YUAN-ZHANG-18/theta-automorphy` | [`MP.5/unit-quotiented-theta`](#n-mp-5-unit-quotiented-theta) |
| `PAPER-YUAN-ZHANG-18/rev-restriction-of-the-weil-representation` | [`MP.5/extended-restriction-comparison`](#n-mp-5-extended-restriction-comparison) |
| `PAPER-GAN-ICHINO-18/howe-duality` | [`MP.3/howe-duality`](#n-mp-3-howe-duality) |
| `PAPER-GAN-ICHINO-18/conservation-relation` | [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation) |
| `PAPER-GAN-ICHINO-18/unramified-theta` | [`MP.3/mp-odd-orthogonal-unramified`](#n-mp-3-mp-odd-orthogonal-unramified) |
| `PAPER-GAN-ICHINO-18/induction-principle` | [`MP.3/mp-odd-orthogonal-unramified`](#n-mp-3-mp-odd-orthogonal-unramified) |
| `PAPER-GAN-ICHINO-18/mvw-involution` | [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction) |
| `PAPER-GAN-ICHINO-18/rev-dependence-of-theta-lifts-on` | [`MP.3/mp-odd-orthogonal-unramified`](#n-mp-3-mp-odd-orthogonal-unramified) |
| `PAPER-GAN-ICHINO-18/rev-unramified-theta-correspondence-from-mp` | [`MP.3/mp-odd-orthogonal-unramified`](#n-mp-3-mp-odd-orthogonal-unramified) |
| `PAPER-GAN-ICHINO-18/metaplectic-induction` | [`MP.3/mvw-and-cover-induction`](#n-mp-3-mvw-and-cover-induction) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/73` | [`MP.7/theta-multiplier`](#n-mp-7-theta-multiplier) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/74` | [`MP.7/half-weight-maass-space`](#n-mp-7-half-weight-maass-space) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/75` | [`MP.7/half-weight-fourier-expansion`](#n-mp-7-half-weight-fourier-expansion) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/76` | [`MP.7/half-weight-eisenstein`](#n-mp-7-half-weight-eisenstein) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/77` | [`MP.7/fundamental-eisenstein-coefficient`](#n-mp-7-fundamental-eisenstein-coefficient) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/78` | [`MP.7/eisenstein-divisor-coefficients`](#n-mp-7-eisenstein-divisor-coefficients) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/79` | [`MP.7/eisenstein-product-normalization`](#n-mp-7-eisenstein-product-normalization) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/80` | [`MP.7/theta-residue-normalization`](#n-mp-7-theta-residue-normalization) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/81` | [`MP.7/kohnen-plus-space`](#n-mp-7-kohnen-plus-space) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/82` | [`MP.7/plus-operators`](#n-mp-7-plus-operators) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/83` | [`MP.7/plus-projection`](#n-mp-7-plus-projection) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/84` | [`MP.7/half-weight-kloosterman`](#n-mp-7-half-weight-kloosterman) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/85` | [`MP.7/plus-kloosterman`](#n-mp-7-plus-kloosterman) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/86` | [`MP.7/plus-kloosterman-symmetry`](#n-mp-7-plus-kloosterman-symmetry) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/95` | [`MP.7/half-weight-resolvent`](#n-mp-7-half-weight-resolvent) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/96` | [`MP.7/half-weight-poincare`](#n-mp-7-half-weight-poincare) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/97` | [`MP.7/poincare-residues`](#n-mp-7-poincare-residues) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/98` | [`MP.7/plus-bessel-coefficient`](#n-mp-7-plus-bessel-coefficient) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/99` | [`MP.7/projected-poincare-expansion`](#n-mp-7-projected-poincare-expansion) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/100` | [`MP.7/plus-coefficient-residue`](#n-mp-7-plus-coefficient-residue) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/103` | [`MP.7/quadratic-root-weyl-sum`](#n-mp-7-quadratic-root-weyl-sum) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/104` | [`MP.7/kohnen-salie-identity`](#n-mp-7-kohnen-salie-identity) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/106` | [`MP.7/weight-two-cycle-unfolding`](#n-mp-7-weight-two-cycle-unfolding) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/107` | [`MP.7/cm-poincare-sum`](#n-mp-7-cm-poincare-sum) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/108` | [`MP.7/positive-cycle-poincare-sum`](#n-mp-7-positive-cycle-poincare-sum) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/109` | [`MP.7/negative-cycle-poincare-sum`](#n-mp-7-negative-cycle-poincare-sum) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/119` | [`MP.7/three-case-poincare-identity`](#n-mp-7-three-case-poincare-identity) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/120` | [`MP.7/plus-hecke-basis`](#n-mp-7-plus-hecke-basis) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/121` | [`MP.7/shimura-eigenline-lift`](#n-mp-7-shimura-eigenline-lift) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/122` | [`MP.7/shimura-coefficient-relation`](#n-mp-7-shimura-coefficient-relation) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/123` | [`MP.7/spectral-residue-substitution`](#n-mp-7-spectral-residue-substitution) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/124` | [`MP.7/spectral-trace-identity`](#n-mp-7-spectral-trace-identity) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/125` | [`MP.7/shimura-series-automorphy`](#n-mp-7-shimura-series-automorphy) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/126` | [`MP.7/shimura-eigenline-bijection`](#n-mp-7-shimura-eigenline-bijection) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/127` | [`MP.7/extended-shimura-trace`](#n-mp-7-extended-shimura-trace) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/128` | [`MP.7/negative-factor-trace`](#n-mp-7-negative-factor-trace) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/129` | [`MP.7/positive-factor-trace`](#n-mp-7-positive-factor-trace) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/130` | [`MP.7/cm-trace`](#n-mp-7-cm-trace) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/149` | [`MP.7/duke-coefficient-bound`](#n-mp-7-duke-coefficient-bound) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/168` | [`MP.7/plus-normalization-conjugation`](#n-mp-7-plus-normalization-conjugation) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/181` | [`MP.7/positive-fourier-kernel`](#n-mp-7-positive-fourier-kernel) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/182` | [`MP.7/finite-fourier-certificate`](#n-mp-7-finite-fourier-certificate) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/184` | [`MP.7/finite-fourier-automorphy`](#n-mp-7-finite-fourier-automorphy) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/dit11-lemma4-weight-half-eisenstein-coefficients` | [`MP.7/dit11-eisenstein-comparison`](#n-mp-7-dit11-eisenstein-comparison) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/geometric-trace-T` | [`MP.7/geometric-trace`](#n-mp-7-geometric-trace) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/resolvent-fourier-expansion-weight-half` | [`MP.7/resolvent-fourier-comparison`](#n-mp-7-resolvent-fourier-comparison) |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/shimura-dirichlet-series-identity` | [`MP.7/shimura-dirichlet-series`](#n-mp-7-shimura-dirichlet-series) |
| `PAPER-DISEGNI-LIU-24/21` | [`MP.6/unitary-siegel-weil-measure`](#n-mp-6-unitary-siegel-weil-measure) |
| `PAPER-DISEGNI-LIU-24/22` | [`MP.3/relevant-unitary-dichotomy`](#n-mp-3-relevant-unitary-dichotomy), [`MP.3/theta-coefficient-rationality`](#n-mp-3-theta-coefficient-rationality), [`MP.6/pi-coherence-parity`](#n-mp-6-pi-coherence-parity) |
| `PAPER-GAN-SAVIN-23/sl2-o3-theta` | [`MP.3/rank-one-oscillator-constituents`](#n-mp-3-rank-one-oscillator-constituents) |
| `PAPER-GAN-SAVIN-23/classical-howe-duality` | [`MP.3/howe-duality`](#n-mp-3-howe-duality) |
| `PAPER-GAN-SAVIN-23/lemma-13-2` | [`MP.3/gl2-gso4-theta`](#n-mp-3-gl2-gso4-theta) |
| `PAPER-GAN-SAVIN-23/yamana-minimal` | [`MP.3/minimal-orthogonal-theta`](#n-mp-3-minimal-orthogonal-theta) |
| `PAPER-GAN-SAVIN-23/rev-finiteness-for-sp-v-6` | [`MP.3/minimal-orthogonal-theta`](#n-mp-3-minimal-orthogonal-theta) |
| `PAPER-GAN-SAVIN-23/rev-theta-lifts-from-so-3` | [`MP.3/division-ternary-theta`](#n-mp-3-division-ternary-theta) |
| `PAPER-ICHINO-PRASANNA-23/049` | [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe) |
| `PAPER-ICHINO-PRASANNA-23/050` | [`MP.3/similitude-theta-howe`](#n-mp-3-similitude-theta-howe) |
| `PAPER-ICHINO-PRASANNA-23/051` | [`MP.3/real-discrete-series-theta`](#n-mp-3-real-discrete-series-theta) |
| `PAPER-ICHINO-PRASANNA-23/061` | [`MP.3/quaternionic-similitude-datum`](#n-mp-3-quaternionic-similitude-datum) |
| `PAPER-ICHINO-PRASANNA-23/062` | [`MP.3/quaternionic-splitting`](#n-mp-3-quaternionic-splitting) |
| `PAPER-ICHINO-PRASANNA-23/063` | [`MP.3/quaternionic-first-doubled-splitting`](#n-mp-3-quaternionic-first-doubled-splitting) |
| `PAPER-ICHINO-PRASANNA-23/064` | [`MP.3/quaternionic-second-doubled-splitting`](#n-mp-3-quaternionic-second-doubled-splitting) |
| `PAPER-ICHINO-PRASANNA-23/065` | [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent) |
| `PAPER-ICHINO-PRASANNA-23/066` | [`MP.3/quaternionic-sharp-descent`](#n-mp-3-quaternionic-sharp-descent) |
| `PAPER-ICHINO-PRASANNA-23/067` | [`MP.3/quaternionic-see-saw-compatibility`](#n-mp-3-quaternionic-see-saw-compatibility) |
| `PAPER-ICHINO-PRASANNA-23/068` | [`MP.3/quaternionic-see-saw-compatibility`](#n-mp-3-quaternionic-see-saw-compatibility) |
| `PAPER-ICHINO-PRASANNA-23/069` | [`MP.3/periods-i-comparison`](#n-mp-3-periods-i-comparison) |
| `PAPER-ICHINO-PRASANNA-23/070` | [`MP.3/periods-i-first-scalar-calculation`](#n-mp-3-periods-i-first-scalar-calculation) |
| `PAPER-ICHINO-PRASANNA-23/071` | [`MP.3/periods-i-second-scalar-calculation`](#n-mp-3-periods-i-second-scalar-calculation) |
| `PAPER-ICHINO-PRASANNA-23/072` | [`MP.3/periods-i-square-quaternion-calculation`](#n-mp-3-periods-i-square-quaternion-calculation) |
| `PAPER-ICHINO-PRASANNA-23/073` | [`MP.3/harris-kudla-morita-comparison`](#n-mp-3-harris-kudla-morita-comparison) |
| `PAPER-ICHINO-PRASANNA-23/074` | [`MP.3/harris-kudla-morita-comparison`](#n-mp-3-harris-kudla-morita-comparison) |
| `PAPER-ICHINO-PRASANNA-23/079` | [`MP.3/quaternionic-unramified-theta`](#n-mp-3-quaternionic-unramified-theta) |
| `PAPER-ICHINO-PRASANNA-23/085` | [`MP.3/nonarchimedean-conservation`](#n-mp-3-nonarchimedean-conservation) |
| `PAPER-GAN-SAVIN-23-B/50` | [`MP.3/pgsp6-pgso8-similitude-theta`](#n-mp-3-pgsp6-pgso8-similitude-theta) |
| `PAPER-GAN-SAVIN-23-B/120` | [`MP.3/pgsp6-theta-dichotomy`](#n-mp-3-pgsp6-theta-dichotomy) |
| `PAPER-LI-LIU-22/47` | [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) |
| `PAPER-LI-LIU-22/48` | [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) |
| `PAPER-LI-LIU-22/49` | [`MP.3/unitary-hecke-compatibility`](#n-mp-3-unitary-hecke-compatibility) |
| `PAPER-LI-LIU-22/50` | [`MP.3/unitary-hecke-compatibility`](#n-mp-3-unitary-hecke-compatibility) |
| `PAPER-LI-ZHANG-22-B/21` | [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) |
| `PAPER-LI-ZHANG-22-B/22` | [`MP.2/hermitian-operator-normalizations`](#n-mp-2-hermitian-operator-normalizations) |
| `PAPER-LI-ZHANG-22-B/23` | [`MP.2/quadratic-uncertainty`](#n-mp-2-quadratic-uncertainty) |
| `PAPER-LI-ZHANG-22-B/24` | [`MP.2/hermitian-uncertainty`](#n-mp-2-hermitian-uncertainty) |
| `PAPER-LI-ZHANG-22-B/25` | [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section) |
| `PAPER-LAFFORGUE-18/43` | [`MP.4/function-field-metaplectic-programme`](#n-mp-4-function-field-metaplectic-programme) |
| `PAPER-CHENEVIER-TAIBI-20/rallis-unramified` | [`MP.3/rallis-unramified-satake`](#n-mp-3-rallis-unramified-satake) |
| `PAPER-GROSS-ZAGIER-86/19` | [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta) |
| `PAPER-GROSS-ZAGIER-86/177` | [`MP.5/ideal-class-theta`](#n-mp-5-ideal-class-theta) |
| `PAPER-GROSS-ZAGIER-86/178` | [`MP.5/ideal-class-theta-modularity`](#n-mp-5-ideal-class-theta-modularity) |
| `PAPER-GROSS-ZAGIER-86/194` | [`MP.5/ideal-class-theta-general-transform`](#n-mp-5-ideal-class-theta-general-transform) |
| `PAPER-GROSS-ZAGIER-86/195` | [`MP.6/ideal-lattice-poisson`](#n-mp-6-ideal-lattice-poisson) |
| `PAPER-GROSS-ZAGIER-86/328` | [`MP.5/ideal-class-theta-conjugation`](#n-mp-5-ideal-class-theta-conjugation) |

## Red-team findings handed to this roadmap

- **RT-AREA-automorphic-1/19** (medium, MP.6). Handled by accepted part MP.0 after FIX-RT-AREA-automorphic-1~5 (accepted 2026-10-08): [`MP.6/siegel-weil-section`](#n-mp-6-siegel-weil-section), [`MP.6/anisotropic-siegel-weil`](#n-mp-6-anisotropic-siegel-weil), [`MP.6/first-term-identity`](#n-mp-6-first-term-identity), [`MP.6/second-term-identity`](#n-mp-6-second-term-identity), [`MP.6/quadratic-quaternionic-norm-instances`](#n-mp-6-quadratic-quaternionic-norm-instances). Read 2026-10-17: the norm-form node states the anisotropic binary (m = 2, r = 0) and division ternary (m = 3, r = 0) cases in Weil's convergent range, and the regularized identities the split cases need (split binary at the boundary A₁ = B₀, split ternary in the second-term range); the MP.6 → GZ.5 edge is drawn.
- **RT-AREA-automorphic-1/20** (medium, MP.6, MP.8). Handled by accepted part MP.0 for the symplectic Jacobi group, Jacobi spaces, central Fourier–Jacobi extraction and theta decomposition; completed by this packet: [`MP.6/jacobi-group`](#n-mp-6-jacobi-group), [`MP.6/jacobi-spaces`](#n-mp-6-jacobi-spaces), [`MP.6/fourier-jacobi-extraction`](#n-mp-6-fourier-jacobi-extraction), [`MP.6/jacobi-theta-decomposition-interface`](#n-mp-6-jacobi-theta-decomposition-interface), [`MP.6/metaplectic-modular-group`](#n-mp-6-metaplectic-modular-group), [`MP.6/classical-jacobi-forms`](#n-mp-6-classical-jacobi-forms), [`MP.6/unitary-jacobi-group`](#n-mp-6-unitary-jacobi-group), [`MP.6/fourier-jacobi-period`](#n-mp-6-fourier-jacobi-period). The finding asked for the Jacobi group and its unitary analogue with the Schrödinger–Weil representation, Jacobi forms of given weight and index with multiplier systems in the generality QM.1 needs, Fourier–Jacobi coefficients and the theta decomposition. The part plans the symplectic adelic case only and proposes (its restructure on RT/20) to add the classical lattice-index instance and the unitary instance; this packet adds them as MP.6/metaplectic-modular-group, MP.6/classical-jacobi-forms, MP.6/unitary-jacobi-group and MP.6/fourier-jacobi-period, and R5 makes the nine bare MP.6 citations of MP.8 exact. QM.1 can then cite these nodes instead of the bare stages MP.6 and MP.7.
- **RT-AREA-automorphic-1/21** (medium, MP.3). Handled by accepted part MP.0 after FIX-RT-AREA-automorphic-1~5: [`MP.3/big-theta-module`](#n-mp-3-big-theta-module), [`MP.3/theta-finite-length`](#n-mp-3-theta-finite-length), [`MP.3/kudla-jacquet-filtration`](#n-mp-3-kudla-jacquet-filtration), [`MP.3/howe-duality`](#n-mp-3-howe-duality). Read 2026-10-17: SR.0:abelian-category, SR.2, SR.3 and AF.1 are prerequisites of these and other MP.3 targets, and the stage edges are drawn.
- **RT-AREA-automorphic-1/22** (medium, MP.2). Handled by accepted part MP.0 after FIX-RT-AREA-automorphic-1~5: [`MP.2/weil-index-identities`](#n-mp-2-weil-index-identities). Read 2026-10-17: the node cites QuadraticFormInvariants 6C for the Hilbert symbol and the local Hasse invariant and GlobalQuadraticForms layer 4 for the real place.
- **RT-AREA-automorphic-1/23** (medium, MP.5). Handled by accepted part MP.0 after FIX-RT-AREA-automorphic-1~5: [`MP.5/theta-growth-transfer`](#n-mp-5-theta-growth-transfer), [`MP.5/genuine-automorphic-spaces`](#n-mp-5-genuine-automorphic-spaces), [`MP.5/theta-integral-convergence`](#n-mp-5-theta-integral-convergence). Read 2026-10-17: AA.3, AF.2 and AF.3 are prerequisites of these targets and the stage edges are drawn.

## Mistakes found in the sources

The whole-roadmap pass found one; the parts' findings follow, with their review verdicts as the parts record them.

- **MetaplecticAutomorphicForms/E-WR-1** (whole-roadmap packet; BFH90, misprint, Proposition 2.1, printed p. 551, in the published Inventiones scan). Printed: The integral of θ^{N₀}_ν(Z, W) times the conjugate of θ^{N₀}_μ(Z, W) times exp(−4πN₀ Y⁻¹[Im W]) over ℂ²/Λ_Z, against Lebesgue measure, is stated to be √det Y/(2N₀) when μ ≡ ν mod 2N₀. Correction: The value is √det Y/(4N₀). Reason: Write W = Zλ + ρ; then dW = det(Y) dλ dρ on [0, 1)⁴. Integrating in ρ leaves the diagonal R = R′; the exponent is −4πN₀·Y[λ + R/(2N₀)]; summing over R ≡ ν mod 2N₀ and λ ∈ [0, 1)² gives ∫_{ℝ²} exp(−4πN₀ Y[u]) du = 1/(4N₀ √det Y), and multiplying by det Y gives √det Y/(4N₀). In one variable the same computation gives Eichler–Zagier's √(v/4m), and for Y = vI₂ the two-variable value is its square, v/(4N₀). Affects: nothing. Known: new. Not yet reviewed.
- **MetaplecticAutomorphicForms/E-MP0-1** (MP.0 part; Kudla96, misprint, 1996 author copy, I.1, p.5, orthogonal-sum paragraph). Printed: The orthogonal-sum paragraph repeats the first summand where the second is needed. Correction: Read W=W₁+W₂, the orthogonal direct sum used in the map H(W₁)×H(W₂)→H(W). Reason: The immediately described map sends ((w₁,t₁),(w₂,t₂)) to (w₁+w₂,t₁+t₂) and has the anti-diagonal scalar kernel. Repeating W₁ is inconsistent with both its domain and the orthogonal-sum assumption. Affects: the proof. Known: new (no addressing correction located; independent review required). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP0-2** (MP.0 part; Kudla96, error, 1996 author copy, I.2, p.6, character extension paragraph). Printed: The character-extension paragraph asserts uniqueness without fixing its value on the polarization section. Correction: The displayed character, when multiplicative, is the distinguished extension trivial on the chosen section Y→H(Y). It is unique only after imposing that normalization; the cocycle condition must also hold as in E-MP0-3. Reason: Take a nonzero isotropic F-line Y in a symplectic plane and nontrivial ψ. Since ω restricts to zero on Y, ψ(t) and ψ(t+ℓ(y)) are distinct characters of H(Y) extending the same central ψ, for any nonzero F-linear functional ℓ:Y→F. Thus uniqueness among all extensions is false even in the simplest polarized case. Affects: a stated result. Known: new (no addressing correction located; independent review required). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP0-3** (MP.0 part; Kudla96, error, 1996 author copy, I.2, p.6, formula for ψ_Y on a closed character-self-dual additive subgroup). Printed: The proposed character ignores the half-form cocycle on a general closed self-dual additive subgroup. Correction: For this formula require ψ(½ω(y,y′))=1 for all y,y′∈Y. It holds for an isotropic F-subspace. For a general closed self-dual additive subgroup, construct a valid splitting character or quadratic refinement and prove its multiplication law; do not infer the displayed formula from ψω-self-duality alone. Reason: Let F=Q₂, W=F² with ω((x,y),(x′,y′))=xy′−yx′, Y=Z₂², and ψ have kernel Z₂. Then Y equals its annihilator for ψω. The elements (e₀,0) and (e₁,0) both have proposed value 1, but their product has central coordinate ½ and value ψ(½)=−1. This is a failure of the printed formula, not a claim that a correctly chosen lattice model cannot exist. Affects: a stated result. Known: new (no addressing correction located; independent review required). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP0-4** (MP.0 part; Kudla96, misprint, 1996 author copy, I.2, p.9, equivariance display for I_{Y₁,Y₂}). Printed: The equivariance display switches to an operator letter not defined for the preceding integral. Correction: Use I_{Y₁,Y₂}(f) on the right side of the equivariance identity, matching the integral operator defined immediately above. Reason: The paragraph defines I_{Y₁,Y₂}:S_{Y₁}→S_{Y₂}, then asserts its H-equivariance. No operator A indexed by this pair has been defined; the same intertwining integral is required on both sides. Affects: the proof. Known: new (no addressing correction located; independent review required). Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E2** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, error, Theorem 4, p.965, in the published version, Annals of Mathematics 184 (2016), 949–990 (publisher PDF, SHA-256 a67de715…5f61); the author preprint of 29 July 2016 on W. Duke's page has the same text there). Printed: The norm-normalized weight-half form is asserted to be a unique vector although the trace identity is invariant under a unit scalar. Correction: F is unique only up to a constant factor of absolute value 1. The line spanned by F is unique, and F itself becomes unique once one also requires, for example, b(d_0) > 0 for one fundamental discriminant d_0 with b(d_0) ≠ 0. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. If F satisfies the conditions, so does uF for every complex u with |u| = 1. Indeed ⟨uF, uF⟩ = 1, the Shimura relation is linear in b, and b(d′)\overline{b(d)} is unchanged since |u|² = 1. Taking u = −1 gives a second such F. The conjugate in (5.16) was checked on the page image. Existence and the identity (5.16) are unaffected. The proof, via Proposition 6 in §10, produces F as a member ψ of a chosen orthonormal basis B_r, which fixes it only up to such a unit. Noted by the extraction (Corrections, item 5). Affects: a stated result. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E3** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, misprint, §5, numerical example after Theorem 4, p966 (also Proposition 6 on p981 twice and in its proof on p982 twice; those pages are outside range B)). Printed: The stated Laplace eigenvalue uses an additive half where its numerical value and spectral convention require a quarter. Correction: p.966: λ = 190.13154731 · · · = ¼ + r² (the stray '=' before the dots also goes). Likewise ¼ + r² for ½ + r² in Proposition 6 and after (10.4) on p.981, and twice in the proof on p.982. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. The substance of E3 is confirmed. Only the quote changes: the page image has '= · · · =' between the digits and ½ + r². With r = 2×6.889875675 = 13.77975135, 1/4+r² = 190.1315473 (the printed λ) and 1/2+r² = 190.3815473. Independent check: from Table 1 (a(p), p≤13), ⟨φ,φ⟩=7.26300636e−19, λ=1/4+r², a direct quadrature of λ⟨φ,φ⟩^{−1}∫_{F_I}φ dμ for D=12 gives 1.047598e10, matching 12^{7/4}√π b(−3)b(−4)=1.047599e10. With λ=1/2+r² it would be 1.04897e10. The text layer also shows '1/2 + r²' twice on p981 and twice on p982. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E6** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, error, Proposition 2, (6.6), p.968, and its proof and use, p.969). Printed: The Weyl-integral estimate uses an inverse-squared norm normalization but omits its exponential spectral factor. Correction: Replace (6.6) by Weyl(u_φ, χ) ≪_ε r^C|D|^{13/28+ε} for u_φ = φ/‖φ‖. With the a(1) = 1 normalization of (5.7), what Theorem 4 and [12, Thm 5] actually give is Weyl(⟨φ,φ⟩^{−1}φ, χ) ≪_ε r^C cosh²(πr/4)|D|^{13/28+ε}. The two forms agree after changing C, because ‖φ‖² = 2L(1,sym²φ)/cosh(πr) and L(1,sym²φ) = r^{o(1)}; only the upper bound L(1,sym²φ) ≪ r^ε is needed to pass from the second form to the first. In the deduction of Theorem 2, write c(φ)⟨φ,φ⟩^{−1}φ = ⟨f,u_φ⟩u_φ and use ⟨f,u_φ⟩ ≪ r^{−A} in place of c(φ) ≪ |r|^{−A}. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. The earlier confirmed analysis classifies this as an error because the printed (6.6) is false, not merely unproved. The cited results give an extra factor cosh²(πr/4): Duke 1988, Thm 5 (p.85) has the factor ch(πt/2) with t = r/2, once for each of b(d') and b(d). The failure can be shown directly in the CM case D = −4 = (1)(−4). Here h = 1 and ω_D = 2, so Weyl(⟨φ,φ⟩^{−1}φ, χ) = ⟨φ,φ⟩^{−1}φ(i)/2. With a(1) = 1, ⟨φ,φ⟩ = 2L(1,sym²φ)/cosh(πr) (see item 151), so (6.6) would force |u_φ(i)| ≪ r^{C+ε}e^{−πr/2} for every even φ. Odd forms vanish at i. The local Weyl law at z = i (pre-trace formula) gives Σ_{r_j≤R}|u_j(i)|² + (1/4π)∫_{−R}^{R}|E(i,1/2+it)|²dt ≍ R². By (7.1), E(i,s) = 2ζ(s)L(s,χ_{−4})/ζ(2s), and fourth-moment bounds make the Eisenstein part O(R^{1+ε}). So the even u_j cannot all be exponentially small at i, and (6.6) fails. The paper's own numbers show the same thing. With ⟨φ,φ⟩ = 7.263×10^{−19} and r = 13.78, the unit-vector values are modest: u(i) ≈ 3.76 and u((1+√−3)/2) ≈ 2.44, from the displayed values 4.41046×10⁹ and 2.86296×10⁹. So the printed Weyl values ≈ 10⁹–10^{10} are ‖φ‖^{−1}·O(1), where ‖φ‖^{−1} ≈ 1.17×10⁹. The printed argument for Theorem 2 multiplies the false (6.6) by the true but too weak bound c(φ) ≪ r^{−A}. With both corrected, c(φ)⟨φ,φ⟩^{−1}φ = ⟨f,u_φ⟩u_φ and the proof goes through. Humphries–Nordentoft (arXiv 2211.05890, §9) use the unit-normalized form without comment. Affects: a stated result. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E8** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, misprint, Proposition 6, p.981; also the proof: (10.4) and (10.5) on p.981, and the displays on p.982 including (10.6)). Printed: The trace identities use a fractional power without absolute value and the proof initially restricts the discriminant sign. Correction: Read |D|^{3/4} for D^{3/4} in Proposition 6, (10.4), (10.5), the p. 982 display, (10.6) and the two displays after it, as in Proposition 5 and (5.16). In the first line of the proof, replace 'D=d′d>1' by 'D=d′d not a square', so that D<0 (the d′d<0 case of (5.16)) is covered. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. Confirmed on the page images. The statement allows D<0, and T(φ,χ) is real, so D^{3/4} cannot be meant. The proof also writes D^{3/4} at every step and assumes D>1 at the start, so as written it does not treat D<0, the CM case needed for the third branch of Theorem 4. Proposition 5, with |D|^{3/4}, covers D<0, and the argument then goes through word for word. I did not repeat the erratum searches recorded in E8. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E22** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, error, §5, Remarks after Theorem 4, p965). Printed: The theta-residue normalization assigns squared norm6 to half of the source theta function. Correction: '… and ⟨½θ(z), ½θ(z)⟩ = π/2', equivalently ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), for the product of Theorem 4. The value 6 = [Γ:Γ_0(4)] is ⟨θ,θ⟩, not ⟨½θ,½θ⟩, for the product normalized by 3/π = 1/area(Γ\H). In that normalization ⟨½θ,½θ⟩ = 3/2. Either way the claimed match with ⟨F,F⟩ = 6 does not hold. Reason: The correction concerns the unscaled Petersson measure dμ=dxdy/y². Its invariant theta-norm integrand is sqrt(y)|θ(z)|². Summing over six Γ₀(4) cosets and including the cusp tail gives 2π at both GL60/Y12 and GL90/Y20; the area control also gives 2π. Thus the norm squared of θ/2 is π/2, rather than 6. This numerical check supports the normalization correction, but is not a formal proof of the exact integral. The separate Chiera convention was not read; no correction to that source is asserted. The remark is unused in the paper’s proofs. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E28** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, error, Lemma 6 (pp.979–980) against Lemma 5 (p.979) and its proof; also the note in the proof of Lemma 4, p.979). Printed: The weight-two cycle unfolding carries a kernel sign inconsistent with the adopted cycle orientation. Correction: Take C_Q from z to γ_Qz, with γ_Q from (2.11) as footnote 8 indicates. This is the orientation of C_A in §2, which Lemma 1 uses. Lemma 6 should then read Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ = −Σ_{0<c≡0(4)}S_m(d′,d;c)Φ_m(2√D/c); equivalently, put −it in place of it in (9.3). The note in the proof of Lemma 4 should read √D dz/Q(z,1)=−y^{−1}|dz| on C_Q. Lemma 5, Propositions 5 and 6 and Theorem 4 stand as printed. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. By (9.2), −2i∂_zF_m=P_m(z,φ) with φ(y)=−s|m|^{−1/2}(2πy)⁻¹Γ(s)Γ(2s)⁻¹M_{sgn m,s−1/2}(4π|m|y), so i∂_zF_m=−½P_m. I checked (9.2) numerically to 1e-15 at four points, including complex s, and Lemma 7 for both signs and several (t,μ,s). Put the printed Lemma 6 and Lemma 7 together, with μ=sgn m, e(±μ/4)=i, Γ((s+2)/2)Γ(s/2)=(s/2)Γ(s/2)² and the duplication formula. This gives −½Φ_m(2√D/c)=−2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}c^{−1/2}J_{s−1/2}(4π|m|√D/c), which is minus the c-th term of Lemma 5. Quadrature of (9.3) gives the same ratio, −1.0000000, for three (D,c,m,s). To decide which statement is wrong, I computed Lemma 5 directly. I took D=12=(−3)(−4), with classes [1,0,−3] and [−1,0,3], χ=+1 and −1, and γ_Q=[[2,3],[1,2]]. I evaluated F_m from its Fourier expansion at points reduced to the fundamental domain and summed S_m for c≤4000. With C_Q from z to γ_Qz, LHS/RHS=1.0000000000 at (m,s)=(1,4) and 1.00000005 at (2,3.7). Unfolding (a>0, θ from 0 to π, counterclockwise) also shows that the printed Lemma 6 is the statement for the counterclockwise orientation when a>0: forms with a<0 contribute equally, because χ(−Q)=−χ(Q) for d<0 and their orientation is reversed. That orientation is DIT11's S_Q ((4.1), p.966: 'directed counterclockwise if a>0'), whose C_Q runs to g_Qz. So Lemma 6 and the Lemma 4 note were carried over from [16] without the sign change that footnote 8 signals. Case for the defence: the paper never states the orientation explicitly. Theorem 4 is unaffected, because its third case is written with (λ/2)∫_{F_A}φdμ, which does not depend on orientation, and the chain Lemma 5 → Proposition 5 → Proposition 6 → Lemma 1 is consistent under the (2.11) orientation. The Lemma 4 note is harmless, because Lemma 4 is stated with y⁻¹|dz|. Affects: a stated result. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E30** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, gap, Hypothesis before Lemma 6 (p.979) as applied in the proof of Lemma 5 (p.980)). Printed: The decay assumption for the unfolding excludes the seed substituted in the next proof. Correction: State Lemma 6 for φ(y)≪y^{ε} as y→0. This suffices, because |f(γτ)(γτ)′|=|φ(Im γτ)|Im γτ/Im τ. Alternatively, prove Lemma 5 for Re(s)>2 and continue analytically. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. M_{κ,μ}(x)~x^{μ+1/2} as x→0, so the φ used satisfies φ(y)≍y^{s−1}. That is ≪y^{1+ε} only when Re(s)>2, but Lemma 5 is claimed for Re(s)>1. The weight-2 series has an extra factor Im γτ/Im τ, so the hypothesis carried over from the weight-0 setting of DIT11 (φ=O(y^a), a>1) is stronger than needed. The repair is routine. Affects: the proof. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E33** (MP.0 part; PAPER-DUKE-IMAMOGLU-TOTH-16, gap, §10, pp.980–981: the choice of B_r, the display after (10.1), (10.2), and the nonzero-fundamental-coefficient assertion). Printed: The stated odd-prime eigenbasis is used for an Euler product containing also the prime2 factor. Correction: Take B_r to consist of eigenfunctions of Kohnen's plus-space operator at 2 as well, and define a_ψ(2) as its eigenvalue, as in the plus-space Shimura correspondence of [34]/[1]; or restrict (10.2)–(10.4) to odd m and treat 2 separately. Justify b(d)≠0 for some fundamental d: with the full Shimura relation, b(d)=0 forces b(dk²)=0 for all k, and every nonzero n≡0,1 mod 4 is dk² with d fundamental. Note that the a_ψ(m) are real. Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. With eigenvalues only for p>2, the Euler factor at p=2 in the display and in (10.2) is undefined. So a_ψ(2^k), and hence Shim ψ in (10.3), are not defined by the text, and the nonvanishing claim is asserted without argument. Case for the defence: the plus-space Hecke theory at 2 and the Hecke-equivariant correspondence of Katok–Sarnak [34] and Baruch–Mao [1], which the proof invokes at the end, supply what is missing. The extraction flags this in item 120, but there is no source issue for it. Affects: the proof. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-GROSS-ZAGIER-86-E30** (MP.0 part; PAPER-GROSS-ZAGIER-86, misprint, Chapter IV, §2, (2.3) Lemma, p. 274; Invent. Math. 84 (1986), published version (GDZ scan; formulas read from the GDZ IIIF 1400px crops of the page images)). Printed: The weight-one transformation is phrased for the projective group although its slash action requires a determinant-one matrix lift. Correction: γ = (a b; c d) ∈ SL₂(ℤ) Reason: Imported correction from REV-PAPER-GROSS-ZAGIER-86; this packet uses the corrected statements. In odd weight 1, θ_𝒜|₁(−γ) = −θ_𝒜|₁γ, so the left side is not a function of the image of γ in PSL₂(ℤ). The right side also changes sign under γ ↦ −γ: ε_{D₁}(−1)ε_{D₂}(−1) = ε(−1) = −1 because exactly one of D₁, D₂ is negative, and c*d is unchanged. So the identity holds for every matrix of SL₂(ℤ) (either lift). This is what the proof uses (a matrix in SL₂(ℤ)) and what (2.2) states. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-GROSS-ZAGIER-86-E31** (MP.0 part; PAPER-GROSS-ZAGIER-86, misprint, Chapter IV, §2, proof of (2.3), p. 275, second line of the completed-square display; Invent. Math. 84 (1986), published version (GDZ scan; formulas read from the GDZ IIIF 1400px crops of the page images)). Printed: An exponential factor uses an ideal subscript where its modulus is the associated positive integer norm. Correction: e_{δ₂}(−R* N(λ₀ν)) (the integer δ₂, not the ideal 𝔡₂, in the subscript) Reason: Imported correction from REV-PAPER-GROSS-ZAGIER-86; this packet uses the corrected statements. e_n(a) = e^{2πia/n} is defined for an integer modulus n (Conventions, p. 269). The next line of the proof writes C(ν) = e_{δ₂}(−R* N(λ₀ν)) · Σ e_{δ₂}(R N(μ)). Check: R·N(μ + R*λ̄₀ν̄) ≡ R N(μ) + RR* Tr(λ₀νμ) + R* N(λ₀ν) (mod δ₂), with R* ≡ 0 (mod D₁) making R* N(λ₀ν) integral. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-Kudla-Leray-quotient** (MP.0 part; Kudla96, error, 1996 author copy I.3 p12, reduction of the triple). Printed: The proposed reduced Lagrangian quotient uses R as denominator without R being contained in every Lagrangian. Correction: Use the image ((Y_j∩R^⊥)+R)/R in R^⊥/R; R need not be contained in each Y_j. Reason: Take Y₀=Y₁=L and Y₂ transverse to L. Then R=L, while Y₂∩R^⊥=0, so division of that intersection by R is undefined. Its image in the ambient quotient is defined. Affects: a stated result. Known: new (no addressing correction located). Review: confirmed.
- **MetaplecticAutomorphicForms/E-Kudla-genuine-twists** (MP.0 part; Kudla96, error, 1996 author copy II.4 Remark4.1, pp36–37). Printed: The genuine tensor and dual corrections reverse the scalar-character weights. Correction: With λ(z)=z² as fixed on p36, use λ⁻¹ for the tensor of two genuine weight-one modules and λ for the genuine dual. Reason: The printed powers yield scalar weights 2−4=−2 and −1+4=3; the required weights are 0 and1. Definition4.2 immediately below uses the consistent half-dimension exponents. Affects: a stated result. Known: new (no addressing correction located). Review: confirmed.
- **MetaplecticAutomorphicForms/E-Kudla-Rao-known-sign** (MP.0 part; Kudla96, misprint, 1996 author copy I.4 Remark4.6 p21, note about Rao93). Printed: The quoted Rao exponent has the wrong linear sign in its quadratic expression. Correction: Use t(t−1)/2 in the cited Rao formula, as Kudla’s remark explicitly instructs. Reason: This is a correction already printed in the source read, recorded to preserve the corrected cocycle convention. Rao’s original article was not read or independently collated. Affects: nothing. Known: Kudla96 I.4 Remark4.6 already records this correction to Rao93. Review: confirmed.
- **MetaplecticAutomorphicForms/E-Garrett-inner-product** (MP.0 part; Garrett20, error, Author notes March23 2020 Claim0.7 p4 and ensuing tensor norm calculation). Printed: The tensor inner-product display places the multiplicity-space inner product on vectors in the original representation. Correction: Replace the second factor by ⟨x₁,x₂⟩_{X⁰}. Reason: For x_i in the projector image, the proof computes the scalar oscillator matrix coefficient times their unchanged inner product. πh_i x_i need not even lie in X⁰, and the printed factor conflicts with the algebraic tensor inner product stated above. Affects: the proof. Known: new (no addressing correction located). Review: confirmed.
- **MetaplecticAutomorphicForms/E-Garrett-multiplicity-space** (MP.0 part; Garrett20, misprint, Author notes March23 2020 final paragraph p4). Printed: The final multiplicity-space conclusion says the space vanishes where the argument requires a nonzero one-dimensional space. Correction: For a nonzero irreducible π the multiplicity space is one-dimensional: X⁰≃C. Reason: The established equivalence is Y≃X⊗X⁰. X⁰=0 would force Y=0, whereas irreducibility and the concluded π≃σ require nonzero dimension one. Affects: the proof. Known: new (no addressing correction located). Review: confirmed.
- **MetaplecticAutomorphicForms/E-Biro-Vitali** (MP.0 part; Biro00, error, Published Acta Arith94(2000) p128, PDF26, function-theoretic parenthesis before Lemma10). Printed: The analytic parenthesis treats convergence at a single point as sufficient for uniqueness of a locally bounded holomorphic limit. Correction: Require convergence on a set with an accumulation point inside the domain. The preceding convergence for all sufficiently large positive A supplies such a set here. Reason: On the unit disk, f_n(z)=(−1)^n z is uniformly bounded and converges to f(0)=0 at z₀=0, but fails to converge at z=1/2. The correct Vitali argument repairs this proof without changing the lift theorem. Affects: the proof. Known: new (no addressing correction located). Review: confirmed.
- **MetaplecticAutomorphicForms/E-GAN-SAVIN-23-E17** (MP.0 part; PAPER-GAN-SAVIN-23, misprint, §15.1, before Lemma 15.4, p. 54 (arXiv v1); checked on the page image). Printed: The division-quaternion ternary space is described with the split isotropy adjective and one theta input changes its representation letter. Correction: Identify PB^×=SO₃* as the anisotropic inner form and use JL(ρ), consistently with the representation introduced, in the ψ-theta lift defining σ_ρ. Reason: Imported correction from REV-PAPER-GAN-SAVIN-23. For a division quaternion algebra B, PB^× is compact, so SO_3^* is anisotropic. τ is not defined in this passage. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-GAN-SAVIN-23-E36** (MP.0 part; PAPER-GAN-SAVIN-23, misprint, Proof of Proposition 8.4, p. 27 (arXiv v1); checked on the page image). Printed: The concluding rank-one theta identifications use the unbarred additive character in the input label where the proof uses its conjugate. Correction: Θ(ρ^−_ψ̄) ≅ st^− and Θ(ρ^+_ψ̄) is the principal series with quotient 1 and submodule st^+, since these are the objects appearing in the SL_2-coinvariants. Reason: Imported correction from REV-PAPER-GAN-SAVIN-23. The coinvariant decomposition uses Θ(ρ_ψ̄^±), but the identifications are printed for Θ(ρ_ψ^±). Changing ψ to ψ̄ can twist the S̃L_2 → PGL_2 lift by the quadratic character χ_{−1}. The argument is unaffected either way: τ^− is supercuspidal (so the 1-dimensional quotient is irrelevant), and every generic representation of GL_2, e.g. st ⊗ χ_{−1}, is a quotient of τ. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-ICHINO-PRASANNA-23-E6** (MP.0 part; PAPER-ICHINO-PRASANNA-23, misprint, arXiv:1806.10563v2, PropositionA.1(i), PDF88; the earlier extraction locator p101 refers to its published version, not collated here). Printed: The local splitting identity drops the place subscript on its second denominator factor. Correction: z_{𝕐_v}(g_1, g_2) = s_v(g_1g_2) / (s_v(g_1) s_v(g_2)) Reason: Imported correction from REV-PAPER-ICHINO-PRASANNA-23. s_v is the local map being constructed; s without subscript is the global notation of §A.6 onwards and is not yet defined at this point. Affects: nothing. Known: Already recorded and independently confirmed in the atlas extraction; no author erratum is claimed.. Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-2** (MP.8 part; BFH90, error, Published Invent. Math.102(1990), §1, p.548, paragraph defining K). Printed: The source describes the stabilizer on p.548 for the action of GSp₄⁺ without including a positive scalar factor. Correction: K=GSp⁺(4,R)∩O(4) is the stabilizer in Sp(4,R). In GSp⁺(4,R), the stabilizer is R_{>0}·K, with the positive scalar matrices included. Reason: Take g=2I₄. Then gᵀJg=4J, so g∈GSp⁺, and (2iE)(2E)⁻¹=iE; but gᵀg=4I₄, so g is not in O(4) or K. For the full corrected description, normalize a positive-similitude stabilizer by μ(g)^(−1/2) and use its symplectic stabilizer equations. Equation (1.14) already treats central scalars separately. Affects: a stated result. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-3** (MP.8 part; BFH90, misprint, Published Invent. Math.102(1990), §1, p.550, (1.21) and the completion immediately before (1.22)). Printed: On p.550, the source assigns the Fricke and completion normalization for auxiliary N to the original newform of conductor M. Correction: For the original normalized newform f of level M, replace N by M in its Fricke equation and its completed L-function. Keep the level N in the separately defined transform f̂(τ)=τ^(−k)f(−1/(Nτ)) on p.547. Reason: The introduction p.543 uses M, and the twisted completion (1.24) on p.551 uses D²M. If one sets Λ_N=(N/M)^(s/2)Λ_M, the functional equation gains the factor (N/M)^(s−k/2). As a direct Fricke check, the weight12 level1 discriminant form at N=8 satisfies Δ(−1/(8τ))=(8τ)^12Δ(8τ); the printed formula would instead require 8^6τ^12Δ(τ), contradicted by the leading powers of q as Im(τ)→∞. This is a normalization slip, not a counterexample to the paper’s main nonvanishing theorem. Affects: the proof. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-4** (MP.8 part; BFH90, error, §3, p.568, Proposition 3.9). Printed: Proposition 3.9 imposes a condition on the imaginary part in only one direction, allowing a region that includes −i, a branch singularity. Correction: Use the bounded strip |Im x₁|≤ε with 0<ε<1, or the upward closed half-strip 0≤Im x₁≤ε sufficient for the later contour shift. Reason: With x₃=x₄=0, the explicit coefficient φ₁ from (3.29) is (1+x₁²)^(−1/2), singular at x₁=−i. That point lies in the printed one-sided region for every ε>0. Both factors stay away from zero on the corrected bounded strip; the complexified matrix-coefficient proof must retain that branch domain. Affects: a stated result. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-5** (MP.8 part; BFH90, misprint, §8, p.602, Proposition 8.1, displayed definition of A). Printed: In (8.1) and (8.3), the source leaves the second argument of the nondegenerate transforms unscaled, while the unfolding and evaluated expressions use N⁻¹y₂. Correction: The transform argument in A is N⁻¹y₂: TF^±(u,s,N⁻¹y₂), matching the scaled M, M̃ and τ boundary terms. Reason: At n₂=N⁻¹, Proposition 6.1 has Whittaker second argument N⁻¹y₂. Its substitution into the Novodvorsky integral and the (8.4) variable change give TF(u,s,N⁻¹y₂), with N^(−s+4+k/2) outside. Both the displayed A in (8.1) and the printed left side of (8.3) omit N⁻¹, whereas the evaluated boundary terms on p.603 carry it. This is an argument-normalization discrepancy, not a refutation of the nonvanishing theorem. Affects: a stated result. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-6** (MP.8 part; BFH90, error, Published Invent. Math.102(1990), §3, p.562, normalizer immediately before Proposition 3.4; compare p.565 (3.26)–(3.27)). Printed: The source uses a gamma product depending on the sign on p.562; multiplying it by the p.565 evaluated integrals leaves their inverse factors uncancelled. Correction: For + use Γ((s−r+n)/2)Γ((s+r+n+1)/2); for − use Γ((s−r−n−1)/2)Γ((s+r−n)/2). Reason: The evaluated positive-sign integral in (3.26) has inverse Γ((s−r+n)/2); the negative-sign integral in (3.27) has inverse Γ((s−r−n−1)/2). Multiplication by the corrected pair cancels that inverse factor, leaving Γ((s+r+n+1)/2) or Γ((s+r−n)/2), exactly the remaining factors in the two V̂ displays on p.565. The p.562 printed normalizer does not yield those displays. This verifies the corrected pair; the confluent-function continuation and reflection proof remains subject to the recorded source gap. Affects: a stated result. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-7** (MP.8 part; BFH90, error, Published Invent. Math.102(1990), §3, p.569, (3.31),(3.35); p.570 (3.38)). Printed: The source treats substitution in the positive chart as a global expression for the compact product. It also claims vanishing at the boundary without requiring a divisor condition. Correction: Evaluate the actual global compact product; introduce its residual compact transition in the chart. The global divisor has signed factor (1+zx₁)/Δ_z, whereas its chart value has |1+zx₁|/Δ_z. Reason: A constant compact coefficient equals 1 at the chart boundary, contradicting the claimed zero for arbitrary coefficients. More decisively, the allowed global weight-zero coefficient φ₁=det(Im q) at X=diag(0,−2),z=1 equals −1/√10 after right rotation, while its positive chart formula at X(z)=diag(0,3) equals +1/√10. Thus the chart substitution also fails away from the boundary. Global divisibility gives boundary vanishing but does not remove the missing transition on the negative branch. Affects: the proof. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-8** (MP.8 part; BFH90, misprint, Published Invent. Math.102(1990), §7, p.592, (7.10), mixed congruence modulus). Printed: Equation (7.10) puts a,b into the modulus for the mixed congruence, although the earlier matrix parametrization uses a,d. Correction: Use p^min(a,d), leaving Lemma 7.3’s table unchanged. Reason: The preceding p.591 matrix parametrization takes x₀ modulo α₁β₃δ₂; its finite character sum yields the mixed modulus min(a,d). At p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1 there are six solutions (λ₁∈{0,3,6},λ₂∈{0,1}); the printed modulus gives two, contradicting the table’s N₂=2p. Direct enumeration with the corrected modulus matches all 2,016 small cases tested against the unchanged table. This finite check supplements the matrix derivation. Affects: a stated result. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.
- **MetaplecticAutomorphicForms/E-MP8-9** (MP.8 part; BFH90, misprint, Published Invent. Math.102(1990), §5, p.582, displayed definition of S₀). Printed: The source takes D modulo NC in the sum S₀, whereas unfolding uses a period C. Correction: Use D mod C, with the same primitive and congruence restrictions. Reason: The three period-one symmetric X-coordinate integrations identify C⁻¹D modulo integral symmetric translations, hence D modulo CS. The phases are invariant under those shifts. Since C≡0 mod N, D₁₂ mod N and the determinant condition are also preserved. Quotienting only by NCS repeats every class N³ times and disagrees with the unfolding normalization; the packet already uses the corrected modulus. Affects: a stated result. Known: new (no relevant correction located in the recorded searches; no priority claim). Review: confirmed.

## Notes for the maintainer on Tau Ceti roadmaps

- *tauceti:TauCetiRoadmap/IntegralLattices, TauCetiRoadmap pull request #286 (Theta Series).* TauCetiRoadmap main's IntegralLattices (read at 350e970) and the open Theta Series roadmap both list the Weil representation of SL(2, ℤ) on ℂ[L^∨/L] and half-integral weight modular forms as having no owner upstream. In the atlas, MetaplecticAutomorphicForms MP.4/finite-weil-representation plans the former (in the Andreatta–Goren–Howard–Madapusi Pera normalization, with its relation to the complex-conjugate ρ_L) and MP.7 the latter; the maintainer may wish to say so upstream.
- *tauceti:TauCetiRoadmap/IntegralLattices.* IntegralLattices names a successor, IndefiniteThetaAndSiegelWeil, for Siegel–Narain theta functions, theta lifts and the indefinite Siegel–Weil theorem. MetaplecticAutomorphicForms MP.5–MP.6 plan the adelic theta lift and the Siegel–Weil formulas in the range Gan–Qiu–Takeda treat. If that successor is written, its scope and MP.5–MP.6 overlap and should be divided before either is upstreamed.
- *TauCetiRoadmap pull request #286 (Theta Series).* The Hecke–Schoeneberg theorem of Theta Series (Layer 7) contains, for even binary lattices, the modularity of the Gross–Zagier ideal-class theta series that MP.5 plans; restructure R8 of this packet re-points MP.5 to it once the atlas tracks that roadmap.

## References

- **BFH90**: Daniel Bump, Solomon Friedberg, Jeffrey Hoffstein, *Nonvanishing theorems for L-functions of modular forms and their derivatives*, Inventiones mathematicae 102 (1990), 543–618; published scan, DOI 10.1007/BF01233440, https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf (SHA-256 `d50ad2f11c992591…`).
- **BFH90Invent**: Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein, *Nonvanishing theorems for L-functions of modular forms and their derivatives*, Inventiones mathematicae102(1990),543–618;77-page published scan, https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf (SHA-256 `d50ad2f11c992591…`).
- **Biro00**: András Biró, *Cycle integrals of Maass forms of weight0 and Fourier coefficients of Maass forms of weight1/2*, Acta Arithmetica94(2000),103–152;50-page published scan, https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf (SHA-256 `d1a49be2d88fb601…`).
- **DIT11**: W. Duke, Ö. Imamoḡlu and Á. Tóth, *Cycle integrals of the j-function and mock modular forms*, Annals of Mathematics173(2011),947–981;published35-page PDF, https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf (SHA-256 `8f2b8ed3518fe69f…`).
- **Duke88**: William Duke, *Hyperbolic distribution problems and half-integral weight Maass forms*, Inventiones Mathematicae 92 (1988), 73–90; public scan on the author’s UCLA page, https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf (SHA-256 `3c468d0c0d79ec2a…`).
- **GGP12**: Wee Teck Gan, Benedict H. Gross and Dipendra Prasad, *Symplectic local root numbers, central critical L-values, and restriction problems in the representation theory of classical groups*, arXiv:0909.2999v1 (2009); published in Astérisque 346 (2012), 1–109. Page numbers are those of the arXiv version., https://arxiv.org/abs/0909.2999 (SHA-256 `97c28b21ece4cec6…`).
- **GQT**: Wee Teck Gan, Yannan Qiu and Shuichiro Takeda, *The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula*, arXiv:1207.4709v3,21January2014, https://arxiv.org/pdf/1207.4709v3 (SHA-256 `cde6b7ad22b974d4…`).
- **GanIchino16**: Wee Teck Gan and Atsushi Ichino, *The Gross–Prasad conjecture and local theta correspondence*, arXiv:1409.6824v2,17July2015;62-page PDF, not collated against publication, https://arxiv.org/pdf/1409.6824v2 (SHA-256 `4aaf7bd6281dd872…`).
- **GanTakeda16**: Wee Teck Gan and Shuichiro Takeda, *A proof of the Howe duality conjecture*, arXiv:1407.1995v4,15June2015;21-page PDF, not collated against publication, https://arxiv.org/pdf/1407.1995v4 (SHA-256 `89972dcc033e93fe…`).
- **Garrett20**: Paul Garrett, *Stone–von Neumann theorem*, Author notes dated23March2020;5pages, https://www-users.cse.umn.edu/~garrett/m/mfms/SSW/06_svn_theorem.pdf (SHA-256 `7fed4ade4126aa2a…`).
- **KongTeo23**: Ze-Yong Kong and Lee-Peng Teo, *An elementary proof of the transformation formula for the Dedekind eta function*, arXiv:2302.03280v1 (7 February 2023), https://arxiv.org/abs/2302.03280 (SHA-256 `36407e362a6b734c…`).
- **Kudla96**: Stephen S. Kudla, *Notes on the local theta correspondence*, Unpublished author notes; introduction dated July 6, 1996; 110-page author copy., https://www.math.toronto.edu/skudla/castle.pdf (SHA-256 `800ed01b22fa6104…`).
- **PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18**: Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics 187 (2018), no. 2, 391–531, https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf (SHA-256 `e1274468312566b3…`).
- **PAPER-CHENEVIER-TAIBI-20**: Gaëtan Chenevier, Olivier Taïbi, *Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms*, Public arXiv PDF 1907.08783v1, https://arxiv.org/pdf/1907.08783v1 (SHA-256 `81b7fe2c31d0ab4a…`).
- **PAPER-DISEGNI-LIU-24**: Daniel Disegni and Yifeng Liu, *A p-adic arithmetic inner product formula*, Public arXiv PDF 2204.09239v3, https://arxiv.org/pdf/2204.09239v3 (SHA-256 `1f759774cdbf8700…`).
- **PAPER-DUKE-IMAMOGLU-TOTH-16**: W. Duke, Ö. Imamoḡlu, Á. Tóth, *Geometric invariants for real quadratic fields*, Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics 184 (2016), 949–990, https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf (SHA-256 `a67de7157f76ee70…`).
- **PAPER-GAN-ICHINO-18**: Wee Teck Gan and Atsushi Ichino, *The Shimura–Waldspurger correspondence for Mp_2n*, Public arXiv PDF 1705.10106v3, https://arxiv.org/pdf/1705.10106v3 (SHA-256 `5d1408c5f8bc15a5…`).
- **PAPER-GAN-SAVIN-23**: Wee Teck Gan and Gordan Savin, *Howe duality and dichotomy for exceptional theta correspondences*, Public arXiv PDF 2102.00372v1, https://arxiv.org/pdf/2102.00372v1 (SHA-256 `8b3b6702909a6a93…`).
- **PAPER-GAN-SAVIN-23-B**: Wee Teck Gan and Gordan Savin, *The Local Langlands Conjecture for G_2*, Published/author public PDF identified by the URL and hash; journal metadata: Forum of Mathematics, Pi 11 (2023), e28, 1–42, https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf (SHA-256 `6fc3979d78510fb0…`).
- **PAPER-GROSS-ZAGIER-86**: Benedict H. Gross, Don B. Zagier, *Heegner points and derivatives of L-series*, Published/author public PDF identified by the URL and hash; journal metadata: Inventiones mathematicae 84 (1986), no. 2, 225–320, https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf (SHA-256 `a9a52cb8662e03f1…`).
- **PAPER-ICHINO-PRASANNA-23**: Atsushi Ichino and Kartik Prasanna, *Hodge classes and the Jacquet–Langlands correspondence*, Public arXiv PDF 1806.10563v2, https://arxiv.org/pdf/1806.10563v2 (SHA-256 `058fda94ad08d245…`).
- **PAPER-LAFFORGUE-18**: Vincent Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale*, Public arXiv PDF 1209.5352v10, https://arxiv.org/pdf/1209.5352v10 (SHA-256 `b37715f9c42862b7…`).
- **PAPER-LI-LIU-21**: Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups*, Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics (2) 194 (2021), no. 3, 817–901, https://www.math.columbia.edu/~chaoli/AIPF.pdf (SHA-256 `6ef2d63ea2cf55d8…`).
- **PAPER-LI-LIU-22**: Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*, Public arXiv PDF 2101.09485v2, https://arxiv.org/pdf/2101.09485v2 (SHA-256 `6cf5b238a14dfea7…`).
- **PAPER-LI-ZHANG-22-B**: Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Public arXiv PDF 1908.01701v3, https://arxiv.org/pdf/1908.01701v3 (SHA-256 `7db1843f90c3e797…`).
- **PAPER-YUAN-ZHANG-18**: Xinyi Yuan and Shou-Wu Zhang, *On the averaged Colmez conjecture*, Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics187(2018),533–638; erratum198(2023),867–878, https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf (SHA-256 `29dfd5f19dec4011…`).
- **PAPER-ZHANG-21**: Wei Zhang, *Weil representation and Arithmetic Fundamental Lemma*, Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics 193 (2021), no. 3, 863–978, https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf (SHA-256 `6f8ac537b4f95cf2…`).
- **Skoruppa07**: Nils-Peter Skoruppa, *Jacobi forms of critical weight and Weil representations*, arXiv:0707.0718v1 (5 July 2007); published in Modular Forms on Schiermonnikoog (Cambridge University Press, 2008). Page numbers are those of the arXiv version., https://arxiv.org/abs/0707.0718 (SHA-256 `a4cc378e16a7dfb3…`).
- **SunZhu15**: Binyong Sun and Chen-Bo Zhu, *Conservation relations for local theta correspondence*, arXiv:1204.2969v3,2June2014;50-page PDF, https://arxiv.org/pdf/1204.2969v3 (SHA-256 `dbd11f450840ecf3…`).
- **Weil64**: André Weil, *Sur certains groupes d’opérateurs unitaires*, Acta Mathematica 111 (1964), 143–211; published scan, DOI 10.1007/BF02391012., https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf (SHA-256 `22df47cb98307aa7…`).
- **yzz-gross-zagier-shimura-curves-2011-draft**: Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, *The Gross–Zagier Formula on Shimura Curves*, Author draft dated 6 November 2011, 266 PDF pages; author-uploaded public copy. Distinct from the 2013 published book., https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail (SHA-256 `7a6b79df81cf5d88…`).
