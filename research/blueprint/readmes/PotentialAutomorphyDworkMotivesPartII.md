# Reusable infrastructure for potential automorphy over CM fields, Part II: Dwork switching motives

The potential automorphy theorems of Harris–Shepherd-Barron–Taylor, Barnet-Lamb–Geraghty–Harris–Taylor, Barnet-Lamb–Gee–Geraghty–Taylor, Qian and Boxer–Calegari–Gee–Newton–Thorne all rest on one geometric device: the Dwork family of hypersurfaces

  X_1^N + X_2^N + ⋯ + X_N^N = N t X_1X_2⋯X_N

over the t-line, and the pieces of its middle cohomology cut out by characters of its symmetry group. A suitable piece has rank n, regular consecutive Hodge–Tate weights, huge residual monodromy, a single unipotent Jordan block at t = ∞ and ordinary reduction near t = 0. Given residual representations at two primes l and l′ with matching determinants, the moduli space of fibres whose residual representations at l and l′ are the given ones is a geometrically irreducible variety, so Moret-Bailly's theorem supplies a fibre over a controlled extension, with local conditions: Steinberg at the places above l, ordinary at the places above l′. Automorphy is then transported from l′, where the residual representation is a known automorphic one, to l: this is the *switch*.

This roadmap is that device. It starts where [Reusable infrastructure for potential automorphy over CM fields](PotentialAutomorphyInfrastructure.md) (PotentialAutomorphyInfrastructure) stops: the parent supplies the automorphy lifting theorems and the ordinarity vocabulary of Allen et al., and its Part II [polarized automorphy lifting](PotentialAutomorphyInfrastructurePartII.md) supplies the polarized theory; neither constructs a family of motives. Here the family is built once, for every exponent datum, and three versions of the switch are proved:

- the **self-dual** family of Barnet-Lamb–Geraghty–Harris–Taylor (symplectic monodromy), used in the proof of BLGGT14 Theorem 3.1.2 and its Steinberg variants (PotentialAutomorphyInfrastructurePartII PL.5, Newton–Thorne, Fakhruddin–Khare–Patrikis);
- Qian's **non-self-dual** family for n > 2, whose monodromy is the full special linear group, giving potential automorphy of residual representations of GL_n over CM fields without any self-duality (Qian, Theorems 1.1 and 1.4, in ModularityAndLanglandsExtensions ML.2);
- the **unitary case** of Boxer–Calegari–Gee–Newton–Thorne (primes l ≡ −1 mod N, monodromy SU_n), with Katz's hypergeometric description and generic crystalline ordinarity, giving the auxiliary systems R_aux and S_UA of their p–r switch (BCGNT25 Theorem 6.2.4, in ML.2).

Nothing in this roadmap proves an automorphy statement.

The layers:

| Layer | Content | Main sources |
| --- | --- | --- |
| [DM.0](#layer-dm0) | Linear algebra and finite linear groups | Beukers–Heckman via Qian Lemma 3.4; BCGNT25 §4.3; Zalesskii–Serezhkin; Artin |
| [DM.1](#layer-dm1) | The Dwork pencil and its exponent data | Qian §3, Lemmas 2.3, 3.1; BLGHT11 §4, Lemma 6.1 |
| [DM.2](#layer-dm2) | Eigen-local-systems of the Dwork pencil | Qian Proposition 3.2; BLGHT11 Lemma 4.1; Deligne §7 |
| [DM.3](#layer-dm3) | Katz's hypergeometric description | Katz 2009 Theorem 5.3; BCGNT25 Theorem 4.2.1, Lemma 4.2.4 |
| [DM.4](#layer-dm4) | Complex monodromy | Qian Lemmas 3.3–3.4, Corollary 3.5; BLGHT11 Lemma 4.3, Corollaries 4.4–4.5 |
| [DM.5](#layer-dm5) | Residual monodromy and level-structure torsors | Qian Lemma 3.7, Proposition 3.8; BLGHT11 Lemma 4.6, Corollaries 4.7–4.8; BCGNT25 §4.4 |
| [DM.6](#layer-dm6) | Frobenius, Gauss sums and determinants | Qian Lemma 3.9 and §4; BCGNT25 Proposition 4.2.5(1) |
| [DM.7](#layer-dm7) | p-adic Hodge theory and local monodromy of the fibres | Qian Lemmas 3.10–3.12; BLGHT11 Lemmas 5.1–5.3; BCGNT25 Propositions 4.2.5–4.2.6, Lemma 4.4.4; Drinfeld–Kedlaya |
| [DM.8](#layer-dm8) | Semistable models and ordinarity near infinity | Qian, Ordinarity of local Galois representations arising from Dwork motives; Qian Remark 3.13 |
| [DM.9](#layer-dm9) | Switching theorems | Qian §4; BLGGT14 Theorem 3.1.2; BCGNT25 Theorem 6.2.4 |

DM.0 and DM.1 are independent of each other and of everything else. DM.2 needs DM.1; DM.3 needs DM.2; DM.4 needs DM.0–DM.3; DM.5 needs DM.4. DM.6 needs DM.2, DM.3 and DM.5; DM.7 needs DM.4–DM.6; DM.8 needs DM.4 and DM.7; DM.9 collects everything except DM.8, which is consumed directly by ModularityAndLanglandsExtensions ML.2.

## Scope and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib supplies elementary transvection matrices and Gaussian elimination (`Matrix.transvection`, `Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec`), characteristic and minimal polynomials, special linear groups and their centres, simplicity of PSL_2 and Iwasawa's criterion, Goursat's lemma (`Subgroup.goursat`), Hilbert 90, sesquilinear forms, Gauss and Jacobi sums (`gaussSum`, `jacobiSum`), cyclotomic polynomials, smooth morphisms of schemes and fundamental groups of spaces. Neither library has étale cohomology of schemes with ℓ-adic coefficients, the Dwork family, hypergeometric sheaves, finite unitary groups, simplicity of PSL_n for n ≥ 3, or any p-adic comparison theorem at the pins.

Imports, by supplier:

| Supplier | What is used |
| --- | --- |
| PotentialAutomorphyInfrastructure (parent), PotentialAutomorphyInfrastructurePartII PL.0 | ordinary representations of weight λ and their conventions; algebraic characters with prescribed local restrictions (BLGGT14 Lemma A.2.4, restating HSBT10 Lemma 2.2) |
| ArithmeticGaloisDuality R02.4 | the obstruction to roots of characters and roots after a totally real base change avoiding a given field (Qian Lemma 2.1, BCGNT25 Lemma 5.3.3) |
| ClassicalArithmeticCompletion CA.2, CA.7 | companion matrices and their characteristic and minimal polynomials; the Galois transformation law of Gauss sums |
| FiniteFieldsAndCharacterSums FF.1 | products of Gauss sums and multi-Jacobi sums, trivial-character conventions |
| PotentialModularityAndCompatibleSystems R23.1, R24.5 | Moret-Bailly's theorem with three kinds of local conditions, over a preliminary extension and with surjective specialisation; linear disjointness in towers; weakly compatible systems, operations on them, systems of algebraic Hecke characters |
| SchemeAndStackFoundations SF.2, SF.4 | étale cohomology, smooth and proper base change, Artin comparison, lisse sheaves and π_1; strictly semistable models and equivariant toroidal semistable reduction |
| EtaleDualityAndPerverseSheaves EDC.1 | compactly supported direct images and Künneth, for multiplicative convolution |
| ComplexComparisonPartII C5 | Betti local systems of proper smooth families, relative Hodge bundles and their character summands, pure Hodge structures, log structures and log smoothness |
| LefschetzPencilsAndVanishingCycles LPV.0–LPV.2 | nearby cycles, the geometric local monodromy theorem, maximal unipotence, the Picard–Lefschetz formula in odd relative dimension and its complex comparison |
| ArithmeticGaloisRepresentations R01.2 | Grothendieck's ℓ-adic monodromy theorem |
| DeligneWeightsAndPurity DWP.3, DWP.8 | geometrically constant lisse sheaves come from the base; geometric semisimplicity of pure sheaves |
| CohomologyComparisons CP.2–CP.4, CrystallineCohomology CR.5–CR.6, PadicHodgeTheory R06.2, R06.4 | crystalline, de Rham and semistable comparison; log structures and Hyodo–Kato cohomology; period functors and the crystalline slope criterion for ordinarity; rank-two ordinarity |
| PadicDifferentialEquationsAndRigidCohomology RD.2, RD.3, RD.7 | specialisation of Newton polygons, convergent F-isocrystals, and the comparison of crystalline and ℓ-adic Frobenius polynomials (Katz–Messing) |
| AlgebraicModuliForArithmeticGeometry R09.2–R09.4, AbelianSchemesAndArithmeticModuli A6 | Isom schemes and torsors; Weil restriction |
| AutomorphicGaloisRepresentationsPartII AG2.0 | algebraic Hecke characters and their λ-adic characters; Henniart's theorem |
| LocalGaloisDeformationRings L7 | components of weight-0 crystalline lifting rings (BCGNT25 Lemmas 5.1.3–5.1.5) |
| Tau Ceti roadmaps BelyiMaps (layer 5), Chebotarev (layer 10) and ModularCurves (layer 5C) | the fundamental group of the thrice-punctured sphere; the Chebotarev density theorem; the twisted modular curve Y(ρ) for the rank-two auxiliary system |

Boundaries. The root-extraction lemma of Qian (his Lemma 2.1) belongs to ArithmeticGaloisDuality R02.4 and companion matrices to ClassicalArithmeticCompletion CA.2; both are imported. The potential automorphy theorems that use the switching points — Qian's Theorems 1.1 and 1.4, BLGGT14 Theorem 3.1.2, ACC+ Proposition 7.2.3, BCGNT25 Theorem 6.2.4 and Proposition 6.2.3 — belong to ModularityAndLanglandsExtensions ML.2 and PotentialAutomorphyInfrastructurePartII PL.5, which import the switching theorems of DM.9 and the local statements of DM.7–DM.8. The finite-group facts of DM.0 (simplicity of PSL_n and PSU_n, Artin's non-isomorphism, Zalesskii–Serezhkin) are owned here, next to their only consumers, and are imported by ArithmeticGaloisRepresentations G7 for BCGNT25 Lemma 5.2.3. Kloosterman sheaves (KloostermanMomentsAndPotentialAutomorphy KM.1) are a different family of hypergeometric sheaves and are not used.

## Conventions

N is an odd integer, prime to n, and in Qian's setting N > 100n + 100; ζ_N is a primitive N-th root of unity and τ : ℚ(ζ_N) ↪ ℂ is fixed with τ(ζ_N) = e^{2πi/N}. O = ℤ[1/(2N), ζ_N], O^+ = ℤ[1/(2N), ζ_N]^+, and M = ℚ(e^{2πi/N}) is the coefficient field of BCGNT25 (identified with ℚ(ζ_N) through τ). λ denotes a prime of O (of O^+ for the self-dual real forms) of residue characteristic l, with residue field k(λ); r is the order of l modulo N, so k(λ) = 𝔽_{l^r} for primes of O. "The unitary case" means −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^×.

Cohomology is étale or Betti cohomology in the middle degree N − 2, which is odd, so the cup product on it is alternating. Frobenius elements are geometric Frobenius and Art sends uniformisers to geometric Frobenius; the l-adic cyclotomic character ε satisfies ε(Frob_v) = q_v^{−1}. Hodge–Tate weights are labelled by embeddings and given in the cohomological convention (the Hodge–Tate weight of ℚ_l(−1) is 1). Ordinarity of weight λ is the notion of PotentialAutomorphyInfrastructurePartII PL.0.

Source abbreviations: **Qian** is Qian, *Potential automorphy for GL_n*, Invent. Math. 231 (2023), published numbering and pages; **Qian 2021** is Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106v1; **BLGHT11** is Barnet-Lamb–Geraghty–Harris–Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, author pagination; **BCGNT25** is Boxer–Calegari–Gee–Newton–Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Forum Math. Pi 13 (2025), published pages with arXiv v3 pages where useful; **Katz 2009** is Katz, *Another look at the Dwork family*; **DK17** is Drinfeld–Kedlaya, *Slopes of indecomposable F-isocrystals*, arXiv v11; **BLGGT14** is Barnet-Lamb–Gee–Geraghty–Taylor, *Potential automorphy and change of weight*, arXiv v4. Corrections to the sources are listed at the end and used in the statements.

API names are proposals for the interfaces to implement; the tests record behaviour a definition must have and cases it must distinguish. [Suggested.lean](../suggested/PotentialAutomorphyDworkMotivesPartII.lean) states the targets whose carriers exist at the pins.

<a id="layer-dm0"></a>

## Layer DM.0: Linear algebra and finite linear groups

The monodromy arguments reduce to statements about finite matrix groups. A pseudo-reflection is the local monodromy at t′ = 1; Levelt's theorem says that three matrices with product 1, one a pseudo-reflection and the other two with disjoint prescribed spectra, are determined up to conjugacy, and are companion matrices. The residual monodromy is identified by the Zalesskii–Serezhkin classification of irreducible groups generated by transvections, and the special linear, symplectic and special unitary candidates are separated by spectra. Unitary groups over finite fields enter in the unitary case, through the uniqueness of Hermitian forms. Two-prime monodromy needs simplicity of the projective groups and Artin's non-isomorphism theorem.

**Targets of the layer.**

Pure linear algebra and finite group theory used by the monodromy computations. **Objects.** Pseudo-reflections and transvections in GL(V) (DM.0/pseudo-reflection); finite unitary groups GU_n, U_n, SU_n of a quadratic extension of finite fields (DM.0/finite-unitary-group); Hermitian and skew-Hermitian forms (DM.0/hermitian-form). The companion matrix itself is imported from ClassicalArithmeticCompletion CA.2. **Theorems.** The cyclic-vector characterisation of companion matrices and the rank-one property of C(q)C(p)^{−1} − 1 (DM.0/companion-normal-form); Levelt's rigidity theorem for hypergeometric triples (DM.0/levelt-rigidity, Beukers–Heckman Theorem 3.5); absolute irreducibility of hypergeometric groups (DM.0/hypergeometric-group-irreducible, Beukers–Heckman Proposition 3.3); uniqueness of nondegenerate Hermitian forms over finite fields (DM.0/hermitian-forms-unique) and unitarity of conjugate self-dual absolutely irreducible representations (DM.0/conjugate-self-dual-is-unitary, BCGNT25 Lemma 4.3.4); normal subgroups of SL_n and SU_n over finite fields and simplicity of PSL_n, PSU_n (DM.0/special-linear-unitary-simple); Artin's non-isomorphism of simple linear groups in different characteristics (DM.0/artin-non-isomorphism); the Zalesskii–Serezhkin classification of irreducible groups generated by transvections, for n > 2 and odd characteristic (DM.0/zalesskii-serezhkin-classification); surjectivity onto a product of two groups with distinct simple quotients (DM.0/product-of-simple-images, from Mathlib's Goursat lemma).

### Pseudo-reflections and transvections

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection` (definition).** Let K be a field and V a K-vector space of finite dimension n ≥ 1. An element g ∈ GL(V) is a pseudo-reflection if g − 1 has rank exactly one, equivalently ker(g − 1) is a hyperplane. It is a transvection if moreover (g − 1)² = 0, equivalently g = 1 + v ⊗ φ for a nonzero v ∈ V and a nonzero φ ∈ V* with φ(v) = 0; equivalently g is a unipotent pseudo-reflection. A pseudo-reflection that is not a transvection is diagonalisable with eigenvalue det g ≠ 1 on a line and 1 on a hyperplane. For a subgroup G ⊆ GL(V), 'generated by transvections' means generated by its elements that are transvections.

**Named signature.** `LinearMap.IsPseudoReflection`.

**Hypotheses and conventions.**

- Rank is taken over K; for a field extension K′/K, g is a pseudo-reflection (resp. transvection) over K iff it is one over K′.
- The identity is neither a pseudo-reflection nor a transvection.

**Construction.**

1. rank(g − 1) = 1 gives g − 1 = v ⊗ φ with v, φ nonzero; then (g − 1)² = φ(v)·(g − 1), so g is unipotent iff φ(v) = 0, and otherwise g has eigenvalue 1 + φ(v) = det g on v.
2. The characteristic polynomial of a pseudo-reflection is (X − 1)^{n−1}(X − det g); a transvection has characteristic polynomial (X − 1)^n and determinant 1.
3. Conjugation, inversion and extension of scalars preserve both notions; Mathlib's elementary matrix Matrix.transvection i j c (i ≠ j, c ≠ 0) is a transvection in this sense, and SL_n(K) is generated by such matrices (Gaussian elimination, Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec).

**Inputs.** `mathlib:Matrix.transvection`, `mathlib:Matrix.TransvectionStruct`, `mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec`, `mathlib:Matrix.charpoly`, `mathlib:Matrix.rank`.

**API.**

- `LinearMap.IsPseudoReflection` (constructor): g is a pseudo-reflection iff finrank (range (g − 1)) = 1.
- `LinearMap.IsTransvection` (constructor): g is a transvection iff it is a pseudo-reflection and (g − 1)² = 0.
- `LinearMap.IsPseudoReflection.exists_eq_one_add` (characterisation): A pseudo-reflection is 1 + v ⊗ φ with v ≠ 0, φ ≠ 0; it is a transvection iff φ(v) = 0.
- `LinearMap.IsPseudoReflection.charpoly` (characterisation): charpoly g = (X − 1)^{n−1}(X − det g).
- `LinearMap.IsTransvection.det` (simp): det g = 1 for a transvection.
- `LinearMap.IsPseudoReflection.conj` (functoriality): Conjugates and inverses of pseudo-reflections (transvections) are pseudo-reflections (transvections).
- `LinearMap.IsPseudoReflection.baseChange` (compatibility): The notions are invariant under extension of scalars K → K′.
- `Matrix.transvection_isTransvection` (compatibility): For i ≠ j and c ≠ 0, Mathlib's Matrix.transvection i j c is a transvection.
- `Matrix.SpecialLinearGroup.closure_transvections` (relation): SL_n(K) is the subgroup generated by its transvections.

**Unit tests.**

- `isPseudoReflection_diag` (computation): Over ℚ, diag(1, 2) is a pseudo-reflection with determinant 2 and is not a transvection.
- `not_isPseudoReflection_one` (degenerate): The identity of GL_n(K) is not a pseudo-reflection (rank(1 − 1) = 0).
- `isTransvection_matrix_transvection` (compatibility): Matrix.transvection 0 1 1 ∈ GL_2(ZMod 3) is a transvection.
- `not_isPseudoReflection_neg_one` (non-example): −1 ∈ GL_2(ℚ) is not a pseudo-reflection: −1 − 1 = −2 has rank 2 (a definition requiring only det ≠ 1 fails).
- `not_isTransvection_unipotent_rank_two` (non-example): The 3 × 3 unipotent Jordan block is unipotent but not a transvection: g − 1 has rank 2.

**Uses.**

- QIAN23 Lemma 3.3(3), Lemma 3.7 (DM.4/picard-lefschetz-at-one, DM.5/residual-monodromy-sl): the local monodromy at 1 is a transvection and the residual monodromy is generated by transvections
- BH89 Theorem 3.5, as used in QIAN23 Lemma 3.4 (DM.0/levelt-rigidity): the pseudo-reflection hypothesis of Levelt's theorem
- ZS76 main theorem, as used in QIAN23 Lemma 3.7 (DM.0/zalesskii-serezhkin-classification): the class of groups classified

**Checks.**

- diag(1, …, 1, a) with a ≠ 0, 1 is a pseudo-reflection and not a transvection; the 2 × 2 matrix [[1, 1], [0, 1]] is a transvection.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.3(3), p. 1257. Defines a transvection as a unipotent element whose fixed space has dimension n − 1, and asserts that the local monodromy at t′ = 1 is one.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.6, pp. 31–32 (author copy). Uses that the residual monodromy is generated by elements with characteristic polynomial (X − 1)^n and fixed space of dimension at least n − 1, i.e. by transvections.
- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.4 and its proof, pp. 1258–1259. The relation γ_0γ_1γ_∞ = 1 with γ_1 acting by a pseudo-reflection is the input of Levelt's theorem.

### Cyclic vectors and the companion normal form

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form` (theorem).** Let K be a field and C(p) the companion matrix of a monic p ∈ K[X] of degree n ≥ 1 (ClassicalArithmeticCompletion CA.2: ones on the subdiagonal, last column −(coefficients of p)), so C(p)e_i = e_{i+1} for i < n. (1) A ∈ M_n(K) is conjugate to C(charpoly A) iff A has a cyclic vector. (2) C(p) is cyclic with minimal polynomial p; in particular C((X − 1)^n) is conjugate to a single unipotent Jordan block of size n. (3) For monic p, q of degree n with p(0) ≠ 0, the matrix C(q)C(p)^{−1} fixes e_2, …, e_n, so it differs from the identity only in its first column and C(q)C(p)^{−1} − 1 has rank one when p ≠ q.

**Named signature.** `Polynomial.companion_conj_iff_cyclic`.

**Hypotheses and conventions.**

- Orientation as in QIAN23 Lemma 3.4 and BLGHT11 Corollary 4.4, which agrees with CA.2's convention.

**Proof outline.**

1. (1): if v is cyclic, then in the basis v, Av, …, A^{n−1}v the matrix of A is C(charpoly A); conversely e_1 is cyclic for C(p).
2. (2): the minimal polynomial of C(p) is p (CA.2, Polynomial.minpoly_companion); a matrix with minimal polynomial (X − 1)^n of degree n is a single Jordan block.
3. (3): C(p)^{−1}e_{i+1} = e_i for 1 ≤ i < n, so C(q)C(p)^{−1}e_{i+1} = C(q)e_i = e_{i+1}; if p ≠ q the first column differs from e_1.

**Inputs.** `ClassicalArithmeticCompletion:CA.2/companion-matrix`, `ClassicalArithmeticCompletion:CA.2/characteristic-polynomial-of-the-companion-matrix`, `mathlib:Matrix.charpoly`, `mathlib:minpoly`.

**Checks.**

- C((X − 1)²) = [[0, −1], [1, 2]] is conjugate to [[1, 1], [0, 1]] and not to the identity.
- For p = (X − 1)² and q = (X − 2)(X − 4) over ℚ, C(q)C(p)^{−1} − 1 has rank one.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.4, display of A and B, p. 1258; shape of BA^{−1}, p. 1259. Uses the companion matrices with ones on the subdiagonal and coefficient columns, and records that BA^{−1} differs from the identity only in its first column; observes that A has minimal polynomial (X − 1)^n.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Corollary 4.4, pp. 30–31. The same matrices A and B for the self-dual exponent set.

### Levelt's rigidity theorem for hypergeometric triples

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/levelt-rigidity` (theorem).** Let K be a field, n ≥ 1, and α_1, …, α_n, β_1, …, β_n ∈ K̄^× with α_j ≠ β_k for all j, k; put p = ∏(X − α_j), q = ∏(X − β_j), assumed to lie in K[X]. Let A = C(p) and B = C(q) be the companion matrices. If h_0, h_∞ ∈ GL_n(K) satisfy: h_∞ has characteristic polynomial p, h_0^{−1} has characteristic polynomial q, and h_1 := h_0^{−1}h_∞^{−1} is a pseudo-reflection, then there is g ∈ GL_n(K) with gh_∞g^{−1} = A and gh_0g^{−1} = B^{−1}, hence gh_1g^{−1} = BA^{−1}. Conversely (h_0, h_∞) = (B^{−1}, A) satisfies the hypotheses. In particular a triple (h_0, h_1, h_∞) with h_0h_1h_∞ = 1, h_1 a pseudo-reflection and prescribed characteristic polynomials of h_0 and h_∞ with no common root of p and q is unique up to simultaneous conjugation.

**Named signature.** `Matrix.levelt_rigidity`.

**Hypotheses and conventions.**

- α_j ≠ β_k for all j, k (no common eigenvalue of h_∞ and h_0^{−1})
- h_1 = h_0^{−1}h_∞^{−1} is a pseudo-reflection (DM.0/pseudo-reflection)

**Proof outline.**

1. Put X = h_∞ and Y = h_0^{−1}; then X − Y = X(1 − h_1^{−1}) up to the order of factors, so X and Y differ by a matrix of rank one and W = ker(X − Y) is a hyperplane.
2. The intersection W ∩ X^{−1}W ∩ ⋯ ∩ X^{−(n−2)}W is nonzero; pick e ≠ 0 in it, so that X^je ∈ W, hence X^{j+1}e = YX^je, for 0 ≤ j ≤ n − 2.
3. If e, Xe, …, X^{n−1}e spanned a proper subspace U, then U would be stable under X and under Y (which agrees with X on U ∩ W ⊇ span of the first n − 1 vectors and preserves U by the previous step), and X, Y would agree on a nonzero quotient or subspace, giving a common eigenvalue; contradiction. So these vectors form a basis.
4. In this basis X is the companion matrix of its characteristic polynomial p and Y the companion matrix of q (both act as the shift on the first n − 1 basis vectors), which is the claim.
5. Uniqueness up to conjugacy follows because both triples are conjugate to (B^{−1}, BA^{−1}, A).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection`, `PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form`.

**Checks.**

- n = 1: with h_∞ = α and h_0 = β^{−1}, h_1 = βα^{−1} is a pseudo-reflection of the line exactly when α ≠ β, and g = 1 conjugates the pair to (C(X − β)^{−1}, C(X − α)).
- For p = (X − 1)^n and q = ∏_{b∈B}(X − ζ_N^{−b}) the theorem identifies the Dwork monodromy (QIAN23 Lemma 3.4).

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.4 and its proof, pp. 1258–1259. Asserts that the Dwork monodromy and the companion representation are equivalent over ℂ, citing Theorem 3.5 of Beukers–Heckman.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Corollary 4.4, p. 31. Deduces the companion normal form of the self-dual Dwork monodromy from Levelt's theorem (Levelt, Theorem 1.1) and Beukers–Heckman Theorem 3.5.
- Frits Beukers, Gert Heckman, *Monodromy for the hypergeometric function nF(n−1)*, Theorem 3.5 (Levelt), as cited by QIAN23 and BLGHT11. Levelt's theorem: a hypergeometric group with prescribed eigenvalues at 0 and ∞ and a pseudo-reflection at 1 is unique up to conjugation and given by companion matrices.

### Irreducibility of hypergeometric groups

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/hypergeometric-group-irreducible` (theorem).** Let K be a field and h_0, h_1, h_∞ ∈ GL_n(K) with h_0h_1h_∞ = 1 and h_1 a pseudo-reflection. If h_∞ and h_0^{−1} have no common eigenvalue in K̄, then the subgroup ⟨h_0, h_∞⟩ acts absolutely irreducibly on K^n.

**Named signature.** `Matrix.hypergeometric_group_irreducible`.

**Hypotheses and conventions.**

- h_0h_1h_∞ = 1 with h_1 a pseudo-reflection
- h_∞ and h_0^{−1} have no common eigenvalue in an algebraic closure of K

**Proof outline.**

1. Work over K̄. Let 0 ≠ U ⊊ K̄^n be stable under h_0 and h_∞, hence under h_1. The image of h_1 − 1 is a line L.
2. If L ⊆ U, then h_1 acts trivially on K̄^n/U; otherwise (h_1 − 1)U ⊆ U ∩ L = 0 and h_1 acts trivially on U.
3. On the piece (U or K̄^n/U) where h_1 acts trivially, h_0h_∞ = 1, so h_∞ and h_0^{−1} agree there and share an eigenvalue: contradiction.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection`.

**Checks.**

- For n = 2, K = 𝔽_7, h_∞ = C((X − 1)²) and h_0 = C((X − 2)(X − 4))^{−1}, the group ⟨h_0, h_∞⟩ has no invariant line.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Paragraph after Definition 3.6, p. 1259. Shows the reduction of the companion representation modulo λ is absolutely irreducible by this argument, following Beukers–Heckman Proposition 3.3.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.6, p. 31. Uses the same argument for the self-dual family modulo λ.
- Frits Beukers, Gert Heckman, *Monodromy for the hypergeometric function nF(n−1)*, Proposition 3.3, as cited by QIAN23 and BLGHT11. Irreducibility criterion for hypergeometric groups.

### Finite unitary groups

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group` (definition).** Let k be a finite field, ℓ/k its quadratic extension with Galois generator c, and for M ∈ M_n(ℓ) put M† = (M^c)ᵀ. The general unitary group is GU_n(ℓ) = {M ∈ GL_n(ℓ) : M†M = ν(M)·1 for some ν(M) ∈ k^×}, with multiplier character ν : GU_n(ℓ) → k^×. The unitary group is U_n(ℓ) = ker ν and the special unitary group is SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ). For a finite field k′ of even degree over 𝔽_l with σ its automorphism of order two, SU(n, k′) = {g ∈ SL_n(k′) : σ(g)ᵀg = 1} is SU_n(k′) for the quadratic extension k′/k′^σ.

**Named signature.** `Matrix.IsSpecialUnitaryConj`.

**Hypotheses and conventions.**

- BCGNT25 Definition 4.3.1 writes SU_n(ℓ) for ker ν; the groups used afterwards (Proposition 4.4.2, Lemma 5.2.3) are U_n(ℓ) ∩ SL_n(ℓ), as here (sourceIssue PotentialAutomorphyDworkMotivesPartII/E1).

**Construction.**

1. M ↦ M† is an anti-automorphism of M_n(ℓ) with (AB)† = B†A† and M†† = M; so GU_n(ℓ) is a subgroup and ν is a homomorphism.
2. For M ∈ GU_n(ℓ), N_{ℓ/k}(det M) = ν(M)^n; hence det maps U_n(ℓ) onto the norm-one subgroup of ℓ^× (onto by Hilbert 90 applied to diagonal matrices) and SU_n(ℓ) has index q + 1 in U_n(ℓ), q = #k.
3. Changing the Hermitian form by an equivalence conjugates these groups inside GL_n(ℓ) (DM.0/hermitian-forms-unique).

**Inputs.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:Matrix.conjTranspose`, `mathlib:FiniteField.frobenius_pow`.

**API.**

- `Matrix.adjointConj` (constructor): M† = (M^c)ᵀ for the nontrivial automorphism c of ℓ/k.
- `Matrix.adjointConj_mul` (simp): (AB)† = B†A†; also M†† = M when c is an involution.
- `Matrix.IsGeneralUnitaryWith` (constructor): M lies in GU_n(ℓ) with multiplier a: a ≠ 0, c(a) = a and M†M = a·1.
- `Matrix.IsUnitaryConj` (constructor): M lies in U_n(ℓ): M†M = 1.
- `Matrix.IsSpecialUnitaryConj` (constructor): M lies in SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ).
- `Matrix.IsGeneralUnitaryWith.norm_det` (relation): If M ∈ GU_n(ℓ) with multiplier a then c(det M)·det M = a^n.
- `Matrix.isGeneralUnitaryWith_scalar` (example): A nonzero scalar b·1 lies in GU_n(ℓ) with multiplier c(b)b.
- `Matrix.GU` (structure): GU_n(ℓ) as a subgroup of GL_n(ℓ), with the multiplier homomorphism ν : GU_n(ℓ) → k^×; U_n(ℓ) = ker ν and SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ) as subgroups.
- `Matrix.card_SU` (example): #SU_n(𝔽_{q²}) = q^{n(n−1)/2} ∏_{i=2}^{n} (q^i − (−1)^i).
- `Matrix.SU_conj_of_hermitian_equiv` (compatibility): For a nondegenerate Hermitian form with Gram matrix A = PP† the group {M : M†AM = A} ∩ SL_n is conjugate to SU_n(ℓ) by P.

**Unit tests.**

- `card_U_one` (computation): U_1(𝔽_9) is the group of norm-one elements of 𝔽_9^×, of order 4.
- `SU_one_trivial` (degenerate): SU_1(ℓ) is trivial for every quadratic extension ℓ/k.
- `SU_two_eq_SL_two_image` (compatibility): SU_2(𝔽_{q²}) ≅ SL_2(𝔽_q); in particular #SU_2(𝔽_9) = 24.
- `U_ne_SU` (non-example): U_2(𝔽_9) ≠ SU_2(𝔽_9): diag(ζ, 1) with ζ of norm one and ζ ≠ 1 lies in U_2 but has determinant ζ ≠ 1 (BCGNT25's literal ker ν is not the special unitary group).
- `multiplier_scalar` (characterisation): For a ∈ ℓ^×, the scalar a·1 lies in GU_n(ℓ) with ν(a·1) = N_{ℓ/k}(a).

**Uses.**

- BCGNT25 Lemma 4.3.4 (DM.0/conjugate-self-dual-is-unitary): the target group of a conjugate self-dual representation
- BCGNT25 Proposition 4.4.2 (DM.5/residual-monodromy-su): the geometric monodromy group when −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^×
- QIAN23 Lemma 3.7 (DM.5/residual-monodromy-sl): one of the three groups excluded by the stabiliser lemma
- BCGNT25 Remark 4.4.3 and proof of Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): r̄_aux takes values in GU_m(𝔽_{p²}) with multiplier ε̄^{1−m}

**Checks.**

- #U_1(𝔽_9) = 4 (the norm-one elements of 𝔽_9^×) and SU_1(𝔽_9) is trivial.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.3, Definition 4.3.1, published p. 40 (arXiv v3 p. 45). Defines the adjoint M†, the group GU_n(ℓ) of matrices with M†M scalar in k^×, and its multiplier.
- Lie Qian, *Potential automorphy for GL_n*, Proof of Lemma 3.7, p. 1260. Defines SU(n, k) = {g ∈ SL_n(k) : σ(g)ᵀg = 1} for k of even degree over 𝔽_l.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.6, pp. 31–32. The same group SU(n, k), and the remark that its traces lie in the fixed field of σ when n = 2.

### Hermitian and skew-Hermitian forms over a quadratic extension

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form` (definition).** Let ℓ/k be a quadratic extension of fields with nontrivial automorphism c, and V a finite-dimensional ℓ-vector space. A Hermitian form on V is a k-bilinear map ⟨·,·⟩ : V × V → ℓ with ⟨ax, y⟩ = a⟨x, y⟩, ⟨x, ay⟩ = c(a)⟨x, y⟩ for a ∈ ℓ, and ⟨y, x⟩ = c(⟨x, y⟩). It is skew-Hermitian if instead ⟨y, x⟩ = −c(⟨x, y⟩). Nondegenerate means that x ↦ ⟨x, ·⟩ is injective. Multiplying by η ∈ ℓ^× with c(η) = −η interchanges Hermitian and skew-Hermitian forms. The isometry group of ⟨·,·⟩ and its similitude group (isometries up to a scalar in k^×) are defined as usual; for the standard form ⟨x, y⟩ = ∑ x_i c(y_i) they are U_n(ℓ) and GU_n(ℓ).

**Named signature.** `LinearMap.IsHermitian`.

**Hypotheses and conventions.**

- Bilinearity is over k; the form is ℓ-linear in the first and c-semilinear in the second variable (BCGNT25 convention).

**Construction.**

1. Hermitian forms are the sesquilinear forms for the ring involution c whose Gram matrix satisfies A† = A.
2. If c(η) = −η then η⟨·,·⟩ is skew-Hermitian when ⟨·,·⟩ is Hermitian and conversely (BCGNT25 Remark 4.3.3).
3. Similitudes form a group, with multiplier a homomorphism to k^×.

**Inputs.** `mathlib:LinearMap.IsSymm`, `mathlib:LinearMap.SeparatingLeft`, `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group`.

**API.**

- `LinearMap.IsHermitian` (constructor): A sesquilinear form B : V →ₗ[ℓ] V →ₛₗ[c] ℓ is Hermitian iff B y x = c (B x y).
- `LinearMap.IsSkewHermitian` (constructor): B y x = −c (B x y).
- `LinearMap.IsHermitian.smul_skew` (relation): If c η = −η, then η • B is skew-Hermitian iff B is Hermitian.
- `LinearMap.IsHermitian.gram` (characterisation): In a basis, B is Hermitian iff its Gram matrix A satisfies A† = A.
- `LinearMap.similitudeGroup` (constructor): The group of g ∈ GL(V) with B(gx, gy) = ν(g)B(x, y), ν(g) ∈ k^×, with multiplier ν.
- `LinearMap.similitudeGroup_standard` (compatibility): For the standard form on ℓ^n the similitude group is GU_n(ℓ) and the isometry group is U_n(ℓ).

**Unit tests.**

- `hermitian_standard_one` (computation): On 𝔽_9 over 𝔽_3 the form (x, y) ↦ x·y³ is Hermitian and nondegenerate.
- `hermitian_zero` (degenerate): The zero form is Hermitian and skew-Hermitian, and is degenerate unless V = 0.
- `hermitian_iff_conjTranspose` (compatibility): A form on ℓ^n is Hermitian iff its Gram matrix A satisfies A.conjTranspose = A for the star structure given by c.
- `not_hermitian_symmetric_bilinear` (non-example): The ℓ-bilinear symmetric form (x, y) ↦ xy on 𝔽_9 is not Hermitian: it is ℓ-linear rather than c-semilinear in y.

**Uses.**

- BCGNT25 Lemma 4.3.4 (DM.0/conjugate-self-dual-is-unitary): the invariant form built from a conjugate self-duality
- BCGNT25 Definition 4.4.1(3) (DM.5/level-structure-torsor): the pairing data on the residual representation in the unitary case
- BCGNT25 §4.4, the pairing ⟨·,·⟩_{W̄_λ} (DM.5/hermitian-poincare-pairing): the Dwork side carries a skew-Hermitian pairing

**Checks.**

- On ℓ = 𝔽_9 ⊃ k = 𝔽_3, ⟨x, y⟩ = x c(y) = x y³ is a nondegenerate Hermitian form on ℓ.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.3, Definition 4.3.2 and Remark 4.3.3, published p. 40 (arXiv v3 p. 45). Defines Hermitian forms for a quadratic extension of finite fields and observes that scaling by an element of trace zero gives the skew version.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.4, Definition 4.4.1(3), published p. 41 (arXiv v3 p. 46). The pairings on the level-structure data are Hermitian up to such a scalar.

### Uniqueness of nondegenerate Hermitian forms over finite fields

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique` (theorem).** Let ℓ/k be a quadratic extension of finite fields and V an ℓ-vector space of dimension n. Every nondegenerate Hermitian form on V has an orthonormal basis; hence any two nondegenerate Hermitian forms on V are isometric, and the isometry group of any of them is conjugate in GL(V) to U_n(ℓ) (and its similitude group to GU_n(ℓ)).

**Named signature.** `LinearMap.IsHermitian.exists_orthonormal_basis`.

**Hypotheses and conventions.**

- k finite (surjectivity of the norm ℓ^× → k^× is used)

**Proof outline.**

1. A nonzero Hermitian form has an anisotropic vector: if ⟨x, x⟩ = 0 for all x, polarisation ⟨x + ay, x + ay⟩ = Tr_{ℓ/k}(c(a)⟨x, y⟩) for all a forces ⟨x, y⟩ = 0, using surjectivity of the trace.
2. For x with ⟨x, x⟩ = d ∈ k^×, choose a ∈ ℓ^× with N(a) = d^{−1} (the norm of finite fields is surjective) and replace x by ax, of length 1.
3. Split off the line and induct on the orthogonal complement, which is nondegenerate.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form`, `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group`, `mathlib:FiniteField.exists_root_sum_quadratic`.

**Checks.**

- On 𝔽_9² the forms with Gram matrices diag(1, 1) and diag(1, −1) are isometric (−1 = N(i) with i² = −1 in 𝔽_9).

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Lemma 4.3.4, published p. 41 (arXiv v3 p. 46). Uses that there is a unique equivalence class of nondegenerate Hermitian forms for a quadratic extension of finite fields, citing Lewis §4.
- D. W. Lewis, *The isometry classification of Hermitian forms over division algebras*, §4, as cited by BCGNT25. Isometry classification of Hermitian forms; over finite fields there is one class in each dimension.

### Conjugate self-dual absolutely irreducible representations are unitary

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/conjugate-self-dual-is-unitary` (theorem).** Let ℓ/k be a quadratic extension of finite fields with generator c, G a group, V an ℓ-vector space of dimension n with an absolutely irreducible representation of G, and χ : G → k^× a character. If there is an ℓ-linear G-isomorphism V^∨ ≅ V^c ⊗ χ^{−1}, then V carries a nondegenerate G-invariant-up-to-χ Hermitian form, unique up to k^×-scaling, and in a suitable basis the representation takes values in GU_n(ℓ) with multiplier χ.

**Named signature.** `Representation.exists_hermitian_of_conj_self_dual`.

**Hypotheses and conventions.**

- V absolutely irreducible
- the isomorphism V^∨ ≅ V^c ⊗ χ^{−1} is ℓ-linear and G-equivariant
- χ takes values in k^×

**Proof outline.**

1. The isomorphism is a nondegenerate G-equivariant pairing ψ : V × V^c → χ; by Schur's lemma it is unique up to ℓ^×.
2. ψ′(x, y^c) := c(ψ(y, x^c)) is another such pairing, so ψ′ = λψ; applying twice gives N_{ℓ/k}(λ) = 1.
3. By Hilbert 90, λ = c(η)/η; rescaling ψ by η^{−1} gives a Hermitian form ⟨x, y⟩ = ψ(x, y^c) with ⟨gx, gy⟩ = χ(g)⟨x, y⟩.
4. By DM.0/hermitian-forms-unique choose an orthonormal basis; then G lands in GU_n(ℓ) with multiplier χ.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique`, `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group`, `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form`, `mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`.

**Checks.**

- For n = 1 and G acting on ℓ through a character θ with θ·c(θ) = χ, the conclusion is that θ takes values in the norm-χ elements.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.3, Lemma 4.3.4 and its proof, published pp. 40–41 (arXiv v3 pp. 45–46). States and proves that a conjugate self-dual absolutely irreducible representation over a finite field is unitary, via Schur's lemma, Hilbert 90 and uniqueness of Hermitian forms.

### Normal subgroups of SL_n and SU_n over finite fields

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple` (theorem).** Let k be a finite field of characteristic l > 2 with q elements and n ≥ 2. (1) SL_n(k) is perfect, its centre is the group μ_n(k) of scalar matrices, every proper normal subgroup is central, and PSL_n(k) = SL_n(k)/μ_n(k) is a nonabelian simple group, except for (n, q) = (2, 3). (2) For the quadratic extension ℓ/k and n ≥ 3, SU_n(ℓ) is perfect, its centre consists of the scalars of SU_n(ℓ), every proper normal subgroup is central, and PSU_n(ℓ) is a nonabelian simple group (n ≥ 3, q odd). (3) Consequently the composition factors of SL_n(k) (resp. SU_n(ℓ)) are PSL_n(k) (resp. PSU_n(ℓ)) and cyclic groups of order dividing n, every nontrivial quotient has PSL_n(k) (resp. PSU_n(ℓ)) as a composition factor, and these groups have no nontrivial abelian quotient.

**Named signature.** `Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup`.

**Hypotheses and conventions.**

- l odd (the exceptional small cases (2, 2), (2, 3), (3, 2) for SU_3 are excluded or have even characteristic)
- n ≥ 2 for SL_n, n ≥ 3 for SU_n

**Proof outline.**

1. SL_n(k) is generated by transvections (DM.0/pseudo-reflection) and acts primitively on lines of k^n; the stabiliser of a line contains the abelian normal subgroup of transvections with that centre, whose conjugates generate SL_n(k); perfectness for (n, q) ≠ (2, 2), (2, 3) follows from commutators of transvections; Iwasawa's criterion (Mathlib MulAction.IwasawaStructure.isSimpleGroup) gives simplicity of PSL_n(k). The rank-two case is Mathlib's Matrix.ProjectiveSpecialLinearGroup.rank_two_simple.
2. For SU_n(ℓ), n ≥ 3, apply Iwasawa's criterion to the action on isotropic lines, with the unipotent radical of an isotropic-line stabiliser as abelian (n = 3: nilpotent of class two, handled by its centre) normal subgroup; generation by unitary transvections and perfectness hold for odd q.
3. The centre of SL_n(k) is the scalars by Mathlib Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity; a central quotient is cyclic of order dividing n, which gives (3).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection`, `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group`, `mathlib:MulAction.IwasawaStructure.isSimpleGroup`, `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`, `mathlib:Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity`, `mathlib:Matrix.SL2.commutator_eq_top`.

**Checks.**

- PSL_3(𝔽_3) is simple of order 5616; SL_2(𝔽_3) is not perfect (its abelianisation has order 3), which is why (2, 3) is excluded.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Last paragraph of the proof of Lemma 3.7, p. 1260, and proof of Proposition 3.8, p. 1261. Uses that the cyclic composition factors of SL_n(k(λ)) have order dividing n and that every nontrivial quotient of SL_n over a field of characteristic > 10 has PSL_n as a composition factor.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §5.2, Lemma 5.2.3, published pp. 45–46 (arXiv v3 pp. 50–51). States perfectness of SL_n and SU_n in the relevant range and simplicity of PSL_n and PSU_n, used in Proposition 4.4.2.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proofs of Corollaries 4.7 and 4.8, pp. 32–33. The symplectic analogue: the only cyclic composition factors of Sp_n(𝔽_{l^r}) have order 2 or 3, and PSp_n is simple outside Sp_2(𝔽_3).

### Simple linear groups in different characteristics are not isomorphic

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism` (theorem).** Let n ≥ 2 and let l_1 ≠ l_2 be odd primes with max(l_1, l_2) > 10, and let k_1, k_2 be finite fields of characteristics l_1, l_2. Then PSL_n(k_1) is not isomorphic to PSL_n(k_2) or to PSU_n(k_2′) (k_2′/k_2 quadratic, n ≥ 3), and likewise with the roles reversed; and PSp_n(k_1) ≇ PSp_n(k_2) for n even. Consequently no composition factor of SL_n(k_2) or SU_n(k_2′) is isomorphic to PSL_n(k_1) or PSU_n(k_1′).

**Named signature.** `Matrix.ProjectiveSpecialLinearGroup.not_mulEquiv_of_char_ne`.

**Hypotheses and conventions.**

- l_1, l_2 odd and distinct
- max(l_1, l_2) > 10 excludes the coincidences in small characteristic (e.g. PSL_2(𝔽_4) ≅ PSL_2(𝔽_5), PSL_2(𝔽_7) ≅ PSL_3(𝔽_2))

**Proof outline.**

1. Artin's theorem compares the orders of the finite classical simple groups: apart from an explicit finite list of coincidences, the order determines the type and the field (Artin 1955, Theorem 2, as cited); none of the listed coincidences has both characteristics odd with one of them > 10.
2. The second statement follows from DM.0/special-linear-unitary-simple(3): the noncyclic composition factor of SL_n(k_2) is PSL_n(k_2).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple`.

**Checks.**

- PSL_2(𝔽_{11}) (order 660) is not isomorphic to PSL_2(𝔽_{3^r}) for any r, since 660 is not of the form 3^r(3^{2r} − 1)/2.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proof of Proposition 3.8, p. 1261. Excludes an isomorphism between quotients of SL_n over fields of different characteristics, one of them > 10, citing Artin's theorem on the orders of classical simple groups.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Corollary 4.8, p. 33. For primes l ≠ l′ both > 2, PSp_n(𝔽_{l^r}) and PSp_n(𝔽_{l′^s}) are not isomorphic.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §5.2, Lemma 5.2.3, published pp. 45–46. The non-isomorphism of the projective special linear and unitary groups attached to different primes, used in Proposition 4.4.2.
- Emil Artin, *The orders of the classical simple groups*, Theorem 2, as cited by QIAN23. Orders of the classical simple groups determine them up to listed exceptions.

### Irreducible groups generated by transvections (Zalesskii–Serezhkin), in the form used

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification` (theorem).** Let l be an odd prime, n > 2 and k′ a finite field of characteristic l. Let G ⊆ GL_n(k′) be an absolutely irreducible subgroup generated by transvections. Then G is conjugate in GL_n(k′) to SL_n(k), Sp_n(k) or SU(n, k) (DM.0/finite-unitary-group) for some subfield k ⊆ k′ (Sp_n only for n even, SU(n, k) only for [k : 𝔽_l] even). The statement is false for n = 2 (SL_2(𝔽_5) ⊂ SL_2(𝔽_9) is generated by its elements of order 3, which are transvections).

**Named signature.** `Matrix.zalesskii_serezhkin`.

**Hypotheses and conventions.**

- n > 2
- l odd
- G absolutely irreducible and generated by transvections

**Proof outline.**

1. This is the case of odd characteristic and dimension at least three of the main theorem of Zalesskii–Serezhkin on finite linear groups generated by transvections; the exceptional groups of their list occur only in characteristic 2 or 3 with small n, or are not absolutely irreducible, and are excluded in the range of use.
2. In both applications (QIAN23 Lemma 3.7 and BCGNT25 Proposition 4.4.2) the group contains the image of γ_0, of order N > 100n + 100, which rules out any exceptional group of bounded order.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection`, `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group`.

**Checks.**

- For n = 2 the conclusion fails: SL_2(𝔽_5) embeds in SL_2(𝔽_9) as an absolutely irreducible subgroup generated by transvections that is none of SL_2(k), SU(2, k).

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proof of Lemma 3.7, p. 1260. Applies the main theorem of Zalesskii–Serezhkin to the residual monodromy, generated by transvections, to obtain SL_n(k), Sp_n(k) or SU(n, k) for a subfield k.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.6, pp. 31–32. The same classification for the self-dual family.
- A. E. Zalesskii, V. N. Serezhkin, *Linear groups generated by transvections*, Main theorem, as cited by QIAN23 and BLGHT11. Classification of finite irreducible linear groups generated by transvections.

### Surjectivity onto a product of two groups with distinct simple quotients

**Target `PotentialAutomorphyDworkMotivesPartII:DM.0/product-of-simple-images` (theorem).** Let H_1, H_2 be finite groups such that, for i = 1, 2, every nontrivial quotient of H_i has a composition factor isomorphic to a fixed nonabelian simple group S_i, and suppose no composition factor of H_2 is isomorphic to S_1 (or no composition factor of H_1 is isomorphic to S_2). If a subgroup Γ ⊆ H_1 × H_2 surjects onto both factors, then Γ = H_1 × H_2.

**Named signature.** `Subgroup.eq_top_of_surjective_of_simple_quotients`.

**Hypotheses and conventions.**

- Γ projects onto H_1 and onto H_2

**Proof outline.**

1. By Goursat's lemma (Mathlib Subgroup.goursat) Γ is the preimage of the graph of an isomorphism H_1/N_1 ≅ H_2/N_2 for normal subgroups N_i.
2. If N_1 ≠ H_1, then H_1/N_1 has S_1 as a composition factor, but H_1/N_1 ≅ H_2/N_2 has only composition factors of H_2: contradiction. Hence N_1 = H_1, N_2 = H_2 and Γ = H_1 × H_2.

**Inputs.** `mathlib:Subgroup.goursat`, `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple`, `PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism`.

**Checks.**

- For H_1 = SL_3(𝔽_{13}) and H_2 = SL_3(𝔽_{3^r}) every subgroup of H_1 × H_2 surjecting on both factors is everything.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proof of Proposition 3.8, p. 1261. Combines Goursat's lemma with the normal subgroups of SL_n and Artin's theorem to show the two-prime monodromy is the full product.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Proposition 4.4.2, published p. 42. Goursat's lemma with Lemma 5.2.3 for products of SL_n and SU_n.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Corollary 4.8, p. 33. The symplectic version.

<a id="layer-dm1"></a>

## Layer DM.1: The Dwork pencil and its exponent data

The Dwork pencil, its group H of diagonal symmetries, and the exponent data that select a piece of its cohomology. Qian's asymmetric data have an index set B with trivial multiplicative stabiliser, which is what prevents self-duality and forces full SL_n monodromy; the self-dual data of BLGHT11 have B = −B. The quotient family over the thrice-punctured line carries the monodromy computations.

**Targets of the layer.**

**Objects.** For N odd, the Dwork pencil Y: ∑X_i^N = N t ∏X_i over T_0 = ℙ¹ − ({∞} ∪ μ_N) over ℤ[1/N] (DM.1/dwork-pencil); its symmetry groups H = μ_N^N/μ_N ⊃ H_0 and the involution ς, the characters ξ ↦ ∏ξ_i^{a_i} and the isotypic idempotents (DM.1/dwork-symmetry-groups); Dwork exponent data with their index sets B (Qian's asymmetric data for n > 2 and the self-dual data of BLGHT11) (DM.1/dwork-exponent-datum); the quotient family over the thrice-punctured line T′_0 and the cover t ↦ t^N (DM.1/three-punctured-cover). **Theorems.** The auxiliary modulus N with prescribed order of l and N ∤ l^{r/2} + 1 (DM.1/auxiliary-modulus; QIAN23 Lemma 2.3, BLGHT11 Lemma 6.1); trivial multiplicative stabiliser of Qian's index set (DM.1/asymmetric-stabiliser-trivial; QIAN23 Lemma 3.1).

### Auxiliary moduli with prescribed order of l

**Target `PotentialAutomorphyDworkMotivesPartII:DM.1/auxiliary-modulus` (theorem).** Let l be a prime, s ≥ 1 an integer and S a finite set of primes. There is a positive integer N, divisible by no prime of S ∪ {l}, such that the order r of l in (ℤ/Nℤ)^× is divisible by s and, when r is even, N ∤ l^{r/2} + 1. Since every prime below a given bound may be put into S, N may be taken larger than any given bound, and N may be taken odd and prime to any given integer. In particular (BLGHT11 Lemma 6.1) for every m ≥ 1 there is such an N with m | r, so that every finite field of characteristic l and degree dividing m embeds in 𝔽_l(ζ_N).

**Named signature.** `TauCeti.Dwork.exists_auxiliary_modulus`.

**Hypotheses and conventions.**

- l odd in the second condition (the parity step uses l odd; for l = 2 the first condition alone is available)

**Proof outline.**

1. Write s = 2^{a_0}∏ p_i^{a_i}. For each prime power p_i^{a_i} (and for 2^{a_0}) choose t_i ≥ a_i large and a prime M_i dividing l^{p_i^{t_i−1}(p_i−1)} + ⋯ + l^{p_i^{t_i−1}} + 1 (a primitive prime divisor) outside S and the earlier choices, so that l has order exactly p_i^{t_i} modulo M_i.
2. For p_0 = 2 take M_0 = AB with odd primes A | l^{2^{t_0−2}} + 1 and B | l^{2^{t_0−1}} + 1; then l has order 2^{t_0} modulo M_0 and M_0 ∤ l^{2^{t_0−1}} + 1.
3. N = ∏ M_i has r = lcm of the orders, divisible by s, and N ∤ l^{r/2} + 1 because one factor already fails to divide it (the published proof prints minus signs here; the intended condition is with plus signs, PAPER-QIAN-23/E4).

**Inputs.** `mathlib:orderOf`, `mathlib:ZMod.pow_totient`, `mathlib:Nat.exists_prime_and_dvd`, `mathlib:Polynomial.cyclotomic`.

**Checks.**

- A prime N never satisfies both conditions with r even, since then l^{r/2} ≡ −1 mod N; for l = 3 and s = 4 the composite N = 35 works: r = lcm(4, 6) = 12 and 3^6 ≡ 29 ≢ −1 mod 35.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 2.3 and its proof, pp. 1248–1250. Constructs N prime to l and S with s dividing the order r of l modulo N and N ∤ l^{r/2} + 1 for r even, from primitive prime divisors of cyclotomic values.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 6.1 and its proof, p. 40. Constructs N prime to S with m dividing every s for which l^s ≡ 1 mod N.
- Lie Qian, *Potential automorphy for GL_n*, Opening of §4, p. 1268. Chooses N odd, > 100n + 100, prime to the bad primes, with 𝔽_{l²} and the m-th roots of 𝔽_{l^s} inside 𝔽_l(ζ_N), by this lemma.

### The Dwork pencil of hypersurfaces

**Target `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil` (construction).** Let N ≥ 3 be an odd integer. Over T_0 = ℙ¹ − ({∞} ∪ μ_N) over ℤ[1/N] (coordinate t; equivalently T_0 = Spec ℤ[1/N][t, (1 − t^N)^{−1}]), let Y ⊂ ℙ^{N−1} × T_0 be the hypersurface X_1^N + ⋯ + X_N^N = N t X_1⋯X_N and π : Y → T_0 the projection. Then π is smooth and projective of relative dimension N − 2 with geometrically connected fibres; the fibre Y_0 is the Fermat hypersurface of degree N, and over t ∈ μ_N the fibre acquires N^{N−2} ordinary double points (the H_0-orbit of (1 : ⋯ : 1) when t = 1). Write Y_s for the fibre at a point s.

**Named signature.** `TauCeti.Dwork.pencil`.

**Hypotheses and conventions.**

- N odd (so that N − 2 is odd and the fibres have odd dimension)
- N invertible on the base

**Construction.**

1. Partial derivatives N X_i^{N−1} − N t ∏_{j≠i} X_j vanish simultaneously only if X_i^N = t∏_j X_j for all i; summing gives the equation, and multiplying gives t^N = 1 once all X_i ≠ 0; if some X_i = 0 then all vanish. So Y is smooth over the locus t^N ≠ 1 where N is invertible.
2. At t = 1 the singular points are the H_0-translates of (1 : ⋯ : 1), with Hessian N(N·I − J) on the tangent space, nondegenerate: ordinary double points.
3. A hypersurface of dimension ≥ 1 in projective space is connected, and smooth fibres are geometrically integral.

**Inputs.** `mathlib:AlgebraicGeometry.Smooth`, `mathlib:MvPolynomial`, `SchemeAndStackFoundations:SF.2`.

**API.**

- `Dwork.pencil` (constructor): The closed subscheme Y ⊂ ℙ^{N−1}_{T_0} cut out by ∑ X_i^N − N t ∏ X_i.
- `Dwork.pencil.smooth` (instance): π : Y → T_0 is smooth and projective of relative dimension N − 2.
- `Dwork.pencil.fibre_zero` (simp): The fibre at t = 0 is the Fermat hypersurface ∑ X_i^N = 0.
- `Dwork.pencil.singular_fibre_one` (other): Over t = 1 the fibre has exactly N^{N−2} singular points, all ordinary double points, forming one free H_0-orbit.
- `Dwork.pencil.baseChange` (functoriality): Formation of Y commutes with base change T′ → T_0; for a field K ⊇ ℤ[1/N] and t ∈ K with t^N ≠ 1, Y_t is the projective hypersurface ∑ X_i^N = N t ∏ X_i over K.
- `Dwork.pencil.geometricallyConnected` (other): Every geometric fibre of π is connected.

**Unit tests.**

- `dworkPencil_three_hesse` (computation): For N = 3 the fibre at t = 0 is the Fermat cubic curve and the fibre at t = 1 is singular at (1 : 1 : 1), (1 : ζ_3 : ζ_3²), (1 : ζ_3² : ζ_3).
- `dworkPencil_fibre_zero_fermat` (degenerate): The fibre at t = 0 is the Fermat hypersurface, smooth over ℤ[1/N].
- `dworkPencil_singular_count` (characterisation): For N = 5 the fibre at t = 1 has 5³ = 125 singular points.
- `dworkPencil_not_smooth_at_root_of_unity` (non-example): Over t = ζ_N the fibre is singular, so a definition of T_0 as ℙ¹ − {∞} (forgetting μ_N) does not give a smooth family.

**Uses.**

- QIAN23 §3 (DM.2/dwork-eigensheaves): the cohomology of its fibres carries the Dwork motives
- BLGHT11 §4 (DM.2/self-dual-real-forms): the self-dual motives are cut out of the same family
- QIAN21 Lemma 2.1 (DM.8/dwork-semistable-blowup): its reciprocal-parameter model is blown up to a semistable model near t = ∞

**Checks.**

- For N = 3, Y is the Hesse pencil X_1³ + X_2³ + X_3³ = 3tX_1X_2X_3 of plane cubics, smooth exactly for t³ ≠ 1.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, opening paragraphs, pp. 1252–1253. Defines T_0, the family X_1^N + ⋯ + X_N^N = NtX_1⋯X_N and asserts smoothness of relative dimension N − 2.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, p. 25. The same family for the self-dual case, with the automorphism ς.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.1, published p. 35 (arXiv v3 p. 40). The family Z over T_0 = Spec R_0[t, (1 − t^N)^{−1}], R_0 = ℤ[ζ_N, N^{−1}].

### Symmetry groups of the Dwork pencil and their characters

**Target `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups` (construction).** Let H = μ_N^N/μ_N (diagonal μ_N) and H_0 = {(ξ_1, …, ξ_N) : ξ_1⋯ξ_N = 1}/μ_N ⊂ H. Over ℤ[1/N, ζ_N], H acts on Y by (ξ_i)·(X_i, t) = (ξ_iX_i, (∏ξ_i)^{−1}t); thus H_0 acts on every fibre Y_s over T_0 and H acts on Y_0. For integers a_1, …, a_N with ∑a_i ≡ 0 mod N, ξ ↦ ∏ξ_i^{a_i} is a well-defined character H → μ_N (its restriction to H_0 depends only on (a_i) modulo adding a constant vector). After fixing ζ_N, Hom(H, μ_N) ≅ ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ). In addition, the involution ς : X_j ↦ X_{N+1−j} of Y normalises H_0. For a character χ of H_0 and a coefficient ring R in which #H_0 = N^{N−2} is invertible and which contains the values of χ, the idempotent e_χ = (1/#H_0)∑_{ξ∈H_0} χ(ξ)^{−1}ξ cuts out the χ-isotypic part of any R[H_0]-module.

**Named signature.** `TauCeti.Dwork.H0`.

**Hypotheses and conventions.**

- N invertible on the coefficients for the idempotent
- the action of H on t is through ∏ξ_i^{−1}, so only H_0 acts fibrewise

**Construction.**

1. The formula preserves the equation, since ∏(ξ_iX_i) = (∏ξ_i)∏X_i is compensated by t ↦ (∏ξ_i)^{−1}t, and the diagonal μ_N acts trivially on ℙ^{N−1} and on t because ζ^N = 1.
2. Characters of μ_N^N trivial on the diagonal are the exponent vectors with ∑a_i ≡ 0; restricting to H_0 kills exactly the constant vectors.
3. e_χ is an idempotent of R[H_0] projecting onto the χ-isotypic part because #H_0 is a unit in R.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil`, `mathlib:IsPrimitiveRoot`, `mathlib:MonoidAlgebra`.

**API.**

- `Dwork.H` (constructor): H = μ_N^N/Δμ_N as a finite abelian group of order N^{N−1}.
- `Dwork.H0` (constructor): H_0 ⊂ H the kernel of the product map, of order N^{N−2}.
- `Dwork.H.action` (data): The action of H on Y over the action ξ·t = (∏ξ_i)^{−1}t on T_0; H_0 acts over T_0.
- `Dwork.charOfExponents` (constructor): For a ∈ (ℤ/Nℤ)^N with ∑a_i = 0, the character χ_a : H → μ_N, ξ ↦ ∏ξ_i^{a_i}.
- `Dwork.charOfExponents_restrict_eq` (extensionality): χ_a and χ_b agree on H_0 iff a − b is a constant vector.
- `Dwork.charEquivKerSum` (equivalence): Hom(H, μ_N) ≃ ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ).
- `Dwork.isotypicIdempotent` (constructor): e_χ ∈ R[H_0] for R ∋ 1/N containing the values of χ, an idempotent with ξe_χ = χ(ξ)e_χ.
- `Dwork.swap` (data): The involution ς : X_j ↦ X_{N+1−j}, normalising H_0.

**Unit tests.**

- `card_H0` (computation): #H_0 = N^{N−2}; for N = 3 it is 3.
- `charOfExponents_const_trivial_on_H0` (degenerate): The constant vector (1, …, 1) gives the trivial character of H_0 (but a nontrivial one of H).
- `charOfExponents_well_defined` (characterisation): If ∑a_i ≢ 0 mod N then ξ ↦ ∏ξ_i^{a_i} is not trivial on the diagonal μ_N, so it does not descend to H.
- `swap_not_in_H` (non-example): ς does not lie in the image of H in Aut(Y): it does not commute with H_0 when N ≥ 3.

**Uses.**

- QIAN23 §3 (DM.2/dwork-eigensheaves): χ-eigensheaves of R^{N−2}π_*
- BLGHT11 §4 (DM.2/self-dual-real-forms): the ς-symmetrised idempotent
- DMOS82 I.7.4 (DM.2/fermat-hypersurface-cohomology): H acts on the Fermat fibre with one-dimensional eigenspaces

**Checks.**

- For N = 3, H_0 ≅ μ_3 (one generator (ζ, ζ^{−1}, 1)), acting on the Hesse pencil fibrewise.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, p. 1253. Defines H, H_0 and the action, and notes that ξ ↦ ∏ξ_i^{a_i} is well defined when ∑a_i ≡ 0 mod N.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, pp. 25–26. Defines H, H_0, the involution ς and the semidirect product H_0 ⋊ ⟨ς⟩.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.1, published p. 35. Identifies Hom(H, M^×) with ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ) after a choice of embedding.

### Exponent data and the complementary index set

**Target `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum` (definition).** Fix n ≥ 2 and an odd N prime to n. A Dwork exponent datum is a vector a = (a_1, …, a_N) ∈ (ℤ/Nℤ)^N with ∑a_i = 0 such that the residues a_j take exactly N − n distinct values. Its index set is B(a) = {b ∈ ℤ/Nℤ : b + a_j ≠ 0 for all j}, of cardinality n, and its character is χ_a|_{H_0}. Two data are equivalent if they differ by a permutation and a constant vector (same character on H_0 up to permutation of coordinates). The two families used are: Qian's asymmetric data for n > 2 (0 occurring n + 1 times, every nonzero residue at most once, with the explicit vectors of QIAN23 p. 1253: for n odd B = {1, 2, N − 3} ∪ {(N + x)/2 : x = −n + 4, −n + 6, …, n − 4}; for n even B = {1, 2, 3, N − 6} ∪ {(N + x)/2 : x = −n + 5, …, n − 5}); and the self-dual data of BLGHT11 (n even, a = (1, 2, …, (N − n − 1)/2, 0, …, 0, (N + n + 1)/2, …, N − 1) with n + 1 zeros), whose index set is B = {(N + 1 − n)/2, …, (N − 1 + n)/2} = −B. For n = 2 Qian's datum is the self-dual one with B = {(N − 1)/2, (N + 1)/2}. In all cases 0 ∉ B and ∑_{b∈B} b ≡ 0.

**Named signature.** `TauCeti.Dwork.ExponentDatum`.

**Hypotheses and conventions.**

- N odd, gcd(N, n) = 1; Qian's explicit vectors need N > 100n + 100 (the stabiliser lemma) and n > 2

**Construction.**

1. b ∉ B iff −b is one of the N − n values of the a_j, so #B = n.
2. If 0 occurs among the a_j then 0 ∉ B; the explicit vectors list their values, from which B is read off.
3. ∑B ≡ −(sum of the distinct values not taken) and the explicit choices make this 0; for the self-dual datum B = −B gives ∑B = 0 directly.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups`, `mathlib:ZMod`.

**API.**

- `Dwork.ExponentDatum` (structure): Structure: N, n, a : Fin N → ZMod N with ∑ a = 0 and #image a = N − n.
- `Dwork.ExponentDatum.indexSet` (data): B(a) = {b : ∀ j, b + a j ≠ 0} as a Finset (ZMod N).
- `Dwork.ExponentDatum.card_indexSet` (characterisation): #B(a) = n.
- `Dwork.ExponentDatum.zero_not_mem_indexSet` (simp): If 0 occurs among the a_j, then 0 ∉ B(a).
- `Dwork.ExponentDatum.sum_indexSet` (relation): For the Qian and self-dual data, ∑_{b∈B} b = 0.
- `Dwork.ExponentDatum.qian` (constructor): Qian's asymmetric datum for n > 2 (explicit vector of QIAN23 p. 1253).
- `Dwork.qianIndexSet` (constructor): Qian's index set B as an explicit Finset (ZMod N): {1, 2, N − 3} ∪ {(N − n + 4)/2 + k : k < n − 3} for n odd, {1, 2, 3, N − 6} ∪ {(N − n + 5)/2 + k : k < n − 4} for n even.
- `Dwork.card_qianIndexSet` (characterisation): For n > 2, N odd and N > 100n + 100, Qian's index set has n elements and sums to 0.
- `Dwork.ExponentDatum.selfDual` (constructor): BLGHT11's self-dual datum for n even, with B = −B.
- `Dwork.ExponentDatum.neg_indexSet_selfDual` (simp): For the self-dual datum, −B = B.
- `Dwork.ExponentDatum.character` (projection): The character χ_a|_{H_0}.

**Unit tests.**

- `indexSet_qian_three` (computation): For n = 3, N = 401: B = {1, 2, 398}.
- `indexSet_selfDual_two` (degenerate): For n = 2 the self-dual datum has B = {(N − 1)/2, (N + 1)/2}.
- `card_indexSet_eq` (characterisation): #B(a) = n for every exponent datum.
- `indexSet_qian_ne_neg` (non-example): For Qian's datum with n = 3, N = 401: −B = {400, 399, 3} ≠ B, so the datum is not self-dual (a definition imposing B = −B would exclude it).

**Uses.**

- QIAN23 Lemma 3.1 (DM.1/asymmetric-stabiliser-trivial): the asymmetry property of B
- QIAN23 Lemma 3.3(1) (DM.4/monodromy-at-zero): eigenvalues ζ_N^b, b ∈ B, of the monodromy at 0
- QIAN23 Lemma 3.10 (DM.7/hodge-grades-of-fermat-eigenlines): the Hodge grades are read off B
- QIAN23 Lemma 3.9 (DM.6/dwork-determinant-gauss-formula): the determinant is a product of Gauss sums g(v, b), b ∈ B

**Checks.**

- n = 3, N = 401: B = {1, 2, 398}, and 1 + 2 + 398 = 401 ≡ 0.
- n = 4, N = 501: B = {1, 2, 3, 495}.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, displayed exponent vectors and index sets, pp. 1253–1254. Lists the exponent vectors for n odd, n even and n = 2, the residues they omit, and the index set B = {b_1, …, b_n} of residues with b + a_j ≠ 0.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, the idempotent e and Lemma 4.1, pp. 26–27. The self-dual character with n + 1 zeros and index range (N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.1, published p. 35. The conditions on χ: the trivial character n + 1 times, the others at most once, and trivial Galois stabiliser of the set of missing characters.

### Trivial multiplicative stabiliser of Qian's index set

**Target `PotentialAutomorphyDworkMotivesPartII:DM.1/asymmetric-stabiliser-trivial` (theorem).** Let n > 2 and N odd with N > 100n + 100 and gcd(N, n) = 1, and let B ⊂ ℤ/Nℤ be the index set of Qian's asymmetric datum. If α ∈ (ℤ/Nℤ)^× satisfies αB = B, then α = 1. In particular −B ≠ B, and l^jB ≠ B, l^jB ≠ −B for every power l^j ≢ 1 (resp. ≢ −1) mod N. For n = 2 (and for the self-dual data) B = −B.

**Named signature.** `TauCeti.Dwork.qianIndexSet_stabiliser`.

**Hypotheses and conventions.**

- n > 2
- N odd, N > 100n + 100, gcd(N, n) = 1

**Proof outline.**

1. 1 ∈ B, so α ∈ B. The small elements 1, 2 (and 3 for n even) and the large element N − 3 (resp. N − 6) are isolated from the middle block {(N + x)/2}, because N > 100n + 100.
2. α = 2 would force 4 ∈ B, α = N − 3 would force 9 or −9 into B, and similarly for 3 and N − 6; none of these lie in B.
3. If α = (N + x)/2 lies in the middle block, then 2α = x ∈ B forces x ∈ {1, 3} (n even) or {1, −3} (n odd); then (N − x)/2 ∈ B too and their product −x²/4 ∈ B, so 4B contains −1 or −9, which the explicit description of 4B excludes.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`.

**Checks.**

- n = 3, N = 401: multiplication by 2 sends B = {1, 2, 398} to {2, 4, 395} ≠ B.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.1 and its proof, pp. 1254–1255. Shows that a unit α with αB = B equals 1 for n > 2 by a case analysis of the elements of B.

### The quotient family over the thrice-punctured line

**Target `PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover` (construction).** Let T′_0 = ℙ¹ − {0, 1, ∞} with coordinate t′. For n > 2 let Y′ ⊂ ℙ^{N−1} × T′_0 be X′_1^N + ⋯ + X′_{N−1}^N + t′^{−1}X′_N^N = N X′_1⋯X′_N, with H_0 acting by scaling coordinates. The map t ↦ t′ = t^N is a Galois covering T_0 − {0} → T′_0 with group μ_N, and X′_i = X_i (i < N), X′_N = tX_N identify its pullback of Y′ with Y − Y_0, H_0-equivariantly. For the self-dual datum (BLGHT11), the family Ỹ with t′^{−1} placed on the middle coordinate X̃_{(N+1)/2}, which is stable under ς̃ : X̃_j ↦ X̃_{N+1−j}, plays the same role. Over ℚ(ζ_N), Ỹ is the quotient of Y − Y_0 by the copy of μ_N acting on the middle coordinate.

**Named signature.** `TauCeti.Dwork.quotientFamily`.

**Hypotheses and conventions.**

- n > 2 for Y′ (for n = 2 use Ỹ, since Y′ is not ς-stable)

**Construction.**

1. Substituting X′_N = tX_N gives t′^{−1}t^NX_N^N = X_N^N and N X′_1⋯X′_N = N t X_1⋯X_N, so the pullback equation is that of Y.
2. The deck transformation t ↦ ζt lifts to Y − Y_0 through the element of H acting on X_N (resp. on X_{(N+1)/2}); this identifies the quotient.
3. H_0 commutes with the identification because it scales the X_i without changing t.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups`.

**API.**

- `Dwork.quotientFamily` (constructor): Y′ → T′_0 (n > 2) and Ỹ → T′_0 (self-dual datum).
- `Dwork.quotientFamily.pullback_iso` (equivalence): The pullback along t ↦ t^N is H_0-equivariantly isomorphic to Y − Y_0 → T_0 − {0}.
- `Dwork.powerCover` (data): t ↦ t^N : T_0 − {0} → T′_0 is finite étale Galois with group μ_N over ℤ[1/N, ζ_N].
- `Dwork.quotientFamily.smooth` (instance): Y′ → T′_0 is smooth projective of relative dimension N − 2.

**Unit tests.**

- `powerCover_degree` (computation): t ↦ t^N has degree N; for N = 3 the fibre over t′ = 8 is {2, 2ζ_3, 2ζ_3²}.
- `quotientFamily_fibre_one` (degenerate): Over t′ = 1 the fibre of Y′ is singular (it is the image of the singular fibres over μ_N).
- `pullback_equation` (characterisation): Substituting X′_N = tX_N, t′ = t^N into the equation of Y′ gives the equation of Y.
- `powerCover_not_over_zero` (non-example): t ↦ t^N does not make T_0 a covering of T′_0: t = 0 lies over t′ = 0 ∉ T′_0, so only T_0 − {0} covers T′_0, and the Fermat fibre enters only through the local monodromy at t′ = 0.

**Uses.**

- QIAN23 Lemma 3.3 (DM.4/dwork-monodromy-representations): monodromy is computed on π_1 of the thrice-punctured line
- BLGHT11 Lemma 4.3 (DM.4/monodromy-at-zero): the same for the self-dual family

**Checks.**

- For N = 3 and the Hesse pencil, t′ = t³ and Y′ is X_1³ + X_2³ + t′^{−1}X_3³ = 3X_1X_2X_3.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, the family Y′ over T′_0, p. 1256. Defines Y′, the N-fold covering t′ = t^N and the identification of its pullback with Y − Y_0, H_0-equivariantly.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, the family Ỹ over T̃_0, pp. 28–29. Defines the ς̃-stable family Ỹ, the isomorphism H̃_0 ≅ H_0 and the identification of Ỹ with a μ_N-quotient of Y − Y_0.

<a id="layer-dm2"></a>

## Layer DM.2: Eigen-local-systems of the Dwork pencil

The χ-eigensheaves of R^{N−2}π_* in étale, finite and Betti form, their rank n (read off the Fermat fibre at t = 0), the real forms that carry symplectic pairings in the self-dual case, and Poincaré duality between conjugate eigensheaves.

**Targets of the layer.**

**Objects.** The χ-eigensheaves V_λ, V[𝔫] and the Betti local system V_B (and V′_B on T′_0) of R^{N−2}π_* (DM.2/dwork-eigensheaves); the self-dual real forms over ℤ[1/(2N), ζ_N]^+ with their alternating pairings (DM.2/self-dual-real-forms). **Theorems.** Cohomology of the Fermat hypersurface (DM.2/fermat-hypersurface-cohomology, Deligne §7); torsion-freeness of integral cohomology of smooth hypersurfaces (DM.2/integral-cohomology-torsion-free); Poincaré duality between conjugate eigensheaves (DM.2/eigensheaf-duality); splitting of the Fermat fibre into eigenlines indexed by B (DM.2/fermat-fibre-splitting); local freeness of rank n (DM.2/eigensheaf-rank; QIAN23 Proposition 3.2, BLGHT11 Lemma 4.1).

### Cohomology of the Fermat hypersurface

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology` (theorem).** Let X ⊂ ℙ^{N−1} be the Fermat hypersurface ∑X_i^N = 0 over a field of characteristic 0 or prime to N containing μ_N, with the action of H = μ_N^N/μ_N. For a character a = (a_1, …, a_N) ∈ (ℤ/Nℤ)^N, ∑a_i = 0, of H, the a-eigenspace of the primitive middle cohomology H^{N−2}_prim (Betti with coefficients in a ring containing 1/N and μ_N, ℓ-adic, or de Rham) is zero unless every a_i ≠ 0, in which case it is free of rank one; the remaining cohomology in degree N − 2 is the a = 0 part (spanned by a power of the hyperplane class, zero for N − 2 odd). Over ℂ, the a-eigenline (all a_i ≠ 0, representatives ⟨a_i⟩ ∈ {1, …, N − 1}) lies in H^{p, N−2−p} with p + 1 = ∑_i⟨a_i⟩/N.

**Named signature.** `TauCeti.Dwork.fermat_eigenspace_rank`.

**Hypotheses and conventions.**

- N invertible on the coefficients and on the base field
- μ_N in the coefficients (for eigenspaces)

**Proof outline.**

1. X is the quotient-free cover of ℙ^{N−2} branched along a hyperplane arrangement, and its cohomology decomposes under H; the dimension count of eigenspaces comes from the Lefschetz trace formula for elements of H (or from the explicit description of X as a μ_N^{N−1}-cover of ℙ^{N−2}).
2. The Hodge type of an eigenline is computed by Griffiths' residue description of H^{N−2}_prim with the monomial forms X^{b−1}Ω/F^k (Deligne, Hodge cycles on abelian varieties, §7).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups`, `ComplexComparisonPartII:C5/proper-pure-hodge`, `ComplexComparisonPartII:C5/relative-hodge-bundles`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- N = 3: the characters with all a_i ≠ 0 and ∑a_i ≡ 0 mod 3 are (1, 1, 1) and (2, 2, 2), so H¹ of the Fermat cubic curve has rank 2; ∑⟨a_i⟩/3 = 1 and 2 put the two eigenlines in H^{0,1} and H^{1,0}.

**Sources.**

- Pierre Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties (in: Hodge cycles, motives, and Shimura varieties)*, Chapter I (Deligne), §7, Propositions 7.4 and 7.6, as applied in BLGHT11 Lemmas 4.1 and 5.2 and QIAN23 Proposition 3.2 and Lemma 3.10. The eigenspace decomposition of the cohomology of Fermat hypersurfaces into lines indexed by characters with all entries nonzero, and their Hodge types.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Lemma 4.4.4, published p. 43. Uses the H-eigenspace decomposition of H^{N−2} of the Fermat fibre into lines, citing [DMOS82, I.7.4].
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.1 and Lemma 5.2, pp. 27, 35–36. Applies Propositions I.7.4 and I.7.6 of DMOS to the Dwork fibre at 0.

### Integral cohomology of smooth hypersurfaces is torsion-free

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free` (theorem).** Let X ⊂ ℙ^{m+1}_ℂ be a smooth hypersurface of dimension m. Then H^i(X(ℂ), ℤ) is torsion-free for every i. Consequently, for a smooth proper family of hypersurfaces over a base where ℓ is invertible, the sheaves R^iπ_*ℤ_ℓ are torsion-free and R^iπ_*(ℤ/ℓ^k) = R^iπ_*ℤ_ℓ/ℓ^k.

**Named signature.** `TauCeti.Dwork.hypersurface_cohomology_torsionFree`.

**Hypotheses and conventions.**

- X smooth hypersurface in projective space

**Proof outline.**

1. By the Lefschetz hyperplane theorem H^i(X, ℤ) ≅ H^i(ℙ^{m+1}, ℤ) for i < m and H_i(X, ℤ) ≅ H_i(ℙ^{m+1}, ℤ) for i < m, so these are torsion-free; Poincaré duality and the universal coefficient theorem give torsion-freeness in degrees > m and in degree m (torsion of H^m is torsion of H_{m−1}, which vanishes).
2. Smooth proper base change and the Artin comparison transfer this to the étale sheaves R^iπ_*ℤ_ℓ on any base with ℓ invertible, through a complex fibre; the universal coefficient sequence gives the reduction statement.

**Inputs.** `ComplexComparisonPartII:C5/relative-betti-local-system`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For a smooth plane cubic, H¹(X, ℤ) ≅ ℤ² is torsion-free.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proposition 3.2 and its proof, p. 1257. Derives local freeness of the eigensheaves from smoothness and properness; the torsion-freeness of the integral cohomology of the fibres is the missing input recorded as PAPER-QIAN-23/E24.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 4.1(2), p. 27. Local freeness of rank n of V_λ, checked on the fibre at 0.

### The Dwork eigen-local-systems V_λ, V[𝔫] and V_B

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves` (construction).** Let a be a Dwork exponent datum with character χ of H_0, O = ℤ[1/(2N), ζ_N]. (1) For a prime λ of O of residue characteristic l, V_λ = e_χ R^{N−2}π_*O_λ, a lisse étale sheaf of O_λ-modules on T_0 × Spec O[1/l]. (2) For a nonzero ideal 𝔫 of O of norm M, V[𝔫] = e_χ R^{N−2}π_*(O/𝔫), a lisse sheaf of O/𝔫-modules on T_0 × Spec O[1/M]. (3) After fixing τ : ℚ(ζ_N) ↪ ℂ with τ(ζ_N) = e^{2πi/N}, V_B = e_χ R^{N−2}π̃_*O on T_0(ℂ), a local system of O-modules. (4) V′_B on T′_0(ℂ), defined the same way from Y′, pulls back to V_B|_{T_0(ℂ)−{0}}. These are compatible: V_B ⊗ O_λ corresponds to τ*V_λ and V_B ⊗ O/𝔫 to τ*V[𝔫] under the equivalence of locally constant analytic and étale sheaves on (T_0)_ℂ; and V[𝔫] ≅ ∏_λ V_λ/λ^{a_λ} for 𝔫 = ∏λ^{a_λ}. For n = 2 and the self-dual data, U_λ, U[𝔫], U_B denote these sheaves, replaced by the real forms of DM.2/self-dual-real-forms. Stalks are written V_{λ,t}, V[𝔫]_t, V_{B,t}; BCGNT25 writes V_{t,λ} with coefficients O_{M_λ}, M = ℚ(e^{2πi/N}), which is the same object.

**Named signature.** `TauCeti.Dwork.eigenSheaf`.

**Planet.** Dwork eigen-local-systems.

**Hypotheses and conventions.**

- #H_0 = N^{N−2} and 2 invertible in O
- λ ∤ residue characteristic of the base points used

**Construction.**

1. R^{N−2}π_* of the smooth proper π is lisse with torsion-free stalks (smooth proper base change, DM.2/integral-cohomology-torsion-free); H_0 acts by functoriality and e_χ is an idempotent endomorphism, so its image is a direct summand, again lisse.
2. The Artin comparison and Ehresmann's theorem identify the analytic and étale local systems on complex fibres; e_χ commutes with them.
3. Chinese remainder theorem for O/𝔫 and exactness of e_χ give the product decomposition.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`, `PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free`, `SchemeAndStackFoundations:SF.2`, `ComplexComparisonPartII:C5/relative-betti-local-system`.

**API.**

- `Dwork.eigenSheaf` (constructor): V_λ := e_χ R^{N−2}π_*O_λ, a lisse O_λ-sheaf on T_0[1/l].
- `Dwork.eigenSheafMod` (constructor): V[𝔫] := e_χ R^{N−2}π_*(O/𝔫).
- `Dwork.bettiEigenSystem` (constructor): V_B := e_χ R^{N−2}π̃_*O on T_0(ℂ) for the fixed embedding τ.
- `Dwork.eigenSheafMod_eq_reduction` (relation): V[λ^k] ≅ V_λ/λ^k and V[𝔫] ≅ ∏ V_λ/λ^{a_λ}.
- `Dwork.bettiEigenSystem_comparison` (compatibility): V_B ⊗_O O_λ ≅ τ*V_λ and V_B ⊗ O/𝔫 ≅ τ*V[𝔫] (Artin comparison).
- `Dwork.eigenSheaf_stalk` (simp): The stalk at a geometric point t̄ is e_χ H^{N−2}_ét(Y_t̄, O_λ).
- `Dwork.eigenSheaf_baseChange` (functoriality): Formation commutes with base change along S → T_0[1/l]; V_{λ,t} is a G_K-module for t ∈ T_0(K).
- `Dwork.eigenSheaf_conj` (functoriality): For σ ∈ Gal(ℚ(ζ_N)/ℚ), σ carries the χ-eigensheaf with coefficients O_λ to the σχ-eigensheaf with coefficients O_{σλ}.
- `Dwork.quotientEigenSystem_pullback` (relation): V′_B pulls back to V_B on T_0(ℂ) − {0}.

**Unit tests.**

- `eigenSheaf_rank_hesse` (computation): For N = 3 and the nontrivial character χ of H_0 ≅ μ_3, V_λ has rank 1.
- `eigenSheaf_stalk_zero` (degenerate): At the Fermat point t = 0 the stalk V_{λ,0} is the direct sum of the n lines V_{λ,i}, i ∈ B(a), on which H acts through χ_i.
- `bettiEigenSystem_comparison_mod` (compatibility): The stalk of V_B ⊗ O/𝔫 at t ∈ T_0(ℂ) equals the stalk of V[𝔫] at the corresponding geometric point (Artin comparison).
- `eigenSheaf_not_full_cohomology` (non-example): V_λ ≠ R^{N−2}π_*O_λ for N ≥ 5: the full middle cohomology has rank ((N − 1)^N + (−1)^N(N − 1))/N, much larger than n.

**Uses.**

- QIAN23 Lemmas 3.3–3.12 and §4 (DM.4, DM.5, DM.6, DM.7, DM.9): the representations whose monodromy, determinant and local properties are computed
- BCGNT25 §§4.2–4.4 (DM.3/twisted-dwork-local-system): W_λ = V_λ ⊗ Ψ_λ^{−1}
- ModularityAndLanglandsExtensions:ML.2/dwork-fibre-automorphy-transport: the fibres V_{λ,t}, V_{λ′,t} at the switching point

**Checks.**

- For N = 3, n = 2 (the Hesse pencil), V_λ is the χ-part of H¹ of the elliptic curves of the pencil, a rank-one O_λ-local system for each nontrivial χ.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, definitions of V_λ, V[𝔫] and V_B, pp. 1255–1256. Defines the χ-eigensheaves of R^{N−2}π_* with coefficients ℤ[ζ_N]_λ and ℤ[ζ_N]/𝔫, and the Betti local system with its comparison.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.1, published p. 36 (arXiv v3 p. 40). Defines V_λ as the H_0 = χ part of R^{N−2}π[1/l]_*O_{M_λ} (printed without R^{N−2}, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E21).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, pp. 26–28. Defines U_λ, U[𝔫], U_B for the self-dual character and the Betti comparison.

### Poincaré duality between conjugate eigensheaves

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality` (theorem).** The cup product and the trace H^{2N−4}(Y_t) ≅ O(2 − N) restrict to perfect pairings V_{χ,λ} × V_{χ^{−1},λ} → O_λ(2 − N) between the χ- and χ^{−1}-eigensheaves (and likewise with O/𝔫 and Betti coefficients). Since N − 2 is odd the cup product on the middle cohomology is alternating, so the pairing satisfies ⟨y, x⟩ = −⟨x, y⟩ after exchanging the factors. In particular: (1) for the self-dual data (χ = χ^{−1} up to ς) the real forms V_λ carry perfect alternating pairings V_λ × V_λ → O^+_λ(2 − N); (2) complex conjugation c on the coefficients gives c-linear isomorphisms V_{c(λ)} ≅ V_λ^∨(2 − N) for Qian's data.

**Named signature.** `TauCeti.Dwork.eigenSheaf_perfectPairing`.

**Hypotheses and conventions.**

- N odd (alternating middle cup product)
- coefficients with 2N invertible

**Proof outline.**

1. Poincaré duality for the smooth proper fibres is a perfect pairing on R^{N−2}π_*, alternating since N − 2 is odd, and H_0-invariant.
2. An invariant pairing pairs the χ-part with the χ^{−1}-part and kills χ-part × χ′-part for χ′ ≠ χ^{−1}; perfectness passes to the eigen-summands.
3. Composing with the coefficient conjugation, which exchanges χ and χ^{−1} = c ∘ χ, gives the c-linear self-duality.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For the Hesse pencil (N = 3) the pairing on H¹ of an elliptic curve pairs the two eigenlines of μ_3.

**Sources.**

- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, after Lemma 4.1, p. 27. The cup product induces perfect alternating pairings on V_λ((N − 1 − n)/2) with values in Z[ζ_N, 1/(2N)]^+_λ(1 − n).
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Lemma 4.2.4, published p. 37. Uses c-linear isomorphisms V_{c(λ)} ≅ V_λ^∨(1 − N), with the twist corrected to 2 − N (PAPER-BOXER-CALEGARI-GEE-ETAL-25/E7).
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.4, after Definition 4.4.1, published pp. 41–42. Poincaré duality on relative cohomology gives the pairing on W̄_λ.

### Real forms of the self-dual Dwork eigensheaves

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms` (construction).** For the self-dual datum (n even, BLGHT11) let O^+ = ℤ[1/(2N), ζ_N]^+ and e = (1/(2#H_0))(ς + 1)∑_{ξ∈H_0}(χ(ξ) + χ(ξ)^{−1})ξ in O^+[H_0 ⋊ ⟨ς⟩]. Define V_λ = [e]_*R^{N−2}π_*O^+_λ, V[𝔫] = [e]_*R^{N−2}π_*(O^+/𝔫) and V_B = [e]_*R^{N−2}π̃_*O^+, for λ, 𝔫 of O^+. These are locally free of rank n, carry perfect alternating pairings V_λ((N − 1 − n)/2) × V_λ((N − 1 − n)/2) → O^+_λ(1 − n) (and mod 𝔫), and H_0-equivariant projection gives isomorphisms V_λ ⊗_{O^+} O ≅ U_λ, V[𝔫] ⊗ O ≅ U[𝔫], V_B ⊗ O ≅ U_B with the χ-eigensheaves of DM.2/dwork-eigensheaves. For n = 2, Qian uses these real forms in place of U_λ, U[𝔫], U_B; their residue fields k(λ) are those of O^+.

**Named signature.** `TauCeti.Dwork.realForm`.

**Hypotheses and conventions.**

- n even, N odd, N > n + 1
- 2N invertible (e has denominator 2#H_0 = 2N^{N−2}; for V_B the coefficient ring is O^+ = ℤ[1/(2N), ζ_N]^+, PAPER-QIAN-23/E25)

**Construction.**

1. e is an idempotent of O^+[H_0 ⋊ ⟨ς⟩] since ς normalises H_0 and swaps χ and χ^{−1}; it defines a self-correspondence of Y over T_0 × Spec O^+.
2. After extending scalars to O, e decomposes into the projections to the χ- and χ^{−1}-parts exchanged by ς, so projection to the χ-part is an isomorphism from the image of e.
3. The pairing of DM.2/eigensheaf-duality restricted to the image of e is O^+-valued and perfect.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`.

**API.**

- `Dwork.selfDualIdempotent` (constructor): The idempotent e of O^+[H_0 ⋊ ⟨ς⟩].
- `Dwork.realForm` (constructor): V_λ := [e]_*R^{N−2}π_*O^+_λ, and V[𝔫], V_B likewise.
- `Dwork.realForm_baseChange_iso` (equivalence): V_λ ⊗_{O^+_λ} O_λ ≅ U_λ by H_0-equivariant projection.
- `Dwork.realForm.pairing` (data): The perfect alternating pairing on V_λ((N − 1 − n)/2) with values in O^+_λ(1 − n).
- `Dwork.realForm_mod` (relation): V[𝔫] ≅ ∏ V_λ/λ^{a_λ}.
- `Dwork.realForm.rank` (characterisation): V_λ is locally free of rank n.

**Unit tests.**

- `realForm_rank_two` (computation): For n = 2, V_λ has rank 2 over O^+_λ.
- `selfDualIdempotent_idempotent` (characterisation): e² = e in O^+[H_0 ⋊ ⟨ς⟩].
- `realForm_baseChange` (compatibility): V_λ ⊗ O_λ ≅ U_λ, the χ-eigensheaf of DM.2/dwork-eigensheaves.
- `realForm_needs_two_inverted` (non-example): Over ℤ[1/N, ζ_N]^+ (2 not inverted) e is not defined: its denominator is 2N^{N−2}, so the real form of V_B lives over ℤ[1/(2N), ζ_N]^+, not ℤ[ζ_N]^+.

**Uses.**

- BLGHT11 Proposition 4.2, Lemmas 4.6, 5.1, 5.3 (DM.5/residual-monodromy-sp, DM.7): symplectic monodromy and local Galois properties
- BLGGT14 proof of Theorem 3.1.2 (DM.9/self-dual-switching): the symplectic residual representations to be matched
- QIAN23 n = 2 (DM.5/two-prime-product-monodromy, DM.6): the case n = 2 of the switching theorem

**Checks.**

- For n = 2 the real form V_λ has rank 2 over O^+_λ with a perfect alternating pairing, so its geometric monodromy lies in Sp_2 = SL_2.

**Sources.**

- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, the idempotent e, Lemma 4.1 and the pairings, pp. 25–27. Defines V_λ, V[𝔫] as images of the ς-symmetrised idempotent with coefficients in Z[1/(2N), ζ_N]^+, proves local freeness of rank n and the identification with U after extension of scalars, and gives the alternating pairings.
- Lie Qian, *Potential automorphy for GL_n*, §3, paragraph after Proposition 3.2, p. 1257. For n = 2 replaces U_λ, U[𝔫], U_B by BLGHT's real forms with coefficients in the real cyclotomic ring.

### Splitting of the Fermat fibre into eigenlines

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting` (theorem).** Since H acts on Y_0, the fibres at t = 0 decompose as V_{λ,0} = ⊕_{i∈ℤ/Nℤ} V_{λ,i} and V[𝔫]_0 = ⊕ V_i[𝔫], where V_{λ,i} is the part on which H acts by χ_i : ξ ↦ ∏_j ξ_j^{a_j+i} (whose restriction to H_0 is χ). The summand V_{λ,i} is nonzero iff i ∈ B(a), and then it is free of rank one over O_λ (resp. O/𝔫). The same holds for V_{B,0}, for the χ-part of H^{N−2}_dR(Y_0/K) (K ⊇ ℚ(ζ_N)), and for the self-dual real forms (summands U_{i,λ}, (N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2). The monodromy generator at t′ = 0 acts on V_{λ,i} by the scalar ζ_N^i.

**Named signature.** `TauCeti.Dwork.fermatFibre_eigenline_rank`.

**Hypotheses and conventions.**

- Y_0 the Fermat fibre; coefficients contain 1/N and ζ_N

**Proof outline.**

1. The characters of H restricting to χ on H_0 are the χ_i, i ∈ ℤ/Nℤ.
2. χ_i has exponent vector (a_j + i)_j, all of whose entries are nonzero iff i ∈ B(a); apply DM.2/fermat-hypersurface-cohomology.
3. The deck transformation of t ↦ t^N corresponding to ζ_N acts on the fibre at 0 through the element of H scaling one coordinate, i.e. by the scalar ζ_N^i on the χ_i-part.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`.

**Checks.**

- For Qian's datum with n = 3, the nonzero summands are V_{λ,1}, V_{λ,2}, V_{λ,N−3}.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, decomposition of the fibres at 0, pp. 1255–1256; proof of Lemma 3.3(1), p. 1257. Decomposes V_{λ,0} and V[𝔫]_0 under H into the χ_i-parts and shows, by DMOS Proposition I.7.4, that they are nonzero, of rank one, exactly for i ∈ B.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 4.1(1), p. 26. U_{i,λ} is free of rank one for (N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2 and zero otherwise.

### The Dwork eigensheaves are locally free of rank n

**Target `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank` (theorem).** For every Dwork exponent datum, V_λ, V[𝔫], V_B and V′_B are locally free of rank n over O_λ, O/𝔫, O and O respectively, on T_0 × Spec O[1/l], T_0 × Spec O[1/M], T_0(ℂ) and T′_0(ℂ); the same holds for the self-dual real forms over O^+. For n = 2 this is BLGHT11 Lemma 4.1(2).

**Named signature.** `TauCeti.Dwork.eigenSheaf_locallyFree_rank`.

**Planet.** Rank of the Dwork motives.

**Hypotheses and conventions.**

- Torsion-freeness of the integral middle cohomology of the fibres is used (PAPER-QIAN-23/E24).

**Proof outline.**

1. The sheaves are locally constant (smooth proper base change, Ehresmann) with torsion-free stalks (DM.2/integral-cohomology-torsion-free); a direct summand of a locally constant sheaf of finite free modules is locally free.
2. The rank is constant on the connected base and equals the rank at t = 0, which is #B = n by DM.2/fermat-fibre-splitting.
3. For V′_B on T′_0(ℂ), which does not contain the point t = 0, pull back along t ↦ t^N to V_B on T_0(ℂ) − {0} and use connectedness.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting`, `PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free`, `PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover`, `PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms`.

**Checks.**

- For Qian's datum with n = 3 the stalk V_{λ,t} is free of rank 3 over O_λ for every t ∈ T_0.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proposition 3.2 and its proof, p. 1257. States that V_λ, V[𝔫], V_B and V′_B are locally free of rank n, checking the rank on the fibre at 0 with DMOS Proposition I.7.4.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 4.1(2), p. 27. V_λ (resp. V[𝔫]) is locally free of rank n, and V[𝔫] ≅ ∏ V_λ/λ^{a_λ}.

<a id="layer-dm3"></a>

## Layer DM.3: Katz's hypergeometric description

Katz showed that each eigen-local-system of the Dwork family is, up to a character of the base and a Kummer twist, the pullback along t ↦ t^{−N} of a hypergeometric sheaf, a multiplicative convolution of Kummer sheaves. This gives the unipotent monodromy at ∞ for every exponent datum, a trace formula for Frobenius, and, after twisting away an algebraic Hecke character Ψ, local systems W_λ with Hodge–Tate weights {0, …, n − 1}.

**Targets of the layer.**

**Objects.** Katz's hypergeometric sheaf E_λ = j^*(F_1 ∗_! ⋯ ∗_! F_n)[n − 1] attached to the missing characters ρ_1, …, ρ_n (DM.3/katz-hypergeometric-sheaf); the twisted local systems W_λ = V_λ ⊗ Ψ_λ^{−1} (DM.3/twisted-dwork-local-system). **Theorems.** E_λ is lisse of rank n, geometrically irreducible, pure of weight n − 1 with determinant M_λ(n(1 − n)/2), with an explicit trace formula (DM.3/hypergeometric-sheaf-properties); its local monodromy is a single unipotent Jordan block at 0, ⊕L_{ρ_i} at ∞ and a pseudo-reflection at 1 (DM.3/hypergeometric-local-monodromy); Katz's comparison of the Dwork eigensheaf with the pullback of E_λ along t ↦ t^{−N} up to a character Ψ_λ (DM.3/katz-dwork-comparison; Katz 2009 Theorem 5.3, BCGNT25 Theorem 4.2.1); Ψ_λ comes from an algebraic Hecke character of type A_0 and weight N − n − 1 (DM.3/twisting-hecke-character; BCGNT25 Lemma 4.2.4 corrected).

### Katz's hypergeometric sheaf attached to a Dwork exponent datum

**Target `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-hypergeometric-sheaf` (construction).** Let M = ℚ(e^{2πi/N}), R_0 = ℤ[ζ_N, N^{−1}], T_1 = Spec R_0[x, x^{−1}, (1 − x)^{−1}] with open immersion j : T_1 → 𝔾_{m,R_0} and f : T_1 → 𝔾_m, x ↦ 1 − x. For a Dwork exponent datum let ρ_1, …, ρ_n : μ_N → M^× be the n distinct nontrivial characters not occurring among the χ_i (equivalently the characters ζ ↦ ζ^{b}, b ∈ B(a), after fixing τ). For a place λ of M of residue characteristic l, let L_i be the rank-one lisse M_λ-sheaf on 𝔾_{m,R_0}[1/l] attached to ρ_i and the Kummer μ_N-torsor x ↦ x^N, F_i = j_!f^*L_i, and E_λ = j^*(F_1 ∗_! F_2 ∗_! ⋯ ∗_! F_n)[n − 1], where ∗_! is multiplicative convolution with compact support on 𝔾_{m,R_0}[1/l] (A ∗_! B = Rm_!(A ⊠ B) for the multiplication m : 𝔾_m × 𝔾_m → 𝔾_m).

**Named signature.** `TauCeti.Dwork.hypergeometricSheaf`.

**Hypotheses and conventions.**

- ρ_1, …, ρ_n distinct and nontrivial with ∏ρ_i = 1 (∑_{b∈B} b ≡ 0)
- l invertible on the base

**Construction.**

1. L_i is the ρ_i-isotypic part of the pushforward of the constant sheaf along the Kummer cover x ↦ x^N.
2. Multiplicative convolution with compact support is Rm_! of the external product; it is associative and commutative up to canonical isomorphism.
3. The shift [n − 1] places the convolution, restricted to T_1, in degree zero (DM.3/hypergeometric-sheaf-properties).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.1`.

**API.**

- `Dwork.kummerSheaf` (constructor): L_ρ on 𝔾_m[1/l] for a character ρ : μ_N → M_λ^×.
- `multiplicativeConvolution` (constructor): A ∗_! B := Rm_!(A ⊠ B) on 𝔾_m.
- `multiplicativeConvolution_assoc` (structure): ∗_! is associative and commutative up to canonical isomorphism.
- `Dwork.hypergeometricSheaf` (constructor): E_λ := j^*(F_1 ∗_! ⋯ ∗_! F_n)[n − 1] on T_1[1/l].
- `Dwork.hypergeometricSheaf_trace` (simp): Trace of geometric Frobenius at x ∈ T_1(k) is (−1)^{n−1}∑_{x_1⋯x_n = x}∏ρ_i((1 − x_i)^{(q−1)/N}), with ρ_i(0) = 0.
- `Dwork.hypergeometricSheaf_baseChange` (functoriality): Formation of E_λ commutes with base change along R_0[1/l] → k for finite fields k.
- `Dwork.hypergeometricSheaf_coeffChange` (functoriality): For σ ∈ Gal(M/ℚ), σ carries E_λ for (ρ_i) to E_{σλ} for (σρ_i).

**Unit tests.**

- `hypergeometricSheaf_rank_one` (degenerate): For n = 1, E_λ is the Kummer sheaf L_{ρ_1}(1 − x) on T_1, of rank one.
- `hypergeometricSheaf_trace_n_one` (computation): For n = 1 the trace at x ∈ T_1(𝔽_q) is ρ_1((1 − x)^{(q−1)/N}).
- `hypergeometricSheaf_trace_sum` (characterisation): For n = 2 the trace at x ∈ T_1(k) is −∑_{x_1x_2 = x} ρ_1((1 − x_1)^{(q−1)/N})ρ_2((1 − x_2)^{(q−1)/N}), a Jacobi-type sum.
- `not_hypergeometric_without_extension_by_zero` (non-example): Replacing j_! by j_* in F_i changes the sheaf: the stalk of j_*f^*L_i at x = 1 is zero only because ρ_i is nontrivial, and for ρ_i trivial j_! and j_* differ, so the definition requires the nontriviality of the ρ_i.

**Uses.**

- BCGNT25 Theorem 4.2.1 (DM.3/katz-dwork-comparison): the Dwork eigensheaf is a pullback of E_λ up to a character
- BCGNT25 Proposition 4.2.6 (DM.7/generic-crystalline-ordinarity): its trace formula detects ordinary points
- BLGHT11 Lemma 4.3(3) and QIAN23 Lemma 3.3(2) (DM.4/unipotent-monodromy-at-infinity): its local monodromy gives unipotence at ∞

**Checks.**

- n = 1: E_λ = j^*F_1 = L_{ρ_1}(1 − x) restricted to T_1, a Kummer sheaf of rank one.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.1, end, published p. 36 (arXiv v3 p. 41). Defines E_λ as the restriction to T_1 of the shifted multiplicative convolution with compact support of the sheaves j_!f^*L_i (the restriction is j^*, as recorded in the extraction's review).
- Nicholas M. Katz, *Another look at the Dwork family*, §5, the hypergeometric sheaf H_{V,W} and Theorem 5.3, pp. 95–97. Attaches to a Dwork-type family a hypergeometric sheaf H_can built from the lists of characters, and compares it with the primitive cohomology eigenpiece.
- Nicholas M. Katz, *Exponential sums and differential equations*, Chapter 8, as cited by BCGNT25 and BLGHT11. Construction and properties of hypergeometric sheaves by multiplicative convolution.
- Vladimir Drinfeld, Kiran S. Kedlaya, *Slopes of indecomposable F-isocrystals*, Appendix A, §A.1.6 (arXiv v11). Comments on Katz's hypergeometric complexes and their relation to Dwork families.

### Basic properties of the hypergeometric sheaf

**Target `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties` (theorem).** In the setting of DM.3/katz-hypergeometric-sheaf: (1) E_λ is a lisse M_λ-sheaf of rank n on T_1[1/l]; E_λ ⊗ M̄_λ is geometrically irreducible; E_λ is pure of weight n − 1; and det E_λ ≅ M_λ(n(1 − n)/2) (using ∏ρ_i = 1). (2) For a finite field k with q elements that is an R_0[1/l]-algebra and x ∈ T_1(k), tr(Frob_k | E_{λ,x}) = (−1)^{n−1}∑_{x_1⋯x_n = x}∏_iρ_i((1 − x_i)^{(q−1)/N}), with μ_N identified with k^×[N] and ρ_i(0) = 0.

**Named signature.** `TauCeti.Dwork.hypergeometricSheaf_lisse`.

**Hypotheses and conventions.**

- ρ_i distinct, nontrivial, ∏ρ_i = 1
- l invertible

**Proof outline.**

1. Lisse of rank n, geometric irreducibility and purity are Katz's theorems on hypergeometric sheaves (ESDE Chapter 8) applied to the convolution of the F_i.
2. The determinant is computed by Katz's determinant formula (ESDE Theorem 8.12.2(1a)), which gives a Tate twist when the product of the characters is trivial.
3. The trace formula follows from the Lefschetz trace formula for Rm_! and the definition of the F_i.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-hypergeometric-sheaf`, `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For n = 1 the trace formula reduces to the value of a Kummer character, and the determinant statement says L_{ρ_1}(1 − x) is pure of weight 0.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Theorem 4.2.1(1)–(2) and proof, published pp. 36–37 (arXiv v3 p. 41). States that E_λ is lisse of rank n, geometrically irreducible, pure of weight n − 1 with determinant M_λ(n(1 − n)/2), and gives the trace formula (4.2.2), citing Katz ESDE Chapter 8 and Theorem 8.12.2(1a).
- Nicholas M. Katz, *Exponential sums and differential equations*, Chapter 8, Theorem 8.12.2(1a), as cited by BCGNT25. Properties and determinant of hypergeometric sheaves.
- Nicholas M. Katz, *Another look at the Dwork family*, §5, p. 95. The hypergeometric sheaf H_can attached to the lists of characters and its rank.

### Local monodromy of the hypergeometric sheaf

**Target `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy` (theorem).** In the setting of DM.3/katz-hypergeometric-sheaf, the geometric local monodromy of E_λ ⊗ M̄_λ is: at x = 0, unipotent with a single Jordan block of size n (the n trivial characters at 0); at x = ∞, tame and isomorphic to ⊕_{i=1}^n L_{ρ_i} (the n distinct characters at ∞); at x = 1, a pseudo-reflection.

**Named signature.** `TauCeti.Dwork.hypergeometricSheaf_localMonodromy`.

**Hypotheses and conventions.**

- ρ_i distinct and nontrivial

**Proof outline.**

1. Katz's description of the local monodromy of a hypergeometric sheaf of type (n, n): at 0 it is ⊕ over the distinct characters of the list at 0 of the Kummer sheaf tensored with a unipotent block whose size is the multiplicity; at ∞ the same for the list at ∞; at 1 it is a pseudo-reflection (ESDE Theorem 8.4.2, cited as Theorem 8.4.11 in BLGHT11).
2. For E_λ the list at 0 consists of n copies of the trivial character (each F_i is lisse at 0 with trivial local monodromy) and the list at ∞ is ρ_1, …, ρ_n.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties`.

**Checks.**

- n = 1: L_{ρ_1}(1 − x) is unramified at 0, has monodromy ρ_1 at ∞ and is a pseudo-reflection (a nontrivial character) at 1.

**Sources.**

- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.3(3), p. 30. Deduces unipotence of the monodromy at ∞ of the Dwork family from Katz, Another look at the Dwork family, Theorem 5.3, together with Katz ESDE Theorem 8.4.11.
- Nicholas M. Katz, *Exponential sums and differential equations*, Chapter 8, §8.4 (Theorem 8.4.2), as cited by BLGHT11 and BCGNT25. Local monodromy of hypergeometric sheaves at 0, 1 and ∞.
- Nicholas M. Katz, *Another look at the Dwork family*, Lemma 8.8, p. 114. For the Dwork families, local monodromy at ∞ is a single unipotent Jordan block exactly when the primitive de Rham eigenpiece has rank n − 1 (its numbering), the hypergeometric reflection of the same fact.

### Katz's comparison of Dwork eigensheaves with hypergeometric sheaves

**Target `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison` (theorem).** Let T′_0 = T_0[1/t], j′ : T′_0 → T_0 and g : T′_0 → T_1, t ↦ t^{−N}. For every place λ of M of residue characteristic l there is a unique continuous character Ψ_λ : π_1(Spec R_0[1/l]) → O_{M_λ}^× and an isomorphism of M_λ-sheaves on T′_0[1/l]: (j′)^*V_λ ⊗ M_λ ≅ g^*E_λ ⊗ M_λ(Ψ_λ). Consequently the χ-eigensheaf V′ of the quotient family over T′_0 (DM.1/three-punctured-cover), whose pullback along t ↦ t^N is (j′)^*V_λ, is isomorphic to the pullback of E_λ along t′ ↦ 1/t′, twisted by Ψ_λ and by a Kummer character L_θ of order dividing N.

**Named signature.** `TauCeti.Dwork.eigenSheaf_iso_hypergeometric`.

**Planet.** Katz's hypergeometric comparison.

**Hypotheses and conventions.**

- Qian's exponent datum (or any datum with n + 1 zeros, nonzero residues at most once)
- l invertible

**Proof outline.**

1. Katz, Another look at the Dwork family, Theorem 5.3: on the complement of μ_d in the affine line, the primitive eigenpiece of a Dwork-type family is the d-th power pullback of a hypergeometric sheaf tensored with a character of π_1 of the base, provided the eigenpiece is nonzero; BCGNT25 specialises it to the present family, using [−1]^*H_can(trivial^n; ρ) ≅ H_can(ρ^{−1}; trivial^n).
2. Uniqueness of Ψ_λ follows from geometric irreducibility (DM.3/hypergeometric-sheaf-properties) and Schur's lemma.
3. Two lisse sheaves on T′_0 with isomorphic geometrically irreducible pullbacks along the μ_N-cover t ↦ t^N differ by a character of μ_N (Kummer twist).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank`, `PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover`, `mathlib:FundamentalGroup`.

**Checks.**

- Ranks agree: both sides have rank n, the rank of V_λ (DM.2/eigensheaf-rank) and of E_λ.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Theorem 4.2.1(3) and proof, published pp. 36–37 (arXiv v3 p. 41). Gives the character Ψ_λ and the isomorphism (4.2.3) between (j′)^*V_λ and g^*E_λ twisted by Ψ_λ, from Katz 2009 Theorem 5.3, with uniqueness by Schur's lemma.
- Nicholas M. Katz, *Another look at the Dwork family*, Theorem 5.3, pp. 96–97, and Remark 5.4, p. 97. The primitive eigenpiece of the Dwork-type family is the d-th power pullback of a hypergeometric sheaf tensored with a character Λ of π_1 of the base; changing the representative changes H by a Kummer twist and a character.

### The twisting character comes from an algebraic Hecke character

**Target `PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character` (theorem).** There is a Hecke character Ψ : ℚ(ζ_N)^×\𝔸^×_{ℚ(ζ_N)} → ℂ^× of type A_0, unramified away from N, with values of its finite part in M, such that for every λ the character Ψ_λ of DM.3/katz-dwork-comparison is the λ-adic character attached to Ψ. Moreover Ψ·c(Ψ) corresponds to ε^{n+1−N}, so Ψ is pure of weight N − n − 1 (the printed |·|^{N−n} is corrected as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E7; the sign of the exponent depends on the normalisation of the Artin map).

**Named signature.** `TauCeti.Dwork.twistingHeckeCharacter`.

**Hypotheses and conventions.**

- Correction E7: the c-linear duality is V_{c(λ)} ≅ V_λ^∨(2 − N), not (1 − N)

**Proof outline.**

1. For almost all places, the Frobenius traces of Ψ_λ are ratios of traces of V_λ and E_λ, which lie in M and are independent of λ (Katz–Messing for V_λ, the trace formula for E_λ); this is Katz's Question 5.5 argument.
2. A compatible system of λ-adic characters with values in a number field comes from an algebraic Hecke character of type A_0 (Henniart).
3. From the c-linear isomorphisms V_{c(λ)} ≅ V_λ^∨(2 − N) (DM.2/eigensheaf-duality) and E_{c(λ)} ≅ E_λ^∨(1 − n), Schur's lemma gives Ψ_λ·c(Ψ_λ) = ε^{n+1−N}.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`, `PotentialModularityAndCompatibleSystems:R24.5/character-system`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0`.

**Checks.**

- Weight check: V_λ has weight N − 2 and E_λ weight n − 1, so Ψ has weight (N − 2) − (n − 1) = N − n − 1.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Lemma 4.2.4 and proof, published p. 37 (arXiv v3 pp. 41–42). Shows Ψ_λ comes from a type A_0 Hecke character Ψ unramified away from N and defined over M, by λ-independence of traces, Henniart's theorem and c-linear dualities, with the weight relation corrected as E7.
- Nicholas M. Katz, *Another look at the Dwork family*, Question 5.5, p. 97. The traces of the character Λ are expected to be universal; for the invariant part they are ± 1.

### The twisted Dwork local systems W_λ

**Target `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system` (construction).** For a place λ of M of residue characteristic l let W_λ = V_λ ⊗_{O_{M_λ}} O_{M_λ}(Ψ_λ^{−1}), a lisse sheaf of free O_{M_λ}-modules of rank n on T_0[1/l]. Then W_λ ⊗ M_λ is pure of weight n − 1, geometrically irreducible, with determinant M_λ(n(1 − n)/2). Write W_{t,λ} for its stalk at t, W̄_λ = W_λ ⊗ k(λ) and W̄_{t,λ} likewise. The family {W_λ} has λ-independent Frobenius traces with values in M.

**Named signature.** `TauCeti.Dwork.twistedSheaf`.

**Planet.** Twisted Dwork motives W.

**Hypotheses and conventions.**

- Qian's exponent datum, n > 2 (BCGNT25 setting); Ψ from DM.3/twisting-hecke-character

**Construction.**

1. Twisting by the character Ψ_λ^{−1} of π_1(Spec R_0[1/l]) changes neither lisseness nor geometric monodromy.
2. By (4.2.3) W_λ ⊗ M_λ restricted to T′_0 is g^*E_λ, so purity, irreducibility and the determinant come from DM.3/hypergeometric-sheaf-properties (irreducibility of g^*E_λ: the geometric monodromy of E_λ restricted to the finite-index subgroup is still irreducible because its local monodromy at 0 is a single Jordan block).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank`.

**API.**

- `Dwork.twistedSheaf` (constructor): W_λ := V_λ ⊗ O(Ψ_λ^{−1}).
- `Dwork.twistedSheaf.det` (characterisation): det W_λ ⊗ M_λ ≅ M_λ(n(1 − n)/2).
- `Dwork.twistedSheaf.pure` (other): W_λ ⊗ M_λ is pure of weight n − 1.
- `Dwork.twistedSheaf.geometricallyIrreducible` (other): W_λ ⊗ M̄_λ is geometrically irreducible.
- `Dwork.twistedSheaf.reduction` (projection): W̄_λ := W_λ ⊗ k(λ), a lisse k(λ)-sheaf of rank n.
- `Dwork.twistedSheaf.geometric_eq` (compatibility): W_λ and V_λ have the same geometric monodromy (restriction to π_1(T_{0,ℚ̄})).
- `Dwork.twistedSheaf_trace_independent` (relation): For t ∈ T_0(O_{F_v}), v ∤ Nl, det(X − Frob_v | W_{t,λ}) ∈ O_M[X] is independent of λ (DM.6/dwork-compatible-system).

**Unit tests.**

- `twistedSheaf_HT_sum` (computation): For every fibre the Hodge–Tate weights sum to n(n − 1)/2 (determinant M_λ(n(1 − n)/2)); for n = 3 the sum is 3.
- `twistedSheaf_geometric_monodromy_eq` (compatibility): The image of π_1(T_{0,ℚ̄}) under W̄_λ equals that under V̄_λ.
- `twistedSheaf_rank` (degenerate): W_λ has rank n, the rank of V_λ.
- `twistedSheaf_ne_eigenSheaf` (non-example): W_λ ≇ V_λ in general: their fibres have Hodge–Tate weights {0, …, n − 1} versus {M_τ, …, M_τ + n − 1} with M_τ ≠ 0 for some τ when N > n + 1.

**Uses.**

- BCGNT25 Proposition 4.2.5 (DM.6/dwork-compatible-system): the weakly compatible system with Hodge–Tate weights {0, …, n − 1}
- BCGNT25 Definition 4.4.1 (DM.5/level-structure-torsor): level structures on W̄_λ
- BCGNT25 proof of Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): R_aux and S_UA are fibres of W

**Checks.**

- det W_λ ≅ M_λ(n(1 − n)/2), so the Hodge–Tate weights of any fibre sum to n(n − 1)/2.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.2, after Lemma 4.2.4, published p. 37 (arXiv v3 p. 42). Defines W_λ = V_λ ⊗ O_{M_λ}(Ψ_λ^{−1}) and records that it is pure of weight n − 1, geometrically irreducible, with determinant M_λ(n(1 − n)/2).

<a id="layer-dm4"></a>

## Layer DM.4: Complex monodromy

Over ℂ the monodromy of the quotient family is generated by γ_0, γ_1, γ_∞ with γ_0γ_1γ_∞ = 1. Its eigenvalues at 0 come from the Fermat fibre, its shape at 1 from Picard–Lefschetz theory (in odd dimension the vanishing cycles are isotropic, so the monodromy is a transvection on each eigenpiece), and its unipotence at ∞ from Katz's description and a determinant argument. Levelt's theorem then gives the companion model, the single Jordan block at ∞ and residual irreducibility.

**Targets of the layer.**

**Objects.** The monodromy representations ρ_t, ρ_{t′} and the oriented peripheral loops γ_0, γ_1, γ_∞ with γ_0γ_1γ_∞ = 1 (DM.4/dwork-monodromy-representations). **Theorems.** Monodromy at 0 has eigenvalues ζ_N^b, b ∈ B (DM.4/monodromy-at-zero); Picard–Lefschetz at 1: unipotent with (T − 1)² = 0 and rank ≤ 1 (DM.4/picard-lefschetz-at-one); unipotence at ∞ (DM.4/unipotent-monodromy-at-infinity, repairing QIAN23 Lemma 3.3(2)); the companion-matrix model and the transvection at 1 (DM.4/companion-model-of-monodromy; QIAN23 Lemma 3.4, BLGHT11 Corollary 4.4); maximally unipotent monodromy at ∞ (DM.4/maximal-unipotent-monodromy-at-infinity; QIAN23 Corollary 3.5, BLGHT11 Corollary 4.5); absolute irreducibility of the residual monodromy (DM.4/residual-monodromy-absolutely-irreducible).

### The Dwork monodromy representations and peripheral loops

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations` (construction).** Fix τ : ℚ(ζ_N) ↪ ℂ with τ(ζ_N) = e^{2πi/N}, a base point t ∈ T_0(ℂ) − {0} and t′ = t^N ∈ T′_0(ℂ). Let ρ_t : π_1(T_0(ℂ), t) → GL(V_{B,t}) and ρ_{t′} : π_1(T′_0(ℂ), t′) → GL(V′_{B,t′}) be the monodromy representations, with V′_{B,t′} = V_{B,t}. Choose loops γ_0, γ_1, γ_∞ around 0, 1, ∞ generating π_1(T′_0(ℂ), t′) freely on two of them, with the single relation γ_0γ_1γ_∞ = 1, and orient γ_0 so that its image in the deck group of T_0(ℂ) − {0} → T′_0(ℂ) is e^{2πi/N} = τ(ζ_N). On the index-N normal subgroup π_1(T_0(ℂ) − {0}, t), ρ_{t′} restricts to ρ_t composed with π_1(T_0(ℂ) − {0}, t) ↠ π_1(T_0(ℂ), t). For λ a prime of O (of O^+ for the real forms), ρ̄_t and ρ̄_{t′} denote the reductions on V_{B,t}/λ.

**Named signature.** `TauCeti.Dwork.monodromyQuotient`.

**Hypotheses and conventions.**

- Self-dual data: the same with BLGHT11's Ṽ_B on T̃_0 = T′_0

**Construction.**

1. The local system V′_B gives ρ_{t′}; the identification of its pullback with V_B|_{T_0(ℂ)−{0}} (DM.2/dwork-eigensheaves) gives the restriction statement.
2. π_1 of the thrice-punctured sphere is free on two peripheral loops with the product relation (Tau Ceti BelyiMaps, layer 5); the covering t ↦ t^N corresponds to the kernel of the map to ℤ/N sending γ_0 ↦ 1, γ_1 ↦ 0.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group`, `mathlib:FundamentalGroup`.

**API.**

- `Dwork.monodromy` (constructor): ρ_t : π_1(T_0(ℂ), t) →* GL(V_{B,t}).
- `Dwork.monodromyQuotient` (constructor): ρ_{t′} : π_1(T′_0(ℂ), t′) →* GL(V′_{B,t′}).
- `Dwork.peripheralLoops` (data): γ_0, γ_1, γ_∞ ∈ π_1(T′_0(ℂ), t′) with γ_0γ_1γ_∞ = 1 and γ_0 oriented by τ(ζ_N).
- `Dwork.monodromyQuotient_restrict` (compatibility): ρ_{t′} restricted to π_1(T_0(ℂ) − {0}, t) is ρ_t ∘ (inclusion-induced surjection).
- `Dwork.monodromy_reduction` (projection): ρ̄_t and ρ̄_{t′} modulo a prime λ.
- `Dwork.monodromy_conj_basepoint` (functoriality): Changing the base point conjugates the representations by parallel transport.

**Unit tests.**

- `peripheral_relation` (characterisation): γ_0γ_1γ_∞ = 1 in π_1(T′_0(ℂ), t′), and γ_0, γ_1 generate it freely.
- `monodromy_index_N` (computation): π_1(T_0(ℂ) − {0}, t) has index N in π_1(T′_0(ℂ), t′), the kernel of γ_0 ↦ 1, γ_1 ↦ 0 in ℤ/N.
- `monodromy_trivial_rank_zero` (degenerate): For the zero local system the representation is trivial on the zero space (the construction is functorial in the local system).
- `orientation_matters` (non-example): With the opposite orientation of γ_0 the eigenvalues of ρ_{t′}(γ_0) become ζ_N^{−b}, b ∈ B; since −B ≠ B for Qian's data, the orientation convention is not cosmetic.

**Uses.**

- QIAN23 Lemmas 3.3–3.7 (DM.4, DM.5): the monodromy computations
- BLGHT11 Lemma 4.3, Corollaries 4.4–4.8 (DM.4, DM.5): the symplectic analogues
- QIAN23 Proposition 3.8 (DM.5/level-structure-torsor-irreducible): transitivity of monodromy on the torsor fibres

**Checks.**

- ρ_{t′}(γ_0)^N lies in the image of ρ_t (it is the monodromy of V_B around t = 0, which is trivial since V_B is lisse at 0).

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, base point and monodromy representations, p. 1256; the loops and orientation of γ_0, p. 1257. Defines ρ_t and ρ_{t′}, the generators γ_0, γ_1, γ_∞ with γ_0γ_1γ_∞ = 1, and orients γ_0 through the deck group.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, p. 29. The fundamental group of T̃_0(ℂ) is generated by γ_0, γ_1, γ_∞ with the single relation γ_0γ_1γ_∞ = 1, giving ρ_et into Sp_n(Ṽ_B).

### Monodromy at zero: eigenvalues ζ_N^b, b ∈ B

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero` (theorem).** ρ_{t′}(γ_0) has characteristic polynomial ∏_{b∈B}(X − ζ_N^b), with distinct roots; in particular det ρ_{t′}(γ_0) = ζ_N^{∑B} = 1. For the self-dual data, ρ_et(γ_0) has characteristic polynomial ∏_{j=(N−n+1)/2}^{(N+n−1)/2}(X − ζ_N^j).

**Named signature.** `TauCeti.Dwork.charpoly_monodromy_zero`.

**Hypotheses and conventions.**

- γ_0 oriented as in DM.4/dwork-monodromy-representations

**Proof outline.**

1. γ_0 acts on V′_{B,t′} as the deck transformation ζ_N acts on the fibre of V_B at 0, by parallel transport to t = 0 inside T_0(ℂ).
2. On the eigenline V_{B,i} (i ∈ B) this is multiplication by ζ_N^i (DM.2/fermat-fibre-splitting).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`.

**Checks.**

- n = 3, N = 401: ρ_{t′}(γ_0) has eigenvalues ζ, ζ², ζ^{398}.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.3(1) and its proof, p. 1257. Computes the characteristic polynomial of ρ_{t′}(γ_0) from the H-action on the fibre at 0 and DMOS Proposition I.7.4.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 4.3(1) and proof, pp. 29–30. The self-dual analogue.

### Monodromy at one: Picard–Lefschetz

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one` (theorem).** ρ_{t′}(γ_1) is unipotent with (ρ_{t′}(γ_1) − 1)² = 0 and ρ_{t′}(γ_1) − 1 of rank at most one (a transvection once it is nontrivial). More precisely: the fibre Y_1 has N^{N−2} ordinary double points forming one free H_0-orbit; with Δ the set of vanishing cycles (one per singular point, permuted by H_0 up to sign) the monodromy T around t = 1 on H^{N−2}(Y_t(ℂ), ℤ) is x ↦ x + ε∑_{δ∈Δ}⟨x, δ⟩δ (ε = ±1 depending on N); since N − 2 is odd, the cup product is alternating and vanishing cycles at distinct points are orthogonal, so (T − 1)² = 0; on the χ-part, T − 1 has image in the line spanned by ∑_{ξ∈H_0}χ(ξ)^{−1}ξδ_0. This node proves unipotence, (T − 1)² = 0 and rank(ρ_{t′}(γ_1) − 1) ≤ 1; that the rank is exactly one is proved in DM.4/companion-model-of-monodromy, after the monodromy at ∞ is known. For the self-dual data the same argument gives characteristic polynomial (X − 1)^n and dim ker(ρ(γ_1) − 1) ≥ n − 1.

**Named signature.** `TauCeti.Dwork.monodromy_one_isTransvection`.

**Hypotheses and conventions.**

- N odd
- t′ ↦ t^N étale near t = 1, so ρ_{t′}(γ_1) is conjugate to the restriction of T

**Proof outline.**

1. Locate the singular points of Y_1 (DM.1/dwork-pencil) and apply the Picard–Lefschetz formula for ordinary double points in a proper family over a disc (LefschetzPencilsAndVanishingCycles LPV.2, complex comparison and odd relative dimension).
2. H_0 commutes with the monodromy and permutes Δ up to sign, so on the χ-eigenpart the variation factors through one functional x ↦ ⟨x, δ_0⟩.
3. Odd fibre dimension makes ⟨δ, δ′⟩ = 0 for all vanishing cycles, so (T − 1)² = 0 on all of H^{N−2}; this replaces BLGHT's symplectic step, which does not apply to the non-self-dual χ-part (PAPER-QIAN-23/E28).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil`, `PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

**Checks.**

- For the Hesse pencil (N = 3) the monodromy around t = 1 on H¹ of the elliptic fibre is a transvection with three vanishing cycles permuted by μ_3.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.3(3) and its proof, pp. 1257–1258. Asserts that ρ_{t′}(γ_1) is a transvection, referring to BLGHT11 Lemma 4.3(2).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.3(2), p. 30. Picard–Lefschetz theory gives an H_0-orbit Δ of vanishing cycles, the exact sequence and the formula x ↦ x ± ∑⟨x, δ⟩δ, whence ker(γ_1 − 1) has rank ≥ n − 1 on each eigenpart.

### Monodromy at infinity is unipotent

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity` (theorem).** ρ_{t′}(γ_∞) is unipotent, with characteristic polynomial (X − 1)^n, and so is the local monodromy of ρ_t around t = ∞ (which is conjugate to ρ_{t′}(γ_∞)^{±N}). This holds for Qian's data and for the self-dual data.

**Named signature.** `TauCeti.Dwork.monodromy_infinity_unipotent`.

**Hypotheses and conventions.**

- gcd(n, N) = 1
- the published proof of QIAN23 Lemma 3.3(2) shows only that ρ_{t′}(γ_∞)^N is unipotent (PAPER-QIAN-23/E27); the argument below replaces it

**Proof outline.**

1. By DM.3/katz-dwork-comparison, V′ ≅ (pullback of E_λ along t′ ↦ 1/t′) ⊗ Ψ_λ ⊗ L_θ with Ψ_λ geometrically trivial and L_θ a Kummer character of order dividing N. The point t′ = ∞ corresponds to x = 0, where E_λ has unipotent local monodromy with one Jordan block (DM.3/hypergeometric-local-monodromy). Hence ρ_{t′}(γ_∞) = c·u with u unipotent with one Jordan block and c a scalar with c^N = 1 (after the Betti–étale comparison of DM.2/dwork-eigensheaves).
2. det ρ_{t′}(γ_0) = 1 (DM.4/monodromy-at-zero) and ρ_{t′}(γ_1) is unipotent by the Picard–Lefschetz description (the unipotence part of DM.4/picard-lefschetz-at-one does not use this node), so det ρ_{t′}(γ_∞) = 1 and c^n = 1.
3. gcd(n, N) = 1 gives c = 1. The local monodromy of V_B at t = ∞ is ρ_{t′}(γ_∞)^{±N}, unipotent; this agrees with the semistable-model argument of QIAN21 Lemma 2.1 and the local monodromy theorem.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison`, `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero`, `PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one`, `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`, `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`.

**Checks.**

- For the self-dual datum with n = 2, ρ(γ_∞) has characteristic polynomial (X − 1)² and determinant 1.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.3(2) and its proof, pp. 1257–1258. States that ρ_{t′}(γ_∞) has characteristic polynomial (X − 1)^n; the printed proof via a semistable blowup of the reciprocal family and Illusie's local monodromy theorem yields unipotence only for the N-th power (E27).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 4.3(3) and its proof, p. 30. Proves the self-dual case from Katz 2009 Theorem 5.3 and Katz ESDE Theorem 8.4.11.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Theorem 4.2.1(3), published p. 37. The comparison (4.2.3) with the hypergeometric sheaf, used here for the non-self-dual data.

### Companion-matrix model of the Dwork monodromy

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/companion-model-of-monodromy` (theorem).** ρ_{t′}(γ_1) − 1 has rank exactly one, so ρ_{t′}(γ_1) is a transvection. Let A and B be the companion matrices of (X − 1)^n and ∏_{b∈B}(X − ζ_N^{−b}), both in GL_n(ℤ[ζ_N]), and ρ : π_1(T′_0(ℂ), t′) → GL_n(ℤ[ζ_N]) the representation γ_0 ↦ B^{−1}, γ_∞ ↦ A, γ_1 ↦ BA^{−1}. Then ρ_{t′} ⊗ ℂ (coefficients extended along τ) is equivalent to ρ ⊗ ℂ, and ρ(γ_1) − 1 has rank one with nonzero entries only in the first column. The same holds for the self-dual data with B the companion matrix of ∏_{j=(N−n+1)/2}^{(N+n−1)/2}(X − ζ_N^j), and then ρ is irreducible (BLGHT11 Corollary 4.4).

**Named signature.** `TauCeti.Dwork.monodromy_equiv_companion`.

**Hypotheses and conventions.**

- Qian's data (n > 2) or the self-dual data

**Proof outline.**

1. If ρ_{t′}(γ_1) = 1 then ρ_{t′}(γ_0) = ρ_{t′}(γ_∞)^{−1} would have eigenvalue 1, contrary to DM.4/monodromy-at-zero (0 ∉ B) and DM.4/unipotent-monodromy-at-infinity; with DM.4/picard-lefschetz-at-one the rank of ρ_{t′}(γ_1) − 1 is exactly one.
2. ρ_{t′}(γ_∞) has characteristic polynomial (X − 1)^n (DM.4/unipotent-monodromy-at-infinity), ρ_{t′}(γ_0)^{−1} has characteristic polynomial ∏(X − ζ_N^{−b}) (DM.4/monodromy-at-zero), with no common root since 0 ∉ B, and ρ_{t′}(γ_1) is a pseudo-reflection (DM.4/picard-lefschetz-at-one).
3. Levelt's theorem (DM.0/levelt-rigidity) conjugates (ρ_{t′}(γ_0), ρ_{t′}(γ_∞)) to (B^{−1}, A).
4. BA^{−1} − 1 has rank one by DM.0/companion-normal-form.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/levelt-rigidity`, `PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form`, `PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero`, `PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity`, `PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one`.

**Checks.**

- n = 3: A = C((X − 1)³) has columns e_2, e_3, (1, −3, 3)ᵀ.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.4 and proof, pp. 1258–1259. Defines ρ by companion matrices and proves ρ_{t′} ≅ ρ over ℂ by Beukers–Heckman Theorem 3.5.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Corollary 4.4, p. 31. The self-dual analogue, with irreducibility from Beukers–Heckman Proposition 3.3.

### Maximally unipotent monodromy at infinity

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/maximal-unipotent-monodromy-at-infinity` (theorem).** ρ_{t′}(γ_∞) has minimal polynomial (X − 1)^n: it is a single unipotent Jordan block. Hence the local monodromy of ρ_t around t = ∞, conjugate to ρ_{t′}(γ_∞)^{±N}, is also a single unipotent Jordan block (a nonzero power of a single unipotent Jordan block in characteristic 0 is again one; in positive characteristic a power can split, so this is a statement over ℂ or ℚ̄_l). The same holds for the self-dual family (BLGHT11 Corollary 4.5 and Proposition 4.2(2)) and, by coefficient conjugation, for every Galois conjugate σχ of the character.

**Named signature.** `TauCeti.Dwork.monodromy_infinity_singleJordanBlock`.

**Planet.** Maximally unipotent monodromy at infinity.

**Hypotheses and conventions.**

- characteristic 0 coefficients for the statement about the N-th power

**Proof outline.**

1. By DM.4/companion-model-of-monodromy, ρ_{t′}(γ_∞) is conjugate to A = C((X − 1)^n), whose minimal polynomial is (X − 1)^n (DM.0/companion-normal-form); alternatively this follows directly from DM.3/hypergeometric-local-monodromy.
2. If u = 1 + ν with ν nilpotent of order n, then u^m − 1 = mν(1 + …) has the same nilpotency order when m is invertible.
3. The automorphism σ of the coefficients carries the χ-eigensheaf onto the σχ-eigensheaf compatibly with monodromy (DM.2/dwork-eigensheaves).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/companion-model-of-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form`, `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`.

**Checks.**

- n = 2: ρ(γ_∞) = [[0, −1], [1, 2]], conjugate to [[1, 1], [0, 1]].
- In the boundary case N = n + 1 = 5 (excluded here, treated in HSBT10), the H_0-invariant part of the Dwork quintic family has a single unipotent Jordan block of size 4 at t = ∞, the classical large complex structure point.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Corollary 3.5, p. 1259. ρ_{t′}(γ_∞) has minimal polynomial (X − 1)^n, and so does the monodromy around ∞ under ρ_t.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Corollary 4.5 and Proposition 4.2(2), pp. 27–31. The self-dual analogue: the monodromy at infinity is unipotent with one Jordan block.

### Absolute irreducibility of the residual monodromy

**Target `PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible` (theorem).** Let λ be a prime of O (of O^+ for the self-dual data) of odd residue characteristic l ∤ N. Then the reduction ρ̄_{t′} : π_1(T′_0(ℂ), t′) → GL(V′_{B,t′}/λ) is absolutely irreducible and isomorphic to the reduction ρ̄ of the companion representation; ρ̄_{t′}(γ_1) is a transvection, ρ̄_{t′}(γ_∞) is unipotent and ρ̄_{t′}(γ_0) has the n distinct eigenvalues ζ_N^b mod λ, b ∈ B.

**Named signature.** `TauCeti.Dwork.residualMonodromy_absolutelyIrreducible`.

**Hypotheses and conventions.**

- l odd and prime to N
- λ ∤ N ensures ζ_N^b ≢ 1 mod λ for b ∈ B

**Proof outline.**

1. Reduce the characteristic polynomials of DM.4/monodromy-at-zero and DM.4/unipotent-monodromy-at-infinity modulo λ; ρ̄_{t′}(γ_1) − 1 has rank ≤ 1, and = 1 since otherwise ρ̄(γ_0) = ρ̄(γ_∞)^{−1} would have eigenvalue 1.
2. Apply DM.0/hypergeometric-group-irreducible: ρ̄(γ_∞) and ρ̄(γ_0)^{−1} have no common eigenvalue.
3. ρ̄_{t′} and ρ̄ have the same characteristic polynomials (both are reductions of ℤ[ζ_N]-lattices in representations conjugate over ℂ), so by Brauer–Nesbitt they have the same semisimplification, and ρ̄ is absolutely irreducible, hence they are isomorphic.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.0/hypergeometric-group-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.4/companion-model-of-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero`, `PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity`, `PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one`.

**Checks.**

- For n = 3, l = 3, N = 401 the reduction mod a prime above 3 has no invariant line or plane.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Paragraph after Definition 3.6, p. 1259. Shows ρ̄ is absolutely irreducible by the Beukers–Heckman argument and identifies ρ̄_{t′} with it by equality of traces.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proof of Lemma 4.6, p. 31. The self-dual analogue.

<a id="layer-dm5"></a>

## Layer DM.5: Residual monodromy and level-structure torsors

Residual monodromy is SL_n(k(λ)) for Qian's data when −1 ∉ ⟨l⟩, SU_n(k(λ)) in the unitary case, and Sp_n for the self-dual data; at two primes it is the full product. The moduli spaces of level structures — isomorphisms of the residual local systems with given Galois representations, with prescribed determinants and pairings — are therefore geometrically irreducible, which is what Moret-Bailly's theorem needs.

**Targets of the layer.**

**Objects.** The skew-Hermitian Poincaré pairing on W̄_λ in the unitary case −1 ∈ ⟨l⟩ mod N (DM.5/hermitian-poincare-pairing); the finite étale moduli T({U_i}) of level structures with prescribed determinant and pairing (DM.5/level-structure-torsor: Qian's T_W, BLGHT11's symplectic T_W with BLGGT14's correction, BCGNT25 Definition 4.4.1). **Theorems.** Residual monodromy SL_n(k(λ)) (DM.5/residual-monodromy-sl; QIAN23 Lemma 3.7), Sp_n (DM.5/residual-monodromy-sp; BLGHT11 Lemma 4.6, Corollary 4.7), SU_n in the unitary case (DM.5/residual-monodromy-su; BCGNT25 Proposition 4.4.2); the determinant is geometrically constant (DM.5/determinant-descends); the two-prime monodromy is the full product (DM.5/two-prime-product-monodromy; QIAN23 Proposition 3.8, BLGHT11 Corollary 4.8); the level-structure torsors are geometrically irreducible (DM.5/level-structure-torsor-irreducible).

### Full special linear residual monodromy

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sl` (theorem).** Let n > 2, Qian's datum, l an odd prime prime to N, λ a prime of O = ℤ[1/(2N), ζ_N] above l, so k(λ) = 𝔽_{l^r} with r the order of l mod N; if r is even assume N ∤ l^{r/2} + 1, equivalently −1 ∉ ⟨l⟩ ⊂ (ℤ/Nℤ)^×. Then ρ̄_{t′}(π_1(T′_0(ℂ), t′)) = SL(V′_{B,t′}/λ) ≅ SL_n(k(λ)) and ρ̄_t(π_1(T_0(ℂ), t)) = SL(V_{B,t}/λ) for every t ∈ T_0(ℂ). Equivalently the geometric monodromy of V[λ] (and of W̄_λ) is SL_n(k(λ)).

**Named signature.** `TauCeti.Dwork.residualMonodromy_eq_SL`.

**Planet.** Full residual monodromy SL_n.

**Hypotheses and conventions.**

- n > 2
- N ∤ l^{r/2} + 1 when r is even
- l odd, l ∤ N

**Proof outline.**

1. The normal closure Δ of γ_1 has cyclic quotient generated by γ_0 (or γ_∞); the index of ρ̄(Δ) in the image divides both N (order of ρ̄(γ_0)) and a power of l (order of the unipotent ρ̄(γ_∞)), so the image is generated by transvections.
2. It is absolutely irreducible (DM.4/residual-monodromy-absolutely-irreducible); by DM.0/zalesskii-serezhkin-classification it is conjugate to SL_n(k), Sp_n(k) or SU(n, k) for k ⊆ k(λ).
3. A proper subfield would make the eigenvalue set {ζ^b} of ρ̄(γ_0) stable under l^m with l^m ≢ 1 mod N, i.e. l^mB = B; Sp_n(k(λ)) would force B = −B; SU(n, k(λ)) would force l^{r/2}B = −B. DM.1/asymmetric-stabiliser-trivial excludes all three, the last with N ∤ l^{r/2} + 1.
4. π_1(T_0(ℂ) − {0}) is normal of index N in π_1(T′_0(ℂ)), so ρ̄_t has image normal in SL_n(k(λ)) with cyclic quotient of order dividing N; the cyclic composition factors of SL_n(k(λ)) have order dividing n (DM.0/special-linear-unitary-simple) and gcd(N, n) = 1.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification`, `PotentialAutomorphyDworkMotivesPartII:DM.1/asymmetric-stabiliser-trivial`, `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple`, `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`, `PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero`, `PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity`.

**Checks.**

- If l ≡ 1 mod N then k(λ) = 𝔽_l, r = 1 is odd, and the residual monodromy of V[λ] is SL_n(𝔽_l); this is the case of the auxiliary prime l′ in the switching theorem.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.7 and its proof, pp. 1259–1260. Proves that the residual monodromy on T′_0 and on T_0 is SL_n(k(λ)) under N ∤ l^{r/2} + 1, by the transvection argument, Zalesskii–Serezhkin and Lemma 3.1; the first assertion is stated for n > 2 only (PAPER-QIAN-23/E31).

### Full symplectic residual monodromy of the self-dual family

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sp` (theorem).** For the self-dual data (n even) and a nonzero prime λ of O^+ = ℤ[ζ_N, 1/(2N)]^+, the reduction of ρ_et on Ṽ_B/λ has image Sp(Ṽ_{B,t̃}/λ), and for every t ∈ T_0(ℂ) the map π_1(T_0(ℂ), t) → Sp(V_{B,t}/λ) is surjective. For n = 2 this gives SL_2(k(λ)) = Sp_2(k(λ)) on T_0(ℂ); the corresponding statement on T′_0(ℂ) with SL_n is false for n = 2 (PAPER-QIAN-23/E31).

**Named signature.** `TauCeti.Dwork.residualMonodromy_eq_Sp`.

**Hypotheses and conventions.**

- n even; λ a prime of the real cyclotomic ring, k(λ) its residue field (degree over 𝔽_l not necessarily the order of l mod N)

**Proof outline.**

1. Absolute irreducibility as in DM.4/residual-monodromy-absolutely-irreducible; generation by elements with characteristic polynomial (X − 1)^n and fixed space of dimension ≥ n − 1 as in DM.5/residual-monodromy-sl.
2. Zalesskii–Serezhkin (for n > 2) leaves SL_n(k), Sp_n(k), SU(n, k); the alternating pairing excludes SL_n and SU for n > 2 (a diagonal element of SU(n, k(λ)) not conjugate into Sp_n), and the field of traces is k(λ) because αB ≠ B for α ≠ ±1 (BLGHT11's argument).
3. On T_0(ℂ): the quotient by the index-N normal subgroup is cyclic of order dividing N, and the cyclic composition factors of Sp_n(𝔽_{l^r}) have order 2 or 3 (3 only for Sp_2(𝔽_3)), prime to N.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification`, `PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms`, `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple`, `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`.

**Checks.**

- n = 2: the residual monodromy of the real form mod λ is SL_2(k(λ)).

**Sources.**

- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 4.6 and Corollary 4.7 with proofs, pp. 31–33. The residual monodromy of the self-dual family is the full symplectic group, on T̃_0 and on T_0.
- Lie Qian, *Potential automorphy for GL_n*, §3, paragraph after Proposition 3.2, p. 1257, and proof of Lemma 3.7, p. 1259. Uses BLGHT11 Corollary 4.7 (and Lemma 4.6) for the case n = 2.

### The skew-Hermitian Poincaré pairing on the residual Dwork local system

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing` (construction).** Let n > 2, Qian's datum, and λ a place of M above l ∤ 2N with −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^× (equivalently, the Frobenius of k(λ) over 𝔽_l contains complex conjugation c on μ_N). Then Poincaré duality on the relative cohomology with O_{M^+_λ}-coefficients, extended sesquilinearly to O_{M_λ}, and the Ψ-twist give a perfect 𝔽_l-bilinear pairing ⟨·,·⟩ : W̄_λ × W̄_λ → k(λ)(1 − n) with ⟨ax, y⟩ = a⟨x, y⟩, ⟨x, ay⟩ = c(a)⟨x, y⟩ and ⟨y, x⟩ = −c⟨x, y⟩, i.e. skew-Hermitian for k(λ)/k(λ)^c. Consequently the geometric monodromy of W̄_λ lies in a unitary group SU_n(k(λ)) (after DM.0/hermitian-forms-unique), and every fibre W̄_{t,λ} is conjugate self-dual with multiplier ε̄^{1−n}.

**Named signature.** `TauCeti.Dwork.unitaryPairing`.

**Hypotheses and conventions.**

- −1 ∈ ⟨l⟩ mod N (the 'unitary case'); n > 2, N odd

**Construction.**

1. DM.2/eigensheaf-duality pairs the χ-part with the χ^{−1}-part; c sends χ to χ^{−1}, and when c ∈ Gal(k(λ)/𝔽_l) the composition with the coefficient automorphism c gives a sesquilinear self-pairing of V̄_λ.
2. The middle cup product is alternating (N − 2 odd), which gives ⟨y, x⟩ = −c⟨x, y⟩; the twist by Ψ_λ^{−1} and the relation Ψ·c(Ψ) = ε^{n+1−N} (DM.3/twisting-hecke-character) shift the values from k(λ)(2 − N) to k(λ)(1 − n).
3. Multiplying by η with c(η) = −η makes it Hermitian (DM.0/hermitian-form); DM.0/hermitian-forms-unique conjugates the isometry group to U_n, and the geometric determinant is trivial, so geometric monodromy lies in SU_n.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character`, `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form`, `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique`, `PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group`.

**API.**

- `Dwork.unitaryPairing` (constructor): The pairing ⟨·,·⟩ : W̄_λ × W̄_λ → k(λ)(1 − n) in the unitary case.
- `Dwork.unitaryPairing.skewHermitian` (characterisation): ⟨ax, y⟩ = a⟨x, y⟩, ⟨x, ay⟩ = c(a)⟨x, y⟩, ⟨y, x⟩ = −c⟨x, y⟩.
- `Dwork.unitaryPairing.perfect` (other): The pairing is perfect on every stalk.
- `Dwork.unitaryPairing.equivariant` (functoriality): π_1(T_0[1/l]) acts by similitudes with multiplier ε̄^{1−n}.
- `Dwork.unitaryPairing.stalk` (projection): The induced pairing ⟨·,·⟩_{W̄_{t,λ}} on each fibre.
- `Dwork.unitaryPairing_det` (relation): The pairing induced on ∧^n W̄_λ is a Hermitian-up-to-η form on a line, compatible with det W̄_λ ≅ ε̄^{−n(n−1)/2}.

**Unit tests.**

- `unitaryPairing_unitary_case_minus_one` (computation): For l ≡ −1 mod N, k(λ) = 𝔽_{l²} and the pairing is skew-Hermitian for 𝔽_{l²}/𝔽_l.
- `unitaryPairing_absent_split_case` (degenerate): If l ≡ 1 mod N, then c ∉ ⟨l⟩ and no such self-pairing exists: W̄_λ pairs with the χ^{−1}-sheaf, a different local system (residual monodromy SL_n, DM.5/residual-monodromy-sl).
- `unitaryPairing_skew` (characterisation): ⟨x, x⟩ ∈ ker(1 + c) for every x.
- `unitaryPairing_not_bilinear` (non-example): The pairing is not k(λ)-bilinear: ⟨x, ay⟩ = c(a)⟨x, y⟩ ≠ a⟨x, y⟩ for a ∉ k(λ)^c.

**Uses.**

- BCGNT25 Definition 4.4.1(3) (DM.5/level-structure-torsor): level structures in the unitary case must respect it
- BCGNT25 Proposition 4.4.2 (DM.5/residual-monodromy-su): it confines the geometric monodromy to SU_n
- BCGNT25 Lemma 4.4.4 (DM.7/fermat-fibre-inertia-at-minus-one): orthogonality of the Fermat eigenlines

**Checks.**

- If l ≡ −1 mod N then k(λ) = 𝔽_{l²} and c is the Frobenius x ↦ x^l of 𝔽_{l²}.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, §4.4, paragraph after Definition 4.4.1(3), published pp. 41–42 (arXiv v3 pp. 46–47). When −1 mod N lies in ⟨l_i⟩ there is a perfect pairing on W̄_{λ_i} with values in k(λ_i)(1 − n) satisfying the same two conditions, from Poincaré duality on the relative cohomology with O_{M^+_λ}-coefficients extended sesquilinearly.

### Full special unitary residual monodromy in the unitary case

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-su` (theorem).** Let n > 2, Qian's datum, l ∤ 2N with −1 ∈ ⟨l⟩ mod N and λ | l a place of M. Then the image of the geometric monodromy group π_1(T_{0,ℚ̄}) acting on W̄_λ is SU_n(k(λ)) for the skew-Hermitian structure of DM.5/hermitian-poincare-pairing.

**Named signature.** `TauCeti.Dwork.residualMonodromy_eq_SU`.

**Hypotheses and conventions.**

- n > 2, gcd(N, n) = 1
- −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^×

**Proof outline.**

1. The image lies in SU_n(k(λ)) by DM.5/hermitian-poincare-pairing.
2. Run the argument of DM.5/residual-monodromy-sl: generation by transvections, Zalesskii–Serezhkin, exclusion of proper subfields and of Sp_n by DM.1/asymmetric-stabiliser-trivial; the remaining possibility is SU(n, k(λ)), now allowed.
3. The monodromy of T_0 is normal of index dividing N in that of T′_0; SU_n(k(λ)) is perfect with cyclic composition factors of order dividing n (DM.0/special-linear-unitary-simple), and gcd(N, n) = 1, so the image on T_0 is all of SU_n(k(λ)).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing`, `PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification`, `PotentialAutomorphyDworkMotivesPartII:DM.1/asymmetric-stabiliser-trivial`, `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple`, `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`.

**Checks.**

- For l ≡ −1 mod N and n = 3 the geometric monodromy of W̄_λ is SU_3(𝔽_{l²}).

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.4.2 and its proof, published p. 42 (arXiv v3 p. 47). In the case −1 mod N ∈ ⟨l_i⟩ the proof of Qian's Lemma 3.7 gives a subgroup of SU_n of index dividing N, hence all of SU_n(k(λ_i)) since N is prime to n.

### The determinant of the Dwork local systems is geometrically constant

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends` (theorem).** For every nonzero ideal 𝔫 of O (of O^+ for the self-dual data), the rank-one lisse sheaf ∧^n V[𝔫] on (T_0)_F, F ⊇ ℚ(ζ_N), has trivial geometric monodromy, hence is the pullback of a character of G_F, determined by its stalk at t = 0. The same holds for ∧^n V_λ and for ∧^n W̄_λ (which is ε̄^{−n(n−1)/2}). This is descent of the determinant, not triviality of the arithmetic character.

**Named signature.** `TauCeti.Dwork.det_eigenSheaf_geometricallyConstant`.

**Hypotheses and conventions.**

- T_0 geometrically connected over F

**Proof outline.**

1. The geometric fundamental group of T′_0 is generated by γ_0, γ_1, γ_∞, whose images have determinant 1 (DM.4/monodromy-at-zero, DM.4/picard-lefschetz-at-one, DM.4/unipotent-monodromy-at-infinity); this persists after reduction and restriction to the finite-index subgroup of T_0.
2. A lisse sheaf on a geometrically connected F-variety with trivial geometric monodromy is the pullback of a G_F-representation (the homotopy exact sequence π_1^geom → π_1 → G_F); its value is read off at the F-point t = 0.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero`, `PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one`, `PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank`, `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For n = 3 and 𝔫 = λ, ∧³V[λ] is the character of G_F by which G_F acts on the top exterior power of the Fermat fibre.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, paragraph following the proof of Lemma 3.7, p. 1260. The monodromy of ∧^n V[𝔫] restricted to the geometric fundamental group is trivial because det(γ_0) = det(γ_1) = det(γ_∞) = 1, so it factors through G_F.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Theorem 4.2.1(1) and the definition of W_λ, published p. 37. det W_λ ≅ M_λ(n(1 − n)/2).

### Moduli of level structures on Dwork local systems

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor` (construction).** Let F ⊇ ℚ(ζ_N) be a number field, l_1 ≠ l_2 primes not dividing 2N, λ_i places of M above l_i, and Λ = W̄_{λ_1} × W̄_{λ_2} (or V[𝔫] for 𝔫 = λ_1λ_2, or the self-dual V[𝔫]((N − 1 − n)/2) over O^+). Level-structure data are: (1) étale sheaves U_i on Spec F of free k(λ_i)-modules of rank n (i.e. continuous representations of G_F); (2) isomorphisms η_i : ∧^nW̄_{λ_i} ≅ ∧^nU_i over (T_0)_F (possible by DM.5/determinant-descends exactly when the determinant characters agree); (3) in the unitary case −1 ∈ ⟨l_i⟩, a perfect 𝔽_{l_i}-bilinear skew-Hermitian pairing U_i × U_i → k(λ_i)(1 − n), with η_i compatible with the pairings induced on ∧^n (in the self-dual case, a perfect alternating pairing with multiplier ε^{1−n} matching that of V[𝔫]). The functor T({U_i}) on (T_0)_F-schemes S, sending S to pairs of isomorphisms φ_i : W̄_{λ_i,S} ≅ U_{i,S} with ∧^nφ_i = η_i and preserving the pairings in the unitary (resp. symplectic) case, is represented by a finite étale (T_0)_F-scheme, a torsor under the finite étale group scheme SL(W̄_{λ_1}) × SL(W̄_{λ_2}) (resp. SU, Sp). This covers Qian's T_W (U_1 × U_2 = W, n > 2, split case), BLGHT11's T_W with the symplectic condition added in BLGGT14, and BCGNT25's T({U_{λ_i}}) (Definition 4.4.1, with places of M and the compatibility of η_i with the pairings, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E22–E23). For one prime l ≡ 1 mod N write T(r̄_λ); for two primes ≡ ±1 mod N write T(r̄_{λ_1}, r̄_{λ_2}).

**Named signature.** `TauCeti.Dwork.levelTorsor`.

**Planet.** Level-structure torsors T_W.

**Hypotheses and conventions.**

- η_i compatible with the pairings in the unitary case (otherwise the functor can be empty)
- the U_i are given as Galois representations of G_F

**Construction.**

1. Étale locally both W̄ and U are constant and η is multiplication by a unit; the solutions form a coset of SL_n (resp. SU_n, Sp_n) inside GL_n, so the functor is an étale sheaf, locally constant with finite values.
2. Locally constant sheaves of finite sets on (T_0)_F are representable by finite étale covers (equivalently, finite π_1-sets); the group-scheme action is simply transitive.
3. Isom schemes of locally free sheaves are representable (AlgebraicModuliForArithmeticGeometry R09.2), and the determinant and pairing conditions are closed and open.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`, `PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing`, `PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank`, `AlgebraicModuliForArithmeticGeometry:R09.2/sheaf-isom-representability`, `AlgebraicModuliForArithmeticGeometry:R09.4/isom-torsor`, `SchemeAndStackFoundations:SF.2`.

**API.**

- `Dwork.LevelData` (structure): The data (U_i, η_i, pairings) for one or two primes.
- `Dwork.levelTorsor` (constructor): The finite étale (T_0)_F-scheme T({U_i}) representing the functor.
- `Dwork.levelTorsor.finiteEtale` (instance): T({U_i}) → (T_0)_F is finite étale.
- `Dwork.levelTorsor.point_iff` (characterisation): For a field K ⊇ F and t ∈ T_0(K), a K-point of T({U_i}) over t is a G_K-equivariant isomorphism W̄_{λ_i,t} ≅ U_i|G_K with the prescribed determinant and pairing compatibility.
- `Dwork.levelTorsor.torsor` (structure): T({U_i}) is a torsor under ∏ SL(W̄_{λ_i}) (SU in the unitary case, Sp for the self-dual data).
- `Dwork.levelTorsor.baseChange` (functoriality): Formation commutes with extension of F and with base change on T_0.
- `Dwork.levelTorsor.single` (constructor): T(r̄_λ) for one prime λ, l ≡ 1 mod N, and r̄_λ with determinant ε̄^{−n(n−1)/2}.

**Unit tests.**

- `levelTorsor_degree` (computation): For one prime λ with k(λ) = 𝔽_l, the degree of T(r̄_λ) over T_0 is #SL_n(𝔽_l); for n = 3, l = 7 it is 7³(7² − 1)(7³ − 1) = 5630688.
- `levelTorsor_point_at_fibre` (characterisation): If U = W̄_{λ,t_0} with η the identity, then t_0 lifts to an F-point of T(U).
- `levelTorsor_empty_if_det_mismatch` (degenerate): If det U ≇ det W̄_λ as G_F-characters there is no η, and the data are not defined (the torsor is not constructed for such U).
- `levelTorsor_needs_pairing` (non-example): In the unitary case, dropping the pairing condition gives a torsor under SL_n(k(λ)) on which the geometric monodromy SU_n(k(λ)) acts with [SL_n(k(λ)) : SU_n(k(λ))] > 1 orbits, so the scheme is not geometrically connected (the reason for BLGGT14's correction of BLGHT11 in the symplectic case).

**Uses.**

- QIAN23 Proposition 3.8 and §4 (DM.5/level-structure-torsor-irreducible, DM.9/qian-switching-theorem): Moret-Bailly produces points on its Weil restriction
- BLGGT14 Theorem 3.1.2 (DM.9/self-dual-switching): the symplectic version
- BCGNT25 Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): T(r̄_{CM,𝔯}) and T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q})

**Checks.**

- If U_i = W̄_{λ_i,t_0} for an F-point t_0, the identity is an F-point of T({U_i}) above t_0.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, construction of T_W preceding Proposition 3.8, pp. 1260–1261. Defines T_W(S) as the isomorphisms W_S ≅ V[𝔫]_S with top exterior power φ_S and asserts representability (it is in fact finite étale).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §4, the cover T_W, p. 27. Defines the finite étale cover T_W of isomorphisms W_S ≅ V[𝔫]((N − 1 − n)/2)_S.
- Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, *Potential automorphy and change of weight*, Proof of Theorem 3.1.2, pp. 43–44 (arXiv v4). Corrects BLGHT11: the isomorphisms in T_W must be compatible with the symplectic structures.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Definition 4.4.1 and Remark 4.4.3, published pp. 41–42 (arXiv v3 pp. 46–48). Defines the data (1)–(3), the functor of pairs of isomorphisms respecting η_i and the pairings, its finite étale representing scheme, and the notations T(r̄_{λ_1}, r̄_{λ_2}) and T(r̄_λ).

### Residual monodromy at two primes is the full product

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/two-prime-product-monodromy` (theorem).** Let l_1 ≠ l_2 be primes not dividing 2N with max(l_1, l_2) > 10, λ_i | l_i, and suppose each factor's geometric monodromy is the full group H_i ∈ {SL_n(k(λ_i)) (n > 2, −1 ∉ ⟨l_i⟩), SU_n(k(λ_i)) (n > 2, −1 ∈ ⟨l_i⟩), Sp_n(k(λ_i)) (self-dual data)}. Then for every t ∈ T_0(ℂ) the geometric monodromy π_1(T_0(ℂ), t) → H_1 × H_2 is surjective.

**Named signature.** `TauCeti.Dwork.residualMonodromy_prod_surjective`.

**Hypotheses and conventions.**

- l_1 ≠ l_2 odd, prime to N, max(l_1, l_2) > 10 (in the self-dual case BLGHT11 needs only l_1, l_2 > 2 and residue fields ≠ 𝔽_3 for n = 2)

**Proof outline.**

1. Each projection is surjective (DM.5/residual-monodromy-sl, DM.5/residual-monodromy-su, DM.5/residual-monodromy-sp).
2. The H_i are perfect with simple projective quotients, and no composition factor of H_2 is isomorphic to the simple quotient of H_1 when l_1 > 10 (DM.0/special-linear-unitary-simple, DM.0/artin-non-isomorphism); apply DM.0/product-of-simple-images.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sl`, `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-su`, `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sp`, `PotentialAutomorphyDworkMotivesPartII:DM.0/product-of-simple-images`, `PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple`, `PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism`.

**Checks.**

- For Qian's switching (l, l′ with l′ ≡ 1 mod N, l′ > 2ln + 5 > 10) the hypotheses hold with H_2 = SL_n(𝔽_{l′}).

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proposition 3.8, first two paragraphs of the proof, p. 1261. By Lemma 3.7, Goursat's lemma, the normal subgroups of SL_n and Artin's theorem, the monodromy surjects onto SL_n(k(𝔓_1)) × SL_n(k(𝔓_2)).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Corollary 4.8 and proof, p. 33. The symplectic analogue for square-free 𝔫 whose prime factors have distinct residue characteristics.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Proposition 4.4.2, published p. 42. The product of SL_n and SU_n factors, by Lemma 5.2.3 and Goursat's lemma.

### The level-structure torsors are geometrically irreducible

**Target `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible` (theorem).** Under the hypotheses of DM.5/two-prime-product-monodromy (and for one prime l ≡ 1 mod N), with level data as in DM.5/level-structure-torsor (pairings compatible with η_i in the unitary case; symplectic compatibility in the self-dual case), the scheme T({U_i}) is a smooth, geometrically irreducible F-variety. This is Qian's Proposition 3.8, BLGHT11 Proposition 4.2(1) with BLGGT14's correction, and BCGNT25 Proposition 4.4.2 with the compatibility proviso.

**Named signature.** `TauCeti.Dwork.levelTorsor_geometricallyIrreducible`.

**Planet.** Geometric irreducibility of T_W.

**Hypotheses and conventions.**

- η_i compatible with the pairings in the unitary case (PAPER-BOXER-CALEGARI-GEE-ETAL-25/E23)
- two primes with max > 10, or one prime l ≡ 1 mod N

**Proof outline.**

1. T({U_i}) is finite étale over the smooth geometrically connected (T_0)_F, hence smooth; it is geometrically connected iff π_1(T_{0,ℚ̄}) acts transitively on a geometric fibre.
2. A geometric fibre is a torsor under ∏H_i (the groups preserving determinant and pairing), and the geometric monodromy surjects onto ∏H_i (DM.5/two-prime-product-monodromy), so it acts transitively.
3. A smooth connected variety over a field of characteristic 0 is irreducible.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor`, `PotentialAutomorphyDworkMotivesPartII:DM.5/two-prime-product-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sl`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For one prime l ≡ 1 mod N with k(λ) = 𝔽_l, T(r̄_λ) is geometrically irreducible because the monodromy of W̄_λ is SL_n(𝔽_l) (BCGNT25 Remark 4.4.3).

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proposition 3.8 and the last paragraph of its proof, p. 1261. T_W is geometrically connected, by transporting one point to another along a path whose monodromy is ψ_2ψ_1^{−1}.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Proposition 4.2(1), p. 27. T_W is geometrically connected for square-free 𝔫 with distinct residue characteristics.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.4.2 and Remark 4.4.3, published p. 42. T({U_{λ_i}}) is a geometrically irreducible smooth F-scheme; T(r̄_λ) likewise for one prime l ≡ 1 mod N.

<a id="layer-dm6"></a>

## Layer DM.6: Frobenius, Gauss sums and determinants

Frobenius on the Fermat fibre is a product of Gauss sums, which computes the determinant character of the Dwork local system. Matching determinants at the two primes is the arithmetic input of the switch: after a totally real base change the difference becomes an n-th power. Frobenius polynomials of good fibres are λ-independent.

**Targets of the layer.**

**Theorems.** Frobenius on the Fermat eigenlines is q^{−1}∏_j g(v, a_j + i) (DM.6/fermat-frobenius-gauss-sums); the determinant formula q^{n(N−n−2)/2}(∏_{b∈B}g(v, b))^n (DM.6/dwork-determinant-gauss-formula); descent of the Gauss product to ℚ_l(ζ_N) (or its real subfield for n = 2) (DM.6/gauss-product-descent); det V[λ] takes values in (𝔽_{l²}^×k(λ)^×)^n (DM.6/determinant-nth-power; QIAN23 Lemma 3.9); determinant matching at l and at the auxiliary prime l′ ≡ 1 mod N, with the corrected hypotheses (DM.6/determinant-matching-at-l, DM.6/determinant-matching-at-auxiliary-prime); Frobenius polynomials of good fibres are integral and independent of λ (DM.6/frobenius-polynomials-independent; BCGNT25 Proposition 4.2.5(1)). Roots of characters after totally real base change are imported from ArithmeticGaloisDuality R02.4.

### Frobenius on the Fermat eigenlines is a product of Gauss sums

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/fermat-frobenius-gauss-sums` (theorem).** Let F ⊇ ℚ(ζ_N), v a finite place of F of residue characteristic p ∤ Nl with residue field of q elements, ψ : 𝔽_q → ℚ̄_l^× a nontrivial additive character and t : μ_N(𝔽_q) ≅ μ_N(ℚ̄_l) the identification through the place. For a ∈ ℤ/Nℤ put g(v, a) = −∑_{x∈𝔽_q^×} t(x^{(1−q)/N})^a ψ(x) (so g(v, 0) = 1). Then for i ∈ B(a) the geometric Frobenius at v acts on the eigenline V_{λ,i} of the Fermat fibre by the scalar q^{−1}∏_{j=1}^N g(v, a_j + i), which is independent of ψ; for i ∉ B(a) the eigenspace is zero.

**Named signature.** `TauCeti.Dwork.frobenius_fermat_eigenline`.

**Hypotheses and conventions.**

- v ∤ Nl
- geometric Frobenius on cohomology

**Proof outline.**

1. The Fermat fibre has good reduction at v and the eigenspace decomposition commutes with Frobenius (DM.2/fermat-fibre-splitting).
2. Weil's computation of the zeta function of the Fermat hypersurface by Jacobi sums, written as products of Gauss sums (Deligne, Hodge cycles, §7, Proposition 7.10), gives the eigenvalue on each character line; ψ-independence follows because ∑_j(a_j + i) ≡ 0 mod N.
3. The Lefschetz trace formula over 𝔽_{q^m} for the elements of H identifies the eigenvalues.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology`, `FiniteFieldsAndCharacterSums:FF.1/gauss-sum-product-and-multi-jacobi-sum`, `FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions`, `mathlib:gaussSum`, `mathlib:jacobiSum`.

**Checks.**

- N = 3, the line with character (1, 1, 1) of the Fermat cubic: Frobenius acts by q^{−1}g(v, 1)³, which is a Jacobi sum of a cubic character up to sign, of complex absolute value √q.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proof of Lemma 3.9, p. 1262. Frobenius acts on V_{λ,i} by q^{−1}∏_j g(v, a_j + i), with the Gauss sum defined through a fixed additive character, citing Deligne Proposition I.7.10.
- Pierre Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties (in: Hodge cycles, motives, and Shimura varieties)*, Chapter I, §7, Proposition 7.10, as cited by QIAN23. Frobenius eigenvalues on the character lines of the cohomology of Fermat hypersurfaces are products of Gauss sums.

### Gauss-sum formula for the determinant of the Dwork motive

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/dwork-determinant-gauss-formula` (theorem).** For v ∤ Nl of odd residue characteristic with q = #k(v): det(Frob_v | V_{λ,0}) = q^{−n}∏_{b∈B}∏_{j=1}^{N} g(v, a_j + b) = q^{n(N−n−2)/2}(∏_{b∈B} g(v, b))^n. Equivalently ∏_{b∈B}∏_j g(v, a_j + b) = (∏_{b∈B} g(v, b))^n q^{n(N−1)/2 − n(n−1)/2}. By DM.5/determinant-descends this computes the character det V[λ] of G_F at Frob_v.

**Named signature.** `TauCeti.Dwork.prod_qianGauss_indexSet`.

**Hypotheses and conventions.**

- residue characteristic of v odd and prime to Nl (so (q − 1)/N is even)

**Proof outline.**

1. For Qian's data the residues a_j + b (j = 1, …, N) run over b itself n + 1 times (from the n + 1 zeros) and over every s ≠ −b′, b′ ∈ B, at most once; regroup the double product as (∏g(v, b))^n · (∏_{s≠0}g(v, s))^n / ∏_{i≠j} g(v, b_j − b_i).
2. Use g(v, a)g(v, −a) = (−1)^{a(q−1)/N}q = q for a ≠ 0 (q − 1 even, N odd; Mathlib gaussSum_mul_gaussSum_eq_card) to evaluate ∏_{s≠0} g(v, s) = q^{(N−1)/2} and ∏_{i≠j} g(v, b_j − b_i) = q^{n(n−1)/2}.
3. Combine with the factor q^{−n} of DM.6/fermat-frobenius-gauss-sums.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/fermat-frobenius-gauss-sums`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`, `mathlib:gaussSum_mul_gaussSum_eq_card`.

**Checks.**

- Weight check: |g(v, b)| = √q, so |det| = q^{n(N−n−2)/2}·q^{n²/2} = q^{n(N−2)/2}, consistent with purity of weight N − 2 in rank n.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proof of Lemma 3.9, equation (3.1), pp. 1262–1263. Rewrites the determinant of Frobenius on V_{λ,0} as (∏g(v, b_j))^n(q^{(N−1)/2})^n/q^{n(n−1)/2} times q^{−n}, using g(v, a)g(v, −a) = q for odd residue characteristic.

### The Gauss-sum product descends to the cyclotomic coefficients

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/gauss-product-descent` (theorem).** For v ∤ Nl of residue characteristic p: ∏_{b∈B} g(v, b) ∈ ℚ_l(ζ_N). For the self-dual data with n = 2 (B = −B), g(v, b_1)g(v, b_2) ∈ ℚ_l(ζ_N)^+ = ℚ_l(ζ_N + ζ_N^{−1}).

**Named signature.** `TauCeti.Dwork.gaussProduct_mem_cyclotomic`.

**Hypotheses and conventions.**

- ∑_{b∈B} b ≡ 0 mod N
- for n = 2: B = −B

**Proof outline.**

1. An automorphism σ of ℚ̄_l fixing ℚ_l(ζ_N) acts on p-th roots of unity by ζ_p ↦ ζ_p^a, a ∈ 𝔽_p^×; substituting x ↦ a^{−1}x gives σ(g(v, b)) = t(a^{(q−1)/N})^b g(v, b), and the product over B picks up t(a^{(q−1)/N})^{∑b} = 1.
2. For n = 2 let σ fix ℚ_l(ζ_N)^+; it acts on μ_N by ζ ↦ ζ^{±1} and on μ_p by some a; then σ(g(v, b)) = t(a^{(q−1)/N})^{±b}g(v, ±b), and the product over B = −B with b_1 + b_2 ≡ 0 is invariant. No σ fixing ζ_p need exist (the printed proof assumes one; PAPER-QIAN-23/E33).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/fermat-frobenius-gauss-sums`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`, `ClassicalArithmeticCompletion:CA.7/continuation/gauss-galois-compatibility`.

**Checks.**

- n = 2, l = 3, N = 301, p = 5: no σ ∈ G_{ℚ_3(ζ_N)^+} inverts ζ_N and fixes ζ_5, yet the argument above applies.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Proof of Lemma 3.9, equations (3.2) and (3.3), pp. 1263–1264. Shows ∏g(v, b_j) ∈ ℚ_l(ζ_N) since ∑b_j ≡ 0, and for n = 2 that it lies in ℚ_l(ζ_N)^+ using B = −B.

### The determinant of the residual Dwork motive is an n-th power up to 𝔽_{l²}

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-nth-power` (theorem).** Let F ⊇ ℚ(ζ_N) and λ a prime above l of O (of O^+ when n = 2), k(λ) its residue field. The character det V[λ] of G_F (DM.5/determinant-descends) takes values in (𝔽_{l²}^× k(λ)^×)^n ⊂ 𝔽̄_l^×; it takes values in (k(λ)^×)^n when 𝔽_{l²} ⊆ k(λ).

**Named signature.** `TauCeti.Dwork.det_residual_mem_pow`.

**Hypotheses and conventions.**

- determinant read at t = 0
- the factor q^{n(N−n−2)/2} is an n-th power after a quadratic coefficient extension when n is even

**Proof outline.**

1. By Chebotarev it suffices to evaluate at Frobenius elements at v ∤ 2Nl; DM.6/dwork-determinant-gauss-formula gives q^{n(N−n−2)/2}(∏g(v, b))^n.
2. ∏g(v, b) is λ-integral in ℚ_l(ζ_N) (resp. ℚ_l(ζ_N)^+) by DM.6/gauss-product-descent, so its reduction lies in k(λ).
3. q^{n(N−n−2)/2} = (q^{(N−n−2)/2})^n when N − n is even, and otherwise (√q)^{n(N−n−2)} with √q in 𝔽_{l²}.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/dwork-determinant-gauss-formula`, `PotentialAutomorphyDworkMotivesPartII:DM.6/gauss-product-descent`, `PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Checks.**

- If l ≡ 1 mod N and n odd, the character takes values in (𝔽_l^×)^n.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.9 and its proof, pp. 1262–1264. The determinant of V[λ] as a G_F-representation lands in (𝔽_{l²}^× k(λ)^×)^n.

### Matching determinants at the coefficient prime l

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-l` (theorem).** Let n = l^a m with l ∤ m, F a CM field, M = F(ζ_N), r̄ : G_F → GL_n(𝔽_{l^s}) continuous, and λ | l a prime of O (of O^+ when n = 2) whose residue field k(λ) contains 𝔽_{l²} and all m-th roots of all elements of 𝔽_{l^s}. Then (i) det r̄ takes values in (k(λ)^×)^n; (ii) det V[λ] (a character of G_M) takes values in (k(λ)^×)^n; (iii) the character det V[λ] ⊗ (det r̄|_{G_M})^{−1} takes values in (k(λ)^×)^n; (iv) μ_m(𝔽̄_l) ⊂ k(λ), so m | #k(λ)^× and the n-th power map on k(λ)^× has kernel μ_m. Hence ArithmeticGaloisDuality R02.4 (roots after a totally real base change) applies to this character with exponent m (the paper requires n | #k(λ)^× instead, which fails when l | n; PAPER-QIAN-23/E5).

**Named signature.** `TauCeti.Dwork.det_matching_coefficient_prime`.

**Hypotheses and conventions.**

- k(λ) ⊇ 𝔽_{l²} and all m-th roots of elements of 𝔽_{l^s}

**Proof outline.**

1. For x ∈ 𝔽_{l^s}^× pick y ∈ k(λ) with y^m = x; the l^a-th power map is bijective on k(λ)^×, so y = z^{l^a} and x = z^n.
2. DM.6/determinant-nth-power with 𝔽_{l²} ⊆ k(λ) gives (ii); (iii) follows; (iv) applies the hypothesis to x = 1.
3. A character with values in (k^×)^n = (k^×)^m (k^× cyclic of order prime to l) has an n-th root in k^× iff it has an m-th root; under the Teichmüller embedding this is the statement of ArithmeticGaloisDuality:R02.4/character-roots-after-base-change.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-nth-power`, `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change`, `ArithmeticGaloisDuality:R02.4/character-root-obstruction`.

**Checks.**

- n = l = 3, s = 1: m = 1, so every character into (k(λ)^×)^3 = k(λ)^× already has a cube root, and the condition n | #k(λ)^× of the published text would wrongly fail.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §4, paragraph beginning 'On the side of characteristic l', p. 1270, with Lemma 3.9. Applies Lemma 3.9 over F(ζ_N) to see that det V[λ] ⊗ (det r̄)^∨ has image in (k(λ)^×)^n, under conditions on N giving 𝔽_{l²} and the m-th roots inside k(λ).
- Lie Qian, *Potential automorphy for GL_n*, Lemma 2.1, p. 1244. n-th roots of (𝔽_{l^r}^×)^n-valued characters after a totally real base change avoiding a given field; the atlas plans it in ArithmeticGaloisDuality R02.4.

### Matching determinants at the auxiliary prime l′ ≡ 1 mod N

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-auxiliary-prime` (theorem).** Let l′ be an odd prime with l′ ≡ 1 mod N and λ′ | l′ a prime of O (of O^+ when n = 2), so k(λ′) = 𝔽_{l′} and ℚ(ζ_N)_{λ′} = ℚ_{l′}. For v ∤ 2Nl′ with q = #k(v) and geometric Frobenius Frob_v: (i) det(Frob_v | V_{λ′,0})·q^{−n(n−1)/2} = (q^{(N−2n−1)/2}∏_{b∈B} g(v, b))^n, with q^{(N−2n−1)/2}∏g(v, b) ∈ ℤ_{l′}^×; equivalently det V_{λ′} ⊗ ε_{l′}^{n(n−1)/2} takes the value (q^{(N−2n−1)/2}∏g(v, b))^n at Frob_v. (ii) Hence for every continuous r̄′ : G_F → GL_n(𝔽_{l′}) with det r̄′ = ε̄_{l′}^{−n(n−1)/2}, the character (det r̄′|_{G_M})^{−1} ⊗ det V[λ′] takes values in (𝔽_{l′}^×)^n. (iii) If moreover l′ ≡ 1 mod n, then μ_n ⊂ 𝔽_{l′} and ArithmeticGaloisDuality R02.4 applies with exponent n. The printed argument uses the statement of Lemma 3.9 (values only in (𝔽_{l′²}^×)^n) and the sign det r̄′ = ε̄^{+n(n−1)/2}; the cancellation in (i), the sign and the congruence l′ ≡ 1 mod n are the corrections PAPER-QIAN-23/E6, E9, E7.

**Named signature.** `TauCeti.Dwork.det_matching_auxiliary_prime`.

**Hypotheses and conventions.**

- l′ ≡ 1 mod N (and mod n for (iii))
- ε_{l′}^{−1}(Frob_v) = q for geometric Frobenius

**Proof outline.**

1. (i) is a rearrangement of DM.6/dwork-determinant-gauss-formula: q^{n(N−n−2)/2}·q^{−n(n−1)/2} = (q^{(N−2n−1)/2})^n, with N odd making the exponent an integer; the base is an l′-adic unit because |g(v, b)|_{l′} = 1 for v ∤ l′.
2. ε_{l′}^{−n(n−1)/2}(Frob_v) = q^{n(n−1)/2}, so (det r̄′)^{−1} cancels the remaining power of q; the reduction of the base lies in 𝔽_{l′}.
3. μ_n ⊂ 𝔽_{l′} when l′ ≡ 1 mod n; such primes with l′ ≡ 1 mod Nn have positive density.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/dwork-determinant-gauss-formula`, `PotentialAutomorphyDworkMotivesPartII:DM.6/gauss-product-descent`, `PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends`, `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change`.

**Checks.**

- For r̄′ = Sym^{n−1} r̄_{E_0,l′} with r̄_{E_0,l′} = H¹_ét(E_0, 𝔽_{l′}) (determinant ε̄^{−1}) the hypothesis det r̄′ = ε̄^{−n(n−1)/2} holds.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §4, paragraph beginning 'On the other side of characteristic l′', p. 1270; Lemma 3.9 and (3.1), pp. 1262–1263. Applies Lemma 3.9 at λ′ to the character (det Sym^{n−1}r̄_{E,l′})^∨ ⊗ det V[λ′], with the corrections recorded as E6, E7 and E9.

### Frobenius polynomials of Dwork fibres are integral and independent of λ

**Target `PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent` (theorem).** Let F/ℚ(ζ_N) be a number field, v a finite place of F of residue characteristic l′ ∤ N, and t ∈ T_0(O_{F_v}). For every place λ of M of residue characteristic ≠ l′, W_{t,λ} (and V_{t,λ}) is unramified at v, and Q_v(X) = det(X − Frob_v | W_{t,λ}) has coefficients in O_M and is independent of λ.

**Named signature.** `TauCeti.Dwork.frobeniusPolynomial_independent`.

**Hypotheses and conventions.**

- t ∈ T_0(O_{F_v}), i.e. t integral with t^N − 1 a unit (good reduction)

**Proof outline.**

1. Y_t is smooth and proper over O_{F_v}; smooth proper base change makes H^{N−2}_ét(Y_{t,F̄_v}, O_{M_λ}) unramified and identifies it with the cohomology of the special fibre.
2. Katz–Messing (for every h ∈ H_0, the characteristic polynomial of h·Frob on cohomology has coefficients in a fixed number field, independent of λ) applied to the projector e_χ gives λ-independence for V_{t,λ}; twisting by Ψ_λ^{−1}, which is λ-independent (DM.3/twisting-hecke-character), gives it for W_{t,λ}.
3. Integrality of Q_v: W_{t,λ} is an O_{M_λ}-lattice for every λ ∤ l′, so Q_v has λ-integral coefficients for all such λ; at λ | l′ use the crystalline comparison of DM.7/crystalline-at-good-reduction, where the published deduction from the untwisted polynomial does not transfer through the Ψ-twist (PAPER-BOXER-CALEGARI-GEE-ETAL-25/E24).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- deg Q_v = n and the roots of Q_v have complex absolute value q_v^{(n−1)/2} (purity of weight n − 1).

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.2.5(1) and proof, published pp. 37–38 (arXiv v3 p. 42). W_{t,λ} is unramified at v and Q_v has coefficients in O_M independent of λ, by smooth proper base change and Katz–Messing Theorem 2(2).
- Nicholas M. Katz, William Messing, *Some consequences of the Riemann hypothesis for varieties over finite fields*, Theorem 2(2), as cited by BCGNT25. For a smooth projective variety over a finite field with a finite group action, characteristic polynomials of h·Frob on ℓ-adic cohomology have integral coefficients independent of ℓ.

<a id="layer-dm7"></a>

## Layer DM.7: p-adic Hodge theory and local monodromy of the fibres

The Galois representations on fibres over local fields: de Rham with n consecutive labelled Hodge–Tate weights, crystalline at good reduction, ordinary near the Fermat point when l ≡ 1 mod N, with level-two inertia when l ≡ −1 mod N, Steinberg-shaped at places away from the coefficient prime where t is near ∞, and crystalline ordinary at a generic integral point (Drinfeld–Kedlaya).

**Targets of the layer.**

**Objects.** The twisted de Rham eigenspaces V_{dR,σ} with their Hodge filtration (DM.7/twisted-de-rham-eigenspaces). **Theorems.** Hodge grades of the Fermat eigenlines and consecutive Hodge numbers (DM.7/hodge-grades-of-fermat-eigenlines, DM.7/consecutive-hodge-numbers; QIAN23 Lemma 3.10, BLGHT11 Lemma 5.2); fibres are de Rham with labelled Hodge–Tate weights M(a), …, M(a) + n − 1, and W_{t,λ} with weights {0, …, n − 1} (DM.7/dwork-hodge-tate-weights); crystallinity, Frobenius polynomial and ordinarity criterion at good reduction (DM.7/crystalline-at-good-reduction); ordinarity near the Fermat point for l ≡ 1 mod N (DM.7/ordinary-near-fermat-point); inertia on the Fermat fibre for l ≡ −1 mod N (DM.7/fermat-fibre-inertia-at-minus-one; BCGNT25 Lemma 4.4.4, BLGHT11 Lemma 5.3(5)); single-Jordan-block (Steinberg) monodromy at places away from the coefficient prime with v(t) < 0 (DM.7/steinberg-monodromy-away-from-coefficient-prime; QIAN23 Lemma 3.12 corrected, BLGHT11 Lemma 5.1); the weakly compatible systems of fibres (DM.7/dwork-compatible-system; BCGNT25 Proposition 4.2.5); Drinfeld–Kedlaya's slope theorem (DM.7/drinfeld-kedlaya-slope-bound) and generic crystalline ordinarity (DM.7/generic-crystalline-ordinarity; BCGNT25 Proposition 4.2.6).

### Twisted de Rham eigenspaces of the Dwork family

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces` (construction).** Let H_dR = H^{N−2}_dR(Y/(T_0 × ℚ(ζ_N))), locally free with Hodge filtration F^j by local direct summands. For σ ∈ Gal(ℚ(ζ_N)/ℚ) put H_{dR,σ} = H_dR ⊗_{σ^{−1}, ℚ(ζ_N)} ℚ(ζ_N) (the right factor viewed as coefficients) and V_{dR,σ} = e_χ H_{dR,σ}, the χ-eigensheaf for H_0 acting through the coefficients, with filtration F^jV_{dR,σ} and graded pieces gr^j. At t = 0, V_{dR,σ,0} = ⊕_{i} V_{dR,σ,i} under the characters χ_i of H. For a finite extension K/ℚ(ζ_N)_v, t ∈ T_0(K) and an embedding σ : K ↪ ℚ̄_l = \overline{ℚ(ζ_N)_λ}, the de Rham comparison gives an isomorphism of filtered vector spaces ((V_{λ,t} ⊗ ℚ(ζ_N)_λ) ⊗_{σ,K} B_dR)^{G_K} ≅ V_{dR,σ|ℚ(ζ_N), t} ⊗_{K,σ} ℚ(ζ_N)_λ: the twist by σ matches the embedding of the local field with the embedding of the coefficients.

**Named signature.** `TauCeti.Dwork.deRhamEigenspace`.

**Hypotheses and conventions.**

- characteristic 0 base T_0 × ℚ(ζ_N)
- λ and v of the same residue characteristic l

**Construction.**

1. Relative Hodge bundles of a smooth proper family in characteristic 0 are locally free, the Hodge spectral sequence degenerates and character idempotents cut out locally free summands with the induced filtration (ComplexComparisonPartII C5).
2. The filtered de Rham comparison for proper smooth varieties over p-adic fields (CohomologyComparisons CP.3) is H_0-equivariant; taking χ-parts introduces the twist by σ.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting`, `ComplexComparisonPartII:C5/relative-hodge-bundles`, `CohomologyComparisons:CP.3/filtered-de-rham-comparison`, `PadicHodgeTheory:R06.2/plan/period-functors`.

**API.**

- `Dwork.deRhamEigenspace` (constructor): V_{dR,σ} := e_χ(H^{N−2}_dR(Y/T_0 × ℚ(ζ_N)) ⊗_{σ^{−1}} ℚ(ζ_N)).
- `Dwork.deRhamEigenspace.filtration` (data): F^jV_{dR,σ}, locally direct summands with graded pieces gr^j.
- `Dwork.deRhamEigenspace.locallyFree` (instance): V_{dR,σ} and each gr^j are locally free on T_0 × ℚ(ζ_N).
- `Dwork.deRhamEigenspace.fibreZero` (simp): At t = 0, V_{dR,σ,0} = ⊕_i V_{dR,σ,i} under the H-characters χ_i.
- `Dwork.deRhamEigenspace.comparison` (compatibility): D_dR,σ(V_{λ,t}) ≅ V_{dR,σ,t} ⊗_{K,σ} ℚ(ζ_N)_λ as filtered spaces.
- `Dwork.deRhamEigenspace.baseChange` (functoriality): Compatible with base change T′ → T_0 and with extension of K.

**Unit tests.**

- `deRhamEigenspace_rank` (characterisation): V_{dR,σ} has rank n.
- `deRhamEigenspace_fibreZero_lines` (computation): For Qian's datum with n = 3, V_{dR,σ,0} has the three nonzero lines V_{dR,σ,1}, V_{dR,σ,2}, V_{dR,σ,N−3}.
- `deRhamEigenspace_identity_twist` (degenerate): For σ = id the twist is trivial and V_{dR,id} is the χ-part of H_dR itself.
- `deRhamEigenspace_twist_matters` (non-example): For σ ≠ id, V_{dR,σ} is the σ^{−1}χ-part rather than the χ-part of H_dR; the untwisted χ-part has different Hodge numbers in general, so comparing D_dR,σ with it gives wrong Hodge–Tate weights.

**Uses.**

- QIAN23 Lemmas 3.10–3.11 (DM.7/hodge-grades-of-fermat-eigenlines, DM.7/dwork-hodge-tate-weights): Hodge–Tate weights of the fibres
- BLGHT11 Lemmas 5.2–5.3 (DM.7/hodge-grades-of-fermat-eigenlines): the self-dual Hodge numbers
- QIAN21 §4 (DM.8/hyodo-kato-description-near-infinity): the filtration on D_st near infinity

**Checks.**

- For σ = id and t = 0, V_{dR,id,0} = ⊕_{i∈B} V_{dR,i} with one-dimensional summands.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §3, notation for relative de Rham cohomology preceding Lemma 3.9 (published Lemma 3.10), pp. 1264–1265. Defines H_dR, its σ-twists, the χ-eigenspaces V_{dR,σ} with filtration and graded pieces, the decomposition at t = 0 and the de Rham comparison with the twist.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §5, the spaces U_{DR,σ} and the comparison, pp. 34–35. The self-dual analogue, with coefficients embeddable in the field containing t but no canonical embedding.

### Hodge grades of the Fermat eigenlines

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/hodge-grades-of-fermat-eigenlines` (theorem).** Write σ^{−1}(ζ_N) = ζ_N^a and ⟨x⟩ for the representative of x mod N in {1, …, N}. Then V_{dR,σ,i} ≠ 0 iff i ∈ B, it is then one-dimensional, and its only nonzero graded piece is in degree M(a) + #{b ∈ B : ⟨ab⟩ < ⟨ai⟩}, where M(a) = (∑_j⟨a·a_j + 1⟩)/N − 1; equivalently the degree is (∑_j⟨a(a_j + i)⟩)/N − 1. For the self-dual data (BLGHT11 Lemma 5.2(1)) the degree is (N − n − 3)/2 + #{b ∈ B : ⟨ab⟩ ≤ ⟨ai⟩}.

**Named signature.** `TauCeti.Dwork.hodgeGrade_fermat_eigenline`.

**Hypotheses and conventions.**

- a ∈ (ℤ/Nℤ)^× determined by σ

**Proof outline.**

1. After base change along τ_0σ^{−1} to ℂ, gr^jV_{dR,σ,i} is the eigenspace of H^{j, N−2−j}(Y_0(ℂ)) for the character (a(a_j + i))_j of H.
2. DM.2/fermat-hypersurface-cohomology: nonzero iff all a(a_j + i) ≢ 0 (i.e. i ∈ B), in Hodge degree j with j + 1 = ∑⟨a(a_j + i)⟩/N.
3. Set j(d) = ∑⟨a·a_j + d⟩/N − 1; it increases by one when passing d ≡ ab, b ∈ B, and is constant otherwise; induct from M(a) = j(1).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum`.

**Checks.**

- For σ = id (a = 1) and Qian's datum with n = 3, the three lines i = 1, 2, N − 3 have consecutive grades M(1), M(1) + 1, M(1) + 2.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.10(1) and its proof, p. 1266 (arXiv v1 Lemma 3.9(1)). Computes the unique nonzero graded piece of each Fermat eigenline from Deligne's Propositions I.7.4 and I.7.6.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.2(1) and proof, pp. 35–36. The self-dual analogue.

### Consecutive Hodge numbers of the Dwork motives

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/consecutive-hodge-numbers` (theorem).** For each σ, gr^jV_{dR,σ} is locally free of rank one on T_0 × ℚ(ζ_N) for M(a) ≤ j ≤ M(a) + n − 1 and zero otherwise; V_{dR,σ} is locally free of rank n. For the self-dual data the range is (N − 1 − n)/2 ≤ j ≤ (N + n − 3)/2 (BLGHT11 Lemma 5.2(2)).

**Named signature.** `TauCeti.Dwork.deRhamEigenspace_gr_rank`.

**Hypotheses and conventions.**

- Hodge numbers are locally constant in a smooth proper family in characteristic 0

**Proof outline.**

1. gr^jV_{dR,σ} is locally free (DM.7/twisted-de-rham-eigenspaces), so its rank can be computed at t = 0.
2. At t = 0 the grades of the n eigenlines are M(a) + #{b : ⟨ab⟩ < ⟨ai⟩}, which run through M(a), …, M(a) + n − 1 as i runs through B ordered by ⟨ai⟩ (DM.7/hodge-grades-of-fermat-eigenlines).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/hodge-grades-of-fermat-eigenlines`, `PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces`, `ComplexComparisonPartII:C5/relative-hodge-bundles`.

**Checks.**

- Every gr^j has rank ≤ 1: the Dwork motives have regular (multiplicity-free) Hodge numbers.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.10(2) and the last paragraph of its proof, p. 1266. gr^jV_{dR,σ} is locally free of rank one exactly for M(a) ≤ j ≤ M(a) + n − 1.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.2(2), p. 35. The self-dual range.

### Dwork fibres are de Rham with consecutive labelled Hodge–Tate weights

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights` (theorem).** Let v | l be a place of F ⊇ ℚ(ζ_N) and t ∈ T_0(F_v). (1) V_{λ,t} ⊗ ℚ(ζ_N)_λ is a de Rham representation of G_{F_v} (not of G_F; PAPER-QIAN-23/E8), and for an embedding σ : F_v ↪ ℚ̄_l with σ^{−1}(ζ_N) = ζ_N^a on ℚ(ζ_N), its σ-labelled Hodge–Tate weights (cohomological convention) are M(a), M(a) + 1, …, M(a) + n − 1, each with multiplicity one. (2) W_{t,λ} is de Rham with HT_σ(W_{t,λ}) = {0, 1, …, n − 1} for every σ. (3) For the self-dual data V_{λ,t}((N − 1 − n)/2) is de Rham with Hodge–Tate numbers {0, …, n − 1} at every embedding (BLGHT11 Lemma 5.3(1)).

**Named signature.** `TauCeti.Dwork.hodgeTate_weights_fibre`.

**Planet.** Consecutive Hodge–Tate weights.

**Hypotheses and conventions.**

- l the residue characteristic of λ and v

**Proof outline.**

1. (1) is DM.7/twisted-de-rham-eigenspaces with DM.7/consecutive-hodge-numbers.
2. (2): W_{t,λ} = V_{t,λ} ⊗ Ψ_λ^{−1} has weights shifted by a constant M′_σ; det W_λ ≅ M_λ(n(1 − n)/2) (DM.3/twisted-dwork-local-system) gives nM′_σ + n(n − 1)/2 = n(n − 1)/2, so M′_σ = 0.
3. (3) as in (1) with the Tate twist.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces`, `PotentialAutomorphyDworkMotivesPartII:DM.7/consecutive-hodge-numbers`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`.

**Checks.**

- For n = 3 and every embedding, the weights of W_{t,λ} are {0, 1, 2}.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.11(1), pp. 1266–1267, with the comparison on p. 1265 (correction E8). V_{λ,t} is de Rham with σ-labelled Hodge–Tate weights M(a), …, M(a) + n − 1.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.2.5(2) and proof, published p. 38. W_{t,λ} is de Rham with HT_τ = {0, …, n − 1}, by Qian's lemma and the determinant.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.3(1), p. 36. Hodge–Tate numbers {0, …, n − 1} of V_{λ,t}((N − 1 − n)/2).

### Crystallinity and Frobenius at good-reduction fibres

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction` (theorem).** Let v | l, l ∤ N, and t ∈ O_{F_v} with t^N − 1 a unit. Then V_{λ,t} and W_{t,λ} are crystalline representations of G_{F_v}; the characteristic polynomial of Frob_v on WD(W_{t,λ}) equals Q_v(X) of the special fibre (the same polynomial as for λ′ ∤ l, DM.6/frobenius-polynomials-independent); and W_{t,λ} is ordinary iff the roots of Q_v in ℚ̄_l have l-adic valuations 0, f, 2f, …, (n − 1)f, f = [k(v) : 𝔽_l]. No crystallinity is claimed at the punctures or for t merely integral. For the self-dual data, V_{λ,t}((N − 1 − n)/2) is crystalline under the same condition (BLGHT11 Lemma 5.3(2)).

**Named signature.** `TauCeti.Dwork.crystalline_of_goodReduction`.

**Hypotheses and conventions.**

- t ∈ O_{F_v}, t^N − 1 ∈ O_{F_v}^×
- l ∤ N

**Proof outline.**

1. Y_t has good reduction over O_{F_v}; the crystalline comparison theorem gives crystallinity of H^{N−2}_ét and an H_0- and Frobenius-equivariant identification of D_cris with crystalline cohomology of the special fibre; Ψ_λ is crystalline at v.
2. The characteristic polynomial of φ^f on the twisted χ-part of crystalline cohomology equals Q_v by Katz–Messing (applicable to crystalline cohomology by Gillet–Messing).
3. Regular consecutive weights {0, …, n − 1} and the slope criterion for ordinarity (PadicHodgeTheory R06.2) give the last statement.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`, `PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`, `PadicHodgeTheory:R06.2/crystalline-ordinary-slope-criterion`, `PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight`.

**Checks.**

- If the special fibre point x has Q_x with l-adic slopes 0, 1, …, n − 1 (normalised), W_{t,λ} is crystalline ordinary.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.11(2) and its proof, pp. 1266–1267. For t ∈ O_{F_v} with t^N − 1 ∉ 𝔪, V_{λ,t} is crystalline because Y_t has good reduction.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.2.5(2) and proof, published pp. 38–39. Crystallinity, the Frobenius characteristic polynomial Q_v via Katz–Messing and Gillet–Messing, and the slope criterion for ordinarity (Geraghty Lemma 2.32).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.3(2), p. 36. Crystallinity of the self-dual fibres at good reduction.

### Ordinarity of fibres near the Fermat point when l ≡ 1 mod N

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/ordinary-near-fermat-point` (theorem).** Let l ≡ 1 mod N (so ℚ(ζ_N)_λ = ℚ_l), v | l and t ∈ 𝔪_{F_v}. Then V_{λ,t} is ordinary of weight μ with μ_{σ,i} = M(a_σ) for all i (in the convention of PotentialAutomorphyInfrastructurePartII PL.0, cohomological weights M(a_σ), …, M(a_σ) + n − 1), where σ^{−1}(ζ_N) = ζ_N^{a_σ}. For the self-dual data, V_{λ,t}((N − 1 − n)/2) is ordinary of weight 0, and its reduction at t = 0 is 𝔽_l ⊕ 𝔽_l(−1) ⊕ ⋯ ⊕ 𝔽_l(1 − n) as a module for inertia (BLGHT11 Lemma 5.3(3)–(4)).

**Named signature.** `TauCeti.Dwork.ordinary_near_fermat`.

**Hypotheses and conventions.**

- l ≡ 1 mod N
- t ∈ 𝔪_{F_v}

**Proof outline.**

1. For t ∈ 𝔪_{F_v}, Y_t and Y_0 have the same special fibre, so D_cris(V_{λ,t}) ≅ D_cris(V_{λ,0}) as φ-modules (crystalline comparison); their labelled Hodge–Tate weights agree (DM.7/dwork-hodge-tate-weights).
2. By the slope criterion (PadicHodgeTheory R06.2, the crystalline form of BLGHT Lemma 2.2), V_{λ,t} is ordinary iff V_{λ,0} is.
3. V_{λ,0} ⊗ ℚ̄_l = ⊕_{i∈B} V_{λ,i}, each a crystalline character of G_{ℚ_l(ζ_N)_v} = G_{ℚ_l} with Hodge–Tate weight M(a_σ) + #{b : ⟨a_σb⟩ < ⟨a_σi⟩}, so as an inertia module it is ⊕_{i=0}^{n−1} ℚ̄_l(−M(a_σ) − i): an ordinary filtration.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction`, `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`, `PotentialAutomorphyDworkMotivesPartII:DM.7/hodge-grades-of-fermat-eigenlines`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting`, `PadicHodgeTheory:R06.2/crystalline-ordinary-slope-criterion`, `PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`.

**Checks.**

- For the self-dual data and l ≡ 1 mod N the inertia action on the Fermat fibre mod λ is 𝔽_l ⊕ 𝔽_l(−1) ⊕ ⋯ ⊕ 𝔽_l(1 − n) (after the Tate twist).

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.11(3) and its proof, pp. 1266–1267 (using Lemma 2.4). For l ≡ 1 mod N and t ∈ 𝔪_{F_v}, V_{λ,t} is ordinary of weight (M(a_σ)), by comparison with the Fermat fibre.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.3(3)–(4) and proof, pp. 36–38. The self-dual analogue, ordinary of weight 0, and the inertia action on the Fermat fibre mod λ.

### Inertia on the Fermat fibre when l ≡ −1 mod N

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/fermat-fibre-inertia-at-minus-one` (theorem).** Let l > n be prime with l ≡ −1 mod N, v a place of ℚ(ζ_N) and λ a place of M above l, τ, cτ : k(v) → k(λ) = 𝔽_{l²} the two isomorphisms, and ω_τ = τ ∘ Art^{−1} the fundamental character of level two on inertia. Then W̄_{0,λ} ≅ ⊕_{i=1}^n ω_τ^{i−1}ω_{cτ}^{n−i} as representations of I_{ℚ(ζ_N)_v}. For the self-dual data, V[λ]((N − 1 − n)/2)_0 ⊗ 𝔽̄_l is the analogous sum of n distinct level-two characters (BLGHT11 Lemma 5.3(5)).

**Named signature.** `TauCeti.Dwork.fermat_inertia_level_two`.

**Hypotheses and conventions.**

- l ≡ −1 mod N, l > n
- ω_τ is defined only on inertia

**Proof outline.**

1. H extends the H_0-action on the Fermat fibre and decomposes W̄_{0,λ} into n lines W̄_{0,λ,j}, the Ψ^{−1}-twists of the H-eigenspaces in H^{N−2} (printed H^{N−1}, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E9), each crystalline of rank one.
2. The skew-Hermitian pairing (DM.5/hermitian-poincare-pairing) is orthogonal for this decomposition, so W̄_{0,λ,j}^c ≅ W̄_{0,λ,j}^∨ε̄^{1−n}.
3. Ordering so that HT_τ(W_{0,λ,j}) = j − 1, Fontaine–Laffaille (l > n) gives W̄_{0,λ,j} ≅ ω_τ^{j−1}ω_{cτ}^{a_j}, and the duality forces a_j = n − j.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting`, `PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing`, `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`, `PadicHodgeTheory:R06.2/plan/period-functors`.

**Checks.**

- n = 2: W̄_{0,λ}|_I ≅ ω_{cτ} ⊕ ω_τ, the restriction to inertia of the induction of a level-two fundamental character.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Lemma 4.4.4 and proof, published pp. 42–43 (arXiv v3 p. 48). Identifies the inertial action on W̄_{0,λ} with ⊕ω_τ^{i−1}ω_{cτ}^{n−i} using the H-eigenspace decomposition of the Fermat fibre and the pairing.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.3(5) and proof, pp. 36–38. The self-dual analogue for l ≡ −1 mod N.

### Maximal unipotent local monodromy at places with v(t) < 0

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime` (theorem).** Let v be a finite place of F ⊇ ℚ(ζ_N) and λ′ a prime of residue characteristic l′ ≠ char(v), l′ odd and prime to N. (1) If t ∈ O_{F_v} and t^N − 1 is a unit, V_{λ′,t} is unramified at v. (2) If v(t) < 0, V_{λ′,t}|_{G_{F_v}} is tamely ramified, inertia acts unipotently through exp(t_{l′}(σ)N) and the monodromy operator N of its Weil–Deligne representation has minimal polynomial X^n (a single Jordan block); for the self-dual data a Frobenius lift has characteristic polynomial (X − α)(X − αq)⋯(X − αq^{n−1}) with α = ±1 (after the twist (N − 1 − n)/2), i.e. WD is an unramified twist of Steinberg (BLGHT11 Lemma 5.1). The hypothesis v(t) < 0 is necessary (PAPER-QIAN-23/E1).

**Named signature.** `TauCeti.Dwork.monodromy_singleJordanBlock_of_val_neg`.

**Planet.** Steinberg monodromy near infinity.

**Hypotheses and conventions.**

- l′ ≠ residue characteristic of v
- v(t) < 0 in (2)

**Proof outline.**

1. (1) is smooth proper base change.
2. (2): near t = ∞ the family over the punctured disc {v(t) < 0} has geometric monodromy generated by the local monodromy at ∞, which is a single unipotent Jordan block over ℚ̄_{l′} (DM.4/maximal-unipotent-monodromy-at-infinity, applied to every conjugate character).
3. The Galois action of G_{F_v} on the fibre at t factors through the local fundamental group of the punctured disc at ∞ (tame specialisation of nearby cycles); inertia maps to the d-th power of the local monodromy generator, d = −v(t) > 0, still a single unipotent block in characteristic 0 (the argument of HSBT10 Lemma 1.15(2)).
4. For the Frobenius eigenvalues, the weight filtration of a single Jordan block and purity of the special value at ∞ give the Steinberg shape (BLGHT11).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.4/maximal-unipotent-monodromy-at-infinity`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.1/maximal-unipotence`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-quasi-unipotence`, `SchemeAndStackFoundations:SF.2`.

**Checks.**

- For the self-dual data with n = 2 and v(t) < 0, V_{λ′,t} is an unramified twist of the Steinberg representation at v, as for an elliptic curve with multiplicative reduction.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Lemma 3.12 and its proof, pp. 1267–1268, with correction E1. The monodromy operator of WD(V_{λ′,t}|G_{F_v}) has minimal polynomial X^n, following Harris–Shepherd-Barron–Taylor Lemma 1.15(2); the hypothesis v(t) < 0 must be added.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 5.1, pp. 33–34. Unramified for integral t with t^N − 1 a unit; tamely ramified with a single unipotent Jordan block and Steinberg-shaped Frobenius for t ∉ O_F.

### The Dwork fibres form weakly compatible systems

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-compatible-system` (theorem).** Let F/ℚ(ζ_N) be a number field, t ∈ T_0(F) and S the finite places v with v | N or t ∉ T_0(O_{F_v}). Then (M, S, {Q_v(X)}_{v∉S}, {W^{ss}_{t,λ}}_λ, {{0, 1, …, n − 1}}_τ) is a weakly compatible system of l-adic representations of G_F over M of rank n, pure of weight n − 1 (BLGGT14 §5.1); the same holds for {V_{t,λ}} with Hodge–Tate multisets {M(a_τ), …, M(a_τ) + n − 1} and for the self-dual data over M^+ (with symplectic pairings).

**Named signature.** `TauCeti.Dwork.compatibleSystem`.

**Planet.** Dwork compatible systems.

**Hypotheses and conventions.**

- t ∈ T_0(F)

**Proof outline.**

1. Away from S and the residue characteristic of λ, W_{t,λ} is unramified with Frobenius polynomial Q_v independent of λ (DM.6/frobenius-polynomials-independent).
2. At v | l with v ∉ S, W_{t,λ} is crystalline with Hodge–Tate weights {0, …, n − 1} and the same Frobenius polynomial (DM.7/crystalline-at-good-reduction, DM.7/dwork-hodge-tate-weights); at every v | l it is de Rham.
3. Purity of weight n − 1 is Deligne's theorem for the smooth fibres twisted by Ψ of weight N − n − 1.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent`, `PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction`, `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`, `PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Checks.**

- deg Q_v = n, Q_v(0) = ± q_v^{n(n−1)/2}, as the determinant ε^{−n(n−1)/2} requires.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.2.5(3), published p. 38. The family (M, S, {Q_v}, {W^{ss}_{t,λ}}, {{0, …, n − 1}}) is a weakly compatible system of rank n, pure of weight n − 1, in the sense of BLGGT14 §5.1.
- Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, *Potential automorphy and change of weight*, §5.1 (arXiv v4). Definition of weakly compatible systems of l-adic representations.

### Generic slopes of indecomposable lisse sheaves (Drinfeld–Kedlaya)

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/drinfeld-kedlaya-slope-bound` (theorem).** Let X be a smooth irreducible variety over a finite field of characteristic p and E a lisse ℚ̄_{l′}-sheaf of rank n on X (l′ ≠ p) which is algebraic (Frobenius characteristic polynomials with algebraic coefficients). Fix a p-adic valuation on ℚ̄ and for x ∈ |X| let a^x_1 ≥ ⋯ ≥ a^x_n be the p-adic slopes of Frob_x normalised by deg x. (i) There are rational numbers a^η_1 ≥ ⋯ ≥ a^η_n such that the set U of x with a^x_i = a^η_i for all i is nonempty and meets every curve in an open set; (ii) ∑_{i≤r} a^x_i ≤ ∑_{i≤r} a^η_i for all x, r; (iii) if E is indecomposable then a^η_i − a^η_{i+1} ≤ 1 for 1 ≤ i < n.

**Named signature.** `TauCeti.lisse_generic_slope_gap_le_one`.

**Hypotheses and conventions.**

- E algebraic; (iii) requires E indecomposable (e.g. geometrically irreducible)

**Proof outline.**

1. Drinfeld–Kedlaya prove the corresponding statement for indecomposable convergent or overconvergent F-isocrystals (their Theorem 1.1.5) and transport it to lisse sheaves using Abe's crystalline companions (their §5).
2. (ii) is Grothendieck's specialisation theorem for Newton polygons.

**Inputs.** `PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/convergent-f-isocrystal`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`.

**Checks.**

- For E pure of weight n − 1 with slopes 0, 1, …, n − 1 at one point, (ii) and (iii) force the generic slopes to be 0, 1, …, n − 1.

**Sources.**

- Vladimir Drinfeld, Kiran S. Kedlaya, *Slopes of indecomposable F-isocrystals*, Theorem 1.3.3, pp. 4–5 (arXiv v11); proof in §5, pp. 11–12. For an algebraic lisse sheaf on a smooth variety over a finite field, generic slopes exist and are attained on a dense set, special slopes lie above generic ones, and for indecomposable sheaves consecutive generic slopes differ by at most one.
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Proposition 4.2.6, published p. 39. Applies DK17 Theorem 1.3.3 to the lisse sheaf W_μ with λ-adic slopes.

### Generic crystalline ordinarity of the Dwork family

**Target `PotentialAutomorphyDworkMotivesPartII:DM.7/generic-crystalline-ordinarity` (theorem).** Let v be a place of ℚ(ζ_N) of residue characteristic l ∤ N and λ a place of M of the same characteristic. There is a nonempty Zariski open U(v; λ) ⊂ T_{0,k(v)} such that for every finite extension F_w/ℚ(ζ_N)_v and every t ∈ T_0(O_{F_w}) whose reduction lies in U(v; λ)(k(w)), W_{t,λ} is a crystalline ordinary representation of G_{F_w}.

**Named signature.** `TauCeti.Dwork.generic_crystalline_ordinary`.

**Planet.** Generic crystalline ordinarity.

**Hypotheses and conventions.**

- l ∤ N
- Qian's datum, n > 2 (BCGNT25 setting)

**Proof outline.**

1. By DM.7/crystalline-at-good-reduction it suffices that the normalised l-adic slopes s_1 ≥ ⋯ ≥ s_n of Q_x (computed with an auxiliary μ of residue characteristic ≠ l) be n − 1, …, 1, 0 for x ∈ U.
2. W_μ is geometrically irreducible (DM.3/twisted-dwork-local-system); Drinfeld–Kedlaya (DM.7/drinfeld-kedlaya-slope-bound) give a dense open V with constant slopes and gaps ≤ 1; with ∑s_i = n(n − 1)/2 (determinant) it suffices to find U ⊂ V with s_n(x) = 0.
3. By (4.2.3) and the trace formula of E_μ (DM.3/hypergeometric-sheaf-properties), s_n(x) = 0 when tr(Frob_x | E_{μ,x}) ≢ 0 mod λ. Writing ρ_i through z ↦ z^{c_i}, the trace is congruent to N_{k/k(v)}(u(x)) for the polynomial u(T) = ∑_r(−1)^{nr}∏_i C(c_i, r)T^r (Lucas's theorem; one exponent in the printed proof is misprinted, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E8); take U = T_{1,k(v)}[1/u] pulled back, nonempty since u(0) = 1.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction`, `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`, `PotentialAutomorphyDworkMotivesPartII:DM.7/drinfeld-kedlaya-slope-bound`, `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties`, `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison`, `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`.

**Checks.**

- The open set is independent of the extension k/k(v): u has coefficients in k(v).

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proposition 4.2.6 and proof, published pp. 38–40 (arXiv v3 pp. 43–45). Proves generic crystalline ordinarity by Drinfeld–Kedlaya, the determinant and a computation of the hypergeometric trace modulo λ following DK17 §A.3.
- Vladimir Drinfeld, Kiran S. Kedlaya, *Slopes of indecomposable F-isocrystals*, Appendix A, §A.3 (Proposition A.3.1, Corollary A.3.2) (arXiv v11). The key computation of the slopes of the hypergeometric sheaves E_c.

<a id="layer-dm8"></a>

## Layer DM.8: Semistable models and ordinarity near infinity

Near t = ∞ the fibres acquire semistable reduction after a ramified extension; the Hyodo–Kato cohomology of the semistable model computes D_st, and maximal unipotence of the complex monodromy makes the coefficient-prime representation ordinary. This layer is used by ModularityAndLanglandsExtensions ML.2 for the Galois ordinarity of the automorphic Dwork realisation.

**Targets of the layer.**

**Objects.** The H_0-equivariant semistable blowup of the reciprocal Dwork family (DM.8/dwork-semistable-blowup; QIAN21 Lemma 2.1). **Theorems.** Equivariant semistable models of fibres near ∞ after a totally ramified extension (DM.8/equivariant-semistable-model; QIAN21 Theorem 1.4/2.3); the log special fibre lifts over W[T] (DM.8/log-special-fibre-witt-lift; QIAN21 Remark 2.4); Hyodo–Kato description of D_st (DM.8/hyodo-kato-description-near-infinity); regular ordinarity near infinity for Qian's and the self-dual data, with stability under subquotients and semisimplification (DM.8/ordinary-near-infinity; QIAN23 Remark 3.13); the conditional theorem for general characters (DM.8/conditional-regular-ordinarity; QIAN21 Theorem 1.1 with corrected hypotheses).

### The equivariant semistable blowup of the reciprocal Dwork family

**Target `PotentialAutomorphyDworkMotivesPartII:DM.8/dwork-semistable-blowup` (construction).** Let k be a perfect field of characteristic p ∤ N, W = W(k), and Spec W[T, U^{±1}]′ the open where (TU)^N ≠ 1. Let Y_N ⊂ ℙ^{N−1} × Spec W[T, U^{±1}]′ be UT(X_1^N + ⋯ + X_N^N) = N X_1⋯X_N (the Dwork family in the reciprocal parameter s = 1/t = UT), with D_i = {X_i = 0} and D = {∑X_i^N = 0}. Blow up D ∩ D_N, then successively the intersections of the strict transforms of D and D_j for j = N − 1, …, 1. The result 𝕏 satisfies: (a) every centre is H_0-stable, so H_0 acts on 𝕏 and the blowdown 𝕏 → Y_N is H_0-equivariant; (b) the blowdown is an isomorphism over T ≠ 0; (c) étale locally 𝕏 is étale over W[T, U^{±1}]′[Z_1, …, Z_r, Z_{r+1}^{±1}, …, Z_m^{±1}]/(TU − Z_1⋯Z_r), H_0-equivariantly with H_0 acting on the Z_i by characters. Base change along T ↦ π, U ↦ u (u ∈ O_F^×) gives a semistable model with H_0-action of uπ(∑X_i^N) = N∏X_i over O_F; base change to ℂ along U ↦ 1 gives a blowup of T(∑X_i^N) = N∏X_i over 𝔸¹ − μ_N, an isomorphism away from T = 0, whose fibre over 0 is a reduced normal crossings divisor without self-crossings.

**Named signature.** `TauCeti.Dwork.semistableBlowup`.

**Hypotheses and conventions.**

- p ∤ N
- semistable: reduced normal crossings special fibre without self-intersections

**Construction.**

1. The successive blowup centres are intersections of H_0-stable divisors, hence H_0-stable; blowups commute with flat base change.
2. Compute charts after each blowup by hand (QIAN21 pp. 5–8): the local equation becomes TU = Z_1⋯Z_r times a unit.
3. Remark 2.2 of QIAN21 records the H_0-equivariant charts.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil`, `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups`, `SchemeAndStackFoundations:SF.4/strictly-semistable`, `SchemeAndStackFoundations:SF.4/strict-transform`.

**API.**

- `Dwork.reciprocalFamily` (constructor): Y_N ⊂ ℙ^{N−1}_{W[T,U^{±1}]′} given by UT∑X_i^N = N∏X_i.
- `Dwork.semistableBlowup` (constructor): 𝕏 → Y_N, the iterated H_0-equivariant blowup.
- `Dwork.semistableBlowup.iso_away` (characterisation): 𝕏 → Y_N is an isomorphism over T ≠ 0.
- `Dwork.semistableBlowup.charts` (characterisation): Étale locally 𝕏 is étale over W[T, U^{±1}]′[Z, Z′^{±1}]/(TU − Z_1⋯Z_r).
- `Dwork.semistableBlowup.equivariant` (functoriality): H_0 acts on 𝕏 compatibly with the blowdown and acts on the chart coordinates by characters.
- `Dwork.semistableBlowup.baseChange` (functoriality): Base change along T ↦ π, U ↦ u gives a strictly semistable O_F-model of the fibre at s = uπ.

**Unit tests.**

- `semistableBlowup_iso_generic` (characterisation): Over T = 1/2 (any T ≠ 0 with (TU)^N ≠ 1) the blowup is an isomorphism onto the smooth Dwork fibre.
- `semistableBlowup_special_fibre_reduced` (computation): Over T = 0 the special fibre of 𝕏 is reduced: the chart equation TU = Z_1⋯Z_r has reduced fibre Z_1⋯Z_r = 0.
- `reciprocalFamily_degenerate_fibre` (degenerate): Before blowing up, the fibre of Y_N at T = 0 is the union of the coordinate hyperplanes X_1⋯X_N = 0.
- `not_semistable_before_blowup` (non-example): Y_N itself is not semistable over T = 0 for N ≥ 3: the total space is singular along D ∩ D_i ∩ {T = 0}, so the blowups are needed.

**Uses.**

- QIAN23 Lemma 3.3(2) (DM.4/unipotent-monodromy-at-infinity): unipotence of the N-th power of the monodromy at ∞
- QIAN21 Theorem 1.4 (DM.8/equivariant-semistable-model): the input to the toroidal subdivision
- QIAN21 §4 (DM.8/ordinary-near-infinity): the log special fibre used for D_st

**Checks.**

- For N = 3 the fibre of Y_N over T = 0 is the triangle X_1X_2X_3 = 0 (three lines), already a reduced normal crossings divisor; the blowups resolve the singular points of the total space where D meets the coordinate lines.

**Sources.**

- Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Lemma 2.1, Remark 2.2 and the paragraph after it, pp. 4–8 (arXiv v1). Constructs the H_0-equivariant blowup of UT(∑X_i^N) = N∏X_i with semistable étale-local charts.
- Lie Qian, *Potential automorphy for GL_n*, Proof of Lemma 3.3(2), p. 1257. Uses the base change of this blowup to ℂ, whose fibre over 0 is a reduced normal crossings divisor.

### Equivariant semistable models of Dwork fibres near infinity

**Target `PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model` (theorem).** Let F/ℚ_p be finite containing ζ_N, p ∤ N, π a uniformiser, and t ∈ F with v(t) = d > 0 (the fibre at s = t, i.e. Dwork parameter t^{−1}). Then there are e ≥ 1 and a strictly semistable model 𝒴 over O_{F′}, F′ = F(π^{1/e}) totally ramified of degree e, of the hypersurface t(∑X_i^N) = N∏X_i, with an H_0-action compatible with that on the generic fibre; 𝒴 is projective. More precisely there is an H_0-equivariant projective blowup Z of US^{de}(∑X_i^N) = N∏X_i over W[S, U^{±1}]′, an isomorphism outside S = 0, étale locally étale over W[U^{±1}, S, Z_1, …, Z_m]/(US − Z_1⋯Z_r) with some Z_i inverted, and 𝒴 is its base change along S ↦ π^{1/e}, U ↦ u. Only semistability over F′ (not over F) is asserted.

**Named signature.** `TauCeti.Dwork.exists_equivariant_semistable_model`.

**Hypotheses and conventions.**

- p ∤ N
- v(t) > 0 (reciprocal parameter), i.e. the Dwork parameter has negative valuation

**Proof outline.**

1. Base change the model of DM.8/dwork-semistable-blowup along T ↦ S^{de}; it becomes toroidal (log smooth) but not semistable.
2. Subdivide the slice S = 1 of its conical complex into unimodular lattice simplices (equivariant toroidal semistable reduction, Kempf–Knudsen–Mumford–Saint-Donat, owned by SchemeAndStackFoundations SF.4); the corresponding blowup is H_0-equivariant and semistable after the ramified base change of degree e.
3. A blowup of a projective scheme is projective.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.8/dwork-semistable-blowup`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.4/strictly-semistable`, `SchemeAndStackFoundations:SF.4/semistable-alteration-theorem`.

**Checks.**

- d = 1 needs no subdivision: the model of DM.8/dwork-semistable-blowup is already semistable over O_F (e = 1).

**Sources.**

- Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Theorem 1.4 and Proposition 1.5, p. 3; restated as Theorem 2.3, p. 9; proof pp. 8–13 (arXiv v1). For v(t) = d > 0 there is a totally ramified F′ = F(π^{1/e}) and an H_0-equivariant semistable model of the fibre over O_{F′}, obtained by a toroidal subdivision.

### The log special fibre of the semistable model lifts over W[T]

**Target `PotentialAutomorphyDworkMotivesPartII:DM.8/log-special-fibre-witt-lift` (theorem).** In the setting of DM.8/equivariant-semistable-model, give Z the log structure M of the divisor (S) and 𝒴 that of (π^{1/e}). Choose u′ ∈ W^× with the same reduction as u and let (Y, N) be the base change of (Z, M) along S ↦ T, U ↦ u′ over Spec W[T]′ ((T^{de}u′)^N ≠ 1). Then (a) the log special fibre (𝒴̄, 𝒩̄) over (k, ℕ, 1 ↦ 0) is isomorphic, H_0-equivariantly, to the fibre of (Y, N) at T = 0; (b) Y is a projective H_0-equivariant blowup of u′T^{de}(∑X_i^N) = N∏X_i over W[T]′; (c) (Y, N) is log smooth over (W[T]′, ℕ, 1 ↦ T).

**Named signature.** `TauCeti.Dwork.logSpecialFibre_iso_lift`.

**Hypotheses and conventions.**

- as in DM.8/equivariant-semistable-model

**Proof outline.**

1. Both log special fibres are base changes of (Z, M) along S ↦ 0, U ↦ ū.
2. The charts of Z with U ↦ u′ give Kato charts of the form u′T = Z_1⋯Z_r, hence log smoothness (ComplexComparisonPartII C5 / CrystallineCohomology CR.5 log smoothness).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model`, `ComplexComparisonPartII:C5/log-smoothness`, `ComplexComparisonPartII:C5/divisorial-log-structure`, `CrystallineCohomology:CR.5:log-algebra/log-structure`.

**Checks.**

- For d = 1, e = 1 the lift is the reciprocal family itself near T = 0 with its semistable blowup.

**Sources.**

- Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Remark 2.4, p. 13 (arXiv v1). Identifies the log special fibre of the semistable model with the special fibre of a log smooth family over W[T] with log structure 1 ↦ T.

### Hyodo–Kato description of D_st of Dwork fibres near infinity

**Target `PotentialAutomorphyDworkMotivesPartII:DM.8/hyodo-kato-description-near-infinity` (theorem).** Let F/ℚ_p be finite containing ζ_N, p odd, p ∤ N, F^0 = W(k)[1/p], λ | p a prime of O, E = \overline{ℚ(ζ_N)_λ}, t ∈ F with v(t) = d > 0, and e, F′, 𝒴 as in DM.8/equivariant-semistable-model. Then V_{λ,t^{−1}}|_{G_{F′}} is semistable and for every embedding σ : F^0 ↪ E, D_st,σ(V_{λ,t^{−1}}) = ((V_{λ,t^{−1}} ⊗ E) ⊗_{σ,F^0} B_st)^{G_{F′}} ≅ (H^{N−2}_{HK}(𝒴̄, 𝒩̄))^{H_0 = σ^{−1}∘χ} ⊗_{F^0,σ} E, compatibly with φ, N and (after the B_st → B_dR comparison) the filtration. Hence V_{λ,t^{−1}} is potentially semistable, semistable over F′ (PAPER-QIAN-23/E35: not over F in general).

**Named signature.** `TauCeti.Dwork.Dst_iso_hyodoKato`.

**Hypotheses and conventions.**

- p odd, p ∤ N
- v(t) > 0 (Dwork parameter t^{−1} near ∞)

**Proof outline.**

1. The C_st comparison for proper semistable models (CohomologyComparisons CP.4, with the actual Hyodo–Kato complex of CrystallineCohomology CR.6) is H_0-equivariant; take σ^{−1}∘χ-eigenparts.
2. The Hyodo–Kato cohomology of (𝒴̄, 𝒩̄) is that of the fibre at T = 0 of the log smooth lift (DM.8/log-special-fibre-witt-lift), which computes N as the residue of the Gauss–Manin connection.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model`, `PotentialAutomorphyDworkMotivesPartII:DM.8/log-special-fibre-witt-lift`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison`, `CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter`, `CrystallineCohomology:CR.6/hk-comparison`, `CrystallineCohomology:CR.6/hk-monodromy`.

**Checks.**

- For the self-dual data with n = 2, N on D_st is nonzero, matching a multiplicative (Tate-curve-like) degeneration.

**Sources.**

- Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, §4, definition of D_st,σ (foot of p. 20) and the first display on p. 21 (arXiv v1). Applies Tsuji's comparison to the semistable model to identify D_st,σ of the Dwork eigenpart with the σ^{−1}χ-part of Hyodo–Kato cohomology of the log special fibre.

### Regular ordinarity of Dwork fibres near infinity

**Target `PotentialAutomorphyDworkMotivesPartII:DM.8/ordinary-near-infinity` (theorem).** Let λ be a prime of O (of O^+ when n = 2) of odd residue characteristic l ∤ N, F_v/ℚ_l finite containing ζ_N, Qian's datum (or the self-dual datum), and t ∈ F_v with v(t) < 0. Then: (1) there is a finite totally ramified F′_v/F_v with V_{λ,t}|_{G_{F′_v}} semistable, and for every σ the monodromy operator N on D_st,σ is maximally nilpotent (N^{n−1} ≠ 0); (2) V_{λ,t} is ordinary of regular weight μ with μ_{σ,i} = M(a_σ) for all i (PotentialAutomorphyInfrastructurePartII PL.0); (3) ordinarity with the induced weights passes to G_{F_v}-stable subquotients, and hence for a G_F-stable filtration of a global V_{λ,t} (t ∈ F) each graded piece, and the semisimplification, is ordinary at v with Hodge–Tate weights the corresponding subset of {M(a_σ), …, M(a_σ) + n − 1}. Part (2) needs the consecutive labelled weights (the companion's Lemma 4.2 omits this hypothesis of BLGHT11 Lemma 2.2(2); PAPER-QIAN-23/E11).

**Named signature.** `TauCeti.Dwork.ordinary_of_val_neg`.

**Planet.** Ordinarity near infinity.

**Hypotheses and conventions.**

- v(t) < 0
- l odd, l ∤ N

**Proof outline.**

1. (1): DM.8/hyodo-kato-description-near-infinity gives semistability over F′_v and identifies N with the Hyodo–Kato monodromy of the σ^{−1}χ-part; maximal nilpotence follows from maximal unipotence of the complex monodromy at ∞ for the conjugate character σ^{−1}χ (DM.4/maximal-unipotent-monodromy-at-infinity) through the comparison of the Hyodo–Kato monodromy with the residue of the Gauss–Manin connection.
2. (2): a semistable representation whose N is maximally nilpotent at every embedding and whose labelled Hodge–Tate weights are n consecutive integers (DM.7/dwork-hodge-tate-weights) is ordinary: weak admissibility forces the Frobenius slopes along the N-chain to be the Hodge numbers (BLGHT11 Lemma 2.2(2), in its potentially semistable form).
3. (3): restricting the invariant full flag to a subrepresentation (or pushing it to a quotient) gives a full flag with a subset of the graded characters, whose weights remain strictly ordered; potential semistability passes to subquotients.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.8/hyodo-kato-description-near-infinity`, `PotentialAutomorphyDworkMotivesPartII:DM.4/maximal-unipotent-monodromy-at-infinity`, `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`, `PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight`, `PadicHodgeTheory:R06.2/crystalline-ordinary-slope-criterion`, `CrystallineCohomology:CR.6/hk-monodromy`.

**Checks.**

- For the self-dual datum with n = 2 and v(t) < 0, V_{λ,t}((N − 3)/2) is an extension of ε^{−1}·(unramified) by an unramified character after a finite extension, like a Tate curve.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, Remark 3.13, p. 1268, with Lemma 3.11(1), pp. 1266–1267. Records that for v(t) < 0, V_{λ,t} is (potentially) semistable with maximally nilpotent monodromy and ordinary of weight (M(a_σ)), as a consequence of the companion's proof; not needed for Theorems 1.1 and 1.4.
- Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Theorem 1.1, p. 2, proved in §4, pp. 19–23 (arXiv v1). Under maximal unipotent monodromy at ∞ for every σχ, the fibres near ∞ are ordinary of some regular weight; the printed proof uses Lemma 4.2 without the Hodge–Tate hypothesis (E11).
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Lemma 2.2(2), as recalled in QIAN23 Lemma 2.4. A crystalline (or semistable) representation with consecutive Hodge–Tate weights and suitable Frobenius slopes is ordinary.

### Regular ordinarity of Dwork motives near infinity for a general character

**Target `PotentialAutomorphyDworkMotivesPartII:DM.8/conditional-regular-ordinarity` (theorem).** Let F/ℚ_p be finite containing ζ_N, p odd, p ∤ N, and χ(ξ) = ∏ξ_i^{a_i} an arbitrary character of H_0 (∑a_i ≡ 0) with V_λ = e_χR^{N−2}π_*O_λ of rank n. Assume (a) for every σ ∈ Gal(ℚ(ζ_N)/ℚ) the monodromy of the σχ-eigen-local-system at t = ∞ has minimal polynomial (X − 1)^n, and (b) for every embedding the labelled Hodge–Tate weights of V_{λ,t^{−1}} are n consecutive integers. Then for every finite F_0/F and t ∈ F_0 with v(t) > 0, V_{λ,t^{−1}} is ordinary of some regular weight. Hypothesis (a) for all σ follows from the case σ = 1 by coefficient conjugation. The companion's sufficient condition 'a zero exponent gives (a)' is false (PAPER-QIAN-23/E50), and hypothesis (b) is not established for general χ there (E11).

**Named signature.** `TauCeti.Dwork.ordinary_of_maximalUnipotent`.

**Hypotheses and conventions.**

- (a) maximal unipotent monodromy at ∞ for every Galois conjugate σχ
- (b) consecutive labelled Hodge–Tate weights

**Proof outline.**

1. As in DM.8/ordinary-near-infinity, using DM.8/hyodo-kato-description-near-infinity for χ and hypotheses (a), (b) in place of the computations for Qian's datum.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.8/hyodo-kato-description-near-infinity`, `PotentialAutomorphyDworkMotivesPartII:DM.8/ordinary-near-infinity`.

**Checks.**

- For Qian's datum, (a) is DM.4/maximal-unipotent-monodromy-at-infinity and (b) is DM.7/dwork-hodge-tate-weights, recovering DM.8/ordinary-near-infinity.

**Sources.**

- Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, Theorem 1.1 and Remark 1.2, p. 2; §4, pp. 19–23 (arXiv v1). The conditional main theorem of the companion, with the hypothesis of maximal unipotent monodromy for every σχ; Remark 1.2's zero-exponent criterion is false (E50).

<a id="layer-dm9"></a>

## Layer DM.9: Switching theorems

The switching theorems: given residual representations at two primes with matching determinants, a fibre with both residual representations over a controlled extension, with local conditions; in the self-dual setting of BLGGT14; and the auxiliary systems of BCGNT25 in the unitary case.

**Targets of the layer.**

**Objects.** Qian's switching data: the CM field E, the determinant twists, the module W and the torsor T_W (DM.9/switching-determinant-data); the Weil-restricted torsor with local valuation conditions (DM.9/weil-restricted-local-conditions); the CM-induced seed R_CM (DM.9/cm-induced-seed). **Theorems.** Qian's switching theorem: a CM extension F′ disjoint from given fields and t ∈ T_0(F′) with prescribed residual representations at l and l′, v(t) < 0 above l and v(t) > 0 above l′ (DM.9/qian-switching-theorem); the self-dual switch used by BLGGT14 Theorem 3.1.2 and its Steinberg variants (DM.9/self-dual-switching); Kisin's local constancy and Berger's reduction theorem (DM.9/kisin-local-constancy, DM.9/berger-reduction-small-weight); local Dwork points with prescribed reductions (DM.9/bcgnt-local-dwork-points), the choice of switching primes (DM.9/bcgnt-switching-primes), and the auxiliary systems R_aux and S_UA of BCGNT25 Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems), with the rank-two case through twisted modular curves (DM.9/rank-two-auxiliary-system). No automorphy statement is proved here: the potential automorphy theorems that use these points are ModularityAndLanglandsExtensions ML.2 and PotentialAutomorphyInfrastructurePartII PL.5.

### Determinant twists, the module W and the torsor T_W for Qian's switch

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data` (construction).** Hypotheses: l odd, n = l^a m (l ∤ m), s ≥ 1, N odd prime to ln with N > 100n + 100, r the order of l mod N with N ∤ l^{r/2} + 1 if r is even; F a CM field, M = F(ζ_N); r̄ : G_F → GL_n(𝔽_{l^s}) continuous; λ | l a prime of O (of O^+ when n = 2) with k(λ) ⊇ 𝔽_{l²} and all m-th roots of elements of 𝔽_{l^s}; l′ > 2ln + 5 prime, unramified in F^avoid, l′ ≡ 1 mod N and l′ ≡ 1 mod n (PAPER-QIAN-23/E7, E36); λ′ | l′, k(λ′) = 𝔽_{l′}; r̄′ : G_F → GL_n(𝔽_{l′}) with det r̄′ = ε̄_{l′}^{−n(n−1)/2} (E9); finite Galois F^avoid ⊇ F, F_2^avoid, and totally real Galois F^suff over ℚ, all unramified above N, with F_2^avoid ∩ F^avoid = ℚ and F^suff ∩ F^avoid F_2^avoid = ℚ; F_0 = F^avoid F_2^avoid F^suff(ζ_N). Construction: apply ArithmeticGaloisDuality R02.4 (roots after totally real base change) to det V[λ] ⊗ (det r̄|_{G_M})^{−1} (exponent m, DM.6/determinant-matching-at-l) avoiding F_0, getting L_1; then over L_1M to (det r̄′)^{−1} ⊗ det V[λ′] (exponent n, DM.6/determinant-matching-at-auxiliary-prime) avoiding F_0L_1, getting L_2 (two applications with the enlarged avoidance field, E37). Put L = L_1L_2, E = LM. This gives (a) a totally real Galois L/ℚ linearly disjoint from F_0 and the CM field E, Galois over F; (b) characters χ̄_1 : G_E → k(λ)^×, χ̄_2 : G_E → 𝔽_{l′}^× with χ̄_1^n = det V[λ] ⊗ (det r̄)^{−1} and χ̄_2^n = det V[λ′] ⊗ (det r̄′)^{−1}; (c) W = (χ̄_1 ⊗ r̄) × (χ̄_2 ⊗ r̄′) over O/λλ′ ≅ k(λ) × 𝔽_{l′} with det W ≅ det V[λλ′], hence φ : ∧^nW ≅ ∧^nV[λλ′] and the torsor T_W = T({W}) over (T_0)_E (DM.5/level-structure-torsor); (d) T_W is smooth and geometrically irreducible (DM.5/level-structure-torsor-irreducible: l ≠ l′, max(l, l′) > 10, r′ = 1); (e) E ∩ F^avoid F_2^avoid F^suff = F.

**Named signature.** `TauCeti.Dwork.SwitchingData`.

**Hypotheses and conventions.**

- all hypotheses listed in the statement

**Construction.**

1. The two root extractions are DM.6/determinant-matching-at-l and DM.6/determinant-matching-at-auxiliary-prime combined with the AGD R02.4 root theorem; the second application must avoid F_0L_1 so that L = L_1L_2 stays disjoint from F_0 (E37).
2. Then det(χ̄_1 ⊗ r̄) = det V[λ] and det(χ̄_2 ⊗ r̄′) = det V[λ′], which gives φ by DM.5/determinant-descends.
3. (e): L and F_0 are linearly disjoint and M ⊂ F_0, so E ∩ F_0 = M; F^avoid F_2^avoid F^suff is unramified above N, hence meets ℚ(ζ_N) in ℚ, so M ∩ F^avoid F_2^avoid F^suff = F (tower disjointness, PotentialModularityAndCompatibleSystems R23.1).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-l`, `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-auxiliary-prime`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends`, `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change`, `PotentialModularityAndCompatibleSystems:R23.1/tower-linear-disjointness`.

**API.**

- `Dwork.SwitchingData` (structure): The primes l, l′, λ, λ′, the modulus N, the representations r̄, r̄′ and the avoidance fields with their hypotheses.
- `Dwork.SwitchingData.field` (data): The totally real L and the CM field E = L·F(ζ_N).
- `Dwork.SwitchingData.twists` (data): χ̄_1, χ̄_2 with χ̄_1^n = det V[λ] ⊗ det r̄^{−1}, χ̄_2^n = det V[λ′] ⊗ det r̄′^{−1} on G_E.
- `Dwork.SwitchingData.module` (constructor): W = (χ̄_1 ⊗ r̄) × (χ̄_2 ⊗ r̄′) with φ : ∧^nW ≅ ∧^nV[λλ′].
- `Dwork.SwitchingData.torsor` (projection): T_W over (T_0)_E, smooth and geometrically irreducible.
- `Dwork.SwitchingData.disjoint` (other): E ∩ F^avoid F_2^avoid F^suff = F.

**Unit tests.**

- `switchingData_trivial_twist` (degenerate): If det r̄ = det V[λ] and det r̄′ = det V[λ′] on G_F, then L = ℚ, E = F(ζ_N) and χ̄_i = 1 satisfy the construction.
- `switchingData_det_W` (characterisation): det W ≅ det V[λλ′] as characters of G_E.
- `switchingData_l_prime_split` (computation): Since l′ ≡ 1 mod N, k(λ′) = 𝔽_{l′} and O/λλ′ ≅ k(λ) × 𝔽_{l′}.
- `switchingData_needs_l_prime_mod_n` (non-example): With l′ ≢ 1 mod n (e.g. n = 3, l′ ≡ 2 mod 3), 𝔽_{l′} lacks the cube roots of unity and an (𝔽_{l′}^×)³-valued character can fail to have a cube root valued in 𝔽_{l′}^× after any base change; the congruence l′ ≡ 1 mod n is required.

**Uses.**

- QIAN23 §4 (DM.9/qian-switching-theorem): Moret-Bailly is applied to the Weil restriction of T_W
- ModularityAndLanglandsExtensions:ML.2/qian-residual-potential-automorphy: the switching point feeds Qian's Theorems 1.1 and 1.4

**Checks.**

- When r̄ already has determinant det V[λ]|_{G_F} and r̄′ has determinant det V[λ′], one may take L = ℚ and χ̄_1 = χ̄_2 = 1.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §4, application of Lemma 2.1 and construction of W and φ, pp. 1270–1271. Constructs E = LM, the characters χ_1, χ_2, the module W and the isomorphism φ, and observes T_W is geometrically connected by Proposition 3.8, with the corrections E5–E7, E9, E36, E37.

### Weil restriction of the torsor and the local valuation conditions

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/weil-restricted-local-conditions` (construction).** With the switching data of DM.9/switching-determinant-data, let T = Res_{EF^suff/ℚ}(T_W ×_E EF^suff), a smooth geometrically irreducible ℚ-variety (Weil restriction along a finite separable extension preserves both properties), with the morphism p : T → Res_{EF^suff/ℚ} T_0 induced by T_W → (T_0)_E. Put Ω_∞ = T(ℝ) (nonempty since EF^suff is CM: T(ℝ) = ∏_{complex places} T_W(ℂ)), Ω_{l,0} = {(t_τ) : v_l(t_τ) < 0 for all τ : EF^suff → ℚ̄_l}, Ω_{l′,0} = {(t_τ) : v_{l′}(t_τ) > 0 for all τ}, and Ω_l = p^{−1}(Ω_{l,0}), Ω_{l′} = p^{−1}(Ω_{l′,0}). These are nonempty open subsets, invariant under Gal(ℚ̄_l/ℚ_l) (resp. Gal(ℚ̄_{l′}/ℚ_{l′})).

**Named signature.** `TauCeti.Dwork.weilRestrictedTorsor`.

**Hypotheses and conventions.**

- EF^suff a CM field
- T_W smooth geometrically irreducible

**Construction.**

1. Weil restriction of a quasi-projective smooth variety along a finite separable extension is a smooth quasi-projective variety, and becomes a product of conjugates over ℚ̄, hence geometrically irreducible (AlgebraicModuliForArithmeticGeometry R09.3; AbelianSchemesAndArithmeticModuli A6).
2. t with v(t) < 0 (resp. > 0) avoids μ_N and ∞, so Ω_{l,0}, Ω_{l′,0} are nonempty open Galois-stable; p is finite étale and surjective on ℚ̄_l-points, so the preimages are nonempty open.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data`, `AlgebraicModuliForArithmeticGeometry:R09.3/r093-weil-restriction`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`.

**API.**

- `Dwork.weilRestrictedTorsor` (constructor): T = Res_{EF^suff/ℚ}(T_W ×_E EF^suff).
- `Dwork.weilRestrictedTorsor.geometricallyIrreducible` (other): T is smooth and geometrically irreducible over ℚ.
- `Dwork.localConditionAtL` (data): Ω_l = p^{−1}{v_l(t_τ) < 0 ∀τ}.
- `Dwork.localConditionAtLPrime` (data): Ω_{l′} = p^{−1}{v_{l′}(t_τ) > 0 ∀τ}.
- `Dwork.localConditions_nonempty` (characterisation): Ω_∞, Ω_l, Ω_{l′} are nonempty, open and Galois-invariant.

**Unit tests.**

- `localConditionAtL_example` (computation): t = 1/l lies in Ω_{l,0} for every embedding (v_l(1/l) = −1 < 0).
- `localConditionAtLPrime_example` (computation): t = l′ lies in Ω_{l′,0} (v_{l′}(l′) = 1 > 0) and avoids μ_N.
- `realPoints_nonempty` (degenerate): Ω_∞ = T(ℝ) is nonempty because EF^suff has no real places.
- `localCondition_not_integral` (non-example): t = 1 + l is integral with v_l(t) = 0, so it is not in Ω_{l,0}; integral points near the Fermat point give ordinary rather than Steinberg behaviour at l.

**Uses.**

- QIAN23 §4 (DM.9/qian-switching-theorem): the input of Moret-Bailly's theorem

**Checks.**

- If EF^suff has degree 2d over ℚ, then T(ℝ) is the product of d copies of T_W(ℂ), one for each complex place.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §4, application of Proposition 4.2, p. 1271. Applies Moret-Bailly to T = Res_{EF^suff/ℚ}T_W with Ω_∞ = T(ℝ) and the opens Ω_l, Ω_{l′} defined by v_l(t_τ) < 0, v_{l′}(t_τ) > 0.

### Qian's switching theorem for non-self-dual Dwork motives

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/qian-switching-theorem` (theorem).** Keep the switching data of DM.9/switching-determinant-data. There are a finite totally real Galois L′/ℚ, linearly disjoint from F_0L over ℚ, and, with F′ = L′EF^suff, a point t ∈ T_0(F′) with a G_{F′}-equivariant isomorphism W ≅ V[λλ′]_t inducing φ_t on ∧^n, such that: (i) F′ ⊇ EF^suff is CM, finite Galois over F, with (F′)^+ = L′E^+F^suff; (ii) χ̄_1^{−1}V[λ]_t ≅ r̄|_{G_{F′}} and χ̄_2^{−1}V[λ′]_t ≅ r̄′|_{G_{F′}}; (iii) v(t) < 0 for every place v | l of F′ and v(t) > 0 for every v | l′; (iv) F′ ∩ F_2^avoid = ℚ and F′ ∩ F^avoid F_2^avoid = F, so F′ is linearly disjoint over F from every subextension of F^avoid F_2^avoid (in Qian's §4 these include F^av and F̄^{ker r̄}); (v) K = L′LF^suff(ζ_N) is finite Galois over ℚ with FK = F′ and K ∩ F^avoid = ℚ (the field that must be disjoint from F^avoid in the proof of Theorem 1.4; PAPER-QIAN-23/E3). Consequently V_{λ,t} has the prescribed residual representation at l, V_{λ′,t} at l′, V_{λ′,t} is ordinary at the places above l′ (DM.7/ordinary-near-fermat-point), and V_{λ′,t} has maximal unipotent (Steinberg-type) monodromy at the places above l (DM.7/steinberg-monodromy-away-from-coefficient-prime). No automorphy statement is made here.

**Named signature.** `TauCeti.Dwork.qian_switching`.

**Planet.** Qian's Dwork switching theorem.

**Hypotheses and conventions.**

- the hypotheses of DM.9/switching-determinant-data

**Proof outline.**

1. Apply Moret-Bailly with three kinds of local conditions (PotentialModularityAndCompatibleSystems R23.1) over ℚ to T = Res_{EF^suff/ℚ}T_W with S_1 = {∞}, S_2 = ∅, S_3 = {l, l′}, the opens of DM.9/weil-restricted-local-conditions and H = F_0L; ℚ is totally real with its real place in S_1, so the extension L′ is totally real.
2. A point of T over L′ is a point of T_W over L′EF^suff = F′ (L′ and EF^suff linearly disjoint), i.e. t ∈ T_0(F′) with an isomorphism W ≅ V[λλ′]_t respecting φ: this gives (ii) after untwisting by χ̄_i, and (iii) from the local conditions.
3. (iv) and (v) are intersection computations with tower disjointness (R23.1), using that L′ is disjoint from F_0L, L from F_0, and F^avoid F_2^avoid F^suff from ℚ(ζ_N).
4. The local consequences at l′ and l are DM.7/ordinary-near-fermat-point (l′ ≡ 1 mod N, v(t) > 0 means t ∈ 𝔪) and DM.7/steinberg-monodromy-away-from-coefficient-prime (l′ ≠ l, v(t) < 0).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data`, `PotentialAutomorphyDworkMotivesPartII:DM.9/weil-restricted-local-conditions`, `PotentialAutomorphyDworkMotivesPartII:DM.7/ordinary-near-fermat-point`, `PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime`, `PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-three-local-conditions`, `PotentialModularityAndCompatibleSystems:R23.1/tower-linear-disjointness`.

**Checks.**

- For n = 2 the theorem reduces to the self-dual switch of BLGHT11 §6 with the real coefficient field, and its residual representations are symplectic.

**Sources.**

- Lie Qian, *Potential automorphy for GL_n*, §4, outcome of Proposition 4.2 and the intersection computations, p. 1272; proof of Theorem 1.4, p. 1274 (E3). Produces L′, F′ and t ∈ T_0(F′) with χ_1^{−1}V[λ]_t ≅ r̄|G_{F′}, χ_2^{−1}V[λ′]_t ≅ Sym^{n−1}r̄_{E,l′}|G_{F′}, v(t) < 0 above l and > 0 above l′, and the disjointness properties.

### Switching in the self-dual Dwork family

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/self-dual-switching` (theorem).** Let F/F_0 be a finite Galois extension of totally real fields, I a finite set, and for i ∈ I: n_i even, l_i odd primes, r̄_i : G_F → GSp_{n_i}(𝔽̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}; let l′ be a prime and r̄′_i : G_F → GSp_{n_i}(𝔽_{l′}) with multiplier ε̄_{l′}^{1−n_i}, and F^avoid/F finite Galois. Choose N odd, prime to 2∏l_i·l′, N > n_i + 1, divisible by no prime ramified in F^avoid, such that each r̄_i takes values in GSp_{n_i}(Z[ζ_N]^+/λ_i) for a prime λ_i | l_i of ℤ[ζ_N]^+ (DM.1/auxiliary-modulus, BLGHT11 Lemma 6.1), and λ′ | l′. Then the product over i of the symplectic level-structure torsors T_{r̄_i × r̄′_i} over T_0 × Spec F(ζ_N)^+ (isomorphisms compatible with the symplectic structures, BLGGT14's correction) is geometrically irreducible, and for any finite Galois L/F(ζ_N)^+ disjoint from it and any finite set Σ of places, Moret-Bailly gives a totally real F′/F_0 Galois, linearly disjoint from F^avoid over F, and t_i ∈ T_0(F′) with: V_{n_i}[λ_i]((N − 1 − n_i)/2)_{t_i} ≅ r̄_i|_{G_{F′}} and V_{n_i}[λ′]((N − 1 − n_i)/2)_{t_i} ≅ r̄′_i|_{G_{F′}} as symplectic representations; v(t_i) < 0 at every place above l_i (and, in the variant of Newton–Thorne and Fakhruddin–Khare–Patrikis, above Σ), v(t_i) > 0 at every place above l′. At such points: V_{λ′,t_i} is ordinary of weight 0 at the places above l′ (when l′ ≡ 1 mod N), has Hodge–Tate numbers {0, …, n_i − 1}, and at places above l_i (and Σ) the Weil–Deligne representation of V_{λ′,t_i} is an unramified twist of Steinberg.

**Named signature.** `TauCeti.Dwork.selfDual_switching`.

**Planet.** Self-dual Dwork switching.

**Hypotheses and conventions.**

- n_i even; multipliers ε̄^{1−n_i}
- N chosen as above; l′ ≡ 1 mod N for the ordinarity at l′

**Proof outline.**

1. Construct the self-dual real forms and their symplectic torsors (DM.2/self-dual-real-forms, DM.5/level-structure-torsor); geometric irreducibility of the product follows from the full symplectic monodromy at each prime and DM.5/two-prime-product-monodromy (BLGHT11 Proposition 4.2).
2. Apply Moret-Bailly over a preliminary extension (PotentialModularityAndCompatibleSystems R23.1, the corrected BLGHT11 Proposition 6.2 and BLGGT14 Proposition 3.1.1) with the local opens v(t) < 0 above l_i and Σ, v(t) > 0 above l′.
3. Local properties: DM.7/ordinary-near-fermat-point at l′, DM.7/dwork-hodge-tate-weights, DM.7/steinberg-monodromy-away-from-coefficient-prime at l_i and Σ.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.5/two-prime-product-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sp`, `PotentialAutomorphyDworkMotivesPartII:DM.7/ordinary-near-fermat-point`, `PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime`, `PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights`, `PotentialAutomorphyDworkMotivesPartII:DM.1/auxiliary-modulus`, `PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-over-a-preliminary-extension`.

**Checks.**

- n_i = 2: the residual representations are GL_2 = GSp_2-valued with determinant ε̄^{−1}, and the switch produces a fibre that is Steinberg above l_i, the shape used by BLGGT14 Theorem 3.1.2.

**Sources.**

- Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, *Potential automorphy and change of weight*, Proof of Theorem 3.1.2, pp. 42–44 (arXiv v4). Chooses N by BLGHT11 Lemma 6.1, constructs the sheaves V_{n_i,λ_i}((N − 1 − n_i)/2) and the covers T_{r̄_i × r̄′_i} of BLGHT11 §4 (with isomorphisms respecting the symplectic structures), and finds a point by Proposition 3.1.1 with v(t) < 0 above l_i and v(t) > 0 above l′.
- Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, §§4–6: Proposition 4.2, Lemmas 5.1, 5.3, 6.1 and Proposition 6.2, pp. 25–41. The self-dual Dwork family, its symplectic monodromy, local Galois properties of its fibres and the Moret-Bailly variant used to find points.
- Lie Qian, *Potential automorphy for GL_n*, §3, p. 1257 (n = 2). Uses the self-dual family for n = 2.

### Local constancy of Galois representations in the Dwork family (Kisin)

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/kisin-local-constancy` (theorem).** Let v | l be a place of a number field F ⊇ ℚ(ζ_N), λ | l a place of M, t ∈ T_0(O_{F_v}) and c > 0. There is an open ball U_t ∋ t in T_0(O_{F_v}) such that for all t′ ∈ U_t, W_{t,λ}/l^c ≅ W_{t′,λ}/l^c as representations of G_{F_v} (and likewise for finitely many λ simultaneously).

**Named signature.** `TauCeti.Dwork.localConstancy`.

**Hypotheses and conventions.**

- t integral with good reduction

**Proof outline.**

1. Kisin's local constancy theorem for p-adic families: for a smooth proper family over a p-adic disc, the Galois representations on the cohomology of nearby fibres are congruent modulo any fixed power of p on a small enough disc (a Krasner-type lemma for families).
2. Apply it to e_χ R^{N−2}π_* and twist by Ψ_λ^{−1}.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`.

**Checks.**

- If t ≡ t′ modulo a high power of the uniformiser, the reductions W̄_{t,λ} and W̄_{t′,λ} are isomorphic.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, published p. 59. Uses Kisin's local constancy theorem to find open balls on which W_{t,λ} mod p^c is constant.
- Mark Kisin, *Local constancy in p-adic families of Galois representations*, Theorem 5.1, as cited by BCGNT25. Local constancy in p-adic families of Galois representations.

### Reductions of two-dimensional crystalline representations of small weight (Berger)

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/berger-reduction-small-weight` (theorem).** Let p be an odd prime and r : G_{ℚ_p} → GL_2(ℚ̄_p) crystalline with Hodge–Tate weights {0, m}, 1 ≤ m ≤ p − 1. Then either r is ordinary, or r̄|_{G_{ℚ_{p²}}} is isomorphic to an unramified twist of ρ̄_{2,m,0} = ε̄_2^{m} ⊕ (ε̄′_2)^{m} (the restriction of the induction of the m-th power of a fundamental character of level two).

**Named signature.** `TauCeti.crystalline_rank_two_reduction`.

**Hypotheses and conventions.**

- 1 ≤ m ≤ p − 1

**Proof outline.**

1. Fontaine–Laffaille theory (or the explicit reduction of V_{k,a_p}) classifies the crystalline lattices in this range; v_p(a_p) = 0 gives the ordinary case, v_p(a_p) > 0 gives the irreducible induced reduction.

**Inputs.** `PadicHodgeTheory:R06.2/plan/period-functors`, `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`.

**Checks.**

- A supersingular elliptic curve at p (m = 1): r̄|_{I_p} ≅ ω_2 ⊕ ω_2^p, the non-ordinary branch.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, published p. 58. Splits the p-adic places into Σ^ord and Σ^ss using Berger's reduction theorem.
- Laurent Berger, *Représentations modulaires de GL2(Qp) et représentations galoisiennes de dimension 2*, Theorem 3.2.1, as cited by BCGNT25. Reduction of two-dimensional crystalline representations with Hodge–Tate weights {0, m}, m ≤ p − 1.

### Local Dwork points with prescribed reductions (Boxer–Calegari–Gee–Newton–Thorne)

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points` (theorem).** In the setting of the proof of BCGNT25 Theorem 6.2.4 (primes p ≡ −1 mod N, r ≡ 1 mod N, p_0, q, places 𝔭, 𝔯, 𝔮 of M above p, r, q, a CM field F_4 = K^+F_3 with K^+_v large and the residual representations r̄_𝔭, r̄_𝔯, r̄_{CM,𝔯}, ρ̄_{A,q} trivial on G_{F_{4,v}} for v | prp_0q), for k ∈ {m, nm} and each such v there is a nonempty open _kΩ_v ⊂ T_0(O_{F_{4,v}}) of points t with: (i) v ∈ Σ^ord: _kW̄_{t,𝔭} trivial, _kW_{t,𝔭} crystalline ordinary, _kW̄_{t,𝔯}, _kW̄_{t,𝔮} trivial; (ii) v ∈ Σ^ss: _kW_{t,𝔭} crystalline and connected to ρ_{k,1,0} (the Fontaine–Laffaille representation ⊕ε_2^{k−i}(ε′_2)^{i−1}), residuals trivial; (iii) v | r: _kW_{t,𝔯} crystalline ordinary, residuals trivial; (iv) v | p_0: all residuals trivial; (v) v | q: _kW_{t,𝔮} crystalline ordinary, residuals trivial. Here _kW denotes the twisted Dwork system of rank k.

**Named signature.** `TauCeti.Dwork.bcgnt_local_points`.

**Hypotheses and conventions.**

- p > nm with p ≡ −1 mod N; r, q ≡ 1 or split as specified; F_4 chosen so residual representations are trivial locally

**Proof outline.**

1. (i), (iii), (v): DM.7/generic-crystalline-ordinarity gives an ordinary crystalline point; Kisin's local constancy (DM.9/kisin-local-constancy) and the component lemmas for weight-zero crystalline lifts (LocalGaloisDeformationRings L7, BCGNT25 Lemmas 5.1.4–5.1.5) give an open ball of such points with trivial residual representations after enlarging F_4.
2. (ii): at t = 0, W_{0,𝔭} restricted to inertia is ⊕ω_τ^{i−1}ω_{cτ}^{k−i} (DM.7/fermat-fibre-inertia-at-minus-one), so its crystalline lifts connect to ρ_{k,1,0} (BCGNT25 Lemma 5.1.3, LocalGaloisDeformationRings L7); local constancy gives an open neighbourhood.
3. (iv): any point with trivial residual representations near t = 0 after enlarging F_4.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.7/generic-crystalline-ordinarity`, `PotentialAutomorphyDworkMotivesPartII:DM.9/kisin-local-constancy`, `PotentialAutomorphyDworkMotivesPartII:DM.7/fermat-fibre-inertia-at-minus-one`, `PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction`, `PotentialAutomorphyDworkMotivesPartII:DM.9/berger-reduction-small-weight`, `LocalGaloisDeformationRings:L7`.

**Checks.**

- For k = m = 2 the ordinary points of (i) correspond to ordinary crystalline rank-two representations with Hodge–Tate weights {0, 1}.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, local data (i)–(v), published p. 59 (arXiv v3 pp. 65–66). Constructs the opens _kΩ_v from Propositions 4.2.5–4.2.6, Kisin's local constancy and Lemmas 5.1.3–5.1.5.

### The CM-induced auxiliary system R_CM

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed` (construction).** In the proof of BCGNT25 Theorem 6.2.4: let F_1 be the Galois closure of FF_0, E/ℚ totally real cyclic of degree m disjoint from F_1 with p_0 unramified, L_1 = EF_1, q_1 an odd prime splitting completely in L_1 with v_1 | q_1 split as w_1⋯w_m in L_1. Choose an algebraic Hecke character Ψ_0 : 𝔸_{L_1}^× → M^× of the infinity type of Proposition 6.2.3(6a), unramified above the relevant set, with the restrictions Ψ_0|_{O^×_{L_{1,w_i}}} wildly ramified, pairwise distinct and of product 1; then (ArithmeticGaloisDuality R02.4, BCGNT25 Lemma 5.3.3) a CM F_2/F_1 and a finite-order twist Ψ_2 of Ψ_0 ∘ N_{L_2/L_1} with det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}. Then R_CM = {Ind_{G_{L_2}}^{G_{F_2}} Ψ_{2,λ}}_λ is a weakly compatible system of rank m, with Hodge–Tate weights {0, …, m − 1} and residual representations r̄_{CM,λ} absolutely irreducible on G_{F_2(ζ_N, ζ_r)} for the chosen r.

**Named signature.** `TauCeti.Dwork.CMSeed`.

**Hypotheses and conventions.**

- m ≥ 2
- the infinity type of BCGNT25 Proposition 6.2.3(6a)

**Construction.**

1. Existence of Ψ_0 with prescribed infinity type and local restrictions: algebraic Hecke characters with prescribed restrictions to finitely many local unit groups (HSBT10 Lemma 2.2 as restated in BLGGT14 Lemma A.2.4; PotentialAutomorphyInfrastructurePartII PL.0).
2. The determinant correction by a finite-order twist after a CM base change is a root extraction of a finite-order character (ArithmeticGaloisDuality R02.4).
3. Induction of a compatible system of characters is a compatible system (PotentialModularityAndCompatibleSystems R24.5); distinctness of the local restrictions at w_i gives irreducibility of the residual induction.

**Inputs.** `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters`, `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change`, `PotentialModularityAndCompatibleSystems:R24.5/character-system`, `PotentialModularityAndCompatibleSystems:R24.5/system-operations`, `PotentialModularityAndCompatibleSystems:R24.5/induced-character-purity`.

**API.**

- `Dwork.CMSeed` (structure): The data (E, L_1, q_1, Ψ_0, F_2, Ψ_2) of the construction.
- `Dwork.CMSeed.system` (constructor): R_CM = {Ind_{G_{L_2}}^{G_{F_2}}Ψ_{2,λ}}.
- `Dwork.CMSeed.det` (characterisation): det R_{CM,λ} = ε^{−m(m−1)/2}.
- `Dwork.CMSeed.hodgeTate` (characterisation): HT_τ(R_{CM,λ}) = {0, …, m − 1}.
- `Dwork.CMSeed.residual_irreducible` (other): r̄_{CM,𝔯}|_{G_{F_2(ζ_N, ζ_r)}} is absolutely irreducible for the chosen r.

**Unit tests.**

- `cmSeed_rank` (computation): R_CM has rank m = [L_2 : F_2].
- `cmSeed_m_one` (degenerate): For m = 1 the induction is the character itself.
- `cmSeed_det` (characterisation): det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}, matching det W_λ for rank m.
- `cmSeed_needs_distinct_local` (non-example): If the restrictions Ψ_0|O^×_{w_i} were equal, Ind Ψ_0 could become reducible after restriction to G_{F(ζ_N,ζ_r)}; distinctness is what forces irreducibility.

**Uses.**

- BCGNT25 proof of Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): its residual representation at 𝔯 is the level structure of R_aux
- ModularityAndLanglandsExtensions ML.2 (BCGNT25 Theorem 6.2.4): the p–r switch Sym^{n−1}R ⊗ R_aux ↔ Sym^{n−1}R ⊗ R_CM

**Checks.**

- m = 1: R_CM is the character system of Ψ_2 itself.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, construction of Ψ and R_CM, published pp. 57–58 (arXiv v3 pp. 64–65). Constructs Ψ_0 by HSBT10 Lemma 2.2, the CM extension F_2 and the twist Ψ_2 by Lemma 5.3.3, and R_CM = {Ind Ψ_{2,λ}}.

### Choice of primes and fields for the p–r switch

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes` (theorem).** Given R (the rank-two compatible system of BCGNT25 Theorem 6.2.4 over F_2, with its set of good primes L(R)) and R_CM, there are primes N, p, r, q and fields with: N > 100nm + 100 prime, unramified in L_2 and M; p ≡ −1 mod N, r ≡ 1 mod N; p, r > 2nm + 1, p, r ∈ L(R|_{G_{F_2}}) prime to v_0v_1; p split in L_2 and M, r split in L_2(ζ_p) and M; Ψ_2 unramified above p and r; r̄_𝔭, r̄_𝔯 with image between SL_2 and GL_2; r̄_{CM,𝔯}|_{G_{F_2(ζ_N, ζ_r)}} absolutely irreducible; the p-adic places split into Σ^ord ∪ Σ^ss by DM.9/berger-reduction-small-weight; a solvable CM F_3/F_2(ζ_N) disjoint from the field B cut out by r̄_𝔭 × r̄_𝔯 × r̄_{CM,𝔯}; and, after adjoining e^{2πi/N} to M, a semistable elliptic curve A/ℚ with good reduction at p, r, p_0 and a prime q ∉ {p, r, p_0}, q > 2nm + 1, split in M, with ρ̄_{A,q}(G_{F_3}) = GL_2(𝔽_q) and A good ordinary at q.

**Named signature.** `TauCeti.Dwork.bcgnt_switching_primes`.

**Hypotheses and conventions.**

- the hypotheses of BCGNT25 Theorem 6.2.4

**Proof outline.**

1. Primes p ≡ −1, r ≡ 1 mod N with the splitting conditions have positive density (Chebotarev); the excluded sets are finite or of density zero (big image for R at almost all primes).
2. Berger's theorem sorts the places above p.
3. A semistable non-CM elliptic curve over ℚ has surjective mod-q image for almost all q and is ordinary at a density-one set of primes (Serre); choose q accordingly, avoiding p, r, p_0 (as corrected in the extraction's review).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.9/berger-reduction-small-weight`, `PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

**Checks.**

- p = 2N − 1 and r = 2N + 1 satisfy the congruences when they are prime.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, choice of N, p, r, q and F_3, published p. 58 (arXiv v3 p. 65). Chooses the primes and fields with the listed properties.

### The auxiliary Dwork systems R_aux and S_UA (Boxer–Calegari–Gee–Newton–Thorne)

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-auxiliary-dwork-systems` (theorem).** Let m > 2 and keep the data of DM.9/bcgnt-switching-primes and DM.9/bcgnt-local-dwork-points. (1) Applying Moret-Bailly with surjective specialisation (PotentialModularityAndCompatibleSystems R23.1) to T(r̄_{CM,𝔯}|_{G_{F_4}}) (r ≡ 1 mod N, DM.5/level-structure-torsor), with f : π_1^ét(T) ↠ G the surjection onto the image G ⊆ GU_m(𝔽_{p²}) of the residual system W̄_𝔭 (G ⊇ SU_m(𝔽_{p²}), DM.5/residual-monodromy-su), F^avoid = B′F_4, S_0 = {p, r, p_0, q} and the opens _mΩ_v, gives a CM F_5 and t with R_aux = {W_{t,λ}}: r̄_{aux,𝔭}(G_{F_5}) = G with multiplier ε̄^{1−m}, r̄_{aux,𝔭}(G_{F_5(ζ_p)}) = SU_m(𝔽_{p²}), r̄_{aux,𝔯} ≅ r̄_{CM,𝔯}, and the local properties (i)–(v). (2) Applying it again to T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q}|_{G_{F_5}}) for the rank-nm Dwork system, with F^avoid enlarged by the field cut out by r̄_{aux,𝔭}, gives F_6 and S_UA with s̄_{UA,𝔭} ≅ s̄_{aux,𝔭}, s̄_{UA,𝔮} ≅ Sym^{nm−1}ρ̄_{A,q} and the local properties (Hermitian structures being unique over finite fields). The printed claims r̄_{aux,𝔭}(G_{F_5}) = GU_m(𝔽_{p²}) and F^avoid = B′F_5 are corrected as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E29 and E32.

**Named signature.** `TauCeti.Dwork.bcgnt_auxiliary_systems`.

**Planet.** Auxiliary Dwork systems R_aux, S_UA.

**Hypotheses and conventions.**

- m > 2 (for m = 2 see DM.9/rank-two-auxiliary-system)
- η compatible with the Hermitian pairings (E23)

**Proof outline.**

1. The torsors are smooth and geometrically irreducible (DM.5/level-structure-torsor-irreducible); the opens are nonempty (DM.9/bcgnt-local-dwork-points); the map f to the residual monodromy image is surjective on π_1^ét because the geometric monodromy is already SU_m.
2. Moret-Bailly with surjective specialisation yields F_5 and a point whose residual image is all of G, and its intersection with G_{F_5(ζ_p)} is SU_m (the multiplier ε̄^{1−m} cuts it out).
3. The second application uses DM.0/hermitian-forms-unique to match the Hermitian structure of s̄_{aux,𝔭} with that of the rank-nm Dwork system.

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-su`, `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points`, `PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed`, `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes`, `PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique`, `PotentialModularityAndCompatibleSystems:R23.1/surjective-specialisation-finite-quotient`.

**Checks.**

- det r_aux = ε^{−m(m−1)/2} is compatible with the image G but not with GU_m(𝔽_{p²}) in full, which is why the printed equality is corrected.

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, construction of R_aux and S_UA, published pp. 59–60 (arXiv v3 pp. 66–67). Applies Proposition 4.5.1 twice to the moduli spaces T(r̄_{CM,𝔯}) and T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q}) with the local opens, with the corrections E29 and E32.

### The auxiliary system R_aux in rank two via twisted modular curves

**Target `PotentialAutomorphyDworkMotivesPartII:DM.9/rank-two-auxiliary-system` (theorem).** Let m = 2 in the setting of DM.9/bcgnt-auxiliary-dwork-systems. There are a CM field F_5/F_4, disjoint from B′F_4, and an elliptic curve A_aux/F_5 such that R_aux = {H¹(A_aux)_λ} satisfies: ρ̄_{A_aux,r} ≅ r̄_{CM,𝔯}|_{G_{F_5}} (symplectically); ρ̄_{A_aux,p}(G_{F_5(ζ_p)}) = SL_2(𝔽_p) = SU_2(𝔽_{p²}) up to the identification of SU_2 with SL_2; at v ∈ Σ^ss, ρ_{A_aux,p}|G_{F_{5,v}} connects to ρ_{2,1,0} (A_aux supersingular), at Σ^ord ordinary, at v | r ordinary, and the residual representations are trivial locally as in (i)–(v). The source omits this case ('a straightforward variant, left to the reader').

**Named signature.** `TauCeti.Dwork.bcgnt_rank_two_auxiliary`.

**Hypotheses and conventions.**

- m = 2; r ≥ 3

**Proof outline.**

1. The twisted modular curve Y(r̄) parametrising elliptic curves A with a symplectic isomorphism A[r] ≅ r̄_{CM,𝔯} is a smooth geometrically connected fine moduli curve (Tau Ceti ModularCurves, layer 5C).
2. The local opens: at v ∈ Σ^ss, curves with supersingular good reduction whose p-torsion is the level-two induced representation (an open condition in the p-adic topology near a supersingular CM point); at Σ^ord and v | r, ordinary good reduction with trivial residual representations after the local enlargement; at p_0, q, trivial residuals.
3. Moret-Bailly with surjective specialisation (R23.1), with f the mod-p monodromy of the universal curve, whose geometric image is SL_2(𝔽_p).

**Inputs.** `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes`, `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points`, `PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `PotentialModularityAndCompatibleSystems:R23.1/surjective-specialisation-finite-quotient`.

**Checks.**

- For m = 2, SU_2(𝔽_{p²}) ≅ SL_2(𝔽_p), so the image requirement is the familiar surjectivity onto SL_2(𝔽_p).

**Sources.**

- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Proof of Theorem 6.2.4, published p. 59. For m = 2 the auxiliary system is built from a modular curve with level-r structure instead of the Dwork family, and the details are left to the reader.

## Supplier contracts

Each import below is a layer of another roadmap whose stated scope covers the need; the precise statement required is recorded.

- **AutomorphicGaloisRepresentationsPartII:AG2.0** — Henniart's theorem: a family of λ-adic characters of G_K, for all places λ of a number field M, with Frobenius values in M independent of λ at almost all places, is attached to an algebraic Hecke character of K of type A_0 with values in M. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character`.
- **EtaleDualityAndPerverseSheaves:EDC.1** — Compactly supported direct image Rf_!, external products and the Künneth formula for constructible ℓ-adic complexes, so that multiplicative convolution A ∗_! B = Rm_!(A ⊠ B) on 𝔾_m over ℤ[1/ℓ]-schemes is defined, associative and compatible with base change and with the trace formula. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-hypergeometric-sheaf`.
- **LocalGaloisDeformationRings:L7** — BCGNT25 Lemmas 5.1.3–5.1.5 for weight-0 crystalline lifts over unramified-at-p fields with p > nm: crystalline lifts of ρ̄_{n,m,0} connect to ρ_{n,m,0} after any finite extension; ordinary weight-0 crystalline lifts of the trivial representation connect; sufficiently p-adically close weight-0 crystalline lifts lie on the same component. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points`.
- **SchemeAndStackFoundations:SF.2** — Étale cohomology of schemes with ℤ/ℓ^k, ℤ_ℓ and ℚ_ℓ coefficients, ℓ invertible: (a) smooth and proper base change, so that R^iπ_* of a smooth proper morphism is lisse, commutes with base change and has stalks the cohomology of geometric fibres; (b) the Artin comparison between étale cohomology with finite coefficients of a complex variety and singular cohomology, in the relative form for R^iπ_* of a smooth proper morphism over a complex base; (c) the equivalence between lisse sheaves on a connected scheme and continuous representations of its étale fundamental group, with the homotopy exact sequence π_1^geom → π_1 → G_K; (d) the Grothendieck–Lefschetz trace formula over finite fields; (e) cup product, trace and Poincaré duality for smooth proper varieties, compatible with finite group actions. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil`, `PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves`, `PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology`, `PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free`, `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties`, `PotentialAutomorphyDworkMotivesPartII:DM.3/katz-hypergeometric-sheaf`, `PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor`, `PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible`, `PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent`, `PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime`.
- **SchemeAndStackFoundations:SF.4** — Equivariant toroidal semistable reduction (Kempf–Knudsen–Mumford–Saint-Donat): for a log smooth (toroidal) family over a complete discrete valuation ring with a finite group acting on the toroidal charts by characters, a subdivision of the conical complex into unimodular simplices gives, after a totally ramified base change of suitable degree e, an equivariant projective blowup that is strictly semistable. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model`.
- **tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group** — π_1 of ℙ¹(ℂ) − {0, 1, ∞} is free on two peripheral loops, with the product relation among the three peripheral classes in the layer's composition convention. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations`.
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev** — The Chebotarev density theorem: Frobenius elements are dense, and primes with prescribed Frobenius conjugacy class in a finite Galois extension have positive Dirichlet density. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-nth-power`, `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes`.
- **tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ** — The twisted modular curve Y(ρ) for a Galois representation ρ on (ℤ/r)² with cyclotomic determinant, r ≥ 3: a smooth geometrically connected fine moduli curve of elliptic curves with a symplectic isomorphism of their r-torsion with ρ, with its universal elliptic curve. Used by: `PotentialAutomorphyDworkMotivesPartII:DM.9/rank-two-auxiliary-system`.

## Open inputs

These steps rest on sources that were not available or on statements that need further proof; each names the targets that depend on it.

- **G1. Katz's theory of hypergeometric sheaves (ESDE Chapter 8) not read.** The properties of E_λ (lisse of rank n, geometric irreducibility, purity, determinant via Theorem 8.12.2(1a)) and its local monodromy at 0, 1, ∞ (Theorem 8.4.2, cited as 8.4.11 by BLGHT11) are taken in the form BCGNT25 and BLGHT11 apply them; Katz's book was not available. No atlas roadmap plans general hypergeometric sheaves (KloostermanMomentsAndPotentialAutomorphy KM.1 constructs Kloosterman sheaves directly). Closing this gap means planning the convolution theory of Katz's Chapter 8 for tame characters: rank, local monodromy and determinant of H_can(χ's; ρ's). Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties`, `PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy`, `PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity`.
- **G2. Zalesskii–Serezhkin and Artin's order theorem not read.** Both are used in the form stated by QIAN23 and BLGHT11. The exceptional cases of the Zalesskii–Serezhkin list (characteristic 2 and 3, small dimension) and the precise coincidences excluded by Artin's Theorem 2 must be checked against the originals; in the applications the monodromy contains an element of order N > 100n + 100 and both characteristics are odd with one > 10, which excludes every exception known to this design. Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification`, `PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism`.
- **G3. Kisin's local constancy and Berger's reduction theorem not read.** Both are cited in the form BCGNT25 applies them (Kis99 Theorem 5.1; Ber10 Théorème 3.2.1). Kisin's theorem needs its exact hypotheses on the family (smooth proper over a p-adic disc) checked; Berger's needs the range 1 ≤ m ≤ p − 1 and the twist conventions of ρ̄_{2,m,0} checked. Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.9/kisin-local-constancy`, `PotentialAutomorphyDworkMotivesPartII:DM.9/berger-reduction-small-weight`, `PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points`.
- **G4. The rank-two auxiliary system of BCGNT25 Theorem 6.2.4 is not written in the source.** For m = 2 the paper leaves the construction from a modular curve with level-r structure to the reader. The node gives the construction through twisted modular curves and Moret-Bailly with surjective specialisation; the existence of a nonempty open set of supersingular points at v ∈ Σ^ss whose p-adic representation connects to ρ_{2,1,0}, and the surjectivity of the mod-p geometric monodromy of the universal curve over the twisted modular curve, must be proved in detail. Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.9/rank-two-auxiliary-system`.
- **G5. Regular ordinarity near infinity for a general character.** The companion preprint QIAN21 proves its main theorem through its Lemma 4.2, which omits the consecutive Hodge–Tate hypothesis of BLGHT11 Lemma 2.2(2) (PAPER-QIAN-23/E11), and its Remark 1.2 criterion is false (E50). For Qian's datum and the self-dual data both hypotheses are proved here (DM.4, DM.7), so DM.8/ordinary-near-infinity is unaffected; for a general character the consecutive-weight hypothesis remains a hypothesis. A possible route (maximal unipotence forcing consecutive Hodge numbers through the limiting mixed Hodge structure) is not in any source read. Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.8/conditional-regular-ordinarity`.
- **G6. Katz–Messing for twisted Frobenius and Deligne's Fermat propositions read only through citations.** PadicDifferentialEquationsAndRigidCohomology RD.7 plans the crystalline–ℓ-adic comparison of Frobenius characteristic polynomials; the version for h·Frob with h in a finite group acting (KM74 Theorem 2(2), used through the projector e_χ) is a mild extension that RD.7 should state. Deligne's Propositions I.7.4, I.7.6 and I.7.10 were located in a scanned copy without a text layer and used as BLGHT11 and QIAN23 state them. Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent`, `PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology`, `PotentialAutomorphyDworkMotivesPartII:DM.6/fermat-frobenius-gauss-sums`.
- **G7. Tame specialisation for fibres near infinity and crystalline companions.** The identification of the inertia action on a fibre at a point with v(t) < 0 with a power of the local monodromy of the family at ∞ follows Harris–Shepherd-Barron–Taylor Lemma 1.15(2) (not read) through nearby cycles (LefschetzPencilsAndVanishingCycles LPV.0–LPV.1); the precise specialisation statement for a family over the punctured disc around ∞ should be stated there. Drinfeld–Kedlaya's transfer to lisse sheaves uses Abe's crystalline companions, which no atlas layer plans. Needed by: `PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime`, `PotentialAutomorphyDworkMotivesPartII:DM.7/drinfeld-kedlaya-slope-bound`.

## Corrections to the sources

The statements above use the corrected forms. Each entry gives the place, what is wrong and the correction; the identifiers are those of the packet.

- **E1** (misprint, BCGNT25) §4.3, Definition 4.3.1, published p. 40 (arXiv v3 p. 45). The definition names the kernel of the multiplier ν : GU_n(ℓ) → k^× as SU_n(ℓ). Correction: ker ν is the unitary group U_n(ℓ); the special unitary group is SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ), which is what Proposition 4.4.2 and Lemma 5.2.3 use. Recorded as: new.
- **E2** (error, QIAN23) Lemma 3.12, p. 1267 (statement; proof ends p. 1268). The lemma takes its range of t from the opening of Lemma 3.11, p. 1266: "let t ∈ F_v as a point in T_0(F_v)". Its only use is in the proof of Lemma 4.3, p. 1273. Lemma 3.12 takes a place λ′ of Q(ζ_N) over an odd prime l′ ≠ l not dividing N, under the preceding assumptions. Correction: Add the hypothesis v(t) < 0. Recorded as: PAPER-QIAN-23/E1 (recorded by the paper extraction; confirmed by its review).
- **E3** (misprint, QIAN23) Proof of Theorem 1.4, the final paragraph of §4 (after Remark 4.4), p. 1274. The same sentence appears in arXiv v1, p. 26, where it cites Lemma 7.1.6 of the arXiv version of ACC+; the published version cites it as Lemma 7.1.7. The source claims that the normal closure of \overline{F}^{\ker \bar r}(\zeta_l) and F′ are linearly disjoint over ℚ. Correction: Replace F′ by K = L′LF^{suff}(ζ_N). Recorded as: PAPER-QIAN-23/E3 (recorded by the paper extraction; confirmed by its review).
- **E4** (misprint, QIAN23) Proof of Lemma 2.3, final paragraph, first line of p. 1250 (the sentence begins "For the second condition, we" at the foot of p. 1249). The source says the required check is N ∤ l^{r/2} − 1 = l^{2^{t_0−1} ∏_{i=1}^{m} p_i^{t_i}} − 1 when t_0 > 0. Correction: need to verify that N ∤ l^{r/2} + 1 = l^{2^{t_0−1} ∏_{i=1}^{m} p_i^{t_i}} + 1. Recorded as: PAPER-QIAN-23/E4 (recorded by the paper extraction; confirmed by its review).
- **E5** (misprint, QIAN23) Section 4, proof of Theorems 1.1 and 1.4, the paragraph after Proposition 4.1 beginning "On the side of characteristic l", p. 1270 (arXiv v1, p. 22, same wording, where Lemma 3.9 is numbered 3.8). It restates the third bullet of the choice of N at the start of Section 4, p. 1268. The source includes the assumptions F_{l^2} ⊂ k(λ) and n | #(k(λ)^×). Correction: Write n = l^a m with l ∤ m, as the paper does at the start of Section 4 (p. 1268). Recorded as: PAPER-QIAN-23/E5 (recorded by the paper extraction; confirmed by its review).
- **E6** (gap, QIAN23) §4, proof of Theorems 1.1 and 1.4, paragraph beginning "On the other side of characteristic l′" (checking the hypothesis of Lemma 2.1 at λ′), p. 1270; uses Lemma 3.9 and formulas (3.1)–(3.3), pp. 1262–1264. The source states det Symm^{n−1} r̄_{E,l′} = (χ_cyc)^{n(n−1)/2} with image in F^×_{l^2}. Correction: Prove the step from the Frobenius computation inside the proof of Lemma 3.9, not from the statement of the lemma. Recorded as: PAPER-QIAN-23/E6 (recorded by the paper extraction; confirmed by its review).
- **E7** (gap, QIAN23) §4, proof of Theorems 1.1 and 1.4: Lemma 2.1 is applied at the auxiliary prime λ′ in the paragraph beginning "Now, apply Lemma 2.1" and the paragraph beginning "On the other side of characteristic l′", p. 1270. The hypothesis of Lemma 2.1 is on p. 1244, and the choice of l′ is in Proposition 4.1, p. 1269. The source asserts that the condition required by Lemma 2.1 is checked in the subsequent argument. Correction: Add the condition l′ ≡ 1 mod n to Proposition 4.1, so that l′ ≡ 1 mod Nn (N and n are coprime). Recorded as: PAPER-QIAN-23/E7 (recorded by the paper extraction; confirmed by its review).
- **E8** (misprint, QIAN23) Lemma 3.11, statement (1) and proof of (2) and (3), p. 1267. The source asserts that V_{λ,t} is de Rham as a G_F-representation. Correction: Replace F with F_v throughout. Recorded as: PAPER-QIAN-23/E8 (recorded by the paper extraction; confirmed by its review).
- **E9** (misprint, QIAN23) Section 4, proof of Theorem 1.1, the paragraph after Proposition 4.1 that begins "On the other side of characteristic l′", p. 1270. The same sentence appears unchanged in arXiv v1, p. 22. The representation r̄_{E,l′} is defined in the opening paragraph of Section 4, on p. 1268. The source gives det Symm^{n−1} r̄_{E,l′} = (χ_cyc)^{n(n−1)/2} and says its image lies in F_{l′²}^×. Correction: det Symm^{n−1} r̄_{E,l′} = χ̄_cyc^{−n(n−1)/2}, where χ̄_cyc is the mod-l′ cyclotomic character. Recorded as: PAPER-QIAN-23/E9 (recorded by the paper extraction; confirmed by its review).
- **E10** (error, QIAN21) Lemma 4.2 of L. Qian, "Ordinarity of local Galois representation arising from Dwork motives", arXiv:2103.00106v1, p. 20. This preprint is reference [14] of the paper and exists only in this version. The paper does not cite Lemma 4.2. It refers only to the main theorem of [14], in Remark 3.13 (p. 1267) and Remark 4.4 (p. 1273). Lemma 3.12 (p. 1266) does not cite [14]. In arXiv v1 of the paper, Lemma 3.10(4) (v1, pp. 20–21) was proved as "the main theorem of [Qia21]". The published version dropped that part. Lemma 4.2 takes a characteristic 0 local field F_v over ℚ_p and semistable r : Gal(F̄_v/F_v) → GL_n(ℚ̄_p). Correction: Add the Hodge–Tate hypothesis of BLGHT Lemma 2.2(2), in shifted form: for every embedding τ : F_v ↪ ℚ̄_p there is an integer k_τ such that the τ-labelled Hodge–Tate weights of r are k_τ, k_τ+1, …, k_τ+n−1, each with multiplicity one. Recorded as: PAPER-QIAN-23/E11 (recorded by the paper extraction; confirmed by its review).
- **E11** (gap, QIAN23) Proposition 3.2, proof, first sentence, p. 1257. The source infers local freeness from smoothness and properness of the family. Correction: Smoothness and properness give only that the sheaves are locally constant. Recorded as: PAPER-QIAN-23/E24 (recorded by the paper extraction; confirmed by its review).
- **E12** (misprint, QIAN23) Paragraph after Proposition 3.2 (the case n = 2), p. 1257. The source uses locally constant V_λ, V[𝔫], V_B with coefficients ℤ[ζ_N]^+_λ, ℤ[ζ_N]^+/𝔫, ℤ[ζ_N]^+, respectively. Correction: For V_B, read coefficients ℤ[1/(2N), ζ_N]^+ and V_B ⊗_{ℤ[1/(2N), ζ_N]^+} ℤ[1/(2N), ζ_N] ≅ U_B. Recorded as: PAPER-QIAN-23/E25 (recorded by the paper extraction; confirmed by its review).
- **E13** (error, QIAN23) Lemma 3.3(2), proof, p. 1257 (argument concluded on p. 1258). The source reduces the argument to proving that monodromy around 0 on R^{N−2}p_*ℂ has characteristic polynomial equal to a power of (X − 1). Correction: The reduction is invalid. Recorded as: PAPER-QIAN-23/E27 (recorded by the paper extraction; confirmed by its review).
- **E14** (gap, QIAN23) Lemma 3.3(3), statement p. 1257; proof of (3), p. 1258. The source attributes the proof of (3) to the argument for [4], Lemma 4.3, part 2. Correction: Keep the Picard–Lefschetz half of the cited argument. Recorded as: PAPER-QIAN-23/E28 (recorded by the paper extraction; confirmed by its review).
- **E15** (error, QIAN23) Lemma 3.7, p. 1259: the first assertion (about ρ̄_{t′}) in the case n = 2, and the first sentence of the proof. The relevant definitions are Y′ and V′_B on p. 1256 and the n = 2 convention on p. 1257. For even r and n > 2, the source assumes N ∤ l^{r/2} + 1. Correction: Restrict the first assertion, about ρ̄_{t′}, to n > 2. Recorded as: PAPER-QIAN-23/E31 (recorded by the paper extraction; confirmed by its review).
- **E16** (error, QIAN23) Lemma 3.9, proof, case n = 2: the sentence introducing (3.3), which begins on p. 1263 and ends on p. 1264. The source says it suffices to choose σ ∈ G_{ℚ_l(ζ_N)^+} with σ(ζ_N) = ζ_N^{−1} and σ(ζ_p) = ζ_p. Correction: Drop the condition σ(ζ_p) = ζ_p. Recorded as: PAPER-QIAN-23/E33 (recorded by the paper extraction; confirmed by its review).
- **E17** (gap, QIAN23) Remark 3.13, p. 1268. The source attributes to the proof of [14] the assertion that v(t) < 0 makes V_{λ,t} semistable as a G_{F_v}-representation, with maximally nilpotent N in its Weil-Deligne representation. Correction: Claim only what the proof in [14] gives. Recorded as: PAPER-QIAN-23/E35 (recorded by the paper extraction; confirmed by its review).
- **E18** (error, QIAN23) Proposition 4.1, second condition on l′ and second paragraph of its proof, p. 1269 (same text in arXiv:2104.09761v1, pp. 21–22). The source requires l′ > 2ln + 5 and unramifiedness in F. Correction: Also require l′ to be unramified in F^avoid. Recorded as: PAPER-QIAN-23/E36 (recorded by the paper extraction; confirmed by its review).
- **E19** (gap, QIAN23) Proof of Theorem 1.1, §4, paragraph beginning “Now, apply Lemma 2.1”, p. 1270 (Lemma 2.1 on p. 1244; its proof ends on p. 1248). The source applies Lemma 2.1 with F = F, M = F(ζ_N), F_0 = F^avoid F_2^avoid F^suff(ζ_N). Correction: Apply Lemma 2.1 twice, and enlarge the field to be avoided before the second application. Recorded as: PAPER-QIAN-23/E37 (recorded by the paper extraction; confirmed by its review).
- **E20** (error, QIAN21) Companion preprint arXiv:2103.00106v1 (27 February 2021), Remark 1.2, p. 2; not a statement of the published main paper. The source claims that 0 ∈ {a_1, …, a_N} ensures that the minimal polynomial of ρ_s(γ_∞) is (X − 1)^n. Correction: Delete this sufficient condition. Recorded as: PAPER-QIAN-23/E50 (recorded by the paper extraction; awaiting review).
- **E21** (error, BCGNT25) §4.2, Lemma 4.2.4 and its proof, p. 37. The source asserts that Ψ is defined over M and satisfies Ψc(Ψ) = |·|^{N−n}. Correction: V_{c(λ)} ≅ V_λ^∨(2 − N), and hence Ψ·c(Ψ) corresponds to ε^{n+1−N} (so Ψ has weight N − n − 1; the printed |·|^{N−n} is off by one, and its sign depends on the normalisation of Art). Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E7 (recorded by the paper extraction; confirmed by its review).
- **E22** (misprint, BCGNT25) §4.2, proof of Proposition 4.2.6, p. 40. Σ_{r_0,…,r_{d−1}≥0} (−1)^{n(r_0+⋯+r_{d−1}q_v^{d−1})} Π_i Π_{j=0}^{d−1} C(c_i, r_j) x^{r_0+r_1q_v+⋯+r_dq_v^{d−1}}. Correction: … x^{r_0+r_1q_v+⋯+r_{d−1}q_v^{d−1}}. Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E8 (recorded by the paper extraction; confirmed by its review).
- **E23** (misprint, BCGNT25) §4.4, proof of Lemma 4.4.4, p. 43. The source defines W_{0,λ,j} by twisting, with Ψ_λ^{−1}, the H-eigenspace of character (χ_1ρ_j^{−1}, …, χ_Nρ_j^{−1}) in H^{N−1}(Z_{0,ℚ̄}, O_{M_λ}). Correction: … the H-eigenspace in H^{N−2}(Z_{0,ℚ̄}, O_{M_λ}) …. Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E9 (recorded by the paper extraction; confirmed by its review).
- **E24** (misprint, BCGNT25) §4.1, p. 36. V_λ = (π[1/l]_* O_{M_λ})^{H_0 = χ|H_0}. Correction: V_λ = (R^{N−2}π[1/l]_* O_{M_λ})^{H_0 = χ|H_0}. Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E21 (recorded by the paper extraction; confirmed by its review).
- **E25** (misprint, BCGNT25) Definition 4.4.1, p. 41. The definition takes λ_1, λ_2 to be places of ℚ(ζ_N) with the specified characteristics and calls the morphism perfect and 𝔽_l-bilinear. Correction: places of M; 𝔽_{l_i}-bilinear. Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E22 (recorded by the paper extraction; confirmed by its review).
- **E26** (gap, BCGNT25) Definition 4.4.1 and Proposition 4.4.2, pp. 41–42. Item 2 specifies, for i = 1, 2, isomorphisms η_i : ∧^n W̄_{λ_i} → ∧^n Ū_{λ_i,T_{0,F}}. Correction: In the unitary case require η_i to be compatible with the forms induced by the pairings on ∧^n (such η_i exist, since the norm 𝔽_{l²}^× → 𝔽_l^× is surjective), or state Proposition 4.4.2 for T nonempty. Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E23 (recorded by the paper extraction; confirmed by its review).
- **E27** (gap, BCGNT25) Proof of Proposition 4.2.5(1), p. 38. The proof invokes [KM74, Theorem 2(2)] to place the coefficients in O_M for the characteristic polynomial on this group of each h·Frob_v, h ∈ H. Correction: Integrality of Q_v does not follow, since Q_v is computed on W = V ⊗ Ψ_λ^{−1} and Ψ(ϖ_v) is not a unit at primes above char v. Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E24 (recorded by the paper extraction; confirmed by its review).
- **E28** (error, BCGNT25) Proposition 6.2.3(13), p. 55, and the proof of Theorem 6.2.4, pp. 59–60. For m > 2, the proposition asserts that r̄_{aux,𝔭}(G_F) is conjugate to GU_m(𝔽_{p²}), with ε̄^{1−m} as the multiplier character of r̄_{aux,𝔭}. Correction: Require r̄_{aux,𝔭} to take values in GU_m(𝔽_{p²}) with multiplier ε̄^{1−m} and r̄_{aux,𝔭}(G_{F(ζ_p)}) = SU_m(𝔽_{p²}), which is all Lemma 5.2.4 uses; in Theorem 6.2.4 take f onto its image G ⊇ SU_m(𝔽_{p²}) (the geometric monodromy of Proposition 4.4.2). Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E29 (recorded by the paper extraction; confirmed by its review).
- **E29** (gap, BCGNT25) Proof of Theorem 6.2.4, pp. 60–61. The proof sets F^avoid = B′·F_5 and asserts that every extension F_{j+1}/F_j was selected to preserve the image. Correction: Enlarge F^avoid by the field cut out by r̄_{aux,𝔭} (equivalently s̄_{aux,𝔭}). Recorded as: PAPER-BOXER-CALEGARI-GEE-ETAL-25/E32 (recorded by the paper extraction; confirmed by its review).
- **E30** (error, BLGHT11) §4, definition of the cover T_W, p. 27 (author copy; p. 54 of the published version). T_W is defined as the scheme of all isomorphisms W_S ≅ V[𝔫]((N − 1 − n)/2)_S, with no condition on the alternating pairings. Correction: The isomorphisms must be compatible with the symplectic structures; only then is T_W a torsor under the symplectic group and geometrically connected by Proposition 4.2. Recorded as: BLGGT14, proof of Theorem 3.1.2, pp. 43–44 (arXiv v4), which records the correction (credited to Kevin Buzzard).

## References

- [QIAN23] Lie Qian, *Potential automorphy for GL_n*. Invent. Math. 231 (2023), 1239–1275, DOI 10.1007/s00222-022-01161-6. Locators give the published numbering and pages, as verified against the published text by the reviewed extraction PAPER-QIAN-23 (SHA-256 77969caa… of the NSF public-access copy); this design read arXiv:2104.09761v1 (the only arXiv version), whose Lemmas 3.6–3.10 and Proposition 3.7 are the published Lemmas 3.7, 3.9–3.11 and Proposition 3.8, and which lacks published Lemma 3.12.. https://arxiv.org/abs/2104.09761v1
- [QIAN21] Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*. Preprint arXiv:2103.00106v1 (27 February 2021). https://arxiv.org/abs/2103.00106v1
- [BLGHT11] Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*. Publ. Res. Inst. Math. Sci. 47 (2011), 29–98; final author copy, author pagination. https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf
- [BCGNT25] George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*. Forum Math. Pi 13 (2025), e10. Published page numbers as verified by the reviewed extraction PAPER-BOXER-CALEGARI-GEE-ETAL-25; this design read arXiv:2309.15880v3 (27 March 2025), whose numbering of statements agrees and whose page numbers are given where useful.. https://arxiv.org/abs/2309.15880v3
- [KATZ09] Nicholas M. Katz, *Another look at the Dwork family*. In: Algebra, Arithmetic, and Geometry: in honor of Yu. I. Manin, Vol. II, Progr. Math. 270, Birkhäuser 2009, 89–126; author's final copy. https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf
- [DK17] Vladimir Drinfeld, Kiran S. Kedlaya, *Slopes of indecomposable F-isocrystals*. Pure Appl. Math. Q. 13 (2017); read in arXiv:1604.00660v11 (29 September 2018). https://arxiv.org/abs/1604.00660v11
- [BLGGT14] Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, *Potential automorphy and change of weight*. Ann. of Math. 179 (2014), 501–609; read in arXiv:1010.2561v4. https://arxiv.org/abs/1010.2561v4
- [DMOS82] Pierre Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties (in: Hodge cycles, motives, and Shimura varieties)*. Lecture Notes in Math. 900, Springer 1982, Chapter I; Milne's online reissue. https://www.jmilne.org/math/Books/DMOS.pdf
- [KATZ90] Nicholas M. Katz, *Exponential sums and differential equations*. Annals of Mathematics Studies 124, Princeton University Press 1990. https://doi.org/10.1515/9781400882434
- [BH89] Frits Beukers, Gert Heckman, *Monodromy for the hypergeometric function nF(n−1)*. Invent. Math. 95 (1989), 325–354. https://doi.org/10.1007/BF01393900
- [ZS76] A. E. Zalesskii, V. N. Serezhkin, *Linear groups generated by transvections*. Izv. Akad. Nauk SSSR Ser. Mat. 40 (1976); Math. USSR-Izv. 10 (1976), 25–46. https://doi.org/10.1070/IM1976v010n01ABEH001675
- [ARTIN55] Emil Artin, *The orders of the classical simple groups*. Comm. Pure Appl. Math. 8 (1955), 455–472. https://doi.org/10.1002/cpa.3160080403
- [LEWIS82] D. W. Lewis, *The isometry classification of Hermitian forms over division algebras*. Linear Algebra Appl. 43 (1982), 245–272. https://doi.org/10.1016/0024-3795(82)90258-2
- [KM74] Nicholas M. Katz, William Messing, *Some consequences of the Riemann hypothesis for varieties over finite fields*. Invent. Math. 23 (1974), 73–77. https://doi.org/10.1007/BF01405203
- [KIS99] Mark Kisin, *Local constancy in p-adic families of Galois representations*. Math. Z. 230 (1999), 569–593. https://doi.org/10.1007/PL00004706
- [BER10] Laurent Berger, *Représentations modulaires de GL2(Qp) et représentations galoisiennes de dimension 2*. Astérisque 330 (2010), 263–279. https://smf.emath.fr/publications/representations-modulaires-de-gl2qp-et-representations-galoisiennes-de-dimension-2
