# Dwork switching motives

Target-level plan of the Dwork pencil and general exponent data, specialized monodromy, determinants, local Hodge theory and switching for the selected zero-shaped asymmetric and self-dual systems. General-character ordinarity remains conditional on maximal nilpotence and consecutive labelled weights. All 81 targets are specified; ten explicit proof/supplier gaps and pending upstream imports remain. This is a reviewed mathematical plan, not a claim of formalization or of completed proofs.

This Part II supplies the geometric families and switching points consumed by ModularityAndLanglandsExtensions ML.2 and PotentialAutomorphyInfrastructurePartII PL.5. Automorphy lifting, local deformation components, compatible-system operations and character-root duality retain their existing owners. The targets below are mathematical specifications. Their implementation status is unchecked. A complete planning pass may end at a precise recorded gap (Protocol §0); none of the ten stages is proof-closed.

## Conventions and range

Use N odd, N≥3, 2≤n≤N and gcd(N,n)=1 for the exponent datum. The Dwork pencil has equation ∑Xᵢᴺ=Nt∏Xᵢ over T₀=ℙ¹−({∞}∪μ_N). Its fibres have dimension N−2. General exponent data define eigensheaves; the strong monodromy and consecutive-weight assertions use the selected zero-shaped data. Rank two uses the separately specified self-dual BLGHT family where required. An arbitrary character with a zero in its exponent vector need not have maximal unipotence.

The symmetry action on cohomology is (h⁻¹)*. For finite-field traces use geometric Frobenius; E(1) has eigenvalue q⁻¹. In the cohomological Hodge–Tate convention ε has weight −1 and H¹ of an elliptic curve has weights {0,1}. PadicHodgeTheory uses the opposite weight sign: negate its weights when importing a criterion. For a local field K and coefficient field E, period modules begin with B⊗_{ℚ_l}V and take G_K-invariants; they have K⊗E scalars in the de Rham case and K₀⊗E scalars in the crystalline case. The Galois representation is not a K-vector space.

Hermitian forms are linear first and c-semilinear second: B(x,y)=y†Ax with Aᵢⱼ=B(eⱼ,eᵢ). Mathlib’s sesquilinear symmetry applies to the flipped form. Use the existing Matrix.unitaryGroup and Matrix.specialUnitaryGroup after identifying star with c. The multiplier kernel is U, and SU imposes determinant one as well. Multiplier uniqueness requires positive dimension and a nondegenerate form.

For peripheral loops, Mathlib and current BelyiMaps use p*q=q.trans p and p₁p₀p∞=1. Our γ₀γ₁γ∞=1 means γ₀=p₀, γ₁=p₀⁻¹p₁p₀, γ∞=p∞. Beukers–Heckman Definition 2.9 has its own triple order; the Levelt target records the conjugation needed to compare it.

With geometric Artin reciprocity, direct inertia characters ω_τ=τ∘Art⁻¹ multiply to ε̄. The positive cohomological Lubin–Tate characters are θ_τ=ω_τ⁻¹. The Fermat inertia formula and Berger’s reduction below use θ. On torsion A[r] the determinant is ε̄_r; on H¹ and the CM seed it is ε̄_r⁻¹. The twisted modular curve therefore uses the dual seed as torsion-level input.

## Existing suppliers and version boundaries

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Current read-only upstream main was 0d144d044dacebca17b654695b6f1ad58f159b27; current Tau Ceti was a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Current upstream ClassicalGroups and RepresentationTheory, the post-snapshot roadmap inventory, BelyiMaps and ModularCurves were checked for ownership. The finite transvection classification and unitary generation proofs are not already supplied by their characteristic-zero, CFSG-statement or pro-p targets.

EtaleCohomologyFoundations PR #938 and CohomologicalPointCounting PR #196 were open at review. They supply proposed interfaces, not merged library declarations. Because the atlas snapshot has no stage IDs for those proposals, SF.2 is retained only as the graph routing point. The actual owners and contracts are the upstream references listed below and on each consuming target. SF.2 itself is not asserted to contain these statements.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid**. Finite étale covers of a connected scheme correspond to finite continuous π₁-sets; finite lisse coefficient modules give continuous representations, and connected covers correspond to transitive actions. ECF §F.0.2.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f0a2-the-arithmetic-fundamental-group-sequence**. For geometrically connected qc X/k, 1→π₁(X_kbar)→π₁(X)→G_k→1 is exact, with rational-point sections up to geometric conjugation. ECF §F.0.A2.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f21-proper-base-change-for-arbitrary-torsion**. Proper base change for arbitrary torsion coefficients, compatible with coefficient maps, cup products and finite group actions. ECF §F.2.1.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f3-finiteness-artin-vanishing-and-generic-acyclicity**. Finite constructible cohomology for the stated finite-type/invertible coefficient regime; smooth proper lissity and fibre transport. ECF §F.3. This does not itself prove integral torsion-freeness.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f45-rational-realization-and-finite-dimensional-cohomology**. Normalized integral adic realization and finite-E rational realization, with stable lattices, derived inverse-limit control and finite-dimensional proper cohomology; compatibility with base change, cup products and group actions. ECF §§F.4.1–F.4.6.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f6-smooth-purity-gysin-maps-and-cycle-classes**. Smooth purity, trace and Poincaré pairings in the stated smooth proper invertible-coefficient domain. Integral perfectness here also uses the hypersurface torsion-free argument; EDC.2 explicitly retains the general Ext correction. ECF §F.6.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f27-compact-support-projection-and-künneth**. External tensor products, compact-support projection and Künneth, with the boundedness, finite-Tor and coefficient hypotheses used for the convolution. ECF §F.2.7.

**tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f24-constructible-lower-shriek-and-arbitrary-base-change**. Separated finite-type constructible lower shriek, base change, composition and compactification independence at finite levels, then normalized adic realization. ECF §§F.2.4–F.2.6 and F.4.

**tauceti:TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison#layer-12-relative-comparison**. Finite ordinary and compact Artin comparison for complex algebraic schemes, plus proper relative Rf* and separated Rf! exchange on ctf inputs, compatible with cup products, finite groups and monodromy. CPC ComplexComparison Layers10 and12.

**tauceti:TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization#layer-10-adic-artin-comparison**. Pass finite Artin comparison to integral adic and finite-E rational realizations; keep the stable-lattice essential-image condition. CPC EllAdicRealization Layer10.

**tauceti:TauCetiRoadmap/CohomologicalPointCounting/TraceFormula#layer-11-grothendieck--lefschetz**. Grothendieck–Lefschetz for separated finite-type finite-field schemes with invertible finite ctf coefficients, and the rational corollary through adic realization; compatible with twists and finite group actions. CPC TraceFormula Layer11.

The exact R23.1 local-point and surjective-specialization statements, R24.5 character recognition and system operations, L7 local models and component relations, R02.4 character roots, EDC.2 Poincaré duality, and FF.1 character-sum conventions were read before importing them. The additional hypotheses they do not yet supply are recorded as gaps. In particular R02.4’s algebraic-closure-valued root is insufficient for a fixed-finite-field level torsor, and ModularCurves §5C gives geometric irreducibility only under its connectedness contract.

## Stage inventory

| Stage | Targets | Visible planets | Remaining inputs |
| --- | --- | --- | --- |
| DM.0 — Linear algebra and finite linear groups | 12 |  | Finite classical-group classification, unitary generation and cross-characteristic orders |
| DM.1 — The Dwork pencil and its exponent data | 6 |  | None beyond the recorded supplier interfaces |
| DM.2 — Eigen-local-systems of the Dwork pencil | 7 | Dwork eigen-local-systems, Rank of the Dwork motives | None beyond the recorded supplier interfaces |
| DM.3 — Katz's hypergeometric description | 6 | Katz's hypergeometric comparison, Twisted Dwork motives W | Hypergeometric convolution rank, local monodromy and determinant; Recognition and coefficient control of the comparison character |
| DM.4 — Complex monodromy | 7 | Maximally unipotent monodromy at infinity | Hypergeometric convolution rank, local monodromy and determinant |
| DM.5 — Residual monodromy and level-structure torsors | 8 | Full residual monodromy SL_n, Level-structure torsors T_W, Geometric irreducibility of T_W | Finite classical-group classification, unitary generation and cross-characteristic orders |
| DM.6 — Frobenius, Gauss sums and determinants | 7 |  | Equivariant correspondence comparison |
| DM.7 — p-adic Hodge theory and local monodromy of the fibres | 11 | Consecutive Hodge–Tate weights, Steinberg monodromy near infinity, Dwork compatible systems, Generic crystalline ordinarity | Tame specialization and curvewise crystalline companions |
| DM.8 — Semistable models and ordinarity near infinity | 6 | Ordinarity near infinity | General-character ordinarity remains conditional; Equivariant toroidal subdivision |
| DM.9 — Switching theorems | 11 | Qian's Dwork switching theorem, Self-dual Dwork switching, Auxiliary Dwork systems R_aux, S_UA | Twisted modular-curve rank-two construction; Fixed finite coefficient field in root extraction; Nonarchimedean local inverse for a finite étale cover |


## DM.0 — Linear algebra and finite linear groups


### DM.0/pseudo-reflection — Pseudo-reflections and transvections

**Definition.** Let K be a field and V a K-vector space of finite dimension n ≥ 1. An element g ∈ GL(V) is a pseudo-reflection if g − 1 has rank exactly one, equivalently ker(g − 1) is a hyperplane. It is a transvection if moreover (g − 1)² = 0, equivalently g = 1 + v ⊗ φ for a nonzero v ∈ V and a nonzero φ ∈ V* with φ(v) = 0; equivalently g is a unipotent pseudo-reflection. A pseudo-reflection that is not a transvection is diagonalisable with eigenvalue det g ≠ 1 on a line and 1 on a hyperplane. For a subgroup G ⊆ GL(V), 'generated by transvections' means generated by its elements that are transvections.

**Hypotheses and boundaries.**

- Rank is taken over K; for a field extension K′/K, g is a pseudo-reflection (resp. transvection) over K iff it is one over K′.
- The identity is neither a pseudo-reflection nor a transvection.


**Proof outline.**

1. rank(g − 1) = 1 gives g − 1 = v ⊗ φ with v, φ nonzero; then (g − 1)² = φ(v)·(g − 1), so g is unipotent iff φ(v) = 0, and otherwise g has eigenvalue 1 + φ(v) = det g on v.
2. The characteristic polynomial of a pseudo-reflection is (X − 1)^{n−1}(X − det g); a transvection has characteristic polynomial (X − 1)^n and determinant 1.
3. Conjugation, inversion and extension of scalars preserve both notions; Mathlib's elementary matrix Matrix.transvection i j c (i ≠ j, c ≠ 0) is a transvection in this sense, and SL_n(K) is generated by such matrices (Gaussian elimination, Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec). The diagonal determinant-one factor is also a product of elementary transvections: reduce to diag(a,a⁻¹), which is the product w(a)w(−1), where w(a) = E₁₂(a)E₂₁(−a⁻¹)E₁₂(a). The n = 1 group SL₁ is trivial.


**Checks and worked cases.**

- diag(1, …, 1, a) with a ≠ 0, 1 is a pseudo-reflection and not a transvection; the 2 × 2 matrix [[1, 1], [0, 1]] is a transvection.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| LinearMap.IsPseudoReflection | constructor | For an endomorphism g, IsUnit g and finrank (range (g − 1)) = 1; equivalently a rank-one displacement for g ∈ GL(V). |
| LinearMap.IsTransvection | constructor | g is a transvection iff it is a pseudo-reflection and (g − 1)² = 0. |
| LinearMap.IsPseudoReflection.exists_eq_one_add | characterisation | A pseudo-reflection is 1 + v ⊗ φ with v ≠ 0, φ ≠ 0; it is a transvection iff φ(v) = 0. |
| LinearMap.IsPseudoReflection.charpoly | characterisation | charpoly g = (X − 1)^{n−1}(X − det g). |
| LinearMap.IsTransvection.det | simp | det g = 1 for a transvection. |
| LinearMap.IsPseudoReflection.conj | functoriality | Conjugates and inverses of pseudo-reflections (transvections) are pseudo-reflections (transvections). |
| LinearMap.IsPseudoReflection.baseChange | compatibility | The notions are invariant under extension of scalars K → K′. |
| Matrix.transvection_isTransvection | compatibility | For i ≠ j and c ≠ 0, Mathlib's Matrix.transvection i j c is a transvection. |
| Matrix.SpecialLinearGroup.closure_transvections | relation | SL_n(K) is the subgroup generated by its transvections. |


**Uses that determine the API.**

- QIAN23 Lemma 3.3(3), Lemma 3.7 (DM.4/picard-lefschetz-at-one, DM.5/residual-monodromy-sl): the local monodromy at 1 is a transvection and the residual monodromy is generated by transvections
- BH89 Theorem 3.5, as used in QIAN23 Lemma 3.4 (DM.0/levelt-rigidity): the pseudo-reflection hypothesis of Levelt's theorem
- ZS76 main theorem, as used in QIAN23 Lemma 3.7 (DM.0/zalesskii-serezhkin-classification): the class of groups classified


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| isPseudoReflection_diag | computation | Over ℚ, diag(1, 2) is a pseudo-reflection with determinant 2 and is not a transvection. |
| not_isPseudoReflection_one | degenerate | The identity of GL_n(K) is not a pseudo-reflection (rank(1 − 1) = 0). |
| isTransvection_matrix_transvection | compatibility | Matrix.transvection 0 1 1 ∈ GL_2(ZMod 3) is a transvection. |
| not_isPseudoReflection_neg_one | non-example | −1 ∈ GL_2(ℚ) is not a pseudo-reflection: −1 − 1 = −2 has rank 2 (a definition requiring only det ≠ 1 fails). |
| not_isTransvection_unipotent_rank_two | non-example | The 3 × 3 unipotent Jordan block is unipotent but not a transvection: g − 1 has rank 2. |
| not_pseudoReflection_nonunit | non-example | diag(0,1) over ℚ has rank(g−1)=1 but is not a pseudo-reflection because it is not invertible. |


**Direct prerequisites.** mathlib:Matrix.transvection; mathlib:Matrix.TransvectionStruct; mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec; mathlib:Matrix.charpoly; mathlib:Matrix.rank.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.3(3), pp.13–14; Lemma3.4, p.14. Defines a transvection as a unipotent element whose fixed space has dimension n − 1, and asserts that the local monodromy at t′ = 1 is one.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.6, pp. 31–32 (author copy). Uses that the residual monodromy is generated by elements with characteristic polynomial (X − 1)^n and fixed space of dimension at least n − 1, i.e. by transvections.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.3(3), pp.13–14; Lemma3.4, p.14. The relation γ_0γ_1γ_∞ = 1 with γ_1 acting by a pseudo-reflection is the input of Levelt's theorem.


### DM.0/companion-normal-form — Rank-one difference of companion matrices

**Theorem.** Let K be a field, n ≥ 1, and p,q ∈ K[X] distinct monic polynomials of degree n with p(0) ≠ 0. Use the companion matrices supplied by ClassicalArithmeticCompletion CA.2, with ones on the subdiagonal and the negatives of the coefficients in the last column. Then C(q)C(p)⁻¹ fixes e₂,…,e_n and rank(C(q)C(p)⁻¹−1)=1. The already supplied cyclicity and minimal-polynomial statements imply that C((X−1)^n) is a single unipotent Jordan block; those are imports rather than new targets here.

**Hypotheses and boundaries.**

- Orientation as in QIAN23 Lemma 3.4 and BLGHT11 Corollary 4.4, which agrees with CA.2's convention.


**Proof outline.**

1. For 1 ≤ i < n, C(p)⁻¹e_{i+1}=e_i, so C(q)C(p)⁻¹e_{i+1}=e_{i+1}.
2. The displacement has at most one nonzero column and is nonzero because p ≠ q, hence has rank one.
3. For subsequent applications import minpoly C(p)=p from CA.2; a degree-n minimal polynomial (X−1)^n gives one Jordan block. Levelt below constructs its needed basis directly.


**Checks and worked cases.**

- C((X − 1)²) = [[0, −1], [1, 2]] is conjugate to [[1, 1], [0, 1]] and not to the identity.
- For p = (X − 1)² and q = (X − 2)(X − 4) over ℚ, C(q)C(p)^{−1} − 1 has rank one.


**Direct prerequisites.** ClassicalArithmeticCompletion:CA.2/companion-matrix; ClassicalArithmeticCompletion:CA.2/characteristic-polynomial-of-the-companion-matrix; mathlib:Matrix.charpoly; mathlib:minpoly.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.4 and its displayed companion matrices, p.14. Uses the companion matrices with ones on the subdiagonal and coefficient columns, and records that BA^{−1} differs from the identity only in its first column; observes that A has minimal polynomial (X − 1)^n.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Corollary 4.4, pp. 30–31. The same matrices A and B for the self-dual exponent set.


### DM.0/levelt-rigidity — Levelt's rigidity theorem for hypergeometric triples

**Theorem.** Let K be a field, n ≥ 1, and α_1, …, α_n, β_1, …, β_n ∈ K̄^× with α_j ≠ β_k for all j, k; put p = ∏(X − α_j), q = ∏(X − β_j), assumed to lie in K[X]. Let A = C(p) and B = C(q) be the companion matrices. If h_0, h_∞ ∈ GL_n(K) satisfy: h_∞ has characteristic polynomial p, h_0^{−1} has characteristic polynomial q, and h_1 := h_0^{−1}h_∞^{−1} is a pseudo-reflection, then there is g ∈ GL_n(K) with gh_∞g^{−1} = A and gh_0g^{−1} = B^{−1}, hence gh_1g^{−1} = BA^{−1}. Conversely (h_0, h_∞) = (B^{−1}, A) satisfies the hypotheses. In particular a triple (h_0, h_1, h_∞) with h_0h_1h_∞ = 1, h_1 a pseudo-reflection and prescribed characteristic polynomials of h_0 and h_∞ with no common root of p and q is unique up to simultaneous conjugation.

**Hypotheses and boundaries.**

- α_j ≠ β_k for all j, k (no common eigenvalue of h_∞ and h_0^{−1})
- h_1 = h_0^{−1}h_∞^{−1} is a pseudo-reflection (DM.0/pseudo-reflection)


**Proof outline.**

1. The case n=1 is immediate. For n≥2 put X=h_∞ and Y=h_0⁻¹. Since Y=h_1X, X−Y=(1−h_1)X has rank one. Set W=ker(X−Y).
2. The intersection W ∩ X^{−1}W ∩ ⋯ ∩ X^{−(n−2)}W is nonzero; pick e ≠ 0 in it, so that X^je ∈ W, hence X^{j+1}e = YX^je, for 0 ≤ j ≤ n − 2.
3. If e,Xe,…,X^{n−1}e are dependent, take the first dependence at degree d≤n−1. Then U=span(e,…,X^{d−1}e) is a nonzero X-stable subspace contained in W. Hence Y=X on U and U is also Y-stable. Their common restriction has an eigenvalue over K̄, contrary to the disjoint spectra. Thus the vectors form a basis.
4. In this basis X is the companion matrix of its characteristic polynomial p and Y the companion matrix of q (both act as the shift on the first n − 1 basis vectors), which is the claim.
5. Uniqueness up to conjugacy follows because both triples are conjugate to (B^{−1}, BA^{−1}, A).


**Checks and worked cases.**

- n = 1: with h_∞ = α and h_0 = β^{−1}, h_1 = βα^{−1} is a pseudo-reflection of the line exactly when α ≠ β, and g = 1 conjugates the pair to (C(X − β)^{−1}, C(X − α)).
- For p = (X − 1)^n and q = ∏_{b∈B}(X − ζ_N^{−b}) the theorem identifies the Dwork monodromy (QIAN23 Lemma 3.4).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection; PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.4, p.14. Levelt gives the simultaneous companion model over ℂ with source order h_∞h₁h₀=1. Conjugating the middle peripheral generator gives the packet order h₀h₁h_∞=1 and h₁=C(q)C(p)⁻¹. The written linear-algebra proof extends the result to any field with disjoint spectra over its algebraic closure.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Corollary 4.4, p. 31. Deduces the companion normal form of the self-dual Dwork monodromy from Levelt's theorem (Levelt, Theorem 1.1) and Beukers–Heckman Theorem 3.5.
- [BH89](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0095/LOG_0022.pdf), Theorem3.5 and proof pp.331–332; Definition2.9 p.330. Levelt's theorem: a hypergeometric group with prescribed eigenvalues at 0 and ∞ and a pseudo-reflection at 1 is unique up to conjugation and given by companion matrices.


### DM.0/hypergeometric-group-irreducible — Irreducibility of hypergeometric groups

**Theorem.** Let K be a field and h_0, h_1, h_∞ ∈ GL_n(K) with h_0h_1h_∞ = 1 and h_1 a pseudo-reflection. If h_∞ and h_0^{−1} have no common eigenvalue in K̄, then the subgroup ⟨h_0, h_∞⟩ acts absolutely irreducibly on K^n.

**Hypotheses and boundaries.**

- h_0h_1h_∞ = 1 with h_1 a pseudo-reflection
- h_∞ and h_0^{−1} have no common eigenvalue in an algebraic closure of K


**Proof outline.**

1. Work over K̄. Let 0 ≠ U ⊊ K̄^n be stable under h_0 and h_∞, hence under h_1. The image of h_1 − 1 is a line L.
2. If L ⊆ U, then h_1 acts trivially on K̄^n/U; otherwise (h_1 − 1)U ⊆ U ∩ L = 0 and h_1 acts trivially on U.
3. On the piece (U or K̄^n/U) where h_1 acts trivially, h_0h_∞ = 1, so h_∞ and h_0^{−1} agree there and share an eigenvalue: contradiction.


**Checks and worked cases.**

- For n = 2, K = 𝔽_7, h_∞ = C((X − 1)²) and h_0 = C((X − 2)(X − 4))^{−1}, the group ⟨h_0, h_∞⟩ has no invariant line.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, after Definition3.6, p.15. Shows the reduction of the companion representation modulo λ is absolutely irreducible by this argument, following Beukers–Heckman Proposition 3.3.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.6, p. 31. Uses the same argument for the self-dual family modulo λ.
- [BH89](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0095/LOG_0022.pdf), Proposition3.3 with proof, p.331. Irreducibility criterion for hypergeometric groups.


### DM.0/finite-unitary-group — Finite unitary groups

**Definition.** Let k be a finite field, ℓ/k its quadratic extension with Galois generator c, and for M ∈ M_n(ℓ) assume n ≥ 1 and put M† = (M^c)ᵀ. The general unitary group is GU_n(ℓ) = {M ∈ GL_n(ℓ) : M†M = ν(M)·1 for some ν(M) ∈ k^×}, with multiplier character ν : GU_n(ℓ) → k^×. The unitary group is U_n(ℓ) = ker ν and the special unitary group is SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ). For a finite field k′ of even degree over 𝔽_l with σ its automorphism of order two, SU(n, k′) = {g ∈ SL_n(k′) : σ(g)ᵀg = 1} is SU_n(k′) for the quadratic extension k′/k′^σ. Give ℓ its star operation c. U and SU use Mathlib Matrix.unitaryGroup and Matrix.specialUnitaryGroup; this node adds GU and the finite-field compatibility and order results, rather than redefining those carriers.

**Hypotheses and boundaries.**

- BCGNT25 Definition 4.3.1 writes SU_n(ℓ) for ker ν; the groups used afterwards (Proposition 4.4.2, Lemma 5.2.3) are U_n(ℓ) ∩ SL_n(ℓ), as here (sourceIssue PotentialAutomorphyDworkMotivesPartII/E1).
- n ≥ 1 makes the scalar multiplier unique; at n=0 every scalar satisfies the matrix equation, so it does not define a multiplier function.


**Proof outline.**

1. M ↦ M† is an anti-automorphism of M_n(ℓ) with (AB)† = B†A† and M†† = M; so GU_n(ℓ) is a subgroup and ν is a homomorphism.
2. For M ∈ GU_n(ℓ), N_{ℓ/k}(det M) = ν(M)^n; hence det maps U_n(ℓ) onto the norm-one subgroup of ℓ^× (onto by Hilbert 90 applied to diagonal matrices) and SU_n(ℓ) has index q + 1 in U_n(ℓ), q = #k.
3. Changing the Hermitian form by an equivalence conjugates these groups inside GL_n(ℓ) (DM.0/hermitian-forms-unique).


**Checks and worked cases.**

- #U_1(𝔽_9) = 4 (the norm-one elements of 𝔽_9^×) and SU_1(𝔽_9) is trivial.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Matrix.adjointConj | constructor | M† = (M^c)ᵀ for the nontrivial automorphism c of ℓ/k. |
| Matrix.adjointConj_mul | simp | (AB)† = B†A†; also M†† = M when c is an involution. |
| Matrix.IsGeneralUnitaryWith | constructor | M lies in GU_n(ℓ) with multiplier a: a ≠ 0, c(a) = a and M†M = a·1. |
| Matrix.IsUnitaryConj | compatibility | Read M†M=1 using the existing Matrix.mem_unitaryGroup_iff' after installing star=c; this is compatibility with an existing carrier. |
| Matrix.IsSpecialUnitaryConj | compatibility | Read M†M=1 and det M=1 using the existing Matrix.mem_specialUnitaryGroup_iff; this is compatibility, not a new special unitary group. |
| Matrix.IsGeneralUnitaryWith.norm_det | relation | If M ∈ GU_n(ℓ) with multiplier a then c(det M)·det M = a^n. |
| Matrix.isGeneralUnitaryWith_scalar | example | A nonzero scalar b·1 lies in GU_n(ℓ) with multiplier c(b)b. |
| Matrix.GU | structure | GU_n(ℓ) as a subgroup of GL_n(ℓ), with the multiplier homomorphism ν : GU_n(ℓ) → k^×; U_n(ℓ) = ker ν and SU_n(ℓ) = U_n(ℓ) ∩ SL_n(ℓ) as subgroups. |
| Matrix.card_SU | example | #SU_n(𝔽_{q²}) = q^{n(n−1)/2} ∏_{i=2}^{n} (q^i − (−1)^i). |
| Matrix.SU_conj_of_hermitian_equiv | compatibility | For the linear-first convention B(x,y)=y†Ax, set Aᵢⱼ=B(e_j,e_i). If A=P†P, then g↦PgP⁻¹ conjugates {g:g†Ag=A, det g=1} to the existing special unitary group. |
| Matrix.GU.multiplier_unique | characterisation | For n ≥ 1, if g†g=a·1=b·1 then a=b, by any diagonal entry. |


**Uses that determine the API.**

- BCGNT25 Lemma 4.3.4 (DM.0/conjugate-self-dual-is-unitary): the target group of a conjugate self-dual representation
- BCGNT25 Proposition 4.4.2 (DM.5/residual-monodromy-su): the geometric monodromy group when −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^×
- QIAN23 Lemma 3.7 (DM.5/residual-monodromy-sl): one of the three groups excluded by the stabiliser lemma
- BCGNT25 Remark 4.4.3 and proof of Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): r̄_aux takes values in GU_m(𝔽_{p²}) with multiplier ε̄^{1−m}


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| card_U_one | computation | U_1(𝔽_9) is the group of norm-one elements of 𝔽_9^×, of order 4. |
| SU_one_trivial | degenerate | SU_1(ℓ) is trivial for every quadratic extension ℓ/k. |
| SU_two_eq_SL_two_image | compatibility | SU_2(𝔽_{q²}) ≅ SL_2(𝔽_q); in particular #SU_2(𝔽_9) = 24. |
| U_ne_SU | non-example | U_2(𝔽_9) ≠ SU_2(𝔽_9): diag(ζ, 1) with ζ of norm one and ζ ≠ 1 lies in U_2 but has determinant ζ ≠ 1 (BCGNT25's literal ker ν is not the special unitary group). |
| multiplier_scalar | characterisation | For a ∈ ℓ^×, the scalar a·1 lies in GU_n(ℓ) with ν(a·1) = N_{ℓ/k}(a). |


**Direct prerequisites.** mathlib:Matrix.GeneralLinearGroup; mathlib:Matrix.SpecialLinearGroup; mathlib:Matrix.conjTranspose; mathlib:FiniteField.frobenius_pow; mathlib:Matrix.unitaryGroup; mathlib:Matrix.specialUnitaryGroup; mathlib:Matrix.mem_specialUnitaryGroup_iff.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, §4.3 Definition4.3.1, p.45. Defines the adjoint M†, the group GU_n(ℓ) of matrices with M†M scalar in k^×, and its multiplier.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, proof of Lemma3.6, pp.15–16. Defines SU(n, k) = {g ∈ SL_n(k) : σ(g)ᵀg = 1} for k of even degree over 𝔽_l.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.6, pp. 31–32. The same group SU(n, k), and the remark that its traces lie in the fixed field of σ when n = 2.


### DM.0/hermitian-form — Hermitian and skew-Hermitian forms over a quadratic extension

**Definition.** Let ℓ/k be a quadratic extension of fields with nontrivial automorphism c, and V a finite-dimensional ℓ-vector space. A Hermitian form on V is a k-bilinear map ⟨·,·⟩ : V × V → ℓ with ⟨ax, y⟩ = a⟨x, y⟩, ⟨x, ay⟩ = c(a)⟨x, y⟩ for a ∈ ℓ, and ⟨y, x⟩ = c(⟨x, y⟩). It is skew-Hermitian if instead ⟨y, x⟩ = −c(⟨x, y⟩). Nondegenerate means that x ↦ ⟨x, ·⟩ is injective. Multiplying by η ∈ ℓ^× with c(η) = −η interchanges Hermitian and skew-Hermitian forms. The isometry group of ⟨·,·⟩ and its similitude group (isometries up to a scalar in k^×) are defined as usual; for the standard form ⟨x, y⟩ = ∑ x_i c(y_i) they are U_n(ℓ) and GU_n(ℓ).

**Hypotheses and boundaries.**

- Bilinearity is over k; the form is ℓ-linear in the first and c-semilinear in the second variable (BCGNT25 convention).
- Use the linear-first convention. In coordinates put Aᵢⱼ=B(e_j,e_i), so B(x,y)=y†Ax. For a multiplier function assume B nondegenerate and dim V ≥ 1; arbitrary forms still have an isometry group.


**Proof outline.**

1. Hermitian forms are the sesquilinear forms for the ring involution c whose Gram matrix satisfies A† = A.
2. For η ≠ 0 with c(η)=−η, scaling and cancelling η identifies Hermitian forms and skew-Hermitian forms; the zero scalar does not give an equivalence.
3. Similitudes preserve products and inverses; nondegeneracy on a nonzero space gives a pair with B(x,y) ≠ 0 and hence uniqueness and multiplicativity of the multiplier.


**Checks and worked cases.**

- On ℓ = 𝔽_9 ⊃ k = 𝔽_3, ⟨x, y⟩ = x c(y) = x y³ is a nondegenerate Hermitian form on ℓ.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| LinearMap.IsHermitian | constructor | A sesquilinear form B : V →ₗ[ℓ] V →ₛₗ[c] ℓ is Hermitian iff B y x = c (B x y). |
| LinearMap.IsSkewHermitian | constructor | B y x = −c (B x y). |
| LinearMap.IsHermitian.smul_skew | relation | For η ≠ 0 with c(η)=−η, η • B is skew-Hermitian iff B is Hermitian; without η ≠ 0 only the forward implication is valid. |
| LinearMap.IsHermitian.gram | characterisation | With Aᵢⱼ=B(e_j,e_i), B(x,y)=y†Ax and B is Hermitian iff A†=A. |
| LinearMap.similitudeGroup | constructor | For nondegenerate B on V ≠ 0, the g ∈ GL(V) with B(gx,gy)=aB(x,y), a∈k×, form a group and have a unique multiplier a. |
| LinearMap.similitudeGroup_standard | compatibility | For the standard form on ℓ^n the similitude group is GU_n(ℓ) and the isometry group is U_n(ℓ). |
| LinearMap.IsHermitian.isSymm_flip | compatibility | Flip B to the c-semilinear-first, linear-second convention of Mathlib LinearMap.IsSymm. Hermitian symmetry is precisely IsSymm of that flipped form; reuse that predicate rather than redeveloping symmetry. |


**Uses that determine the API.**

- BCGNT25 Lemma 4.3.4 (DM.0/conjugate-self-dual-is-unitary): the invariant form built from a conjugate self-duality
- BCGNT25 Definition 4.4.1(3) (DM.5/level-structure-torsor): the pairing data on the residual representation in the unitary case
- BCGNT25 §4.4, the pairing ⟨·,·⟩_{W̄_λ} (DM.5/hermitian-poincare-pairing): the Dwork side carries a skew-Hermitian pairing


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| hermitian_standard_one | computation | On 𝔽_9 over 𝔽_3 the form (x, y) ↦ x·y³ is Hermitian and nondegenerate. |
| hermitian_zero | degenerate | The zero form is Hermitian and skew-Hermitian, and is degenerate unless V = 0. |
| hermitian_iff_conjTranspose | compatibility | A form on ℓ^n is Hermitian iff its Gram matrix A satisfies A.conjTranspose = A for the star structure given by c. |
| not_hermitian_symmetric_bilinear | non-example | The ℓ-bilinear symmetric form (x, y) ↦ xy on 𝔽_9 is not Hermitian: it is ℓ-linear rather than c-semilinear in y. |
| skew_scaling_zero_not_iff | non-example | For η=0 every ηB is skew-Hermitian even when B is not Hermitian; this rules out the converse without η≠0. |


**Direct prerequisites.** mathlib:LinearMap.IsSymm; mathlib:LinearMap.SeparatingLeft; PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Definitions4.3.2 and 4.4.1, Remark4.3.3, pp.45–47. Defines Hermitian forms for a quadratic extension of finite fields and observes that scaling by an element of trace zero gives the skew version.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Definitions4.3.2 and 4.4.1, Remark4.3.3, pp.45–47. The pairings on the level-structure data are Hermitian up to such a scalar.


### DM.0/hermitian-forms-unique — Uniqueness of nondegenerate Hermitian forms over finite fields

**Theorem.** Let ℓ/k be a quadratic extension of finite fields and V an ℓ-vector space of dimension n. Every nondegenerate Hermitian form on V has an orthonormal basis; hence any two nondegenerate Hermitian forms on V are isometric, and the isometry group of any of them is conjugate in GL(V) to U_n(ℓ) (and its similitude group to GU_n(ℓ)).

**Hypotheses and boundaries.**

- k finite (surjectivity of the norm ℓ^× → k^× is used)


**Proof outline.**

1. A nonzero Hermitian form has an anisotropic vector: if ⟨x, x⟩ = 0 for all x, polarisation ⟨x + ay, x + ay⟩ = Tr_{ℓ/k}(c(a)⟨x, y⟩) for all a forces ⟨x, y⟩ = 0, using surjectivity of the trace. This also works in characteristic two: the trace of a nonzero scalar multiple cannot vanish on all ℓ because the finite extension is separable.
2. For x with ⟨x, x⟩ = d ∈ k^×, choose a ∈ ℓ^× with N(a) = d^{−1} (the norm of finite fields is surjective) and replace x by ax, of length 1.
3. Split off the line and induct on the orthogonal complement, which is nondegenerate.


**Checks and worked cases.**

- On 𝔽₉=𝔽₃[i], i²=−1, one has N(i)=1 and N(1+i)=−1. Thus scaling the second basis vector by 1+i identifies diag(1,1) with diag(1,−1).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form; PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group; mathlib:FiniteField.unitsMap_norm_surjective; mathlib:Algebra.trace_surjective.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma4.3.4 with proof, p.46. Uses that there is a unique equivalence class of nondegenerate Hermitian forms for a quadratic extension of finite fields, citing Lewis §4.
- [LEWIS82](https://doi.org/10.1016/0024-3795(82)90258-2), §4, as cited by BCGNT25; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Isometry classification of Hermitian forms; over finite fields there is one class in each dimension.


### DM.0/conjugate-self-dual-is-unitary — Conjugate self-dual absolutely irreducible representations are unitary

**Theorem.** Let ℓ/k be a quadratic extension of finite fields with generator c, G a group, V an ℓ-vector space of dimension n with an absolutely irreducible representation of G, and χ : G → k^× a character. If there is an ℓ-linear G-isomorphism V^∨ ≅ V^c ⊗ χ^{−1}, then V carries a nondegenerate G-invariant-up-to-χ Hermitian form, unique up to k^×-scaling, and in a suitable basis the representation takes values in GU_n(ℓ) with multiplier χ.

**Hypotheses and boundaries.**

- V absolutely irreducible
- the isomorphism V^∨ ≅ V^c ⊗ χ^{−1} is ℓ-linear and G-equivariant
- χ takes values in k^×


**Proof outline.**

1. The isomorphism is a nondegenerate G-equivariant pairing ψ : V × V^c → χ; by Schur's lemma it is unique up to ℓ^×.
2. ψ′(x, y^c) := c(ψ(y, x^c)) is another such pairing, so ψ′ = λψ; applying twice gives N_{ℓ/k}(λ) = 1.
3. By Hilbert 90, λ = c(η)/η; rescaling ψ by η^{−1} gives a Hermitian form ⟨x, y⟩ = ψ(x, y^c) with ⟨gx, gy⟩ = χ(g)⟨x, y⟩.
4. By DM.0/hermitian-forms-unique choose an orthonormal basis; then G lands in GU_n(ℓ) with multiplier χ.


**Checks and worked cases.**

- For n = 1 and G acting on ℓ through a character θ with θ·c(θ) = χ, the conclusion is that θ takes values in the norm-χ elements.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique; PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group; PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form; mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma4.3.4 with proof, p.46. States and proves that a conjugate self-dual absolutely irreducible representation over a finite field is unitary, via Schur's lemma, Hilbert 90 and uniqueness of Hermitian forms.


### DM.0/special-linear-unitary-simple — Normal subgroups of SL_n and SU_n over finite fields

**Theorem.** Let k be a finite field of characteristic l > 2 with q elements and n ≥ 2. (1) SL_n(k) is perfect, its centre is the group μ_n(k) of scalar matrices, every proper normal subgroup is central, and PSL_n(k) = SL_n(k)/μ_n(k) is a nonabelian simple group, except for (n, q) = (2, 3). (2) For the quadratic extension ℓ/k and n ≥ 3, SU_n(ℓ) is perfect, its centre consists of the scalars of SU_n(ℓ), every proper normal subgroup is central, and PSU_n(ℓ) is a nonabelian simple group (n ≥ 3, q odd). (3) Consequently the composition factors of SL_n(k) (resp. SU_n(ℓ)) are PSL_n(k) (resp. PSU_n(ℓ)) and cyclic groups of order dividing n, every nontrivial quotient has PSL_n(k) (resp. PSU_n(ℓ)) as a composition factor, and these groups have no nontrivial abelian quotient.

**Hypotheses and boundaries.**

- l odd (the exceptional small cases (2, 2), (2, 3), (3, 2) for SU_3 are excluded or have even characteristic)
- n ≥ 2 for SL_n, n ≥ 3 for SU_n
- In part (3), exclude (n,q)=(2,3) for SL, as in part (1). The small symplectic exception is treated separately in DM.5/two-prime-product-monodromy.


**Proof outline.**

1. SL_n(k) is generated by transvections (DM.0/pseudo-reflection) and acts primitively on lines of k^n; the stabiliser of a line contains the abelian normal subgroup of transvections with that centre, whose conjugates generate SL_n(k); perfectness for (n, q) ≠ (2, 2), (2, 3) follows from commutators of transvections; Iwasawa's criterion (Mathlib MulAction.IwasawaStructure.isSimpleGroup) gives simplicity of PSL_n(k). The rank-two case is Mathlib's Matrix.ProjectiveSpecialLinearGroup.rank_two_simple.
2. For SU_n use its primitive action on isotropic lines and the long-root subgroup in the centre of the corresponding unipotent radical. That centre is abelian and normal in the line stabiliser; the whole radical is generally not abelian. The required generation and perfectness statements are the finite unitary input cited in BCGNT25 Lemma 5.2.3; their detailed root-group proof remains an explicit DM.0 closure input, rather than being asserted to follow from matrix notation alone.
3. The centre of SL_n(k) is the scalars by Mathlib Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity; a central quotient is cyclic of order dividing n, which gives (3).


**Checks and worked cases.**

- PSL_3(𝔽_3) is simple of order 5616; SL_2(𝔽_3) is not perfect (its abelianisation has order 3), which is why (2, 3) is excluded.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection; PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group; mathlib:MulAction.IwasawaStructure.isSimpleGroup; mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple; mathlib:Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity; mathlib:Matrix.SL2.commutator_eq_top.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.6 and Proposition3.7, pp.15–16. Uses that the cyclic composition factors of SL_n(k(λ)) have order dividing n and that every nontrivial quotient of SL_n over a field of characteristic > 10 has PSL_n as a composition factor.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma5.2.3, pp.50–51. States perfectness of SL_n and SU_n in the relevant range and simplicity of PSL_n and PSU_n, used in Proposition 4.4.2.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proofs of Corollaries 4.7 and 4.8, pp. 32–33. The symplectic analogue: the only cyclic composition factors of Sp_n(𝔽_{l^r}) have order 2 or 3, and PSp_n is simple outside Sp_2(𝔽_3).


### DM.0/artin-non-isomorphism — Simple linear groups in different characteristics are not isomorphic

**Theorem.** Let n ≥ 2 and let l_1 ≠ l_2 be odd primes with max(l_1, l_2) > 10, and let k_1, k_2 be finite fields of characteristics l_1, l_2. Then PSL_n(k_1) is not isomorphic to PSL_n(k_2) or to PSU_n(k_2′) (k_2′/k_2 quadratic, n ≥ 3), PSU_n(k₁′) is also not isomorphic to PSU_n(k₂′) for n≥3; and likewise with the roles reversed; and PSp_n(k_1) ≇ PSp_n(k_2) for n even. Consequently no composition factor of SL_n(k_2) or SU_n(k_2′) is isomorphic to PSL_n(k_1) or PSU_n(k_1′).

**Hypotheses and boundaries.**

- l_1, l_2 odd and distinct
- max(l_1, l_2) > 10 excludes the coincidences in small characteristic (e.g. PSL_2(𝔽_4) ≅ PSL_2(𝔽_5), PSL_2(𝔽_7) ≅ PSL_3(𝔽_2))


**Proof outline.**

1. Use only the restricted cross-characteristic non-isomorphism statements in Qian’s product proof, BLGHT Corollary 4.8 (symplectic case), and BCGNT Lemma 5.2.3 (the same-rank linear and unitary cases). The hypothesis max(l₁,l₂)>10 excludes their small cross-characteristic coincidences. Do not assert that order determines every finite Lie-type group: there are same-order type B/C cases outside this statement. Verification of the original Artin list and a complete elementary order-comparison proof remain in the finite-group gap.
2. The second statement follows from DM.0/special-linear-unitary-simple(3): the noncyclic composition factor of SL_n(k_2) is PSL_n(k_2).


**Checks and worked cases.**

- PSL_2(𝔽_{11}) (order 660) is not isomorphic to PSL_2(𝔽_{3^r}) for any r, since 660 is not of the form 3^r(3^{2r} − 1)/2.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Proposition3.7, p.16. Excludes an isomorphism between quotients of SL_n over fields of different characteristics, one of them > 10, citing Artin's theorem on the orders of classical simple groups.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Corollary 4.8, p. 33. For primes l ≠ l′ both > 2, PSp_n(𝔽_{l^r}) and PSp_n(𝔽_{l′^s}) are not isomorphic.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma5.2.3, pp.50–51. The non-isomorphism of the projective special linear and unitary groups attached to different primes, used in Proposition 4.4.2.
- [ARTIN55](https://doi.org/10.1002/cpa.3160080403), Theorem 2, as cited by QIAN23; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Orders of the classical simple groups determine them up to listed exceptions.


### DM.0/zalesskii-serezhkin-classification — Irreducible groups generated by transvections (Zalesskii–Serezhkin), in the form used

**Theorem.** Let l be an odd prime, n > 2 and k′ a finite field of characteristic l. Let G ⊆ GL_n(k′) be an absolutely irreducible subgroup generated by transvections. Then G is conjugate in GL_n(k′) to SL_n(k), Sp_n(k) or SU(n, k) (DM.0/finite-unitary-group) for some subfield k ⊆ k′ (Sp_n only for n even, SU(n, k) only for [k : 𝔽_l] even). The statement is false for n = 2 (SL_2(𝔽_5) ⊂ SL_2(𝔽_9) is generated by its elements of order 3, which are transvections).

**Hypotheses and boundaries.**

- n > 2
- l odd
- G absolutely irreducible and generated by transvections


**Proof outline.**

1. Apply precisely the odd-characteristic, dimension >2 case of Zalesskii–Serezhkin: the absolutely irreducible transvection-generated group is special linear, symplectic, or unitary over a subfield. The exceptional binary icosahedral subgroup in characteristic 3 has dimension 2 and is excluded by n>2. No order-N exclusion is part of this argument.


**Checks and worked cases.**

- For n = 2 the conclusion fails: SL_2(𝔽_5) embeds in SL_2(𝔽_9) as an absolutely irreducible subgroup generated by transvections that is none of SL_2(k), SU(2, k).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection; PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, proof of Lemma3.6, p.15. Applies the main theorem of Zalesskii–Serezhkin to the residual monodromy, generated by transvections, to obtain SL_n(k), Sp_n(k) or SU(n, k) for a subfield k.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.6, pp. 31–32. The same classification for the self-dual family.
- [ZS76](https://doi.org/10.1070/IM1976v010n01ABEH001676), Main theorem, as cited by QIAN23 and BLGHT11; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Classification of finite irreducible linear groups generated by transvections.


### DM.0/product-of-simple-images — Surjectivity onto a product of two groups with distinct simple quotients

**Theorem.** Let H₁,H₂ be finite groups. Assume every nontrivial quotient of H₁ has a composition factor isomorphic to a fixed nonabelian simple group S₁, and no composition factor of H₂ is isomorphic to S₁. If Γ≤H₁×H₂ surjects onto both factors, then Γ=H₁×H₂. The same result holds after interchanging the factors. H₂ need not be perfect, so the statement also applies to the small solvable symplectic factor Sp₂(𝔽₃).

**Hypotheses and boundaries.**

- Γ projects onto H_1 and onto H_2


**Proof outline.**

1. By Goursat's lemma (Mathlib Subgroup.goursat) Γ is the preimage of the graph of an isomorphism H_1/N_1 ≅ H_2/N_2 for normal subgroups N_i.
2. If N_1 ≠ H_1, then H_1/N_1 has S_1 as a composition factor, but H_1/N_1 ≅ H_2/N_2 has only composition factors of H_2: contradiction. Hence N_1 = H_1, N_2 = H_2 and Γ = H_1 × H_2.


**Checks and worked cases.**

- For H_1 = SL_3(𝔽_{13}) and H_2 = SL_3(𝔽_{3^r}) every subgroup of H_1 × H_2 surjecting on both factors is everything.


**Direct prerequisites.** mathlib:Subgroup.goursat; PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, proof of Proposition3.7, p.16. Combines Goursat's lemma with the normal subgroups of SL_n and Artin's theorem to show the two-prime monodromy is the full product.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Proposition4.4.2, p.47. Goursat's lemma with Lemma 5.2.3 for products of SL_n and SU_n.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Corollary 4.8, p. 33. The symplectic version.


## DM.1 — The Dwork pencil and its exponent data


### DM.1/auxiliary-modulus — Auxiliary moduli with prescribed order of l

**Theorem.** Let l be a prime, s ≥ 1 an integer and S a finite set of primes. There is a positive integer N, divisible by no prime of S ∪ {l}, such that the order r of l in (ℤ/Nℤ)^× is divisible by s and, when r is even, N ∤ l^{r/2} + 1. Since every prime below a given bound may be put into S, N may be taken larger than any given bound, and N may be taken odd and prime to any given integer. In particular (BLGHT11 Lemma 6.1) for every m ≥ 1 there is such an N with m | r, so that every finite field of characteristic l and degree dividing m embeds in 𝔽_l(ζ_N).

**Hypotheses and boundaries.**

- l is prime, s ≥ 1, and every member of S is prime. The construction works for l=2 as well as for odd l.


**Proof outline.**

1. Write s=2ᵃ∏pᵢ^{aᵢ}. For a sufficiently large t, choose odd prime factors A of l^{2^{t−2}}+1 and B of l^{2^{t−1}}+1 outside S. Their orders are 2^{t−1} and 2ᵗ. For l odd each displayed integer is 2 mod 4, and for l=2 both are odd, so such odd factors exist. Increasing t excludes the finite set S by comparing the orders of l modulo its members.
2. Set M₀=AB. Its order is 2ᵗ, while l^{2^{t−1}} is 1 modulo A and −1 modulo B; thus −1 does not lie in the cyclic subgroup generated by l modulo M₀.
3. For each odd pᵢ choose tᵢ≥aᵢ large enough. The cyclotomic value Φ_{pᵢ}(l^{pᵢ^{tᵢ−1}}) exceeds pᵢ. Any prime divisor belonging to the current finite exclusion set must be pᵢ, and it occurs to valuation one (expand the geometric sum modulo pᵢ²). Hence there is a new odd prime Mᵢ outside that set whose order for l is exactly pᵢ^{tᵢ}. This is an elementary valuation argument, not an appeal to an unplanned primitive-divisor theorem.
4. Take N=M₀∏Mᵢ. The Chinese remainder theorem gives order 2ᵗ∏pᵢ^{tᵢ}, divisible by s. Its half-power is 1 modulo A, so cannot equal −1 modulo N. Adding all primes below a bound to S forces N above that bound.


**Checks and worked cases.**

- A prime N never satisfies both conditions with r even, since then l^{r/2} ≡ −1 mod N; for l = 3 and s = 4 the composite N = 35 works: r = lcm(4, 6) = 12 and 3^6 ≡ 29 ≢ −1 mod 35.


**Direct prerequisites.** mathlib:orderOf; mathlib:ZMod.pow_totient; mathlib:Nat.exists_prime_and_dvd; mathlib:Polynomial.cyclotomic.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma2.3 with proof, pp.8–9; opening §4, p.21. Constructs N prime to l and S with s dividing the order r of l modulo N and N ∤ l^{r/2} + 1 for r even, from primitive prime divisors of cyclotomic values.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 6.1 and its proof, p. 40. Constructs N prime to S with m dividing every s for which l^s ≡ 1 mod N.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma2.3 with proof, pp.8–9; opening §4, p.21. Chooses N odd, > 100n + 100, prime to the bad primes, with 𝔽_{l²} and the m-th roots of 𝔽_{l^s} inside 𝔽_l(ζ_N), by this lemma.


### DM.1/dwork-pencil — The Dwork pencil of hypersurfaces

**Construction.** Let N ≥ 3 be an odd integer. Over T_0 = ℙ¹ − ({∞} ∪ μ_N) over ℤ[1/N] (coordinate t; equivalently T_0 = Spec ℤ[1/N][t, (1 − t^N)^{−1}]), let Y ⊂ ℙ^{N−1} × T_0 be the hypersurface X_1^N + ⋯ + X_N^N = N t X_1⋯X_N and π : Y → T_0 the projection. Then π is smooth and projective of relative dimension N − 2 with geometrically connected fibres; the fibre Y_0 is the Fermat hypersurface of degree N, and over t ∈ μ_N the fibre acquires N^{N−2} ordinary double points (the H_0-orbit of (1 : ⋯ : 1) when t = 1). Write Y_s for the fibre at a point s.

**Hypotheses and boundaries.**

- N odd (so that N − 2 is odd and the fibres have odd dimension)
- N invertible on the base


**Proof outline.**

1. Partial derivatives N X_i^{N−1} − N t ∏_{j≠i} X_j vanish simultaneously only if X_i^N = t∏_j X_j for all i; summing gives the equation, and multiplying gives t^N = 1 once all X_i ≠ 0; if some X_i = 0 then all vanish. So Y is smooth over the locus t^N ≠ 1 where N is invertible.
2. At t = 1 the singular points are the H_0-translates of (1 : ⋯ : 1), with Hessian N(N·I − J) on the tangent space, nondegenerate: ordinary double points.
3. A hypersurface of dimension ≥ 1 in projective space is connected, and smooth fibres are geometrically integral.


**Checks and worked cases.**

- For N = 3, Y is the Hesse pencil X_1³ + X_2³ + X_3³ = 3tX_1X_2X_3 of plane cubics, smooth exactly for t³ ≠ 1.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.pencil | constructor | The closed subscheme Y ⊂ ℙ^{N−1}_{T_0} cut out by ∑ X_i^N − N t ∏ X_i. |
| Dwork.pencil.smooth | instance | π : Y → T_0 is smooth and projective of relative dimension N − 2. |
| Dwork.pencil.fibre_zero | simp | The fibre at t = 0 is the Fermat hypersurface ∑ X_i^N = 0. |
| Dwork.pencil.singular_fibre_one | other | Over t = 1 the fibre has exactly N^{N−2} singular points, all ordinary double points, forming one free H_0-orbit. |
| Dwork.pencil.baseChange | functoriality | Formation of Y commutes with base change T′ → T_0; for a field K ⊇ ℤ[1/N] and t ∈ K with t^N ≠ 1, Y_t is the projective hypersurface ∑ X_i^N = N t ∏ X_i over K. |
| Dwork.pencil.geometricallyConnected | other | Every geometric fibre of π is connected. |


**Uses that determine the API.**

- QIAN23 §3 (DM.2/dwork-eigensheaves): the cohomology of its fibres carries the Dwork motives
- BLGHT11 §4 (DM.2/self-dual-real-forms): the self-dual motives are cut out of the same family
- QIAN21 Lemma 2.1 (DM.8/dwork-semistable-blowup): its reciprocal-parameter model is blown up to a semistable model near t = ∞


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| dworkPencil_three_hesse | computation | For N = 3 the fibre at t = 0 is the Fermat cubic curve and the fibre at t = 1 is singular at (1 : 1 : 1), (1 : ζ_3 : ζ_3²), (1 : ζ_3² : ζ_3). |
| dworkPencil_fibre_zero_fermat | degenerate | The fibre at t = 0 is the Fermat hypersurface, smooth over ℤ[1/N]. |
| dworkPencil_singular_count | characterisation | For N = 5 the fibre at t = 1 has 5³ = 125 singular points. |
| dworkPencil_not_smooth_at_root_of_unity | non-example | Over t = ζ_N the fibre is singular, so a definition of T_0 as ℙ¹ − {∞} (forgetting μ_N) does not give a smooth family. |


**Direct prerequisites.** mathlib:AlgebraicGeometry.Smooth; mathlib:MvPolynomial; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f3-finiteness-artin-vanishing-and-generic-acyclicity.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, opening §3, p.10. Defines T_0, the family X_1^N + ⋯ + X_N^N = NtX_1⋯X_N and asserts smoothness of relative dimension N − 2.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, p. 25. The same family for the self-dual case, with the automorphism ς.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, §4.1, p.40. The family Z over T_0 = Spec R_0[t, (1 − t^N)^{−1}], R_0 = ℤ[ζ_N, N^{−1}].


### DM.1/dwork-symmetry-groups — Symmetry groups of the Dwork pencil and their characters

**Construction.** Let H = μ_N^N/μ_N (diagonal μ_N) and H_0 = {(ξ_1, …, ξ_N) : ξ_1⋯ξ_N = 1}/μ_N ⊂ H. Over ℤ[1/N, ζ_N], H acts on Y by (ξ_i)·(X_i, t) = (ξ_iX_i, (∏ξ_i)^{−1}t); thus H_0 acts on every fibre Y_s over T_0 and H acts on Y_0. For integers a_1, …, a_N with ∑a_i ≡ 0 mod N, ξ ↦ ∏ξ_i^{a_i} is a well-defined character H → μ_N (its restriction to H_0 depends only on (a_i) modulo adding a constant vector). After fixing ζ_N, Hom(H, μ_N) ≅ ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ). In addition, the involution ς : X_j ↦ X_{N+1−j} of Y normalises H_0. For a character χ of H_0 and a coefficient ring R in which #H_0 = N^{N−2} is invertible and which contains the values of χ, the idempotent e_χ = (1/#H_0)∑_{ξ∈H_0} χ(ξ)^{−1}ξ cuts out the χ-isotypic part of any R[H_0]-module.

**Hypotheses and boundaries.**

- N invertible on the coefficients for the idempotent
- the action of H on t is through ∏ξ_i^{−1}, so only H_0 acts fibrewise


**Proof outline.**

1. The formula preserves the equation, since ∏(ξ_iX_i) = (∏ξ_i)∏X_i is compensated by t ↦ (∏ξ_i)^{−1}t, and the diagonal μ_N acts trivially on ℙ^{N−1} and on t because ζ^N = 1.
2. Characters of μ_N^N trivial on the diagonal are the exponent vectors with ∑a_i ≡ 0; restricting to H_0 kills exactly the constant vectors.
3. e_χ is an idempotent of R[H_0] projecting onto the χ-isotypic part because #H_0 is a unit in R.


**Checks and worked cases.**

- For N = 3, H_0 ≅ μ_3 (one generator (ζ, ζ^{−1}, 1)), acting on the Hesse pencil fibrewise.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.H | constructor | H = μ_N^N/Δμ_N as a finite abelian group of order N^{N−1}. |
| Dwork.H0 | constructor | H_0 ⊂ H the kernel of the product map, of order N^{N−2}. |
| Dwork.H.action | data | The action of H on Y over the action ξ·t = (∏ξ_i)^{−1}t on T_0; H_0 acts over T_0. |
| Dwork.charOfExponents | constructor | For a ∈ (ℤ/Nℤ)^N with ∑a_i = 0, the character χ_a : H → μ_N, ξ ↦ ∏ξ_i^{a_i}. |
| Dwork.charOfExponents_restrict_eq | extensionality | χ_a and χ_b agree on H_0 iff a − b is a constant vector. |
| Dwork.charEquivKerSum | equivalence | Hom(H, μ_N) ≃ ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ). |
| Dwork.isotypicIdempotent | constructor | e_χ ∈ R[H_0] for R ∋ 1/N containing the values of χ, an idempotent with ξe_χ = χ(ξ)e_χ. |
| Dwork.swap | data | The involution ς : X_j ↦ X_{N+1−j}, normalising H_0. |


**Uses that determine the API.**

- QIAN23 §3 (DM.2/dwork-eigensheaves): χ-eigensheaves of R^{N−2}π_*
- BLGHT11 §4 (DM.2/self-dual-real-forms): the ς-symmetrised idempotent
- DMOS82 I.7.4 (DM.2/fermat-hypersurface-cohomology): H acts on the Fermat fibre with one-dimensional eigenspaces


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| card_H0 | computation | #H_0 = N^{N−2}; for N = 3 it is 3. |
| charOfExponents_const_trivial_on_H0 | degenerate | The constant vector (1, …, 1) gives the trivial character of H_0 (but a nontrivial one of H). |
| charOfExponents_well_defined | characterisation | If ∑a_i ≢ 0 mod N then ξ ↦ ∏ξ_i^{a_i} is not trivial on the diagonal μ_N, so it does not descend to H. |
| swap_not_in_H | non-example | ς does not lie in the image of H in Aut(Y): it does not commute with H_0 when N ≥ 3. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil; mathlib:IsPrimitiveRoot; mathlib:MonoidAlgebra.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §3, pp.10–11. Defines H, H_0 and the action, and notes that ξ ↦ ∏ξ_i^{a_i} is well defined when ∑a_i ≡ 0 mod N.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, pp. 25–26. Defines H, H_0, the involution ς and the semidirect product H_0 ⋊ ⟨ς⟩.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, §4.1, p.40. Identifies Hom(H, M^×) with ker(∑ : (ℤ/Nℤ)^N → ℤ/Nℤ) after a choice of embedding.


### DM.1/dwork-exponent-datum — Exponent data and the complementary index set

**Definition.** Fix 2 ≤ n ≤ N and an odd N ≥ 3 prime to n. A Dwork exponent datum is a vector a = (a_1, …, a_N) ∈ (ℤ/Nℤ)^N with ∑a_i = 0 such that the residues a_j take exactly N − n distinct values. Its index set is B(a) = {b ∈ ℤ/Nℤ : b + a_j ≠ 0 for all j}, of cardinality n, and its character is χ_a|_{H_0}. Two data are equivalent if they differ by a permutation and a constant vector (same character on H_0 up to permutation of coordinates). The two families used are: Qian's asymmetric data for n > 2 (0 occurring n + 1 times, every nonzero residue at most once, with the explicit vectors of QIAN23 p. 1253: for n odd B = {1, 2, N − 3} ∪ {(N + x)/2 : x = −n + 4, −n + 6, …, n − 4}; for n even B = {1, 2, 3, N − 6} ∪ {(N + x)/2 : x = −n + 5, …, n − 5}); and the self-dual data of BLGHT11 (n even, a = (1, 2, …, (N − n − 1)/2, 0, …, 0, (N + n + 1)/2, …, N − 1) with n + 1 zeros), whose index set is B = {(N + 1 − n)/2, …, (N − 1 + n)/2} = −B. For n = 2 Qian's datum is the self-dual one with B = {(N − 1)/2, (N + 1)/2}. For these two selected families, 0 ∉ B and ∑_{b∈B}b=0. Neither conclusion follows for arbitrary exponent data. Call a chosen representative zero-shaped if zero occurs n+1 times and each nonzero exponent occurs at most once. This extra condition is used for the one-block hypergeometric comparison and consecutive Hodge numbers, rather than being inferred from rank n.

**Hypotheses and boundaries.**

- N odd, gcd(N, n) = 1; Qian's explicit vectors need N > 100n + 100 (the stabiliser lemma) and n > 2


**Proof outline.**

1. b ∉ B iff −b is one of the N − n values of the a_j, so #B = n.
2. If 0 occurs among the a_j then 0 ∉ B; the explicit vectors list their values, from which B is read off.
3. ∑B ≡ −(sum of the distinct values not taken) and the explicit choices make this 0; for the self-dual datum B = −B gives ∑B = 0 directly.


**Checks and worked cases.**

- n = 3, N = 401: B = {1, 2, 398}, and 1 + 2 + 398 = 401 ≡ 0.
- n = 4, N = 501: B = {1, 2, 3, 495}.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.ExponentDatum | structure | Structure with odd N ≥ 3, 2 ≤ n ≤ N, gcd(N,n)=1, a : Fin N → ZMod N, ∑a=0, and #image a=N−n. The bound n≤N prevents truncated subtraction from admitting spurious data. |
| Dwork.ExponentDatum.indexSet | data | B(a) = {b : ∀ j, b + a j ≠ 0} as a Finset (ZMod N). |
| Dwork.ExponentDatum.card_indexSet | characterisation | #B(a) = n. |
| Dwork.ExponentDatum.zero_not_mem_indexSet | simp | If 0 occurs among the a_j, then 0 ∉ B(a). |
| Dwork.ExponentDatum.sum_indexSet | relation | For the Qian and self-dual data, ∑_{b∈B} b = 0. |
| Dwork.ExponentDatum.qian | constructor | Qian's asymmetric datum for n > 2 (explicit vector of QIAN23 p. 1253). |
| Dwork.qianIndexSet | constructor | Qian's index set B as an explicit Finset (ZMod N): {1, 2, N − 3} ∪ {(N − n + 4)/2 + k : k < n − 3} for n odd, {1, 2, 3, N − 6} ∪ {(N − n + 5)/2 + k : k < n − 4} for n even. |
| Dwork.card_qianIndexSet | characterisation | For n > 2, N odd and N > 100n + 100, Qian's index set has n elements and sums to 0. |
| Dwork.ExponentDatum.selfDual | constructor | BLGHT11's self-dual datum for n even, with B = −B. |
| Dwork.ExponentDatum.neg_indexSet_selfDual | simp | For the self-dual datum, −B = B. |
| Dwork.ExponentDatum.character | projection | The character χ_a\|_{H_0}. |
| Dwork.ExponentDatum.IsZeroShaped | data | For a fixed exponent representative: zero has multiplicity n+1 and every nonzero residue has multiplicity ≤1. Keep this predicate separate from the general rank datum. |


**Uses that determine the API.**

- QIAN23 Lemma 3.1 (DM.1/asymmetric-stabiliser-trivial): the asymmetry property of B
- QIAN23 Lemma 3.3(1) (DM.4/monodromy-at-zero): eigenvalues ζ_N^b, b ∈ B, of the monodromy at 0
- QIAN23 Lemma 3.10 (DM.7/hodge-grades-of-fermat-eigenlines): the Hodge grades are read off B
- QIAN23 Lemma 3.9 (DM.6/dwork-determinant-gauss-formula): the determinant is a product of Gauss sums g(v, b), b ∈ B


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| indexSet_qian_three | computation | For n = 3, N = 401: B = {1, 2, 398}. |
| indexSet_selfDual_two | degenerate | For n = 2 the self-dual datum has B = {(N − 1)/2, (N + 1)/2}. |
| card_indexSet_eq | characterisation | #B(a) = n for every exponent datum. |
| indexSet_qian_ne_neg | non-example | For Qian's datum with n = 3, N = 401: −B = {400, 399, 3} ≠ B, so the datum is not self-dual (a definition imposing B = −B would exclude it). |
| general_datum_not_zero_shaped | non-example | For N=5,n=2, a=(1,1,2,2,4) has sum 0 and three distinct values, so B={0,2} has size 2. It is a valid rank datum, but 0∈B, ∑B≠0, and it is not zero-shaped. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups; mathlib:ZMod.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §3, exponent vectors and index sets, pp.10–11. Lists the exponent vectors for n odd, n even and n = 2, the residues they omit, and the index set B = {b_1, …, b_n} of residues with b + a_j ≠ 0.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, the idempotent e and Lemma 4.1, pp. 26–27. The self-dual character with n + 1 zeros and index range (N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, §4.1, p.40. The conditions on χ: the trivial character n + 1 times, the others at most once, and trivial Galois stabiliser of the set of missing characters.


### DM.1/asymmetric-stabiliser-trivial — Trivial multiplicative stabiliser of Qian's index set

**Theorem.** Let n > 2 and N odd with N > 100n + 100 and gcd(N, n) = 1, and let B ⊂ ℤ/Nℤ be the index set of Qian's asymmetric datum. If α ∈ (ℤ/Nℤ)^× satisfies αB = B, then α = 1. In particular −B ≠ B, and l^jB ≠ B, l^jB ≠ −B for every power l^j ≢ 1 (resp. ≢ −1) mod N. For n = 2 (and for the self-dual data) B = −B.

**Hypotheses and boundaries.**

- n > 2
- N odd, N > 100n + 100, gcd(N, n) = 1


**Proof outline.**

1. 1 ∈ B, so α ∈ B. The small elements 1, 2 (and 3 for n even) and the large element N − 3 (resp. N − 6) are isolated from the middle block {(N + x)/2}, because N > 100n + 100.
2. α = 2 would force 4 ∈ B, α = N − 3 would force 9 or −9 into B, and similarly for 3 and N − 6; none of these lie in B.
3. If α = (N + x)/2 lies in the middle block, then 2α = x ∈ B forces x ∈ {1, 3} (n even) or {1, −3} (n odd); then (N − x)/2 ∈ B too and their product −x²/4 ∈ B, so 4B contains −1 or −9, which the explicit description of 4B excludes.


**Checks and worked cases.**

- n = 3, N = 401: multiplication by 2 sends B = {1, 2, 398} to {2, 4, 395} ≠ B.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.1 with proof, pp.11–12. Shows that a unit α with αB = B equals 1 for n > 2 by a case analysis of the elements of B.


### DM.1/three-punctured-cover — The quotient family over the thrice-punctured line

**Construction.** Let T′_0 = ℙ¹ − {0, 1, ∞} with coordinate t′. For n > 2 let Y′ ⊂ ℙ^{N−1} × T′_0 be X′_1^N + ⋯ + X′_{N−1}^N + t′^{−1}X′_N^N = N X′_1⋯X′_N, with H_0 acting by scaling coordinates. The map t ↦ t′ = t^N is a Galois covering T_0 − {0} → T′_0 with group μ_N, and X′_i = X_i (i < N), X′_N = tX_N identify its pullback of Y′ with Y − Y_0, H_0-equivariantly. For the self-dual datum (BLGHT11), the family Ỹ with t′^{−1} placed on the middle coordinate X̃_{(N+1)/2}, which is stable under ς̃ : X̃_j ↦ X̃_{N+1−j}, plays the same role. Over ℚ(ζ_N), Ỹ is the quotient of Y − Y_0 by the copy of μ_N acting on the middle coordinate.

**Hypotheses and boundaries.**

- n > 2 for Y′ (for n = 2 use Ỹ, since Y′ is not ς-stable)


**Proof outline.**

1. Substituting X′_N = tX_N gives t′^{−1}t^NX_N^N = X_N^N and N X′_1⋯X′_N = N t X_1⋯X_N, so the pullback equation is that of Y.
2. The deck transformation t ↦ ζt lifts to Y − Y_0 through the element of H acting on X_N (resp. on X_{(N+1)/2}); this identifies the quotient.
3. H_0 commutes with the identification because it scales the X_i without changing t.


**Checks and worked cases.**

- For N = 3 and the Hesse pencil, t′ = t³ and Y′ is X_1³ + X_2³ + t′^{−1}X_3³ = 3X_1X_2X_3.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.quotientFamily | constructor | Y′ → T′_0 (n > 2) and Ỹ → T′_0 (self-dual datum). |
| Dwork.quotientFamily.pullback_iso | equivalence | The pullback along t ↦ t^N is H_0-equivariantly isomorphic to Y − Y_0 → T_0 − {0}. |
| Dwork.powerCover | data | t ↦ t^N : T_0 − {0} → T′_0 is finite étale Galois with group μ_N over ℤ[1/N, ζ_N]. |
| Dwork.quotientFamily.smooth | instance | Y′ → T′_0 is smooth projective of relative dimension N − 2. |


**Uses that determine the API.**

- QIAN23 Lemma 3.3 (DM.4/dwork-monodromy-representations): monodromy is computed on π_1 of the thrice-punctured line
- BLGHT11 Lemma 4.3 (DM.4/monodromy-at-zero): the same for the self-dual family


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| powerCover_degree | computation | t ↦ t^N has degree N; for N = 3 the fibre over t′ = 8 is {2, 2ζ_3, 2ζ_3²}. |
| quotientFamily_fibre_one | degenerate | Over t′ = 1 the fibre of Y′ is singular (it is the image of the singular fibres over μ_N). |
| pullback_equation | characterisation | Substituting X′_N = tX_N, t′ = t^N into the equation of Y′ gives the equation of Y. |
| powerCover_not_over_zero | non-example | t ↦ t^N does not make T_0 a covering of T′_0: t = 0 lies over t′ = 0 ∉ T′_0, so only T_0 − {0} covers T′_0, and the Fermat fibre enters only through the local monodromy at t′ = 0. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §3, family Y′, pp.12–13. Defines Y′, the N-fold covering t′ = t^N and the identification of its pullback with Y − Y_0, H_0-equivariantly.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, the family Ỹ over T̃_0, pp. 28–29. Defines the ς̃-stable family Ỹ, the isomorphism H̃_0 ≅ H_0 and the identification of Ỹ with a μ_N-quotient of Y − Y_0.


## DM.2 — Eigen-local-systems of the Dwork pencil


### DM.2/fermat-hypersurface-cohomology — Cohomology of the Fermat hypersurface

**Theorem.** Let X ⊂ ℙ^{N−1} be the Fermat hypersurface ∑X_i^N = 0 over a field of characteristic 0 or prime to N containing μ_N, with the action of H = μ_N^N/μ_N. For a character a = (a_1, …, a_N) ∈ (ℤ/Nℤ)^N, ∑a_i = 0, of H, the a-eigenspace of the primitive middle cohomology H^{N−2}_prim (Betti over ℚ(ζ_N), ℓ-adic over a characteristic-zero coefficient field containing μ_N, or de Rham in characteristic zero) is zero unless every a_i ≠ 0, in which case it is one-dimensional; the remaining cohomology in degree N − 2 is the a = 0 part (spanned by a power of the hyperplane class, zero for N − 2 odd). Over ℂ, the a-eigenline (all a_i ≠ 0, representatives ⟨a_i⟩ ∈ {1, …, N − 1}) lies in H^{p, N−2−p} with p + 1 = ∑_i⟨a_i⟩/N.

**Hypotheses and boundaries.**

- N invertible on the coefficients and on the base field
- μ_N in the coefficients (for eigenspaces)
- For the integral coefficient versions assert finite projective rank-one eigensummands; freeness is automatic after completion at λ or reduction modulo a nonzero ideal, but is not inferred over a global Dedekind ring merely from being a direct summand. The de Rham Hodge statement is in characteristic zero.
- Take the cohomological left action of a geometric automorphism h to be (h⁻¹)*. With the resulting exponent labels, the Hodge degree is p=∑⟨aᵢ⟩/N−1, as in Deligne §7. A change to h* inverts all character labels.


**Proof outline.**

1. X is the quotient-free cover of ℙ^{N−2} branched along a hyperplane arrangement, and its cohomology decomposes under H; the dimension count of eigenspaces comes from the Lefschetz trace formula for elements of H (or from the explicit description of X as a μ_N^{N−1}-cover of ℙ^{N−2}).
2. The Hodge type of an eigenline is computed by Griffiths' residue description of H^{N−2}_prim with the monomial forms X^{b−1}Ω/F^k (Deligne, Hodge cycles on abelian varieties, §7).


**Checks and worked cases.**

- N = 3: the characters with all a_i ≠ 0 and ∑a_i ≡ 0 mod 3 are (1, 1, 1) and (2, 2, 2), so H¹ of the Fermat cubic curve has rank 2; ∑⟨a_i⟩/3 = 1 and 2 put the two eigenlines in H^{0,1} and H^{1,0}.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups; ComplexComparisonPartII:C5/proper-pure-hodge; ComplexComparisonPartII:C5/relative-hodge-bundles; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f21-proper-base-change-for-arbitrary-torsion; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f45-rational-realization-and-finite-dimensional-cohomology.

**Sources and matches.**

- [DMOS82](https://www.jmilne.org/math/Documents/Deligne82.pdf), Updated author chapter (1 October 2018), §7, Propositions7.4 and 7.6, pp.45–48. The eigenspace decomposition of the cohomology of Fermat hypersurfaces into lines indexed by characters with all entries nonzero, and their Hodge types.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Lemma4.4.4, p.48. Uses the H-eigenspace decomposition of H^{N−2} of the Fermat fibre into lines, citing [DMOS82, I.7.4].
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.1 and Lemma 5.2, pp. 27, 35–36. Applies Propositions I.7.4 and I.7.6 of DMOS to the Dwork fibre at 0.


### DM.2/integral-cohomology-torsion-free — Integral cohomology of smooth hypersurfaces is torsion-free

**Theorem.** Let X ⊂ ℙ^{m+1}_ℂ be a smooth hypersurface of dimension m. Then H^i(X(ℂ), ℤ) is torsion-free for every i. Consequently, for a smooth proper family of hypersurfaces over a base where ℓ is invertible, the sheaves R^iπ_*ℤ_ℓ are torsion-free and R^iπ_*(ℤ/ℓ^k) = R^iπ_*ℤ_ℓ/ℓ^k.

**Hypotheses and boundaries.**

- X smooth hypersurface in projective space


**Proof outline.**

1. By the Lefschetz hyperplane theorem H^i(X, ℤ) ≅ H^i(ℙ^{m+1}, ℤ) for i < m and H_i(X, ℤ) ≅ H_i(ℙ^{m+1}, ℤ) for i < m, so these are torsion-free; Poincaré duality and the universal coefficient theorem give torsion-freeness in degrees > m and in degree m (torsion of H^m is torsion of H_{m−1}, which vanishes).
2. Smooth proper base change and the Artin comparison transfer this to the étale sheaves R^iπ_*ℤ_ℓ on any base with ℓ invertible, through a complex fibre; the universal coefficient sequence gives the reduction statement.
3. For a geometric fibre in positive characteristic, lift the defining smooth hypersurface to a mixed-characteristic DVR by lifting its coefficients. Smoothness is open and properness makes the lifted model smooth after restricting the base. Smooth proper base change and the characteristic-zero comparison transfer the torsion-free calculation; there is no assertion that a positive-characteristic point is itself a complex point.


**Checks and worked cases.**

- For a smooth plane cubic, H¹(X, ℤ) ≅ ℤ² is torsion-free.


**Direct prerequisites.** ComplexComparisonPartII:C5/relative-betti-local-system; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison#layer-12-relative-comparison; tauceti:TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization#layer-10-adic-artin-comparison.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Proposition3.2, p.13; integral freeness is the additional argument stated in this roadmap. Derives local freeness of the eigensheaves from smoothness and properness; the torsion-freeness of the integral cohomology of the fibres is the missing input recorded as PAPER-QIAN-23/E24.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 4.1(2), p. 27. Local freeness of rank n of V_λ, checked on the fibre at 0.


### DM.2/dwork-eigensheaves — The Dwork eigen-local-systems V_λ, V[𝔫] and V_B

**Construction.** Let a be a Dwork exponent datum with character χ of H_0, O = ℤ[1/(2N), ζ_N]. (1) For a prime λ of O of residue characteristic l, V_λ = e_χ R^{N−2}π_*O_λ, a lisse étale sheaf of O_λ-modules on T_0 × Spec O[1/l]. (2) For a nonzero ideal 𝔫 of O of norm M, V[𝔫] = e_χ R^{N−2}π_*(O/𝔫), a lisse sheaf of O/𝔫-modules on T_0 × Spec O[1/M]. (3) After fixing τ : ℚ(ζ_N) ↪ ℂ with τ(ζ_N) = e^{2πi/N}, V_B = e_χ R^{N−2}π̃_*O on T_0(ℂ), a local system of O-modules. (4) V′_B on T′_0(ℂ), defined the same way from Y′, pulls back to V_B|_{T_0(ℂ)−{0}}. These are compatible: V_B ⊗ O_λ corresponds to τ*V_λ and V_B ⊗ O/𝔫 to τ*V[𝔫] under the equivalence of locally constant analytic and étale sheaves on (T_0)_ℂ; and V[𝔫] ≅ ∏_λ V_λ/λ^{a_λ} for 𝔫 = ∏λ^{a_λ}. For n = 2 and the self-dual data, U_λ, U[𝔫], U_B denote these sheaves, replaced by the real forms of DM.2/self-dual-real-forms. Stalks are written V_{λ,t}, V[𝔫]_t, V_{B,t}; BCGNT25 writes V_{t,λ} with coefficients O_{M_λ}, M = ℚ(e^{2πi/N}), which is the same object.

**Hypotheses and boundaries.**

- #H_0 = N^{N−2} and 2 invertible in O
- λ ∤ residue characteristic of the base points used
- The chosen action on cohomology is (h⁻¹)*, consistently with the exponent/Hodge convention. Betti stalks over O are finite projective of rank n; the λ-adic and finite coefficient stalks are free.


**Proof outline.**

1. R^{N−2}π_* of the smooth proper π is lisse with torsion-free stalks (smooth proper base change, DM.2/integral-cohomology-torsion-free); H_0 acts by functoriality and e_χ is an idempotent endomorphism, so its image is a direct summand, again lisse.
2. The Artin comparison and Ehresmann's theorem identify the analytic and étale local systems on complex fibres; e_χ commutes with them.
3. Chinese remainder theorem for O/𝔫 and exactness of e_χ give the product decomposition.


**Checks and worked cases.**

- For the cubic boundary N=3,n=2, χ|H₀ is trivial and the eigenpart has rank 2; the two nontrivial H-characters (1,1,1) and (2,2,2) split the Fermat fibre. Nontrivial H₀-characters have rank zero.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.eigenSheaf | constructor | V_λ := e_χ R^{N−2}π_*O_λ, a lisse O_λ-sheaf on T_0[1/l]. |
| Dwork.eigenSheafMod | constructor | V[𝔫] := e_χ R^{N−2}π_*(O/𝔫). |
| Dwork.bettiEigenSystem | constructor | V_B := e_χ R^{N−2}π̃_*O on T_0(ℂ) for the fixed embedding τ. |
| Dwork.eigenSheafMod_eq_reduction | relation | V[λ^k] ≅ V_λ/λ^k and V[𝔫] ≅ ∏ V_λ/λ^{a_λ}. |
| Dwork.bettiEigenSystem_comparison | compatibility | V_B ⊗_O O_λ ≅ τ*V_λ and V_B ⊗ O/𝔫 ≅ τ*V[𝔫] (Artin comparison). |
| Dwork.eigenSheaf_stalk | simp | The stalk at a geometric point t̄ is e_χ H^{N−2}_ét(Y_t̄, O_λ). |
| Dwork.eigenSheaf_baseChange | functoriality | Formation commutes with base change along S → T_0[1/l]; V_{λ,t} is a G_K-module for t ∈ T_0(K). |
| Dwork.eigenSheaf_conj | functoriality | For σ ∈ Gal(ℚ(ζ_N)/ℚ), σ carries the χ-eigensheaf with coefficients O_λ to the σχ-eigensheaf with coefficients O_{σλ}. |
| Dwork.quotientEigenSystem_pullback | relation | V′_B pulls back to V_B on T_0(ℂ) − {0}. |


**Uses that determine the API.**

- QIAN23 Lemmas 3.3–3.12 and §4 (DM.4, DM.5, DM.6, DM.7, DM.9): the representations whose monodromy, determinant and local properties are computed
- BCGNT25 §§4.2–4.4 (DM.3/twisted-dwork-local-system): W_λ = V_λ ⊗ Ψ_λ^{−1}
- ModularityAndLanglandsExtensions:ML.2/dwork-fibre-automorphy-transport: the fibres V_{λ,t}, V_{λ′,t} at the switching point


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| eigenSheaf_rank_hesse | computation | For N=3 the subgroup H₀≅μ₃ acts on the Hesse cubic by translations and trivially on H¹. The trivial H₀-character has rank 2; each nontrivial H₀-character has rank 0. The two H-eigenlines restrict to the trivial H₀-character. |
| eigenSheaf_stalk_zero | degenerate | At the Fermat point t = 0 the stalk V_{λ,0} is the direct sum of the n lines V_{λ,i}, i ∈ B(a), on which H acts through χ_i. |
| bettiEigenSystem_comparison_mod | compatibility | The stalk of V_B ⊗ O/𝔫 at t ∈ T_0(ℂ) equals the stalk of V[𝔫] at the corresponding geometric point (Artin comparison). |
| eigenSheaf_not_full_cohomology | non-example | V_λ ≠ R^{N−2}π_*O_λ for N ≥ 5: the full middle cohomology has rank ((N − 1)^N + (−1)^N(N − 1))/N, much larger than n. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum; PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free; ComplexComparisonPartII:C5/relative-betti-local-system; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f21-proper-base-change-for-arbitrary-torsion; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f3-finiteness-artin-vanishing-and-generic-acyclicity; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f45-rational-realization-and-finite-dimensional-cohomology; tauceti:TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison#layer-12-relative-comparison; tauceti:TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization#layer-10-adic-artin-comparison.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §3, definitions of the eigen-local-systems, pp.12–13. Defines the χ-eigensheaves of R^{N−2}π_* with coefficients ℤ[ζ_N]_λ and ℤ[ζ_N]/𝔫, and the Betti local system with its comparison.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, §4.1, p.40; insert the higher direct-image degree (E24). Defines V_λ as the H_0 = χ part of R^{N−2}π[1/l]_*O_{M_λ} (printed without R^{N−2}, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E21).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, pp. 26–28. Defines U_λ, U[𝔫], U_B for the self-dual character and the Betti comparison.


**Planet:** Dwork eigen-local-systems.

### DM.2/eigensheaf-duality — Poincaré duality between conjugate eigensheaves

**Theorem.** The cup product and the trace H^{2N−4}(Y_t) ≅ O(2 − N) restrict to perfect pairings V_{χ,λ} × V_{χ^{−1},λ} → O_λ(2 − N) between the χ- and χ^{−1}-eigensheaves (and likewise with O/𝔫 and Betti coefficients). Since N − 2 is odd the cup product on the middle cohomology is alternating, so the pairing satisfies ⟨y, x⟩ = −⟨x, y⟩ after exchanging the factors. In particular: (1) for the self-dual data (χ = χ^{−1} up to ς) the real forms V_λ carry perfect alternating pairings V_λ × V_λ → O^+_λ(2 − N); (2) complex conjugation c on the coefficients gives c-linear isomorphisms V_{c(λ)} ≅ V_λ^∨(2 − N) for Qian's data.

**Hypotheses and boundaries.**

- N odd (alternating middle cup product)
- coefficients with 2N invertible
- The Hesse cubic illustrates duality for the two inverse characters of H, not for nontrivial characters of H₀: H₀ acts trivially on its H¹.


**Proof outline.**

1. Poincaré duality for the smooth proper fibres is a perfect pairing on R^{N−2}π_*, alternating since N − 2 is odd, and H_0-invariant.
2. An invariant pairing pairs the χ-part with the χ^{−1}-part and kills χ-part × χ′-part for χ′ ≠ χ^{−1}; perfectness passes to the eigen-summands.
3. Composing with the coefficient conjugation, which exchanges χ and χ^{−1} = c ∘ χ, gives the c-linear self-duality.


**Checks and worked cases.**

- For the Hesse pencil (N = 3) the pairing on H¹ of an elliptic curve pairs the two eigenlines of μ_3.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; SchemeAndStackFoundations:SF.2; EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f6-smooth-purity-gysin-maps-and-cycle-classes.

**Sources and matches.**

- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, after Lemma 4.1, p. 27. The cup product induces perfect alternating pairings on V_λ((N − 1 − n)/2) with values in Z[ζ_N, 1/(2N)]^+_λ(1 − n).
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma4.2.4 proof pp.41–42, with E21; after Definition4.4.1 pp.46–47. Uses c-linear isomorphisms V_{c(λ)} ≅ V_λ^∨(1 − N), with the twist corrected to 2 − N (PAPER-BOXER-CALEGARI-GEE-ETAL-25/E7).
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma4.2.4 proof pp.41–42, with E21; after Definition4.4.1 pp.46–47. Poincaré duality on relative cohomology gives the pairing on W̄_λ.


### DM.2/self-dual-real-forms — Real forms of the self-dual Dwork eigensheaves

**Construction.** For the self-dual datum (n even, BLGHT11) let O^+ = ℤ[1/(2N), ζ_N]^+ and e = (1/(2#H_0))(ς + 1)∑_{ξ∈H_0}(χ(ξ) + χ(ξ)^{−1})ξ in O^+[H_0 ⋊ ⟨ς⟩]. Define V_λ = [e]_*R^{N−2}π_*O^+_λ, V[𝔫] = [e]_*R^{N−2}π_*(O^+/𝔫) and V_B = [e]_*R^{N−2}π̃_*O^+, for λ, 𝔫 of O^+. These are locally free of rank n, carry perfect alternating pairings V_λ((N − 1 − n)/2) × V_λ((N − 1 − n)/2) → O^+_λ(1 − n) (and mod 𝔫), and H_0-equivariant projection gives isomorphisms V_λ ⊗_{O^+} O ≅ U_λ, V[𝔫] ⊗ O ≅ U[𝔫], V_B ⊗ O ≅ U_B with the χ-eigensheaves of DM.2/dwork-eigensheaves. For n = 2, Qian uses these real forms in place of U_λ, U[𝔫], U_B; their residue fields k(λ) are those of O^+.

**Hypotheses and boundaries.**

- n even, N odd, N > n + 1
- 2N invertible (e has denominator 2#H_0 = 2N^{N−2}; for V_B the coefficient ring is O^+ = ℤ[1/(2N), ζ_N]^+, PAPER-QIAN-23/E25)
- The Betti stalks are finite projective over O⁺, with free λ-adic and finite coefficient realizations; locally free here is in the coefficient-ring sense. The Hesse boundary N=3,n=2 is excluded by N>n+1.


**Proof outline.**

1. e is an idempotent of O^+[H_0 ⋊ ⟨ς⟩] since ς normalises H_0 and swaps χ and χ^{−1}; it defines a self-correspondence of Y over T_0 × Spec O^+.
2. After extending scalars to O, e decomposes into the projections to the χ- and χ^{−1}-parts exchanged by ς, so projection to the χ-part is an isomorphism from the image of e.
3. The pairing of DM.2/eigensheaf-duality restricted to the image of e is O^+-valued and perfect.


**Checks and worked cases.**

- For n = 2 the real form V_λ has rank 2 over O^+_λ with a perfect alternating pairing, so its geometric monodromy lies in Sp_2 = SL_2.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.selfDualIdempotent | constructor | The idempotent e of O^+[H_0 ⋊ ⟨ς⟩]. |
| Dwork.realForm | constructor | V_λ := [e]_*R^{N−2}π_*O^+_λ, and V[𝔫], V_B likewise. |
| Dwork.realForm_baseChange_iso | equivalence | V_λ ⊗_{O^+_λ} O_λ ≅ U_λ by H_0-equivariant projection. |
| Dwork.realForm.pairing | data | The perfect alternating pairing on V_λ((N − 1 − n)/2) with values in O^+_λ(1 − n). |
| Dwork.realForm_mod | relation | V[𝔫] ≅ ∏ V_λ/λ^{a_λ}. |
| Dwork.realForm.rank | characterisation | V_λ is locally free of rank n. |


**Uses that determine the API.**

- BLGHT11 Proposition 4.2, Lemmas 4.6, 5.1, 5.3 (DM.5/residual-monodromy-sp, DM.7): symplectic monodromy and local Galois properties
- BLGGT14 proof of Theorem 3.1.2 (DM.9/self-dual-switching): the symplectic residual representations to be matched
- QIAN23 n = 2 (DM.5/two-prime-product-monodromy, DM.6): the case n = 2 of the switching theorem


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| realForm_rank_two | computation | For n = 2, V_λ has rank 2 over O^+_λ. |
| selfDualIdempotent_idempotent | characterisation | e² = e in O^+[H_0 ⋊ ⟨ς⟩]. |
| realForm_baseChange | compatibility | V_λ ⊗ O_λ ≅ U_λ, the χ-eigensheaf of DM.2/dwork-eigensheaves. |
| realForm_needs_two_inverted | non-example | Over ℤ[1/N, ζ_N]^+ (2 not inverted) e is not defined: its denominator is 2N^{N−2}, so the real form of V_B lives over ℤ[1/(2N), ζ_N]^+, not ℤ[ζ_N]^+. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum.

**Sources and matches.**

- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, the idempotent e, Lemma 4.1 and the pairings, pp. 25–27. Defines V_λ, V[𝔫] as images of the ς-symmetrised idempotent with coefficients in Z[1/(2N), ζ_N]^+, proves local freeness of rank n and the identification with U after extension of scalars, and gives the alternating pairings.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, after Proposition3.2, p.13. For n = 2 replaces U_λ, U[𝔫], U_B by BLGHT's real forms with coefficients in the real cyclotomic ring.


### DM.2/fermat-fibre-splitting — Splitting of the Fermat fibre into eigenlines

**Theorem.** Since H acts on Y_0, the fibres at t = 0 decompose as V_{λ,0} = ⊕_{i∈ℤ/Nℤ} V_{λ,i} and V[𝔫]_0 = ⊕ V_i[𝔫], where V_{λ,i} is the part on which H acts by χ_i : ξ ↦ ∏_j ξ_j^{a_j+i} (whose restriction to H_0 is χ). The summand V_{λ,i} is nonzero iff i ∈ B(a), and then it is free of rank one over O_λ (resp. O/𝔫). The corresponding Betti summands are finite projective of rank one over O, and one-dimensional after passing to ℚ(ζ_N); the same splitting holds, for the χ-part of H^{N−2}_dR(Y_0/K) (K ⊇ ℚ(ζ_N)), and for the self-dual real forms (summands U_{i,λ}, (N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2). For the quotient obtained by rescaling coordinate q, choose the orientation of the monodromy generator at t′=0 so that its action on this line is ζ_N^{a_q+i}. It is ζ_N^i when a_q=0, as for Qian’s last-coordinate choice for n>2 and the middle-coordinate self-dual choice.

**Hypotheses and boundaries.**

- Y_0 the Fermat fibre; coefficients contain 1/N and ζ_N


**Proof outline.**

1. The characters of H restricting to χ on H_0 are the χ_i, i ∈ ℤ/Nℤ.
2. χ_i has exponent vector (a_j + i)_j, all of whose entries are nonzero iff i ∈ B(a); apply DM.2/fermat-hypersurface-cohomology.
3. The deck transformation scales the chosen coordinate q. Its value on χ_i is ζ_N^{a_q+i}, up to reversing the peripheral orientation. The zero-coordinate choices give the displayed ζ_N^i formula.


**Checks and worked cases.**

- For Qian's datum with n = 3, the nonzero summands are V_{λ,1}, V_{λ,2}, V_{λ,N−3}.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §3, pp.12–13; proof of Lemma3.3(1), p.13. Decomposes V_{λ,0} and V[𝔫]_0 under H into the χ_i-parts and shows, by DMOS Proposition I.7.4, that they are nonzero, of rank one, exactly for i ∈ B.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 4.1(1), p. 26. U_{i,λ} is free of rank one for (N + 1 − n)/2 ≤ i ≤ (N − 1 + n)/2 and zero otherwise.


### DM.2/eigensheaf-rank — The Dwork eigensheaves are locally free of rank n

**Theorem.** For every rank-n Dwork exponent datum, the λ-adic sheaf V_λ and the finite-coefficient sheaf V[𝔫] are lisse with free stalks of rank n over O_λ and O/𝔫. The Betti systems V_B and V′_B have finite projective stalks of constant rank n over O, equivalently stalks locally free as O-modules. After scalar extension to ℚ(ζ_N), completion at λ, or reduction modulo 𝔫 they are free of rank n. The same claims, with O⁺ in place of O, hold for the self-dual real forms. No global O-basis is deduced solely from smoothness and properness.

**Hypotheses and boundaries.**

- Torsion-freeness of the integral middle cohomology of the fibres is used (PAPER-QIAN-23/E24).


**Proof outline.**

1. The sheaves are locally constant (smooth proper base change, Ehresmann) with torsion-free stalks (DM.2/integral-cohomology-torsion-free); a direct summand of a locally constant sheaf of finite free modules is locally free.
2. The rank is constant on the connected base and equals the rank at t = 0, which is #B = n by DM.2/fermat-fibre-splitting.
3. For V′_B on T′_0(ℂ), which does not contain the point t = 0, pull back along t ↦ t^N to V_B on T_0(ℂ) − {0} and use connectedness.
4. A finite projective module over a local ring is free, and O/𝔫 is a finite product of local rings. Over the global Dedekind rings O and O⁺ retain finite projectivity, rather than silently strengthening it to freeness.


**Checks and worked cases.**

- For Qian's datum with n = 3 the stalk V_{λ,t} is free of rank 3 over O_λ for every t ∈ T_0.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting; PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free; PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover; PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Proposition3.2, p.13. States that V_λ, V[𝔫], V_B and V′_B are locally free of rank n, checking the rank on the fibre at 0 with DMOS Proposition I.7.4.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 4.1(2), p. 27. V_λ (resp. V[𝔫]) is locally free of rank n, and V[𝔫] ≅ ∏ V_λ/λ^{a_λ}.


**Planet:** Rank of the Dwork motives.

## DM.3 — Katz's hypergeometric description


### DM.3/katz-hypergeometric-sheaf — Katz's hypergeometric sheaf attached to a Dwork exponent datum

**Construction.** Let M = ℚ(e^{2πi/N}), R_0 = ℤ[ζ_N, N^{−1}], T_1 = Spec R_0[x, x^{−1}, (1 − x)^{−1}] with open immersion j : T_1 → 𝔾_{m,R_0} and f : T_1 → 𝔾_m, x ↦ 1 − x. Let n≥1 and let ρ₁,…,ρ_n : μ_N→M× be distinct nontrivial characters. The construction does not require their product to be trivial. For a zero-shaped Dwork datum take the missing characters indexed by B(a), with the Kummer convention fixed by the trace formula below; the selected Qian and self-dual data also satisfy ∏ρ_i=1. For a place λ of M of residue characteristic l, let L_i be the rank-one lisse M_λ-sheaf on 𝔾_{m,R_0}[1/l] attached to ρ_i and the Kummer μ_N-torsor x ↦ x^N, F_i = j_!f^*L_i, and E_λ = j^*(F_1 ∗_! F_2 ∗_! ⋯ ∗_! F_n)[n − 1], where ∗_! is multiplicative convolution with compact support on 𝔾_{m,R_0}[1/l] (A ∗_! B = Rm_!(A ⊠ B) for the multiplication m : 𝔾_m × 𝔾_m → 𝔾_m).

**Hypotheses and boundaries.**

- ρ₁,…,ρ_n are distinct and nontrivial, n≥1. The extra condition ∏ρ_i=1 is imposed only for the pure-Tate determinant formula and the selected Dwork applications.
- l invertible on the base


**Proof outline.**

1. L_i is the ρ_i-isotypic part of the pushforward of the constant sheaf along the Kummer cover x ↦ x^N.
2. Multiplicative convolution with compact support is Rm_! of the external product; it is associative and commutative up to canonical isomorphism.
3. The shift [n − 1] places the convolution, restricted to T_1, in degree zero (DM.3/hypergeometric-sheaf-properties).


**Checks and worked cases.**

- n = 1: E_λ = j^*F_1 = L_{ρ_1}(1 − x) restricted to T_1, a Kummer sheaf of rank one.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.kummerSheaf | constructor | L_ρ on 𝔾_m[1/l] for a character ρ : μ_N → M_λ^×. |
| multiplicativeConvolution | constructor | A ∗_! B := Rm_!(A ⊠ B) on 𝔾_m. |
| multiplicativeConvolution_assoc | structure | ∗_! is associative and commutative up to canonical isomorphism. |
| Dwork.hypergeometricSheaf | constructor | E_λ := j^*(F_1 ∗_! ⋯ ∗_! F_n)[n − 1] on T_1[1/l]. |
| Dwork.hypergeometricSheaf_trace | simp | Trace of geometric Frobenius at x ∈ T_1(k) is (−1)^{n−1}∑_{x_1⋯x_n = x}∏ρ_i((1 − x_i)^{(q−1)/N}), with ρ_i(0) = 0. |
| Dwork.hypergeometricSheaf_baseChange | functoriality | Formation of E_λ commutes with base change along R_0[1/l] → k for finite fields k. |
| Dwork.hypergeometricSheaf_coeffChange | functoriality | For σ ∈ Gal(M/ℚ), σ carries E_λ for (ρ_i) to E_{σλ} for (σρ_i). |


**Uses that determine the API.**

- BCGNT25 Theorem 4.2.1 (DM.3/katz-dwork-comparison): the Dwork eigensheaf is a pullback of E_λ up to a character
- BCGNT25 Proposition 4.2.6 (DM.7/generic-crystalline-ordinarity): its trace formula detects ordinary points
- BLGHT11 Lemma 4.3(3) and QIAN23 Lemma 3.3(2) (DM.4/unipotent-monodromy-at-infinity): its local monodromy gives unipotence at ∞


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| hypergeometricSheaf_rank_one | degenerate | For n = 1, E_λ is the Kummer sheaf L_{ρ_1}(1 − x) on T_1, of rank one. |
| hypergeometricSheaf_trace_n_one | computation | For n = 1 the trace at x ∈ T_1(𝔽_q) is ρ_1((1 − x)^{(q−1)/N}). |
| hypergeometricSheaf_trace_sum | characterisation | For n = 2 the trace at x ∈ T_1(k) is −∑_{x_1x_2 = x} ρ_1((1 − x_1)^{(q−1)/N})ρ_2((1 − x_2)^{(q−1)/N}), a Jacobi-type sum. |
| extension_by_zero_nontrivial_boundary | non-example | For a nontrivial ρ the extensions j_!f*L_ρ and j_*f*L_ρ agree: the invariant stalk at x=1 is zero. For the trivial character they differ there, with j_! stalk zero and j_* stalk one-dimensional. This boundary test detects forgetting nontriviality. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f24-constructible-lower-shriek-and-arbitrary-base-change; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f27-compact-support-projection-and-künneth; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f45-rational-realization-and-finite-dimensional-cohomology.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, before Theorem4.2.1, p.41. Defines E_λ as the restriction to T_1 of the shifted multiplicative convolution with compact support of the sheaves j_!f^*L_i (the restriction is j^*, as recorded in the extraction's review).
- [KATZ09](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf), §5, the hypergeometric sheaf H_{V,W} and Theorem 5.3, pp. 95–97. Attaches to a Dwork-type family a hypergeometric sheaf H_can built from the lists of characters, and compares it with the primitive cohomology eigenpiece.
- [KATZ90](https://doi.org/10.1515/9781400882434), Chapter 8, as cited by BCGNT25 and BLGHT11; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Construction and properties of hypergeometric sheaves by multiplicative convolution.
- [DK17](https://arxiv.org/abs/1604.00660v11), Appendix A, §A.1.6 (arXiv v11). Comments on Katz's hypergeometric complexes and their relation to Dwork families.


### DM.3/hypergeometric-sheaf-properties — Basic properties of the hypergeometric sheaf

**Theorem.** In the setting of DM.3/katz-hypergeometric-sheaf: (1) E_λ is a lisse M_λ-sheaf of rank n on T_1[1/l]; E_λ ⊗ M̄_λ is geometrically irreducible; E_λ is pure of weight n − 1; and det E_λ ≅ M_λ(n(1 − n)/2) (using ∏ρ_i = 1). (2) For a finite field k with q elements that is an R_0[1/l]-algebra and x ∈ T_1(k), tr(Frob_k | E_{λ,x}) = (−1)^{n−1}∑_{x_1⋯x_n = x}∏_iρ_i((1 − x_i)^{(q−1)/N}), with μ_N identified with k^×[N] and ρ_i(0) = 0.

**Hypotheses and boundaries.**

- ρ_i distinct, nontrivial, ∏ρ_i = 1
- l invertible


**Proof outline.**

1. Lisse of rank n, geometric irreducibility and purity are Katz's theorems on hypergeometric sheaves (ESDE Chapter 8) applied to the convolution of the F_i.
2. The determinant is computed by Katz's determinant formula (ESDE Theorem 8.12.2(1a)), which gives a Tate twist when the product of the characters is trivial.
3. The trace formula follows from the Lefschetz trace formula for Rm_! and the definition of the F_i.


**Checks and worked cases.**

- For n=1 and a nontrivial ρ₁, the constructor and trace formula give the Kummer sheaf with trace ρ₁(1−x); this checks the general constructor only. It is outside this theorem’s product-one determinant hypothesis.
- For n=2 and (ρ,ρ⁻¹), ρ≠ρ⁻¹ and ρ≠1, the determinant is E(−1), so geometric determinant is trivial and geometric Frobenius has determinant q.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/katz-hypergeometric-sheaf; DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/CohomologicalPointCounting/TraceFormula#layer-11-grothendieck--lefschetz; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f45-rational-realization-and-finite-dimensional-cohomology.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Theorem4.2.1(1)–(2) and proof, p.41. States that E_λ is lisse of rank n, geometrically irreducible, pure of weight n − 1 with determinant M_λ(n(1 − n)/2), and gives the trace formula (4.2.2), citing Katz ESDE Chapter 8 and Theorem 8.12.2(1a).
- [KATZ90](https://doi.org/10.1515/9781400882434), Chapter 8, Theorem 8.12.2(1a), as cited by BCGNT25; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Properties and determinant of hypergeometric sheaves.
- [KATZ09](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf), §5, p. 95. The hypergeometric sheaf H_can attached to the lists of characters and its rank.


### DM.3/hypergeometric-local-monodromy — Local monodromy of the hypergeometric sheaf

**Theorem.** In the setting of DM.3/katz-hypergeometric-sheaf, the geometric local monodromy of E_λ ⊗ M̄_λ is: at x = 0, unipotent with a single Jordan block of size n (the n trivial characters at 0); at x = ∞, tame and isomorphic to ⊕_{i=1}^n L_{ρ_i} (the n distinct characters at ∞); at x = 1, a pseudo-reflection.

**Hypotheses and boundaries.**

- ρ_i distinct and nontrivial


**Proof outline.**

1. Katz's description of the local monodromy of a hypergeometric sheaf of type (n, n): at 0 it is ⊕ over the distinct characters of the list at 0 of the Kummer sheaf tensored with a unipotent block whose size is the multiplicity; at ∞ the same for the list at ∞; at 1 it is a pseudo-reflection (ESDE Theorem 8.4.2, cited as Theorem 8.4.11 in BLGHT11).
2. For E_λ the list at 0 consists of n copies of the trivial character (each F_i is lisse at 0 with trivial local monodromy) and the list at ∞ is ρ_1, …, ρ_n.


**Checks and worked cases.**

- n = 1: L_{ρ_1}(1 − x) is unramified at 0, has monodromy ρ_1 at ∞ and is a pseudo-reflection (a nontrivial character) at 1.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties.

**Sources and matches.**

- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.3(3), p. 30. Deduces unipotence of the monodromy at ∞ of the Dwork family from Katz, Another look at the Dwork family, Theorem 5.3, together with Katz ESDE Theorem 8.4.11.
- [KATZ90](https://doi.org/10.1515/9781400882434), Chapter 8, §8.4 (Theorem 8.4.2), as cited by BLGHT11 and BCGNT25; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Local monodromy of hypergeometric sheaves at 0, 1 and ∞.
- [KATZ09](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf), Lemma 8.8, p. 114. For the Dwork families, local monodromy at ∞ is a single unipotent Jordan block exactly when the primitive de Rham eigenpiece has rank n − 1 (its numbering), the hypergeometric reflection of the same fact.


### DM.3/katz-dwork-comparison — Katz's comparison of Dwork eigensheaves with hypergeometric sheaves

**Theorem.** Let U=T_0−{0}, j′:U→T_0 and g:U→T_1, t ↦ t^{−N}. For every place λ of M of residue characteristic l there is a unique continuous character Ψ_λ : π_1(Spec R_0[1/l]) → O_{M_λ}^× and an isomorphism of M_λ-sheaves on U[1/l]: (j′)^*V_λ ⊗ M_λ ≅ g^*E_λ ⊗ M_λ(Ψ_λ). Consequently the χ-eigensheaf V′ of the quotient family over T′_0 (DM.1/three-punctured-cover), whose pullback along t ↦ t^N is (j′)^*V_λ, is isomorphic to the pullback of E_λ along t′ ↦ 1/t′, twisted by Ψ_λ and by a Kummer character L_θ of order dividing N.

**Hypotheses and boundaries.**

- Qian's exponent datum (or any datum with n + 1 zeros, nonzero residues at most once)
- l invertible
- U is the punctured Dwork parameter line; T′₀ remains the quotient parameter line with coordinate t′=t^N from DM.1. These are distinct bases. The nonzero exponent multiplicities must be at most one and zero must have multiplicity n+1.


**Proof outline.**

1. Katz, Another look at the Dwork family, Theorem 5.3: on the complement of μ_d in the affine line, the primitive eigenpiece of a Dwork-type family is the d-th power pullback of a hypergeometric sheaf tensored with a character of π_1 of the base, provided the eigenpiece is nonzero; BCGNT25 specialises it to the present family, using [−1]^*H_can(trivial^n; ρ) ≅ H_can(ρ^{−1}; trivial^n).
2. Uniqueness of Ψ_λ follows from geometric irreducibility (DM.3/hypergeometric-sheaf-properties) and Schur's lemma.
3. Two lisse sheaves on T′_0 with isomorphic geometrically irreducible pullbacks along the μ_N-cover t ↦ t^N differ by a character of μ_N (Kummer twist).


**Checks and worked cases.**

- Ranks agree: both sides have rank n, the rank of V_λ (DM.2/eigensheaf-rank) and of E_λ.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank; PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover; mathlib:FundamentalGroup.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Theorem4.2.1(3) and proof, p.41. Gives the character Ψ_λ and the isomorphism (4.2.3) between (j′)^*V_λ and g^*E_λ twisted by Ψ_λ, from Katz 2009 Theorem 5.3, with uniqueness by Schur's lemma.
- [KATZ09](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf), Theorem 5.3, pp. 96–97, and Remark 5.4, p. 97. The primitive eigenpiece of the Dwork-type family is the d-th power pullback of a hypergeometric sheaf tensored with a character Λ of π_1 of the base; changing the representative changes H by a Kummer twist and a character.


**Planet:** Katz's hypergeometric comparison.

### DM.3/twisting-hecke-character — The twisting character comes from an algebraic Hecke character

**Theorem.** There is a Hecke character Ψ : ℚ(ζ_N)^×\𝔸^×_{ℚ(ζ_N)} → ℂ^× of type A_0, unramified away from N, with values of its finite part in M, such that for every λ the character Ψ_λ of DM.3/katz-dwork-comparison is the λ-adic character attached to Ψ. Moreover Ψ·c(Ψ) corresponds to ε^{n+1−N}, so Ψ is pure of weight N − n − 1 (the printed |·|^{N−n} is corrected as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E7; the sign of the exponent depends on the normalisation of the Artin map).

**Hypotheses and boundaries.**

- Correction E21: c-linear duality pairs V_{c(λ)} with V_λ∨(2−N).
- The recognition step is conditional on the local-algebraicity input in the recorded gap. Do not infer de Rhamness of Ψ from DM.7, which in turn uses this construction.


**Proof outline.**

1. For almost all places, the Frobenius traces of Ψ_λ are ratios of traces of V_λ and E_λ, which lie in M and are independent of λ (Katz–Messing for V_λ, the trace formula for E_λ); this is Katz's Question 5.5 argument.
2. Use R24.5/character-system for the converse recognition of finitely ramified algebraic/de Rham rank-one characters. The compatible Frobenius values alone do not check its local algebraicity hypothesis. Prove this hypothesis for the comparison character Ψ_λ, or supply the precise compatible-character version of Henniart used by BCGNT. This is the explicit character-recognition gap; AG2.0’s forward construction alone does not close it.
3. From the c-linear isomorphisms V_{c(λ)} ≅ V_λ^∨(2 − N) (DM.2/eigensheaf-duality) and E_{c(λ)} ≅ E_λ^∨(1 − n), Schur's lemma gives Ψ_λ·c(Ψ_λ) = ε^{n+1−N}.


**Checks and worked cases.**

- Weight check: V_λ has weight N − 2 and E_λ weight n − 1, so Ψ has weight (N − 2) − (n − 1) = N − n − 1.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality; PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective; PotentialModularityAndCompatibleSystems:R24.5/character-system; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma4.2.4 and proof, pp.41–42, with E21 and the explicit recognition-hypothesis gap. Shows Ψ_λ comes from a type A_0 Hecke character Ψ unramified away from N and defined over M, by λ-independence of traces, Henniart's theorem and c-linear dualities, with the weight relation corrected as E7.
- [KATZ09](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf), Question 5.5, p. 97. The traces of the character Λ are expected to be universal; for the invariant part they are ± 1.


### DM.3/twisted-dwork-local-system — The twisted Dwork local systems W_λ

**Construction.** For a place λ of M of residue characteristic l let W_λ = V_λ ⊗_{O_{M_λ}} O_{M_λ}(Ψ_λ^{−1}), a lisse sheaf of free O_{M_λ}-modules of rank n on T_0[1/l]. Then W_λ ⊗ M_λ is pure of weight n − 1, geometrically irreducible, with determinant M_λ(n(1 − n)/2). Write W_{t,λ} for its stalk at t, W̄_λ = W_λ ⊗ k(λ) and W̄_{t,λ} likewise. The family {W_λ} has λ-independent Frobenius traces with values in M.

**Hypotheses and boundaries.**

- Qian's exponent datum, n > 2 (BCGNT25 setting); Ψ from DM.3/twisting-hecke-character


**Proof outline.**

1. Twisting by the character Ψ_λ^{−1} of π_1(Spec R_0[1/l]) changes neither lisseness nor geometric monodromy.
2. On U=T₀−{0}, DM.3/katz-dwork-comparison gives W_λ⊗M_λ≅g*E_λ with g(t)=t⁻ᴺ:U→T₁. Thus purity and determinant follow from the hypergeometric properties, and irreducibility follows by the finite cyclic restriction argument below. Since U is dense open in the smooth connected T₀, π₁(U)→π₁(T₀) is surjective, so this also proves geometric irreducibility on T₀.
3. For geometric irreducibility after the finite cyclic pullback, first use semisimplicity for the pure sheaf and Clifford theory: isotypic pieces of the restriction to a normal finite-index subgroup are permuted transitively. A power of the monodromy at x=0 is still a single unipotent block. Its invariant decomposition forces one isotypic piece and multiplicity one, so the restriction is irreducible. Irreducibility does not follow merely by pulling back an irreducible sheaf along a finite cover.


**Checks and worked cases.**

- det W_λ ≅ M_λ(n(1 − n)/2), so the Hodge–Tate weights of any fibre sum to n(n − 1)/2.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.twistedSheaf | constructor | W_λ := V_λ ⊗ O(Ψ_λ^{−1}). |
| Dwork.twistedSheaf.det | characterisation | det W_λ ⊗ M_λ ≅ M_λ(n(1 − n)/2). |
| Dwork.twistedSheaf.pure | other | W_λ ⊗ M_λ is pure of weight n − 1. |
| Dwork.twistedSheaf.geometricallyIrreducible | other | W_λ ⊗ M̄_λ is geometrically irreducible. |
| Dwork.twistedSheaf.reduction | projection | W̄_λ := W_λ ⊗ k(λ), a lisse k(λ)-sheaf of rank n. |
| Dwork.twistedSheaf.geometric_eq | compatibility | W_λ and V_λ have the same geometric monodromy (restriction to π_1(T_{0,ℚ̄})). |
| Dwork.twistedSheaf_trace_independent | relation | For t ∈ T_0(O_{F_v}), v ∤ Nl, det(X − Frob_v \| W_{t,λ}) ∈ O_M[X] is independent of λ (DM.7/dwork-compatible-system). |


**Uses that determine the API.**

- BCGNT25 Proposition 4.2.5 (DM.7/dwork-compatible-system): the weakly compatible system with Hodge–Tate weights {0, …, n − 1}
- BCGNT25 Definition 4.4.1 (DM.5/level-structure-torsor): level structures on W̄_λ
- BCGNT25 proof of Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): R_aux and S_UA are fibres of W


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| twistedSheaf_HT_sum | computation | For every fibre the Hodge–Tate weights sum to n(n − 1)/2 (determinant M_λ(n(1 − n)/2)); for n = 3 the sum is 3. |
| twistedSheaf_geometric_monodromy_eq | compatibility | The image of π_1(T_{0,ℚ̄}) under W̄_λ equals that under V̄_λ. |
| twistedSheaf_rank | degenerate | W_λ has rank n, the rank of V_λ. |
| twistedSheaf_ne_eigenSheaf | non-example | W_λ ≇ V_λ in general: their fibres have Hodge–Tate weights {0, …, n − 1} versus {M_τ, …, M_τ + n − 1} with M_τ ≠ 0 for some τ when N > n + 1. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison; PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank; PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy; DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, after Lemma4.2.4, p.42. Defines W_λ = V_λ ⊗ O_{M_λ}(Ψ_λ^{−1}) and records that it is pure of weight n − 1, geometrically irreducible, with determinant M_λ(n(1 − n)/2).


**Planet:** Twisted Dwork motives W.

## DM.4 — Complex monodromy


### DM.4/dwork-monodromy-representations — The Dwork monodromy representations and peripheral loops

**Construction.** Fix τ : ℚ(ζ_N) ↪ ℂ with τ(ζ_N) = e^{2πi/N}, a base point t ∈ T_0(ℂ) − {0} and t′ = t^N ∈ T′_0(ℂ). Let ρ_t : π_1(T_0(ℂ), t) → GL(V_{B,t}) and ρ_{t′} : π_1(T′_0(ℂ), t′) → GL(V′_{B,t′}) be the monodromy representations, with V′_{B,t′} = V_{B,t}. Choose loops γ_0, γ_1, γ_∞ around 0, 1, ∞ generating π_1(T′_0(ℂ), t′) freely on two of them, with the single relation γ_0γ_1γ_∞ = 1, and orient γ_0 so that its image in the deck group of T_0(ℂ) − {0} → T′_0(ℂ) is e^{2πi/N} = τ(ζ_N). On the index-N normal subgroup π_1(T_0(ℂ) − {0}, t), ρ_{t′} restricts to ρ_t composed with π_1(T_0(ℂ) − {0}, t) ↠ π_1(T_0(ℂ), t). For λ a prime of O (of O^+ for the real forms), ρ̄_t and ρ̄_{t′} denote the reductions on V_{B,t}/λ.

**Hypotheses and boundaries.**

- Self-dual data: the same with BLGHT11's Ṽ_B on T̃_0 = T′_0


**Proof outline.**

1. The local system V′_B gives ρ_{t′}; the identification of its pullback with V_B|_{T_0(ℂ)−{0}} (DM.2/dwork-eigensheaves) gives the restriction statement.
2. π_1 of the thrice-punctured sphere is free on two peripheral loops with the product relation (Tau Ceti BelyiMaps, layer 5); the covering t ↦ t^N corresponds to the kernel of the map to ℤ/N sending γ_0 ↦ 1, γ_1 ↦ 0.
3. BelyiMaps §5.6 uses p₁p₀p_∞=1 with p*q=q.trans p. To use the convention γ₀γ₁γ_∞=1 here, take γ₀=p₀, γ₁=p₀⁻¹p₁p₀ and γ_∞=p_∞. This only conjugates a peripheral generator. Carry this change of basis through the hypergeometric triple and its monodromy representation.


**Checks and worked cases.**

- ρ_{t′}(γ_0)^N lies in the image of ρ_t (it is the monodromy of V_B around t = 0, which is trivial since V_B is lisse at 0).


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.monodromy | constructor | ρ_t : π_1(T_0(ℂ), t) →* GL(V_{B,t}). |
| Dwork.monodromyQuotient | constructor | ρ_{t′} : π_1(T′_0(ℂ), t′) →* GL(V′_{B,t′}). |
| Dwork.peripheralLoops | data | γ_0, γ_1, γ_∞ ∈ π_1(T′_0(ℂ), t′) with γ_0γ_1γ_∞ = 1 and γ_0 oriented by τ(ζ_N). |
| Dwork.monodromyQuotient_restrict | compatibility | ρ_{t′} restricted to π_1(T_0(ℂ) − {0}, t) is ρ_t ∘ (inclusion-induced surjection). |
| Dwork.monodromy_reduction | projection | ρ̄_t and ρ̄_{t′} modulo a prime λ. |
| Dwork.monodromy_conj_basepoint | functoriality | Changing the base point conjugates the representations by parallel transport. |


**Uses that determine the API.**

- QIAN23 Lemmas 3.3–3.7 (DM.4, DM.5): the monodromy computations
- BLGHT11 Lemma 4.3, Corollaries 4.4–4.8 (DM.4, DM.5): the symplectic analogues
- QIAN23 Proposition 3.8 (DM.5/level-structure-torsor-irreducible): transitivity of monodromy on the torsor fibres


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| peripheral_relation | characterisation | γ_0γ_1γ_∞ = 1 in π_1(T′_0(ℂ), t′), and γ_0, γ_1 generate it freely. |
| monodromy_index_N | computation | π_1(T_0(ℂ) − {0}, t) has index N in π_1(T′_0(ℂ), t′), the kernel of γ_0 ↦ 1, γ_1 ↦ 0 in ℤ/N. |
| monodromy_trivial_rank_zero | degenerate | For the zero local system the representation is trivial on the zero space (the construction is functorial in the local system). |
| orientation_matters | non-example | With the opposite orientation of γ_0 the eigenvalues of ρ_{t′}(γ_0) become ζ_N^{−b}, b ∈ B; since −B ≠ B for Qian's data, the orientation convention is not cosmetic. |
| peripheral_composition_dictionary | compatibility | Substituting γ₀=p₀ and γ₁=p₀⁻¹p₁p₀ into γ₀γ₁γ_∞ gives p₁p₀p_∞=1, exactly the current BelyiMaps relation. The unchanged triple p₀,p₁,p_∞ need not satisfy the packet’s order. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.1/three-punctured-cover; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank; tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group; mathlib:FundamentalGroup.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §3, basepoints, loops and representations, p.13. Defines ρ_t and ρ_{t′}, the generators γ_0, γ_1, γ_∞ with γ_0γ_1γ_∞ = 1, and orients γ_0 through the deck group.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, p. 29. The fundamental group of T̃_0(ℂ) is generated by γ_0, γ_1, γ_∞ with the single relation γ_0γ_1γ_∞ = 1, giving ρ_et into Sp_n(Ṽ_B).


### DM.4/monodromy-at-zero — Monodromy at zero: eigenvalues ζ_N^b, b ∈ B

**Theorem.** ρ_{t′}(γ_0) has characteristic polynomial ∏_{b∈B}(X − ζ_N^b), with distinct roots; in particular det ρ_{t′}(γ_0) = ζ_N^{∑B} = 1. For the self-dual data, ρ_et(γ_0) has characteristic polynomial ∏_{j=(N−n+1)/2}^{(N+n−1)/2}(X − ζ_N^j).

**Hypotheses and boundaries.**

- γ_0 oriented as in DM.4/dwork-monodromy-representations
- Use the selected Qian data with a_N=0, or the middle-coordinate self-dual quotient with zero exponent. For a general quotient coordinate q the eigenvalues are ζ_N^{a_q+b}, and determinant one need not hold.


**Proof outline.**

1. γ_0 acts on V′_{B,t′} as the deck transformation ζ_N acts on the fibre of V_B at 0, by parallel transport to t = 0 inside T_0(ℂ).
2. On the eigenline V_{B,i} (i ∈ B) this is multiplication by ζ_N^i (DM.2/fermat-fibre-splitting).


**Checks and worked cases.**

- n = 3, N = 401: ρ_{t′}(γ_0) has eigenvalues ζ, ζ², ζ^{398}.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.3(1), p.13. Computes the characteristic polynomial of ρ_{t′}(γ_0) from the H-action on the fibre at 0 and DMOS Proposition I.7.4.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 4.3(1) and proof, pp. 29–30. The self-dual analogue.


### DM.4/picard-lefschetz-at-one — Monodromy at one: Picard–Lefschetz

**Theorem.** ρ_{t′}(γ_1) is unipotent with (ρ_{t′}(γ_1) − 1)² = 0 and ρ_{t′}(γ_1) − 1 of rank at most one (a transvection once it is nontrivial). More precisely: the fibre Y_1 has N^{N−2} ordinary double points forming one free H_0-orbit; with Δ the set of vanishing cycles (one per singular point, permuted by H_0 up to sign) the monodromy T around t = 1 on H^{N−2}(Y_t(ℂ), ℤ) is x ↦ x + ε∑_{δ∈Δ}⟨x, δ⟩δ (ε = ±1 depending on N); since N − 2 is odd, the cup product is alternating and vanishing cycles at distinct points are orthogonal, so (T − 1)² = 0; on the χ-part, T − 1 has image in the line spanned by ∑_{ξ∈H_0}χ(ξ)^{−1}ξδ_0. This node proves unipotence, (T − 1)² = 0 and rank(ρ_{t′}(γ_1) − 1) ≤ 1; that the rank is exactly one is proved in DM.4/companion-model-of-monodromy, after the monodromy at ∞ is known. For the self-dual data the same argument gives characteristic polynomial (X − 1)^n and dim ker(ρ(γ_1) − 1) ≥ n − 1.

**Hypotheses and boundaries.**

- N odd
- t′ ↦ t^N étale near t = 1, so ρ_{t′}(γ_1) is conjugate to the restriction of T


**Proof outline.**

1. Locate the singular points of Y_1 (DM.1/dwork-pencil) and apply the Picard–Lefschetz formula for ordinary double points in a proper family over a disc (LefschetzPencilsAndVanishingCycles LPV.2, complex comparison and odd relative dimension).
2. H_0 commutes with the monodromy and permutes Δ up to sign, so on the χ-eigenpart the variation factors through one functional x ↦ ⟨x, δ_0⟩.
3. Odd fibre dimension makes ⟨δ, δ′⟩ = 0 for all vanishing cycles, so (T − 1)² = 0 on all of H^{N−2}; this replaces BLGHT's symplectic step, which does not apply to the non-self-dual χ-part (PAPER-QIAN-23/E28).


**Checks and worked cases.**

- For the Hesse pencil (N = 3) the monodromy around t = 1 on H¹ of the elliptic fibre is a transvection with three vanishing cycles permuted by μ_3.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil; PotentialAutomorphyDworkMotivesPartII:DM.0/pseudo-reflection; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality; LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula; LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison; LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.3(3), pp.13–14. Asserts that ρ_{t′}(γ_1) is a transvection, referring to BLGHT11 Lemma 4.3(2).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.3(2), p. 30. Picard–Lefschetz theory gives an H_0-orbit Δ of vanishing cycles, the exact sequence and the formula x ↦ x ± ∑⟨x, δ⟩δ, whence ker(γ_1 − 1) has rank ≥ n − 1 on each eigenpart.


### DM.4/unipotent-monodromy-at-infinity — Monodromy at infinity is unipotent

**Theorem.** ρ_{t′}(γ_∞) is unipotent, with characteristic polynomial (X − 1)^n, and so is the local monodromy of ρ_t around t = ∞ (which is conjugate to ρ_{t′}(γ_∞)^{±N}). This holds for Qian's data and for the self-dual data.

**Hypotheses and boundaries.**

- gcd(n, N) = 1
- The v1 proof of Qian Lemma3.3(2), pp.13–14, establishes only the unipotence after taking the N-th power; the proof below uses Katz’s comparison (E13).


**Proof outline.**

1. By DM.3/katz-dwork-comparison, V′ ≅ (pullback of E_λ along t′ ↦ 1/t′) ⊗ Ψ_λ ⊗ L_θ with Ψ_λ geometrically trivial and L_θ a Kummer character of order dividing N. The point t′ = ∞ corresponds to x = 0, where E_λ has unipotent local monodromy with one Jordan block (DM.3/hypergeometric-local-monodromy). Hence ρ_{t′}(γ_∞) = c·u with u unipotent with one Jordan block and c a scalar with c^N = 1 (after the Betti–étale comparison of DM.2/dwork-eigensheaves).
2. det ρ_{t′}(γ_0) = 1 (DM.4/monodromy-at-zero) and ρ_{t′}(γ_1) is unipotent by the Picard–Lefschetz description (the unipotence part of DM.4/picard-lefschetz-at-one does not use this node), so det ρ_{t′}(γ_∞) = 1 and c^n = 1.
3. gcd(n, N) = 1 gives c = 1. The local monodromy of V_B at t = ∞ is ρ_{t′}(γ_∞)^{±N}, unipotent; this agrees with the semistable-model argument of QIAN21 Lemma 2.1 and the local monodromy theorem.


**Checks and worked cases.**

- For the self-dual datum with n = 2, ρ(γ_∞) has characteristic polynomial (X − 1)² and determinant 1.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison; PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero; PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one; PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations; LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.3(2), pp.13–14; the quotient-unipotence proof needs the repair recorded in E13. States that ρ_{t′}(γ_∞) has characteristic polynomial (X − 1)^n; the printed proof via a semistable blowup of the reciprocal family and Illusie's local monodromy theorem yields unipotence only for the N-th power (E27).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 4.3(3) and its proof, p. 30. Proves the self-dual case from Katz 2009 Theorem 5.3 and Katz ESDE Theorem 8.4.11.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Theorem4.2.1(3), p.41. The comparison (4.2.3) with the hypergeometric sheaf, used here for the non-self-dual data.


### DM.4/companion-model-of-monodromy — Companion-matrix model of the Dwork monodromy

**Theorem.** ρ_{t′}(γ_1) − 1 has rank exactly one, so ρ_{t′}(γ_1) is a transvection. Let A and B be the companion matrices of (X − 1)^n and ∏_{b∈B}(X − ζ_N^{−b}), both in GL_n(ℤ[ζ_N]), and ρ : π_1(T′_0(ℂ), t′) → GL_n(ℤ[ζ_N]) the representation γ_0 ↦ B^{−1}, γ_∞ ↦ A, γ_1 ↦ BA^{−1}. Then ρ_{t′} ⊗ ℂ (coefficients extended along τ) is equivalent to ρ ⊗ ℂ, and ρ(γ_1) − 1 has rank one with nonzero entries only in the first column. The same holds for the self-dual data with B the companion matrix of ∏_{j=(N−n+1)/2}^{(N+n−1)/2}(X − ζ_N^j), and then ρ is irreducible (BLGHT11 Corollary 4.4).

**Hypotheses and boundaries.**

- Qian's data (n > 2) or the self-dual data


**Proof outline.**

1. If ρ_{t′}(γ_1) = 1 then ρ_{t′}(γ_0) = ρ_{t′}(γ_∞)^{−1} would have eigenvalue 1, contrary to DM.4/monodromy-at-zero (0 ∉ B) and DM.4/unipotent-monodromy-at-infinity; with DM.4/picard-lefschetz-at-one the rank of ρ_{t′}(γ_1) − 1 is exactly one.
2. ρ_{t′}(γ_∞) has characteristic polynomial (X − 1)^n (DM.4/unipotent-monodromy-at-infinity), ρ_{t′}(γ_0)^{−1} has characteristic polynomial ∏(X − ζ_N^{−b}) (DM.4/monodromy-at-zero), with no common root since 0 ∉ B, and ρ_{t′}(γ_1) is a pseudo-reflection (DM.4/picard-lefschetz-at-one).
3. Levelt's theorem (DM.0/levelt-rigidity) conjugates (ρ_{t′}(γ_0), ρ_{t′}(γ_∞)) to (B^{−1}, A).
4. BA^{−1} − 1 has rank one by DM.0/companion-normal-form.


**Checks and worked cases.**

- n = 3: A = C((X − 1)³) has columns e_2, e_3, (1, −3, 3)ᵀ.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/levelt-rigidity; PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form; PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero; PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity; PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.4 and proof, p.14. Defines ρ by companion matrices and proves ρ_{t′} ≅ ρ over ℂ by Beukers–Heckman Theorem 3.5.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Corollary 4.4, p. 31. The self-dual analogue, with irreducibility from Beukers–Heckman Proposition 3.3.


### DM.4/maximal-unipotent-monodromy-at-infinity — Maximally unipotent monodromy at infinity

**Theorem.** ρ_{t′}(γ_∞) has minimal polynomial (X − 1)^n: it is a single unipotent Jordan block. Hence the local monodromy of ρ_t around t = ∞, conjugate to ρ_{t′}(γ_∞)^{±N}, is also a single unipotent Jordan block (a nonzero power of a single unipotent Jordan block in characteristic 0 is again one; in positive characteristic a power can split, so this is a statement over ℂ or ℚ̄_l). The same holds for the self-dual family (BLGHT11 Corollary 4.5 and Proposition 4.2(2)) and, by coefficient conjugation, for every Galois conjugate σχ of the character.

**Hypotheses and boundaries.**

- characteristic 0 coefficients for the statement about the N-th power


**Proof outline.**

1. By DM.4/companion-model-of-monodromy, ρ_{t′}(γ_∞) is conjugate to A = C((X − 1)^n), whose minimal polynomial is (X − 1)^n (DM.0/companion-normal-form); alternatively this follows directly from DM.3/hypergeometric-local-monodromy.
2. If u = 1 + ν with ν nilpotent of order n, then u^m − 1 = mν(1 + …) has the same nilpotency order when m is invertible.
3. The automorphism σ of the coefficients carries the χ-eigensheaf onto the σχ-eigensheaf compatibly with monodromy (DM.2/dwork-eigensheaves).


**Checks and worked cases.**

- n = 2: ρ(γ_∞) = [[0, −1], [1, 2]], conjugate to [[1, 1], [0, 1]].
- In the boundary case N = n + 1 = 5 (excluded here, treated in HSBT10), the H_0-invariant part of the Dwork quintic family has a single unipotent Jordan block of size 4 at t = ∞, the classical large complex structure point.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/companion-model-of-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.0/companion-normal-form; PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Corollary3.5, p.14. ρ_{t′}(γ_∞) has minimal polynomial (X − 1)^n, and so does the monodromy around ∞ under ρ_t.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Corollary 4.5 and Proposition 4.2(2), pp. 27–31. The self-dual analogue: the monodromy at infinity is unipotent with one Jordan block.


**Planet:** Maximally unipotent monodromy at infinity.

### DM.4/residual-monodromy-absolutely-irreducible — Absolute irreducibility of the residual monodromy

**Theorem.** Let λ be a prime of O (of O^+ for the self-dual data) of odd residue characteristic l ∤ N. Then the reduction ρ̄_{t′} : π_1(T′_0(ℂ), t′) → GL(V′_{B,t′}/λ) is absolutely irreducible and isomorphic to the reduction ρ̄ of the companion representation; ρ̄_{t′}(γ_1) is a transvection, ρ̄_{t′}(γ_∞) is unipotent and ρ̄_{t′}(γ_0) has the n distinct eigenvalues ζ_N^b mod λ, b ∈ B.

**Hypotheses and boundaries.**

- l odd and prime to N
- λ ∤ N ensures ζ_N^b ≢ 1 mod λ for b ∈ B


**Proof outline.**

1. Reduce the characteristic polynomials of DM.4/monodromy-at-zero and DM.4/unipotent-monodromy-at-infinity modulo λ; ρ̄_{t′}(γ_1) − 1 has rank ≤ 1, and = 1 since otherwise ρ̄(γ_0) = ρ̄(γ_∞)^{−1} would have eigenvalue 1.
2. Apply DM.0/hypergeometric-group-irreducible: ρ̄(γ_∞) and ρ̄(γ_0)^{−1} have no common eigenvalue.
3. Apply Levelt’s theorem directly over the residue field (DM.0/levelt-rigidity). The reduced triple has the two prescribed disjoint spectra and rank-one displacement at 1, so it is simultaneously conjugate to the reduced companion triple. This supplies the actual isomorphism without an unlisted Brauer–Nesbitt input or a claim that integral lattices are conjugate.


**Checks and worked cases.**

- For n = 3, l = 3, N = 401 the reduction mod a prime above 3 has no invariant line or plane.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.0/hypergeometric-group-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.4/companion-model-of-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero; PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity; PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one; PotentialAutomorphyDworkMotivesPartII:DM.0/levelt-rigidity.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, after Definition3.6, p.15. Shows ρ̄ is absolutely irreducible by the Beukers–Heckman argument and identifies ρ̄_{t′} with it by equality of traces.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proof of Lemma 4.6, p. 31. The self-dual analogue.


## DM.5 — Residual monodromy and level-structure torsors


### DM.5/residual-monodromy-sl — Full special linear residual monodromy

**Theorem.** Let n > 2, Qian's datum, l an odd prime prime to N, λ a prime of O = ℤ[1/(2N), ζ_N] above l, so k(λ) = 𝔽_{l^r} with r the order of l mod N; if r is even assume N ∤ l^{r/2} + 1, equivalently −1 ∉ ⟨l⟩ ⊂ (ℤ/Nℤ)^×. Then ρ̄_{t′}(π_1(T′_0(ℂ), t′)) = SL(V′_{B,t′}/λ) ≅ SL_n(k(λ)) and ρ̄_t(π_1(T_0(ℂ), t)) = SL(V_{B,t}/λ) for every t ∈ T_0(ℂ). Equivalently the geometric monodromy of V[λ] (and of W̄_λ) is SL_n(k(λ)).

**Hypotheses and boundaries.**

- n > 2
- N ∤ l^{r/2} + 1 when r is even
- l odd, l ∤ N


**Proof outline.**

1. The normal closure Δ of γ_1 has cyclic quotient generated by γ_0 (or γ_∞); the index of ρ̄(Δ) in the image divides both N (order of ρ̄(γ_0)) and a power of l (order of the unipotent ρ̄(γ_∞)), so the image is generated by transvections.
2. It is absolutely irreducible (DM.4/residual-monodromy-absolutely-irreducible); by DM.0/zalesskii-serezhkin-classification it is conjugate to SL_n(k), Sp_n(k) or SU(n, k) for k ⊆ k(λ).
3. A proper subfield would make the eigenvalue set {ζ^b} of ρ̄(γ_0) stable under l^m with l^m ≢ 1 mod N, i.e. l^mB = B; Sp_n(k(λ)) would force B = −B; SU(n, k(λ)) would force l^{r/2}B = −B. DM.1/asymmetric-stabiliser-trivial excludes all three, the last with N ∤ l^{r/2} + 1.
4. π_1(T_0(ℂ) − {0}) is normal of index N in π_1(T′_0(ℂ)), so ρ̄_t has image normal in SL_n(k(λ)) with cyclic quotient of order dividing N; the cyclic composition factors of SL_n(k(λ)) have order dividing n (DM.0/special-linear-unitary-simple) and gcd(N, n) = 1.


**Checks and worked cases.**

- If l ≡ 1 mod N then k(λ) = 𝔽_l, r = 1 is odd, and the residual monodromy of V[λ] is SL_n(𝔽_l); this is the case of the auxiliary prime l′ in the switching theorem.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification; PotentialAutomorphyDworkMotivesPartII:DM.1/asymmetric-stabiliser-trivial; PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations; PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero; PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.6 with proof, pp.15–16 (published Lemma3.7). Proves that the residual monodromy on T′_0 and on T_0 is SL_n(k(λ)) under N ∤ l^{r/2} + 1, by the transvection argument, Zalesskii–Serezhkin and Lemma 3.1; the first assertion is stated for n > 2 only (PAPER-QIAN-23/E31).


**Planet:** Full residual monodromy SL_n.

### DM.5/residual-monodromy-sp — Full symplectic residual monodromy of the self-dual family

**Theorem.** For the self-dual data (n even) and a nonzero prime λ of O^+ = ℤ[ζ_N, 1/(2N)]^+, the reduction of ρ_et on Ṽ_B/λ has image Sp(Ṽ_{B,t̃}/λ), and for every t ∈ T_0(ℂ) the map π_1(T_0(ℂ), t) → Sp(V_{B,t}/λ) is surjective. For n = 2 this gives SL_2(k(λ)) = Sp_2(k(λ)) on T_0(ℂ); the corresponding statement for Qian’s last-coordinate Y′ quotient is false for n=2; the BLGHT middle-coordinate quotient does have full Sp₂ monodromy (PAPER-QIAN-23/E31).

**Hypotheses and boundaries.**

- n even; λ a prime of the real cyclotomic ring, k(λ) its residue field (degree over 𝔽_l not necessarily the order of l mod N)


**Proof outline.**

1. Absolute irreducibility as in DM.4/residual-monodromy-absolutely-irreducible; generation by elements with characteristic polynomial (X − 1)^n and fixed space of dimension ≥ n − 1 as in DM.5/residual-monodromy-sl.
2. Zalesskii–Serezhkin (for n > 2) leaves SL_n(k), Sp_n(k), SU(n, k); the alternating pairing excludes SL_n and SU for n > 2 (a diagonal element of SU(n, k(λ)) not conjugate into Sp_n), and the field of traces is k(λ) because αB ≠ B for α ≠ ±1 (BLGHT11's argument).
3. On T_0(ℂ): the quotient by the index-N normal subgroup is cyclic of order dividing N, and the cyclic composition factors of Sp_n(𝔽_{l^r}) have order 2 or 3 (3 only for Sp_2(𝔽_3)), prime to N.


**Checks and worked cases.**

- n = 2: the residual monodromy of the real form mod λ is SL_2(k(λ)).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification; PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms; PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations.

**Sources and matches.**

- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 4.6 and Corollary 4.7 with proofs, pp. 31–33. The residual monodromy of the self-dual family is the full symplectic group, on T̃_0 and on T_0.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, after Proposition3.2 p.13; Lemma3.6 proof p.15. Uses BLGHT11 Corollary 4.7 (and Lemma 4.6) for the case n = 2.


### DM.5/hermitian-poincare-pairing — The skew-Hermitian Poincaré pairing on the residual Dwork local system

**Construction.** Let n > 2, Qian's datum, and λ a place of M above l ∤ 2N with −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^× (equivalently, the Frobenius of k(λ) over 𝔽_l contains complex conjugation c on μ_N). Then Poincaré duality on the relative cohomology with O_{M^+_λ}-coefficients, extended sesquilinearly to O_{M_λ}, and the Ψ-twist give a perfect 𝔽_l-bilinear pairing ⟨·,·⟩ : W̄_λ × W̄_λ → k(λ)(1 − n) with ⟨ax, y⟩ = a⟨x, y⟩, ⟨x, ay⟩ = c(a)⟨x, y⟩ and ⟨y, x⟩ = −c⟨x, y⟩, i.e. skew-Hermitian for k(λ)/k(λ)^c. Consequently the pairing places geometric monodromy in U_n(k(λ)); the trivial determinant supplied by DM.3/twisted-dwork-local-system further places it in SU_n(k(λ)) (after DM.0/hermitian-forms-unique), and every fibre W̄_{t,λ} is conjugate self-dual with multiplier ε̄^{1−n}.

**Hypotheses and boundaries.**

- −1 ∈ ⟨l⟩ mod N (the 'unitary case'); n > 2, N odd


**Proof outline.**

1. DM.2/eigensheaf-duality pairs the χ-part with the χ^{−1}-part; c sends χ to χ^{−1}, and when c ∈ Gal(k(λ)/𝔽_l) the composition with the coefficient automorphism c gives a sesquilinear self-pairing of V̄_λ.
2. The middle cup product is alternating (N − 2 odd), which gives ⟨y, x⟩ = −c⟨x, y⟩; the twist by Ψ_λ^{−1} and the relation Ψ·c(Ψ) = ε^{n+1−N} (DM.3/twisting-hecke-character) shift the values from k(λ)(2 − N) to k(λ)(1 − n).
3. Choose η≠0 of trace zero and multiply the skew-Hermitian form by η. Its isometry group becomes the usual U_n after choosing an orthonormal basis. The determinant formula det W_λ=M_λ(n(1−n)/2) from DM.3 is geometrically trivial; this additional argument gives SU_n, independently of the later determinant-descends node.


**Checks and worked cases.**

- If l ≡ −1 mod N then k(λ) = 𝔽_{l²} and c is the Frobenius x ↦ x^l of 𝔽_{l²}.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.unitaryPairing | constructor | The pairing ⟨·,·⟩ : W̄_λ × W̄_λ → k(λ)(1 − n) in the unitary case. |
| Dwork.unitaryPairing.skewHermitian | characterisation | ⟨ax, y⟩ = a⟨x, y⟩, ⟨x, ay⟩ = c(a)⟨x, y⟩, ⟨y, x⟩ = −c⟨x, y⟩. |
| Dwork.unitaryPairing.perfect | other | The pairing is perfect on every stalk. |
| Dwork.unitaryPairing.equivariant | functoriality | π_1(T_0[1/l]) acts by similitudes with multiplier ε̄^{1−n}. |
| Dwork.unitaryPairing.stalk | projection | The induced pairing ⟨·,·⟩_{W̄_{t,λ}} on each fibre. |
| Dwork.unitaryPairing_det | relation | The pairing induced on ∧^n W̄_λ is a Hermitian-up-to-η form on a line, compatible with det W̄_λ ≅ ε̄^{−n(n−1)/2}. |


**Uses that determine the API.**

- BCGNT25 Definition 4.4.1(3) (DM.5/level-structure-torsor): level structures in the unitary case must respect it
- BCGNT25 Proposition 4.4.2 (DM.5/residual-monodromy-su): it confines the geometric monodromy to SU_n
- BCGNT25 Lemma 4.4.4 (DM.7/fermat-fibre-inertia-at-minus-one): orthogonality of the Fermat eigenlines


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| unitaryPairing_unitary_case_minus_one | computation | For l ≡ −1 mod N, k(λ) = 𝔽_{l²} and the pairing is skew-Hermitian for 𝔽_{l²}/𝔽_l. |
| unitaryPairing_absent_split_case | degenerate | If l ≡ 1 mod N, then c ∉ ⟨l⟩ and no such self-pairing exists: W̄_λ pairs with the χ^{−1}-sheaf, a different local system (residual monodromy SL_n, DM.5/residual-monodromy-sl). |
| unitaryPairing_skew | characterisation | ⟨x, x⟩ ∈ ker(1 + c) for every x. |
| unitaryPairing_not_bilinear | non-example | The pairing is not k(λ)-bilinear: ⟨x, ay⟩ = c(a)⟨x, y⟩ ≠ a⟨x, y⟩ for a ∉ k(λ)^c. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality; PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system; PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character; PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-form; PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique; PotentialAutomorphyDworkMotivesPartII:DM.0/finite-unitary-group.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, after Definition4.4.1, pp.46–47. When −1 mod N lies in ⟨l_i⟩ there is a perfect pairing on W̄_{λ_i} with values in k(λ_i)(1 − n) satisfying the same two conditions, from Poincaré duality on the relative cohomology with O_{M^+_λ}-coefficients extended sesquilinearly.


### DM.5/residual-monodromy-su — Full special unitary residual monodromy in the unitary case

**Theorem.** Let n > 2, Qian's datum, l ∤ 2N with −1 ∈ ⟨l⟩ mod N and λ | l a place of M. Then the image of the geometric monodromy group π_1(T_{0,ℚ̄}) acting on W̄_λ is SU_n(k(λ)) for the skew-Hermitian structure of DM.5/hermitian-poincare-pairing.

**Hypotheses and boundaries.**

- n > 2, gcd(N, n) = 1
- −1 ∈ ⟨l⟩ ⊂ (ℤ/Nℤ)^×


**Proof outline.**

1. The image lies in SU_n(k(λ)) by DM.5/hermitian-poincare-pairing.
2. Run the argument of DM.5/residual-monodromy-sl: generation by transvections, Zalesskii–Serezhkin, exclusion of proper subfields and of Sp_n by DM.1/asymmetric-stabiliser-trivial; the remaining possibility is SU(n, k(λ)), now allowed.
3. The monodromy of T_0 is normal of index dividing N in that of T′_0; SU_n(k(λ)) is perfect with cyclic composition factors of order dividing n (DM.0/special-linear-unitary-simple), and gcd(N, n) = 1, so the image on T_0 is all of SU_n(k(λ)).


**Checks and worked cases.**

- For l ≡ −1 mod N and n = 3 the geometric monodromy of W̄_λ is SU_3(𝔽_{l²}).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing; PotentialAutomorphyDworkMotivesPartII:DM.4/residual-monodromy-absolutely-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification; PotentialAutomorphyDworkMotivesPartII:DM.1/asymmetric-stabiliser-trivial; PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.4.2 and proof, p.47. In the case −1 mod N ∈ ⟨l_i⟩ the proof of Qian's Lemma 3.7 gives a subgroup of SU_n of index dividing N, hence all of SU_n(k(λ_i)) since N is prime to n.


### DM.5/determinant-descends — The determinant of the Dwork local systems is geometrically constant

**Theorem.** For every nonzero ideal 𝔫 of O (of O^+ for the self-dual data), the rank-one lisse sheaf ∧^n V[𝔫] on (T_0)_F, F ⊇ ℚ(ζ_N), has trivial geometric monodromy, hence is the pullback of a character of G_F, determined by its stalk at t = 0. The same holds for ∧^n V_λ and for ∧^n W̄_λ (which is ε̄^{−n(n−1)/2}). This is descent of the determinant, not triviality of the arithmetic character.

**Hypotheses and boundaries.**

- T_0 geometrically connected over F


**Proof outline.**

1. The geometric fundamental group of T′_0 is generated by γ_0, γ_1, γ_∞, whose images have determinant 1 (DM.4/monodromy-at-zero, DM.4/picard-lefschetz-at-one, DM.4/unipotent-monodromy-at-infinity); this persists after reduction and restriction to the finite-index subgroup of T_0.
2. A lisse sheaf on a geometrically connected F-variety with trivial geometric monodromy is the pullback of a G_F-representation (the homotopy exact sequence π_1^geom → π_1 → G_F); its value is read off at the F-point t = 0.


**Checks and worked cases.**

- For n = 3 and 𝔫 = λ, ∧³V[λ] is the character of G_F by which G_F acts on the top exterior power of the Fermat fibre.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/monodromy-at-zero; PotentialAutomorphyDworkMotivesPartII:DM.4/picard-lefschetz-at-one; PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank; DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f0a2-the-arithmetic-fundamental-group-sequence.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, after Lemma3.6, p.16. The monodromy of ∧^n V[𝔫] restricted to the geometric fundamental group is trivial because det(γ_0) = det(γ_1) = det(γ_∞) = 1, so it factors through G_F.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Theorem4.2.1(1) p.41; definition of W p.42. det W_λ ≅ M_λ(n(1 − n)/2).


### DM.5/level-structure-torsor — Moduli of level structures on Dwork local systems

**Construction.** Let F ⊇ ℚ(ζ_N) be a number field, l_1 ≠ l_2 primes not dividing 2N, λ_i places of M above l_i, and Λ = W̄_{λ_1} × W̄_{λ_2} (or V[𝔫] for 𝔫 = λ_1λ_2, or the self-dual V[𝔫]((N − 1 − n)/2) over O^+). Level-structure data are: (1) étale sheaves U_i on Spec F of free k(λ_i)-modules of rank n (i.e. continuous representations of G_F); (2) isomorphisms η_i : ∧^nW̄_{λ_i} ≅ ∧^nU_i over (T_0)_F (possible by DM.5/determinant-descends exactly when the determinant characters agree); (3) in the unitary case −1 ∈ ⟨l_i⟩, a perfect 𝔽_{l_i}-bilinear skew-Hermitian pairing U_i × U_i → k(λ_i)(1 − n), with η_i compatible with the pairings induced on ∧^n (in the self-dual case, a perfect alternating pairing with multiplier ε^{1−n} matching that of V[𝔫]). The functor T({U_i}) on (T_0)_F-schemes S, sending S to pairs of isomorphisms φ_i : W̄_{λ_i,S} ≅ U_{i,S} with ∧^nφ_i = η_i and preserving the pairings in the unitary (resp. symplectic) case, is represented by a finite étale (T_0)_F-scheme, a torsor under the finite étale group scheme SL(W̄_{λ_1}) × SL(W̄_{λ_2}) (resp. SU, Sp). This covers Qian's T_W (U_1 × U_2 = W, n > 2, split case), BLGHT11's T_W with the symplectic condition added in BLGGT14, and BCGNT25's T({U_{λ_i}}) (Definition 4.4.1, with places of M and the compatibility of η_i with the pairings, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E22–E23). For one prime l ≡ 1 mod N write T(r̄_λ); for two primes ≡ ±1 mod N write T(r̄_{λ_1}, r̄_{λ_2}).

**Hypotheses and boundaries.**

- η_i compatible with the pairings in the unitary case (otherwise the functor can be empty)
- the U_i are given as Galois representations of G_F


**Proof outline.**

1. Étale locally both W̄ and U are constant and η is multiplication by a unit; the solutions form a coset of SL_n (resp. SU_n, Sp_n) inside GL_n, so the functor is an étale sheaf, locally constant with finite values.
2. Locally constant sheaves of finite sets on (T_0)_F are representable by finite étale covers (equivalently, finite π_1-sets); the group-scheme action is simply transitive.
3. Apply EtaleCohomologyFoundations §F.0.2: the finite set of coefficient-linear isomorphisms is a continuous π₁-set, so it gives a finite étale cover. The pairing and determinant conditions cut out a π₁-stable subset. Its geometric fibres are the specified simply transitive classical-group sets when nonempty. R09.4 supplies the abstract torsor terminology; coherent O-module Isom schemes of R09.2 are not the construction used here.


**Checks and worked cases.**

- If U_i = W̄_{λ_i,t_0} for an F-point t_0, the identity is an F-point of T({U_i}) above t_0.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.LevelData | structure | The data (U_i, η_i, pairings) for one or two primes. |
| Dwork.levelTorsor | constructor | The finite étale (T_0)_F-scheme T({U_i}) representing the functor. |
| Dwork.levelTorsor.finiteEtale | instance | T({U_i}) → (T_0)_F is finite étale. |
| Dwork.levelTorsor.point_iff | characterisation | For a field K ⊇ F and t ∈ T_0(K), a K-point of T({U_i}) over t is a G_K-equivariant isomorphism W̄_{λ_i,t} ≅ U_i\|G_K with the prescribed determinant and pairing compatibility. |
| Dwork.levelTorsor.torsor | structure | T({U_i}) is a torsor under ∏ SL(W̄_{λ_i}) (SU in the unitary case, Sp for the self-dual data). |
| Dwork.levelTorsor.baseChange | functoriality | Formation commutes with extension of F and with base change on T_0. |
| Dwork.levelTorsor.single | constructor | T(r̄_λ) for one prime λ, l ≡ 1 mod N, and r̄_λ with determinant ε̄^{−n(n−1)/2}. |


**Uses that determine the API.**

- QIAN23 Proposition 3.8 and §4 (DM.5/level-structure-torsor-irreducible, DM.9/qian-switching-theorem): Moret-Bailly produces points on its Weil restriction
- BLGGT14 Theorem 3.1.2 (DM.9/self-dual-switching): the symplectic version
- BCGNT25 Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): T(r̄_{CM,𝔯}) and T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q})


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| levelTorsor_degree | computation | For one prime λ with k(λ) = 𝔽_l, the degree of T(r̄_λ) over T_0 is #SL_n(𝔽_l); for n = 3, l = 7 it is 7³(7² − 1)(7³ − 1) = 5630688. |
| levelTorsor_point_at_fibre | characterisation | If U = W̄_{λ,t_0} with η the identity, then t_0 lifts to an F-point of T(U). |
| levelTorsor_empty_if_det_mismatch | degenerate | If det U ≇ det W̄_λ as G_F-characters there is no η, and the data are not defined (the torsor is not constructed for such U). |
| levelTorsor_needs_pairing | non-example | In the unitary case, dropping the pairing condition gives a torsor under SL_n(k(λ)) on which the geometric monodromy SU_n(k(λ)) acts with [SL_n(k(λ)) : SU_n(k(λ))] > 1 orbits, so the scheme is not geometrically connected (the reason for BLGGT14's correction of BLGHT11 in the symplectic case). |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends; PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system; PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing; PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-rank; AlgebraicModuliForArithmeticGeometry:R09.4/isom-torsor; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, before Proposition3.7, p.16. Defines T_W(S) as the isomorphisms W_S ≅ V[𝔫]_S with top exterior power φ_S and asserts representability (it is in fact finite étale).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, the cover T_W, p. 27. Defines the finite étale cover T_W of isomorphisms W_S ≅ V[𝔫]((N − 1 − n)/2)_S.
- [BLGGT14](https://arxiv.org/abs/1010.2561v4), Proof of Theorem 3.1.2, pp. 43–44 (arXiv v4). Corrects BLGHT11: the isomorphisms in T_W must be compatible with the symplectic structures.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Definition4.4.1 and Remark4.4.3, pp.46–48, with E25–E26. Defines the data (1)–(3), the functor of pairs of isomorphisms respecting η_i and the pairings, its finite étale representing scheme, and the notations T(r̄_{λ_1}, r̄_{λ_2}) and T(r̄_λ).


**Planet:** Level-structure torsors T_W.

### DM.5/two-prime-product-monodromy — Residual monodromy at two primes is the full product

**Theorem.** Let l_1 ≠ l_2 be primes not dividing 2N with max(l_1, l_2) > 10, λ_i | l_i, and suppose each factor's geometric monodromy is the full group H_i ∈ {SL_n(k(λ_i)) (n > 2, −1 ∉ ⟨l_i⟩), SU_n(k(λ_i)) (n > 2, −1 ∈ ⟨l_i⟩), Sp_n(k(λ_i)) (self-dual data)}. Then for every t ∈ T_0(ℂ) the geometric monodromy π_1(T_0(ℂ), t) → H_1 × H_2 is surjective.

**Hypotheses and boundaries.**

- l₁≠l₂ odd, prime to N, max(l₁,l₂)>10. This allows the small factor Sp₂(𝔽₃), which must not be called perfect.


**Proof outline.**

1. Each projection is surjective (DM.5/residual-monodromy-sl, DM.5/residual-monodromy-su, DM.5/residual-monodromy-sp).
2. Relabel so that l₁>10. H₁ is perfect and each nontrivial quotient has its nonabelian simple projective quotient as a composition factor. Artin’s comparison rules out that simple factor among those of H₂. If H₂=Sp₂(𝔽₃), it is solvable, with only cyclic factors of orders 2 and 3, so it cannot share a nontrivial quotient with H₁. In all other cases use its usual projective simple factor. Goursat’s lemma now gives the full product; perfectness of H₂ in the exceptional case is neither asserted nor needed.


**Checks and worked cases.**

- For Qian's switching (l, l′ with l′ ≡ 1 mod N, l′ > 2ln + 5 > 10) the hypotheses hold with H_2 = SL_n(𝔽_{l′}).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sl; PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-su; PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sp; PotentialAutomorphyDworkMotivesPartII:DM.0/product-of-simple-images; PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Proposition3.7 with proof, p.16 (published Proposition3.8). By Lemma 3.7, Goursat's lemma, the normal subgroups of SL_n and Artin's theorem, the monodromy surjects onto SL_n(k(𝔓_1)) × SL_n(k(𝔓_2)).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Corollary 4.8 and proof, p. 33. The symplectic analogue for square-free 𝔫 whose prime factors have distinct residue characteristics.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Proposition4.4.2, p.47. The product of SL_n and SU_n factors, by Lemma 5.2.3 and Goursat's lemma.


### DM.5/level-structure-torsor-irreducible — The level-structure torsors are geometrically irreducible

**Theorem.** Under the hypotheses of DM.5/two-prime-product-monodromy (and for one prime l ≡ 1 mod N), with level data as in DM.5/level-structure-torsor (pairings compatible with η_i in the unitary case; symplectic compatibility in the self-dual case), the scheme T({U_i}) is a smooth, geometrically irreducible F-variety. This is Qian's Proposition 3.8, BLGHT11 Proposition 4.2(1) with BLGGT14's correction, and BCGNT25 Proposition 4.4.2 with the compatibility proviso.

**Hypotheses and boundaries.**

- η_i compatible with the pairings in the unitary case (PAPER-BOXER-CALEGARI-GEE-ETAL-25/E23)
- two primes with max > 10, or one prime l ≡ 1 mod N


**Proof outline.**

1. T({U_i}) is finite étale over the smooth geometrically connected (T_0)_F, hence smooth; it is geometrically connected iff π_1(T_{0,ℚ̄}) acts transitively on a geometric fibre.
2. A geometric fibre is a torsor under ∏H_i (the groups preserving determinant and pairing), and the geometric monodromy surjects onto ∏H_i (DM.5/two-prime-product-monodromy), so it acts transitively.
3. A smooth connected variety over a field of characteristic 0 is irreducible.


**Checks and worked cases.**

- For one prime l ≡ 1 mod N with k(λ) = 𝔽_l, T(r̄_λ) is geometrically irreducible because the monodromy of W̄_λ is SL_n(𝔽_l) (BCGNT25 Remark 4.4.3).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor; PotentialAutomorphyDworkMotivesPartII:DM.5/two-prime-product-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sl; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Proposition3.7, p.16. T_W is geometrically connected, by transporting one point to another along a path whose monodromy is ψ_2ψ_1^{−1}.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Proposition 4.2(1), p. 27. T_W is geometrically connected for square-free 𝔫 with distinct residue characteristics.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.4.2 and Remark4.4.3, pp.47–48. T({U_{λ_i}}) is a geometrically irreducible smooth F-scheme; T(r̄_λ) likewise for one prime l ≡ 1 mod N.


**Planet:** Geometric irreducibility of T_W.

## DM.6 — Frobenius, Gauss sums and determinants


### DM.6/fermat-frobenius-gauss-sums — Frobenius on the Fermat eigenlines is a product of Gauss sums

**Theorem.** Let F ⊇ ℚ(ζ_N), v a finite place of F of residue characteristic p ∤ Nl with residue field of q elements, ψ : 𝔽_q → ℚ̄_l^× a nontrivial additive character and t : μ_N(𝔽_q) ≅ μ_N(ℚ̄_l) the identification through the place. For a ∈ ℤ/Nℤ put g(v, a) = −∑_{x∈𝔽_q^×} t(x^{(1−q)/N})^a ψ(x) (so g(v, 0) = 1). Then for i ∈ B(a) the geometric Frobenius at v acts on the eigenline V_{λ,i} of the Fermat fibre by the scalar q^{−1}∏_{j=1}^N g(v, a_j + i), which is independent of ψ; for i ∉ B(a) the eigenspace is zero.

**Hypotheses and boundaries.**

- v ∤ Nl
- geometric Frobenius on cohomology


**Proof outline.**

1. The Fermat fibre has good reduction at v and the eigenspace decomposition commutes with Frobenius (DM.2/fermat-fibre-splitting).
2. Weil's computation of the zeta function of the Fermat hypersurface by Jacobi sums, written as products of Gauss sums (Deligne, Hodge cycles, §7, Proposition 7.10), gives the eigenvalue on each character line; ψ-independence follows because ∑_j(a_j + i) ≡ 0 mod N.
3. The Lefschetz trace formula over 𝔽_{q^m} for the elements of H identifies the eigenvalues.


**Checks and worked cases.**

- N = 3, the line with character (1, 1, 1) of the Fermat cubic: Frobenius acts by q^{−1}g(v, 1)³, which is a Jacobi sum of a cubic character up to sign, of complex absolute value √q.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology; FiniteFieldsAndCharacterSums:FF.1/gauss-sum-product-and-multi-jacobi-sum; FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions; mathlib:gaussSum; mathlib:jacobiSum.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, proof of Lemma3.8, p.17 (published Lemma3.9). Frobenius acts on V_{λ,i} by q^{−1}∏_j g(v, a_j + i), with the Gauss sum defined through a fixed additive character, citing Deligne Proposition I.7.10.
- [DMOS82](https://www.jmilne.org/math/Documents/Deligne82.pdf), Updated author chapter (1 October 2018), §7, Proposition7.10, pp.48–50. Frobenius eigenvalues on the character lines of the cohomology of Fermat hypersurfaces are products of Gauss sums.


### DM.6/dwork-determinant-gauss-formula — Gauss-sum formula for the determinant of the Dwork motive

**Theorem.** For v ∤ Nl of odd residue characteristic with q = #k(v): det(Frob_v | V_{λ,0}) = q^{−n}∏_{b∈B}∏_{j=1}^{N} g(v, a_j + b) = q^{n(N−n−2)/2}(∏_{b∈B} g(v, b))^n. Equivalently ∏_{b∈B}∏_j g(v, a_j + b) = (∏_{b∈B} g(v, b))^n q^{n(N−1)/2 − n(n−1)/2}. By DM.5/determinant-descends this computes the character det V[λ] of G_F at Frob_v.

**Hypotheses and boundaries.**

- residue characteristic of v odd and prime to Nl (so (q − 1)/N is even)


**Proof outline.**

1. For Qian's data the residues a_j + b (j = 1, …, N) run over b itself n + 1 times (from the n + 1 zeros) and over every s ≠ −b′, b′ ∈ B, at most once; regroup the double product as (∏g(v, b))^n · (∏_{s≠0}g(v, s))^n / ∏_{i≠j} g(v, b_j − b_i).
2. Use g(v, a)g(v, −a) = (−1)^{a(q−1)/N}q = q for a ≠ 0 (q − 1 even, N odd; Mathlib gaussSum_mul_gaussSum_eq_card) to evaluate ∏_{s≠0} g(v, s) = q^{(N−1)/2} and ∏_{i≠j} g(v, b_j − b_i) = q^{n(n−1)/2}.
3. Combine with the factor q^{−n} of DM.6/fermat-frobenius-gauss-sums.


**Checks and worked cases.**

- Weight check: |g(v, b)| = √q, so |det| = q^{n(N−n−2)/2}·q^{n²/2} = q^{n(N−2)/2}, consistent with purity of weight N − 2 in rank n.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/fermat-frobenius-gauss-sums; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum; mathlib:gaussSum_mul_gaussSum_eq_card.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.8, formula(3.1), pp.17–18. Rewrites the determinant of Frobenius on V_{λ,0} as (∏g(v, b_j))^n(q^{(N−1)/2})^n/q^{n(n−1)/2} times q^{−n}, using g(v, a)g(v, −a) = q for odd residue characteristic.


### DM.6/gauss-product-descent — The Gauss-sum product descends to the cyclotomic coefficients

**Theorem.** For v ∤ Nl of residue characteristic p: ∏_{b∈B} g(v, b) ∈ ℚ_l(ζ_N). For the self-dual data with n = 2 (B = −B), g(v, b_1)g(v, b_2) ∈ ℚ_l(ζ_N)^+ = ℚ_l(ζ_N + ζ_N^{−1}).

**Hypotheses and boundaries.**

- ∑_{b∈B} b ≡ 0 mod N
- for n = 2: B = −B


**Proof outline.**

1. An automorphism σ of ℚ̄_l fixing ℚ_l(ζ_N) acts on p-th roots of unity by ζ_p ↦ ζ_p^a, a ∈ 𝔽_p^×; substituting x ↦ a^{−1}x gives σ(g(v, b)) = t(a^{(q−1)/N})^b g(v, b), and the product over B picks up t(a^{(q−1)/N})^{∑b} = 1.
2. For n = 2 let σ fix ℚ_l(ζ_N)^+; it acts on μ_N by ζ ↦ ζ^{±1} and on μ_p by some a; then σ(g(v, b)) = t(a^{(q−1)/N})^{±b}g(v, ±b), and the product over B = −B with b_1 + b_2 ≡ 0 is invariant. No σ fixing ζ_p need exist (the printed proof assumes one; PAPER-QIAN-23/E33).


**Checks and worked cases.**

- n = 2, l = 3, N = 301, p = 5: no σ ∈ G_{ℚ_3(ζ_N)^+} inverts ζ_N and fixes ζ_5, yet the argument above applies.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/fermat-frobenius-gauss-sums; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum; ClassicalArithmeticCompletion:CA.7/continuation/gauss-galois-compatibility.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.8, formulas(3.2)–(3.3), p.18. Shows ∏g(v, b_j) ∈ ℚ_l(ζ_N) since ∑b_j ≡ 0, and for n = 2 that it lies in ℚ_l(ζ_N)^+ using B = −B.


### DM.6/determinant-nth-power — The determinant of the residual Dwork motive is an n-th power up to 𝔽_{l²}

**Theorem.** Let F ⊇ ℚ(ζ_N) and λ a prime above l of O (of O^+ when n = 2), k(λ) its residue field. The character det V[λ] of G_F (DM.5/determinant-descends) takes values in (𝔽_{l²}^× k(λ)^×)^n ⊂ 𝔽̄_l^×; it takes values in (k(λ)^×)^n when 𝔽_{l²} ⊆ k(λ).

**Hypotheses and boundaries.**

- determinant read at t = 0
- the factor q^{n(N−n−2)/2} is an n-th power after a quadratic coefficient extension when n is even


**Proof outline.**

1. By Chebotarev it suffices to evaluate at Frobenius elements at v ∤ 2Nl; DM.6/dwork-determinant-gauss-formula gives q^{n(N−n−2)/2}(∏g(v, b))^n.
2. ∏g(v, b) is λ-integral in ℚ_l(ζ_N) (resp. ℚ_l(ζ_N)^+) by DM.6/gauss-product-descent, so its reduction lies in k(λ).
3. q^{n(N−n−2)/2} = (q^{(N−n−2)/2})^n when N − n is even, and otherwise (√q)^{n(N−n−2)} with √q in 𝔽_{l²}.


**Checks and worked cases.**

- If l ≡ 1 mod N and n odd, the character takes values in (𝔽_l^×)^n.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/dwork-determinant-gauss-formula; PotentialAutomorphyDworkMotivesPartII:DM.6/gauss-product-descent; PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends; tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.8 with proof, pp.16–18. The determinant of V[λ] as a G_F-representation lands in (𝔽_{l²}^× k(λ)^×)^n.


### DM.6/determinant-matching-at-l — Matching determinants at the coefficient prime l

**Theorem.** Let n = l^a m with l ∤ m, F a CM field, M = F(ζ_N), r̄ : G_F → GL_n(𝔽_{l^s}) continuous, and λ | l a prime of O (of O^+ when n = 2) whose residue field k(λ) contains 𝔽_{l²} and all m-th roots of all elements of 𝔽_{l^s}. Then (i) det r̄ takes values in (k(λ)^×)^n; (ii) det V[λ] (a character of G_M) takes values in (k(λ)^×)^n; (iii) the character det V[λ] ⊗ (det r̄|_{G_M})^{−1} takes values in (k(λ)^×)^n; (iv) μ_m(𝔽̄_l) ⊂ k(λ), so m | #k(λ)^× and the n-th power map on k(λ)^× has kernel μ_m. Thus the finite-coefficient root problem has exponent m; applying Qian Lemma 2.1 requires the finite-coefficient strengthening requested from ArithmeticGaloisDuality R02.4 (the paper requires n | #k(λ)^× instead, which fails when l | n; PAPER-QIAN-23/E5).

**Hypotheses and boundaries.**

- k(λ) ⊇ 𝔽_{l²} and all m-th roots of elements of 𝔽_{l^s}


**Proof outline.**

1. For x ∈ 𝔽_{l^s}^× pick y ∈ k(λ) with y^m = x; the l^a-th power map is bijective on k(λ)^×, so y = z^{l^a} and x = z^n.
2. DM.6/determinant-nth-power with 𝔽_{l²} ⊆ k(λ) gives (ii); (iii) follows; (iv) applies the hypothesis to x = 1.
3. The l^a-power automorphism of k× makes the n-th-root and m-th-root problems equivalent. The requested supplier result must produce a root valued in k× after a totally real base change, with the avoidance condition and simultaneous roots needed in DM.9. A root in Q̄_l× alone does not imply a root in this fixed finite field.


**Checks and worked cases.**

- n = l = 3, s = 1: m = 1, so every character into (k(λ)^×)^3 = k(λ)^× already has a cube root, and the condition n | #k(λ)^× of the published text would wrongly fail.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-nth-power; ArithmeticGaloisDuality:R02.4/character-roots-after-base-change; ArithmeticGaloisDuality:R02.4/character-root-obstruction.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §4, pp.21–22; Lemma2.1 pp.5–8. Applies Lemma 3.9 over F(ζ_N) to see that det V[λ] ⊗ (det r̄)^∨ has image in (k(λ)^×)^n, under conditions on N giving 𝔽_{l²} and the m-th roots inside k(λ).
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §4, pp.21–22; Lemma2.1 pp.5–8. n-th roots of (𝔽_{l^r}^×)^n-valued characters after a totally real base change avoiding a given field; the atlas plans it in ArithmeticGaloisDuality R02.4.


### DM.6/determinant-matching-at-auxiliary-prime — Matching determinants at the auxiliary prime l′ ≡ 1 mod N

**Theorem.** Let l′ be an odd prime with l′ ≡ 1 mod N and λ′ | l′ a prime of O (of O^+ when n = 2), so k(λ′) = 𝔽_{l′} and ℚ(ζ_N)_{λ′} = ℚ_{l′}. For v ∤ 2Nl′ with q = #k(v) and geometric Frobenius Frob_v: (i) det(Frob_v | V_{λ′,0})·q^{−n(n−1)/2} = (q^{(N−2n−1)/2}∏_{b∈B} g(v, b))^n, with q^{(N−2n−1)/2}∏g(v, b) ∈ ℤ_{l′}^×; equivalently det V_{λ′} ⊗ ε_{l′}^{n(n−1)/2} takes the value (q^{(N−2n−1)/2}∏g(v, b))^n at Frob_v. (ii) Hence for every continuous r̄′ : G_F → GL_n(𝔽_{l′}) with det r̄′ = ε̄_{l′}^{−n(n−1)/2}, the character (det r̄′|_{G_M})^{−1} ⊗ det V[λ′] takes values in (𝔽_{l′}^×)^n. (iii) If moreover l′ ≡ 1 mod n, then μ_n ⊂ 𝔽_{l′} and the finite-coefficient root theorem requested from ArithmeticGaloisDuality R02.4 applies with exponent n. The printed argument uses the statement of Lemma 3.9 (values only in (𝔽_{l′²}^×)^n) and the sign det r̄′ = ε̄^{+n(n−1)/2}; the cancellation in (i), the sign and the sufficient congruence l′ ≡ 1 mod n are the corrections PAPER-QIAN-23/E6, E9, E7.

**Hypotheses and boundaries.**

- l′ ≡ 1 mod N (and mod n for (iii))
- ε_{l′}^{−1}(Frob_v) = q for geometric Frobenius


**Proof outline.**

1. (i) is a rearrangement of DM.6/dwork-determinant-gauss-formula: q^{n(N−n−2)/2}·q^{−n(n−1)/2} = (q^{(N−2n−1)/2})^n, with N odd making the exponent an integer; the base is an l′-adic unit because |g(v, b)|_{l′} = 1 for v ∤ l′.
2. ε_{l′}^{−n(n−1)/2}(Frob_v) = q^{n(n−1)/2}, so (det r̄′)^{−1} cancels the remaining power of q; the reduction of the base lies in 𝔽_{l′}.
3. μ_n ⊂ 𝔽_{l′} when l′ ≡ 1 mod n; such primes with l′ ≡ 1 mod Nn have positive density.
4. The congruence modulo n is a sufficient way to meet Qian Lemma 2.1, not a necessary condition for existence of a root. If gcd(n,l′−1)=1, powering is an automorphism and every finite-field-valued character already has a unique n-th root. In general one can instead use d=gcd(n,l′−1) in the finite-field root obstruction.


**Checks and worked cases.**

- For r̄′ = Sym^{n−1} r̄_{E_0,l′} with r̄_{E_0,l′} = H¹_ét(E_0, 𝔽_{l′}) (determinant ε̄^{−1}) the hypothesis det r̄′ = ε̄^{−n(n−1)/2} holds.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/dwork-determinant-gauss-formula; PotentialAutomorphyDworkMotivesPartII:DM.6/gauss-product-descent; PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends; ArithmeticGaloisDuality:R02.4/character-roots-after-base-change.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §4, p.22; formula(3.1), pp.17–18. Applies Lemma 3.9 at λ′ to the character (det Sym^{n−1}r̄_{E,l′})^∨ ⊗ det V[λ′], with the corrections recorded as E6, E7 and E9.


### DM.6/frobenius-polynomials-independent — Frobenius polynomials of Dwork fibres are integral and independent of λ

**Theorem.** Let F/ℚ(ζ_N) be a number field, v a finite place of F of residue characteristic l′ ∤ N, and t ∈ T_0(O_{F_v}). For every place λ of M of residue characteristic ≠ l′, W_{t,λ} (and V_{t,λ}) is unramified at v, and Q_v(X) = det(X − Frob_v | W_{t,λ}) has coefficients in M, integral at every λ whose residue characteristic differs from l′, and is independent of λ. Full O_M-integrality is concluded after the crystalline argument in DM.7.

**Hypotheses and boundaries.**

- t ∈ T_0(O_{F_v}), i.e. t integral with t^N − 1 a unit (good reduction)


**Proof outline.**

1. Y_t is smooth and proper over O_{F_v}; smooth proper base change makes H^{N−2}_ét(Y_{t,F̄_v}, O_{M_λ}) unramified and identifies it with the cohomology of the special fibre.
2. For each h∈H₀, apply Katz–Messing Theorem 2(1)–(2), pp. 76–77, to the algebraic correspondence given by h composed with a Frobenius power and the rational Künneth projector. Its traces on the required cohomological degree are rational and independent of the cohomology theory. Taking the finite character-weighted sum of these traces gives M-valued traces on e_χ, hence characteristic polynomials by Newton identities. The Hecke-character twist is compatible in λ by DM.3/twisting-hecke-character. RD.7 is requested to include this equivariant form, not just the untwisted total polynomial.
3. The finite free O_{M_λ}-lattices give integrality at all λ∤l′. This node does not yet give integrality at λ|l′. After crystalline comparison, DM.7 uses the nonnegative filtration jumps of W and weak admissibility to supply that last input; no prerequisite from DM.6 back to DM.7 is used here.


**Checks and worked cases.**

- deg Q_v = n and the roots of Q_v have complex absolute value q_v^{(n−1)/2} (purity of weight n − 1).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system; PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/CohomologicalPointCounting/TraceFormula#layer-11-grothendieck--lefschetz; tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f45-rational-realization-and-finite-dimensional-cohomology.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.2.5(1) with proof, pp.42–43; integrality completed only in DM.7 (E27). W_{t,λ} is unramified at v and Q_v has coefficients in O_M independent of λ, by smooth proper base change and Katz–Messing Theorem 2(2).
- [KM74](https://www.math.mcgill.ca/goren/SeminarOnCohomology/Katz-Messing.pdf), Theorem2(1)–(2), pp.76–77; rational projectors and algebraic correspondences. For a smooth projective variety over a finite field with a finite group action, characteristic polynomials of h·Frob on ℓ-adic cohomology have integral coefficients independent of ℓ.


## DM.7 — p-adic Hodge theory and local monodromy of the fibres


### DM.7/twisted-de-rham-eigenspaces — Twisted de Rham eigenspaces of the Dwork family

**Construction.** Let H_dR = H^{N−2}_dR(Y/(T_0 × ℚ(ζ_N))), locally free with Hodge filtration F^j by local direct summands. For σ ∈ Gal(ℚ(ζ_N)/ℚ) put H_{dR,σ} = H_dR ⊗_{σ^{−1}, ℚ(ζ_N)} ℚ(ζ_N) (the right factor viewed as coefficients) and V_{dR,σ} = e_χ H_{dR,σ}, the χ-eigensheaf for H_0 acting through the coefficients, with filtration F^jV_{dR,σ} and graded pieces gr^j. At t = 0, V_{dR,σ,0} = ⊕_{i} V_{dR,σ,i} under the characters χ_i of H. For K/ℚ_l finite containing the base image of ℚ(ζ_N), V=V_{λ,t}⊗_{O_λ}E is an E-linear representation of G_K. Form D_dR,K(V)=(B_dR⊗_{ℚ_l}V)^{G_K}, a filtered module over K⊗_{ℚ_l}E. After extending E to a finite E′ containing every embedding of K, its σ-labelled component is D_dR,K(V)⊗_{K⊗E,σ⊗ι}E′. Equivariant de Rham comparison identifies it with the corresponding coefficient-conjugate χ-part of H^{N−2}_dR(Y_t/K)⊗_{K,σ}E′; the character is obtained by transporting χ along the same coefficient embedding ι. Expressed over the fixed global coefficient field, this is the σ^{−1}χ convention of the first part. No K-action on V is assumed.

**Hypotheses and boundaries.**

- characteristic 0 base T_0 × ℚ(ζ_N)
- λ and v of the same residue characteristic l
- Numerical weights in this roadmap are cohomological: a weight h means dim gr^h D_dR,σ, so HT(ε_l)=−1. PadicHodgeTheory uses HT(ε_l)=+1 and gr^{−h}; negate its labelled weights when importing it. PL.0 uses the cohomological convention already.


**Proof outline.**

1. Relative Hodge bundles of a smooth proper family in characteristic 0 are locally free, the Hodge spectral sequence degenerates and character idempotents cut out locally free summands with the induced filtration (ComplexComparisonPartII C5).
2. The filtered de Rham comparison for proper smooth varieties over p-adic fields (CohomologyComparisons CP.3) is H_0-equivariant; taking χ-parts introduces the twist by σ.


**Checks and worked cases.**

- For σ = id and t = 0, V_{dR,id,0} = ⊕_{i∈B} V_{dR,i} with one-dimensional summands.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.deRhamEigenspace | constructor | V_{dR,σ} := e_χ(H^{N−2}_dR(Y/T_0 × ℚ(ζ_N)) ⊗_{σ^{−1}} ℚ(ζ_N)). |
| Dwork.deRhamEigenspace.filtration | data | F^jV_{dR,σ}, locally direct summands with graded pieces gr^j. |
| Dwork.deRhamEigenspace.locallyFree | instance | V_{dR,σ} and each gr^j are locally free on T_0 × ℚ(ζ_N). |
| Dwork.deRhamEigenspace.fibreZero | simp | At t = 0, V_{dR,σ,0} = ⊕_i V_{dR,σ,i} under the H-characters χ_i. |
| Dwork.deRhamEigenspace.comparison | compatibility | The σ-labelled component of (B_dR⊗_{ℚ_l}V)^{G_K}, obtained using K⊗E→E′, is the corresponding transported χ-eigenpart of H_dR(Y_t/K)⊗_{K,σ}E′ as a filtered E′-space. |
| Dwork.deRhamEigenspace.baseChange | functoriality | Compatible with base change T′ → T_0 and with extension of K. |


**Uses that determine the API.**

- QIAN23 Lemmas 3.10–3.11 (DM.7/hodge-grades-of-fermat-eigenlines, DM.7/dwork-hodge-tate-weights): Hodge–Tate weights of the fibres
- BLGHT11 Lemmas 5.2–5.3 (DM.7/hodge-grades-of-fermat-eigenlines): the self-dual Hodge numbers
- QIAN21 §4 (DM.8/hyodo-kato-description-near-infinity): the filtration on D_st near infinity


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| deRhamEigenspace_rank | characterisation | V_{dR,σ} has rank n. |
| deRhamEigenspace_fibreZero_lines | computation | For Qian's datum with n = 3, V_{dR,σ,0} has the three nonzero lines V_{dR,σ,1}, V_{dR,σ,2}, V_{dR,σ,N−3}. |
| deRhamEigenspace_identity_twist | degenerate | For σ = id the twist is trivial and V_{dR,id} is the χ-part of H_dR itself. |
| deRhamEigenspace_twist_matters | non-example | For σ ≠ id, V_{dR,σ} is the σ^{−1}χ-part rather than the χ-part of H_dR; the untwisted χ-part has different Hodge numbers in general, so comparing D_dR,σ with it gives wrong Hodge–Tate weights. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting; ComplexComparisonPartII:C5/relative-hodge-bundles; CohomologyComparisons:CP.3/filtered-de-rham-comparison; PadicHodgeTheory:R06.2/plan/period-functors; PadicHodgeTheory:R06.2/hodge-tate-weight-convention.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, before Lemma3.9, pp.18–20. Defines H_dR, its σ-twists, the χ-eigenspaces V_{dR,σ} with filtration and graded pieces, the decomposition at t = 0 and the de Rham comparison with the twist.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §5, the spaces U_{DR,σ} and the comparison, pp. 34–35. The self-dual analogue, with coefficients embeddable in the field containing t but no canonical embedding.


### DM.7/hodge-grades-of-fermat-eigenlines — Hodge grades of the Fermat eigenlines

**Theorem.** Write σ^{−1}(ζ_N) = ζ_N^a and ⟨x⟩ for the representative of x mod N in {1, …, N}. Then V_{dR,σ,i} ≠ 0 iff i ∈ B, it is then one-dimensional, and its only nonzero graded piece is in degree M(a) + #{b ∈ B : ⟨ab⟩ < ⟨ai⟩}, where M(a) = (∑_j⟨a·a_j + 1⟩)/N − 1; equivalently the degree is (∑_j⟨a(a_j + i)⟩)/N − 1. For the self-dual data (BLGHT11 Lemma 5.2(1)) the degree is (N − n − 3)/2 + #{b ∈ B : ⟨ab⟩ ≤ ⟨ai⟩}.

**Hypotheses and boundaries.**

- a ∈ (ℤ/Nℤ)^× determined by σ
- Use a zero-shaped exponent datum: zero has multiplicity n+1, each nonzero residue occurs at most once, and 0∉B. Rank n alone does not imply this consecutive-grade computation.


**Proof outline.**

1. After base change along τ_0σ^{−1} to ℂ, gr^jV_{dR,σ,i} is the eigenspace of H^{j, N−2−j}(Y_0(ℂ)) for the character (a(a_j + i))_j of H.
2. DM.2/fermat-hypersurface-cohomology: nonzero iff all a(a_j + i) ≢ 0 (i.e. i ∈ B), in Hodge degree j with j + 1 = ∑⟨a(a_j + i)⟩/N.
3. Set j(d) = ∑⟨a·a_j + d⟩/N − 1; it increases by one when passing d ≡ ab, b ∈ B, and is constant otherwise; induct from M(a) = j(1).


**Checks and worked cases.**

- For σ = id (a = 1) and Qian's datum with n = 3, the three lines i = 1, 2, N − 3 have consecutive grades M(1), M(1) + 1, M(1) + 2.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-exponent-datum.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.9(1) with proof, pp.19–20 (published Lemma3.10). Computes the unique nonzero graded piece of each Fermat eigenline from Deligne's Propositions I.7.4 and I.7.6.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.2(1) and proof, pp. 35–36. The self-dual analogue.


### DM.7/consecutive-hodge-numbers — Consecutive Hodge numbers of the Dwork motives

**Theorem.** For each σ, gr^jV_{dR,σ} is locally free of rank one on T_0 × ℚ(ζ_N) for M(a) ≤ j ≤ M(a) + n − 1 and zero otherwise; V_{dR,σ} is locally free of rank n. For the self-dual data the range is (N − 1 − n)/2 ≤ j ≤ (N + n − 3)/2 (BLGHT11 Lemma 5.2(2)).

**Hypotheses and boundaries.**

- Hodge numbers are locally constant in a smooth proper family in characteristic 0
- Use a zero-shaped exponent datum: zero has multiplicity n+1, each nonzero residue occurs at most once, and 0∉B. Rank n alone does not imply this consecutive-grade computation.


**Proof outline.**

1. gr^jV_{dR,σ} is locally free (DM.7/twisted-de-rham-eigenspaces), so its rank can be computed at t = 0.
2. At t = 0 the grades of the n eigenlines are M(a) + #{b : ⟨ab⟩ < ⟨ai⟩}, which run through M(a), …, M(a) + n − 1 as i runs through B ordered by ⟨ai⟩ (DM.7/hodge-grades-of-fermat-eigenlines).


**Checks and worked cases.**

- Every gr^j has rank ≤ 1: the Dwork motives have regular (multiplicity-free) Hodge numbers.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/hodge-grades-of-fermat-eigenlines; PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces; ComplexComparisonPartII:C5/relative-hodge-bundles.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.9(2) with proof, pp.19–20. gr^jV_{dR,σ} is locally free of rank one exactly for M(a) ≤ j ≤ M(a) + n − 1.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.2(2), p. 35. The self-dual range.


### DM.7/dwork-hodge-tate-weights — Dwork fibres are de Rham with consecutive labelled Hodge–Tate weights

**Theorem.** Let v | l be a place of F ⊇ ℚ(ζ_N) and t ∈ T_0(F_v). (1) V_{λ,t} ⊗ ℚ(ζ_N)_λ is a de Rham representation of G_{F_v} (not of G_F; PAPER-QIAN-23/E8), and for an embedding σ : F_v ↪ ℚ̄_l with σ^{−1}(ζ_N) = ζ_N^a on ℚ(ζ_N), its σ-labelled Hodge–Tate weights (cohomological convention) are M(a), M(a) + 1, …, M(a) + n − 1, each with multiplicity one. (2) W_{t,λ} is de Rham with HT_σ(W_{t,λ}) = {0, 1, …, n − 1} for every σ. (3) For the self-dual data V_{λ,t}((N − 1 − n)/2) is de Rham with Hodge–Tate numbers {0, …, n − 1} at every embedding (BLGHT11 Lemma 5.3(1)).

**Hypotheses and boundaries.**

- l the residue characteristic of λ and v
- Cohomological weights are the positive filtration jumps, opposite to PadicHodgeTheory:R06.2/hodge-tate-weight-convention. Thus W has supplier weights {0,−1,…,1−n}, while PL.0 assigns it ordinary weight 0.


**Proof outline.**

1. (1) is DM.7/twisted-de-rham-eigenspaces with DM.7/consecutive-hodge-numbers.
2. (2): W_{t,λ} = V_{t,λ} ⊗ Ψ_λ^{−1} has weights shifted by a constant M′_σ; det W_λ ≅ M_λ(n(1 − n)/2) (DM.3/twisted-dwork-local-system) gives nM′_σ + n(n − 1)/2 = n(n − 1)/2, so M′_σ = 0.
3. (3) as in (1) with the Tate twist.


**Checks and worked cases.**

- For n = 3 and every embedding, the weights of W_{t,λ} are {0, 1, 2}.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/twisted-de-rham-eigenspaces; PotentialAutomorphyDworkMotivesPartII:DM.7/consecutive-hodge-numbers; PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.10(1), pp.20–21 (published Lemma3.11). V_{λ,t} is de Rham with σ-labelled Hodge–Tate weights M(a), …, M(a) + n − 1.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.2.5(2) with proof, pp.42–43. W_{t,λ} is de Rham with HT_τ = {0, …, n − 1}, by Qian's lemma and the determinant.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.3(1), p. 36. Hodge–Tate numbers {0, …, n − 1} of V_{λ,t}((N − 1 − n)/2).


**Planet:** Consecutive Hodge–Tate weights.

### DM.7/crystalline-at-good-reduction — Crystallinity and Frobenius at good-reduction fibres

**Theorem.** Let v | l, l ∤ N, and t ∈ O_{F_v} with t^N − 1 a unit. Then V_{λ,t} and W_{t,λ} are crystalline representations of G_{F_v}; the characteristic polynomial of Frob_v on WD(W_{t,λ}) equals Q_v(X) of the special fibre (the same polynomial as for λ′ ∤ l, DM.6/frobenius-polynomials-independent); and W_{t,λ} is ordinary iff the roots of Q_v in ℚ̄_l have l-adic valuations 0, f, 2f, …, (n − 1)f, f = [k(v) : 𝔽_l]. No crystallinity is claimed at the punctures or for t merely integral. For the self-dual data, V_{λ,t}((N − 1 − n)/2) is crystalline under the same condition (BLGHT11 Lemma 5.3(2)). Moreover Q_v(X) for W has coefficients integral at λ|l as well, so the M-valued polynomial of DM.6 belongs to O_M[X].

**Hypotheses and boundaries.**

- t ∈ O_{F_v}, t^N − 1 ∈ O_{F_v}^×
- l ∤ N
- Use φ^f on a K₀ coefficient component, v_l(l)=1 and f=[k(v):𝔽_l]; translate supplier Hodge–Tate signs by using its filtration jumps. The equivariant comparison and the rank-one crystalline Hecke twist are both required.


**Proof outline.**

1. Y_t has good reduction over O_{F_v}; the crystalline comparison theorem gives crystallinity of H^{N−2}_ét and an H_0- and Frobenius-equivariant identification of D_cris with crystalline cohomology of the special fibre; Ψ_λ is crystalline at v.
2. The characteristic polynomial of φ^f on the twisted χ-part of crystalline cohomology equals Q_v by Katz–Messing (applicable to crystalline cohomology by Gillet–Messing).
3. Regular consecutive weights {0, …, n − 1} and the slope criterion for ordinarity (PadicHodgeTheory R06.2) give the last statement.
4. At λ|l all filtration jumps of W are 0,…,n−1. Weak admissibility applied to the lowest-slope Frobenius subobject shows its Newton degree is nonnegative, since its induced Hodge degree is nonnegative. Hence every Frobenius slope is ≥0, and the polynomial is λ-integral. Together with DM.6 integrality away from l this proves O_M-integrality, without assuming it earlier.


**Checks and worked cases.**

- If the special fibre point x has Q_x with l-adic slopes 0, 1, …, n − 1 (normalised), W_{t,λ} is crystalline ordinary.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights; PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent; CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base; PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective; PadicHodgeTheory:R06.2/crystalline-ordinary-slope-criterion; PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.10(2), pp.20–21. For t ∈ O_{F_v} with t^N − 1 ∉ 𝔪, V_{λ,t} is crystalline because Y_t has good reduction.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.2.5(2) with proof, pp.42–43. Crystallinity, the Frobenius characteristic polynomial Q_v via Katz–Messing and Gillet–Messing, and the slope criterion for ordinarity (Geraghty Lemma 2.32).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.3(2), p. 36. Crystallinity of the self-dual fibres at good reduction.


### DM.7/ordinary-near-fermat-point — Ordinarity of fibres near the Fermat point when l ≡ 1 mod N

**Theorem.** Let l ≡ 1 mod N (so ℚ(ζ_N)_λ = ℚ_l), v | l and t ∈ 𝔪_{F_v}. Then V_{λ,t} is ordinary of weight μ with μ_{σ,i} = M(a_σ) for all i (in the convention of PotentialAutomorphyInfrastructurePartII PL.0, cohomological weights M(a_σ), …, M(a_σ) + n − 1), where σ^{−1}(ζ_N) = ζ_N^{a_σ}. For the self-dual data, V_{λ,t}((N − 1 − n)/2) is ordinary of weight 0, and its reduction at t = 0 is 𝔽_l ⊕ 𝔽_l(−1) ⊕ ⋯ ⊕ 𝔽_l(1 − n) as a module for inertia (BLGHT11 Lemma 5.3(3)–(4)).

**Hypotheses and boundaries.**

- l ≡ 1 mod N
- t ∈ 𝔪_{F_v}


**Proof outline.**

1. For t ∈ 𝔪_{F_v}, Y_t and Y_0 have the same special fibre, so D_cris(V_{λ,t}) ≅ D_cris(V_{λ,0}) as φ-modules (crystalline comparison); their labelled Hodge–Tate weights agree (DM.7/dwork-hodge-tate-weights).
2. By the slope criterion (PadicHodgeTheory R06.2, the crystalline form of BLGHT Lemma 2.2), V_{λ,t} is ordinary iff V_{λ,0} is.
3. V_{λ,0} ⊗ ℚ̄_l = ⊕_{i∈B} V_{λ,i}, each a crystalline character of G_{ℚ_l(ζ_N)_v} = G_{ℚ_l} with Hodge–Tate weight M(a_σ) + #{b : ⟨a_σb⟩ < ⟨a_σi⟩}, so as an inertia module it is ⊕_{i=0}^{n−1} ℚ̄_l(−M(a_σ) − i): an ordinary filtration.


**Checks and worked cases.**

- For the self-dual data and l ≡ 1 mod N the inertia action on the Fermat fibre mod λ is 𝔽_l ⊕ 𝔽_l(−1) ⊕ ⋯ ⊕ 𝔽_l(1 − n) (after the Tate twist).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction; PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights; PotentialAutomorphyDworkMotivesPartII:DM.7/hodge-grades-of-fermat-eigenlines; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting; PadicHodgeTheory:R06.2/crystalline-ordinary-slope-criterion; PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight; CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, Lemma3.10(3), pp.20–21; Lemma2.4 pp.9–10. For l ≡ 1 mod N and t ∈ 𝔪_{F_v}, V_{λ,t} is ordinary of weight (M(a_σ)), by comparison with the Fermat fibre.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.3(3)–(4) and proof, pp. 36–38. The self-dual analogue, ordinary of weight 0, and the inertia action on the Fermat fibre mod λ.


### DM.7/fermat-fibre-inertia-at-minus-one — Inertia on the Fermat fibre when l ≡ −1 mod N

**Theorem.** Let n>2, l>n prime with l≡−1 mod N, v|l of ℚ(ζ_N), λ|l of M, and τ,cτ:k(v)→k(λ)=𝔽_{l²}. Normalize Art to send a uniformizer to geometric Frobenius, set ω_τ=τ∘Art⁻¹ on inertia, and put θ_τ=ω_τ⁻¹. Then θ_τθ_{cτ}=ε̄_l⁻¹ and W̄_{0,λ}|I ≅ ⊕_{i=1}^n θ_τ^{i−1}θ_{cτ}^{n−i}. This is BCGNT Lemma 4.4.4 with the inverse characters required by its determinant and cohomological conventions (E31). For the separately defined self-dual n=2 system use BLGHT Lemma 5.3(5) with the same sign translation; this statement does not invoke an undefined rank-two W.

**Hypotheses and boundaries.**

- n>2, l≡−1 mod N and l>n; the zero-shaped data and the W construction of DM.3.
- ω and θ are inertia characters; θ is the reduction of the positive cohomological Lubin–Tate character, θ(Art(u))=τ(u)⁻¹ for units u.


**Proof outline.**

1. H extends the H_0-action on the Fermat fibre and decomposes W̄_{0,λ} into n lines W̄_{0,λ,j}, the Ψ^{−1}-twists of the H-eigenspaces in H^{N−2} (printed H^{N−1}, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E9), each crystalline of rank one.
2. The skew-Hermitian pairing (DM.5/hermitian-poincare-pairing) is orthogonal for this decomposition, so W̄_{0,λ,j}^c ≅ W̄_{0,λ,j}^∨ε̄^{1−n}.
3. Order the crystalline Fermat eigenlines by their τ-labelled filtration jumps i−1. The paired conjugate jump is n−i. Rank-one Fontaine–Laffaille in the range 0,…,n−1 gives θ_τ^{i−1}θ_{cτ}^{n−i}; using ω instead would give the dual signs. Their determinant is (θ_τθ_{cτ})^{n(n−1)/2}=ε̄_l^{−n(n−1)/2}, agreeing with DM.3.


**Checks and worked cases.**

- For n=3 the inertia summands are θ_{cτ}², θ_τθ_{cτ}, θ_τ²; their determinant is ε̄_l⁻³. With the printed positive ω powers it would instead be ε̄_l³. For l>7 these differ.
- The analogous cohomological H¹ of a supersingular elliptic curve has inertia ω₂⁻¹⊕ω₂^{−l}; this is the separately defined rank-two boundary, not a W construction.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-fibre-splitting; PotentialAutomorphyDworkMotivesPartII:DM.5/hermitian-poincare-pairing; PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights; PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system; PadicHodgeTheory:R06.2/plan/period-functors; LocalGaloisDeformationRings:L7/local-model-rho-nm0.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Lemma4.4.4 with proof, p.48; invert the printed Artin fundamental characters (E31). The Fermat decomposition and paired labelled weights give this inertia formula after inverting the printed fundamental characters; §1.6 fixes Art and the cyclotomic sign. The determinant test in E31 detects the printed inconsistency.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.3(5) and proof, pp. 36–38. The self-dual analogue for l ≡ −1 mod N.
- [CEGS](https://www.ma.imperial.ac.uk/~tsg/Index_files/cegsC.pdf), §1.4, Lemma 1.4.1 and following product formula, pp. 5–6. With Art taking a uniformizer to geometric Frobenius, the direct fundamental characters multiply to the cyclotomic character; the positive cohomological characters used here are their inverses.


### DM.7/steinberg-monodromy-away-from-coefficient-prime — Maximal unipotent local monodromy at places with v(t) < 0

**Theorem.** Let v be a finite place of F ⊇ ℚ(ζ_N) and λ′ a prime of residue characteristic l′ ≠ char(v), l′ odd and prime to N, and residue characteristic of v prime to N. (1) If t ∈ O_{F_v} and t^N − 1 is a unit, V_{λ′,t} is unramified at v. (2) If v(t) < 0, V_{λ′,t}|_{G_{F_v}} is tamely ramified, inertia acts unipotently through exp(t_{l′}(σ)N) and the monodromy operator N of its Weil–Deligne representation has minimal polynomial X^n (a single Jordan block); for the self-dual data a Frobenius lift has characteristic polynomial (X − α)(X − αq)⋯(X − αq^{n−1}) with α = ±1 (after the twist (N − 1 − n)/2), i.e. WD is an unramified twist of Steinberg (BLGHT11 Lemma 5.1). The hypothesis v(t) < 0 is necessary (PAPER-QIAN-23/E1).

**Hypotheses and boundaries.**

- l′ ≠ residue characteristic of v
- v(t) < 0 in (2)
- residue characteristic of v does not divide N; smooth proper base change and tame specialization are asserted over this good base only.


**Proof outline.**

1. (1) is smooth proper base change.
2. (2): near t = ∞ the family over the punctured disc {v(t) < 0} has geometric monodromy generated by the local monodromy at ∞, which is a single unipotent Jordan block over ℚ̄_{l′} (DM.4/maximal-unipotent-monodromy-at-infinity, applied to every conjugate character).
3. The Galois action of G_{F_v} on the fibre at t factors through the local fundamental group of the punctured disc at ∞ (tame specialisation of nearby cycles); inertia maps to the d-th power of the local monodromy generator, d = −v(t) > 0, still a single unipotent block in characteristic 0 (the argument of HSBT10 Lemma 1.15(2)).
4. For the Frobenius eigenvalues, the weight filtration of a single Jordan block and purity of the special value at ∞ give the Steinberg shape (BLGHT11).


**Checks and worked cases.**

- For the self-dual data with n = 2 and v(t) < 0, V_{λ′,t} is an unramified twist of the Steinberg representation at v, as for an elliptic curve with multiplicative reduction.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.4/maximal-unipotent-monodromy-at-infinity; LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle; LefschetzPencilsAndVanishingCycles:LPV.1/maximal-unipotence; ArithmeticGaloisRepresentations:R01.2/grothendieck-quasi-unipotence; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), Published Lemma3.12, pp.1267–1268, was not present in v1 or independently read. The supported formulation here uses BLGHT Lemma5.1 and the explicit tame-specialization gap; E2 remains unverified as a publication-specific allegation. Unverified publication cross-reference only. The roadmap’s v(t)<0 statement is checked using BLGHT Lemma5.1; tame specialization remains an explicit supplier gap.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 5.1, pp. 33–34. Unramified for integral t with t^N − 1 a unit; tamely ramified with a single unipotent Jordan block and Steinberg-shaped Frobenius for t ∉ O_F.


**Planet:** Steinberg monodromy near infinity.

### DM.7/dwork-compatible-system — The Dwork fibres form weakly compatible systems

**Theorem.** Let F/ℚ(ζ_N) be a number field, t ∈ T_0(F) and S the finite places v with v | N or t ∉ T_0(O_{F_v}). Then (M, S, {Q_v(X)}_{v∉S}, {W^{ss}_{t,λ}}_λ, {{0, 1, …, n − 1}}_τ) is a weakly compatible system of l-adic representations of G_F over M of rank n, pure of weight n − 1 (BLGGT14 §5.1); the untwisted system {V_{t,λ}} instead has purity weight N−2 and Hodge–Tate multisets {M(a_τ), …, M(a_τ) + n − 1} and for the self-dual data over M^+ (with symplectic pairings).

**Hypotheses and boundaries.**

- t ∈ T_0(F)


**Proof outline.**

1. Away from S and the residue characteristic of λ, W_{t,λ} is unramified with Frobenius polynomial Q_v independent of λ (DM.6/frobenius-polynomials-independent).
2. At v | l with v ∉ S, W_{t,λ} is crystalline with Hodge–Tate weights {0, …, n − 1} and the same Frobenius polynomial (DM.7/crystalline-at-good-reduction, DM.7/dwork-hodge-tate-weights); at every v | l it is de Rham. The final clause of DM.7/crystalline-at-good-reduction now supplies O_M-integrality of Q_v; it was not an input to DM.6.
3. Purity of weight n − 1 is Deligne's theorem for the smooth fibres twisted by Ψ of weight N − n − 1.


**Checks and worked cases.**

- deg Q_v = n, Q_v(0) = ± q_v^{n(n−1)/2}, as the determinant ε^{−n(n−1)/2} requires.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent; PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction; PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights; PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n; PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.2.5(3), p.43. The family (M, S, {Q_v}, {W^{ss}_{t,λ}}, {{0, …, n − 1}}) is a weakly compatible system of rank n, pure of weight n − 1, in the sense of BLGGT14 §5.1.
- [BLGGT14](https://arxiv.org/abs/1010.2561v4), §5.1 (arXiv v4). Definition of weakly compatible systems of l-adic representations.


**Planet:** Dwork compatible systems.

### DM.7/drinfeld-kedlaya-slope-bound — Generic slopes of indecomposable lisse sheaves (Drinfeld–Kedlaya)

**Theorem.** Let X be a smooth irreducible variety over a finite field of characteristic p and E a lisse ℚ̄_{l′}-sheaf of rank n on X (l′ ≠ p) which is algebraic (Frobenius characteristic polynomials with algebraic coefficients). Fix a p-adic valuation on ℚ̄ and for x ∈ |X| let a^x_1 ≥ ⋯ ≥ a^x_n be the p-adic slopes of Frob_x normalised by deg x. (i) There are rational numbers a^η_1 ≥ ⋯ ≥ a^η_n such that the set U of x with a^x_i = a^η_i for all i is nonempty and has open intersection with the closed points of every curve (the intersection may be empty); (ii) ∑_{i≤r} a^x_i ≤ ∑_{i≤r} a^η_i for all x, r; (iii) if E is indecomposable then a^η_i − a^η_{i+1} ≤ 1 for 1 ≤ i < n.

**Hypotheses and boundaries.**

- E algebraic; (iii) requires E indecomposable (e.g. geometrically irreducible)


**Proof outline.**

1. For a smooth curve, Drinfeld–Kedlaya §5.1 uses Abe’s crystalline companions for irreducible sheaves and Theorem 1.1.5 for convergent F-isocrystals; §5.2 handles indecomposable extensions. For higher-dimensional X, §5.3 restricts to suitable curves. This does not assume a global crystalline companion on an arbitrary variety. The companions and full-faithfulness inputs remain recorded supplier gaps.
2. (ii) is Grothendieck's specialisation theorem for Newton polygons.


**Checks and worked cases.**

- For E pure of weight n − 1 with slopes 0, 1, …, n − 1 at one point, (ii) and (iii) force the generic slopes to be 0, 1, …, n − 1.


**Direct prerequisites.** PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic; PadicDifferentialEquationsAndRigidCohomology:RD.3/convergent-f-isocrystal; PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective.

**Sources and matches.**

- [DK17](https://arxiv.org/abs/1604.00660v11), Theorem 1.3.3, pp. 4–5 (arXiv v11); proof in §5, pp. 11–12. For an algebraic lisse sheaf on a smooth variety over a finite field, generic slopes exist and are attained on a dense set, special slopes lie above generic ones, and for indecomposable sheaves consecutive generic slopes differ by at most one.
- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Proposition4.2.6, pp.43–45. Applies DK17 Theorem 1.3.3 to the lisse sheaf W_μ with λ-adic slopes.


### DM.7/generic-crystalline-ordinarity — Generic crystalline ordinarity of the Dwork family

**Theorem.** Let v be a place of ℚ(ζ_N) of residue characteristic l ∤ N and λ a place of M of the same characteristic. There is a nonempty Zariski open U(v; λ) ⊂ T_{0,k(v)} such that for every finite extension F_w/ℚ(ζ_N)_v and every t ∈ T_0(O_{F_w}) whose reduction lies in U(v; λ)(k(w)), W_{t,λ} is a crystalline ordinary representation of G_{F_w}.

**Hypotheses and boundaries.**

- l ∤ N
- Qian's datum, n > 2 (BCGNT25 setting)


**Proof outline.**

1. By DM.7/crystalline-at-good-reduction it suffices that the normalised l-adic slopes s_1 ≥ ⋯ ≥ s_n of Q_x (computed with an auxiliary μ of residue characteristic ≠ l) be n − 1, …, 1, 0 for x ∈ U.
2. W_μ is geometrically irreducible (DM.3/twisted-dwork-local-system); Drinfeld–Kedlaya (DM.7/drinfeld-kedlaya-slope-bound) give a dense open V with constant slopes and gaps ≤ 1; with ∑s_i = n(n − 1)/2 (determinant) it suffices to find U ⊂ V with s_n(x) = 0.
3. By (4.2.3) and the trace formula of E_μ (DM.3/hypergeometric-sheaf-properties), s_n(x) = 0 when tr(Frob_x | E_{μ,x}) ≢ 0 mod λ. Writing ρ_i through z ↦ z^{c_i}, the trace is congruent to N_{k/k(v)}(u(x)) for the polynomial u(T) = ∑_r(−1)^{nr}∏_i C(c_i, r)T^r (Lucas's theorem; one exponent in the printed proof is misprinted, PAPER-BOXER-CALEGARI-GEE-ETAL-25/E8); take U = T_{1,k(v)}[1/u] pulled back, nonempty since u(0) = 1.


**Checks and worked cases.**

- The open set is independent of the extension k/k(v): u has coefficients in k(v).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction; PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system; PotentialAutomorphyDworkMotivesPartII:DM.7/drinfeld-kedlaya-slope-bound; PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties; PotentialAutomorphyDworkMotivesPartII:DM.3/katz-dwork-comparison; PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, Proposition4.2.6 with proof, pp.43–45. Proves generic crystalline ordinarity by Drinfeld–Kedlaya, the determinant and a computation of the hypergeometric trace modulo λ following DK17 §A.3.
- [DK17](https://arxiv.org/abs/1604.00660v11), Appendix A, §A.3 (Proposition A.3.1, Corollary A.3.2) (arXiv v11). The key computation of the slopes of the hypergeometric sheaves E_c.


**Planet:** Generic crystalline ordinarity.

## DM.8 — Semistable models and ordinarity near infinity


### DM.8/dwork-semistable-blowup — The equivariant semistable blowup of the reciprocal Dwork family

**Construction.** Let k be a perfect field of characteristic p ∤ N, W = W(k), and Spec W[T, U^{±1}]′ the open where (TU)^N ≠ 1. Let Y_N ⊂ ℙ^{N−1} × Spec W[T, U^{±1}]′ be UT(X_1^N + ⋯ + X_N^N) = N X_1⋯X_N (the Dwork family in the reciprocal parameter s = 1/t = UT), with D_i = {X_i = 0} and D = {∑X_i^N = 0}. Blow up D ∩ D_N, then successively the intersections of the strict transforms of D and D_j for j = N − 1, …, 1. The result 𝕏 satisfies: (a) every centre is H_0-stable, so H_0 acts on 𝕏 and the blowdown 𝕏 → Y_N is H_0-equivariant; (b) the blowdown is an isomorphism over T ≠ 0; (c) étale locally 𝕏 is étale over W[T, U^{±1}]′[Z_1, …, Z_r, Z_{r+1}^{±1}, …, Z_m^{±1}]/(TU − Z_1⋯Z_r), H_0-equivariantly with H_0 acting on the Z_i by characters. Base change along T ↦ π, U ↦ u (u ∈ O_F^×) gives a semistable model with H_0-action of uπ(∑X_i^N) = N∏X_i over O_F; base change to ℂ along U ↦ 1 gives a blowup of T(∑X_i^N) = N∏X_i over 𝔸¹ − μ_N, an isomorphism away from T = 0, whose fibre over 0 is a reduced normal crossings divisor without self-crossings.

**Hypotheses and boundaries.**

- p ∤ N
- semistable: reduced normal crossings special fibre without self-intersections


**Proof outline.**

1. The successive blowup centres are intersections of H_0-stable divisors, hence H_0-stable; blowups commute with flat base change.
2. Compute charts after each blowup by hand (QIAN21 pp. 5–8): the local equation becomes TU = Z_1⋯Z_r times a unit.
3. Remark 2.2 of QIAN21 records the H_0-equivariant charts.


**Checks and worked cases.**

- For N = 3 the fibre of Y_N over T = 0 is the triangle X_1X_2X_3 = 0 (three lines), already a reduced normal crossings divisor; the blowups resolve the singular points of the total space where D meets the coordinate lines.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.reciprocalFamily | constructor | Y_N ⊂ ℙ^{N−1}_{W[T,U^{±1}]′} given by UT∑X_i^N = N∏X_i. |
| Dwork.semistableBlowup | constructor | 𝕏 → Y_N, the iterated H_0-equivariant blowup. |
| Dwork.semistableBlowup.iso_away | characterisation | 𝕏 → Y_N is an isomorphism over T ≠ 0. |
| Dwork.semistableBlowup.charts | characterisation | Étale locally 𝕏 is étale over W[T, U^{±1}]′[Z, Z′^{±1}]/(TU − Z_1⋯Z_r). |
| Dwork.semistableBlowup.equivariant | functoriality | H_0 acts on 𝕏 compatibly with the blowdown and acts on the chart coordinates by characters. |
| Dwork.semistableBlowup.baseChange | functoriality | Base change along T ↦ π, U ↦ u gives a strictly semistable O_F-model of the fibre at s = uπ. |


**Uses that determine the API.**

- QIAN23 Lemma 3.3(2) (DM.4/unipotent-monodromy-at-infinity): unipotence of the N-th power of the monodromy at ∞
- QIAN21 Theorem 1.4 (DM.8/equivariant-semistable-model): the input to the toroidal subdivision
- QIAN21 §4 (DM.8/ordinary-near-infinity): the log special fibre used for D_st


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| semistableBlowup_iso_generic | characterisation | Over T = 1/2 (any T ≠ 0 with (TU)^N ≠ 1) the blowup is an isomorphism onto the smooth Dwork fibre. |
| semistableBlowup_special_fibre_reduced | computation | Over T = 0 the special fibre of 𝕏 is reduced: the chart equation TU = Z_1⋯Z_r has reduced fibre Z_1⋯Z_r = 0. |
| reciprocalFamily_degenerate_fibre | degenerate | Before blowing up, the fibre of Y_N at T = 0 is the union of the coordinate hyperplanes X_1⋯X_N = 0. |
| reciprocal_singular_locus_and_cubic_boundary | non-example | For N≥5 the reciprocal total space is singular where T=0, at least two coordinates vanish, and ∑X_i^N=0; for instance X₁=X₂=0, X₃=1, X₄=−1 and the other coordinates zero when N is odd. These points require the modification. For N=3 the total space is smooth and its central fibre is already a normal-crossings triangle; the displayed blowups along Cartier centres act trivially. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-pencil; PotentialAutomorphyDworkMotivesPartII:DM.1/dwork-symmetry-groups; SchemeAndStackFoundations:SF.4/strictly-semistable; SchemeAndStackFoundations:SF.4/strict-transform.

**Sources and matches.**

- [QIAN21](https://arxiv.org/abs/2103.00106v1), Lemma 2.1, Remark 2.2 and the paragraph after it, pp. 4–8 (arXiv v1). Constructs the H_0-equivariant blowup of UT(∑X_i^N) = N∏X_i with semistable étale-local charts.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, proof of Lemma3.3(2), pp.13–14. Uses the base change of this blowup to ℂ, whose fibre over 0 is a reduced normal crossings divisor.


### DM.8/equivariant-semistable-model — Equivariant semistable models of Dwork fibres near infinity

**Theorem.** Let F/ℚ_p be finite containing ζ_N, p ∤ N, π a uniformiser, and t ∈ F with v(t) = d > 0 (the fibre at s = t, i.e. Dwork parameter t^{−1}). Then there are e ≥ 1 and a strictly semistable model 𝒴 over O_{F′}, F′ = F(π^{1/e}) totally ramified of degree e, of the hypersurface t(∑X_i^N) = N∏X_i, with an H_0-action compatible with that on the generic fibre; 𝒴 is projective. More precisely there is an H_0-equivariant projective blowup Z of US^{de}(∑X_i^N) = N∏X_i over W[S, U^{±1}]′, an isomorphism outside S = 0, étale locally étale over W[U^{±1}, S, Z_1, …, Z_m]/(US − Z_1⋯Z_r) with some Z_i inverted, and 𝒴 is its base change along S ↦ π^{1/e}, U ↦ u. Only semistability over F′ (not over F) is asserted.

**Hypotheses and boundaries.**

- p ∤ N
- v(t) > 0 (reciprocal parameter), i.e. the Dwork parameter has negative valuation


**Proof outline.**

1. Base change the model of DM.8/dwork-semistable-blowup along T ↦ S^{de}; it becomes toroidal (log smooth) but not semistable.
2. Subdivide the slice S = 1 of its conical complex into unimodular lattice simplices (equivariant toroidal semistable reduction, Kempf–Knudsen–Mumford–Saint-Donat, owned by SchemeAndStackFoundations SF.4); the corresponding blowup is H_0-equivariant and semistable after the ramified base change of degree e.
3. A blowup of a projective scheme is projective.


**Checks and worked cases.**

- d = 1 needs no subdivision: the model of DM.8/dwork-semistable-blowup is already semistable over O_F (e = 1).


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.8/dwork-semistable-blowup; SchemeAndStackFoundations:SF.4; SchemeAndStackFoundations:SF.4/strictly-semistable; SchemeAndStackFoundations:SF.4/semistable-alteration-theorem.

**Sources and matches.**

- [QIAN21](https://arxiv.org/abs/2103.00106v1), Theorem 1.4 and Proposition 1.5, p. 3; restated as Theorem 2.3, p. 9; proof pp. 8–13 (arXiv v1). For v(t) = d > 0 there is a totally ramified F′ = F(π^{1/e}) and an H_0-equivariant semistable model of the fibre over O_{F′}, obtained by a toroidal subdivision.


### DM.8/log-special-fibre-witt-lift — The log special fibre of the semistable model lifts over W[T]

**Theorem.** In the setting of DM.8/equivariant-semistable-model, give Z the log structure M of the divisor (S) and 𝒴 that of (π^{1/e}). Choose u′ ∈ W^× with the same reduction as u and let (Y, N) be the base change of (Z, M) along S ↦ T, U ↦ u′ over Spec W[T]′ ((T^{de}u′)^N ≠ 1). Then (a) the log special fibre (𝒴̄, 𝒩̄) over (k, ℕ, 1 ↦ 0) is isomorphic, H_0-equivariantly, to the fibre of (Y, N) at T = 0; (b) Y is a projective H_0-equivariant blowup of u′T^{de}(∑X_i^N) = N∏X_i over W[T]′; (c) (Y, N) is log smooth over (W[T]′, ℕ, 1 ↦ T).

**Hypotheses and boundaries.**

- as in DM.8/equivariant-semistable-model


**Proof outline.**

1. Both log special fibres are base changes of (Z, M) along S ↦ 0, U ↦ ū.
2. The charts of Z with U ↦ u′ give Kato charts of the form u′T = Z_1⋯Z_r, hence log smoothness (ComplexComparisonPartII C5 / CrystallineCohomology CR.5 log smoothness).


**Checks and worked cases.**

- For d = 1, e = 1 the lift is the reciprocal family itself near T = 0 with its semistable blowup.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model; ComplexComparisonPartII:C5/log-smoothness; ComplexComparisonPartII:C5/divisorial-log-structure; CrystallineCohomology:CR.5:log-algebra/log-structure.

**Sources and matches.**

- [QIAN21](https://arxiv.org/abs/2103.00106v1), Remark 2.4, p. 13 (arXiv v1). Identifies the log special fibre of the semistable model with the special fibre of a log smooth family over W[T] with log structure 1 ↦ T.


### DM.8/hyodo-kato-description-near-infinity — Hyodo–Kato description of D_st of Dwork fibres near infinity

**Theorem.** Let F/ℚ_p be finite containing ζ_N, p odd and prime to N, λ|p, E/ℚ_p the λ-coefficient field, t∈F with v(t)>0, and F′,𝒴 as in DM.8/equivariant-semistable-model. Put K₀=W(k_{F′})[1/p] and V=V_{λ,t^{−1}}⊗E. The restriction V|G_{F′} is semistable and D_st,F′(V)=(B_st⊗_{ℚ_p}V)^{G_{F′}} is identified, H₀-equivariantly, with the χ-eigenpart of H^{N−2}_HK(𝒴̄,𝒩̄)⊗_{ℚ_p}E over K₀⊗E. After enlarging E to E′ and taking a label σ:K₀→E′, the character is transported by that coefficient map, equivalently σ^{−1}χ in fixed global coordinates. N preserves each component, while φ permutes them; φ^f is linear on a component for f=[k_{F′}:𝔽_p]. The filtration is compared only after scalar extension from K₀ to F′, using the Hyodo–Kato map determined by a uniformizer of F′. V is potentially semistable over F, with semistability asserted over F′.

**Hypotheses and boundaries.**

- p odd, p ∤ N
- v(t) > 0 (Dwork parameter t^{−1} near ∞)


**Proof outline.**

1. The C_st comparison for proper semistable models (CohomologyComparisons CP.4, with the actual Hyodo–Kato complex of CrystallineCohomology CR.6) is H_0-equivariant; take σ^{−1}∘χ-eigenparts.
2. The Hyodo–Kato cohomology of (𝒴̄, 𝒩̄) is that of the fibre at T = 0 of the log smooth lift (DM.8/log-special-fibre-witt-lift), which computes N as the residue of the Gauss–Manin connection.


**Checks and worked cases.**

- For the self-dual data with n = 2, N on D_st is nonzero, matching a multiplicative (Tate-curve-like) degeneration.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model; PotentialAutomorphyDworkMotivesPartII:DM.8/log-special-fibre-witt-lift; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison; CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter; CrystallineCohomology:CR.6/hk-comparison; CrystallineCohomology:CR.6/hk-monodromy.

**Sources and matches.**

- [QIAN21](https://arxiv.org/abs/2103.00106v1), §4, definition of D_st,σ (foot of p. 20) and the first display on p. 21 (arXiv v1). Applies Tsuji's comparison to the semistable model to identify D_st,σ of the Dwork eigenpart with the σ^{−1}χ-part of Hyodo–Kato cohomology of the log special fibre.


### DM.8/ordinary-near-infinity — Regular ordinarity of Dwork fibres near infinity

**Theorem.** Let λ be a prime of O (of O^+ when n = 2) of odd residue characteristic l ∤ N, F_v/ℚ_l finite containing ζ_N, Qian's datum (or the self-dual datum), and t ∈ F_v with v(t) < 0. Then: (1) there is a finite totally ramified F′_v/F_v with V_{λ,t}|_{G_{F′_v}} semistable, and for every σ the monodromy operator N on D_st,σ is maximally nilpotent (N^{n−1} ≠ 0); (2) V_{λ,t} is ordinary of regular weight μ with μ_{σ,i} = M(a_σ) for all i (PotentialAutomorphyInfrastructurePartII PL.0); (3) ordinarity with the induced weights passes to G_{F_v}-stable subquotients, and hence for a G_F-stable filtration of a global V_{λ,t} (t ∈ F) each graded piece, and the semisimplification, is ordinary at v with Hodge–Tate weights the corresponding subset of {M(a_σ), …, M(a_σ) + n − 1}. Part (2) needs the consecutive labelled weights (the companion's Lemma 4.2 omits this hypothesis of BLGHT11 Lemma 2.2(2); PAPER-QIAN-23/E11).

**Hypotheses and boundaries.**

- v(t) < 0
- l odd, l ∤ N


**Proof outline.**

1. (1): DM.8/hyodo-kato-description-near-infinity gives semistability over F′_v and identifies N with the Hyodo–Kato monodromy of the σ^{−1}χ-part; maximal nilpotence follows from maximal unipotence of the complex monodromy at ∞ for the conjugate character σ^{−1}χ (DM.4/maximal-unipotent-monodromy-at-infinity) through the comparison of the Hyodo–Kato monodromy with the residue of the Gauss–Manin connection.
2. Apply the already planned PadicHodgeTheory:R06.2/maximal-monodromy-ordinary-criterion to the semistable restriction, using the consecutive filtration jumps proved in DM.7. That supplier explicitly allows a different starting value M(a_σ) at each embedding and uses the negatives as its own Hodge–Tate weights; its conclusion is precisely PL.0 regular ordinarity in the present convention.
3. (3): restricting the invariant full flag to a subrepresentation (or pushing it to a quotient) gives a full flag with a subset of the graded characters, whose weights remain strictly ordered; potential semistability passes to subquotients.
4. For descent to G_{F_v}, pass to a finite Galois extension where the representation is semistable. Its ordinary flag is the canonical flag reconstructed from ker N^j. The full Galois group preserves it because it sends N to a nonzero scalar multiple of N. The rank-one graded characters therefore descend, with the same labelled weights. Ordinarity is not inferred from arbitrary potential ordinarity.


**Checks and worked cases.**

- For the self-dual datum with n = 2 and v(t) < 0, V_{λ,t}((N − 3)/2) is an extension of ε^{−1}·(unramified) by an unramified character after a finite extension, like a Tate curve.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.8/hyodo-kato-description-near-infinity; PotentialAutomorphyDworkMotivesPartII:DM.4/maximal-unipotent-monodromy-at-infinity; PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights; PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight; PadicHodgeTheory:R06.2/crystalline-ordinary-slope-criterion; CrystallineCohomology:CR.6/hk-monodromy; PadicHodgeTheory:R06.2/maximal-monodromy-ordinary-criterion.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, v1 Lemma3.10(4), p.21, invokes the companion; its missing hypothesis is repaired here. Published Remark3.13 was not independently read (E17). The v1 assertion uses the companion and needs the explicit consecutive-weight correction E10. No verification of the published Remark3.13 is claimed.
- [QIAN21](https://arxiv.org/abs/2103.00106v1), Theorem 1.1, p. 2, proved in §4, pp. 19–23 (arXiv v1). Under maximal unipotent monodromy at ∞ for every σχ, the fibres near ∞ are ordinary of some regular weight; the printed proof uses Lemma 4.2 without the Hodge–Tate hypothesis (E11).
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), Lemma 2.2(2), as recalled in QIAN23 Lemma 2.4. A crystalline (or semistable) representation with consecutive Hodge–Tate weights and suitable Frobenius slopes is ordinary.


**Planet:** Ordinarity near infinity.

### DM.8/conditional-regular-ordinarity — Regular ordinarity of Dwork motives near infinity for a general character

**Theorem.** Let F/ℚ_p be finite containing ζ_N, p odd, p ∤ N, and χ(ξ) = ∏ξ_i^{a_i} an arbitrary character of H_0 (∑a_i ≡ 0) with V_λ = e_χR^{N−2}π_*O_λ of rank n. Assume (a) for every σ ∈ Gal(ℚ(ζ_N)/ℚ) the monodromy of the σχ-eigen-local-system at t = ∞ has minimal polynomial (X − 1)^n, and (b) for every embedding the labelled Hodge–Tate weights of V_{λ,t^{−1}} are n consecutive integers. Then for every finite F_0/F and t ∈ F_0 with v(t) > 0, V_{λ,t^{−1}} is ordinary of some regular weight. Hypothesis (a) for all σ follows from the case σ = 1 by coefficient conjugation. The companion's sufficient condition 'a zero exponent gives (a)' is false (PAPER-QIAN-23/E50), and hypothesis (b) is not established for general χ there (E10).

**Hypotheses and boundaries.**

- (a) maximal unipotent monodromy at ∞ for every Galois conjugate σχ
- (b) consecutive labelled Hodge–Tate weights
- n≥1. The hypotheses are maximal monodromy for all coefficient conjugates and consecutive labelled filtration jumps; neither is replaced by the existence of a zero exponent.


**Proof outline.**

1. As in DM.8/ordinary-near-infinity, using DM.8/hyodo-kato-description-near-infinity for χ and hypotheses (a), (b) in place of the computations for Qian's datum.


**Checks and worked cases.**

- For Qian's datum, (a) is DM.4/maximal-unipotent-monodromy-at-infinity and (b) is DM.7/dwork-hodge-tate-weights, recovering DM.8/ordinary-near-infinity.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.8/hyodo-kato-description-near-infinity; PotentialAutomorphyDworkMotivesPartII:DM.8/ordinary-near-infinity; PadicHodgeTheory:R06.2/maximal-monodromy-ordinary-criterion.

**Sources and matches.**

- [QIAN21](https://arxiv.org/abs/2103.00106v1), Theorem 1.1 and Remark 1.2, p. 2; §4, pp. 19–23 (arXiv v1). The conditional main theorem of the companion, with the hypothesis of maximal unipotent monodromy for every σχ; Remark 1.2's zero-exponent criterion is false (E50).


## DM.9 — Switching theorems


### DM.9/switching-determinant-data — Determinant twists, the module W and the torsor T_W for Qian's switch

**Construction.** Hypotheses: l odd, n = l^a m (l ∤ m), s ≥ 1, N odd prime to ln with N > 100n + 100, r the order of l mod N with N ∤ l^{r/2} + 1 if r is even; F a CM field, M = F(ζ_N); r̄ : G_F → GL_n(𝔽_{l^s}) continuous; λ | l a prime of O (of O^+ when n = 2) with k(λ) ⊇ 𝔽_{l²} and all m-th roots of elements of 𝔽_{l^s}; l′ > 2ln + 5 prime, unramified in F^avoid, l′ ≡ 1 mod N and l′ ≡ 1 mod n (PAPER-QIAN-23/E7, E36); λ′ | l′, k(λ′) = 𝔽_{l′}; r̄′ : G_F → GL_n(𝔽_{l′}) with det r̄′ = ε̄_{l′}^{−n(n−1)/2} (local E9); finite Galois F^avoid ⊇ F, F_2^avoid, and totally real Galois F^suff over ℚ, all unramified above N, with F_2^avoid ∩ F^avoid = ℚ and F^suff ∩ F^avoid F_2^avoid = ℚ; F_0 = F^avoid F_2^avoid F^suff(ζ_N). Construction: apply the finite-coefficient root theorem requested from ArithmeticGaloisDuality R02.4 to det V[λ] ⊗ (det r̄|_{G_M})^{−1} (exponent m, DM.6/determinant-matching-at-l) avoiding F_0, getting L_1; then over L_1M to (det r̄′)^{−1} ⊗ det V[λ′] (exponent n, DM.6/determinant-matching-at-auxiliary-prime) avoiding F_0L_1, getting L_2 (two applications with the enlarged avoidance field, local E19). Put L = L_1L_2, E = LM. This gives (a) a totally real Galois L/ℚ linearly disjoint from F_0; the CM field E=LM is Galois over F; (b) characters χ̄_1 : G_E → k(λ)^×, χ̄_2 : G_E → 𝔽_{l′}^× with χ̄_1^n = det V[λ] ⊗ (det r̄)^{−1} and χ̄_2^n = det V[λ′] ⊗ (det r̄′)^{−1}; (c) W = (χ̄_1 ⊗ r̄) × (χ̄_2 ⊗ r̄′) over O/λλ′ ≅ k(λ) × 𝔽_{l′} with det W ≅ det V[λλ′], hence φ : ∧^nW ≅ ∧^nV[λλ′] and the torsor T_W = T({W}) over (T_0)_E (DM.5/level-structure-torsor); (d) T_W is smooth and geometrically irreducible (DM.5/level-structure-torsor-irreducible: l ≠ l′, max(l, l′) > 10, r′ = 1); (e) E ∩ F^avoid F_2^avoid F^suff = F.

**Hypotheses and boundaries.**

- all hypotheses listed in the statement


**Proof outline.**

1. The two root extractions are DM.6/determinant-matching-at-l and DM.6/determinant-matching-at-auxiliary-prime combined with the AGD R02.4 root theorem; the second application must avoid F_0L_1 so that L = L_1L_2 stays disjoint from F_0 (E37). The currently read AGD statement gives Q̄_l-valued roots only. Its requested strengthening must keep both roots in their fixed finite fields and keep the composite of the two totally real extensions disjoint from F₀.
2. Then det(χ̄_1 ⊗ r̄) = det V[λ] and det(χ̄_2 ⊗ r̄′) = det V[λ′], which gives φ by DM.5/determinant-descends.
3. (e): L and F_0 are linearly disjoint and M ⊂ F_0, so E ∩ F_0 = M; F^avoid F_2^avoid F^suff is unramified above N, hence meets ℚ(ζ_N) in ℚ, so M ∩ F^avoid F_2^avoid F^suff = F (tower disjointness, PotentialModularityAndCompatibleSystems R23.1).


**Checks and worked cases.**

- When r̄ already has determinant det V[λ]|_{G_F} and r̄′ has determinant det V[λ′], one may take L = ℚ and χ̄_1 = χ̄_2 = 1.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.SwitchingData | structure | The primes l, l′, λ, λ′, the modulus N, the representations r̄, r̄′ and the avoidance fields with their hypotheses. |
| Dwork.SwitchingData.field | data | The totally real L and the CM field E = L·F(ζ_N). |
| Dwork.SwitchingData.twists | data | χ̄_1, χ̄_2 with χ̄_1^n = det V[λ] ⊗ det r̄^{−1}, χ̄_2^n = det V[λ′] ⊗ det r̄′^{−1} on G_E. |
| Dwork.SwitchingData.module | constructor | W = (χ̄_1 ⊗ r̄) × (χ̄_2 ⊗ r̄′) with φ : ∧^nW ≅ ∧^nV[λλ′]. |
| Dwork.SwitchingData.torsor | projection | T_W over (T_0)_E, smooth and geometrically irreducible. |
| Dwork.SwitchingData.disjoint | other | E ∩ F^avoid F_2^avoid F^suff = F. |


**Uses that determine the API.**

- QIAN23 §4 (DM.9/qian-switching-theorem): Moret-Bailly is applied to the Weil restriction of T_W
- ModularityAndLanglandsExtensions:ML.2/qian-residual-potential-automorphy: the switching point feeds Qian's Theorems 1.1 and 1.4


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| switchingData_trivial_twist | degenerate | If the two determinant ratios are already trivial on G_{F(ζ_N)}, take L=ℚ, E=F(ζ_N), and χ̄₁=χ̄₂=1. This does not read det V[λ] as a character of G_F before its base has been fixed. |
| switchingData_det_W | characterisation | det W ≅ det V[λλ′] as characters of G_E. |
| switchingData_l_prime_split | computation | Since l′ ≡ 1 mod N, k(λ′) = 𝔽_{l′} and O/λλ′ ≅ k(λ) × 𝔽_{l′}. |
| switchingData_congruence_is_sufficient | non-example | For n=3 and l′≡2 mod3 the cube map on 𝔽_{l′}× is bijective, so every 𝔽_{l′}×-valued character has a unique cube root already, despite μ₃⊄𝔽_{l′}. The imposed congruence l′≡1 mod n is a sufficient supplier guard, not a necessary root criterion. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-l; PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-auxiliary-prime; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends; ArithmeticGaloisDuality:R02.4/character-roots-after-base-change; PotentialModularityAndCompatibleSystems:R23.1/tower-linear-disjointness.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §4, root characters and construction of W, pp.22–23. Constructs E = LM, the characters χ_1, χ_2, the module W and the isomorphism φ, and observes T_W is geometrically connected by Proposition 3.8, with the corrections E5–E7, E9, E36, E37.


### DM.9/weil-restricted-local-conditions — Weil restriction of the torsor and the local valuation conditions

**Construction.** With the switching data of DM.9/switching-determinant-data, let T = Res_{EF^suff/ℚ}(T_W ×_E EF^suff), a smooth geometrically irreducible ℚ-variety (Weil restriction along a finite separable extension preserves both properties), with the morphism p : T → Res_{EF^suff/ℚ} T_0 induced by T_W → (T_0)_E. Put Ω_∞ = T(ℝ) (nonempty since EF^suff is CM: T(ℝ) = ∏_{complex places} T_W(ℂ)), Ω_{l,0} = {(t_τ) : v_l(t_τ) < 0 for all τ : EF^suff → ℚ̄_l}, Ω_{l′,0} = {(t_τ) : v_{l′}(t_τ) > 0 for all τ}, and Ω_l = p^{−1}(Ω_{l,0}), Ω_{l′} = p^{−1}(Ω_{l′,0}). These are nonempty open subsets, invariant under Gal(ℚ̄_l/ℚ_l) (resp. Gal(ℚ̄_{l′}/ℚ_{l′})).

**Hypotheses and boundaries.**

- EF^suff a CM field
- T_W smooth geometrically irreducible


**Proof outline.**

1. Weil restriction of a quasi-projective smooth variety along a finite separable extension is a smooth quasi-projective variety, and becomes a product of conjugates over ℚ̄, hence geometrically irreducible (AlgebraicModuliForArithmeticGeometry R09.3; AbelianSchemesAndArithmeticModuli A6).
2. t with v(t) < 0 (resp. > 0) avoids μ_N and ∞, so Ω_{l,0}, Ω_{l′,0} are nonempty open Galois-stable; p is finite étale and surjective on ℚ̄_l-points, so the preimages are nonempty open.


**Checks and worked cases.**

- If EF^suff has degree 2d over ℚ, then T(ℝ) is the product of d copies of T_W(ℂ), one for each complex place.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.weilRestrictedTorsor | constructor | T = Res_{EF^suff/ℚ}(T_W ×_E EF^suff). |
| Dwork.weilRestrictedTorsor.geometricallyIrreducible | other | T is smooth and geometrically irreducible over ℚ. |
| Dwork.localConditionAtL | data | Ω_l = p^{−1}{v_l(t_τ) < 0 ∀τ}. |
| Dwork.localConditionAtLPrime | data | Ω_{l′} = p^{−1}{v_{l′}(t_τ) > 0 ∀τ}. |
| Dwork.localConditions_nonempty | characterisation | Ω_∞, Ω_l, Ω_{l′} are nonempty, open and Galois-invariant. |


**Uses that determine the API.**

- QIAN23 §4 (DM.9/qian-switching-theorem): the input of Moret-Bailly's theorem


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| localConditionAtL_example | computation | t = 1/l lies in Ω_{l,0} for every embedding (v_l(1/l) = −1 < 0). |
| localConditionAtLPrime_example | computation | t = l′ lies in Ω_{l′,0} (v_{l′}(l′) = 1 > 0) and avoids μ_N. |
| realPoints_nonempty | degenerate | Ω_∞ = T(ℝ) is nonempty because EF^suff has no real places. |
| localCondition_excludes_fermat_neighbourhood | non-example | t=l is near the Fermat point: v_l(t)>0, hence it is excluded from Ω_{l,0}, whose condition is v_l(t)<0. At a split coefficient prime this point gives the ordinary Fermat neighbourhood. A unit such as 1+l is not near t=0. |


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data; AlgebraicModuliForArithmeticGeometry:R09.3/r093-weil-restriction; AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits; AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §4, local opens and Proposition4.2, pp.23–24. Applies Moret-Bailly to T = Res_{EF^suff/ℚ}T_W with Ω_∞ = T(ℝ) and the opens Ω_l, Ω_{l′} defined by v_l(t_τ) < 0, v_{l′}(t_τ) > 0.


### DM.9/qian-switching-theorem — Qian's switching theorem for non-self-dual Dwork motives

**Theorem.** Keep the switching data of DM.9/switching-determinant-data. There are a finite totally real Galois L′/ℚ, linearly disjoint from F_0L over ℚ, and, with F′ = L′EF^suff, a point t ∈ T_0(F′) with a G_{F′}-equivariant isomorphism W ≅ V[λλ′]_t inducing φ_t on ∧^n, such that: (i) F′ ⊇ EF^suff is CM, finite Galois over F, with (F′)^+ = L′E^+F^suff; (ii) χ̄_1^{−1}V[λ]_t ≅ r̄|_{G_{F′}} and χ̄_2^{−1}V[λ′]_t ≅ r̄′|_{G_{F′}}; (iii) v(t) < 0 for every place v | l of F′ and v(t) > 0 for every v | l′; (iv) F′ ∩ F_2^avoid = ℚ and F′ ∩ F^avoid F_2^avoid = F, so F′ is linearly disjoint over F from every subextension of F^avoid F_2^avoid (in Qian's §4 these include F^av and F̄^{ker r̄}); (v) K = L′LF^suff(ζ_N) is finite Galois over ℚ with FK = F′ and K ∩ F^avoid = ℚ (the field that must be disjoint from F^avoid in the proof of Theorem 1.4; PAPER-QIAN-23/E3). Consequently V_{λ,t} has the prescribed residual representation at l, V_{λ′,t} at l′, V_{λ′,t} is ordinary at the places above l′ (DM.7/ordinary-near-fermat-point), and V_{λ′,t} has maximal unipotent (Steinberg-type) monodromy at the places above l (DM.7/steinberg-monodromy-away-from-coefficient-prime). No automorphy statement is made here.

**Hypotheses and boundaries.**

- the hypotheses of DM.9/switching-determinant-data


**Proof outline.**

1. Apply Moret-Bailly with three kinds of local conditions (PotentialModularityAndCompatibleSystems R23.1) over ℚ to T = Res_{EF^suff/ℚ}T_W with S_1 = {∞}, S_2 = ∅, S_3 = {l, l′}, the opens of DM.9/weil-restricted-local-conditions and H = F_0L; ℚ is totally real with its real place in S_1, so the extension L′ is totally real.
2. A point of T over L′ is a point of T_W over L′EF^suff = F′ (L′ and EF^suff linearly disjoint), i.e. t ∈ T_0(F′) with an isomorphism W ≅ V[λλ′]_t respecting φ: this gives (ii) after untwisting by χ̄_i, and (iii) from the local conditions.
3. (iv) and (v) are intersection computations with tower disjointness (R23.1), using that L′ is disjoint from F_0L, L from F_0, and F^avoid F_2^avoid F^suff from ℚ(ζ_N).
4. The local consequences at l′ and l are DM.7/ordinary-near-fermat-point (l′ ≡ 1 mod N, v(t) > 0 means t ∈ 𝔪) and DM.7/steinberg-monodromy-away-from-coefficient-prime (l′ ≠ l, v(t) < 0).


**Checks and worked cases.**

- For n = 2 the theorem reduces to the self-dual switch of BLGHT11 §6 with the real coefficient field, and its residual representations are symplectic.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data; PotentialAutomorphyDworkMotivesPartII:DM.9/weil-restricted-local-conditions; PotentialAutomorphyDworkMotivesPartII:DM.7/ordinary-near-fermat-point; PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime; PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-three-local-conditions; PotentialModularityAndCompatibleSystems:R23.1/tower-linear-disjointness.

**Sources and matches.**

- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, §4, Proposition4.2 and intersection computations, pp.23–24; final proof of Theorem1.4, p.26. Produces L′, F′ and t ∈ T_0(F′) with χ_1^{−1}V[λ]_t ≅ r̄|G_{F′}, χ_2^{−1}V[λ′]_t ≅ Sym^{n−1}r̄_{E,l′}|G_{F′}, v(t) < 0 above l and > 0 above l′, and the disjointness properties.


**Planet:** Qian's Dwork switching theorem.

### DM.9/self-dual-switching — Switching in the self-dual Dwork family

**Theorem.** Let F/F_0 be a finite Galois extension of totally real fields, I a finite set, and for i ∈ I: n_i even, l_i odd primes, r̄_i : G_F → GSp_{n_i}(𝔽̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}; let l′ be an odd prime distinct from every l_i, with max(l_i,l′)>10 for every i and r̄′_i : G_F → GSp_{n_i}(𝔽_{l′}) with multiplier ε̄_{l′}^{1−n_i}, and F^avoid/F finite Galois. Choose N odd, prime to 2∏l_i·l′, N > n_i + 1, divisible by no prime ramified in F^avoid, such that each r̄_i takes values in GSp_{n_i}(Z[ζ_N]^+/λ_i) for a prime λ_i | l_i of ℤ[ζ_N]^+ (DM.1/auxiliary-modulus, BLGHT11 Lemma 6.1), and λ′ | l′. Then the product over Spec K, K=F(ζ_N)^+, of the symplectic level-structure torsors T_{r̄_i × r̄′_i} over their independent parameter lines (T_0)_K (isomorphisms compatible with the symplectic structures, BLGGT14's correction) is geometrically irreducible, and for an auxiliary finite Galois avoidance field L/K and a finite set Σ of finite places whose residue characteristics divide neither N nor l′, Moret-Bailly gives a totally real F′/F_0 Galois, linearly disjoint from F^avoid over F, and t_i ∈ T_0(F′) with: V_{n_i}[λ_i]((N − 1 − n_i)/2)_{t_i} ≅ r̄_i|_{G_{F′}} and V_{n_i}[λ′]((N − 1 − n_i)/2)_{t_i} ≅ r̄′_i|_{G_{F′}} as symplectic representations; v(t_i) < 0 at every place above l_i (and, in the variant of Newton–Thorne and Fakhruddin–Khare–Patrikis, above Σ), v(t_i) > 0 at every place above l′. At such points: V_{λ′,t_i} is ordinary of weight 0 at the places above l′ (when l′ ≡ 1 mod N), has Hodge–Tate numbers {0, …, n_i − 1}, and at places above l_i (and Σ) the Weil–Deligne representation of V_{λ′,t_i} is an unramified twist of Steinberg.

**Hypotheses and boundaries.**

- n_i even; multipliers ε̄^{1−n_i}
- N chosen as above; l′ ≡ 1 mod N for the ordinarity at l′
- The base of the product torsor is (T₀)^I with one parameter t_i per factor. The avoidance condition is linear disjointness of field extensions over their stated base; it is not disjointness from a variety. The distinct-prime and >10 assumptions are the range of the product-monodromy node imported here.


**Proof outline.**

1. For each i, full symplectic monodromy at the two distinct primes and DM.5/two-prime-product-monodromy give a geometrically irreducible level torsor. Take their product over Spec K, with independent coordinates t_i; a product of geometrically irreducible K-varieties is geometrically irreducible. No assertion is made about a fibre product of all the torsors over one shared t.
2. Apply Moret-Bailly over a preliminary extension (PotentialModularityAndCompatibleSystems R23.1, the corrected BLGHT11 Proposition 6.2 and BLGGT14 Proposition 3.1.1) with the local opens v(t) < 0 above l_i and Σ, v(t) > 0 above l′.
3. Local properties: DM.7/ordinary-near-fermat-point at l′, DM.7/dwork-hodge-tate-weights, DM.7/steinberg-monodromy-away-from-coefficient-prime at l_i and Σ.


**Checks and worked cases.**

- n_i = 2: the residual representations are GL_2 = GSp_2-valued with determinant ε̄^{−1}, and the switch produces a fibre that is Steinberg above l_i, the shape used by BLGGT14 Theorem 3.1.2.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.2/self-dual-real-forms; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.5/two-prime-product-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sp; PotentialAutomorphyDworkMotivesPartII:DM.7/ordinary-near-fermat-point; PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime; PotentialAutomorphyDworkMotivesPartII:DM.7/dwork-hodge-tate-weights; PotentialAutomorphyDworkMotivesPartII:DM.1/auxiliary-modulus; PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-over-a-preliminary-extension.

**Sources and matches.**

- [BLGGT14](https://arxiv.org/abs/1010.2561v4), Proof of Theorem 3.1.2, pp. 42–44 (arXiv v4). Chooses N by BLGHT11 Lemma 6.1, constructs the sheaves V_{n_i,λ_i}((N − 1 − n_i)/2) and the covers T_{r̄_i × r̄′_i} of BLGHT11 §4 (with isomorphisms respecting the symplectic structures), and finds a point by Proposition 3.1.1 with v(t) < 0 above l_i and v(t) > 0 above l′.
- [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §§4–6: Proposition 4.2, Lemmas 5.1, 5.3, 6.1 and Proposition 6.2, pp. 25–41. The self-dual Dwork family, its symplectic monodromy, local Galois properties of its fibres and the Moret-Bailly variant used to find points.
- [QIAN23](https://arxiv.org/abs/2104.09761v1), arXiv:2104.09761v1, rank-two convention after Proposition3.2, p.13. Uses the self-dual family for n = 2.
- [ACC23](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 7.1.8, pp. 1091–1092; Corollary 7.2.4, p. 1100. Cohomological supersingular inertia uses negative fundamental-character exponents, and the auxiliary prime must be unramified in the avoidance field.


**Planet:** Self-dual Dwork switching.

### DM.9/kisin-local-constancy — Local constancy of Galois representations in the Dwork family (Kisin)

**Theorem.** Let v | l be a place of a number field F ⊇ ℚ(ζ_N), λ | l a place of M, t ∈ T_0(O_{F_v}) and an integer c≥1. There is an open ball U_t ∋ t in T_0(O_{F_v}) such that for all t′ ∈ U_t, W_{t,λ}/l^c ≅ W_{t′,λ}/l^c as representations of G_{F_v} (and likewise for finitely many λ simultaneously).

**Hypotheses and boundaries.**

- t integral with good reduction


**Proof outline.**

1. Fix c≥1. The reduction of the lisse integral sheaf modulo l^c has finite fibres, and the sheaf of isomorphisms from its constant fibre at t is represented by a finite étale cover of T₀. That cover has an F_v-rational point above t.
2. A finite étale morphism is locally an analytic isomorphism on F_v-points at such a rational point, by the nonarchimedean inverse function theorem (equivalently Hensel’s lemma). Its image therefore contains an open ball about t; a lift of t′ is the required G_{F_v}-equivariant isomorphism of finite fibres. Intersect the finitely many balls for simultaneous places. This proves only fixed finite-level local constancy; it asserts no isomorphism of the full p-adic representations.


**Checks and worked cases.**

- If t ≡ t′ modulo a high power of the uniformiser, the reductions W̄_{t,λ} and W̄_{t′,λ} are isomorphic.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system; PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; SchemeAndStackFoundations:SF.2.

**Actual upstream contracts behind the graph adapter.** tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, p.66; the roadmap uses its fixed finite-level consequence only. Uses Kisin's local constancy theorem to find open balls on which W_{t,λ} mod p^c is constant.
- [KIS99](https://doi.org/10.1007/PL00004706), Theorem 5.1, as cited by BCGNT25; original not read in this review (see sources and gaps). Secondary use or original-source pointer only. Local constancy in p-adic families of Galois representations.


### DM.9/berger-reduction-small-weight — Reductions of two-dimensional crystalline representations of small weight (Berger)

**Theorem.** Let p be odd and r:G_{ℚ_p}→GL₂(E) crystalline, with E/ℚ_p finite and cohomological Hodge–Tate weights {0,m}, 1≤m≤p−1. Fix a stable lattice and read its reduction semisimply. Either r is ordinary, or up to an unramified character its reduction is Ind_{G_{ℚ_{p²}}}^{G_{ℚ_p}}(ω₂^{−m}); hence on G_{ℚ_{p²}} it is an unramified twist of ρ̄_{2,m,0}=ε̄₂^m⊕(ε̄′₂)^m, with the positive cohomological Lubin–Tate characters of L7/local-model-rho-nm0. In particular its inertia is θ₂^m⊕θ₂^{pm}, θ₂=ω₂⁻¹, and the induced reduction is irreducible. The inertia characters are extended to the unramified quadratic Galois group by the indicated Lubin–Tate normalization. An unramified twist and a finite coefficient enlargement put the nonordinary filtered φ-module into Berger’s displayed normalization.

**Hypotheses and boundaries.**

- 1 ≤ m ≤ p − 1


**Proof outline.**

1. Up to an unramified twist, the dual r∨ is Berger’s V_{k,a_p}, k=m+1: §1.3 defines D_cris(V_{k,a_p}∨)=D_{k,a_p}, with filtration jumps 0,k−1. The unit-root case v_p(a_p)=0 is ordinary (translate the rank-two supplier’s weight signs). In the nonordinary case a_p is in the maximal ideal. Theorem 3.2.1(1), pp. 277–278, applies for 2≤k≤p+1; here k≤p. It gives the semisimplified reduction of V_{k,a_p} as an induced ω₂^{k−1}, with its stated unramified normalization. Dualizing gives the exponent −m and possibly changes the unramified twist. Restrict to the quadratic unramified group and use the two conjugates θ₂,θ₂^p. Since 1≤m≤p−1, the exponent is not divisible by p+1, so this induction is irreducible.


**Checks and worked cases.**

- For H¹ of an elliptic curve with supersingular good reduction and m=1, the inertia is ω₂⁻¹⊕ω₂^{−p}, whose determinant is ε̄_p⁻¹. The Tate module has the dual, positive ω exponents.


**Direct prerequisites.** PadicHodgeTheory:R06.2/plan/period-functors; PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion; LocalGaloisDeformationRings:L7/local-model-rho-nm0.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, pp.65–66. Splits the p-adic places into Σ^ord and Σ^ss using Berger's reduction theorem.
- [BER10](https://numdam.org/item/AST_2010__330__263_0.pdf), §1.3, p. 271 (D_{k,a_p}=D_cris(V_{k,a_p}∨)); Théorème 3.2.1(1), pp. 277–278. Berger states the reduction of V_{k,a_p} with D_cris of its dual equal to D_{k,a_p}. The cohomological application here uses that dual, k=m+1, and the negative fundamental-character powers.


### DM.9/bcgnt-local-dwork-points — Local Dwork points with prescribed reductions (Boxer–Calegari–Gee–Newton–Thorne)

**Theorem.** In the setting of the proof of BCGNT25 Theorem 6.2.4 (primes p ≡ −1 mod N, r ≡ 1 mod N, p_0, q, places 𝔭, 𝔯, 𝔮 of M above p, r, q, a CM field F_4 = K^+F_3 with K^+_v large and the residual representations r̄_𝔭, r̄_𝔯, r̄_{CM,𝔯}, ρ̄_{A,q} trivial on G_{F_{4,v}} for v | prp_0q), for k ∈ {m, nm} and each such v there is a nonempty open _kΩ_v ⊂ T_0(O_{F_{4,v}}) of points t with: (i) v ∈ Σ^ord: _kW̄_{t,𝔭} trivial, _kW_{t,𝔭} crystalline ordinary, _kW̄_{t,𝔯}, _kW̄_{t,𝔮} trivial; (ii) v ∈ Σ^ss: _kW_{t,𝔭} crystalline and connected to ρ_{k,1,0} (the Fontaine–Laffaille representation ⊕ε_2^{k−i}(ε′_2)^{i−1}), residuals trivial; (iii) v | r: _kW_{t,𝔯} crystalline ordinary, residuals trivial; (iv) v | p_0: all residuals trivial; (v) v | q: _kW_{t,𝔮} crystalline ordinary, residuals trivial. Here _kW denotes the twisted Dwork system of rank k.

**Hypotheses and boundaries.**

- p > nm with p ≡ −1 mod N; r, q ≡ 1 or split as specified; F_4 chosen so residual representations are trivial locally
- Use k>2 for the W-family: the m=2 modular-curve substitute is the separate rank-two target. Choose the preliminary local extensions first to contain an ordinary point, or the Fermat point with its component comparison, and to kill all finitely many residual representations. Then choose the global K⁺ realizing these local inclusions and avoiding B′; F₄=K⁺F₃. Local triviality of the four input residual systems alone is not claimed to imply all these extra conditions.


**Proof outline.**

1. (i), (iii), (v): DM.7/generic-crystalline-ordinarity gives an ordinary crystalline point; Kisin's local constancy (DM.9/kisin-local-constancy) and the component lemmas for weight-zero crystalline lifts (LocalGaloisDeformationRings L7, BCGNT25 Lemmas 5.1.4–5.1.5) give an open ball of such points with trivial residual representations after enlarging F_4.
2. (ii): at t = 0, W_{0,𝔭} restricted to inertia is ⊕ω_τ^{i−1}ω_{cτ}^{k−i} (DM.7/fermat-fibre-inertia-at-minus-one), so its crystalline lifts connect to ρ_{k,1,0} (BCGNT25 Lemma 5.1.3, LocalGaloisDeformationRings L7); local constancy gives an open neighbourhood.
3. (iv): any point with trivial residual representations near t = 0 after enlarging F_4.


**Checks and worked cases.**

- For k = m = 2 the ordinary points of (i) correspond to ordinary crystalline rank-two representations with Hodge–Tate weights {0, 1}.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.7/generic-crystalline-ordinarity; PotentialAutomorphyDworkMotivesPartII:DM.9/kisin-local-constancy; PotentialAutomorphyDworkMotivesPartII:DM.7/fermat-fibre-inertia-at-minus-one; PotentialAutomorphyDworkMotivesPartII:DM.7/crystalline-at-good-reduction; PotentialAutomorphyDworkMotivesPartII:DM.9/berger-reduction-small-weight; LocalGaloisDeformationRings:L7/connects-relation; LocalGaloisDeformationRings:L7/local-model-rho-nm0; LocalGaloisDeformationRings:L7/weight-zero-crystalline-connectedness.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, local data(i)–(v), pp.65–66. Constructs the opens _kΩ_v from Propositions 4.2.5–4.2.6, Kisin's local constancy and Lemmas 5.1.3–5.1.5.


### DM.9/cm-induced-seed — The CM-induced auxiliary system R_CM

**Construction.** In the proof of BCGNT25 Theorem 6.2.4: let F_1 be the Galois closure of FF_0, E/ℚ totally real cyclic of degree m disjoint from F_1 with p_0 unramified, L_1 = EF_1, q_1 an odd prime splitting completely in L_1 with v_1 | q_1 split as w_1⋯w_m in L_1. Choose an algebraic Hecke character Ψ_0 : 𝔸_{L_1}^× → M^× of the infinity type of Proposition 6.2.3(6a), unramified above the relevant set, with the restrictions Ψ_0|_{O^×_{L_{1,w_i}}} wildly ramified, pairwise distinct and of product 1; then (ArithmeticGaloisDuality R02.4, BCGNT25 Lemma 5.3.3) a CM F_2/F_1 and a finite-order twist Ψ_2 of Ψ_0 ∘ N_{L_2/L_1} with det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}. Then R_CM = {Ind_{G_{L_2}}^{G_{F_2}} Ψ_{2,λ}}_λ is a weakly compatible system of rank m, with Hodge–Tate weights {0, …, m − 1} and residual representations r̄_{CM,λ} absolutely irreducible on G_{F_2(ζ_N, ζ_r)} for the chosen r.

**Hypotheses and boundaries.**

- m ≥ 2
- the infinity type of BCGNT25 Proposition 6.2.3(6a)
- Keep F₂ linearly disjoint from the degree-m cyclic extension E and keep the determinant-correcting twist unramified at v₁. The chosen residual prime r differs from q₁, so reduction preserves the pairwise distinct wild q₁-power characters. N is unramified in L₂(ζ_r), which preserves the degree-m induction after restriction to F₂(ζ_N,ζ_r).


**Proof outline.**

1. Existence of Ψ_0 with prescribed infinity type and local restrictions: algebraic Hecke characters with prescribed restrictions to finitely many local unit groups (HSBT10 Lemma 2.2 as restated in BLGGT14 Lemma A.2.4; PotentialAutomorphyInfrastructurePartII PL.0).
2. The determinant correction by a finite-order twist after a CM base change is a root extraction of a finite-order character (ArithmeticGaloisDuality R02.4).
3. Induction of a compatible system of characters is a compatible system (PotentialModularityAndCompatibleSystems R24.5); distinctness of the local restrictions at w_i gives irreducibility of the residual induction.


**Checks and worked cases.**

- m = 1: R_CM is the character system of Ψ_2 itself.


**Planning API.** Names specify the intended interface; imported carriers are not redefined.

| Declaration | Role | Specification |
| --- | --- | --- |
| Dwork.CMSeed | structure | The data (E, L_1, q_1, Ψ_0, F_2, Ψ_2) of the construction. |
| Dwork.CMSeed.system | constructor | R_CM = {Ind_{G_{L_2}}^{G_{F_2}}Ψ_{2,λ}}. |
| Dwork.CMSeed.det | characterisation | det R_{CM,λ} = ε^{−m(m−1)/2}. |
| Dwork.CMSeed.hodgeTate | characterisation | HT_τ(R_{CM,λ}) = {0, …, m − 1}. |
| Dwork.CMSeed.residual_irreducible | other | r̄_{CM,𝔯}\|_{G_{F_2(ζ_N, ζ_r)}} is absolutely irreducible for the chosen r. |


**Uses that determine the API.**

- BCGNT25 proof of Theorem 6.2.4 (DM.9/bcgnt-auxiliary-dwork-systems): its residual representation at 𝔯 is the level structure of R_aux
- ModularityAndLanglandsExtensions ML.2 (BCGNT25 Theorem 6.2.4): the p–r switch Sym^{n−1}R ⊗ R_aux ↔ Sym^{n−1}R ⊗ R_CM


**Unit tests.**

| Name | Kind | Required behavior |
| --- | --- | --- |
| cmSeed_rank | computation | R_CM has rank m = [L_2 : F_2]. |
| cmSeed_induction_rank_one_boundary | degenerate | The formula Ind_{G_L}^{G_F}Ψ has rank one when L=F; this checks the underlying induction functor only. It is outside this seed construction, whose standing hypothesis is m≥2. |
| cmSeed_det | characterisation | det Ind Ψ_{2,λ} = ε^{−m(m−1)/2}, matching det W_λ for rank m. |
| cmSeed_needs_distinct_local | non-example | If the restrictions Ψ_0\|O^×_{w_i} were equal, Ind Ψ_0 could become reducible after restriction to G_{F(ζ_N,ζ_r)}; distinctness is what forces irreducibility. |


**Direct prerequisites.** PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters; ArithmeticGaloisDuality:R02.4/character-roots-after-base-change; PotentialModularityAndCompatibleSystems:R24.5/character-system; PotentialModularityAndCompatibleSystems:R24.5/system-operations; PotentialModularityAndCompatibleSystems:R24.5/induced-character-purity.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, construction of Ψ and R_CM, pp.64–65. Constructs Ψ_0 by HSBT10 Lemma 2.2, the CM extension F_2 and the twist Ψ_2 by Lemma 5.3.3, and R_CM = {Ind Ψ_{2,λ}}.


### DM.9/bcgnt-switching-primes — Choice of primes and fields for the p–r switch

**Theorem.** Given R (the rank-two compatible system of BCGNT25 Theorem 6.2.4 over F_2, with its set of good primes L(R)) and R_CM, there are primes N, p, r, q and fields with: N > 100nm + 100 prime, unramified in L_2 and M; p ≡ −1 mod N, r ≡ 1 mod N; p, r > 2nm + 1, p, r ∈ L(R|_{G_{F_2}}) prime to v_0v_1; p split in L_2 and M, r split in L_2(ζ_p) and M; Ψ_2 unramified above p and r; r̄_𝔭, r̄_𝔯 with image between SL_2 and GL_2; r̄_{CM,𝔯}|_{G_{F_2(ζ_N, ζ_r)}} absolutely irreducible; the p-adic places split into Σ^ord ∪ Σ^ss by DM.9/berger-reduction-small-weight; a solvable CM extension F₃/F₂(ζ_N), Galois over ℚ, linearly disjoint over F₂(ζ_N) from the field B cut out over F₂(ζ_N,ζ_p,ζ_r) by r̄_𝔭 × r̄_𝔯 × r̄_{CM,𝔯}; and, after adjoining e^{2πi/N} to M, a semistable elliptic curve A/ℚ with good reduction at p, r, p_0 and a prime q ∉ {p, r, p_0}, q > 2nm + 1, split in M, with ρ̄_{A,q}(G_{F_3}) = GL_2(𝔽_q) and A good ordinary at q.

**Hypotheses and boundaries.**

- the hypotheses of BCGNT25 Theorem 6.2.4


**Proof outline.**

1. Primes p ≡ −1, r ≡ 1 mod N with the splitting conditions have positive density (Chebotarev); the excluded sets are finite or of density zero (big image for R at almost all primes).
2. Berger's theorem sorts the places above p.
3. A semistable non-CM elliptic curve over ℚ has surjective mod-q image for almost all q and is ordinary at a density-one set of primes (Serre); choose q accordingly, avoiding p, r, p_0 (as corrected in the extraction's review).


**Checks and worked cases.**

- p = 2N − 1 and r = 2N + 1 satisfy the congruences when they are prime.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.9/berger-reduction-small-weight; PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed; tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev; PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, choice of N,p,r,q,F₃, p.65. Chooses the primes and fields with the listed properties.


### DM.9/bcgnt-auxiliary-dwork-systems — The auxiliary Dwork systems R_aux and S_UA (Boxer–Calegari–Gee–Newton–Thorne)

**Theorem.** Let m > 2 and keep the data of DM.9/bcgnt-switching-primes and DM.9/bcgnt-local-dwork-points. (1) Applying Moret-Bailly with surjective specialisation (PotentialModularityAndCompatibleSystems R23.1) to T(r̄_{CM,𝔯}|_{G_{F_4}}) (r ≡ 1 mod N, DM.5/level-structure-torsor), with f : π_1^ét(T) ↠ G the surjection onto the image G ⊆ GU_m(𝔽_{p²}) of the residual system W̄_𝔭 (G ⊇ SU_m(𝔽_{p²}), DM.5/residual-monodromy-su), F^avoid = B′F_4, S_0 = {p, r, p_0, q} and the opens _mΩ_v, gives a CM F_5 and t with R_aux = {W_{t,λ}}: r̄_{aux,𝔭}(G_{F_5}) = G with multiplier ε̄^{1−m}, r̄_{aux,𝔭}(G_{F_5(ζ_p)}) = SU_m(𝔽_{p²}), r̄_{aux,𝔯} ≅ r̄_{CM,𝔯}, and the local properties (i)–(v). (2) Applying it again to T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q}|_{G_{F_5}}) for the rank-nm Dwork system, with F^avoid enlarged by the field cut out by r̄_{aux,𝔭}, gives F_6 and S_UA with s̄_{UA,𝔭} ≅ s̄_{aux,𝔭}, s̄_{UA,𝔮} ≅ Sym^{nm−1}ρ̄_{A,q} and the local properties (Hermitian structures being unique over finite fields). The printed claims r̄_{aux,𝔭}(G_{F_5}) = GU_m(𝔽_{p²}) and F^avoid = B′F_5 are corrected as PAPER-BOXER-CALEGARI-GEE-ETAL-25/E29 and E32.

**Hypotheses and boundaries.**

- m > 2 (for m = 2 see DM.9/rank-two-auxiliary-system)
- η compatible with the Hermitian pairings (local E26)


**Proof outline.**

1. The torsors are smooth and geometrically irreducible (DM.5/level-structure-torsor-irreducible); the opens are nonempty (DM.9/bcgnt-local-dwork-points); the map f to the residual monodromy image is surjective on π_1^ét by definition of G as the full arithmetic image; its geometric subgroup contains SU_m.
2. Surjective specialization gives residual image exactly the actual quotient G. On G_{F₅(ζ_p)}, both the multiplier ε̄^{1−m} and determinant ε̄^{−m(m−1)/2} are trivial, so the image is contained in SU_m. Conversely SU_m is perfect in the stated range, and SU_m⊂G; commutators of lifts of its elements lie in G_{F₅(ζ_p)}, so SU_m⊂[G,G] lies in this restricted image. Thus equality holds. The multiplier alone need not have kernel SU_m, because x↦x^{1−m} on 𝔽_p× need not be injective.
3. The second application uses DM.0/hermitian-forms-unique to match the Hermitian structure of s̄_{aux,𝔭} with that of the rank-nm Dwork system.


**Checks and worked cases.**

- det r_aux = ε^{−m(m−1)/2} is compatible with the image G but not with GU_m(𝔽_{p²}) in full, which is why the printed equality is corrected.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-su; PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points; PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed; PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes; PotentialAutomorphyDworkMotivesPartII:DM.0/hermitian-forms-unique; PotentialModularityAndCompatibleSystems:R23.1/surjective-specialisation-finite-quotient; PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.3/twisted-dwork-local-system.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, R_aux and S_UA, pp.66–67. Applies Proposition 4.5.1 twice to the moduli spaces T(r̄_{CM,𝔯}) and T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q}) with the local opens, with the corrections E29 and E32.


**Planet:** Auxiliary Dwork systems R_aux, S_UA.

### DM.9/rank-two-auxiliary-system — The auxiliary system R_aux in rank two via twisted modular curves

**Theorem.** Let m = 2 in the setting of DM.9/bcgnt-auxiliary-dwork-systems. There are a CM field F_5/F_4, with F₅∩B′F₄=F₄, and an elliptic curve A_aux/F_5 such that R_aux = {H¹(A_aux)_λ} satisfies: H¹_ét(A_aux,𝔽_r) ≅ r̄_{CM,𝔯}|_{G_{F_5}} (symplectically); ρ̄_{A_aux,p}(G_{F_5(ζ_p)}) = SL_2(𝔽_p) = SU_2(𝔽_{p²}) up to the identification of SU_2 with SL_2; at v ∈ Σ^ss, ρ_{A_aux,p}|G_{F_{5,v}} connects to ρ_{2,1,0} (A_aux supersingular), at Σ^ord ordinary, at v | r ordinary, and the residual representations are trivial locally as in (i)–(v). The source omits this case ('a straightforward variant, left to the reader').

**Hypotheses and boundaries.**

- m = 2; r ≥ 3


**Proof outline.**

1. Use the twisted modular curve for the symplectic residual representation r̄_{CM,𝔯}∨, whose determinant is ε̄_r: the level structure is A[r]≅r̄_{CM,𝔯}∨, equivalently H¹_ét(A,𝔽_r)≅r̄_{CM,𝔯}. ModularCurves §5C constructs the fine smooth affine curve over ℚ and gives geometric irreducibility conditional on its connectedness contract. The CM-base version, that connectedness contract, and the universal elliptic curve must be supplied before applying Moret–Bailly here; they are recorded in the rank-two gap.
2. The remaining local construction must exhibit a nonempty neighbourhood on the twisted modular curve of a supersingular point whose lift connects to ρ_{2,1,0}, and ordinary neighbourhoods at the other prescribed places, after the finite local enlargements. Supersingularity of a chosen reduction alone does not prove the component comparison. This and the mod-p geometric monodromy statement are explicit proof inputs in the recorded rank-two gap, rather than consequences asserted from the existence of a CM point.
3. Moret-Bailly with surjective specialisation (R23.1), with f the mod-p monodromy of the universal curve, whose geometric image is SL_2(𝔽_p). Take the finite quotient G to be the actual arithmetic mod-p image of H¹ of the universal curve. Once the missing geometric SL₂-monodromy input is proved, commutators and the cyclotomic determinant give precisely SL₂ after restriction to G_{F₅(ζ_p)}; geometric monodromy alone does not say the full arithmetic quotient is SL₂.


**Checks and worked cases.**

- For m = 2, SU_2(𝔽_{p²}) ≅ SL_2(𝔽_p), so the image requirement is the familiar surjectivity onto SL_2(𝔽_p).
- The level-r input uses the dual of the CM seed on A[r]. Its determinant is ε̄_r, whereas H¹ and the seed have determinant ε̄_r⁻¹; confusing them fails the Weil-pairing test.


**Direct prerequisites.** PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes; PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-local-dwork-points; PotentialAutomorphyDworkMotivesPartII:DM.9/cm-induced-seed; tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ; PotentialModularityAndCompatibleSystems:R23.1/surjective-specialisation-finite-quotient.

**Sources and matches.**

- [BCGNT25](https://arxiv.org/abs/2309.15880v3), arXiv:2309.15880v3, proof of Theorem6.2.4, pp.66–67. For m = 2 the auxiliary system is built from a modular curve with level-r structure instead of the Dwork family, and the details are left to the reader.


## Required proof and supplier inputs

These inputs are part of the plan’s requirements. They are not proofs completed by the review, and no downstream use should erase their hypotheses.

### G1 — Hypergeometric convolution rank, local monodromy and determinant

Katz90 Chapter 8 was not cleared or read. The exact specialized statements are checked in BCGNT §4.2, BLGHT Lemma 4.3 and Katz09 Theorem 5.3. The convolution construction is specified here, but proofs of its rank, irreducibility, purity, tame local monodromy and determinant require the Katz Chapter 8 arguments. Import the existing lower-shriek/base-change/trace contracts; do not count those imports as a proof of Katz’s theorem.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties; PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-local-monodromy; PotentialAutomorphyDworkMotivesPartII:DM.4/unipotent-monodromy-at-infinity.

### G2 — Finite classical-group classification, unitary generation and cross-characteristic orders

The odd-characteristic n>2 transvection classification and restricted order comparisons are checked in their Qian/BLGHT/BCGNT applications, not against unread ZS76 and Artin55 originals. Supply the precise classification with exceptional cases, the unitary long-root generation/perfectness proof and the rank-two Dickson input used by BLGHT. A large-order element is not a substitute for checking the exception list. Handle Sp₂(𝔽₃) by its solvable composition factors, not by claiming it perfect.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.0/special-linear-unitary-simple; PotentialAutomorphyDworkMotivesPartII:DM.0/zalesskii-serezhkin-classification; PotentialAutomorphyDworkMotivesPartII:DM.0/artin-non-isomorphism; PotentialAutomorphyDworkMotivesPartII:DM.5/residual-monodromy-sp.

### G3 — Twisted modular-curve rank-two construction

Current ModularCurves §5C supplies a fine curve over ℚ and only conditional geometric connectedness. Supply its CM-base version, the connectedness contract and universal elliptic curve with the required integral good reduction. Prove full geometric mod-p SL₂ monodromy and nonempty ordinary/supersingular component neighbourhoods after the prescribed finite local extensions. Use A[r]≅r̄_CM,r∨, equivalently H¹(A,𝔽_r)≅r̄_CM,r. Existence of a supersingular CM point alone does not establish the component comparison.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.9/rank-two-auxiliary-system.

### G4 — General-character ordinarity remains conditional

Retain maximal nilpotence for every conjugate eigenspace and consecutive labelled Hodge–Tate weights as separate hypotheses. Qian21 Lemma 4.2 omits the latter (E10), and zero occurring in the exponent vector is not sufficient for maximal unipotence (E20). The selected zero-shaped data have the separate DM.4 and DM.7 proofs. No general limiting-mixed-Hodge argument supplying consecutive weights is asserted.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.8/conditional-regular-ordinarity.

### G5 — Equivariant correspondence comparison

KM74 Theorem 2(1)–(2), pp. 76–77, was read directly. The rational Künneth projectors and algebraic-correspondence comparison must be exposed by RD.7 for the H-character projector, rather than inferred from its untwisted Frobenius statement. This gap concerns the supplier API, not unavailability of KM74 or Deligne §7.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent.

### G6 — Tame specialization and curvewise crystalline companions

LPV.0–LPV.1 must supply the tame specialization formula near ∞, giving the nonzero valuation multiple of N∞ when v(t)<0 and residue characteristic is prime to N. DK17 §§5.1–5.3 transfer slopes by companions on smooth curves; they do not provide arbitrary-dimensional crystalline companions. Supply Abe’s curve companion input and the required full-faithfulness/restriction arguments in RD.2–RD.3; justify the choice of a curve meeting the needed open, since an arbitrary such intersection can be empty.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.7/steinberg-monodromy-away-from-coefficient-prime; PotentialAutomorphyDworkMotivesPartII:DM.7/drinfeld-kedlaya-slope-bound.

### G7 — Recognition and coefficient control of the comparison character

R24.5 owns the Hecke-character converse for algebraic/de Rham characters. Show the comparison characters satisfy its algebraicity and finite-ramification hypotheses without using DM.7, or state the precise compatible-character Henniart theorem used in BCGNT §4.2. The forward AG2.0 construction and compatible rational Frobenius values by themselves are insufficient. This is a supplier-hypothesis gap, not a new Hecke-character target.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character.

### G8 — Fixed finite coefficient field in root extraction

The read R02.4 root statement permits values in an algebraic closure. Establish the stronger finite-field-valued root with the prescribed disjointness, or its primary-component variant; a root outside the chosen coefficient field does not define the required fixed-coefficient level torsor.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data.

### G9 — Equivariant toroidal subdivision

SF.4 supplies strictly semistable schemes and alterations, but the needed equivariant unimodular subdivision after a ramified base change is an additional contract, requested there. General alteration existence does not prove an equivariant blowup preserving this generic fibre. Retain the extension degree e, and assert semistability over the resulting F′ rather than over F.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model.

### G10 — Nonarchimedean local inverse for a finite étale cover

The fixed finite-level proof reduces to the local analytic inverse/Hensel statement at an F_v-rational point of a finite étale cover. Record this analytic contract explicitly in the supplier interface. Kisin’s stronger theorem is not used, and Berger’s §1.3 and Theorem 3.2.1 were read directly.

Needed by: PotentialAutomorphyDworkMotivesPartII:DM.9/kisin-local-constancy.

## Supplier requests

**SchemeAndStackFoundations:SF.4**. Equivariant toroidal semistable reduction (Kempf–Knudsen–Mumford–Saint-Donat): for a log smooth (toroidal) family over a complete discrete valuation ring with a finite group acting on the toroidal charts by characters, a subdivision of the conical complex into unimodular simplices gives, after a totally ramified base change of suitable degree e, an equivariant projective blowup that is strictly semistable.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.8/equivariant-semistable-model.

**tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group**. π_1 of ℙ¹(ℂ) − {0, 1, ∞} is free on two peripheral loops, with the product relation among the three peripheral classes in the layer's composition convention.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations.

**tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev**. The Chebotarev density theorem: Frobenius elements are dense, and primes with prescribed Frobenius conjugacy class in a finite Galois extension have positive Dirichlet density.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-nth-power; PotentialAutomorphyDworkMotivesPartII:DM.9/bcgnt-switching-primes.

**tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ**. Import §5C’s fine smooth affine twisted modular curve over ℚ for the torsion-level representation r̄_CM,r∨ with determinant ε̄_r. Its geometric irreducibility is conditional on its connectedness contract. The CM-base version, connectedness comparison, universal elliptic curve with the needed good reduction, full mod-p geometric SL₂ image, and nonempty ordinary/supersingular local component neighbourhoods are additional contracts required for DM.9, not conclusions already supplied by §5C.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.9/rank-two-auxiliary-system.

**PotentialModularityAndCompatibleSystems:R24.5**. Use its character-system converse to algebraic Hecke characters after checking finite ramification and local algebraicity/de Rhamness of Ψ_λ. Supply an independent proof of that algebraicity for the comparison character, or the exact compatible-character recognition theorem used in BCGNT Lemma 4.2.4; rational compatible Frobenius values alone are not the hypothesis check.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.3/twisting-hecke-character.

**SchemeAndStackFoundations:SF.2**. Graph routing only: the atlas snapshot has no stage ID for this pending upstream target. The actual supplier is tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f02-finite-étale-galois-categories-and-the-étale-fundamental-groupoid. Finite étale covers versus finite continuous π₁-sets, finite lisse coefficient modules, paths, and the connected-cover/transitive-action equivalence. This is an import from open upstream PR #938, read at f6257a790885024c5a61e106bc128bd81e994d52, not a completed library theorem. SF.2 itself is not asserted to prove this contract.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor; PotentialAutomorphyDworkMotivesPartII:DM.5/level-structure-torsor-irreducible; PotentialAutomorphyDworkMotivesPartII:DM.9/kisin-local-constancy.

**SchemeAndStackFoundations:SF.2**. Graph routing only: the atlas snapshot has no stage ID for this pending upstream target. The actual supplier is tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f0a2-the-arithmetic-fundamental-group-sequence. For a geometrically connected qc scheme over a field, the exact sequence 1→π₁(X_kbar)→π₁(X)→G_k→1 and the rational-point section up to geometric conjugacy; PR #938 §F.0.A2. SF.2 itself is not asserted to prove this contract.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.5/determinant-descends.

**SchemeAndStackFoundations:SF.2**. Graph routing only: the atlas snapshot has no stage ID for this pending upstream target. The actual supplier is tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f21-proper-base-change-for-arbitrary-torsion. Proper base change at finite torsion levels; §F.3 smooth-proper lissity and path-aware fibre transport; §§F.4.1–F.4.6 normalized integral/rational realization, finite coefficient extension and cup/group compatibility; §F.6 smooth purity and Poincaré duality on the stated smooth proper invertible-coefficient domain. Import these existing PR #938 targets, retaining their hypotheses. SF.2 itself is not asserted to prove this contract.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/fermat-hypersurface-cohomology; PotentialAutomorphyDworkMotivesPartII:DM.2/eigensheaf-duality.

**SchemeAndStackFoundations:SF.2**. Graph routing only: the atlas snapshot has no stage ID for this pending upstream target. The actual supplier is tauceti:TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison#layer-12-relative-comparison. Finite-level relative Artin comparison, compatible with finite group actions and monodromy, plus EllAdicRealization Layer 10 for integral/rational passage. Both are existing CohomologicalPointCounting PR #196 targets, head 4bd72379658126cbe9be935656396f0c9dac4de0. SF.2 itself is not asserted to prove this contract.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.2/dwork-eigensheaves; PotentialAutomorphyDworkMotivesPartII:DM.2/integral-cohomology-torsion-free; PotentialAutomorphyDworkMotivesPartII:DM.4/dwork-monodromy-representations.

**SchemeAndStackFoundations:SF.2**. Graph routing only: the atlas snapshot has no stage ID for this pending upstream target. The actual supplier is tauceti:TauCetiRoadmap/EtaleCohomologyFoundations#f24-constructible-lower-shriek-and-arbitrary-base-change. EtaleCohomologyFoundations §§F.2.4–F.2.7 and F.4 define Rm_!, external products and compact-support Künneth over the coefficient domains used here, with coherent associativity and base change; use the existing targets for the n-fold convolution, without replanning six operations in DM.3. SF.2 itself is not asserted to prove this contract.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.3/katz-hypergeometric-sheaf.

**SchemeAndStackFoundations:SF.2**. Graph routing only: the atlas snapshot has no stage ID for this pending upstream target. The actual supplier is tauceti:TauCetiRoadmap/CohomologicalPointCounting/TraceFormula#layer-11-grothendieck--lefschetz. Grothendieck–Lefschetz for separated finite-type finite-field schemes and invertible finite ctf coefficients, and its rational corollary through EllAdicRealization, compatible with twists and finite groups; existing PR #196 TraceFormula Layer 11. SF.2 itself is not asserted to prove this contract.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.3/hypergeometric-sheaf-properties; PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent.

**PadicDifferentialEquationsAndRigidCohomology:RD.7**. Extend the smooth-projective crystalline–ℓ-adic Frobenius comparison to rational correspondences and the finite H-character projectors: KM74 Theorem 2(1)–(2), pp. 76–77. State the coefficient-field eigensummand form for h·Frob and retain the needed smooth proper and cycle-class hypotheses.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.6/frobenius-polynomials-independent.

**ArithmeticGaloisDuality:R02.4**. A root character valued in the fixed finite coefficient field, after a totally real Galois extension disjoint from the prescribed avoidance field. A root only in an algebraic closure is insufficient for the determinant torsor. Retain μ_n in that finite field, or explicitly prove the primary-component variant.

Consumers: PotentialAutomorphyDworkMotivesPartII:DM.9/switching-determinant-data; PotentialAutomorphyDworkMotivesPartII:DM.6/determinant-matching-at-auxiliary-prime.

## Baseline statement audit

Every declaration below was read in its module at the pinned Mathlib commit. It supplies only the stated interface; the roadmap does not infer missing cohomology or finite-group classification from a name.

| Reference | Module | Confirmed statement and scope |
| --- | --- | --- |
| mathlib:AlgebraicGeometry.Smooth | Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean | Smooth morphisms of schemes |
| mathlib:FiniteField.frobenius_pow | Mathlib/FieldTheory/Finite/Basic.lean | For a field of characteristic p, with p prime and cardinality p^r, the r-th power of its Frobenius ring homomorphism is the identity. |
| mathlib:FundamentalGroup | Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean | The endomorphism group of the chosen point in the fundamental groupoid of a topological space; multiplication is p*q=q.trans p, which fixes the peripheral-order dictionary. |
| mathlib:IsPrimitiveRoot | Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean | Primitive roots of unity |
| mathlib:LinearMap.IsSymm | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean | For a sesquilinear form semilinear first and linear second with scalar homomorphism I, symmetry is I(B(x,y))=B(y,x). Use the flipped linear-first form here. |
| mathlib:LinearMap.SeparatingLeft | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean | For a sesquilinear form, the only vector annihilating every vector in the right slot is zero; this is the nondegeneracy condition used for forms here. |
| mathlib:Matrix.GeneralLinearGroup | Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean | GL_n(R) as the units of the matrix ring |
| mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec | Mathlib/LinearAlgebra/Matrix/Transvection.lean | Every finite square matrix over a field, including singular matrices, factors as a list of elementary transvections times a diagonal matrix times another list. For an SL matrix its diagonal is invertible with determinant one; the elementary two-by-two identity in DM.0 supplies the remaining step. |
| mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple | Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean | For a field F with 4≤Nat.card F, PSL₂(F) is a simple group; this does not cover F₃. |
| mathlib:Matrix.SL2.commutator_eq_top | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | Over a field F, if a≠0 and a²≠1 for some a, the commutator subgroup of SL₂(F) is all of SL₂(F). Such an a exists when #F>3; this does not apply to SL₂(𝔽₃). |
| mathlib:Matrix.SpecialLinearGroup | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | SL_n(R), matrices of determinant one |
| mathlib:Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | For a commutative coefficient ring and a finite matrix index, the centre of SL is equivalent to the roots of unity of order max(card(index),1). In the positive-dimensional uses here this is the scalar n-th roots of unity. |
| mathlib:Matrix.TransvectionStruct | Mathlib/LinearAlgebra/Matrix/Transvection.lean | Bundled data of an elementary transvection |
| mathlib:Matrix.charpoly | Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean | Characteristic polynomial of a square matrix |
| mathlib:Matrix.conjTranspose | Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean | Conjugate transpose with respect to a star structure |
| mathlib:Matrix.rank | Mathlib/LinearAlgebra/Matrix/Rank.lean | Rank of a matrix over a commutative ring |
| mathlib:Matrix.transvection | Mathlib/LinearAlgebra/Matrix/Transvection.lean | Elementary transvection matrices 1 + c·E_{ij} |
| mathlib:MonoidAlgebra | Mathlib/Algebra/MonoidAlgebra/Defs.lean | Group (monoid) algebras R[G] |
| mathlib:MulAction.IwasawaStructure.isSimpleGroup | Mathlib/GroupTheory/GroupAction/Iwasawa.lean | A nontrivial perfect group with a faithful quasi-preprimitive action and an IwasawaStructure is simple. The required abelian normal stabilizer subgroups and generation are hypotheses, not consequences of this criterion. |
| mathlib:MvPolynomial | Mathlib/Algebra/MvPolynomial/Basic.lean | Multivariate polynomials |
| mathlib:Nat.exists_prime_and_dvd | Mathlib/Data/Nat/Prime/Defs.lean | Every integer other than 1 has a prime divisor |
| mathlib:Polynomial.cyclotomic | Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean | Cyclotomic polynomials |
| mathlib:Subgroup.goursat | Mathlib/GroupTheory/Goursat.lean | Goursat's lemma: subgroups of a product are graphs of isomorphisms between subquotients |
| mathlib:ZMod | Mathlib/Data/ZMod/Defs.lean | The ring ℤ/nℤ |
| mathlib:ZMod.pow_totient | Mathlib/FieldTheory/Finite/Basic.lean | Euler's theorem in (ℤ/nℤ)^× |
| mathlib:gaussSum | Mathlib/NumberTheory/GaussSum.lean | Gauss sums of a multiplicative and an additive character of a finite ring |
| mathlib:gaussSum_mul_gaussSum_eq_card | Mathlib/NumberTheory/GaussSum.lean | Over a finite field, for nontrivial multiplicative χ and primitive additive ψ, gaussSum(χ,ψ) gaussSum(χ⁻¹,ψ⁻¹)=#F. DM.6 must also translate Qian’s leading minus and use the odd-order value χ(−1)=1. |
| mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units | Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean | For a finite field extension L/K and a multiplicative 1-cocycle on Aut_K(L) valued in L×, there is β∈L× with f(g)=g(β)/β. This is the matrix-free Hilbert90 scalar descent used in DM.0. |
| mathlib:jacobiSum | Mathlib/NumberTheory/JacobiSum/Basic.lean | Jacobi sums of two multiplicative characters |
| mathlib:minpoly | Mathlib/FieldTheory/Minpoly/Basic.lean | Minimal polynomial of an element of an algebra |
| mathlib:orderOf | Mathlib/GroupTheory/OrderOfElement.lean | Order of an element of a monoid |
| mathlib:FiniteField.unitsMap_norm_surjective | Mathlib/FieldTheory/Finite/GaloisField.lean | For fields K⊆K′ with K′ finite, the norm on units K′×→K× is surjective, with no odd-characteristic restriction. |
| mathlib:Algebra.trace_surjective | Mathlib/RingTheory/Trace/Basic.lean | The trace of a finite-dimensional separable field extension is surjective; finite fields are perfect. |
| mathlib:Matrix.unitaryGroup | Mathlib/LinearAlgebra/UnitaryGroup.lean | Existing unitary matrix carrier over a star ring, with its group structure; use the quadratic finite-field automorphism for star. |
| mathlib:Matrix.specialUnitaryGroup | Mathlib/LinearAlgebra/UnitaryGroup.lean | Existing determinant-one unitary matrix carrier; no new U or SU definition is needed. |
| mathlib:Matrix.mem_specialUnitaryGroup_iff | Mathlib/LinearAlgebra/UnitaryGroup.lean | Membership is exactly membership in unitaryGroup together with determinant one. |
| mathlib:Matrix.mem_unitaryGroup_iff' | Mathlib/LinearAlgebra/UnitaryGroup.lean | For square matrices over a commutative star ring, M∈Matrix.unitaryGroup iff star M * M=1; the matrix star is conjugate transpose. The companion criterion mem_unitaryGroup_iff uses M * star M=1. |


## Source access and editions

All results and diagnostics here are stated in the roadmap’s own words. Source locators refer to the edition actually read. A pointer to an unavailable original is distinguished from a verification. No source passage or scan is embedded in these deliverables.

**[QIAN23](https://arxiv.org/abs/2104.09761v1) — Potential automorphy for GL_n.** Lie Qian. Invent. Math. 231 (2023), 1239–1275, DOI 10.1007/s00222-022-01161-6. This review read arXiv:2104.09761v1, 26 pp. Published numbering is retained only as a cross-reference: v1 Lemma 3.6 becomes published 3.7, Proposition 3.7 becomes 3.8, and Lemmas 3.8–3.10 become 3.9–3.11. The full published PDF could not be retrieved; published-only E2, E4 and E17 are not verified. The indexed final paragraph after Remark 4.4 supports E3 separately.

- §2 (Lemmas 2.1–2.4) in full
- §3 (Dwork motives: exponent data, Lemma 3.1, Proposition 3.2, Lemmas 3.3–3.4, Corollary 3.5, residual monodromy, Proposition 3.7 = published 3.8, Lemmas 3.8–3.10 = published 3.9–3.11) in full
- §4 (proof of Theorem 1.1: choice of N and l′, Lemma 2.1 applications, Moret-Bailly, Proposition 4.2) in full

PDF SHA-256: 4110023d4691d628adbc96842793696978de962b6109044e5d32779160835415.

**[QIAN21](https://arxiv.org/abs/2103.00106v1) — Ordinarity of local Galois representation arising from Dwork motives.** Lie Qian. Preprint arXiv:2103.00106v1 (27 February 2021)

- Theorem 1.1, Remark 1.2, Definition 1.3, Theorem 1.4, Proposition 1.5 (pp. 2–3)
- Lemma 2.1, Remark 2.2, Theorem 2.3, Remark 2.4 (pp. 4–13)
- §4, Lemmas 4.1–4.3 (pp. 19–23)

PDF SHA-256: 87c4ee8499f3a615a81307e17d38d6f00ab544da9d22384f213bbc06052722e9.

**[BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf) — A family of Calabi–Yau varieties and potential automorphy II.** Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor. Publ. Res. Inst. Math. Sci. 47 (2011), 29–98; final author copy, author pagination

- §4 The Dwork family I (Lemma 4.1, Proposition 4.2, Lemma 4.3, Corollaries 4.4–4.8), pp. 25–33
- §5 The Dwork family II (Lemmas 5.1–5.3), pp. 33–38
- §6, Lemma 6.1 and Proposition 6.2 with proofs, pp. 39–41

PDF SHA-256: 225cab84210837ca6130c1c76a5eababeffeaa8d1594b6267e853ce0ae8eabb3.

**[BCGNT25](https://arxiv.org/abs/2309.15880v3) — The Ramanujan and Sato–Tate conjectures for Bianchi modular forms.** George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne. Forum Math. Pi 13 (2025), e10, DOI 10.1017/fmp.2024.29. This review read arXiv:2309.15880v3, 27 March 2025, author pagination. Journal page numbers in inherited locators are cross-references, not a claim to have read that edition.

- §1.6, p. 12, local Artin reciprocity and Hodge–Tate conventions
- §4, author pp. 40–48, all Dwork definitions, comparison, determinant, ordinarity, unitary groups, torsors and inertia statements and proofs
- Lemma 5.2.3, author p. 51, finite classical-group input
- Proposition 6.2.3 and Theorem 6.2.4 with proof, author pp. 60–67, switching and avoidance fields

PDF SHA-256: 0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d.

**[KATZ09](https://web.math.princeton.edu/~nmk/dworkfamilyfinal.pdf) — Another look at the Dwork family.** Nicholas M. Katz. In: Algebra, Arithmetic, and Geometry: in honor of Yu. I. Manin, Vol. II, Progr. Math. 270, Birkhäuser 2009, 89–126; author's final copy

- §5, Lemmas 5.1–5.2, Theorem 5.3, Remark 5.4, Question 5.5 (pp. 95–97)
- §8, Corollary 8.7 and Lemma 8.8 (pp. 113–114)

PDF SHA-256: 36180e1cf977f25fe01cf7248ff95cab00d88167c77ea3d7ee67061e3b0acbd0.

**[DK17](https://arxiv.org/abs/1604.00660v11) — Slopes of indecomposable F-isocrystals.** Vladimir Drinfeld, Kiran S. Kedlaya. Pure Appl. Math. Q. 13 (2017); read in arXiv:1604.00660v11 (29 September 2018)

- Theorem 1.1.5, Theorem 1.3.3, Remarks 1.3.4–1.3.6
- §§5.1–5.3: slope restrictions and companions on smooth curves; no arbitrary-dimensional companion theorem is imported

PDF SHA-256: d4e6c409f78e2ae25e3cadd932999807b3481af1aad5b4b52d273f0accd1c37a.

**[BLGGT14](https://arxiv.org/abs/1010.2561v4) — Potential automorphy and change of weight.** Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor. Ann. of Math. 179 (2014), 501–609; read in arXiv:1010.2561v4

- §3.1, Proposition 3.1.1 and Theorem 3.1.2 with the Dwork-family part of its proof, pp. 41–44
- §5.1 (weakly compatible systems), consulted for the definition

PDF SHA-256: c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24.

**[DMOS82](https://www.jmilne.org/math/Documents/Deligne82.pdf) — Hodge cycles on abelian varieties (in: Hodge cycles, motives, and Shimura varieties).** Pierre Deligne (notes by J. S. Milne). Deligne, Hodge cycles on abelian varieties, Chapter I of LNM 900 (1982); updated author chapter dated 1 October 2018, 67 pp. The chapter text, not the poor-text-layer book scan, was used for §7.

- §7, pp. 45–50: Propositions 7.4, 7.6 and 7.10, Fermat characters, Hodge types and Jacobi-sum Frobenius.


**[KATZ90](https://doi.org/10.1515/9781400882434) — Exponential sums and differential equations.** Nicholas M. Katz. Annals of Mathematics Studies 124, Princeton University Press 1990

- Not obtained. Chapter 8 (hypergeometric sheaves, Theorems 8.4.2 and 8.12.2) is cited for the statements as BLGHT11 (proof of Lemma 4.3) and BCGNT25 (proof of Theorem 4.2.1) apply them; recorded as a gap.


**[BH89](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0095/LOG_0022.pdf) — Monodromy for the hypergeometric function nF(n−1).** Frits Beukers, Gert Heckman. Invent. Math. 95 (1989), 325–354

- Definition 2.9 and Proposition 2.10, p. 330; Proposition 3.3 and Theorem 3.5 with proof, pp. 331–332; Corollary 3.6, p. 332. Read from page images; keep the source peripheral order explicit.

PDF SHA-256: ba23f843fcbb385703be08da7fabf1a77413f7f5bbced89a72f3f41530857e61.

**[ZS76](https://doi.org/10.1070/IM1976v010n01ABEH001676) — Linear groups generated by transvections.** A. E. Zalesskii, V. N. Serezhkin. Izv. Akad. Nauk SSSR Ser. Mat. 40 (1976); Math. USSR-Izv. 10 (1976), 25–46

- Official MathNet first page and abstract only. Full classification proof and exception list unavailable. The restricted application was checked in Qian v1 Lemma 3.6, BLGHT Lemma 4.6 and BCGNT Lemma 5.2.3; the original remains a gap.


**[ARTIN55](https://doi.org/10.1002/cpa.3160080403) — The orders of the classical simple groups.** Emil Artin. Comm. Pure Appl. Math. 8 (1955), 455–472

- Not obtained. Theorem 2 is used in the form stated in QIAN23 (proof of Proposition 3.8); recorded as a gap.


**[LEWIS82](https://doi.org/10.1016/0024-3795(82)90258-2) — The isometry classification of Hermitian forms over division algebras.** D. W. Lewis. Linear Algebra Appl. 43 (1982), 245–272

- Not obtained; §4 cited by BCGNT25 (proof of Lemma 4.3.4). The finite-field case is proved directly in DM.0/hermitian-forms-unique.


**[KM74](https://www.math.mcgill.ca/goren/SeminarOnCohomology/Katz-Messing.pdf) — Some consequences of the Riemann hypothesis for varieties over finite fields.** Nicholas M. Katz, William Messing. Invent. Math. 23 (1974), 73–77

- Theorem 2(1)–(2), pp. 76–77, including rational Künneth projectors and algebraic correspondences; read from page images. The equivariant eigensummand supplier API is still requested from RD.7.

PDF SHA-256: cc167baa409cb675bbca689ec35af6b76a6491a9608be82452620cb7764facf2.

**[KIS99](https://doi.org/10.1007/PL00004706) — Local constancy in p-adic families of Galois representations.** Mark Kisin. Math. Z. 230 (1999), 569–593

- Original theorem not obtained. This plan uses only fixed finite-coefficient local constancy, proved through the finite étale Isom cover and the requested nonarchimedean local inverse theorem; it does not assert Kisin’s stronger result.


**[BER10](https://numdam.org/item/AST_2010__330__263_0.pdf) — Représentations modulaires de GL2(Qp) et représentations galoisiennes de dimension 2.** Laurent Berger. Astérisque 330 (2010), 263–279

- §1.3, p. 271, D_cris(V_{k,a_p}∨)=D_{k,a_p} and filtration normalization
- Théorème 3.2.1(1), pp. 277–278: reduction for 2≤k≤p+1; use the dual and semisimplification in this cohomological application.

PDF SHA-256: b7c9145da30892de6bf03b3bebf4f01a0142134674ed9dfe1426d0d48105d134.

**[ACC23](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf) — Potential automorphy over CM fields.** Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne. Ann. of Math. 197 (2023), 897–1113; published-pagination author copy, read in the maintainer-cleared library.

- Lemmas 7.1.7–7.1.8, pp. 1091–1092, disjointness and supersingular cohomological inertia
- Corollary 7.2.4, p. 1100, statement and auxiliary-prime paragraph of its proof.


**[CEGS](https://www.ma.imperial.ac.uk/~tsg/Index_files/cegsC.pdf) — Components of moduli stacks of two-dimensional Galois representations.** Caraiani, Emerton, Gee and Savitt. Public author PDF, §1.4, pp. 5–6, read 19 October 2026.

- §1.4, Lemma 1.4.1 and the following product formula, p. 5; cohomological Hodge–Tate convention on p. 6.


**[ACAMPO24](https://arxiv.org/abs/2407.16481v1) — Dwork motives, monodromy and potential automorphy.** Lambert A’Campo. arXiv:2407.16481v1

- Definitions 2.1.1–2.1.2 and Proposition 2.1.3, pp. 7–8
- Lemmas 2.4.5 and 2.5.4; Proposition 2.5.7, pp. 19–20, peripheral eigenvalues and Jordan multiplicities.

PDF SHA-256: 39c42cfdc0367dab692cf11f3923c5846e42aed41f931b7d9b84fa1557bb1c63.

## Independently reviewed source findings

The 31 findings below have individual review verdicts. E2, E4 and E17 are rejected as unverified publication-specific allegations because the published Qian pages were not retrieved. This does not reject the mathematical safeguards retained in the targets. The other 28 verdicts concern the read editions, not an unexamined later edition.

### E1 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Definition4.3.1, arXiv v3 p.45.

**Diagnostic (paraphrase).** The multiplier-kernel definition is labelled special unitary.

**Correction or safeguard.** Use U=ker ν and SU=U∩SL; retain both equations when using perfectness.

**Check.** In 𝔽₉ choose a norm-one ζ≠1. The matrix diag(ζ,1) has multiplier one and determinant ζ, so it is in U and outside SU.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E2 — rejected

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Published Lemma3.12, pp.1267–1268 (unread in this review).

**Diagnostic (paraphrase).** The earlier extraction alleges a maximal-monodromy statement for unrestricted t in the published Lemma 3.12. That published page was not retrieved in this review.

**Correction or safeguard.** The roadmap requires v(t)<0 and residue characteristic prime to N for maximal local monodromy at infinity.

**Check.** The safeguard is necessary: t=0 has smooth proper reduction when the residue characteristic is prime to N, so an ℓ-adic representation with ℓ different from that characteristic is unramified and has monodromy operator zero. This does not independently establish what the unread published lemma says.

**Verdict scope.** The exact publication-specific allegation could not be independently checked. The weaker mathematical safeguard is justified above; rejection is for lack of source verification, not a finding that the allegation is false.

### E3 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), §4, final disjointness paragraph, arXiv v1 p. 26; published final paragraph after Remark 4.4, p. 1274 (indexed text); ACC Lemma 7.1.7 p.1091.

**Diagnostic (paraphrase).** The final disjointness argument names F′ as disjoint over ℚ from a normal closure containing F.

**Correction or safeguard.** Use K=L′L F^suff(ζ_N), disjoint from the avoidance field over ℚ, and apply ACC Lemma 7.1.7 to F′=FK.

**Check.** Both F′ and the normal closure contain the nontrivial CM field F, so disjointness over ℚ is impossible. The preceding intersection calculation is for K, which is exactly the extension permitted by ACC.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E4 — rejected

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Published Lemma2.3 proof, pp.1249–1250 (unread in this review).

**Diagnostic (paraphrase).** The earlier extraction alleges minus signs in the final target of the published Lemma 2.3 proof; that published page was not retrieved.

**Correction or safeguard.** The auxiliary-modulus target is N∤l^{r/2}+1. The independent valuation construction in DM.1 proves this target.

**Check.** The arXiv v1 proof has the plus-sign conclusion and does not verify the alleged publication-only misprint. Retain the correct mathematical condition without asserting that this review read the published line.

**Verdict scope.** The exact publication-specific allegation could not be independently checked. The weaker mathematical safeguard is justified above; rejection is for lack of source verification, not a finding that the allegation is false.

### E5 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), §4, arXiv v1 pp. 21–22 (published p.1270 cross-reference).

**Diagnostic (paraphrase).** The switching proof restates the root-of-unity condition using divisibility by n rather than its prime-to-l part.

**Correction or safeguard.** Write n=l^a m with l∤m and require m∣#k(λ)×; keep the separate condition that the determinant values admit n-th roots.

**Check.** The order l^r−1 is prime to l. For n=l=3 the stated n-divisibility is impossible, whereas cubing is bijective on the field units and m=1 is the correct roots-of-unity condition.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E6 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), §4, arXiv v1 p.22; Lemma 3.8 and formulas (3.1)–(3.3), pp.16–18 (published Lemma3.9).

**Diagnostic (paraphrase).** The auxiliary-prime determinant argument appeals to a lemma that permits roots in a quadratic residue-field extension.

**Correction or safeguard.** Use the explicit Frobenius determinant ratio: it is the n-th power of q^{(N−2n−1)/2} times the Gauss product, in k(λ′)×. Then use Chebotarev.

**Check.** An element of 𝔽_l′× can be a square in 𝔽_l′² without being a square in 𝔽_l′. The ratio must be checked in the fixed coefficient field; separate estimates on its two determinants do not suffice.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E7 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma 2.1, arXiv v1 pp.5–8; Proposition4.1 and its application pp.21–22.

**Diagnostic (paraphrase).** The auxiliary-prime application does not separately establish the root-of-unity hypothesis of Lemma 2.1 in the fixed residue field.

**Correction or safeguard.** One sufficient repair is l′≡1 mod n, in addition to l′≡1 mod N. Alternatively use the primary components with d=gcd(n,l′−1).

**Check.** This is a missing hypothesis check, not a necessary congruence: for n=3 and l′≡2 mod3, cubing is already bijective on 𝔽_l′×. The roadmap uses the sufficient congruence consistently.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E8 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma 3.10, arXiv v1 pp.20–21 (published Lemma3.11).

**Diagnostic (paraphrase).** The local p-adic comparison notation uses the global field and tensors a representation over a local field embedded in a period ring.

**Correction or safeguard.** Use G_{F_v} and V⊗_{ℚ_l}B_cris. Its invariants are a module over F_v^0⊗_{ℚ_l}E; labels are imposed on that scalar algebra. Use B_dR and F_v for the de Rham version.

**Check.** The coefficient-linear representation has no F_v-scalar action merely from being a representation of G_{F_v}. Replacing F_v by its unramified subfield in a tensor of V is still ill-typed. B_cris is not generally an F_v-algebra.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E9 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), §4, arXiv v1 pp.21–22.

**Diagnostic (paraphrase).** The determinant of the symmetric power of cohomological H¹ is written with a positive cyclotomic exponent.

**Correction or safeguard.** For H¹_ét use det Sym^{n−1}H¹=ε̄^{−n(n−1)/2}. For the Tate module the exponent is positive.

**Check.** The Weil pairing gives det H¹=ε̄⁻¹. At geometric Frobenius its value is q; the dual Tate module has value q⁻¹. This also fixes E6’s determinant ratio.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E10 — confirmed

Source: [QIAN21](https://arxiv.org/abs/2103.00106v1), Qian companion arXiv:2103.00106v1, Lemma4.2, p.20; BLGHT Lemma2.2(2), pp.16–18.

**Diagnostic (paraphrase).** The companion Lemma 4.2 deduces regular ordinarity from maximal nilpotence without a consecutive-weight hypothesis.

**Correction or safeguard.** Require, at every local embedding, weights k_τ,k_τ+1,…,k_τ+n−1. Do not assert that maximal nilpotence alone proves this extra condition.

**Check.** A weakly admissible rank-two counterexample over ℚ_p has φe₁=pe₁, φe₂=p²e₂, Ne₂=e₁, Ne₁=0 and filtration jumps 0,3 with Fil¹=Fil²=Fil³=⟨e₁+e₂⟩. Its total Hodge and Newton numbers are 3; the only nonzero proper (φ,N)-stable line has Hodge number 0 and Newton number 1. It is weakly admissible with maximal N and nonconsecutive weights, and its monodromy flag is not ordinary.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E11 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Proposition3.2, arXiv v1 p.13 (published p.1257).

**Diagnostic (paraphrase).** The rank argument appeals to smooth properness without giving the integral freeness input.

**Correction or safeguard.** Combine lissity with torsion-free integral hypersurface cohomology, invertibility of the symmetry-group order at the finite/local coefficients, and its idempotent projector. The global Betti lattice is projective over its Dedekind coefficient ring.

**Check.** Smooth proper base change alone does not exclude torsion in integral cohomology. A direct summand of a free module is projective; it is free locally, but global freeness over a Dedekind ring must not be inferred.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E12 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), After Proposition3.2, arXiv v1 p.13; BLGHT Lemma4.1 pp.25–26.

**Diagnostic (paraphrase).** The rank-two Betti real form is described without the localization used in the self-dual construction.

**Correction or safeguard.** Use ℤ[1/(2N),ζ_N]^+ and extension to ℤ[1/(2N),ζ_N] for the Betti form. At primes and finite ideals prime to 2N the local statements agree.

**Check.** BLGHT’s projector and descent construction invert 2N. The localization changes the Betti coefficient ring, while its specified prime-to-2N completions and quotients are unaffected.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E13 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma3.3(2), arXiv v1 pp.13–14; Katz09 Theorem5.3 pp.95–97.

**Diagnostic (paraphrase).** The unipotence argument for quotient monodromy uses only the unipotence of its N-th power on the pulled-back family.

**Correction or safeguard.** For the selected zero-shaped data use Katz’s hypergeometric comparison to determine quotient monodromy itself. For general characters record the additional eigenvalue and Jordan-multiplicity conditions.

**Check.** A scalar nontrivial N-th root of unity has unipotent N-th power but is not unipotent. A semistable model after the covering does not remove this ambiguity on the quotient line.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E14 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma3.3(3), arXiv v1 pp.13–14.

**Diagnostic (paraphrase).** The Picard–Lefschetz argument borrows a symplectic step from a self-dual eigenspace for a possibly non-self-dual character.

**Correction or safeguard.** Use the full odd-dimensional middle cohomology Picard–Lefschetz formula and then project, or use determinant one together with rank at most one.

**Check.** An individual non-self-dual eigenspace is paired with its conjugate rather than with itself. For g=1+v⊗f, det g=1+f(v); determinant one gives f(v)=0 and (g−1)²=0. The rank-one equality requires the additional irreducibility argument.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E15 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma3.6, arXiv v1 pp.15–16 (published Lemma3.7); BLGHT Lemma4.6 pp.31–32.

**Diagnostic (paraphrase).** The quotient-family residual-image claim invokes the self-dual rank-two result for a different quotient family.

**Correction or safeguard.** For Qian’s quotient assertion require n>2. Use BLGHT Corollary 4.7 on the original parameter line for rank two, or explicitly substitute BLGHT’s middle-coordinate quotient family.

**Check.** BLGHT’s quotient has zero exponent on its distinguished middle coordinate. Qian’s last-coordinate quotient does not satisfy that property for the rank-two self-dual data. The two sheaves cannot be identified by their notation alone.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E16 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma3.8, arXiv v1 p.18, formula(3.3) (published Lemma3.9).

**Diagnostic (paraphrase).** The local Gauss-product descent chooses an automorphism that both inverts ζ_N and fixes ζ_p.

**Correction or safeguard.** Permit σ(ζ_p)=ζ_p^c. The resulting Gauss factors have scalar prefactors whose product cancels. In rank two the product is directly g(a)g(−a)=q.

**Check.** The two cyclotomic local fields need not be disjoint, so that prescribed local automorphism need not exist. The inverse-pair Gauss identity proves the real-subfield claim without that choice.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E17 — rejected

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Published Remark3.13, p.1268 (unread in this review); compare companion Theorem1.4 and §2, pp.3–13.

**Diagnostic (paraphrase).** The earlier extraction alleges that published Remark 3.13 asserts semistability over F_v itself for every v(t)<0; that published page was not retrieved.

**Correction or safeguard.** State potential semistability and semistability over the ramified extension actually constructed, retaining its degree e. A descent assertion over F_v requires another argument.

**Check.** The companion constructs an extension using a toroidal subdivision with uncontrolled e. This justifies the roadmap’s weaker formulation but does not verify the exact wording or scope of the unread published remark.

**Verdict scope.** The exact publication-specific allegation could not be independently checked. The weaker mathematical safeguard is justified above; rejection is for lack of source verification, not a finding that the allegation is false.

### E18 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Proposition4.1, arXiv v1 pp.21–22; ACC Corollary7.2.4 p.1100.

**Diagnostic (paraphrase).** The auxiliary-prime proof checks unramifiedness in F but invokes an ACC result whose avoidance field must be unramified there.

**Correction or safeguard.** Exclude the finite set of primes ramifying in F^avoid as well.

**Check.** ACC Corollary 7.2.4, p.1100, requires this in its first auxiliary-prime paragraph. A field containing F can ramify where F does not; this finite extra exclusion preserves the density argument.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E19 — confirmed

Source: [QIAN23](https://arxiv.org/abs/2104.09761v1), Lemma2.1 and §4, arXiv v1 pp.5–8,22–23.

**Diagnostic (paraphrase).** One invocation of a finite-field-valued root lemma is used for two residual characteristics without specifying the simultaneous avoidance step.

**Correction or safeguard.** Apply it first with avoidance field F₀, obtaining L₁, then with avoidance field F₀L₁, obtaining L₂; restrict both characters over L₁L₂M.

**Check.** Independent disjointness of L₁ and L₂ from F₀ does not imply disjointness of their compositum. The second enlarged avoidance field gives (L₁L₂)∩F₀=ℚ and supplies the missing simultaneous construction.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E20 — confirmed

Source: [QIAN21](https://arxiv.org/abs/2103.00106v1), Qian companion arXiv:2103.00106v1, Remark1.2, p.2; A’Campo v1 Definitions2.1.1–2.1.2 pp.7–8 and Proposition2.5.7 pp.19–20.

**Diagnostic (paraphrase).** The companion Remark 1.2 treats occurrence of zero in the exponent list as sufficient for maximal unipotence.

**Correction or safeguard.** Retain maximal unipotence as a hypothesis for general characters. For the selected zero-shaped data use the separately proved hypergeometric result.

**Check.** For N=5, a=(1,2,2,0,0) has rank two. A’Campo’s parameters α=(0,3), β=(1,2) give two distinct singleton Jordan blocks at infinity after the fifth-power covering, hence identity rather than a size-two block. Adding a constant to every a_i preserves the H₀-character and can always create a zero, so zero occurrence is not an intrinsic criterion.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E21 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Lemma4.2.4 and proof, arXiv v3 pp.41–42.

**Diagnostic (paraphrase).** The comparison-character proof uses a duality twist one degree away from the middle cohomology dimension.

**Correction or safeguard.** Use V^c≅V∨(2−N); the comparison character has weight N−n−1 and Ψc(Ψ) corresponds to ε^{n+1−N}.

**Check.** The hypersurface dimension is N−2, while the hypergeometric weight is n−1. Their weight difference is N−n−1. The printed 1−N twist would give weight N instead of N−2.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E22 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Proof of Proposition4.2.6, arXiv v3 p.44.

**Diagnostic (paraphrase).** The final term in a base-q exponent uses an index outside the summation range.

**Correction or safeguard.** Use r_{d−1}q_v^{d−1} as the last term.

**Check.** There are exactly the variables r₀,…,r_{d−1}; the adjoining expansion and definition of the integer r use this range. This is an indexing error, not a change to the argument.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E23 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Proof of Lemma4.4.4, arXiv v3 p.48.

**Diagnostic (paraphrase).** The Fermat eigenline in the inertia proof is placed in degree N−1.

**Correction or safeguard.** Use H^{N−2} before twisting by Ψ⁻¹.

**Check.** The fibre is a hypersurface of dimension N−2 and the local system throughout §4 is its middle cohomology. The degree N−1 group cannot supply these eigenlines.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E24 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), §4.1, arXiv v3 p.40.

**Diagnostic (paraphrase).** The eigensheaf display omits the higher direct-image degree.

**Correction or safeguard.** Use the χ-isotypic part of R^{N−2}π_* of the coefficient sheaf.

**Check.** The ordinary π_* on connected fibres gives degree-zero cohomology with trivial symmetry action; its nontrivial χ-part vanishes rather than giving rank n.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E25 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Definition4.4.1, arXiv v3 pp.46–47.

**Diagnostic (paraphrase).** The level-structure definition indexes coefficient places by the cyclotomic subfield and has an unindexed residue characteristic in the bilinearity requirement.

**Correction or safeguard.** Use places λ_i of M and 𝔽_{l_i}-bilinearity.

**Check.** The W systems are defined over M and may have larger coefficient fields than the cyclotomic subfield. Each pairing is over the prime field of its own residue characteristic.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E26 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Definition4.4.1 and Proposition4.4.2, arXiv v3 pp.46–47.

**Diagnostic (paraphrase).** Geometric irreducibility is asserted for a simultaneous pairing and determinant level functor without a compatibility condition on the determinant identification.

**Correction or safeguard.** Require its determinant identification to preserve the induced determinant form, equivalently require the relevant isometry fibre to be nonempty.

**Check.** For Hermitian spaces the determinants of isometries form a norm-one coset. A determinant identification outside that coset makes the fibre empty. Uniqueness of the underlying Hermitian space does not remove the determinant obstruction.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E27 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Proposition4.2.5(1), arXiv v3 pp.42–43.

**Diagnostic (paraphrase).** The integrality argument transfers integrality of the untwisted cohomology characteristic polynomial through the comparison-character twist.

**Correction or safeguard.** First prove M-rationality and integrality away from the residue characteristic using lattices. At that characteristic use crystallinity, nonnegative cohomological weights and weak admissibility.

**Check.** The twisting scalar can be a nonunit at the residue characteristic. The full integrality conclusion is true with the additional slope argument, but does not follow from untwisted integral coefficients alone.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E28 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Proposition6.2.3(13), arXiv v3 pp.61–62; proof of Theorem6.2.4 pp.66–67.

**Diagnostic (paraphrase).** The auxiliary-system proof asserts full arithmetic GU image alongside its fixed determinant.

**Correction or safeguard.** Specialize onto the actual finite arithmetic image G, which contains SU. On the cyclotomic kernel use both the determinant and multiplier to get containment in SU, and perfectness to get the reverse containment.

**Check.** The determinant is constrained to 𝔽_p×. Full GU contains diagonal matrices with norm-one determinant outside 𝔽_p×, contradicting that constraint. The multiplier equation alone also has too large a kernel to prove the restricted SU equality.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E29 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Proof of Theorem6.2.4, arXiv v3 pp.67–68.

**Diagnostic (paraphrase).** The final avoidance field is chosen before adjoining the residual kernel field of the newly constructed auxiliary system.

**Correction or safeguard.** Include that kernel field in the avoidance extension before further base changes.

**Check.** Disjointness from the earlier field does not preserve a residual image constructed only afterwards. The added finite extension keeps the required cyclotomic-kernel SU image through the remaining base changes.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E30 — confirmed

Source: [BLGHT11](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf), §4, definition of the cover T_W, p. 27 (author copy; p. 54 of the published version).

**Diagnostic (paraphrase).** The original self-dual level-cover definition permits all linear isomorphisms.

**Correction or safeguard.** Require the level isomorphism to preserve the alternating form, as in BLGGT Theorem 3.1.2’s proof.

**Check.** The unrestricted fibre is a GL torsor, and the symplectic geometric image has multiple orbits on it. Restricting to symplectic isomorphisms gives the transitive fibre used in the connectedness proof. BLGGT records this correction.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

### E31 — confirmed

Source: [BCGNT25](https://arxiv.org/abs/2309.15880v3), Lemma4.4.4, arXiv v3 p.48; §1.6 p.12; CEGS §1.4 pp.5–6.

**Diagnostic (paraphrase).** Lemma 4.4.4 uses positive powers of direct Artin fundamental characters for the cohomological Fermat inertia.

**Correction or safeguard.** Put θ_τ=(τ∘Art⁻¹)⁻¹ on inertia and use θ_τ^{i−1}θ_{cτ}^{n−i}. Then θ_τθ_{cτ}=ε̄_l⁻¹.

**Check.** BCGNT §1.6 and CEGS §1.4 fix geometric Artin normalization: the direct fundamental characters multiply to ε̄_l. Thus the printed positive powers have determinant ε̄_l^{n(n−1)/2}, whereas det W=ε̄_l^{−n(n−1)/2}. For n=3 and l>7 these differ. The inverse-character formula agrees with the paired crystalline weights and with supersingular H¹.

**Verdict scope.** Confirmed against the indicated read edition, with the direct mathematical check and the corrected scope given above.

## Suggested Lean and review status

The companion Suggested.lean states the light algebraic targets whose carriers exist at the pins. It reuses the unitary carriers, imports companion theory by its owner, and gives real bodies only to light predicates and finite-data expressions. Scheme eigensheaves, hypergeometric convolution, semistable models and switching are reader targets until their supplier interfaces are implemented. The file elaborated with lean-check at the pins on 19 October 2026, exit 0, with declaration-uses-placeholder warnings only. This is signature validation, not a formal proof of the roadmap.

Independent review REV-DESIGN-PotentialAutomorphyDworkMotivesPartII accepted this complete target-level pass: 81 node verdicts, 37 confirmed baseline citations, 133 API items and 82 tests for the 19 definitions/constructions, and 16 planets. Ten explicit gaps and the pending upstream status remain. See research/blueprint/reviews/REV-DESIGN-PotentialAutomorphyDworkMotivesPartII.md for the changes and ownership questions.
