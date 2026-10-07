# Reusable infrastructure for potential automorphy over CM fields

This is the target-level blueprint for `PotentialAutomorphyInfrastructure:PA.0`–`PA.5`. The [packet](../packets/PotentialAutomorphyInfrastructure.json) records the same declarations, direct prerequisites, source passages, APIs and tests. The [suggested file](../suggested/PotentialAutomorphyInfrastructure.lean) contains the available typed cores and explicitly named dependent-signature obligations. Nothing in this document is formalised. The planning pass is complete; all six stages are **planned**, and none is closed. The nine explicit gaps and supplier extensions at the end determine what is needed for closure.

The endpoints are ACC’s Fontaine–Laffaille and ordinary automorphy lifting theorems, followed by rank-two compatible-system transport used in potential-automorphy assemblies. General highest-weight theory, smooth induction, deformation functors, abstract patching and general compatible-system operations retain their owners. The declaration names are proposals in the namespace `TauCeti.PotentialAutomorphy`; a short name below uses that namespace. Nodes use stable stage-qualified ids. Each stage has at most six named planets.

## Conventions and shared hypothesis profiles

Frobenius and Artin reciprocity are geometric; HT(ε)={−1}. Dominant GL_n rows are descending; HT_τ(V_λ)={λ_{τ,i}+n−i}. O is the ring of integers of a finite p-adic E containing all embeddings, varpi its uniformizer and k its residue field. d=n²[F⁺:Q], dim X_K=d−1. The choice of lifts above p identifies the split unitary rank-2n factors with GL_{2n}. Non-neat levels use the arithmetic groupoid; a finite free cellular model is invoked only after stabilizers are trivial or the indicated invertibility condition is proved. For rational GL_n cohomology put f=[F⁺:Q], q_GL=n(n−1)f/2 and ℓ₀=nf−1. The dual arithmetic complex is RHom(RΓ,O)[−d], so H^i dualizes H^{d−i}. Its rational range is [q_patch,q_patch+ℓ₀], q_patch=q_GL+1, since 2q_GL+ℓ₀=d−1. The q₀ in the abstract patching hypotheses denotes q_patch, not q_GL.

The CM and split-unitary standing hypotheses of the cited sections apply exactly where their statements specify them. The split rank-2n unitary group is U(n,n) over F⁺ with the chosen Siegel Levi identified with Res_{F/F⁺}GL_n. Dominance is descending. At p fix conjugate-compatible uniformizers and the specified choice of lifts of embeddings. A weight table or matrix family in the typed prototype is only its algebraic core; reconstructing an arithmetic field, embedding or representation from such arbitrary data is not asserted.

### Fontaine–Laffaille good-level profile (ACC §6.5.1, all seventeen clauses)

F is an imaginary CM field and we fix: (1) an integer n ≥ 2 and a prime p > n²; (2) a finite set S of finite places of F containing S_p; (3) a possibly empty subset R ⊂ S of places prime to p; (4) a cuspidal automorphic representation π of GL_n(𝔸_F), regular algebraic of weight λ; (5) an isomorphism ι: Q̄_p ≅ ℂ. Assume: (6) every prime l lying below a place of S, or ramified in F, splits in some imaginary quadratic subfield of F (so each place of S is split over F⁺ and F/F⁺ is everywhere unramified); (7) p is unramified in F; (8) λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n for every τ: F ↪ ℂ; (9) for each v ∈ S_p, with v̄ = v|_{F⁺}, there is a place v̄′ ≠ v̄ of F⁺ above p with Σ_{v̄″ ≠ v̄, v̄′} [F⁺_{v̄″}:ℚ_p] > ½[F⁺:ℚ]; (10) r̄_ι(π) is absolutely irreducible; (11) π_v is unramified for v | p; (12) π_v^{Iw_v} ≠ 0 for v ∈ R; (13) for v ∈ S − (R ∪ S_p): π_v is unramified, v ∉ R^c and H²(F_v, ad r̄_ι(π)) = 0; (14) S − (R ∪ S_p) contains two places of distinct residue characteristics; (15) π_v is unramified at every finite v ∉ S; (16) for v ∈ R: q_v ≡ 1 mod p and r̄_ι(π)|_{G_{F_v}} is trivial; (17) r̄_ι(π) is decomposed generic (Definition 4.3.1) and r̄_ι(π)|_{G_{F(ζ_p)}} has enormous image (Definition 6.2.29). The level K = ∏_v K_v ⊂ GL_n(Ô_F): K_v = GL_n(𝒪_{F_v}) for v ∉ S or v ∈ S_p; K_v = Iw_v for v ∈ R; K_v = Iw_{v,1} (pro-v Iwahori) for v ∈ S − (R ∪ S_p).

This is a registry of individual hypotheses, not a new bundled proposition or a replacement for the source’s local conditions. A node citing this profile requires every clause as well as its additional displayed hypotheses.

### Ordinary good-level profile (ACC §6.6.1, all fifteen clauses)

F is an imaginary CM field and we fix: (1) an integer n ≥ 2 and a prime p > n; (2) a finite set S of finite places containing S_p; (3) a possibly empty R ⊂ S of places prime to p; (4) a cuspidal π of GL_n(𝔸_F), regular algebraic of weight μ; (5) ι: Q̄_p ≅ ℂ. Assume: (6) every prime below a place of S, or ramified in F, splits in an imaginary quadratic subfield of F; (7) r̄_ι(π) absolutely irreducible; (8) for v ∈ S_p, π_v^{Iw_v(1,1)} ≠ 0 and π is ι-ordinary at v ([Ger19, Def. 5.3]); (9) π_v^{Iw_v} ≠ 0 for v ∈ R; (10) for v ∈ S − (R ∪ S_p): π_v unramified, v ∉ R^c, H²(F_v, ad r̄_ι(π)) = 0; (11) S − (R ∪ S_p) contains two places of distinct residue characteristics; (12) π_v unramified for finite v ∉ S; (13) for v ∈ R: q_v ≡ 1 mod p and r̄_ι(π)|_{G_{F_v}} trivial; (14) r̄_ι(π) decomposed generic and r̄_ι(π)|_{G_{F(ζ_p)}} of enormous image; (15) for v ∈ S_p: [F_v:ℚ_p] > n(n+1)/2 + 1 and r̄_ι(π)|_{G_{F_v}} trivial. The level K = ∏ K_v: K_v = GL_n(𝒪_{F_v}) (v ∉ S), Iw_v(1,1) (v ∈ S_p), Iw_v (v ∈ R), Iw_{v,1} (v ∈ S − (R ∪ S_p)); K is neat (Lemma 6.5.2), hence good.

This is a registry of individual hypotheses, not a new bundled proposition or a replacement for the source’s local conditions. A node citing this profile requires every clause as well as its additional displayed hypotheses.

## Library baseline and ownership

The reviewed `data/library-coverage.json` was read on 7 October 2026. It contains no dedicated audit entry for this roadmap. The exact source statements below were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Direct searches do not establish global absence; where an arithmetic interface was not located, the packet names its owner or records a gap. Existing derived categories and categorical retracts are consumed, rather than replanned. The Tau Ceti ReductiveGroups and InductionRestriction reader documents supplied the design and density checks.

| Baseline declaration | Exact supplying module | What is consumed |
| --- | --- | --- |
| `mathlib:CategoryTheory.Retract` | `Mathlib/CategoryTheory/Retract` | Maps i : X → Y, r : Y → X with i followed by r equal to the identity; no equivariance is built in. |
| `mathlib:CategoryTheory.Retract.map` | `Mathlib/CategoryTheory/Retract` | A functor carries a retract to a retract, using its identity and composition laws. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic` | Localization of cochain complexes of an abelian category at quasi-isomorphisms. |
| `mathlib:DerivedCategory.Q` | `Mathlib/Algebra/Homology/DerivedCategory/Basic` | The localization functor from cochain complexes to the derived category. |
| `mathlib:Module.support` | `Mathlib/RingTheory/Support` | Primes at which the localized module is nontrivial, not an equality of rings. |
| `mathlib:Matrix.charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic` | The determinant of XI minus the matrix over a commutative ring. |
| `mathlib:Subgroup.goursat_surjective` | `Mathlib/GroupTheory/Goursat` | For a subgroup of G×H with both projections surjective, its image modulo the two Goursat normal subgroups is the graph of a group isomorphism. This does not itself construct arithmetic field composita. |
| `mathlib:Equiv.Perm.permGroup` | `Mathlib/Algebra/Group/End` | Permutation group multiplication is function composition, implemented by trans in reversed argument order. |
| `mathlib:finAddFlip` | `Mathlib/Logic/Equiv/Fin/Basic` | The equivalence Fin(m+n)≃Fin(n+m) exchanging the two sum blocks via finSumFinEquiv and sumComm. |

The six-stage structure has a one-way flow: PA.0 supplies PA.1 and PA.2; PA.0 and the deformation owners supply PA.3; PA.1, PA.2 and PA.3 feed PA.4. PA.5 supplies reusable field and genericity transport to PA.4 and exports its compatible-system consequences downstream. PA.2 imports shared shuffle/CTG combinatorics from PA.1, while its middle-degree concentration is a separate IG.7 import. Neither lifting branch requires the other branch’s patching verification. ML.2 is a downstream assembly and supplies no prerequisite here.

## Sources and editions

**[acc]** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne, *Potential automorphy over CM fields*. Published Annals of Mathematics 197 (2023), 897–1113; author-hosted published PDF. [Public copy](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), accessed 2026-10-07. Read: §§1.2, 2.1.9, 2.2, 2.4; §§4.1–4.5; §§5.1–5.5; §§6.1, 6.3.5, 6.4.1, 6.4.17, 6.5.1–6.5.12, 6.6.1–6.6.10; §7.1 through Lemma 7.1.10. PDF SHA-256: `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02`.

**[qian]** Lie Qian, *Potential automorphy for GL_n*. Published Inventiones Mathematicae (2023); NSF public-access copy. [Public copy](https://par.nsf.gov/servlets/purl/10388233), accessed 2026-10-07. Read: Definition 1.3; Lemma 2.6 and its proof; Lemma 4.3 and Remark 4.4; cited Goursat/composita and ordinary base-change passages. PDF SHA-256: `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8`.

**[bianchi]** George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne, *The Ramanujan and Sato–Tate Conjectures for Bianchi modular forms*. Author-hosted 2025 PDF; Definition 6.1.2 is on author page 58 and Lemmas 6.1.4–6.1.5 on page 59; extraction page numbers refer to another edition. [Public copy](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), accessed 2026-10-07. Read: §6.1 Definitions 6.1.1–6.1.2, Lemmas 6.1.4–6.1.5; symmetric-power passages. PDF SHA-256: `cf0c334f106dc17aa39a77d97341ebe96743ac8dd1858006c99936d303efe915`.

**[bcgp]** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. Author-hosted published manuscript (2021); §9.1 pp. 251–252. [Public copy](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), accessed 2026-10-07. Read: §9.1 definitions immediately before Lemma 9.1.10 and all three parts of that lemma. PDF SHA-256: `1bbaa5c4f55fd2e15523953d40f41e518695025d758285eabd5ac829932c8051`.

The underlying Henniart/Serre character theorem, Larsen–Pink/Larsen monodromy inputs, Geraghty’s primary definitions and base-change normalization, finite PGL₂ classification references, and full soluble-descent/Varma source statements were not independently read in their cited editions. Their precise uses are supplier requests or gaps. This reader does not claim them as verified baseline results.

## PA.0. A common integral cohomology interface

PA.0 fixes an integral interface shared by the Fontaine–Laffaille and ordinary branches. It imports the locally symmetric spaces, arithmetic groupoids, algebraic local systems, boundary triangle and derived Hecke action from ALS. The new assertions identify their coefficient/level comparisons in precisely the GL_n and split unitary situation of ACC. Evaluation at the Siegel Levi is a split map of coefficient lattices; applying derived unipotent invariants and the localized Siegel-stratum comparison makes it a Hecke-equivariant retract. A retract of objects alone does not establish compatibility of the connecting maps, so the boundary comparison is a separate theorem.

The categorical definition adds commutation equations to Mathlib’s actual retract. It does not introduce a second derived category. The unipotent computation is continuous cohomology of Z_p^{n²[K:Q_p]}, with its conjugation action on exterior powers; it is not discrete group cohomology. The weight dictionary reverses and negates the conjugate row. Its rank-two test distinguishes this dictionary from concatenating the two rows without a dual. Finite free O[Δ]-models require free cell actions at the selected neat levels. Good level alone does not provide that freeness.

**Coverage:** planned. **Remaining:** Fulfil ALS groupoid/cellular coefficient and boundary comparison extensions; supply RG2.6 coefficient lattices and their evaluation splitting.

**Planets:** Siegel coefficient splitting; Equivariant direct summands; Unipotent exterior cohomology; Integral cohomology comparison; Unitary weight dictionary.

**Declaration inventory:** [coefficient-satake-descent](#coefficient-satake-descent), [siegel-coefficient-retract](#siegel-coefficient-retract), [ramified-satake-descent](#ramified-satake-descent), [equivariant-retract](#equivariant-retract), [unipotent-exterior-cohomology](#unipotent-exterior-cohomology), [integral-model-comparison](#integral-model-comparison), [boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), [unitary-levi-weight-dictionary](#unitary-levi-weight-dictionary).

<a id="coefficient-satake-descent"></a>

### Theorem: Theorem 2.4.4 (𝒮 descends to boundary and GL_n Hecke algebras with coefficients)

**Node:** `PotentialAutomorphyInfrastructure:PA.0/coefficient-satake-descent`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.coefficient_satake_descent`.

Let K̃ be as in §2.4.1 (good, decomposed with respect to P = GU; K = K̃ ∩ G(A^∞_{F⁺})), let λ ∈ (Z^n_+)^{Hom(F,E)} be dominant with image λ̃ ∈ (Z^{2n})^{Hom(F⁺,E)} (under (2.2.2)) G̃-dominant, let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and 𝔪̃ = 𝒮*(𝔪) ⊂ T̃^S. Then 𝒮 : T̃^S → T^S descends to a homomorphism T̃^S(RΓ(∂X̃_K̃, 𝒱_λ̃)_𝔪̃) → T^S(RΓ(X_K, 𝒱_λ)_𝔪).

**Construction or proof:**

1. Apply ALS Siegel-stratum localization at the non-Eisenstein maximal ideal.

2. Use evaluation of induced coefficients and its integral splitting to construct the Satake-compatible action; descend through the kernel on cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.4.1, Theorem 2.4.4 with (2.4.5)–(2.4.7), pp. 945–946. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="siegel-coefficient-retract"></a>

### Theorem: GL_n cohomology as a direct summand of Siegel-stratum cohomology (splitting 𝒱_λ ↪ R1_*^{K̃_{U,S}}𝒱_λ̃)

**Node:** `PotentialAutomorphyInfrastructure:PA.0/siegel-coefficient-retract`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.siegel_coefficient_retract`.

With K̃ decomposed (so K̃_P = K̃_U ⋊ K) and λ, λ̃ as in Theorem 2.4.4, for each m ≥ 1: (i) arguing as in [NT16 p. 58], RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m) ≅ RΓ(K̃^S_P × K_S, RΓ(Inf^{P^S×K_S}_{G^S×K_S} 𝔛_G, R1_*^{K̃_{U,S}} 𝒱_λ̃/ϖ^m)), where R1_*^{K̃_{U,S}} sends P^S × K̃_{P,S}-equivariant complexes of sheaves on 𝔛_G to P^S × K_S-equivariant ones; (ii) the K̃_P-equivariant embedding 𝒱_λ → 𝒱_λ̃^{K̃_{U,S}} ⊂ 𝒱_λ̃, which splits K-equivariantly [NT16 Cor. 2.11], makes 𝒱_λ/ϖ^m a direct summand of R1_*^{K̃_{U,S}}(𝒱_λ̃/ϖ^m): the inclusion is 𝒱_λ/ϖ^m → (𝒱_λ̃/ϖ^m)^{K̃_{U,S}} → R1_*^{K̃_{U,S}}𝒱_λ̃/ϖ^m and the retraction is R1_*^{K̃_{U,S}}𝒱_λ̃/ϖ^m → 𝒱_λ̃/ϖ^m (restriction to the trivial subgroup) followed by the splitting 𝒱_λ̃ → 𝒱_λ mod ϖ^m; (iii) hence r_G^* RΓ(X_K, 𝒱_λ/ϖ^m) is a direct summand of RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m) in D(H(P^S × K̃_{P,S}, K̃_P) ⊗_Z O/ϖ^m), and 𝒮 = r_G ∘ r_P descends to (2.4.7) T̃^S(RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m)) → T̃^S(RΓ(X_K, 𝒱_λ/ϖ^m)).

**Construction or proof:**

1. Use the lowest-weight Levi summand of the dual-Weyl coefficient lattice and evaluation at the identity.

2. Apply the right-derived unipotent invariants functor to its inclusion and retraction; use the non-Eisenstein boundary-stratum comparison.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), `ArithmeticLocallySymmetricSpaces:ALS.4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, [PA.0/unitary-levi-weight-dictionary](#unitary-levi-weight-dictionary).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.4.1, proof of Theorem 2.4.4, (2.4.7), pp. 945–946. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ramified-satake-descent"></a>

### Theorem: Theorem 2.4.8 (𝒮 descends to boundary Hecke algebras with ramified operators at R, trivial coefficients)

**Node:** `PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ramified_satake_descent`.

Let K̃ be as in §2.4.1, let 𝔪 ⊂ T^S(K, 0) be a non-Eisenstein maximal ideal and 𝔪̃ = 𝒮*(𝔪) ⊂ T̃^S. Suppose R ⊂ S satisfies: each v ∈ R is prime to p and split over F⁺; for each v ∈ R − R^c above v̄, K̃_v̄ = q̃_v with p̃_{v,1} ⊂ q̃_v ⊂ p̃_v; for each v ∈ R ∩ R^c above v̄, K̃_v̄ = Ĩ_v̄ with Iw̃_{v̄,1} ⊂ Ĩ_v̄ ⊂ Iw̃_v̄. Let T = S − (R^c − R); let T̃^T_R ⊂ H(G̃(A^∞_{F⁺}), K̃) ⊗_Z O be the (commutative) O-subalgebra generated by T̃^S, all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) and all e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v}), and T^T_R ⊂ H(GL_n(A_F^∞), K) ⊗_Z O the (commutative) O-subalgebra generated by T^T and all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) (item 82). Then there is a map 𝒮 : T̃^T_R → T^T_R, which descends to an O-algebra homomorphism T̃^T_R(RΓ(∂X̃_K̃, O)_𝔪̃) → T^T_R(RΓ(X_K, O)_𝔪).

**Construction or proof:**

1. Extend the unramified Satake map by the explicit Iwahori operators at R.

2. Check the double-coset formulas before descent to the two localized boundary Hecke images; trivial coefficients are required here.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/coefficient-satake-descent](#coefficient-satake-descent), `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.4.1, Theorem 2.4.8, pp. 946–948. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="equivariant-retract"></a>

### Definition: R-equivariant direct summand in D(S)

**Node:** `PotentialAutomorphyInfrastructure:PA.0/equivariant-retract`. **Proposed declaration:** `EquivariantRetract`.

For a category C, objects A,B and an indexed family of endomorphisms f_A(r), f_B(r), an EquivariantRetract is a Mathlib Retract A B with f_A(r) followed by i = i followed by f_B(r), and f_B(r) followed by the retraction = the retraction followed by f_A(r), for every r. For C=D(S) and S-algebra actions of R this is the source’s R-equivariant direct summand: the complementary idempotent splits in D(S). The general categorical carrier records no additional ring laws; actual arithmetic applications pass S-algebra homomorphisms.

**Construction or proof:**

1. Take the existing categorical retract and impose commutation with the two indexed actions.

2. The relation i followed by r equal to the identity is checked in the derived category, not on an arbitrarily chosen cochain representative.

**Uses that determine the API:**

- ACC Theorem 4.2.1: Records the actual boundary splitting.

- ACC Theorem 5.4.1: Carries the completed-cohomology splitting and Hecke action.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `EquivariantRetract.toRetract` | compatibility | Forgetting the commuting equations gives CategoryTheory.Retract A B. |
| `EquivariantRetract.inclusion_comm` | relation | For every r, f_A(r) followed by i equals i followed by f_B(r). |
| `EquivariantRetract.retraction_comm` | relation | For every r, f_B(r) followed by the retraction equals the retraction followed by f_A(r). |
| `EquivariantRetract.map` | functoriality | A functor carries the retract to the image retract, with the image endomorphisms; it preserves both commuting equations. |
| `EquivariantRetract.idempotent` | relation | The endomorphism of B given by retraction followed by inclusion is an idempotent commuting with every action operator. |

**Unit tests:**

- `EquivariantRetract.identity` (degenerate): Identity maps on A give an equivariant retract of A into itself.

- `EquivariantRetract.forget_identity` (compatibility): The forgotten retract of the identity construction is Mathlib Retract.refl.

- `EquivariantRetract.incompatible_actions` (non-example): Identity inclusion/retraction cannot form an equivariant retract between Z with multiplication-by-1 and multiplication-by-2 as the same indexed operator.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. Identity maps on A give an equivariant retract of A into itself. The forgotten retract of the identity construction is Mathlib Retract.refl. Identity inclusion/retraction cannot form an equivariant retract between Z with multiplication-by-1 and multiplication-by-2 as the same indexed operator.

**Direct prerequisites:** `mathlib:CategoryTheory.Retract`, `mathlib:CategoryTheory.Retract.map`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.2, after Theorem 4.2.1, p. 969. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unipotent-exterior-cohomology"></a>

### Theorem: Lemma 4.2.2(1): cohomology of U(O_K) is the exterior algebra on Hom(U(O_K), O/ϖ^m)

**Node:** `PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.unipotent_exterior_cohomology`.

Let v̄ ∈ S̄_p, K = F^+_v̄ (a local field here), m ≥ 1. For each i ≥ 0 there is a G(O_K)-equivariant isomorphism H^i(U(O_K), O/ϖ^m) ≅ Hom_{Z_p}(∧^i_{Z_p} U(O_K), O/ϖ^m) = Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O/ϖ^m), with G(O_K) acting on the right through its conjugation action on U(O_K) ≅ Z_p^{n²[K:Q_p]} (continuous group cohomology; the map is the cup-product extension of H^1 = Hom).

**Construction or proof:**

1. Identify the additive unipotent group with Z_p^{n²[K:Q_p]}.

2. Use continuous cohomology of a free Z_p-module and cup-product Künneth; check conjugation on the dual exterior powers.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.2, Lemma 4.2.2(1), p. 970. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="integral-model-comparison"></a>

### Theorem: Integral arithmetic cohomology model comparison

**Node:** `PotentialAutomorphyInfrastructure:PA.0/integral-model-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.integral_model_comparison`.

For F CM, the GL_n space and the split-at-p unitary space with their arithmetic coefficient local systems, the groupoid derived-invariants, sheaf-cohomology and sufficiently-neat finite cellular models represent the same RΓ object. On a finite projective O coefficient lattice V, their derived reductions to O/varpi^m, pullback/trace at finite normal levels and Hecke away from S commute with these identifications. For a normal good neat level with finite quotient Δ and free cell action the cellular complex is finite free over O[Δ]. Before freeness is proved retain the groupoid model; no finite free assertion is made with nontrivial p-stabilizers.

**Construction or proof:**

1. Apply the ALS finite-model and derived-coefficient-change comparisons to the exact arithmetic coefficient lattice.

2. Match pullback and trace with the source’s double-coset correspondences.

3. Choose neat levels before invoking O[Δ]-free cell modules; otherwise use groupoid derived invariants.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `mathlib:DerivedCategory.Q`, `ArithmeticLocallySymmetricSpaces:ALS.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §§2.1, 2.2, 6.5.1; cohomology models and auxiliary levels. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="boundary-level-coefficient-comparison"></a>

### Theorem: Boundary coefficient and level comparison

**Node:** `PotentialAutomorphyInfrastructure:PA.0/boundary-level-coefficient-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.boundary_level_coefficient_comparison`.

For the same finite-projective coefficient lattice and good compact levels, the compact-support → interior → Borel–Serre-boundary triangle commutes with derived reduction O→O/varpi^m and finite-level pullback/trace. Localizing at the paired GL_n/unitary non-Eisenstein ideals isolates the Siegel stratum, with the Satake action on each triangle map. Maps are constructed using the arithmetic correspondences and stratum comparison, not assumed merely because a retract exists.

**Construction or proof:**

1. Use the ALS boundary triangle and stratum localization.

2. Apply the coefficient and level comparisons to all three terms and compare their connecting maps.

3. Use the Siegel evaluation maps and double-coset formulas to identify the Satake-twisted Hecke actions.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison), `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`, `ArithmeticLocallySymmetricSpaces:ALS.4`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.4.1 Theorems 2.4.2 and 2.4.4. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unitary-levi-weight-dictionary"></a>

### Definition: Unitary–Levi weight dictionary

**Node:** `PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary`. **Proposed declaration:** `UnitaryLeviWeight`.

For descending Levi rows λ_τ and λ_{τc} of length n and a chosen lift τ above an embedding of F⁺, define the unitary row by concatenating −reverse(λ_{τc}) with λ_τ. It is descending exactly when −λ_{τc,1}≥λ_{τ,1}. This is the character-lattice identification (2.2.2); it does not assert that the integral dual-Weyl lattice is the dual of the integral lattice of the dual weight.

**Construction or proof:**

1. Use the chosen split unitary factor GL_{2n} and the Siegel Levi inclusion.

2. Compute the contragredient reversed first block and the ordinary second block on diagonal torus elements.

**Uses that determine the API:**

- ACC equation (2.2.2): Identifies the coefficient character convention.

- ACC Theorem 4.2.1: Selects the correct Levi highest-weight summand.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `UnitaryLeviWeight.first_block` | simp | The i-th entry of the first block is −λ_{τc,n−i} with zero-based indexing. |
| `UnitaryLeviWeight.second_block` | simp | The i-th entry of the second block is λ_{τ,i}. |
| `UnitaryLeviWeight.dominant_iff` | characterisation | For descending input rows, dominance is equivalent to −λ_{τc,1}≥λ_{τ,1}. |
| `UnitaryLeviWeight.inverse` | equivalence | Recover λ_τ from the second block and λ_{τc} by negating and reversing the first block. |

**Unit tests:**

- `UnitaryLeviWeight.rank_one` (computation): For λ_τ=(2), λ_{τc}=(−3), the unitary row is (3,2).

- `UnitaryLeviWeight.zero` (degenerate): Zero Levi rows give the zero unitary row.

- `UnitaryLeviWeight.rank_two` (computation): For λ_τ=(2,1), λ_{τc}=(−3,−4), the unitary row is (4,3,2,1).

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For λ_τ=(2), λ_{τc}=(−3), the unitary row is (3,2). Zero Levi rows give the zero unitary row. For λ_τ=(2,1), λ_{τc}=(−3,−4), the unitary row is (4,3,2,1).

**Direct prerequisites:** Only the concrete finite data and categorical/module operations in the statement; no arithmetic supplier is inferred..

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.1 equation (2.2.2), pp. 918–919. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

**Stage acceptance:** Run every definition’s small-case and non-example tests above, compare all degree shifts and character normalizations to the cited source, and fulfil every listed supplier contract used by the stage. A recorded gap remains a failed closure obligation; passing the structural packet checker does not discharge it.

## PA.1. Fontaine–Laffaille weights and degree shifting

PA.1 supplies the arithmetic Fontaine–Laffaille calculation, from the Siegel boundary retract to Theorem 4.5.1. General integral highest-weight theory has the single proposed owner RG2.6. Here the specialized shuffles, bottom-alcove bounds and Kostant constituents are the objects to compute. Shuffles are inverse-increasing on each Levi block, hence representatives for left Levi cosets; replacing inverse-increasing by increasing selects the wrong convention. Their length runs from zero to n² at one embedding.

The unipotent derived formality theorem has the source’s p>n² bound and central-character argument. It does not assert that all complexes with torsion-free cohomology are formal. IG.7 supplies unitary middle-degree concentration and the compact-support vanishing needed for boundary surjectivity. No concentration conjecture for torsion GL_n cohomology is introduced. Degree shifting first reaches the upper half of the GL_n range. Universal coefficients multiply annihilators with an exponent depending only on rank and the field degree. Poincaré duality reflects q to d−1−q; the finite character chosen at a split witness removes cross-summand genericity obstructions.

CTG is the nonparallel conjugate-dual condition on every computed Kostant Levi row. It is stronger than a trace-only test. The perturbation proof uses the corrected plus sign in the sufficient sum criterion (4.3.7). The two-character-twist argument of Theorem 4.5.1 then recovers the rank-n Fontaine–Laffaille multiset through the separate finite shifted-partition theorem. Coefficients, contravariance, the G^a interval and cyclotomic signs must agree with R07.3; its currently broader general statements are imports with an exact arithmetic extension request.

**Coverage:** planned. **Remaining:** Create RG2.6 and export its integral highest-weight API; verify the exact ACC Fontaine–Laffaille interval and twists in R07.3, IG.7 concentration and the prescribed finite/crystalline character leaves.

**Planets:** Kostant representatives; Boundary degree shifting; Integral Kostant decomposition; CTG weights; Fontaine–Laffaille degree shifting; Fontaine–Laffaille compatibility.

**Declaration inventory:** [kostant-shuffles](#kostant-shuffles), [boundary-degree-retract](#boundary-degree-retract), [integral-kostant-decomposition](#integral-kostant-decomposition), [unipotent-derived-formality](#unipotent-derived-formality), [middle-degree-satake](#middle-degree-satake), [ctg-weight](#ctg-weight), [ctg-one-embedding-perturbation](#ctg-one-embedding-perturbation), [fontaine-laffaille-degree-shifting](#fontaine-laffaille-degree-shifting), [middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), [nilpotent-fontaine-laffaille-transfer](#nilpotent-fontaine-laffaille-transfer), [all-degree-fontaine-laffaille](#all-degree-fontaine-laffaille), [degree-reflection-duality](#degree-reflection-duality), [genericity-making-character-twist](#genericity-making-character-twist), [shifted-partition-recovery](#shifted-partition-recovery), [fontaine-laffaille-local-global](#fontaine-laffaille-local-global).

<a id="kostant-shuffles"></a>

### Definition: Siegel Kostant shuffles and length

**Node:** `PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles`. **Proposed declaration:** `KostantShuffle`.

For the Siegel Levi GL_n×GL_n in GL_{2n}, define KostantShuffle(n) as permutations w of {0,…,2n−1} whose inverse is increasing on each block {0,…,n−1} and {n,…,2n−1}. These are the minimal representatives for (S_n×S_n)\S_{2n}; length is the number of inversions of w. For Res_{F⁺/Q} use one shuffle per embedding and sum lengths. General Weyl groups, roots, dominant weights and highest-weight modules are imported, not defined here.

**Construction or proof:**

1. Identify the Siegel Levi Weyl subgroup S_n × S_n inside S_{2n}.

2. Choose the inverse permutations increasing on each Levi block; inversion counting supplies length and the minimal left-coset representatives.

**Uses that determine the API:**

- ACC Lemma 4.2.2(2): Indexes the integral Kostant summands and their degrees.

- ACC Lemma 5.4.8: Chooses prescribed degree shifts.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `KostantShuffle.val` | coercion | The underlying permutation lies in S_{2n}. |
| `KostantShuffle.mem_iff` | characterisation | Membership is precisely strict increase of the inverse on each of the two Levi blocks. |
| `KostantShuffle.length` | data | Length is the cardinality of {(i,j):i<j and w(j)<w(i)}. |
| `KostantShuffle.minimal_representative` | compatibility | The shuffle is the unique minimum-length representative of its left Levi coset. |

**Unit tests:**

- `KostantShuffle.rank_one` (computation): For n=1 the two shuffles have lengths 0 and 1.

- `KostantShuffle.rank_zero` (degenerate): For n=0 the unique shuffle has length 0.

- `KostantShuffle.block_swap` (computation): The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length n².

- `KostantShuffle.internal_swap` (non-example): For n=2 the transposition (0 1) is not a shuffle.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For n=1 the two shuffles have lengths 0 and 1. For n=0 the unique shuffle has length 0. The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length n². For n=2 the transposition (0 1) is not a shuffle.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `mathlib:Equiv.Perm.permGroup`, `mathlib:finAddFlip`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1.2 Notation, pp. 905–906. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="boundary-degree-retract"></a>

### Theorem: Theorem 4.2.1: R Γ(X_K, V_λ/ϖ^m)_m[−l(w)] is a T̃^S-equivariant direct summand of the boundary cohomology of X̃_K̃

**Node:** `PotentialAutomorphyInfrastructure:PA.1/boundary-degree-retract`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.boundary_degree_retract`.

Notation (§4.2): for τ: F^+ ↪ E, W_τ = W(G̃⊗_{F^+,τ}E, T⊗_{F^+,τ}E) ≅ W(GL_{2n}), W_{P,τ} = W(G⊗E, T⊗E) ≅ W(GL_n×GL_n), W^P_τ ⊂ W_τ the representatives of W_{P,τ}\W_τ of §1.2, ρ_τ the half-sum of B⊗E-positive roots; W_v̄, W_{P,v̄}, W^P_v̄ the products over τ ∈ I_v̄ (embeddings inducing v̄), ρ_v̄ = Σ_{τ ∈ Hom(F^+_v̄,E)} ρ_τ; W_T̄, W^P_T̄ for T̄ ⊂ S̄_p, W = W_{S̄_p} with length l and ρ = Σ_v̄ ρ_v̄; λ̃_v̄ = (λ̃_τ)_{τ ∈ Hom(F^+_v̄,E)} and λ_v̄ = (λ_τ)_{τ inducing ṽ or ṽ^c}. Statement: let K̃ ⊂ G̃(A^∞_{F^+}) be a good subgroup decomposed with respect to P with K̃_{U,v̄} = U(O_{F^+_v̄}) for every v̄ ∈ S̄_p, and K = K̃ ∩ G(A^∞_{F^+}); let m ⊂ T^S be non-Eisenstein and m̃ = S^*(m) ⊂ T̃^S. Let S̄_p = S̄_1 ⊔ S̄_2 and let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, λ ∈ (Z^n_+)^{Hom(F,E)} be dominant with (1) λ̃_v̄ = λ_v̄ (via (2.2.2)) for v̄ ∈ S̄_1; (2) λ̃_v̄ = 0 for v̄ ∈ S̄_2; (3) for each v̄ ∈ S̄_2 some w_v̄ ∈ W^P_v̄ with λ_v̄ = w_v̄(ρ_v̄) − ρ_v̄; (4) p > n² (p unramified in F throughout §4). Put w_v̄ = 1 for v̄ ∈ S̄_1 and w = (w_v̄). Then for every m ≥ 1, R Γ(X_K, V_λ/ϖ^m)_m[−l(w)] is a T̃^S-equivariant direct summand (T̃^S acting through S) of R Γ(∂X̃_K̃, V_λ̃/ϖ^m)_m̃.

**Construction or proof:**

1. Use the coefficient Siegel retract and the derived unipotent formality decomposition.

2. Apply the integral Kostant formula separately at places in S₁ and S₂; the chosen constituent has shift −l(w).

3. Pass to the localized boundary using the ALS stratum comparison, retaining the exact coefficient lattice and Hecke action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), [PA.0/equivariant-retract](#equivariant-retract), [PA.1/integral-kostant-decomposition](#integral-kostant-decomposition), [PA.1/unipotent-derived-formality](#unipotent-derived-formality), `mathlib:DerivedCategory`, [PA.0/unitary-levi-weight-dictionary](#unitary-levi-weight-dictionary).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.2, Theorem 4.2.1, pp. 968–970. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="integral-kostant-decomposition"></a>

### Theorem: Lemma 4.2.2(2): integral Kostant decomposition of Hom_O(∧^i(U(O_K)⊗O), O) for p ≥ 2n−1

**Node:** `PotentialAutomorphyInfrastructure:PA.1/integral-kostant-decomposition`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.integral_kostant_decomposition`.

Let v̄ ∈ S̄_p, K = F^+_v̄ and assume p ≥ 2n − 1. For w ∈ W^P_v̄ put λ_w = w(ρ_v̄) − ρ_v̄ ∈ (Z^n_+)^{Hom_{Q_p}(F⊗_{F^+}F^+_v̄, E)} (via (2.2.2)). For each i ≥ 0 there is a G(O_K)-equivariant isomorphism Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O) ≅ ⊕_{w ∈ W^P_v̄, l(w) = i} V_{λ_w} (V_{λ_w} the integral dual Weyl module lattice).

**Construction or proof:**

1. Import integral highest-weight lattices, reduction and the linkage criterion from the reductive-group owner.

2. For p ≥ 2n−1 the relevant GL_n weights stay in the required bottom alcove; compute the characteristic-zero Kostant constituents.

3. Simplicity and absence of extensions modulo the coefficient maximal ideal lift the direct decomposition integrally by universal coefficients.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/kostant-shuffles](#kostant-shuffles), [PA.0/unipotent-exterior-cohomology](#unipotent-exterior-cohomology), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.2, Lemma 4.2.2(2), pp. 970–971. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unipotent-derived-formality"></a>

### Theorem: Lemma 4.2.3: R Γ(U(O_K), O/ϖ^m) splits as the sum of its shifted cohomology when p > n²

**Node:** `PotentialAutomorphyInfrastructure:PA.1/unipotent-derived-formality`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.unipotent_derived_formality`.

Let v̄ ∈ S̄_p, K = F^+_v̄, m ≥ 1 and p > n². There is a natural isomorphism, inducing the identity on cohomology, R Γ(U(O_K), O/ϖ^m) ≅ ⊕_{i=0}^{n²[K:Q_p]} H^i(U(O_K), O/ϖ^m)[−i] in D(O/ϖ^m[G(O_K)]).

**Construction or proof:**

1. Split H⁰ first using invariants.

2. Separate the remaining exterior degrees using central-torus characters and the inequalities 0 ≤ i_σ ≤ n² < p.

3. If p = n²+1 causes the extreme central character collision, the H⁰ splitting already removes it; assemble identity maps on cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/unipotent-exterior-cohomology](#unipotent-exterior-cohomology).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.2, Lemma 4.2.3, pp. 971–972. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="middle-degree-satake"></a>

### Theorem: Proposition 4.3.4(i): S descends to T̃^S(H^d(X̃_K̃, V_λ̃))_m̃ → T^S(H^{d−l(w)}(X_K, V_{λ_w}))_m

**Node:** `PotentialAutomorphyInfrastructure:PA.1/middle-degree-satake`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.middle_degree_satake`.

Assume [F^+:Q] > 1. Let K̃ ⊂ G̃(A^∞_{F^+}) be good and decomposed with respect to P (K = K̃ ∩ G), with K̃_{U,v̄} = U(O_{F^+_v̄}) for each v̄ ∈ S̄_p (a hypothesis of Theorem 4.2.1 that the proof needs and the statement omits), λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} and S̄_p = S̄_1 ⊔ S̄_2 with (1) λ̃_v̄ = 0 for v̄ ∈ S̄_2; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (3) p > n² (p unramified in F). Let w ∈ W^P_{S̄_2}, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S non-Eisenstein in the support of H^*(X_K, V_{λ_w}), m̃ = S^*(m), and assume ρ̄_m̃ decomposed generic. Then S: T̃^S → T^S descends to a homomorphism T̃^S(H^d(X̃_K̃, V_λ̃))_m̃ → T^S(H^{d−l(w)}(X_K, V_{λ_w}))_m.

**Construction or proof:**

1. Apply IG.7 concentration and its torsion-free middle-degree consequence.

2. Compose the map to boundary cohomology with the shifted retract of Theorem 4.2.1.

3. Descend the Satake action to the middle and shifted Hecke images; only the rational injection claimed by the source is used.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/boundary-degree-retract](#boundary-degree-retract), `ArithmeticLocallySymmetricSpaces:ALS.3`, `IgusaVarietiesAndTorsionConcentration:IG.7`, `AutomorphicGaloisRepresentationsPartII:AG2.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.3, Proposition 4.3.4, pp. 973–974. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ctg-weight"></a>

### Definition: Definition 4.3.5: CTG weights ('cohomologically trivial for G')

**Node:** `PotentialAutomorphyInfrastructure:PA.1/ctg-weight`. **Proposed declaration:** `CTGWeight`.

Given the actual finite set W^P of Siegel shuffles, the embedding involution τ↦τc and the Levi weight table μ(w,τ,i)=λ_{w,τ,i}, define CTGWeight(μ) by: for every w∈W^P and a∈Z there exists τ for which the vector (μ(w,τ,i)+μ(w,τc,n−1−i))_i is not the constant a vector. Here λ_w=w(λ̃+ρ)−ρ and the conjugate dual row is −reverse(λ_{w,τc}). This predicate on the computed table is Definition 4.3.5; the packet does not replace the weight calculation by arbitrary parallel-trace inequalities.

**Construction or proof:**

1. For each Kostant representative form the Levi weight w(λ̃+ρ)−ρ.

2. Exclude every parallel determinant character by testing a difference against the conjugate dual weight at some embedding.

**Uses that determine the API:**

- ACC Proposition 4.4.6: Excludes unwanted Levi cuspidal contributions at v′.

- ACC Proposition 5.4.13: Enables middle-degree ordinary comparison.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `CTGWeight.iff_witness` | characterisation | CTG is equivalent to ∀w,a, ∃τ,i, μ(w,τ,i)+μ(w,τc,n−1−i)≠a. |
| `CTGWeight.reindex` | functoriality | Equivariant bijections of embeddings and bijections of W preserve the predicate. |
| `CTGWeight.not_parallel` | relation | If one w and a give that same constant vector at every τ, the table is not CTG. |
| `CTGWeight.no_cuspidal_levi_weight` | compatibility | For the weight table calculated from λ̃, CTG excludes a regular algebraic cuspidal GL_n representation of any weight λ_w, by the imported purity lemma. |

**Unit tests:**

- `CTGWeight.zero` (non-example): For nonempty W and n>0 the zero table is not CTG.

- `CTGWeight.empty_w` (degenerate): With W empty the predicate is true.

- `CTGWeight.rank_one_pair` (computation): For n=1, one w and embeddings a,aᶜ,b,bᶜ, with μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0, the table is CTG: the conjugate sums are 0 and 1.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For nonempty W and n>0 the zero table is not CTG. With W empty the predicate is true. For n=1, one w and embeddings a,aᶜ,b,bᶜ, with μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0, the table is CTG: the conjugate sums are 0 and 1.

**Direct prerequisites:** [PA.1/kostant-shuffles](#kostant-shuffles), [PA.0/unitary-levi-weight-dictionary](#unitary-levi-weight-dictionary).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.3, Definition 4.3.5 and following paragraph, p. 974. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ctg-one-embedding-perturbation"></a>

### Theorem: Lemma 4.3.6: CTG weights exist after changing one embedding

**Node:** `PotentialAutomorphyInfrastructure:PA.1/ctg-one-embedding-perturbation`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ctg_one_embedding_perturbation`.

Assume [F^+:Q] > 1. Let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} and τ_0: F^+ ↪ E. There is λ̃' ∈ (Z^{2n}_+)^{Hom(F^+,E)} with λ̃'_τ = λ̃_τ for all τ ≠ τ_0 and λ̃' CTG; one may take λ̃'_{τ_0} = λ̃_{τ_0} + (a, 0, …, 0) with a ∈ Z_{≥0} sufficiently large (depending on λ̃).

**Construction or proof:**

1. Change the first coordinate at a single embedding by a sufficiently large integer preserving dominance.

2. Use the corrected sufficient criterion: the sums Σ_i(μ_{w,τ,i}+μ_{w,τc,i}) differ at two embeddings. If CTG failed all these sums would equal na. Perturbing the first coordinate at τ₀ changes one sum by ±a for every shuffle; finitely many forbidden a can be excluded. The printed minus sign in (4.3.7) is incorrect.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/ctg-weight](#ctg-weight).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.3, Lemma 4.3.6 and (4.3.7), pp. 974–975. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-degree-shifting"></a>

### Theorem: Proposition 4.4.1: degree shifting to the middle degree of X̃ (degrees ⌊d/2⌋ ≤ q ≤ d−1)

**Node:** `PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-degree-shifting`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_degree_shifting`.

Let λ ∈ (Z^n_+)^{Hom(F,E)} and let v̄ ≠ v̄' be p-adic places of F^+ (so F^+ ≠ Q). Fix m ≥ 1 and a good K̃ ⊂ G̃(A^∞_{F^+}) (K = K̃ ∩ G). Assume: (1) −λ_{τc,1} − λ_{τ,1} ≥ 0 for every τ: F ↪ E inducing v̄; (2) Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (3) U(O_{F^+_{v̄''}}) ⊂ K̃_{v̄''} ⊂ {g ≡ (1_n *; 0 1_n) mod ϖ^m_{v̄''}} for every p-adic v̄'' ≠ v̄, and K̃_v̄ = G̃(O_{F^+_v̄}); (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (6) m ⊂ T^S is non-Eisenstein and ρ̄_m̃ is decomposed generic. Define λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} by λ̃_τ = 0 if τ induces neither v̄ nor v̄', λ̃_τ = (−λ_{τ̃c,n}, …, −λ_{τ̃c,1}, λ_{τ̃,1}, …, λ_{τ̃,n}) if τ induces v̄ (dominant by (1)), and λ̃_τ ∈ Z^{2n}_+ arbitrary if τ induces v̄'. For m' ≥ m let K̃(m')_{v̄''} = K̃_{v̄''} ∩ {g ≡ (1_n *; 0 1_n) mod ϖ^{m'}_{v̄''}} for p-adic v̄'' ≠ v̄ and K̃(m')_{v̄''} = K̃_{v̄''} otherwise (K̃ = K̃(m)). Let q ∈ [⌊d/2⌋, d−1]. Then there are m' ≥ m, N ≥ 1 depending only on n and [F^+:Q], a nilpotent ideal J ⊂ A(K,λ,q,m) with J^N = 0, and a commutative square T̃^S → Ã(K̃(m'), λ̃) → A(K,λ,q,m)/J, T̃^S →^S T^S → A(K,λ,q,m)/J.

**Construction or proof:**

1. Choose the local Kostant constituent of length d−q; apply the boundary-degree retract and IG.7 middle-degree concentration.

2. Use the universal-coefficient torsion sequence and multiply annihilator ideals, tracking the recurrence N′ = 1+(d−q−1)N.

3. Use Hochschild–Serre to descend from the finer level; the exponent depends only on n and [F⁺:Q], not on m or the fine level.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/boundary-degree-retract](#boundary-degree-retract), [PA.1/middle-degree-satake](#middle-degree-satake), `IgusaVarietiesAndTorsionConcentration:IG.7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.4, Proposition 4.4.1 (with Hypothesis 4.4.2 and (4.4.3)–(4.4.5) in its proof), pp. 975–978. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="middle-range-fontaine-laffaille"></a>

### Theorem: Proposition 4.4.6: Fontaine–Laffaille property of ρ_m on A(K,λ,q,m) for ⌊d/2⌋ ≤ q ≤ d−1

**Node:** `PotentialAutomorphyInfrastructure:PA.1/middle-range-fontaine-laffaille`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.middle_range_fontaine_laffaille`.

Let λ, v̄ ≠ v̄', m ≥ 1 and a good K̃ satisfy (1) −λ_{τc,1} − λ_{τ,1} ≥ 0 and −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 1 for every τ inducing v̄, and (2)–(6) of Proposition 4.4.1. Let q ∈ [⌊d/2⌋, d−1], and (for (c), which the statement gives without it) assume A(K,λ,q,m) ≠ 0. Then there are N ≥ 1 depending only on [F:Q] and n, an ideal J ⊂ A(K,λ,q,m) with J^N = 0 and a continuous ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J) with (a) char(ρ_m(Frob_v)) = image of P_v(X) for v ∉ S; (b) for each v | v̄, ρ_m|_{G_{F_v}} is in the essential image of G^a, a = (λ_{τ,n})_{τ ∈ Hom_{Q_p}(F_v,E)}; (c) for each v | v̄ there is N̄ ∈ MF_k with ρ̄_m̃|_{G_{F_v}} ≅ G(N̄) and FL_τ(N̄) = {−λ_{τc,n}+2n−1, …, −λ_{τc,1}+n, λ_{τ,1}+n−1, …, λ_{τ,n}} for every τ ∈ Hom_{Q_p}(F_v,E), where ρ̄_m̃ = ρ̄_m ⊕ ρ̄_m^{c,∨}ε^{1−2n}.

**Construction or proof:**

1. Use the degree-shifting Hecke quotient and the unitary crystalline representation supplied by AG2.

2. Apply the integral Fontaine–Laffaille interval bound at v and CTG at v′.

3. Separate the two residual summands by the Cayley–Hamilton projector; take the rank-n subquotient in the Fontaine–Laffaille category.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/fontaine-laffaille-degree-shifting](#fontaine-laffaille-degree-shifting), [PA.1/ctg-weight](#ctg-weight), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `IgusaVarietiesAndTorsionConcentration:IG.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.4`, `AutomorphicGaloisRepresentationsPartII:AG2.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.4, Proposition 4.4.6, pp. 979–981. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="nilpotent-fontaine-laffaille-transfer"></a>

### Theorem: Transfer of the Fontaine–Laffaille property from a flat determinant to a nilpotent quotient (step in Prop. 4.4.6)

**Node:** `PotentialAutomorphyInfrastructure:PA.1/nilpotent-fontaine-laffaille-transfer`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.nilpotent_fontaine_laffaille_transfer`.

Let Ã be a finite flat O-algebra, D̃ a continuous 2n-dimensional determinant of G_{F,S} valued in Ã ([Che14, Ex. 2.32]) such that for each v | v̄ the G_{F_v}-module Ã[G_{F,S}]/ker D̃ lies in the essential image of G^a. Let Ã → A/J be a homomorphism with D̃ ⊗_Ã A/J = det(ρ ⊕ ρ'), where ρ, ρ': G_{F,S} → GL_n(A/J) have absolutely irreducible, non-isomorphic residual representations. Then (A/J)[G_{F,S}]/ker(D̃_{A/J}) = M_n(A/J) × M_n(A/J), this algebra is a quotient of Ã[G_{F,S}]/ker D̃, and hence ρ|_{G_{F_v}} lies in the essential image of G^a. Inputs: kernels of determinants commute with flat base change; [Che14, §1.17, Thm 2.12, Thm 2.22(i),(ii), Lem. 1.18].

**Construction or proof:**

1. Use the flat determinant to construct its Fontaine–Laffaille representation.

2. Pass through the specified nilpotent quotient using full faithfulness and stability of the essential image under subquotients.

3. Keep the exponent uniform; no natural map from the integral cohomology Hecke image to the torsion cohomology image is assumed.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.4, proof of Proposition 4.4.6, pp. 980–981 (Remark 4.4.7). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="all-degree-fontaine-laffaille"></a>

### Theorem: Corollary 4.4.8: Fontaine–Laffaille property of ρ_m on A(K,λ,q,m) in all degrees 0 ≤ q ≤ d−1

**Node:** `PotentialAutomorphyInfrastructure:PA.1/all-degree-fontaine-laffaille`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.all_degree_fontaine_laffaille`.

Let v̄ ∈ S̄_p (printed S_p), K ⊂ GL_n(A_F^∞) good, λ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S(K,λ) non-Eisenstein. Assume: (1) K_v = GL_n(O_{F_v}) for v | v̄; (2) there is v̄' ∈ S̄_p, v̄' ≠ v̄, with Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (3) −λ_{τc,1} − λ_{τ,1} ≥ 0 and −λ_{τc,n} − λ_{τ,n} ≤ p − 1 − 2n for every τ inducing v̄; (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (6) ρ̄_m is decomposed generic. Then for all integers q ∈ [0, d−1] and m ≥ 1 there are N ≥ 1 depending only on [F:Q] and n, J ⊂ A(K,λ,q,m) with J^N = 0, and a continuous ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J) satisfying (a), (b), (c) of Proposition 4.4.6.

**Construction or proof:**

1. First prove the upper-degree range using Proposition 4.4.6.

2. Reflect q to d−1−q using Poincaré duality and the cyclotomic twist.

3. Choose a finite character so that the unitary residual direct sum is decomposed generic, and compare twisted coefficient systems.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), [PA.1/nilpotent-fontaine-laffaille-transfer](#nilpotent-fontaine-laffaille-transfer), [PA.1/degree-reflection-duality](#degree-reflection-duality), [PA.1/genericity-making-character-twist](#genericity-making-character-twist), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.4, Corollary 4.4.8, pp. 981–984. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="degree-reflection-duality"></a>

### Theorem: Degree reflection by duality and a cyclotomic twist (step in Cor. 4.4.8)

**Node:** `PotentialAutomorphyInfrastructure:PA.1/degree-reflection-duality`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.degree_reflection_duality`.

Assume K is principal-congruence of level ϖ^m at the p-adic places ≠ v̄, λ_{v̄''} = 0 for p-adic v̄'' ≠ v̄, and λ satisfies (3) of Cor. 4.4.8. Then V_{λ^∨} ≅ V_λ^∨ ([Jan03, Cor. II.5.6]). With n_0 = (2n+1−p)/2 and μ_{0,τ} = (n_0, …, n_0), the maximal ideal m^∨(ε^{−n_0}) lies in the support of H^*(X_K, V_{λ^∨+μ_0}), λ^∨+μ_0 again satisfies (3), and [K^S g K^S] ↦ ε(Art_F(det g))^{−n_0}[K^S g^{−1} K^S] (printed Art_K) descends to an isomorphism f: T^S(H^{d−1−q'}(X_K, V_{λ^∨+μ_0}/ϖ^m))_{m^∨(ε^{−n_0})} ≅ A(K,λ,q',m); a representation ρ' for the left side gives ρ = (f∘ρ')^∨ ⊗ ε^{1−2n+(p−1)/2} for the right side, with the same properties (a)–(c).

**Construction or proof:**

1. Use the orientation and coefficient duality in ALS to identify complementary degrees q and d−1−q.

2. Track the contragredient and ε^{1−2n} twist through the Hecke polynomial; translate the Fontaine–Laffaille weight interval.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison), `ArithmeticLocallySymmetricSpaces:ALS.4`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.4, proof of Corollary 4.4.8, pp. 983–984. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="genericity-making-character-twist"></a>

### Theorem: Existence of a twist making ρ̄_m̃ decomposed generic (step in Cor. 4.4.8)

**Node:** `PotentialAutomorphyInfrastructure:PA.1/genericity-making-character-twist`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.genericity_making_character_twist`.

(Asserted without proof.) If ρ̄_m is decomposed generic then, after enlarging k, there is a character ψ̄: G_F → k^× with ψ̄|_{G_{F_v}} trivial for every v ∈ S such that (ρ̄_m ⊗ ψ̄) ⊕ ((ρ̄_m ⊗ ψ̄)^{c,∨} ⊗ ε^{1−2n}) is decomposed generic.

**Construction or proof:**

1. At a completely split generic rational prime, choose finite character values avoiding all forbidden cross-summand ratios.

2. Use class-field approximation with the character trivial at S, and take its Teichmüller lift.

3. Enlarge S only as prescribed and descend through the prime-to-p abelian quotient.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.4, proof of Corollary 4.4.8, p. 984. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="shifted-partition-recovery"></a>

### Theorem: Lemma 4.5.2: recovering a partition from two shifted partitions

**Node:** `PotentialAutomorphyInfrastructure:PA.1/shifted-partition-recovery`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.shifted_partition_recovery`.

Let m ≥ 1 and let A, B, C, D be sets of integers, each of size m, with c > d for all c ∈ C and d ∈ D. If A ∪ B = C ∪ D and (A+1) ∪ B = (C+1) ∪ D, and both sets have 2m elements, then A = C and B = D.

**Construction or proof:**

1. Compare multiplicities at the largest value where the two partitions differ.

2. Use the strict separation C>D and the second partition after shifting A,C by one to eliminate that value; induct on the finite multisets.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** Only the concrete finite data and categorical/module operations in the statement; no arithmetic supplier is inferred..

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.5, Lemma 4.5.2, p. 989. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-local-global"></a>

### Theorem: Theorem 4.5.1: local–global compatibility at l = p in the Fontaine–Laffaille case

**Node:** `PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-local-global`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_local_global`.

Let K ⊂ GL_n(A_F^∞) be a good subgroup, λ ∈ (Z^n_+)^{Hom(F,E)}, S a finite set of finite places of F containing the p-adic places with S = S^c, and m ⊂ T^S(K,λ) a non-Eisenstein maximal ideal with T^S(K,λ)/m = k of characteristic p. Let v̄ be a p-adic place of F^+ and assume: (1) p is unramified in F and F contains an imaginary quadratic field in which p splits; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (3) K_v = GL_n(O_{F_v}) for every v | v̄; (4) λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} ≤ p − 2n − 1 for every τ: F ↪ E inducing v̄; (5) p > n²; (6) there is a p-adic place v̄' ≠ v̄ of F^+ with Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (7) ρ̄_m is decomposed generic; (8) either (a) H^*(X_K, V_λ)_m[1/p] ≠ 0, or (b) for every τ inducing v̄, −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 2 and −λ_{τc,1} − λ_{τ,1} ≥ 0. Then there are an integer N ≥ 1 depending only on [F^+:Q] and n, an ideal J (of T^S(K,λ)_m; printed 'J ⊂ T^S(K,λ)') with J^N = 0, and a continuous ρ_m: G_{F,S} → GL_n(T^S(K,λ)_m/J) such that: (a) for each finite v ∉ S, the characteristic polynomial of ρ_m(Frob_v) is the image of P_v(X); (b) for each v | v̄, ρ_m|_{G_{F_v}} lies in the essential image of G^a with a = (λ_{τ,n})_{τ ∈ Hom(F_v,E)}; (c) for each v | v̄ there is M̄ ∈ MF_k with ρ̄_m|_{G_{F_v}} ≅ G(M̄) and FL_τ(M̄) = {λ_{τ,1}+n−1, λ_{τ,2}+n−2, …, λ_{τ,n}} for every τ: F_v ↪ E.

**Construction or proof:**

1. Use Corollary 4.4.8 on the torsion cohomology images and the uniform nilpotence bound to pass to the complex Hecke algebra.

2. In case (8a), import the automorphic point and its pure central-character weight sum, and twist by a crystalline global character.

3. In case (8b), use two character twists differing by one and the shifted-partition recovery lemma to identify the bottom n weights.

4. Remove the twists and read the rank-n residual Fontaine–Laffaille multiset with geometric Artin and HT(ε)=−1 conventions.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/all-degree-fontaine-laffaille](#all-degree-fontaine-laffaille), [PA.1/shifted-partition-recovery](#shifted-partition-recovery), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.4`, `AutomorphicGaloisRepresentationsPartII:AG2.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.1, Theorem 4.5.1, p. 967 (restated §4.5, p. 985; proof pp. 985–988). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

**Stage acceptance:** Run every definition’s small-case and non-example tests above, compare all degree shifts and character normalizations to the cited source, and fulfil every listed supplier contract used by the stage. A recorded gap remains a failed closure obligation; passing the structural packet checker does not discharge it.

## PA.2. Ordinary induction and degree shifting

PA.2 develops ordinary cohomology at coefficient characteristic p. It imports the general profinite ordinary projector from PadicFamilies L0a and applies it to the finite Iwahori towers. Positive torus operators act on unipotent invariants by transfer; they do not act by simply applying a nonnormalizing torus element to invariant vectors. Localization at the contracting operator defines local ordinary parts in a smooth monoid module category. The familiar exact Jacquet functor theorem for coefficients prime to p cannot supply these comparisons.

Completed/classical control, level control and the lowest-weight projection reduce all coefficient weights to a normalized character. That character evaluates algebraically on units but gives value one on the chosen uniformizers. The suggested core types one split local factor; the full arithmetic torus is the product of those factors with their topologies. The unitary contraction uses all 2n−1 simple operators. Its positive cone and the GL_n positive cone have distinct Satake images.

The relative Bruhat filtration remains a filtration, with compact-induction layers, orientation character, modular character and the shift −d+l(w). It is not replaced by an unconditional direct decomposition. Absolute length incorporates the local degrees; the longest relative length is n² times the number of places of F⁺ above p. The middle-degree quotient imports IG.7 independently of the Fontaine–Laffaille applications. The determinant torus of dimension [F⁺:Q]−1 fills the degree gaps through a neat component product and a trivial central Hecke action.

The ordinary Satake comparison maps onto its image. Extending the characteristic and ordered-product identities to the whole GL_n Hecke coefficient algebra needs an O-flat polynomial-law argument, explicitly recorded as a proof gap. The final local–global statement includes both the characteristic polynomial for every g and the ordered n-factor matrix product for arbitrary g₁,…,g_n. These identities precede the arithmetic-point full-flag conclusion; unit eigenvalues alone do not imply that flag. The CTG construction requires n≥2; the n=1 branch uses Hecke characters.

**Coverage:** planned. **Remaining:** Supply smooth monoid categories at coefficient p, complete the genuine arithmetic functor signatures and test instances, and verify Geraghty normalizations and the unitary full contraction. Establish the O-flat polynomial-law transfer across the Satake image inclusion; handle the ordinary n=1 Hecke-character branch independently of CTG.

**Planets:** Ordinary parts; Ordinary Bruhat comparison; Ordinary degree shifting; Determinant torus; Ordinary Galois filtration; Ordinary local–global compatibility.

**Declaration inventory:** [iwahori-level-tower](#iwahori-level-tower), [arithmetic-ordinary-summand](#arithmetic-ordinary-summand), [ordinary-galois-characters](#ordinary-galois-characters), [positive-torus-monoid](#positive-torus-monoid), [lowest-weight-character](#lowest-weight-character), [local-ordinary-parts](#local-ordinary-parts), [ordinary-torus-invariants](#ordinary-torus-invariants), [unipotent-invariants-acyclicity](#unipotent-invariants-acyclicity), [ordinary-exact-injective](#ordinary-exact-injective), [iwahori-borel-ordinary-comparison](#iwahori-borel-ordinary-comparison), [derived-ordinary-comparison](#derived-ordinary-comparison), [completed-arithmetic-cohomology](#completed-arithmetic-cohomology), [completed-ordinary-cohomology](#completed-ordinary-cohomology), [completed-classical-ordinary-control](#completed-classical-ordinary-control), [ordinary-level-control](#ordinary-level-control), [completed-ordinary-weight-control](#completed-ordinary-weight-control), [finite-ordinary-weight-control](#finite-ordinary-weight-control), [unitary-ordinary-tower](#unitary-ordinary-tower), [ordinary-satake-homomorphism](#ordinary-satake-homomorphism), [unitary-completed-boundary](#unitary-completed-boundary), [unitary-ordinary-control](#unitary-ordinary-control), [relative-bruhat-cells](#relative-bruhat-cells), [bruhat-cell-induction](#bruhat-cell-induction), [bruhat-filtration](#bruhat-filtration), [bruhat-invariant-filtration](#bruhat-invariant-filtration), [bruhat-unipotent-acyclicity](#bruhat-unipotent-acyclicity), [ordinary-compact-cell-comparison](#ordinary-compact-cell-comparison), [bruhat-unipotent-invariants](#bruhat-unipotent-invariants), [bruhat-evaluation-comparison](#bruhat-evaluation-comparison), [bruhat-orientation-character](#bruhat-orientation-character), [ordinary-unipotent-degree-shift](#ordinary-unipotent-degree-shift), [ordinary-bruhat-piece](#ordinary-bruhat-piece), [completed-boundary-induction-retract](#completed-boundary-induction-retract), [ordinary-boundary-degree-shifting](#ordinary-boundary-degree-shifting), [ordinary-ctg-weight-choice](#ordinary-ctg-weight-choice), [ordinary-middle-degree-quotient](#ordinary-middle-degree-quotient), [determinant-torus](#determinant-torus), [determinant-component-product](#determinant-component-product), [determinant-neat-level-shrinking](#determinant-neat-level-shrinking), [central-torus-cohomology-shifting](#central-torus-cohomology-shifting), [all-degree-ordinary-characteristic-data](#all-degree-ordinary-characteristic-data), [ordinary-automorphic-galois-flag](#ordinary-automorphic-galois-flag), [ordinary-local-global](#ordinary-local-global).

<a id="iwahori-level-tower"></a>

### Definition: Setup of §5: the level subgroups K(b,c), the ordinary Hecke algebra T^{S,ord}, U_v and U_p

**Node:** `PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower`. **Proposed declaration:** `IwahoriLevelTower`.

Standing data: F a CM field, n ≥ 1, p a prime, E/Q_p finite containing the images of all embeddings F ↪ Q̄_p; standing hypothesis for all of §5: F contains an imaginary quadratic field in which p splits (p may ramify in F). Let K ⊂ GL_n(A_F^∞) be a good subgroup, λ ∈ (Z^n_+)^{Hom(F,E)}, S a finite set of finite places of F containing S_p and stable under c, such that (i) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in some imaginary quadratic subfield of F; (ii) K_v = Iw_v for v | p and K_v = GL_n(O_{F_v}) for finite v ∉ S. For integers c ≥ b ≥ 0 with c ≥ 1, K(b,c) ⊂ K is the good subgroup with K(b,c)_v = K_v for v ∤ p and K(b,c)_v = Iw_v(b,c) for v | p; K(0,1) = K and K(0,c)/K(b,c) ≅ ∏_{v|p} T_n(O_{F_v}/ϖ_v^b). Define T^{S,ord} = T^S ⊗_O O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v|p}] (U_{v,i} formal variables), U_v = U_{v,1}U_{v,2}⋯U_{v,n−1}, U_p = ∏_{v|p} U_v. The canonical surjection O⟦T_n(O_{F,p})⟧ → O[K(0,c)/K(b,c)] extends to T^{S,ord} → End_{D(O[K(0,c)/K(b,c)])}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)), U_{v,i} acting by the double coset operator [Iw_v(b,c) diag(ϖ_v,…,ϖ_v,1,…,1) Iw_v(b,c)] (i entries ϖ_v). Additional standing hypothesis for §§5.2–5.5: ϖ_{v^c} = ϖ_v^c for every v | p; the U_{v,i} depend on ϖ_v but RΓ^ord, T^S(K(b,c),λ)^ord and the truth of Theorem 5.5.1 do not.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.2.15: Supplies the classical finite levels.

- ACC §6.6.1: Supplies finite Hida complexes.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `IwahoriLevelTower.level` | data | The (b,c)-level equals K away from p and matrices upper triangular modulo varpi_v^c with diagonal congruent to 1 modulo varpi_v^b at p. |
| `IwahoriLevelTower.transition` | functoriality | For b′≥b,c′≥c, inclusion of levels gives compatible pullback and trace on integral cohomology. |
| `IwahoriLevelTower.diamondQuotient` | compatibility | K(0,c)/K(b,c) is the product of diagonal unit groups modulo varpi_v^b. |
| `IwahoriLevelTower.ordinaryOperator` | data | U_p is the product over v\|p and 1≤i<n of the normalized double-coset operators; U_{v,n} is already invertible. |

**Unit tests:**

- `IwahoriLevelTower.base` (computation): K(0,1)=K.

- `IwahoriLevelTower.zero_b` (degenerate): For b=0 the diamond quotient is trivial.

- `IwahoriLevelTower.deep_unipotent` (non-example): For b=1 a diagonal unit not congruent to 1 modulo varpi_v is excluded even though it belongs to K(0,c).

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. K(0,1)=K. For b=0 the diamond quotient is trivial. For b=1 a diagonal unit not congruent to 1 modulo varpi_v is excluded even though it belongs to K(0,c).

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison), `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.1, pp. 989–991. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="arithmetic-ordinary-summand"></a>

### Definition: Ordinary part RΓ^ord and the ordinary Hecke algebra T^S(K(b,c),λ)^ord; Galois-type and non-Eisenstein ideals of T^{S,ord}

**Node:** `PotentialAutomorphyInfrastructure:PA.2/arithmetic-ordinary-summand`. **Proposed declaration:** `ArithmeticOrdinarySummand`.

In the setting of the previous item, there is a well-defined direct summand RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord of RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ) in D(O[K(0,c)/K(b,c)]) on which U_p acts invertibly (theory of ordinary parts, [KT17 §2.4]). T^S(K(b,c),λ)^ord is the image of T^{S,ord} → End_{D(O[K(0,c)/K(b,c)])}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord), i.e. T^S(K(b,c),λ)^ord = T^{S,ord}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord). There is a canonical homomorphism T^S(K(0,c)/K(b,c), V_λ) → T^S(K(b,c),λ)^ord (in general neither injective nor surjective); consequently every maximal ideal 𝔪 of T^S(K(b,c),λ)^ord has an associated ρ̄_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord/𝔪). A maximal ideal of T^{S,ord} with residue field finite over k is of Galois type (resp. non-Eisenstein) if its pullback to T^S is so in the sense of Definition 2.3.6.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC §5.1: Defines arithmetic ordinary Hecke images.

- ACC §6.6.1: Ensures ordinary finite perfect complexes meet the patching bounds.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `ArithmeticOrdinarySummand.complex` | data | The image of PadicFamilies:L0a’s derived ordinary idempotent on the tower’s finite perfect complex. |
| `ArithmeticOrdinarySummand.operator_bijective` | relation | U_p acts invertibly on that image. |
| `ArithmeticOrdinarySummand.finite_quotient_comparison` | compatibility | Modulo varpi^m the image is the stabilized factorial-power summand, and equals the localization of the finite module at U_p. |
| `ArithmeticOrdinarySummand.base_change` | functoriality | Coefficient quotient and equivariant tower maps commute with the projector after the finite-quotient/continuity hypotheses are verified. |

**Unit tests:**

- `ArithmeticOrdinarySummand.zero_complex` (degenerate): The ordinary summand of the zero complex is zero.

- `ArithmeticOrdinarySummand.unit_operator` (computation): With U_p the identity, the summand is the whole complex.

- `ArithmeticOrdinarySummand.nilpotent_operator` (non-example): A finite complex with nilpotent U_p has zero ordinary summand.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The ordinary summand of the zero complex is zero. With U_p the identity, the summand is the whole complex. A finite complex with nilpotent U_p has zero ordinary summand.

**Direct prerequisites:** [PA.2/iwahori-level-tower](#iwahori-level-tower), `PadicFamilies:L0a/finite-quotient-system`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L0a/ordinary-part-complexes`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.1, p. 990. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-galois-characters"></a>

### Definition: The characters χ_{λ,v,i}

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-galois-characters`. **Proposed declaration:** `OrdinaryGaloisCharacters`.

The operators U_{v,i} are invertible in T^S(K(b,c),λ)^ord (because U_p is). For each v | p and i = 1,…,n, χ_{λ,v,i}: G_{F_v} → (T^S(K(b,c),λ)^ord)^× is the unique continuous character with χ_{λ,v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) · ∏_{τ∈Hom_{Q_p}(F_v,E)} τ(u)^{−(w_0^G λ)_{τ,i}} · ⟨diag(1,…,u,…,1)⟩ for u ∈ O_{F_v}^× (u in the i-th diagonal entry), and χ_{λ,v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) · U_{v,i}/U_{v,i−1} (with U_{v,0} = 1).

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Theorem 5.5.1: Specifies characteristic factors and ordered matrix products.

- ACC Corollary 5.5.2: Specifies the full ordinary Galois flag.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `OrdinaryGaloisCharacters.on_units` | simp | On Art(u), χ_i=ε^{1−i}∏τ τ(u)^{−λ_{τ,n−i+1}} times the i-th diamond character. |
| `OrdinaryGaloisCharacters.on_uniformizer` | simp | On Art(varpi_v), χ_i=ε^{1−i} U_{v,i}/U_{v,i−1}, with U_{v,0}=1. |
| `OrdinaryGaloisCharacters.unique` | extensionality | The unit formula and chosen uniformizer value determine the continuous character by local class field theory. |
| `OrdinaryGaloisCharacters.change_uniformizer` | compatibility | Changing the uniformizer changes the U-ratio by the corresponding unit/diamond factor and leaves the Galois character unchanged. |

**Unit tests:**

- `OrdinaryGaloisCharacters.rank_one` (computation): For n=1, χ₁(Art(varpi_v))=U_{v,1}.

- `OrdinaryGaloisCharacters.determinant` (characterisation): The product of the n uniformizer values is ε^{n(1−n)/2}U_{v,n}.

- `OrdinaryGaloisCharacters.weight_reversal` (non-example): For rank 2 with λ=(2,0), the algebraic unit factors are 1 for χ₁ and u^{-2} for χ₂ before ε and diamonds; using λ_i instead of λ_{n−i+1} reverses them.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For n=1, χ₁(Art(varpi_v))=U_{v,1}. The product of the n uniformizer values is ε^{n(1−n)/2}U_{v,n}. For rank 2 with λ=(2,0), the algebraic unit factors are 1 for χ₁ and u^{-2} for χ₂ before ε and diamonds; using λ_i instead of λ_{n−i+1} reverses them.

**Direct prerequisites:** [PA.2/iwahori-level-tower](#iwahori-level-tower), [PA.2/arithmetic-ordinary-summand](#arithmetic-ordinary-summand), `mathlib:Matrix.charpoly`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.1, p. 990. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="positive-torus-monoid"></a>

### Definition: Positive monoids, T_n(O_{F,p})(b), u_p, B_n(F_p)^+ and the T^{S,ord}-action on complexes over T_n(F_p)^+_b

**Node:** `PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid`. **Proposed declaration:** `PositiveTorusMonoid`.

T_n(F_p)^+ ⊂ T_n(F_p) is the open submonoid of t with t N_n(O_{F,p}) t^{-1} ⊂ N_n(O_{F,p}); T_n(F_v)^+ = T_n(F_v) ∩ T_n(F_p)^+; Δ_p = ∏_{v|p} Iw_v T_n(F_v)^+ Iw_v (§2.2.5). For b ≥ 0: T_n(O_{F,p})(b) = ∏_{v∈S_p} ker(T_n(O_{F_v}) → T_n(O_{F_v}/ϖ_v^b)), T_n(O_{F,p})_b = T_n(O_{F,p})/T_n(O_{F,p})(b), T_n(F_p)^+_b = T_n(F_p)^+/T_n(O_{F,p})(b), T_n(F_p)_b = T_n(F_p)/T_n(O_{F,p})(b). u_p = (p^{n−1}, p^{n−2}, …, 1) ∈ T_n(Q_p) ⊂ T_n(F_p) lies in T_n(F_p)^+. B_n(F_p)^+ = N_n(O_{F,p})·T_n(F_p)^+ ⊂ Δ_p; B_n(O_{F,p})(b) is the preimage of T_n(O_{F,p})(b) in B_n(O_{F,p}). Every C ∈ D_sm(O/ϖ^m[T_n(F_p)^+_b]) carries a functorial homomorphism O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v∈S_p}] → End(C), via O⟦T_n(O_{F,p})⟧ → O/ϖ^m[T_n(O_{F,p})_b] and U_{v,i} ↦ diag(ϖ_v,…,ϖ_v,1,…,1) ∈ T_n(F_v) (i entries ϖ_v); hence a T^S-action on C extends to a T^{S,ord}-action.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 5.2.6: Supplies the common contracting denominator.

- ACC §5.3: Acts by transfer on Bruhat-cell invariants.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `PositiveTorusMonoid.mem_iff` | characterisation | For a diagonal torus element, contraction of upper unipotents is equivalent to valuation(t_i)≥valuation(t_j) for i<j. |
| `PositiveTorusMonoid.contractingElement` | data | The exponent row (n−1,n−2,…,0) defines u_p and belongs to the positive cone. |
| `PositiveTorusMonoid.unit_subgroup` | compatibility | Every diagonal unit belongs to the cone, and zero valuations recover the compact torus. |
| `PositiveTorusMonoid.mul` | structure | Componentwise products preserve the cone, so it is an open submonoid of the diagonal torus. |

**Unit tests:**

- `PositiveTorusMonoid.rank_one` (degenerate): For n=1 all diagonal torus elements are positive.

- `PositiveTorusMonoid.rank_two_positive` (computation): The exponent row (1,0) is positive.

- `PositiveTorusMonoid.rank_two_negative` (non-example): The exponent row (0,1) is not positive for the upper-triangular Borel.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For n=1 all diagonal torus elements are positive. The exponent row (1,0) is positive. The exponent row (0,1) is not positive for the upper-triangular Borel.

**Direct prerequisites:** [PA.2/iwahori-level-tower](#iwahori-level-tower), `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, pp. 992–993. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="lowest-weight-character"></a>

### Definition: The characters O(λ) and the kernel K_λ of the lowest-weight projection

**Node:** `PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character`. **Proposed declaration:** `LowestWeightCharacter`.

For λ ∈ X^*((Res_{F/Q}T_n)_E) = (Z^n)^{Hom(F,E)}, O(λ) is the free rank-one O-module on which u ∈ T_n(O_{F,p}) acts by ∏_{τ∈Hom(F,E)} ∏_{i=1}^n τ(u_i)^{λ_{τ,i}} and every diag(ϖ_v^{a_1},…,ϖ_v^{a_n}) (a_i ∈ Z) acts trivially. For dominant λ, projection to the lowest weight space gives an O-linear map V_λ → O(w_0^G λ) which is B_n(F_p)^+-equivariant (·_p-action of §2.2.5 on the source, action through the projection to T_n(F_p) on the target); K_λ := ker(V_λ → O(w_0^G λ)) is an O[B_n(F_p)^+]-module, finite free over O.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.2.17: Identifies the weight twist after ordinary localization.

- ACC §6.6.1: Removes the μ dependence of the Hida complex.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `LowestWeightCharacter.unit_eval` | simp | On units u its scalar is ∏τ,i τ(u_i)^{λ_{τ,i}}. |
| `LowestWeightCharacter.uniformizer_eval` | simp | It is 1 on every chosen diagonal uniformizer power. |
| `LowestWeightCharacter.add` | relation | The character for λ+μ is the product of the two characters. |
| `LowestWeightCharacter.projection` | compatibility | For dominant λ the integral dual-Weyl lattice has a B⁺-equivariant lowest-weight quotient O(w₀λ) with finite free kernel killed by a power of u_p modulo varpi^m. |

**Unit tests:**

- `LowestWeightCharacter.zero` (degenerate): The zero weight gives the trivial character.

- `LowestWeightCharacter.rank_one_square` (computation): For one embedding, rank one and weight 2, a unit u acts by τ(u)².

- `LowestWeightCharacter.uniformizer_normalization` (non-example): Even for nonzero λ, chosen uniformizers act by 1, not by their algebraic λ-power.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The zero weight gives the trivial character. For one embedding, rank one and weight 2, a unit u acts by τ(u)². Even for nonzero λ, chosen uniformizers act by 1, not by their algebraic λ-power.

**Direct prerequisites:** [PA.2/positive-torus-monoid](#positive-torus-monoid), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, p. 993. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="local-ordinary-parts"></a>

### Definition: The ordinary-parts functors Γ(N_n(O_{F,p}),−), Γ(B_n(O_{F,p})(b),−), Γ(Iw_p(b,c),−), Γ(T_n(O_{F,p})(b),−), ord and ord_b

**Node:** `PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts`. **Proposed declaration:** `LocalOrdinaryParts`.

Γ(N_n(O_{F,p}),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod_sm(O/ϖ^m[T_n(F_p)^+]) is N_n(O_{F,p})-invariants with t ∈ T_n(F_p)^+ acting by t·v = Σ_{n∈N_n(O_{F,p})/tN_n(O_{F,p})t^{-1}} n t v (5.2.5), i.e. by the double coset operator [N_n(O_{F,p}) t N_n(O_{F,p})]. Γ(B_n(O_{F,p})(b),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]) is B_n(O_{F,p})(b)-invariants with the same formula. For c ≥ b ≥ 0, c ≥ 1, Iw_p(b,c) = ∏_{v∈S_p} Iw_v(b,c) and Γ(Iw_p(b,c),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]), t acting by [Iw_p(b,c) t Iw_p(b,c)]. Γ(T_n(O_{F,p})(b),−) maps Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)^+_b]) and Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod(O/ϖ^m[T_n(F_p)_b]). ord = − ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)]: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)]) and ord_b = − ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b]: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b]) (localizations; on modules finite over O/ϖ^m they agree with the maximal summand on which the torus acts invertibly, [Eme10b, Lem. 3.2.1]).

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemmas 5.2.6–5.2.9: Compares torus, Borel and Iwahori derived invariants.

- ACC Proposition 5.3.8: Computes the ordinary parabolic-induction pieces.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `LocalOrdinaryParts.transfer_action` | data | The action on N(O)-invariants is t·v=Σ_{n∈N(O)/tN(O)t^{-1}} ntv. |
| `LocalOrdinaryParts.localization` | characterisation | Ordinary parts are the localization from the positive-torus monoid algebra to the group algebra after N-invariants. |
| `LocalOrdinaryParts.finite_comparison` | compatibility | On finite O/varpi^m-modules this localization is the PadicFamilies:L0a ordinary summand. |
| `LocalOrdinaryParts.map` | functoriality | Equivariant module maps induce ordinary maps and preserve identity/composition. |
| `LocalOrdinaryParts.derived` | data | Derive N-invariants in the smooth monoid category, then apply exact localization. |

**Unit tests:**

- `LocalOrdinaryParts.zero` (degenerate): The ordinary parts of the zero representation are zero.

- `LocalOrdinaryParts.trivial_unipotent` (compatibility): For N={1}, the functor is precisely torus localization.

- `LocalOrdinaryParts.transfer_not_naive` (non-example): For a trivial F_p-representation of N=Z_p and tNt^{-1}=pN, transfer acts by p=0; ordinary localization is zero although the naive t action would be the identity.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The ordinary parts of the zero representation are zero. For N={1}, the functor is precisely torus localization. For a trivial F_p-representation of N=Z_p and tNt^{-1}=pN, transfer acts by p=0; ordinary localization is zero although the naive t action would be the identity.

**Direct prerequisites:** [PA.2/positive-torus-monoid](#positive-torus-monoid), `PadicFamilies:L0a/ordinary-part-localization`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, (5.2.5), pp. 993–994. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-torus-invariants"></a>

### Theorem: Lemma 5.2.6: ord commutes with T_n(O_{F,p})(b)-invariants

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-torus-invariants`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_torus_invariants`.

For b ≥ 0 the square Γ(T_n(O_{F,p})(b),−) ∘ ord ≅ ord_b ∘ Γ(T_n(O_{F,p})(b),−) of functors Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)_b]) commutes up to natural isomorphism; i.e. the natural map M^{T_n(O_{F,p})(b)} ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b] → (M ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)])^{T_n(O_{F,p})(b)} is an isomorphism for every smooth M.

**Construction or proof:**

1. Every invariant element has a finite open torus stabilizer.

2. Choose a common contracting denominator on that finite quotient; compare invariant vectors before and after localization.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/local-ordinary-parts](#local-ordinary-parts).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, Lemma 5.2.6, p. 995. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unipotent-invariants-acyclicity"></a>

### Theorem: Lemma 5.2.7(1): N_n(O_{F,p})-invariants send injectives to T_n(O_{F,p})(b)-acyclics

**Node:** `PotentialAutomorphyInfrastructure:PA.2/unipotent-invariants-acyclicity`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.unipotent_invariants_acyclicity`.

The functors Γ(N_n(O_{F,p}),−), Γ(B_n(O_{F,p})(b),−) and Γ(Iw_p(b,c),−) on Mod_sm(O/ϖ^m[Δ_p]) are left exact, and for every b ≥ 0 the functor Γ(N_n(O_{F,p}),−) sends injective objects of Mod_sm(O/ϖ^m[Δ_p]) to Γ(T_n(O_{F,p})(b),−)-acyclic objects of Mod_sm(O/ϖ^m[T_n(F_p)^+]).

**Construction or proof:**

1. Compute invariants using the smooth monoid injective resolution.

2. Use the right adjoints to restriction and the contracting Hecke action to show higher compact-torus derived invariants vanish.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/local-ordinary-parts](#local-ordinary-parts), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, Lemma 5.2.7(1), p. 995. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-exact-injective"></a>

### Theorem: Lemma 5.2.7(2): ord and ord_b are exact and preserve injectives

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-exact-injective`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_exact_injective`.

The localization functors ord: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)]) and ord_b: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b]) are exact and preserve injectives.

**Construction or proof:**

1. Localization in the commuting positive torus operators is exact.

2. At fixed b use the noetherian finite-quotient torus algebra and the injective-extension criterion; pass through smooth open stabilizers.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/local-ordinary-parts](#local-ordinary-parts), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, Lemma 5.2.7(2), pp. 995–996. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="iwahori-borel-ordinary-comparison"></a>

### Theorem: Lemma 5.2.8: ordinary parts of Iwahori and B_n(O)(b) invariants agree

**Node:** `PotentialAutomorphyInfrastructure:PA.2/iwahori-borel-ordinary-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.iwahori_borel_ordinary_comparison`.

For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism ord_b ∘ Γ(Iw_p(b,c),−) ≅ ord_b ∘ Γ(B_n(O_{F,p})(b),−) of functors Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)_b]), induced by the inclusion V^{Iw_p(b,c)} ⊂ V^{B_n(O_{F,p})(b)} (which is T_n(F_p)^+_b-equivariant because Iw_p(b,c) has an Iwahori decomposition).

**Construction or proof:**

1. Compare Iwahori and Borel invariants by their finite decompositions.

2. The terms outside the Borel chart are killed by a power of the contracting operator; localize to obtain the comparison.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-torus-invariants](#ordinary-torus-invariants), [PA.2/ordinary-exact-injective](#ordinary-exact-injective).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, Lemma 5.2.8, pp. 996–997. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="derived-ordinary-comparison"></a>

### Theorem: Lemma 5.2.9: comparison of derived ordinary parts

**Node:** `PotentialAutomorphyInfrastructure:PA.2/derived-ordinary-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.derived_ordinary_comparison`.

Let π ∈ D_sm(O/ϖ^m[Δ_p]) be bounded below. For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism RΓ(T_n(O_{F,p})(b), ord RΓ(N_n(O_{F,p}), π)) ≅ ord_b RΓ(Iw_p(b,c), π) in D(O/ϖ^m[T_n(F_p)_b]).

**Construction or proof:**

1. Resolve in the smooth coefficient-characteristic-p monoid category.

2. Use acyclicity of N-invariants and exactness/injective preservation of ord; compare the two composite derived functors.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/unipotent-invariants-acyclicity](#unipotent-invariants-acyclicity), [PA.2/ordinary-exact-injective](#ordinary-exact-injective), [PA.2/iwahori-borel-ordinary-comparison](#iwahori-borel-ordinary-comparison), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.1, Lemma 5.2.9, pp. 997–998. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="completed-arithmetic-cohomology"></a>

### Definition: Weight-λ completed cohomology π(K^p,λ,m), π(K^p,m) and T^S(K^p,m) (§5.2.10, (5.2.11)–(5.2.13))

**Node:** `PotentialAutomorphyInfrastructure:PA.2/completed-arithmetic-cohomology`. **Proposed declaration:** `CompletedArithmeticCohomology`.

For K ⊂ GL_n(A_F^∞) good there are functors Γ_{K^p,sm}: Mod(O/ϖ^m[G^∞]) → Mod_sm(O/ϖ^m[G(F_p^+)]) and Mod(O/ϖ^m[G^{p,∞}×Δ_p]) → Mod_sm(O/ϖ^m[Δ_p]), M ↦ Γ(K^p,M)^sm. For λ ∈ (Z^n_+)^{Hom(F,E)}, π(K^p,λ,m) := RΓ_{K^p,sm} RΓ(𝔛_G, V_λ/ϖ^m) ∈ D_sm(O/ϖ^m[Δ_p]). If K^S = ∏_{v∉S} GL_n(O_{F_v}) it carries T^S → End_{D_sm(O/ϖ^m[Δ_p])}(π(K^p,λ,m)) (5.2.11), and for K_p ⊂ Δ_p a canonical T^S-equivariant isomorphism RΓ(K_p, π(K^p,λ,m)) ≅ RΓ(X_K, V_λ/ϖ^m) in D(O/ϖ^m) (5.2.12). π(K^p,m) := RΓ_{K^p,sm} RΓ(𝔛_G, O/ϖ^m) ∈ D_sm(O/ϖ^m[G(F_p^+)]) carries T^S → End_{D_sm(O/ϖ^m[G(F_p^+)])}(π(K^p,m)) (5.2.13), recovering (5.2.11) for λ = 0; T^S(K^p,m) := image of (5.2.13).

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.2.15: Connects completed and classical ordinary cohomology.

- ACC Theorem 5.4.1: Supplies the induced Siegel completed summand.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `CompletedArithmeticCohomology.finite_level` | compatibility | RΓ(K_p,π(K^p,λ,m))≅RΓ(X_K,V_λ/varpi^m), Hecke-equivariantly. |
| `CompletedArithmeticCohomology.hecke_action` | data | Unramified double cosets away from S give T^S → End of the smooth derived complex. |
| `CompletedArithmeticCohomology.coefficient_reduction` | functoriality | Derived coefficient reduction m′→m commutes with completed cohomology on the imported finite-projective models. |
| `CompletedArithmeticCohomology.weight_zero` | compatibility | At λ=0 this is the weight-zero completed complex with the full local group action. |

**Unit tests:**

- `CompletedArithmeticCohomology.zero_coefficients` (degenerate): The zero coefficient local system gives the zero completed complex.

- `CompletedArithmeticCohomology.finite_level_identity` (compatibility): Taking the specified K_p derived invariants recovers the ALS finite-level complex, rather than its degree-zero invariants only.

- `CompletedArithmeticCohomology.higher_group_cohomology` (non-example): For the trivial F_p-module of a pro-p group Z_p, replacing derived invariants by fixed vectors loses the nonzero H¹.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The zero coefficient local system gives the zero completed complex. Taking the specified K_p derived invariants recovers the ALS finite-level complex, rather than its degree-zero invariants only. For the trivial F_p-module of a pro-p group Z_p, replacing derived invariants by fixed vectors loses the nonzero H¹.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison), `mathlib:DerivedCategory`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.10, (5.2.11)–(5.2.13), p. 998. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="completed-ordinary-cohomology"></a>

### Definition: The ordinary part of completed cohomology π^ord(K^p,λ,m)

**Node:** `PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-cohomology`. **Proposed declaration:** `CompletedOrdinaryCohomology`.

π^ord(K^p,λ,m) := ord RΓ(N_n(O_{F,p}), π(K^p,λ,m)) ∈ D_sm(O/ϖ^m[T_n(F_p)]); for λ = 0 it is written π^ord(K^p,m).

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.2.17: Produces weight independence.

- ACC Theorem 5.4.3: Supplies the target of ordinary degree shifting.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `CompletedOrdinaryCohomology.formula` | characterisation | π^ord=ord RΓ(N_n(O),π), in the smooth torus derived category. |
| `CompletedOrdinaryCohomology.torus_action` | data | The torus group acts after localization; Hecke away from S acts commuting with it. |
| `CompletedOrdinaryCohomology.weight_zero` | compatibility | At λ=0 the formula agrees with ordinary parts of weight-zero completed arithmetic cohomology. |
| `CompletedOrdinaryCohomology.change_coefficients` | functoriality | Derived reduction modulo a smaller coefficient power commutes under the tower’s finite-quotient hypotheses. |

**Unit tests:**

- `CompletedOrdinaryCohomology.zero` (degenerate): Zero completed cohomology has zero ordinary part.

- `CompletedOrdinaryCohomology.invertible_contractor` (compatibility): If N={1} and all positive torus operators are invertible, ordinary localization recovers the original complex.

- `CompletedOrdinaryCohomology.nilpotent_contractor` (non-example): A nilpotent contracting action gives zero ordinary part, even with nonzero completed cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. Zero completed cohomology has zero ordinary part. If N={1} and all positive torus operators are invertible, ordinary localization recovers the original complex. A nilpotent contracting action gives zero ordinary part, even with nonzero completed cohomology.

**Direct prerequisites:** [PA.2/local-ordinary-parts](#local-ordinary-parts), [PA.2/derived-ordinary-comparison](#derived-ordinary-comparison), [PA.2/completed-arithmetic-cohomology](#completed-arithmetic-cohomology).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.10, p. 999. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="completed-classical-ordinary-control"></a>

### Theorem: Proposition 5.2.15: completed versus classical ordinary cohomology

**Node:** `PotentialAutomorphyInfrastructure:PA.2/completed-classical-ordinary-control`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.completed_classical_ordinary_control`.

Let K ⊂ G^∞ be a good subgroup with K_v = Iw_v for each v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}), and let c ≥ b ≥ 0 be integers with c ≥ 1. For every λ ∈ (Z^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism RΓ(T_n(O_{F,p})(b), π^ord(K^p,λ,m)) ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord in D(O/ϖ^m[K(0,c)/K(b,c)]) (K(0,c)/K(b,c) ≅ T_n(O_{F,p})_b).

**Construction or proof:**

1. Take the derived invariants at T_n(O)(b) of completed ordinary cohomology.

2. Apply the finite-level comparison for completed cohomology and the Iwahori/Borel comparison to identify the finite ordinary complex.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/completed-ordinary-cohomology](#completed-ordinary-cohomology), [PA.2/iwahori-borel-ordinary-comparison](#iwahori-borel-ordinary-comparison).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.10, Proposition 5.2.15, p. 999. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-level-control"></a>

### Theorem: Corollary 5.2.16 (Independence of level)

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-level-control`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_level_control`.

Let K ⊂ GL_n(A_F^∞) be good with K_v = Iw_v for v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}); let c ≥ b ≥ 0 with c ≥ 1 and λ ∈ (Z^n_+)^{Hom(F,E)}. The natural morphism RΓ_{K(0,max(1,b))/K(b,max(1,b))}(X_{K(b,max(1,b))}, V_λ/ϖ^m)^ord → RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord in D(O/ϖ^m[T_n(O_{F,p})_b]) is an isomorphism.

**Construction or proof:**

1. Apply completed/classical ordinary control at level max(1,b).

2. Use the localization isomorphism to discard the deeper c coordinate with all diamond actions retained.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/completed-classical-ordinary-control](#completed-classical-ordinary-control).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.10, Corollary 5.2.16, p. 999. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="completed-ordinary-weight-control"></a>

### Theorem: Proposition 5.2.17: independence of weight for completed ordinary cohomology

**Node:** `PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-weight-control`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.completed_ordinary_weight_control`.

Let K ⊂ GL_n(A_F^∞) be good with K^S = ∏_{v∉S} GL_n(O_{F,v}) and λ ∈ (Z^n_+)^{Hom(F,E)}. There are T^S-equivariant isomorphisms in D(O/ϖ^m[T_n(F_p)]): π^ord(K^p,λ,m) ≅ ord RΓ(N_n(O_{F,p}), RΓ_{K^p,sm} RΓ(𝔛_G, O(w_0^G λ)/ϖ^m)) ≅ π^ord(K^p,m) ⊗_O O(w_0^G λ).

**Construction or proof:**

1. Apply the lowest-weight projection V_λ → O(w₀λ).

2. A fixed power of u_p kills its kernel modulo varpi^m; the localized derived kernel is zero.

3. Identify completed ordinary cohomology with the weight-zero complex twisted by the lowest-weight character.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/completed-ordinary-cohomology](#completed-ordinary-cohomology), [PA.2/lowest-weight-character](#lowest-weight-character).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.10, Proposition 5.2.17, p. 1000. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="finite-ordinary-weight-control"></a>

### Theorem: Corollary 5.2.18 (Independence of weight)

**Node:** `PotentialAutomorphyInfrastructure:PA.2/finite-ordinary-weight-control`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.finite_ordinary_weight_control`.

Let K be good with K_v = Iw_v for v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}); c ≥ b ≥ 0 with c ≥ 1. For λ, λ' ∈ (Z^n_+)^{Hom(F,E)} with O(w_0^G λ)/ϖ^m ≅ O(w_0^G λ')/ϖ^m as O/ϖ^m[T_n(O_{F,p})(b)]-modules there is a T^{S,ord}-equivariant isomorphism RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_{λ'}/ϖ^m)^ord ⊗_O O(w_0^G λ) ⊗_O O((w_0^G λ')^{-1}) in D(O/ϖ^m[T_n(F_p)_b]).

**Construction or proof:**

1. Use completed weight independence for both weights.

2. Restrict to the chosen torus congruence subgroup; the two characters agree modulo varpi^m there, so derived invariants give the finite-level comparison.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/completed-ordinary-weight-control](#completed-ordinary-weight-control), [PA.2/completed-classical-ordinary-control](#completed-classical-ordinary-control).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.10, Corollary 5.2.18, p. 1000. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unitary-ordinary-tower"></a>

### Definition: Hida theory for G̃ (§5.2.19): T̃^{S,ord}, Ũ_v, Ũ_p, K̃(b,c), T̃(K̃(b,c),λ̃)^ord and the monoids for G̃

**Node:** `PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower`. **Proposed declaration:** `UnitaryOrdinaryTower`.

Every p-adic place of F^+ splits in F; the fixed lifts ṽ ∈ S̃_p give ∏_{v̄∈S̄_p} ι_ṽ: G̃(F_p^+) ≅ ∏_{v̄∈S̄_p} GL_{2n}(F_ṽ), with T ⊂ B ⊂ G̃ corresponding to T_{2n} ⊂ B_{2n}. T̃^{S,ord} = T̃^S ⊗_O O⟦T(O_{F^+,p})⟧[{Ũ_{v,1},…,Ũ_{v,2n},Ũ_{v,2n}^{-1}}_{v∈S_p}] / (Ũ_{v^c,i} − Ũ_{v,2n−i} Ũ_{v,2n}^{-1})_{v∈S_p, i=1,…,2n}; Ũ_v = [Iw diag(ϖ^{2n−1},…,ϖ,1) Iw] (equivalently the product of the 2n−1 simple ordinary operators with the source normalization) and Ũ_p = ∏_{v∈S_p} Ũ_v. For K̃ good with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p) and c ≥ b ≥ 0, c ≥ 1: K̃(b,c)_v̄ = K̃_v̄ (v̄ ∉ S̄_p), Ĩw_v̄(b,c) (v̄ ∈ S̄_p). For λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} there is a well-defined direct summand RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord on which Ũ_p acts invertibly, and T̃(K̃(b,c),λ̃)^ord := T̃^{S,ord}(RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord). Monoids: T(F_p^+)^+ ⊂ T(F_p^+) = elements contracting N(O_{F^+,p}); under T(F_p^+) = T_n(F_p), T(F_p^+)^+ ⊂ T_n(F_p)^+ (strictly for n ≥ 2); Ĩw_p(b,c) = ∏_{v̄} Ĩw_v̄(b,c); Δ̃_p = Ĩw_p(b,c) T(F_p^+)^+ Ĩw_p(b,c) with its ·_p-action on V_λ̃; T(O_{F^+,p})(b) = T_n(O_{F,p})(b); B(O_{F^+,p})(b) = preimage of T(O_{F^+,p})(b) in B(O_{F^+,p}); B(F_p^+)^+ = N(O_{F^+,p})·T(F_p^+)^+.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.2.28: Controls unitary and boundary ordinary complexes.

- ACC Theorem 5.4.3: Supplies the ordinary boundary degree shift.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `UnitaryOrdinaryTower.split_local_factor` | compatibility | The chosen lift of v̄ identifies its factor with GL_{2n}(F_v). |
| `UnitaryOrdinaryTower.conjugate_operator` | relation | Ũ_{vᶜ,i}=Ũ_{v,2n−i}Ũ_{v,2n}^{−1}. |
| `UnitaryOrdinaryTower.ordinary_operator` | data | The full contracting double coset is diag(varpi^{2n−1},…,varpi,1). |
| `UnitaryOrdinaryTower.coefficient_control` | functoriality | Boundary and interior tower maps commute with the finite-quotient ordinary projector. |

**Unit tests:**

- `UnitaryOrdinaryTower.zero_b` (degenerate): The diamond quotient at b=0 is trivial.

- `UnitaryOrdinaryTower.rank_one_contraction` (computation): For n=1 the unitary rank-2 contracting exponents are (1,0), so the ordinary operator is not an empty product.

- `UnitaryOrdinaryTower.proper_cone` (non-example): For n≥2 the unitary positive monoid in the Levi torus is strictly smaller than the GL_n positive monoid; the Satake map cannot equate the cones.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The diamond quotient at b=0 is trivial. For n=1 the unitary rank-2 contracting exponents are (1,0), so the ordinary operator is not an empty product. For n≥2 the unitary positive monoid in the Levi torus is strictly smaller than the GL_n positive monoid; the Satake map cannot equate the cones.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison), [PA.2/positive-torus-monoid](#positive-torus-monoid), `PadicFamilies:L0a/finite-quotient-system`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L0a/ordinary-part-complexes`, `SmoothRepresentationsOfLocalGroups:SR.1`, [PA.0/unitary-levi-weight-dictionary](#unitary-levi-weight-dictionary).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.19, pp. 1000–1001. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-satake-homomorphism"></a>

### Theorem: Extension of the Satake map S to the ordinary Hecke algebras

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-satake-homomorphism`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_satake_homomorphism`.

With the Siegel Levi G ≅ Res_{O_F/O_{F^+}} GL_n (so T ≅ Res_{O_F/O_{F^+}} T_n), the unnormalized Satake homomorphism S: T̃^S → T^S of (2.1.8) extends to S: T̃^{S,ord} → T^{S,ord} using O⟦T(O_{F^+,p})⟧ ≅ O⟦T_n(O_{F,p})⟧ and Ũ_{v,i} ↦ U_{v^c,n−i} U_{v^c,n}^{-1} (1 ≤ i ≤ n), Ũ_{v,i} ↦ U_{v^c,n}^{-1} U_{v,i−n} (n+1 ≤ i ≤ 2n); these are double coset operators of elements of T(F_p^+) and T_n(F_p) that match under T(F_p^+) = T_n(F_p). (The assignment respects the relations Ũ_{v^c,i} = Ũ_{v,2n−i}Ũ_{v,2n}^{-1}.)

**Construction or proof:**

1. Compute the double-coset Satake images of all ordinary operators using the Siegel Levi.

2. For i≤n the image is U_{vᶜ,n−i}/U_{vᶜ,n}; for i>n it is U_{vᶜ,n}^{−1}U_{v,i−n}.

3. Check compatibility with the twisted lattice action; the unitary positive cone is a proper subcone for n≥2.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/unitary-ordinary-tower](#unitary-ordinary-tower), [PA.0/ramified-satake-descent](#ramified-satake-descent), `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.19, p. 1001. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unitary-completed-boundary"></a>

### Definition: Completed and completed boundary cohomology of G̃ and their ordinary parts ((5.2.20)–(5.2.27))

**Node:** `PotentialAutomorphyInfrastructure:PA.2/unitary-completed-boundary`. **Proposed declaration:** `UnitaryCompletedBoundary`.

Fix m ≥ 1; K̃ ⊂ G̃(A^∞_{F^+}) good with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}. π̃(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, V_λ̃/ϖ^m) ∈ D_sm(O/ϖ^m[Δ̃_p]) (5.2.20), with T̃^S → End (5.2.21) if K̃^S = G̃(Ô^S_{F^+}); π̃(K̃^p,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, O/ϖ^m) ∈ D_sm(O/ϖ^m[G̃(F_p^+)]) with (5.2.22); boundary versions π̃_∂(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(∂𝔛_G̃, V_λ̃/ϖ^m) (5.2.23)–(5.2.24) and π̃_∂(K̃^p,m) (5.2.25). For c ≥ b ≥ 0, c ≥ 1, canonical T̃^{S,ord}-equivariant isomorphisms RΓ(Ĩw_p(b,c), π̃(K̃^p,λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m) (5.2.26) and RΓ(Ĩw_p(b,c), π̃_∂(K̃^p,λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m) (5.2.27) in D(O/ϖ^m). Ordinary parts: π̃^ord(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃(K̃^p,λ̃,m)) and π̃^ord_∂(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃_∂(K̃^p,λ̃,m)) in D_sm(O/ϖ^m[T(F_p^+)]); λ̃ = 0 is omitted from the notation.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Theorem 5.4.1: Receives the induced GL_n summand.

- ACC Theorem 5.4.3: Receives the filtered ordinary induction comparison.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `UnitaryCompletedBoundary.interior` | data | The interior complex is RΓ_{K̃^p,sm}RΓ of the unitary arithmetic groupoid. |
| `UnitaryCompletedBoundary.boundary` | data | Replace that groupoid by its Borel–Serre boundary to obtain π̃_∂. |
| `UnitaryCompletedBoundary.finite_level` | compatibility | Iwahori derived invariants recover the corresponding finite interior and boundary complexes. |
| `UnitaryCompletedBoundary.triangle` | relation | The imported compact-support/interior/boundary triangle carries the same commuting Hecke and ordinary actions. |

**Unit tests:**

- `UnitaryCompletedBoundary.zero_coefficients` (degenerate): All three complexes vanish for the zero coefficient local system.

- `UnitaryCompletedBoundary.boundary_recovery` (compatibility): Finite Iwahori derived invariants of π̃_∂ give the ALS boundary complex.

- `UnitaryCompletedBoundary.compact_case` (degenerate): When the boundary is empty its completed complex is zero and compact-support equals interior cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. All three complexes vanish for the zero coefficient local system. Finite Iwahori derived invariants of π̃_∂ give the ALS boundary complex. When the boundary is empty its completed complex is zero and compact-support equals interior cohomology.

**Direct prerequisites:** [PA.2/unitary-ordinary-tower](#unitary-ordinary-tower), [PA.0/boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), `mathlib:DerivedCategory`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.19, (5.2.20)–(5.2.27), p. 1002. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="unitary-ordinary-control"></a>

### Theorem: Proposition 5.2.28: Hida theory comparisons for G̃ and its boundary

**Node:** `PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-control`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.unitary_ordinary_control`.

Let K̃ ⊂ G̃(A^∞_{F^+}) be good with K̃_v̄ = Ĩw_v̄ for v̄ ∈ S̄_p and K̃^S = G̃(Ô^S_{F^+}); c ≥ b ≥ 0 with c ≥ 1. For every λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} there are T̃^{S,ord}-equivariant isomorphisms RΓ(T(O_{F^+,p})(b), π̃^ord(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord, and likewise RΓ(T(O_{F^+,p})(b), π̃^ord_∂(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord_∂(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord, in D_sm(O/ϖ^m[K̃(0,c)/K̃(b,c)]).

**Construction or proof:**

1. Repeat the completed/classical, level and lowest-weight arguments for the split unitary p-adic factors.

2. Apply the same comparisons to the boundary triangle and check that ordinary Satake commutes with all maps.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/unitary-completed-boundary](#unitary-completed-boundary), [PA.2/derived-ordinary-comparison](#derived-ordinary-comparison), [PA.2/completed-ordinary-weight-control](#completed-ordinary-weight-control).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.2.19, Proposition 5.2.28, p. 1003. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="relative-bruhat-cells"></a>

### Definition: Relative Weyl groups, ^rW^P, lengths and the Bruhat cells S_w, S_w°, G̃_{≥i}

**Node:** `PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells`. **Proposed declaration:** `RelativeBruhatCells`.

For a p-adic place v̄ of F^+: ^rW_v̄ = W(G̃_{F^+_v̄}, T_{F^+_v̄}) (≅ S_{2n}), ^rW_{P,v̄} = W(G_{F^+_v̄}, T_{F^+_v̄}) (≅ S_n × S_n), ^rW^P_v̄ ⊂ ^rW_v̄ the representatives of ^rW_{P,v̄}\^rW_v̄ attached to B_{F^+_v̄}; ^rW, ^rW_P, ^rW^P are the products over v̄ ∈ S̄_p; ^rW ⊂ W (absolute Weyl group), l_r = relative length, l = absolute length; w_0^P = w_0^G w_0^G̃, the longest element of W^P (equivalently of ^rW^P), has l(w_0^P) = [F^+:Q]n^2 (printed l_r(w_0^P) = |S_p|n^2; correct value |S̄_p|n^2); ρ = half-sum of (Res_{F^+/Q}B)_E-positive roots. ^rW is identified with permutation matrices in G̃(F_p^+) = ∏_{ṽ∈S̃_p} GL_{2n}(F_ṽ); G̃(F_p^+) = ⊔_{w∈^rW^P} P(F_p^+) w B(F_p^+) [BT65, Cor. 5.20]. For w ∈ ^rW^P: S_w = P(F_p^+) w N(F_p^+), S_w° = P(F_p^+) w N(O_{F^+,p}) ⊂ S_w; the closure of S_w is ⊔_{w'≤w} S_{w'} (Bruhat order on ^rW^P), and w' < w ⇒ l_r(w') < l_r(w). For i ≥ 0, G̃_{≥i} = ⊔_{w∈^rW^P, l_r(w)≥i} S_w is open in G̃(F_p^+), left P(F_p^+)- and right B(F_p^+)-invariant.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.3.1: Indexes the ordinary Bruhat filtration.

- ACC Lemma 5.3.7: Determines the absolute cohomological shift.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `RelativeBruhatCells.cell` | data | S_w=P(F_p⁺)wN(F_p⁺), and S_w° uses N(O_{F⁺,p}). |
| `RelativeBruhatCells.lengths` | compatibility | Relative length sums one inversion count per p-adic place; absolute length multiplies each by its local degree. |
| `RelativeBruhatCells.open_union` | relation | The union of cells of relative length ≥i is open. |
| `RelativeBruhatCells.longest` | simp | The longest shuffle has absolute length n²[F⁺:Q] and relative length n²#S̄_p. |

**Unit tests:**

- `RelativeBruhatCells.rank_one` (computation): A single split GL₂ factor has relative cell lengths 0 and 1.

- `RelativeBruhatCells.identity_cell` (degenerate): The identity representative has both lengths zero.

- `RelativeBruhatCells.degree_two_place` (non-example): For one p-adic place of local degree 2 and n=1, longest relative length is 1 but absolute length is 2.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. A single split GL₂ factor has relative cell lengths 0 and 1. The identity representative has both lengths zero. For one p-adic place of local degree 2 and n=1, longest relative length is 1 but absolute length is 2.

**Direct prerequisites:** [PA.1/kostant-shuffles](#kostant-shuffles), [PA.2/unitary-ordinary-tower](#unitary-ordinary-tower), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, pp. 1003–1004. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-cell-induction"></a>

### Definition: The functors I_{≥i}, I_w and I_w° attached to parabolic induction

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-cell-induction`. **Proposed declaration:** `BruhatCellInduction`.

Ind_{P(F_p^+)}^{G̃(F_p^+)}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[G̃(F_p^+)]) is exact and preserves injectives (right adjoint of the exact restriction). For i ≥ 0, I_{≥i}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)]), I_{≥i}(π) = {f: G̃_{≥i} → π locally constant, compactly supported modulo P(F_p^+), f(pg) = p f(g) for p ∈ P(F_p^+), g ∈ G̃_{≥i}} with B(F_p^+) acting by right translation; for w ∈ ^rW^P, I_w(π) is defined the same way with S_w in place of G̃_{≥i}; I_w°: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)^+]) sends π to the subspace of I_w(π) of functions supported in S_w°.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.3.1: Gives successive filtered quotients.

- ACC Lemma 5.3.4: Allows replacement by compact charts after ordinary localization.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `BruhatCellInduction.section` | data | Sections are locally constant P-equivariant functions with compact support modulo P on the specified cell or open union. |
| `BruhatCellInduction.right_action` | structure | B acts by right translation; on the compact chart use B⁺. |
| `BruhatCellInduction.restriction` | functoriality | Restriction to a length-i layer induces the maps in the exact Bruhat-filtration sequence. |
| `BruhatCellInduction.compact_inclusion` | data | Extension by zero includes functions supported in S_w° into those on S_w. |

**Unit tests:**

- `BruhatCellInduction.zero_module` (degenerate): Inducing the zero coefficient module gives zero in each chart.

- `BruhatCellInduction.outside_support` (computation): The extension-by-zero compact-chart section evaluates to zero outside S_w°.

- `BruhatCellInduction.equivariance` (non-example): A locally constant function violating f(pg)=p f(g) is not a section, even if its support is compact modulo P.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. Inducing the zero coefficient module gives zero in each chart. The extension-by-zero compact-chart section evaluates to zero outside S_w°. A locally constant function violating f(pg)=p f(g) is not a section, even if its support is compact modulo P.

**Direct prerequisites:** [PA.2/relative-bruhat-cells](#relative-bruhat-cells), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, pp. 1003–1004. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-filtration"></a>

### Theorem: Proposition 5.3.1: the Bruhat filtration of Res_B Ind_P

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-filtration`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.bruhat_filtration`.

(1) I_{≥0} = Res^{G̃(F_p^+)}_{B(F_p^+)} ∘ Ind^{G̃(F_p^+)}_{P(F_p^+)}. (2) Each of I_{≥i}, I_w, I_w° is exact. (3) For every i ≥ 0 and π ∈ Mod_sm(O/ϖ^m[P(F_p^+)]) there is a functorial exact sequence 0 → I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{w∈^rW^P, l_r(w)=i} I_w(π) → 0. Hence for π ∈ D_sm(O/ϖ^m[P(F_p^+)]) there is a functorial distinguished triangle I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{l_r(w)=i} I_w(π) → I_{≥i+1}(π)[1] (5.3.2) in D_sm(O/ϖ^m[B(F_p^+)]).

**Construction or proof:**

1. Filter parabolic induction by the open union of Bruhat cells of relative length at least i.

2. Restriction to the layer of length i gives the exact sequence with direct sum of I_w.

3. Apply it degreewise to bounded-below complexes and use the induced distinguished triangles.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/bruhat-cell-induction](#bruhat-cell-induction).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Proposition 5.3.1 and (5.3.2), pp. 1004–1005. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-invariant-filtration"></a>

### Theorem: Lemma 5.3.3: exactness of the degreewise B(O)(b)-invariants of the Bruhat filtration

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-invariant-filtration`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.bruhat_invariant_filtration`.

Let π ∈ D_sm(O/ϖ^m[P(F_p^+)]) be bounded below, b ≥ 0 and λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}. For every i ≥ 0 and j ∈ Z the sequence 0 → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i+1}(π)) → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i}(π)) → R^jΓ(B(O_{F^+,p})(b), ⊕_{w∈^rW^P, l_r(w)=i} O(w_0^G̃ λ̃) ⊗_O I_w(π)) → 0 in Mod(O/ϖ^m[T(F_p^+)^+_b]) associated with (5.3.2) is (short) exact.

**Construction or proof:**

1. Use compact-open chart sections to prove surjectivity after the required B(O)(b)-invariants.

2. Take ordinary localization, retaining the filtration rather than asserting a canonical splitting.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/bruhat-filtration](#bruhat-filtration).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Lemma 5.3.3, pp. 1005–1006. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-unipotent-acyclicity"></a>

### Theorem: Lemma 5.3.4(1): I_w° takes injectives to N(O_{F^+,p})-acyclics

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-acyclicity`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.bruhat_unipotent_acyclicity`.

For w ∈ ^rW^P, the functor I_w° takes injective objects of Mod_sm(O/ϖ^m[P(F_p^+)]) to Γ(N(O_{F^+,p}),−)-acyclic objects.

**Construction or proof:**

1. Write the compact Bruhat chart as a compact induction compatible with N(O).

2. Use the right adjoint to evaluation and smooth injective acyclicity to kill higher N(O)-cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/bruhat-cell-induction](#bruhat-cell-induction), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Lemma 5.3.4(1), p. 1006. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-compact-cell-comparison"></a>

### Theorem: Lemma 5.3.4(2): the ordinary part does not see the non-compact part of a Bruhat cell

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-compact-cell-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_compact_cell_comparison`.

For w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[P(F_p^+)]) bounded below there is a natural isomorphism ord RΓ(N(O_{F^+,p}), I_w°(π)) ≅ ord RΓ(N(O_{F^+,p}), I_w(π)); equivalently ord RΓ(N(O_{F^+,p}), J_w(π)) = 0 for J_w = I_w/I_w°.

**Construction or proof:**

1. Under iteration of the contracting torus element, the complement of the compact Bruhat chart leaves every compact support.

2. Its cohomology is locally nilpotent; ordinary localization removes it.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/bruhat-cell-induction](#bruhat-cell-induction), [PA.2/local-ordinary-parts](#local-ordinary-parts).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Lemma 5.3.4(2), pp. 1006–1007. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-unipotent-invariants"></a>

### Definition: N_w and the functor Γ(N_w,−) with its torus action

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-invariants`. **Proposed declaration:** `BruhatUnipotentInvariants`.

For w ∈ ^rW^P, N_w := P(F_p^+) ∩ w N(O_{F^+,p}) w^{-1}, a compact subgroup of P(F_p^+) containing N_n(O_{F,p}). Γ(N_w,−): Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[T(F_p^+)^+]), with t ∈ T(F_p^+)^+ acting by t·v = tr_{t^w N_w (t^w)^{-1} / N_w}(t^w v), where t^w = w t w^{-1} (this makes sense since t^w N_w (t^w)^{-1} = P(F_p^+) ∩ w t N(O_{F^+,p}) t^{-1} w^{-1} ⊂ N_w); moreover w T(F_p^+)^+ w^{-1} ⊂ T_n(F_p)^+.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 5.3.5: Computes derived evaluation.

- ACC Lemma 5.3.7: Separates the Levi invariants from the unipotent orientation shift.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `BruhatUnipotentInvariants.subgroup` | data | N_w=P∩wN(O)w^{-1}. |
| `BruhatUnipotentInvariants.transfer` | data | For t the transfer uses t^w=wtw^{-1} and the finite-index subgroup t^wN_w(t^w)^{-1}. |
| `BruhatUnipotentInvariants.evaluation` | compatibility | Evaluation at w identifies the derived compact-cell N-invariants with RΓ(N_w,π). |
| `BruhatUnipotentInvariants.map` | functoriality | A smooth P-map induces the corresponding invariant and derived invariant maps. |

**Unit tests:**

- `BruhatUnipotentInvariants.zero` (degenerate): The invariant functor sends the zero module to zero.

- `BruhatUnipotentInvariants.identity_w` (computation): For w=1 the subgroup is P∩N(O).

- `BruhatUnipotentInvariants.index_p_transfer` (non-example): On a trivial F_p-module a transfer over index p is zero, not the naive identity torus action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The invariant functor sends the zero module to zero. For w=1 the subgroup is P∩N(O). On a trivial F_p-module a transfer over index p is zero, not the naive identity torus action.

**Direct prerequisites:** [PA.2/relative-bruhat-cells](#relative-bruhat-cells), [PA.2/positive-torus-monoid](#positive-torus-monoid).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, p. 1007. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-evaluation-comparison"></a>

### Theorem: Lemma 5.3.5: N(O)-invariants of I_w° are N_w-invariants

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-evaluation-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.bruhat_evaluation_comparison`.

For w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[P(F_p^+)]) bounded below there is a natural isomorphism RΓ(N(O_{F^+,p}), I_w°(π)) ≅ RΓ(N_w, π) (compatible with the T(F_p^+)^+-actions), induced by f ↦ f(w).

**Construction or proof:**

1. Evaluate a Bruhat-cell function at w and identify the stabilizer N_w.

2. Compare injective resolutions and compute the conjugated transfer torus action; it is not the naive torus action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/bruhat-unipotent-invariants](#bruhat-unipotent-invariants), [PA.2/bruhat-unipotent-acyclicity](#bruhat-unipotent-acyclicity).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Lemma 5.3.5 and (5.3.6), pp. 1007–1008. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="bruhat-orientation-character"></a>

### Definition: The characters χ_w, α_w and the twist functor τ_w

**Node:** `PotentialAutomorphyInfrastructure:PA.2/bruhat-orientation-character`. **Proposed declaration:** `BruhatOrientationCharacter`.

For w ∈ ^rW^P, χ_w: T(F_p^+) → O^× is χ_w(t) = N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})^{-1} / |N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})|_p. There is an isomorphism O(χ_w) ≅ O(−ρ + w^{-1} w_0^P(ρ)) ⊗_O O(α_w) of O[T(F_p^+)]-modules, where w_0^P = w_0^G w_0^G̃ is the longest element of ^rW^P and α_w: T(F_p^+) → O^× is trivial on T(O_{F^+,p}) and agrees with χ_w on every ι_v^{-1}(diag(ϖ_v^{a_1},…,ϖ_v^{a_{2n}})) (a_i ∈ Z). τ_w: Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod_sm(O/ϖ^m[T_n(F_p)]) sends π to π with t acting as π(t^{w^{-1}}).

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Proposition 5.3.8: Gives the precise character twist in the Bruhat-piece shift.

- ACC Theorem 5.4.3: Tracks the twist through ordinary boundary shifting.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `BruhatOrientationCharacter.formula` | characterisation | For a(t)=N det Ad(t^w) on the indicated unipotent Lie space, χ_w(t)=a(t)^{-1}/\|a(t)\|_p. |
| `BruhatOrientationCharacter.unit_part` | compatibility | Its algebraic character is −ρ+w^{-1}w₀^Pρ; α_w is the residual unramified character. |
| `BruhatOrientationCharacter.uniformizer_part` | simp | α_w is trivial on units and agrees with χ_w on chosen diagonal uniformizer powers. |
| `BruhatOrientationCharacter.twist` | functoriality | τ_w precomposes the torus action with t↦t^{w^{-1}}. |

**Unit tests:**

- `BruhatOrientationCharacter.zero_lie` (degenerate): For a zero-dimensional unipotent Lie space, χ_w=1.

- `BruhatOrientationCharacter.one_unit` (computation): For a one-dimensional rational root with Ad scalar u∈Z_p×, χ_w(u)=u^{-1}.

- `BruhatOrientationCharacter.one_uniformizer` (computation): For the same rational root with scalar p, χ_w(p)=1 because the p-adic norm factor cancels p^{-1}.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For a zero-dimensional unipotent Lie space, χ_w=1. For a one-dimensional rational root with Ad scalar u∈Z_p×, χ_w(u)=u^{-1}. For the same rational root with scalar p, χ_w(p)=1 because the p-adic norm factor cancels p^{-1}.

**Direct prerequisites:** [PA.2/relative-bruhat-cells](#relative-bruhat-cells), [PA.2/lowest-weight-character](#lowest-weight-character).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, p. 1008. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-unipotent-degree-shift"></a>

### Theorem: Lemma 5.3.7: ordinary part of N_w-invariants of an inflated representation (the shift by the unipotent radical)

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-unipotent-degree-shift`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_unipotent_degree_shift`.

Let w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[G(F_p^+)]) bounded below. There is a natural isomorphism in D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N_w, Inf_{G(F_p^+)}^{P(F_p^+)} π) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_w^{-1} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)].

**Construction or proof:**

1. Split N_w into the Levi part and its unipotent radical.

2. Compute top continuous cohomology of that radical with its determinant orientation character.

3. Apply ordinary localization and identify the cohomological shift −n²[F⁺:Q]+l(w) and the τ_w^{-1} twist.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/bruhat-unipotent-invariants](#bruhat-unipotent-invariants), [PA.2/bruhat-evaluation-comparison](#bruhat-evaluation-comparison), [PA.2/bruhat-orientation-character](#bruhat-orientation-character), [PA.0/unipotent-exterior-cohomology](#unipotent-exterior-cohomology).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Lemma 5.3.7, pp. 1008–1010. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-bruhat-piece"></a>

### Theorem: Proposition 5.3.8: the ordinary part of the w-th Bruhat piece of parabolic induction

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-bruhat-piece`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_bruhat_piece`.

Let w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[G(F_p^+)]) bounded below. There is a natural isomorphism in D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N(O_{F^+,p}), I_w(Inf_{G(F_p^+)}^{P(F_p^+)} π)) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_{w^{-1}} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)] (τ_{w^{-1}} = τ_w^{-1}).

**Construction or proof:**

1. Combine compact-cell comparison, evaluation at w and the unipotent degree shift.

2. Identify χ_w as the algebraic character −ρ+w^{-1}w₀^Pρ times α_w, trivial on torus units.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-compact-cell-comparison](#ordinary-compact-cell-comparison), [PA.2/bruhat-evaluation-comparison](#bruhat-evaluation-comparison), [PA.2/ordinary-unipotent-degree-shift](#ordinary-unipotent-degree-shift).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.3, Proposition 5.3.8, pp. 1010–1011. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="completed-boundary-induction-retract"></a>

### Theorem: Theorem 5.4.1: parabolic induction of completed cohomology is a summand of completed boundary cohomology

**Node:** `PotentialAutomorphyInfrastructure:PA.2/completed-boundary-induction-retract`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.completed_boundary_induction_retract`.

Let K̃ ⊂ G̃(A^∞_{F^+}) be a good subgroup decomposed with respect to P (K = K̃ ∩ G(A^∞_{F^+})); let 𝔪 ⊂ T^S be a non-Eisenstein maximal ideal and 𝔪̃ = S^*(𝔪) ⊂ T̃^S. Then Ind_{P(F_p^+)}^{G̃(F_p^+)} (Inf_{G(F_p^+)}^{P(F_p^+)} π(K^p,m)_𝔪) is a T̃^S-equivariant direct summand (T̃^S acting through S) of π̃_∂(K̃^p,m)_{𝔪̃} in D_sm(O/ϖ^m[G̃(F_p^+)]).

**Construction or proof:**

1. Use the ALS non-Eisenstein boundary localization to isolate the Siegel stratum.

2. Strong approximation makes the higher unipotent cohomology vanish in the level limit.

3. Construct the actual inclusion and retraction of parabolic induction inside completed boundary cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/unitary-completed-boundary](#unitary-completed-boundary), [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), [PA.2/completed-arithmetic-cohomology](#completed-arithmetic-cohomology), `SmoothRepresentationsOfLocalGroups:SR.2`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Theorem 5.4.1, pp. 1011–1013. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-boundary-degree-shifting"></a>

### Theorem: Theorem 5.4.3: ordinary degree shifting from the boundary

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-boundary-degree-shifting`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_boundary_degree_shifting`.

Let K̃ be good, decomposed with respect to P, with K̃_v̄ = Ĩw_v̄ for v̄ ∈ S̄_p (printed Iw_v̄). Let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, w ∈ ^rW^P, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^*(𝔪); c ≥ b ≥ 0 with c ≥ 1. Then for every j ∈ Z, S descends to a homomorphism, surjective onto the image of T̃^{S,ord} acting through S (printed: 'a surjective homomorphism' onto the whole algebra, which the proof does not establish), T̃^{S,ord}(H^j(∂X̃_{K̃(b,c)}, V_λ̃)^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_0^G w w_0^G̃}) ⊗_O τ^{-1}_{w_0^G w w_0^G̃} H^{j−l(w)}(X_{K(b,c)}, V_{λ_w})^ord_𝔪).

**Construction or proof:**

1. Apply the Bruhat filtration to that induced summand and compare ordinary pieces.

2. Use x=w₀^Gww₀^{G̃}, with l(x)=d−l(w), and the χ_x and τ_x twists.

3. The chosen weight isolates the surviving constituent, giving the Hecke quotient in degree j−l(w).

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-bruhat-piece](#ordinary-bruhat-piece), [PA.2/completed-boundary-induction-retract](#completed-boundary-induction-retract), [PA.2/unitary-ordinary-control](#unitary-ordinary-control).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Theorem 5.4.3, pp. 1013–1015. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-ctg-weight-choice"></a>

### Theorem: Lemma 5.4.8: choice of weights for ordinary degree shifting

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-ctg-weight-choice`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_ctg_weight_choice`.

Notation: for λ ∈ (Z^n_+)^{Hom(F,E)} and a ∈ Z, λ(a)_{τ,i} = λ_{τ,i} + a. Assume n ≥ 2 (the statement is printed for n ≥ 1 and fails for n = 1). Fix m ≥ 1. There is λ ∈ (Z^n_+)^{Hom(F,E)} such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as T_n(F_p)-modules; (2) Σ_{i=1}^n (λ_{τ,i} + λ_{τc,i}) is independent of τ ∈ Hom(F,E); (3) for each i = 0,…,n^2 there are w_i = (w_{i,v̄})_{v̄∈S̄_p} ∈ ^rW^P, a_i ∈ (p−1)Z and a dominant λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)} with (a) λ̃_i CTG (Definition 4.3.5); (b) l_r(w_{i,v̄}) = n^2 − i for every v̄ ∈ S̄_p, hence l(w_i) = [F^+:Q](n^2 − i); (c) w_i(λ̃_i + ρ) − ρ = λ(a_i). Construction: M > 16n divisible by 8(p−1)·#(O/ϖ^m)^×; λ_τ = (−nM, −2nM, …, −n^2M) if τ ∈ Ĩ_p and (0, −M, …, (1−n)M) if τc ∈ Ĩ_p, so λ̃(a) = ((n−1)M − a, …, −a, −nM + a, …, −n^2M + a); w_{i,v̄} = σ_{X_i}, X_i = {x+1,…,x+r, x+r+2,…,x+n+1} with nx + n − r = n^2 − i, 1 ≤ r ≤ n; a_i = the unique integer in [(nx+2n−r−1)M/2, (nx+2n−r)M/2] congruent to M/8 mod M/2; λ̃_i = w_i^{-1}(λ̃(a_i) + ρ) − ρ.

**Construction or proof:**

1. Choose M>16n divisible by 8(p−1)#(O/varpi^m)× and use the explicit weight rows in (5.4.9).

2. For each i=0,…,n² construct the shuffle of length n²−i; solve the weight identity with a_i∈(p−1)Z.

3. Check dominance, CTG and congruence of the torus characters, retaining n≥2 and [F⁺:Q]>1.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/kostant-shuffles](#kostant-shuffles), [PA.1/ctg-weight](#ctg-weight), [PA.2/lowest-weight-character](#lowest-weight-character).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Lemma 5.4.8 and (5.4.9)–(5.4.12), pp. 1015–1017. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-middle-degree-quotient"></a>

### Theorem: Proposition 5.4.13: Hecke algebras of X_K in degrees i[F^+:Q] as quotients of middle-degree Hecke algebras of X̃

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-middle-degree-quotient`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_middle_degree_quotient`.

Suppose [F^+:Q] > 1 and n ≥ 2 (printed without n ≥ 2), and fix m ≥ 1. There exist a dominant λ ∈ (Z^n_+)^{Hom(F,E)} on whose V_λ a finite-index subgroup of O_F^× acts trivially and, for each i = 0,…,n^2−1, a CTG dominant weight λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)}, an integer a_i divisible by p−1 and w_i ∈ ^rW^P, such that for every good K̃ ⊂ G̃(A^∞_{F^+}) decomposed with respect to P with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), all integers c ≥ b ≥ 0 with c ≥ 1, and every non-Eisenstein 𝔪 ⊂ T^S with ρ̄_{𝔪̃} decomposed generic (𝔪̃ = S^*(𝔪)): (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F_p^+)]-modules; (2) for each i = 0,…,n^2−1, S descends to an algebra homomorphism T̃^{S,ord}(H^d(X̃_{K̃(b,c)}, V_{λ̃_i})^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_i}) ⊗_O τ_{w_i}^{-1} H^{i[F^+:Q]}(X_{K(b,c)}, V_{λ(a_i)})^ord_𝔪), where d = [F^+:Q]n^2.

**Construction or proof:**

1. Apply the ordinary boundary degree-shifting result for the weights from Lemma 5.4.8. Its shuffle u_i has length (n²−i)[F⁺:Q], while the character-index shuffle w_i=w₀^G u_i w₀^{G̃} has length i[F⁺:Q]; distinguish them and retain α_{w_i} and τ_{w_i}^{−1}.

2. Import IG.7 concentration independently of PA.1 and specialize j to the unitary middle degree d.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-boundary-degree-shifting](#ordinary-boundary-degree-shifting), [PA.2/ordinary-ctg-weight-choice](#ordinary-ctg-weight-choice), `IgusaVarietiesAndTorsionConcentration:IG.7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Proposition 5.4.13, pp. 1017–1018. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="determinant-torus"></a>

### Definition: The torus A_K, its identity component and the arithmetic groups Γ_{g,K}

**Node:** `PotentialAutomorphyInfrastructure:PA.2/determinant-torus`. **Proposed declaration:** `DeterminantTorus`.

For K ⊂ GL_n(A_F^∞) good, A_K := F^×\A_F^×/det(K) det(K_∞) R_{>0}. The quotient map A_K → F^×\A_F^×/det(K) F_∞^× identifies A_K with an extension of a ray class group by a real torus of dimension [F^+:Q] − 1 with cocharacter lattice F^× ∩ det(K) (a torsion-free congruence subgroup of O_F^×). A_K° is the identity component. For g ∈ GL_n(A_F^∞), Γ_{g,K} = GL_n(F) ∩ gKg^{-1} (written Γ_g). One has dim X_K = d − 1 = [F^+:Q]n^2 − 1 and dim A_K = [F^+:Q] − 1.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 5.4.14: Splits arithmetic components under the determinant subgroup condition.

- ACC Lemma 5.4.16: Supplies the central cohomological degrees.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `DeterminantTorus.quotient` | data | The quotient is F×\A_F×/(det K·det K∞·R_{>0}). |
| `DeterminantTorus.component` | data | The identity component A_K° is the real torus of dimension [F⁺:Q]−1. |
| `DeterminantTorus.determinant_map` | compatibility | Determinant X_K→A_K induces the ray-class identification of connected components. |
| `DeterminantTorus.level_change` | functoriality | Inclusion K′⊂K induces the quotient map A_{K′}→A_K and commutes with determinant. |

**Unit tests:**

- `DeterminantTorus.imaginary_quadratic` (computation): For [F⁺:Q]=1 the identity component has dimension zero.

- `DeterminantTorus.degree_two` (computation): For [F⁺:Q]=2 the identity component has dimension one.

- `DeterminantTorus.not_whole_class_group` (non-example): For [F⁺:Q]>1 the quotient has a positive-dimensional torus; replacing it by the finite ray-class group loses that component.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For [F⁺:Q]=1 the identity component has dimension zero. For [F⁺:Q]=2 the identity component has dimension one. For [F⁺:Q]>1 the quotient has a positive-dimensional torus; replacing it by the finite ray-class group loses that component.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, pp. 1018, 1020. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="determinant-component-product"></a>

### Theorem: Lemma 5.4.14(2)–(4): the determinant map X_K → A_K and the product structure of components

**Node:** `PotentialAutomorphyInfrastructure:PA.2/determinant-component-product`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.determinant_component_product`.

(2) det: X_K → A_K is continuous and induces a bijection on sets of connected components (equivalently det: G(F^+)\G(A^∞_{F^+})/K → F^×\(A_F^∞)^×/det(K) is bijective, by strong approximation for Res_{F/F^+} SL_n). (3) If g ∈ GL_n(A_F^∞) satisfies det(Γ_g) = det(F^× ∩ K) and Γ_g^1 = SL_n(F) ∩ Γ_g, then the product map Γ_g^1 × (F^× ∩ K) → Γ_g is a group isomorphism; writing X = X^1 × (∏_{v|∞} R_{>0})/R_{>0} with X^1 = SL_n(F_∞)/∏_{v|∞} SU(n), one gets Γ_g\X = (Γ_g^1\X^1) × (F^× ∩ K)\(∏_{v|∞} R_{>0})/R_{>0}. (4) Under the same hypothesis det: F^× ∩ K → F^× ∩ det(K) is an isomorphism, the composite Γ_g\X ↪ X_K → A_K is (x,z) ↦ det(g) z^n, and z ↦ det(g) z^n is an isomorphism from (F^× ∩ K)\(∏_{v|∞} R_{>0})/R_{>0} onto the connected component A_K^{[det(g)]} of A_K containing [det(g)]. (K is neat.)

**Construction or proof:**

1. The determinant identifies connected components with the ray-class quotient.

2. Under neatness and det Γ=det(F×∩K), split Γ into its determinant-one subgroup and central units.

3. Identify the component product and compute determinant (x,z)=det(g)z^n.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/determinant-torus](#determinant-torus), `ArithmeticLocallySymmetricSpaces:ALS.4`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Lemma 5.4.14(2)–(4), pp. 1018–1019. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="determinant-neat-level-shrinking"></a>

### Theorem: Lemma 5.4.15: shrinking K so that det(Γ_{g,K'}) = det(F^× ∩ K')

**Node:** `PotentialAutomorphyInfrastructure:PA.2/determinant-neat-level-shrinking`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.determinant_neat_level_shrinking`.

Let K be a good subgroup of G(A^∞_{F^+}) = GL_n(A_F^∞) and T a finite set of finite places of F. There is a good normal subgroup K' ⊂ K with K'_T = K_T such that det(Γ_{g,K'}) = det(F^× ∩ K') for all g ∈ GL_n(A_F^∞). Construction: an ideal 𝔞 of O_F prime to T with ker(O_F^× → (O_F/𝔞)^×) torsion-free and contained in F^× ∩ K (Chevalley [Che51, Th. 1]); an ideal 𝔟 prime to 𝔞 and T with ker(O_F^× → (O_F/𝔞𝔟)^×) ⊂ (ker(O_F^× → (O_F/𝔞)^×))^n; K' = ker(O_F^× → (O_F/𝔞)^×)·K(𝔞𝔟), K(𝔞𝔟) = K ∩ (principal congruence subgroup of level 𝔞𝔟).

**Construction or proof:**

1. Apply Chevalley congruence separation of units and shrink away from the prescribed finite set T.

2. Make the determinant subgroup equal to the central-unit determinant subgroup, without changing any prescribed local factor.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/determinant-torus](#determinant-torus).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Lemma 5.4.15, pp. 1019–1020. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="central-torus-cohomology-shifting"></a>

### Theorem: Lemma 5.4.16: cohomology of X_K is the cohomology of the torus A_K° tensor the fibrewise cohomology (central degree shifting)

**Node:** `PotentialAutomorphyInfrastructure:PA.2/central-torus-cohomology-shifting`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.central_torus_cohomology_shifting`.

Let K = K(b, c) ⊂ GL_n(A_F^∞) be good with K_v = Iw_v(b, c) for v | p (needed for T^{S,ord} to act; the statement omits it) and λ ∈ (Z^n_+)^{Hom(F,E)}, and suppose (1) det(Γ_g) = det(F^× ∩ K) for all g ∈ GL_n(A_F^∞) and (2) F^× ∩ K acts trivially on V_λ. Then R det_*(V_λ) is constant on each connected component of A_K and R det_*(V_λ) = ⊕_{i=0}^{dim X^1} R^i det_*(V_λ)[−i]; there is a T^{S,ord}-equivariant isomorphism of graded O-modules ⊕_{i=0}^{dim X_K} H^i(X_K, V_λ) ≅ (⊕_{j=0}^{dim A_K°} H^j(A_K°, O)) ⊗_O (⊕_{k=0}^{dim X^1} H^0(A_K, R^k det_*(V_λ))) (5.4.17), with trivial Hecke action on the first factor. Consequently the image of T^{S,ord} in End_O(⊕_{i=0}^{dim X_K} H^i(X_K, V_λ)) equals its image in End_O(⊕_{i=0}^{n^2−1} H^{i[F^+:Q]}(X_K, V_λ)).

**Construction or proof:**

1. Use the component product to identify the determinant pushforward local system.

2. Over the DVR split its bounded derived cohomology and use Künneth with the torus A_K° of dimension [F⁺:Q]−1.

3. The Hecke action is trivial on the torus-cohomology factor; its image in all degrees equals the image in degrees i[F⁺:Q].

4. Retain the Iwahori-level condition needed to define ordinary cohomology.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/determinant-component-product](#determinant-component-product), [PA.2/determinant-neat-level-shrinking](#determinant-neat-level-shrinking), [PA.2/arithmetic-ordinary-summand](#arithmetic-ordinary-summand), `ArithmeticLocallySymmetricSpaces:ALS.4`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Lemma 5.4.16 and (5.4.17), pp. 1020–1021. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="all-degree-ordinary-characteristic-data"></a>

### Theorem: Proposition 5.4.18: ordinary local–global compatibility for a well-chosen weight, in every degree

**Node:** `PotentialAutomorphyInfrastructure:PA.2/all-degree-ordinary-characteristic-data`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.all_degree_ordinary_characteristic_data`.

Suppose [F^+:Q] > 1. Let K ⊂ GL_n(A_F^∞) be good with K_v = Iw_v for v ∈ S_p; c ≥ b ≥ 0 with c ≥ 1; m ≥ 1; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^*(𝔪). Suppose (1) ρ̄_𝔪 is decomposed generic; (2) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic F_0 ⊂ F. Then there are λ ∈ (Z^n_+)^{Hom(F,E)} and N ≥ 1 depending only on [F^+:Q] and n such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F_p^+)]-modules; (2) for each i = 0,…,d−1 there are a nilpotent ideal J_i ⊂ T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪) with J_i^N = 0 and a continuous ρ_𝔪: G_{F,S} → GL_n(T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪)/J_i) with (a) det(X − ρ_𝔪(Frob_v)) = image of P_v(X) for v ∉ S; (b) for v | p and g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{j=1}^n (X − χ_{λ,v,j}(g)); (c) for v | p and g_1,…,g_n ∈ G_{F_v}, ρ_𝔪 maps (g_1 − χ_{λ,v,1}(g_1))⋯(g_n − χ_{λ,v,n}(g_n)) to 0 in M_n(…/J_i).

**Construction or proof:**

1. For n=1 use the Hecke-character/class-field correspondence directly, as the CTG construction in Lemma 5.4.8 requires n≥2. The remaining steps apply only when n≥2.

2. Shrink the level by Lemma 5.4.15 and apply central-torus shifting to reach arbitrary degree.

3. For each relevant degree use the middle-degree quotient, the unitary crystalline representation, and its ordinary characters.

4. Transfer the characteristic and ordered-product identities as polynomial-law identities through the Satake image inclusion and O-flat unitary coefficient algebra, then through the uniform nilpotent quotient. Surjectivity onto the entire GL_n ordinary Hecke algebra has not been proved and cannot justify this step.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-middle-degree-quotient](#ordinary-middle-degree-quotient), [PA.2/central-torus-cohomology-shifting](#central-torus-cohomology-shifting), [PA.2/ordinary-galois-characters](#ordinary-galois-characters), `mathlib:Matrix.charpoly`, `PotentialAutomorphyInfrastructurePartII:PL.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.4, Proposition 5.4.18 and (5.4.19)–(5.4.23), pp. 1022–1026. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-automorphic-galois-flag"></a>

### Theorem: Corollary 5.5.2: ordinary local–global compatibility for a single ι-ordinary cuspidal representation

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-automorphic-galois-flag`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_automorphic_galois_flag`.

Let F be an imaginary CM field (the §5 standing hypotheses are dropped), ι: Q̄_p ≅ C, and π a cuspidal automorphic representation of GL_n(A_F), regular algebraic of weight ιλ with λ ∈ (Z^n_+)^{Hom(F,Q̄_p)}. Suppose (1) π is ι-ordinary at every v ∈ S_p ([Ger19, Def. 5.3]); (2) r̄_ι(π) is decomposed generic and irreducible. Then for every v ∈ S_p, r_ι(π)|_{G_{F_v}} is ordinary of weight λ ([Ger19, §5.2]): r_ι(π)|_{G_{F_v}} is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1},…,ψ_{v,n}, where ψ_{v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) ∏_{τ∈Hom_{Q_p}(F_v,Q̄_p)} τ(u)^{−(w_0^G λ)_{τ,i}} ⟨u⟩_{ι,i} (u ∈ O_{F_v}^×) and ψ_{v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) u^{(i)}_{λ,ϖ_v}/u^{(i−1)}_{λ,ϖ_v}, with ⟨u⟩_{ι,i}, u^{(i)}_{λ,ϖ_v} the Hecke eigenvalues on (ι^{-1}π_v)^ord of [Ger19, Def. 5.5].

**Construction or proof:**

1. Make a soluble CM base change disjoint from the residual kernel, with p split completely and the needed imaginary quadratic subfield.

2. Import ordinary automorphic base change and apply Theorem 5.5.1.

3. Use the distinct-character flag criterion of L7 to obtain the full ordinary filtration, then descend along the split local completions.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-local-global](#ordinary-local-global), [PA.5/residual-lifting-hypothesis-restriction](#residual-lifting-hypothesis-restriction), `mathlib:Matrix.charpoly`, `LocalGaloisDeformationRings:L7`, `PotentialAutomorphyInfrastructurePartII:PL.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.5, Corollary 5.5.2, p. 1028. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-local-global"></a>

### Theorem: Ordinary local–global compatibility

**Node:** `PotentialAutomorphyInfrastructure:PA.2/ordinary-local-global`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_local_global`.

Assume the §5 standing hypotheses (F contains an imaginary quadratic field in which p splits; ϖ_{v^c} = ϖ_v^c) and [F^+:Q] > 1. Let K ⊂ GL_n(A_F^∞) be a good subgroup with K_v = Iw_v for each v ∈ S_p (and K_v = GL_n(O_{F_v}) for v ∉ S), let c ≥ b ≥ 0 be integers with c ≥ 1, let λ be a weight (printed λ ∈ (Z^n)^{Hom(F,E)}; the objects require λ ∈ (Z^n_+)^{Hom(F,E)}), and let 𝔪 ⊂ T^S(K(b,c),λ)^ord be a non-Eisenstein maximal ideal. Suppose (1) for every finite place v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or there is an imaginary quadratic F_0 ⊂ F in which l splits; (2) ρ̄_𝔪 is decomposed generic. Then there exist an integer N ≥ 1 depending only on [F^+:Q] and n, an ideal J ⊂ T^S(K(b,c),λ)^ord_𝔪 with J^N = 0, and a continuous ρ_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord_𝔪/J) such that: (a) for every finite v ∉ S, det(X − ρ_𝔪(Frob_v)) is the image of P_v(X); (b) for every v ∈ S_p and g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{i=1}^n (X − χ_{λ,v,i}(g)); (c) for every v ∈ S_p and g_1,…,g_n ∈ G_{F_v}, (ρ_𝔪(g_1) − χ_{λ,v,1}(g_1))(ρ_𝔪(g_2) − χ_{λ,v,2}(g_2))⋯(ρ_𝔪(g_n) − χ_{λ,v,n}(g_n)) = 0.

**Construction or proof:**

1. Treat n=1 by the Hecke-character/class-field correspondence; do not use the CTG weight construction at rank one.

2. Reduce to the finite torsion Hecke images and c=b≥m by Hochschild–Serre and ordinary level control.

3. Use ordinary weight control to replace λ by the specially chosen CTG weight of Proposition 5.4.18.

4. Apply the all-degree integral characteristic data in degrees q and q+1 to the universal-coefficient short exact sequence; multiply nilpotent annihilators and recover both the characteristic polynomial and the ordered n-fold matrix identity.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For n=2 the ordered identity is (ρ(g₁)−χ₁(g₁))(ρ(g₂)−χ₂(g₂))=0 for arbitrary distinct arguments g₁,g₂; a factorization only at one g is insufficient.

**Direct prerequisites:** [PA.2/all-degree-ordinary-characteristic-data](#all-degree-ordinary-characteristic-data), [PA.2/ordinary-level-control](#ordinary-level-control), [PA.2/finite-ordinary-weight-control](#finite-ordinary-weight-control), `mathlib:Matrix.charpoly`, `PotentialAutomorphyInfrastructurePartII:PL.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §5.1, Theorem 5.5.1, p. 991; restated and proved in §5.5, pp. 1026–1027. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

**Stage acceptance:** Run every definition’s small-case and non-example tests above, compare all degree shifts and character normalizations to the cited source, and fulfil every listed supplier contract used by the stage. A recorded gap remains a failed closure obligation; passing the structural packet checker does not discharge it.

## PA.3. Derived support and Ihara avoidance

PA.3 verifies the arithmetic hypotheses of abstract derived Ihara avoidance. The deformation functors and their local rings have owners L7, L8, R08.2 and G8; G7 supplies the enormous Taylor–Wiles presentation. PA.3 compares their precise untwisted and χ-twisted arithmetic applications, with the same determinant, framing and coefficient maps. Congruent tame characters give the common mod-varpi complex, while the corresponding local and global reduction diagrams must commute.

The component theorem has different Fontaine–Laffaille and ordinary conclusions: the Fontaine–Laffaille calculation gives the source’s full component/dimension comparison; the ordinary application uses the chosen torus-Iwasawa minimal prime and does not classify all ordinary components. The support theorem is conditional on a patched pair satisfying the P8 inputs. PA.4 constructs and verifies that pair, then applies the PA.3 contract. This direction avoids a dependency from PA.3 back to PA.4. Nilpotent quotient actions preserve prime support; no integral R=T statement follows.

**Coverage:** planned. **Remaining:** Fulfil L7/L8/R08.2/G7/G8 requests and P9’s complete component-support contract; verify the local-to-global mod-varpi diagrams in the stated coefficient rings.

**Planets:** Fontaine–Laffaille deformation action; Ordinary deformation action; Local-condition comparison; Arithmetic component comparison; Derived Ihara avoidance.

**Declaration inventory:** [fontaine-laffaille-deformation-hecke-map](#fontaine-laffaille-deformation-hecke-map), [ordinary-deformation-hecke-map](#ordinary-deformation-hecke-map), [local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), [arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [arithmetic-derived-support-contract](#arithmetic-derived-support-contract).

<a id="fontaine-laffaille-deformation-hecke-map"></a>

### Theorem: Proposition 6.5.3: Hecke-algebra-valued Galois representations of type 𝒮_χ at level K

**Node:** `PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_deformation_hecke_map`.

Under §6.5.1, for each χ as above there are an integer δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪 with J^δ = 0, and a continuous surjection f_{𝒮_χ}: R_{𝒮_χ} → T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪/J such that for every finite place v ∉ S the characteristic polynomial of f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v) is the image of P_v(X). (Proof: the representation ρ_𝔪: G_{F,S∪S^c} → GL_n(T^S(…)_𝔪/J) of Theorem 2.3.7, conjugated so that ρ_𝔪 mod 𝔪 = ρ̄_𝔪; Theorem 4.5.1 gives the Fontaine–Laffaille condition at v | p; Theorem 3.1.1, applied with its S equal to S ∪ S^c and its R equal to S − S_p, gives the inertial characteristic-polynomial condition at v ∈ R and unramifiedness with the right Frobenius polynomial at v ∈ S^c − S.)

**Additional hypotheses:** FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Use PA.1 local–global compatibility at p and AG2 inertial compatibility at R and away from p.

2. Apply the representing universal property of the global problem; the Hecke representation factors through R_{Sχ}.

3. Track the uniform nilpotence exponent and the residual/common mod-varpi action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.1/fontaine-laffaille-local-global](#fontaine-laffaille-local-global), [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), `AutomorphicGaloisRepresentationsPartII:AG2.5`, `GlobalGaloisDeformations:G8`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, Proposition 6.5.3, p. 1063. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-deformation-hecke-map"></a>

### Theorem: Proposition 6.6.7: Galois representations over the ordinary Hecke algebra of A(μ,χ)

**Node:** `PotentialAutomorphyInfrastructure:PA.3/ordinary-deformation-hecke-map`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_deformation_hecke_map`.

Let T^{S,Λ_1} = T^S ⊗_𝒪 Λ_1 ⊂ T^{S,ord}. There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^{S,Λ_1}(A(μ,χ)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ-algebra homomorphism f_{𝒮_χ}: R_{𝒮_χ} → T^{S,Λ_1}(A(μ,χ)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1})/J such that for every finite v ∉ S the characteristic polynomial of f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v) is the image of P_v(X). (Proof: build compatible maps R_{𝒮_χ} → T^{S,ord}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord})_𝔪/J_c as in Prop. 6.5.3 with Theorem 5.5.1 in place of Theorem 4.5.1 (using the description of 𝒟^{det,ord} in §6.2.6); Carayol's lemma [CHT08, Lem. 2.1.10] puts the image in a nilpotent quotient of T^{S,Λ_1}(…); the Hecke algebras agree by transpose and twist; pass to the limit in c as in the proof of Theorem 4.5.1.)

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Use PA.2 full ordinary character identities and L8 determinant-ordinary representability at each finite c.

2. Compare the transpose-and-twist Hecke images and use Carayol descent to the smaller TS,Λ₁ image.

3. Pass through compatible finite c quotients with a single uniform nilpotence exponent.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.2/ordinary-local-global](#ordinary-local-global), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), `AutomorphicGaloisRepresentationsPartII:AG2.5`, `LocalGaloisDeformationRings:L8`, `GlobalGaloisDeformations:G8`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, Proposition 6.6.7, p. 1078. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="local-condition-mod-varpi-comparison"></a>

### Theorem: Arithmetic local-condition comparison

**Node:** `PotentialAutomorphyInfrastructure:PA.3/local-condition-mod-varpi-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.local_condition_mod_varpi_comparison`.

Under either full good-level hypothesis profile, choose pairwise distinct characters χ_{v,i}:k(v)×→O× at every v∈R, all congruent to 1 modulo varpi. The untwisted and χ-twisted coefficient complexes have a Hecke-equivariant derived isomorphism modulo varpi, and their finite local/global deformation rings reduce to the same deformation problem. At p the FL condition or the ordinary flag/determinant condition is identical on the two sides; away from p the R08.2 unipotent/inertial-type reductions supply the comparison. Framing and the global determinant are kept fixed.

**Construction or proof:**

1. Use the integral character-twist comparison for coefficient local systems.

2. Use R08.2 mod-varpi comparison at R, unchanged p conditions from L7/L8 and unchanged unrestricted conditions elsewhere.

3. Use G8 representability to identify the global mod-varpi problems; check universal representations and all local maps commute.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.0/boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `LocalGaloisDeformationRings:L8/determinant-ordinary-ring`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:L8`, `LocalGaloisDeformationRings:R08.2`, `GlobalGaloisDeformations:G8`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.3.5; §6.5.1; §6.6.1 equation (6.6.4). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="arithmetic-component-dimension-input"></a>

### Theorem: Arithmetic component and dimension input

**Node:** `PotentialAutomorphyInfrastructure:PA.3/arithmetic-component-dimension-input`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.arithmetic_component_dimension_input`.

For the FL or ordinary framed global problem and its χ-twist, tensor the local rings with the common framing/patching power-series variables. With q Taylor–Wiles places and g=qn−n²[F⁺:Q]≥0, the FL rings satisfy dim R∞=dim S∞−ℓ₀ and dim(R∞/varpi)=dim R∞−1, ℓ₀=n[F⁺:Q]−1. The maximal-dimensional mod-varpi generic points lift uniquely to maximal-dimensional characteristic-zero components as required by P9; the χ-twisted generic lifts are unique, and lower components satisfy the strict dimension bound in Assumption 6.3.6. In the ordinary case the same P9 comparisons apply after choosing the specified minimal prime of the torus Iwasawa algebra and using the L7 trivial-residual degree bound; this is not a classification of every ordinary component.

**Construction or proof:**

1. Compute local dimensions using L7/L8, the ACC FL local ring and R08.2 away-from-p rings.

2. Use the enormous G7 presentation to add exactly g formal variables and the fixed framing variables.

3. Compare generic points using the distinct χ-types and R08.2 component uniqueness; reduce to the imported P9 hypothesis list.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:L8`, `LocalGaloisDeformationRings:R08.2`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:G8`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proof of Theorem 6.5.4 pp. 1069–1070; proof of Theorem 6.6.2 pp. 1080–1081. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="arithmetic-derived-support-contract"></a>

### Theorem: Arithmetic derived Ihara-avoidance contract

**Node:** `PotentialAutomorphyInfrastructure:PA.3/arithmetic-derived-support-contract`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.arithmetic_derived_support_contract`.

Given the imported P8 patched perfect complexes C∞,C∞′ for these two arithmetic towers, their common mod-varpi Hecke image and quotient deformation actions, and rational amplitude [q_patch,q_patch+ℓ₀] at every characteristic-zero augmentation point, the component input implies P9 Assumption 6.3.6. Consequently support of H*(C∞) contains each maximal-dimensional component, and an augmentation characteristic-zero point x is in the support of H*(C∞⊗^L_{S∞}S∞/(x∩S∞))[1/p] whenever its generic component is one of those components. This statement is conditional on the patching input; PA.4 constructs and verifies that input. The conclusion is reduced support, not an integral R=T isomorphism.

**Additional hypotheses:** Here q_patch=n(n−1)[F⁺:Q]/2+1 for the shifted dual complex; the rational GL_n cohomology lower degree is q_GL=q_patch−1. The abstract P9 parameter q₀ is q_patch in this application.

**Construction or proof:**

1. Compare the arithmetic data with each clause of P9 Assumption 6.3.6.

2. Apply P9 Proposition 6.3.8 and Corollary 6.3.9 to the fixed arithmetic quotient action.

3. Use nilpotence invariance of the underlying prime support; preserve the characteristic-zero restriction.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), `mathlib:Module.support`, `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.3.5 Proposition 6.3.8 and Corollary 6.3.9. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

**Stage acceptance:** Run every definition’s small-case and non-example tests above, compare all degree shifts and character normalizations to the cited source, and fulfil every listed supplier contract used by the stage. A recorded gap remains a failed closure obligation; passing the structural packet checker does not discharge it.

## PA.4. Arithmetic verification of patching and lifting

PA.4 combines both arithmetic local–global branches with the derived patching contract and states the two automorphy lifting endpoints. General Taylor–Wiles prime selection, diamonds and enormous presentations are imported from G7, and fixed-ultrafilter patching is imported from P8. PA.4 owns the actual auxiliary levels, selected ideals, freeness/augmentation comparisons, uniform nilpotence and bounded-rank verifications. Auxiliary levels retain every original factor outside Q, including at places of S. A chosen ultrafilter is fixed; independence of transition-map choices does not imply independence of ultrafilters.

For Fontaine–Laffaille, the local dimension is combined with g=qn−n²[F⁺:Q] and the framing variables to obtain dim R∞=dim S∞−ℓ₀. Rational GL_n cohomology has lower degree q_GL=n(n−1)[F⁺:Q]/2. The shifted dual complex has lower degree q_patch=q_GL+1. That one-degree shift is part of the interface to P9. The support conclusion gives the good-level lifting theorem and then the global descent theorem.

For ordinary lifting, the finite A₁(μ,χ,c) duals reconstruct over the Iwasawa algebra. The ν+w₀μ character removes the weight dependence of B. The resulting augmented point lies on a supported maximal-dimensional component; the proof obtains support at that point rather than an ordinary full-support theorem. The finite level-one complex in the specialization is A₁(λ,1,1), not an A complex with a third integer argument.

The endpoint theorems are unpolarized GL_n statements. They retain the scalar element outside the cyclotomic subgroup, absolute irreducibility, decomposed genericity, enormous image, the distinct p-bounds, the regular-weight conditions and the precise unramified conclusions. Polarization is not added. Controlled CM extensions use PA.5’s split test-prime and field checklists. At p, Fontaine–Laffaille unramified descent uses equality of inertia for the unramified extension; at other places the all-place local base-change comparison and the Varma argument are needed. ML.2 consumes these lifting endpoints to assemble potential automorphy.

**Coverage:** planned. **Remaining:** Fulfil P8 fixed-ultrafilter and P7/ALS uniform-rank/free-cell reconstruction inputs; independently read soluble unpolarized descent and local compatibility sources before filling the lifting signatures.

**Planets:** Patched-complex comparison; Diamond augmentation; Fontaine–Laffaille full support; Ordinary support at the lifting point; Fontaine–Laffaille automorphy lifting; Ordinary automorphy lifting.

**Declaration inventory:** [patched-arithmetic-mod-varpi-comparison](#patched-arithmetic-mod-varpi-comparison), [taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels), [taylor-wiles-selected-ideals](#taylor-wiles-selected-ideals), [selected-ideal-properness](#selected-ideal-properness), [diamond-derived-augmentation](#diamond-derived-augmentation), [taylor-wiles-hecke-locality](#taylor-wiles-hecke-locality), [diamond-linear-deformation-hecke-map](#diamond-linear-deformation-hecke-map), [fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [fontaine-laffaille-dimension-amplitude](#fontaine-laffaille-dimension-amplitude), [fontaine-laffaille-full-support](#fontaine-laffaille-full-support), [fontaine-laffaille-lifting-at-good-level](#fontaine-laffaille-lifting-at-good-level), [neatness-auxiliary-places](#neatness-auxiliary-places), [ordinary-hida-complex](#ordinary-hida-complex), [weight-independent-hida-twist](#weight-independent-hida-twist), [hida-weight-independence](#hida-weight-independence), [hida-weight-specialization](#hida-weight-specialization), [ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), [ordinary-diamond-augmentation](#ordinary-diamond-augmentation), [ordinary-diamond-linear-hecke-map](#ordinary-diamond-linear-hecke-map), [ordinary-patching-verification](#ordinary-patching-verification), [ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point), [ordinary-lifting-at-good-level](#ordinary-lifting-at-good-level), [fontaine-laffaille-lifting-descent](#fontaine-laffaille-lifting-descent), [ordinary-lifting-descent](#ordinary-lifting-descent), [fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting), [ordinary-automorphy-lifting](#ordinary-automorphy-lifting).

<a id="patched-arithmetic-mod-varpi-comparison"></a>

### Theorem: Proposition 6.4.17: comparison of the primed and unprimed patched complexes modulo ϖ

**Node:** `PotentialAutomorphyInfrastructure:PA.4/patched-arithmetic-mod-varpi-comparison`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.patched_arithmetic_mod_varpi_comparison`.

(1) The quasi-isomorphisms 𝒞_N/ϖ ≅ 𝒞′_N/ϖ induce a quasi-isomorphism 𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ. (2) Via this identification T_∞ and T′_∞ have the same image T̄_∞ in the endomorphism algebras of 𝒞_∞/ϖ and 𝒞′_∞/ϖ (in D(S_∞/ϖ); printed D(S_∞)). (3) With Ī_∞, Ī′_∞ the images of I_∞, I′_∞ in T̄_∞, the actions of R_∞/ϖ ≅ R′_∞/ϖ (through T_∞ and T′_∞) on H^*(𝒞_∞/ϖ)/(Ī_∞ + Ī′_∞) and H^*(𝒞′_∞/ϖ)/(Ī_∞ + Ī′_∞) are identified via 𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ.

**Additional hypotheses:** One of the two arithmetic towers satisfies every imported P8 datum condition; the branch-specific verification is respectively PA.4/fontaine-laffaille-patching-verification or PA.4/ordinary-patching-verification.

**Construction or proof:**

1. Apply the imported P8 comparison to the two arithmetic towers after verifying the termwise mod-varpi coefficient comparison.

2. Identify the common Hecke image in End_{D(S∞/varpi)} of the reduced complex.

3. Compare the induced R∞/varpi actions after quotienting by the sum of the two reduced nilpotent ideals.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), `mathlib:DerivedCategory`, `DeformationAndDerivedPatchingAlgebra:P8`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.4.2, Proposition 6.4.17, pp. 1060–1061. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="taylor-wiles-arithmetic-levels"></a>

### Definition: Auxiliary Taylor–Wiles levels K_1(Q) ⊂ K_0(Q) ⊂ K and the Hecke algebra maps (6.5.6), (6.5.7)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels`. **Proposed declaration:** `TaylorWilesArithmeticLevels`.

Let (Q, (α_{v,1},…,α_{v,n})_{v∈Q}) be a Taylor–Wiles datum for 𝒮_1 (§6.2.28) such that for each v ∈ Q the residue characteristic l_v splits in an imaginary quadratic subfield of F. It is a Taylor–Wiles datum for every 𝒮_χ, and R_{𝒮_{χ,Q}} is an 𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} Δ_v = ∏_{v∈Q} k(v)^×(p)^n. Good subgroups K_1(Q) ⊂ K_0(Q) ⊂ K: K_1(Q)_v = K_0(Q)_v = K_v for v ∉ Q (printed: v ∉ S ∪ Q); for v ∈ Q, K_0(Q)_v = Iw_v and K_1(Q)_v is the maximal pro-prime-to-p subgroup of Iw_v. Then K_0(Q)/K_1(Q) ≅ Δ_Q, and (6.5.6) there are surjective T^{S∪Q}-algebra maps _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}(K_0(Q), 𝒱) → T^{S∪Q}(K, 𝒱) (𝒱 = 𝒱_λ(χ^{-1})): the first from K_0(Q)-invariants (𝒪[Δ_Q] acting trivially on invariants), the second t ↦ [K:K_0(Q)]^{-1} π_{Q,*} ∘ t ∘ π_Q^* for the projection π_Q: X_{K_0(Q)} → X_K, where [K:K_0(Q)] ≡ (n!)^{|Q|} mod p is a unit since p > n. T^{S∪Q}_Q(K_0(Q), 𝒱) ⊂ End_{D(𝒪)}(RΓ(X_{K_0(Q)}, 𝒱)) is the commutative T^{S∪Q}(K_0(Q),𝒱)-subalgebra generated by the U_{v,i} (v ∈ Q, 1 ≤ i ≤ n), equivalently the image of T^{S∪Q}_Q (§3.1); T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) ⊂ End_{D(𝒪[Δ_Q])}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)) likewise (an 𝒪[Δ_Q]-algebra). (6.5.7): the first map of (6.5.6) extends to a surjection T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}_Q(K_0(Q), 𝒱) sending U_{v,i} to U_{v,i}.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 6.5.9: Proves derived diamond augmentation.

- ACC Proposition 6.5.11: Controls the diamond-linear deformation action.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `TaylorWilesArithmeticLevels.away` | simp | Both auxiliary levels equal K_v at every v∉Q, including v∈S. |
| `TaylorWilesArithmeticLevels.at_auxiliary` | data | At v∈Q use Iw_v and its maximal pro-prime-to-p subgroup. |
| `TaylorWilesArithmeticLevels.diamond_quotient` | compatibility | The quotient K₀(Q)/K₁(Q) is the imported Δ_Q. |
| `TaylorWilesArithmeticLevels.trace_scalar` | relation | Pullback followed by trace has scalar [K:K₀(Q)]≡(n!)^{#Q} mod p. |

**Unit tests:**

- `TaylorWilesArithmeticLevels.empty` (degenerate): For Q=∅ both levels equal K and the diamond group is trivial.

- `TaylorWilesArithmeticLevels.single_prime` (computation): For Q={v}, n=2 and p>2 the trace scalar is 2 modulo p, hence a unit.

- `TaylorWilesArithmeticLevels.old_bad_place` (non-example): At v∈S outside Q the original local factor must be retained; leaving it unspecified does not define a level.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For Q=∅ both levels equal K and the diamond group is trivial. For Q={v}, n=2 and p>2 the trace scalar is 2 modulo p, hence a unit. At v∈S outside Q the original local factor must be retained; leaving it unspecified does not define a level.

**Direct prerequisites:** [PA.0/integral-model-comparison](#integral-model-comparison), `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation`, `GlobalGaloisDeformations:G7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, paragraphs after Corollary 6.5.5, (6.5.6), (6.5.7), pp. 1064–1065. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="taylor-wiles-selected-ideals"></a>

### Definition: The maximal ideals 𝔪^Q, 𝔪_0^Q, 𝔪_1^Q and the Taylor–Wiles ideals 𝔫_0^Q, 𝔫_1^Q

**Node:** `PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-selected-ideals`. **Proposed declaration:** `TaylorWilesSelectedIdeals`.

With 𝒱 = 𝒱_λ(χ^{-1}): 𝔪^Q ⊂ T^{S∪Q}(K, 𝒱) is the pullback of 𝔪 under T^{S∪Q}(K,𝒱) ⊂ T^S(K,𝒱); 𝔪_0^Q ⊂ T^{S∪Q}(K_0(Q),𝒱) is the pullback of 𝔪^Q and 𝔪_1^Q ⊂ _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q),𝒱) the pullback of 𝔪_0^Q under the maps (6.5.6); 𝔫_0^Q ⊂ T^{S∪Q}_Q(K_0(Q),𝒱) is the ideal generated by 𝔪_0^Q and the elements U_{v,i} − q_v^{i(1−i)/2} α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n); 𝔫_1^Q ⊂ T^{S∪Q}_Q(K_0(Q)/K_1(Q),𝒱) is the preimage of 𝔫_0^Q under (6.5.7).

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 6.5.8: Selects a nonzero auxiliary eigenspace.

- ACC Lemma 6.5.9: Identifies the localized augmentation.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `TaylorWilesSelectedIdeals.unramified_contraction` | data | m^Q is the contraction of m to the away-from-S∪Q Hecke image. |
| `TaylorWilesSelectedIdeals.selected_generator` | simp | n₀^Q adds U_{v,i}−q_v^{i(1−i)/2}∏_{j≤i}α_{v,j}. |
| `TaylorWilesSelectedIdeals.diamond_pullback` | functoriality | n₁^Q is the preimage of n₀^Q under the auxiliary diamond-forgetting Hecke map. |
| `TaylorWilesSelectedIdeals.ordering` | relation | The chosen ordering of residual eigenvalues fixes the selected Iwahori constituent. |

**Unit tests:**

- `TaylorWilesSelectedIdeals.empty` (degenerate): For Q=∅ the selected ideal is just the original localized maximal ideal.

- `TaylorWilesSelectedIdeals.rank_two_second` (computation): For n=2 the i=2 generator is U_{v,2}−q_v^{-1}α_{v,1}α_{v,2}.

- `TaylorWilesSelectedIdeals.order_sensitive` (non-example): For distinct α₁,α₂, interchanging them changes the i=1 generator U_{v,1}−α₁.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For Q=∅ the selected ideal is just the original localized maximal ideal. For n=2 the i=2 generator is U_{v,2}−q_v^{-1}α_{v,1}α_{v,2}. For distinct α₁,α₂, interchanging them changes the i=1 generator U_{v,1}−α₁.

**Direct prerequisites:** [PA.4/taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, paragraph before Lemma 6.5.8, p. 1065. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="selected-ideal-properness"></a>

### Theorem: Lemma 6.5.8: the auxiliary ideals are proper maximal ideals

**Node:** `PotentialAutomorphyInfrastructure:PA.4/selected-ideal-properness`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.selected_ideal_properness`.

Each of 𝔪^Q, 𝔪_0^Q, 𝔪_1^Q, 𝔫_0^Q, 𝔫_1^Q is a (proper) maximal ideal. The content is that 𝔫_0^Q is proper, i.e. H^*(X_{K_0(Q)}, 𝒱_λ(χ^{-1})/ϖ)[𝔪_0^Q] contains a nonzero vector on which every U_{v,i} (v ∈ Q) acts by α_{v,1}⋯α_{v,i}; this follows from (the proof of) [KT17, Lem. 5.3] once H^*(X_K, 𝒱_λ(χ^{-1}))[𝔪^Q] is killed by a power of 𝔪, which follows from the existence of ρ̄_𝔪 and its local–global compatibility at v ∈ Q.

**Construction or proof:**

1. Use the unramified local automorphic representation and its Iwahori invariants at each auxiliary place.

2. The ordered distinct residual eigenvalues select a nonzero simultaneous generalized eigenspace; the selected ideal is proper and maximal.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/taylor-wiles-selected-ideals](#taylor-wiles-selected-ideals).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, Lemma 6.5.8, p. 1065. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="diamond-derived-augmentation"></a>

### Theorem: Lemma 6.5.9: the auxiliary-level localized complexes recover the level-K complex

**Node:** `PotentialAutomorphyInfrastructure:PA.4/diamond-derived-augmentation`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.diamond_derived_augmentation`.

The natural morphisms RΓ(X_K, 𝒱)_{𝔪^Q} → RΓ(X_K, 𝒱)_𝔪, RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} → RΓ(X_K, 𝒱)_{𝔪^Q} (trace), and RΓ(Δ_Q, RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} are isomorphisms in D(𝒪) (𝒱 = 𝒱_λ(χ^{-1})). (Proof: the first because 𝔪 is the unique maximal ideal of T^S(K, 𝒱) above 𝔪^Q (printed: of T^{S∪Q}(K_0(Q), 𝒱)), shown in the proof of Lemma 6.5.8; the second reduces after ⊗^L_𝒪 k to tr_{K/K_0(Q)}: H^*(X_{K_0(Q)}, 𝒱/ϖ)_{𝔫_0^Q} ≅ H^*(X_K, 𝒱/ϖ)_{𝔪^Q}, which is [KT17, Lem. 5.4]; the third is clear from the definitions.)

**Construction or proof:**

1. Use the trace composite from K to K₀(Q); its scalar index is congruent to (n!)^{#Q} modulo p, hence a unit.

2. Apply finite free Δ_Q-complex descent to K₁(Q) and localize at the selected eigenvalues.

3. The derived augmentation to O identifies the level-K complex, compatibly with Hecke action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/selected-ideal-properness](#selected-ideal-properness), [PA.0/integral-model-comparison](#integral-model-comparison).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, Lemma 6.5.9, p. 1066. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="taylor-wiles-hecke-locality"></a>

### Theorem: (6.5.10): the Taylor–Wiles Hecke algebra is local; nearly faithful modules

**Node:** `PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-hecke-locality`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.taylor_wiles_hecke_locality`.

There is a surjection _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → T^{S∪Q}(RΓ(X_K, 𝒱)_{𝔪^Q}) = T^{S∪Q}(K, 𝒱)_{𝔪^Q}; its source is a local 𝒪[Δ_Q]-algebra whose maximal ideal is the preimage of 𝔪^Q, because it acts nearly faithfully on H^*(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}. Definition ([Tay08, Def. 2.1]): a finitely generated module over a Noetherian local ring is nearly faithful if its annihilator is a nilpotent ideal.

**Construction or proof:**

1. Localize the enlarged auxiliary Hecke algebra at the proper selected maximal ideal.

2. Its image on the localized perfect complex is a finite local O[Δ_Q]-algebra; nearly faithful support uses the R03.6 annihilator criterion.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/diamond-derived-augmentation](#diamond-derived-augmentation).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, (6.5.10) and following paragraph, p. 1066. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="diamond-linear-deformation-hecke-map"></a>

### Theorem: Proposition 6.5.11: 𝒪[Δ_Q]-linear Galois representations over the Taylor–Wiles Hecke algebra

**Node:** `PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.diamond_linear_deformation_hecke_map`.

Let 𝕋 = _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱_λ(χ^{-1}))_{𝔫_1^Q}). There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 with J^δ = 0, and a continuous surjective 𝒪[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) is the image of P_v(X). (Proof: with T′ = T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱)_{𝔫_1^Q} ⊃ 𝕋 (a local inclusion of finite 𝒪[Δ_Q]-algebras), Theorem 2.3.7 gives ρ_{𝔫_1^Q}: G_{F,S∪Q} → GL_n(T′/J′) lifting ρ̄_𝔪; the conditions at S are as in Prop. 6.5.3 and there is none at Q. For v ∈ Q define ψ_{v,i}: W_{F_v} → (T′)^× by ψ_{v,i}(Art_{F_v}(α)) = t_{v,i}(α); Theorem 3.1.1 gives det(X − ρ_{𝔫_1^Q}(σ)) = ∏_i (X − ψ_{v,i}(σ)) for σ ∈ W_{F_v} (after enlarging J′); the ψ_{v,i} mod 𝔫_1^Q send Frobenius to the pairwise distinct α_{v,i}, so [BC09, Prop. 1.5.1] gives ρ_{𝔫_1^Q}|_{W_{F_v}} ≅ ⊕_i ψ_{v,i}, whence 𝒪[Δ_v]-linearity (§6.2.18); take J = ker(𝕋 → T′/J′).)

**Additional hypotheses:** FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Use the FL deformation–Hecke map at the auxiliary level.

2. Distinct residual eigenvalues give a direct sum of lifted characters at Q.

3. Compare those characters on inertia with diamond operators by Cayley–Hamilton and local-global compatibility; this proves O[Δ_Q]-linearity.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels), [PA.4/taylor-wiles-selected-ideals](#taylor-wiles-selected-ideals), [PA.3/fontaine-laffaille-deformation-hecke-map](#fontaine-laffaille-deformation-hecke-map), `AutomorphicGaloisRepresentationsPartII:AG2.5`, `GlobalGaloisDeformations:G8`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, Proposition 6.5.11, pp. 1066–1067. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-patching-verification"></a>

### Theorem: The Taylor–Wiles patching data for Theorem 6.5.4 (FL case)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-patching-verification`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_patching_verification`.

Set q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 = a power series ring over 𝒪 in n²|S| − 1 variables, S_∞ = 𝒯⟦Δ_∞⟧ with augmentation ideal 𝔞_∞ (Λ = 𝒪). Enlarge E to contain ζ_p and choose, for each v ∈ R, pairwise distinct χ_{v,1},…,χ_{v,n}: 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ (possible as p > n, q_v ≡ 1 mod p); χ = ∏_{v∈R} χ_v on ∏_{v∈R} I_v. For N ≥ 1 choose Taylor–Wiles data (Q_N, (α_{v,i})_{v∈Q_N}) as in Proposition 6.2.33 (possible as r̄_ι(π)(G_{F(ζ_p)}) is enormous; any imaginary quadratic subfield of F), Q_0 = ∅, Δ_N = Δ_{Q_N} with a surjection Δ_∞ ↠ Δ_N whose kernel lies in (p^N ℤ_p)^{nq} (as q_v ≡ 1 mod p^N for v ∈ Q_N). R_N = R_{𝒮_{1,Q_N}}, R′_N = R_{𝒮_{χ,Q_N}} (R_0 = R_{𝒮_1}, R′_0 = R_{𝒮_χ}); R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ} (§6.2.22), also the local rings of 𝒮_{·,Q_N}; canonical isomorphisms R^loc/ϖ ≅ R′^loc/ϖ, R_N/ϖ ≅ R′_N/ϖ, R_N ⊗_{𝒪[Δ_N]} 𝒪 ≅ R_0, R′_N ⊗ 𝒪 ≅ R′_0, compatible mod ϖ; R^loc-algebra structures on R_N ⊗̂_𝒪 𝒯 (Lemma 6.2.4); R_∞, R′_∞ = power series rings in g variables over R^loc, R′^loc with surjections onto the framed rings R_N ⊗̂ 𝒯, R′_N ⊗̂ 𝒯 (Prop. 6.2.25 for N = 0, using H⁰(F_S/F, ad ρ̄_𝔪(1)) = 0 because r̄_ι(π)|_{G_{F(ζ_p)}} is irreducible and ζ_p ∉ F; Prop. 6.2.33(3) for N ≥ 1 — printed 'Proposition 6.2.32' and 'R_∞ → R_N'), compatible mod ϖ and with R_N ⊗ 𝒪 ≅ R_0. Complexes: 𝒞_0 = RHom_𝒪(RΓ(X_K, 𝒱_λ(1))_𝔪, 𝒪)[−d], T_0 = T^S(K, 𝒱_λ(1))_𝔪, with H^i(𝒞_0)[1/p] ≅ Hom_E(H^{d−i}(X_K, 𝒱_λ(1))_𝔪[1/p], E) as T_0-modules; 𝒞′_0, T′_0 likewise with 𝒱_λ(χ^{-1}); for N ≥ 1, 𝒞_N = RHom_{𝒪[Δ_N]}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}, 𝒪[Δ_N])[−d], T_N = _{K_0/K_1}T^{S∪Q_N}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}), and 𝒞′_N, T′_N with 𝒱_λ(χ^{-1}). Claim: with I_N, I′_N from Props. 6.5.3/6.5.11 these data satisfy the set-up of §6.4.1: canonical 𝒞_N ⊗^L k[Δ_N] ≅ 𝒞′_N ⊗^L k[Δ_N] with T_N, T′_N having the same image T̄_N; 𝒞_N ⊗^L_{𝒪[Δ_N]} 𝒪 ≅ 𝒞_0 (Lemma 6.5.9), compatible mod ϖ; local 𝒪[Δ_N]-algebra surjections R_N → T_N/I_N, R′_N → T′_N/I′_N compatible mod ϖ and agreeing into T̄_N/(Ī_N + Ī′_N); T_N ⊗_{𝒪[Δ_N]} 𝒪 → T_0 surjective onto T_0/I_0 (Chebotarev and the Galois representation over T_0/I_0), and likewise primed.

**Additional hypotheses:** FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Take dual minimal finite free models of RΓ at K₁(Q_N), shifted by −d, with the diamond action.

2. Use finite-cell freeness and residual minimal ranks to bound the range and each rank uniformly in N.

3. Use derived diamond augmentation, common mod-varpi models, global presentation and uniform nilpotent Hecke maps to fill every P8 patching datum condition.

4. Fix one nonprincipal ultrafilter; only transition-map-choice independence from P8 is used.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/diamond-derived-augmentation](#diamond-derived-augmentation), [PA.4/diamond-linear-deformation-hecke-map](#diamond-linear-deformation-hecke-map), `mathlib:DerivedCategory`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `GlobalGaloisDeformations:G7`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-dimension-amplitude"></a>

### Theorem: The dimension count and generic concentration for the FL patched system; conclusion of Theorem 6.5.4

**Node:** `PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-dimension-amplitude`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_dimension_amplitude`.

Applying §6.4.2 to the data of the previous item gives: bounded complexes 𝒞_∞, 𝒞′_∞ of free S_∞-modules, T_∞ ⊂ End_{D(S_∞)}(𝒞_∞), T′_∞ ⊂ End_{D(S_∞)}(𝒞′_∞), ideals with I_∞^δ = I′_∞^δ = 0, S_∞-algebra structures on R_∞, R′_∞ and S_∞-algebra surjections R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞; surjections R_∞/𝔞_∞ ↠ R_0, R′_∞/𝔞_∞ ↠ R′_0; 𝒞_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞_0 and 𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞′_0 with T_∞ → T_0 surjective onto T_0/I_0 and R_∞/𝔞_∞ → (T_0/I_0)/I_{∞,0} factoring through R_0; 𝒞_∞ ⊗^L S_∞/ϖ ≅ 𝒞′_∞ ⊗^L S_∞/ϖ with a common image T̄_∞ of T_∞ and T′_∞ and identified actions of R_∞/ϖ ≅ R′_∞/ϖ on H^*(𝒞_∞ ⊗^L S_∞/ϖ)/(Ī_∞ + Ī′_∞). By Lemma 6.2.26: every generic point of Spec R_∞/ϖ specializes from a unique generic point of Spec R_∞, all generic points of Spec R_∞ have characteristic 0, Spec R′_∞ is irreducible with characteristic-0 generic point, R_∞ is equidimensional, and dim R_∞ = dim R′_∞ = 1 + g + n²|S| + ½n(n−1)[F:ℚ]. For X_K with F CM, ℓ_0 = n[F⁺:ℚ] − 1; since dim S_∞ = n²|S| + qn and g = qn − n²[F⁺:ℚ] (printed twice as qn − n[F⁺:ℚ]), dim R_∞ = dim R′_∞ = dim S_∞ − ℓ_0. H^*(𝒞_∞ ⊗^L S_∞/𝔞_∞)[1/p] ≅ Hom_E(H^{d−*}(X_K, 𝒱_λ(1))_𝔪[1/p], E) is nonzero and concentrated in [q_patch, q_patch + ℓ_0] by Theorem 2.4.10. Hence Assumption 6.3.6 holds, Proposition 6.3.8 gives full support of H^*(𝒞_∞) over R_∞, hence of H^*(𝒞_∞ ⊗^L S_∞/𝔞_∞) = H^*(𝒞_0) over R_∞/𝔞_∞ and so over R_{𝒮_1}.

**Additional hypotheses:** FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement. Here q_patch=n(n−1)[F⁺:Q]/2+1 for the shifted dual complex; the rational GL_n cohomology lower degree is q_GL=q_patch−1. The abstract P9 parameter q₀ is q_patch in this application.

**Construction or proof:**

1. Put q=dim dual Selmer, g=qn−n²[F⁺:Q], and add n²|S|−1 framing variables.

2. Compute dim S∞=n²|S|+qn and dim R∞=dim S∞−ℓ₀, ℓ₀=n[F⁺:Q]−1.

3. Use R08.2 component comparison and rational Matsushima cohomology [q_GL,q_GL+ℓ₀]. After RHom(−,O)[−d], compute the interval [q_GL+1,q_GL+1+ℓ₀] and use that as P9’s q₀ interval to verify Assumption 6.3.6.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), `ArithmeticLocallySymmetricSpaces:ALS.3`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:R08.2`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, proof of Theorem 6.5.4, pp. 1069–1070. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-full-support"></a>

### Theorem: Theorem 6.5.4: full support of H^*(X_K, 𝒱_λ(1))_𝔪 over R_{𝒮_1} (Fontaine–Laffaille case)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-full-support`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_full_support`.

Under assumptions (1)–(17) of §6.5.1, H^*(X_K, 𝒱_λ(1))_𝔪 has full support over R_{𝒮_1}, i.e. its support in Spec R_{𝒮_1}, defined through f_{𝒮_1}: R_{𝒮_1} → T^S(RΓ(X_K, 𝒱_λ(1)))_𝔪/J (Prop. 6.5.3) as in §6.3.5, is all of Spec R_{𝒮_1} (although H^* is not literally an R_{𝒮_1}-module).

**Additional hypotheses:** FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Combine the arithmetic P8 verification, patched mod-varpi comparison and P9 dimension/component hypotheses.

2. Apply P9 maximal-component support and specialization at characteristic-zero points.

3. Use the diamond augmentation and the deformation–Hecke map to identify the finite-level full reduced support; a nilpotent quotient is invisible to support.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. Nilpotent ideals disappear from Spec and support, but the original integral deformation and Hecke rings need not be isomorphic.

**Direct prerequisites:** [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/fontaine-laffaille-dimension-amplitude](#fontaine-laffaille-dimension-amplitude), [PA.4/patched-arithmetic-mod-varpi-comparison](#patched-arithmetic-mod-varpi-comparison), [PA.3/arithmetic-derived-support-contract](#arithmetic-derived-support-contract), `DeformationAndDerivedPatchingAlgebra:P9`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, Theorem 6.5.4, p. 1063; proof pp. 1067–1070. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-lifting-at-good-level"></a>

### Theorem: Corollary 6.5.5: automorphy lifting under the §6.5.1 hypotheses

**Node:** `PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-at-good-level`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_lifting_at_good_level`.

Under (1)–(17) of §6.5.1, let ρ: G_F → GL_n(Q̄_p) be continuous with: (1) ρ̄ ≅ r̄_ι(π); (2) ρ|_{G_{F_v}} crystalline for every v | p, with HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}} (the j-th entry λ_{ιτ,j} + n − j) for every τ: F ↪ Q̄_p; (3) ρ unramified at every finite v ∉ S; (4) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ is automorphic: there is a cuspidal regular algebraic automorphic representation Π of GL_n(𝔸_F) of weight λ with ρ ≅ r_ι(Π), and Π_v is unramified at every finite v with v | p or v ∉ S. (Proof: conjugate ρ into GL_n(𝒪) with ρ mod ϖ = ρ̄_𝔪; it is of type 𝒮_1, giving f: R_{𝒮_1} → E; by Theorem 6.5.4, ker f ∈ Supp H^*(X_K, 𝒱_λ(1))_𝔪[1/p]; Theorem 2.4.10 gives Π with (Π^∞)^K ≠ 0.)

**Additional hypotheses:** FL-good-level: every one of the seventeen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. View the proposed crystalline lift as the O-point of R_{S₁}.

2. Full support puts that point in localized rational cohomology.

3. Apply the ALS/AG2 automorphic-realization theorem to produce the required cuspidal Π and read its level.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.4/fontaine-laffaille-full-support](#fontaine-laffaille-full-support), `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.1, Corollary 6.5.5, pp. 1063–1064. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="neatness-auxiliary-places"></a>

### Theorem: Auxiliary places v_0, v′_0 with H²(E_{v_0}, ad ρ̄) = 0

**Node:** `PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.neatness_auxiliary_places`.

By the Chebotarev density theorem there are infinitely many places v_0 of E of degree 1 over ℚ with odd residue characteristic, ρ̄(Frob_{v_0}) scalar, q_{v_0} ≢ 1 mod p and v_0 ∉ S′ ∪ R^c; for them H²(E_{v_0}, ad ρ̄) = H⁰(E_{v_0}, ad ρ̄(1))^∨ = 0. Choosing two such places v_0, v′_0 with distinct residue characteristics l_0 ≠ l′_0 and S = S′ ∪ {v_0, v′_0}, l_0 and l′_0 split in every imaginary quadratic subfield of E, and hypotheses (1)–(17) of §6.5.1 hold for E, π_E and S (resp. (1)–(15) of §6.6.1 in the ordinary case, §6.6.10).

**Construction or proof:**

1. Use Chebotarev with the scalar residual element outside the cyclotomic subgroup to choose two degree-one primes of distinct odd residue characteristics with q_v≠1 mod p.

2. Local Tate duality and scalar residual Frobenius give H²(G_{F_v},ad barρ)=0.

3. Choose pro-v Iwahori factors there; two distinct residue characteristics force neatness.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** Only the concrete finite data and categorical/module operations in the statement; no arithmetic supplier is inferred..

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.12, proof of Theorem 6.1.1, pp. 1073–1074 (and §6.6.10, p. 1084). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-hida-complex"></a>

### Definition: The ordinary Hida complexes A_1(μ,χ,c), A_1(μ,χ), A(μ,χ) and (6.6.3), (6.6.4)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-hida-complex`. **Proposed declaration:** `OrdinaryHidaComplex`.

For c ≥ 1, Λ_{1,c} = 𝒪[∏_{v∈S_p} ker(T_n(𝒪_{F_v}/ϖ_v^c) → T_n(𝒪_{F_v}/ϖ_v))], a quotient of Λ_1, and A_1(μ,χ,c) = RHom_{Λ_{1,c}}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c})[−d], a perfect complex in D(Λ_{1,c}) on which T^{S,ord} acts by transpose. (6.6.3): for c′ ≥ c there are T^{S,ord}-equivariant isomorphisms A_1(μ,χ,c′) ⊗^L_{Λ_{1,c′}} Λ_{1,c} ≅ A_1(μ,χ,c) in D(Λ_{1,c}) (Corollary 5.2.16). (6.6.4): canonical T^{S,ord}-equivariant isomorphisms A_1(μ,χ,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ ≅ A_1(μ,1,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ. By [KT17, Lem. 2.13] there is a perfect A_1(μ,χ) ∈ D(Λ_1) with T^{S,ord}-action and equivariant isomorphisms A_1(μ,χ) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,c) (all c ≥ 1) and A_1(μ,χ) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1) ⊗^L_{Λ_1} Λ_1/ϖ, compatible with (6.6.3) and with (6.6.4) for varying χ; A(μ,χ) = A_1(μ,χ) ⊗^L_{Λ_1} Λ ∈ D(Λ).

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Corollary 6.6.6: Specializes at the desired algebraic weight.

- ACC proof of Theorem 6.6.2: Provides the ordinary arithmetic P8 input.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `OrdinaryHidaComplex.finite` | data | A₁(μ,χ,c)=RHom_{Λ₁,c}(RΓ(X_{K(c,c)},V_μ(χ^{-1}))^ord,Λ₁,c)[−d]. |
| `OrdinaryHidaComplex.transition` | functoriality | Derived tensor from Λ₁,c′ to Λ₁,c gives the finite c complex for c′≥c. |
| `OrdinaryHidaComplex.mod_varpi` | compatibility | For χ congruent to 1 modulo varpi, the χ and 1 complexes agree after derived reduction. |
| `OrdinaryHidaComplex.perfect_limit` | data | The P7 reconstruction supplies a perfect Λ₁-complex with all these compatible finite specializations. |

**Unit tests:**

- `OrdinaryHidaComplex.zero` (degenerate): The dual of the zero ordinary complex is zero.

- `OrdinaryHidaComplex.single_free_term` (computation): For the free module Λ₁,c in degree 0 the dual shifted by −d has its sole cohomology in degree d.

- `OrdinaryHidaComplex.derived_reduction` (compatibility): For a perfect finite complex, specializing the dual equals the dual of the specialized complex; underived reduction of cohomology is not substituted.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The dual of the zero ordinary complex is zero. For the free module Λ₁,c in degree 0 the dual shifted by −d has its sole cohomology in degree d. For a perfect finite complex, specializing the dual equals the dual of the specialized complex; underived reduction of cohomology is not substituted.

**Direct prerequisites:** [PA.2/arithmetic-ordinary-summand](#arithmetic-ordinary-summand), [PA.2/ordinary-level-control](#ordinary-level-control), `mathlib:DerivedCategory`, `PadicFamilies:L0a/finite-quotient-system`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L0a/ordinary-part-complexes`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, (6.6.3), (6.6.4), pp. 1076–1077. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="weight-independent-hida-twist"></a>

### Definition: The twist ν and the weight-independent complexes B_1(μ,χ), B(μ,χ)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/weight-independent-hida-twist`. **Proposed declaration:** `WeightIndependentHidaTwist`.

ν ∈ X^*((Res_{F/ℚ} T)_E) = (ℤ^n)^{Hom(F,E)} is ν_τ = (0, 1, …, n−1) for all τ. B_1(μ,χ) = A_1(μ,χ) ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}, where 𝒪(ν + w_0^G μ)^{-1} is the 𝒪[T_n(F_p)]-module of §5.2.1 (the action of T_n(𝒪_{F,p}) extending uniquely to 𝒪⟦T_n(𝒪_{F,p})⟧); it is a perfect complex in D(Λ_1) with T^{S,ord}-action. B(μ,χ) = B_1(μ,χ) ⊗^L_{Λ_1} Λ.

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 6.6.5: Removes the weight dependence before patching.

- ACC Theorem 6.6.2: Specializes to the desired ordinary lift.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `WeightIndependentHidaTwist.nu` | data | ν_{τ,i}=i−1 for one-based i. |
| `WeightIndependentHidaTwist.formula` | characterisation | B₁=A₁⊗O(ν+w₀μ)^{-1}, and B=B₁⊗^L_{Λ₁}Λ. |
| `WeightIndependentHidaTwist.hecke` | compatibility | Transpose Hecke away from S is preserved under the tensor twist. |
| `WeightIndependentHidaTwist.weight_compare` | relation | For all dominant μ,μ′ the complexes B₁(μ,χ),B₁(μ′,χ) are equivariantly isomorphic by Lemma 6.6.5. |

**Unit tests:**

- `WeightIndependentHidaTwist.rank_one_zero` (degenerate): For n=1, μ=0, ν=0 so the twist is trivial.

- `WeightIndependentHidaTwist.rank_two_zero` (computation): For n=2, μ=0, ν=(0,1) and the twist is O(0,1)^{-1}, not the trivial character.

- `WeightIndependentHidaTwist.rank_two_weight` (computation): For μ=(2,0), ν+w₀μ=(0,3), fixing both the reversal and ν shift.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For n=1, μ=0, ν=0 so the twist is trivial. For n=2, μ=0, ν=(0,1) and the twist is O(0,1)^{-1}, not the trivial character. For μ=(2,0), ν+w₀μ=(0,3), fixing both the reversal and ν shift.

**Direct prerequisites:** [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.2/lowest-weight-character](#lowest-weight-character).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, p. 1077. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="hida-weight-independence"></a>

### Theorem: Lemma 6.6.5: B_1(μ,χ) is independent of the weight

**Node:** `PotentialAutomorphyInfrastructure:PA.4/hida-weight-independence`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.hida_weight_independence`.

For every μ′ ∈ (ℤ^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism B_1(μ,χ) ≅ B_1(μ′,χ) in D(Λ_1). (Proof: Proposition 5.2.17 and [KT17, Lem. 2.13].)

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Use completed ordinary weight independence and compatible finite c control.

2. Apply P7 perfect inverse-limit reconstruction; the ν+w₀μ twist removes the weight from the torus action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/weight-independent-hida-twist](#weight-independent-hida-twist), [PA.2/completed-ordinary-weight-control](#completed-ordinary-weight-control).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, Lemma 6.6.5, p. 1077. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="hida-weight-specialization"></a>

### Theorem: Corollary 6.6.6: weight specialization of the Hida complex

**Node:** `PotentialAutomorphyInfrastructure:PA.4/hida-weight-specialization`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.hida_weight_specialization`.

For μ′ ∈ (ℤ^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism in D(𝒪): B_1(μ,χ) ⊗^L_{Λ_1} 𝒪(ν + w_0^G μ′)^{-1} ≅ A_1(μ′,χ,1) ⊗_𝒪 𝒪(ν + w_0^G μ′)^{-1}. (By Lemma 6.6.5 reduce to μ′ = μ, where the left side is A_1(μ,χ) ⊗^L_{Λ_1} 𝒪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}.)

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. First identify B₁(μ,χ) with B₁(μ′,χ).

2. Derived specialization along the character O(ν+w₀μ′)^{-1} gives the finite c=1 dual complex with its explicit twist.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/hida-weight-independence](#hida-weight-independence).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, Corollary 6.6.6, pp. 1077–1078. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-taylor-wiles-levels"></a>

### Definition: Ordinary auxiliary levels K(c,c)_1(Q) ⊂ K(c,c)_0(Q) and the complexes A_1(μ,χ,Q,c), A_1(μ,χ,Q); the ideals 𝔪^Q, 𝔫^Q

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-taylor-wiles-levels`. **Proposed declaration:** `OrdinaryTaylorWilesLevels`.

For a Taylor–Wiles datum (Q, (α_{v,i})) for 𝒮_1 whose places have residue characteristic split in an imaginary quadratic subfield of F (a TW datum for all 𝒮_χ; R_{𝒮_{χ,Q}} an 𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} k(v)^×(p)^n) and c ≥ 1: good subgroups K(c,c)_1(Q) ⊂ K(c,c)_0(Q) ⊂ K(c,c), equal to K(c,c)_v away from Q (printed: for v ∉ S ∪ Q), with K(c,c)_0(Q)_v = Iw_v and K(c,c)_1(Q)_v the maximal pro-prime-to-p subgroup of Iw_v for v ∈ Q, so K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q. A_1(μ,χ,Q,c) = RHom_{Λ_{1,c}[Δ_Q]}(RΓ_{K(c,c)_0(Q)/K(c,c)_1(Q)}(X_{K(c,c)_1(Q)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c}[Δ_Q])[−d] ∈ D(Λ_{1,c}[Δ_Q]), with transpose action of T^{S∪Q,ord}_Q = T^{S∪Q,ord} ⊗_{T^{S∪Q}} T^{S∪Q}_Q. Passing to the limit in c gives A_1(μ,χ,Q) ∈ D(Λ_1[Δ_Q]) with T^{S∪Q,ord}_Q-action and equivariant isomorphisms A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,Q,c) and A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1,Q) ⊗^L_{Λ_1} Λ_1/ϖ, compatible with the level-c data. 𝔪^Q = the contraction of 𝔪 to T^{S∪Q,ord}; 𝔫^Q = the ideal of T^{S∪Q,ord}_Q generated by 𝔪^Q and U_{v,i} − α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n).

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Construct the objects with the explicit level, coefficient and character formulas at the cited passage.

2. Check the action on generators and its compatibility with coefficient reduction and level transition maps before taking derived invariants.

**Uses that determine the API:**

- ACC Lemma 6.6.8: Recovers the original ordinary complex by diamond augmentation.

- ACC Proposition 6.6.9: Provides the Λ[Δ_Q]-linear Galois action.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `OrdinaryTaylorWilesLevels.levels` | compatibility | For every c the two auxiliary levels agree with K(c,c) away from Q and use the same imported diamonds at Q. |
| `OrdinaryTaylorWilesLevels.dual` | data | The finite ordinary dual complex is formed over Λ₁,c[Δ_Q], with transpose Hecke. |
| `OrdinaryTaylorWilesLevels.selected_generator` | simp | The ordinary auxiliary ideal has generators U_{v,i}−∏_{j≤i}α_{v,j}, using the ordinary normalization. |
| `OrdinaryTaylorWilesLevels.limit` | functoriality | Perfect reconstruction in c commutes with mod-varpi comparison and carries the diamond action. |

**Unit tests:**

- `OrdinaryTaylorWilesLevels.empty` (degenerate): For Q=∅ the complex is A₁(μ,χ,c).

- `OrdinaryTaylorWilesLevels.single_rank_two` (computation): For n=2 and Q={v}, the ordinary i=2 generator is U_{v,2}−α₁α₂; the FL factor q_v^{-1} is absent.

- `OrdinaryTaylorWilesLevels.old_level` (compatibility): All places in S outside Q retain K(c,c)_v; the auxiliary modification does not change their levels.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For Q=∅ the complex is A₁(μ,χ,c). For n=2 and Q={v}, the ordinary i=2 generator is U_{v,2}−α₁α₂; the FL factor q_v^{-1} is absent. All places in S outside Q retain K(c,c)_v; the auxiliary modification does not change their levels.

**Direct prerequisites:** [PA.4/taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), `PadicFamilies:L0a/finite-quotient-system`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L0a/ordinary-part-complexes`, `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation`, `GlobalGaloisDeformations:G7`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, pp. 1078–1079. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-diamond-augmentation"></a>

### Theorem: Lemma 6.6.8: the ordinary auxiliary complexes specialize to A_1(μ,χ)_𝔪

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-augmentation`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_diamond_augmentation`.

𝔫^Q lies in the support of H^*(A_1(μ,χ,Q)), and there are T^{S∪Q,ord}-equivariant isomorphisms A_1(μ,χ,Q)_{𝔫^Q} ⊗^L_{Λ_1[Δ_Q]} Λ_1 ≅ A_1(μ,χ)_{𝔪^Q} ≅ A_1(μ,χ)_𝔪. (Proof 'as in the Fontaine–Laffaille case', details omitted.)

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. At every finite c repeat the FL selected-eigenvalue and diamond-augmentation proof, with the ordinary projector commuting with every map.

2. Use the compatible perfect inverse-limit complexes to pass to Λ₁; prove occurrence of n^Q in support.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), [PA.4/selected-ideal-properness](#selected-ideal-properness), [PA.4/diamond-derived-augmentation](#diamond-derived-augmentation).

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, Lemma 6.6.8, p. 1079. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-diamond-linear-hecke-map"></a>

### Theorem: Proposition 6.6.9: Λ[Δ_Q]-linear Galois representations over the ordinary Taylor–Wiles Hecke algebra

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-linear-hecke-map`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_diamond_linear_hecke_map`.

Let A(μ,χ,Q) = A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ and _{Δ_Q}T^{S∪Q,Λ_1} = T^{S∪Q,Λ_1} ⊗_𝒪 𝒪[Δ_Q], acting on A(μ,χ,Q)_{𝔫^Q} via K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q and passage to the limit; _{Δ_Q}T^{S∪Q,Λ_1}(A(μ,χ,Q)_{𝔫^Q}) is a local Λ[Δ_Q]-algebra (printed with A(Λ,χ,Q)). Then there are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 := _{Δ_Q}T^{S∪Q,Λ_1}(A(μ,χ,Q)_{𝔫^Q} ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) is the image of P_v(X) (printed: v ∉ S and f_{𝒮_χ} ∘ ρ_{𝒮_χ}). (Proof: the Λ-algebra map as in Prop. 6.6.7; Λ[Δ_Q]-linearity as in Prop. 6.5.11 via T^{S∪Q,ord}_Q(A(μ,χ,Q) ⊗ 𝒪(ν + w_0^G μ)^{-1})_{𝔫^Q}.)

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Construct the ordinary deformation–Hecke map at the auxiliary levels with one exponent δ.

2. Compare local character restrictions to diamond operators exactly as in Proposition 6.5.11; pass to the weight-independent Λ[Δ_Q] action.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.3/ordinary-deformation-hecke-map](#ordinary-deformation-hecke-map), [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), `AutomorphicGaloisRepresentationsPartII:AG2.5`, `LocalGaloisDeformationRings:L8`, `GlobalGaloisDeformations:G8`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, Proposition 6.6.9 and the preceding paragraph, pp. 1079–1080. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-patching-verification"></a>

### Theorem: The Taylor–Wiles patching data for Theorem 6.6.2 (ordinary case)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-patching-verification`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_patching_verification`.

Let f: R_{𝒮_1} → 𝒪 classify ρ. Set q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 = a power series ring over Λ (the weight algebra) in n²|S| − 1 variables, S_∞ = 𝒯⟦Δ_∞⟧, augmented over Λ with ideal 𝔞_∞. Choose χ = ∏_{v∈R} χ_v: ∏_{v∈R} Iw_v → 𝒪^× with χ_{v,1},…,χ_{v,n}: k(v)^× → 𝒪^× trivial mod ϖ and pairwise distinct. R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ} (§6.2.22; printed with 𝒮_1^{ord}, 𝒮_χ^{ord}); R_∞, R′_∞ = power series rings in g variables over them. Applying §6.4.2 to the complexes A(μ,χ,Q_N)_{𝔫^{Q_N}} ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1} (and χ = 1), for Taylor–Wiles data from Proposition 6.2.33, gives: bounded complexes 𝒞_∞, 𝒞′_∞ of free S_∞-modules, T_∞, T′_∞ with nilpotent I_∞, I′_∞ (I^δ = 0), S_∞-algebra structures on R_∞, R′_∞ and surjections R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞; surjections of local Λ-algebras R_∞/𝔞_∞ ↠ R_{𝒮_1}, R′_∞/𝔞_∞ ↠ R_{𝒮_χ}; and isomorphisms 𝒞_∞ ⊗^L_{S_∞} S_∞/𝔞_∞ ≅ A(μ,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1} = B(μ,1)_𝔪 and 𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ B(μ,χ)_𝔪 in D(Λ).

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Use the ordinary finite-level dual complexes with the ν+w₀μ twist and the imported enormous Taylor–Wiles presentations.

2. Verify uniform minimal ranks, compatible mod-varpi reductions, common Hecke images and the fixed-ultrafilter P8 hypotheses.

3. Identify the augmentation of C∞ with B(μ,1)_m and of C∞′ with B(μ,χ)_m.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.4/ordinary-diamond-augmentation](#ordinary-diamond-augmentation), [PA.4/ordinary-diamond-linear-hecke-map](#ordinary-diamond-linear-hecke-map), [PA.4/weight-independent-hida-twist](#weight-independent-hida-twist), `mathlib:DerivedCategory`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes`, `GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `GlobalGaloisDeformations:G7`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-support-at-lifting-point"></a>

### Theorem: Support of B(μ,1)_𝔪 at the point ker f (key step of Theorem 6.6.2)

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-support-at-lifting-point`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_support_at_lifting_point`.

In the situation of the previous item: Lemma 6.2.27(1),(2) give Assumption 6.3.6(1),(2) for R_∞, R′_∞ (the dimension equality dim R_∞ = dim S_∞ − ℓ_0 needs g = qn − n²[F⁺:ℚ]; printed g = qn − n[F⁺:ℚ]). For 𝔭 = the preimage in S_∞ of Ann_Λ(𝒪(ν + w_0^G μ)^{-1}), Corollary 6.6.6 gives (𝒞_∞ ⊗^L S_∞/𝔭)[1/p] ≅ (B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G μ)^{-1})[1/p], whose cohomology is a quotient of Hom_E(H^{d−*}(X_{K(1,1)}, 𝒱_μ)_𝔪[1/p], E); π contributes, so by Theorem 2.4.10 it is nonzero and concentrated in [q_0, q_0 + ℓ_0] (Assumption 6.3.6(3)). Let x ∈ Spec R_∞ be the preimage of ker f and y its contraction to S_∞ (the preimage of Ann_Λ(𝒪(ν + w_0^G λ)^{-1})). The inertial characters on the diagonal of ρ|_{G_{F_v}} are pairwise distinct for v ∈ S_p, so x lies on a maximal-dimensional component of Spec R_∞ (Lemma 6.2.27(3)), and Corollary 6.3.9 gives ker f ∈ Supp H^*(B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G λ)^{-1})[1/p]; by Corollary 6.6.6, ker f ∈ Supp H^*(A_1(λ,1,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G λ)^{-1})[1/p] (printed A(λ,1,1)), a quotient of Hom_E(H^{d−*}(X_{K(1,1)}, 𝒱_λ)_𝔪, 𝒪(ν + w_0^G λ)^{-1}[1/p]).

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. Verify the ordinary local-ring dimension and generic component hypotheses using L7/L8 and R08.2.

2. Apply P9 support after specialization at the O-point ker f, and then apply Hida weight specialization at λ.

3. Conclude support at that point only; the source does not claim full support on every ordinary component.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.4/ordinary-patching-verification](#ordinary-patching-verification), [PA.4/patched-arithmetic-mod-varpi-comparison](#patched-arithmetic-mod-varpi-comparison), [PA.3/arithmetic-derived-support-contract](#arithmetic-derived-support-contract), [PA.4/hida-weight-specialization](#hida-weight-specialization), `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:L8`, `LocalGaloisDeformationRings:R08.2`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-lifting-at-good-level"></a>

### Theorem: Theorem 6.6.2: ordinary automorphy lifting under the §6.6.1 hypotheses

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-at-good-level`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_lifting_at_good_level`.

Under (1)–(15) of §6.6.1, let ρ: G_F → GL_n(Q̄_p) be continuous and λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)} such that: (1) ρ̄ ≅ r̄_ι(π); (2) for each v | p, ρ|_{G_{F_v}} is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n}, where ψ_{v,i} agrees on the whole inertia group I_{F_v} with σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}; (3) for each v | p, each i and each p-power root of unity x ∈ 𝒪_{F_v}: ∏_{τ∈Hom(F_v,Q̄_p)} τ(x)^{λ_{τ,n+1−i} − μ_{ιτ,n+1−i}} = 1; (4) ρ unramified at finite v ∉ S; (5) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ is ordinarily automorphic of weight ιλ: there is an ι-ordinary cuspidal automorphic Π of GL_n(𝔸_F) of weight ιλ with ρ ≅ r_ι(Π), and Π_v is unramified for every finite v ∉ S. (No analogue of Theorem 6.5.4 is proved, because the irreducible components of the 𝒟^{det,ord} lifting rings are not understood well enough.)

**Additional hypotheses:** ordinary-good-level: every one of the fifteen hypotheses in the packet contexts applies, together with the additional hypotheses in this statement.

**Construction or proof:**

1. The full flag and whole-inertia characters identify rho with the point f of the ordinary global ring.

2. Use the ordinary patching verification and support at f; specialize Hida weight to λ.

3. Apply automorphic realization to the ordinary cohomology eigensystem.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.4/ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point), `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.1, Theorem 6.6.2, p. 1075; proof pp. 1080–1081. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-lifting-descent"></a>

### Theorem: Proof of Theorem 6.1.1: reduction to Corollary 6.5.5 by soluble base change

**Node:** `PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-descent`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_lifting_descent`.

Let F, ρ, π, λ, ι satisfy the hypotheses of Theorem 6.1.1 ((1) ρ unramified almost everywhere; (2) ρ|_{G_{F_v}} crystalline for v | p, p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) enormous; (4) some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, p > n²; (5) π cuspidal regular algebraic of weight λ with λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n, ρ̄ ≅ r̄_ι(π), HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}}, π_v unramified for v | p). The totally real case reduces to the imaginary CM case by base change (no details given). For imaginary F: choose V_0, V_1, V_2 and a soluble CM E/F as in the next two items and auxiliary places v_0, v′_0 so that §6.5.1 (1)–(17) hold for E, π_E and S = S′ ∪ {v_0, v′_0}; Corollary 6.5.5 for ρ|_{G_E} and Proposition 6.5.13(2) give a cuspidal regular algebraic Π of GL_n(𝔸_F) of weight λ with ρ ≅ r_ι(Π), with Π_{E,w} unramified for w ∉ S; unramifiedness of Π_v at finite v ∤ p where ρ and π are unramified follows from the Varma argument (item 274). (The claim Π_v unramified for v | p in Theorem 6.1.1 is not addressed explicitly; it follows from Π_{E,w} unramified for w | p and p unramified in E.)

**Construction or proof:**

1. Apply the E₀E_aE_bE_c checklist and choose v₀,v₀′ to satisfy all seventeen good-level hypotheses.

2. Apply Corollary 6.5.5 over E.

3. Use unpolarized soluble automorphic descent, local-global compatibility and the local unramified-level comparison to descend Π to F.

4. For v|p, the good-level lifting theorem gives Π_{E,w} unramified and the FL checklist makes E_w/F_v unramified. Thus I_{E_w}=I_{F_v}; the all-place local base-change comparison descends unramifiedness. For v∤p use the specified split test primes, finite-inertia comparison and Varma, rather than that inertia equality for ramified extensions.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.5/fontaine-laffaille-base-change-fields](#fontaine-laffaille-base-change-fields), [PA.4/neatness-auxiliary-places](#neatness-auxiliary-places), [PA.4/fontaine-laffaille-lifting-at-good-level](#fontaine-laffaille-lifting-at-good-level), `PotentialAutomorphyInfrastructurePartII:PL.0`, `ModularityAndLanglandsExtensions:ML.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-lifting-descent"></a>

### Theorem: Proof of Theorem 6.1.2: reduction to Theorem 6.6.2 by soluble base change

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-descent`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_lifting_descent`.

Let F, ρ, λ, π, ι satisfy Theorem 6.1.2 ((1) ρ unramified almost everywhere; (2) for v | p, ρ|_{G_{F_v}} potentially semistable and ordinary of regular weight λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)}: upper triangular with diagonal ψ_{v,i} agreeing with σ ↦ ∏_τ τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)} on an open subgroup of I_{F_v}; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) enormous, some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, p > n; (4) π regular algebraic cuspidal and ι-ordinary with r̄_ι(π) ≅ ρ̄). The totally real case reduces to the imaginary CM case by base change (no details given). For imaginary F choose V_0, V_1, V_2, the ordinary-variant extension E (next item) and auxiliary places v_0, v′_0 so that (1)–(15) of §6.6.1 hold for E, π_E, S; Theorem 6.6.2 applied to ρ|_{G_E} gives an ι-ordinary cuspidal Π_E of weight λ_E with r_ι(Π_E) ≅ ρ|_{G_E}; Proposition 6.5.13(2) and [Ger19, Lem. 5.7] descend it to an ι-ordinary cuspidal regular algebraic Π of GL_n(𝔸_F) of weight λ with r_ι(Π) ≅ ρ; Π_{E,w} is unramified for w ∉ S, and Π_v is unramified at finite v ∤ p where ρ and π are unramified (Varma argument, item 274).

**Construction or proof:**

1. Use the ordinary E₀E_aE_bE_c checklist, including residual triviality at p, the large local degree and the p-power-root character condition.

2. Apply Theorem 6.6.2 over E.

3. Use soluble ordinary base change/descent with the retained character normalization to descend the ordinarily automorphic conclusion to F.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.5/ordinary-base-change-fields](#ordinary-base-change-fields), [PA.4/neatness-auxiliary-places](#neatness-auxiliary-places), [PA.4/ordinary-lifting-at-good-level](#ordinary-lifting-at-good-level), `PotentialAutomorphyInfrastructurePartII:PL.0`, `ModularityAndLanglandsExtensions:ML.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.10, proof of Theorem 6.1.2, pp. 1081–1084. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-automorphy-lifting"></a>

### Theorem: Theorem 6.1.1: automorphy lifting in the Fontaine–Laffaille case

**Node:** `PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-automorphy-lifting`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_automorphy_lifting`.

Let F be an imaginary CM or totally real field, c ∈ Aut(F) complex conjugation, p a prime, and ρ : G_F → GL_n(ℚ̄_p) continuous with: (1) ρ unramified almost everywhere; (2) ρ|_{G_{F_v}} crystalline for every v | p, and p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic (Definition 4.3.1), and ρ̄(G_{F(ζ_p)}) enormous (Definition 6.2.29); (4) there is σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and p > n²; (5) there is a cuspidal automorphic π of GL_n(𝔸_F) with (a) π regular algebraic of weight λ satisfying λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n for all τ; (b) an isomorphism ι : ℚ̄_p → ℂ with ρ̄ ≅ r̄_ι(π) and HT_τ(ρ) = {λ_{ιτ,1} + n − 1, λ_{ιτ,2} + n − 2, …, λ_{ιτ,n}} for every τ : F ↪ ℚ̄_p; (c) π_v unramified for every v | p. Then ρ is automorphic: ρ ≅ r_ι(Π) for a cuspidal automorphic Π of GL_n(𝔸_F) of weight λ; moreover Π_v is unramified at every finite v with v | p or with ρ and π both unramified at v. (Remark 6.1.4, folded here: the image of Pρ̄ equals that of ad ρ̄, so the first half of (4) is equivalent to ζ_p ∉ F̄^{ker ad ρ̄}; when p is unramified in F it follows from the non-existence of a surjection (ad ρ̄)(G_F) ↠ (ℤ/pℤ)^×.)

**Construction or proof:**

1. For n=1 use the class-field/Hecke-character correspondence.

2. For totally real F make the controlled imaginary CM base change with the required splitting and disjointness, and descend using soluble base change.

3. For n≥2 over CM use the corresponding good-level reduction and lifting theorem: Corollary 6.5.5 through the FL field checklist.

4. Read the stated unramified places using rational local-global compatibility, rather than inferring unramified descent from a ramified field extension.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.4/fontaine-laffaille-lifting-descent](#fontaine-laffaille-lifting-descent), `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `GlobalGaloisDeformations:G7`, `ModularityAndLanglandsExtensions:ML.1`, `PotentialAutomorphyInfrastructurePartII:PL.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.1, Theorem 6.1.1 and Remark 6.1.4, pp. 1029–1030. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-automorphy-lifting"></a>

### Theorem: Theorem 6.1.2: ordinary automorphy lifting

**Node:** `PotentialAutomorphyInfrastructure:PA.4/ordinary-automorphy-lifting`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_automorphy_lifting`.

Let F be an imaginary CM or totally real field, c complex conjugation, p a prime, and ρ : G_F → GL_n(ℚ̄_p) continuous with: (1) ρ unramified almost everywhere; (2) for every v | p, ρ|_{G_{F_v}} is potentially semistable and ordinary with regular Hodge–Tate weights: there is λ ∈ (ℤ^n_+)^{Hom(F,ℚ̄_p)} such that for each v | p, ρ|_{G_{F_v}} ∼ an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n} : G_{F_v} → ℚ̄_p^×, where ψ_{v,i} agrees on an open subgroup of I_{F_v} with σ ↦ ∏_{τ ∈ Hom(F_v, ℚ̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}; (3) ρ̄ absolutely irreducible and decomposed generic, and ρ̄(G_{F(ζ_p)}) enormous; (4) there is σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and p > n; (5) there are a regular algebraic cuspidal automorphic π of GL_n(𝔸_F) and ι : ℚ̄_p → ℂ with π ι-ordinary and r̄_ι(π) ≅ ρ̄. Then ρ is ordinarily automorphic of weight ιλ: ρ ≅ r_ι(Π) for an ι-ordinary cuspidal automorphic Π of GL_n(𝔸_F) of weight ιλ; for finite v ∤ p with ρ and π unramified at v, Π_v is unramified. (Remark 6.1.3, folded here: the existence of Π forces λ to be conjugate self-dual up to twist, λ_{τ,i} + λ_{τc,n+1−i} = w for some w ∈ ℤ, by Clozel's purity lemma [Clo90, Lem. 4.9]; this is not assumed. The proof shows ρ contributes to the ordinary part of completed cohomology and gets Π by 'independence of weight'.)

**Construction or proof:**

1. For n=1 use the class-field/Hecke-character correspondence.

2. For totally real F make the controlled imaginary CM base change with the required splitting and disjointness, and descend using soluble base change.

3. For n≥2 over CM use the corresponding good-level reduction and lifting theorem: Theorem 6.6.2 through the ordinary field checklist.

4. Read the stated unramified places using rational local-global compatibility, rather than inferring unramified descent from a ramified field extension.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** [PA.4/ordinary-lifting-descent](#ordinary-lifting-descent), `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `GlobalGaloisDeformations:G7`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `ModularityAndLanglandsExtensions:ML.1`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.1, Theorem 6.1.2 and Remark 6.1.3, pp. 1029–1030. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

**Stage acceptance:** Run every definition’s small-case and non-example tests above, compare all degree shifts and character normalizations to the cited source, and fulfil every listed supplier contract used by the stage. A recorded gap remains a failed closure obligation; passing the structural packet checker does not discharge it.

## PA.5. Compatible systems and reusable transport

PA.5 imports the compatible-system carrier, weak/very/extremely weak variants, member/strong irreducibility predicates and general operations from R24.5. It owns the rank-two transport consequences, the field/image-preservation checklists and weak automorphy of level prime to a finite set T. The definition requires the matching polynomial at every v in T, as well as all but finitely many good places; enlarging the bad set to hide T fails its acceptance tests.

The rank-two dichotomy and trichotomy apply to the extremely weak systems in ACC. They do not inherit missing rank-one or monodromy hypotheses from a theorem stated only for stronger weak systems. The large-image conclusion contains a conjugate of SL₂(F_l) over the normal closure on a density-one set of rational primes. BCGP’s stronger printed residue-field assertion is false: a quartic twist of a non-CM elliptic-curve system with coefficient field Q(i), at l≡3 mod 4, still has projective image inside PGL₂(F_l), not the required PSL₂(F_{l²}). The real-multiplication use needs a separate argument from the abelian-surface owner.

Qian’s symmetric-power avoidance is an application with m=n−1. The final genericity lemma must use the original pair F,F₁; intermediate Galois replacements are confined to the adjoint-image proof. AG2.7 supplies the existential completely split generic witness. Goursat is a checked baseline declaration, while the remaining finite projective-group inputs are proof leaves. Purity upgrades weak automorphy using Chebotarev, the all-place Weil–Deligne semisimplification comparison and irreducibility of the pure principal series. The density-one crystallinity and large-image sets are intersected, rather than asserting either property for every prime. Symmetric-power transport computes Hodge–Tate multisets and determinant exponents using the general operation owner; a nonregular symmetric power does not acquire automorphy merely by applying that operation.

**Coverage:** planned. **Remaining:** Fulfil R24.5 extremely weak rank-one and monodromy leaves, finite projective-group inputs and AG2.5 purity/local comparison; supply arithmetic weak-automorphy signatures and the separate downstream RM large-image argument.

**Planets:** Rank-two trichotomy; Rank-two large residual image; Symmetric-power genericity; Symmetric-power avoidance; Weak automorphy prime to a set; Pure weak automorphy upgrade.

**Declaration inventory:** [split-test-prime-image-preservation](#split-test-prime-image-preservation), [fontaine-laffaille-base-change-fields](#fontaine-laffaille-base-change-fields), [ordinary-base-change-fields](#ordinary-base-change-fields), [rank-two-reducibility-dichotomy](#rank-two-reducibility-dichotomy), [rank-two-system-trichotomy](#rank-two-system-trichotomy), [rank-two-adjoint-monodromy](#rank-two-adjoint-monodromy), [rank-two-large-residual-image](#rank-two-large-residual-image), [simple-galois-composita](#simple-galois-composita), [symmetric-power-adjoint-genericity](#symmetric-power-adjoint-genericity), [qian-symmetric-power-avoidance](#qian-symmetric-power-avoidance), [genericity-normal-closure-restriction](#genericity-normal-closure-restriction), [residual-lifting-hypothesis-restriction](#residual-lifting-hypothesis-restriction), [weak-automorphy-prime-to-set](#weak-automorphy-prime-to-set), [pure-weak-automorphy-upgrade](#pure-weak-automorphy-upgrade), [density-one-crystalline-large-image](#density-one-crystalline-large-image), [rank-two-symmetric-power-transport](#rank-two-symmetric-power-transport), [rank-two-weight-zero](#rank-two-weight-zero), [rank-two-odd](#rank-two-odd), [rank-two-member-irreducibility-equivalence](#rank-two-member-irreducibility-equivalence), [strong-irreducibility-symmetric-square](#strong-irreducibility-symmetric-square), [corrected-rank-two-large-image](#corrected-rank-two-large-image).

<a id="split-test-prime-image-preservation"></a>

### Theorem: V_0∪V_1∪V_2-split extensions preserve the residual hypotheses

**Node:** `PotentialAutomorphyInfrastructure:PA.5/split-test-prime-image-preservation`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.split_test_prime_image_preservation`.

Let F be imaginary CM, ρ̄ absolutely irreducible with ρ̄(G_{F(ζ_p)}) enormous and some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and K/F(ζ_p) the extension cut out by ρ̄|_{G_{F(ζ_p)}}. Choose finite sets of finite places: V_0, all split in F(ζ_p), such that for each subfield F(ζ_p) ⊊ K′ ⊆ K some v ∈ V_0 splits in F(ζ_p) but not in K′; V_1 such that for each subfield F ⊊ K′ ⊆ K some v ∈ V_1 does not split in K′ (printed 'proper subfield K/K′/…'); V_2 = the p_0-adic places for a rational prime p_0 ≠ p that is decomposed generic for ρ̄; and v ∤ 2p with ρ, π unramified at every v ∈ V_0 ∪ V_1 ∪ V_2. Then for every finite Galois E/F in which all places of V_0 ∪ V_1 ∪ V_2 split: ρ̄(G_E) = ρ̄(G_F) and ρ̄(G_{E(ζ_p)}) = ρ̄(G_{F(ζ_p)}); hence ρ̄|_{G_{E(ζ_p)}} has enormous image, some σ ∈ G_E − G_{E(ζ_p)} has ρ̄(σ) scalar, and ρ̄|_{G_E} is decomposed generic (p_0 splits in E). (Used verbatim in §6.6.10.)

**Construction or proof:**

1. Use completely split test primes for every proper subextension of the residual/cyclotomic normal closures.

2. Splitting V₀,V₁ preserves the residual images and the scalar element outside cyclotomic; splitting V₂ preserves the fixed generic witness.

3. Keep the original fields and normal closures in these disjointness checks.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/genericity-normal-closure-restriction](#genericity-normal-closure-restriction), [PA.5/residual-lifting-hypothesis-restriction](#residual-lifting-hypothesis-restriction), `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.12, proof of Theorem 6.1.1, p. 1072 (and §6.6.10, p. 1082). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="fontaine-laffaille-base-change-fields"></a>

### Theorem: The soluble CM extension E = E_0·E_a·E_b·E_c (Fontaine–Laffaille case)

**Node:** `PotentialAutomorphyInfrastructure:PA.5/fontaine-laffaille-base-change-fields`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.fontaine_laffaille_base_change_fields`.

Let E_0/F be a soluble CM extension such that: all places of V_0 ∪ V_1 ∪ V_2 split and p is unramified in E_0; π_{E_0,w}^{Iw_w} ≠ 0 for every finite w; at every finite prime-to-p w, either π_{E_0,w} and ρ|_{G_{E_0,w}} are both unramified, or ρ|_{G_{E_0,w}} is unipotently ramified, q_w ≡ 1 mod p and ρ̄|_{G_{E_0,w}} is trivial; every w̄ | p of E_0⁺ splits in E_0 and admits w̄′ ≠ w̄, w̄′ | p, with Σ_{w̄″≠w̄,w̄′} [E⁺_{0,w̄″}:ℚ_p] > ½[E_0⁺:ℚ]. Choose imaginary quadratic E_a, E_b, E_c with: every rational prime below V_0 ∪ V_1 ∪ V_2 splits in E_aE_bE_c and p is unramified in E_aE_bE_c; 2 and p split in E_a; every l ∉ {2,p} below a place of E_0 where π_{E_0} or ρ ramifies, or ramified in E_0E_aE_c, splits in E_b; every l ∉ {2,p} ramified in E_b splits in E_c (e.g. E_b = ℚ(√−p_b) with p_b ≡ 1 mod 4 and p_b ≡ −1 mod each such l, E_c = ℚ(√−p_c) with p_c ≡ 1 mod 4p_b, p_c ≠ p and p_b ≠ p; also impose p_b ≡ p_c ≡ −1 mod each rational prime below V_0∪V_1∪V_2; quadratic reciprocity shows p_c splits in E_b). Then E = E_0E_aE_bE_c is a soluble CM extension of F, split at V_0 ∪ V_1 ∪ V_2, with: p unramified in E; for R = {prime-to-p w: π_{E,w} or ρ|_{G_{E_w}} ramified}, S_p the p-adic places and S′ = S_p ∪ R, every prime below S′ or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|_{G_{E_w}} trivial and q_w ≡ 1 mod p for w ∈ R; ρ̄|_{G_{E(ζ_p)}} enormous, ρ̄|_{G_E} decomposed generic, some σ ∈ G_E − G_{E(ζ_p)} with ρ̄(σ) scalar; and the E⁺-analogue of the p-adic degree condition.

**Construction or proof:**

1. First make the soluble CM extension E₀ with prescribed unramified p-completions and local semistable/Iwahori conditions.

2. Adjoin E_a where p and 2 split, then choose E_b and E_c by quadratic congruences so each bad rational prime splits in an imaginary quadratic subfield.

3. Keep V₀∪V₁∪V₂ split at every step; verify all seventeen FL patching hypotheses and the local degree inequality.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/split-test-prime-image-preservation](#split-test-prime-image-preservation), `PotentialAutomorphyInfrastructurePartII:PL.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.5.12, proof of Theorem 6.1.1, pp. 1072–1073. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="ordinary-base-change-fields"></a>

### Theorem: The soluble CM extension E = E_0·E_a·E_b·E_c (ordinary case)

**Node:** `PotentialAutomorphyInfrastructure:PA.5/ordinary-base-change-fields`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.ordinary_base_change_fields`.

Let E_0/F be a soluble CM extension such that: all places of V_0 ∪ V_1 ∪ V_2 split in E_0; π_{E_0,w}^{Iw_w} ≠ 0 for every finite w; at each finite prime-to-p w, either π_{E_0,w} and ρ|_{G_{E_0,w}} are unramified, or ρ|_{G_{E_0,w}} is unipotently ramified, q_w ≡ 1 mod p and ρ̄|_{G_{E_0,w}} trivial; for w | p, ρ̄|_{G_{E_0,w}} is trivial and [E_{0,w}:ℚ_p] > n(n+1)/2 + 1; for v | p, w | v and each i, ψ_{v,i} agrees with σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)} on all of I_{E_0,w}; and, with μ the weight of π_{E_0}, ψ_{v,i}(Art_{E_0,w}(x)) · ∏_{τ∈Hom(E_{0,w},Q̄_p)} τ(x)^{μ_{ιτ,n−i+1}+i−1} = 1 for every w | p and every p-power root of unity x ∈ E_{0,w}. Choose imaginary quadratic E_a, E_b, E_c as in the FL case but without requiring p unramified (p_c ≡ 1 mod 4p_b and p_b ≡ p_c ≡ −1 mod every rational prime below V_0∪V_1∪V_2). Then E = E_0E_aE_bE_c is soluble CM, V-split, and: every prime below S′ = S_p ∪ R or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|_{G_{E_w}} trivial and q_w ≡ 1 mod p for w ∈ R; ρ̄|_{G_{E(ζ_p)}} enormous, ρ̄|_{G_E} decomposed generic, some σ ∈ G_E − G_{E(ζ_p)} with ρ̄(σ) scalar; ρ̄|_{G_{E_w}} trivial and [E_w:ℚ_p] > n(n+1)/2 + 1 for w | p; and the base change π_E (Prop. 6.5.13) is ι-ordinary by [Ger19, Lem. 5.7].

**Construction or proof:**

1. Make E₀ with trivial residual representations at p, degree > n(n+1)/2+1, whole-inertia algebraic characters and the p-power-root condition.

2. Choose E_a,E_b,E_c with the ordinary congruence constraints, keeping V split.

3. Check all fifteen ordinary patching hypotheses; preserve ordinary automorphic base change by the supplier’s Geraghty-normalized theorem.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/split-test-prime-image-preservation](#split-test-prime-image-preservation), `PotentialAutomorphyInfrastructurePartII:PL.0`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.6.10, proof of Theorem 6.1.2, pp. 1082–1084. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-reducibility-dichotomy"></a>

### Theorem: Lemma 7.1.1: rank-2 systems are irreducible at every λ or split as a sum of compatible characters

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-reducibility-dichotomy`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.rank_two_reducibility_dichotomy`.

If R is an extremely weakly compatible system of rank 2, then either r_λ is irreducible for every λ, or there are weakly compatible systems (in the sense of BLGGT) 𝒳_1, 𝒳_2 of rank 1 with r_λ ≅ χ_{1,λ} ⊕ χ_{2,λ} for every λ.

**Construction or proof:**

1. If one member is reducible, its two characters vary in a compatible abelian family by the rank-one character theorem.

2. Use Chebotarev and semisimplicity to match every member to the same two character systems; retain coefficient-field enlargement.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `PotentialModularityAndCompatibleSystems:R24.5/character-system`, `PotentialModularityAndCompatibleSystems:R24.5/artin-system`, `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, Lemma 7.1.1, p. 1086. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-system-trichotomy"></a>

### Theorem: Lemma 7.1.2: trichotomy for irreducible rank-2 systems (strongly irreducible, Artin up to twist, or induced)

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-system-trichotomy`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.rank_two_system_trichotomy`.

Let R be an irreducible extremely weakly compatible system of rank 2. Then either (1) R is strongly irreducible; or (2) R is Artin up to twist; or (3) there are a quadratic extension F'/F and a weakly compatible system 𝒳 of characters of G_{F'} with R ≅ Ind_{G_{F'}}^{G_F} 𝒳 (R is then called induced).

**Construction or proof:**

1. If an irreducible member becomes reducible after finite extension, apply Clifford theory.

2. The restriction is either a sum of two characters (quadratic induction), or an isotypic character (finite projective image, hence Artin up to a compatible character twist).

3. Use the rank-two dichotomy and Chebotarev to propagate the decomposition to the entire system.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/rank-two-reducibility-dichotomy](#rank-two-reducibility-dichotomy), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `PotentialModularityAndCompatibleSystems:R24.5/character-system`, `PotentialModularityAndCompatibleSystems:R24.5/artin-system`, `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, Lemma 7.1.2, pp. 1086–1087. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-adjoint-monodromy"></a>

### Theorem: Unramified connected subgroups of products of Res PGL_2 (facts (1)–(8) in the proof of Lemma 7.1.3)

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-adjoint-monodromy`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.rank_two_adjoint_monodromy`.

Over Q̄_l: (1) every morphism PGL_2 → PGL_2 is trivial or conjugation by an element of PGL_2(Q̄_l); (2) every morphism PGL_2^r → PGL_2 is trivial or a projection followed by a conjugation; (3) up to PGL_2(Q̄_l)^J-conjugacy, morphisms PGL_2^I → PGL_2^J are induced by pairs (J_0 ⊂ J, φ : J_0 → I); (4) Aut(PGL_2^I) = PGL_2^I ⋊ S_I; (5) a connected algebraic subgroup G ⊂ PGL_2^J surjecting onto PGL_2 under every projection is ≅ PGL_2^I, embedded (up to conjugacy) through a surjection φ : J ↠ I (induction on #J and Goursat); (6) for M/Q_l finite, (Res^M_{Q_l} PGL_2)_{Q̄_l} ≅ PGL_2^{Hom_{Q_l}(M,Q̄_l)} with G_{Q_l} acting through its left action on Hom_{Q_l}(M, Q̄_l); (7) forms of PGL_2^r are classified by the middle term of H^1(Q_l, PGL_2^r) → H^1(Q_l, Aut PGL_2^r) → H^1(Q_l, S_r), and the unramified ones (quasi-split and split over an unramified extension) are exactly ∏_i Res^{N_i}_{Q_l} PGL_2 with N_i/Q_l unramified; (8) hence, if G ⊂ ∏_{j∈J} Res^{M_j}_{Q_l} PGL_2 is an unramified connected subgroup whose base change to Q̄_l surjects onto every factor of PGL_2^{⊔_j Hom(M_j,Q̄_l)}, then G ≅ ∏_{i∈I} Res^{N_i}_{Q_l} PGL_2 with N_i/Q_l unramified, and each (j, τ)-projection of G_{Q̄_l} is PGL_2(Q̄_l)-conjugate to the projection onto one factor of ∏_i (Res^{N_i}_{Q_l} PGL_2)_{Q̄_l}.

**Construction or proof:**

1. Use connected subdirect products of the Res PGL₂ factors and Goursat to identify diagonal factors.

2. Unramified splitting of the relevant field forms and the density-one hyperspecial maximality theorem control reduction.

3. Pass from adjoint factors to the rank-two derived image; this node is the arithmetic rank-two application, not a second general Goursat theorem.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/simple-galois-composita](#simple-galois-composita), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, proof of Lemma 7.1.3, facts (1)–(8), pp. 1088–1089. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-large-residual-image"></a>

### Theorem: Lemma 7.1.3: residual irreducibility and large residual image for irreducible rank-2 systems

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-large-residual-image`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.rank_two_large_residual_image`.

Let R be an irreducible extremely weakly compatible system of rank 2. Then for all rational primes l in a set of Dirichlet density 1 and all λ | l, r̄_λ is absolutely irreducible. If moreover R is neither induced nor Artin up to twist, and F̃ is the normal closure of F/Q, then l can in addition be taken so that r̄_λ(G_{F̃}) ⊇ SL_2(F_l) for all λ | l.

**Construction or proof:**

1. Apply the rank-two adjoint monodromy calculation and the Larsen–Pink/Larsen density-one maximality input in the extremely weak regime.

2. Maximality gives PSL₂(F_l) in each relevant adjoint factor; perfection and the rank-two lift give a conjugate of SL₂(F_l).

3. Discard finitely many l for which the fixed normal-closure group admits that simple quotient; restrict to G_{F̃}.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/rank-two-system-trichotomy](#rank-two-system-trichotomy), [PA.5/rank-two-adjoint-monodromy](#rank-two-adjoint-monodromy), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, Lemma 7.1.3, pp. 1087–1089. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="simple-galois-composita"></a>

### Theorem: Simple Galois composita in the transport argument

**Node:** `PotentialAutomorphyInfrastructure:PA.5/simple-galois-composita`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.simple_galois_composita`.

Let k be a field, Δ a finite simple group, and K_1, …, K_s finite Galois extensions of k inside a common field, each equal to k or with Galois group isomorphic to Δ. Then there is a subset J ⊂ {1, …, s} such that the compositum K = K_1⋯K_s is the compositum of the K_j with j ∈ J, and restriction identifies Gal(K/k) with ∏_{j∈J} Gal(K_j/k) ≅ Δ^{|J|}. In particular, for disjoint subsets I, I′ of J, the composita of the K_j over j ∈ I and over j ∈ I′ are linearly disjoint over k.

**Construction or proof:**

1. Induct on the number of fields and restrict the compositum Galois group to its factors.

2. Apply Mathlib Subgroup.goursat_surjective; simplicity makes a new factor either independent or already redundant.

3. Choose a maximal independent subfamily; restriction identifies the compositum Galois group with its product, giving disjointness of disjoint subfamilies.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** `mathlib:Subgroup.goursat_surjective`.

**Source:** [qian](https://par.nsf.gov/servlets/purl/10388233), Proof of Lemma 2.6(2), pp. 1251–1252 (the claims 'Gal(Ẽ/E) = (Z/2Z)^r' and 'Gal(F̃′_i/F̃′_{i−1}) … is of form Δ_i^m', both attributed to Goursat's lemma). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="symmetric-power-adjoint-genericity"></a>

### Theorem: Adjoint-image symmetric-power genericity

**Node:** `PotentialAutomorphyInfrastructure:PA.5/symmetric-power-adjoint-genericity`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.symmetric_power_adjoint_genericity`.

Let F/Q be finite with normal closure F̃, m a positive integer, l > 2m + 3 a prime, and r̄: G_F → GL_2(F̄_l) continuous with r̄(G_{F̃}) ⊃ SL_2(F_l). Let F′/F be a finite extension linearly disjoint from F̄^{ker r̄} over F, with normal closure F̃′ over Q. If ad r̄(G_{F̃′}) ⊃ PSL_2(F_l), then Sym^m r̄|_{G_{F′}} is decomposed generic.

**Construction or proof:**

1. Keep the original pair F,F′ in ACC Lemma 7.1.6(3). Pass to the normal closure of F′ and a harmless extension only inside its proof.

2. Use the simple-composita result to describe the projective normal closure as a product of PSL₂ factors.

3. Choose A with eigenvalue ratio α such that α^{±i}≠1 for 1≤i≤m. Chebotarev at (A,…,A) gives a completely split prime q≡1 mod l; all symmetric-power eigenvalue ratios avoid q.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/simple-galois-composita](#simple-galois-composita), `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `GlobalGaloisDeformations:G7`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 7.1.6(3), pp. 1090–1091. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="qian-symmetric-power-avoidance"></a>

### Theorem: Symmetric-power genericity under avoidance

**Node:** `PotentialAutomorphyInfrastructure:PA.5/qian-symmetric-power-avoidance`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.qian_symmetric_power_avoidance`.

Let F/Q be a finite extension with normal closure F̃, n a positive integer, l > 2n + 5 a prime, and r̄: G_F → GL_2(F̄_l) a continuous representation with r̄(G_{F̃}) ⊃ SL_2(F_l). Put H = F̃ · F̄^{ker ad r̄}, and let H′ be the normal closure of H over Q. Let F_1/F be a finite Galois extension that is linearly disjoint from F̄^{ker r̄} over F and linearly disjoint from H′ over F. Then Sym^{n−1} r̄|_{G_{F_1}} is decomposed generic. For n = 1 this is immediate, since Sym^0 r̄ is the trivial character; for n ≥ 2 the proof rests on ACC+ Lemma 7.1.6(3) with m = n − 1.

**Construction or proof:**

1. For n=1 the symmetric power is the trivial character, and the pairwise-distinct ratio condition has no pairs.

2. For n≥2 use simple composita and Goursat in the normal-closure tower to prove the required adjoint image over F̃₁.

3. Apply ACC Lemma 7.1.6(3) with m=n−1 to the original F,F₁. The proof’s intermediate E,E₁ must not replace the original pair in that application.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/simple-galois-composita](#simple-galois-composita), [PA.5/symmetric-power-adjoint-genericity](#symmetric-power-adjoint-genericity), `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`.

**Source:** [qian](https://par.nsf.gov/servlets/purl/10388233), Lemma 2.6(2), p. 1251; proof pp. 1251–1252. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="genericity-normal-closure-restriction"></a>

### Theorem: Decomposed genericity under disjoint base change

**Node:** `PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.genericity_normal_closure_restriction`.

Let F be a number field and r̄: G_F → GL_n(F̄_l) continuous, absolutely irreducible and decomposed generic. Let K/Q be a Galois extension linearly disjoint over Q from the Galois closure over Q of F̄^{ker r̄}(ζ_l). Then r̄|G_{FK} is absolutely irreducible and decomposed generic. In the proof of Theorem 1.4 this is applied with K = L′LF^suff(ζ_N), which is Galois over Q with K ∩ F^avoid = Q, and FK = F′. The paper asserts the disjointness for F′ itself, which is impossible because both fields contain F (correction E3).

**Construction or proof:**

1. Let H be the normal closure over Q of F^{ker barρ}(ζ_l).

2. Disjointness gives Gal(HE/Q)=Gal(H/Q)×Gal(E/Q); choose the generic conjugacy class (σ,1).

3. Chebotarev supplies a rational prime completely split in FE with the original generic ratios; residual image surjectivity preserves absolute irreducibility.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`.

**Source:** [acc](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 7.1.7, p. 1091. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="residual-lifting-hypothesis-restriction"></a>

### Theorem: Residual lifting hypotheses under restriction

**Node:** `PotentialAutomorphyInfrastructure:PA.5/residual-lifting-hypothesis-restriction`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.residual_lifting_hypothesis_restriction`.

Let F be a number field, l a prime, r: G_F → GL_n(Q̄_l) continuous with residual representation r̄, and M = F^{ker r̄}(ζ_l). Let F'/F be a finite extension linearly disjoint from M over F. Then G_{F'} surjects onto Gal(M/F), so r̄(G_{F'}) = r̄(G_F) and r̄(G_{F'(ζ_l)}) = r̄(G_{F(ζ_l)}). Consequently: r̄|G_{F'} is absolutely irreducible if r̄ is; r̄(G_{F'(ζ_l)}) is enormous if r̄(G_{F(ζ_l)}) is; and if σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar, then some σ' ∈ G_{F'} − G_{F'(ζ_l)} has r̄(σ') = r̄(σ). If r is unramified almost everywhere, so is r|G_{F'}. Suppose r|G_{F_v} is potentially semistable and ordinary of weight λ_v (Definition 1.2). Then for each place w | v of F', r|G_{F'_w} is potentially semistable and ordinary of weight (λ_{v,τ'|F_v})_{τ'}, by the compatibility Art_{F_v} ∘ N_{F'_w/F_v} = (restriction) ∘ Art_{F'_w}. Decomposed genericity is not covered here; it needs ACC+ Lemma 7.1.7.

**Construction or proof:**

1. Disjointness from the residual-cyclotomic field makes the restricted finite quotient surjective.

2. Identify the full and cyclotomic residual images, lift the scalar coset, and preserve finite ramification.

3. Use Artin/norm compatibility to pull back each full ordinary flag and algebraic inertia exponent; decomposed genericity uses the separate normal-closure lemma.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The statement accepts non-polarized GL_n representations; neither a conjugate-self-duality assumption nor integral R=T is inserted. Check the n=1 character branch separately and retain the exact p-bound in the higher-rank branch.

**Direct prerequisites:** `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [qian](https://par.nsf.gov/servlets/purl/10388233), Remark after Definition 1.3, p. 1241; proof of Theorem 1.4, p. 1274 ('all conditions except decomposed genericity follows from the corresponding conditions of r̄'). Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="weak-automorphy-prime-to-set"></a>

### Definition: Weak automorphy prime to a finite set

**Node:** `PotentialAutomorphyInfrastructure:PA.5/weak-automorphy-prime-to-set`. **Proposed declaration:** `WeaklyAutomorphicPrimeTo`.

For T a finite set of finite places disjoint from S, R is weakly automorphic of level prime to T if there are a regular algebraic cuspidal π of GL_n(𝔸_F) and ι : M ↪ ℂ such that for all but finitely many v ∉ S and for every v ∈ T, π_v is unramified and rec^T_{F_v}(π_v)(Frob_v) has characteristic polynomial ι(Q_v(X)); weakly automorphic means T = ∅.

**Construction or proof:**

1. Use the R24.5 owner’s very weak system carrier, with its declared finite bad set S.

2. Quantify over an actual regular algebraic cuspidal representation and coefficient embedding; impose the Frobenius polynomial equality at all but finitely many good places and at every place of T.

3. Use T=∅ for weak automorphy; do not enlarge S to hide a member of T.

**Uses that determine the API:**

- Bianchi Lemma 6.1.4: Purity upgrades the almost-everywhere equality to every declared good place.

- ModularityAndLanglandsExtensions:ML.2: Tracks prescribed unramified places through potential automorphy.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `WeaklyAutomorphicPrimeTo.empty` | characterisation | At T=∅ this is weak automorphy. |
| `WeaklyAutomorphicPrimeTo.mono` | relation | For T′⊂T disjoint from S, a witness at T is a witness at T′. |
| `WeaklyAutomorphicPrimeTo.witness_at` | projection | Every v∈T is unramified for the witnessing π and has precisely the specified polynomial. |
| `WeaklyAutomorphicPrimeTo.automorphic_implies` | compatibility | An automorphic system is weakly automorphic prime to any finite T disjoint from S. |

**Unit tests:**

- `WeaklyAutomorphicPrimeTo.empty_set` (degenerate): An automorphic system is weakly automorphic prime to ∅.

- `WeaklyAutomorphicPrimeTo.singleton` (characterisation): At T={v₀}, a witness must match at v₀ even if v₀ lies in its finite almost-everywhere exception list.

- `WeaklyAutomorphicPrimeTo.bad_set` (non-example): T∩S≠∅ is inadmissible; no unspecified Q_v at a bad place can witness the predicate.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. An automorphic system is weakly automorphic prime to ∅. At T={v₀}, a witness must match at v₀ even if v₀ lies in its finite almost-everywhere exception list. T∩S≠∅ is inadmissible; no unspecified Q_v at a bad place can witness the predicate.

**Direct prerequisites:** `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [bianchi](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), Definition 6.1.2(3), author PDF p. 58. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="pure-weak-automorphy-upgrade"></a>

### Theorem: Pure weak automorphy is automorphy

**Node:** `PotentialAutomorphyInfrastructure:PA.5/pure-weak-automorphy-upgrade`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.pure_weak_automorphy_upgrade`.

Let F be CM and R a very weakly compatible system of rank n that is weakly automorphic, via π, and pure of weight m. Then R is automorphic.

**Construction or proof:**

1. Compare the witnessing π-system with R at one λ by Chebotarev and semisimplicity.

2. At a missing good v use Varma’s Weil–Deligne semisimplification compatibility.

3. Purity makes the unramified principal series with the specified Satake parameters irreducible; π_v is then unramified and matches Q_v.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/weak-automorphy-prime-to-set](#weak-automorphy-prime-to-set), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source:** [bianchi](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), Lemma 6.1.4, author PDF p. 59. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="density-one-crystalline-large-image"></a>

### Theorem: Density-one crystalline large-image primes

**Node:** `PotentialAutomorphyInfrastructure:PA.5/density-one-crystalline-large-image`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.density_one_crystalline_large_image`.

Let R be a strongly irreducible very weakly compatible system of rank 2 over a number field F. The set L(R) of primes l not lying below any place of S such that r_λ is crystalline with Hodge–Tate weights H_τ and r̄_λ(G_{F̃}) contains a conjugate of SL_2(𝔽_l) for every λ | l (F̃ the Galois closure of F/ℚ) has Dirichlet density 1.

**Construction or proof:**

1. Intersect the density-one crystalline/HT set in the very weak compatibility definition with the density-one residual-image set of ACC Lemma 7.1.3.

2. Discard the finitely many rational primes below S; the intersection still has Dirichlet density one.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/rank-two-large-residual-image](#rank-two-large-residual-image), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Source:** [bianchi](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), Lemma 6.1.5, author PDF p. 59. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-symmetric-power-transport"></a>

### Theorem: Rank-two symmetric-power comparison

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-symmetric-power-transport`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.rank_two_symmetric_power_transport`.

For a very weakly compatible system R of rank 2 with H_τ = {0, m}, Sym^{n−1}R has representations Sym^{n−1}r_λ, weights {0, m, …, (n − 1)m} and determinant det^{n(n−1)/2}. Here n≥1. Regularity follows when m≠0; for m=0 and n>1 the Hodge multiset has repetitions. No automorphy or purity is inferred from the operation alone.

**Construction or proof:**

1. Import the general symmetric-power operation from R24.5:operations.

2. On a diagonal matrix with eigenvalues a,b compute the n eigenvalues a^{n−1−i}b^i and their product (ab)^{n(n−1)/2}.

3. Apply the corresponding HT multiset formula and the declared good-place compatibility; track semisimplification.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. For n=3 and H={0,m}, H(Sym²)={0,m,2m} and det(Sym²)=(det r)^3.

**Direct prerequisites:** `mathlib:Matrix.charpoly`, `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [bianchi](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), §6.1–6.2 symmetric-power compatible systems; extraction item 145. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-weight-zero"></a>

### Definition: Rank-two weight zero

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-weight-zero`. **Proposed declaration:** `RankTwoWeightZero`.

For a rank-two compatible system with Hodge table H_τ, WeightZero means H_τ is the multiset {0,1} at every embedding τ. This is the BCGP automorphic-weight convention and differs from saying that the system is pure of weight 0. General system purity, regularity and strong irreducibility are imported from R24.5.

**Construction or proof:**

1. Read the actual rank-two Hodge table from the system owner.

2. Compare each multiset, retaining multiplicities and all embeddings.

**Uses that determine the API:**

- BCGP §9.1: Specifies the systems entering potentially modular abelian surfaces.

- Bianchi symmetric-power transport: Produces the arithmetic progression Hodge table for m=1.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `RankTwoWeightZero.iff` | characterisation | Weight zero means ∀τ,H_τ={0,1} as multisets. |
| `RankTwoWeightZero.sum` | relation | Every Hodge multiset has sum 1. |
| `RankTwoWeightZero.regular` | compatibility | Its two Hodge weights are distinct, so the rank-two system is regular. |
| `RankTwoWeightZero.restriction` | functoriality | Pulling the Hodge table back along restriction of embeddings preserves weight zero. |

**Unit tests:**

- `RankTwoWeightZero.standard` (computation): The constant table {0,1} has weight zero.

- `RankTwoWeightZero.repeated_zero` (non-example): The constant table {0,0} does not have weight zero.

- `RankTwoWeightZero.reversed` (compatibility): The table presented as {1,0} has weight zero because the weights are a multiset.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. The constant table {0,1} has weight zero. The constant table {0,0} does not have weight zero. The table presented as {1,0} has weight zero because the weights are a multiset.

**Direct prerequisites:** `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Source:** [bcgp](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), §9.1, definitions before Lemma 9.1.10, p. 251. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-odd"></a>

### Definition: Odd rank-two compatible systems

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-odd`. **Proposed declaration:** `RankTwoOdd`.

For a rank-two system over a number field F, Odd means det r_λ(c_v)=−1 for every real place v and every coefficient place λ, where c_v is the complex-conjugation involution. At a field with no real places the condition is vacuous. With the actual involutions supplied, it is the determinant condition on the corresponding matrices; it is not trace zero without a coefficient-characteristic restriction.

**Construction or proof:**

1. Use the system representations and the real-place decomposition-group involutions.

2. Take the determinant at each involution, with value −1 in its characteristic-zero coefficient field.

**Uses that determine the API:**

- BCGP §9.1: Pins the sign convention in the rank-two input.

- AbelianSurfacesPotentialModularity: Uses oddness of weight-zero systems.

**API:**

| Name | Role | Statement |
| --- | --- | --- |
| `RankTwoOdd.det_eq` | projection | For every real-place involution and coefficient member the determinant is −1. |
| `RankTwoOdd.conjugate` | functoriality | Changing the representative complex conjugation by conjugacy preserves the determinant equation. |
| `RankTwoOdd.no_real_places` | simp | If F has no real places the condition is true. |
| `RankTwoOdd.automorphic_weight_zero` | compatibility | The weight-zero cuspidal GL₂ system in BCGP’s setting is odd by the automorphic-system supplier. |

**Unit tests:**

- `RankTwoOdd.split_involution` (computation): diag(1,−1) is odd.

- `RankTwoOdd.identity` (non-example): The identity matrix over Q is not odd.

- `RankTwoOdd.empty_real_places` (degenerate): An empty real-place family satisfies the determinant condition.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion. diag(1,−1) is odd. The identity matrix over Q is not odd. An empty real-place family satisfies the determinant condition.

**Direct prerequisites:** `mathlib:Matrix.charpoly`, `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source:** [bcgp](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), §9.1 definitions before Lemma 9.1.10, p. 251. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="rank-two-member-irreducibility-equivalence"></a>

### Theorem: Rank-two member irreducibility equivalence

**Node:** `PotentialAutomorphyInfrastructure:PA.5/rank-two-member-irreducibility-equivalence`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.rank_two_member_irreducibility_equivalence`.

For a rank-two weakly compatible system R, the following are equivalent: R is irreducible on a density-one set of rational primes; every r_λ is irreducible; at least one r_λ is irreducible. The assertion follows from the stronger extremely weak rank-two reducibility dichotomy over the same F, not from the existing R24.5 result restricted to Q.

**Construction or proof:**

1. Apply the PA.5 rank-two reducibility dichotomy if any member is reducible.

2. The resulting two compatible characters make every member reducible, contradicting either irreducibility condition.

3. The all-member implication gives the density-one implication directly.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/rank-two-reducibility-dichotomy](#rank-two-reducibility-dichotomy), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Source:** [bcgp](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), Lemma 9.1.10(1), pp. 251–252. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="strong-irreducibility-symmetric-square"></a>

### Theorem: Strong irreducibility and symmetric square

**Node:** `PotentialAutomorphyInfrastructure:PA.5/strong-irreducibility-symmetric-square`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.strong_irreducibility_symmetric_square`.

For an irreducible regular rank-two weakly compatible system R, strong irreducibility of R, irreducibility of Sym²R as a system, irreducibility of every Sym²r_λ, and irreducibility of some Sym²r_λ are equivalent. If they fail, R is induced from a compatible system of characters of a quadratic extension F′/F. Regularity excludes the Artin-up-to-twist case. The rank-three symmetric-square implication uses rank-two representation theory, not an assertion of general lambda-independence of rank-three systems.

**Construction or proof:**

1. Apply the rank-two trichotomy; distinct Hodge weights exclude Artin up to a character twist.

2. Quadratic induction makes Sym² reducible for every member.

3. In the strongly irreducible case, the Zariski closure contains SL₂, whose symmetric square is irreducible; a quadratic self-twist is the remaining obstruction.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/rank-two-system-trichotomy](#rank-two-system-trichotomy), [PA.5/rank-two-symmetric-power-transport](#rank-two-symmetric-power-transport), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Source:** [bcgp](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), Lemma 9.1.10(2), pp. 251–252. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

<a id="corrected-rank-two-large-image"></a>

### Theorem: Corrected rank-two large residual image

**Node:** `PotentialAutomorphyInfrastructure:PA.5/corrected-rank-two-large-image`. **Proposed declaration:** `TauCeti.PotentialAutomorphy.corrected_rank_two_large_image`.

For a strongly irreducible rank-two weakly compatible system over F, there is a density-one set of rational primes l such that for every coefficient place λ|l, bar r_λ(G_{F̃}) contains a conjugate of SL₂(F_l). No regularity hypothesis is needed. This does not assert SL₂(O_M/λ). In the real-multiplication use of BCGP Lemma 9.2.2, a separate large-image argument is required from AbelianSurfacesPotentialModularity.

**Construction or proof:**

1. Use the stronger extremely weak rank-two large-image theorem after excluding the induced and Artin cases by strong irreducibility.

2. Retain the normal-closure restriction and the prime-field SL₂ group exactly.

3. The quartic-character twist counterexample in source issue E1 forbids the printed residue-coefficient-field strengthening.

**Acceptance:** All source hypotheses, coefficient rings, twists and degree shifts are retained; a specialization must not silently strengthen the conclusion.

**Direct prerequisites:** [PA.5/rank-two-large-residual-image](#rank-two-large-residual-image), `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Source:** [bcgp](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), Lemma 9.1.10(3), pp. 251–252, corrected by ACC Lemma 7.1.3. Exact arithmetic specialization of the cited statement, with the hypotheses retained.

**Stage acceptance:** Run every definition’s small-case and non-example tests above, compare all degree shifts and character normalizations to the cited source, and fulfil every listed supplier contract used by the stage. A recorded gap remains a failed closure obligation; passing the structural packet checker does not discharge it.

## Exact supplier contracts

A reference to an existing owner node imports precisely that node’s statement. The following stage requests specify what is needed beyond those statements; a request is not evidence that its supplier has completed it. Owner names and affected nodes match the packet.

### ArithmeticLocallySymmetricSpaces:ALS.1

For arbitrary good levels provide the arithmetic groupoid/sheaf/cellular comparison with actual algebraic coefficient lattices; for normal sufficiently neat levels prove O[Δ]-free finite cells, compatible pullback/trace, and derived coefficient reduction. Existing finite-complex-model and coefficient-change nodes are imports; their current hypotheses require the source-specific freeness and transition verification, not an assumption that all good levels are free.

**Needed by:** [PA.0/integral-model-comparison](#integral-model-comparison), [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/ordinary-patching-verification](#ordinary-patching-verification).

### ArithmeticLocallySymmetricSpaces:ALS.4

Provide the precise split coefficient evaluation of ACC (2.4.7) and the localized unitary Siegel stratum, including induced coefficients and connecting maps. For the GL_n component product, provide the determinant pushforward, Poincaré duality with orientation/weight twists, and the local-system descent used by Lemma 5.4.16.

**Needed by:** [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), [PA.0/boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), [PA.1/degree-reflection-duality](#degree-reflection-duality), [PA.2/determinant-component-product](#determinant-component-product), [PA.2/central-torus-cohomology-shifting](#central-torus-cohomology-shifting).

### ArithmeticLocallySymmetricSpaces:ALS.3

Supply the source’s automorphic realization from rational cohomology (ACC Theorem 2.4.10) and Matsushima concentration [q_GL,q_GL+ℓ₀] at regular characteristic-zero points, q_GL=n(n−1)[F⁺:Q]/2 and ℓ₀=n[F⁺:Q]−1. For the dual complexes RHom(RΓ,O)[−d] the requested range is [q_patch,q_patch+ℓ₀] with q_patch=q_GL+1. No conjectural mod-p GL_n concentration is requested.

**Needed by:** [PA.1/middle-degree-satake](#middle-degree-satake), [PA.4/fontaine-laffaille-dimension-amplitude](#fontaine-laffaille-dimension-amplitude), [PA.4/fontaine-laffaille-lifting-at-good-level](#fontaine-laffaille-lifting-at-good-level), [PA.4/ordinary-lifting-at-good-level](#ordinary-lifting-at-good-level), [PA.4/fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting).

### SmoothRepresentationsOfLocalGroups:SR.1

Extend positive-monoid Hecke algebras over O/varpi^m: ACC Lemmas 2.1.10–2.1.14, restriction/integration homomorphisms and evaluation splitting with exact double-coset formulas, compatible with integral twisted coefficient actions.

**Needed by:** [PA.0/coefficient-satake-descent](#coefficient-satake-descent), [PA.0/ramified-satake-descent](#ramified-satake-descent), [PA.2/iwahori-level-tower](#iwahori-level-tower), [PA.2/positive-torus-monoid](#positive-torus-monoid), [PA.2/unitary-ordinary-tower](#unitary-ordinary-tower), [PA.2/ordinary-satake-homomorphism](#ordinary-satake-homomorphism).

### SmoothRepresentationsOfLocalGroups:SR.0:derived-extension

Provide smooth modules over the open monoids Δ_p and B⁺ with coefficients O/varpi^m, enough injectives, and injective preservation under compact/open restriction (ACC Lemma 5.2.4). This is coefficient characteristic p, not the ell-not-p Jacquet exactness theorem.

**Needed by:** [PA.2/local-ordinary-parts](#local-ordinary-parts), [PA.2/unipotent-invariants-acyclicity](#unipotent-invariants-acyclicity), [PA.2/ordinary-exact-injective](#ordinary-exact-injective), [PA.2/derived-ordinary-comparison](#derived-ordinary-comparison), [PA.2/completed-arithmetic-cohomology](#completed-arithmetic-cohomology), [PA.2/bruhat-cell-induction](#bruhat-cell-induction), [PA.2/bruhat-unipotent-acyclicity](#bruhat-unipotent-acyclicity).

### SmoothRepresentationsOfLocalGroups:SR.2

Provide exact smooth parabolic induction, as right adjoint to exact restriction, preserving injectives with coefficients O/varpi^m and the required compact chart functors. General induction belongs here; PA.2 owns the specific Bruhat/ordinary arithmetic comparison.

**Needed by:** [PA.2/bruhat-cell-induction](#bruhat-cell-induction), [PA.2/completed-boundary-induction-retract](#completed-boundary-induction-retract).

### IgusaVarietiesAndTorsionConcentration:IG.7

Provide ACC Theorem 4.3.3 / Corollary 4.3.2: under [F⁺:Q]>1, the specified rational-prime split/unramified condition, rank≤2 residual unitary support and decomposed genericity, H^i(unitary,O/varpi)=0 for i<d and H_c^i=0 for i>d, so H^d(O) is torsion-free and maps surjectively to the boundary. Keep this request separately on the FL and ordinary applications.

**Needed by:** [PA.1/middle-degree-satake](#middle-degree-satake), [PA.1/fontaine-laffaille-degree-shifting](#fontaine-laffaille-degree-shifting), [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), [PA.2/ordinary-middle-degree-quotient](#ordinary-middle-degree-quotient).

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3

Specialize the general integral Fontaine–Laffaille owner to ACC §4.1: K/Q_p unramified, p>n and embedded coefficients, filtration interval [a_τ,a_τ+p−n−1], contravariant normalized G^a, Teichmüller/crystalline twists, residual FL multisets, tensor identity (4.1.1), and the exact lattice/essential-image and subquotient statements of Theorem 3.2.5. General categories and G/G⁰ are not redefined here.

**Needed by:** [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), [PA.1/nilpotent-fontaine-laffaille-transfer](#nilpotent-fontaine-laffaille-transfer), [PA.1/all-degree-fontaine-laffaille](#all-degree-fontaine-laffaille), [PA.1/fontaine-laffaille-local-global](#fontaine-laffaille-local-global).

### PadicHodgeTheory:R06.4

Provide the rational crystalline/HT comparison in the same geometric Artin and HT(ε)=−1 normalization, including the crystalline character-twist calculation used in ACC Theorem 4.5.1.

**Needed by:** [PA.1/fontaine-laffaille-local-global](#fontaine-laffaille-local-global), [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille).

### AutomorphicGaloisRepresentationsPartII:AG2.0

Provide the split unitary middle-degree Galois representation with its crystalline HT multiset, and GL_n central-character/purity weight sum; provide crystalline algebraic Hecke characters of the required prescribed HT row for the proof of ACC Theorem 4.5.1.

**Needed by:** [PA.1/middle-degree-satake](#middle-degree-satake), [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), [PA.1/fontaine-laffaille-local-global](#fontaine-laffaille-local-global).

### AutomorphicGaloisRepresentationsPartII:AG2.5

Provide ACC Theorem 3.1.1 inertial compatibility at R and away from p, rational local-global compatibility needed for unramified descent, and the Varma 2024 Theorem 1 Weil–Deligne semisimplification comparison used in Bianchi Lemma 6.1.4.

**Needed by:** [PA.3/fontaine-laffaille-deformation-hecke-map](#fontaine-laffaille-deformation-hecke-map), [PA.4/diamond-linear-deformation-hecke-map](#diamond-linear-deformation-hecke-map), [PA.3/ordinary-deformation-hecke-map](#ordinary-deformation-hecke-map), [PA.4/ordinary-diamond-linear-hecke-map](#ordinary-diamond-linear-hecke-map), [PA.4/fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting), [PA.5/pure-weak-automorphy-upgrade](#pure-weak-automorphy-upgrade).

### AutomorphicGaloisRepresentationsPartII:AG2.6

Import ACC Lemmas 7.1.9–7.1.10: DGI gives very weak compatibility and GL₂ gives irreducibility and DGI; extend the owner’s automorphic-system interface so its weight-zero GL₂ systems are odd. This request supplements the existing compatible-system-of-pi and very-weak-compatibility-under-dgi nodes, rather than rebuilding systems.

**Needed by:** [PA.5/rank-two-odd](#rank-two-odd), [PA.5/weak-automorphy-prime-to-set](#weak-automorphy-prime-to-set), [PA.5/pure-weak-automorphy-upgrade](#pure-weak-automorphy-upgrade).

### PotentialModularityAndCompatibleSystems:R24.5:operations

Supply rank-one extremely weak compatible character classification over arbitrary F: the abelian Henniart/Serre family used in ACC Lemma 7.1.1, with coefficient enlargement and de Rham characters, not merely determinant compatibility. Supply the Larsen–Pink unramified monodromy and Larsen density-one maximality input in the extremely weak rank-two regime. The existing weak rational-system result is a near miss, so its conclusion is not applied without these additional hypotheses. Export the already-owned system-operations, polarized-operations, tensor/dual/character/restriction comparisons with good Frobenius polynomials, labeled HT multisets, local WD monodromy, integral lattice/reduction compatibility and precise preservation hypotheses. Extend linear-algebra-operations-on-systems (currently weak systems) to the very/extremely weak cases required here, with canonical Hodge metadata; no arbitrary full-member HT claim in the extremely weak case. Reconcile the existing weakly-compatible-system-rank-n carrier, which includes all-member de Rham/full HT clauses, with weakened-compatible-data before importing its weakening maps. The AG2.6 review already records this supplier inconsistency.

**Needed by:** [PA.5/rank-two-reducibility-dichotomy](#rank-two-reducibility-dichotomy), [PA.5/rank-two-system-trichotomy](#rank-two-system-trichotomy), [PA.5/rank-two-adjoint-monodromy](#rank-two-adjoint-monodromy), [PA.5/rank-two-large-residual-image](#rank-two-large-residual-image), [PA.5/rank-two-symmetric-power-transport](#rank-two-symmetric-power-transport), [PA.5/weak-automorphy-prime-to-set](#weak-automorphy-prime-to-set), [PA.5/rank-two-odd](#rank-two-odd), [PA.5/residual-lifting-hypothesis-restriction](#residual-lifting-hypothesis-restriction).

### SmoothRepresentationsOfLocalGroups:SR.3

For GL_n at a nonarchimedean good place, purity of the unramified Satake parameters makes the corresponding normalized unramified principal series irreducible, as used in Bianchi Lemma 6.1.4; retain the normalization of rec^T.

**Needed by:** [PA.5/pure-weak-automorphy-upgrade](#pure-weak-automorphy-upgrade).

### LocalGaloisDeformationRings:L7

Supply ACC Fontaine–Laffaille framed local deformation ring (Theorem 6.2.5) with dimension n²+[K:Q_p]n(n−1)/2 and its weight interval; supply the flag criterion from Lemma 6.2.11 turning both the characteristic and ordered n-fold matrix identities into the ordered full flag when characters are distinct. For the ordinary patched application supply the flat reduced trivial-residual ring under [K:Q_p]>n(n+1)/2+1 and its component/dimension assertions, not only the weaker near-ordinary bound.

**Needed by:** [PA.2/ordinary-automorphic-galois-flag](#ordinary-automorphic-galois-flag), [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.4/fontaine-laffaille-dimension-amplitude](#fontaine-laffaille-dimension-amplitude), [PA.4/ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point).

### LocalGaloisDeformationRings:L8

Supply the determinant-ordinary functor with the stated universal unit characters and its closed points, and ACC §6.2.6 reductions and dimensions over the chosen minimal prime of the completed torus algebra. Existing determinant-ordinary-ring is imported only for its precise functor; verify all coefficient conventions for the arithmetic application.

**Needed by:** [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.3/ordinary-deformation-hecke-map](#ordinary-deformation-hecke-map), [PA.4/ordinary-diamond-linear-hecke-map](#ordinary-diamond-linear-hecke-map), [PA.4/ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point).

### LocalGaloisDeformationRings:R08.2

For trivial residual representation and q_v≡1 mod p at R, supply the untwisted/unipotent and pairwise-distinct χ-type mod-varpi equality, characteristic-zero irreducibility of the χ-type ring, uniqueness of maximal-dimensional generic lifts, and the dimension/drop assertions used by ACC Assumption 6.3.6. Import the existing ihara-avoidance-components node and verify its hypotheses for each local factor.

**Needed by:** [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.4/fontaine-laffaille-dimension-amplitude](#fontaine-laffaille-dimension-amplitude), [PA.4/ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point).

### GlobalGaloisDeformations:G7

Import the enormous Taylor–Wiles sets, local diamonds and presentations already planned here. Verify their field-splitting, ordered eigenvalue and residual image hypotheses for both arithmetic towers. Additionally export the finite-image symmetric-power enormous/scalar-coset calculation of ACC Lemmas 7.1.4 and 7.1.6(1)–(2),(4)–(5), where needed downstream; do not move auxiliary-set construction into PA.4.

**Needed by:** [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.4/taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels), [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), [PA.4/ordinary-patching-verification](#ordinary-patching-verification), [PA.4/fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting), [PA.5/symmetric-power-adjoint-genericity](#symmetric-power-adjoint-genericity).

### GlobalGaloisDeformations:G8

Provide the framed global deformation problems Sχ and Sχ,Q with fixed determinant/coefficient maps, local-to-global mod-varpi identifications, and the diamond-linear universal representations for the same FL and ordinary profiles. Preserve all universal-property diagrams.

**Needed by:** [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.3/fontaine-laffaille-deformation-hecke-map](#fontaine-laffaille-deformation-hecke-map), [PA.4/diamond-linear-deformation-hecke-map](#diamond-linear-deformation-hecke-map), [PA.3/ordinary-deformation-hecke-map](#ordinary-deformation-hecke-map), [PA.4/ordinary-diamond-linear-hecke-map](#ordinary-diamond-linear-hecke-map).

### DeformationAndDerivedPatchingAlgebra:P8

Provide ACC §6.4.1–6.4.17 abstract perfect-complex ultrapatching at one fixed nonprincipal ultrafilter: uniform minimal ranks, mod-varpi pair comparison, common Hecke images, compatible quotient R actions and nilpotent bounds, derived augmentation/specialization, and independence of the transition-map choices (Remark 6.4.13). No independence of the ultrafilter is requested. Arithmetic PA.4 verifies each datum condition.

**Needed by:** [PA.4/patched-arithmetic-mod-varpi-comparison](#patched-arithmetic-mod-varpi-comparison), [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), [PA.4/ordinary-patching-verification](#ordinary-patching-verification).

### DeformationAndDerivedPatchingAlgebra:P9

Provide the complete ACC §6.3.5 abstract contract: perfect pair C,C′ over S∞, common mod-varpi Hecke image, quotient R∞/R∞′ actions; Assumption 6.3.6 dimension, unique generic-component lifts, strict lower-component dimension and rational amplitude; Proposition 6.3.8 maximal-component support and Corollary 6.3.9 specialization at a dimension-one characteristic-zero augmentation point. PA.3 verifies the local hypotheses, and PA.4 supplies the actual patched pair.

**Needed by:** [PA.3/arithmetic-derived-support-contract](#arithmetic-derived-support-contract), [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.4/fontaine-laffaille-full-support](#fontaine-laffaille-full-support), [PA.4/ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point).

### DeformationAndDerivedPatchingAlgebra:P7

Export splitting of idempotents in D(O), finite-perfect dual/tensor/derived-reduction compatibilities, and compatible perfect inverse-limit reconstruction (KT17 Lemma 2.13) for the Λ₁,c systems. Existing complete-flat-minimal-model is imported, not reproved.

**Needed by:** [PA.0/equivariant-retract](#equivariant-retract), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/ordinary-patching-verification](#ordinary-patching-verification).

### PotentialAutomorphyInfrastructurePartII:PL.0

Extend the single iota-ordinary definition owner to regular algebraic cuspidal GL_n representations without a polarization restriction, with Geraghty’s exact weight-normalized unit-eigenvalue definition, its soluble base-change Lemma 5.7 and twisted-Steinberg valuation criterion (Qian items 134–135). The polarized source of the existing PL.0/iota-ordinary node is a near miss for ACC/Qian. Ordinary automorphy of residual or p-adic rho means an actual iota-ordinary automorphic lift, not a local ordinary flag. Provide the auxiliary CM extensions and characters already owned in PL.0 with the precise prescribed-completion/splitting inputs. Supply the rank-one Hecke-character/class-field branch of ordinary local-global compatibility and lifting; the CTG weight construction has n≥2 and cannot prove the n=1 branch. In the Qian Lemma 4.3 transport, matching Frobenius polynomials initially identifies only the semisimplified member; upgrade to the original representation only with the proved absolute irreducibility hypothesis. Record the corrected +jλτ valuation criterion and the residual irreducibility/genericity conditions for Remark 4.4; its global deduction is not an all-local ordinarity theorem.

**Needed by:** [PA.2/ordinary-automorphic-galois-flag](#ordinary-automorphic-galois-flag), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting), [PA.4/fontaine-laffaille-lifting-descent](#fontaine-laffaille-lifting-descent), [PA.4/ordinary-lifting-descent](#ordinary-lifting-descent), [PA.5/fontaine-laffaille-base-change-fields](#fontaine-laffaille-base-change-fields), [PA.5/ordinary-base-change-fields](#ordinary-base-change-fields), [PA.2/ordinary-local-global](#ordinary-local-global), [PA.2/all-degree-ordinary-characteristic-data](#all-degree-ordinary-characteristic-data), [PA.4/fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting).

### ModularityAndLanglandsExtensions:ML.1

Provide unpolarized soluble automorphic base change/descent for regular algebraic cuspidal GL_n with residual absolute irreducibility, ordinary base-change compatibility and the rational local comparison needed to retain unramified level (ACC Lemma 6.5.13 and §§6.5.12,6.6.10). This is a class-field/base-change supplier, not the final ML.2 potential-automorphy assembly.

**Needed by:** [PA.4/fontaine-laffaille-lifting-descent](#fontaine-laffaille-lifting-descent), [PA.4/ordinary-lifting-descent](#ordinary-lifting-descent), [PA.4/fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting).

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Import general roots, Weyl groups, parabolics and Levi decompositions; PA.1 only adds the explicit Siegel shuffles and arithmetic length calculations. Integral highest-weight modules remain the separately recorded proposed RG2.6 gap.

**Needed by:** [PA.1/kostant-shuffles](#kostant-shuffles), [PA.1/integral-kostant-decomposition](#integral-kostant-decomposition), [PA.2/relative-bruhat-cells](#relative-bruhat-cells).

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

Import the pinned split integral group schemes underlying coefficient lattices; the induced/Weyl/dual-Weyl theory extending them has sole proposed owner RG2.6 and is an explicit gap, not a claimed result of this layer.

**Needed by:** [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), [PA.1/integral-kostant-decomposition](#integral-kostant-decomposition), [PA.2/lowest-weight-character](#lowest-weight-character).

## Gaps and closure obligations

### Single integral highest-weight owner RG2.6 requires atlas creation

Propose ReductiveGroupsPartII:RG2.6, extending the existing pinned group-scheme roadmap, as the sole owner of integral induced/Weyl/dual-Weyl modules, Kempf vanishing, Donkin criterion, tensor stability and O(G) good filtrations. RG2.6 is not currently an atlas stage, so it is not forged as a resolvable prerequisite. PA.1 owns only its GL_n linkage/alcove bounds and Kostant application. Until the stage/node exists these four declarations have this explicit prerequisite gap. LP3 must import the same owner and retain only its parameter-scheme assertions.

**Affected declarations:** [PA.1/integral-kostant-decomposition](#integral-kostant-decomposition), [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), [PA.2/lowest-weight-character](#lowest-weight-character), [PA.2/ordinary-ctg-weight-choice](#ordinary-ctg-weight-choice).

### Global finite character with prescribed triviality and generic ratios

The class-field approximation/Teichmüller character of ACC Corollary 4.4.8 must be supplied with ψ trivial at S and the forbidden ratios excluded at a split witness prime. PL.0 auxiliary-characters has different algebraic local data; its statement was not silently treated as this exact finite-character result. The missing character construction is a ClassFieldTheory Part II extension, not an assumption that every arbitrary list of local values globalizes.

**Affected declarations:** [PA.1/genericity-making-character-twist](#genericity-making-character-twist).

### Arithmetic signatures unavailable at the pinned baseline

The pinned libraries do not yet supply the owner-qualified arithmetic spaces, algebraic coefficient lattices, smooth monoid categories, completed Hecke algebra, compatible-system carrier and automorphic representation/reciprocity interfaces needed to type these definitions. The suggested file records their exact names, statements, APIs and test obligations in comments and omits their dependent signatures, as PROTOCOL §13 requires when conditions cannot be stated. It does not use proposition-valued stand-ins or claim those comments elaborate. Supplier requests must be fulfilled before the full signatures can be added. The oddness prototype is its determinant core on actual supplied matrices; the full member/real-place indices require the arithmetic owner. The Hida twist prototype types only ν and its three weight computations; B₁ and B require the supplied perfect complexes. CTG’s cuspidal-exclusion and the lowest-weight lattice projection APIs also require the actual owner interfaces. All arithmetic theorem signatures depending on those carriers are also omitted with their complete mathematical obligations; only the finite shifted-partition theorem has a typed signature. The R24.5 supplier also needs to reconcile its all-member-Hodge carrier with its weakening node (the AG2.6 packet records this contradiction); operation signatures for weakened systems cannot be assumed to follow from its current weak-system node. Integral lattice and local WD exports remain explicit R24.5 requests.

**Affected declarations:** [PA.2/iwahori-level-tower](#iwahori-level-tower), [PA.2/arithmetic-ordinary-summand](#arithmetic-ordinary-summand), [PA.2/ordinary-galois-characters](#ordinary-galois-characters), [PA.2/local-ordinary-parts](#local-ordinary-parts), [PA.2/completed-arithmetic-cohomology](#completed-arithmetic-cohomology), [PA.2/completed-ordinary-cohomology](#completed-ordinary-cohomology), [PA.2/unitary-ordinary-tower](#unitary-ordinary-tower), [PA.2/unitary-completed-boundary](#unitary-completed-boundary), [PA.2/relative-bruhat-cells](#relative-bruhat-cells), [PA.2/bruhat-cell-induction](#bruhat-cell-induction), [PA.2/bruhat-unipotent-invariants](#bruhat-unipotent-invariants), [PA.2/bruhat-orientation-character](#bruhat-orientation-character), [PA.2/determinant-torus](#determinant-torus), [PA.4/taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels), [PA.4/taylor-wiles-selected-ideals](#taylor-wiles-selected-ideals), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels), [PA.5/weak-automorphy-prime-to-set](#weak-automorphy-prime-to-set), [PA.5/rank-two-odd](#rank-two-odd), [PA.4/weight-independent-hida-twist](#weight-independent-hida-twist), [PA.1/ctg-weight](#ctg-weight), [PA.2/lowest-weight-character](#lowest-weight-character).

### Geraghty primary-source normalization check

ACC and Qian’s cited statements and uses were read, but a freely accessible author/publisher copy of Geraghty 2019 Definitions 5.3/5.5 and Lemmas 5.6/5.7 was not obtained. PL.0 must verify the exact normalization and general-weight Steinberg valuation sign against that primary source. The present packet records Qian’s positive +jc_τ valuation correction rather than declaring the weight-zero lemma sufficient.

**Affected declarations:** [PA.2/ordinary-automorphic-galois-flag](#ordinary-automorphic-galois-flag), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting), [PA.5/ordinary-base-change-fields](#ordinary-base-change-fields), [PA.4/ordinary-lifting-descent](#ordinary-lifting-descent).

### Extremely weak monodromy and rank-one source leaves

ACC proofs were read, but the Henniart/Serre character-family theorem and the precise Larsen–Pink/Larsen maximality theorem in their cited editions were not independently read. These are exact R24.5:operations requests; existing weak rational-system nodes cannot discharge the extremely weak rank-two hypotheses.

**Affected declarations:** [PA.5/rank-two-reducibility-dichotomy](#rank-two-reducibility-dichotomy), [PA.5/rank-two-adjoint-monodromy](#rank-two-adjoint-monodromy), [PA.5/rank-two-large-residual-image](#rank-two-large-residual-image).

### Uniform arithmetic tower freeness and reconstruction

ALS and P7 imports supply the generic finite-model and minimal-complex technology. The arithmetic free Δ_N-cell model, common bounds on minimal ranks in each degree and compatible derived c-limit reconstruction need the source-qualified supplier extensions requested above. No assertion of freeness is made for an arbitrary non-neat groupoid or arbitrary complete ring.

**Affected declarations:** [PA.0/integral-model-comparison](#integral-model-comparison), [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.4/ordinary-patching-verification](#ordinary-patching-verification).

### Rational unpolarized base-change and local compatibility source leaves

The exact ACC and Bianchi deduction was read, but the underlying unpolarized soluble descent theorem and Varma 2024 Theorem 1 were not independently read. ML.1 and AG2.5 must supply these statements; polarized PL.0 descent and equality only away from finitely many places are insufficient.

**Affected declarations:** [PA.4/fontaine-laffaille-lifting-descent](#fontaine-laffaille-lifting-descent), [PA.4/ordinary-lifting-descent](#ordinary-lifting-descent), [PA.5/pure-weak-automorphy-upgrade](#pure-weak-automorphy-upgrade).

### Rank-two projective-group classification inputs

ACC’s proofs use the classification of finite PGL₂ subgroups containing SL₂(F_l), simplicity/perfection of PSL₂(F_l), its automorphism group and eigenvalue-ratio choices. General Goursat is a checked baseline import. The remaining finite-group representation statements need an owner-qualified node from the finite-group theory development; their cited DDT97/Dieudonné editions were not independently read. The arithmetic applications here retain them as explicit proof leaves.

**Affected declarations:** [PA.5/symmetric-power-adjoint-genericity](#symmetric-power-adjoint-genericity), [PA.5/qian-symmetric-power-avoidance](#qian-symmetric-power-avoidance), [PA.5/rank-two-adjoint-monodromy](#rank-two-adjoint-monodromy).

### Ordinary Satake-image polynomial-law transfer

ACC Theorem 5.4.3 proves only a map onto the Satake image, not onto the whole GL_n ordinary Hecke algebra. The proof of Proposition 5.4.18 needs a separate polynomial-law argument over the O-flat unitary Hecke algebra to extend its matrix identities to all group-algebra elements after base change. The corrected target statements retain this proof leaf; the published argument and reviewed extraction identify the repair, but its full polynomial-law construction is not independently established here. No surjectivity assertion is used to conceal this gap.

**Affected declarations:** [PA.2/all-degree-ordinary-characteristic-data](#all-degree-ordinary-characteristic-data), [PA.2/ordinary-local-global](#ordinary-local-global).

## Source corrections used by this blueprint

Each correction below has its full printed fragment, reason and search provenance in `sourceIssues` in the packet. The short corrections here identify the exact mathematical change. Corrections attributed to the reviewed extractions retain that attribution; their 23 September 2026 erratum searches are not represented as new searches by this worker. Statements above use the corrected forms. The dual-complex degree distinction is a normalization check, not a newly claimed error in the paper’s abstract q₀ notation.

- **PotentialAutomorphyInfrastructure/E1** (error, affects a stated result): BCGP author PDF §9.1 Lemma 9.1.10(3), pp. 251–252. For strongly irreducible systems, without regularity, the normal-closure image contains a conjugate of SL₂(F_l), not necessarily SL₂(O_M/λ). Recorded in PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E136 and the present issue; no published erratum was established.

- **PotentialAutomorphyInfrastructure/E2** (error, affects the proof): Qian NSF copy, proof of Lemma 2.6(2), ACC Lemma 7.1.6(3) application. Use intermediate fields only to establish the adjoint image over the normal closure, then apply ACC Lemma 7.1.6(3) to the original F,F₁ with m=n−1. Recorded in PAPER-QIAN-23/E22; no independently verified published correction.

- **PotentialAutomorphyInfrastructure/E3** (misprint, affects nothing): ACC published Proposition 6.4.17, pp. 1060–1061. The common reduced endomorphism image lives in D(S∞/varpi). Recorded in the supplied ACC extraction; no separate published erratum established.

- **PotentialAutomorphyInfrastructure/E4** (misprint, affects nothing): ACC published §6.5.1 auxiliary levels p. 1064 and §6.6.1 p. 1079. The auxiliary levels equal the original local level at every v∉Q, including v∈S. Recorded in supplied ACC extraction items 260 and 284.

- **PotentialAutomorphyInfrastructure/E5** (gap, affects a stated result): ACC published Lemma 5.4.16 p. 1020. Retain the Iwahori p-level K(b,c) hypothesis used to define the ordinary complexes and ordinary Hecke algebra in this application. Recorded in supplied ACC extraction item 178; no independently verified published correction.

- **PotentialAutomorphyInfrastructure/E6** (misprint, affects nothing): ACC published §5.2.19 p. 1001. Use the contracting unitary GL_{2n} double coset of §2.2.5, with exponent row (2n−1,…,1,0); the corresponding product runs through 2n−1 simple operators. Recorded as a normalization discrepancy in supplied extraction item 155; no published correction established.

- **PotentialAutomorphyInfrastructure/E7** (misprint, affects nothing): §2.2.1, eq. (2.2.2), p. 918 (also in arXiv v2). λ̃_τ = (−λ_{τ̃c,n}, …, −λ_{τ̃c,1}, λ_{τ̃,1}, λ_{τ̃,2}, …, λ_{τ̃,n}) Source record: PAPER-ALLEN-ETAL-23/E4. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E8** (misprint, affects nothing): §2.2.5, eq. (2.2.6), p. 922 (also in arXiv v2). … + (−1)ⁿ q_v^{n(n−1)/2} T_{v,n} Source record: PAPER-ALLEN-ETAL-23/E6. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E9** (misprint, affects nothing): §2.2.5, eq. (2.2.7), p. 922 (also in arXiv v2). (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j} Source record: PAPER-ALLEN-ETAL-23/E7. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E10** (misprint, affects nothing): §2.2.5, the polynomials P̃_{v,σ}(X): after (2.2.7) (p. 922), after (2.2.12) (p. 926) and Lemma 2.2.13(2) (p. 927) (also in arXiv v2). X^{2n−i} in all three places (and 'is equals' → 'equals') Source record: PAPER-ALLEN-ETAL-23/E8. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E11** (misprint, affects nothing): §2.4.1, proof of Theorem 2.4.4, including (2.4.5), p. 945 (also in arXiv v2). RΓ(X̃^P_K̃, 𝒱_λ̃), the cohomology of the Siegel stratum (no ∂), in both places Source record: PAPER-ALLEN-ETAL-23/E18. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E12** (misprint, affects nothing): §2.4.9, Theorem 2.4.10(1) and (2), p. 948 (also in arXiv v2). K ⊂ GL_n(A_F^∞) (twice) Source record: PAPER-ALLEN-ETAL-23/E19. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E13** (misprint, affects nothing): §2.4.9, proof of Theorem 2.4.10, p. 951 (also in arXiv v2). r̄_ι(𝔐) ≅ ρ̄_𝔪 (the semisimplified reduction of r_ι(𝔐)) Source record: PAPER-ALLEN-ETAL-23/E20. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E14** (misprint, affects nothing): §4.1, the category MF_𝒪, p. 965 (also in arXiv v2). Φ^i_τ : Fil^i M_τ → M_{τ∘Frob_p} (or else make Φ^i Frob_p ⊗ 1-semilinear) Source record: PAPER-ALLEN-ETAL-23/E31. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E15** (misprint, affects nothing): §4.3, proof of Theorem 4.3.3, p. 973 (also in arXiv v2). H^{d−1}(X̃_K̃, 𝒱_λ̃/ϖ)_𝔪̃ = 0 and H^{d+1}_c(X̃_K̃, 𝒱_λ̃)_𝔪̃ = 0 Source record: PAPER-ALLEN-ETAL-23/E32. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E16** (gap, affects a stated result): §4.3, Proposition 4.3.4 and its proof, pp. 973–974 (also in arXiv v2). add the hypothesis of Theorem 4.2.1: K̃_{U,v̄} = U(𝒪_{F⁺_v̄}) for each v̄ ∈ S̄_p Source record: PAPER-ALLEN-ETAL-23/E33. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E17** (misprint, affects nothing): §4.3, Definition 4.3.5, p. 974 (also in arXiv v2). λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺,E)} Source record: PAPER-ALLEN-ETAL-23/E34. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E18** (error, affects the proof): §4.3, proof of Lemma 4.3.6, criterion (4.3.7), pp. 974–975 (also in arXiv v2). Σ_{i=1}^n (μ_{w,τ̃,i} + μ_{w,τ̃c,i}) ≠ Σ_{i=1}^n (μ_{w,τ̃_0,i} + μ_{w,τ̃_0c,i}) Source record: PAPER-ALLEN-ETAL-23/E35. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E19** (misprint, affects nothing): §4.3, proof of Lemma 4.3.6, p. 975 (also in arXiv v2). λ̃′_{τ_0,i} = λ̃_{τ_0,i} if i > 1 Source record: PAPER-ALLEN-ETAL-23/E36. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E20** (misprint, affects nothing): §4.4, proof of Proposition 4.4.1, Hypothesis 4.4.2 and the induction step, pp. 976–977 (also in arXiv v2). let the induction step run over q ∈ [⌊d/2⌋, d − 1], so that the induction ends with the proposition in all degrees [⌊d/2⌋, d − 1] Source record: PAPER-ALLEN-ETAL-23/E37. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E21** (misprint, affects nothing): §4.4, proofs of Propositions 4.4.1 and 4.4.6, pp. 977, 978 and 980 (also in arXiv v2). A(K, λ′(q), q + 1, m), A(K, λ, q, m) and A(K, λ, q, m) Source record: PAPER-ALLEN-ETAL-23/E38. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E22** (error, affects a stated result): §4.4, Proposition 4.4.6(c), pp. 979–980 (also in arXiv v2). add the hypothesis A(K, λ, q, m) ≠ 0, i.e. that 𝔪 is in the support of H^q(X_K, 𝒱_λ/ϖ^m) Source record: PAPER-ALLEN-ETAL-23/E39. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E23** (misprint, affects nothing): §4.4, statement of Corollary 4.4.8, p. 981 (also in arXiv v2). v̄ ∈ S̄_p Source record: PAPER-ALLEN-ETAL-23/E40. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E24** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, p. 982, and §4.5, proof of Theorem 4.5.1, p. 985 (also in arXiv v2). Theorem 2.3.7 Source record: PAPER-ALLEN-ETAL-23/E41. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E25** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, choice of K̃, p. 982 (also in arXiv v2). U(𝒪_{F⁺_{v̄″}}) ⊂ K̃_{v̄″} Source record: PAPER-ALLEN-ETAL-23/E42. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E26** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, choice of K̃, p. 982 (also in arXiv v2). K̃_v̄ = G̃(𝒪_{F⁺_v̄}) Source record: PAPER-ALLEN-ETAL-23/E43. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E27** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, p. 983 (also in arXiv v2). N = (q + 1)N_0 (or dN_0, which does not depend on q since q ≤ d − 1) Source record: PAPER-ALLEN-ETAL-23/E44. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E28** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, p. 983 (also in arXiv v2). ε(Art_F(det(g)))^{−n_0} Source record: PAPER-ALLEN-ETAL-23/E45. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E29** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, p. 984, and §4.5, proof of Theorem 4.5.1, p. 986 (also in arXiv v2). The quotient K/K′ Source record: PAPER-ALLEN-ETAL-23/E46. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E30** (misprint, affects nothing): §4.4, proof of Corollary 4.4.8, p. 984 (also in arXiv v2). J′^N = 0 Source record: PAPER-ALLEN-ETAL-23/E47. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E31** (misprint, affects nothing): §4.5, proof of Theorem 4.5.1, condition (b′), p. 987 (also in arXiv v2). a′ = (λ′_{τ,n}) ∈ ℤ^{Hom_{Q_p}(F_v, E)} Source record: PAPER-ALLEN-ETAL-23/E48. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E32** (error, affects the proof): §4.5, proof of Theorem 4.5.1, second case (hypothesis (8)(b)), p. 988 (also in arXiv v2). λ′ = λ + μ, where μ_τ = (m_τ, …, m_τ) records the Hodge–Tate weights of ψ at every p-adic place, as in the first case ('Define a weight μ … by letting μ_{τ,i} be the unique τ-Hodge–Tate weight for ψ'); this λ′ agrees with the printed one at the embeddings above v̄ Source record: PAPER-ALLEN-ETAL-23/E49. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E33** (misprint, affects nothing): §5.1, definition of K(b, c), p. 989 (also in arXiv v2). K(b, c)_v = Iw_v(b, c) if v | p Source record: PAPER-ALLEN-ETAL-23/E50. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E34** (misprint, affects nothing): §5.1 and §5.5, Theorem 5.5.1, stated on p. 991 and repeated on p. 1026 (also in arXiv v2). λ ∈ (ℤ^n_+)^{Hom(F,E)} Source record: PAPER-ALLEN-ETAL-23/E51. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E35** (misprint, affects nothing): §5.2, proof of Lemma 5.2.8, p. 997 (also in arXiv v2). N_n(𝒪_{F,p})/tN_n(𝒪_{F,p})t^{−1}; and u_p · v ∈ V^{Iw_p(b,c′−1)}, the operator being that of u_p = (p^{n−1}, …, 1) Source record: PAPER-ALLEN-ETAL-23/E52. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E36** (misprint, affects nothing): §5.2.19, Proposition 5.2.28, p. 1003 (also in arXiv v2). for each v̄ ∈ S̄_p Source record: PAPER-ALLEN-ETAL-23/E54. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E37** (misprint, affects nothing): §5.3, the relative Weyl group, p. 1003 (also in arXiv v2). l_r(w_0^P) = |S̄_p|n² Source record: PAPER-ALLEN-ETAL-23/E55. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E38** (misprint, affects nothing): §5.3, Lemma 5.3.3 and its proof, pp. 1005–1006 (also in arXiv v2). B(𝒪_{F^+,p})(b), throughout the statement and the proof Source record: PAPER-ALLEN-ETAL-23/E56. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E39** (misprint, affects nothing): §5.4, Theorem 5.4.3, p. 1013 (also in arXiv v2). K̃_v̄ = Ĩw_v̄ Source record: PAPER-ALLEN-ETAL-23/E57. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E40** (gap, affects a stated result): §5.4, Theorem 5.4.3 and its proof, pp. 1013–1015, and its use in the proof of Proposition 5.4.18, pp. 1023 and 1025 (also in arXiv v2). 𝒮 descends to a homomorphism, surjective onto the image of 𝐓̃^{S,ord} acting through 𝒮 (a subalgebra of 𝐓^{S,ord}(…)); this is the form stated in Proposition 5.4.13(2). In the proof of Proposition 5.4.18 the passage from (5.4.20)–(5.4.21) to (5.4.22)–(5.4.23) for all Y ∈ (A/J)[G_{F_v}] then needs another argument, e.g. that (5.4.20)–(5.4.21) are identities of polynomial laws over the 𝒪-flat ring Ã and so survive base change to A/J. Source record: PAPER-ALLEN-ETAL-23/E58. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E41** (misprint, affects nothing): §5.4, proof of Theorem 5.4.3, equation (5.4.7), p. 1014 (also in arXiv v2). … ⊗_𝒪 τ_w^{−1}π^ord(K^p, m)_𝔪̃ Source record: PAPER-ALLEN-ETAL-23/E59. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E42** (error, affects a stated result): §5.4, Lemma 5.4.8 and Proposition 5.4.13, pp. 1015–1018, with §5.1 fixing 'an integer n ≥ 1' (p. 989) (also in arXiv v2). assume n ≥ 2 in Lemma 5.4.8 and Proposition 5.4.13, and hence in the proof of Theorem 5.5.1; the case n = 1 of Theorem 5.5.1 concerns Hecke characters and has to be handled directly (class field theory) Source record: PAPER-ALLEN-ETAL-23/E60. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E43** (misprint, affects nothing): §5.4, proof of Lemma 5.4.8, the case i = 0, p. 1016 (also in arXiv v2). for i = 0 (x = r = n, X_0 = {n + 1, …, 2n}) the tuple is (n + 1, …, 2n, 1, …, n) and only (5.4.9) is needed, giving a_0 ≥ (n² + n − 1)M/2, which the a_0 chosen in the proof satisfies Source record: PAPER-ALLEN-ETAL-23/E61. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E44** (error, affects the proof): §5.4, proof of Lemma 5.4.8, the verification that λ̃_i is CTG, p. 1017 (also in arXiv v2). It suffices to show that μ̃_{τ,n+j} − μ̃_{τ,j} (1 ≤ j ≤ n) is not independent of j, for μ̃ = w(λ̃_i + ρ) − ρ; equivalently, that the 2n entries of λ̃_i + ρ cannot be split into two n-element sets, one a translate of the other. The 'look modulo M' argument proves this for n ≥ 2 when applied to differences instead of sums: since 2a_i ≡ M/4 mod M, a difference between the two blocks of λ̃(a_i) + ρ is ≡ ±M/4 up to 2n − 1 modulo M, and these are pairwise distinct; a difference within a block is ≡ 0 up to 2n − 1; and a difference within the first block (of size < nM) never equals one within the second (a nonzero multiple of nM up to 2n − 1). So a translate-split would pair the 2n entries inside one block of n entries, which is impossible. (The multiset I′ should likewise be formed from the entries of λ̃(a_i), which is what I′_1, I′_2, I′_3 list.) Source record: PAPER-ALLEN-ETAL-23/E62. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E45** (misprint, affects nothing): §5.4, statement of Proposition 5.4.13, p. 1017 (also in arXiv v2). delete 'and also an integer m ≥ 1' Source record: PAPER-ALLEN-ETAL-23/E63. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E46** (misprint, affects nothing): §5.4, Proposition 5.4.13 and its proof, pp. 1017–1018 (also in arXiv v2). the w_i of Proposition 5.4.13 is w_0^G w_i w_0^{G̃} for the w_i of Lemma 5.4.8 (of length i[F^+ : ℚ], not (n² − i)[F^+ : ℚ]); it should get its own name Source record: PAPER-ALLEN-ETAL-23/E64. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E47** (misprint, affects nothing): §5.4, Proposition 5.4.18(c), p. 1022 (also in arXiv v2). 𝐓^{S,ord}(H^i(X_{K(b,c)}, 𝒱_λ)^ord_𝔪) in both places Source record: PAPER-ALLEN-ETAL-23/E66. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E48** (gap, affects the proof): §5.5, proof of Corollary 5.5.2, p. 1028 (also in arXiv v2). also take F′ = FE with E/ℚ Galois and linearly disjoint from the Galois closure of F̄^{ker r̄_ι(π)}(ζ_p) over ℚ, so that by Lemma 7.1.7 r̄_ι(π)|_{G_{F′}} stays decomposed generic; such E (e.g. a suitable imaginary quadratic field in which p splits) exist Source record: PAPER-ALLEN-ETAL-23/E67. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E49** (misprint, affects nothing): §6.2.6, Lemma 6.2.9, p. 1034 (introduced in print: arXiv v2 reads 'R̃_v^{det,ord} is a finite R_v^{det,ord}-algebra.'). Lemma 6.2.9. R̃_v^{det,ord} is a finite R_v^{det,ord}-algebra. Source record: PAPER-ALLEN-ETAL-23/E70. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E50** (misprint, affects nothing): §6.2.6, the points of R_v^△, p. 1035 (also in arXiv v2). χ_i^univ Source record: PAPER-ALLEN-ETAL-23/E71. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E51** (misprint, affects nothing): §6.4.1, Set-up for patching, items (4) and (5), p. 1053 (also in arXiv v2). R′_∞ → 𝒯 ⊗̂_Λ R′_N in (4), and R′_N → T′_N/I′_N in (5) Source record: PAPER-ALLEN-ETAL-23/E79. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E52** (misprint, affects nothing): §6.4.2, Remark 6.4.14, p. 1059 (also in arXiv v2). the last term is (lim_{d,J} R(d, J, ∞))/ϖ Source record: PAPER-ALLEN-ETAL-23/E80. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E53** (misprint, affects nothing): §6.5.1, proof of Lemma 6.5.9, p. 1066 (also in arXiv v2). the unique maximal ideal of 𝐓^S(K, 𝒱_λ(χ^{−1})) lying above 𝔪^Q Source record: PAPER-ALLEN-ETAL-23/E83. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E54** (misprint, affects nothing): §6.5.1, proof of Theorem 6.5.4, pp. 1068–1069 (also in arXiv v2). Q_N throughout: v ∈ Q_N, K_0(Q_N), K_1(Q_N), 𝔫_1^{Q_N} (likewise in 𝒞′_N and T′_N) Source record: PAPER-ALLEN-ETAL-23/E84. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E55** (misprint, affects nothing): §6.5.1, proof of Theorem 6.5.4, p. 1068 (also in arXiv v2, which reads 'Proposition 6.2.31', a lemma there too). Proposition 6.2.33(3) when N ≥ 1 (equivalently, Proposition 6.2.25 combined with Lemma 6.2.32) Source record: PAPER-ALLEN-ETAL-23/E85. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E56** (misprint, affects nothing): §6.5.1, proof of Theorem 6.5.4, verification of the patching set-up, p. 1069 (also in arXiv v2). End_{D(k[Δ_N])}(𝒞_N ⊗^L_{𝒪[Δ_N]} k[Δ_N]) = End_{D(k[Δ_N])}(𝒞′_N ⊗^L_{𝒪[Δ_N]} k[Δ_N]); 𝒪[Δ_N]; T′_0/I′_0 Source record: PAPER-ALLEN-ETAL-23/E86. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E57** (misprint, affects nothing): §6.5.1, proof of Theorem 6.5.4, list of patched outputs, pp. 1069–1070 (also in arXiv v2). T_∞ and T′_∞ have the same image T̄_∞ in End_{D(S_∞/ϖ)}(𝒞_∞ ⊗^L_{S_∞} S_∞/ϖ) = End_{D(S_∞/ϖ)}(𝒞′_∞ ⊗^L_{S_∞} S_∞/ϖ); H^*(𝒞_∞ ⊗^L_{S_∞} S_∞/ϖ) Source record: PAPER-ALLEN-ETAL-23/E87. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E58** (misprint, affects nothing): §6.5.1, proof of Theorem 6.5.4, p. 1070, and §6.6.1, proof of Theorem 6.6.2, p. 1081 (also in arXiv v2). g = qn − n²[F^+ : ℚ] Source record: PAPER-ALLEN-ETAL-23/E88. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E59** (misprint, affects nothing): §6.5.12, Proposition 6.5.13(1) and (2), pp. 1070–1071 (also in arXiv v2). λ_{E,τ} = λ_{τ|_F} for τ ∈ Hom(E, ℂ); rec_{E_w}(π) = rec_{F_v}(π_F)|_{W_{E_w}} Source record: PAPER-ALLEN-ETAL-23/E89. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E60** (gap, affects the proof): §6.5.12, proof of Proposition 6.5.13, p. 1071 (also in arXiv v2). add that Π_w is the Arthur–Clozel local base change of π_{w|_F} at every finite place w, and that local base change is compatible with the local Langlands correspondence (Harris–Taylor, Ch. VII); likewise for part (2) Source record: PAPER-ALLEN-ETAL-23/E90. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E61** (gap, affects nothing): §6.5.12, proof of Theorem 6.1.1, choice of E_a, E_b, E_c, p. 1073; the same example in §6.6.10, p. 1083 (also in arXiv v2). also require p_b ≡ −1 mod l and p_c ≡ −1 mod l for every rational prime l below V_0 ∪ V_1 ∪ V_2 (such l are odd and prime to p, so this is compatible with the other congruences by the Chinese remainder theorem), and, in the Fontaine–Laffaille case, p_b ≠ p Source record: PAPER-ALLEN-ETAL-23/E91. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E62** (gap, affects nothing): §6.5.12, end of the proof of Theorem 6.1.1, p. 1074 (also in arXiv v2). add the case v | p: Corollary 6.5.5 also makes Π_{E,w} unramified for w | p; p is unramified in E, so I_{E_w} = I_{F_v}, and rec_{E_w}(Π_{E,w}) = rec_{F_v}(Π_v)|_{W_{E_w}} (Proposition 6.5.13(2)) shows that rec_{F_v}(Π_v) is unramified Source record: PAPER-ALLEN-ETAL-23/E92. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E63** (misprint, affects nothing): §6.6.1, before and in Proposition 6.6.9, p. 1079 (also in arXiv v2). A(μ, χ, Q)_{𝔫^Q} (three times) Source record: PAPER-ALLEN-ETAL-23/E93. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E64** (misprint, affects nothing): §6.6.1, Proposition 6.6.9, p. 1079 (also in arXiv v2). for each finite place v ∉ S ∪ Q of F, the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) Source record: PAPER-ALLEN-ETAL-23/E94. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E65** (misprint, affects nothing): §6.6.1, proof of Theorem 6.6.2, p. 1080 (also in arXiv v2). H^*(A_1(λ, 1, 1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G λ)^{−1})[1/p] Source record: PAPER-ALLEN-ETAL-23/E95. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E66** (misprint, affects nothing): §6.6.10, the hypotheses of Theorem 6.1.2 as recalled in its proof, p. 1082 (also in arXiv v2). ψ_{v,i} : G_{F_v} → Q̄_p^×; 'ρ̄ is absolutely irreducible and decomposed generic (Definition 4.3.1)'; r̄_ι(π) ≅ ρ̄ Source record: PAPER-ALLEN-ETAL-23/E96. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E67** (gap, affects nothing): §7.1, proof of Lemma 7.1.5, p. 1090 (also in arXiv v2). add that p ≠ l and that r̄ is unramified above p (Chebotarev still gives infinitely many such p) Source record: PAPER-ALLEN-ETAL-23/E98. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E68** (misprint, affects nothing): §7.1, proof of Lemma 7.1.6(5), p. 1091 (also in arXiv v2). [F̃ ∩ F̄^{ker ad r̄} : F] ≤ [F̃ : F] < l Source record: PAPER-ALLEN-ETAL-23/E99. Recorded in the reviewed ACC extraction; its erratum searches are dated 23 September 2026. No newer published correction was established in this run.

- **PotentialAutomorphyInfrastructure/E69** (gap, affects a stated result): Theorem 1.4, p. 1241, and its proof in the final paragraph of §4 (after Remark 4.4), p. 1274. The cited result is ACC+ Theorem 6.1.2(4): Ann. of Math. 197 (2023), p. 1030, and arXiv:1812.09999v1, p. 109. The v1 numbering (Definition 6.2.28) is the one Qian cites.. Add the hypothesis l > n to Theorem 1.4. This is the second sentence of condition (4) of ACC+ Theorem 6.1.2; the fourth hypothesis of Theorem 1.4 copies only the first sentence. With l > n added, the proof on p. 1274 works as written. For odd primes l < n with l ∤ n, the paper does not prove Theorem 1.4 (the case l | n is already excluded by the enormity hypothesis). Proving it there would need an ordinary automorphy lifting theorem for such l. Neither ACC+ Theorem 6.1.2 nor its subsequent adequate-image version (Miagkov–Thorne, arXiv:2203.04520v2, Theorem 1.3) provides one: both require p > n. Source record: PAPER-QIAN-23/E2. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E70** (misprint, affects nothing): Proof of Theorem 1.4, the final paragraph of §4 (after Remark 4.4), p. 1274. The same sentence appears in arXiv v1, p. 26, where it cites Lemma 7.1.6 of the arXiv version of ACC+; the published version cites it as Lemma 7.1.7.. Replace F′ by K = L′LF^{suff}(ζ_N). The sentence should read: "the Galois closure H of \overline{F}^{\ker\bar r}(ζ_l) over ℚ is linearly disjoint over ℚ from K = L′LF^{suff}(ζ_N)". K is Galois over ℚ, being the compositum of the Galois extensions L′, L, F^{suff} and ℚ(ζ_N). The displayed chain shows K ∩ F^{avoid} = ℚ, so K is linearly disjoint over ℚ from F^{avoid}, which contains H. Since F′ = FK, ACC+ Lemma 7.1.7 with E = K then shows that \bar r|_{G_{F′}} is absolutely irreducible and decomposed generic. Source record: PAPER-QIAN-23/E3. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E71** (gap, affects the proof): arXiv v1 (arXiv:2104.09761v1): Definition 1.3, p. 2; proof of Theorem 1.1, p. 24 (the step for the auxiliary prime l′ and the last sentence); proof of Theorem 1.4, p. 26. Corrected in the published version: Definition 1.3, p. 1241; proof of Theorem 1.1 and Lemma 4.3, p. 1273; Remark 4.4 and proof of Theorem 1.4, p. 1274. Remark 3.13, p. 1268, gives related context.. Hypothesis (5) of ACC+ Theorem 6.1.2 needs a regular algebraic cuspidal π that is ι-ordinary at every place above the prime, in the sense of Geraghty's Definition 5.3. An automorphic lift that is only ordinary as a Galois representation is not enough. So "ordinarily automorphic" has to be defined on the automorphic side, as in the published Definition 1.3 (p. 1241), and both applications of Theorem 6.1.2 need that input.

(i) The auxiliary prime l′. Sym^{n−1} r_{E,l′}|G_{F′} is polarizable and ordinary above l′, because E has good ordinary reduction at l′. Geraghty's Lemma 5.9 then gives ι′-ordinary automorphy (published, p. 1273).

(ii) V_{λ,t}, which is not polarizable. Prove ι-ordinarity directly, as in the published Lemma 4.3.
- Write V_{λ′,t} ≅ r_{l′,ι′}(π) with ι′ compatible with ι, so that V_{λ,t} ≅ r_{l,ι}(π).
- At each v | l we have v(t) < 0, and Lemma 3.12 shows that WD(V_{λ′,t}|G_{F′_v}) is a single Jordan block.
- Varma's bound WD(r_{l′,ι′}(π)|G_{F′_v})^{F-ss} ≺ ι′^{−1}rec(π_v|det|^{(1−n)/2}) compares partial sums of block sizes, and the two sides have the same semisimplification. So rec(π_v|det|^{(1−n)/2}) is also one block, and π_v ≅ Sp_n(ψ_v|·|^{(1−n)/2}) is a twist of Steinberg.
- The labelled Hodge–Tate weights are consecutive, so the automorphic weight is parallel. Geraghty's ordinarity conditions for this Steinberg representation then scale linearly in j, and they reduce to the single condition at j = n on val_l(ι^{−1}ψ_v(ϖ_v)^n) = val_l(ι^{−1}φ_{π,v}(ϖ_v)).
- That condition is fixed by the continuous, hence unit-valued, l-adic character r_{l,ι}(φ_π) = det r_{l,ι}(π)·ε^{n(n−1)/2}, whose Hodge–Tate weights are nλ_τ.

So V_{λ,t} ⊗ χ_1^{−1} is ι-ordinarily automorphic, and hypothesis (5) holds in the proof of Theorem 1.4. The Galois-side ordinarity taken from the companion preprint (v1 Lemma 3.10(4)) is then no longer needed, and the published version drops it. The conclusions "ordinarily automorphic" in the published Theorems 1.1 and 1.4 are to be read as ι-ordinary automorphy in the sense of the revised Definition 1.3. Source record: PAPER-QIAN-23/E13. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E72** (misprint, affects nothing): Citations of reference [1] (Allen et al., Potential automorphy over CM fields): Theorem 1.4, p. 1241; proof of Lemma 2.6(1),(2), p. 1251; proof of Proposition 4.1, pp. 1269–1270; last paragraph of the proof of Theorem 1.4, p. 1274; reference [1], p. 1274. Cite [1] in one version and give every location in that version. For the published version, Ann. of Math. 197 (2023), 897–1113 (arXiv:1812.09999): the enormous-image definition is Definition 6.2.29 (p. 1044); Lemmas 7.1.6 and 7.1.7, Definition 4.3.1, Theorems 5.5.1 and 6.1.2, Proposition 7.2.3 and Corollary 7.2.4 keep their numbers; the choice F_1^avoid = Q̄^{ker ∏_i r̄′_i}(ζ_{l′}), with l′ ∉ ℒ and the r̄′_i unramified above ℒ, is at the foot of p. 1099; the first paragraph of the proof of Corollary 7.2.4, with the choice of l and of the imaginary quadratic field L, is on p. 1100; the properties of ψ_m run over pp. 1100–1101; L_2 and L_3 = L_2 Q̄^{ker r̄_{E,l}} are on p. 1101; the application of Proposition 7.2.3 to F^avoid L_3 and the choice F_2^avoid = F_1^avoid L_3 are on p. 1102. Alternatively cite arXiv:1812.09999v2 (2022) explicitly; then Definition 6.2.28 and all lemma numbers are correct, and the page references 180, 181, 182 (both occurrences) and 183 become 205, 206, 206 and 208. If the 2018 arXiv version is meant, the lemma references become Lemma 7.1.5(2), Lemma 7.1.5(3) and Lemma 7.1.6, and pages 206 and 208 become 182 and 183. In every case the entry for [1] should name the version (arXiv identifier or journal) instead of “Cornell University, New York (2018)”. Source record: PAPER-QIAN-23/E16. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E73** (gap, affects the proof): Proof of Lemma 4.3, first paragraph, p. 1273. Under the hypotheses of Lemma 4.3, the only comparison available is V_{λ′,t}^{ss} ≅ r_{l′,ι′}(π). Here ι′ is chosen so that ι′ (through λ′) and ι (through λ) induce the same complex embedding of ℚ(ζ_N). The comparison follows from the equality of Frobenius characteristic polynomials across the compatible system, together with Chebotarev and Brauer–Nesbitt, because r_{l′,ι′}(π) is semisimple.

Replace the sentence by the following argument, which needs no new hypothesis.
1. By Lemma 3.12 (with v(t) < 0), the Frobenius-semisimplified Weil–Deligne representation of V_{λ′,t}|G_{F′_v} is Sp_n(ψ) for a character ψ of W_{F′_v}. Its Weil-group semisimplification is therefore the segment ψ, ψ|·|, …, ψ|·|^{n−1}.
2. The semisimplified Weil–Deligne representation depends only on the semisimplification of the Galois representation. So WD(r_{l′,ι′}(π)|G_{F′_v})^{ss} is the same segment.
3. By Varma's Theorem (1ss), which applies because v ∤ l′, the same holds for ι′^{−1}rec_{F′_v}(π_v|det|_v^{(1−n)/2})^{ss}. Hence the cuspidal support of π_v|det|_v^{(1−n)/2} is a single segment of n characters.
4. Since π is cuspidal, π_v is generic. By Zelevinsky's classification, a generic irreducible representation is an irreducible product δ(Δ_1) × ⋯ × δ(Δ_k) of essentially square-integrable representations whose segments are pairwise unlinked. Splitting one segment into k ≥ 2 pieces always produces two juxtaposed pieces, which are linked. So k = 1.
5. Hence π_v ≅ Sp_n(ψ_v|·|^{(1−n)/2}) is Steinberg, without using Varma's monodromy bound.

Alternatively, at the one place where the lemma is applied, in the proof of Theorem 1.1 (pp. 1272–1273), V_{λ′,t} is irreducible. This is because ρ = V_{λ′,t} ⊗ χ̃_2^{−1} has absolutely irreducible reduction Symm^{n−1} r̄_{E,l′}|G_{F′}. So V_{λ′,t} ≅ r_{l′,ι′}(π), and the printed isomorphism holds there. Source record: PAPER-QIAN-23/E41. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E74** (error, affects the proof): Proof of Lemma 4.3, second paragraph, p. 1273. In the conventions the paper uses, π has weight (λ_τ)_τ, that is, λ_{τ,i} = +λ_τ for all i. Both the identity to be shown and the identity obtained should read val_l(ι^{−1}φ_{π,v}(ϖ_v)) = val_l(∏_{τ:F′_v↪Q̄_l} τ(ϖ_v)^{nλ_τ}), where ψ_v(det α^{(n)}_{ϖ_v}) = ψ_v(ϖ_v)^n = φ_{π,v}(ϖ_v). For general j the condition is val_l(ι^{−1}ψ_v(ϖ_v)^j) = val_l(∏_τ τ(ϖ_v)^{jλ_τ}). Once both signs are corrected, dividing by n and multiplying by j works as before, the argument closes, and Lemma 4.3 holds. Source record: PAPER-QIAN-23/E43. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E75** (misprint, affects nothing): Remark 4.4, p. 1274. Read “Theorem 5.5.1 of [1]” (whose form for a single ι-ordinary automorphic representation is [1, Corollary 5.5.2]), “for any l-adic place v of F′”, and “ordinary as l-adic representation”, meaning ordinary at the l-adic places of F′. Source record: PAPER-QIAN-23/E44. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

- **PotentialAutomorphyInfrastructure/E76** (gap, affects nothing): Remark 4.4, p. 1274. First fix the misprints: "Theorem 5.5.1 or [1]" should read "of [1]", and "l-adic places v of F" should read "of F′". Then make the deduction only when the residual representation V[λ]_t ≅ χ̄_1 ⊗ r̄|G_{F′} of V_{λ,t} is absolutely irreducible and decomposed generic. Twisting by a character preserves both properties, so this is the same as asking that r̄|G_{F′} be absolutely irreducible and decomposed generic. That holds in the setting of Theorem 1.4, but not in general in Theorem 1.1. Under this condition, cite the single-representation result [1, Corollary 5.5.2], or equivalently [1, Theorem 5.5.1] together with [1, Lemma 6.2.11] after the soluble base change used in that corollary's proof. The conclusion then covers only the global points t produced in the proof, and only on the decomposition groups of F′ at places above l. For those points it gives the conclusion of the main theorem of [14]. It does not give it for every t of negative valuation over every finite extension of an l-adic field containing ζ_N. Source record: PAPER-QIAN-23/E45. Recorded in the reviewed Qian extraction; no newer published correction independently established here.

## Stage structure and red-team dispositions

**RT-AREA-langlands-1/7: lifting endpoints are missing from atlas stage statements.** Keep the six assigned stages. PA.4 owns ACC Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2. Add PA.1→PA.4, PA.2→PA.4 and PA.4→ModularityAndLanglandsExtensions:ML.2. ML.2 assembles potential automorphy and is never an input of a PA node.

**RT-AREA-langlands-1/21: Taylor–Wiles set and diamond construction has owner G7.** PA.4 imports G7 sets, diamonds and presentations and retains only the auxiliary-level arithmetic complexes, uniform bounds, diamond-linear actions and fixed-ultrafilter specialization. Add G7→PA.4.

**RT-AREA-langlands-1/22: derived support needs actual deformation inputs.** Add L7→PA.3, L8→PA.3, R08.2→PA.3, G7→PA.3 and G8→PA.3, as witnessed by the exact requests and component nodes. Add L7→DeformationAndDerivedPatchingAlgebra:P9 to export its component hypotheses. PA.3 has a conditional support contract; PA.4 constructs the patched inputs and applies it, so no PA.4→PA.3 dependency is introduced.

**RT-AREA-geomlanglands/24: integral highest-weight theory must have one owner independent of parameter stacks.** Create ReductiveGroupsPartII:RG2.6 for integral induced/Weyl/dual-Weyl modules, Kempf vanishing, Donkin criterion, Donkin–Mathieu tensor stability and the Koppinen/Donkin good filtration of O(G), building on upstream pinned integral group schemes. Add RG2.6→PA.1 and RG2.6→LP3. PA.1 retains only GL_n alcove/linkage bounds, Kostant and arithmetic weight calculations. LP3 retains LP1-dependent cocycle-scheme good filtrations, invariant cohomology, fixed-point and Donkin-subgroup assertions. Until RG2.6 exists the explicit gap remains.

**General compatible-system operations and iota-ordinary definitions already have owners.** R24.5:operations owns arbitrary-rank weak/very/extremely weak carriers and general operations; PA.5 owns rank-two transport theorems and weak automorphy prime to T. Broaden PL.0/iota-ordinary to the unpolarized RAC GL_n interface used by ACC and Qian, retaining a single definition owner and adapters to its polarized applications. PA.2 proves ordinary local-global compatibility in this broader setting.

**The corrected prime-field large-image theorem does not justify the real-multiplication residue-field assertion.** AbelianSurfacesPotentialModularity supplies the separate real-multiplication large-image argument for BCGP Lemma 9.2.2 type B[C₂]. It imports the corrected PA.5 theorem rather than reinstating SL₂(O_M/λ).

These are proposals for the maintainer to apply. No atlas, supplier packet or existing Tau Ceti roadmap is edited by this job. Until RG2.6 is created, its highest-weight dependency remains the named gap; an unresolved stage id is not presented as an existing supplier node.

## Target coverage

This target map distinguishes new arithmetic declarations from targets whose definitions and comparison theorems already have a supplier. Imports retain the exact requests and gaps above; none is counted as a closed theorem merely because it has an owner.

**PotentialAutomorphyInfrastructure:PA.0: Integral coefficients, finite/groupoid cohomology and coefficient/level/boundary comparisons.** Own declarations: [PA.0/integral-model-comparison](#integral-model-comparison), [PA.0/boundary-level-coefficient-comparison](#boundary-level-coefficient-comparison), [PA.0/coefficient-satake-descent](#coefficient-satake-descent), [PA.0/siegel-coefficient-retract](#siegel-coefficient-retract), [PA.0/ramified-satake-descent](#ramified-satake-descent), [PA.0/equivariant-retract](#equivariant-retract). Imports: `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`.

**PotentialAutomorphyInfrastructure:PA.1: Integral coefficient/highest-weight modules, reductions and filtrations.** Own declarations: [PA.0/unitary-levi-weight-dictionary](#unitary-levi-weight-dictionary), [PA.1/kostant-shuffles](#kostant-shuffles), [PA.1/integral-kostant-decomposition](#integral-kostant-decomposition). Imports: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.  Gap: Single integral highest-weight owner RG2.6 requires atlas creation.

**PotentialAutomorphyInfrastructure:PA.1: Degree-shift connecting maps, linkage/interval bounds and Fontaine–Laffaille transfer.** Own declarations: [PA.1/boundary-degree-retract](#boundary-degree-retract), [PA.1/unipotent-derived-formality](#unipotent-derived-formality), [PA.1/middle-degree-satake](#middle-degree-satake), [PA.1/ctg-weight](#ctg-weight), [PA.1/ctg-one-embedding-perturbation](#ctg-one-embedding-perturbation), [PA.1/fontaine-laffaille-degree-shifting](#fontaine-laffaille-degree-shifting), [PA.1/middle-range-fontaine-laffaille](#middle-range-fontaine-laffaille), [PA.1/nilpotent-fontaine-laffaille-transfer](#nilpotent-fontaine-laffaille-transfer), [PA.1/all-degree-fontaine-laffaille](#all-degree-fontaine-laffaille), [PA.1/degree-reflection-duality](#degree-reflection-duality), [PA.1/genericity-making-character-twist](#genericity-making-character-twist), [PA.1/shifted-partition-recovery](#shifted-partition-recovery), [PA.1/fontaine-laffaille-local-global](#fontaine-laffaille-local-global). Imports: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.4`, `IgusaVarietiesAndTorsionConcentration:IG.7`.

**PotentialAutomorphyInfrastructure:PA.2: Finite-quotient ordinary projector, arithmetic tower and local ordinary parts.** Own declarations: [PA.2/iwahori-level-tower](#iwahori-level-tower), [PA.2/arithmetic-ordinary-summand](#arithmetic-ordinary-summand), [PA.2/positive-torus-monoid](#positive-torus-monoid), [PA.2/lowest-weight-character](#lowest-weight-character), [PA.2/local-ordinary-parts](#local-ordinary-parts), [PA.2/ordinary-torus-invariants](#ordinary-torus-invariants), [PA.2/unipotent-invariants-acyclicity](#unipotent-invariants-acyclicity), [PA.2/ordinary-exact-injective](#ordinary-exact-injective), [PA.2/iwahori-borel-ordinary-comparison](#iwahori-borel-ordinary-comparison), [PA.2/derived-ordinary-comparison](#derived-ordinary-comparison), [PA.2/completed-arithmetic-cohomology](#completed-arithmetic-cohomology), [PA.2/completed-ordinary-cohomology](#completed-ordinary-cohomology), [PA.2/completed-classical-ordinary-control](#completed-classical-ordinary-control), [PA.2/ordinary-level-control](#ordinary-level-control), [PA.2/completed-ordinary-weight-control](#completed-ordinary-weight-control), [PA.2/finite-ordinary-weight-control](#finite-ordinary-weight-control), [PA.2/unitary-ordinary-tower](#unitary-ordinary-tower), [PA.2/ordinary-satake-homomorphism](#ordinary-satake-homomorphism), [PA.2/unitary-completed-boundary](#unitary-completed-boundary), [PA.2/unitary-ordinary-control](#unitary-ordinary-control). Imports: `PadicFamilies:L0a/finite-quotient-system`, `PadicFamilies:L0a/profinite-ordinary-projector`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**PotentialAutomorphyInfrastructure:PA.2: Parabolic induction, Bruhat ordinary filtration, central torus shifting and local–global full flag.** Own declarations: [PA.2/relative-bruhat-cells](#relative-bruhat-cells), [PA.2/bruhat-cell-induction](#bruhat-cell-induction), [PA.2/bruhat-filtration](#bruhat-filtration), [PA.2/bruhat-invariant-filtration](#bruhat-invariant-filtration), [PA.2/bruhat-unipotent-acyclicity](#bruhat-unipotent-acyclicity), [PA.2/ordinary-compact-cell-comparison](#ordinary-compact-cell-comparison), [PA.2/bruhat-unipotent-invariants](#bruhat-unipotent-invariants), [PA.2/bruhat-evaluation-comparison](#bruhat-evaluation-comparison), [PA.2/bruhat-orientation-character](#bruhat-orientation-character), [PA.2/ordinary-unipotent-degree-shift](#ordinary-unipotent-degree-shift), [PA.2/ordinary-bruhat-piece](#ordinary-bruhat-piece), [PA.2/completed-boundary-induction-retract](#completed-boundary-induction-retract), [PA.2/ordinary-boundary-degree-shifting](#ordinary-boundary-degree-shifting), [PA.2/ordinary-ctg-weight-choice](#ordinary-ctg-weight-choice), [PA.2/ordinary-middle-degree-quotient](#ordinary-middle-degree-quotient), [PA.2/determinant-torus](#determinant-torus), [PA.2/determinant-component-product](#determinant-component-product), [PA.2/determinant-neat-level-shrinking](#determinant-neat-level-shrinking), [PA.2/central-torus-cohomology-shifting](#central-torus-cohomology-shifting), [PA.2/all-degree-ordinary-characteristic-data](#all-degree-ordinary-characteristic-data), [PA.2/ordinary-local-global](#ordinary-local-global), [PA.2/ordinary-automorphic-galois-flag](#ordinary-automorphic-galois-flag). Imports: `IgusaVarietiesAndTorsionConcentration:IG.7`, `SmoothRepresentationsOfLocalGroups:SR.2`, `LocalGaloisDeformationRings:L7`.

**PotentialAutomorphyInfrastructure:PA.3: Mod-varpi local-condition/action comparison, components, amplitude and support.** Own declarations: [PA.3/local-condition-mod-varpi-comparison](#local-condition-mod-varpi-comparison), [PA.3/arithmetic-component-dimension-input](#arithmetic-component-dimension-input), [PA.3/arithmetic-derived-support-contract](#arithmetic-derived-support-contract), [PA.3/fontaine-laffaille-deformation-hecke-map](#fontaine-laffaille-deformation-hecke-map), [PA.3/ordinary-deformation-hecke-map](#ordinary-deformation-hecke-map). Imports: `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:L8`, `LocalGaloisDeformationRings:R08.2`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:G8`, `DeformationAndDerivedPatchingAlgebra:P9`.

**PotentialAutomorphyInfrastructure:PA.4: Taylor–Wiles set/diamond construction.** Own declarations: [PA.4/taylor-wiles-arithmetic-levels](#taylor-wiles-arithmetic-levels), [PA.4/ordinary-taylor-wiles-levels](#ordinary-taylor-wiles-levels). Imports: `GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes`, `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`. General construction imported; nodes construct only its arithmetic auxiliary levels.

**PotentialAutomorphyInfrastructure:PA.4: Fixed-ultrafilter arithmetic boundedness, comparison and specialization.** Own declarations: [PA.4/patched-arithmetic-mod-varpi-comparison](#patched-arithmetic-mod-varpi-comparison), [PA.4/taylor-wiles-selected-ideals](#taylor-wiles-selected-ideals), [PA.4/selected-ideal-properness](#selected-ideal-properness), [PA.4/diamond-derived-augmentation](#diamond-derived-augmentation), [PA.4/taylor-wiles-hecke-locality](#taylor-wiles-hecke-locality), [PA.4/diamond-linear-deformation-hecke-map](#diamond-linear-deformation-hecke-map), [PA.4/fontaine-laffaille-patching-verification](#fontaine-laffaille-patching-verification), [PA.4/fontaine-laffaille-dimension-amplitude](#fontaine-laffaille-dimension-amplitude), [PA.4/fontaine-laffaille-full-support](#fontaine-laffaille-full-support), [PA.4/fontaine-laffaille-lifting-at-good-level](#fontaine-laffaille-lifting-at-good-level), [PA.4/ordinary-hida-complex](#ordinary-hida-complex), [PA.4/weight-independent-hida-twist](#weight-independent-hida-twist), [PA.4/hida-weight-independence](#hida-weight-independence), [PA.4/hida-weight-specialization](#hida-weight-specialization), [PA.4/ordinary-diamond-augmentation](#ordinary-diamond-augmentation), [PA.4/ordinary-diamond-linear-hecke-map](#ordinary-diamond-linear-hecke-map), [PA.4/ordinary-patching-verification](#ordinary-patching-verification), [PA.4/ordinary-support-at-lifting-point](#ordinary-support-at-lifting-point), [PA.4/ordinary-lifting-at-good-level](#ordinary-lifting-at-good-level). Imports: `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P7`.

**PotentialAutomorphyInfrastructure:PA.4: Fontaine–Laffaille and ordinary lifting endpoints and their soluble descent.** Own declarations: [PA.4/fontaine-laffaille-lifting-descent](#fontaine-laffaille-lifting-descent), [PA.4/ordinary-lifting-descent](#ordinary-lifting-descent), [PA.4/fontaine-laffaille-automorphy-lifting](#fontaine-laffaille-automorphy-lifting), [PA.4/ordinary-automorphy-lifting](#ordinary-automorphy-lifting), [PA.4/neatness-auxiliary-places](#neatness-auxiliary-places). Imports: `ModularityAndLanglandsExtensions:ML.1`, `PotentialAutomorphyInfrastructurePartII:PL.0`.

**PotentialAutomorphyInfrastructure:PA.5: Compatible-system carrier, tensor/dual/character/restriction operations and their Frobenius, Hodge, purity, polarization, WD and lattice comparisons.** Own declarations: [PA.5/rank-two-symmetric-power-transport](#rank-two-symmetric-power-transport), [PA.5/residual-lifting-hypothesis-restriction](#residual-lifting-hypothesis-restriction), [PA.5/genericity-normal-closure-restriction](#genericity-normal-closure-restriction). Imports: `PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data`, `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`, `PotentialModularityAndCompatibleSystems:R24.5/system-operations`, `PotentialModularityAndCompatibleSystems:R24.5/polarized-operations`, `PotentialModularityAndCompatibleSystems:R24.5/character-system`. General definitions and operation comparisons imported; extend the owner to the weakened regimes and integral/WD exports, rather than planning them again.

**PotentialAutomorphyInfrastructure:PA.5: Controlled base-change lifting-input checklists.** Own declarations: [PA.5/split-test-prime-image-preservation](#split-test-prime-image-preservation), [PA.5/fontaine-laffaille-base-change-fields](#fontaine-laffaille-base-change-fields), [PA.5/ordinary-base-change-fields](#ordinary-base-change-fields), [PA.5/genericity-normal-closure-restriction](#genericity-normal-closure-restriction), [PA.5/residual-lifting-hypothesis-restriction](#residual-lifting-hypothesis-restriction), [PA.5/simple-galois-composita](#simple-galois-composita), [PA.5/symmetric-power-adjoint-genericity](#symmetric-power-adjoint-genericity), [PA.5/qian-symmetric-power-avoidance](#qian-symmetric-power-avoidance). Imports: `AutomorphicGaloisRepresentationsPartII:AG2.7`.

**PotentialAutomorphyInfrastructure:PA.5: Rank-two trichotomy, large image, weak automorphy and pure upgrade.** Own declarations: [PA.5/rank-two-reducibility-dichotomy](#rank-two-reducibility-dichotomy), [PA.5/rank-two-system-trichotomy](#rank-two-system-trichotomy), [PA.5/rank-two-large-residual-image](#rank-two-large-residual-image), [PA.5/rank-two-adjoint-monodromy](#rank-two-adjoint-monodromy), [PA.5/weak-automorphy-prime-to-set](#weak-automorphy-prime-to-set), [PA.5/pure-weak-automorphy-upgrade](#pure-weak-automorphy-upgrade), [PA.5/density-one-crystalline-large-image](#density-one-crystalline-large-image), [PA.5/rank-two-weight-zero](#rank-two-weight-zero), [PA.5/rank-two-odd](#rank-two-odd), [PA.5/rank-two-member-irreducibility-equivalence](#rank-two-member-irreducibility-equivalence), [PA.5/strong-irreducibility-symmetric-square](#strong-irreducibility-symmetric-square), [PA.5/corrected-rank-two-large-image](#corrected-rank-two-large-image). Imports: `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

## Extraction coverage and source routing

Every supplied extraction item is accounted for here. “Owned” means the declaration above; an owner stage means import/request; a context means the full hypothesis registry above; a gap means the explicit missing highest-weight owner. Mathematical statements for owned declarations are given in the stage text. Imported items keep their source statement and locator in the packet’s `sourceCoverage`; they do not become duplicate declarations in this reader.

| Extraction item | Disposition | Owner | Source locator |
| --- | --- | --- | --- |
| `PAPER-ALLEN-ETAL-23/8` | owned | PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles | §1.2 Notation, pp. 905–906 |
| `PAPER-ALLEN-ETAL-23/30` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.1 | §2.1.9, Lemma 2.1.10, p. 913 |
| `PAPER-ALLEN-ETAL-23/31` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.1 | §2.1.9, Lemma 2.1.11, p. 914 |
| `PAPER-ALLEN-ETAL-23/34` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.1 | §2.1.9, Lemma 2.1.14, p. 915 |
| `PAPER-ALLEN-ETAL-23/35` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.1 | §2.1.9, pp. 915–916 |
| `PAPER-ALLEN-ETAL-23/37` | gap | gap:RG2.6 | §2.2.1, pp. 917–918 |
| `PAPER-ALLEN-ETAL-23/38` | owned | PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary | §2.2.1, eq. (2.2.2), pp. 918–919 |
| `PAPER-ALLEN-ETAL-23/45` | owned | PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower | §2.2.5, pp. 922–923 |
| `PAPER-ALLEN-ETAL-23/46` | owned | PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower | §2.2.5, pp. 923–924 |
| `PAPER-ALLEN-ETAL-23/76` | import-or-request | ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization | §2.4.1, Theorem 2.4.2, pp. 941–945 (proof pp. 942–945) |
| `PAPER-ALLEN-ETAL-23/79` | owned | PotentialAutomorphyInfrastructure:PA.0/coefficient-satake-descent | §2.4.1, Theorem 2.4.4 with (2.4.5)–(2.4.7), pp. 945–946 |
| `PAPER-ALLEN-ETAL-23/80` | owned | PotentialAutomorphyInfrastructure:PA.0/siegel-coefficient-retract | §2.4.1, proof of Theorem 2.4.4, (2.4.7), pp. 945–946 |
| `PAPER-ALLEN-ETAL-23/81` | owned | PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent | §2.4.1, Theorem 2.4.8, pp. 946–948 |
| `PAPER-ALLEN-ETAL-23/82` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.1 | §2.4.1, statement and proof of Theorem 2.4.8, pp. 946–947; recalled in §3.2, pp. 957–958 |
| `PAPER-ALLEN-ETAL-23/88` | import-or-request | ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra | §3.1, pp. 953–954 |
| `PAPER-ALLEN-ETAL-23/101` | import-or-request | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules | §4.1, pp. 964–966 |
| `PAPER-ALLEN-ETAL-23/102` | import-or-request | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion | §4.1, (4.1.1), p. 966 |
| `PAPER-ALLEN-ETAL-23/103` | import-or-request | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-functor | §4.1, p. 966 |
| `PAPER-ALLEN-ETAL-23/104` | import-or-request | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 | §4.1, p. 966 |
| `PAPER-ALLEN-ETAL-23/105` | import-or-request | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence | §4.1, p. 966 |
| `PAPER-ALLEN-ETAL-23/106` | owned | PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-local-global | §4.1, Theorem 4.5.1, p. 967 (restated §4.5, p. 985; proof pp. 985–988) |
| `PAPER-ALLEN-ETAL-23/107` | owned | PotentialAutomorphyInfrastructure:PA.1/boundary-degree-retract | §4.2, Theorem 4.2.1, pp. 968–970 |
| `PAPER-ALLEN-ETAL-23/108` | owned | PotentialAutomorphyInfrastructure:PA.0/equivariant-retract | §4.2, after Theorem 4.2.1, p. 969 |
| `PAPER-ALLEN-ETAL-23/109` | owned | PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology | §4.2, Lemma 4.2.2(1), p. 970 |
| `PAPER-ALLEN-ETAL-23/110` | owned | PotentialAutomorphyInfrastructure:PA.1/integral-kostant-decomposition | §4.2, Lemma 4.2.2(2), pp. 970–971 |
| `PAPER-ALLEN-ETAL-23/111` | owned | PotentialAutomorphyInfrastructure:PA.1/unipotent-derived-formality | §4.2, Lemma 4.2.3, pp. 971–972 |
| `PAPER-ALLEN-ETAL-23/117` | owned | PotentialAutomorphyInfrastructure:PA.1/middle-degree-satake | §4.3, Proposition 4.3.4, pp. 973–974 |
| `PAPER-ALLEN-ETAL-23/119` | owned | PotentialAutomorphyInfrastructure:PA.1/ctg-weight | §4.3, Definition 4.3.5 and following paragraph, p. 974 |
| `PAPER-ALLEN-ETAL-23/120` | owned | PotentialAutomorphyInfrastructure:PA.1/ctg-one-embedding-perturbation | §4.3, Lemma 4.3.6 and (4.3.7), pp. 974–975 |
| `PAPER-ALLEN-ETAL-23/122` | owned | PotentialAutomorphyInfrastructure:PA.1/fontaine-laffaille-degree-shifting | §4.4, Proposition 4.4.1 (with Hypothesis 4.4.2 and (4.4.3)–(4.4.5) in its proof), pp. 975–978 |
| `PAPER-ALLEN-ETAL-23/125` | owned | PotentialAutomorphyInfrastructure:PA.1/middle-range-fontaine-laffaille | §4.4, Proposition 4.4.6, pp. 979–981 |
| `PAPER-ALLEN-ETAL-23/126` | owned | PotentialAutomorphyInfrastructure:PA.1/nilpotent-fontaine-laffaille-transfer | §4.4, proof of Proposition 4.4.6, pp. 980–981 (Remark 4.4.7) |
| `PAPER-ALLEN-ETAL-23/127` | owned | PotentialAutomorphyInfrastructure:PA.1/all-degree-fontaine-laffaille | §4.4, Corollary 4.4.8, pp. 981–984 |
| `PAPER-ALLEN-ETAL-23/129` | owned | PotentialAutomorphyInfrastructure:PA.1/degree-reflection-duality | §4.4, proof of Corollary 4.4.8, pp. 983–984 |
| `PAPER-ALLEN-ETAL-23/130` | owned | PotentialAutomorphyInfrastructure:PA.1/genericity-making-character-twist | §4.4, proof of Corollary 4.4.8, p. 984 |
| `PAPER-ALLEN-ETAL-23/133` | owned | PotentialAutomorphyInfrastructure:PA.1/shifted-partition-recovery | §4.5, Lemma 4.5.2, p. 989 |
| `PAPER-ALLEN-ETAL-23/134` | owned | PotentialAutomorphyInfrastructure:PA.2/iwahori-level-tower | §5.1, pp. 989–991 |
| `PAPER-ALLEN-ETAL-23/135` | owned | PotentialAutomorphyInfrastructure:PA.2/arithmetic-ordinary-summand | §5.1, p. 990 |
| `PAPER-ALLEN-ETAL-23/136` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-galois-characters | §5.1, p. 990 |
| `PAPER-ALLEN-ETAL-23/137` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-local-global | §5.1, Theorem 5.5.1, p. 991; restated and proved in §5.5, pp. 1026–1027 |
| `PAPER-ALLEN-ETAL-23/138` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.0:derived-extension | §5.2.1, (5.2.2)–(5.2.3), p. 992 |
| `PAPER-ALLEN-ETAL-23/139` | import-or-request | SmoothRepresentationsOfLocalGroups:SR.0:derived-extension | §5.2.1, Lemma 5.2.4, p. 992 |
| `PAPER-ALLEN-ETAL-23/140` | owned | PotentialAutomorphyInfrastructure:PA.2/positive-torus-monoid | §5.2.1, pp. 992–993 |
| `PAPER-ALLEN-ETAL-23/141` | owned | PotentialAutomorphyInfrastructure:PA.2/lowest-weight-character | §5.2.1, p. 993 |
| `PAPER-ALLEN-ETAL-23/142` | owned | PotentialAutomorphyInfrastructure:PA.2/local-ordinary-parts | §5.2.1, (5.2.5), pp. 993–994 |
| `PAPER-ALLEN-ETAL-23/143` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-torus-invariants | §5.2.1, Lemma 5.2.6, p. 995 |
| `PAPER-ALLEN-ETAL-23/144` | owned | PotentialAutomorphyInfrastructure:PA.2/unipotent-invariants-acyclicity | §5.2.1, Lemma 5.2.7(1), p. 995 |
| `PAPER-ALLEN-ETAL-23/145` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-exact-injective | §5.2.1, Lemma 5.2.7(2), pp. 995–996 |
| `PAPER-ALLEN-ETAL-23/146` | owned | PotentialAutomorphyInfrastructure:PA.2/iwahori-borel-ordinary-comparison | §5.2.1, Lemma 5.2.8, pp. 996–997 |
| `PAPER-ALLEN-ETAL-23/147` | owned | PotentialAutomorphyInfrastructure:PA.2/derived-ordinary-comparison | §5.2.1, Lemma 5.2.9, pp. 997–998 |
| `PAPER-ALLEN-ETAL-23/148` | owned | PotentialAutomorphyInfrastructure:PA.2/completed-arithmetic-cohomology | §5.2.10, (5.2.11)–(5.2.13), p. 998 |
| `PAPER-ALLEN-ETAL-23/150` | owned | PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-cohomology | §5.2.10, p. 999 |
| `PAPER-ALLEN-ETAL-23/151` | owned | PotentialAutomorphyInfrastructure:PA.2/completed-classical-ordinary-control | §5.2.10, Proposition 5.2.15, p. 999 |
| `PAPER-ALLEN-ETAL-23/152` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-level-control | §5.2.10, Corollary 5.2.16, p. 999 |
| `PAPER-ALLEN-ETAL-23/153` | owned | PotentialAutomorphyInfrastructure:PA.2/completed-ordinary-weight-control | §5.2.10, Proposition 5.2.17, p. 1000 |
| `PAPER-ALLEN-ETAL-23/154` | owned | PotentialAutomorphyInfrastructure:PA.2/finite-ordinary-weight-control | §5.2.10, Corollary 5.2.18, p. 1000 |
| `PAPER-ALLEN-ETAL-23/155` | owned | PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower | §5.2.19, pp. 1000–1001 |
| `PAPER-ALLEN-ETAL-23/156` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-satake-homomorphism | §5.2.19, p. 1001 |
| `PAPER-ALLEN-ETAL-23/157` | owned | PotentialAutomorphyInfrastructure:PA.2/unitary-completed-boundary | §5.2.19, (5.2.20)–(5.2.27), p. 1002 |
| `PAPER-ALLEN-ETAL-23/158` | owned | PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-control | §5.2.19, Proposition 5.2.28, p. 1003 |
| `PAPER-ALLEN-ETAL-23/159` | owned | PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells | §5.3, pp. 1003–1004 |
| `PAPER-ALLEN-ETAL-23/160` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-cell-induction | §5.3, pp. 1003–1004 |
| `PAPER-ALLEN-ETAL-23/161` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-filtration | §5.3, Proposition 5.3.1 and (5.3.2), pp. 1004–1005 |
| `PAPER-ALLEN-ETAL-23/162` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-invariant-filtration | §5.3, Lemma 5.3.3, pp. 1005–1006 |
| `PAPER-ALLEN-ETAL-23/163` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-acyclicity | §5.3, Lemma 5.3.4(1), p. 1006 |
| `PAPER-ALLEN-ETAL-23/164` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-compact-cell-comparison | §5.3, Lemma 5.3.4(2), pp. 1006–1007 |
| `PAPER-ALLEN-ETAL-23/165` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-unipotent-invariants | §5.3, p. 1007 |
| `PAPER-ALLEN-ETAL-23/166` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-evaluation-comparison | §5.3, Lemma 5.3.5 and (5.3.6), pp. 1007–1008 |
| `PAPER-ALLEN-ETAL-23/167` | owned | PotentialAutomorphyInfrastructure:PA.2/bruhat-orientation-character | §5.3, p. 1008 |
| `PAPER-ALLEN-ETAL-23/168` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-unipotent-degree-shift | §5.3, Lemma 5.3.7, pp. 1008–1010 |
| `PAPER-ALLEN-ETAL-23/169` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-bruhat-piece | §5.3, Proposition 5.3.8, pp. 1010–1011 |
| `PAPER-ALLEN-ETAL-23/170` | owned | PotentialAutomorphyInfrastructure:PA.2/completed-boundary-induction-retract | §5.4, Theorem 5.4.1, pp. 1011–1013 |
| `PAPER-ALLEN-ETAL-23/171` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-boundary-degree-shifting | §5.4, Theorem 5.4.3, pp. 1013–1015 |
| `PAPER-ALLEN-ETAL-23/172` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-ctg-weight-choice | §5.4, Lemma 5.4.8 and (5.4.9)–(5.4.12), pp. 1015–1017 |
| `PAPER-ALLEN-ETAL-23/173` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-middle-degree-quotient | §5.4, Proposition 5.4.13, pp. 1017–1018 |
| `PAPER-ALLEN-ETAL-23/174` | owned | PotentialAutomorphyInfrastructure:PA.2/determinant-torus | §5.4, pp. 1018, 1020 |
| `PAPER-ALLEN-ETAL-23/176` | owned | PotentialAutomorphyInfrastructure:PA.2/determinant-component-product | §5.4, Lemma 5.4.14(2)–(4), pp. 1018–1019 |
| `PAPER-ALLEN-ETAL-23/177` | owned | PotentialAutomorphyInfrastructure:PA.2/determinant-neat-level-shrinking | §5.4, Lemma 5.4.15, pp. 1019–1020 |
| `PAPER-ALLEN-ETAL-23/178` | owned | PotentialAutomorphyInfrastructure:PA.2/central-torus-cohomology-shifting | §5.4, Lemma 5.4.16 and (5.4.17), pp. 1020–1021 |
| `PAPER-ALLEN-ETAL-23/179` | owned | PotentialAutomorphyInfrastructure:PA.2/all-degree-ordinary-characteristic-data | §5.4, Proposition 5.4.18 and (5.4.19)–(5.4.23), pp. 1022–1026 |
| `PAPER-ALLEN-ETAL-23/180` | owned | PotentialAutomorphyInfrastructure:PA.2/ordinary-automorphic-galois-flag | §5.5, Corollary 5.5.2, p. 1028 |
| `PAPER-ALLEN-ETAL-23/181` | owned | PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-automorphy-lifting | §6.1, Theorem 6.1.1 and Remark 6.1.4, pp. 1029–1030 |
| `PAPER-ALLEN-ETAL-23/182` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-automorphy-lifting | §6.1, Theorem 6.1.2 and Remark 6.1.3, pp. 1029–1030 |
| `PAPER-ALLEN-ETAL-23/203` | import-or-request | GlobalGaloisDeformations:G7/taylor-wiles-local-diamond | §6.2.18, Lemma 6.2.19, p. 1038 |
| `PAPER-ALLEN-ETAL-23/204` | import-or-request | GlobalGaloisDeformations:G7/taylor-wiles-local-diamond | §6.2.18, p. 1039 |
| `PAPER-ALLEN-ETAL-23/218` | import-or-request | GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes | §6.2.28, p. 1045 |
| `PAPER-ALLEN-ETAL-23/221` | import-or-request | GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes | §6.2.28, Lemma 6.2.32, pp. 1045–1046 |
| `PAPER-ALLEN-ETAL-23/222` | import-or-request | GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation | §6.2.28, Proposition 6.2.33, p. 1047 |
| `PAPER-ALLEN-ETAL-23/228` | import-or-request | DeformationAndDerivedPatchingAlgebra:P9 | §6.3.5, pp. 1050–1051 |
| `PAPER-ALLEN-ETAL-23/229` | import-or-request | DeformationAndDerivedPatchingAlgebra:P9 | §6.3.5, Assumption 6.3.6, p. 1051 |
| `PAPER-ALLEN-ETAL-23/231` | import-or-request | DeformationAndDerivedPatchingAlgebra:P9 | §6.3.5, Proposition 6.3.8, p. 1052 |
| `PAPER-ALLEN-ETAL-23/232` | import-or-request | DeformationAndDerivedPatchingAlgebra:P9 | §6.3.5, Corollary 6.3.9, pp. 1052–1053 |
| `PAPER-ALLEN-ETAL-23/233` | import-or-request | DeformationAndDerivedPatchingAlgebra:P8 | §6.4.1 (Set-up for patching), pp. 1053–1054 |
| `PAPER-ALLEN-ETAL-23/249` | import-or-request | DeformationAndDerivedPatchingAlgebra:P8 | §6.4.2, Remark 6.4.13, p. 1059 |
| `PAPER-ALLEN-ETAL-23/253` | owned | PotentialAutomorphyInfrastructure:PA.4/patched-arithmetic-mod-varpi-comparison | §6.4.2, Proposition 6.4.17, pp. 1060–1061 |
| `PAPER-ALLEN-ETAL-23/254` | hypothesis-context | context:FL-good-level | §6.5.1 (Application of the patching argument, Fontaine–Laffaille case), pp. 1061–1062 |
| `PAPER-ALLEN-ETAL-23/257` | owned | PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map | §6.5.1, Proposition 6.5.3, p. 1063 |
| `PAPER-ALLEN-ETAL-23/258` | owned | PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-full-support | §6.5.1, Theorem 6.5.4, p. 1063; proof pp. 1067–1070 |
| `PAPER-ALLEN-ETAL-23/259` | owned | PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-at-good-level | §6.5.1, Corollary 6.5.5, pp. 1063–1064 |
| `PAPER-ALLEN-ETAL-23/260` | owned | PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels | §6.5.1, paragraphs after Corollary 6.5.5, (6.5.6), (6.5.7), pp. 1064–1065 |
| `PAPER-ALLEN-ETAL-23/261` | owned | PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-selected-ideals | §6.5.1, paragraph before Lemma 6.5.8, p. 1065 |
| `PAPER-ALLEN-ETAL-23/262` | owned | PotentialAutomorphyInfrastructure:PA.4/selected-ideal-properness | §6.5.1, Lemma 6.5.8, p. 1065 |
| `PAPER-ALLEN-ETAL-23/263` | owned | PotentialAutomorphyInfrastructure:PA.4/diamond-derived-augmentation | §6.5.1, Lemma 6.5.9, p. 1066 |
| `PAPER-ALLEN-ETAL-23/264` | owned | PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-hecke-locality | §6.5.1, (6.5.10) and following paragraph, p. 1066 |
| `PAPER-ALLEN-ETAL-23/265` | owned | PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map | §6.5.1, Proposition 6.5.11, pp. 1066–1067 |
| `PAPER-ALLEN-ETAL-23/266` | owned | PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-patching-verification | §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069 |
| `PAPER-ALLEN-ETAL-23/267` | owned | PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-dimension-amplitude | §6.5.1, proof of Theorem 6.5.4, pp. 1069–1070 |
| `PAPER-ALLEN-ETAL-23/270` | owned | PotentialAutomorphyInfrastructure:PA.4/fontaine-laffaille-lifting-descent | §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074 |
| `PAPER-ALLEN-ETAL-23/271` | owned | PotentialAutomorphyInfrastructure:PA.5/split-test-prime-image-preservation | §6.5.12, proof of Theorem 6.1.1, p. 1072 (and §6.6.10, p. 1082) |
| `PAPER-ALLEN-ETAL-23/272` | owned | PotentialAutomorphyInfrastructure:PA.5/fontaine-laffaille-base-change-fields | §6.5.12, proof of Theorem 6.1.1, pp. 1072–1073 |
| `PAPER-ALLEN-ETAL-23/273` | owned | PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places | §6.5.12, proof of Theorem 6.1.1, pp. 1073–1074 (and §6.6.10, p. 1084) |
| `PAPER-ALLEN-ETAL-23/275` | hypothesis-context | context:ordinary-good-level | §6.6.1 (Application of the patching argument, ordinary case), pp. 1074–1076 |
| `PAPER-ALLEN-ETAL-23/276` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-at-good-level | §6.6.1, Theorem 6.6.2, p. 1075; proof pp. 1080–1081 |
| `PAPER-ALLEN-ETAL-23/279` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-hida-complex | §6.6.1, (6.6.3), (6.6.4), pp. 1076–1077 |
| `PAPER-ALLEN-ETAL-23/280` | owned | PotentialAutomorphyInfrastructure:PA.4/weight-independent-hida-twist | §6.6.1, p. 1077 |
| `PAPER-ALLEN-ETAL-23/281` | owned | PotentialAutomorphyInfrastructure:PA.4/hida-weight-independence | §6.6.1, Lemma 6.6.5, p. 1077 |
| `PAPER-ALLEN-ETAL-23/282` | owned | PotentialAutomorphyInfrastructure:PA.4/hida-weight-specialization | §6.6.1, Corollary 6.6.6, pp. 1077–1078 |
| `PAPER-ALLEN-ETAL-23/283` | owned | PotentialAutomorphyInfrastructure:PA.3/ordinary-deformation-hecke-map | §6.6.1, Proposition 6.6.7, p. 1078 |
| `PAPER-ALLEN-ETAL-23/284` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-taylor-wiles-levels | §6.6.1, pp. 1078–1079 |
| `PAPER-ALLEN-ETAL-23/285` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-augmentation | §6.6.1, Lemma 6.6.8, p. 1079 |
| `PAPER-ALLEN-ETAL-23/286` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-diamond-linear-hecke-map | §6.6.1, Proposition 6.6.9 and the preceding paragraph, pp. 1079–1080 |
| `PAPER-ALLEN-ETAL-23/287` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-patching-verification | §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081 |
| `PAPER-ALLEN-ETAL-23/288` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-support-at-lifting-point | §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081 |
| `PAPER-ALLEN-ETAL-23/289` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-lifting-descent | §6.6.10, proof of Theorem 6.1.2, pp. 1081–1084 |
| `PAPER-ALLEN-ETAL-23/290` | owned | PotentialAutomorphyInfrastructure:PA.5/ordinary-base-change-fields | §6.6.10, proof of Theorem 6.1.2, pp. 1082–1084 |
| `PAPER-ALLEN-ETAL-23/291` | import-or-request | PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data | §7.1, definitions (1)–(5), pp. 1084–1085 |
| `PAPER-ALLEN-ETAL-23/293` | import-or-request | PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates | §7.1, p. 1085 |
| `PAPER-ALLEN-ETAL-23/294` | owned | PotentialAutomorphyInfrastructure:PA.5/rank-two-reducibility-dichotomy | §7.1, Lemma 7.1.1, p. 1086 |
| `PAPER-ALLEN-ETAL-23/295` | import-or-request | PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates | §7.1, p. 1086 |
| `PAPER-ALLEN-ETAL-23/296` | owned | PotentialAutomorphyInfrastructure:PA.5/rank-two-system-trichotomy | §7.1, Lemma 7.1.2, pp. 1086–1087 |
| `PAPER-ALLEN-ETAL-23/297` | owned | PotentialAutomorphyInfrastructure:PA.5/rank-two-large-residual-image | §7.1, Lemma 7.1.3, pp. 1087–1089 |
| `PAPER-ALLEN-ETAL-23/298` | owned | PotentialAutomorphyInfrastructure:PA.5/rank-two-adjoint-monodromy | §7.1, proof of Lemma 7.1.3, facts (1)–(8), pp. 1088–1089 |
| `PAPER-ALLEN-ETAL-23/307` | import-or-request | PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates | §7.1, p. 1092 |
| `PAPER-ALLEN-ETAL-23/312` | import-or-request | AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi | §7.1, Lemma 7.1.9, pp. 1093–1094 |
| `PAPER-ALLEN-ETAL-23/313` | import-or-request | AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi | §7.1, Lemma 7.1.10, p. 1094 |
| `PAPER-QIAN-23/005` | import-or-request | PotentialAutomorphyInfrastructurePartII:PL.0 | Definition 1.3, p. 1241 (last sentence, citing [8] = Geraghty, Definition 5.3); l-adic use in Lemma 4.3 and its proof, p. 1273, and in the conclusion of Theorem 1.4, p. 1241; Remark 4.4, p. 1274; compare the conclusion of ACC+ Theorem 6.1.2, p. 1030 |
| `PAPER-QIAN-23/027` | owned | PotentialAutomorphyInfrastructure:PA.5/qian-symmetric-power-avoidance | Lemma 2.6(2), p. 1251; proof pp. 1251–1252 |
| `PAPER-QIAN-23/072` | owned | PotentialAutomorphyInfrastructure:PA.4/ordinary-automorphy-lifting | ACC+ (Allen et al., Ann. of Math. 197 (2023)), Theorem 6.1.2, pp. 1029–1030; applied in the proofs of Theorem 1.1 (pp. 1272–1273) and Theorem 1.4 (p. 1274) |
| `PAPER-QIAN-23/089` | owned | PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction | ACC+ (Allen et al., Ann. of Math. 197 (2023)), Lemma 7.1.7, p. 1091; applied in the proof of Theorem 1.4 (last paragraph of §4), p. 1274, with correction E3 |
| `PAPER-QIAN-23/115` | owned | PotentialAutomorphyInfrastructure:PA.5/residual-lifting-hypothesis-restriction | Remark after Definition 1.3, p. 1241; proof of Theorem 1.4, p. 1274 ('all conditions except decomposed genericity follows from the corresponding conditions of r̄') |
| `PAPER-QIAN-23/121` | owned | PotentialAutomorphyInfrastructure:PA.5/symmetric-power-adjoint-genericity | Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne, Potential automorphy over CM fields, Ann. of Math. 197 (2023), Lemma 7.1.6(3), pp. 1090–1091; used in the proof of Lemma 2.6(2), p. 1251 |
| `PAPER-QIAN-23/122` | owned | PotentialAutomorphyInfrastructure:PA.5/simple-galois-composita | Proof of Lemma 2.6(2), pp. 1251–1252 (the claims 'Gal(Ẽ/E) = (Z/2Z)^r' and 'Gal(F̃′_i/F̃′_{i−1}) … is of form Δ_i^m', both attributed to Goursat's lemma) |
| `PAPER-QIAN-23/134` | import-or-request | PotentialAutomorphyInfrastructurePartII:PL.0 | Geraghty, Math. Ann. 373 (2019), Definition 5.3 (reference [8]); cited in Definition 1.3, p. 1241; used in Lemma 4.3, p. 1273, and in ACC+ Theorem 6.1.2(5) (p. 1030) and Corollary 5.5.2 (p. 1028); the groups Iw_v(b,c) as recalled in ACC+, p. 922 |
| `PAPER-QIAN-23/135` | import-or-request | PotentialAutomorphyInfrastructurePartII:PL.0 | Proof of Lemma 4.3, second paragraph, p. 1273, citing Lemmas 5.2 and 5.6 of Geraghty [8] |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/88` | import-or-request | PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data | §6.1, Definition 6.1.1, pp. 50–51 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/89` | import-or-request | PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates | §6.1, Definition 6.1.2, pp. 51–52 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/90` | owned | PotentialAutomorphyInfrastructure:PA.5/weak-automorphy-prime-to-set | §6.1, Definition 6.1.2(3), p. 52 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/91` | import-or-request | AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi | §6.1, p. 52 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/94` | owned | PotentialAutomorphyInfrastructure:PA.5/pure-weak-automorphy-upgrade | §6.1, Lemma 6.1.4 and proof, p. 52 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/96` | owned | PotentialAutomorphyInfrastructure:PA.5/density-one-crystalline-large-image | §6.1, Lemma 6.1.5 and proof, p. 53 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/97` | owned | PotentialAutomorphyInfrastructure:PA.5/rank-two-system-trichotomy | §7.1, proof of Theorem 7.1.1, p. 61; proof of Theorem 7.2.1, pp. 61–62 |
| `PAPER-BOXER-CALEGARI-GEE-ETAL-25/145` | owned | PotentialAutomorphyInfrastructure:PA.5/rank-two-symmetric-power-transport | Used throughout §6, pp. 52–62 |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/122` | split between definitions, imported predicates and three corrected theorem parts | PotentialAutomorphyInfrastructure:PA.5/rank-two-weight-zero, PotentialAutomorphyInfrastructure:PA.5/rank-two-odd, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialAutomorphyInfrastructure:PA.5/rank-two-member-irreducibility-equivalence, PotentialAutomorphyInfrastructure:PA.5/strong-irreducibility-symmetric-square, PotentialAutomorphyInfrastructure:PA.5/corrected-rank-two-large-image | BCGP §9.1, split across definitions and three theorem parts |

## Prototype and validation boundary

The suggested file types the eight concrete definition cores `EquivariantRetract`, `KostantShuffle`, `CTGWeight`, `PositiveTorusMonoid`, `LowestWeightCharacter`, `UnitaryLeviWeight`, `RankTwoWeightZero`, `RankTwoOdd`, the numeric ν part of the Hida twist and the finite shifted-partition theorem. Its API lemmas and examples test these actual finite, matrix, monoid-character and categorical types. The owner-dependent cuspidal-exclusion, lattice-projection and automorphic-oddness API items cannot yet be typed. All remaining arithmetic declaration, API and test names occur in a comment carrying the complete mathematical obligation and its missing supplier dependencies. These comments are not elaborated signatures, and compilation of the available cores does not verify the arithmetic interface.

The arithmetic types must come from the owners named above before those dependent signatures are added. A proposition-valued placeholder would allow meaningless signatures, so none is introduced. Every node retains `implementationStatus: unchecked`. The [handoff](../handoff/BP-PotentialAutomorphyInfrastructure.md) records the exact packet and compilation checks and the next steps for closure.
