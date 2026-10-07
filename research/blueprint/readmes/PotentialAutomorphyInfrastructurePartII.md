# Reusable infrastructure for potential automorphy over CM fields, Part II: polarized automorphy lifting and finiteness of deformation rings

## Purpose

This roadmap builds the polarized (conjugate self-dual) automorphy lifting theory: the machinery that proves that a Galois representation congruent to an automorphic one is itself automorphic, for representations of the absolute Galois group of a CM or totally real field that are conjugate self-dual up to twist. It plans automorphic forms on definite unitary groups with integral coefficients, their spherical, Iwahori and ordinary Hecke algebras, Taylor–Wiles primes under adequacy and the Taylor–Wiles–Kisin patching arguments of Clozel–Harris–Taylor, Thorne and Geraghty. On these rest the minimal, ordinary, 2-adic and potentially diagonalizable automorphy lifting theorems and the finiteness theorems for polarized deformation rings of Thorne and of Barnet-Lamb–Gee–Geraghty–Taylor (BLGGT14), the residually reducible lifting theorems of Thorne and Allen–Newton–Thorne with the deformation theory of Newton–Thorne, the vanishing of adjoint Bloch–Kato Selmer groups of unitary type, and two further lifting theorems: the integral R = T theorem for rigid residual representations of Liu–Tian–Xiao–Zhang–Zhu and the lifting theorem from generic local domains of Le–Le Hung–Levin–Morra.

The consumers are ModularityAndLanglandsExtensions ML.2 (potential automorphy) and ML.3 (symmetric power functoriality), the level-one change of weight of Boxer–Calegari–Gee, Fakhruddin–Khare–Patrikis's lifting of reducible representations, Clozel–Thorne's level raising, and the Beilinson–Bloch–Kato work of Liu–Tian–Xiao–Zhang–Zhu.

## Where this roadmap starts

This is a Part II of *Reusable infrastructure for potential automorphy over CM fields* (`PotentialAutomorphyInfrastructure`), its first prerequisite. The parent follows Allen et al. (ACC+): unpolarized representations, the cohomology of locally symmetric spaces of GL_n, derived patching and derived Ihara avoidance. This roadmap starts where the parent stops and treats the polarized case through algebraic modular forms on definite unitary groups, where the relevant cohomology is concentrated in degree zero and classical patching suffices. The parent's ordinary parts (PA.2) belong to the unpolarized setting; the definite unitary ordinary Hecke algebras of PL.2 are built from the same finite ordinary projector of PadicFamilies L0a and are compared with, not taken from, PA.2.

Everything this roadmap uses from elsewhere is imported, never re-planned:

| Supplier | What is imported |
| --- | --- |
| ArithmeticGaloisRepresentations G7 | the group scheme 𝒢_n and the dictionary with polarized triples; adequate, GHT-adequate and enormous subgroups with their verification criteria; induction and tensor operations |
| GlobalGaloisDeformations G7, R04.1–R04.4 | polarized global deformation problems, representability, tangent and obstruction spaces, presentations over the local rings, determinant deformation functors, restriction maps, Carayol's theorem, Φ_p |
| LocalGaloisDeformationRings R08.1–R08.4, L7, L8 | framed local lifting rings, Steinberg and minimally ramified conditions, Ihara-avoidance rings, potentially semistable rings of fixed type, Fontaine–Laffaille rings, the ordinary flag rings R^△ and coefficient rings Λ_v, rank-two Barsotti–Tate components |
| DeformationAndDerivedPatchingAlgebra R03.4–R03.6 | characteristic-zero points from finiteness and dimension, module patching (requested), support, near faithfulness and R = T over patched rings |
| IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1 | Chenevier's determinants, pseudocharacters and Cayley–Hamilton algebras |
| AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7 | polarized automorphic representations, their Galois representations and local–global compatibility, residual representations and Hecke maximal ideals |
| AutomorphicFormsOnReductiveGroups AF.4–AF.5 | coefficient lattices and algebraic modular forms on groups compact at infinity |
| EndoscopicTransferAndUnitaryTraceComparison ET.6, ET.7a | the local Langlands correspondence; Arthur–Clozel base change and automorphic induction; Labesse's base change between definite unitary groups and GL_n |
| PadicHodgeTheory R06.2, SelmerIwasawaCohomology L2, L4 | period functors and de Rham extensions; Selmer groups and Bloch–Kato local conditions |
| PotentialModularityAndCompatibleSystems R23.1, ArithmeticGaloisDuality D7, R02.4 | Moret-Bailly's theorem and linear disjointness; local and Poitou–Tate duality |
| Tau Ceti ClassFieldTheory, Chebotarev | global existence of Hecke characters with local conditions; Chebotarev density |

## Boundaries

* Final potential automorphy theorems (BLGGT14 Proposition 3.3.1, Theorems 4.3.1–4.5.1, §5), symmetric power functoriality and Sato–Tate are ModularityAndLanglandsExtensions ML.2–ML.3; they import this roadmap. This roadmap owns the lifting theorems they use, including BLGGT14 Theorem 3.1.2 (potential ordinary automorphy), which Theorem 4.2.1 and Newton–Thorne 2021 Theorem 5.2 need.
* The Dwork families (Qian; Boxer–Calegari–Gee–Newton–Thorne §4; the self-dual family behind BLGGT14 Theorem 3.1.2) belong to a separate Part II, *Dwork switching motives*, proposed in this packet's `restructure`; until it exists their use in PL.5 is a recorded gap.
* Conditional lifting for GL_n over arbitrary number fields (Calegari–Geraghty), crystalline local–global compatibility for torsion classes (Caraiani–Newton) and weight-zero crystalline lifting (Boxer–Calegari–Gee–Newton–Thorne §3) are unpolarized and form three further Part IIs (`restructure`).
* Local deformation rings (including Geraghty's fixed-weight ordinary rings, the Steinberg rings and the local models of Le–Le Hung–Levin–Morra) are LocalGaloisDeformationRings; the abstract patching theorem is DeformationAndDerivedPatchingAlgebra R03.5.

## Conventions

* F is a CM or totally real field with maximal totally real subfield F⁺ and complex conjugation c; when F is imaginary CM, places of F⁺ in the sets S are split in F and a place ṽ | v is chosen for each.
* l is a prime (odd except in PL.4/two-adic-automorphy-lifting and PL.8), ι : Q̄_l ≅ ℂ, O the integers of a finite E/Q_l containing all embeddings of F, k its residue field, λ (or ϖ) its maximal ideal.
* Local class field theory Art_K sends uniformizers to geometric Frobenius elements; the l-adic cyclotomic character ε_l has Hodge–Tate weight −1. Weil–Deligne representations attached to π_v use rec(π_v ⊗ |det|^{(1−n)/2}) (BLGGT14 Theorem 2.1.1).
* 𝒢_n = (GL_n × GL_1) ⋊ {1, j} with j(g, µ)j^{−1} = (µ ᵗg^{−1}, µ) and multiplier ν (ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group). A polarized representation (r, µ) carries a pairing with ⟨x, y⟩ = −µ(c_v)⟨y, x⟩ when F is imaginary; it is totally odd if the signs ε_v are 1.
* Weights: λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}, λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n}; an automorphic π of weight ι_*λ has HT_τ(r_{l,ι}(π)) = {λ_{τ,i} + n − i}; an ordinary ρ of weight λ has graded characters ψ_{v,i} with ψ_{v,i} ∘ Art · ∏_τ τ^{λ_{τ,n−i+1}+i−1} of finite order on O^×.
* RAECSDC means (π, χ) regular algebraic, essentially conjugate self-dual (π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det)), cuspidal, with χ_v(−1) = (−1)ⁿ at infinite places (Thorne 2012 §1); RACSDC means χ = 1 (Thorne 2017 Definition 3.1); BLGGT14's 'polarized (π, χ)' is the common generalisation.
* Adequacy: Thorne 2012 Definition 2.3 (for subgroups of GL_n and of 𝒢_n) and Thorne 2017 Definition 2.20 (Guralnick–Herzig–Tiep), both ArithmeticGaloisRepresentations G7/adequate-subgroup; they agree when l ∤ n. Boxer–Calegari–Gee's relaxation replaces H¹(H, ad₀) = 0 by H¹(H, ad) = 0.
* Λ denotes the Iwasawa algebra O⟦T(l)⟧ of the l-part of the diagonal torus at the places above l, with the twisted diamond action of Thorne 2012 Definition 8.3.

## Sources


* **BLGGT14**: Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, *Potential automorphy and change of weight*, Annals of Mathematics 179 (2014), 501–609; read in arXiv:1010.2561v4 (9 December 2013). [https://arxiv.org/abs/1010.2561v4](https://arxiv.org/abs/1010.2561v4). Read: §1.1–1.5 (the group 𝒢_n, abstract deformation theory, local theory l ≠ p and l = p, global theory); §2.1–2.4 (terminology, lemmas on automorphy, minimal and ordinary lifting); §3.1–3.2 (statements of Proposition 3.1.1, Theorem 3.1.2, Proposition 3.2.1 and its proof); §4.1–4.2 (Proposition 4.1.1 with proof, Theorem 4.2.1); Appendix A.2 (Lemmas A.2.1–A.2.5); accessed 2026-10-07.
* **Tho12**: Jack Thorne, *On the automorphy of l-adic Galois representations with small residual image*, Journal of the Institute of Mathematics of Jussieu 11 (2012), 855–920; read in arXiv:1107.5989v1 (29 July 2011). [https://arxiv.org/abs/1107.5989v1](https://arxiv.org/abs/1107.5989v1). Read: §1 (RAECSDC representations, Theorem 1.1, Lemma 1.2); §2 (Definitions 2.1–2.3, Lemma 2.4); §3 (Definitions 3.1–3.3, Theorems 3.10–3.11, Proposition 3.16, statements); §4 (Definition 4.1, Lemmas 4.2–4.3, Proposition 4.4 with proof); §6 (the definite unitary group, Definition 6.1, Proposition 6.2, Lemmas 6.3–6.4, Theorem 6.5, Propositions 6.6–6.7, Theorem 6.8); §7 (Theorem 7.1); §8 (Definitions 8.1–8.3, Propositions 8.2, 8.4–8.5, Theorem 8.6, Corollary 8.7); §9 (Theorem 9.1); §10 (Theorems 10.1, 10.2 and the proof of 10.1); accessed 2026-10-07.
* **Tho17**: Jack A. Thorne, *A 2-adic automorphy lifting theorem for unitary groups over CM fields*, Mathematische Zeitschrift 285 (2017), 1–38; read in the author's accepted manuscript dated 16 March 2016 (Apollo, University of Cambridge repository). [https://www.repository.cam.ac.uk/handle/1810/254922](https://www.repository.cam.ac.uk/handle/1810/254922). Read: §1 (Theorem 1.1); §2.4 (Definitions 2.18, 2.20, Proposition 2.21); §3 (Definitions 3.1, 3.3, Theorem 3.2, Lemma 3.4); §5 (Theorem 5.1 and the start of its proof); §7 (the erratum to Tho12: Propositions 7.1, 7.2, Corollary 7.3); accessed 2026-10-07.
* **Tho15**: Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations*, Journal of the American Mathematical Society 28 (2015), 785–870; read in the author's accepted manuscript dated 16 April 2014 (Apollo, University of Cambridge repository). [https://www.repository.cam.ac.uk/items/2796d161-598e-44da-83fd-2015c26f1dbc](https://www.repository.cam.ac.uk/items/2796d161-598e-44da-83fd-2015c26f1dbc). Read: §1 (Definitions 1.1, 1.2, 1.7, Proposition 1.8, Lemma 1.9, statements); §2 (Definition 2.1, Lemma 2.3, Definition 2.5, Corollary 2.6, Lemma 2.7); §3 (Definition 3.2, Lemmas 3.3–3.4, Propositions 3.8–3.9, 3.14–3.17, 3.26, 3.29, Definitions 3.25, 3.27, 3.31, Lemmas 3.36, 3.40, statements); §4 (Definitions 4.1–4.2, Propositions 4.3, 4.12, 4.18, Theorem 4.19 with the discussion of its hypotheses, Corollary 4.20); §5 (Proposition 5.3 statement); §7 (Theorem 7.1 and the discussion of its hypotheses); accessed 2026-10-07.
* **ANT20**: Patrick B. Allen, James Newton and Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*, Compositio Mathematica 156 (2020), 2399–2422; read in arXiv:1912.11269v2 (13 August 2020). [https://arxiv.org/abs/1912.11269v2](https://arxiv.org/abs/1912.11269v2). Read: §1 (Theorem 1.1 and its discussion); §2 (Definitions 2.1–2.2, Proposition 2.5); §3 (Propositions 3.1–3.2, Lemmas 3.3–3.9, Definition 3.7, with the proof of Lemma 3.6); §4 (Theorem 4.1 and the start of its proof); §5 (Theorem 5.1, Lemma 5.2, Proposition 5.3, Corollary 5.4); §6 (Theorems 6.1, 6.2); accessed 2026-10-07.
* **NT23**: James Newton and Jack A. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, Journal of the European Mathematical Society 25 (2023), 1919–1967; read in arXiv:1912.11265v3 (30 June 2023), whose numbering is used here. [https://arxiv.org/abs/1912.11265v3](https://arxiv.org/abs/1912.11265v3). Read: Introduction (Theorems A, B); §1 (Definition 1.1 of generic Weil–Deligne representations, the Bloch–Kato subspaces); §2.1–2.4 (pseudocharacters and group determinants, Propositions 2.12–2.17, the condition (2.3) defining the semistable subfunctor, Lemma 2.19, Definition 2.23); §4 (Theorem 4.1 and its set-up); accessed 2026-10-07.
* **NT21**: James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms*, Publications mathématiques de l'IHÉS 134 (2021), 1–116; read in arXiv:1912.11261v3 (27 September 2021). [https://arxiv.org/abs/1912.11261v3](https://arxiv.org/abs/1912.11261v3). Read: §1.23 (Hecke operators on definite unitary groups); §2.3.1 (generic Weil–Deligne representations and Bloch–Kato conditions, as used); §5 (Lemma 5.1, Theorem 5.2, Lemma 5.3, Corollaries 5.4–5.5, Proposition 5.6, Theorem 5.7, Proposition 5.8), statements and proof outlines; §6 (the deformation data D, Proposition 6.5); accessed 2026-10-07.
* **NT21B**: James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*, Publications mathématiques de l'IHÉS 134 (2021), 117–152; read in arXiv:2009.07180v2 (27 September 2021). [https://arxiv.org/abs/2009.07180v2](https://arxiv.org/abs/2009.07180v2). Read: §2 (the pseudodeformation ring P and its regularity at an automorphic point); §3 (the uses of BLGGT14 Theorem 4.2.1, of potential diagonalisability and of Gee–Kisin Lemma 4.4.1 in Propositions 3.9–3.10 and Theorem 3.1); accessed 2026-10-07.
* **NT26**: James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*, Annals of Mathematics 203 (2026); read in arXiv:2212.03595v2. [https://arxiv.org/abs/2212.03595v2](https://arxiv.org/abs/2212.03595v2). Read: §2 (Definition 2.5, Lemma 2.6); §3 (uses of CT14 Lemma 2.6, ANT20 Theorem 6.2 with Tho24 Theorem 7.5, Ger19 Lemma 2.25 and Lab11 Corollaire 5.3); accessed 2026-10-07.
* **BCG25**: George Boxer, Frank Calegari and Toby Gee, *Cuspidal cohomology classes for GL_n(Z)*, Journal of the American Mathematical Society 38 (2025), 509–520; read in arXiv:2309.15944v3 (mathematically identical to the published text, as the extraction PAPER-BOXER-CALEGARI-GEE-25 records). [https://arxiv.org/abs/2309.15944v3](https://arxiv.org/abs/2309.15944v3). Read: Proof of Theorem 3.1 (the relaxation of Tho17 Definition 2.20 and the application of Tho17 Theorem 7.1 = Theorem 5.1 with Proposition 7.2); accessed 2026-10-07.
* **LTXZZ**: Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *Deformation of rigid conjugate self-dual Galois representations*, Acta Mathematica Sinica, English Series 40 (2024); read in arXiv:2108.06998v1, the version cited by Liu et al., Invent. Math. 228 (2022). [https://arxiv.org/abs/2108.06998v1](https://arxiv.org/abs/2108.06998v1). Read: §3.6 (Definition 3.6.1, Remark 3.6.2, Theorem 3.6.3 statement); §4.1–4.2 (statements of Corollary 4.1.2, Proposition 4.2.3, Theorem 4.2.6 as cited); accessed 2026-10-07.
* **LLHLM23**: Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Local models for Galois deformation rings and applications*, Inventiones mathematicae 231 (2023), 1277–1488; read in arXiv:2007.05398v2. [https://arxiv.org/abs/2007.05398v2](https://arxiv.org/abs/2007.05398v2). Read: §9.2 (Theorem 9.2.1 and Remark 9.2.2); accessed 2026-10-07.

Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Math. Ann. 373 (2019), 1341–1427, was not available; its results are cited through the restatements in BLGGT14, Thorne 2012, Thorne 2015 and Newton–Thorne 2021, and this is recorded as a gap.

## Layer overview

| Layer | Title | Key declarations (planets) |
| --- | --- | --- |

| PL.0 | Polarized automorphy: ordinarity, twisting and soluble descent | Ordinary Galois representation; ι-ordinary automorphic representation |
| PL.1 | Connecting local lifts and potential diagonalizability | Connecting local lifts; Potentially diagonalizable representation |
| PL.2 | Definite unitary groups, algebraic modular forms and their Hecke algebras | Definite unitary group; Algebraic modular forms on U(n); Hecke algebra of a definite unitary group; Big ordinary Hecke algebra |
| PL.3 | Taylor–Wiles primes under adequacy and the patching R = T theorems |  |
| PL.4 | Minimal and ordinary automorphy lifting and finiteness with adequate image | Minimal automorphy lifting theorem; Thorne's automorphy lifting for any prime; Ordinary automorphy lifting theorem; Finiteness of polarized deformation rings |
| PL.5 | Potential ordinary automorphy and potentially diagonalizable lifting | Potential ordinary automorphy; Harris's tensor product trick; Potentially diagonalizable automorphy lifting |
| PL.6 | Residually reducible deformation rings: Schur representations, pseudodeformations and generic primes | Pseudodeformation subring P_𝒮; Generic prime; Generic R = T theorem |
| PL.7 | Residually reducible automorphy lifting | Finiteness of locally Steinberg rings; Residually reducible automorphy lifting; Automorphic lifts of prescribed type |
| PL.8 | Adjoint Bloch–Kato Selmer groups and semistable pseudodeformation rings of unitary type | Generic Weil–Deligne representation; Adjoint Bloch–Kato Selmer group; Semistable pseudodeformation ring; Vanishing of adjoint Selmer groups |
| PL.9 | Integral R = T for rigid residual representations and lifting from generic local domains | Rigid R = T theorem; Lifting from generic local domains |

## PL.0. Polarized automorphy: ordinarity, twisting and soluble descent

**Objects.** For a CM or totally real field F with maximal totally real subfield F⁺, a prime l and ι : Q̄_l ≅ ℂ: (i) a continuous ρ : G_F → GL_n(Q̄_l) is *ordinary of weight λ* ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)} if for every v | l, ρ|G_{F_v} is conjugate to an upper triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n} such that x ↦ ψ_{v,i}(Art_{F_v}(x)) ∏_τ τ(x)^{λ_{τ,n−i+1}+i−1} has finite order on O_{F_v}^× (Thorne 2015, Definition 2.5); with the ss- and cr-ordinary refinements of BLGGT14 §1.4. (ii) A regular algebraic polarized cuspidal (π, χ) of weight a is *ι-ordinary* if at every v | l some Iwahori level Iw(v^{b,b}) of ι⁻¹π_v has a nonzero ordinary part for the rescaled operators U^{(j)}_{ι*a,ϖ_v} (BLGGT14 §2.1), equivalently π_v is a subquotient of a normalized induction of characters with prescribed valuations (Thorne 2015, Lemma 2.3). (iii) A polarized l-adic representation (r, µ) is *automorphic*, *of level prime to l*, *ordinarily automorphic* or *potentially diagonalizably automorphic* when (r, µ) ≅ (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) for a regular algebraic cuspidal polarized (π, χ) with the corresponding property (BLGGT14 §2.1).

**Theorems.** ι-ordinary implies ordinary of weight ιλ (Thorne 2015, Corollary 2.6); ordinary with level potentially prime to l implies ι-ordinary (BLGGT14 §2.1(7)); weight zero and Steinberg at every place above p implies ι-ordinary (Newton–Thorne 2026, Lemma 2.6); a regular algebraic isobaric sum of ι-ordinary conjugate self-dual cuspidal representations is ι-ordinary (Clozel–Thorne 2014, Lemma 2.6); automorphy is invariant under algebraic twists (BLGGT14 Lemma 2.2.1), descends along soluble CM or totally real extensions when r|G_M is irreducible (Lemma 2.2.2), and descends from Ind_{G_M}^{G_F} r for M/F soluble (Lemma 2.2.4); the auxiliary fields and characters of BLGGT14 Appendix A.2 (Lemma A.2.1, Corollary A.2.3, Lemma A.2.5).

**Depends on.** Within this roadmap: none. Other roadmaps: AutomorphicFormsOnReductiveGroups:AF.4, AutomorphicGaloisRepresentationsPartII:AG2.0, AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.6, AutomorphicGaloisRepresentationsPartII:AG2.7, EndoscopicTransferAndUnitaryTraceComparison:ET.7a, PadicHodgeTheory:R06.2, PotentialModularityAndCompatibleSystems:R23.1, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### Ordinary Galois representations of weight λ

`PL.0/ordinary-of-weight` (definition) — planet: *Ordinary Galois representation*

Let F be a number field, l a prime, n ≥ 1 and λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}, i.e. λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n} for every embedding τ. A continuous ρ : G_F → GL_n(Q̄_l) is ordinary of weight λ if for every place v | l there are continuous characters ψ_{v,1}, …, ψ_{v,n} : G_{F_v} → Q̄_l^× and an isomorphism of ρ|G_{F_v} with an upper triangular representation with diagonal entries ψ_{v,1}, …, ψ_{v,n} (ψ_{v,1} on the invariant line) such that for each i the character x ↦ ψ_{v,i}(Art_{F_v}(x))·∏_{τ : F_v → Q̄_l} τ(x)^{λ_{τ,n−i+1}+i−1} of O_{F_v}^× has finite order (Thorne 2015, Definition 2.5; Newton–Thorne 2026, Definition 2.5(2)). Art_{F_v} sends uniformizers to geometric Frobenius elements. The local notions of BLGGT14 §1.4 refine this: ρ_v : G_K → GL_n(Q̄_l) (K/Q_l finite) is ordinary if it has an invariant decreasing full flag Fil^i with gr^i given by χ_i and integers b_{τ,i} with b_{τ,1} < ⋯ < b_{τ,n} and (χ_i ∘ Art_K)(α) = ∏_τ τ(α)^{b_{τ,i}} on an open subgroup U ⊂ O_K^×; ss-ordinary if U = O_K^× may be taken; cr-ordinary if ordinary and crystalline. An ordinary ρ_v is de Rham, an ss-ordinary one semistable, and HT_τ(ρ_v) = {−b_{τ,1}, …, −b_{τ,n}}. The conventions match by b_{τ,i} = −(λ_{τ,i} + n − i), so an ordinary ρ of weight λ has HT_τ = {λ_{τ,i} + n − i}.

*Hypotheses.* F a number field, l a prime, n ≥ 1; λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}; Art_K normalised to send uniformizers to geometric Frobenius, so HT(ε_l) = {−1}.

*Proof outline.*

1. Data: for each v | l an invariant full flag of Q̄_lⁿ under G_{F_v} and the ordered characters on its graded pieces; the finite-order condition is a condition on each ψ_{v,i} ∘ Art_{F_v} restricted to O_{F_v}^×.
2. De Rham property: each ψ_{v,i} is Hodge–Tate (a character agreeing with an algebraic character on an open subgroup of O^× is de Rham, PadicHodgeTheory R06.2/hodge-tate-characters-are-de-rham), and an iterated extension of de Rham characters whose labelled weights increase strictly up the flag is de Rham (Nekovář, Proposition 1.28, cited in BLGGT14 §1.4; R06.2/extension-with-separated-weights-de-rham).
3. Comparison: reversing the flag identifies BLGGT's χ_i with ψ_{v,n+1−i}, whence b_{τ,i} = −(λ_{τ,i} + n − i), which is strictly increasing in i because λ_{τ,i} is non-increasing.

*Uses.* Thorne 2015, Theorem 7.1(3); Allen–Newton–Thorne, Theorem 1.1(3): the hypothesis on ρ in the residually reducible lifting theorems. BLGGT14, Theorem 2.4.1(3): r ordinary at every prime above l in ordinary automorphy lifting. Thorne 2015, Corollary 2.6: the conclusion that r_ι(π) is ordinary of weight λ for ι-ordinary π. Newton–Thorne 2021, Corollary 5.4: lifts that are ordinary of a prescribed weight λ with λ_{τc,i} = −λ_{τ,n+1−i}. BLGGT14, Lemma 1.4.3(1): potentially crystalline ordinary representations are potentially diagonalizable.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsOrdinaryOfWeight` | constructor | The predicate: ρ is ordinary of weight λ, defined place by place from an invariant full flag whose graded characters satisfy the finite-order condition. |
| `TauCeti.Automorphy.IsOrdinaryOfWeight.exists_flag` | projection | For v ∣ l an ordinary ρ yields a G_{F_v}-stable full flag of Q̄_lⁿ whose graded characters ψ_{v,i} satisfy the finite-order condition with exponents λ_{τ,n−i+1} + i − 1. |
| `TauCeti.Automorphy.isOrdinaryOfWeight_iff_local` | compatibility | ρ is ordinary of weight λ iff for every v ∣ l, ρ∣G_{F_v} is ordinary in the sense of BLGGT14 §1.4 with b_{τ,i} = −(λ_{τ,i} + n − i). |
| `TauCeti.Automorphy.IsOrdinaryOfWeight.restrict` | functoriality | If F′/F is finite then ρ∣G_{F′} is ordinary of weight λ_{F′}, where (λ_{F′})_τ = λ_{τ∣F}. |
| `TauCeti.Automorphy.IsOrdinaryOfWeight.twist` | relation | For a character ψ of G_F which is Hodge–Tate above l with HT_τ(ψ) = {h_τ}, ρ ⊗ ψ is ordinary of weight (λ_{τ,i} + h_τ). |
| `TauCeti.Automorphy.IsOrdinaryOfWeight.dual` | relation | ρ^∨ is ordinary of weight μ with μ_{τ,i} = −λ_{τ,n+1−i} − (n − 1). |
| `TauCeti.Automorphy.IsOrdinaryOfWeight.isDeRham` | other | An ordinary ρ is de Rham at every v ∣ l with HT_τ(ρ∣G_{F_v}) = {λ_{τ,i} + n − i : 1 ≤ i ≤ n}; it is semistable at v when every ψ_{v,i} ∘ Art agrees with the algebraic character on all of O_{F_v}^×. |

*Unit tests.*

* `ordinary_cyclotomic` (computation): For F = ℚ and n = 1 the l-adic cyclotomic character ε_l is ordinary of weight λ = (−1), since ε_l(Art_{ℚ_l}(x)) = x on ℤ_l^× in the geometric normalisation.
* `ordinary_tate_curve` (computation): If E/ℚ has split multiplicative reduction at l, then V_l E ≅ (ε_l *; 0 1) as a G_{ℚ_l}-representation is ordinary of weight (−1, −1), with Hodge–Tate weights {0, −1}.
* `ordinary_rank_one` (degenerate): For n = 1 a character ψ of G_F is ordinary of weight λ iff it is Hodge–Tate at every v | l with HT_τ(ψ) = {λ_τ}; a character of finite order is ordinary of weight 0.
* `not_ordinary_supersingular` (non-example): If E/ℚ has good supersingular reduction at l, V_l E|G_{ℚ_l} is crystalline with Hodge–Tate weights {0, −1} but is not ordinary of any weight: an invariant line would be a crystalline character, whose Frobenius slope on D_cris is an integer, while both Frobenius slopes of D_cris(V_l E) are non-integral (equal, of absolute value 1/2).
* `ordinary_weight_unique` (characterisation): If ρ is ordinary of weight λ and of weight λ′ then λ = λ′, because HT_τ(ρ|G_{F_v}) = {λ_{τ,i} + n − i} determines λ_τ.

*Prerequisites.* PadicHodgeTheory:R06.2/hodge-tate-characters-are-de-rham; PadicHodgeTheory:R06.2/extension-with-separated-weights-de-rham; PadicHodgeTheory:R06.2/admissible-representations.

*Acceptance.* The cyclotomic character ε_l of G_ℚ is ordinary of weight (−1), with HT(ε_l) = {−1}. If ρ is ordinary of weight λ then ρ^∨ ⊗ ε_l^{1−n} is ordinary of weight (−λ_{τ,n+1−i})_i, so a conjugate self-dual ordinary ρ with ρ^c ≅ ρ^∨ε_l^{1−n} has λ_{τc,i} = −λ_{τ,n+1−i}, the condition of Newton–Thorne 2021, Corollary 5.4.

*Sources.* Tho15 §2, Definition 2.5, p. 11 of the accepted manuscript; NT26 §2, Definition 2.5(2), arXiv v2 p. 12; BLGGT14 §1.4, p. 25.

### ι-ordinary automorphic representations

`PL.0/iota-ordinary` (definition) — planet: *ι-ordinary automorphic representation*

Let F be CM or totally real, l a prime, ι : Q̄_l ≅ ℂ, λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)} and (π, χ) a regular algebraic cuspidal polarized automorphic representation of GL_n(𝔸_F) of weight ι_*λ (AutomorphicGaloisRepresentationsPartII AG2.0). For v | l, a uniformizer ϖ_v and b ≥ 1 let Iw(v^{b,b}) ⊂ GL_n(O_{F_v}) consist of the matrices that are upper triangular unipotent modulo v^b. On (ι⁻¹π_v)^{Iw(v^{b,b})} act U^{(j)}_{ϖ_v} = [Iw(v^{b,b}) diag(ϖ_v·1_j, 1_{n−j}) Iw(v^{b,b})] and the rescaled operators U^{(j)}_{λ,ϖ_v} = (∏_{τ : F_v → Q̄_l} ∏_{i=1}^{j} τ(ϖ_v)^{−λ_{τ,n−i+1}}) U^{(j)}_{ϖ_v}, j = 1, …, n; the ordinary part is the largest subspace stable under every U^{(j)}_{λ,ϖ_v} on which all their eigenvalues are l-adic units, and it does not depend on ϖ_v. π is ι-ordinary if for every v | l some b gives a nonzero ordinary part (BLGGT14 §2.1, after Geraghty). Equivalently (Thorne 2015, Lemma 2.3): for every v | l there are smooth characters χ_{v,1}, …, χ_{v,n} : F_v^× → Q̄_l^× with v_l(χ_{v,i}(ϖ_v)) = e_v^{−1} Σ_{τ : F_v → Q̄_l} (λ_{τ,n+1−i} − (n − 1)/2 + i − 1) and π_v a subquotient of the normalised induction n-Ind_{B_n}^{GL_n} ιχ_{v,1} ⊗ ⋯ ⊗ ιχ_{v,n}; the tuple (χ_{v,i}) is then determined by ι⁻¹π_v.

*Hypotheses.* F CM or totally real, l a prime, ι : Q̄_l ≅ ℂ; (π, χ) regular algebraic, cuspidal and polarized of weight ι_*λ.

*Proof outline.*

1. The ordinary part exists because the U^{(j)}_{λ,ϖ_v} commute and preserve a lattice of (ι⁻¹π_v)^{Iw(v^{b,b})} (BLGGT14 §2.1, citing Geraghty Lemma 2.3.3); changing ϖ_v multiplies U^{(j)} by a diamond operator of finite order, so the unit-eigenvalue subspace is unchanged.
2. The equivalence with the principal-series description is Thorne 2015, Lemma 2.3, from Geraghty Lemma 5.1.1: the Jacquet module of π_v with respect to B computes the Iwahori-invariants with their U_p-action, and the slopes of the U^{(j)} are the partial sums of the valuations of the χ_{v,i}.
3. Twisting by an algebraic Hecke character ψ shifts λ and the rescaling factors together, so ι-ordinarity is invariant under twisting (BLGGT14 §2.1).

*Uses.* BLGGT14, Theorems 2.4.1 and 2.4.2; Thorne 2012, Theorems 9.1, 10.2: the hypothesis 'ordinarily automorphic' and the ι-ordinary seed of the finiteness theorem. Allen–Newton–Thorne, Theorem 1.1(6)(a); Thorne 2015, Theorem 7.1(8)(a): the residual automorphy hypothesis of the reducible lifting theorems. Newton–Thorne 2021, Proposition 5.8(3): an ι-ordinary RACSDC seed over the soluble extension. Newton–Thorne 2026, Lemma 2.6 and the proof of Lemma 3.5: ι-ordinarity of weight-zero Steinberg representations and of isobaric sums. Qian, Potential automorphy for GL_n, proof of Theorem 1.1: ι-ordinarity deduced from Galois ordinarity for a polarizable π.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsIotaOrdinary` | constructor | The predicate: π is ι-ordinary, defined by the nonvanishing of the ordinary part at some Iwahori level at every v ∣ l. |
| `TauCeti.Automorphy.ordinaryPart` | data | The ordinary subspace (ι⁻¹π_v)^{Iw(v^{b,b}),ord} cut out by the rescaled operators U^{(j)}_{λ,ϖ_v}. |
| `TauCeti.Automorphy.ordinaryPart_indep_uniformizer` | other | The ordinary part does not depend on the choice of the uniformizer ϖ_v. |
| `TauCeti.Automorphy.isIotaOrdinary_iff_principalSeries` | characterisation | π is ι-ordinary iff at every v ∣ l, π_v is a subquotient of n-Ind ιχ_{v,1} ⊗ ⋯ ⊗ ιχ_{v,n} with v_l(χ_{v,i}(ϖ_v)) = e_v^{−1}Σ_τ(λ_{τ,n+1−i} − (n−1)/2 + i − 1) (Thorne 2015, Lemma 2.3). |
| `TauCeti.Automorphy.IsIotaOrdinary.characters_unique` | other | The tuple (χ_{v,1}, …, χ_{v,n}) in the characterisation is determined by ι and ι⁻¹π_v. |
| `TauCeti.Automorphy.IsIotaOrdinary.twist` | relation | For an algebraic Hecke character ψ of F, π is ι-ordinary iff π ⊗ (ψ ∘ det) is. |

*Unit tests.*

* `iotaOrdinary_rank_one` (computation): For n = 1 every algebraic Hecke character φ of F is ι-ordinary for every ι.
* `iotaOrdinary_steinberg` (computation): If π has weight 0 and π_v is an unramified twist of the Steinberg representation at every v | l, then π is ι-ordinary: St_n is the generic subquotient of n-Ind(|·|^{(n−1)/2} ⊗ ⋯ ⊗ |·|^{(1−n)/2}), whose valuations are f_v(i − 1 − (n − 1)/2).
* `not_iotaOrdinary_supercuspidal` (non-example): If n ≥ 2 and π_v is supercuspidal at some v | l, then π is not ι-ordinary for any ι, since π_v is not a subquotient of a principal series.
* `iotaOrdinary_twist_iff` (characterisation): π is ι-ordinary iff π ⊗ (ψ ∘ det) is ι-ordinary, for every algebraic Hecke character ψ of F.
* `iotaOrdinary_galois_ordinary` (compatibility): If π is ι-ordinary of weight ι_*λ then r_{l,ι}(π) is ordinary of weight λ (Thorne 2015, Corollary 2.6; PL.0/iota-ordinary-implies-ordinary).

*Prerequisites.* AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation; AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight.

*Acceptance.* For n = 1 every algebraic Hecke character is ι-ordinary for every ι: the l-adic character r_{l,ι}(φ) is a unit on Art(ϖ_v), which forces v_l(ι⁻¹φ_v(ϖ_v)) = e_v^{−1}Σ_τ λ_τ. Weight zero and Steinberg at every v | l implies ι-ordinary (PL.0/steinberg-weight-zero-iota-ordinary).

*Sources.* BLGGT14 §2.1, p. 33; Tho15 §2, Lemma 2.3, p. 9 of the accepted manuscript; NT26 §2, Definition 2.5(1), arXiv v2 p. 11.

### Automorphic polarized representations and their levels

`PL.0/automorphic-polarized-representation` (definition)

Let F be CM or totally real, l a prime, ι : Q̄_l ≅ ℂ and (r, µ) a polarized l-adic representation of G_F (AG2.0/polarized-galois-representation). (r, µ) is automorphic if there is a regular algebraic cuspidal polarized automorphic representation (π, χ) of GL_n(𝔸_F) with (r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n}); automorphic of level prime to l (resp. of level potentially prime to l) if moreover π_v is unramified (resp. becomes unramified after a finite base change) for every v | l; ordinarily automorphic if moreover π is ι-ordinary. The same terms apply to r alone (r ≅ r_{l,ι}(π)) and to mod l representations (r̄, µ̄) through the residual representation r̄_{l,ι}(π). None of these notions depends on ι (Clozel, Theorem 3.13, cited in BLGGT14 §2.1). Potentially diagonalizably automorphic is added in PL.1/potentially-diagonalizable.

*Hypotheses.* F CM or totally real, l a prime; (r, µ) polarized, or (r̄, µ̄) polarized mod l.

*Proof outline.*

1. The Galois representation r_{l,ι}(π) with its polarization, local–global compatibility and Hodge–Tate weights is imported (BLGGT14 Theorem 2.1.1; requested of AutomorphicGaloisRepresentationsPartII AG2.2, with the properties in AG2.6).
2. The residual representation r̄_{l,ι}(π) and its 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_{l,ι}(χ) come from AG2.7/residual-representation-of-pi.
3. Independence of ι: Clozel's theorem that the Aut(ℂ)-conjugate of a regular algebraic cuspidal π is automorphic, applied to ι′ ∘ ι⁻¹.

*Uses.* BLGGT14, Theorems 2.3.1, 2.4.1, 4.2.1: hypotheses and conclusions of every lifting theorem. Thorne 2012, Theorem 7.1(vi); Thorne 2017, Theorem 5.1(iv): the RAECSDC or RACSDC seed with r_{l,ι}(π) ≅ ρ′ and matching residual representation. Boxer–Calegari–Gee, Theorems 2.1 and 3.1: the conclusion 'automorphic of level prime to l' that makes π_p unramified.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsAutomorphic` | constructor | (r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n}) for some regular algebraic cuspidal polarized (π, χ). |
| `TauCeti.Automorphy.IsAutomorphicOfLevelPrimeTo` | constructor | Automorphic via (π, χ) with π_v unramified for every v ∣ l. |
| `TauCeti.Automorphy.IsAutomorphicOfLevelPotentiallyPrimeTo` | constructor | Automorphic via (π, χ) with π_v unramified after a finite base change for every v ∣ l. |
| `TauCeti.Automorphy.IsOrdinarilyAutomorphic` | constructor | Automorphic via an ι-ordinary (π, χ). |
| `TauCeti.Automorphy.IsAutomorphic.indep_iota` | other | Each of the four notions is the same for every choice of ι : Q̄_l ≅ ℂ. |
| `TauCeti.Automorphy.IsAutomorphic.residual` | projection | If (r, µ) is automorphic then so is its residual representation (r̄^ss, µ̄). |
| `TauCeti.Automorphy.IsAutomorphic.totallyOdd` | other | An automorphic (r, µ) is totally odd: µ(c_v) is independent of v ∣ ∞ and the sign ε_v is 1. |

*Unit tests.*

* `isAutomorphic_rank_one` (computation): For n = 1, an algebraic character ψ of G_F with ψψ^c = µ|_{G_F} and µ(c_v) = −1 for all v | ∞ (F imaginary) is automorphic: ψ = r_{l,ι}(φ) for an algebraic Hecke character φ.
* `not_isAutomorphic_of_not_totallyOdd` (non-example): A polarized (r, µ) with ε_v = −1 at some real place v of F⁺ is not automorphic.
* `levelPrimeTo_crystalline` (characterisation): If (r, µ) is automorphic of level prime to l then r|G_{F_v} is crystalline for every v | l.
* `ordinarilyAutomorphic_ordinary` (compatibility): If (r, µ) is ordinarily automorphic via π of weight ι_*λ then r is ordinary of weight λ.

*Prerequisites.* AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation; AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline; AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi; AutomorphicGaloisRepresentationsPartII:AG2.2; PL.0/iota-ordinary (ι-ordinary automorphic representations).

*Acceptance.* A polarized (r, µ) that is not totally odd is not automorphic, because (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) is totally odd (BLGGT14 Theorem 2.1.1(1)). Automorphic of level prime to l implies r crystalline at every v | l (Theorem 2.1.1(4)).

*Sources.* BLGGT14 §2.1, pp. 34–35; BLGGT14 §2.1, p. 35.

### ι-ordinary automorphic representations have ordinary Galois representations

`PL.0/iota-ordinary-implies-ordinary` (theorem)

Let F be CM or totally real, ι : Q̄_l ≅ ℂ and (π, χ) a regular algebraic cuspidal polarized automorphic representation of GL_n(𝔸_F) of weight ι_*λ which is ι-ordinary. Then r_{l,ι}(π) is ordinary of weight λ (Thorne 2015, Corollary 2.6; BLGGT14 §2.1, remark (6)).

*Hypotheses.* (π, χ) regular algebraic, cuspidal, polarized, of weight ι_*λ; π ι-ordinary.

*Proof outline.*

1. By soluble base change (PL.0/soluble-descent and its automorphic counterpart, Thorne 2015 Lemma 2.7) reduce to the case that π_v has Iwahori-fixed vectors for every v | l; ι-ordinarity and the weight are preserved.
2. At such v, local–global compatibility with monodromy (AG2.6/polarized-branch-de-rham-and-crystalline) identifies the Weil–Deligne representation of r_{l,ι}(π)|G_{F_v} with rec(π_v ⊗ |det|^{(1−n)/2}), and r_{l,ι}(π)|G_{F_v} is semistable.
3. Geraghty's Lemma 5.2.1 (as cited by BLGGT14 and Thorne 2015): the valuations of the χ_{v,i} of PL.0/iota-ordinary make the Frobenius slopes of D_st distinct and equal to the Hodge filtration breaks, so the weakly admissible filtered (φ, N)-module has a φ-stable full flag compatible with the filtration; this yields the upper triangular form with the characters of PL.0/ordinary-of-weight, using the twisting argument of BLGHT11 §1 to reduce to χ = 1.

*Prerequisites.* PL.0/iota-ordinary (ι-ordinary automorphic representations); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline; AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime; PadicHodgeTheory:R06.2/weak-admissibility; AutomorphicGaloisRepresentationsPartII:AG2.2.

*Acceptance.* For n = 1 the statement is the identification of the Hodge–Tate weights of r_{l,ι}(φ) with the infinity type of φ. Applied to a weight-zero π Steinberg at every v | l it gives a semistable ordinary r_{l,ι}(π) with HT_τ = {0, 1, …, n − 1}.

*Sources.* Tho15 §2, Corollary 2.6, p. 11; BLGGT14 §2.1, remark (6), p. 34.

### Ordinary Galois representations come from ι-ordinary automorphic representations

`PL.0/ordinary-implies-iota-ordinary` (theorem)

Let F be CM or totally real and (π, χ) a regular algebraic cuspidal polarized automorphic representation of GL_n(𝔸_F) of level potentially prime to l. If r_{l,ι}(π)|G_{F_v} is ordinary for every v | l, then π is ι-ordinary (BLGGT14 §2.1, remark (7), citing Geraghty Lemmas 5.1.6 and 5.2.1). In particular a polarized (r, µ) that is automorphic of level potentially prime to l and ordinary at every v | l is ordinarily automorphic.

*Hypotheses.* (π, χ) regular algebraic, cuspidal, polarized; π of level potentially prime to l; r_{l,ι}(π) ordinary at every v | l.

*Proof outline.*

1. After a soluble base change (PL.0/soluble-descent) π_v is unramified at every v | l, so r_{l,ι}(π)|G_{F_v} is crystalline and its Weil–Deligne representation is rec(π_v ⊗ |det|^{(1−n)/2}) (AG2.6).
2. An ordinary crystalline representation has Frobenius eigenvalues whose valuations are its Hodge–Tate weights in increasing order; through local–global compatibility the Satake parameters of π_v therefore have the valuations of PL.0/iota-ordinary, which is Geraghty's Lemma 5.1.6 criterion for ι-ordinarity.
3. ι-ordinarity descends along the soluble base change because the principal-series description of PL.0/iota-ordinary is checked place by place.

*Prerequisites.* PL.0/iota-ordinary (ι-ordinary automorphic representations); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels); AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline; AutomorphicGaloisRepresentationsPartII:AG2.2.

*Acceptance.* Qian applies the polarized form to Sym^{n−1} r_{E_0,l′}|G_{F′}; the level hypothesis must be verified there or replaced by the exact hypotheses of Geraghty's Lemma 5.9, which this packet records as a gap. Combined with PL.0/iota-ordinary-implies-ordinary it gives, for π of level potentially prime to l: π ι-ordinary ⇔ r_{l,ι}(π) ordinary at every v | l.

*Sources.* BLGGT14 §2.1, remark (7), p. 34.

### Weight-zero Steinberg representations are ι-ordinary

`PL.0/steinberg-weight-zero-iota-ordinary` (theorem)

Let F be totally real or CM and π a RAESDC or RAECSDC automorphic representation of GL_n(𝔸_F) of weight 0. Let p be a prime such that π_v is a character twist of the Steinberg representation of GL_n(F_v) for every v | p. Then π is ι-ordinary for every ι : Q̄_p ≅ ℂ (Newton–Thorne 2026, Lemma 2.6; Geraghty Lemma 5.6 in the published numbering, Lemma 5.1.5 of the preprint cited by BLGGT14). Weight zero and the condition at every p-adic place are both needed.

*Hypotheses.* π RAESDC or RAECSDC of weight 0; π_v a character twist of Steinberg for every v | p.

*Proof outline.*

1. St_n ⊗ (ψ ∘ det) is the generic subquotient of n-Ind(ψ|·|^{(n−1)/2} ⊗ ⋯ ⊗ ψ|·|^{(1−n)/2}).
2. Weight zero and the algebraicity of the central character force ψ(ϖ_v) to be an l-adic unit after applying ι⁻¹, so v_p(ι⁻¹χ_{v,i}(ϖ_v)) = f_v(i − 1 − (n − 1)/2), which is the condition of PL.0/iota-ordinary with λ = 0.

*Prerequisites.* PL.0/iota-ordinary (ι-ordinary automorphic representations).

*Acceptance.* For n = 2 and F = ℚ: a weight-two newform of level Γ₀(pN) that is new at p is ι-ordinary at p, as U_p acts by ±1. A weight-zero π with π_v Steinberg at only some of the places above p need not be ι-ordinary.

*Sources.* NT26 §2, Lemma 2.6, arXiv v2 p. 12; BLGGT14 §2.1, p. 33.

### Regular algebraic isobaric sums of ι-ordinary representations are ι-ordinary

`PL.0/isobaric-sum-iota-ordinary` (theorem)

Let F be imaginary CM and π_1, …, π_r conjugate self-dual cuspidal automorphic representations of GL_{n_i}(𝔸_F), each ι-ordinary, such that the isobaric sum Π = π_1 ⊞ ⋯ ⊞ π_r (suitably twisted by |det|^{s_i} with s_i ∈ ½ℤ as in Clozel–Thorne 2014, Remark 3.9) is regular algebraic. Then Π is ι-ordinary in the sense of the principal-series description of PL.0/iota-ordinary (Clozel–Thorne 2014, Lemma 2.6, as applied in Newton–Thorne 2026, proof of Lemma 3.5).

*Hypotheses.* π_i conjugate self-dual, cuspidal, ι-ordinary; Π = ⊞ π_i|det|^{s_i} regular algebraic.

*Proof outline.*

1. At v | l each π_{i,v} is the generic subquotient of a principal series with characters of the prescribed valuations; Π_v is the generic subquotient of the induction of the concatenated characters.
2. Regularity of Π orders the concatenated valuations strictly, and the half-integral twists match the shift (n − 1)/2 versus (n_i − 1)/2 in the valuation formula, so the concatenated tuple satisfies the condition for the weight of Π.

*Prerequisites.* PL.0/iota-ordinary (ι-ordinary automorphic representations); AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight.

*Acceptance.* For r = 1 the statement is trivial. Used by Newton–Thorne 2026 for π_1 ⊞ π_2 built from symmetric powers twisted by |·|^{(1−r)/2} and |·|^{(−1−r)/2}.

*Sources.* NT26 §3, proof of Lemma 3.5, arXiv v2 p. 21.

### Automorphy is invariant under algebraic twists

`PL.0/automorphy-under-twist` (theorem)

Let F be CM or totally real and ψ an algebraic character of G_F. If F is imaginary let φ be ψ composed with the transfer G_{F⁺}^{ab} → G_F^{ab}; if F is totally real let φ = ψ². Then (r, µ) is automorphic iff (r ⊗ ψ, µφ) is automorphic (BLGGT14, Lemma 2.2.1). The same holds for 'level potentially prime to l' and for 'ordinarily automorphic' (ι-ordinarity is invariant under algebraic twists, BLGGT14 §2.1), and for 'level prime to l' when ψ is unramified above l.

*Hypotheses.* F CM or totally real; ψ an algebraic character of G_F.

*Proof outline.*

1. ψ = r_{l,ι}(ψ_𝔸) for an algebraic Hecke character ψ_𝔸 (AG2.0/galois-character-of-an-algebraic-hecke-character).
2. If (r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n}) then (π ⊗ (ψ_𝔸 ∘ det), χ·(ψ_𝔸|_{𝔸_{F⁺}^×})) is regular algebraic cuspidal polarized and realises (r ⊗ ψ, µφ); the converse twists by ψ^{−1}.
3. An algebraic character becomes unramified above l after a finite base change, so twisting preserves 'level potentially prime to l'; it preserves 'level prime to l' when ψ is unramified above l, and it preserves ι-ordinarity (PL.0/iota-ordinary).

*Prerequisites.* PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels); AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; PL.0/iota-ordinary (ι-ordinary automorphic representations).

*Acceptance.* For ψ of finite order unramified above l, level prime to l is preserved.

*Sources.* BLGGT14 §2.2, Lemma 2.2.1, p. 35.

### Soluble base change and descent of automorphy

`PL.0/soluble-descent` (theorem)

Let M/F be a soluble Galois extension with M CM or totally real, and (r, µ) a polarized l-adic representation of G_F with r|G_M irreducible. Then (r, µ) is automorphic iff (r|G_M, µ|G_{M⁺}) is automorphic (BLGGT14, Lemma 2.2.2). If r|G_M is automorphic of weight µ_M then µ_M = λ_M for a weight λ of F and r is automorphic of weight λ (Thorne 2012, Lemma 1.2, from BLGHT11 Lemma 1.4). Level prime to l descends when every place above l splits completely in M.

*Hypotheses.* M/F soluble Galois, M CM or totally real; (r, µ) polarized with r|G_M irreducible.

*Proof outline.*

1. Reduce to M/F cyclic of prime degree by induction along a composition series.
2. Base change: Arthur–Clozel cyclic base change of (π, χ) to M is cuspidal because r|G_M is irreducible (requested of EndoscopicTransferAndUnitaryTraceComparison ET.7a).
3. Descent: a cuspidal π_M with r_{l,ι}(π_M) ≅ r|G_M is Gal(M/F)-invariant, so it descends by Arthur–Clozel (Theorems 3.4.2, 3.5.1) to some π on GL_n(𝔸_F), unique up to twisting by characters of Gal(M/F); comparing Galois representations at unramified places (Chebotarev and Brauer–Nesbitt) selects the twist with r_{l,ι}(π) ≅ r; polarization descends by the same argument as Lemma 4.2.2 of Clozel–Harris–Taylor.

*Prerequisites.* PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels); EndoscopicTransferAndUnitaryTraceComparison:ET.7a.

*Acceptance.* For M = F the statement is trivial. Used in the proof of every lifting theorem to arrange that all relevant places split over F⁺ and that ρ̄ is trivial at the places above l.

*Sources.* BLGGT14 §2.2, Lemma 2.2.2, p. 35; Tho12 §1, Lemma 1.2, p. 6.

### Automorphy of an induced representation descends

`PL.0/induction-descent` (theorem)

Let F be CM or totally real and M/F a soluble Galois CM or totally real extension of degree m. Let r : G_M → GL_n(Q̄_l) be irreducible and µ : G_{F⁺} → Q̄_l^× continuous such that (Ind_{G_M}^{G_F} r, µ) is an automorphic polarized l-adic representation of G_F. Then (r, µ|G_{M⁺}) is automorphic and polarized (BLGGT14, Lemma 2.2.4). The proof uses that an irreducible unitary (𝔤, K)-module of GL_n(ℝ) or GL_n(ℂ) with half-integral Harish-Chandra parameter satisfies π^c ≅ π^∨ (Lemma 2.2.3).

*Hypotheses.* M/F soluble Galois, CM or totally real, of degree m; r irreducible; (Ind r, µ) automorphic polarized.

*Proof outline.*

1. Reduce to m prime. With Π realising Ind r, r_{l,ι}(Π) ⊗ κ ≅ r_{l,ι}(Π) for a generator κ of Gal(M/F)^∨, so Π ⊗ (κ ∘ Art ∘ det) ≅ Π.
2. Arthur–Clozel (Theorems 3.4.2, 3.5.1) give a cuspidal π on GL_n(𝔸_M) with BC_{M/F}(Π) ≅ π ⊞ π^σ ⊞ ⋯ ⊞ π^{σ^{m−1}} (with Harris–Taylor Lemma VII.2.6), the π^{σ^i} pairwise non-isomorphic; request of ET.7a.
3. Lemma 2.2.3 at infinity and regularity of BC(Π) force π^c ≅ π^∨ ⊗ (χ ∘ N_{M/F⁺} ∘ det); comparing r|G_M with the restriction of r_{l,ι}(Π) identifies r with a twist of r_{l,ι}(π^{σ^j}).

*Prerequisites.* PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels); PL.0/soluble-descent (Soluble base change and descent of automorphy); EndoscopicTransferAndUnitaryTraceComparison:ET.7a; AutomorphicFormsOnReductiveGroups:AF.4.

*Acceptance.* For m = 1 the statement is trivial. Used in Proposition 4.1.1 of BLGGT14 (PL.5/tensor-product-trick-lifting) and in Boxer–Calegari–Gee's Theorem 3.1.

*Sources.* BLGGT14 §2.2, Lemma 2.2.4, p. 36; BLGGT14 §2.2, Lemma 2.2.3, p. 36.

### Soluble and cyclic CM extensions with prescribed local behaviour

`PL.0/auxiliary-cm-extensions` (theorem)

(A.2.1) For a number field F, a finite Galois F^{(avoid)}/F, a finite set S of places of F and finite Galois extensions E_v/F_v (v ∈ S), there is a finite soluble Galois E/F linearly disjoint from F^{(avoid)} such that E_w/F_v ≅ E_v/F_v for every v ∈ S and w | v. (A.2.2) For N ≥ 1 there is a cyclic extension E/F of degree N in which every place of S splits completely, linearly disjoint from F^{(avoid)}. (A.2.3) If F is imaginary CM, E can be taken cyclic CM of degree N, with the same properties (BLGGT14, Lemmas A.2.1, A.2.2, Corollary A.2.3).

*Hypotheses.* F a number field (imaginary CM in A.2.3); F^{(avoid)}/F finite Galois; S a finite set of places.

*Proof outline.*

1. A.2.2: enlarge S by a place not split in each simple subextension of F^{(avoid)}/F, choose by Grunwald–Wang (Clozel–Harris–Taylor Lemma 4.1.1) a finite-order Hecke character trivial on ∏_{v∈S} F_v^× and of order N at an auxiliary place, and take the degree-N subextension of its kernel field.
2. A.2.3: apply A.2.2 to F⁺ with the places below S and the normal closure of F^{(avoid)}/F⁺, and set E = E⁺F.
3. A.2.1: realise each E_v/F_v as a tower of cyclic extensions and apply the cyclic case successively (class field theory with prescribed local components, Tau Ceti ClassFieldTheory).

*Prerequisites.* PotentialModularityAndCompatibleSystems:R23.1/forcing-linear-disjointness-by-extra-split-places; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

*Acceptance.* Proposition 4.1.1 of BLGGT14 takes M/F cyclic CM of degree n in which the places above l and the ramified places of π split completely, linearly disjoint from F̄^{ker r̄}(ζ_l).

*Sources.* BLGGT14 Appendix A.2, Lemma A.2.1, p. 87; BLGGT14 Appendix A.2, Corollary A.2.3, p. 88.

### Algebraic characters with prescribed conjugate-norm and local behaviour

`PL.0/auxiliary-characters` (theorem)

Let l be prime, F imaginary CM, S a finite set of primes of F containing those above l with S^c = S, χ : G_{F⁺} → Q̄_l^× continuous and, for v ∈ S, ψ_v : G_{F_v} → Q̄_l^× continuous with (ψ_v ψ_{cv}^c)|I_{F_v} = χ|I_{F_v}, de Rham for v | l. (1) If every element of S is unramified over F⁺ and χ(c_v) is independent of v | ∞, there is θ : G_F → Q̄_l^× with θθ^c = χ|G_F and θ|I_{F_v} = ψ_v|I_{F_v} for all v ∈ S. (2) If l > 2 and θ̄ : G_F → F̄_l^× has θ̄θ̄^c = χ̄|G_F and θ̄|G_{F_v} = ψ̄_v for v ∈ S, then θ can be chosen lifting θ̄ (BLGGT14, Lemma A.2.5, deduced from Lemma A.2.4 after Harris–Shepherd-Barron–Taylor, Lemma 2.2).

*Hypotheses.* F imaginary CM, S^c = S ⊇ primes above l; (ψ_vψ_{cv}^c)|I = χ|I; ψ_v de Rham for v | l.

*Proof outline.*

1. Lemma A.2.4: given χ on (𝔸_{F⁺}^∞)^×, ψ_S on O_{F,S}^× agreeing on the intersection, and φ₀ on F^× agreeing with χ on (F⁺)^×, there is a continuous φ on 𝔸_F^× extending all three (class field theory and the finiteness of the relevant unit index).
2. Translate the local conditions at S into ψ_S, using that χ is algebraic with all Hodge–Tate numbers equal to some w because F⁺ is totally real.
3. For (2) choose the lift of θ̄ through the Teichmüller lift on a finite quotient and correct by a character of l-power order, using l > 2 to divide by 2.

*Prerequisites.* tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character; PadicHodgeTheory:R06.2/hodge-tate-characters-are-de-rham.

*Acceptance.* Proposition 4.1.1 of BLGGT14 uses (1) to choose θ with θθ^c = r_{l,ι}(χ)ε_l^{1−n} and prescribed Hodge–Tate numbers, then (2) to choose θ′ with θ̄′ = θ̄ and θ′θ′^c = µ. Boxer–Calegari–Gee use it to build the auxiliary character in Theorem 3.1.

*Sources.* BLGGT14 Appendix A.2, Lemma A.2.5, pp. 88–89; BLGGT14 Appendix A.2, Lemma A.2.4, p. 88.

## PL.1. Connecting local lifts and potential diagonalizability

**Objects.** For K/Q_p finite and continuous ρ₁, ρ₂ : G_K → GL_n(O_{Q̄_l}): the relation *ρ₁ connects to ρ₂* (ρ₁ ∼ ρ₂): equal reductions and points on a common irreducible component of Spec(R^□_{ρ̄₁} ⊗ Q̄_l) when l ≠ p, of the potentially crystalline lifting ring with the common labelled Hodge–Tate weights when l = p; *strong connection* ρ₁ ⇝ ρ₂ (moreover a unique component); *diagonalizable* (crystalline and connected to a sum of crystalline characters) and *potentially diagonalizable* (diagonalizable after a finite extension) representations (BLGGT14 §§1.3–1.4).

**Theorems.** The listed properties of ∼ and ⇝ (BLGGT14 §1.3 remarks (1)–(12), Lemmas 1.3.4, 1.3.5; §1.4 remarks (1)–(7)), including equality of (r|_{I_K}, N) under mutual strong connection and strong connection from H⁰(G_K, (ad ρ₁)(1)) = 0; generic smooth representations and the density of robustly smooth points (Lemma 1.3.2); potential diagonalizability of representations with an invariant full flag with crystalline graded pieces after restriction, and of Fontaine–Laffaille representations (Lemma 1.4.3); of potentially Barsotti–Tate representations of dimension two (Gee–Kisin, Lemma 4.4.1); stability of potential diagonalizability under restriction, direct sums, tensor products and symmetric powers.

**Depends on.** Within this roadmap: PL.0. Other roadmaps: ArithmeticGaloisDuality:D7, ArithmeticGaloisRepresentations:G7, EndoscopicTransferAndUnitaryTraceComparison:ET.6, GlobalGaloisDeformations:R04.3, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:R08.1, LocalGaloisDeformationRings:R08.2, LocalGaloisDeformationRings:R08.3, LocalGaloisDeformationRings:R08.4, PadicHodgeTheory:R06.2.

### Connecting and strongly connecting local lifts

`PL.1/connects-relation` (definition) — planet: *Connecting local lifts*

(l ≠ p) Let K/Q_p be finite, l ≠ p and ρ₁, ρ₂ : G_K → GL_n(O_{Q̄_l}) continuous. ρ₁ connects to ρ₂, written ρ₁ ∼ ρ₂, if the reductions ρ̄₁ and ρ̄₂ are equivalent and ρ₁, ρ₂ define points on a common irreducible component of Spec(R^□_{ρ̄₁} ⊗ Q̄_l); ρ₁ strongly connects to ρ₂, written ρ₁ ⇝ ρ₂, if moreover ρ₁ lies on a unique irreducible component. (l = p) Let K/Q_l be finite. ρ₁ ∼ ρ₂ if ρ̄₁ ≅ ρ̄₂, both are potentially crystalline, HT_τ(ρ₁) = HT_τ(ρ₂) for every τ : K → Q̄_l, and ρ₁, ρ₂ define points on the same irreducible component of Spec(R^□_{ρ̄₁, {HT_τ(ρ₁)}, K′-cris} ⊗ Q̄_l) for some, equivalently every, sufficiently large finite K′/K (BLGGT14 §§1.3–1.4). Neither relation depends on the chosen equivalence of the reductions or on GL_n(O_{Q̄_l})-conjugation. For a global r : G_F → GL_n(Q̄_l) with irreducible reduction and a place v, r|G_{F_v} ∼ ρ means r°|G_{F_v} ∼ ρ for an integral model r° of r, unique up to conjugation. For a finite set C of irreducible components, D_C — the lifts whose classifying map factors through the maximal reduced l-torsion-free quotient supported on C — is a local deformation problem.

*Hypotheses.* K a finite extension of Q_p; ρ₁, ρ₂ continuous with values in GL_n(O_{Q̄_l}); for l = p: ρ₁, ρ₂ potentially crystalline.

*Proof outline.*

1. The framed lifting ring R^□_{ρ̄} (LocalGaloisDeformationRings R08.1/local-lifting-ring) and, for l = p, its potentially crystalline quotients of fixed Hodge type (R08.3/pst-deformation-ring) are imported; their irreducible components after ⊗ Q̄_l are the objects compared.
2. Independence of choices: changing the equivalence of reductions or conjugating by GL_n(O_{Q̄_l}) acts on R^□ by an automorphism preserving each component's image of the point (BLGGT14 Lemma 1.2.2).
3. D_C is a deformation problem in the sense of GlobalGaloisDeformations R04.3/local-deformation-problem: the quotient ring is reduced and l-torsion free and its formation commutes with the operations required (BLGGT14 §1.3, using BLGHT11 Lemma 3.2).

*Uses.* Thorne 2012, Theorem 7.1(vi)(d)–(e): ρ′|G_{F_v} ⇝ ρ|G_{F_v} at v ∤ l and ρ′|G_{F_v} ∼ ρ|G_{F_v} at v | l in minimal automorphy lifting. Thorne 2017, Theorem 5.1(iv)(b): r_ι(π)|G_{F_v} ∼ ρ|G_{F_v} at every finite place. BLGGT14, Theorem 2.3.1(2) and Proposition 4.1.1(3): the local matching between the seed and the target. Newton–Thorne 2021 II, Lemma 3.5 and Propositions 3.9–3.10: strong connection in both directions gives equal conductors. Newton–Thorne 2026, Lemma 3.1(5), Lemma 5.6, Theorem 5.9: matching of local components of congruent symmetric powers.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.Connects` | constructor | The relation ρ₁ ∼ ρ₂ (both cases l ≠ p and l = p). |
| `TauCeti.Automorphy.StronglyConnects` | constructor | The relation ρ₁ ⇝ ρ₂ (l ≠ p): ρ₁ ∼ ρ₂ and ρ₁ lies on a unique irreducible component. |
| `TauCeti.Automorphy.Connects.symm` | other | ∼ is symmetric; for l = p it is an equivalence relation, because the potentially crystalline rings are formally smooth after inverting l. |
| `TauCeti.Automorphy.Connects.of_conj` | other | ∼ and ⇝ are invariant under GL_n(O_{Q̄_l})-conjugation of either argument. |
| `TauCeti.Automorphy.Connects.restrict` | functoriality | If ρ₁ ∼ ρ₂ and K′/K is finite then ρ₁∣G_{K′} ∼ ρ₂∣G_{K′}. |
| `TauCeti.Automorphy.Connects.sum` | relation | If ρ₁ ∼ ρ₂ and ρ′₁ ∼ ρ′₂ then ρ₁ ⊕ ρ′₁ ∼ ρ₂ ⊕ ρ′₂, ρ₁ ⊗ ρ′₁ ∼ ρ₂ ⊗ ρ′₂ and ρ₁^∨ ∼ ρ₂^∨. |
| `TauCeti.Automorphy.componentDeformationProblem` | data | For a finite set C of components, the local deformation problem D_C of lifts factoring through the reduced l-torsion-free quotient supported on C. |

*Unit tests.*

* `connects_unramified` (computation): (l ≠ p) If ρ₁ and ρ₂ are unramified with ρ̄₁ ≅ ρ̄₂ then ρ₁ ∼ ρ₂.
* `connects_refl` (degenerate): Every ρ satisfies ρ ∼ ρ; if l ≠ p and H⁰(G_K, (ad ρ)(1)) = 0 then ρ ⇝ ρ′ for every ρ′ with ρ ∼ ρ′.
* `not_connects_inertia` (non-example): (l ≠ p) If ρ₁ is unramified and χ ≡ 1 mod m is a character with χ|I_K nontrivial of l-power order, then ρ₁ and ρ₁ ⊗ χ have equal reductions but do not connect, since connected lifts have isomorphic restrictions of their Weil–Deligne representations to I_K.
* `connects_crystalline_characters` (computation): (l = p) Two crystalline characters of G_K with equal reductions and equal labelled Hodge–Tate weights connect.
* `connects_wd_inertia` (compatibility): If ρ₁ ∼ ρ₂ then WD(ρ₁)|_{I_K} ≅ WD(ρ₂)|_{I_K}; if l ≠ p, ρ₁ ⇝ ρ₂ and ρ₂ ⇝ ρ₁ then (r₁|_{I_K}, N₁) ≅ (r₂|_{I_K}, N₂).

*Prerequisites.* LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; GlobalGaloisDeformations:R04.3/local-deformation-problem.

*Acceptance.* Two crystalline characters with equal reductions and equal labelled Hodge–Tate weights connect, since they differ by an unramified character with trivial reduction (BLGGT14 §1.4 remark (6)). An unramified ρ₁ and ρ₂ = ρ₁ ⊗ χ, with χ ≡ 1 a character whose restriction to I_K is nontrivial of l-power order, have the same reduction and do not connect.

*Sources.* BLGGT14 §1.3, p. 21; BLGGT14 §1.4, p. 26; BLGGT14 §1.3, p. 21.

### Properties of connection and strong connection

`PL.1/connects-properties` (theorem)

With the notation of PL.1/connects-relation: (l ≠ p) (1) ∼ is symmetric, ⇝ is transitive, and ρ₁ ∼ ρ₂ ⇝ ρ₃ implies ρ₁ ∼ ρ₃; (2) if ρ₁ ∼ ρ₂ and H⁰(G_K, (ad ρ₁)(1)) = 0 then ρ₁ ⇝ ρ₂; (3) with WD(ρ_i) = (r_i, N_i): ρ₁ ∼ ρ₂ implies r₁|_{I_K} ≅ r₂|_{I_K}, and ρ₁ ⇝ ρ₂ ⇝ ρ₁ implies (r₁|_{I_K}, N₁) ≅ (r₂|_{I_K}, N₂), hence equal conductors (Choi, Lemma 1.3.4); (4) unramified lifts with the same reduction connect; ∼ is preserved by restriction to finite extensions, direct sums, tensor products and duals; ⇝ by duals and twists; ρ ∼ ρ ⊗ µ for unramified µ with µ̄ = 1; and a semisimple-reduction ρ₁ with an invariant filtration by direct summands connects to the sum of its graded pieces (Lemma 1.3.5). (l = p) ∼ is an equivalence relation; ρ₁ ∼ ρ₂ implies WD(ρ₁)|_{I_K} ≅ WD(ρ₂)|_{I_K}; ∼ is preserved by restriction, sums, tensor products, duals and unramified twists with trivial reduction; and a potentially crystalline ρ₁ with semisimple reduction and an invariant filtration by direct summands connects to the sum of its graded pieces (BLGGT14 §1.3 remarks (1)–(12), §1.4 remarks (1)–(7)).

*Hypotheses.* K/Q_p finite; ρ_i : G_K → GL_n(O_{Q̄_l}) continuous (potentially crystalline when l = p).

*Proof outline.*

1. Symmetry and the conjugation invariance follow from the definition and BLGGT14 Lemma 1.2.2; for l = p, transitivity holds because each potentially crystalline ring is formally smooth after inverting l, so its components are its connected components (LocalGaloisDeformationRings R08.3/pcris-generic-smooth).
2. (2): if H⁰(G_K, (ad ρ₁)(1)) = 0 then H²(G_K, ad ρ₁) = 0 by local duality and Spec R^□[1/l] is formally smooth at ρ₁, so ρ₁ lies on a unique component.
3. (3) is Choi's lemma: the restriction to I_K of the semisimplified representation is locally constant on Spec R^□ ⊗ Q̄_l (it factors through a finite quotient I_K/H₀), and at a point on a unique component the complete local ring surjects onto a power series ring in n² variables carrying the inertia restriction, which identifies the full inertia restrictions; at l = p it is Kisin's Theorem 2.7.6 argument.
4. Lemma 1.3.5: conjugating ρ₁ by diag(t^i) on a filtration-adapted basis gives a family over the domain O⟨t⟩ specialising to ρ₁ at t = 1 and to ⊕ gr^i ρ₁ at t = 0.

*Prerequisites.* PL.1/connects-relation (Connecting and strongly connecting local lifts); LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; ArithmeticGaloisDuality:D7.

*Acceptance.* Newton–Thorne II, Lemma 3.5: purity gives H⁰(G_{Q_l}, (ad ρ)(1)) = 0, hence strong connection in both directions and N(π_l) = N(π′_l). For l = p and ρ ordinary potentially crystalline, ρ connects to the sum of its graded characters after restriction to an extension making them crystalline.

*Sources.* BLGGT14 §1.3, remarks (1)–(12), p. 21; BLGGT14 §1.3, Lemma 1.3.4 (Choi), p. 21; BLGGT14 §1.4, remarks (1)–(7), p. 26.

### Generic local representations are smooth points and smooth points are dense

`PL.1/generic-smooth-points` (theorem)

Let K/Q_p be finite with l ≠ p. (1) If ρ : G_K → GL_n(Q̄_l) satisfies ιWD(ρ)^{F-ss} ≅ rec_K(π) for an irreducible generic smooth π of GL_n(K), then H⁰(G_K, (ad ρ)(1)) = 0, so ρ lies on a unique irreducible component of Spec R^□_{ρ̄} ⊗ Q̄_l and every ρ′ with ρ ∼ ρ′ satisfies ρ ⇝ ρ′. (2) The closed points of Spec R^□_{O,ρ̄}[1/l] at which the lift is robustly smooth (H⁰(G_{K′}, (ad ρ_℘)(1)) = 0 for every finite K′/K) are Zariski dense; hence every irreducible component of Spec R^□_{O,ρ̄}[1/l] is generically formally smooth of dimension n². (3) For finite Galois K′/K the quotient R^□_{O,ρ̄,K′-nr}[1/l] classifying lifts with ρ(I_{K′}) = 1 is zero or formally smooth of dimension n² (BLGGT14, Lemmas 1.3.2–1.3.3).

*Hypotheses.* K/Q_p finite, l ≠ p; for (1): π generic irreducible smooth with ιWD(ρ)^{F-ss} ≅ rec_K(π).

*Proof outline.*

1. (1) Write π = Sp_{s₁}(π₁) ⊞ ⋯ ⊞ Sp_{s_t}(π_t); a nonzero invariant of (ad ρ)(1) would give π_i ≅ π_j ⊗ |det|^m with linked segments, contradicting genericity (Harris–Taylor p. 36).
2. (2) Decompose a point by Lemma 1.3.1 into Sp_{s_i}(W_i) pieces of distinct types, deform the Frobenius on each piece by (1 + l^M X_i) over O′⟦X_1, …, X_u⟧, and show that a Zariski-generic specialisation avoids the finitely many coincidences qα ζ (1 + l^M x_i) = β (1 + l^M x_j) that would produce (ad ρ)(1)-invariants.
3. (3) The relevant cohomology is that of the procyclic group Gal(K′^{nr}/K) with coefficients ((ad ρ)^{I}).

*Prerequisites.* PL.1/connects-relation (Connecting and strongly connecting local lifts); LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; ArithmeticGaloisDuality:D7; EndoscopicTransferAndUnitaryTraceComparison:ET.6.

*Acceptance.* For π_v generic at every v ∤ l, r_{l,ι}(π)|G_{F_v} ⇝ r|G_{F_v} whenever r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v} (used in the proof of BLGGT14 Theorem 2.3.1).

*Sources.* BLGGT14 §1.3, Lemma 1.3.2, p. 19; BLGGT14 §1.3, Lemma 1.3.2(2), p. 19.

### Diagonalizable and potentially diagonalizable representations

`PL.1/potentially-diagonalizable` (definition) — planet: *Potentially diagonalizable representation*

Let K/Q_l be finite. A continuous ρ : G_K → GL_n(O_{Q̄_l}) is diagonalizable if it is crystalline and connects (PL.1/connects-relation, case l = p) to some χ₁ ⊕ ⋯ ⊕ χ_n with χ_i : G_K → O_{Q̄_l}^× crystalline characters; it is potentially diagonalizable if ρ|G_{K′} is diagonalizable for some finite K′/K. Both properties pass to restrictions to finite extensions. If ρ₁ and ρ₂ are GL_n(Q̄_l)-conjugate then ρ₁ is potentially diagonalizable iff ρ₂ is (BLGGT14 Lemma 1.4.1), so ρ : G_K → GL_n(Q̄_l) is called potentially diagonalizable when one (equivalently every) invariant lattice is. A polarized (r, µ) over a CM or totally real F is potentially diagonalizably automorphic if it is automorphic (PL.0/automorphic-polarized-representation) via (π, χ) of level potentially prime to l with r_{l,ι}(π)|G_{F_v} potentially diagonalizable for every v | l (BLGGT14 §§1.4, 2.1).

*Hypotheses.* K/Q_l finite; ρ continuous; potentially crystalline is implied by potential diagonalizability.

*Proof outline.*

1. The definition is data-free: it quantifies over finite extensions K′/K and crystalline characters χ_i with HT_τ(χ_i) the labelled Hodge–Tate weights of ρ.
2. Lemma 1.4.1: for ρ₁ = gρ₂g^{−1} with g = diag(d_1, …, d_n), d_n | ⋯ | d_1, after passing to K with ρ₂ ≡ 1 mod l d_1/d_n, the family g̃ρ₂g̃^{−1} over the complete domain O⟨t_i, s_i⟩/(s_it_i − d_i/d_{i+1}) specialises to ρ₂ and to ρ₁, so ρ₁ ∼ ρ₂ (BLGGT14 Lemma 1.2.2).

*Uses.* BLGGT14, Theorem 4.2.1(1),(3): the local hypothesis at l and the residual hypothesis 'potentially diagonalizably automorphic'. Newton–Thorne 2021 II, proofs of Proposition 3.9 and Theorem 3.1: Sym^{n−1} of a two-dimensional potentially diagonalizable representation. Newton–Thorne 2026, Lemma 5.7 and Proposition 6.1: potential diagonalizability from Fontaine–Laffaille theory or from Gee–Kisin. Clozel–Thorne 2017, Lemma 7.5 and Proposition 7.6: application of BLGGT14 Theorem 4.2.1.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsDiagonalizable` | constructor | ρ is crystalline and connects to a sum of crystalline characters. |
| `TauCeti.Automorphy.IsPotentiallyDiagonalizable` | constructor | ρ∣G_{K′} is diagonalizable for some finite extension K′/K. |
| `TauCeti.Automorphy.IsPotentiallyDiagonalizable.of_conj` | other | Invariance under GL_n(Q̄_l)-conjugation (Lemma 1.4.1). |
| `TauCeti.Automorphy.IsPotentiallyDiagonalizable.restrict` | functoriality | Potential diagonalizability passes to ρ∣G_{K′} for every finite K′/K. |
| `TauCeti.Automorphy.IsPotentiallyDiagonalizable.isPotentiallyCrystalline` | projection | A potentially diagonalizable ρ is potentially crystalline. |
| `TauCeti.Automorphy.IsPotentiallyDiagonalizablyAutomorphic` | constructor | (r, µ) is automorphic via (π, χ) of level potentially prime to l with r_{l,ι}(π)∣G_{F_v} potentially diagonalizable for all v ∣ l. |

*Unit tests.*

* `pd_character` (computation): Every potentially crystalline character χ : G_K → O_{Q̄_l}^× is potentially diagonalizable.
* `pd_unramified` (degenerate): Every unramified ρ is potentially diagonalizable: ρ(Frob_K) is triangularisable in GL_n(O_{Q̄_l}), so ρ has an invariant flag with unramified one-dimensional graded pieces (Lemma 1.4.3(1)).
* `pd_fontaine_laffaille` (compatibility): For K = Q_l, l ≥ 3 and E/Q_l with good supersingular reduction, V_l E (crystalline with Hodge–Tate weights {0, −1} ⊂ [−1, l − 3]) is potentially diagonalizable by Lemma 1.4.3(2).
* `not_pd_tate_curve` (non-example): V_l E for E/Q_l with split multiplicative reduction is not potentially diagonalizable, because it is not potentially crystalline (its monodromy operator is nonzero).
* `pd_conj_iff` (characterisation): If ρ₁ = gρ₂g^{−1} with g ∈ GL_n(Q̄_l) then ρ₁ is potentially diagonalizable iff ρ₂ is.

*Prerequisites.* PL.1/connects-relation (Connecting and strongly connecting local lifts); PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels); PadicHodgeTheory:R06.2/admissible-representations.

*Acceptance.* Every potentially crystalline character is potentially diagonalizable. V_l E for E/Q_l with split multiplicative reduction has an invariant flag with one-dimensional graded pieces but is not potentially crystalline, hence not potentially diagonalizable.

*Sources.* BLGGT14 §1.4, pp. 26–27; BLGGT14 §1.4, Lemma 1.4.1, p. 27; BLGGT14 §2.1, p. 35.

### Ordinary and Fontaine–Laffaille representations are potentially diagonalizable

`PL.1/pd-criteria` (theorem)

Let K/Q_l be finite and ρ : G_K → GL_n(Q̄_l) potentially crystalline. (1) If ρ has a G_K-invariant filtration with one-dimensional graded pieces — in particular if ρ is ordinary — then ρ is potentially diagonalizable. (2) If K/Q_l is unramified, ρ is crystalline and HT_τ(ρ) ⊂ [a_τ, a_τ + l − 2] for every τ, then ρ is potentially diagonalizable (BLGGT14, Lemma 1.4.3). The hypothesis that ρ is potentially crystalline is essential in (1).

*Hypotheses.* ρ potentially crystalline; (2): K/Q_l unramified, ρ crystalline, Hodge–Tate weights in an interval of length l − 2 for each τ.

*Proof outline.*

1. (1) Pass to K′ over which ρ̄ is trivial and each graded character is crystalline; then ρ|G_{K′} connects to the sum of its graded pieces (PL.1/connects-properties, Lemma 1.3.5 analogue at l = p).
2. (2) Twist so that a_τ = 0. Every irreducible subquotient of ρ̄|I_K is tame, hence one-dimensional; over K′ unramified with ρ̄(G_{K′}) = ρ̄(I_K), ρ̄|G_{K′} has an invariant flag. Lemma 1.4.2 lifts the corresponding filtered Fontaine–Laffaille module with its flag to an l-torsion-free one, giving a crystalline lift ρ₂ with a full invariant flag and the same Hodge–Tate weights; Clozel–Harris–Taylor Lemma 2.4.1 (the Fontaine–Laffaille ring is formally smooth) gives ρ|G_{K′} ∼ ρ₂, and (1) applies to ρ₂.

*Prerequisites.* PL.1/potentially-diagonalizable (Diagonalizable and potentially diagonalizable representations); PL.1/connects-relation (Connecting and strongly connecting local lifts); PL.1/connects-properties (Properties of connection and strong connection); LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition; LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness; PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ).

*Acceptance.* Newton–Thorne 2026 cites 'Lemma 1.4.1' for (2); the intended reference is Lemma 1.4.3(2) (source issue E2). Two-dimensional crystalline representations of G_{Q_l} with Hodge–Tate weights {0, k − 1}, 2 ≤ k ≤ l − 1, are potentially diagonalizable.

*Sources.* BLGGT14 §1.4, Lemma 1.4.3, pp. 28–29; BLGGT14 §1.4, Lemma 1.4.3(2), p. 29.

### Two-dimensional potentially Barsotti–Tate representations are potentially diagonalizable

`PL.1/potentially-barsotti-tate-diagonalizable` (theorem)

Let K/Q_l be finite and ρ : G_K → GL_2(Q̄_l) potentially Barsotti–Tate (potentially crystalline with all labelled Hodge–Tate weights {0, 1}). Then ρ is potentially diagonalizable (Gee–Kisin, Lemma 4.4.1, as used by Newton–Thorne 2021 II §3 and Newton–Thorne 2026).

*Hypotheses.* ρ two-dimensional, potentially crystalline with labelled Hodge–Tate weights {0, 1}.

*Proof outline.*

1. After a finite extension K′/K, ρ|G_{K′} is Barsotti–Tate and ρ̄|G_{K′} is trivial.
2. Kisin's description of the components of Barsotti–Tate deformation rings of rank two (LocalGaloisDeformationRings R08.4/rank-two-bt-components; Kisin, connectedness of the non-ordinary locus and the ordinary components) shows that every component of the Barsotti–Tate ring of the trivial residual representation contains an ordinary point, i.e. a point with an invariant flag with crystalline graded characters.
3. That ordinary point connects to a sum of crystalline characters (PL.1/pd-criteria (1)), so ρ|G_{K′} is diagonalizable.

*Prerequisites.* PL.1/potentially-diagonalizable (Diagonalizable and potentially diagonalizable representations); PL.1/pd-criteria (Ordinary and Fontaine–Laffaille representations are potentially diagonalizable); LocalGaloisDeformationRings:R08.4/rank-two-bt-components; LocalGaloisDeformationRings:R08.4/rank-two-ordinary-locus; LocalGaloisDeformationRings:R08.4/rank-two-nonordinary-connected.

*Acceptance.* Newton–Thorne II apply it to r_{π′,ι} for a weight-two π′ with potentially Barsotti–Tate local representation at t.

*Sources.* NT21B §3, proof of Theorem 3.1, p. 29.

### Potential diagonalizability is preserved by the tensor operations

`PL.1/pd-operations` (theorem)

Let K/Q_l be finite and ρ, ρ′ potentially diagonalizable representations of G_K. Then ρ ⊕ ρ′, ρ ⊗ ρ′, ρ^∨, every twist of ρ by a potentially crystalline character, and every symmetric power Sym^m ρ are potentially diagonalizable; so is ρ|G_{K′} for every finite K′/K (BLGGT14 §1.4; the remark after Barnet-Lamb–Gee–Geraghty 2011, Definition 3.3.5, as used by Newton–Thorne 2021 II §3).

*Hypotheses.* ρ, ρ′ potentially diagonalizable.

*Proof outline.*

1. Pass to K′ over which both are diagonalizable: ρ|G_{K′} ∼ ⊕χ_i and ρ′|G_{K′} ∼ ⊕χ′_j.
2. ∼ is compatible with ⊕, ⊗ and duals (PL.1/connects-properties), so ρ ⊗ ρ′ ∼ ⊕χ_iχ′_j, a sum of crystalline characters.
3. Sym^m: the functor Sym^m on lifting rings maps the component containing ρ|G_{K′} into the one containing Sym^m(⊕χ_i), a sum of crystalline characters, by functoriality of the potentially crystalline rings of fixed Hodge type (images of irreducible sets are irreducible).

*Prerequisites.* PL.1/potentially-diagonalizable (Diagonalizable and potentially diagonalizable representations); PL.1/connects-properties (Properties of connection and strong connection); ArithmeticGaloisRepresentations:G7/symmetric-and-exterior-powers.

*Acceptance.* Sym^{n−1} of a two-dimensional potentially Barsotti–Tate representation is potentially diagonalizable (Newton–Thorne II, proof of Theorem 3.1).

*Sources.* NT21B §3, proof of Theorem 3.1, p. 29; BLGGT14 §1.4, p. 27.

## PL.2. Definite unitary groups, algebraic modular forms and their Hecke algebras

**Objects.** For an imaginary CM field L with L/L⁺ unramified at all finite places and 4 | n[L⁺ : ℚ]: the definite unitary group G/O_{L⁺} quasi-split at every finite place and isomorphic to U_n(ℝ) at every infinite place, with ι_w : G(O_{L⁺_v}) ≅ GL_n(O_{L_w}) at split v = ww^c (Clozel–Harris–Taylor §3.3, as in Thorne 2012 §6); the spaces S_{λ,{χ_v}}(U, A) of algebraic modular forms with integral weight-λ coefficients and characters χ_v at Iwahori places, specializing AutomorphicFormsOnReductiveGroups:AF.5; the Hecke operators T_w^j and the Hecke algebras T^T_{λ,{χ_v}}(U, O); Iwahori levels Iw(ṽ^{b,c}) at l, the rescaled operators U^j_{λ,ϖ_ṽ}, the ordinary idempotent and the big ordinary Hecke algebra T^{T,ord}(U(l^∞), O) over Λ = O⟦T(l)⟧ (Geraghty, as in Thorne 2012 §8 and Allen–Newton–Thorne §§4.1–4.2); Taylor–Wiles levels U₁(Q) ⊂ U₀(Q).

**Theorems.** Exactness of A ↦ S(U, A) and freeness of S(V, O) over O[U/V] for l-torsion-free stabilizers (Thorne 2012, Lemmas 6.3–6.4); Galois representations attached to constituents (Theorem 6.5); the 𝒢_n-valued Hecke-algebra Galois representation r_m of type 𝒮 at a non-Eisenstein m (Propositions 6.6–6.7, 8.4–8.5); freeness of ordinary forms over Λ (Proposition 8.2, Newton–Thorne 2021 Proposition 6.5) and Hida classicality; base change and descent between G and GL_n (Labesse; Clozel–Thorne 2014 Proposition 2.9; a Hecke-algebra point is automorphic, Geraghty Lemma 2.25 with Labesse Corollaire 5.3).

**Depends on.** Within this roadmap: PL.0. Other roadmaps: AdelicAlgebraicGroups:AA.0, ArithmeticGaloisRepresentations:G7, AutomorphicFormsOnReductiveGroups:AF.4, AutomorphicFormsOnReductiveGroups:AF.5, AutomorphicGaloisRepresentationsPartII:AG2.0, AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.6, AutomorphicGaloisRepresentationsPartII:AG2.7, EndoscopicTransferAndUnitaryTraceComparison:ET.6, EndoscopicTransferAndUnitaryTraceComparison:ET.7a, GlobalGaloisDeformations:R04.2, IntegralHeckeAndGaloisDeterminants:IHG.0, IntegralHeckeAndGaloisDeterminants:IHG.1, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:L8, PadicFamilies:L0a.

### The definite unitary group attached to a CM field

`PL.2/definite-unitary-group` (construction) — planet: *Definite unitary group*

Let L be an imaginary CM field with maximal totally real subfield L⁺, L/L⁺ unramified at every finite place, and n ≥ 1 with 4 | n[L⁺ : ℚ]. Let B = M_n(L) with an involution (·)* of the second kind and G the unitary group of B, G(R) = {g ∈ B ⊗_{L⁺} R : gg* = 1}. The involution can be chosen so that G is quasi-split at every finite place of L⁺ and G(L⁺_v) ≅ U_n(ℝ) at every infinite place v. A maximal order O_B ⊂ B with O_B* = O_B and O_{B,w} maximal at every place w split over L⁺ defines an integral model G over O_{L⁺}. For v = ww^c split in L there is ι_v : O_{B,v} ≅ M_n(O_{L_w}) × M_n(O_{L_{w^c}}) with ι_v(g*) = ᵗι_v(g)^c, whose first projection gives ι_w : G(O_{L⁺_v}) ≅ GL_n(O_{L_w}) (Clozel–Harris–Taylor §3.3 with S(B) = ∅, as in Thorne 2012 §6). For every finite place v of L⁺ inert in L the group G(L⁺_v) has hyperspecial maximal compact subgroups.

*Hypotheses.* L/L⁺ imaginary CM, unramified at all finite places; 4 divides n[L⁺ : ℚ].

*Proof outline.*

1. Existence of the involution with the prescribed local behaviour: the obstruction to a global hermitian form with given localisations is a sign in ℤ/2 given by the product of local invariants; the condition 4 | n[L⁺ : ℚ] makes the product of the definite signs at the infinite places trivial while every finite place is quasi-split (Clozel–Harris–Taylor §3.3).
2. The maximal order and the isomorphisms ι_v exist because B_w ≅ M_n(L_w) at split places and O_B can be chosen locally and glued.
3. G is anisotropic over L⁺ and G(L⁺ ⊗ ℝ) is compact, so G satisfies the hypotheses of AutomorphicFormsOnReductiveGroups AF.5/algebraic-modular-forms.

*Uses.* Thorne 2012 §§6–10: the group on which algebraic modular forms and Hecke algebras are defined in every R = T theorem. Geraghty §2; Thorne 2015 §4; Allen–Newton–Thorne §4: ordinary forms and big ordinary Hecke algebras. Newton–Thorne 2023 §4: the definite unitary groups in the proof of adjoint Selmer vanishing. Le–Le Hung–Levin–Morra, Appendix A: patching functors from algebraic modular forms on a definite unitary group.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.DefiniteUnitary.unitaryGroup` | constructor | The group scheme G over O_{L⁺} attached to (B, (·)*, O_B). |
| `TauCeti.DefiniteUnitary.iotaW` | data | For v = ww^c split, the isomorphism ι_w : G(O_{L⁺_v}) ≅ GL_n(O_{L_w}), extending to G(L⁺_v) ≅ GL_n(L_w). |
| `TauCeti.DefiniteUnitary.iotaW_conj` | relation | ι_{w^c}(g) = ᵗ(ι_w(g))^{−c}: the two identifications differ by transpose-inverse composed with complex conjugation. |
| `TauCeti.DefiniteUnitary.isCompact_infty` | other | G(L⁺ ⊗_ℚ ℝ) ≅ ∏_{v∣∞} U_n(ℝ) is compact. |
| `TauCeti.DefiniteUnitary.quasiSplit` | other | G is quasi-split at every finite place of L⁺; at inert places G(L⁺_v) has hyperspecial maximal compact subgroups. |
| `TauCeti.DefiniteUnitary.finite_doubleCoset` | other | G(L⁺)\G(𝔸^∞_{L⁺})/U is finite for every open compact U (AF.5/algebraic-modular-forms-structure). |

*Unit tests.*

* `unitaryGroup_rank_one` (computation): For n = 1, G(L⁺) = {x ∈ L^× : x x^c = 1} and G(L⁺_v) ≅ L_w^× via ι_w at a split place v = ww^c.
* `unitaryGroup_compact_infty` (characterisation): For every infinite place v of L⁺, G(L⁺_v) is isomorphic to the compact group U_n(ℝ).
* `unitaryGroup_split_place` (compatibility): For v = ww^c split, ι_w identifies G(L⁺_v) with GL_n(L_w) and G(O_{L⁺_v}) with GL_n(O_{L_w}), compatibly with Mathlib's GL_n.
* `unitaryGroup_parity_obstruction` (non-example): For n even with n[L⁺ : ℚ] ≡ 2 mod 4 there is no involution of the second kind on M_n(L) that is quasi-split at every finite place and definite at every infinite place: at each real place the definite and the quasi-split hermitian forms have discriminants differing by (−1)^{n/2}, so the product formula for the local discriminant classes fails. (For n odd the discriminant can be adjusted by a scalar and there is no obstruction; Thorne 2012 imposes 4 | n[L⁺ : ℚ] uniformly.)

*Prerequisites.* AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms; AdelicAlgebraicGroups:AA.0.

*Acceptance.* For n = 1, G = U_1 = ker(N_{L/L⁺} : Res_{L/L⁺} 𝔾_m → 𝔾_m), and G(L⁺)\G(𝔸^∞_{L⁺})/U is finite. For split v, ι_w(G(O_{L⁺_v})) = GL_n(O_{L_w}) and ι_{w^c} = ᵗ(ι_w)^{−c}.

*Sources.* Tho12 §6, pp. 30–31; Tho12 §6, p. 31.

### Algebraic modular forms on a definite unitary group

`PL.2/unitary-algebraic-modular-forms` (construction) — planet: *Algebraic modular forms on U(n)*

Keep G/O_{L⁺} of PL.2/definite-unitary-group. Let l be odd with every place of L⁺ above l split in L; S_l the places above l with chosen ṽ | v; K ⊂ Q̄_l a finite extension with ring O containing the images of all embeddings of L; Ĩ_l the embeddings L → K inducing places of S̃_l. For λ ∈ (ℤⁿ₊)^{Ĩ_l} let M_λ = ⊗_{τ∈Ĩ_l} M_{λ_τ}, M_{λ_τ} the O-lattice in the algebraic representation of GL_n of highest weight λ_τ of AutomorphicFormsOnReductiveGroups AF.4/coefficient-lattices, with G(O_{L⁺,l}) acting through τ ∘ ι_{ṽ(τ)}. Let R be a finite set of split places disjoint from S_l with characters χ_v = χ_{v,1} × ⋯ × χ_{v,n} : Iw(ṽ)/Iw₁(ṽ) ≅ (k(ṽ)^×)ⁿ → O^× for v ∈ R, M_{λ,{χ_v}} = M_λ ⊗ ⊗_{v∈R} O(χ_v), and U = ∏_v U_v open compact with U_v ⊂ ι_ṽ^{−1}Iw(ṽ) for v ∈ R and U_v ⊂ G(O_{L⁺_v}) for v | l. For an O-module A, S_{λ,{χ_v}}(U, A) is the module of functions f : G(L⁺)\G(𝔸^∞_{L⁺}) → M_{λ,{χ_v}} ⊗_O A with f(gu) = u_{S_l∪R}^{−1} f(g) for u ∈ U (Thorne 2012, Definition 6.1), the specialisation of AF.5/algebraic-modular-forms. S_{λ,{χ_v}}(Q̄_l) = lim_U S_{λ,{χ_v}}(U, Q̄_l) carries an action of G(𝔸^{∞,R}_{L⁺}) × ∏_{v∈R} Iw(ṽ), and for ι : Q̄_l ≅ ℂ there is an ι-linear isomorphism with Hom_{G(L⁺_∞)}((⊗_{v∈R} ℂ(ιχ_v^{−1})) ⊗ ξ_{ιλ}^∨, 𝒜(G)) (Proposition 6.2), ξ_{ιλ} the representation of ∏_{v|∞} U_n(ℝ) of highest weight ιλ.

*Hypotheses.* l odd, every place above l split in L; λ ∈ (ℤⁿ₊)^{Ĩ_l}; U_v ⊂ G(O_{L⁺_v}) for v | l and U_v ⊂ ι_ṽ^{−1}Iw(ṽ) for v ∈ R.

*Proof outline.*

1. Specialise AF.5/algebraic-modular-forms to G, the coefficient module M_{λ,{χ_v}} of AF.4/coefficient-lattices and the level U.
2. The comparison with automorphic forms is AF.5/algebraic-modular-forms-structure (iii) with the characters χ_v at R (Clozel–Harris–Taylor Proposition 3.3.2, first part).
3. Functoriality in A, the restriction and trace maps for V ⊂ U and the double-coset description S(U, A) ≅ ⊕_j (M ⊗ A)^{t_j^{−1}G(L⁺)t_j ∩ U} come from AF.5.

*Uses.* Thorne 2012, Theorems 6.8 and 8.6: the modules patched in the R = T theorems. Newton–Thorne 2021 §6: the modules S^{ord}(U(D, c), M_D) of the deformation data D. Liu et al. and Le–Le Hung–Levin–Morra, Appendix A: patching of algebraic modular forms.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.DefiniteUnitary.AlgebraicModularForm` | constructor | S_{λ,{χ_v}}(U, A) as the O-module of functions on G(L⁺)\G(𝔸^∞_{L⁺}) with the U-equivariance. |
| `TauCeti.DefiniteUnitary.AlgebraicModularForm.map` | functoriality | An O-linear map A → A′ induces S(U, A) → S(U, A′), with map_id and map_comp. |
| `TauCeti.DefiniteUnitary.AlgebraicModularForm.restrict` | functoriality | For V ⊂ U, the inclusion S(U, A) → S(V, A). |
| `TauCeti.DefiniteUnitary.AlgebraicModularForm.trace` | functoriality | For V ⊂ U, the trace tr_{U/V} : S(V, A) → S(U, A), f ↦ Σ_{u ∈ U/V} u·f. |
| `TauCeti.DefiniteUnitary.AlgebraicModularForm.equiv_doubleCoset` | characterisation | S(U, A) ≅ ⊕_j (M_{λ,{χ_v}} ⊗ A)^{t_j^{−1}G(L⁺)t_j ∩ U} for representatives t_j of the finite double coset space. |
| `TauCeti.DefiniteUnitary.AlgebraicModularForm.automorphicComparison` | equivalence | The ι-linear isomorphism of Thorne 2012 Proposition 6.2 with Hom_{G(L⁺_∞)}((⊗ℂ(ιχ_v^{−1})) ⊗ ξ_{ιλ}^∨, 𝒜(G)). |

*Unit tests.*

* `amf_weight_zero_level` (computation): For λ = 0 and R = ∅, S_0(U, O) is the module of functions G(L⁺)\G(𝔸^∞_{L⁺})/U → O.
* `amf_zero_module` (degenerate): S_{λ,{χ_v}}(U, 0) = 0, and S(U, −) is additive in A.
* `amf_compatibility_AF5` (compatibility): S_{λ,{χ_v}}(U, A) is AF.5's S(U, M_{λ,{χ_v}} ⊗_O A) for the group G of PL.2/definite-unitary-group.
* `amf_not_free_without_smallness` (non-example): If some t^{−1}G(L⁺)t ∩ U contains an element of order l acting nontrivially on M ⊗ k, S(U, −) need not be exact: S(U, k) can be larger than S(U, O) ⊗ k.

*Prerequisites.* PL.2/definite-unitary-group (The definite unitary group attached to a CM field); AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms; AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms-structure; AutomorphicFormsOnReductiveGroups:AF.4/coefficient-lattices.

*Acceptance.* For n = 1, λ = 0 and R = ∅, S_0(U, O) is the module of O-valued functions on the finite set G(L⁺)\G(𝔸^∞_{L⁺})/U. For λ = 0 and U sufficiently small, S_0(U, O) is free of rank #G(L⁺)\G(𝔸^∞_{L⁺})/U.

*Sources.* Tho12 §6, Definition 6.1, p. 32; Tho12 §6, Proposition 6.2, p. 33.

### Hecke algebras of definite unitary groups and their maximal ideals

`PL.2/unitary-hecke-algebra` (construction) — planet: *Hecke algebra of a definite unitary group*

Keep the notation of PL.2/unitary-algebraic-modular-forms and let T ⊃ S_l ∪ R be a finite set of split places. For w a place of L split over L⁺, not above T, with uniformizer ϖ_w and 1 ≤ j ≤ n, T_w^j = ι_w^{−1}[GL_n(O_{L_w}) diag(ϖ_w 1_j, 1_{n−j}) GL_n(O_{L_w})] acts on S_{λ,{χ_v}}(U, A). T^T_{λ,{χ_v}}(U, A) is the commutative O-subalgebra of End_O(S_{λ,{χ_v}}(U, A)) generated by the T_w^j and (T_w^n)^{−1} (Thorne 2012 §6). It is finite over O. A maximal ideal m ⊂ T^T_λ(U, O) has an attached semisimple r̄_m : G_L → GL_n(T/m) with r̄_m^c ≅ r̄_m^∨(1 − n), unramified outside T, with char r̄_m(Frob_w)(X) = Σ_j (−1)^j (Nw)^{j(j−1)/2} T_w^j X^{n−j} mod m (Proposition 6.6); m is non-Eisenstein if r̄_m is absolutely irreducible.

*Hypotheses.* T ⊃ S_l ∪ R a finite set of split places; U_v = G(O_{L⁺_v}) at split places outside T.

*Proof outline.*

1. The Hecke operators come from AF.5/algebraic-modular-forms ([U g U] action), with ι_w transporting the GL_n double cosets; they commute because the local spherical Hecke algebra of GL_n(L_w) is commutative.
2. Finiteness over O: S(U, O) is finite over O (AF.5/algebraic-modular-forms-structure (i)).
3. The residual representation r̄_m: realise T ⊗ Q̄_l on the constituents of S(Q̄_l) (PL.2/unitary-constituent-galois-representation), reduce the attached Galois representations, and descend the residual pseudocharacter to T/m (IntegralHeckeAndGaloisDeterminants IHG.0) with Brauer–Nesbitt; this is Clozel–Harris–Taylor Proposition 3.4.2.

*Uses.* Thorne 2012, Theorem 6.8: T^T_λ(U, O)_m receives R^univ_𝒮 and the patching argument proves R → T_m is an isomorphism up to nilpotents. Thorne 2012, proof of Theorem 10.1: the maximal ideal m attached to the descent of π_L. Newton–Thorne 2026, end of §3: a homomorphism T_{F₃} → O through which the Galois representation factors comes from an automorphic representation.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.DefiniteUnitary.heckeOperator` | constructor | T_w^j acting on S_{λ,{χ_v}}(U, A) for w split, not above T. |
| `TauCeti.DefiniteUnitary.heckeAlgebra` | constructor | T^T_{λ,{χ_v}}(U, A) as an O-subalgebra of End_O(S_{λ,{χ_v}}(U, A)). |
| `TauCeti.DefiniteUnitary.heckeAlgebra.isCommutative` | instance | T^T_{λ,{χ_v}}(U, A) is commutative. |
| `TauCeti.DefiniteUnitary.heckeAlgebra.finite` | instance | T^T_λ(U, O) is a finite O-algebra; it is semilocal and the product of its localisations at maximal ideals. |
| `TauCeti.DefiniteUnitary.residualRep` | data | For a maximal ideal m, the semisimple r̄_m : G_L → GL_n(T/m) with the stated Frobenius characteristic polynomials and r̄_m^c ≅ r̄_m^∨(1 − n). |
| `TauCeti.DefiniteUnitary.IsNonEisenstein` | constructor | m is non-Eisenstein if r̄_m is absolutely irreducible. |
| `TauCeti.DefiniteUnitary.heckeAlgebra.map_restrict` | functoriality | For V ⊂ U with the same T, restriction S(U, O) → S(V, O) is Hecke-equivariant and induces T^T(V, O) ↠ T^T(U, O). |

*Unit tests.*

* `heckeAlgebra_rank_one` (computation): For n = 1, λ = 0, T^T_0(U, O) is the image of O[(𝔸^{∞,T}_L)^×/L^×-classes] acting on functions on the finite group G(L⁺)\G(𝔸^∞)/U, and T_w^1 acts by translation by ι_w^{−1}(ϖ_w).
* `heckeAlgebra_charpoly` (characterisation): If m comes from an eigenform with eigenvalues t_{w,j} then char r̄_m(Frob_w)(X) = Σ_j (−1)^j (Nw)^{j(j−1)/2} t_{w,j} X^{n−j} for every w not above T.
* `heckeAlgebra_zero` (degenerate): If S_{λ,{χ_v}}(U, O) = 0 then T^T_{λ,{χ_v}}(U, O) = 0.
* `eisenstein_not_nonEisenstein` (non-example): For n = 2, λ = 0, the maximal ideal of the constant functions (eigenvalues of the trivial representation of G) has r̄_m ≅ 1 ⊕ ε̄^{−1} up to twist, which is reducible, so it is not non-Eisenstein.

*Prerequisites.* PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter; IntegralHeckeAndGaloisDeterminants:IHG.0/determinant; AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type; AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal.

*Acceptance.* For n = 1 the Hecke algebra is generated by the operators T_w^1 = [ϖ_w], and maximal ideals correspond to Galois orbits of mod l characters of G(L⁺)\G(𝔸^∞)/U. The maximal ideal m attached by a RACSDC π, at a level U with (ι⁻¹Π^∞)^U ≠ 0 for its descent Π, has r̄_m ≅ r̄_{l,ι}(π) (Thorne 2012, proof of Theorem 10.1).

*Sources.* Tho12 §6, p. 32; Tho12 §6, Proposition 6.6, p. 36.

### Exactness and group-ring freeness at l-torsion-free level

`PL.2/exactness-and-freeness` (theorem)

Keep PL.2/unitary-algebraic-modular-forms. (1) If t^{−1}G(L⁺)t ∩ U contains no element of order l for every t ∈ G(𝔸^∞_{L⁺}), the functor A ↦ S_{λ,{χ_v}}(U, A) on O-modules is exact (Thorne 2012, Lemma 6.3). (2) If moreover V ⊂ U is a normal open subgroup with U/V abelian of l-power order, acting by diamond operators [VuV], then tr_{U/V} : S_{λ,{χ_v}}(V, A)_{U/V} → S_{λ,{χ_v}}(U, A) is an isomorphism and S_{λ,{χ_v}}(V, O) is a free O[U/V]-module (Lemma 6.4).

*Hypotheses.* t^{−1}G(L⁺)t ∩ U has no element of order l for all t; for (2): V ⊴ U, U/V abelian of l-power order.

*Proof outline.*

1. (1) S(U, A) ≅ ⊕_j (M ⊗ A)^{Γ_j} with Γ_j = t_j^{−1}G(L⁺)t_j ∩ U finite (G compact at infinity) of order prime to l, so taking Γ_j-invariants is exact (compare Gross, Proposition 4.3).
2. (2) The perfect pairing (f, g)_V = Σ_t ⟨f(t), g(t)⟩ / #(t^{−1}G(L⁺)t ∩ V) between S_{λ,{χ_v}}(V, O) and S_{λ^∨,{χ_v^{−1}}}(V, O) is compatible with tr_{U/V}; Pontryagin duality turns the coinvariant statement into S(U, K/O) = S(V, K/O)^{U/V}, which holds by definition.
3. Freeness: by Nakayama choose r = dim_k S(U, k) generators of S(V, O) over O[U/V]; the surjection O[U/V]^r → S(V, O) is an isomorphism by comparing O-ranks using (1).

*Prerequisites.* PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms-structure.

*Acceptance.* Applied at Taylor–Wiles level: S(U₁(Q), O) is free over O[Δ_Q] and S(U₁(Q), O)_{Δ_Q} ≅ S(U₀(Q), O) (PL.2/taylor-wiles-level-structures). Without the l-torsion-freeness, exactness fails for l dividing the order of a stabiliser that acts nontrivially on M ⊗ k.

*Sources.* Tho12 §6, Lemma 6.3, p. 33; Tho12 §6, Lemma 6.4, p. 34.

### Galois representations attached to constituents of algebraic modular forms

`PL.2/unitary-constituent-galois-representation` (theorem)

Let π be an irreducible G(𝔸^{∞,R}_{L⁺}) × ∏_{v∈R} Iw(ṽ)-constituent of S_{λ,{χ_v}}(Q̄_l). There is a continuous semisimple r_l(π) : G_L → GL_n(Q̄_l) such that (i) for v ∉ S_l split as ww^c, (r_l(π)|G_{L_w})^{ss} ≅ r_l(π_v ∘ ι_w^{−1})^{ss}; (ii) r_l(π)^c ≅ r_l(π)^∨(1 − n); (iii) r_l(π) is unramified at inert v where π_v has a hyperspecial-fixed vector; (iv) for v ∈ R with (π_ṽ)^{ι_ṽ^{−1}Iw(ṽ)} ≠ 0 and σ ∈ I_{L_ṽ}, char r_l(π)(σ)(X) = ∏_j (X − χ_{v,j}^{−1}(Art_{L_ṽ}^{−1}(σ))); (v) at v ∈ S_l split as ww^c, r_l(π)|G_{L_w} is de Rham, crystalline when π_w is unramified, with HT_τ = {λ_{τ,j} + n − j}. If r_l(π) is irreducible then π_w ∘ ι_w^{−1} is generic at every split place (Thorne 2012, Theorem 6.5, from Guerberoff Theorem 2.3 and Shalika).

*Hypotheses.* π an irreducible constituent of S_{λ,{χ_v}}(Q̄_l).

*Proof outline.*

1. Via PL.2/unitary-algebraic-modular-forms (Proposition 6.2) π is the finite part of an automorphic representation Π of G(𝔸_{L⁺}) with Π_∞ ≅ ξ_{ιλ}^∨.
2. Labesse's stable base change (PL.2/unitary-base-change-and-descent) gives an isobaric conjugate self-dual BC(Π) on GL_n(𝔸_L), a sum of discrete-series-at-infinity cuspidal pieces (Guerberoff), and r_l(π) is the sum of the Galois representations of the pieces (requested of AutomorphicGaloisRepresentationsPartII AG2.2).
3. Local–global compatibility away from l and the de Rham/crystalline properties at l are AG2.6; genericity of π_w when r_l(π) is irreducible follows from cuspidality of BC(Π) and Shalika's theorem.

*Prerequisites.* PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline; AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime; AutomorphicGaloisRepresentationsPartII:AG2.2; EndoscopicTransferAndUnitaryTraceComparison:ET.7a.

*Acceptance.* For n = 1, r_l(π) is the character attached to the Hecke character π ∘ N, and (ii) is its conjugate self-duality.

*Sources.* Tho12 §6, Theorem 6.5, p. 35.

### The 𝒢_n-valued Galois representation over the localized Hecke algebra

`PL.2/hecke-valued-galois-representation` (theorem)

Let m ⊂ T^T_λ(U, O) be a non-Eisenstein maximal ideal (U_v = G(O_{L⁺_v}) at split v ∉ T, hyperspecial at inert v). Then r̄_m extends to a continuous r̄_m : G_{L⁺} → 𝒢_n(T/m) with r̄_m^{−1}(GL_n × GL_1) = G_L and ν ∘ r̄_m = ε^{1−n}δ_{L/L⁺}^{µ_m} for some µ_m ∈ ℤ/2, and r̄_m lifts, uniquely up to 1 + M_n(m)-conjugation, to r_m : G_{L⁺} → 𝒢_n(T^T_λ(U, O)_m) with (i) r_m unramified at split w ∉ T with char r_m(Frob_w)(X) = Σ_j (−1)^j (Nw)^{j(j−1)/2} T_w^j X^{n−j}, (ii) r_m unramified at inert v with U_v hyperspecial, (iii) ν ∘ r_m = ε^{1−n}δ_{L/L⁺}^{µ_m} (Thorne 2012, Propositions 6.6–6.7; Clozel–Harris–Taylor Proposition 3.4.4, using l > 2 through their Lemma 2.1.12).

*Hypotheses.* m non-Eisenstein; l odd.

*Proof outline.*

1. T_m is reduced and l-torsion free, and T_m ⊗ Q̄_l ≅ ∏ Q̄_l over the constituents of S(U, Q̄_l)_m; their Galois representations (PL.2/unitary-constituent-galois-representation) assemble into a T_m ⊗ Q̄_l-valued pseudocharacter which takes values in T_m (IntegralHeckeAndGaloisDeterminants IHG.0/pseudocharacter).
2. Absolute irreducibility of r̄_m and Carayol's theorem (GlobalGaloisDeformations R04.2/carayol-trace-theorem) give a GL_n(T_m)-valued representation of G_L.
3. The extension to 𝒢_n uses the conjugate self-duality and the dictionary of ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group, with the sign µ_m determined by Bellaïche–Chenevier (Thorne 2017, Theorem 3.2).

*Prerequisites.* PL.2/unitary-hecke-algebra (Hecke algebras of definite unitary groups and their maximal ideals); PL.2/unitary-constituent-galois-representation (Galois representations attached to constituents of algebraic modular forms); GlobalGaloisDeformations:R04.2/carayol-trace-theorem; ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group; IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter; IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton.

*Acceptance.* r_m is of type 𝒮 for the deformation problem of PL.3 (Thorne 2012, Theorem 6.8, first assertion). Composing r_m with a homomorphism f : T_m → O gives the integral model of r_l(π) for the corresponding constituent π.

*Sources.* Tho12 §6, Proposition 6.7, p. 36.

### Base change and descent between definite unitary groups and GL_n

`PL.2/unitary-base-change-and-descent` (theorem)

(1) (Labesse, Théorème 5.4 and Corollaire 5.3; Clozel–Harris–Taylor Proposition 3.3.2) Let L be as in PL.2/definite-unitary-group. If π is a RACSDC automorphic representation of GL_n(𝔸_L) of weight ι_*λ, unramified at inert places, there is an automorphic representation Π of G(𝔸_{L⁺}) with Π_∞ ≅ ξ_{ιλ}^∨, Π_v unramified at inert v (fixed vectors under a hyperspecial subgroup) and Π_v ≅ π_w ∘ ι_w at split v = ww^c; conversely every such Π has a strong base change to an isobaric conjugate self-dual representation of GL_n(𝔸_L). (2) A homomorphism f : T^T_λ(U, O)_m → O (m non-Eisenstein) comes from a RACSDC π of GL_n(𝔸_L) with r_{l,ι}(π) ≅ f ∘ r_m|G_L (Geraghty Lemma 2.25 with Labesse Corollaire 5.3, as used by Newton–Thorne 2026 §3; the same holds for the ordinary Hecke algebras of PL.2/big-ordinary-hecke-algebra at arithmetic points). (3) (Clozel–Thorne 2014, Proposition 2.9) Soluble base change and descent between automorphic representations of G and conjugate self-dual representations of GL_n commute with these correspondences. (4) (Thorne 2015, Proposition 4.4) For π of weight 0 Steinberg above the places of S(B), the descent can be chosen with trivial Π_∞ and any level U hyperspecial at inert places.

*Hypotheses.* L/L⁺ unramified at all finite places, 4 | n[L⁺ : ℚ]; π RACSDC (for (1)) or m non-Eisenstein (for (2)).

*Proof outline.*

1. Labesse's stable twisted trace formula comparison between G and Res_{L/L⁺}GL_n gives (1); it is requested of EndoscopicTransferAndUnitaryTraceComparison ET.7a, whose pure automorphic branch constructs the unitary-to-GL_m base-change character identities.
2. (2): T_m ⊗ Q̄_l splits over the constituents of S(U, Q̄_l)_m; f picks a constituent π_G; its base change is cuspidal because f ∘ r_m|G_L ≅ r̄_m-lift is irreducible (non-Eisenstein), and the Galois representations match at split places (PL.2/unitary-constituent-galois-representation).
3. (3) follows from (1)–(2) and PL.0/soluble-descent.

*Prerequisites.* PL.2/unitary-hecke-algebra (Hecke algebras of definite unitary groups and their maximal ideals); PL.2/unitary-constituent-galois-representation (Galois representations attached to constituents of algebraic modular forms); EndoscopicTransferAndUnitaryTraceComparison:ET.7a; PL.0/soluble-descent (Soluble base change and descent of automorphy); AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation.

*Acceptance.* Thorne 2012, proof of Theorem 10.1: the RAECSDC π_L is the strong base change of some Π, which produces the maximal ideal m with r̄_m ≅ r̄|G_{L⁺}. Newton–Thorne 2026 §3: s|G_{K₃} is automorphic by (2).

*Sources.* NT26 §3, end of the proof of Proposition 3.13, arXiv v2 p. 30; Tho12 §10, proof of Theorem 10.1, p. 55; Tho15 §4, Proposition 4.4, p. 36.

### Iwahori levels at l, the U_p-operators and ordinary parts

`PL.2/iwahori-ordinary-parts` (construction)

Keep PL.2/unitary-algebraic-modular-forms. For 0 ≤ b ≤ c and v ∈ S_l, Iw(ṽ^{b,c}) ⊂ GL_n(O_{L_ṽ}) consists of the matrices upper triangular modulo ṽ^c and upper triangular unipotent modulo ṽ^b; U(l^{b,c}) = U^l × ∏_{v∈S_l} ι_ṽ^{−1}Iw(ṽ^{b,c}). For a uniformizer ϖ_ṽ and α^j_{ϖ_ṽ} = diag(ϖ_ṽ 1_j, 1_{n−j}), the operators U^j_{λ,ϖ_ṽ} = (w₀λ)(α^j_{ϖ_ṽ})^{−1}[U(l^{b,c}) ι_ṽ^{−1}(α^j_{ϖ_ṽ}) U(l^{b,c})] and the diamond operators ⟨u⟩, u ∈ T(O_{L⁺,l}) (T the diagonal torus), act on S_{λ,{χ_v}}(U(l^{b,c}), A) and commute with the inclusions for b ≤ b′, c ≤ c′. With U(l) = ∏_{v∈S_l}∏_j U^j_{λ,ϖ_ṽ}, the ordinary idempotent is e = lim_r U(l)^{r!}, and S^{ord} = eS; it is the largest direct summand on which every U^j_{λ,ϖ_ṽ} is invertible, and it does not depend on ϖ_ṽ (Geraghty §2.3, Definitions 2.8, 2.13; Thorne 2012 §8; Newton–Thorne 2021 §1.23).

*Hypotheses.* 0 ≤ b ≤ c; U^l fixed away from l.

*Proof outline.*

1. The normalisation by (w₀λ)(α)^{−1} makes the U^j_{λ,ϖ_ṽ} preserve the integral structure M_λ (Geraghty §2.2–2.3).
2. e = lim U(l)^{r!} exists on the finite O-module S(U(l^{b,c}), A) for A finite, by the finite-module ordinary projector of PadicFamilies L0a/finite-ordinary-projector applied to the commuting operators U^j; it is compatible with inclusions because the U^j commute with them.
3. Independence of ϖ_ṽ: changing the uniformizer multiplies U^j by a diamond operator of finite order commuting with everything.

*Uses.* Thorne 2012, Definition 8.1: the ordinary Hecke algebra T^{T,ord}. Newton–Thorne 2021, §6: S^{ord}(U(D, c), M_D) and H^{ord}(D). Allen–Newton–Thorne §§4.1–4.2; Newton–Thorne 2026 §3: the ordinary forms on which T_{F₂}, T_{F₃} act.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.DefiniteUnitary.iwahoriLevel` | constructor | U(l^{b,c}) = U^l × ∏_{v∈S_l} ι_ṽ^{−1}Iw(ṽ^{b,c}). |
| `TauCeti.DefiniteUnitary.uOperator` | constructor | U^j_{λ,ϖ_ṽ} acting on S_{λ,{χ_v}}(U(l^{b,c}), A). |
| `TauCeti.DefiniteUnitary.diamond` | constructor | The diamond operators ⟨u⟩ for u ∈ T(O_{L⁺,l}), giving an action of Λ⁺ = O⟦T(O_{L⁺,l})⟧. |
| `TauCeti.DefiniteUnitary.ordinaryIdempotent` | data | e = lim_r U(l)^{r!} on S(U(l^{b,c}), A) for A finite, and on the colimit. |
| `TauCeti.DefiniteUnitary.ordinaryIdempotent_isIdempotent` | simp | e² = e, and e commutes with all Hecke and diamond operators. |
| `TauCeti.DefiniteUnitary.ordinaryPart_indep_uniformizer` | other | eS does not depend on the uniformizers ϖ_ṽ. |
| `TauCeti.DefiniteUnitary.ordinaryPart_restrict` | functoriality | For b ≤ b′, c ≤ c′ the inclusion S(U(l^{b,c})) ⊂ S(U(l^{b′,c′})) commutes with e. |

*Unit tests.*

* `ordinaryIdempotent_rank_one` (computation): For n = 1 the operator U^1_{λ,ϖ} is invertible and e = 1.
* `ordinaryIdempotent_zero` (degenerate): If S_{λ,{χ_v}}(U(l^{b,c}), A) = 0 then eS = 0.
* `ordinary_compatibility_padicFamilies` (compatibility): On each finite S(U(l^{b,c}), O/λ^m), e agrees with the ordinary projector of PadicFamilies L0a/finite-ordinary-projector for the operator U(l).
* `nonordinary_example` (non-example): A U(l)-eigenform with eigenvalue in λO (for instance a form of weight λ whose Hecke parameters at ṽ have positive slope) lies in (1 − e)S, not in eS.

*Prerequisites.* PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); PadicFamilies:L0a/finite-ordinary-projector; PadicFamilies:L0a/ordinary-part-bijective.

*Acceptance.* For n = 1, U^1_{λ,ϖ} acts invertibly, so S^{ord} = S. For n = 2, L⁺ = ℚ (formally, at a split p) and λ = 0, S^{ord} is the part of the Iwahori-level forms on which U_p acts by a unit: the ordinary part of weight-two forms.

*Sources.* Tho12 §8, p. 44; Tho12 §8, p. 45; NT21 §1.23, p. 25.

### The big ordinary Hecke algebra over Λ

`PL.2/big-ordinary-hecke-algebra` (construction) — planet: *Big ordinary Hecke algebra*

Keep PL.2/iwahori-ordinary-parts. T^T_{λ,{χ_v}}(U(l^{b,c}), A) is generated by the T_w^j, (T_w^n)^{−1} and the ⟨u⟩; T^{T,ord} = eT^T is its image on eS. With S(U(l^∞), K/O) = lim_c S(U(l^{c,c}), K/O) and T^T(U(l^∞), O) = lim_c T^T(U(l^{c,c}), O) (isomorphic to the algebra acting faithfully on S(U(l^∞), K/O), Geraghty Lemma 2.4.7), the big ordinary Hecke algebra T^{T,ord}_{λ,{χ_v}}(U(l^∞), O) = eT^T(U(l^∞), O) is an algebra over Λ⁺ = O⟦T(O_{L⁺,l})⟧ and over Λ = O⟦T(l)⟧, T(l) = ker(∏_{v∈S_l}T(O_{L⁺_v}) → ∏ T(k(v))) (Thorne 2012, Definition 8.1). For λ = 0 the twisted homomorphism T(l) → T^{T,ord}_{0,{χ_v}}(U(l^∞), O)^×, u ↦ (∏_{τ∈Ĩ_l}∏_{i=1}^n τ(u_i)^{1−i})⟨u⟩, gives the Λ-algebra structure used in deformation theory (Definition 8.3, Geraghty Definition 2.6.2). Variants: the algebras T^{ord}(D) of a deformation datum D (Newton–Thorne 2021 §6) and the algebras T_{F₂}, T_{F₃} of Allen–Newton–Thorne §§4.1–4.2.

*Hypotheses.* T ⊃ S_l ∪ R split; U^l fixed.

*Proof outline.*

1. The inverse limit over c is taken along the surjections induced by the inclusions of PL.2/iwahori-ordinary-parts; the Λ⁺-action is continuous because ⟨u⟩ for u ∈ ker(T(O_{L⁺,l}) → T(O/ϖ^c)) acts trivially on level c.
2. Faithfulness on S(U(l^∞), K/O) is Geraghty Lemma 2.4.7 (cited by Thorne 2012 §8).
3. The twist by ∏τ(u_i)^{1−i} makes the universal characters of the local ordinary rings (LocalGaloisDeformationRings L8/ordinary-coefficient-ring) match the diamond action at arithmetic weights.

*Uses.* Thorne 2012, Theorem 8.6, Corollary 8.7: the target of R^univ_{𝒮{χ_v}} in the ordinary R = T theorem, finite over Λ. Thorne 2015, Theorem 4.19; Allen–Newton–Thorne, Theorem 4.1: T_χ and the generic R_𝔭 = T_𝔭 theorem. Newton–Thorne 2021, Proposition 6.5; Newton–Thorne 2026 §3: finite faithful Λ_L-algebras T^{ord}(D), T_{F₂}, T_{F₃}.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra` | constructor | T^{T,ord}_{λ,{χ_v}}(U(l^∞), O) = e · lim_c T^T(U(l^{c,c}), O). |
| `TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.lambdaAlgebra` | instance | The Λ-algebra structure through the twisted diamond operators u ↦ (∏τ(u_i)^{1−i})⟨u⟩. |
| `TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.faithful` | characterisation | T^{T,ord}(U(l^∞), O) acts faithfully on eS(U(l^∞), K/O). |
| `TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.specialize` | projection | For each c, the surjection T^{T,ord}(U(l^∞), O) → T^{T,ord}(U(l^{c,c}), O). |
| `TauCeti.DefiniteUnitary.bigOrdinaryHeckeAlgebra.localize` | data | For a maximal ideal m, the localisation T_m, a complete local Λ-algebra. |

*Unit tests.*

* `bigOrd_rank_one` (computation): For n = 1 and λ = 0, T^{T,ord}(U(l^∞), O) is the completed group ring of the l-adic completion of G(L⁺)\G(𝔸^∞)/U^l T(l)-classes, a finite flat Λ-algebra.
* `bigOrd_zero` (degenerate): If eS(U(l^{1,1}), k) = 0 then T^{T,ord}(U(l^∞), O) = 0.
* `bigOrd_specialization` (compatibility): At sufficiently small U^l, T^{T,ord}(U(l^∞), O) ⊗_Λ Λ/𝔭_{λ,c} surjects onto T^{T,ord}_λ(U(l^{c,c}), O) for the arithmetic prime 𝔭_{λ,c} of weight λ and level c (Hida classicality).
* `bigOrd_not_finite_over_O` (non-example): For n ≥ 1 and S(U(l^{1,1}), k)^{ord} ≠ 0, T^{T,ord}(U(l^∞), O) is not finite over O: it is finite and faithful over Λ, which has Krull dimension 1 + n[L⁺ : ℚ].

*Prerequisites.* PL.2/iwahori-ordinary-parts (Iwahori levels at l, the U_p-operators and ordinary parts); PL.2/unitary-hecke-algebra (Hecke algebras of definite unitary groups and their maximal ideals); LocalGaloisDeformationRings:L8/ordinary-coefficient-ring.

*Acceptance.* For n = 1, the big ordinary Hecke algebra is the completed group algebra of the l-adic completion of the ray class group of conductor l^∞, localised appropriately. Specialising at the augmentation of a weight λ recovers T^{ord}_λ(U(l^{c,c}), O) at sufficiently deep level (Hida classicality, PL.2/hida-classicality).

*Sources.* Tho12 §8, Definition 8.1, p. 45; Tho12 §8, Definition 8.3, p. 46; NT21 §6, p. 89.

### Ordinary forms are finite free over Λ

`PL.2/ordinary-forms-free-over-lambda` (theorem)

If t^{−1}G(L⁺)t ∩ U contains no element of order l for every t, then eS_{λ,{χ_v}}(U(l^∞), K/O)^∨ is a free Λ-module of rank dim_k eS_{λ,{χ_v}}(U(l^{1,1}), k) (Thorne 2012, Proposition 8.2, after Geraghty Proposition 2.5.3), and T^{T,ord}(U(l^∞), O) is a finite faithful Λ-algebra (Thorne 2015, Proposition 4.3; for a deformation datum D with U(D, 1) sufficiently small, H^{ord}(D) = lim_c Hom(S^{ord}(U(D, c), M_D), O) is finite free over Λ_L and T^{ord}(D) is a finite faithful Λ_L-algebra if nonzero, Newton–Thorne 2021, Proposition 6.5).

*Hypotheses.* t^{−1}G(L⁺)t ∩ U has no element of order l for all t.

*Proof outline.*

1. Control: for each c, eS(U(l^{c,c}), K/O)^∨ ⊗_Λ Λ/𝔞_c ≅ eS(U(l^{c,c}), O)^∨ for the augmentation ideal 𝔞_c of T(l)/T(l)_c, using PL.2/exactness-and-freeness (2) for U(l^{c,c}) ⊂ U(l^{1,c}).
2. Nakayama over the complete local ring Λ, with the rank computed at c = 1 by PL.2/exactness-and-freeness (1), gives freeness; faithfulness of T^{ord} on the dual then gives finiteness over Λ.

*Prerequisites.* PL.2/big-ordinary-hecke-algebra (The big ordinary Hecke algebra over Λ); PL.2/exactness-and-freeness (Exactness and group-ring freeness at l-torsion-free level).

*Acceptance.* For n = 1 this is the freeness over Λ of the l-adic Iwasawa module of a ray class group tower at l-torsion-free level.

*Sources.* Tho12 §8, Proposition 8.2, p. 46; NT21 §6, Proposition 6.5, p. 90; Tho15 §4, Proposition 4.3, p. 36.

### Hida classicality and independence of the characters χ_v modulo λ

`PL.2/hida-classicality` (theorem)

(1) (Geraghty Lemma 2.6.4, as used by Thorne 2015 and Clozel–Thorne 2017) For an arithmetic prime 𝔭 of Λ of weight λ and level c (λ dominant, c ≥ 1), eS_{0,{χ_v}}(U(l^∞), K/O)^∨ ⊗_Λ Λ/𝔭 is identified with eS_{λ,{χ_v}}(U(l^{c,c}), O)^∨ twisted by the finite-order character of 𝔭, Hecke-equivariantly; hence every Λ-algebra homomorphism T^{T,ord}(U(l^∞), O) → Q̄_l above an arithmetic prime is the eigensystem of a classical ι-ordinary automorphic representation of G of weight λ. (2) (Geraghty Lemma 2.2.6) If the characters χ_v (v ∈ R) are trivial modulo λ, then S_{λ,{χ_v}}(U, k) = S_{λ,{1}}(U, k) Hecke-equivariantly, so a maximal ideal m_{\{1\}} determines maximal ideals m_{\{χ_v\}} with the same residual representation (Thorne 2012 §8, used in Theorem 8.6).

*Hypotheses.* U^l with t^{−1}G(L⁺)t ∩ U free of elements of order l; for (2): χ_v ≡ 1 mod λ for v ∈ R.

*Proof outline.*

1. (1) The ordinary idempotent kills the non-classical part of the comparison between weight λ and weight 0 with level structure at l (the algebraic representation M_λ restricted to the Iwahori subgroup has a filtration whose ordinary part is the highest-weight line); the control isomorphism of PL.2/ordinary-forms-free-over-lambda identifies the specialisation.
2. (2) M_{λ,{χ_v}} ⊗ k = M_{λ,{1}} ⊗ k as representations of U because the χ_v reduce to 1.

*Prerequisites.* PL.2/big-ordinary-hecke-algebra (The big ordinary Hecke algebra over Λ); PL.2/ordinary-forms-free-over-lambda (Ordinary forms are finite free over Λ); PL.2/iwahori-ordinary-parts (Iwahori levels at l, the U_p-operators and ordinary parts); PL.0/iota-ordinary (ι-ordinary automorphic representations).

*Acceptance.* Every ι-ordinary RACSDC π of weight λ, descended to G (PL.2/unitary-base-change-and-descent), gives a point of the big ordinary Hecke algebra above the arithmetic prime of weight λ. Used to vary χ_v in Taylor's Ihara-avoidance argument (Thorne 2012 Theorem 8.6, Thorne 2015 Theorem 4.19).

*Sources.* Tho12 §8, p. 48; Tho15 §4, Proposition 4.3, p. 36.

### The Λ-adic Galois representation on the big ordinary Hecke algebra

`PL.2/ordinary-hecke-galois-representation` (theorem)

Let m be a non-Eisenstein maximal ideal of T^{T,ord}_{0,{χ_v}}(U(l^∞), O). Then r̄_m extends to G_{L⁺} → 𝒢_n(T/m) as in PL.2/hecke-valued-galois-representation, and there is a lift r_m : G_{L⁺} → 𝒢_n(T^{T,ord}_{\{χ_v\}}(U(l^∞), O)_m), unique up to conjugation, with: (i) r_m unramified at split w ∉ T with char r_m(Frob_w)(X) = Σ_j (−1)^j (Nw)^{j(j−1)/2} T_w^j X^{n−j}; (ii) r_m unramified at inert v with U_v hyperspecial; (iii) if U_v = ι_ṽ^{−1}Iw(ṽ) for v ∈ R then char r_m(σ)(X) = ∏_j (X − χ_{v,j}^{−1}(Art^{−1}_{L_ṽ}(σ))) for σ ∈ I_{L_ṽ}; (iv) ν ∘ r_m = ε^{1−n}δ_{L/L⁺}^{µ_m}; and r_m|G_{L_ṽ} at v ∈ S_l is ordinary with the universal characters of the Λ-algebra structure on its graded pieces (it is of type 𝒮_{\{χ_v\}} for the ordinary problem of PL.3, Geraghty Lemma 4.1.7) (Thorne 2012, Propositions 8.4–8.5).

*Hypotheses.* m non-Eisenstein; λ = 0 (weights are carried by Λ).

*Proof outline.*

1. At each arithmetic specialisation the representation is the integral model of the Galois representations of classical ι-ordinary forms (PL.2/hida-classicality, PL.2/unitary-constituent-galois-representation, PL.0/iota-ordinary-implies-ordinary).
2. Interpolate the pseudocharacters over the reduced, l-torsion-free T^{ord}_m (Zariski density of arithmetic points), then argue as in PL.2/hecke-valued-galois-representation.
3. Ordinarity of the Λ-adic representation at v ∈ S_l: the ordinary flags of the specialisations glue over the dense set of arithmetic points (Geraghty Lemma 4.1.7, cited by Thorne 2012 Theorem 8.6).

*Prerequisites.* PL.2/big-ordinary-hecke-algebra (The big ordinary Hecke algebra over Λ); PL.2/hecke-valued-galois-representation (The 𝒢_n-valued Galois representation over the localized Hecke algebra); PL.2/hida-classicality (Hida classicality and independence of the characters χ_v modulo λ); PL.0/iota-ordinary-implies-ordinary (ι-ordinary automorphic representations have ordinary Galois representations); LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

*Acceptance.* Specialising at an arithmetic point of weight λ gives r_{l,ι}(π) of an ι-ordinary π of weight λ. It is the input of PL.3/ordinary-r-equals-t.

*Sources.* Tho12 §8, Proposition 8.5, pp. 47–48; Tho12 §8, proof of Theorem 8.6, p. 49.

### Taylor–Wiles level structures and the parahoric projection

`PL.2/taylor-wiles-level-structures` (construction)

Let (Q, Q̃, {ψ̄_ṽ}) be a Taylor–Wiles datum (PL.3/thorne-taylor-wiles-datum) with ψ̄_ṽ of dimension d_ṽ. For v ∈ Q let 𝔭_ṽ ⊃ 𝔭_{ṽ,1} be the parahoric subgroup of GL_n(O_{L_ṽ}) for the partition n = (n − d_ṽ) + d_ṽ and its subgroup with trivial determinant on the d_ṽ-block modulo ṽ maximal l-power quotient, so 𝔭_ṽ/𝔭_{ṽ,1} ≅ k(ṽ)^×(l) =: Δ_ṽ. U₀(Q) and U₁(Q) agree with U away from Q and are ι_ṽ^{−1}𝔭_ṽ, ι_ṽ^{−1}𝔭_{ṽ,1} at v ∈ Q; Δ_Q = ∏_{v∈Q}Δ_ṽ = U₀(Q)/U₁(Q) acts by diamond operators. The projection pr_ϖ (Thorne 2012 Propositions 5.9, 5.12: the idempotent on Π^{𝔭_ṽ} cutting out the generalised eigenspace where the Hecke polynomial factor of the d_ṽ-block has its roots near α_ṽ) identifies T^{T∪Q}(U₀(Q), O)_{m_Q} and pr S(U₀(Q), O)_{m_Q} with T^T(U, O)_m and S(U, O)_m, and on pr S(U₁(Q), O)_{m_Q} the restriction of r_{m_Q} to G_{L_ṽ} decomposes as s ⊕ ψ with inertia acting on ψ through Δ_ṽ by the diamond operators (Proposition 5.12). With PL.2/exactness-and-freeness, S(U₁(Q), O)_{m_Q} is free over O[Δ_Q] with Δ_Q-coinvariants S(U₀(Q), O)_{m_Q} (Thorne 2012 §6, proof of Theorem 6.8; Newton–Thorne 2023 Lemma 4.3).

*Hypotheses.* (Q, Q̃, {ψ̄_ṽ}) a Taylor–Wiles datum with Nv ≡ 1 mod l; U sufficiently small (no element of order l in the arithmetic stabilisers).

*Proof outline.*

1. Local input (Thorne 2012 §5): for a smooth R[GL_n(L_ṽ)]-module Π with generic semisimple constituents and an unramified residual Galois representation with eigenvalue α of multiplicity d_ṽ, Proposition 5.9 constructs pr_ϖ on Π^{𝔭_ṽ} and Proposition 5.12 identifies the action of 𝔭_ṽ/𝔭_{ṽ,1} on pr_ϖΠ^{𝔭_{ṽ,1}} with the inertia action on the ψ-block.
2. Global: apply this to Π = S(Q̄_l) localised at m and combine with PL.2/exactness-and-freeness (2) for U₁(Q) ⊂ U₀(Q).
3. The comparison T^{T∪Q}(U₀(Q))_{m_Q} ≅ T^T(U)_m uses that the Hecke polynomial at v ∈ Q factors by Hensel's lemma.

*Uses.* Thorne 2012, proofs of Theorems 6.8 and 8.6: the finite-level modules patched over O[Δ_{Q_N}]. Newton–Thorne 2023, Lemma 4.3: freeness over O[Δ_Q] and the trace isomorphism.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.DefiniteUnitary.twLevel0` | constructor | U₀(Q): U away from Q, the parahoric ι_ṽ^{−1}𝔭_ṽ at v ∈ Q. |
| `TauCeti.DefiniteUnitary.twLevel1` | constructor | U₁(Q) ⊂ U₀(Q) with U₀(Q)/U₁(Q) ≅ Δ_Q. |
| `TauCeti.DefiniteUnitary.twDiamondAction` | instance | The action of O[Δ_Q] on S(U₁(Q), O) by diamond operators, commuting with T^{T∪Q}. |
| `TauCeti.DefiniteUnitary.twProjection` | data | The parahoric projection pr_ϖ on S(U_i(Q), O)_{m_Q}. |
| `TauCeti.DefiniteUnitary.tw_free` | characterisation | pr S(U₁(Q), O)_{m_Q} is free over O[Δ_Q] with coinvariants pr S(U₀(Q), O)_{m_Q} ≅ S(U, O)_m. |
| `TauCeti.DefiniteUnitary.tw_inertia` | compatibility | On pr S(U₁(Q), O)_{m_Q}, r_{m_Q}∣G_{L_ṽ} ≅ s ⊕ ψ with ψ(Art(u)) acting through the diamond operator of u ∈ O_{L_ṽ}^× ↠ Δ_ṽ. |

*Unit tests.*

* `tw_empty` (degenerate): For Q = ∅, U₀(∅) = U₁(∅) = U, Δ_∅ = 1 and pr is the identity.
* `tw_coinvariants` (characterisation): S(U₁(Q), O)_{m_Q} ⊗_{O[Δ_Q]} O ≅ S(U, O)_m, Hecke-equivariantly.
* `tw_rank` (computation): If Q = {v} and S(U, O)_m is free of rank r over O, then pr S(U₁(Q), O)_{m_Q} is free of rank r over O[Δ_ṽ], hence of O-rank r·#Δ_ṽ.
* `tw_not_free_without_smallness` (non-example): If some arithmetic stabiliser of U₁(Q) has order divisible by l, S(U₁(Q), O) need not be free over O[Δ_Q]; this is why an auxiliary place v₁ with Nv₁ ≢ 1 mod l and Iwahori level is added in Thorne 2012 §8.

*Prerequisites.* PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); PL.2/unitary-hecke-algebra (Hecke algebras of definite unitary groups and their maximal ideals); PL.2/exactness-and-freeness (Exactness and group-ring freeness at l-torsion-free level); PL.2/hecke-valued-galois-representation (The 𝒢_n-valued Galois representation over the localized Hecke algebra); EndoscopicTransferAndUnitaryTraceComparison:ET.6.

*Acceptance.* For d_ṽ = 1 these are the Taylor–Wiles levels of Clozel–Harris–Taylor §3.4 with Δ_ṽ = k(ṽ)^×(l). S(U₁(Q), O)_{m_Q} ⊗_{O[Δ_Q]} O ≅ S(U, O)_m.

*Sources.* Tho12 §6, proof of Theorem 6.8, p. 38; Tho12 §5, Proposition 5.12, p. 29.

## PL.3. Taylor–Wiles primes under adequacy and the patching R = T theorems

**Objects.** For a polarized global deformation problem 𝒮 = (F/F⁺, S, S̃, O, r̄, χ, {D_v}) of GlobalGaloisDeformations:G7: the Taylor–Wiles data (Q, Q̃, {ψ̄_v}) of Thorne 2012 Definition 4.1, with the local problems D_v of lifts 1 + M_n(m_R)-conjugate to s_v ⊕ ψ_v with s_v unramified and inertia acting through scalars on ψ_v (Lemma 4.2).

**Theorems.** Existence of Taylor–Wiles data of level N with #Q = q and the generator count over R^loc when r̄(G_{F⁺(ζ_l)}) is adequate (Thorne 2012, Proposition 4.4), and in the corrected form needed when F ⊂ F⁺(ζ_l): ζ_l ∉ F and ρ̄(G_{F(ζ_l)}) adequate in the sense of Guralnick–Herzig–Tiep (Thorne 2017, Proposition 7.1; at p = 2 and F = F⁺(√−1), Proposition 2.21); the patching theorems: r_m is of type 𝒮 and any lift of type 𝒮 whose local components lie on the components of a Hecke point comes from T_m (Thorne 2012, Theorem 6.8, Corollary 6.9); the ordinary version with Taylor's Ihara avoidance over Λ (Theorem 8.6, Corollary 8.7); and both with the revised adequacy (Thorne 2017, Proposition 7.2).

**Depends on.** Within this roadmap: PL.1, PL.2. Other roadmaps: ArithmeticGaloisDuality:R02.4, ArithmeticGaloisRepresentations:G7, DeformationAndDerivedPatchingAlgebra:R03.5, DeformationAndDerivedPatchingAlgebra:R03.6, GlobalGaloisDeformations:G7, GlobalGaloisDeformations:R04.3, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:R08.1, LocalGaloisDeformationRings:R08.2, LocalGaloisDeformationRings:R08.3, tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev.

### Taylor–Wiles data with a residual eigenspace

`PL.3/thorne-taylor-wiles-datum` (definition)

Let 𝒮 = (F/F⁺, S, S̃, O, r̄, χ, {D_v}_{v∈S}) be a polarized global deformation problem (GlobalGaloisDeformations G7/polarized-deformation-problem) and T ⊂ S. A Taylor–Wiles datum is (Q, Q̃, {ψ̄_ṽ}_{v∈Q}): Q a finite set of places v ∉ S of F⁺, split in F, with Nv ≡ 1 mod l; Q̃ a choice of ṽ | v; and for each v ∈ Q a decomposition r̄|G_{F_ṽ} = s̄_v ⊕ ψ̄_v (r̄|G_{F_ṽ} is unramified) with ψ̄_v the generalised eigenspace of Frobenius for an eigenvalue α_v on which Frobenius acts semisimply. The augmented problem 𝒮_Q = (F/F⁺, S ∪ Q, S̃ ∪ Q̃, O, r̄, χ, {D_v}_{v∈S∪Q}) takes for v ∈ Q the lifts that are 1 + M_n(m_R)-conjugate to s_v ⊕ ψ_v with s_v unramified lifting s̄_v and ψ_v lifting ψ̄_v with ψ_v(I_{F_ṽ}) contained in the scalars; D_v is a local deformation problem (Thorne 2012, Definition 4.1, Lemma 4.2). When dim ψ̄_v = 1 this is Clozel–Harris–Taylor's Definition 2.5.7. A Taylor–Wiles datum has level N if Nv ≡ 1 mod l^N for every v ∈ Q.

*Hypotheses.* 𝒮 a polarized deformation problem with r̄|G_F absolutely irreducible; v ∈ Q split in F, Nv ≡ 1 mod l, r̄ unramified at v.

*Proof outline.*

1. Lemma 4.2: by Hensel's lemma applied to the characteristic polynomial of a Frobenius lift, a lift splits uniquely as s ⊕ ψ lifting s̄ ⊕ ψ̄; this uniqueness gives closure under fibre products and inverse limits, and the scalar-inertia condition on ψ passes to limits.
2. The tangent space L_v ⊂ H¹(G_{F_ṽ}, ad r̄) consists of classes unramified on the s̄-block and with inertia acting through scalars on the ψ̄-block; its annihilator L_v^⊥ for the trace pairing ad r̄ × ad r̄(1) → k(1) is the unramified classes whose ψ̄-component lies in H¹(G_{F_ṽ}, ad⁰ψ̄(1)) (Thorne 2012, proof of Proposition 4.4).

*Uses.* Thorne 2012, Proposition 4.4 and Theorems 6.8, 8.6: the auxiliary sets Q_N of the patching argument. Thorne 2017, Propositions 2.21 and 7.1: the corrected existence statements. Thorne 2015 §§4.6, 5; Newton–Thorne 2023 §4: Taylor–Wiles data in the residually reducible and adjoint Selmer arguments.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.TaylorWilesDatum` | constructor | The data (Q, Q̃, {ψ̄_ṽ}) with Nv ≡ 1 mod l and the eigenspace decompositions. |
| `TauCeti.Automorphy.TaylorWilesDatum.level` | projection | The level N: the largest N with Nv ≡ 1 mod l^N for all v ∈ Q. |
| `TauCeti.Automorphy.TaylorWilesDatum.localProblem` | data | The local deformation problem D_v^{TW} of lifts conjugate to s_v ⊕ ψ_v with scalar inertia on ψ_v. |
| `TauCeti.Automorphy.TaylorWilesDatum.augmented` | constructor | The augmented global problem 𝒮_Q. |
| `TauCeti.Automorphy.TaylorWilesDatum.diamondAlgebra` | instance | R^univ_{𝒮_Q} as an O[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} k(ṽ)^×(l), with augmentation quotient R^univ_𝒮. |
| `TauCeti.Automorphy.TaylorWilesDatum.localCondition_perp` | characterisation | L_v^⊥ is the subspace of unramified classes whose ψ̄_v-component lies in H¹(G_{F_ṽ}, ad⁰ψ̄_v(1)). |

*Unit tests.*

* `twDatum_empty` (degenerate): For Q = ∅, 𝒮_∅ = 𝒮 and Δ_∅ is trivial.
* `twDatum_rank_one_block` (compatibility): If dim ψ̄_v = 1 for every v ∈ Q, D_v^{TW} is the local condition of Clozel–Harris–Taylor Definition 2.5.7 and of GlobalGaloisDeformations G7/taylor-wiles-local-diamond when moreover all eigenvalues are distinct.
* `twDatum_unramified_lift` (computation): Every unramified lift of r̄|G_{F_ṽ} lies in D_v^{TW}.
* `twDatum_nonexample_nonscalar` (non-example): A lift whose ψ-block has inertia acting through a non-scalar unipotent matrix (possible when dim ψ̄_v ≥ 2) is not in D_v^{TW}.

*Prerequisites.* GlobalGaloisDeformations:G7/polarized-deformation-problem; GlobalGaloisDeformations:R04.3/local-deformation-problem; GlobalGaloisDeformations:G7/polarized-tangent-obstruction.

*Acceptance.* For d_v = 1 and n = 2 this recovers the Taylor–Wiles primes of GlobalGaloisDeformations R04.5/taylor-wiles-datum. R^univ_{𝒮_Q} is an O[Δ_Q]-algebra through the inertia action on ψ_v, with R^univ_{𝒮_Q} ⊗_{O[Δ_Q]} O = R^univ_𝒮.

*Sources.* Tho12 §4, Definition 4.1, p. 15; Tho12 §4, Lemma 4.2, p. 16.

### Taylor–Wiles primes for adequate residual image

`PL.3/adequate-taylor-wiles-primes` (theorem)

Let 𝒮 be a polarized global deformation problem with ρ̄ = r̄|G_F absolutely irreducible and T ⊂ S such that dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F⁺_v : Q_l]n(n−1)/2 for v ∈ S − T above l and 0 for v ∈ S − T not above l. Assume either (a) r̄(G_{F⁺(ζ_l)}) ⊂ 𝒢_n(k) is adequate in the sense of Thorne 2012 Definition 2.3 (Thorne 2012, Proposition 4.4), or (b) ζ_l ∉ F and ρ̄(G_{F(ζ_l)}) ⊂ GL_n(k) is adequate in the sense of Thorne 2017 Definition 2.20 (Thorne 2017, Proposition 7.1). Let q₀ ≥ 0 and q = max(dim_k H¹_{L^⊥,T}(G_{F⁺,S}, ad r̄(1)), q₀). Then for every N ≥ 1 there is a Taylor–Wiles datum (Q, Q̃, {ψ̄_ṽ}) with #Q = q, Nv ≡ 1 mod l^N for v ∈ Q, such that R^T_{𝒮_Q} is topologically generated over R^loc_{𝒮,T} by #Q − Σ_{v∈T, v|l}[F⁺_v : Q_l]n(n−1)/2 − n Σ_{v|∞}(1 + χ(c_v))/2 elements. Version (a) cannot apply when F ⊂ F⁺(ζ_l), because then r̄(G_{F⁺(ζ_l)}) ⊂ 𝒢_n⁰(k) does not surject onto the component group; version (b) is the corrected statement used in the proofs of Thorne 2012 Theorems 6.8 and 8.6 (Thorne 2017 §7).

*Hypotheses.* ρ̄ absolutely irreducible; the local dimension conditions at S − T; (a) r̄(G_{F⁺(ζ_l)}) adequate (Tho12 Definition 2.3), or (b) ζ_l ∉ F and ρ̄(G_{F(ζ_l)}) GHT-adequate.

*Proof outline.*

1. Lemma 4.3 (as Clozel–Harris–Taylor Lemma 2.5.8): R^T_{𝒮_Q} is generated over R^loc by h¹_{L(Q)^⊥,T}(ad r̄(1)) + #Q − Σ_{v∈T,v|l}[F⁺_v:Q_l]n(n−1)/2 − h⁰(G_{F⁺,S}, ad r̄(1)) − nΣ_{v|∞}(1 + χ(c_v))/2 elements; it suffices to kill the dual Selmer group H¹_{L(Q)^⊥,T}(ad r̄(1)) with q primes (GlobalGaloisDeformations G7/polarized-presentation).
2. Claim: for each nonzero [φ] ∈ H¹_{L^⊥,T}(G_{F⁺,S}, ad r̄(1)) there are σ ∈ G_{F(ζ_{l^N})} with ρ̄(σ) semisimple and an eigenvalue α of ρ̄(σ) with tr e_{σ,α}φ(σ) ≠ 0; Chebotarev (Tau Ceti Chebotarev) then produces v with Frob_ṽ ≈ σ, and choosing ψ̄_v the α-eigenspace kills [φ] in H¹_{L(Q)^⊥,T}.
3. (b) proof of the claim (Thorne 2017, Proposition 7.1): H¹(Gal(L/F⁺), ad r̄(1)) = 0 for L the field cut out by r̄ over F⁺(ζ_{l^N}), using ζ_l ∉ F (so the δ_{F/F⁺}-isotypic part of H¹(Gal(F(ζ_{l^N})/F(ζ_l)), k) vanishes) and H¹(ρ̄(G_{F(ζ_l)}), ad) = 0; hence [φ] restricts to a nonzero G_{F(ζ_l)}-equivariant f : G_L → ad ρ̄, and the trace condition of adequacy applied to the simple submodules of the span of f(G_L) gives σ = τσ₀ with tr e_{σ,α}φ(σ) ≠ 0 by the cocycle relation.

*Prerequisites.* PL.3/thorne-taylor-wiles-datum (Taylor–Wiles data with a residual eigenspace); ArithmeticGaloisRepresentations:G7/adequate-subgroup; GlobalGaloisDeformations:G7/polarized-presentation; GlobalGaloisDeformations:G7/polarized-tangent-obstruction; tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev; ArithmeticGaloisDuality:R02.4.

*Acceptance.* For n = 2, F = F⁺(√−d) and ρ̄ with SL₂(F_l) ⊂ image, l ≥ 5, the hypotheses hold and recover the Taylor–Wiles primes of KW II. If l | n, adequacy in the sense of Thorne 2012 Definition 2.3 for subgroups of GL_n(k) never holds (the scalars lie in ad⁰), while adequacy in the sense of Thorne 2017 Definition 2.20, used in (b), can hold (Thorne 2017 §7, after Guralnick–Herzig–Tiep).

*Sources.* Tho12 §4, Proposition 4.4, p. 17; Tho17 §7, Proposition 7.1, p. 31; Tho17 §7, p. 31.

### Taylor–Wiles data when F contains ζ_p, including p = 2

`PL.3/taylor-wiles-primes-two-adic` (theorem)

Let 𝒮 = (F, r̄, O, χ, S, {D_v}) be a global deformation problem in the sense of Thorne 2017 §2 and T = S − S_∞. Assume (i) µ(c_v) = −1 and D_v is all liftings for v ∈ S_∞; (ii) F = F⁺(ζ_p) if p ≠ 2 and F = F⁺(√−1) if p = 2; (iii) if p = 2 and n is even, r̄(c_v) is GL_n(k)-conjugate to (1_n, 1) for some v ∈ S_∞; (iv) ρ̄(G_F) is adequate in the sense of Definition 2.20. Let q = h¹_{𝒮^⊥,T} − 1 and g = q + |T| − 1 − [F⁺ : ℚ]n(n−1)/2. Then for each N ≥ 1 there are infinitely many Taylor–Wiles data (Q, (α_v)_{v∈Q}) of level N with #Q = q such that R^loc_{𝒮,T} → R^T_{𝒮_Q} extends to a surjection R^loc_{𝒮,T}⟦X₁, …, X_g⟧ ↠ R^T_{𝒮_Q} (Thorne 2017, Proposition 2.21).

*Hypotheses.* F = F⁺(ζ_p) (p odd) or F⁺(√−1) (p = 2); ρ̄(G_F) GHT-adequate; the archimedean conditions (i), (iii).

*Proof outline.*

1. Compute χ_{𝒮_Q,T} = 1 − |T| − |Q| + [F⁺ : ℚ]n(n−1)/2 from the local Euler characteristics (Thorne 2017, Corollary 2.14 and the local calculations of §2.3) and use Lemma 2.15 to reduce to h¹_{𝒮_Q,T} = g.
2. Kill the dual Selmer group by Chebotarev as in PL.3/adequate-taylor-wiles-primes; the hypothesis at a real place (iii) supplies, when p = 2 and n is even, a complex conjugation whose action makes the relevant H¹ vanish (Lemma 2.17).

*Prerequisites.* PL.3/thorne-taylor-wiles-datum (Taylor–Wiles data with a residual eigenspace); ArithmeticGaloisRepresentations:G7/adequate-subgroup; GlobalGaloisDeformations:G7/polarized-presentation; tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev; LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2.

*Acceptance.* For n = 2 the condition (iii) amounts to r̄(c_v) ≠ 1 for some v | ∞, Dickinson's condition.

*Sources.* Tho17 §2.4, Proposition 2.21, p. 13.

### The minimal R = T theorem on definite unitary groups

`PL.3/minimal-r-equals-t` (theorem)

Let L, G, l, U be as in PL.2 with R = ∅, T = S_r ⊔ S_l, U_v = G(O_{L⁺_v}) for v ∈ S_l and for split v ∉ T, U_v hyperspecial at inert v, U_v arbitrary for v ∈ S_r, and t^{−1}G(L⁺)t ∩ U trivial for all t. Let m ⊂ T^T_λ(U, O) be non-Eisenstein and 𝒮 = (L/L⁺, T, T̃, O, r̄_m, ε^{1−n}δ_{L/L⁺}^{µ_m}, {R^□_ṽ}_{v∈S_r} ∪ {R^{λ,cr}_ṽ}_{v∈S_l}), with R^{λ,cr}_ṽ the crystalline lifting ring of weight λ. Then r_m : G_{L⁺} → 𝒢_n(T^T_λ(U, O)_m) is of type 𝒮. Suppose r̄_m(G_{L⁺(ζ_l)}) is adequate (or, by Thorne 2017 Proposition 7.2, ζ_l ∉ L and r̄_m(G_{L(ζ_l)}) is adequate in the sense of Thorne 2017 Definition 2.20). If r : G_{L⁺} → 𝒢_n(O) is a lift of type 𝒮 and f′ : T^T_λ(U, O)_m → O satisfies (i) (f′ ∘ r_m)|G_{L_ṽ} and r|G_{L_ṽ} lie on the same component of Spec R^{λ,cr}_ṽ ⊗ Q̄_l for v ∈ S_l and (ii) (f′ ∘ r_m)|G_{L_ṽ} ⇝ r|G_{L_ṽ} for v ∈ S_r, then r ≅ f ∘ r_m for some f : T^T_λ(U, O)_m → O (Thorne 2012, Theorem 6.8). Moreover µ_m ≡ n mod 2, and R^univ_{𝒮′} is finite over O for the problem 𝒮′ with the components of f′ ∘ r_m (Corollary 6.9).

*Hypotheses.* m non-Eisenstein; adequacy of the residual image (either version); U with trivial arithmetic stabilisers; l odd.

*Proof outline.*

1. Type 𝒮: T_m is reduced and l-torsion free and its Q̄_l-points are crystalline of weight λ at l (PL.2/unitary-constituent-galois-representation).
2. Choose for each N a Taylor–Wiles datum Q_N with #Q_N = q (PL.3/adequate-taylor-wiles-primes, with q₀ = [L⁺:ℚ]n(n−1)/2 + [L⁺:ℚ]n(1 − (−1)^{µ_m−n})/2), so R^T_{𝒮_{Q_N}} is generated over R^loc by g = q − q₀ elements.
3. The modules pr S(U₁(Q_N), O)_{m_{Q_N}} are free over O[Δ_{Q_N}] (PL.2/taylor-wiles-level-structures); patch (DeformationAndDerivedPatchingAlgebra R03.5) to M_∞ over R_∞ = R^loc⟦X_1, …, X_g⟧, a module of depth dim S_∞ = dim R_∞ over S_∞ = O⟦Δ_∞, framing variables⟧.
4. Components: each component of R^loc[1/l] ⊗ Q̄_l is generically smooth (LocalGaloisDeformationRings R08.3/pcris-generic-smooth, PL.1/generic-smooth-points), so M_∞ of maximal depth is supported on a union of components of R_∞ (DeformationAndDerivedPatchingAlgebra R03.6/maximal-cm-support-top-components); the hypothesis on f′ puts the component containing r in the support, whence r factors through T_m (R03.6/patched-module-away-support).
5. Corollary 6.9: counting dimensions forces µ_m ≡ n mod 2, and the support statement gives finiteness of R^univ_{𝒮′} over O.

*Prerequisites.* PL.3/adequate-taylor-wiles-primes (Taylor–Wiles primes for adequate residual image); PL.2/taylor-wiles-level-structures (Taylor–Wiles level structures and the parahoric projection); PL.2/hecke-valued-galois-representation (The 𝒢_n-valued Galois representation over the localized Hecke algebra); PL.2/unitary-constituent-galois-representation (Galois representations attached to constituents of algebraic modular forms); PL.1/connects-relation (Connecting and strongly connecting local lifts); PL.1/generic-smooth-points (Generic local representations are smooth points and smooth points are dense); LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; DeformationAndDerivedPatchingAlgebra:R03.5; DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-support-top-components; DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-away-support; DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-reduced.

*Acceptance.* The theorem is applied in PL.4/minimal-automorphy-lifting and PL.4/minimal-finiteness after soluble base change to L. For n = 1 it reduces to class field theory: r is a character of the same type as f′ ∘ r_m.

*Sources.* Tho12 §6, Theorem 6.8, p. 37; Tho12 §6, Corollary 6.9, p. 41.

### The ordinary R = T theorem with Taylor's Ihara avoidance

`PL.3/ordinary-r-equals-t` (theorem)

Let T = R ∪ S_l ∪ {v₁} with v₁ split in L. Assume: r̄_m(G_{L_ṽ}) is trivial for v ∈ R ∪ S_l; for v ∈ R, Nv ≡ 1 mod l and l^N > n when l^N ∥ Nv − 1, with O containing the l^N-th roots of unity; r̄_m is unramified above v₁ and Nv₁ ≢ 1 mod l; the characters χ_v (v ∈ R) are trivial modulo λ. Let U_v = G(O_{L⁺_v}) for v ∈ S_l and split v ∉ T, hyperspecial at inert v, Iw(ṽ) at v ∈ R ∪ {v₁}; let m be a non-Eisenstein maximal ideal of T^{T,ord}_{\{1\}}(U(l^∞), O) and m_{\{χ_v\}} the corresponding ideal of T^{T,ord}_{\{χ_v\}} (PL.2/hida-classicality (2)). For the problem 𝒮_{\{χ_v\}} over Λ with R^{χ_v}_ṽ (v ∈ R; lifts with char r(σ)(X) = ∏_j (X − χ_{v,j}(Art_{L_ṽ}^{−1}(σ))^{−1}) for σ ∈ I_{L_ṽ}), the ordinary rings R^{Δ,ar}_{Λ,ṽ} (v ∈ S_l) and R^a_{ṽ₁}, the Λ-adic r_{m_{\{χ_v\}}} (PL.2/ordinary-hecke-galois-representation) is of type 𝒮_{\{χ_v\}}. If r̄_m(G_{L⁺(ζ_l)}) is adequate (or the revised hypotheses of Thorne 2017 Proposition 7.2 hold) and r : G_{L⁺} → 𝒢_n(O) is a lift of type 𝒮_{\{1\}} unramified above v₁ such that some f′ : T^{T,ord}_{\{1\}}(U(l^∞), O)_m → O has f′ ∘ r_m unramified above v₁, then r ≅ f ∘ r_m for some f (Thorne 2012, Theorem 8.6). Moreover R^univ_{𝒮′_{\{1\}}} is a finite Λ-module (Corollary 8.7).

*Hypotheses.* the residual and level conditions at R ∪ S_l ∪ {v₁}; χ_v ≡ 1 mod λ; adequacy (either version).

*Proof outline.*

1. Type 𝒮_{χ_v}: Geraghty Lemma 4.1.7 (PL.2/ordinary-hecke-galois-representation).
2. Patch over Λ using Taylor–Wiles data from PL.3/adequate-taylor-wiles-primes and the freeness of PL.2/ordinary-forms-free-over-lambda at the levels U₁(Q_N), for both χ = {1} and χ = {χ_v}, with the identification modulo λ of PL.2/hida-classicality (2).
3. Taylor's Ihara avoidance: for distinct χ_{v,j}, Spec R^{χ_v}_ṽ[1/l] is irreducible (LocalGaloisDeformationRings R08.2/ihara-avoidance-components; Thorne 2012 Proposition 3.16), so the χ-patched module is supported on the whole of the irreducible R_∞^χ; the two patched rings agree modulo λ, and the support of the {1}-patched module modulo λ is then all of Spec R_∞^{\{1\}}/λ, hence (by depth) every component of R_∞^{\{1\}}.
4. The ordinary local rings R^{Δ,ar}_{Λ,ṽ} for trivial residual representation have irreducible generic fibres over each component of Λ (LocalGaloisDeformationRings L7/trivial-residual-flag-ring; Geraghty Lemma 3.4.3).

*Prerequisites.* PL.3/adequate-taylor-wiles-primes (Taylor–Wiles primes for adequate residual image); PL.2/ordinary-hecke-galois-representation (The Λ-adic Galois representation on the big ordinary Hecke algebra); PL.2/ordinary-forms-free-over-lambda (Ordinary forms are finite free over Λ); PL.2/hida-classicality (Hida classicality and independence of the characters χ_v modulo λ); PL.2/taylor-wiles-level-structures (Taylor–Wiles level structures and the parahoric projection); LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:L7/trivial-residual-flag-ring; LocalGaloisDeformationRings:L7/ordinary-flag-scheme; DeformationAndDerivedPatchingAlgebra:R03.5; DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-support-top-components; DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-support-theorem.

*Acceptance.* Applied in PL.4/ordinary-automorphy-lifting and PL.4/ordinary-finiteness after soluble base change. With R = ∅ it is the ordinary analogue of PL.3/minimal-r-equals-t.

*Sources.* Tho12 §8, Theorem 8.6, p. 49; Tho12 §8, Corollary 8.7, p. 53.

### The R = T theorems under Guralnick–Herzig–Tiep adequacy

`PL.3/revised-adequacy-r-equals-t` (theorem)

PL.3/minimal-r-equals-t and PL.3/ordinary-r-equals-t hold with the assumption 'r̄_m(G_{L⁺(ζ_l)}) is adequate in the sense of Thorne 2012 Definition 2.3' replaced by: (i) ζ_l ∉ L and (ii) ρ̄ = r̄_m|G_L has ρ̄(G_{L(ζ_l)}) ⊂ GL_n(k) adequate in the sense of Thorne 2017 Definition 2.20 (Thorne 2017, Proposition 7.2). When l ∤ n the two adequacy notions coincide, so this repairs a gap in Thorne 2012 when L ⊂ L⁺(ζ_l); when l | n it is a new result.

*Hypotheses.* ζ_l ∉ L; ρ̄(G_{L(ζ_l)}) GHT-adequate.

*Proof outline.*

1. The adequacy hypothesis of Thorne 2012 is used only to invoke Proposition 4.4; replace it by the corrected Proposition 7.1 (PL.3/adequate-taylor-wiles-primes (b)) in both proofs.
2. For l ∤ n, Definition 2.3 and Definition 2.20 agree (ArithmeticGaloisRepresentations G7/adequate-subgroup, isAdequate_iff_isGHTAdequate).

*Prerequisites.* PL.3/minimal-r-equals-t (The minimal R = T theorem on definite unitary groups); PL.3/ordinary-r-equals-t (The ordinary R = T theorem with Taylor's Ihara avoidance); PL.3/adequate-taylor-wiles-primes (Taylor–Wiles primes for adequate residual image); ArithmeticGaloisRepresentations:G7/adequate-subgroup.

*Acceptance.* Thorne 2017, Corollary 7.3: Thorne 2012 Theorems 7.1 and 9.1 hold with GHT adequacy (PL.4/minimal-automorphy-lifting, PL.4/ordinary-automorphy-lifting).

*Sources.* Tho17 §7, Proposition 7.2, p. 32.

## PL.4. Minimal and ordinary automorphy lifting and finiteness with adequate image

**Theorems.** Minimal automorphy lifting for (ρ, µ) polarized with ρ̄ absolutely irreducible, ρ̄(G_{F(ζ_l)}) adequate, ζ_l ∉ F and a RAECSDC (π, χ) with matching residual representation and local components connected at every finite place (Thorne 2012, Theorem 7.1 = BLGGT14 Theorem 2.3.1; Thorne 2017 Corollary 7.3); automorphy lifting at every prime p, including p = 2 and p | n, with adequacy in the sense of Thorne 2017 Definition 2.20 and strong residual oddness when p = 2 and n is even (Thorne 2017, Theorem 5.1); the relaxation of Definition 2.20 to H¹(H, ad) = 0 (Boxer–Calegari–Gee); ordinary automorphy lifting over CM or totally real fields with level prime to l for crystalline ρ (Thorne 2012 Theorem 9.1 = BLGGT14 Theorem 2.4.1); finiteness of the universal ring for fixed components (Thorne 2012 Theorem 10.1 = BLGGT14 Theorem 2.3.2) and for ss-ordinary local conditions (Theorem 10.2 = BLGGT14 Theorem 2.4.2); the Khare–Wintenberger passage from finiteness and Krull dimension at least one to a characteristic-zero lift.

**Depends on.** Within this roadmap: PL.0, PL.1, PL.2, PL.3. Other roadmaps: ArithmeticGaloisRepresentations:G7, AutomorphicGaloisRepresentationsPartII:AG2.0, DeformationAndDerivedPatchingAlgebra:R03.4, GlobalGaloisDeformations:G7, GlobalGaloisDeformations:R04.4, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:R08.1.

### Minimal automorphy lifting with adequate residual image

`PL.4/minimal-automorphy-lifting` (theorem) — planet: *Minimal automorphy lifting theorem*

Let F be an imaginary CM field, l an odd prime, ρ : G_F → GL_n(O) continuous and µ : G_{F⁺} → O^× continuous, with (i) ρ^c ≅ ρ^∨ ε^{1−n} µ|G_F, (ii) µ(c_v) independent of v | ∞, (iii) ρ ramified at finitely many places, (iv) ρ̄ absolutely irreducible with ρ̄(G_{F(ζ_l)}) adequate (Thorne 2012 Definition 2.3, or Thorne 2017 Definition 2.20 by Thorne 2017 Corollary 7.3), (v) ζ_l ∉ F, (vi) a RAECSDC (π, χ) potentially unramified above l, ρ′ and µ′ with ρ′ ⊗ Q̄_l ≅ r_{l,ι}(π), µ′ ⊗ Q̄_l ≅ r_{l,ι}(χ), (ρ̄, µ̄) = (ρ̄′, µ̄′), and for every place v ∤ l either π_v and ρ|G_{F_v} are both unramified or ρ′|G_{F_v} ⇝ ρ|G_{F_v}, and ρ′|G_{F_v} ∼ ρ|G_{F_v} for every v | l. Then (ρ, µ) is automorphic; if π has level prime to l and ρ is crystalline then (ρ, µ) is automorphic of level prime to l (Thorne 2012, Theorem 7.1; BLGGT14 Theorem 2.3.1 in the form: (r, µ) algebraic polarized, r̄ irreducible with r̄(G_{F(ζ_l)}) adequate, ζ_l ∉ F, and (r̄, µ̄) automorphic of level potentially prime to l via a regular algebraic cuspidal polarized (π, χ) of level potentially prime to l with r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v} for every finite v ⇒ (r, µ) automorphic of level potentially prime to l).

*Hypotheses.* F imaginary CM, l odd, ζ_l ∉ F; ρ̄ absolutely irreducible with adequate image on G_{F(ζ_l)}; local matching with a RAECSDC seed at every finite place.

*Proof outline.*

1. Twist (PL.0/automorphy-under-twist, PL.0/auxiliary-characters) to reduce to µ = ε^{1−n}δ^n_{F/F⁺}.
2. Soluble base change (PL.0/soluble-descent, PL.0/auxiliary-cm-extensions) to L/F, linearly disjoint from F̄^{ker ρ̄}(ζ_l), with L/L⁺ unramified at finite places, 4 | [L⁺ : F⁺], every place of the ramification set split, ρ crystalline and π_L of level prime to l at l; adequacy of ρ̄(G_{L(ζ_l)}) is preserved by linear disjointness.
3. Descend π_L to G (PL.2/unitary-base-change-and-descent), take the maximal ideal m attached to it at a level U chosen as in PL.3/minimal-r-equals-t (an auxiliary place making the stabilisers trivial), and apply PL.3/minimal-r-equals-t with Thorne 2017 Proposition 7.2 (PL.3/revised-adequacy-r-equals-t); at v ∤ l the hypothesis ⇝ is used for the components at S_r, at v | l the hypothesis ∼.
4. Descend automorphy back to F by PL.0/soluble-descent; the final sentence follows by choosing L in which the places above l split completely.

*Prerequisites.* PL.3/minimal-r-equals-t (The minimal R = T theorem on definite unitary groups); PL.3/revised-adequacy-r-equals-t (The R = T theorems under Guralnick–Herzig–Tiep adequacy); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.0/automorphy-under-twist (Automorphy is invariant under algebraic twists); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); PL.0/auxiliary-characters (Algebraic characters with prescribed conjugate-norm and local behaviour); PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels); PL.1/connects-relation (Connecting and strongly connecting local lifts); PL.1/generic-smooth-points (Generic local representations are smooth points and smooth points are dense).

*Acceptance.* BLGGT14 Theorem 2.3.1 deduces its form from this theorem using that π_v is generic at v ∤ l, so r_{l,ι}(π)|G_{F_v} ⇝ r|G_{F_v} (PL.1/generic-smooth-points). Boxer–Calegari–Gee apply it with the relaxed adequacy of PL.4/relaxed-adequacy to Ind_{G_M}^{G_F}(θ ⊗ ρ|G_F) in their Theorem 3.1.

*Sources.* Tho12 §7, Theorem 7.1, pp. 41–42; BLGGT14 §2.3, Theorem 2.3.1, p. 38; Tho17 §7, Corollary 7.3, p. 32.

### Strong residual oddness at a real place (p = 2)

`PL.4/strongly-residually-odd` (definition)

Let k be a perfect field of characteristic 2, n even, F imaginary CM with maximal totally real subfield F⁺, and (ρ̄, µ̄) a polarized pair (ρ̄ : G_F → GL_n(k) absolutely irreducible, ρ̄^c ≅ ρ̄^∨ ⊗ µ̄ with the sign condition of BLGGT14 §2.1), so that ρ̄ extends to r̄ : G_{F⁺} → 𝒢_n(k) with ν ∘ r̄ = µ̄ (Thorne 2017, Lemma 2.1). For an infinite place v of F⁺ with complex conjugation c_v, r̄(c_v) is GL_n(k)-conjugate either to (1_n, 1)j or to (Ψ_n, 1)j (Lemma 2.16), Ψ_n admitting skew-symmetric lifts to GL_n(W(k)) and 1_n not. (ρ̄, µ̄) is strongly residually odd at v if r̄(c_v) is GL_n(k)-conjugate to (1_n, 1)j (Thorne 2017, Definition 3.3).

*Hypotheses.* char k = 2, k perfect, n even; (ρ̄, µ̄) polarized with ρ̄ absolutely irreducible.

*Proof outline.*

1. The extension r̄ exists and is unique up to GL_n(k)-conjugation given µ̄ (Thorne 2017, Lemma 2.2; ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group).
2. Lemma 2.16: r̄(c_v) = (A, −µ̄(c_v))j with A symmetric-type; over a perfect field of characteristic 2 there are exactly the two conjugacy classes listed, distinguished by whether the associated form is alternating.
3. The notion is independent of the choice of c_v in its conjugacy class and of the extension r̄.

*Uses.* Thorne 2017, Theorem 5.1(v): the hypothesis at infinity of 2-adic automorphy lifting for n even. Thorne 2017, Proposition 2.21(iii): killing the dual Selmer group when p = 2. Thorne 2017, Theorem 6.1: Kisin's 2-adic GL₂ lifting via n = 4.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsStronglyResiduallyOdd` | constructor | r̄(c_v) is GL_n(k)-conjugate to (1_n, 1)j. |
| `TauCeti.Automorphy.IsStronglyResiduallyOdd.indep_extension` | other | The condition does not depend on the choice of the 𝒢_n-valued extension r̄ with multiplier µ̄, nor on c_v within its conjugacy class. |
| `TauCeti.Automorphy.complexConjugation_dichotomy` | characterisation | r̄(c_v) is GL_n(k)-conjugate to exactly one of (1_n, 1)j and (Ψ_n, 1)j (Thorne 2017, Lemma 2.16). |
| `TauCeti.Automorphy.IsStronglyResiduallyOdd.mu_neg_one` | relation | If r lifts r̄ with ρ̄ absolutely irreducible and (ρ̄, µ̄) is strongly residually odd at v, then µ(c_v) = −1 (Lemma 3.4). |
| `TauCeti.Automorphy.isStronglyResiduallyOdd_rank_two_iff` | example | For n = 2 and ρ̄ = σ∣G_F ⊗ ψ^{−1}: strongly residually odd at v iff σ(c_v) ≠ 1 (Lemma 3.5(ii)). |

*Unit tests.*

* `sro_rank_two_nontrivial` (computation): For n = 2, k = F_2, σ : G_{F⁺} → GL₂(F_2) with σ|G_F absolutely irreducible, σ(c_v) = (1 1; 0 1) and ψψ^c = det σ, the pair (σ|G_F ⊗ ψ^{−1}, ε^{−1}) is strongly residually odd at v (Thorne 2017, Lemma 3.5(ii)).
* `sro_rank_two_trivial` (non-example): For n = 2 and σ(c_v) = 1, the pair is not strongly residually odd at v.
* `sro_lift_sign` (characterisation): If (ρ̄, µ̄) is strongly residually odd at v then every lift r with absolutely irreducible ρ̄ has µ(c_v) = −1.
* `sro_odd_n_irrelevant` (degenerate): For n odd, or p odd, the condition is not defined and Thorne 2017 Theorem 5.1 imposes no hypothesis at infinity.

*Prerequisites.* ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group; ArithmeticGaloisRepresentations:G7/polarized-representation; AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation.

*Acceptance.* Lemma 3.4: if r : G_{F⁺} → 𝒢_n(O) lifts r̄ with ρ̄ absolutely irreducible and (ρ̄, µ̄) is strongly residually odd at v, then µ(c_v) = −1. Lemma 3.5(ii): for n = 2, ρ̄ = σ|G_F ⊗ ψ^{−1} with σ : G_{F⁺} → GL₂(k) and σ|G_F absolutely irreducible, (ρ̄, ε^{−1}) is strongly residually odd at v iff σ(c_v) ≠ 1.

*Sources.* Tho17 §3.1, Definition 3.3, p. 16; Tho17 §3.1, Lemma 3.4, p. 16.

### Automorphy lifting for every prime p, including p = 2 and p | n

`PL.4/two-adic-automorphy-lifting` (theorem) — planet: *Thorne's automorphy lifting for any prime*

Let n ≥ 2, F imaginary CM, p any prime, ι : Q̄_p ≅ ℂ and ρ : G_F → GL_n(Q̄_p) continuous with (i) ρ^c ≅ ρ^∨ε^{1−n}; (ii) ρ̄(G_{F(ζ_p)}) ⊂ GL_n(F̄_p) adequate in the sense of Thorne 2017 Definition 2.20 (ArithmeticGaloisRepresentations G7/adequate-subgroup, GHT-adequate); (iii) ρ almost everywhere unramified; (iv) a RACSDC π of GL_n(𝔸_F) with r̄_ι(π) ≅ ρ̄ and r_ι(π)|G_{F_v} ∼ ρ|G_{F_v} at every finite place v (automatic when π_v and ρ|G_{F_v} are unramified); (v) if p = 2 and n is even, (ρ̄, ε^{1−n}δ^n_{F/F⁺}) is strongly residually odd at some v | ∞. Then ρ ≅ r_ι(Π) for a RACSDC Π (Thorne 2017, Theorem 5.1). No hypothesis ζ_p ∉ F is needed.

*Hypotheses.* F imaginary CM; ρ̄(G_{F(ζ_p)}) GHT-adequate; RACSDC seed with matching local components; strong residual oddness when p = 2 and n even.

*Proof outline.*

1. Replace F by F(ζ_p) (p odd) or F(√−1) (p = 2) by soluble base change (PL.0/soluble-descent), checking that strong residual oddness is preserved.
2. Further soluble base change arranges the splitting conditions; descend to the definite unitary group (PL.2/unitary-base-change-and-descent).
3. Patch with the Taylor–Wiles data of PL.3/taylor-wiles-primes-two-adic (F = F⁺(ζ_p) or F⁺(√−1)) and the 2-adic local deformation theory of Thorne 2017 §2.3 (representability at p = 2 via the archimedean conditions, LocalGaloisDeformationRings R08.1/archimedean-odd-ring-p2), concluding as in PL.3/minimal-r-equals-t (Thorne 2017, Corollary 4.3).

*Prerequisites.* PL.3/taylor-wiles-primes-two-adic (Taylor–Wiles data when F contains ζ_p, including p = 2); PL.3/minimal-r-equals-t (The minimal R = T theorem on definite unitary groups); PL.4/strongly-residually-odd (Strong residual oddness at a real place (p = 2)); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.1/connects-relation (Connecting and strongly connecting local lifts); ArithmeticGaloisRepresentations:G7/adequate-subgroup; LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2.

*Acceptance.* Thorne 2017 Theorem 6.1: Kisin's 2-adic modularity lifting for GL₂ over totally real fields, improved by applying this theorem with n = 4. Boxer–Calegari–Gee, Theorem 3.1: applied (as '[Tho17, Thm 7.1]', their source issue E3) with p | n and the relaxed adequacy.

*Sources.* Tho17 §5, Theorem 5.1, p. 25; Tho17 §5, Remark after Theorem 5.1, p. 25.

### Adequacy relaxed to the vanishing of H¹(H, ad)

`PL.4/relaxed-adequacy` (theorem)

In Thorne 2017 Definition 2.20 the condition H¹(H, ad₀) = 0 (ad₀ = ad/k·1) may be replaced by the weaker H¹(H, ad) = 0, keeping H¹(H, k) = 0 and the trace condition. Boxer–Calegari–Gee observe that the proof of Thorne 2017 Proposition 2.21 uses only the weaker assumption, and apply Thorne 2017 Theorem 5.1 (cited as 'Theorem 7.1') with Proposition 7.2 under the relaxed notion (proof of Theorem 3.1). This packet checked in addition that the proof of Proposition 7.1, through which Proposition 7.2 and Corollary 7.3 are deduced, uses only H¹(H, k) = 0, H¹(H, ad) = 0 and the trace condition (as the extraction PAPER-BOXER-CALEGARI-GEE-25 also records). Hence PL.3/taylor-wiles-primes-two-adic and PL.3/adequate-taylor-wiles-primes (b) hold for the relaxed notion, and so do PL.3/revised-adequacy-r-equals-t and PL.4/two-adic-automorphy-lifting in the generality in which Boxer–Calegari–Gee apply them; a formaliser checks the remaining uses of adequacy in the proof of Theorem 5.1 (§4 of Thorne 2017) against the relaxed definition. Given H¹(H, k) = 0, H¹(H, ad₀) = 0 implies H¹(H, ad) = 0 by the long exact sequence of 0 → k → ad → ad₀ → 0, so the new condition is weaker.

*Hypotheses.* H ⊂ GL_n(k) finite with H¹(H, k) = 0, H¹(H, ad) = 0 and the trace condition of Definition 2.20.

*Proof outline.*

1. Inspect the proof of Proposition 7.1 (PL.3/adequate-taylor-wiles-primes (b)): the vanishing of H¹(Gal(L/F(ζ_{l^N})), ad r̄(1)) uses H¹(ρ̄(G_{F(ζ_l)}), ad) = 0, and the choice of σ uses the trace condition on simple submodules of ad; H¹(H, ad₀) is never used.
2. The same holds for Proposition 2.21.
3. The implication H¹(k) = H¹(ad₀) = 0 ⇒ H¹(ad) = 0 is the exactness of H¹(H, k) → H¹(H, ad) → H¹(H, ad₀).

*Prerequisites.* PL.3/adequate-taylor-wiles-primes (Taylor–Wiles primes for adequate residual image); PL.3/taylor-wiles-primes-two-adic (Taylor–Wiles data when F contains ζ_p, including p = 2); ArithmeticGaloisRepresentations:G7/adequate-subgroup; ArithmeticGaloisRepresentations:G7/adequacy-criteria.

*Acceptance.* Boxer–Calegari–Gee: s(G_{F(ζ_p)}) satisfies the relaxed condition by BLGG13 Lemma A.3.1 (ArithmeticGaloisRepresentations G7/adequacy-criteria (4)) since p ∤ (k − 1). For p ∤ n the relaxed and unrelaxed conditions agree with Thorne 2012 adequacy.

*Sources.* BCG25 §3, proof of Theorem 3.1, p. 518.

### Ordinary automorphy lifting

`PL.4/ordinary-automorphy-lifting` (theorem) — planet: *Ordinary automorphy lifting theorem*

Let F be CM or totally real, l an odd prime and (r, µ) an n-dimensional algebraic polarized l-adic representation of G_F with (1) r̄ irreducible and r̄(G_{F(ζ_l)}) adequate; (2) ζ_l ∉ F; (3) r ordinary at every prime above l; (4) (r̄, µ̄) ordinarily automorphic. Then (r, µ) is ordinarily automorphic; if r is crystalline (resp. potentially crystalline) at every place above l, it is ordinarily automorphic of level prime to l (resp. potentially prime to l) (BLGGT14 Theorem 2.4.1; for F imaginary Thorne 2012 Theorem 9.1, after Geraghty Theorem 5.3.2; with Thorne 2017 Corollary 7.3 adequacy may be taken in the sense of Definition 2.20).

*Hypotheses.* l odd, ζ_l ∉ F; r̄ irreducible with adequate image on G_{F(ζ_l)}; r ordinary above l; (r̄, µ̄) ordinarily automorphic.

*Proof outline.*

1. Totally real F reduces to imaginary F by quadratic CM base change and PL.0/soluble-descent.
2. For F imaginary, twist and make a soluble base change so that χ = µ = δ^n_{F/F⁺}, all relevant places split, r̄ is trivial at the places above l and at an auxiliary set R (with l^N > n when l^N ∥ Nv − 1), and choose v₁ split with Nv₁ ≢ 1 mod l where r and π are unramified.
3. Apply PL.3/ordinary-r-equals-t (in the corrected form PL.3/revised-adequacy-r-equals-t) to the descent of π, using Hida theory (PL.2/hida-classicality) to change weight and the χ_v-variation to change level; the specialisation of the ordinary Hecke algebra through which r factors is classical by PL.2/hida-classicality and PL.2/unitary-base-change-and-descent (2).
4. The level statements use the fixed-weight version of the ordinary R = T theorem (Geraghty Theorem 4.3.1, noted by Thorne 2012) and that ordinary crystalline points correspond to unramified π_v (PL.0/ordinary-implies-iota-ordinary).

*Prerequisites.* PL.3/ordinary-r-equals-t (The ordinary R = T theorem with Taylor's Ihara avoidance); PL.3/revised-adequacy-r-equals-t (The R = T theorems under Guralnick–Herzig–Tiep adequacy); PL.2/hida-classicality (Hida classicality and independence of the characters χ_v modulo λ); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.0/automorphy-under-twist (Automorphy is invariant under algebraic twists); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); PL.0/iota-ordinary (ι-ordinary automorphic representations); PL.0/ordinary-implies-iota-ordinary (Ordinary Galois representations come from ι-ordinary automorphic representations); PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels).

*Acceptance.* Boxer–Calegari–Gee, Theorem 2.1: applied with F = ℚ, l = p, n = p − 1 or p − 2, µ = ε^{1−n}δ^n (printed with n = p − 1 for n, their source issue E1); the level-prime-to-l clause makes π_p unramified. Qian, proof of Theorem 1.1, and the potential automorphy theorems of ModularityAndLanglandsExtensions ML.2 apply it after potential ordinary automorphy (PL.5).

*Sources.* BLGGT14 §2.4, Theorem 2.4.1, p. 39; Tho12 §9, Theorem 9.1, pp. 53–54.

### Finiteness of polarized deformation rings for fixed components

`PL.4/minimal-finiteness` (theorem)

Let F be imaginary CM, l odd with ζ_l ∉ F, S a finite set of places of F⁺ containing those above l, all split in F, and (π, χ) a RAECSDC representation of GL_n(𝔸_F) of weight ι_*λ unramified outside S with ρ̄ = r̄_{l,ι}(π) absolutely irreducible and ρ̄(G_{F(ζ_l)}) adequate. Let r̄ : G_{F⁺} → 𝒢_n(k) extend ρ̄ with ν ∘ r̄ = µ̄ε̄^{1−n}δ^κ_{F/F⁺}, and for each v ∈ S choose an irreducible component C_v of R^□_ṽ (v ∤ l) or of the crystalline ring R^{λ,cr}_ṽ (v | l) on which ρ|G_{F_ṽ} lies and lies on no other. For 𝒮 = (F/F⁺, S, S̃, O, r̄, µε^{1−n}δ^κ, {R^{C_v}_ṽ}) one has κ = 0 and R^univ_𝒮 is a finite O-module (Thorne 2012, Theorem 10.1; BLGGT14 Theorem 2.3.2, where level potentially prime to l and components of the K′-crystalline rings are allowed after base change). By Thorne 2017 Proposition 7.2 the adequacy may be taken in the sense of Definition 2.20.

*Hypotheses.* F imaginary CM, ζ_l ∉ F, S split in F; ρ̄(G_{F(ζ_l)}) adequate; C_v components through ρ|G_{F_ṽ} meeting no other component at that point.

*Proof outline.*

1. Twist to χ = δ^n; choose a soluble CM L/F linearly disjoint from F̄^{ker ρ̄}(ζ_l) with 4 | [L⁺ : F⁺], L/L⁺ unramified at finite places and S split completely in L⁺ (PL.0/auxiliary-cm-extensions).
2. R^univ_𝒮 is finite over R^univ_{𝒮_L} by restriction (GlobalGaloisDeformations R04.4/restriction-finiteness, as in the argument of Guerberoff–Gee Lemma 3.2.5).
3. Descend π_L to Π on G, choose v₁ with residue characteristic prime to the orders of the torsion of G(L⁺) and U_{v₁} = Iw₁(ṽ₁), take m attached to Π, and apply PL.3/minimal-r-equals-t with its Corollary 6.9 (κ = 0 is µ_m ≡ n mod 2).

*Prerequisites.* PL.3/minimal-r-equals-t (The minimal R = T theorem on definite unitary groups); PL.3/revised-adequacy-r-equals-t (The R = T theorems under Guralnick–Herzig–Tiep adequacy); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); GlobalGaloisDeformations:R04.4/restriction-finiteness; GlobalGaloisDeformations:G7/polarized-representability.

*Acceptance.* BLGGT14 Theorem 2.3.2 is the case where C_v is the component containing r_{l,ι}(π)|G_{F_ṽ}. Boxer–Calegari–Gee use it (cited as [Tho12, Thm 10.1] with [Tho17, Prop 7.2]) for the finiteness of R_F in Theorem 3.1.

*Sources.* Tho12 §10, Theorem 10.1, p. 55; BLGGT14 §2.3, Theorem 2.3.2, p. 38.

### Finiteness of ordinary polarized deformation rings

`PL.4/ordinary-finiteness` (theorem) — planet: *Finiteness of polarized deformation rings*

Let F be imaginary CM, l odd with ζ_l ∉ F, S a finite set of places of F⁺ containing those above l, all split in F, (π, χ) an ι-ordinary RAECSDC representation of GL_n(𝔸_F) unramified outside S with r̄_{l,ι}(π)(G_{F(ζ_l)}) adequate, µ an algebraic character with µ̄ = r̄_{l,ι}(χ)ε̄^{1−n}, HT_τ(µ) = {w}, and for each τ : F → Q̄_l a multiset H_τ of n distinct integers with H_{τ∘c} = {w − h : h ∈ H_τ}. For the problem 𝒮 with all lifts at v ∈ S, v ∤ l, and the lifts factoring through R^□_{O, r̄|G_{F_ṽ}, {H_τ}, ss-ord} at v | l, R^univ_𝒮 is a finitely generated O-module (Thorne 2012, Theorem 10.2 = BLGGT14 Theorem 2.4.2, generalising Guerberoff–Gee Corollary 4.3.3).

*Hypotheses.* F imaginary CM, ζ_l ∉ F, S split; π ι-ordinary with adequate residual image; H_τ of n distinct integers with H_{τc} = w − H_τ.

*Proof outline.*

1. As in PL.4/minimal-finiteness, reduce by soluble base change to a field over which the hypotheses of PL.3/ordinary-r-equals-t hold, with the ss-ordinary local rings of fixed weight H_τ (requested of LocalGaloisDeformationRings L7: Geraghty's R^{{H_τ},ss-ord}, equidimensional of dimension 1 + n² + [K : Q_l]n(n−1)/2).
2. Corollary 8.7: the universal ring is finite over Λ; specialising at the weight H_τ (the arithmetic prime of Λ) gives finiteness over O.

*Prerequisites.* PL.3/ordinary-r-equals-t (The ordinary R = T theorem with Taylor's Ihara avoidance); PL.3/revised-adequacy-r-equals-t (The R = T theorems under Guralnick–Herzig–Tiep adequacy); PL.4/minimal-finiteness (Finiteness of polarized deformation rings for fixed components); PL.0/iota-ordinary (ι-ordinary automorphic representations); LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

*Acceptance.* Boxer–Calegari–Gee, proof of Theorem 2.1: R_F is a quotient of this ring for S = {p} (cited as [Tho12, Thm 10.1], their source issue E2), hence finite over O. Used in BLGGT14 Proposition 3.2.1 (PL.5/ordinary-lifts-prescribed-local) to produce lifts by the Khare–Wintenberger method.

*Sources.* BLGGT14 §2.4, Theorem 2.4.2, pp. 39–40; Tho12 §10, Theorem 10.2, p. 57.

### Characteristic-zero lifts from finiteness and the dimension bound

`PL.4/characteristic-zero-lifts` (theorem)

Let F be imaginary CM, l odd, S a finite set of places of F⁺ split in F containing those above l, r̄ : G_{F⁺} → 𝒢_n(F̄_l) with r̄|G_F absolutely irreducible, µ a de Rham lift of ν ∘ r̄ with µ(c_v) = −1 for all v | ∞, H_τ multisets of n distinct integers with H_{τc} = w − H_τ, and 𝒮 a polarized problem whose local conditions at v | l are unions of components of the K′-semistable rings of Hodge type {H_τ} and at v ∤ l unions of components of R^□[1/l]. Then R^univ_𝒮 has Krull dimension at least 1 (BLGGT14 Proposition 1.5.1, from Clozel–Harris–Taylor Proposition 2.2.9 and Corollary 2.3.5). Consequently, if R^univ_𝒮 is moreover a finite O-module (PL.4/minimal-finiteness, PL.4/ordinary-finiteness), there is a continuous O-algebra map R^univ_𝒮 → Q̄_l, i.e. a lift r : G_{F⁺} → 𝒢_n(O_{Q̄_l}) of r̄ of type 𝒮 (the Khare–Wintenberger method, as in the proof of BLGGT14 Proposition 3.2.1).

*Hypotheses.* r̄|G_F absolutely irreducible; µ(c_v) = −1 for all v | ∞; local conditions of the stated dimensions.

*Proof outline.*

1. The dimension lower bound is GlobalGaloisDeformations G7/polarized-presentation with the local dimensions 1 + n² + [F_ṽ : Q_l]n(n−1)/2 (v | l) and 1 + n² (v ∤ l), and the archimedean term Σ_{v|∞} n(n + χ(c_v))/2 = Σ n(n − 1)/2 for µ(c_v) = −1.
2. A finite O-algebra of Krull dimension ≥ 1 has a minimal prime 𝔭 with R/𝔭 finite and of dimension 1, hence torsion free; R/𝔭[1/l] is a finite field extension of L, giving the Q̄_l-point (DeformationAndDerivedPatchingAlgebra R03.4/characteristic-zero-points-from-finiteness-and-dimension).

*Prerequisites.* GlobalGaloisDeformations:G7/polarized-presentation; GlobalGaloisDeformations:G7/polarized-representability; DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension; PL.1/connects-relation (Connecting and strongly connecting local lifts).

*Acceptance.* BLGGT14 Proposition 3.2.1 obtains the ordinary crystalline lift r in exactly this way.

*Sources.* BLGGT14 §1.5, Proposition 1.5.1, p. 30; BLGGT14 §3.2, end of the proof of Proposition 3.2.1, p. 47.

## PL.5. Potential ordinary automorphy and potentially diagonalizable lifting

**Theorems.** Potential ordinary automorphy of a symplectic mod l representation over a totally real field through the Dwork family and Moret-Bailly's theorem (BLGGT14 Theorem 3.1.2); ordinary crystalline lifts with prescribed local behaviour by the Khare–Wintenberger method (Proposition 3.2.1); Harris's tensor product trick: automorphy of a potentially diagonalizable (r, µ) congruent to an automorphic representation of level prime to l with potentially diagonalizable local components and Hodge–Tate regular tensor product (Proposition 4.1.1); automorphy lifting for potentially diagonalizable representations with r̄|G_{F(ζ_l)} irreducible and l ≥ 2(d + 1) (BLGGT14 Theorem 4.2.1), in the form used by Newton–Thorne, Clozel–Thorne and Boxer–Calegari–Gee.

**Depends on.** Within this roadmap: PL.0, PL.1, PL.4. Other roadmaps: ArithmeticGaloisRepresentations:G7, EndoscopicTransferAndUnitaryTraceComparison:ET.7a, GlobalGaloisDeformations:R04.4, PotentialModularityAndCompatibleSystems:R23.1.

### Potential ordinary automorphy of symplectic mod l representations

`PL.5/dwork-potential-ordinary-automorphy` (theorem) — planet: *Potential ordinary automorphy*

Let F/F₀ be a finite Galois extension of totally real fields, I a finite set, and for i ∈ I an even n_i ≥ 2, an odd prime l_i, ι_i : Q̄_{l_i} ≅ ℂ and r̄_i : G_F → GSp_{n_i}(F̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}; let F^{(avoid)}/F be finite Galois. Then there are a finite totally real F′/F and, for each i, a regular algebraic cuspidal polarized (π_i, χ_i) of GL_{n_i}(𝔸_{F′}) such that F′/F₀ is Galois, F′ is linearly disjoint from F^{(avoid)} over F, (r̄_{l_i,ι_i}(π_i), r̄_{l_i,ι_i}(χ_i)ε̄^{1−n_i}) ≅ (r̄_i|G_{F′}, ε̄^{1−n_i}), and π_i is ι_i-ordinary of weight 0 (BLGGT14 Theorem 3.1.2).

*Hypotheses.* F/F₀ Galois, totally real; n_i even, l_i odd; r̄_i symplectic with multiplier ε̄^{1−n_i}.

*Proof outline.*

1. Choose N prime to 2∏l_i, N > n_i + 1, unramified in F^{(avoid)}, with primes λ_i of ℚ(ζ_N)⁺ above l_i and embeddings of the coefficient fields of r̄_i into ℤ[ζ_N]⁺/λ_i (Barnet-Lamb–Geraghty–Harris–Taylor Lemma 6.1).
2. The Dwork family Y_t : X_1^N + ⋯ + X_N^N = N t X_1⋯X_N and its H_0-eigensheaves with coefficients in ℤ[ζ_N]⁺ give symplectic local systems V_{λ} of rank n_i with large monodromy (the self-dual Dwork family of Harris–Shepherd-Barron–Taylor and Barnet-Lamb–Geraghty–Harris–Taylor §4); this input is recorded as a gap of this packet, to be imported from the Dwork switching-motive Part II proposed in `restructure`.
3. The moduli space T of trivialisations V[λ_i] ≅ r̄_i (symplectic) is geometrically connected; Moret-Bailly (PotentialModularityAndCompatibleSystems R23.1, in the form of BLGGT14 Proposition 3.1.1) gives F′ and t ∈ T(F′) with prescribed local behaviour, making V_{t} ordinary at l_i and at an auxiliary prime l′ congruent to an induced representation from a CM character.
4. The auxiliary prime: V_{t,λ′} is residually induced, hence automorphic by automorphic induction (PL.0/induction-descent and ET.7a) and ordinary; ordinary automorphy lifting (PL.4/ordinary-automorphy-lifting) gives automorphy of the compatible system at l′, hence at l_i, and ordinarity of weight 0 at l_i (PL.0/ordinary-implies-iota-ordinary).

*Prerequisites.* PL.4/ordinary-automorphy-lifting (Ordinary automorphy lifting); PL.0/induction-descent (Automorphy of an induced representation descends); PL.0/ordinary-implies-iota-ordinary (Ordinary Galois representations come from ι-ordinary automorphic representations); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points; EndoscopicTransferAndUnitaryTraceComparison:ET.7a.

*Acceptance.* The case I = {i}, n_i = 2 recovers Taylor's potential modularity for GL₂ in the ordinary weight-two form (compare PotentialModularityAndCompatibleSystems R23). Used by BLGGT14 Proposition 3.2.1 for Iψ(r̄) : G_{F⁺} → GSp_{2n}, and by Newton–Thorne 2021 Theorem 5.2 with the extra condition t(P) < 0 at Σ.

*Sources.* BLGGT14 §3.1, Theorem 3.1.2, pp. 41–42; BLGGT14 §3.1, proof of Theorem 3.1.2, p. 42.

### Ordinary crystalline lifts with prescribed local behaviour

`PL.5/ordinary-lifts-prescribed-local` (theorem)

Let F be imaginary CM with ζ_l ∉ F, l odd, S a finite set of finite places of F⁺ split in F containing those above l, µ : G_{F⁺} → Q̄_l^× crystalline, unramified outside S, with µ(c_v) = −1 for v | ∞ and HT_τ(µ) = {w}, H_τ sets of n distinct integers with H_{τc} = w − H_τ, and r̄ : G_{F⁺} → 𝒢_n(F̄_l) unramified outside S with ν ∘ r̄ = µ̄ and r̄^{−1}𝒢_n⁰ = G_F; for v ∈ S, v ∤ l, let ρ_v be a lift of r̄|G_{F_ṽ}. Assume (a) r̄|G_{F(ζ_l)} is irreducible and l ≥ 2(d + 1), d the maximal dimension of an irreducible constituent of r̄ restricted to the subgroup of G_{F⁺} generated by the Sylow pro-l subgroups; (b) for u | l, r̄|G_{F_u} has an ordinary crystalline lift with Hodge–Tate numbers H_τ. Then there is a lift r : G_{F⁺} → 𝒢_n(O_{Q̄_l}) of r̄ with ν ∘ r = µ, r|G_{F_u} ordinary and crystalline with Hodge–Tate numbers H_τ for u | l, r|G_{F_ṽ} ∼ ρ_v for v ∈ S, v ∤ l, and r unramified outside S (BLGGT14 Proposition 3.2.1).

*Hypotheses.* F imaginary CM, ζ_l ∉ F, l odd; r̄|G_{F(ζ_l)} irreducible, l ≥ 2(d + 1); ordinary crystalline local lifts above l with weights H_τ.

*Proof outline.*

1. Choose a character ψ of G_F (PL.0/auxiliary-characters) crystalline above l with HT_τ(ψ) = {b_τ}, unramified at S − S_l, wildly ramified at an auxiliary split place v_q, with ψψ^c = ε^{1−2n}µ^{−1}; then I_ψ(r̄) = I(r̄ ⊗ (ψ, ε^{1−2n}µ^{−1}δ)) : G_{F⁺} → GSp_{2n} is irreducible on G_{F⁺(ζ_l)} and adequate (ArithmeticGaloisRepresentations G7/adequacy-criteria (1)).
2. Potential ordinary automorphy (PL.5/dwork-potential-ordinary-automorphy) gives F₁⁺ and an ι-ordinary π₁ with r̄(π₁) ≅ I_ψ(r̄)|G_{F₁⁺}; pass to F₃ = F₁F₂ where all places above T′ split.
3. PL.4/ordinary-finiteness makes R^univ_{𝒮₃} finite over O, and restriction (GlobalGaloisDeformations R04.4/restriction-finiteness, BLGGT14 Lemma 1.2.3) makes R^univ_𝒮 finite over O; PL.4/characteristic-zero-lifts produces the lift.

*Prerequisites.* PL.5/dwork-potential-ordinary-automorphy (Potential ordinary automorphy of symplectic mod l representations); PL.4/ordinary-finiteness (Finiteness of ordinary polarized deformation rings); PL.4/characteristic-zero-lifts (Characteristic-zero lifts from finiteness and the dimension bound); PL.0/auxiliary-characters (Algebraic characters with prescribed conjugate-norm and local behaviour); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); PL.1/connects-relation (Connecting and strongly connecting local lifts); ArithmeticGaloisRepresentations:G7/adequacy-criteria; ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group; GlobalGaloisDeformations:R04.4/restriction-finiteness.

*Acceptance.* Used twice in the proof of BLGGT14 Theorem 4.2.1 to produce the intermediate ordinary lifts r₁, r₂. Newton–Thorne 2021 Theorem 5.2 follows the same pattern for residually reducible r̄.

*Sources.* BLGGT14 §3.2, Proposition 3.2.1, p. 45.

### Harris's tensor product trick: a preliminary potentially diagonalizable lifting theorem

`PL.5/tensor-product-trick-lifting` (theorem) — planet: *Harris's tensor product trick*

Let F be imaginary CM, l odd with ζ_l ∉ F, and (r, µ) a regular algebraic irreducible n-dimensional polarized l-adic representation of G_F; let d be as in PL.5/ordinary-lifts-prescribed-local. Assume (1) r|G_{F_v} is potentially diagonalizable for all v | l; (2) r̄|G_{F(ζ_l)} is irreducible and l ≥ 2(d + 1); (3) (r̄, µ̄) is automorphic of level prime to l, arising from a regular algebraic cuspidal polarized (π, χ) with r_{l,ι}(π)|G_{F_v} potentially diagonalizable for all v | l, the set {h + h′ : h ∈ HT_τ(r), h′ ∈ HT_τ(r_{l,ι}(π))} of n² distinct elements for every τ, and r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v} for v ∤ l. Then (r, µ) is potentially diagonalizably automorphic, of level potentially prime to l (BLGGT14 Proposition 4.1.1).

*Hypotheses.* (r, µ) regular algebraic, irreducible, polarized; potentially diagonalizable above l; r̄|G_{F(ζ_l)} irreducible, l ≥ 2(d + 1), ζ_l ∉ F; an automorphic seed of level prime to l with the Hodge–Tate regularity of the tensor product.

*Proof outline.*

1. Adequacy of r̄(G_{F(ζ_l)}) and l ∤ n follow from ArithmeticGaloisRepresentations G7/adequacy-criteria (1). By PL.0/soluble-descent and PL.0/auxiliary-cm-extensions assume F/F⁺ unramified, all relevant places split, r̄ trivial and r, r_{l,ι}(π) diagonalizable at u | l, π_u unramified.
2. Choose a cyclic CM M/F of degree n (PL.0/auxiliary-cm-extensions) and characters θ, θ′ of G_M with θ̄ = θ̄′, θθ^c = r_{l,ι}(χ)ε^{1−n}, θ′θ′^c = µ, prescribed Hodge–Tate numbers matching the diagonal characters of r_{l,ι}(π) resp. r, and ramification at an auxiliary place of residue characteristic q (PL.0/auxiliary-characters).
3. R = (r ⊗ Ind_{G_M}^{G_F} θ)|G_{F₁} and R′ = (r_{l,ι}(π) ⊗ Ind θ′)|G_{F₁} have R̄ ≅ R̄′, R irreducible with adequate image, R′ automorphic of level prime to l via the automorphic induction of BC(π) ⊗ φ′ (ET.7a), and R ∼ R′ at every finite place (PL.1/connects-properties).
4. PL.4/minimal-automorphy-lifting makes R automorphic; PL.0/induction-descent, PL.0/automorphy-under-twist and PL.0/soluble-descent descend to r.

*Prerequisites.* PL.4/minimal-automorphy-lifting (Minimal automorphy lifting with adequate residual image); PL.0/induction-descent (Automorphy of an induced representation descends); PL.0/automorphy-under-twist (Automorphy is invariant under algebraic twists); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); PL.0/auxiliary-characters (Algebraic characters with prescribed conjugate-norm and local behaviour); PL.1/potentially-diagonalizable (Diagonalizable and potentially diagonalizable representations); PL.1/connects-properties (Properties of connection and strong connection); ArithmeticGaloisRepresentations:G7/adequacy-criteria; EndoscopicTransferAndUnitaryTraceComparison:ET.7a.

*Acceptance.* Boxer–Calegari–Gee, Theorem 3.1: the seed is the automorphic induction of the base change of Sym^{p−1}π_f twisted by θ, as in this proof. The last two parts of (3) are restrictive; PL.5/pd-automorphy-lifting removes them.

*Sources.* BLGGT14 §4.1, Proposition 4.1.1, p. 50; BLGGT14 §4.1, p. 50.

### Automorphy lifting for potentially diagonalizable representations

`PL.5/pd-automorphy-lifting` (theorem) — planet: *Potentially diagonalizable automorphy lifting*

Let F be imaginary CM, l odd, and (r, µ) a regular algebraic irreducible n-dimensional polarized representation of G_F; let d be the maximal dimension of an irreducible subrepresentation of r̄ restricted to the closed subgroup of G_F generated by the Sylow pro-l subgroups. Assume (1) r|G_{F_v} is potentially diagonalizable for all v | l; (2) r̄|G_{F(ζ_l)} is irreducible, l ≥ 2(d + 1) and ζ_l ∉ F; (3) (r̄, µ̄) is ordinarily automorphic or potentially diagonalizably automorphic. Then (r, µ) is potentially diagonalizably automorphic, of level potentially prime to l (BLGGT14 Theorem 4.2.1; the overbars in (3) are lost in the text extraction but are in the paper, and the proof uses only the residual hypothesis). Condition (1) holds when l is unramified in F, r is crystalline above l and HT_τ(r) lies in an interval [a_τ, a_τ + l − 2] (PL.1/pd-criteria).

*Hypotheses.* F imaginary CM, l odd, ζ_l ∉ F; r potentially diagonalizable above l; r̄|G_{F(ζ_l)} irreducible, l ≥ 2(d + 1); (r̄, µ̄) ordinarily or potentially diagonalizably automorphic.

*Proof outline.*

1. By PL.0/soluble-descent assume F/F⁺ unramified, the relevant places split, F_u ∋ ζ_l and r̄, r̄_{l,ι}(π) trivial at u | l; extend r̄ to r̃ : G_{F⁺} → 𝒢_n with multiplier µ̄.
2. With m larger than all differences of Hodge–Tate numbers, H_τ = {0, m, …, (n − 1)m}: both r|G_{F_u} and r_{l,ι}(π)|G_{F_u} have the ordinary crystalline lift 1 ⊕ ε^{−m} ⊕ ⋯ ⊕ ε^{(1−n)m}; PL.5/ordinary-lifts-prescribed-local produces ordinary lifts r₁ (with the local behaviour of r) and r₂ (with that of r_{l,ι}(π)), with r₁ ⊗ r and r₂ ⊗ r_{l,ι}(π) Hodge–Tate regular.
3. PL.5/tensor-product-trick-lifting shows r₂ is automorphic; PL.4/ordinary-automorphy-lifting transfers automorphy from r₂ to r₁ (both ordinary, same residual representation); PL.5/tensor-product-trick-lifting again transfers it from r₁ to r.

*Prerequisites.* PL.5/tensor-product-trick-lifting (Harris's tensor product trick: a preliminary potentially diagonalizable lifting theorem); PL.5/ordinary-lifts-prescribed-local (Ordinary crystalline lifts with prescribed local behaviour); PL.4/ordinary-automorphy-lifting (Ordinary automorphy lifting); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.1/potentially-diagonalizable (Diagonalizable and potentially diagonalizable representations); PL.1/pd-criteria (Ordinary and Fontaine–Laffaille representations are potentially diagonalizable); PL.0/automorphic-polarized-representation (Automorphic polarized representations and their levels).

*Acceptance.* Newton–Thorne 2021 II, Proposition 3.9 and Theorem 3.1: applied over a CM field to Sym^{n−1}r_{π,ι_t} with t large, Sym^{n−1}r̄ irreducible because the image contains SL₂(F_t), t > n − 1, and potential diagonalizability from Fontaine–Laffaille theory or Gee–Kisin (PL.1/potentially-barsotti-tate-diagonalizable, PL.1/pd-operations). Newton–Thorne 2026, Lemma 5.7 and Proposition 6.1; Clozel–Thorne 2017, Lemma 7.5 and Proposition 7.6.

*Sources.* BLGGT14 §4.2, Theorem 4.2.1, p. 53; NT21B §3, proof of Theorem 3.1, p. 29.

## PL.6. Residually reducible deformation rings: Schur representations, pseudodeformations and generic primes

**Objects.** Schur 𝒢_n-valued residual representations (Thorne 2015, Definition 3.2) and primitive representations; the pseudodeformation ring P_𝒮 ⊂ R^univ_𝒮 generated by characteristic polynomials (Thorne 2015, Definitions 3.25–3.27; Allen–Newton–Thorne Proposition 3.2); the ideal of reducibility and reducible deformations (Thorne 2015, Definition 3.31); generic primes of an ordinary deformation ring (Allen–Newton–Thorne, Definition 3.7); the connectedness dimension of a complete local ring (Thorne 2015, Definition 1.7).

**Theorems.** Grothendieck's connectedness bound c(R/I) ≥ c(R) − r(I) − 1 (Thorne 2015, Proposition 1.8); sums of characters with large ratios are primitive (Newton–Thorne 2021, Lemma 5.1); finiteness of restriction of pseudodeformations (Lemma 5.3, Chenevier); the dimension bound for the reducible locus in the presence of Steinberg places (Allen–Newton–Thorne, Lemma 3.6); large quotients contain generic primes (Lemmas 3.8–3.9, Thorne 2015 Lemma 1.9); genericity is preserved under restriction to open subgroups (Thorne 2015, Proposition 5.3); the generic R_𝔭 = T_𝔭 theorem J·R^univ ⊂ Q, with J = ker(P_𝒮 → T_m), for every prime Q below a generic prime (Thorne 2015, Theorem 4.19, Corollary 4.20; Allen–Newton–Thorne, Theorem 4.1), with the twisting and soluble base change of Hecke algebras it uses (Thorne 2015, Lemmas 3.36, 3.38, 3.40, Proposition 4.18).

**Depends on.** Within this roadmap: PL.2, PL.3. Other roadmaps: ArithmeticGaloisRepresentations:G7, DeformationAndDerivedPatchingAlgebra:R03.5, DeformationAndDerivedPatchingAlgebra:R03.6, GlobalGaloisDeformations:G7, GlobalGaloisDeformations:R04.1, GlobalGaloisDeformations:R04.2, GlobalGaloisDeformations:R04.4, IntegralHeckeAndGaloisDeterminants:IHG.0, IntegralHeckeAndGaloisDeterminants:IHG.1, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:L8, LocalGaloisDeformationRings:R08.2.

### Schur 𝒢_n-valued residual representations

`PL.6/schur-residual-representation` (definition)

Let k be a field, Γ a group with an index-two subgroup Δ and r̄ : Γ → 𝒢_n(k) with r̄^{−1}(𝒢_n⁰(k)) = Δ. r̄ is Schur if every irreducible Δ-subquotient of kⁿ is absolutely irreducible and for all Δ-invariant subspaces kⁿ ⊃ W₁ ⊃ W₂ with kⁿ/W₁ and W₂ irreducible, (kⁿ/W₁)^c ≇ W₂^∨ ⊗ (ν ∘ r̄) (Thorne 2015, Definition 3.2). Then (Lemma 3.3) r̄|Δ is semisimple and multiplicity free with each constituent ρ satisfying ρ^c ≅ ρ^∨ ⊗ (ν ∘ r̄); two Schur r̄, r̄′ with tr r̄|Δ = tr r̄′|Δ are GL_n(k̄)-conjugate; and H⁰(Γ, ad r̄) = 0 if char k ≠ 2. Conversely (Lemma 3.4) a sum ρ = ⊕ρ_i of pairwise non-isomorphic absolutely irreducible ρ_i, each with a perfect pairing ⟨x, y⟩_i = −µ(c)⟨y, x⟩_i, ⟨ρ(δ)x, ρ(δ^c)y⟩_i = µ(δ)⟨x, y⟩_i, and ρ_j^c ≇ ρ_i^∨ ⊗ µ for i ≠ j, extends to r̄ : Γ → 𝒢_n(k), the GL_n(k)-classes of such extensions forming a torsor under ∏_i k^×/(k^×)².

*Hypotheses.* k a field (characteristic ≠ 2 for the vanishing of H⁰); r̄^{−1}𝒢_n⁰(k) = Δ.

*Proof outline.*

1. Lemma 3.3 follows from Clozel–Harris–Taylor Lemma 2.1.7: the Schur condition excludes the self-extensions and conjugate-dual coincidences that produce non-scalar endomorphisms.
2. Lemma 3.4: the pairing on each ρ_i gives an extension of ρ_i (ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group, the dictionary with polarized triples); their orthogonal sum extends ρ, and rescaling the pairings by α_i changes the extension by the class of α_i in k^×/(k^×)².

*Uses.* Thorne 2015 §3; Allen–Newton–Thorne §3: the residual hypothesis for representability of R^univ_𝒮 with reducible r̄|G_F (GlobalGaloisDeformations G7/polarized-representability). Thorne 2015, Theorem 7.1(6): ρ₁ ≇ ρ₂ and ε^{1−n}ρ₁^∨ ≇ ρ₂^c make every 𝒢_n-extension Schur. Allen–Newton–Thorne, Theorem 4.1(5), Lemma 5.2: r̄_m|G_{L⁺(ζ_l)} Schur.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsSchur` | constructor | The Schur condition on r̄ : Γ → 𝒢_n(k). |
| `TauCeti.Automorphy.IsSchur.semisimple_multiplicityFree` | projection | r̄∣Δ is semisimple and multiplicity free, each constituent conjugate self-dual with multiplier ν ∘ r̄. |
| `TauCeti.Automorphy.IsSchur.conj_of_trace_eq` | extensionality | Two Schur homomorphisms with the same trace on Δ are GL_n(k̄)-conjugate. |
| `TauCeti.Automorphy.IsSchur.h0_ad_eq_zero` | other | If char k ≠ 2 then H⁰(Γ, ad r̄) = 0. |
| `TauCeti.Automorphy.extensionsOfPolarizedSum` | constructor | For ρ = ⊕ρ_i with polarizations and pairwise non-isomorphic, non-conjugate-dual constituents, the set of extensions r̄ up to GL_n(k)-conjugacy, a torsor under ∏_i k^×/(k^×)². |
| `TauCeti.Automorphy.IsSchur.of_absIrred` | example | An absolutely irreducible polarized ρ̄ extends to a Schur r̄. |

*Unit tests.*

* `schur_absIrred` (degenerate): If r̄|Δ is absolutely irreducible then r̄ is Schur.
* `schur_characters` (computation): For n = 2, Δ = G_F, r̄|G_F = χ₁ ⊕ χ₂ with χ₁ ≠ χ₂, χ_i^c = χ_i^{−1}µ̄ and χ₂^c ≠ χ₁^{−1}µ̄, r̄ is Schur and its extensions form a torsor under (k^×/(k^×)²)².
* `not_schur_repeated` (non-example): r̄ with r̄|G_F ≅ χ ⊕ χ is not Schur: the constituent is repeated and End(r̄|Δ) ⊋ k.
* `schur_h0` (characterisation): If char k ≠ 2 and r̄ is Schur then the 𝒢_n-equivariant endomorphisms of ad r̄ invariants vanish: H⁰(Γ, ad r̄) = 0.

*Prerequisites.* ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group; ArithmeticGaloisRepresentations:G7/polarized-representation; GlobalGaloisDeformations:R04.1/strict-vs-full-conjugacy.

*Acceptance.* An absolutely irreducible ρ̄ with ρ̄^c ≅ ρ̄^∨ ⊗ µ̄ gives a Schur r̄. Newton–Thorne 2021, Theorem 5.2(2): if χ_i/χ_j|G_{F(ζ_p)} has order greater than 2n for i < j, then r̄ with r̄|G_F = ⊕χ_i is Schur.

*Sources.* Tho15 §3.1, Definition 3.2, p. 18; Tho15 §3.1, Lemma 3.3, p. 18.

### Primitive representations

`PL.6/primitive-representation` (definition)

Let Γ be a profinite group, k a field and ρ̄ : Γ → GL_n(k) continuous. ρ̄ is primitive if it is not isomorphic to Ind_{Γ′}^{Γ} σ̄ for any proper closed subgroup Γ′ ⊂ Γ of finite index and any continuous σ̄ : Γ′ → GL_{n/[Γ:Γ′]}(k) (Newton–Thorne 2021 §5, after Allen–Newton–Thorne Theorem 1.1(7)).

*Hypotheses.* Γ profinite, k a field.

*Proof outline.*

1. Induction is ArithmeticGaloisRepresentations' continuous induction from open subgroups; primitivity quantifies over the finitely many open subgroups of index dividing n containing ker ρ̄ when ρ̄ has finite image.

*Uses.* Allen–Newton–Thorne, Theorem 1.1(7) and Theorem 4.1(4): ρ̄^ss primitive is a hypothesis of residually reducible lifting. Newton–Thorne 2021, Lemma 5.1, Theorem 5.2, Proposition 5.8(2): verification for sums of characters with large ratios. Thorne 2015, Theorem 7.1(5) and §5.2: ρ^ss primitive in the two-constituent theorem.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsPrimitive` | constructor | ρ̄ is not induced from any proper open subgroup. |
| `TauCeti.Automorphy.IsPrimitive.restrict` | functoriality | Primitivity depends only on the image: if Γ″ ⊂ Γ is open with ρ̄(Γ″) = ρ̄(Γ) (for instance restriction to a field linearly disjoint from F̄^{ker ρ̄}, as for the good extensions of Allen–Newton–Thorne Lemma 5.2), then ρ̄∣Γ″ is primitive iff ρ̄ is. |
| `TauCeti.Automorphy.isPrimitive_of_dim_one` | example | Every one-dimensional ρ̄ is primitive. |
| `TauCeti.Automorphy.not_isPrimitive_ind` | relation | Ind_{Γ′}^{Γ} σ̄ with [Γ : Γ′] > 1 is not primitive. |
| `TauCeti.Automorphy.isPrimitive_of_characters` | characterisation | A sum of characters χ₁ ⊕ ⋯ ⊕ χ_n with χ_i/χ_j of order greater than n for i ≠ j is primitive (PL.6/character-sums-primitive). |

*Unit tests.*

* `primitive_dim_one` (degenerate): A character χ : Γ → k^× is primitive.
* `not_primitive_induced` (non-example): For Γ′ ⊂ Γ of index 2 and a character θ of Γ′, Ind_{Γ′}^{Γ} θ is not primitive.
* `primitive_characters` (computation): For k = F_7, n = 2 and characters χ₁, χ₂ of Γ with χ₁/χ₂ of order 3 > 2, χ₁ ⊕ χ₂ is primitive.
* `not_primitive_small_ratio` (non-example): For n = 2 and χ₁/χ₂ of order 2 with kernel Γ′, χ₁ ⊕ χ₂ ≅ Ind_{Γ′}^{Γ}(χ₁|Γ′) is not primitive, so the order bound in Lemma 5.1 is needed.

*Prerequisites.* ArithmeticGaloisRepresentations:G7/tensor-induction; ArithmeticGaloisRepresentations:G7.

*Acceptance.* Every irreducible representation of dimension one is primitive. For F′/F quadratic and a character θ of G_{F′} with θ ≠ θ^σ, Ind_{G_{F′}}^{G_F} θ is irreducible and not primitive.

*Sources.* ANT20 §1, Theorem 1.1(7), p. 2; NT21 §5, Lemma 5.1, p. 72.

### Sums of characters with large ratios are primitive

`PL.6/character-sums-primitive` (theorem)

Let Γ be a profinite group, k a field and ρ̄ = χ₁ ⊕ ⋯ ⊕ χ_n with continuous characters χ_i : Γ → k^× such that χ_i/χ_j has order greater than n for i ≠ j. Then ρ̄ is primitive (Newton–Thorne 2021, Lemma 5.1).

*Hypotheses.* χ_i/χ_j of order > n for i ≠ j.

*Proof outline.*

1. If ρ̄ ≅ Ind_{Γ′}^{Γ} σ̄, Frobenius reciprocity puts each χ_i|Γ′ in σ̄; they are distinct, since χ_i|Γ′ = χ_j|Γ′ would give (χ_i/χ_j)^{[Γ:Γ′]} = 1 with [Γ : Γ′] ≤ n.
2. So dim σ̄ ≥ n, forcing Γ′ = Γ.

*Prerequisites.* PL.6/primitive-representation (Primitive representations).

*Acceptance.* Newton–Thorne 2021 apply it to the residually reducible symmetric powers r̄ = ⊕χ_i of Theorem 5.2.

*Sources.* NT21 §5, Lemma 5.1, p. 72.

### Connectedness dimension and arithmetic rank

`PL.6/connectedness-dimension` (definition)

Let R be a complete Noetherian local O-algebra. Its connectedness dimension is c(R) = inf dim(∪_{C∈𝒞₁, D∈𝒞₂} C ∩ D), the infimum over partitions of the set of irreducible components of Spec R into two disjoint non-empty subsets 𝒞₁, 𝒞₂ (c(R) = dim R if Spec R is irreducible). For an ideal I ⊂ R its arithmetic rank r(I) is the least r with √(f₁, …, f_r) = √I. Then c(R/I) ≥ c(R) − r(I) − 1 (Thorne 2015, Definition 1.7, Proposition 1.8, from Brodmann–Rung Theorem 2.4).

*Hypotheses.* R a complete Noetherian local O-algebra.

*Proof outline.*

1. c(R) and r(I) are defined from Mathlib's minimal primes (Ideal.minimalPrimes) and Krull dimensions of quotients (ringKrullDim).
2. Proposition 1.8 is the local form of Grothendieck's connectedness theorem: cutting by one equation lowers c by at most one (Brodmann–Rung).

*Uses.* Thorne 2015, proof of Theorem 4.19: control of the components of the patched ring through the reducible locus. Allen–Newton–Thorne, proof of Theorem 5.1: the connectedness dimension argument that replaces potential automorphy of the constituents.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.CommAlg.connectednessDim` | constructor | c(R) as an element of ℕ∞ ∪ {⊥}, the infimum over two-block partitions of the minimal primes. |
| `TauCeti.CommAlg.arithmeticRank` | constructor | r(I) = min{r : √(f₁, …, f_r) = √I}. |
| `TauCeti.CommAlg.connectednessDim_quotient` | relation | c(R/I) ≥ c(R) − r(I) − 1 (Proposition 1.8). |
| `TauCeti.CommAlg.connectednessDim_of_irreducible` | example | If Spec R is irreducible then c(R) = dim R. |
| `TauCeti.CommAlg.connectednessDim_le_dim` | other | c(R) ≤ dim R, and c(R) ≤ dim(C ∩ D) for any two distinct components. |

*Unit tests.*

* `cdim_node` (computation): c(k⟦x, y⟧/(xy)) = 0 and dim k⟦x, y⟧/(xy) = 1.
* `cdim_domain` (degenerate): For a domain R, c(R) = dim R; for R = k, c(R) = 0.
* `cdim_planes` (computation): For R = k⟦x, y, z, w⟧/((x, y) ∩ (z, w)), the two planes meet only in the closed point, so c(R) = 0 although dim R = 2.
* `arank_principal` (characterisation): r(I) ≤ 1 iff I has the radical of a principal ideal; r(0) = 0.

*Prerequisites.* mathlib:Ideal.minimalPrimes; mathlib:ringKrullDim; mathlib:IsLocalRing.

*Acceptance.* Allen–Newton–Thorne, proof of Theorem 5.1 ('connectedness dimension' argument going back to Skinner–Wiles): R = T is propagated across components meeting in large dimension. c(k⟦x, y⟧/(xy)) = 0, since the two components meet in the closed point.

*Sources.* Tho15 §1, Definition 1.7, p. 7; Tho15 §1, Proposition 1.8, p. 7.

### The subring P_𝒮 generated by characteristic polynomials

`PL.6/polarized-pseudodeformation-subring` (construction) — planet: *Pseudodeformation subring P_𝒮*

Let 𝒮 be a polarized global deformation problem (over Λ when ordinary conditions are imposed) with Schur r̄ (PL.6/schur-residual-representation), D̄ = det ∘ r̄|G_{F,S}. The functor PDef_𝒮 of continuous determinants D : G_{F,S} → R of dimension n lifting D̄ is represented by Q_𝒮, topologically generated by the coefficients of the universal characteristic polynomial at Frobenius elements at a density-one set of places (Thorne 2015, Definition 3.25, Proposition 3.26, from Chenevier). P_𝒮 is the image of Q_𝒮 ⊗̂_O Λ → R^univ_𝒮 classifying the determinant of the universal deformation, i.e. the closed Λ-subalgebra generated by the coefficients of characteristic polynomials (Definition 3.27). If r̄|G_{F,S} is absolutely irreducible, P_𝒮 = R^univ_𝒮; if r̄ is Schur, P_𝒮 ⊂ R^univ_𝒮 is finite; if r̄|G_{F,S} = ⊕_{i=1}^d ρ̄_i (d constituents), µ₂^d ≅ Z_{GL_n(k)}(r̄) acts on R^univ_𝒮 by conjugation and P_𝒮 = (R^univ_𝒮)^{µ₂^d}; at a prime 𝔭 with absolutely irreducible r_𝔭 ⊗ Frac, P_𝒮 → R^univ_𝒮 is étale at 𝔮 = 𝔭 ∩ P_𝒮 and µ₂^d acts transitively on the primes above 𝔮 (Proposition 3.29; Allen–Newton–Thorne, Proposition 3.2). For S′ ⊃ S with |S′ − S| ≤ q, P_{𝒮′} is a quotient of a power series ring in C(q, r̄, S) variables (Lemma 3.28).

*Hypotheses.* r̄ Schur; local deformation problems invariant under the preimage of Z_{GL_n(k)}(r̄).

*Proof outline.*

1. Representability of PDef_𝒮: Chenevier's theory of determinants (IntegralHeckeAndGaloisDeterminants IHG.0/determinant, IHG.0/continuous-determinant; GlobalGaloisDeformations R04.1/determinant-deformation-functor).
2. Finiteness P_𝒮 ⊂ R^univ: R^univ is generated over P_𝒮 by finitely many matrix coefficients integral over P_𝒮 by Cayley–Hamilton (IHG.1/cayley-hamilton).
3. Invariants: Allen–Newton–Thorne Proposition 2.5 (unique decomposition of a residually split multiplicity-free determinant over a Henselian ring) identifies R^univ_𝒮/(m_{P_𝒮}) with a generalised matrix algebra, and the µ₂^d-action is free on the generic points where r_𝔭 is absolutely irreducible.

*Uses.* Thorne 2015, Theorem 4.19; Allen–Newton–Thorne, Theorem 4.1: R = T is proved for P_𝒮 and transported to R^univ along the étale map at generic primes. Newton–Thorne 2021, proof of Theorem 5.2: finiteness transferred from the G_{2n}-problem through pseudocharacter rings and Lemma 5.3. Newton–Thorne 2026 §3: maps P_S → R_S and P_S → T from the subalgebra generated by characteristic polynomials.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.pseudoDeformationRing` | constructor | Q_𝒮 representing continuous determinants of G_{F,S} lifting D̄. |
| `TauCeti.Automorphy.charPolySubring` | constructor | P_𝒮 ⊂ R^univ_𝒮, the image of Q_𝒮 ⊗̂ Λ. |
| `TauCeti.Automorphy.charPolySubring_eq_top_of_absIrred` | characterisation | If r̄∣G_{F,S} is absolutely irreducible then P_𝒮 = R^univ_𝒮. |
| `TauCeti.Automorphy.charPolySubring_finite` | instance | If r̄ is Schur then R^univ_𝒮 is a finite P_𝒮-module. |
| `TauCeti.Automorphy.charPolySubring_eq_invariants` | characterisation | P_𝒮 = (R^univ_𝒮)^{µ₂^d} for d constituents. |
| `TauCeti.Automorphy.charPolySubring_etale` | other | At 𝔭 with r_𝔭 ⊗ Frac absolutely irreducible, P_𝒮 → R^univ_𝒮 is étale at 𝔭 ∩ P_𝒮 and µ₂^d acts transitively on the primes above it. |
| `TauCeti.Automorphy.charPolySubring_generators` | other | P_{𝒮′} is a quotient of O⟦X₁, …, X_C⟧ with C depending only on q = ∣S′ − S∣, r̄ and S. |

*Unit tests.*

* `ps_absIrred` (degenerate): If r̄|G_F is absolutely irreducible then P_𝒮 = R^univ_𝒮.
* `ps_two_characters` (computation): For n = 2, r̄|G_F = χ₁ ⊕ χ₂ Schur, µ₂² acts on R^univ_𝒮 through the scalars (±1, ±1), and P_𝒮 is the subring of invariants, generated by traces and determinants.
* `ps_compatibility_determinants` (compatibility): The composite PDef_𝒮 ← Def_𝒮 sending r to det ∘ r|G_{F,S} is GlobalGaloisDeformations R04.1/determinant-comparison restricted to polarized lifts.
* `ps_not_surjective_reducible` (non-example): If r̄|G_F = χ₁ ⊕ χ₂ with Ext¹(χ₂, χ₁) ≠ 0 over G_{F,S}, P_𝒮 ⊊ R^univ_𝒮: the off-diagonal deformation parameters are not determined by characteristic polynomials.

*Prerequisites.* PL.6/schur-residual-representation (Schur 𝒢_n-valued residual representations); IntegralHeckeAndGaloisDeterminants:IHG.0/determinant; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant; IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton; GlobalGaloisDeformations:R04.1/determinant-deformation-functor; GlobalGaloisDeformations:G7/polarized-representability; GlobalGaloisDeformations:R04.2/carayol-trace-theorem.

*Acceptance.* For d = 1, P_𝒮 = R^univ_𝒮 (Carayol). Thorne 2015, Proposition 4.12: the natural map Q_𝒮 ⊗̂ Λ → T_m factors through P_𝒮 and P_𝒮 ↠ T_m when r̄ is Schur (the surjection P_D → T_D of Newton–Thorne 2021 §6).

*Sources.* Tho15 §3.4, Definition 3.27, p. 23; Tho15 §3.4, Proposition 3.29, p. 24; ANT20 §3, Proposition 3.2, p. 9.

### Restriction of pseudodeformations to a finite-index subgroup is finite

`PL.6/pseudodeformation-restriction-finite` (theorem)

Let Γ be a profinite group satisfying Mazur's condition Φ_p (in particular a topologically finitely generated profinite group, or G_{F,S}), Σ ⊂ Γ a closed subgroup of finite index and t̄ a pseudocharacter of Γ of dimension n over k. Let Q_{t̄} be the complete Noetherian local O-algebra classifying lifts of t̄. Then the map Q_{t̄|Σ} → Q_{t̄} classifying restriction to Σ is finite (Newton–Thorne 2021, Lemma 5.3, from Chenevier Corollary 1.14; stated there for topologically finitely generated Γ and applied to G_{F,S}, see source issue E5).

*Hypotheses.* Γ profinite with Φ_p; Σ ⊂ Γ closed of finite index.

*Proof outline.*

1. It suffices that Q_{t̄}/(m_{Q_{t̄|Σ}}) is Artinian. Otherwise there is a prime 𝔭 of dimension one, and t mod 𝔭 is a pseudocharacter over a one-dimensional domain A whose restriction to Σ is constant (equal to t̄|Σ ⊗ A).
2. By Chenevier Corollary 1.14 (a determinant is determined on a finite-index subgroup up to finitely many choices: the characteristic polynomials of γ ∈ Γ are determined by those of γ^{[Γ:Σ]!} up to roots of unity), t mod 𝔭 takes values in a finite set, contradicting dim A = 1.
3. Φ_p ensures that Q_{t̄} and Q_{t̄|Σ} are Noetherian (GlobalGaloisDeformations R04.2/phi-p-global).

*Prerequisites.* PL.6/polarized-pseudodeformation-subring (The subring P_𝒮 generated by characteristic polynomials); GlobalGaloisDeformations:R04.2/phi-p-global; GlobalGaloisDeformations:R04.2/phi-p-condition; IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter.

*Acceptance.* Used in Newton–Thorne 2021 Theorem 5.2 to pass finiteness from the G_{2n}-problem over L back to r̄.

*Sources.* NT21 §5, Lemma 5.3, p. 76.

### Reducible deformations and the ideal of reducibility

`PL.6/reducibility-ideal` (construction)

Let 𝒮 be a polarized problem with Schur r̄ and r̄|G_{F,S} = ρ̄₁ ⊕ ρ̄₂ (or ⊕_{i=1}^d ρ̄_i). A deformation of r̄ to R ∈ C_Λ is reducible if its class contains a lifting r = r₁ ⊕ r₂ with r_i : G_{F⁺,S} → 𝒢_{n_i}(R) lifting the 𝒢_{n_i}-extensions of ρ̄_i (Thorne 2015, Definition 3.31). Def^{red}_𝒮 ⊂ Def_𝒮 is a closed subfunctor, represented by a quotient R^{red}_𝒮 = R^univ_𝒮/I^{red}_𝒮 (Proposition 3.32). For d constituents and a partition P of {1, …, d}, the ideal I_P of Allen–Newton–Thorne Proposition 2.5 is the smallest ideal modulo which the universal determinant decomposes according to P; I^{red} is the intersection over the nontrivial two-block partitions, and for a prime 𝔭, r_𝔭 ⊗ Frac(R/𝔭) is absolutely irreducible iff 𝔭 ⊅ I^{red} (Allen–Newton–Thorne, Lemmas 3.4–3.5).

*Hypotheses.* r̄ Schur, r̄|G_{F,S} split with pairwise non-isomorphic constituents.

*Proof outline.*

1. Relative representability of Def^{red} ⊂ Def: for an Artinian diagram A → B ← C a deformation reducible over A ×_B C is reducible over A and C by uniqueness of the decomposition lifting the residual one (Schur).
2. Allen–Newton–Thorne Proposition 2.5 gives I_P for determinants; the Cayley–Hamilton quotient of R^univ[G_{F,S}] is a generalised matrix algebra and reducibility of r_𝔭 is the vanishing of the off-diagonal products modulo 𝔭 (Lemma 3.4).

*Uses.* Allen–Newton–Thorne, Lemma 3.6: the dimension of R/(I^{red}, λ) is bounded using the Steinberg places. Newton–Thorne 2021, Proposition 5.6 and Theorem 5.7: the reducible locus is small, so large quotients contain generic primes. Thorne 2015, Lemma 3.33: dimension-one primes not containing I^{red} have absolutely irreducible specialisations.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.reducibleDeformations` | constructor | Def^{red}_𝒮 ⊂ Def_𝒮. |
| `TauCeti.Automorphy.reducibilityIdeal` | constructor | I^{red}_𝒮 with R^{red}_𝒮 = R^univ_𝒮/I^{red}_𝒮 representing Def^{red}_𝒮. |
| `TauCeti.Automorphy.reducibilityIdeal_partition` | data | For a partition P of the constituents, the ideal I_P of Allen–Newton–Thorne Proposition 2.5. |
| `TauCeti.Automorphy.absIrred_iff_not_le_reducibilityIdeal` | characterisation | For a prime 𝔭, r_𝔭 ⊗ Frac(R/𝔭) is absolutely irreducible iff I^{red} ⊄ 𝔭. |
| `TauCeti.Automorphy.reducibilityIdeal_map` | functoriality | Restriction to a finite extension maps I^{red} into the reducibility ideal of the restricted problem when the constituents stay irreducible and distinct. |

*Unit tests.*

* `red_absIrred` (degenerate): If d = 1 then I^{red} = R^univ_𝒮 and R^{red}_𝒮 = 0.
* `red_two_characters` (computation): For n = 2 and r̄|G_F = χ₁ ⊕ χ₂, the reducible locus is cut out by the ideal generated by the products of the off-diagonal coefficients of the universal Cayley–Hamilton representation.
* `red_split_lift` (characterisation): A lift r = r₁ ⊕ r₂ over R ∈ C_Λ defines a point of R^{red}_𝒮.
* `red_irreducible_point` (non-example): The O_{Q̄_l}-point of R^univ_𝒮 given by a lift r with r|G_F ⊗ Q̄_l absolutely irreducible (for example the Galois representation of a cuspidal π with irreducible r_{l,ι}(π)) does not lie in Spec R^{red}_𝒮.

*Prerequisites.* PL.6/schur-residual-representation (Schur 𝒢_n-valued residual representations); PL.6/polarized-pseudodeformation-subring (The subring P_𝒮 generated by characteristic polynomials); IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton; GlobalGaloisDeformations:G7/polarized-representability.

*Acceptance.* For d = 1, I^{red} = R^univ (no reducible deformations). For n = 2 with r̄|G_F = χ₁ ⊕ χ₂, I^{red} is generated by the products b·c of the off-diagonal entries of the universal generalised matrix algebra.

*Sources.* Tho15 §3.4, Definition 3.31, p. 26; Tho15 §3.4, Proposition 3.32, p. 26; ANT20 §2, Proposition 2.5, p. 6.

### The reducible locus is small in the presence of Steinberg places

`PL.6/reducible-locus-dimension` (theorem)

With 𝒮 a polarized ordinary problem as in Allen–Newton–Thorne §3 (r̄ Schur, ordinary deformation problems D^Δ_v at v | l, Steinberg problems at the places S(B)), d_l = inf_{v∈S_l}[F⁺_v : Q_l] and d₀ = dim_{Q_l} ker(Δ[1/l] → Δ₀[1/l])^{c=−1} (the rank of the subgroup of Δ = Gal(L_{S_l}/F)/(c+1) generated by the Frobenius elements at S(B)), suppose d_l > n(n − 1)/2 + 1. If A ∈ C_Λ is a finite Λ-algebra and r : G_{F⁺,S} → 𝒢_n(A) is a lifting of type 𝒮, then dim A/(I^{red}_𝒮, λ) ≤ n[F⁺ : ℚ] − d₀ (Allen–Newton–Thorne, Lemma 3.6).

*Hypotheses.* d_l > n(n − 1)/2 + 1; A a finite Λ-algebra; Steinberg conditions at S(B).

*Proof outline.*

1. Reduce to A integral with r = r₁ ⊕ r₂ (Lemma 3.5). Thorne 2015 Corollary 3.12 (the A-points of D^Δ_v, LocalGaloisDeformationRings L7/ordinary-flag-scheme) gives filtrations on r_i|G_{F_ṽ} and an identification Λ ≅ Λ₁ ⊗̂ Λ₂ through which A is a Λ_i-algebra.
2. The determinants χ_i of r_i give a map Λ₀ ⊗̂ Λ₀ → k⟦Δ/(c+1)⟧ ⊗̂ k⟦Δ/(c+1)⟧ → A; the Steinberg condition at v ∈ S(B) forces χ₁(Frob_ṽ)^{n₂} = χ₂(Frob_ṽ)^{n₁}, so the map factors through a quotient of dimension n[F⁺ : ℚ] − d₀; finiteness of A over Λ transfers the bound.

*Prerequisites.* PL.6/reducibility-ideal (Reducible deformations and the ideal of reducibility); LocalGaloisDeformationRings:L7/ordinary-flag-scheme; LocalGaloisDeformationRings:L8/ordinary-coefficient-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition.

*Acceptance.* With S(B) = ∅ (d₀ = 0) the bound is the trivial dim Λ/λ = n[F⁺ : ℚ]. Newton–Thorne 2021 Proposition 5.6 is the analogue with the level-raising data at R.

*Sources.* ANT20 §3, Lemma 3.6, p. 11.

### Generic primes of an ordinary deformation ring

`PL.6/generic-prime` (definition) — planet: *Generic prime*

Let 𝒮 be a polarized ordinary deformation problem over Λ, A ∈ C_Λ and r : G_{F⁺,S} → 𝒢_n(A) of type 𝒮, with universal characters ψ^v_1, …, ψ^v_n : I^{ab}_{F_ṽ}(l) → A^× at v ∈ S_l (through Λ_v, LocalGaloisDeformationRings L8/ordinary-coefficient-ring). r is generic at l if for each v ∈ S_l the ψ^v_i are pairwise distinct, and for some v ∈ S_l and σ ∈ I^{ab}_{F_ṽ}(l) the elements ψ^v_1(σ), …, ψ^v_n(σ) ∈ A^× satisfy no nontrivial ℤ-linear relation (Allen–Newton–Thorne, Definition 3.7). A prime 𝔭 ⊂ R^univ_𝒮 of dimension one and characteristic l is generic if r_𝔭 = r mod 𝔭 is generic at l and r_𝔭|G_{F,S} ⊗ Frac(R/𝔭) is absolutely irreducible (Newton–Thorne 2021 §5; Newton–Thorne 2026, Proposition 3.10).

*Hypotheses.* 𝒮 ordinary over Λ; 𝔭 of dimension one and characteristic l.

*Proof outline.*

1. The universal characters are the pushforwards of χ_i^univ along Λ_v → Λ → A.
2. 'No nontrivial ℤ-linear relation' means ∏_i ψ^v_i(σ)^{a_i} = 1 with a ∈ ℤⁿ forces a = 0.

*Uses.* Allen–Newton–Thorne, Theorem 4.1(2): the hypothesis on the prime 𝔭 in the generic R_𝔭 = T_𝔭 theorem. Newton–Thorne 2021, Theorem 5.7; Newton–Thorne 2026, Propositions 3.10–3.13: existence of generic primes in large quotients and pullback under base change.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsGenericAtL` | constructor | The two conditions on the universal characters ψ^v_i of r. |
| `TauCeti.Automorphy.IsGenericPrime` | constructor | 𝔭 of dimension one and characteristic l with r_𝔭 generic at l and r_𝔭∣G_{F,S} ⊗ Frac absolutely irreducible. |
| `TauCeti.Automorphy.IsGenericAtL.distinct` | projection | The universal characters at each v ∈ S_l are pairwise distinct modulo 𝔭. |
| `TauCeti.Automorphy.IsGenericPrime.restrict` | functoriality | Genericity pulls back along restriction to soluble CM extensions in which the places above l split (Thorne 2015, Proposition 5.3; PL.6/genericity-under-restriction). |
| `TauCeti.Automorphy.nonGenericIdeals` | data | The countable family of ideals I_i ⊂ Λ/(λ) with dim Λ/I_i ≤ n[F⁺ : ℚ] − d_l containing every non-generic point (Allen–Newton–Thorne, Lemma 3.8). |

*Unit tests.*

* `generic_rank_one` (degenerate): For n = 1 the distinctness condition is empty and r is generic at l iff ψ^v_1(σ) has infinite order for some v and σ.
* `generic_example` (computation): For n = 2, A = k⟦T₁, T₂⟧ and characters with ψ₁(σ) = 1 + T₁ and ψ₂(σ) = 1 + T₂ at σ ∈ I^{ab}_{F_ṽ}(l), the values are distinct and multiplicatively independent (no nontrivial relation (1 + T₁)^a(1 + T₂)^b = 1), so r is generic at l when the characters are also distinct at the other places above l. By contrast ψ₂(σ) = 1 is a nontrivial relation and would violate genericity.
* `not_generic_equal_characters` (non-example): If ψ^v_1 = ψ^v_2 modulo 𝔭 for some v, r_𝔭 is not generic at l.
* `not_generic_torsion` (non-example): If every ψ^v_i(σ) is a root of unity (e.g. at an arithmetic point specialising to finite-order characters), r_𝔭 is not generic.

*Prerequisites.* LocalGaloisDeformationRings:L8/ordinary-coefficient-ring; LocalGaloisDeformationRings:L7/ordinary-flag-scheme; PL.6/reducibility-ideal (Reducible deformations and the ideal of reducibility).

*Acceptance.* A characteristic-zero point (dimension one, characteristic 0) is never generic in this sense; genericity is a characteristic-l notion used to propagate R = T. Genericity is a property of primes of dimension one: the maximal ideal and the minimal primes are never generic primes.

*Sources.* ANT20 §3, Definition 3.7, p. 12; NT26 §3, Proposition 3.10, arXiv v2 p. 27.

### Large quotients contain generic primes

`PL.6/large-quotients-contain-generic-primes` (theorem)

(1) (Allen–Newton–Thorne, Lemma 3.8) There is a countable family of ideals I_i ⊂ Λ/(λ) with dim Λ/I_i ≤ n[F⁺ : ℚ] − d_l such that every lifting of type 𝒮 over A ∈ C_Λ that is not generic at l is killed by some I_i. (2) (Thorne 2015, Lemma 1.9) If R ∈ C_k has dimension d ≥ 1 and I₁, I₂, … are countably many ideals with dim R/I_i ≤ d − 1, there is a dimension-one prime of R containing none of the I_i. (3) (Allen–Newton–Thorne, Lemma 3.9) If d_l > n(n − 1)/2 + 1, A ∈ C_Λ is a finite Λ-algebra with dim A/(λ) > sup(n[F⁺ : ℚ] − d₀, n[F⁺ : ℚ] − d_l) and r : G_{F⁺,S} → 𝒢_n(A) is of type 𝒮, then A has a prime 𝔭 of dimension one and characteristic l with r_𝔭 generic (Newton–Thorne 2026 uses it in the form: if R_𝒮 is finite over Λ and I ⊂ R_𝒮/(ϖ) has dim R_𝒮/(ϖ, I) > max(n[F : ℚ] − d₀, {n[F : ℚ] − [F_v : Q_p]}_{v|p}), then I lies in a generic prime of dimension one and characteristic p).

*Hypotheses.* d_l > n(n − 1)/2 + 1 for (3); A finite over Λ.

*Proof outline.*

1. (1) For v ∈ S_l take σ_{v,1}, …, σ_{v,d_v} projecting to a ℤ_l-basis of the torsion-free quotient of I^{ab}_{F_ṽ}(l); the ideals (λ, ψ^v_i(σ_{v,k}) − ψ^v_j(σ_{v,k}))_k and (λ, ∏_i ψ^v_i(σ_{v,j})^{A_{v,i,j}} − 1)_{v,j} for integer matrices A_v have the stated dimensions.
2. (2) Noether normalisation k⟦x₁, …, x_d⟧ ↪ R reduces to R a power series ring and I_i principal; uncountably many pairwise non-associate primes of height d − 1 exist, so one avoids all I_i.
3. (3) Combine (1), (2) and PL.6/reducible-locus-dimension: the bad ideals have dimension at most the two suprema, which are smaller than dim A/(λ).

*Prerequisites.* PL.6/generic-prime (Generic primes of an ordinary deformation ring); PL.6/reducible-locus-dimension (The reducible locus is small in the presence of Steinberg places); mathlib:ringKrullDim.

*Acceptance.* Newton–Thorne 2021 Theorem 5.7 and Newton–Thorne 2026 Proposition 3.10 are applications.

*Sources.* ANT20 §3, Lemma 3.9, p. 12; Tho15 §1, Lemma 1.9, p. 7; ANT20 §3, Lemma 3.8, p. 12.

### Absolute irreducibility at a generic prime survives restriction

`PL.6/genericity-under-restriction` (theorem)

Let l > 3, A = k⟦T⟧ with fraction field E, and r : G_{F⁺,S} → 𝒢_n(A) such that (1) r|G_{F,S} ⊗_A E is absolutely irreducible; (2) ζ_l ∉ F, r̄|G_{F⁺(ζ_l)} is Schur and r̄|G_F is primitive; (3) r̄(G_{F(ζ_l)}) has no nontrivial quotient of l-power order; (4) some σ₀ ∈ G_{F,S} has r(σ₀) regular semisimple with eigenvalues in A^× satisfying no nontrivial ℤ-linear relation; (5) l ∤ n; (6) µ = ν ∘ r has µ(c) = −1. Then for every open subgroup N ⊂ Δ = G_F, r|N ⊗ E is absolutely irreducible (Thorne 2015, Proposition 5.3; condition (4) is supplied by genericity at l, PL.6/generic-prime, and primitivity is essential, since an induced representation restricts reducibly). Consequently the pullback of a generic prime of R^univ_{𝒮′_{F₁}} to R^univ_{𝒮′_{F₂}} along restriction to a finite soluble extension F₂/F₁ (with the places above l split) is generic (Newton–Thorne 2026 §3).

*Hypotheses.* l > 3, A = k⟦T⟧; r|G_{F,S} ⊗ E absolutely irreducible; ζ_l ∉ F, r̄|G_{F⁺(ζ_l)} Schur, r̄|G_F primitive; r̄(G_{F(ζ_l)}) without l-power quotients; σ₀ with regular semisimple image and ℤ-independent eigenvalues; l ∤ n, µ(c) = −1; N ⊂ Δ open.

*Proof outline.*

1. Suppose not; shrink N to be normal. Some power σ₀^a of an element with ℤ-independent eigenvalues lies in N, so r|N ⊗ E is multiplicity-free; Clifford theory writes r|Δ ⊗ Ē ≅ Ind_{N′}^{Δ} ρ′ for a proper N′ ⊃ N.
2. The eigenvalues of σ₀ (the values ψ^v_i(σ₀)) are then permuted by Δ/N′ with relations among them, contradicting genericity.

*Prerequisites.* PL.6/generic-prime (Generic primes of an ordinary deformation ring); ArithmeticGaloisRepresentations:G7/tensor-induction.

*Acceptance.* Used to pass generic primes through the soluble base changes in Allen–Newton–Thorne §5 and Newton–Thorne 2026 §3.

*Sources.* Tho15 §5.1, Proposition 5.3, p. 58.

### Twisting and soluble base change for residually reducible rings and Hecke algebras

`PL.6/reducible-twisting-and-base-change` (theorem)

(1) (Thorne 2015, Lemma 3.36) For l ∤ n there is a canonical isomorphism R^univ_𝒮 ≅ R^univ_{𝒮,ψ₀} ⊗̂_O O⟦Δ/(c + 1)⟧, where R^univ_{𝒮,ψ₀} has fixed determinant ψ₀ and Δ = Gal(L_{S_l}/F) as in PL.6/reducible-locus-dimension. (2) (Lemma 3.38) For a dimension-one prime 𝔭 and its twist 𝔭_ψ by a character ψ of Δ/(c+1): a minimal prime Q lies in 𝔭 iff it lies in 𝔭_ψ, and ψ can be chosen with Frac(P_𝒮/𝔮_ψ) = Frac(R^univ_𝒮/𝔭_ψ). (Lemma 3.40) If moreover the ψ^v_i mod 𝔭 are pairwise distinct at v ∈ S_l, r_𝔭 is unramified with scalar Frobenius at S(B) and trivial at R, the irreducible components of the patched ring localised and completed at 𝔭 correspond to those of Λ (the input of Newton–Thorne 2026, Proposition 3.13). (3) (Proposition 4.18, Corollary 4.14) For a soluble CM extension M/L in which the places of S split, restriction gives a commutative diagram R^univ_{𝒮_χ} ← P_{𝒮_χ} → T_χ(U(l^∞), O)_m over R^univ_{𝒮_{χ,M}} ← P_{𝒮_{χ,M}} → T_{χ_M}(U_M(l^∞), O)_{m_M} of Λ_M-algebras, finite in the vertical direction.

*Hypotheses.* l ∤ n for (1); the local conditions of Thorne 2015 §3.3.

*Proof outline.*

1. (1) Twisting the universal deformation by the universal character of Δ/(c+1) with values in O⟦Δ/(c+1)⟧ is an isomorphism of functors because l ∤ n allows extracting n-th roots of characters of l-power order (GlobalGaloisDeformations R04.4/change-of-determinant).
2. (2) Lemma 3.38 uses the decomposition of (1): twisting by ψ moves 𝔭 within the fibre over P_𝒮 without changing which minimal primes it contains, and a suitable ψ makes the residue fields agree (Proposition 3.29, PL.6/polarized-pseudodeformation-subring). Lemma 3.40 controls the components through the local rings at R ∪ S(B) ∪ S_l under the stated conditions.
3. (3) Base change of the Hecke side is Labesse base change at the level of Hecke algebras (PL.2/unitary-base-change-and-descent (3)); compatibility with P is by characteristic polynomials.

*Prerequisites.* PL.6/polarized-pseudodeformation-subring (The subring P_𝒮 generated by characteristic polynomials); PL.6/generic-prime (Generic primes of an ordinary deformation ring); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.2/big-ordinary-hecke-algebra (The big ordinary Hecke algebra over Λ); GlobalGaloisDeformations:R04.4/change-of-determinant; GlobalGaloisDeformations:R04.4/restriction-finiteness.

*Acceptance.* Clozel–Thorne 2017, Lemma 5.3: R_{S_i} ≅ R_{S_i,ψ_i} ⊗̂ O⟦Δ/(c+1)⟧ for l ∤ n_i. Newton–Thorne 2026, Proposition 3.13 uses the scalar twist of (2).

*Sources.* Tho15 §3.5, Lemma 3.36, p. 28; Tho15 §3.5, Lemma 3.38(2), p. 30; Tho15 §3.5, Lemma 3.40, p. 31; Tho15 §4, Proposition 4.18, p. 44.

### The generic R_𝔭 = T_𝔭 theorem

`PL.6/generic-prime-r-equals-t` (theorem) — planet: *Generic R = T theorem*

Let 𝒮₁ be the ordinary polarized problem over Λ of Allen–Newton–Thorne §4 (L imaginary CM, R the Ihara-avoidance places with trivial characters, S(B) the Steinberg places, Λ-adic ordinary conditions at S_l), m a maximal ideal of the big ordinary Hecke algebra with Schur r̄_m, J_{𝒮₁} = ker(P_{𝒮₁} → T_m) the kernel of the map from the characteristic-polynomial subring P_{𝒮₁} ⊂ R^univ_{𝒮₁} (PL.6/polarized-pseudodeformation-subring; there is no map from R^univ itself to T_m in the residually reducible case), and 𝔭 ⊂ R^univ_{𝒮₁} a prime of dimension one and characteristic l such that (1) J_{𝒮₁}R^univ_{𝒮₁} ⊂ 𝔭; (2) r_𝔭 is generic (PL.6/generic-prime); (3) r_𝔭|G_{L_ṽ} is trivial for v ∈ R with l^N > n when l^N ∥ q_v − 1, and r_𝔭|G_{L_ṽ} is unramified with scalar Frobenius for v ∈ S(B); (4) r̄_m|G_{L,S} is primitive; (5) ζ_l ∉ L, r̄_m|G_{L⁺(ζ_l)} is Schur and r̄_m(G_{L,S}) has no quotient of order l; (6) l > 3 and l ∤ n. Then every prime Q ⊂ R^univ_{𝒮₁} with Q ⊂ 𝔭 contains J_{𝒮₁}R^univ_{𝒮₁} (Allen–Newton–Thorne, Theorem 4.1, where J_{𝒮_χ} = ker(P_{𝒮_χ} → T_χ(U(l^∞), O)_m); for two constituents Thorne 2015, Theorem 4.19 (P̃ → T̃ has nilpotent kernel after localisation and completion at 𝔮) and Corollary 4.20 (J_{𝒮₁}R^univ_{𝒮₁} ⊂ Q for minimal Q ⊂ 𝔭)).

*Hypotheses.* 𝔭 generic of dimension one and characteristic l containing J·R^univ, J = ker(P_{𝒮₁} → T_m); the local conditions (3); r̄_m primitive, Schur over L⁺(ζ_l), no quotient of order l, ζ_l ∉ L, l > 3, l ∤ n.

*Proof outline.*

1. Twist so that Frac(R/𝔭) = Frac(P/𝔮) (Thorne 2015 Lemma 3.38 with Corollary 4.14; PL.6/reducible-twisting-and-base-change (2)).
2. Taylor–Wiles data for the generic r_𝔭 (Thorne 2015, Corollary 5.7, under the hypotheses (4)–(6): the image of r_𝔭 is large enough to kill the dual Selmer group of ad r_𝔭 ⊗ E/A, via PL.6/genericity-under-restriction and Lemma 5.6).
3. Patch the P-algebras and Hecke modules localised and completed at 𝔭, 𝔮 with Taylor's variation of characters χ at R (Thorne 2015 Theorem 4.19 hypotheses 1–5), using that the local rings R^Δ_v are irreducible over Λ_v at generic points and the Steinberg rings are geometrically integral (LocalGaloisDeformationRings L7/trivial-residual-flag-ring, R08.2/steinberg-condition); conclude that P̃_{𝒮₁,𝔮} → T̃_{1,𝔮} has nilpotent kernel, hence that J_{𝒮₁}R̃^univ_{𝒮₁,𝔭} is nilpotent, so it lies in every minimal prime below 𝔭.
4. For d constituents replace the µ₂² action by µ₂^d (Allen–Newton–Thorne, proof of Theorem 4.1).

*Prerequisites.* PL.6/generic-prime (Generic primes of an ordinary deformation ring); PL.6/polarized-pseudodeformation-subring (The subring P_𝒮 generated by characteristic polynomials); PL.6/reducible-twisting-and-base-change (Twisting and soluble base change for residually reducible rings and Hecke algebras); PL.6/genericity-under-restriction (Absolute irreducibility at a generic prime survives restriction); PL.6/schur-residual-representation (Schur 𝒢_n-valued residual representations); PL.6/primitive-representation (Primitive representations); PL.2/big-ordinary-hecke-algebra (The big ordinary Hecke algebra over Λ); PL.2/ordinary-hecke-galois-representation (The Λ-adic Galois representation on the big ordinary Hecke algebra); PL.3/thorne-taylor-wiles-datum (Taylor–Wiles data with a residual eigenspace); LocalGaloisDeformationRings:L7/trivial-residual-flag-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; DeformationAndDerivedPatchingAlgebra:R03.5; DeformationAndDerivedPatchingAlgebra:R03.6/r-to-t-kernel-nilpotent.

*Acceptance.* Newton–Thorne 2026, Proposition 3.13: with trivial restriction at R, a generic prime containing J·R forces every prime inside it to contain J·R, so the components of the localized completed ring correspond to those of Λ. Clozel–Thorne 2017, Theorem 5.1: uses Theorem 4.19 with hypothesis (1) supplied by Thorne 2015 Corollary 5.7.

*Sources.* ANT20 §4, Theorem 4.1, p. 14; Tho15 §4, Theorem 4.19, p. 47; Tho15 §4, Corollary 4.20, p. 48.

## PL.7. Residually reducible automorphy lifting

**Theorems.** Finiteness over Λ of ordinary, locally Steinberg deformation rings of a Schur residual representation (Allen–Newton–Thorne, Theorem 6.2, with the weakening of Thorne 2024, Theorem 7.5, used by Newton–Thorne 2026); automorphy lifting for ordinary conjugate self-dual ρ with ρ̄^ss a sum of pairwise distinct absolutely irreducible conjugate self-dual constituents, primitive, with a Steinberg place and an ι-ordinary RACSDC seed (Allen–Newton–Thorne, Theorem 1.1 = 6.1; Thorne 2015, Theorem 7.1 for two adequate constituents); Newton–Thorne 2021 §5: finiteness of ordinary deformation rings of sums of characters (Theorem 5.2), ordinary lifts of every weight (Corollary 5.4, with source issue E15), the dimension bound of Corollary 5.5, smallness of the reducible locus (Proposition 5.6), generic primes in large quotients (Theorem 5.7), and automorphic lifts of prescribed type from residual automorphy over a soluble extension (Proposition 5.8, with Bellovin–Gee's Corollary 5.1.1 in the Schur form).

**Depends on.** Within this roadmap: PL.0, PL.2, PL.4, PL.5, PL.6. Other roadmaps: ArithmeticGaloisRepresentations:G7, GlobalGaloisDeformations:G7, GlobalGaloisDeformations:R04.4, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:L8, LocalGaloisDeformationRings:R08.2, LocalGaloisDeformationRings:R08.3.

### Finiteness of ordinary locally Steinberg deformation rings

`PL.7/ordinary-steinberg-finiteness` (theorem) — planet: *Finiteness of locally Steinberg rings*

Let F be a CM field, l a prime, ι : Q̄_l ≅ ℂ, S a finite set of finite places of F⁺ containing those above l, all split in F, and π a RACSDC representation of GL_n(𝔸_F) with r_ι(π) valued in GL_n(O), extended to r : G_{F⁺} → 𝒢_n(O) with ν ∘ r = ε^{1−n}δ^n_{F/F⁺}. Assume (1) π is ι-ordinary and r|G_{F_ṽ} is trivial for v ∈ S_l; (2) π is unramified outside S; (3) there is v₀ ∈ S, v₀ ∤ l, with π_{ṽ₀} an unramified twist of Steinberg, q_{v₀} ≡ 1 mod l and r̄|G_{F_{ṽ₀}} trivial; (4) ρ̄ = r̄|G_{F,S} has ρ̄^ss ≅ ρ̄₁ ⊕ ⋯ ⊕ ρ̄_d with ρ̄_i absolutely irreducible and ρ̄_i^c ≅ ρ̄_i^∨ε̄^{1−n}; (5) F(ζ_l) ⊄ F̄^{ker ad ρ̄^ss}, F ⊄ F⁺(ζ_l), the ρ̄_i|G_{F(ζ_l)} absolutely irreducible and pairwise non-isomorphic, ρ̄ primitive with no quotient of order l; (6) l > 3, l ∤ n. For 𝒮 = (F/F⁺, S, S̃, Λ, r̄, ε^{1−n}δ^n, {R^Δ_v}_{v∈S_l} ∪ {R^□_v}_{v∈S−(S_l∪{v₀})} ∪ {R^St_{v₀}}), R^univ_𝒮 is a finite Λ-algebra (Allen–Newton–Thorne, Theorem 6.2). Newton–Thorne 2026 use it with the condition F(ζ_l) ⊄ F̄^{ker ad s̄} weakened as in Thorne 2024, Theorem 7.5.

*Hypotheses.* π ι-ordinary RACSDC, Steinberg at v₀; ρ̄^ss a sum of pairwise distinct absolutely irreducible conjugate self-dual constituents, primitive; l > 3, l ∤ n.

*Proof outline.*

1. Choose a soluble CM L/F (PL.0/auxiliary-cm-extensions) linearly disjoint from the relevant fields, over which the level and splitting conditions of Allen–Newton–Thorne §4 hold; R^univ_𝒮 is finite over R^univ_{𝒮_L} by PL.6/pseudodeformation-restriction-finite and PL.6/polarized-pseudodeformation-subring.
2. Allen–Newton–Thorne Theorem 5.1: every lift of type 𝒮_L that is ordinary of weight λ is automorphic; with Corollary 5.4, R_{𝒮_L} is finite over Λ — via the connectedness dimension argument: the patched ring is connected in codimension ≥ the bound of PL.6/connectedness-dimension, every component meets an automorphic component in a generic prime of the large Steinberg-controlled locus (PL.6/reducible-locus-dimension, PL.6/large-quotients-contain-generic-primes), and PL.6/generic-prime-r-equals-t propagates J ⊂ Q across it.
3. Descend finiteness to F.

*Prerequisites.* PL.6/generic-prime-r-equals-t (The generic R_𝔭 = T_𝔭 theorem); PL.6/connectedness-dimension (Connectedness dimension and arithmetic rank); PL.6/reducible-locus-dimension (The reducible locus is small in the presence of Steinberg places); PL.6/large-quotients-contain-generic-primes (Large quotients contain generic primes); PL.6/pseudodeformation-restriction-finite (Restriction of pseudodeformations to a finite-index subgroup is finite); PL.6/polarized-pseudodeformation-subring (The subring P_𝒮 generated by characteristic polynomials); PL.6/primitive-representation (Primitive representations); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); PL.0/iota-ordinary (ι-ordinary automorphic representations); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); LocalGaloisDeformationRings:R08.2/steinberg-condition.

*Acceptance.* Newton–Thorne 2021 Theorem 5.2 obtains finiteness of R_{𝒮_Σ} by comparing with the G_{2n}-problem to which this theorem applies. Newton–Thorne 2026 Proposition 3.9 applies the weakened form to the Steinberg-type problem of a residually reducible s̄.

*Sources.* ANT20 §6, Theorem 6.2, pp. 19–20; NT26 §3, proof of Proposition 3.9, arXiv v2 p. 27.

### Automorphy lifting for residually reducible representations

`PL.7/residually-reducible-automorphy-lifting` (theorem) — planet: *Residually reducible automorphy lifting*

Let F be imaginary CM, n ≥ 2, l a prime and ρ : G_F → GL_n(Q̄_l) continuous semisimple with (1) ρ^c ≅ ρ^∨ε^{1−n}; (2) ρ ramified at finitely many places; (3) ρ ordinary of weight λ; (4) ρ̄^ss ≅ ρ̄₁ ⊕ ⋯ ⊕ ρ̄_d with ρ̄_i absolutely irreducible, ρ̄_i^c ≅ ρ̄_i^∨ε^{1−n} and ρ̄_i ≇ ρ̄_j for i ≠ j; (5) a finite place ṽ₀ ∤ l with ρ|^ss_{G_{F_{ṽ₀}}} ≅ ⊕_{i=1}^n ψε^{n−i}, ψ unramified; (6) an ι-ordinary RACSDC π with r̄_ι(π)^ss ≅ ρ̄^ss and π_{ṽ₀} an unramified twist of Steinberg; (7) F(ζ_l) ⊄ F̄^{ker ad ρ̄^ss}, F ⊄ F⁺(ζ_l), each ρ̄_i|G_{F(ζ_l)} absolutely irreducible and pairwise non-isomorphic, ρ̄^ss primitive and ρ̄^ss(G_F) without quotients of order l; (8) l > 3 and l ∤ n. Then ρ ≅ r_ι(Π) for an ι-ordinary RACSDC Π (Allen–Newton–Thorne, Theorem 1.1 = Theorem 6.1).

*Hypotheses.* ρ ordinary, conjugate self-dual, residually multiplicity free with d constituents; Steinberg place ṽ₀ and ι-ordinary RACSDC seed; (7) and l > 3, l ∤ n.

*Proof outline.*

1. Base change to L/F soluble (PL.0/soluble-descent, PL.0/auxiliary-cm-extensions) to reach the set-up of Allen–Newton–Thorne §5, with ρ trivial at the places above l, R and the Steinberg place, and a 'good extension' M/L (Lemma 5.2) preserving primitivity and the Schur property.
2. Theorem 5.1: R^univ_{𝒮₁} → T_m has nilpotent kernel. Every minimal prime of R^univ is of dimension dim Λ (Thorne 2015 Propositions 3.9, 3.14); the reducible locus has small dimension (PL.6/reducible-locus-dimension); by the connectedness dimension bound (PL.6/connectedness-dimension) any two components meet in a locus of large dimension, which contains a generic prime (PL.6/large-quotients-contain-generic-primes), and PL.6/generic-prime-r-equals-t propagates J ⊂ Q from an automorphic component to all.
3. Hence ρ (a point of R^univ_{𝒮₁}) factors through T_m and is automorphic by PL.2/unitary-base-change-and-descent (2); descend by PL.0/soluble-descent (ρ is irreducible or a sum handled by Thorne 2015 Lemma 2.7 conventions).

*Prerequisites.* PL.7/ordinary-steinberg-finiteness (Finiteness of ordinary locally Steinberg deformation rings); PL.6/generic-prime-r-equals-t (The generic R_𝔭 = T_𝔭 theorem); PL.6/connectedness-dimension (Connectedness dimension and arithmetic rank); PL.6/reducible-locus-dimension (The reducible locus is small in the presence of Steinberg places); PL.6/large-quotients-contain-generic-primes (Large quotients contain generic primes); PL.6/primitive-representation (Primitive representations); PL.6/schur-residual-representation (Schur 𝒢_n-valued residual representations); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.0/auxiliary-cm-extensions (Soluble and cyclic CM extensions with prescribed local behaviour); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); PL.0/iota-ordinary (ι-ordinary automorphic representations); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n).

*Acceptance.* Fakhruddin–Khare–Patrikis, Proposition 9.1: applied over L′ = LF′ with hypotheses (1)–(8); their verification of (7) for several constituents is incomplete (their source issue E32). Newton–Thorne 2021, Theorems 5.2, 6.1 and Proposition 5.8 use Theorems 1.1, 6.1, 6.2 and 4.1.

*Sources.* ANT20 §1, Theorem 1.1 (Theorem 6.1), p. 2.

### Thorne's automorphy lifting for two adequate constituents

`PL.7/two-constituent-automorphy-lifting` (theorem)

Let l > 3, F imaginary CM, n ≥ 2 and ρ : G_F → GL_n(K) continuous semisimple with (1) ρ^c ≅ ρ^∨ε^{1−n}; (2) ρ ramified at finitely many places; (3) ρ ordinary of weight λ; (4) F(ζ_l) ⊄ F̄^{ker ad(ρ̄^ss)}; (5) ρ̄^ss ≅ ρ̄₁ ⊕ ρ̄₂ with ρ̄_i|G_{F(ζ_l)} adequate (Thorne 2012), ρ̄^ss primitive and l ∤ n; (6) ρ̄₁ ≇ ρ̄₂ and ε^{1−n}ρ̄₁^∨ ≇ ρ̄₂^c; (7) a finite place ṽ₀ ∤ l with ρ|^ss_{G_{F_{ṽ₀}}} ≅ ⊕_{i=1}^n ψε^{n−i}, ψ unramified; (8) an ι-ordinary RACSDC π with r_ι(π)^ss ≅ ρ̄^ss (residually) and π_{ṽ₀} an unramified twist of Steinberg; (9) a CM extension F₀/F linearly disjoint from the field cut out by ρ̄^ss|G_{F(ζ_l)} and ι-ordinary RAECSDC (π_i, χ_i) on GL_{n_i}(𝔸_{F₀}) with r̄_ι(π_i) ≅ ρ̄_i|G_{F₀} (residual potential automorphy of the constituents). Then ρ is automorphic (Thorne 2015, Theorem 7.1).

*Hypotheses.* two adequate constituents, primitive, l > 3, l ∤ n; Steinberg place and ι-ordinary seed; potential automorphy of the constituents (9).

*Proof outline.*

1. Choose self-dual lattices and pass to the set-up of Thorne 2015 §4.6 by soluble base change.
2. Assumption (9) with the Khare–Wintenberger method controls the dimension of the rings of the constituents, hence of the reducible locus (Thorne 2015 Propositions 3.37, 4.17); Theorem 4.19 (PL.6/generic-prime-r-equals-t) and Corollary 4.20 then give R = T on every component.

*Prerequisites.* PL.6/generic-prime-r-equals-t (The generic R_𝔭 = T_𝔭 theorem); PL.6/reducible-twisting-and-base-change (Twisting and soluble base change for residually reducible rings and Hecke algebras); PL.6/schur-residual-representation (Schur 𝒢_n-valued residual representations); PL.6/primitive-representation (Primitive representations); PL.4/characteristic-zero-lifts (Characteristic-zero lifts from finiteness and the dimension bound); PL.0/soluble-descent (Soluble base change and descent of automorphy); ArithmeticGaloisRepresentations:G7/adequate-subgroup.

*Acceptance.* Allen–Newton–Thorne Theorem 1.1 removes the adequacy and potential automorphy assumptions on the constituents and allows d constituents. Clozel–Thorne 2017 use it (with Theorem 4.19) for Lemmas 5.3–5.6 and Theorem 5.1.

*Sources.* Tho15 §7, Theorem 7.1, p. 66.

### Finiteness of ordinary deformation rings of sums of characters

`PL.7/sum-of-characters-finiteness` (theorem)

In the set-up of Newton–Thorne 2021 §5 (F imaginary CM, r̄ : G_{F⁺,S} → 𝒢_n(k) with r̄|G_F = χ₁ ⊕ ⋯ ⊕ χ_n, multiplier ε^{1−n}µ, Σ a set of Steinberg places, 𝒮_Σ the ordinary problem with Steinberg conditions at Σ), assume (1) p > 2n; (2) for 1 ≤ i < j ≤ n, χ_i/χ_j|G_{F(ζ_p)} has order greater than 2n (so r̄ is Schur); (3) [F(ζ_p) : F] = p − 1; (4) Σ ≠ ∅. Then R_{𝒮_Σ} is a finite Λ-algebra (Newton–Thorne 2021, Theorem 5.2).

*Hypotheses.* p > 2n; χ_i/χ_j|G_{F(ζ_p)} of order > 2n; [F(ζ_p) : F] = p − 1; Σ ≠ ∅.

*Proof outline.*

1. Choose ψ : G_F → k^× with ψψ^c = ε^{1−2n}µ^{−1}|G_F, unramified at S ∪ Σ, with q | #(ψ/ψ^c)(I_{F_{v_q}}) at an auxiliary place (PL.0/auxiliary-characters), and form r̄₂ = (I(r̄ ⊗ (ψ, ε^{1−2n}µ^{−1}δ)))^∧ : G_{F⁺} → 𝒢_{2n}(k), primitive (PL.6/character-sums-primitive) and multiplicity free (ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group, the operations I and induction).
2. Potential automorphy (PL.5/dwork-potential-ordinary-automorphy, with the condition t(P) < 0 at Σ) gives an ι-ordinary π Steinberg at Σ over a field L; PL.7/ordinary-steinberg-finiteness makes R_{𝒮′} finite over Λ_{L,2n}.
3. Transfer finiteness to R_{𝒮_Σ} through the pseudocharacter rings (PL.6/polarized-pseudodeformation-subring, Allen–Newton–Thorne Proposition 2.5) and PL.6/pseudodeformation-restriction-finite.

*Prerequisites.* PL.7/ordinary-steinberg-finiteness (Finiteness of ordinary locally Steinberg deformation rings); PL.5/dwork-potential-ordinary-automorphy (Potential ordinary automorphy of symplectic mod l representations); PL.6/character-sums-primitive (Sums of characters with large ratios are primitive); PL.6/polarized-pseudodeformation-subring (The subring P_𝒮 generated by characteristic polynomials); PL.6/pseudodeformation-restriction-finite (Restriction of pseudodeformations to a finite-index subgroup is finite); PL.0/auxiliary-characters (Algebraic characters with prescribed conjugate-norm and local behaviour); ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group.

*Acceptance.* The Newton–Thorne 2021 extraction places their Theorem 5.2 here; ModularityAndLanglandsExtensions ML.3 imports it (the restructure note of this packet).

*Sources.* NT21 §5, Theorem 5.2, p. 73.

### Ordinary lifts of every weight

`PL.7/ordinary-lifts-every-weight` (theorem)

Under the hypotheses of PL.7/sum-of-characters-finiteness, let λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_p)} with λ_{τc,i} = −λ_{τ,n+1−i}, and suppose [F_ṽ : Q_p] > n(n − 1)/2 + 1 for v ∈ S_p. Then there is r : G_{F⁺,S∪Σ} → 𝒢_n(ℤ̄_p) lifting r̄, of Steinberg type at Σ, with r|G_{F,S∪Σ} ordinary of weight λ (Newton–Thorne 2021, Corollary 5.4, corrected: the printed G_{F⁺,S} should be G_{F⁺,S∪Σ}, source issue E4).

*Hypotheses.* hypotheses of Theorem 5.2; λ_{τc,i} = −λ_{τ,n+1−i}; [F_ṽ : Q_p] > n(n − 1)/2 + 1.

*Proof outline.*

1. Every minimal prime Q of R_{𝒮_Σ} has dim R_{𝒮_Σ}/Q = dim Λ (Thorne 2015 Propositions 3.9, 3.14; LocalGaloisDeformationRings L7/trivial-residual-flag-ring), so Λ/Q_Λ → R_{𝒮_Σ}/Q is finite injective for a minimal prime Q_Λ of Λ (PL.7/sum-of-characters-finiteness).
2. Choose a prime of R_{𝒮_Σ}/Q[1/p] above the maximal ideal of Λ/Q_Λ[1/p] of weight λ (Geraghty Definition 2.24).

*Prerequisites.* PL.7/sum-of-characters-finiteness (Finiteness of ordinary deformation rings of sums of characters); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); LocalGaloisDeformationRings:L7/trivial-residual-flag-ring; LocalGaloisDeformationRings:L8/ordinary-coefficient-ring.

*Acceptance.* The corollary is not used elsewhere in Newton–Thorne 2021.

*Sources.* NT21 §5, Corollary 5.4, p. 76.

### A dimension bound for the ring without Steinberg conditions

`PL.7/unrestricted-ring-dimension-bound` (theorem)

Under hypotheses (1)–(3) of PL.7/sum-of-characters-finiteness, let v₀ ∉ S be split in F with q_{v₀} ≡ 1 mod p and r̄|G_{F_{ṽ₀}} trivial. Then A = R_{𝒮_∅}/(ϖ, {tr r_{𝒮_∅}(Frob^i_{ṽ₀}) − n}_{i=1,…,n}) is a finite Λ-algebra, and dim R_{𝒮_∅}/(ϖ) ≤ n[F⁺ : ℚ] + n (Newton–Thorne 2021, Corollary 5.5).

*Hypotheses.* hypotheses (1)–(3) of Theorem 5.2; v₀ split, q_{v₀} ≡ 1 mod p, r̄ trivial at ṽ₀.

*Proof outline.*

1. The quotient of R_{𝒮_∅} where the characteristic polynomial of Frob_{ṽ₀} is ∏(X − q_{v₀}^{1−i}) is a quotient of R_{𝒮_{\{v₀\}}} (Taylor 2008 §3: the Steinberg ring contains the unipotent-Frobenius quotient; LocalGaloisDeformationRings R08.2/steinberg-condition), which is finite over Λ by PL.7/sum-of-characters-finiteness.
2. The n equations tr(Frob^i) − n cut A out of R_{𝒮_∅}/(ϖ), so dim R_{𝒮_∅}/(ϖ) ≤ dim Λ/(ϖ) + n.

*Prerequisites.* PL.7/sum-of-characters-finiteness (Finiteness of ordinary deformation rings of sums of characters); LocalGaloisDeformationRings:R08.2/steinberg-condition.

*Acceptance.* Used in Proposition 5.6 and Theorem 5.7 to bound the reducible locus.

*Sources.* NT21 §5, Corollary 5.5, p. 76.

### The reducible locus is small

`PL.7/reducible-locus-small` (theorem)

Let R_𝒮/(ϖ) → A be a surjection onto a domain with r = r₁ ⊕ r₂ over A, r_i : G_{F⁺,S} → 𝒢_{n_i}(A) with ν ∘ r_i = ν ∘ r (𝒮 = 𝒮_∅), and R ⊂ S − S_p a set of places of odd residue characteristic with the data n_ṽ, q_ṽ (a primitive n_ṽ-th root of unity mod p), r̄|G_{F_ṽ} = σ̄_{ṽ,1} ⊕ σ̄_{ṽ,2} and Θ_ṽ of order p as in Newton–Thorne 2021 §1.17. If (1) p > 2n, (2) χ_i/χ_j|G_{F(ζ_p)} has order > 2n, (3) [F_ṽ : Q_p] > n(n − 1)/2 + 1 for v ∈ S_p, (4) [F(ζ_p) : F] = p − 1, (5) for v ∈ R both r̄₁|G_{F_ṽ} and r̄₂|G_{F_ṽ} have nontrivial unramified subquotients and R^□_v → A factors through R(ṽ, Θ_ṽ, n), then dim A ≤ n[F⁺ : ℚ] + n − d_R, d_R the ℤ_p-rank of the subgroup of Δ = Gal(L_{S_p}/F)/(c + 1) generated by the Frob_ṽ, v ∈ R (Newton–Thorne 2021, Proposition 5.6).

*Hypotheses.* (1)–(5) of Newton–Thorne 2021 Proposition 5.6.

*Proof outline.*

1. As in PL.6/reducible-locus-dimension (Allen–Newton–Thorne Lemma 3.6, Thorne 2015 Corollary 3.12 and Lemma 3.36): the determinants of r₁, r₂ give a map from a two-variable Iwasawa algebra; the level-raising condition at v ∈ R imposes a relation on the Frobenius values that cuts the dimension by d_R.
2. PL.7/sum-of-characters-finiteness for the two blocks and Newton–Thorne 2021 Proposition 1.22(3) give the bound.

*Prerequisites.* PL.7/sum-of-characters-finiteness (Finiteness of ordinary deformation rings of sums of characters); PL.6/reducible-locus-dimension (The reducible locus is small in the presence of Steinberg places); PL.6/reducibility-ideal (Reducible deformations and the ideal of reducibility); PL.6/reducible-twisting-and-base-change (Twisting and soluble base change for residually reducible rings and Hecke algebras).

*Acceptance.* The analogue of PL.6/reducible-locus-dimension with level-raising places R in place of Steinberg places.

*Sources.* NT21 §5, Proposition 5.6, pp. 76–77.

### Generic primes in large quotients

`PL.7/generic-primes-large-quotients` (theorem)

With 𝒮 = (F/F⁺, S, S̃, Λ, r̄, µ, {R^Δ_v}_{S_p} ∪ {R(ṽ, Θ_ṽ, n)}_R ∪ {R^□_v}), R = R₁ ⊔ R₂, 2 ≤ n < p/2, χ̄_i/χ̄_j|G_{F(ζ_p)} of order > 2n for i < j, r̄|G_{F_ṽ} trivial for v ∈ S_p, R ⊂ S − S_p of odd residue characteristic with the §1.17 data, [F_ṽ : Q_p] > n(n − 1)/2 + 1 and [F(ζ_p) : F] = p − 1: let R_𝒮 → B be a surjection with B finite over Λ/(ϖ). If (1) every irreducible component of Spec B has dimension > sup({n[F⁺ : ℚ] + n − d_{R_i}}_{i=1,2}, {n[F⁺ : ℚ] − [F_ṽ : Q_p]}_{v∈S_p}) and (2) for every decomposition r̄ = r̄₁ ⊕ r̄₂ into 𝒢_{n_j}-valued pieces with n₁n₂ ≠ 0 some R_i has both r̄₁, r̄₂ with unramified subquotients at every v ∈ R_i, then some prime 𝔭 ⊂ R_𝒮 of dimension one and characteristic p containing ker(R_𝒮 → B) is generic (Newton–Thorne 2021, Theorem 5.7, statement as corrected by the extraction's review).

*Hypotheses.* the residual and local hypotheses listed; (1) the component dimension bound; (2) the level-raising condition for every decomposition.

*Proof outline.*

1. By PL.7/reducible-locus-small applied to each decomposition, the reducible locus of Spec B has dimension at most the first supremum; by Allen–Newton–Thorne Lemma 3.8 (PL.6/large-quotients-contain-generic-primes) the non-generic-at-p locus has dimension at most the second.
2. Thorne 2015 Lemma 1.9 finds a dimension-one prime of a component avoiding the countably many bad loci.

*Prerequisites.* PL.7/reducible-locus-small (The reducible locus is small); PL.6/large-quotients-contain-generic-primes (Large quotients contain generic primes); PL.6/generic-prime (Generic primes of an ordinary deformation ring).

*Acceptance.* Newton–Thorne 2021 §6 uses it to find generic primes p₀ ⊂ R_{D₀} of dimension one (items 113–114 of the extraction).

*Sources.* NT21 §5, Theorem 5.7, pp. 77–78.

### Global lifts with prescribed local components (Bellovin–Gee, Schur form)

`PL.7/global-lifts-schur` (theorem)

Let F₀ be imaginary CM, r̄ : G_{F₀⁺,S₀} → 𝒢_n(k) with ν ∘ r̄ = ε^{1−n}δ^n_{F₀/F₀⁺} and r̄|G_{F₀⁺(ζ_p)} Schur, and choose local rings: R_v at the places above p of dimension 1 + n² + n(n − 1)[F_{0,ṽ} : Q_p]/2 (unions of components of potentially semistable or ordinary rings), quotients R̄_v (unions of components) at T₀, the Steinberg rings R^St_v at Σ₀ and the components of inertia-isomorphism type at the inert places. Then the universal ring of the resulting polarized problem exists and has Krull dimension at least 1 (Bellovin–Gee, Corollary 5.1.1, as used by Newton–Thorne 2021 in the proof of Proposition 5.8 with the irreducibility hypothesis weakened to the Schur property, which is all the proof uses for the vanishing of H⁰(ad r̄) and H⁰(ad r̄(1))).

*Hypotheses.* r̄|G_{F₀⁺(ζ_p)} Schur; local rings of the stated dimensions.

*Proof outline.*

1. Representability for Schur r̄ (GlobalGaloisDeformations G7/polarized-representability).
2. The presentation of G7/polarized-presentation with the stated local dimensions, the archimedean contribution for an odd r̄ and H⁰(G_{F₀⁺,S₀}, ad r̄(1)) = 0 (Schur over F₀⁺(ζ_p)) gives Krull dimension at least 1.

*Prerequisites.* PL.6/schur-residual-representation (Schur 𝒢_n-valued residual representations); GlobalGaloisDeformations:G7/polarized-representability; GlobalGaloisDeformations:G7/polarized-presentation; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition.

*Acceptance.* Newton–Thorne 2021, Proposition 5.8: combined with finiteness over O, it produces the characteristic-zero point (PL.4/characteristic-zero-lifts).

*Sources.* NT21 §5, proof of Proposition 5.8, p. 81.

### Automorphic lifts of prescribed type from residual automorphy over a soluble extension

`PL.7/prescribed-type-lifts` (theorem) — planet: *Automorphic lifts of prescribed type*

Let F₀ be imaginary CM with F₀/F₀⁺ unramified, S₀ ⊇ S_{0,p} with the p-adic places split, ρ̄ = ⊕ρ̄_i : G_{F₀,S₀} → GL_n(k) with ρ̄_i absolutely irreducible, ρ̄_i^c ≅ ρ̄_i^∨ ⊗ ε^{1−n} and pairwise non-isomorphic; disjoint T₀, Σ₀ ⊂ S₀ of prime-to-p split places, with q_ṽ ≡ 1 mod p and ρ̄ trivial at Σ₀; quotients R_v (unions of components) at T₀; ρ̄(I_{F_{0,ṽ}}) of order prime to p at inert places; λ with λ_{τc,i} = −λ_{τ,n+1−i} such that ρ̄|G_{F_{0,ṽ}} has an ordinary lift of weight λ_ṽ for v | p. If a soluble CM F/F₀ satisfies (1) p > max(n, 3), [F_v : Q_p] > n(n − 1)/2 + 1 and ρ̄|G_{F_v} trivial for v | p; (2) F(ζ_p) ⊄ F̄^{ker ad ρ̄}, F ⊄ F⁺(ζ_p), the ρ̄_i|G_{F(ζ_p)} absolutely irreducible and distinct, ρ̄|G_F primitive without quotients of order p; (3) there is an ι-ordinary RACSDC π of GL_n(𝔸_F) with r̄_{π,ι} ≅ ρ̄|G_F and an unramified Steinberg twist at a place above Σ₀; (4) the places above S₀ split in F — then there is a RACSDC π₀ of GL_n(𝔸_{F₀}), unramified outside S₀, with r̄_{π₀,ι} ≅ ρ̄, ι-ordinary of weight ιλ, with points of R_v at T₀, unramified Steinberg twists at Σ₀ and inertia at the inert places mapping isomorphically mod p (Newton–Thorne 2021, Proposition 5.8, after Bellovin–Gee Theorem 5.2.1).

*Hypotheses.* the residual hypotheses on ρ̄ over F₀; (1)–(4) over the soluble F/F₀.

*Proof outline.*

1. Form the polarized problem over F₀ with these local conditions; its universal ring has dimension ≥ 1 (PL.7/global-lifts-schur) and is finite over O after restriction to F (PL.7/ordinary-steinberg-finiteness for the restricted Steinberg ordinary problem, GlobalGaloisDeformations R04.4/restriction-finiteness, PL.6/pseudodeformation-restriction-finite).
2. PL.4/characteristic-zero-lifts gives a lift ρ of the prescribed type; its restriction to G_F is automorphic by PL.7/residually-reducible-automorphy-lifting (Allen–Newton–Thorne Theorems 6.1–6.2, with Geraghty Lemma 3.10 for ordinary weights).
3. Soluble descent (PL.0/soluble-descent, Thorne 2015 Lemma 2.7) gives π₀ over F₀.

*Prerequisites.* PL.7/global-lifts-schur (Global lifts with prescribed local components (Bellovin–Gee, Schur form)); PL.7/ordinary-steinberg-finiteness (Finiteness of ordinary locally Steinberg deformation rings); PL.7/residually-reducible-automorphy-lifting (Automorphy lifting for residually reducible representations); PL.4/characteristic-zero-lifts (Characteristic-zero lifts from finiteness and the dimension bound); PL.0/soluble-descent (Soluble base change and descent of automorphy); PL.6/pseudodeformation-restriction-finite (Restriction of pseudodeformations to a finite-index subgroup is finite); PL.6/primitive-representation (Primitive representations); GlobalGaloisDeformations:R04.4/restriction-finiteness.

*Acceptance.* Newton–Thorne 2021 use it to produce Steinberg-at-Σ₀ automorphic lifts of symmetric powers of CM forms.

*Sources.* NT21 §5, Proposition 5.8, p. 78.

## PL.8. Adjoint Bloch–Kato Selmer groups and semistable pseudodeformation rings of unitary type

**Objects.** Generic Weil–Deligne representations (no nonzero map (r, N) → (r(1), N); Newton–Thorne 2023, Definition 1.1, after Allen); the adjoint Bloch–Kato Selmer group H¹_f(F⁺, ad r) of a 𝒢_n-valued representation of G_{F⁺}; the conjugate self-dual semistable pseudodeformation ring R^{[a,b]}_{D,S} representing continuous group determinants lifting D̄ that admit a Cayley–Hamilton model whose finite quotients are subquotients of lattices in semistable representations with Hodge–Tate weights in [a, b] (Newton–Thorne 2023 §§2.3–2.4, after Wake–Wang-Erickson).

**Theorems.** H¹_f = H¹_g at generic places above l and H¹_f = H¹ at generic places away from l (Allen, as used by Newton–Thorne 2021 §2.3.1); the comparison of the tangent space of R^{[a,b]}_{D,S} with H¹_f up to bounded torsion (Newton–Thorne 2023, Propositions 2.15–2.17); vanishing of the adjoint Bloch–Kato Selmer group of r_{π,ι} for π regular algebraic cuspidal of unitary type with enormous image over F(ζ_{p^∞}) (Newton–Thorne 2023, Theorem A = Theorem 4.1), and its consequence that the pseudodeformation ring is its residue field at the automorphic point; ordinary tangent vectors with trivial weight lie in H¹_g (Geraghty, Lemma 3.9, as used by Newton–Thorne 2021).

**Depends on.** Within this roadmap: PL.0, PL.2. Other roadmaps: ArithmeticGaloisDuality:D7, ArithmeticGaloisRepresentations:G7, ArithmeticGaloisRepresentations:R01.5, AutomorphicGaloisRepresentationsPartII:AG2.6, DeformationAndDerivedPatchingAlgebra:R03.5, DeformationAndDerivedPatchingAlgebra:R03.6, EndoscopicTransferAndUnitaryTraceComparison:ET.6, GlobalGaloisDeformations:G7, GlobalGaloisDeformations:R04.1, GlobalGaloisDeformations:R04.2, IntegralHeckeAndGaloisDeterminants:IHG.0, IntegralHeckeAndGaloisDeterminants:IHG.1, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:R08.3, PadicHodgeTheory:R06.2, SelmerIwasawaCohomology:L2, SelmerIwasawaCohomology:L4.

### Generic Weil–Deligne representations

`PL.8/generic-weil-deligne` (definition) — planet: *Generic Weil–Deligne representation*

A Weil–Deligne representation (r, N) of W_K, K/Q_p finite, over a field of characteristic 0 is generic if there is no nonzero morphism (r, N) → (r(1), N), where r(1) is the twist of r by the character of W_K corresponding to |·|_K under Art_K (the cyclotomic character; Art_K sends uniformizers to geometric Frobenius). A continuous ρ : G_K → GL_n(Q̄_l) (de Rham when l = p) is generic if WD(ρ) is generic (Newton–Thorne 2023, Definition 1.1, after Allen, Definition 1.1.2). If WD(ρ)^{F-ss} is generic then ρ is generic; if WD(ρ)^{F-ss} = rec^T_K(π) for a generic irreducible admissible π of GL_n(K) then ρ is generic (Allen, Lemma 1.1.3); pure Weil–Deligne representations are generic.

*Hypotheses.* K/Q_p finite; coefficients a field of characteristic 0.

*Proof outline.*

1. Hom_{WD}((r, N), (r(1), N)) is the space of W_K-equivariant maps commuting with N; genericity is its vanishing.
2. A morphism (r, N) → (r(1), N) gives one between Frobenius semisimplifications, so genericity of WD^{F-ss} implies genericity.
3. For π generic, write π as an isobaric sum of segments; a nonzero morphism would link two segments (Harris–Taylor p. 36), as in PL.1/generic-smooth-points (1).

*Uses.* Newton–Thorne 2021, Proposition 2.11(2) and proof of Theorem 2.24: H¹_f = H¹_g above p and H¹_f = H¹ away from p at generic places, so adjoint Selmer vanishing controls trianguline tangent spaces. Newton–Thorne 2023, Proposition 2.17(3): H¹_g = H¹_f for the adjoint representation when ρ|G_{F_ṽ} is generic at every v ∈ S. Liu et al., Theorem 3.6.3 (rigidity): minimally ramified local conditions at generic places.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.WeilDeligne.IsGeneric` | constructor | No nonzero morphism (r, N) → (r(1), N). |
| `TauCeti.Automorphy.WeilDeligne.isGeneric_of_frobSS` | relation | If WD^{F-ss} is generic then WD is generic. |
| `TauCeti.Automorphy.WeilDeligne.isGeneric_of_rec_generic` | compatibility | If WD(ρ)^{F-ss} = rec^T_K(π) with π generic then ρ is generic (Allen, Lemma 1.1.3). |
| `TauCeti.Automorphy.WeilDeligne.isGeneric_of_pure` | example | A pure Weil–Deligne representation is generic. |
| `TauCeti.Automorphy.WeilDeligne.IsGeneric.restrict` | functoriality | If WD(ρ∣G_{K′}) is generic for a finite extension K′/K then WD(ρ) is generic. |

*Unit tests.*

* `generic_trivial` (computation): The one-dimensional (1, 0) is generic: Hom_{W_K}(1, |·|) = 0 because q ≠ 1.
* `not_generic_steinberg_pair` (non-example): (r, N) = (1 ⊕ |·|, 0), the unramified principal series sum, is not generic: the summand |·| of r maps isomorphically onto the summand 1(1) = |·| of r(1), and this map commutes with N = 0.
* `generic_irreducible` (characterisation): If r is irreducible and N = 0 then (r, 0) is generic: r ⊗ |·| ≇ r because their determinants differ by |·|^{dim r}.
* `generic_zero_dim` (degenerate): The zero Weil–Deligne representation is generic.

*Prerequisites.* ArithmeticGaloisRepresentations:R01.5; EndoscopicTransferAndUnitaryTraceComparison:ET.6.

*Acceptance.* The one-dimensional (1, 0) is generic because 1(1) = |·| ≠ 1. (1 ⊕ |·|, 0) is not generic (unit test not_generic_steinberg_pair).

*Sources.* NT23 §1, Definition 1.1, p. 6; NT23 §1, p. 6.

### Bloch–Kato local conditions at generic places

`PL.8/bloch-kato-at-generic-places` (theorem)

Let F be CM, ρ : G_F → GL_n(E) continuous with ρ^c ≅ ρ^∨ ⊗ µ, and v a finite place. If WD(ρ|G_{F_v}) is generic, then H¹_f(F_v, ad ρ) = H¹_g(F_v, ad ρ) when v | p and ρ|G_{F_v} is de Rham, and H¹_f(F_v, ad ρ) = H¹(F_v, ad ρ) when v ∤ p (Allen, Remark 1.2.9, as used in Newton–Thorne 2021, proof of Proposition 2.11, and Newton–Thorne 2023, Proposition 2.17(3)).

*Hypotheses.* WD(ρ|G_{F_v}) generic; ρ|G_{F_v} de Rham when v | p.

*Proof outline.*

1. v ∤ p: H¹_f = H¹_ur has dimension h⁰(ad ρ); by local Euler characteristic and duality h¹ = h⁰ + h²  and h² = h⁰((ad ρ)^∨(1)) = dim Hom(ρ, ρ(1))^{G} = 0 by genericity, so H¹_f = H¹ (ArithmeticGaloisDuality D7).
2. v | p: dim H¹_g − dim H¹_f = dim D_cris((ad ρ)^∨(1))^{φ=1} (Bloch–Kato), which is the space of (φ, N)-module maps D(ρ) → D(ρ(1)) fixed by Frobenius, zero by genericity of WD(ρ) (PadicHodgeTheory R06.2 for D_cris, D_st).

*Prerequisites.* PL.8/generic-weil-deligne (Generic Weil–Deligne representations); SelmerIwasawaCohomology:L4/bloch-kato-condition; ArithmeticGaloisDuality:D7; PadicHodgeTheory:R06.2/period-functors.

*Acceptance.* For ρ|G_{F_v} unramified with Frobenius eigenvalues α_i, the condition is α_i ≠ q α_j for all i, j.

*Sources.* NT21 §2.3.1, proof of Proposition 2.11, p. 30; NT23 §2.3, Proposition 2.17(3), p. 17.

### The adjoint Bloch–Kato Selmer group of a conjugate self-dual representation

`PL.8/adjoint-bloch-kato-selmer-group` (construction) — planet: *Adjoint Bloch–Kato Selmer group*

Let F be CM with maximal totally real subfield F⁺, E/Q_p finite with ring O, and r : G_{F⁺} → 𝒢_n(O) continuous with ρ = r|G_F (for an automorphic r_{π,ι}, the extension of BLGGT14 §1.1). G_{F⁺} acts on ad ρ = gl_n(E) through ad ∘ r (ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group: ad(g, µ)(x) = gxg^{−1}, ad(j)(x) = −ᵗx). H¹_f(F⁺, ad ρ) ⊂ H¹(G_{F⁺,S}, ad ρ) is the Selmer group with the Bloch–Kato local conditions H¹_f(F⁺_v, ad ρ) at every finite v (SelmerIwasawaCohomology L2/galois-selmer-group, L4/bloch-kato-condition); H¹_g is defined with H¹_g at the places above p. For the integral versions (Newton–Thorne 2023 §2.3), with W the O-lattice ad ρ°: W_E = W ⊗_O E (rational), W_{E/O} = W_E/W and W_m = W ⊗_O ϖ^{−m}O/O, and H¹_{𝓛_S}(F⁺, W) uses the conditions defined by the stable category of semistable subquotients with Hodge–Tate weights in [a, b] (Newton–Thorne 2023 §2.3).

*Hypotheses.* r : G_{F⁺} → 𝒢_n(O) continuous, de Rham at the places above p; S a finite set of places containing those above p and the ramification of r.

*Proof outline.*

1. The adjoint action of 𝒢_n on gl_n gives the G_{F⁺}-module; Shapiro's lemma identifies H¹(G_{F⁺,S}, ad ρ) with the c-invariants (for the twisted c-action) of H¹(G_{F,S}, ad ρ) when p > 2.
2. The local conditions are imported; the Selmer group is the kernel of the localisation map to ⊕_v H¹(F⁺_v, ad ρ)/H¹_f.

*Uses.* Newton–Thorne 2023, Theorem A: the group shown to vanish. Newton–Thorne 2021, Theorems 2.24, 2.27: vanishing makes the unitary eigenvariety smooth at classical points. Newton–Thorne 2021 II §2; Newton–Thorne 2026 Theorem 4.1: regularity of the pseudodeformation ring P at an automorphic point.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.adjointRep` | constructor | The G_{F⁺}-module ad ρ = gl_n(E) through ad ∘ r. |
| `TauCeti.Automorphy.adjointSelmerF` | constructor | H¹_f(F⁺, ad ρ) as a Selmer group with Bloch–Kato conditions. |
| `TauCeti.Automorphy.adjointSelmerG` | constructor | H¹_g(F⁺, ad ρ), with H¹_g at the places above p. |
| `TauCeti.Automorphy.adjointSelmerF_le_G` | other | H¹_f(F⁺, ad ρ) ⊂ H¹_g(F⁺, ad ρ), with equality when WD(ρ∣G_{F_ṽ}) is generic for every v ∈ S (PL.8/bloch-kato-at-generic-places). |
| `TauCeti.Automorphy.adjointSelmerF_eq_tangent` | characterisation | H¹_f(F⁺, ad ρ) is the tangent space at ρ of the polarized deformations that are de Rham above p (the E[ε]-points). |
| `TauCeti.Automorphy.adjointSelmer_twist` | relation | Twisting r by a character of G_{F⁺} with values in 𝒢_1 does not change ad ρ or the Selmer group. |

*Unit tests.*

* `selmer_rank_one` (computation): For n = 1, ad ρ = E(δ_{F/F⁺}) and H¹_f(F⁺, ad ρ) = 0.
* `selmer_zero_coeff` (degenerate): For E-coefficients the group is a finite-dimensional E-vector space; it vanishes when H¹(G_{F⁺,S}, ad ρ) = 0.
* `selmer_compatibility_selmerIwasawa` (compatibility): adjointSelmerF is SelmerIwasawaCohomology's Selmer module Sel_{L^BK}(F⁺, ad ρ) for the Bloch–Kato local conditions.
* `selmer_conditions_not_vacuous` (non-example): For n = 1, H¹(G_{F⁺,S}, E(δ_{F/F⁺})) has dimension at least [F⁺ : ℚ] by the global Euler characteristic formula (δ_{F/F⁺}(c_v) = −1 at every real place), while H¹_f = 0: the Bloch–Kato group is not the full cohomology.

*Prerequisites.* SelmerIwasawaCohomology:L4/bloch-kato-condition; SelmerIwasawaCohomology:L2/galois-selmer-group; ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group; ArithmeticGaloisRepresentations:G7/adjoint-representations; PadicHodgeTheory:R06.2/period-functors.

*Acceptance.* For n = 1, ad ρ is the character δ_{F/F⁺} on E (ad(j) = −1) and H¹_f(F⁺, E(δ_{F/F⁺})) = 0 (finiteness of the class group and the unit rank of F equal to that of F⁺). H¹_f(F⁺, ad ρ) classifies the polarized deformations of ρ to E[ε] whose classes satisfy the Bloch–Kato conditions: crystalline at the places above p (for ρ crystalline there) and unramified away from p; H¹_g allows de Rham deformations above p.

*Sources.* NT23 Introduction, Theorem A, p. 2; NT23 §1, p. 6.

### Semistable conjugate self-dual pseudodeformation rings

`PL.8/semistable-pseudodeformation-ring` (construction) — planet: *Semistable pseudodeformation ring*

Let F be CM, S a finite set of finite places containing those above p, ρ̄ : G_{F,S} → GL_n(k) with group determinant D̄, and integers a ≤ b. Def_{D̄,S} (continuous group determinants of G_{F,S} lifting D̄) is represented by R_{D̄,S} (Newton–Thorne 2023, Proposition 2.12, from Chenevier §3.3), and for |Q| ≤ q, R_{D̄,S∪Q} is a quotient of O⟦X₁, …, X_{g₀}⟧ with g₀ = g₀(S, D̄, q) (Lemma 2.13). Let 𝓔^{[a,b]}_{F,S} be the category of finite Z_p[G_{F,S}]-modules isomorphic at each v | p to subquotients of lattices in semistable representations with Hodge–Tate weights in [a, b] (a stable condition in the sense of Wake–Wang-Erickson). Def^{[a,b]}_{D̄,S} ⊂ Def_{D̄,S} assigns to A the determinants D admitting a Cayley–Hamilton representation (O[G_{F,S}], D) → (B, D′) over A with each B/m_A^nB in 𝓔^{[a,b]}_{F,S}; it is represented by a quotient R^{[a,b]}_{D̄,S} (Proposition 2.14). With a + b = w and a conjugate self-duality D̄^{c,∨} ⊗ χ = D̄, c acts on R^{[a,b]}_{D̄,S} by D ↦ D^{c,∨} ⊗ χ|G_{F,S}, and the conjugate self-dual ring R_S is the quotient by the c-coinvariants (Newton–Thorne 2023 §2.4; the ring P = R^{[0,n−1]}_{t̄,S} of Newton–Thorne 2021 II §2, with similitude ε^{1−n}).

*Hypotheses.* a ≤ b, a + b = w for the conjugate self-dual variant; S ⊇ places above p.

*Proof outline.*

1. Representability of Def_{D̄,S}: Chenevier's determinant deformation theory (IntegralHeckeAndGaloisDeterminants IHG.0/continuous-determinant, GlobalGaloisDeformations R04.1/determinant-deformation-functor).
2. Def^{[a,b]} is a closed subfunctor because 𝓔^{[a,b]} is stable under subquotients, finite products and limits (Wake–Wang-Erickson, Definition 2.3.1; LocalGaloisDeformationRings R08.3/semistable-height-quotient for the lattice condition).
3. The c-action is an involution because a + b = w makes the semistable condition with weights in [a, b] stable under D ↦ D^{c,∨} ⊗ χ.

*Uses.* Newton–Thorne 2023, proof of Theorem 4.1: the ring patched against Hecke algebras; its tangent space is the Selmer group to be killed. Newton–Thorne 2021 II §2; Newton–Thorne 2026 §4: the ring P = R^{[a,b]}_{t̄,S} of symmetric-power determinants and its Taylor–Wiles variants P_Q.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.detDeformationRing` | constructor | R_{D̄,S} representing continuous determinants of G_{F,S} lifting D̄. |
| `TauCeti.Automorphy.semistableDetRing` | constructor | R^{[a,b]}_{D̄,S}, the quotient for the condition (2.3). |
| `TauCeti.Automorphy.conjSelfDualDetRing` | constructor | R_S, the conjugate self-dual quotient for the involution D ↦ D^{c,∨} ⊗ χ. |
| `TauCeti.Automorphy.detDeformationRing_generators` | other | R_{D̄,S∪Q} is a quotient of O⟦X₁, …, X_{g₀}⟧ with g₀ depending only on S, D̄ and q ≥ ∣Q∣ (Lemma 2.13). |
| `TauCeti.Automorphy.semistableDetRing_points` | characterisation | A map R_{D̄,S} → O_E factors through R^{[a,b]}_{D̄,S} iff the associated semisimple representation is semistable at every v ∣ p with Hodge–Tate weights in [a, b]. |
| `TauCeti.Automorphy.semistableDetRing_absIrred` | compatibility | For absolutely irreducible ρ̄, R^{[a,b]}_{D̄,S} is the semistable [a, b] quotient of the unframed deformation ring of ρ̄. |

*Unit tests.*

* `ssdet_rank_one` (computation): For n = 1, R_{D̄,S} = O⟦G^{ab,(p)}_{F,S}⟧ (the completed group algebra of the maximal pro-p abelian quotient of G_{F,S}, suitably twisted) and R^{[a,a]}_{D̄,S} classifies characters semistable with Hodge–Tate weight a at every v | p.
* `ssdet_empty_interval` (degenerate): If a > b then 𝓔^{[a,b]} contains only the zero module and R^{[a,b]}_{D̄,S} = 0 for n ≥ 1.
* `ssdet_absIrred` (compatibility): If ρ̄ is absolutely irreducible then R_{D̄,S} ≅ R^univ_{ρ̄,S}, the unframed deformation ring.
* `ssdet_not_semistable_point` (non-example): A characteristic-zero point whose representation is crystalline at v | p with a Hodge–Tate weight outside [a, b] does not factor through R^{[a,b]}_{D̄,S}.

*Prerequisites.* IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant; IntegralHeckeAndGaloisDeterminants:IHG.1/cayley-hamilton; GlobalGaloisDeformations:R04.1/determinant-deformation-functor; GlobalGaloisDeformations:R04.2/determinant-comparison-isomorphism; LocalGaloisDeformationRings:R08.3/semistable-height-quotient.

*Acceptance.* If ρ̄ is absolutely irreducible, Def_{D̄,S} is the unframed deformation functor of ρ̄ (GlobalGaloisDeformations R04.2/determinant-comparison-isomorphism), and R^{[a,b]}_{D̄,S} is the semistable quotient of R^univ_{ρ̄,S}. Newton–Thorne 2021 II: P_{(𝔭′)} = E at the automorphic point 𝔭′ (PL.8/pseudodeformation-ring-regular-at-automorphic-point).

*Sources.* NT23 §2.3, Proposition 2.12, p. 13; NT23 §2.3, condition (2.3), p. 13; NT21B §2, p. 7.

### Tangent spaces of semistable pseudodeformation rings and Selmer groups

`PL.8/pseudodeformation-tangent-comparison` (theorem)

Let ρ : G_{F,S} → GL_n(O) lift ρ̄ with ρ ⊗ E absolutely irreducible and semistable with Hodge–Tate weights in [a, b] at v | p, giving 𝔮_S = ker(R^{[a,b]}_{D̄,S} → O) (or its conjugate self-dual analogue). (1) There is a canonical homomorphism tr_{m,S} : H¹_{𝓛_S}(F, W_m) → Hom_O(𝔮_S/𝔮_S², O/ϖ^m) whose kernel and cokernel are killed by a power p^d with d depending only on ρ, not on S, [a, b] or m (Newton–Thorne 2023, Propositions 2.15–2.16, with the c-invariant version on F⁺). (2) tr_{E,S} : H¹_{𝓛_S}(F⁺, W_E) ≅ Hom_O(𝔮_S/𝔮_S², E); H¹_{𝓛_S}(F⁺, W_E) is the geometric Selmer group H¹_{g,S}(F⁺, W_E); and if ρ|G_{F_ṽ} is generic for every v ∈ S, H¹_{g,S} = H¹_f (Proposition 2.17).

*Hypotheses.* ρ ⊗ E absolutely irreducible; ρ semistable with weights in [a, b] above p.

*Proof outline.*

1. Define tr_m by sending a class [φ] to the determinant of the deformation ρ_φ over O ⊕ εϖ^{−m}O/O; the kernel is controlled by H⁰(F, W_{E/O}), killed by a bounded power p^{k₀} (Proposition 2.7: lifting pseudocharacters to representations with bounded denominators).
2. The cokernel: a determinant D′ over A_m with a Cayley–Hamilton model in 𝓔^{[a,b]} is the determinant of a representation α_{2k₀+c} ∘ ρ_φ with semistable finite quotients (Chenevier Lemma 1.19 on kernels of determinants).
3. Proposition 2.17: invert p and pass to the limit; Liu's theorem identifies semistable self-extensions, and de Rham self-extensions are semistable (Nekovář Corollary 1.27); generic places give H¹_g = H¹_f (PL.8/bloch-kato-at-generic-places).

*Prerequisites.* PL.8/semistable-pseudodeformation-ring (Semistable conjugate self-dual pseudodeformation rings); PL.8/adjoint-bloch-kato-selmer-group (The adjoint Bloch–Kato Selmer group of a conjugate self-dual representation); PL.8/bloch-kato-at-generic-places (Bloch–Kato local conditions at generic places); IntegralHeckeAndGaloisDeterminants:IHG.0/determinant; PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications.

*Acceptance.* Combined with PL.8/adjoint-selmer-vanishing: (R_S)_{(𝔮)} is its residue field E at an automorphic point with enormous image.

*Sources.* NT23 §2.3, Proposition 2.16, p. 16; NT23 §2.3, Proposition 2.17, p. 17.

### Vanishing of adjoint Bloch–Kato Selmer groups of unitary type

`PL.8/adjoint-selmer-vanishing` (theorem) — planet: *Vanishing of adjoint Selmer groups*

Let F be CM and π a regular algebraic cuspidal automorphic representation of GL_n(𝔸_F) of unitary type, i.e. π^c ≅ π^∨ (Newton–Thorne 2023, Introduction; r_{π,ι} then extends to G_{F⁺} → 𝒢_n with multiplier ε^{1−n}δ^n_{F/F⁺}), p a prime and ι : Q̄_p ≅ ℂ. Suppose r_{π,ι}(G_{F(ζ_{p^∞})}) is enormous (Newton–Thorne 2023, Definition 2.23; ArithmeticGaloisRepresentations G7/characteristic-zero-enormous-subgroups). Then H¹_f(F⁺, ad r_{π,ι}) = 0 (Newton–Thorne 2023, Theorem A = Theorem 4.1, stated there in the set-up where π_w has an Iwahori-fixed vector at w | p and the places above p and the ramification split over F⁺, to which the general case reduces by soluble base change). The hypothesis holds when π_v is a twist of Steinberg at some finite v.

*Hypotheses.* π regular algebraic cuspidal of unitary type; r_{π,ι}(G_{F(ζ_{p^∞})}) enormous.

*Proof outline.*

1. Reduce by soluble base change (PL.0/soluble-descent; Selmer groups inject under restriction for p ∤ degree, and the enormous image is preserved) to the set-up of §4: π_w Iwahori-spherical at w | p, S split.
2. Descend to a definite unitary group (PL.2/unitary-base-change-and-descent) and patch algebraic modular forms (PL.2/unitary-algebraic-modular-forms, PL.2/taylor-wiles-level-structures) against the conjugate self-dual semistable pseudodeformation rings R_S (PL.8/semistable-pseudodeformation-ring) with Taylor–Wiles data obtained from enormous image (Newton–Thorne 2023, Lemma 2.26, Corollary 2.27; GlobalGaloisDeformations G7/enormous-taylor-wiles-primes).
3. The patched module is maximal Cohen–Macaulay over a regular ring; at the automorphic prime 𝔮 the localised completed ring is regular of the dimension of the Hecke side, which is zero-dimensional after inverting p (Theorem 4.28 with Brochard's criterion, Theorem 4.27); so (R_S)_{(𝔮)} = E, its tangent space vanishes, and PL.8/pseudodeformation-tangent-comparison gives H¹_g = H¹_f = 0 (genericity at S from local–global compatibility and purity).

*Prerequisites.* PL.8/adjoint-bloch-kato-selmer-group (The adjoint Bloch–Kato Selmer group of a conjugate self-dual representation); PL.8/semistable-pseudodeformation-ring (Semistable conjugate self-dual pseudodeformation rings); PL.8/pseudodeformation-tangent-comparison (Tangent spaces of semistable pseudodeformation rings and Selmer groups); PL.8/bloch-kato-at-generic-places (Bloch–Kato local conditions at generic places); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); PL.2/taylor-wiles-level-structures (Taylor–Wiles level structures and the parahoric projection); PL.0/soluble-descent (Soluble base change and descent of automorphy); ArithmeticGaloisRepresentations:G7/characteristic-zero-enormous-subgroups; GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes; DeformationAndDerivedPatchingAlgebra:R03.5; DeformationAndDerivedPatchingAlgebra:R03.6/patching-free-conclusion; AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime.

*Acceptance.* Newton–Thorne 2021, Theorems 2.24 and 2.27: for the π_n used there, H¹_f(F⁺, ad r_{π_n,ι}) = 0, making the eigenvariety smooth at z_n. Newton–Thorne 2023, Theorem B: for non-CM Hilbert modular forms and elliptic curves over totally real fields.

*Sources.* NT23 Introduction, Theorem A, p. 2; NT23 §4, Theorem 4.1, p. 25.

### The pseudodeformation ring is its residue field at an automorphic point

`PL.8/pseudodeformation-ring-regular-at-automorphic-point` (theorem)

Let P = R^{[a,b]}_{t̄,S} be the conjugate self-dual semistable pseudodeformation ring of PL.8/semistable-pseudodeformation-ring, and 𝔭′ = ker(P → O) the point given by r_{Π′,ι} for a cuspidal automorphic Π′ of unitary type with enormous image over F(ζ_{p^∞}), semistable with Hodge–Tate weights in [a, b] and generic at every place of S. Then P_{(𝔭′)} = E (Newton–Thorne 2021 II §2, citing Newton–Thorne 2023 Theorem A with Proposition 2.21 and Example 2.34 of the earlier arXiv numbering; Newton–Thorne 2026, proof of Theorem 4.1, citing NT23 Theorem 4.32).

*Hypotheses.* Π′ cuspidal of unitary type, enormous image; generic at every v ∈ S; Hodge–Tate weights in [a, b].

*Proof outline.*

1. By PL.8/pseudodeformation-tangent-comparison (2), Hom(𝔭′/𝔭′², E) ≅ H¹_f(F⁺, ad r_{Π′,ι}).
2. This vanishes by PL.8/adjoint-selmer-vanishing, so the complete local ring P^∧_{𝔭′}[1/p] has zero tangent space and is E.

*Prerequisites.* PL.8/semistable-pseudodeformation-ring (Semistable conjugate self-dual pseudodeformation rings); PL.8/adjoint-selmer-vanishing (Vanishing of adjoint Bloch–Kato Selmer groups of unitary type); PL.8/pseudodeformation-tangent-comparison (Tangent spaces of semistable pseudodeformation rings and Selmer groups).

*Acceptance.* Newton–Thorne II use it as the regularity input of their own lifting theorem (Theorem 2.1). Version note: the numbering 'Proposition 2.21, Example 2.34, Theorem 4.32' cited by Newton–Thorne II and 2026 refers to earlier arXiv versions of Newton–Thorne 2023; the version read here has Corollary 2.21, Examples 2.29–2.30 and Theorem 4.1.

*Sources.* NT21B §2, proof of Theorem 2.1, p. 17; NT23 §2.3, Proposition 2.17(1), p. 17.

### Ordinary tangent vectors of trivial weight lie in H¹_g

`PL.8/ordinary-tangent-vectors-h1g` (theorem)

Let ρ be a polarized ordinary representation of G_F (regular, with distinct ordinary characters at every v | p) and consider ordinary E[ε]-deformations ρ_ε of ρ, with ordinary characters deforming those of ρ. If the parameter of ρ_ε maps to 0 in the tangent space of weight space (the derivatives of the characters on O_{F_ṽ}^× vanish), then the class of ρ_ε lies in H¹_g(F⁺, ad ρ) (Geraghty, Lemma 3.9, as used by Newton–Thorne 2021 in the proof of Theorem 2.27: with PL.8/adjoint-selmer-vanishing this makes T_{z_n}Z^{ord} → T𝒲_n injective).

*Hypotheses.* ρ ordinary with pairwise distinct characters on the flag; deformation with trivial weight derivative.

*Proof outline.*

1. An ordinary deformation with constant weights is an extension in the category of ordinary representations whose graded characters are crystalline-up-to-finite-order deformations with constant Hodge–Tate weights, hence de Rham (PadicHodgeTheory R06.2/extension-with-separated-weights-de-rham), so the class is in H¹_g at each v | p.
2. Away from p the condition is empty for H¹_g, which equals H¹ at generic places (PL.8/bloch-kato-at-generic-places).

*Prerequisites.* PL.8/adjoint-bloch-kato-selmer-group (The adjoint Bloch–Kato Selmer group of a conjugate self-dual representation); PL.8/bloch-kato-at-generic-places (Bloch–Kato local conditions at generic places); PL.0/ordinary-of-weight (Ordinary Galois representations of weight λ); PadicHodgeTheory:R06.2/extension-with-separated-weights-de-rham; LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

*Acceptance.* Newton–Thorne 2021 §2.18.1: with adjoint Selmer vanishing, the ordinary locus of the eigenvariety is smooth at z_n.

*Sources.* NT21 §2.18.1, proof of Theorem 2.27, p. 49.

## PL.9. Integral R = T for rigid residual representations and lifting from generic local domains

**Objects.** A residual conjugate self-dual r̄ rigid for (Σ⁺_min, Σ⁺_lr): every lift at Σ⁺_min minimally ramified, the pair {‖v‖^{−N}, ‖v‖^{−N+2}} occurring exactly once among the generalized Frobenius eigenvalues at Σ⁺_lr, regular Fontaine–Laffaille at the places above ℓ and unramified elsewhere (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.6.1).

**Theorems.** The almost minimal R = T theorem: under (D1) ℓ ≥ 2(N + 1), (D2) absolute irreducibility over F(ζ_ℓ), (D3) rigidity and (D4) concentration of the localized cohomology of the unitary Shimura varieties in the middle degree, R^univ_𝒮 ≅ T_𝔪 is a local complete intersection and the middle cohomology is free over it (Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3); rigidity for almost all ℓ in the families they study (Corollary 4.1.2, Proposition 4.2.3(1), Theorem 4.2.6); modularity lifting for potentially crystalline r of polynomially generic tame type (λ + η, τ) with adequate residual image and a residually automorphic RACSDC seed of the same weight and K-type (Le–Le Hung–Levin–Morra, Theorem 9.2.1), and its change-of-weight relaxation (Remark 9.2.2).

**Depends on.** Within this roadmap: PL.0, PL.2, PL.3. Other roadmaps: ArithmeticGaloisRepresentations:G7, AutomorphicGaloisRepresentationsPartII:AG2.1a, AutomorphicGaloisRepresentationsPartII:AG2.6, AutomorphicGaloisRepresentationsPartII:AG2.7, DeformationAndDerivedPatchingAlgebra:R03.5, DeformationAndDerivedPatchingAlgebra:R03.6, EndoscopicTransferAndUnitaryTraceComparison:ET.6, GlobalGaloisDeformations:G7, LocalGaloisDeformationRings:L7, LocalGaloisDeformationRings:R08.2, LocalGaloisDeformationRings:R08.3.

### Rigid residual conjugate self-dual representations

`PL.9/rigid-residual-representation` (definition)

Let F/F⁺ be CM, ℓ an odd prime unramified in F, k a finite field of characteristic ℓ, and r̄ : Γ_{F⁺} → 𝒢_N(k) with r̄^{−1}𝒢_N⁰ = Γ_F, r̄^♮ = r̄|Γ_F and similitude η^µ ε_ℓ^{1−N} (Liu–Tian–Xiao–Zhang–Zhu, Notation 3.1.1). Let Σ⁺_min ⊇ Σ⁺_bad, Σ⁺_lr and Σ⁺_ℓ (the places above ℓ) be pairwise disjoint finite sets of places of F⁺, with every v ∈ Σ⁺_lr inert in F and ℓ ∤ ‖v‖² − 1. r̄ is rigid for (Σ⁺_min, Σ⁺_lr) if (1) for v ∈ Σ⁺_min every lifting of r̄_v is minimally ramified (their Definition 3.4.8; Clozel–Harris–Taylor §2.4.4 at split v); (2) for v ∈ Σ⁺_lr the generalised eigenvalues of r̄^♮_v(φ_w) contain the pair {‖v‖^{−N}, ‖v‖^{−N+2}} exactly once, w the place of F above v; (3) for v ∈ Σ⁺_ℓ, r̄^♮_v is regular Fontaine–Laffaille crystalline (their Definition 3.2.4); (4) r̄_v is unramified at every other nonarchimedean v (Definition 3.6.1). The associated global problem is 𝒮 = (r̄, η^µε_ℓ^{1−N}, Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ, {all liftings at Σ⁺_min, D^ram at Σ⁺_lr, D^FL at Σ⁺_ℓ}).

*Hypotheses.* ℓ odd, unramified in F; Σ⁺_min, Σ⁺_lr, Σ⁺_ℓ pairwise disjoint, Σ⁺_lr inert with ℓ ∤ ‖v‖² − 1.

*Proof outline.*

1. The local conditions are imported: minimally ramified liftings at split and nonsplit places and the conditions D^mix ⊃ D^unr, D^ram at inert places (requested of LocalGaloisDeformationRings R08.2: Liu et al. Definitions 3.4.8, 3.5.1 and Proposition 3.5.2, D^mix formally smooth over O⟦x₀, x₁⟧/(x₀x₁) with components D^unr, D^ram, each formally smooth of relative dimension N²), and the Fontaine–Laffaille condition D^FL (LocalGaloisDeformationRings L7/fontaine-laffaille-deformation-condition).
2. Rigidity is a conjunction of these local conditions; the global problem is a polarized deformation problem in the sense of GlobalGaloisDeformations G7/polarized-deformation-problem.

*Uses.* Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3 (D3): the hypothesis of the integral R = T theorem. Liu et al., Invent. Math. 228 (2022) §6.4, Lemmas 8.1.3–8.1.4: applied to V°_N with (Σ⁺_min, Σ⁺_lr) and to V′_N with (Σ⁺_min, Σ⁺_lr ∪ {𝔭}). Liu–Tian–Xiao–Zhang–Zhu, Corollary 4.1.2 and Theorem 4.2.6: rigidity for almost all ℓ.

*API.*

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Automorphy.IsRigid` | constructor | r̄ is rigid for (Σ⁺_min, Σ⁺_lr): the four local conditions. |
| `TauCeti.Automorphy.IsRigid.globalProblem` | data | The polarized global deformation problem 𝒮 attached to a rigid r̄. |
| `TauCeti.Automorphy.IsRigid.mono` | other | If r̄ is rigid for (Σ⁺_min, Σ⁺_lr) and 𝔭 ∉ Σ⁺ is inert with ℓ ∤ ‖𝔭‖² − 1 and the eigenvalue condition at 𝔭, then r̄ is rigid for (Σ⁺_min, Σ⁺_lr ∪ {𝔭}). |
| `TauCeti.Automorphy.IsRigid.unramified_outside` | projection | A rigid r̄ is unramified outside Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ. |
| `TauCeti.Automorphy.IsRigid.fontaineLaffaille` | projection | At v ∈ Σ⁺_ℓ, r̄^♮_v is regular Fontaine–Laffaille crystalline, so ℓ ≥ (b_ξ − a_ξ) + 2 for the weights in play. |

*Unit tests.*

* `rigid_empty_sets` (degenerate): If r̄ is unramified outside Σ⁺_ℓ, regular Fontaine–Laffaille at Σ⁺_ℓ and Σ⁺_min = Σ⁺_lr = ∅, then r̄ is rigid for (∅, ∅).
* `rigid_eigenvalue_pair` (computation): For N = 2 and v ∈ Σ⁺_lr with q = ‖v‖, condition (2) asks that r̄^♮_v(φ_w) have generalised eigenvalues {q^{−2}, 1} each with multiplicity one (as a pair occurring once).
* `not_rigid_repeated_pair` (non-example): If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} occurring twice among its generalised eigenvalues (possible for N ≥ 4), r̄ is not rigid at v ∈ Σ⁺_lr.
* `rigid_compatibility_global` (compatibility): The global problem of a rigid r̄ is an instance of GlobalGaloisDeformations G7/polarized-deformation-problem with the stated local conditions, represented by R^univ_𝒮 (Liu et al. Proposition 3.1.7).

*Prerequisites.* GlobalGaloisDeformations:G7/polarized-deformation-problem; LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition; LocalGaloisDeformationRings:R08.2/minimally-ramified-condition; LocalGaloisDeformationRings:R08.2; ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group.

*Acceptance.* If Σ⁺_lr = ∅, rigidity says that r̄ has no deformations beyond minimally ramified ones at bad places, the setting of the 'minimal' R = T theorems (PL.3/minimal-r-equals-t). Remark 3.6.2: r̄ can be rigid for two pairs (Σ⁺_min, Σ⁺_lr), (Σ⁺_min, Σ⁺_lr ∪ {𝔭}) used for R^{unr} and R^{ram}.

*Sources.* LTXZZ §3.6, Definition 3.6.1, p. 29; LTXZZ §3.6, after Definition 3.6.1, p. 29.

### The almost minimal integral R = T theorem for rigid residual representations

`PL.9/rigid-r-equals-t` (theorem) — planet: *Rigid R = T theorem*

Let ξ be a weight with ℓ ≥ (b_ξ − a_ξ) + 2, ℓ odd and unramified in F; Σ⁺_min, Σ⁺_lr, Σ⁺_ℓ as in PL.9/rigid-residual-representation with Σ⁺_lr = ∅ if N is odd; V a hermitian space of rank N not split at Σ⁺_lr, Λ a self-dual lattice away from Σ⁺_∞ ∪ Σ⁺_min ∪ Σ⁺_lr, K = ∏_{v∈Σ⁺_min∪Σ⁺_lr} K_v × ∏ U(Λ)(O_{F⁺_v}) neat with K_v special maximal at Σ⁺_lr; Σ⁺ ⊇ Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ; 𝔪 the maximal ideal of T^{Σ⁺}_N attached to r̄. Assume (D1) ℓ ≥ 2(N + 1); (D2) r̄^♮|Gal(F̄/F(ζ_ℓ)) is absolutely irreducible; (D3) r̄ is rigid for (Σ⁺_min, Σ⁺_lr); (D4) for every Σ⁺′ ⊇ Σ⁺ and K′ ⊆ K with K′_v = K_v for v ∉ Σ⁺′, H^d_ét(Sh(V, K′), L_ξ ⊗ k)_{T^{Σ⁺′}_N ∩ 𝔪} = 0 for d ≠ d(V). Let T be the image of T^{Σ⁺}_N in End_O(H^{d(V)}_ét(Sh(V, K), L_ξ)). If T_𝔪 ≠ 0 then (1) R^univ_𝒮 → T_𝔪 is an isomorphism of local complete intersection rings over O; (2) H^{d(V)}_ét(Sh(V, K), L_ξ)_𝔪 is a finite free T_𝔪-module; (3) µ ≡ N mod 2 (Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3).

*Hypotheses.* (D0) ℓ odd, unramified in F, ℓ ≥ (b_ξ − a_ξ) + 2; (D1)–(D4); T_𝔪 ≠ 0.

*Proof outline.*

1. The middle-degree étale cohomology of the unitary Shimura varieties Sh(V, K′) with its Hecke and Galois actions is imported (requested of AutomorphicGaloisRepresentationsPartII AG2.1a); by (D4) the localised complexes are concentrated in degree d(V), so the cohomology at Taylor–Wiles levels K₁(Q) is free over O[Δ_Q] (their Lemma 3.6.5).
2. Taylor–Wiles data: (D1)–(D2) make r̄(Γ_{F(ζ_ℓ)}) adequate (ArithmeticGaloisRepresentations G7/adequacy-criteria (1)), so PL.3/adequate-taylor-wiles-primes applies; rigidity (D3) makes the local deformation rings formally smooth (minimally ramified, D^ram, D^FL), so R^loc is a power series ring.
3. Patch (DeformationAndDerivedPatchingAlgebra R03.5): M_∞ is maximal Cohen–Macaulay over the regular R_∞ of the same dimension, hence free (Auslander–Buchsbaum, R03.6/patching-free-conclusion), and R_∞ → End(M_∞) is injective, giving (1)–(2) and the complete intersection property (R03.6/patched-module-r-equals-t).

*Prerequisites.* PL.9/rigid-residual-representation (Rigid residual conjugate self-dual representations); PL.3/adequate-taylor-wiles-primes (Taylor–Wiles primes for adequate residual image); ArithmeticGaloisRepresentations:G7/adequacy-criteria; AutomorphicGaloisRepresentationsPartII:AG2.1a; DeformationAndDerivedPatchingAlgebra:R03.5; DeformationAndDerivedPatchingAlgebra:R03.6/patching-free-conclusion; DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-r-equals-t; GlobalGaloisDeformations:G7/polarized-representability.

*Acceptance.* Liu et al. §6.4 apply it twice: to V°_N with (Σ⁺_min, Σ⁺_lr) giving R^unr ≅ T^unr_𝔪, and to V′_N with (Σ⁺_min, Σ⁺_lr ∪ {𝔭}) giving R^ram ≅ T^ram_𝔪, whence d_unr = d_ram (their Proposition 6.4.1). (D4) is a hypothesis; IgusaVarietiesAndTorsionConcentration IG.7 proves concentration results of this kind for generic r̄.

*Sources.* LTXZZ §3.6, Theorem 3.6.3, p. 30; LTXZZ §3.6, Theorem 3.6.3, p. 30.

### Rigidity and residual irreducibility for almost all primes

`PL.9/rigidity-for-almost-all-primes` (theorem)

(1) (Liu–Tian–Xiao–Zhang–Zhu, Corollary 4.1.2) For an abelian variety A as in their §4.1 (in particular symmetric powers of a non-CM elliptic curve, as in Liu et al. Lemma 8.1.3) and Σ⁺ ⊇ Σ⁺_bad a finite set containing the places of bad reduction, r̄_{A,ℓ} is rigid for (Σ⁺, ∅) for all but finitely many ℓ. (2) (Proposition 4.2.3) If a cuspidal Π of their §4.2 has a supercuspidal component Π_w at some nonarchimedean w, then for all λ outside a finite set Λ₁ depending only on Π_w, ρ_{Π,λ} is residually absolutely irreducible, and for λ outside a finite set Λ₂ ⊇ Λ₁, ρ̄_{Π,λ}|Gal(F̄/F(ζ_ℓ)) remains absolutely irreducible. (3) (Theorem 4.2.6) If Π_{w₀} is supercuspidal at some nonarchimedean w₀, the rigidity hypothesis (L6) of their main application holds for all but finitely many λ.

*Hypotheses.* the settings of Liu–Tian–Xiao–Zhang–Zhu §§4.1–4.2.

*Proof outline.*

1. (1) Each of the four conditions of PL.9/rigid-residual-representation excludes finitely many ℓ: minimal ramification at Σ⁺ for ℓ large (their Proposition 4.1.1), condition (2) is empty, condition (3) holds once ℓ ≥ N + 1 and Σ⁺_ℓ ∩ Σ⁺ = ∅, and (4) is automatic.
2. (2) Supercuspidality at w forces ρ_{Π,λ}|G_{F_w} to be irreducible with inertia acting irreducibly modulo λ for λ large (local Langlands, EndoscopicTransferAndUnitaryTraceComparison ET.6, with local–global compatibility AG2.6), hence global residual irreducibility; the restriction to F(ζ_ℓ) by an argument of Gee.
3. (3) Combines (2) with the analysis of minimal ramification at the other places.

*Prerequisites.* PL.9/rigid-residual-representation (Rigid residual conjugate self-dual representations); AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime; AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi; EndoscopicTransferAndUnitaryTraceComparison:ET.6.

*Acceptance.* Liu et al., Lemmas 8.1.3–8.1.4: used to verify rigidity and (D2) for almost all ℓ in their main theorems.

*Sources.* LTXZZ §4.1, Corollary 4.1.2, p. 35; LTXZZ §4.2, Proposition 4.2.3, p. 36.

### Modularity lifting from polynomially generic local domains

`PL.9/generic-local-domain-lifting` (theorem) — planet: *Lifting from generic local domains*

Let F/F⁺ be a CM extension (with the standing assumptions of Le–Le Hung–Levin–Morra: p unramified in F⁺ and every place above p split in F) and r : G_F → GL_n(E) continuous such that r is unramified at all but finitely many places; r is potentially crystalline at the places above p of type (λ + η, τ), λ ∈ (ℤⁿ₊)^{Hom(F,E)}, with τ a tame inertial type admitting a lowest alcove presentation (s, µ − η) with µ P_{λ+η,e}-generic; r^c ≅ r^∨ε^{1−n}; r̄ is semisimple locally at the places above p; r̄(G_{F(ζ_p)}) ⊂ GL_n(F) is adequate and ζ_p ∉ F̄^{ker ad r̄}; and r̄ ≅ r̄_ι(π) for a RACSDC π of weight λ with σ(τ) a K-type for π at the places above p. Then r ≅ r_ι(π′) for a RACSDC π′ of weight λ with σ(τ) a K-type at the places above p (Le–Le Hung–Levin–Morra, Theorem 9.2.1). The genericity polynomial P_{λ+η,e} depends on λ + η and the ramification e, not on p.

*Hypotheses.* r potentially crystalline of polynomially generic tame type (λ + η, τ); r^c ≅ r^∨ε^{1−n}; r̄ semisimple at p, adequate image over F(ζ_p), ζ_p ∉ F̄^{ker ad r̄}; residual automorphy with matching weight and K-type.

*Proof outline.*

1. Local input: for P_{λ+η,e}-generic tame τ and semisimple ρ̄, the potentially crystalline deformation ring R^{λ+η,τ}_{ρ̄} is a domain (or zero), normal and Cohen–Macaulay (their Theorem 7.3.2, from the local models; requested of LocalGaloisDeformationRings L7).
2. Patch algebraic modular forms on a definite unitary group with type σ(τ) at p (PL.2/unitary-algebraic-modular-forms, PL.2/taylor-wiles-level-structures, PL.3/adequate-taylor-wiles-primes); the patched module is supported on a union of components of R_∞ (DeformationAndDerivedPatchingAlgebra R03.6/maximal-cm-support-top-components), which is irreducible because the local rings at p are domains; residual automorphy makes the patched module nonzero, so it has full support and r is automorphic (the standard base change and Taylor–Wiles argument cited in their proof).

*Prerequisites.* PL.3/adequate-taylor-wiles-primes (Taylor–Wiles primes for adequate residual image); PL.2/unitary-algebraic-modular-forms (Algebraic modular forms on a definite unitary group); PL.2/taylor-wiles-level-structures (Taylor–Wiles level structures and the parahoric projection); PL.2/unitary-base-change-and-descent (Base change and descent between definite unitary groups and GL_n); PL.0/soluble-descent (Soluble base change and descent of automorphy); LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; DeformationAndDerivedPatchingAlgebra:R03.5; DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-support-top-components; DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-support-theorem.

*Acceptance.* For n = 2 and p large relative to λ it recovers lifting theorems for generic tame potentially Barsotti–Tate types. The hypothesis is residual automorphy in the same weight and type, not prior automorphy of r.

*Sources.* LLHLM23 §9.2, Theorem 9.2.1, p. 137; LLHLM23 §9.2, proof of Theorem 9.2.1, p. 137.

### Change-of-weight relaxation of generic-type modularity lifting

`PL.9/generic-change-of-weight-lifting` (theorem)

After possibly changing the polynomial P_{λ+η,e} in PL.9/generic-local-domain-lifting, its last hypothesis can be relaxed to r̄ ≅ r̄_ι(π) for some RACSDC π, without matching weight or K-type, using the generic Serre weight theorem (Le–Le Hung–Levin–Morra, Theorem 9.1.6) to change the weight (Remark 9.2.2(1)). The polynomial is not effective in arbitrary rank (Remark 9.2.2(2)).

*Hypotheses.* the hypotheses of PL.9/generic-local-domain-lifting except the matching of weight and K-type.

*Proof outline.*

1. By the generic Serre weight theorem (their Theorem 9.1.6) the set of modular Serre weights of r̄ contains the Jordan–Hölder constituents of σ(τ) predicted by the local model; a RACSDC π′′ of weight λ with K-type σ(τ) and r̄_ι(π′′) ≅ r̄ exists (recorded as a gap: Theorem 9.1.6 is planned nowhere in the atlas).
2. Apply PL.9/generic-local-domain-lifting with the seed π′′.

*Prerequisites.* PL.9/generic-local-domain-lifting (Modularity lifting from polynomially generic local domains).

*Acceptance.* The relaxation is proved only after the generic Serre weight theorem is available; the first theorem does not assume it.

*Sources.* LLHLM23 §9.2, Remark 9.2.2(1), p. 137.

## Requests to other roadmaps

* **AdelicAlgebraicGroups:AA.0** — Reductive groups over number fields and their integral models, in particular unitary groups of central simple algebras with involution of the second kind over a CM extension L/L⁺, with the local isomorphisms at split places (Clozel–Harris–Taylor §3.3). Needed by: PL.2/definite-unitary-group.
* **ArithmeticGaloisDuality:D7** — Local Tate duality and the local Euler characteristic formula for continuous representations of G_K (K/Q_p finite) on finite-dimensional Q̄_l-vector spaces and on finite O-modules, used in BLGGT14 §1.3 (tangent spaces of R^□[1/l]) and in Allen's Remark 1.2.9. Needed by: PL.1/connects-properties, PL.1/generic-smooth-points, PL.8/bloch-kato-at-generic-places.
* **ArithmeticGaloisDuality:R02.4** — Poitou–Tate duality and the Greenberg–Wiles formula comparing a Selmer group with its dual Selmer group for the adjoint representation of a 𝒢_n-valued representation of G_{F⁺,S} (Clozel–Harris–Taylor Lemma 2.3.4), used to count generators in Thorne 2012 Lemma 4.3 and Proposition 4.4. Needed by: PL.3/adequate-taylor-wiles-primes.
* **ArithmeticGaloisRepresentations:G7** — Continuous induction of representations from open subgroups of profinite groups (the induction used in the definition of primitive representations and in BLGGT14 §1.1), with Frobenius reciprocity. Needed by: PL.6/primitive-representation.
* **ArithmeticGaloisRepresentations:R01.5** — Weil–Deligne representations of W_K for K/Q_p finite over fields of characteristic 0, with Frobenius semisimplification, twists by characters and the monodromy relation, as the carrier of generic Weil–Deligne representations. Needed by: PL.8/generic-weil-deligne.
* **AutomorphicFormsOnReductiveGroups:AF.4** — Integral coefficient lattices M_λ in algebraic representations of GL_n of highest weight λ (AF.4/coefficient-lattices), and the archimedean input of BLGGT14 Lemma 2.2.3: an irreducible unitary (𝔤, K)-module of GL_n(ℝ) or GL_n(ℂ) with half-integral Harish-Chandra parameter satisfies π^c ≅ π^∨ (Tadić's classification). Needed by: PL.0/induction-descent.
* **AutomorphicGaloisRepresentationsPartII:AG2.1a** — The étale cohomology H^d_ét(Sh(V, K), L_ξ) of the unitary Shimura varieties of a hermitian space V of rank N over F/F⁺ (Liu–Tian–Xiao–Zhang–Zhu §3.6), with integral coefficients, Hecke action of T^{Σ⁺}_N and Galois action, and the Taylor–Wiles level structures K₁(Q), as used in their Theorem 3.6.3. Needed by: PL.9/rigid-r-equals-t.
* **AutomorphicGaloisRepresentationsPartII:AG2.2** — BLGGT14 Theorem 2.1.1 for every regular algebraic cuspidal polarized (π, χ) over a CM or totally real F: a continuous semisimple r_{l,ι}(π) with (r_{l,ι}(π), ε_l^{1−n}r_{l,ι}(χ)) totally odd polarized; ιWD(r_{l,ι}(π)|G_{F_v})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) pure of weight w at v ∤ l; de Rham with HT_τ = {a_{ιτ,i} + n − i} at v | l; the same comparison at v | l when π_v has Iwahori-fixed vectors (semistable, crystalline if π_v is unramified). The same request was made by the ModularityAndLanglandsExtensions checkpoint. Needed by: PL.0/automorphic-polarized-representation, PL.0/iota-ordinary-implies-ordinary, PL.0/ordinary-implies-iota-ordinary, PL.2/unitary-constituent-galois-representation.
* **DeformationAndDerivedPatchingAlgebra:R03.5** — The abstract Taylor–Wiles–Kisin module patching theorem in the form used by Thorne 2012 Theorems 6.8, 8.6 (and Clozel–Harris–Taylor §3.5): given finite-level rings R_N, modules M_N free over O[Δ_{Q_N}]-quotients with bounded generator counts g = q − q₀, produce R_∞ = R^loc⟦X_1, …, X_g⟧, S_∞ = O⟦Δ_∞, framing variables⟧ and a finite R_∞-module M_∞ of depth dim S_∞ with M_∞ ⊗_{S_∞} O ≅ M_0, with the variant over Λ for ordinary Hecke algebras. Needed by: PL.3/minimal-r-equals-t, PL.3/ordinary-r-equals-t, PL.6/generic-prime-r-equals-t, PL.8/adjoint-selmer-vanishing, PL.9/rigid-r-equals-t, PL.9/generic-local-domain-lifting.
* **EndoscopicTransferAndUnitaryTraceComparison:ET.6** — The local Langlands correspondence rec_K for GL_n(K), K/Q_p finite, with full Weil–Deligne parameters and the Bernstein–Zelevinsky description of generic representations through unlinked segments, as used for genericity (BLGGT14 Lemma 1.3.2, Newton–Thorne 2023 Definition 1.1 with Allen Lemma 1.1.3, Thorne 2012 §5). Needed by: PL.1/generic-smooth-points, PL.2/taylor-wiles-level-structures, PL.8/generic-weil-deligne, PL.9/rigidity-for-almost-all-primes.
* **EndoscopicTransferAndUnitaryTraceComparison:ET.7a** — (a) Arthur–Clozel cyclic base change and descent for GL_n over a cyclic extension of prime degree (AC89 Chapter 3, Theorems 4.2, 5.1, i.e. Theorems 3.4.2 and 3.5.1) with Harris–Taylor Lemma VII.2.6, and automorphic induction from a cyclic CM extension with its cuspidality criterion; (b) Labesse's stable base change between the definite unitary group G/L⁺ of PL.2/definite-unitary-group and GL_n/L (Labesse 2011, Théorème 5.4 and Corollaire 5.3, in the form of Clozel–Harris–Taylor Proposition 3.3.2): every RACSDC π of weight ι_*λ unramified at inert places descends to Π on G with Π_∞ ≅ ξ_{ιλ}^∨, and every such Π has an isobaric conjugate self-dual strong base change. Needed by: PL.0/soluble-descent, PL.0/induction-descent, PL.2/unitary-constituent-galois-representation, PL.2/unitary-base-change-and-descent, PL.5/dwork-potential-ordinary-automorphy, PL.5/tensor-product-trick-lifting.
* **LocalGaloisDeformationRings:L7** — (a) Geraghty's fixed-weight ordinary quotients R^{{H_τ},ss-ord} and R^{{H_τ},cr-ord} of R^□_{O,ρ̄} (Geraghty Lemma 3.3.3; Thorne 2012 Theorems 3.10–3.11): reduced l-torsion-free, equidimensional of dimension 1 + n² + [K : Q_l]n(n − 1)/2 when the H_τ are distinct, cr-ord formally smooth after inverting l, geometrically irreducible for trivial ρ̄ (Geraghty Lemma 3.4.3). (b) Le–Le Hung–Levin–Morra Theorem 7.3.2: for P_{λ+η,e}-generic tame τ and semisimple ρ̄, R^{λ+η,τ}_{ρ̄} is zero or a normal Cohen–Macaulay domain. Needed by: PL.4/ordinary-finiteness, PL.9/generic-local-domain-lifting.
* **LocalGaloisDeformationRings:R08.2** — (a) Properties of the Steinberg lifting rings R^St_v (Thorne 2015 Proposition 3.17: O-flat, geometrically integral of dimension n² + 1, with R^St/(λ) generically reduced). (b) Liu–Tian–Xiao–Zhang–Zhu Definition 3.4.8 (minimally ramified liftings at nonsplit places, 𝒢_N-valued), Definition 3.5.1 and Proposition 3.5.2 (D^mix formally smooth over O⟦x₀, x₁⟧/(x₀x₁) with components D^unr and D^ram, each formally smooth of relative dimension N²). Needed by: PL.9/rigid-residual-representation.
* **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev** — The Chebotarev density theorem for finite Galois extensions of number fields, to choose Taylor–Wiles places with prescribed Frobenius conjugacy class (Thorne 2012 Proposition 4.4, Thorne 2017 Propositions 2.21, 7.1). Needed by: PL.3/adequate-taylor-wiles-primes, PL.3/taylor-wiles-primes-two-adic.
* **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence** — Global existence: finite-order Hecke characters with prescribed local components at finitely many places (Grunwald–Wang away from the special case), used for BLGGT14 Lemmas A.2.1–A.2.5. Needed by: PL.0/auxiliary-cm-extensions, PL.0/auxiliary-characters.

## Recorded gaps

* **The self-dual Dwork family and its monodromy (input of BLGGT14 Theorem 3.1.2).** Theorem 3.1.2 uses the Dwork hypersurfaces X_1^N + ⋯ + X_N^N = N t X_1⋯X_N, their H_0-eigensheaves with ℤ[ζ_N]⁺ coefficients giving symplectic local systems of rank n_i, their large residual monodromy, Hodge numbers and ordinarity near t = ∞ (Harris–Shepherd-Barron–Taylor; Barnet-Lamb–Geraghty–Harris–Taylor §4, Lemma 6.1). No roadmap plans the family; this packet's restructure proposal creates its owner, PotentialAutomorphyDworkMotivesPartII (from the Qian and Boxer–Calegari–Gee–Newton–Thorne routes). Once that roadmap exists, replace this gap by a request to its family and monodromy layers. Needed by: PL.5/dwork-potential-ordinary-automorphy.
* **Geraghty's Lemma 5.9 in the form used by Qian.** Qian (Invent. Math. 231 (2023), proof of Theorem 1.1) uses: π polarizable regular algebraic cuspidal with r_{l,ι}(π) ordinary at every v | l ⇒ π ι-ordinary, without stating a level hypothesis. The form planned here is BLGGT14 §2.1 remark (7), which assumes level potentially prime to l. Geraghty, Math. Ann. 373 (2019), was not available to this job; its Lemma 5.9 must be read to decide whether the level hypothesis can be dropped or must be verified in Qian's application to Sym^{n−1}r_{E_0,l′}|G_{F′}. Needed by: PL.0/ordinary-implies-iota-ordinary.
* **The generic Serre weight theorem (Le–Le Hung–Levin–Morra Theorem 9.1.6).** Remark 9.2.2(1) relaxes the weight and K-type matching of Theorem 9.2.1 using their Theorem 9.1.6 (modular Serre weights of generic r̄ for GL_n), which no layer of the atlas plans. The relaxation stays conditional on supplying it; the first theorem (PL.9/generic-local-domain-lifting) does not need it. Needed by: PL.9/generic-change-of-weight-lifting.
* **Geraghty, Modularity lifting theorems for ordinary Galois representations (Math. Ann. 373 (2019)) not read.** Geraghty's paper (author copy not obtained; no arXiv version) is cited here only through the restatements in BLGGT14 §2.1, Thorne 2012 §8, Thorne 2015 §§2, 4 and Newton–Thorne 2021 §6 (Definitions 2.8, 2.13, 2.24, 5.1.2, Lemmas 2.2.6, 2.4.7, 2.6.4, 4.1.7, 5.1.1, 5.1.5–5.1.6, 5.2.1, Proposition 2.5.3). A reviewer or follow-up should check the locators against the published paper. Needed by: PL.0/iota-ordinary-implies-ordinary, PL.2/hida-classicality, PL.2/ordinary-hecke-galois-representation, PL.2/big-ordinary-hecke-algebra.

## Structure: the other directions and the boundary with ModularityAndLanglandsExtensions

* **split** (PotentialAutomorphyInfrastructurePartII, PotentialAutomorphyDworkMotivesPartII, AutomorphyLiftingBeyondTaylorWiles, CrystallineLocalGlobalCompatibilityCM, WeightZeroCrystallineAutomorphyLifting). The design job for PotentialAutomorphyInfrastructurePartII received fourteen paper routes in five independent directions: (1) polarized automorphy lifting on definite unitary groups (Boxer–Calegari–Gee, Newton–Thorne ×3, Clozel–Thorne, Fakhruddin–Khare–Patrikis, Liu et al., Le–Le Hung–Levin–Morra, Qian's Geraghty lemma); (2) the Dwork switching motives of Qian and Boxer–Calegari–Gee–Newton–Thorne §4 (geometry of hypersurfaces, monodromy, switching torsors; 90 items); (3) conditional automorphy lifting for GL_n over arbitrary number fields (Calegari–Geraghty 2018, 2020; 40 items); (4) P-ordinary degree shifting and crystalline local–global compatibility for torsion classes with Barsotti–Tate lifting over CM fields (Caraiani–Newton; 84 items); (5) weight-zero crystalline automorphy lifting with p arbitrarily ramified (Boxer–Calegari–Gee–Newton–Thorne §3; 11 items), which imports (4). They share only the parent's interfaces. Following the job's instruction, this roadmap plans direction (1). *Proposal.* Create four further Part IIs of PotentialAutomorphyInfrastructure, each with its own design job and the brief its routes record: (a) PotentialAutomorphyDworkMotivesPartII, 'Reusable infrastructure for potential automorphy over CM fields, Part II: Dwork switching motives' (area automorphic; briefs of PAPER-QIAN-23 and PAPER-BOXER-CALEGARI-GEE-ETAL-25); it also owns the self-dual Dwork family that this roadmap's PL.5/dwork-potential-ordinary-automorphy needs (gap), so PL.5 imports its family and monodromy layers. (b) AutomorphyLiftingBeyondTaylorWiles, 'Part II: conditional automorphy lifting for GL_n over arbitrary number fields' (merging the PAPER-CALEGARI-GERAGHTY-18 and -20 briefs). (c) CrystallineLocalGlobalCompatibilityCM, 'Part II: P-ordinary degree shifting, crystalline local–global compatibility and Barsotti–Tate lifting' (PAPER-CARAIANI-NEWTON-23 brief). (d) WeightZeroCrystallineAutomorphyLifting, 'Part II: weight-zero crystalline automorphy lifting with p arbitrarily ramified' (PAPER-BOXER-CALEGARI-GEE-ETAL-25 brief), with (c) as a prerequisite. None of (a)–(d) duplicates PL.0–PL.9: (b)–(d) are unpolarized and work with locally symmetric spaces of GL_n, (a) proves no automorphy statement. The connects relation and potential diagonalizability that (d) uses are owned here (PL.1).
* **rescope** (ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructurePartII). The unreviewed ModularityAndLanglandsExtensions checkpoint packet plans in ML.2 the BLGGT14 definitions and lifting theorems (polarized representations, adequacy, ι-ordinarity, the connects relation, potential diagonalizability, Lemmas 2.2.1–2.2.4, Theorems 2.3.1, 2.4.1, 3.1.2, Propositions 3.2.1, 4.1.1, Theorem 4.2.1) and in ML.3 Newton–Thorne 2021 Theorem 5.2. The accepted reviews of the Boxer–Calegari–Gee, Newton–Thorne (three papers), Clozel–Thorne and Fakhruddin–Khare–Patrikis extractions assign these to this roadmap, and ML.2/ML.3 consume this roadmap, so ML cannot be their owner without a cycle. *Proposal.* ModularityAndLanglandsExtensions keeps the potential automorphy assembly (BLGGT14 Proposition 3.3.1, Theorems 4.3.1, 4.4.1, 4.5.1, Corollaries 4.5.2–4.5.3 and §5) and the symmetric-power endpoints. Its nodes ML.2/polarized-galois-representation and ML.2/adequate-subgroup and ML.2/ghtt-adequacy-criterion become imports of AutomorphicGaloisRepresentationsPartII AG2.0 and ArithmeticGaloisRepresentations G7; ML.2/iota-ordinary, connects-relation, potentially-diagonalizable, potential-diagonalizability-criteria, automorphic-galois-representation, automorphy-twist-and-soluble-base-change, automorphy-descends-from-induction, minimal-automorphy-lifting, ordinary-automorphy-lifting, dwork-potential-ordinary-automorphy, ordinary-lifts-with-local-conditions, preliminary-pd-automorphy-lifting and pd-automorphy-lifting become imports of PL.0/iota-ordinary, PL.1/connects-relation, PL.1/potentially-diagonalizable, PL.1/pd-criteria, PL.0/automorphic-polarized-representation, PL.0/automorphy-under-twist and PL.0/soluble-descent, PL.0/induction-descent, PL.4/minimal-automorphy-lifting, PL.4/ordinary-automorphy-lifting, PL.5/dwork-potential-ordinary-automorphy, PL.5/ordinary-lifts-prescribed-local, PL.5/tensor-product-trick-lifting and PL.5/pd-automorphy-lifting; ML.3/reducible-deformation-finiteness imports PL.7/sum-of-characters-finiteness. The stage links PL.4, PL.5 → ML.2 and PL.7, PL.8 → ML.3 record the dependency.

## Mistakes found in the sources

* **PotentialAutomorphyInfrastructurePartII/E1** (misprint, NT26, Definition 2.5(1), arXiv:2212.03595v2 p. 11): printed “v_p(ιχ_i(ϖ_v)) = (1/e_v) Σ_τ (λ_{ιτ,n+1−i} − (n−1)/2 + i − 1)”. Correction: v_p(ι^{−1}χ_{v,i}(ϖ_v)) = …: the characters χ_{v,i} are ℂ-valued and ι : Q̄_p → ℂ, so ι^{−1} must be applied before taking the p-adic valuation (as in Thorne 2015 Lemma 2.3, where the characters are Q̄_l-valued and ιχ_{v,i} appears in the induction). Reason: ι cannot be applied to the complex number χ_{v,i}(ϖ_v); for n = 1 and χ = |·|^a both sides equal −f_v a only with ι^{−1}. Affects: nothing. Known: new (also recorded in the extraction PAPER-NEWTON-THORNE-26 as its finding E4; no printed correction found).
* **PotentialAutomorphyInfrastructurePartII/E2** (misprint, NT26, Proofs of Lemma 5.7 and Proposition 6.1, arXiv:2212.03595v2): printed “[BLGGT14, Lemma 1.4.1] cited for: Fontaine–Laffaille representations are potentially diagonalizable”. Correction: [BLGGT14, Lemma 1.4.3(2)]. Lemma 1.4.1 is the independence of the lattice. Reason: Read in BLGGT14 arXiv v4 §1.4: Lemma 1.4.1 concerns GL_n(Q̄_l)-conjugate representations, Lemma 1.4.3(2) is the Fontaine–Laffaille criterion. Affects: nothing. Known: new (also recorded in PAPER-NEWTON-THORNE-26 as E30).
* **PotentialAutomorphyInfrastructurePartII/E3** (gap, Tho12, Theorems 7.1 and 9.1 (reductions to Theorems 6.8 and 8.6), arXiv:1107.5989v1 and J. Inst. Math. Jussieu 11 (2012)): printed “Theorem 6.8 assumes r̄_m(G_{L⁺(ζ_l)}) adequate and Theorem 7.1 assumes ρ̄(G_{F(ζ_l)}) adequate; the reduction does not exclude F ⊂ F⁺(ζ_l).”. Correction: If F ⊂ F⁺(ζ_l), r̄(G_{F⁺(ζ_l)}) lies in 𝒢_n⁰ and cannot be adequate in the sense of Definition 2.3; replace Proposition 4.4 by Thorne 2017 Proposition 7.1, which assumes ζ_l ∉ F and ρ̄(G_{F(ζ_l)}) adequate (PL.3/adequate-taylor-wiles-primes (b), PL.3/revised-adequacy-r-equals-t). Reason: Thorne 2017 §7 explains that the adequacy of r̄(G_{F⁺(ζ_l)}) requires surjection onto the component group of 𝒢_n, which fails when G_{F⁺(ζ_l)} ⊂ G_F. Affects: the proof. Known: Thorne, Math. Z. 285 (2017), §7 'An erratum to [Tho12]', Propositions 7.1–7.2 and Corollary 7.3.
* **PotentialAutomorphyInfrastructurePartII/E4** (error, NT21, Corollary 5.4, arXiv:1912.11261v3 p. 76): printed “there exists a homomorphism r : G_{F⁺,S} → 𝒢_n(ℤ̄_p) lifting r̄ such that r|G_{F,S} is ordinary of weight λ”. Correction: r : G_{F⁺,S∪Σ} → 𝒢_n(ℤ̄_p), of Steinberg type at Σ: the proof takes a point of R_{𝒮_Σ}, whose deformations may ramify at Σ. Reason: R_{𝒮_Σ} classifies lifts with Steinberg conditions at the places of Σ, which are not unramified conditions. Affects: a stated result. Known: new (also recorded in PAPER-NEWTON-THORNE-21 as E15; the corollary is not used elsewhere in the paper).
* **PotentialAutomorphyInfrastructurePartII/E5** (gap, NT21, Lemma 5.3 and its application in the proof of Theorem 5.2, arXiv:1912.11261v3 pp. 73–76): printed “Let Γ be a topologically finitely generated profinite group … Then the map Q_{t|Σ} → Q_t classifying restriction to Σ is a finite ring map.”. Correction: The lemma is applied to Γ = G_{F,S}, which is not known to be topologically finitely generated; the hypothesis needed (and sufficient for Chenevier's results) is Mazur's condition Φ_p, which G_{F,S} satisfies. Reason: Noetherianity of the pseudodeformation rings and Chenevier Corollary 1.14 require only Φ_p (finiteness of Hom(Γ′, F_p) for open Γ′). Affects: the proof. Known: new (also recorded in PAPER-NEWTON-THORNE-21 as E16).

## Acceptance tests for the roadmap

* For n = 1 every layer degenerates to class field theory: ordinary of weight λ is a Hodge–Tate character of weight λ, every algebraic Hecke character is ι-ordinary, the definite unitary group is U_1 and its Hecke algebra is a group ring, and the R = T theorems are the statement that a character of the right type is the Galois character of a Hecke character.
* The two adequacy notions coincide when l ∤ n, and for l | n only Thorne 2017's notion can hold; PL.3/revised-adequacy-r-equals-t and PL.4/two-adic-automorphy-lifting use it.
* Boxer–Calegari–Gee's Theorems 2.1 and 3.1 instantiate PL.4/ordinary-automorphy-lifting (F = ℚ, l = p, n = p − 1, p − 2, level prime to p) and PL.4/two-adic-automorphy-lifting with the relaxed adequacy (n = p, p | n), and PL.4/minimal-finiteness, PL.4/ordinary-finiteness give the finiteness of their R_F.
* Newton–Thorne 2021 II Theorem 3.1 instantiates PL.5/pd-automorphy-lifting for Sym^{n−1} of a weight-two form with potentially Barsotti–Tate local representation, through PL.1/potentially-barsotti-tate-diagonalizable and PL.1/pd-operations.
* Fakhruddin–Khare–Patrikis Proposition 9.1 instantiates PL.7/residually-reducible-automorphy-lifting with d constituents over L′ = LF′.
* Liu et al. §6.4 instantiates PL.9/rigid-r-equals-t twice, for (Σ⁺_min, Σ⁺_lr) and (Σ⁺_min, Σ⁺_lr ∪ {𝔭}).

## Suggested Lean file

`research/blueprint/suggested/PotentialAutomorphyInfrastructurePartII.lean` gives Lean forms for the definitions, their API and their unit tests, and templates for the named theorems, over abstract carriers standing for the arithmetic objects that the pinned libraries do not yet contain. It is not the roadmap and it is not exhaustive; this document is definitive.
