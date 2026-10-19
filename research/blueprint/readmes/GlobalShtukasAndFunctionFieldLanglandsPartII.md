# Global shtukas and Langlands over function fields, Part II: Ramanujan and Arthur weight constraints

This roadmap is the Part II of GlobalShtukasAndFunctionFieldLanglands. That roadmap constructs V. Lafforgue's semisimple global parameters σ : Gal(K^sep/K) → LG(Q̄\_ℓ) of cuspidal automorphic representations of a reductive group over a global function field K, with their excursion operators, the GL\_r correspondence and the semisimple local–global compatibility of Genestier–Lafforgue (its layers GS.5–GS.7). It stops at the parameters. This roadmap starts there: it composes σ with representations τ of the L-group, applies Deligne's theory of weights to the ℓ-adic local systems τ ∘ σ, and reads off constraints on the local components of π.

The endpoints are the theorems of Ciubotaru and Harris (Annals of Mathematics 204, 2026). The generic Ramanujan theorem (RA.5): a cuspidal representation of an absolutely simple group that is generic at one unramified quasi-split place and tempered (or discrete series) at another is tempered at every unramified place, and generic at every unramified quasi-split place. Its Arthur-type companion (RA.8): if one split unramified component lies in the complementary series of a nilpotent orbit and one place is geometric, all split unramified components have the same weight pattern and real Satake part, which is the central point of the orbit or one of finitely many extraneous points; an anchor of the form AZ(σ\_u) with σ\_u discrete series removes the extraneous points. These verify Arthur's weight prediction (RA.7) under hypotheses.

The way there needs arithmetic inputs that no roadmap of the atlas owned: geometric local parameters and pure Weil–Deligne parameters (RA.0); Lafforgue's twist decomposition and the propagation of geometricity from one place (RA.1); rationality of Lafforgue's Satake classes (RA.2); Li-Huerta's identification of the Genestier–Lafforgue and Fargues–Scholze local parameters and the stability of geometric representations (RA.3); the Gan–Harris–Sawin purity of discrete series with Beuzart-Plessis's globalization (RA.4); Xue's parametrization of Hecke quotients and the parametrization hypotheses for the discrete spectrum (RA.7); and Sawin–Templier's purity of irreducible parameters and the Lafforgue–Zhu elliptic decomposition (RA.1, RA.6).

## Scope and boundaries

**What the parent owns and this roadmap imports.** Lafforgue's excursion algebra and decomposition of cusp forms (GS.5/the-excursion-algebra, GS.5/the-main-decomposition, GS.5/nonsplit-groups-and-the-l-group), Satake compatibility (GS.5/satake-compatibility-and-chebotarev, GS.3/hecke-operator-as-creation-frobenius-annihilation), the Genestier–Lafforgue local parameters and their semisimple local–global compatibility (GS.7/bernstein-center-and-local-parameters, GS.7/local-global-compatibility-up-to-semisimplification), Xue's finiteness and Weil descent of full shtuka cohomology and the excursions on compactly supported forms (GS.3, GS.4, GS.5/excursions-on-full-compact-cohomology), and L. Lafforgue's purity and companions for lisse sheaves on curves (GS.6/companions-on-curves, GS.6/constant-twists-and-coefficient-fields).

**What neighbouring roadmaps own.** The local half of Ciubotaru–Harris is planned elsewhere and imported: nilpotent orbits, Jacobson–Morozov and Kostant conjugacy, weight filtrations of triples, the appendix tables, weight patterns and Proposition 10.2 in LieHighestWeightPartII (N0–N5); the generic and complementary spherical unitary duals, Theorem 6.14, Proposition 6.31, Corollaries 6.32 and 7.5, the Kazhdan–Lusztig classification, the Aubert involution and the extraneous-point lists of Theorem 8.5 in SmoothRepresentationsOfLocalGroupsPartII (SRU.5–SRU.7). Weil numbers, ι-weights, Deligne's weight filtration, the decomposition by weights modulo ℤ and the local weight–monodromy theorem come from DeligneWeightsAndPurity (DWP.0, DWP.5, DWP.7, DWP.8; TauCetiRoadmap pull request #929). Function-field cusp forms with their integral models (BHKT Proposition 8.2, Ciubotaru–Harris Proposition 3.1 and Lemma 3.2) are FunctionFieldArithmetic FA.6/integral-coefficient-model. Fargues–Scholze parameters and their functoriality are ExcursionOperatorsAndSpectralAction ES5–ES7; Heinloth–Ngô–Yun and Xu–Zhu Kloosterman parameters are KloostermanSheavesAndBesselIsocrystals KB.1, KB.6, KB.11; local shtuka moduli are HeckeStacksAndLocalShtukas HS2–HS3; smooth representations, induction, Jacquet modules, Casselman's criterion and Satake are SmoothRepresentationsOfLocalGroups (a TauCetiRoadmap pull request, #785).

**What this roadmap does not plan.** Five other continuations of the parent were routed to the same design brief and are proposed as separate Part IIs (restructure entry R1): counting ℓ-adic local systems (Yu), crystalline companions (Abe, D'Addezio), special cycles and the higher Siegel–Weil formula (Yun–Zhang, Feng–Yun–Zhang), Tate cohomology of shtukas and cyclic base change (Feng), and Ĝ-valued potential automorphy (Böckle–Harris–Khare–Thorne). Arthur's decomposition of the discrete spectrum (Conjecture 1.3) and Arthur's prediction at unramified places (Conjecture 1.8) are recorded as predicates, not theorems. The introduction of Ciubotaru–Harris (p. 5) speaks of promoting the parametrization to a global Arthur parameter ψ\_π; the body proves only the statements on real parts and weight patterns planned in RA.8, and no global Arthur parameter is asserted here. The ramification theorems of Gan–Harris–Sawin (Theorems 1.4–1.5) belong to the held supercuspidal-parameters Part II (restructure entry R2).

## Conventions

- K = k₁(X) is the function field of a smooth projective geometrically connected curve over a finite field of characteristic p; q\_w is the residue cardinality at a place w; F = k((t)) is a local field of characteristic p with |k| = q. Frobenius is geometric, local reciprocity sends a uniformizer to geometric Frobenius, and one square root of q is fixed for normalized induction and half Tate twists (the parent's conventions).
- A Weil q-number of weight w is an algebraic number all of whose complex conjugates have absolute value q^{w/2} (DWP.0/weil-q-number). ι : Q̄ → ℂ and ι\_ℓ : Q̄ → Q̄\_ℓ are fixed; 'for every ι' quantifies over all embeddings. ι-tempered means tempered after base change along ι; tempered without qualification means for every ι (RA.4/iota-tempered).
- A Weil–Deligne representation (ϕ, N) satisfies ϕ(w) N ϕ(w)^{−1} = q^{−deg w} N, so N lowers Frobenius weights by 2; purity of weight w means that the weight filtration is the monodromy filtration centred at w (RA.0/pure-weil-deligne-parameter, correcting the direction printed in Ciubotaru–Harris Definition 2.6, E9).
- For a Satake class s at an unramified place, s = s\_c·q^{ν} with s\_c compact and ν ∈ t̂\_ℝ the real part; s has central compact part when s\_c lies in Z(Ĝ). The weight pattern of a geometric s along τ counts the eigenvalues of τ(s) of each weight (LieHighestWeightPartII N5/weight-pattern).
- The test representations T(G) of RA.5/test-representations follow the numbering of fundamental weights of Ciubotaru–Harris §6 (Bourbaki coordinates for the exceptional types).

## Sources

- [ch26] **Dan Ciubotaru and Michael Harris**, *On the generalized Ramanujan and Arthur conjectures over function fields*. Annals of Mathematics 204 (2026), no. 2, 545–601; read in arXiv:2311.15300v1 (26 November 2023, 39 pp.), whose page numbers are used throughout; the Annals text (revised 8 October 2025) was not accessible and is not collated. [https://arxiv.org/abs/2311.15300](https://arxiv.org/abs/2311.15300)
- [ghs] **Wee Teck Gan, Michael Harris and Will Sawin, with an appendix by Raphaël Beuzart-Plessis**, *Local parameters of supercuspidal representations*. Forum of Mathematics, Pi 12 (2024), e13; published PDF (printed page = PDF page); arXiv:2109.07737v3 was also read: there Theorem 1.2 assumes p > 3, and the published Proposition 3.11, Corollary 3.12 and Remark 3.13 are numbered 3.10, 3.11 and 3.12 (the published Remark 3.10 is new). [https://doi.org/10.1017/fmp.2024.10](https://doi.org/10.1017/fmp.2024.10)
- [lh] **Siyan Daniel Li-Huerta**, *Local-global compatibility over function fields*. arXiv:2301.09711v2 (13 August 2023), 54 pp. [https://arxiv.org/abs/2301.09711](https://arxiv.org/abs/2301.09711)
- [st] **Will Sawin and Nicolas Templier**, *On the Ramanujan conjecture for automorphic forms over function fields I. Geometry*. arXiv:1805.12231v4 (27 September 2020). [https://arxiv.org/abs/1805.12231](https://arxiv.org/abs/1805.12231)
- [xue] **Cong Xue**, *Finiteness of cohomology groups of stacks of shtukas as modules over Hecke algebras, and applications*. Épijournal de Géométrie Algébrique 4 (2020), Article 6; arXiv:1811.09513v3 (journal pagination). [https://arxiv.org/abs/1811.09513](https://arxiv.org/abs/1811.09513)
- [lz] **Vincent Lafforgue and Xinwen Zhu**, *Décomposition au-dessus des paramètres de Langlands elliptiques*. arXiv:1811.07976v2 (11 December 2019). [https://arxiv.org/abs/1811.07976](https://arxiv.org/abs/1811.07976)
- [sun] **Shenghao Sun**, *L-series of Artin stacks over finite fields*. Algebra & Number Theory 6 (2012), 47–122; read in arXiv:1008.3689v2 (28 March 2011). [https://arxiv.org/abs/1008.3689](https://arxiv.org/abs/1008.3689)
- [glo] **Wee Teck Gan and Luis Lomelí**, *Globalization of supercuspidal representations over function fields and applications*. J. Eur. Math. Soc. 20 (2018), 2813–2858; read in arXiv:1510.00131v2. [https://arxiv.org/abs/1510.00131](https://arxiv.org/abs/1510.00131)
- [hny] **Jochen Heinloth, Bao Châu Ngô and Zhiwei Yun**, *Kloosterman sheaves for reductive groups*. Annals of Mathematics 177 (2013), 241–310; read in arXiv:1005.2765v1. [https://arxiv.org/abs/1005.2765](https://arxiv.org/abs/1005.2765)
- [laf02] **Laurent Lafforgue**, *Chtoucas de Drinfeld et correspondance de Langlands*. Inventiones Mathematicae 147 (2002), 1–241; author's full text (journal pagination). [https://www.ihes.fr/~lafforgue/math/fulltext.pdf](https://www.ihes.fr/~lafforgue/math/fulltext.pdf)

Every locator gives the theorem, section and page of the version listed. The Ciubotaru–Harris extraction PAPER-CIUBOTARU-HARRIS-26 (reviewed) records the source issues E1–E18 used below; the issue found while planning this roadmap is this packet's E1.

## Contact with the libraries

The planning baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Neither library has function-field automorphic representations, Lafforgue's parameters, ℓ-adic local systems with weights, Weil–Deligne parameters or smooth representations of p-adic groups, so every target is a README target; the chains of prerequisites end in the nodes of the roadmaps named above. TauCetiRoadmap main and the current Tau Ceti library were searched for Ramanujan-type statements, Weil numbers, complementary series and Aubert duality: nothing there overlaps this roadmap.

| Pinned declaration | What is imported |
| --- | --- |
| `mathlib:Finset.prod_eq_single` | A finite product with all factors 1 except possibly at a equals the factor at a; its additive form Finset.sum\_eq\_single (generated by to\_additive) shows that a diagonal weight array has equal row and column sums in the suggested file. |
| `mathlib:Finset.prod_comm` | Exchange of two finite products; its additive form Finset.sum\_comm gives the equality of the totals of row and column sums of a weight array. |

The suggested file states only the elementary combinatorics this roadmap owns: the weight array and Property A (RA.8), with Remark 10.8 checked by computation; weight counts of explicit weight lists, with the certificates excluding the extraneous point of Sp(6) for the orbit (2,2,2) (Remark 8.6) and of F₄ for the orbit B₃ (the central row of Table 3, the corrected point of E5 and the printed point's top weight 16); and the test representations by Cartan type (RA.5). It elaborates at the pins with one placeholder proof (Property A).

## Layer overview

| Layer | Title | Endpoint targets |
| --- | --- | --- |
| RA.0 | Geometric local parameters and pure Weil–Deligne parameters | Geometric local parameter; Pure Weil–Deligne parameter |
| RA.1 | Weights of ℓ-adic local systems on curves | Constant-field weight decomposition; Propagation of geometricity; Sawin–Templier purity |
| RA.2 | Rational Satake classes of cuspidal parameters | Local systems of a cuspidal parameter; Rational Satake classes; Real part of a Satake class |
| RA.3 | Local semisimple parameters and geometric representations | Li-Huerta local–global compatibility; Geometric representation |
| RA.4 | Discrete series: globalization, purity and Galois conjugation | ι-temperedness; Weil–Deligne purity of discrete series; Galois conjugation of discrete series |
| RA.5 | The generic Ramanujan theorem | Test representations of the dual group; Integrality of Frobenius weights; Generic Ramanujan theorem |
| RA.6 | Elliptic parameters and the stack-purity route | Elliptic parameter |
| RA.7 | Arthur parameters and parametrization of the discrete spectrum | Global Arthur parameter; Arthur's weight prediction; Discrete-spectrum parametrization; Xue's parametrization of Hecke quotients |
| RA.8 | Weight patterns, Property A and Arthur-type propagation | Global weight pattern; Complementary-series propagation; Property A; Elimination of extraneous points |

## Layer RA.0: Geometric local parameters and pure Weil–Deligne parameters

**Targets.** Geometric L-homomorphisms of a local Weil group (Ciubotaru–Harris Definition 2.5): Frobenius eigenvalues in a faithful representation are Weil q-numbers of integer weight, independently of the representation and of the Frobenius lift. Pure Weil–Deligne representations and LG-valued parameters (Definition 2.6 with the sign correction E9; Gan–Harris–Sawin Definition 3.3), their equivalence with essentially tempered L-parameters and the uniqueness of pure completions (Gan–Harris–Sawin Lemma 3.5).

*Requires:* `DeligneWeightsAndPurity:DWP.0`, `LanglandsParameterStacks:LP0`, `LanglandsParameterStacks:LP1`, `LieHighestWeightPartII:N0`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

<a id="ra-0-geometric-l-homomorphism"></a>
### RA.0.1 Geometric local L-homomorphisms

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism` · definition · planet: Geometric local parameter

Let G be a connected reductive group over F and ϕ : W\_F → LG(C) a continuous semisimple L-homomorphism (compatible with the projection to the Galois factor). For a finite-dimensional algebraic representation τ : LG → GL\_N write ρ(ϕ, τ) = τ ∘ ϕ. The parameter ϕ is geometric when, for a faithful τ, every eigenvalue λ of ρ(ϕ, τ)(Frob) is a Weil q-number of integer weight: λ is algebraic over Q and there is w(λ) ∈ ℤ with |σ(λ)| = q^{w(λ)/2} for every field embedding σ : Q(λ) → ℂ. The weight multiset of ϕ along τ is the multiset of the w(λ), counted with algebraic multiplicity. The same definition applies with C = Q̄\_ℓ, and to a Weil-group representation W\_F → GL\_N(C) (the case LG = GL\_N).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists.
- Semisimple means that the Zariski closure of the image meets Ĝ in a reductive group, equivalently that τ ∘ ϕ is semisimple for one (hence every) faithful τ; inertia then acts through a finite quotient.

*Construction.*

- The eigenvalues of τ(ϕ(Frob)) are those of an endomorphism of a finite-dimensional space, so the Weil-number predicate of DWP.0 applies to each of them.
- Independence of the chosen faithful τ and of the Frobenius lift is the theorem RA.0/geometricity-is-intrinsic; the definition fixes one faithful τ and one lift.

*API.*

- `LParam.IsGeometric` (data): The predicate on a semisimple L-homomorphism ϕ : W\_F → LG(C): for a faithful τ, all eigenvalues of τ(ϕ(Frob)) are Weil q-numbers of integer weight.
- `LParam.weights` (data): For geometric ϕ and an algebraic τ, the finite multiset of integer weights of the eigenvalues of τ(ϕ(Frob)) with algebraic multiplicity.
- `LParam.isGeometric_iff_faithful` (characterisation): ϕ is geometric iff the condition holds for one faithful τ iff it holds for every algebraic τ (RA.0/geometricity-is-intrinsic).
- `LParam.IsGeometric.comp` (functoriality): If f : LG → LH is an algebraic L-homomorphism and ϕ is geometric then f ∘ ϕ is geometric; if f is injective the converse holds.
- `LParam.IsGeometric.galois` (compatibility): For a field automorphism γ of C, ϕ is geometric iff γ ∘ ϕ is, with the same weights.
- `LParam.weights_tensor` (simp): weights(τ ⊗ τ′) is the multiset of sums and weights(τ^∨) the negatives of weights(τ).

*Unit tests.*

- `LParam.IsGeometric.gm_two` (computation): For G = G\_m over F₄((t)) and ϕ unramified with ϕ(Frob) = 2, ϕ is geometric with weight multiset {1} along the identity representation.
- `LParam.IsGeometric.gm_three` (non-example): For G = G\_m over F₄((t)) and ϕ(Frob) = 3, ϕ is not geometric: no integer w satisfies 3 = 4^{w/2}.
- `LParam.IsGeometric.trivial` (degenerate): The trivial parameter of any G is geometric with all weights 0.
- `LParam.IsGeometric.transcendental_unitary` (non-example): For G = G\_m and ϕ(Frob) = e^{i} ∈ ℂ, ι-purity of weight 0 holds for the inclusion, but ϕ is not geometric since e^{i} is transcendental.
- `LParam.IsGeometric.weight_zero_not_finite_order` (characterisation): For G = G\_m over F₅((t)) and ϕ(Frob) = (3+4i)/5, ϕ is geometric of weight 0 although ϕ(Frob) has infinite order: its conjugates (3±4i)/5 have absolute value 1.
- `LParam.IsGeometric.gln_compat` (compatibility): For G = GL\_n, ϕ is geometric iff the n-dimensional Weil representation ϕ has Frobenius pure in the sense of DWP.0/endomorphism-weights on each generalized eigenspace, with integer weights.

*Checks.*

- For G = G\_m over F₄((t)) and ϕ unramified with ϕ(Frob) = 2, ϕ is geometric of weight 1; with ϕ(Frob) = 3 it is not, since |3| is not an integer power of 4^{1/2}.
- A parameter whose Frobenius eigenvalues all have complex absolute value 1 under the given inclusion but are transcendental is not geometric.

*Uses.* Ciubotaru–Harris, Definition 3.9, p. 10: geometric local representations are those whose semisimple parameter is geometric; Ciubotaru–Harris, Proposition 2.7, p. 8: the hypothesis at the boundary place u; Ciubotaru–Harris, Theorem 1.11(3), p. 5: the local anchor hypothesis of complementary-series propagation.

*Source.* [ch26] §2.3, Definition 2.5, p. 7: Defines a geometric L-homomorphism of the Galois group of k((t)) as one whose Frobenius eigenvalues in a faithful representation are Weil q-numbers of integer weight, and notes that the definition is the same over any algebraically closed field of characteristic 0.; [ghs] §2.2, Definition 2.5, pp. 7–8: Defines a pure local representation: the Frobenius eigenvalues of its semisimple parameter in some, equivalently every, faithful representation are Weil q-numbers of one common weight; geometricity allows several integer weights.

*Needs.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`.

<a id="ra-0-geometricity-is-intrinsic"></a>
### RA.0.2 Geometricity is independent of the realization

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic` · theorem

Let ϕ : W\_F → LG(C) be a continuous semisimple L-homomorphism. (a) If the eigenvalues of τ₀(ϕ(Frob)) are Weil q-numbers of integer weights for one faithful τ₀, then for every algebraic representation τ of LG the eigenvalues of τ(ϕ(Frob)) are Weil q-numbers of integer weights. (b) The condition does not depend on the Frobenius lift: for Frob′ = Frob·σ with σ in inertia, the eigenvalues of τ(ϕ(Frob′)) are Weil q-numbers of the same weights. (c) For an algebraic L-homomorphism f : LG → LH, geometricity of ϕ implies that of f ∘ ϕ, with equivalence when f is a closed embedding.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- τ₀ is faithful: its kernel is trivial as a group scheme.

*Proof route.*

- (a) A faithful representation of an affine algebraic group is a tensor generator: every algebraic τ is a subquotient of a finite sum of τ₀^{⊗a} ⊗ (τ₀^∨)^{⊗b} (Deligne–Milne Proposition 2.20(b), the tensor-generator statement imported through RD.6).
- Eigenvalues of tensor products and duals are products and inverses of eigenvalues (DWP.0/spectra-of-tensor-products-and-duals), and eigenvalues of a subquotient are among those of the ambient endomorphism; Weil q-numbers of integer weight are closed under products and inverses (DWP.0/weil-number-arithmetic).
- (b) Semisimplicity forces ϕ(I\_F) to be finite, say of order m, normalized by ϕ(Frob). Some power ϕ(Frob)^N with N ≥ 1 commutes with ϕ(I\_F); then ϕ(Frob′)^{Nm} = ϕ(Frob)^{Nm}, so the eigenvalues of τ(ϕ(Frob′)) are Nm-th roots of those of τ(ϕ(Frob))^{Nm}. A root of a Weil q^{Nm}-number of weight w is a Weil q-number of weight w (DWP.0/weil-number-base-extension).
- (c) τ ∘ f is an algebraic representation of LG, so (a) applies; for a closed embedding f a faithful representation of LH restricts to a faithful one of LG.

*Checks.*

- For G = SL₂ (Ĝ = PGL₂) and ϕ unramified with ϕ(Frob) = diag(q^{1/2}, q^{−1/2}) (the trivial representation), the adjoint representation has eigenvalues q, 1, q^{−1} with weights 2, 0, −2.
- If the condition held only for a non-faithful τ (say the trivial representation) nothing would follow; faithfulness is needed.

*Source.* [ch26] §2.3, Definition 2.5, p. 7: Asserts that the condition for one faithful representation is equivalent to the condition for any, and that any Frobenius element may be used; the argument is left to the reader.; [ghs] §2.2, Definition 2.5, pp. 7–8: States the same independence of the faithful representation for its purity notion.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `PadicDifferentialEquationsAndRigidCohomology:RD.6/neutral-tannakian-recognition`.

<a id="ra-0-pure-weil-deligne-parameter"></a>
### RA.0.3 Pure Weil–Deligne representations and parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter` · definition · planet: Pure Weil–Deligne parameter

A Weil–Deligne representation (ϕ, N) of W\_F on a finite-dimensional C-vector space V (ϕ continuous and Frobenius-semisimple, N nilpotent with ϕ(w) N ϕ(w)^{−1} = q^{−deg w} N for w ∈ W\_F, deg(Frob) = 1) is pure of weight w ∈ ℤ when: (i) the eigenvalues of ϕ(Frob) are Weil q-numbers of integer weights; (ii) for each a the sum W\_a V of the generalized eigenspaces of ϕ(Frob) of weight ≤ a is stable under ϕ and N (N lowers weights by 2); (iii) for every i ≥ 0, N^i induces an isomorphism gr\_{w+i} V → gr\_{w−i} V, where gr\_a = W\_a/W\_{a−1}. A Weil–Deligne parameter (ϕ, N) with values in LG(C) is pure of weight w when τ ∘ (ϕ, N) is pure of some weight for one, equivalently every, faithful τ; it is essentially pure (pure up to twist) when ϕ multiplied by a central unramified character becomes pure. An L-parameter φ : W\_F × SL₂ → LG corresponds to the pair ϕ(w) = φ(w, diag(q^{−deg w/2}, q^{deg w/2})), N = dφ(e); this ϕ is the semisimple parameter of φ. With this (geometric) convention the Frobenius real part of a pure parameter of weight 0 is q^{−h/2} for the neutral element h of the triple of N, which is conjugate to q^{h/2} (Ciubotaru–Harris p. 33 write q^{h/2}).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists.
- This is the geometric-Frobenius form of Ciubotaru–Harris Definition 2.6 with the correction PAPER-CIUBOTARU-HARRIS-26/E9: as printed, (ii) and (iii) ask N to move weights in opposite directions.

*Construction.*

- The Weil–Deligne relation with geometric Frobenius gives ϕ(Frob)(Nv) = q^{−1} N ϕ(Frob)v, so N maps the generalized λ-eigenspace to the q^{−1}λ one and lowers weights by 2; this makes (ii) consistent with (iii).
- Purity of an LG-valued parameter is tested on one faithful representation; tensor products of pure representations are pure with added weights, duals pure of the opposite weight and Weil–Deligne subquotients pure of the same weight, which gives the independence of the faithful representation (Ghs Definition 3.3(b)).
- The dictionary between Weil–Deligne parameters and L-parameters W\_F × SL₂ → LG is Jacobson–Morozov applied to N inside the centralizer of the bounded part (Gross–Reeder §2.1, as recalled by GHS §3.1).

*API.*

- `WeilDeligneRep.IsPure` (data): The predicate IsPure w on a Weil–Deligne representation (ϕ, N), with the weight filtration W\_a and graded pieces gr\_a.
- `WeilDeligneRep.IsPure.weightFiltration` (projection): The filtration W\_• by Frobenius weight, stable under ϕ and N.
- `WeilDeligneRep.IsPure.hardLefschetz` (characterisation): N^i : gr\_{w+i} ≅ gr\_{w−i} for i ≥ 0.
- `WeilDeligneRep.IsPure.tensor` (functoriality): IsPure w₁ and IsPure w₂ give IsPure (w₁ + w₂) for the tensor product; the dual is pure of weight −w.
- `WeilDeligneRep.IsPure.subquotient` (functoriality): A Weil–Deligne subrepresentation or quotient of a pure representation of weight w is pure of weight w.
- `LGWeilDeligne.IsPure` (data): Purity of an LG-valued Weil–Deligne parameter through a faithful representation, and essential purity up to a central unramified twist.
- `LGWeilDeligne.isPure_iff_essentiallyTempered` (equivalence): (ϕ, N) is essentially pure iff the associated L-parameter is essentially tempered (RA.0/pure-completion-uniqueness).

*Unit tests.*

- `WeilDeligneRep.special_two_pure` (computation): Sp(2) with ϕ(Frob) = diag(1, q) and N e₁ = e₀ is pure of weight 1.
- `WeilDeligneRep.special_two_N_zero` (non-example): diag(1, q) with N = 0 is not pure: gr₂ ≠ 0 = N(gr₂).
- `WeilDeligneRep.unramified_scalar` (degenerate): N = 0 and ϕ(Frob) = λ·id with λ a Weil q-number of weight w: pure of weight w.
- `WeilDeligneRep.sign_convention` (non-example): With the printed directions of Ciubotaru–Harris Definition 2.6 (N raising weights in (iii) while (ii) needs N to lower them), Sp(2) would fail (ii) or (iii); the corrected definition accepts it.
- `WeilDeligneRep.gln_tempered` (compatibility): For G = GL\_n, (ϕ, N) is pure of weight 0 iff the associated n-dimensional L-parameter has bounded restriction to W\_F (Taylor–Yoshida Lemma 1.4(3), cited by GHS Lemma 3.5).

*Checks.*

- The special representation Sp(2): V = C², ϕ(Frob) = diag(1, q) on (e₀, e₁), N e₁ = e₀, N e₀ = 0, is pure of weight 1: gr₀ = ⟨e₀⟩, gr₂ = ⟨e₁⟩ and N : gr₂ → gr₀ is an isomorphism.
- The same ϕ with N = 0 is not pure of any weight.

*Uses.* Ciubotaru–Harris, Proposition 2.7, last assertion, p. 8: the graded pieces of the global weight filtration are pure Weil–Deligne representations at the boundary place; Ciubotaru–Harris, proof of Theorem 5.4, p. 14: the discrete-series anchor gives a pure Weil–Deligne representation of weight 0; Ciubotaru–Harris, proof of Theorem 10.3, (10.4), p. 33: the symmetry of the weight array comes from the isomorphisms N^i.

*Source.* [ch26] §2.3, Definition 2.6, p. 7: Defines a pure Weil–Deligne representation of weight w by integrality of Frobenius weights, stability of the weight subspaces and the hard-Lefschetz-type isomorphisms N^i between graded pieces; the direction of N is corrected as in E9.; [ghs] §3.1, Definitions 3.1–3.3, p. 8: Defines Weil–Deligne parameters with values in LG, tempered and essentially tempered parameters, and purity of a Weil–Deligne representation up to a twist, extended to LG through faithful representations.

*Needs.* `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`, `LieHighestWeightPartII:N0/jacobson-morozov`.

<a id="ra-0-pure-completion-uniqueness"></a>
### RA.0.4 Uniqueness of pure completions

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-completion-uniqueness` · theorem

(a) A Weil–Deligne parameter (ϕ, N) with values in LG(C) is essentially pure iff the associated L-parameter φ\_{ϕ,N} : W\_F × SL₂ → LG(C) is essentially tempered (bounded image of W\_F in the adjoint group). (b) A semisimple parameter ρ : W\_F → LG(C) admits, up to Ĝ-conjugacy, at most one pure completion: at most one essentially tempered L-parameter whose associated semisimple parameter is ρ.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- C = ℂ for boundedness; for C = Q̄\_ℓ transport by a field isomorphism Q̄\_ℓ ≅ ℂ (ι-purity).

*Proof route.*

- (a) Both conditions are tested on a faithful representation, which reduces to GL\_n, where it is Taylor–Yoshida Lemma 1.4(3) (as cited by GHS).
- (b) Given a pure completion, the restriction of φ\_{ϕ,N} to W\_F is bounded and consists of semisimple elements, so its centralizer C\_φ in LG is reductive; the SL₂-factor lands in C\_φ, and its neutral element is determined by the real part of ρ(Frob) (the Frobenius weights).
- Two SL₂-homomorphisms into the reductive group C\_φ with the same neutral element are C\_φ-conjugate (Kostant; LieHighestWeightPartII N0/neutral-conjugacy), which is Arthur's argument for real groups as cited by GHS.

*Checks.*

- For GL₂ and ρ unramified with ρ(Frob) = diag(q^{1/2}, q^{−1/2}) (weights 1 and −1), the pure completion is the Steinberg parameter with N ≠ 0; N = 0 is not pure.
- For GL₂ and ρ unramified with ρ(Frob) = diag(1, q²) there is no pure completion: the weights 0 and 4 differ by 4, so no nonzero N can link them.

*Source.* [ghs] §3.1, Lemma 3.5 and its proof, p. 9: States that purity is equivalent to essential temperedness of the L-parameter and that a semisimple parameter has at most one pure completion, reducing (a) to GL\_n via Taylor–Yoshida and (b) to Arthur's uniqueness of the SL₂-factor inside the reductive centralizer of the bounded part.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter`, `LieHighestWeightPartII:N0/neutral-conjugacy`, `LieHighestWeightPartII:N0/kostant-conjugacy`.

## Layer RA.1: Weights of ℓ-adic local systems on curves

**Targets.** L. Lafforgue's decomposition of a lisse sheaf by constant-field twist classes (Corollaire VII.8, Ciubotaru–Harris (5.5)); propagation of geometricity from one boundary place, with the weight filtration and the purity of its graded pieces as Weil–Deligne representations at the boundary (Ciubotaru–Harris Proposition 2.7); Sawin–Templier's purity of Ĝ-valued local systems whose image lies in no proper parabolic (Lemma 11.4) and its local consequence (Gan–Harris–Sawin Lemma 3.6, Corollary 3.8).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0`, `DeligneWeightsAndPurity:DWP.0`, `DeligneWeightsAndPurity:DWP.5`, `DeligneWeightsAndPurity:DWP.8`, `GlobalShtukasAndFunctionFieldLanglands:GS.6`.

<a id="ra-1-constant-field-weight-decomposition"></a>
### RA.1.1 Constant-field twist decomposition of a lisse sheaf

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/constant-field-weight-decomposition` · construction · planet: Constant-field weight decomposition

Let V be a smooth curve over a finite field k₁ and L a lisse Q̄\_ℓ-sheaf on V. Call two continuous characters χ, χ′ : Gal(k̄₁/k₁) → Q̄\_ℓ^× equivalent when χ′χ^{−1}(Frob) is a Weil q₁-number of some integer weight. Then L decomposes uniquely as L = ⊕\_{[χ]} L\_χ ⊗ χ, the sum over representatives of the equivalence classes, where each L\_χ is mixed with integer weights in the absolute sense (every Frobenius eigenvalue at every closed point is a Weil number of integer weight, with no choice of ι) and almost all L\_χ vanish. The summand of the trivial class is the largest subsheaf with integer weights; L has integer weights iff L = L\_1. For each ι : Q̄\_ℓ ≅ ℂ this refines Deligne's decomposition by ι-weights modulo ℤ.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- V is smooth over k₁ (a dense open of a curve), L is lisse, χ is pulled back from Spec k₁.

*Construction.*

- Each irreducible constituent P of L is χ\_P ⊗ P₀ with det P₀ of finite order (Deligne, Weil II Proposition 1.3.4; DWP.5/rank-one-normalization).
- By L. Lafforgue (Théorème VII.6 and Proposition VII.7; GS.6/companions-on-curves) the Frobenius eigenvalues of P₀ are algebraic with all complex conjugates of absolute value 1, i.e. P₀ is pure of weight 0 in the absolute sense.
- Group the constituents by the class of χ\_P; on the summand attached to a class choose one representative χ and write χ\_P = χ·(χ\_Pχ^{−1}) with χ\_Pχ^{−1} pure of integer weight; this gives L\_χ mixed with integer weights.
- Uniqueness and the splitting of extensions between different classes follow as in Deligne's proof of Weil II Théorème 3.4.1(i) (DWP.8/weight-decomposition-modulo-z-3-4-1-i): there are no nonzero maps or extensions between summands whose Frobenius eigenvalues have disjoint weight classes (DWP.0/disjoint-spectra-no-intertwiner).

*API.*

- `LisseSheaf.twistClasses` (data): The finite set of equivalence classes [χ] with L\_χ ≠ 0.
- `LisseSheaf.twistComponent` (projection): The summand L\_χ ⊗ χ attached to a class, functorial in L.
- `LisseSheaf.twistDecomposition` (equivalence): L ≅ ⊕\_{[χ]} L\_χ ⊗ χ, unique up to unique isomorphism given the representatives.
- `LisseSheaf.twistComponent_tensor` (relation): The class components of L ⊗ L′ are the sums over products of classes.
- `LisseSheaf.hasIntegerWeights_iff` (characterisation): L has integer weights at every closed point iff L equals its trivial-class component.
- `LisseSheaf.twistComponent_iota` (compatibility): For each ι the class components refine Deligne's decomposition of L by ι-weights modulo ℤ (DWP.8).

*Unit tests.*

- `LisseSheaf.twist_point_three` (computation): On Spec F₄ the rank-one sheaf with Frobenius 3 has a single nontrivial class and trivial-class component 0.
- `LisseSheaf.twist_tate` (degenerate): The Tate twist Q̄\_ℓ(−1) (Frobenius q₁) lies in the trivial class: it has integer weight 2.
- `LisseSheaf.twist_half_weight` (non-example): On Spec F₂ the character with Frobenius 1 + i lies in the trivial class (Weil 2-number of weight 1), while Frobenius 1 + 2i does not (|1 + 2i| = √5 is no half-integral power of 2).
- `LisseSheaf.twist_compat_deligne` (compatibility): For a fixed ι the ι-weight-mod-ℤ decomposition of DWP.8 is coarser or equal: two inequivalent classes may share an ι-weight modulo ℤ.

*Checks.*

- On V = Spec k₁ with q₁ = 4 the rank-one sheaf with Frobenius 3 is χ ⊗ 1 for a class [χ] ≠ [1].
- If L has integer weights everywhere then L = L\_1.

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, p. 14: the anchor place forces all twist classes of L(π, τ) to be trivial; Ciubotaru–Harris, §1.1, p. 3: the non-integral part of a summand is measured by its constant-field character.

*Source.* [laf02] Chapitre VII, Proposition VII.7 and Corollaire VII.8, pp. 200–202: Proves that an irreducible lisse sheaf with finite-order determinant on a normal variety over a finite field has Frobenius eigenvalues algebraic with all conjugates of modulus 1, and deduces the unique decomposition of any lisse sheaf as a sum of mixed sheaves twisted by representatives of characters of the constant field modulo integral-weight equivalence.; [ch26] §5, proof of Theorem 5.4, equation (5.5), p. 14: Uses this decomposition for the local systems attached to τ ∘ σ, citing Deligne Weil II (3.4.1)(i) or L. Lafforgue Corollary VII.8, with uniqueness modulo the equivalence of constant-field characters.

*Needs.* `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/companions-on-curves`, `GlobalShtukasAndFunctionFieldLanglands:GS.6/constant-twists-and-coefficient-fields`, `DeligneWeightsAndPurity:DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

<a id="ra-1-geometric-boundary-propagation"></a>
### RA.1.2 One geometric boundary place makes a local system geometric

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/geometric-boundary-propagation` · theorem · planet: Propagation of geometricity

Let L be a lisse Q̄\_ℓ-sheaf on V = X ∖ |S| and u ∈ S a missing place with local Weil representation ρ\_u of W\_{K\_u} on the generic geometric fibre. If ρ\_u^{ss} is geometric (RA.0/geometric-l-homomorphism with G = GL\_n), then: (a) for every w ∉ S the Frobenius eigenvalues of ρ\_w(Frob\_w) are Weil q\_w-numbers of integer weights; (b) L has a unique increasing filtration W\_• by lisse subsheaves with gr\_i = W\_i/W\_{i−1} punctually pure of weight i, and dim gr\_i equals the number n(i) of Frobenius eigenvalues of weight i at any w ∉ S, independently of w; (c) the Weil–Deligne representation of W\_{K\_u} on (gr\_i L) at u is pure of weight i (RA.0/pure-weil-deligne-parameter).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- S is a nonempty finite set of places and L is lisse on X ∖ |S|; the same conclusions hold when u is a place where L is unramified and ρ\_u(Frob\_u) has Weil-number eigenvalues.

*Proof route.*

- Decompose L = ⊕ L\_χ ⊗ χ by RA.1/constant-field-weight-decomposition; each L\_χ ⊗ χ is a sum of pieces χ′ ⊗ P with P pure of weight 0 for every ι and χ′ in the class of χ.
- Deligne's local weight–monodromy theorem (DWP.5/local-monodromy-purity) for P at u: the monodromy graded pieces have Frobenius eigenvalues of ι-weight i for every ι, with i read off from the monodromy filtration, which does not depend on ι; hence these eigenvalues are Weil numbers (DWP.0/weil-number-iff-iota-pure-for-every-iota).
- Geometricity of ρ\_u^{ss} forces χ′(Frob\_u) = χ′(Frob)^{deg u} to be a Weil number of integer weight, so every class is trivial; L has integer weights and (a) follows at w ∉ S (DWP.0/weil-number-base-extension).
- (b) is Deligne's punctual weight filtration for a lisse mixed sheaf with integer weights (DWP.8/punctual-weight-filtration-3-4-1-ii); the count n(i) is constant in w because gr\_i is pure of weight i.
- (c) gr\_i L is lisse and punctually pure of weight i, so DWP.5/local-monodromy-purity gives monodromy graded pieces of weight i + j at u, which is purity of weight i in the sense of RA.0 (after the E9 correction).

*Checks.*

- For the Kloosterman sheaf Kl\_n on G\_m over F\_q (pure of weight n − 1, tame at 0 with unipotent monodromy), the place u = 0 is geometric and W\_• has the single nonzero graded piece gr\_{n−1} = Kl\_n.
- The rank-one sheaf with Frobenius 3 on G\_{m,F₄} is not geometric at any place, and the conclusion fails.

*Source.* [ch26] §2.4, Proposition 2.7, p. 8: States that geometricity of the local monodromy at one boundary place makes every unramified fibre geometric, that L has a filtration with pure graded pieces whose ranks count the eigenvalues of each weight, and that the graded pieces are pure Weil–Deligne representations at the boundary place; it attributes the result to Deligne's Weil II.; [laf02] Corollaire VII.8, pp. 201–202: Supplies the decomposition by constant-field twist classes on which the propagation argument rests.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/constant-field-weight-decomposition`, `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`, `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`.

<a id="ra-1-sawin-templier-purity"></a>
### RA.1.3 Purity of irreducible Ĝ-valued local systems

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/sawin-templier-purity` · theorem · planet: Sawin–Templier purity

Let Ĝ be semisimple over Q̄\_ℓ and σ : Gal(K^sep/K) → Ĝ(Q̄\_ℓ) continuous, unramified outside a finite set, such that V ∘ σ is ι-mixed for one faithful V (automatic on curves by RA.1/constant-field-weight-decomposition). If the image of σ lies in no proper parabolic subgroup of Ĝ, then V ∘ σ is ι-pure of weight 0 for every representation V of Ĝ. For LG-valued σ with Ĝ semisimple the same argument applies when parabolic subgroups of LG are taken in the dynamic sense (GHS Lemma 3.6 and Remark 3.7 note that the argument holds for any reductive G, giving purity of some weight; semisimplicity of Ĝ forces the weight to be 0 as in the last step below).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- ι : Q̄\_ℓ ≅ ℂ is fixed; the conclusion is then for every ι, since the hypothesis is ι-independent.

*Proof route.*

- V ∘ σ has a canonical weight filtration (DWP.8/punctual-weight-filtration-3-4-1-ii); the image of σ lies in its stabilizer in Ĝ.
- At an unramified place v let T be a torus containing the semisimple part of Frob\_v; the linear function ω(χ) = log|ι(χ(Frob\_v^{ss}))| on characters of T is increasing along the filtration, and the stabilizer is the subgroup generated by T and the root subgroups on which ω is ≥ 0.
- That subgroup is parabolic unless ω vanishes on all roots; as Ĝ is semisimple, ω then vanishes on all characters of T, so V ∘ σ is pure of weight 0.

*Checks.*

- For Ĝ = SL₂ and σ = χ ⊕ χ^{−1} with χ(Frob) of weight 1 the image lies in a Borel subgroup and the weights are ±1: the irreducibility hypothesis is necessary.
- For Ĝ = SL₂ and σ the monodromy of the Legendre family twisted by q^{−1/2}, σ is irreducible and pure of weight 0.

*Source.* [st] §11, Lemma 11.4 and its proof, p. 83: Proves that an ι-mixed representation into a semisimple dual group whose image lies in no proper parabolic subgroup is pure of weight zero after composition with every representation, by comparing the weight filtration with the parabolic attached to a Frobenius torus.; [ghs] §3.2, Lemma 3.6 and Remark 3.7, pp. 9–10: Uses this lemma with the dynamic definition of parabolic subgroups of LG and notes that the argument holds for any reductive G, the mixedness hypothesis being supplied by L. Lafforgue.

*Needs.* `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/constant-field-weight-decomposition`, `DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness`.

<a id="ra-1-local-purity-of-irreducible-parameters"></a>
### RA.1.4 Local Weil–Deligne purity of irreducible global parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/local-purity-of-irreducible-parameters` · theorem

Let σ : Gal(K^sep/K) → LG(Q̄\_ℓ) be continuous, semisimple, unramified outside a finite set and with image in no proper parabolic subgroup of LG. Then at every place z of K the Weil–Deligne parameter (σ\_z^{ss}, N\_z) of σ|\_{Gal(K̄\_z/K\_z)} is pure (RA.0/pure-weil-deligne-parameter), ι-pure for every ι; when G is semisimple, τ ∘ (σ\_z^{ss}, N\_z) is pure of weight 0 for every algebraic τ. In particular it is the unique pure completion of σ\_z^{ss} (RA.0/pure-completion-uniqueness).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).

*Proof route.*

- By RA.1/sawin-templier-purity, τ ∘ σ is pure of some weight (weight 0 for semisimple G) for every τ.
- Deligne's local monodromy theorem (DWP.5/local-monodromy-purity) gives that the i-th monodromy graded piece at z is pure of weight w + i; so the Frobenius eigenvalues are Weil numbers and the weight filtration is the monodromy filtration, which is condition (iii) of purity.
- Uniqueness is RA.0/pure-completion-uniqueness.

*Checks.*

- For G = PGL₂ and σ attached to a cuspidal π with π\_z Steinberg, the local parameter at z is Sp(2) twisted to weight 0, pure with N ≠ 0.

*Source.* [ghs] §3.2, Lemma 3.6 with its proof and Corollary 3.8, pp. 9–10; Remark 3.13, p. 11: Deduces from Sawin–Templier and Deligne's Theorem 1.8.4 that the restriction of an irreducible global parameter to any decomposition group is a pure Weil–Deligne parameter, and that it is the unique pure completion of the local semisimple parameter of a local component of a cuspidal representation with irreducible parameter; the purity is of some weight, ι-pure for every ι (Remark 3.13), and weight 0 for semisimple G comes from the Sawin–Templier argument.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/sawin-templier-purity`, `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-completion-uniqueness`.

## Layer RA.2: Rational Satake classes of cuspidal parameters

**Targets.** The relation 'π belongs to σ' between cuspidal representations and Lafforgue's parameters, the local systems L(π, τ) (Ciubotaru–Harris Definition 3.7, (5.3)); algebraicity of Lafforgue's Satake classes and their equality with Frobenius classes (Theorem 3.6 with Lemmas 3.2 and 3.5); the real part ν\_w of a Satake class and its half-integrality when weights are integral ((5.1), (5.6)).

*Requires:* `FunctionFieldArithmetic:FA.6`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6`.

<a id="ra-2-cuspidal-parameter-local-systems"></a>
### RA.2.1 Cuspidal representations belonging to a parameter

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/cuspidal-parameter-local-systems` · definition · planet: Local systems of a cuspidal parameter

Let A₀(G, U, E) be the module of E-valued cusp forms of level U (FA.6) and A₀(G, U, Q̄\_ℓ) = ⊕\_σ A₀(G, U, Q̄\_ℓ)\_{λ(σ)} V. Lafforgue's decomposition into generalized eigenspaces of the excursion algebra B(G, U, Q̄\_ℓ), indexed by continuous semisimple σ : Gal(K^sep/K) → LG(Q̄\_ℓ) unramified outside S (GS.5); Φ(U) is the set of σ that occur. For an irreducible π ⊂ A₀(G, Q̄) with m\_U(π) ≠ 0, π belongs to σ ∈ Φ(U) when the restriction λ\_H(σ) of λ(σ) to the spherical Hecke algebra H^S(G, U) away from S equals the action of H^S(G, U) on π^U (after ι\_ℓ). For an algebraic representation τ : LG → GL\_M, L(σ, τ) is the semisimple lisse Q̄\_ℓ-sheaf on X ∖ |S| given by τ ∘ σ, and L(π, τ) := L(σ, τ) when π belongs to σ.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Construction.*

- The decomposition and the parameters σ are GS.5/the-main-decomposition (split G) and GS.5/nonsplit-groups-and-the-l-group (general G); the excursion algebra contains the spherical Hecke operators away from S (GS.5/the-excursion-algebra, Ciubotaru–Harris Lemma 3.5).
- τ ↦ L(σ, τ) is a symmetric monoidal functor from Rep(LG) to semisimple lisse sheaves on X ∖ |S| (GHS Corollary 2.4(i)).

*API.*

- `CuspParam.BelongsTo` (data): The relation 'π belongs to σ' between irreducible π ⊂ A₀(G, Q̄) with m\_U(π) ≠ 0 and σ ∈ Φ(U).
- `CuspParam.localSystem` (constructor): L(σ, τ), the lisse sheaf τ ∘ σ on X ∖ |S|.
- `CuspParam.localSystem_monoidal` (functoriality): L(σ, τ ⊗ τ′) ≅ L(σ, τ) ⊗ L(σ, τ′), L(σ, τ^∨) ≅ L(σ, τ)^∨ and L(σ, 1) = Q̄\_ℓ.
- `CuspParam.charpoly_frob` (characterisation): For w ∉ S, det(1 − T·Frob\_w | L(σ, τ)) = det(1 − T·τ(s\_w)) with s\_w the Satake class of λ\_w(σ) (RA.2/rational-satake-parameters).
- `CuspParam.exists_belongsTo` (other): Every π with m\_U(π) ≠ 0 belongs to at least one σ ∈ Φ(U).

*Unit tests.*

- `CuspParam.localSystem_trivial` (degenerate): L(σ, 1) is the constant sheaf of rank one.
- `CuspParam.pgl2_drinfeld` (compatibility): For G = PGL₂ and τ the standard representation of SL₂, L(π, τ) is the rank-two sheaf of Drinfeld's correspondence for π with trivial determinant, and tr(Frob\_w) is the Hecke eigenvalue of T\_w normalized by q\_w^{−1/2}.
- `CuspParam.sym2_dihedral` (non-example): For G = PGL₂ and σ induced from a character of an unramified quadratic extension, L(π, Sym²) contains the quadratic character of that extension, so L(π, τ) need not be irreducible for irreducible τ.
- `CuspParam.exists` (characterisation): If π^U ≠ 0 then some generalized excursion eigenspace meets π^U ⊗ Q̄\_ℓ, so π belongs to some σ.

*Checks.*

- For τ trivial, L(π, τ) is the constant sheaf Q̄\_ℓ.
- Belonging is a relation, not a function: when two parameters have the same Satake classes away from S, π may belong to both (Ciubotaru–Harris §9.1 notes the same issue when m(π) > 1).

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, pp. 14–15: the local systems L(π, τ) for τ adjoint and the test representations carry the weight argument; Ciubotaru–Harris, §10, p. 32: the ranks of the graded pieces of L(π, τ) give the weight patterns.

*Source.* [ch26] §3.1, decomposition (3.3), Lemma 3.5 and Definition 3.7, pp. 9–10; §5, equation (5.3), p. 13: Recalls Lafforgue's decomposition of cusp forms over the excursion algebra, the compatibility of its Hecke part with the rational Hecke action, defines when a cuspidal representation belongs to a parameter and attaches the local systems L(π, τ).; [ghs] §2.1, Theorem 2.1 and Corollary 2.4(i), pp. 6–7: States Lafforgue's map to semisimple global parameters with Satake compatibility, and that composing with representations of LG gives a symmetric monoidal functor to completely reducible local systems.

*Needs.* `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/nonsplit-groups-and-the-l-group`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`.

<a id="ra-2-rational-satake-parameters"></a>
### RA.2.2 Rationality of Lafforgue's Satake classes

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters` · theorem · planet: Rational Satake classes

For σ ∈ Φ(U) and w ∉ S let s\_{w,ℓ}(σ) ∈ [LG\_ss(Q̄\_ℓ)] be the Satake class of λ\_w(σ). Then s\_{w,ℓ}(σ) = ι\_ℓ(s\_w(σ)) for a class s\_w(σ) ∈ [LG\_ss(Q̄)], and s\_{w,ℓ}(σ) = [σ(Frob\_w)]. Consequently the eigenvalues of τ(σ(Frob\_w)) are algebraic numbers for every τ, and if π belongs to σ then ι(s\_v(σ)) is the Satake parameter of the unitary spherical representation π\_v ⊗\_ι ℂ for every v ∉ S.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

- A₀(G, U, E) is a finite E-module with A₀(G, U, E) ⊗ C ≅ A₀(G, U, C) for noetherian Z[1/p]-algebras E ⊂ C (FA.6/integral-coefficient-model, Ciubotaru–Harris Proposition 3.1 after BHKT Proposition 8.2); for a large number field E the action of H^S(G, U) ⊗ E is semisimple with finitely many eigencharacters, which take algebraic values (Lemma 3.2).
- The Hecke part of the excursion action is the Q̄\_ℓ-linear extension of the rational Hecke action (GS.3/hecke-operator-as-creation-frobenius-annihilation; Lafforgue Proposition 6.2).
- Lafforgue's Theorem 11.11 (GS.5/the-main-decomposition, GS.5/satake-compatibility-and-chebotarev) identifies the Satake class of λ\_w(σ) with [σ(Frob\_w)] through the normalized Satake isomorphism (FA.6/function-field-hecke-satake, SR.4/satake-isomorphism).
- Cusp forms are compactly supported modulo the centre (FA.6/harder-cuspidal-support), so the Petersson inner product makes π ⊗\_ι ℂ unitary; its spherical components are unitary.

*Checks.*

- For G = PGL₂ the class s\_w(σ) is diag(α\_w, α\_w^{−1}) with α\_w + α\_w^{−1} = q\_w^{−1/2} a\_w, a\_w the T\_w-eigenvalue: algebraic, as a\_w is.

*Source.* [ch26] §3, Proposition 3.1, Lemma 3.2, Lemma 3.5 and Theorem 3.6 with the paragraph after it, pp. 8–10: Proves algebraicity of cuspidal Hecke eigenvalues from the finiteness of integral cusp forms, recalls that the Hecke part of the excursion algebra is the rational Hecke action, deduces that Lafforgue's Satake classes are images of algebraic classes equal to the Frobenius classes of the parameter, and notes that the place-v class is the Satake parameter of a unitary spherical representation.

*Needs.* `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `FunctionFieldArithmetic:FA.6/function-field-hecke-satake`, `FunctionFieldArithmetic:FA.6/harder-cuspidal-support`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-operator-as-creation-frobenius-annihilation`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/satake-compatibility-and-chebotarev`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/nonsplit-groups-and-the-l-group`, `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/cuspidal-parameter-local-systems`.

<a id="ra-2-satake-real-part"></a>
### RA.2.3 The real part of a Satake class

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part` · construction · planet: Real part of a Satake class

For σ ∈ Φ(U), w ∉ S and an embedding ι, write ι(s\_w(σ)) = s\_c·q\_w^{ν} with s\_c in the maximal compact subgroup of T̂(ℂ) and ν ∈ t̂\_ℝ (polar decomposition, SRU.5/real-satake-parameter). The real part is ν\_w^ι(σ) := ν = log\_{q\_w}|ι(s\_w(σ))| ∈ t̂\_ℝ, well defined up to the (relative) Weyl group. Its pairing with a weight α of τ gives the ι-weight of the corresponding eigenvalue of τ(σ(Frob\_w)): |ι(·)| = q\_w^{⟨α, ν⟩}.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- For nonsplit G at w the real part lies in the τ-fixed part (t̂\_ℝ)^τ (SRU.6/tau-fixed-dual-group).

*Construction.*

- The polar decomposition of T̂(ℂ) = T̂\_ℝ·T̂\_c is unique; Weyl-conjugate classes give Weyl-conjugate real parts.
- For a weight α of τ the eigenvalue α(ι s\_w) has absolute value q\_w^{⟨α, ν⟩} because α(s\_c) has absolute value 1.

*API.*

- `SatakeClass.realPart` (constructor): ν\_w^ι(σ) ∈ t̂\_ℝ/W, the real part of ι(s\_w(σ)).
- `SatakeClass.realPart_weight` (characterisation): For a weight α of τ the corresponding eigenvalue of τ(ι s\_w) has absolute value q\_w^{⟨α, ν⟩}.
- `SatakeClass.tempered_iff_realPart_zero` (equivalence): π\_w ⊗\_ι ℂ is tempered iff ν\_w^ι = 0 (SRU.5/spherical-tempered-criterion; Casselman's criterion SR.3 in the nonsplit case).
- `SatakeClass.halfIntegral_of_integerWeights` (relation): If τ ∘ σ has eigenvalues of integer ι-weight at w then ⟨α, ν\_w^ι⟩ ∈ ½ℤ for every weight α of τ (Ciubotaru–Harris (5.6)).
- `SatakeClass.realPart_central_twist` (compatibility): Multiplying s\_w by a central element of finite order does not change ν\_w^ι.

*Unit tests.*

- `SatakeClass.realPart_trivial_pgl2` (computation): For G = PGL₂ and π\_w trivial, ν = ½α̂ and the standard representation of SL₂ has eigenvalue weights ±1.
- `SatakeClass.realPart_tempered` (degenerate): For a tempered spherical π\_w, ν = 0 and all eigenvalues of τ(ι s\_w) have absolute value 1.
- `SatakeClass.realPart_complementary` (non-example): For PGL₂ and s = diag(q^{1/4}, q^{−1/4}) (complementary series), ⟨α, ν⟩ = ¼ for a weight α of the standard representation, so s is not geometric for that representation.
- `SatakeClass.realPart_depends_on_iota` (compatibility): If s\_w = diag(ζ, ζ^{−1}) with ζ a root of x⁴ − x³ − x² − x + 1 on the unit circle, ν^ι = 0 for ι keeping ζ on the circle and ν^{ι′} ≠ 0 for ι′ sending ζ to the Salem root 1.7221…

*Checks.*

- For G = PGL₂ and the trivial representation at w, ν = ½α̂ (pairing ±½ with the weights of the standard representation of SL₂).
- For the complementary-series parameter diag(q^{1/4}, q^{−1/4}) of PGL₂, ν pairs to ¼ with a weight of the standard representation.

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, (5.6), p. 14: half-integrality of the real part at the generic place v; Ciubotaru–Harris, §10.1, p. 32: real parts are recovered from weight patterns.

*Source.* [ch26] §5, equation (5.1) and Lemma 5.2, p. 12: Defines the real part of the Satake parameter at an unramified place as the logarithm to base q of its absolute value under a complex embedding, and records that a spherical representation is tempered exactly when this real part vanishes.; [ch26] §6, (6.2), p. 17: Writes every Satake parameter uniquely as a compact part times a real part.

*Needs.* `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/real-satake-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6/tau-fixed-dual-group`.

## Layer RA.3: Local semisimple parameters and geometric representations

**Targets.** Li-Huerta's uniformization of global shtukas by local shtukas and his local–global compatibility (Theorems A and C): the Genestier–Lafforgue and Fargues–Scholze semisimple parameters agree; the properties of the semisimple local parametrization (Ciubotaru–Harris Theorem 3.8; Gan–Harris–Sawin Theorem 2.3); geometric representations (Definition 3.9) and their stability under Galois conjugation, induction, Jacquet modules, products and twists, with tori and central characters (Proposition 3.10(1)–(4)).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0`, `DeligneWeightsAndPurity:DWP.0`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `GlobalShtukasAndFunctionFieldLanglands:GS.2`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `GlobalShtukasAndFunctionFieldLanglands:GS.7`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

<a id="ra-3-shtuka-uniformization"></a>
### RA.3.1 Uniformization of global shtukas by local shtukas

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/shtuka-uniformization` · theorem

Let C be the curve of a global function field, v a place with formal disc D, G connected reductive with a smooth model, legs I placed in D with bounds μ\_•, and N a level disjoint from v. Restricting a global G-shtuka to D defines a formally étale morphism Θ̂ from the formal moduli of local G-shtukas bounded by μ\_• to the formal completion along v of the moduli of global G-shtukas of level N (Li-Huerta Proposition 5.13). On a Harder–Narasimhan truncation ≤ s and for deg N large enough this is a morphism of formal schemes, formally étale and locally formally of finite type (Proposition 5.14). On generic fibres, for every n ≥ 0, it gives an étale morphism Θ\_n of locally spatial diamonds from the analytic local shtuka moduli with level n·v to the diamond of the truncated global moduli with level n·v + N (Theorem 5.16), compatible with the partial Frobenius morphisms (Lemma 5.18). Through Θ\_n the homology of the local shtuka moduli with Satake coefficients maps to the cohomology of the global shtuka stacks (§6).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- N and v are disjoint; deg N is large enough for Proposition 5.14; the truncation ≤ s is fixed and Θ\_n is defined over the product of the punctured discs at v.

*Proof route.*

- Restrict a global shtuka over a base in the formal neighbourhood of v to the formal disc at v and glue back with Beauville–Laszlo to define Θ̂; formal étaleness follows from the rigidity of quasi-isogenies of local shtukas (Li-Huerta Proposition 2.3) (Proposition 5.13).
- On truncations the source is a formal scheme by Li-Huerta Theorem 2.12 and the target by the finite-type statement for large deg N (Proposition 5.14).
- Pass to generic fibres through the analytic local shtuka moduli and their identification with diamonds (Theorem 4.9, Proposition 4.12) to define Θ\_n with level at v (Theorem 5.16); compatibility with partial Frobenius is Lemma 5.18.
- The coefficient sheaves on both sides match under Θ\_n (Lemma 6.4), which gives the maps on (co)homology used in §6.13.

*Checks.*

- For G = GL₁ the local shtuka moduli are discrete and Θ\_n identifies them with the corresponding components of the moduli of Pic-shtukas near v.

*Source.* [lh] §5, Propositions 5.13–5.14, Theorem 5.16 and Lemma 5.18, pp. 37–41: Constructs the uniformization morphism from local to global shtuka moduli: formally étale on formal stacks, a formally étale morphism of formal schemes on Harder–Narasimhan truncations for large tame level, and an étale morphism of locally spatial diamonds on generic fibres with level at v, compatible with partial Frobenius.; [lh] §§2–4, Theorem 2.12, Theorem 4.9 and Proposition 4.12, pp. 8–33; §6, Lemma 6.4 and §6.13, pp. 42–47: Builds the formal and analytic moduli of local shtukas in equal characteristic used as the source of the morphism, and compares local and global coefficient sheaves to map local homology to global cohomology.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/partial-frobenius-morphisms`, `GlobalShtukasAndFunctionFieldLanglands:GS.2/truncations-and-finite-type`, `HeckeStacksAndLocalShtukas:HS2/general-local-field`, `HeckeStacksAndLocalShtukas:HS2`.

<a id="ra-3-li-huerta-compatibility"></a>
### RA.3.2 Li-Huerta: Lafforgue's global parameters are locally Fargues–Scholze

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/li-huerta-compatibility` · theorem · planet: Li-Huerta local–global compatibility

Let G be connected reductive over a global function field K, v a place and Π a cuspidal automorphic representation. Then the semisimplification of the restriction to W\_{K\_v} of Lafforgue's global parameter of Π equals the Fargues–Scholze semisimple parameter of Π\_v. Consequently the Genestier–Lafforgue semisimple local parametrization of irreducible smooth representations of G(F), F of characteristic p, agrees with the Fargues–Scholze parametrization; at the level of Bernstein centres the excursion elements of the two constructions coincide.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Coefficients Q̄\_ℓ with ℓ ≠ p; the mod-ℓ analogue also holds (Li-Huerta Theorem 6.15).

*Proof route.*

- Through the uniformization morphism (RA.3/shtuka-uniformization) the local excursion algebra acting on the homology of local shtuka moduli maps to the global excursion algebra (Li-Huerta Theorem 6.13).
- Comparing the Fargues–Scholze Bernstein-centre elements (ES5) with Lafforgue's global excursions (GS.5/excursions-on-full-compact-cohomology) gives Theorem 6.15 and then Theorem A (§6.16).
- Genestier–Lafforgue's parameters satisfy the same local–global compatibility (GS.7/local-global-compatibility-up-to-semisimplification) and globalization of every irreducible representation's Bernstein-centre character forces agreement (Theorem C, §7.2).

*Checks.*

- At an unramified place both parameters are the Satake parameter, so the theorem is known there before the proof (Li-Huerta remark after Theorem A).

*Source.* [lh] Introduction, Theorems A and C, pp. 2–3; §6, Theorems 6.13, 6.15 and §6.16, pp. 47–49; §7.2, p. 51: Proves that Lafforgue's global correspondence is compatible with the Fargues–Scholze semisimplified local correspondence at every place, first on excursion algebras and Bernstein centres, and deduces that the Genestier–Lafforgue and Fargues–Scholze local constructions agree.; [ch26] §3.2, Theorem 3.8 and the paragraph after it, p. 10: Cites Li-Huerta for the agreement of the Genestier–Lafforgue and Fargues–Scholze parametrizations in positive characteristic.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/shtuka-uniformization`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursions-on-full-compact-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/nonsplit-groups-and-the-l-group`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-global-compatibility-up-to-semisimplification`, `HeckeStacksAndLocalShtukas:HS3/satake-coefficients-and-partial-frobenius`.

<a id="ra-3-local-parametrization"></a>
### RA.3.3 Properties of the semisimple local parametrization

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization` · theorem

Let L\_F : Π(G/F) → Φ(G/F) be the semisimple local parametrization of irreducible smooth Q̄\_ℓ-representations (Genestier–Lafforgue, equal to Fargues–Scholze by RA.3/li-huerta-compatibility). Then: (1) for F = K\_w and Π cuspidal, L\_F(Π\_w) = (L(Π)|\_{W\_F})^{ss}; (2) if π is a constituent of the normalized induction i\_P^G(ρ), then L\_F(π) = i\_M ∘ L\_F(ρ) for the Levi embedding i\_M : LM → LG; (3) if L\_F(π) lies in no proper Levi subgroup, π is supercuspidal; (4) if π has nonzero vectors under the pro-p radical of an Iwahori subgroup of a quasi-split G, L\_F(π) factors through LT; (5) for Υ : G₁ → G₂ with normal image, L\_F(π ∘ Υ) = LΥ ∘ L\_F(π) on constituents; (6) τ ↦ τ ∘ L\_F(π) is symmetric monoidal; (7) for an automorphism γ of Q̄\_ℓ, L\_F(γ(π)) is γ ∘ L\_F(π) up to the order-two twist through the cocharacter 2ρ̂ when γ moves the chosen square root of q (this plan's bookkeeping of the √q-dependence; Ciubotaru–Harris assert compatibility with automorphisms without recording the twist).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists.
- G connected reductive over F.

*Proof route.*

- (1) is GS.7/local-global-compatibility-up-to-semisimplification (Genestier–Lafforgue Théorème 0.1).
- (2) and (3): compatibility with normalized parabolic induction (GS.7/bernstein-center-and-local-parameters; ES7:parabolic/normalised-induction-dictionary); if π were a constituent of an induction from a proper parabolic, its parameter would factor through a proper Levi.
- (4) from (2) applied to a principal series; (5) from ES6:functoriality/isogenies and GHS Theorem 2.3(vi).
- (7) from the Fargues–Scholze construction over Z\_ℓ[√q] (ES5/invariance-and-coefficient-transport) and RA.3/li-huerta-compatibility; the normalization of induction involves √q only through δ\_P^{1/2}, whose change of sign is the stated twist.

*Checks.*

- For G = GL\_n, L\_F is the semisimplified classical local Langlands correspondence (ES7:GLn-comparison/all-irreducible-representations).
- For the Steinberg representation of PGL₂, L\_F(St) is unramified with Frobenius diag(q^{1/2}, q^{−1/2}): the parameter of the trivial representation, as (2) predicts.

*Source.* [ch26] §3.2, Theorem 3.8, p. 10: Recalls the semisimple local parametrization with local–global compatibility, compatibility with parabolic induction and the supercuspidality of representations with irreducible parameter.; [ghs] §2.1, Theorem 2.1(iii), p. 7; §2.2, Theorem 2.3(iv)–(vi) and Corollary 2.4(ii), pp. 6–7: States that the semisimplified local restriction of a global parameter depends only on the local component, and states compatibility with normalized parabolic induction, the Iwahori pro-p case, compatibility with homomorphisms with normal image, and the symmetric monoidal functor on representations of LG.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-global-compatibility-up-to-semisimplification`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/li-huerta-compatibility`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`.

<a id="ra-3-geometric-representation"></a>
### RA.3.4 Geometric representations of a local group

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation` · definition · planet: Geometric representation

An irreducible smooth representation π of G(F) over Q̄\_ℓ is geometric when it has a model π\_E over a number field E ⊂ Q̄\_ℓ (π\_E ⊗\_E Q̄\_ℓ ≅ π) and its semisimple parameter L\_F(π) is geometric (RA.0/geometric-l-homomorphism). A complex representation is geometric when it is π ⊗\_{ι} ℂ for a geometric π.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F; L\_F as in RA.3/local-parametrization.

*Construction.*

- The definition is stable under the choice of the faithful representation and of Frobenius (RA.0/geometricity-is-intrinsic).
- The number-field model is part of the datum: it is what makes Galois conjugates π\_E ⊗\_{E,ι′} Q̄\_ℓ meaningful.

*API.*

- `SmoothRep.IsGeometric` (data): π has a number-field model and L\_F(π) is geometric.
- `SmoothRep.IsGeometric.galois` (compatibility): Conjugates of a geometric representation are geometric (RA.3/geometricity-galois-conjugates).
- `SmoothRep.isGeometric_torus_iff` (characterisation): For a torus, geometric iff the character takes values in Weil q-numbers (RA.3/geometric-torus-characters).
- `SmoothRep.IsGeometric.induction` (functoriality): Constituents of normalized induction from a geometric representation are geometric; Jacquet-module constituents of a geometric representation are geometric (RA.3/geometricity-stability).
- `SmoothRep.IsGeometric.centralCharacter` (projection): The central character of a geometric representation is geometric (RA.3/geometric-central-characters).
- `SmoothRep.IsGeometric.twist` (functoriality): Twisting by a geometric character of G(F) preserves geometricity.

*Unit tests.*

- `SmoothRep.trivial_isGeometric` (degenerate): The trivial representation of PGL₂(F) is geometric, with Frobenius eigenvalues q^{±1/2} in the standard representation of SL₂.
- `SmoothRep.gm_three` (non-example): The unramified character of F^× sending a uniformizer to 3, q = 4, is not geometric.
- `SmoothRep.steinberg_gl2` (computation): The Steinberg representation of GL₂(F) is geometric: L\_F has Frobenius eigenvalues q^{1/2}, q^{−1/2}, of weights 1 and −1.
- `SmoothRep.gln_compat` (compatibility): For GL\_n, π is geometric iff it has a number-field model and the Frobenius eigenvalues of its Weil–Deligne representation under the classical correspondence are Weil q-numbers (ES7:GLn-comparison).
- `SmoothRep.transcendental_character` (non-example): A unitary unramified character of F^× with transcendental value on a uniformizer has no number-field model and is not geometric.

*Checks.*

- The trivial representation of any G is geometric: its parameter has Frobenius q^{ρ̂}, with eigenvalues integral powers of q^{1/2}.
- An unramified character of G\_m(F) with value 3 on a uniformizer, q = 4, is not geometric.

*Uses.* Ciubotaru–Harris, Proposition 3.10, pp. 10–11: the stability properties of geometricity; Ciubotaru–Harris, Theorem 1.11(3), p. 5: the anchor hypothesis at a place of S.

*Source.* [ch26] §3.2, Definition 3.9, p. 10: Defines a geometric local representation as one with a number-field model whose semisimple parameter is geometric.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`.

<a id="ra-3-geometricity-galois-conjugates"></a>
### RA.3.5 Galois conjugates of geometric representations

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-galois-conjugates` · theorem

If π is geometric with model π\_E, then π\_E ⊗\_{E, ι′} Q̄\_ℓ is geometric for every embedding ι′ : E → Q̄\_ℓ.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F.

*Proof route.*

- Extend ι′∘ι^{−1} to an automorphism γ of Q̄\_ℓ; by RA.3/local-parametrization (7), L\_F(γ(π)) is γ ∘ L\_F(π) up to an order-two central twist.
- Being a Weil q-number of a given integer weight depends only on the minimal polynomial (DWP.0/weil-q-number), so γ preserves it; −1 is a Weil number of weight 0.

*Checks.*

- For an unramified character of G\_m with value (1 + 2i) on a uniformizer and q = 5, the conjugate value (1 − 2i) again has absolute value √5.

*Source.* [ch26] §3.2, Proposition 3.10(1) and its proof, pp. 10–11: States that conjugates of a geometric representation by embeddings of its field of definition are geometric, deducing it from compatibility of the Genestier–Lafforgue and Fargues–Scholze parametrizations with automorphisms of the coefficient field.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`.

<a id="ra-3-geometric-torus-characters"></a>
### RA.3.6 Geometric characters of tori

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-torus-characters` · theorem

Let T be a torus over F and χ : T(F) → Q̄\_ℓ^× a smooth character. Then χ is geometric iff every value of χ is a Weil q-number of integer weight (values on the maximal bounded subgroup are roots of unity).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- T a torus over F (not necessarily split).

*Proof route.*

- Reduce to induced tori and then to G\_m by products and Weil restriction (ES6:functoriality/products, ES6:functoriality/weil-restriction); every torus is a quotient of an induced torus by a torus, compatibly with parameters.
- For G\_m, the parameter of χ is χ ∘ rec^{−1} under local class field theory (ES6:functoriality/tori-spectral-center), so the Frobenius eigenvalue is χ(ϖ) with ϖ a uniformizer; χ is trivial on an open subgroup of O^×, so its values there are roots of unity.

*Checks.*

- The character of G\_m(F) with χ(ϖ) = q^{1/2} and trivial on O^× is geometric of weight 1.

*Source.* [ch26] §3.2, Proposition 3.10(2) and its proof, pp. 10–11: States that a character of a torus is geometric exactly when its values are Weil q-numbers, by reduction to the multiplicative group and class field theory.

*Needs.* `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`.

<a id="ra-3-geometricity-stability"></a>
### RA.3.7 Stability of geometricity

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability` · theorem

Geometricity of irreducible smooth representations is preserved by: constituents of normalized parabolic induction i\_P^G(ρ) from geometric ρ; constituents of the normalized Jacquet module r\_P(π) of geometric π; external tensor products for G₁ × G₂; and twisting by geometric characters of G(F) factoring through G → G^{ab}.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F, P = MN a parabolic subgroup.

*Proof route.*

- Induction: L\_F(π) = i\_M ∘ L\_F(ρ) (RA.3/local-parametrization (2)); the number-field model of a constituent comes from the model of ρ, the modulus character δ\_P^{1/2} taking values in integral powers of q^{1/2} (SR.2/modulus-character).
- Jacquet modules: constituents of r\_P(π) have the cuspidal support of π (SR.3/cuspidal-support), so their parameters compose with i\_M to L\_F(π); i\_M is a closed embedding (RA.0/geometricity-is-intrinsic (c)).
- Products and twists: ES6:functoriality/products and ES6:functoriality/twisting-by-abelianized-characters, with RA.3/geometric-torus-characters for the character.

*Checks.*

- Every irreducible constituent of an unramified principal series of PGL₂ induced from a character with value q^{1/2} on a uniformizer is geometric (the trivial and Steinberg representations).

*Source.* [ch26] §3.2, Proposition 3.10(3) and its proof, pp. 10–11: States that geometricity is preserved under normalized parabolic induction, Jacquet modules, direct products and twists by geometric characters.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-torus-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic`.

<a id="ra-3-geometric-central-characters"></a>
### RA.3.8 Central characters of geometric representations

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters` · theorem

If π is geometric then its central character ω\_π : Z\_G(F) → Q̄\_ℓ^× is geometric (a geometric character of the torus Z\_G^∘(F), with root-of-unity values on the finite part).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F with centre Z\_G.

*Proof route.*

- For connected centre: the composite of L\_F(π) with Ĝ → Ẑ is the parameter of ω\_π (ES6:functoriality/central-characters-and-twisting); compose with RA.0/geometricity-is-intrinsic (c) and RA.3/geometric-torus-characters.
- In general restrict to the identity component Z\_G^∘ through a z-embedding (ES6:functoriality/z-embedding-central-character-comparison); on the finite quotient the character has finite order.

*Checks.*

- For G = GL\_n and π = St\_n, ω\_π is trivial.

*Source.* [ch26] §3.2, Proposition 3.10(4) and its proof, pp. 10–11: States that the central character of a geometric representation of any reductive group is geometric, because restriction to the centre corresponds to representations of LG factoring through the L-group of the centre.

*Needs.* `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-torus-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic`.

## Layer RA.4: Discrete series: globalization, purity and Galois conjugation

**Targets.** ι-tempered and ι-discrete representations (Definition 4.1); the Gan–Harris–Sawin globalizations with irreducible global parameter (Proposition 3.9, Proposition 3.11, Beuzart-Plessis's Lemma A.1) and the Weil–Deligne purity of discrete series (Theorem 1.2, Corollary 3.12); geometricity of discrete series (Proposition 3.10(5)); Galois conjugation of discrete series with algebraic models (Theorem 4.2, second assertion) and embedding independence of temperedness for geometric components (Theorem 4.3 under its geometricity hypothesis).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3`, `FunctionFieldArithmetic:FA.6`, `KloostermanSheavesAndBesselIsocrystals:KB.1`, `KloostermanSheavesAndBesselIsocrystals:KB.11`, `KloostermanSheavesAndBesselIsocrystals:KB.6`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`.

<a id="ra-4-iota-tempered"></a>
### RA.4.1 ι-tempered and ι-discrete representations

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/iota-tempered` · definition · planet: ι-temperedness

Let π be an irreducible admissible representation of G(F) defined over Q̄ and ι : Q̄ → ℂ an embedding. π is ι-tempered (resp. ι-discrete series) when π ⊗\_{Q̄, ι} ℂ is tempered (resp. square-integrable modulo the centre) in the sense of SR.3. π is tempered (resp. discrete series) in the absolute sense when this holds for every embedding ι′.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F; π irreducible admissible over Q̄.

*Construction.*

- Temperedness of π ⊗\_ι ℂ is Casselman's criterion on the exponents of its Jacquet modules (SR.3/casselman-criterion); the exponents of π ⊗\_{ι′} ℂ are the ι′-images of the algebraic exponents of π.
- Hence ι-temperedness depends only on the absolute values |ι(χ(a))| of the exponents χ of π.

*API.*

- `QbarRep.IsIotaTempered` (data): π ⊗\_ι ℂ is tempered.
- `QbarRep.IsIotaDiscrete` (data): π ⊗\_ι ℂ is square-integrable modulo the centre.
- `QbarRep.IsTempered` (data): ι′-tempered for every ι′ : Q̄ → ℂ.
- `QbarRep.isIotaTempered_iff_exponents` (characterisation): ι-tempered iff |ι(χ(a))| ≤ 1 for every exponent χ of a standard Jacquet module and a in the negative cone (SR.3/casselman-criterion).
- `QbarRep.isTempered_of_weil_exponents` (relation): If every exponent value is a Weil q-number of integer weight, ι-tempered for one ι implies tempered (RA.4/embedding-independent-temperedness).

*Unit tests.*

- `QbarRep.salem_principal_series` (non-example): For PGL₂ and the unramified principal series with Satake parameter diag(ζ, ζ^{−1}), ζ a root of x⁴ − x³ − x² − x + 1 on the unit circle, π is ι-tempered for ι keeping ζ on the circle but not ι′-tempered for ι′ sending ζ to the Salem number 1.7221…
- `QbarRep.trivial_compact` (degenerate): For G anisotropic (G(F) compact) every irreducible π is ι-discrete series for every ι.
- `QbarRep.unitary_weight_zero` (computation): For PGL₂ and Satake parameter diag(ζ, ζ^{−1}) with ζ = (3 + 4i)/5, π is tempered for every ι (all conjugates of ζ have absolute value 1).
- `QbarRep.steinberg` (compatibility): The Steinberg representation of PGL₂(F) is discrete series for every ι, matching the complex Steinberg representation of SR.3/steinberg.

*Checks.*

- If all exponents of π are Weil q-numbers of integer weights, ι-temperedness does not depend on ι.
- The definition requires a Q̄-model; a complex representation without such a model has no ι-conjugates.

*Uses.* Ciubotaru–Harris, Theorems 4.2–4.3, p. 11: the embedding independence of discrete series and of tempered local components; Ciubotaru–Harris, Theorem 5.4, p. 13: the anchor and the conclusion of the generic theorem.

*Source.* [ch26] §4.1, Definition 4.1 and the paragraph after it, p. 11: Defines ι-temperedness of a representation with algebraic coefficients through its complex base change along ι, temperedness as ι′-temperedness for all embeddings, and notes that a unitary central character for one embedding need not stay unitary for another.

*Needs.* `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`.

<a id="ra-4-supercuspidal-irreducible-globalization"></a>
### RA.4.2 Globalizing supercuspidals with irreducible parameter

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization` · theorem

Let G be connected reductive over a global function field K, z a place with K\_z ≅ F and π a supercuspidal representation of G(F). There are infinitely many cuspidal automorphic Π of G(A\_K) with Π\_z ≅ π whose global parameter L(Π) lies in no proper parabolic subgroup of LG. Hence L\_F(π) has a pure completion realized as the restriction of L(Π) to the decomposition group at z.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G connected reductive over K; z a place of K.

*Proof route.*

- Choose a place x ≠ z where G is split (infinitely many: places splitting completely in a splitting field).
- At x take the local component π′ at ∞ of the Heinloth–Ngô–Yun Kloosterman automorphic representation over P¹\_{k(x)}; its parameter is the Kloosterman Ĝ-local system (KB.1/eigenobject, identified with Lafforgue's parameter by Satake compatibility and Chebotarev, GHS Remark 3.10), whose inertia image at ∞ has no adjoint invariants (KB.6/rigidity-local; Xu–Zhu remove the HNY prime restrictions, KB.11/all-prime-corollaries), so L\_F(π′) lies in no proper Levi.
- Gan–Lomelí's Poincaré-series globalization gives cuspidal Π with Π\_x ≅ π′, Π\_z ≅ π and tame components elsewhere (requested from FA.6).
- L(Π)|\_{W\_x}^{ss} = L\_F(π′) (RA.3/local-parametrization (1)) is irreducible, so L(Π) is; RA.1/local-purity-of-irreducible-parameters gives the pure completion at z.

*Checks.*

- For G = PGL₂ the Kloosterman parameter at ∞ is the Kloosterman sheaf Kl₂, whose ∞-inertia acts irreducibly (Swan conductor 1).

*Source.* [ghs] §3.3, Proposition 3.9 and its proof, Remark 3.10, pp. 10–11: Constructs, for a supercuspidal at one place, infinitely many cuspidal globalizations with irreducible global parameter, using the Kloosterman representation at an auxiliary split place (with Xu–Zhu removing the prime restrictions of Heinloth–Ngô–Yun) and the Poincaré-series globalization of Gan–Lomelí.; [glo] Theorem 1.1, pp. 1–2: Globalizes prescribed supercuspidals at a finite set of places to a cuspidal representation whose other local components are depth-zero principal series constituents, with prescribed central character.; [hny] Theorem 2, p. 17 (arXiv v1): Computes, for split almost-simple G, that the adjoint Kloosterman local system has Swan conductor equal to the rank at ∞ and no inertia invariants there, for p good when G is not simply laced.

*Needs.* `KloostermanSheavesAndBesselIsocrystals:KB.1/eigenobject`, `KloostermanSheavesAndBesselIsocrystals:KB.6/rigidity-local`, `KloostermanSheavesAndBesselIsocrystals:KB.11/all-prime-corollaries`, `FunctionFieldArithmetic:FA.6`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/local-purity-of-irreducible-parameters`.

<a id="ra-4-discrete-series-pseudo-globalization"></a>
### RA.4.3 Beuzart-Plessis's pseudo-globalization of discrete series

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization` · theorem

Let G be connected reductive over K with Z⁰ the identity component of its centre, ξ a character of Z⁰(K)∖Z⁰(A\_K), S\_ram the places where G or ξ ramify, and S, S′ ⊂ |X| disjoint with S′ ∩ S\_ram = ∅. For v ∈ S let π\_v be discrete series with central character ξ\_v on Z⁰(K\_v), at least one π\_{v₀} supercuspidal; for v ∈ S′ let X\_v be a proper Zariski-closed subset of the unramified characters with central character ξ\_v. Then there is a cuspidal automorphic Π with central character ξ on Z⁰(A\_K) such that Π\_v has nonzero trace against a pseudo-coefficient of π\_v for v ∈ S (so Π\_v and π\_v have the same cuspidal support), and Π\_v is unramified with Satake parameter outside X\_v for v ∈ S′. It is not asserted that Π\_v ≅ π\_v for v ∈ S ∖ {v₀}.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G connected reductive over K; pseudo-coefficients exist by the trace Paley–Wiener theorem.

*Proof route.*

- Choose f = ⊗f\_v: pseudo-coefficients at S (a matrix coefficient of π\_{v₀}^∨ at v₀), Hecke functions at S′ whose Satake transforms vanish on X\_v, units almost everywhere, and support meeting only regular elliptic classes.
- Apply the Deligne–Kazhdan simple trace formula: the spectral side counts exactly the Π of the conclusion.
- Find a regular elliptic δ ∈ G(K) with nonzero local orbital integrals at S ∪ S′ (Lemma A.3), using weak approximation up to the finite-index open closure of G(K) in G(K\_{S∪S′}) and Beuzart-Plessis's elliptic orthogonality for discrete-series characters; shrink an auxiliary support so that only δ contributes.

*Checks.*

- For S = {v₀} (one supercuspidal) the conclusion gives Π\_{v₀} ≅ π\_{v₀}: a matrix coefficient of a supercuspidal detects it.

*Source.* [ghs] Appendix A (R. Beuzart-Plessis), Lemma A.1 and its proof with Lemma A.3, pp. 38–40: Proves the existence of a cuspidal representation with nonzero traces against pseudo-coefficients of prescribed discrete series at a finite set of places (one of them supercuspidal) and unramified components avoiding prescribed closed sets elsewhere, via the Deligne–Kazhdan simple trace formula.; [glo] §8, Lemma 8.1 and Proposition 8.2 with the remark after it, pp. 38–40: Shows that nonzero trace against a pseudo-coefficient gives the same supercuspidal support; proves the semisimple-group version of the globalization conditionally on its Working Hypothesis II (a simple trace formula), which Beuzart-Plessis's lemma replaces; and states explicitly that the global representation need not have the prescribed discrete series as local component.

*Needs.* `FunctionFieldArithmetic:FA.6`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`, `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`, `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`.

<a id="ra-4-discrete-series-irreducible-globalization"></a>
### RA.4.4 Discrete series parameters realized in irreducible global parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-irreducible-globalization` · theorem

Let π be an essentially discrete series representation of G(F). There is a cuspidal automorphic Π of G over a global function field K with K\_z ≅ F such that L\_F(Π\_z) = L\_F(π) and L(Π) lies in no proper parabolic subgroup. Hence L\_F(π) admits a pure completion L(π), realized as the restriction of L(Π) at z.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G connected reductive; any K, z with K\_z ≅ F and G defined over K (as in GHS).

*Proof route.*

- Take x and π′ as in RA.4/supercuspidal-irreducible-globalization.
- Apply RA.4/discrete-series-pseudo-globalization with S = {x, z}, π\_x = π′ supercuspidal and π\_z = π: Π\_x ≅ π′ and Π\_z has the cuspidal support of π, so L\_F(Π\_z) = L\_F(π) by RA.3/local-parametrization (2).
- L(Π) is irreducible since its restriction at x is; RA.1/local-purity-of-irreducible-parameters.

*Checks.*

- For PGL₂ the only infinite-dimensional constituent with the cuspidal support of St is St itself, so Π\_z ≅ St (local components of cuspidal representations of PGL₂ are generic); for groups with non-generic cuspidal representations, such as Sp₄, Π\_z may be a non-tempered constituent with the same support, and only the common semisimple parameter is used.

*Source.* [ghs] §3.3, Proposition 3.11 and its proof, p. 11: Proves that an essentially discrete series representation has the same semisimple parameter as a local component of a cuspidal representation with irreducible global parameter, using the appendix lemma, and stresses that the local component need not be the given discrete series.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/local-purity-of-irreducible-parameters`.

<a id="ra-4-weil-deligne-purity-of-discrete-series"></a>
### RA.4.5 Weil–Deligne purity of discrete series

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series` · theorem · planet: Weil–Deligne purity of discrete series

Let G be connected reductive over F and π an irreducible discrete series representation of G(F). There is a unique essentially tempered L-parameter L(π) whose semisimple parameter is L\_F(π); it is ι-pure for every ι. If G is semisimple, τ ∘ L(π) is a pure Weil–Deligne representation of weight 0 for every algebraic representation τ of LG; in particular L\_F(π) is geometric with weights symmetric about 0.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F of any characteristic p (the published version has no restriction on p; the arXiv v3 version assumed p > 3).

*Proof route.*

- Existence: RA.4/discrete-series-irreducible-globalization; uniqueness: RA.0/pure-completion-uniqueness.
- ι-purity for every ι: the global input RA.1/sawin-templier-purity holds for every ι (GHS Remark 3.13).
- Semisimple G: τ ∘ L(π) is pure of some weight w; its determinant factors through the finite Galois quotient of LG (Ĝ semisimple), hence has finite order and weight 0, so w·dim τ = 0 (GHS Corollary 3.12 for the adjoint representation; the same argument for every τ).
- A pure Weil–Deligne representation has Weil-number Frobenius eigenvalues (condition (i)), so L\_F(π) is geometric.

*Checks.*

- For G = PGL₂ and π = St, L(π) is the Steinberg parameter and τ = standard of SL₂ gives Sp(2) twisted by q^{−1/2}: weights 1 and −1, pure of weight 0.

*Source.* [ghs] §1, Theorem 1.2 and Corollary 1.3, p. 3; §3.3, Corollary 3.12 and Remark 3.13, p. 11: Proves that the Genestier–Lafforgue parameter of a discrete series has a unique essentially tempered refinement, that for semisimple G its composite with the adjoint representation is pure of weight 0, and that the refinement is ι-pure for every ι.; [ch26] §4.2, paragraph after Proposition 4.5, p. 12; proof of Theorem 5.4, p. 14: Uses the Gan–Harris–Sawin purity of discrete series in the form 'τ ∘ L\_F(π\_u) extends uniquely to a pure Weil–Deligne representation of weight 0 for every τ'.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-completion-uniqueness`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/sawin-templier-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter`.

<a id="ra-4-geometric-discrete-series"></a>
### RA.4.6 Discrete series with algebraic models are geometric

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series` · theorem

Let G be semisimple over F and π an irreducible representation over Q̄ (with a number-field model) such that π ⊗\_ι ℂ is discrete series for one ι. Then π is geometric (RA.3/geometric-representation). For reductive G the same holds when the central character of π is geometric.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).

*Proof route.*

- Choose a field isomorphism Q̄\_ℓ ≅ ℂ restricting to ι ∘ ι\_ℓ^{−1} on ι\_ℓ(Q̄); then π ⊗ Q̄\_ℓ is a discrete series for that isomorphism and RA.4/weil-deligne-purity-of-discrete-series applies.
- Purity of τ ∘ L(π) gives Weil-number Frobenius eigenvalues of integer weight.
- Reductive G: the twist in the essential purity is governed by the central character through LG → L(Z\_G); a geometric central character (RA.3/geometric-central-characters) makes the twist a Weil number.

*Checks.*

- The Steinberg representation of PGL₂(F) is geometric with weights ±1 in the standard representation.

*Source.* [ch26] §3.2, Proposition 3.10(5) and the last line of its proof, p. 11: States that a discrete series with geometric central character is geometric, automatically for semisimple G, deducing it from the Gan–Harris–Sawin theorem.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters`.

<a id="ra-4-galois-conjugation-of-discrete-series"></a>
### RA.4.7 Galois conjugates of discrete series are discrete series

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/galois-conjugation-of-discrete-series` · theorem · planet: Galois conjugation of discrete series

Let G be semisimple over F and π an irreducible representation over Q̄ such that π ⊗\_ι ℂ is discrete series for one ι. Then π ⊗\_{ι′} ℂ is discrete series for every ι′ : Q̄ → ℂ. The assertion of Ciubotaru–Harris Theorem 4.2 that every complex discrete series of G(F) has a number-field model is not established by the cited argument (gap G2).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- π is assumed to have a model over Q̄; this holds for local components of cuspidal representations (RA.2/rational-satake-parameters) and for supercuspidals (RA.4/supercuspidal-irreducible-globalization).

*Proof route.*

- By RA.4/geometric-discrete-series, L\_F(π) is geometric; the exponents of π (central characters of the constituents of its Jacquet modules on the split centres A\_M) are geometric by RA.3/geometricity-stability and RA.3/geometric-central-characters, so their values are Weil q-numbers of integer weights.
- Casselman's strict inequalities for ι (SR.3/casselman-criterion) are inequalities between integer weights, which do not depend on the embedding; hence π ⊗\_{ι′} ℂ is square-integrable.

*Checks.*

- For PGL₂ the Steinberg representation and the supercuspidals have conjugates of the same kind for every ι.

*Source.* [ch26] §4.1, Theorem 4.2 and the sketch (1)–(4) after Theorem 4.3, pp. 11–12: States that complex discrete series have number-field models whose Galois conjugates are discrete series, attributing it to Gan–Harris–Sawin, and sketches a proof via globalization, geometricity of the exponents and Casselman's criterion; the globalization step only gives the same cuspidal support (source issue GlobalShtukasAndFunctionFieldLanglandsPartII/E1).

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/iota-tempered`.

<a id="ra-4-embedding-independent-temperedness"></a>
### RA.4.8 Embedding independence of temperedness for geometric components

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/embedding-independent-temperedness` · theorem

Let Π be a cuspidal automorphic representation of semisimple G over K, defined over a number field, and v a place such that L\_F(Π\_v) is geometric. If Π\_v is ι-tempered for one ι then it is tempered (for every ι′). Without the geometricity hypothesis the statement (Ciubotaru–Harris Theorem 4.3) is not established (PAPER-CIUBOTARU-HARRIS-26/E10; gap G3).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).

*Proof route.*

- Π\_v ⊂ i\_P^G(ρ) with ρ ι-discrete series of M with ι-unitary central character; the exponents of Π\_v are those of the cuspidal support, which are geometric by RA.3/geometricity-stability when L\_F(Π\_v) is geometric.
- Casselman's criterion (SR.3/casselman-criterion) is then an inequality between integer weights, independent of ι.

*Checks.*

- When L\_F(Π\_v) is unramified with Satake parameter of real part 0 for one ι and Weil-number eigenvalues, temperedness holds for all ι.

*Source.* [ch26] §4.1, Theorem 4.3 and step (2) of the sketch, p. 11: Asserts that an ι-tempered local component of a cuspidal representation is tempered for every embedding; the sketch assumes that the local monodromy of every L(Π, τ) is geometric, which is the gap recorded as E10 by the extraction.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/iota-tempered`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`.

## Layer RA.5: The generic Ramanujan theorem

**Targets.** The test representations of the dual group (the table after Theorem 5.4), the lift of a parameter to the L-group of the adjoint group over a finite extension (p. 14, footnote 6, extended to types A, B and E₇ by E12), integrality of Frobenius weights from a tempered or discrete-series place, Theorem 5.4 with the scope corrections E11 and E13, and Corollary 5.7 (propagation of genericity).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4`, `DeligneWeightsAndPurity:DWP.5`, `DeligneWeightsAndPurity:DWP.8`, `LieHighestWeightPartII:N0`, `LieHighestWeightPartII:N5`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7`.

<a id="ra-5-test-representations"></a>
### RA.5.1 Test representations of the dual group

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/test-representations` · definition · planet: Test representations of the dual group

For G absolutely simple over K, let G^{ad} be its adjoint group, whose dual Ĝ\_sc is simply connected. The test set T(G) consists of the adjoint representation of Ĝ\_sc and, by type of G: A\_{n−1} with n even, the standard representation V(ω̂₁) of SL\_n; B\_n, the standard representation V(ω̂\_n) of Sp\_{2n}; C\_n, the spin representation V(ω̂₁) of Spin\_{2n+1}; D\_n, the half-spin V(ω̂₁) and the vector representation V(ω̂\_n) of Spin\_{2n} (Ciubotaru–Harris numbering); E₇, the 56-dimensional V(ω̂₇); for A\_{n−1} with n odd, E₆, E₈, F₄ and G₂, the adjoint representation alone. For G not adjoint these are representations of L(G^{ad}), used after lifting the parameter (RA.5/adjoint-lift).

*Hypotheses and conventions.*

- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- G absolutely simple; numbering of fundamental weights as in Ciubotaru–Harris §6 and the SRU.5 nodes.

*Construction.*

- The list is the one for which SRU.5/fundamental-separators shows that every nonzero half-integral generic unitary point left by the adjoint representation is not half-integral for some member.
- For nonsplit unramified G the members restrict to G^∨(τ) as in SRU.6/nonsplit-generic-temperedness.

*API.*

- `testWeights` (constructor): The finite list of fundamental weights ω̂ᵢ of Ĝ\_sc used beside the adjoint representation, by Cartan type; T(G) is the adjoint representation together with the V(ω̂ᵢ).
- `TestReps.adjoint_mem` (other): The adjoint representation is always in T(G).
- `TestReps.separates` (characterisation): A generic unitary real point ν of the split adjoint form that is half-integral for every member of T(G) is 0 (SRU.5/generic-temperedness-test).
- `TestReps.restrict_tau_fixed` (compatibility): For nonsplit unramified G, the members restrict to the representations of G^∨(τ) used in SRU.6.

*Unit tests.*

- `TestReps.pgl2` (computation): T(PGL₂) = {adjoint, standard of SL₂}; ½ω (the PGL₂ point ½ω\_{n/2}) pairs to ¼ with the standard weight, so it is excluded.
- `TestReps.pgl3` (degenerate): T(PGL₃) is the adjoint representation alone: no nonzero half-integral generic unitary point exists for PGL₃ (SRU.5/half-integral-type-a).
- `TestReps.cn_needs_spin` (non-example): For PSp\_{2n} the vector representation of SO\_{2n+1} does not separate ½ω\_n (it factors through SO\_{2n+1}); the spin representation is required.
- `TestReps.dn_needs_both` (non-example): For PSO\_{2n}, n even, the spin representation alone leaves ½ω₁ and ½ω₂, and the vector representation alone leaves ½ω\_n; both are needed.

*Checks.*

- For G = PGL₂ (n = 2) the test set is {adjoint, standard of SL₂}; for G = PGL₃ it is {adjoint}.

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, p. 14: half-integrality is imposed for the adjoint representation and τ₀.

*Source.* [ch26] §5, the table after Theorem 5.4, p. 13; §6.12, Proposition 6.31, p. 24: Lists, for adjoint groups of each type, the highest weight of the representation of the dual group to use beside the adjoint representation, and checks that it separates the extra half-integral points.

*Needs.* `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/fundamental-separators`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6/nonsplit-generic-temperedness`, `LieHighestWeightPartII:N5/highest-weight-test`.

<a id="ra-5-adjoint-lift"></a>
### RA.5.2 Lifting a parameter to the L-group of the adjoint group

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift` · construction

Let σ : Gal(K^sep/K) → LG(Q̄\_ℓ) be continuous with image in LG(E) for a finite E/Q\_ℓ, and LG^{ad} → LG the central extension dual to G → G^{ad} (kernel the finite centre Z of Ĝ\_sc). There is a finite separable K′/K and a continuous lift σ̃′ : Gal(K^sep/K′) → LG^{ad}(Q̄\_ℓ) of σ|\_{Gal(K^sep/K′)}. For every place u′ of K′ over u, every τ ∈ T(G) and every place w′ unramified for σ̃′, the real part of σ̃′(Frob\_{w′}) equals that of σ(Frob\_{w′}), and τ ∘ σ̃′ is geometric at u′ when σ|\_{u}^{ss} has a pure completion of weight 0.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- This is needed when G is not adjoint and T(G) contains a representation not factoring through LG: types A\_{n−1} (n even), B\_n, C\_n, D\_n and E₇ (PAPER-CIUBOTARU-HARRIS-26/E12; the source writes the lift for types C and D only).

*Construction.*

- The image of σ is a compact ℓ-adic Lie group; an open subgroup lifts through the finite central extension (de Jong's remark, Ciubotaru–Harris footnote 6), giving K′; equivalently the obstruction in H²(Gal(K^sep/K), Z) dies on a finite extension.
- Lifts differ from σ by elements of the finite group Z, which do not change absolute values: real parts agree.
- At u′, the pure completion of σ|\_u^{ss} has Frobenius real part q^{h/2} for a neutral element h of an sl₂-triple (RA.0/pure-completion-uniqueness), and ⟨λ, h/2⟩ ∈ ½ℤ for every weight λ of every representation of Ĝ\_sc (sl₂-theory); the bounded part has eigenvalues that are roots of Weil numbers of weight 0.

*API.*

- `ParamLift.field` (data): The finite extension K′/K over which the lift exists.
- `ParamLift.lift` (constructor): The lift σ̃′ : Gal(K^sep/K′) → LG^{ad}(Q̄\_ℓ).
- `ParamLift.lift_proj` (characterisation): Composing σ̃′ with LG^{ad} → LG gives σ restricted to K′.
- `ParamLift.realPart_eq` (relation): Real parts of Frobenius classes of σ̃′ and σ agree.
- `ParamLift.unique_up_to_center` (extensionality): Two lifts differ by a continuous character Gal(K^sep/K′) → Z.

*Unit tests.*

- `ParamLift.adjoint_trivial` (degenerate): If G is adjoint then LG^{ad} = LG, K′ = K and σ̃′ = σ.
- `ParamLift.sl2` (computation): For G = SL₂ and σ with values in PGL₂(Q̄\_ℓ), the lift exists over K′ where the image of the Brauer class of σ in Br(K′)[2] vanishes.
- `ParamLift.no_lift_over_K` (non-example): A projective representation with nonzero obstruction in H²(Gal(K^sep/K), μ₂) has no lift over K itself, so passing to K′ is necessary.
- `ParamLift.realPart_compat` (compatibility): The real part of σ̃′(Frob\_{w′}) equals that of σ(Frob\_{w′}) as elements of t̂\_ℝ (the isogeny Ĝ\_sc → Ĝ is an isomorphism on Lie algebras).

*Checks.*

- For G = SL₂ (Ĝ = PGL₂, LG^{ad} ∋ SL₂) a projective representation σ lifts to SL₂ after a finite extension killing its Brauer obstruction; the standard representation of SL₂ is then available.

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, p. 14: the test representation τ₀ composed with the lift; Ciubotaru–Harris, §10.1, p. 32: the reduction of Theorem 1.11 to adjoint G.

*Source.* [ch26] §5, proof of Theorem 5.4, p. 14 and footnote 6: Reduces the non-adjoint case to the adjoint one by restricting the parameter to a finite extension over which it lifts to the L-group of the adjoint group, and composing the lift with τ₀; the footnote obtains the lift from an open subgroup of the compact image.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-completion-uniqueness`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/cuspidal-parameter-local-systems`, `LieHighestWeightPartII:N0/jacobson-morozov`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`.

<a id="ra-5-integral-weights-from-anchor"></a>
### RA.5.3 Integrality of Frobenius weights from a tempered place

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/integral-weights-from-anchor` · theorem · planet: Integrality of Frobenius weights

Let π ⊂ A₀(G, Q̄) belong to σ (RA.2/cuspidal-parameter-local-systems) and let u be a place. (a) If π\_u is ι-tempered, then for every algebraic τ of LG the sheaf L(π, τ) has integer punctual ι-weights, and ⟨α, ν\_w^ι(σ)⟩ ∈ ½ℤ for every weight α of τ and every w ∉ S. (b) If π\_u is ι-discrete series, then for every τ the eigenvalues of τ(σ(Frob\_w)), w ∉ S, are Weil q\_w-numbers of integer weights (σ is geometric at every unramified place) and L(π, τ) has the weight filtration of RA.1/geometric-boundary-propagation. The same holds for τ ∈ T(G) composed with the lift σ̃′ of RA.5/adjoint-lift.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- u may lie in S or outside it (PAPER-CIUBOTARU-HARRIS-26/E13).

*Proof route.*

- (b) By RA.4/geometric-discrete-series π\_u is geometric; by RA.3/local-parametrization (1) the semisimplified restriction of τ ∘ σ to W\_{K\_u} is τ ∘ L\_F(π\_u), hence geometric; apply RA.1/geometric-boundary-propagation to L(π, τ).
- (a) π\_u is a constituent of i\_P^G(ρ) with ρ ι-discrete series of M and ι-unitary central character; the essentially pure L(ρ) (RA.4/weil-deligne-purity-of-discrete-series for M) has Frobenius real part q^{h/2} up to a central twist whose ι-weight is 0, so τ ∘ L\_F(π\_u) has integer ι-weights; Deligne's decomposition of L(π, τ) by ι-weights modulo ℤ (DWP.8/weight-decomposition-modulo-z-3-4-1-i) and the local monodromy theorem at u leave only the integer class.
- The half-integrality is RA.2/satake-real-part (halfIntegral\_of\_integerWeights).
- For τ ∈ T(G) use RA.5/adjoint-lift at the places of K′.

*Checks.*

- For G = PGL₂ and π attached to an elliptic curve with split multiplicative reduction at u (π\_u Steinberg), (b) recovers Deligne's purity: all Frobenius traces at good places are q\_w^{1/2} times algebraic numbers of absolute value at most 2.

*Source.* [ch26] §5, proof of Theorem 5.4, pp. 14–15: Uses the purity of the discrete-series parameter at u and the uniqueness of the twist decomposition (5.5) to show that every L(π, τ) is mixed with integer weights, so that the real part at every unramified place is half-integral (5.6); the tempered case reduces to the discrete series of a Levi subgroup.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/geometric-boundary-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `DeligneWeightsAndPurity:DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/constant-field-weight-decomposition`.

<a id="ra-5-generic-ramanujan"></a>
### RA.5.4 The generic Ramanujan theorem over function fields

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan` · theorem · planet: Generic Ramanujan theorem

Let G be connected absolutely simple over K and π ⊂ A₀(G, Q̄) with m\_U(π) ≠ 0 belonging to σ. Assume (1) at a place v ∉ S where G\_{K\_v} is unramified quasi-split and not the quasi-split form of PSU(2n+1), π\_v ⊗\_ι ℂ is generic and the compact part of its Satake parameter ι(s\_v(σ)) is central in Ĝ (for example, a real Satake parameter); (2) at a place u, π\_u is ι-tempered. Then π\_w ⊗\_ι ℂ is tempered for every w ∉ S, and every irreducible constituent of every L(π, τ) is ι-pure of weight 0. If π\_u is ι-discrete series, π\_w is tempered for every embedding and every L(π, τ) is pure of weight 0.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- G absolutely simple; v ∉ S so U\_v is hyperspecial. The centrality condition at v is the scope correction of PAPER-CIUBOTARU-HARRIS-26/E11 (the source states the theorem without it); u may be any place (E13).
- The source's abstract mentions a mild residue-field restriction coming from the arXiv version of Gan–Harris–Sawin; with the published version none is needed.

*Proof route.*

- RA.5/integral-weights-from-anchor gives ⟨α, ν\_v^ι(σ)⟩ ∈ ½ℤ for the adjoint representation and, through RA.5/adjoint-lift, for every τ ∈ T(G) (RA.5/test-representations).
- π\_v ⊗\_ι ℂ is unitary (RA.2/rational-satake-parameters), spherical and generic with central compact part. For non-adjoint G it is trivial on the centre and the classification is applied to the adjoint group (Ciubotaru–Harris §1.1, p. 3): the real part lifts uniquely to Ĝ\_sc and a central compact part lifts to a central element of Ĝ\_sc. SRU.5/generic-temperedness-test (G\_{K\_v} split) or SRU.6/nonsplit-generic-temperedness (nonsplit) gives ν\_v^ι(σ) = 0.
- Then every constituent of L(π, τ) has ι-weight 0 at v; since the constituents are ι-pure of integer weight (previous step and DWP.8 weight filtration), they are all of weight 0, so ν\_w^ι(σ) = 0 for every w ∉ S.
- Temperedness at w: SRU.5/spherical-tempered-criterion (split) and Casselman's criterion (SR.3/casselman-criterion) in general. For the discrete-series anchor the weights are Weil numbers, so the conclusion holds for every ι.

*Checks.*

- For G = PGL₂ and π\_u Steinberg, the theorem is the Ramanujan conjecture for those π (known by Drinfeld); the hypothesis at v holds automatically, since every unramified generic unitary π\_v of PGL₂ has Satake parameter with central compact part or is tempered.
- The quasi-split PSU(2n+1) case is excluded: SRU.6/odd-unitary-residual leaves the point ½ω\_n.
- Without the centrality condition the local step fails: SRU.5/g2-noncentral-witness.

*Source.* [ch26] §1.1, the main theorem and the outline of its proof, pp. 2–3; §5, Theorem 5.4 and its proof, pp. 13–15: States and proves that a cuspidal representation of an absolutely simple group, generic at an unramified quasi-split place (not odd quasi-split unitary) and tempered at another place, is tempered at every unramified place, via integrality of weights and the classification of generic unitary spherical representations; the scope corrections E11–E13 apply.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/integral-weights-from-anchor`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/test-representations`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/generic-temperedness-test`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6/nonsplit-generic-temperedness`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/spherical-tempered-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`.

<a id="ra-5-genericity-propagation"></a>
### RA.5.5 Propagation of genericity

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/genericity-propagation` · theorem

Under the hypotheses of RA.5/generic-ramanujan, π\_w ⊗\_ι ℂ is generic at every w ∉ S at which G\_{K\_w} is quasi-split; if G is quasi-split over K, π is locally generic at almost every place.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

- A spherical tempered representation of an unramified quasi-split group is generic (Reeder's Proposition 7.4 in general; SRU.5/spherical-generic-criterion for split adjoint groups, via the Kazhdan–Lusztig classification SRU.7/kazhdan-lusztig-classification: the q-eigenspace of Ad(s) vanishes for compact s, so the spherical principal series is irreducible).
- Apply this at every w ∉ S after RA.5/generic-ramanujan.

*Checks.*

- For PGL₂ every tempered spherical representation is an irreducible unitary principal series, hence generic.

*Source.* [ch26] §5, Corollary 5.7 and its proof, p. 15: Deduces genericity of all unramified quasi-split components from their temperedness, using that spherical tempered representations are generic (Reeder in general, Kazhdan–Lusztig for split adjoint groups).

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/spherical-generic-criterion`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/kazhdan-lusztig-classification`.

## Layer RA.6: Elliptic parameters and the stack-purity route

**Targets.** Elliptic global parameters and their temperedness at unramified places (Sawin–Templier Lemmas 11.4–11.5, Lafforgue–Zhu §3); the Lafforgue–Zhu decomposition over elliptic parameters (Proposition 1.2); realisability in stack cohomology (Expectation 5.9) and integrality of the weights of realisable sheaves (Sketch 5.10, after Sun's Theorem 2.11).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `GlobalShtukasAndFunctionFieldLanglands:GS.2`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `LanglandsParameterStacks:LP2:semisimple-characters`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5`.

<a id="ra-6-elliptic-parameter"></a>
### RA.6.1 Elliptic global parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-parameter` · definition · planet: Elliptic parameter

For a continuous semisimple σ : Gal(K^sep/K) → LG(Q̄\_ℓ) let S\_σ be the centralizer in Ĝ of its image. σ is elliptic when S\_σ / (Z(Ĝ))^{Gal(K̃/K)} is finite; equivalently (for semisimple σ) its image lies in no proper Levi subgroup of LG, equivalently (Ad⁰)^σ = 0 for the adjoint representation on Lie(Ĝ)/Lie(Z(Ĝ)).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).

*Construction.*

- The Lie algebra of S\_σ is the σ-invariants of Ad, and that of the centre's invariants is that of the centre, so finiteness of the quotient is the vanishing of (Ad⁰)^σ.
- A semisimple σ in a proper Levi M is centralized by the connected centre of M̂, a positive-dimensional torus modulo Z(Ĝ); conversely a positive-dimensional reductive S\_σ contains a torus whose centralizer is a proper Levi containing the image.

*API.*

- `GlobalParam.IsElliptic` (data): S\_σ/(Z(Ĝ))^Γ is finite.
- `GlobalParam.isElliptic_iff_adInvariants` (characterisation): σ elliptic iff (Ad⁰ ∘ σ)^{Gal} = 0.
- `GlobalParam.isElliptic_iff_noProperLevi` (characterisation): For semisimple σ, elliptic iff the image lies in no proper Levi, iff no proper parabolic of LG contains it.
- `GlobalParam.IsElliptic.centralizer_finite` (projection): The finite group 𝒮\_σ = S\_σ/(Z(Ĝ))^Γ acting on the Lafforgue–Zhu multiplicity space.
- `GlobalParam.isElliptic_gl_iff_irreducible` (compatibility): For G = GL\_r, elliptic iff the r-dimensional representation is irreducible.

*Unit tests.*

- `GlobalParam.gl2_reducible` (non-example): For GL₂, σ = χ₁ ⊕ χ₂ is not elliptic: S\_σ ⊇ G\_m² and S\_σ/G\_m is one-dimensional.
- `GlobalParam.torus` (degenerate): For G a torus, S\_σ = Ĝ = Z(Ĝ) and every σ is elliptic.
- `GlobalParam.sl2_klein_four` (computation): For G = SL₂ (Ĝ = PGL₂) and σ with image the Klein four-group in PGL₂ (projectively induced from each of three quadratic extensions), S\_σ is that Klein four-group: σ is elliptic with 𝒮\_σ ≅ (ℤ/2)², not stable (the Labesse–Langlands endoscopic case).
- `GlobalParam.gl_irreducible` (compatibility): For GL\_r and irreducible σ, S\_σ = G\_m = Z(Ĝ), 𝒮\_σ = 1.

*Checks.*

- For G = GL\_r, σ is elliptic iff it is irreducible (Lafforgue–Zhu §2); for G = PGL₂ (Ĝ = SL₂) every irreducible σ is elliptic and stable, its centralizer being ±1 by Schur's lemma.
- For a torus every σ is elliptic.

*Uses.* Lafforgue–Zhu, Proposition 1.2, p. 3: the decomposition of cuspidal shtuka cohomology over elliptic parameters; Ciubotaru–Harris, Remark 5.8, p. 16: elliptic parameters are tempered at unramified places.

*Source.* [lz] §1, definition before Proposition 1.2, p. 3; §2, p. 4; §3, p. 5 (Lie(S\_σ) = (Ad)^σ): Defines S\_σ as the centralizer of the image and calls σ elliptic when its quotient by the Galois-invariant centre is finite; for GL\_r ellipticity is irreducibility.; [ch26] §5, Remark 5.8, p. 16: Recalls the Lafforgue–Zhu argument that non-tempered parameters have positive-dimensional centralizer and so are not elliptic.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`.

<a id="ra-6-elliptic-implies-tempered"></a>
### RA.6.2 Elliptic parameters are tempered at unramified places

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-implies-tempered` · theorem

Let G be semisimple over K, σ ∈ Φ(U) elliptic and π belonging to σ. Then L(σ, τ) is pure of weight 0 for every algebraic τ, and π\_w ⊗\_ι ℂ is tempered for every w ∉ S and every ι.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

- An elliptic semisimple σ lies in no proper parabolic (RA.6/elliptic-parameter), so RA.1/sawin-templier-purity gives purity of weight 0 for every τ and every ι.
- Then ν\_w^ι(σ) = 0 at every w ∉ S (RA.2/satake-real-part) and π\_w is tempered (Sawin–Templier Lemma 11.5; SRU.5/spherical-tempered-criterion and SR.3/casselman-criterion).

*Checks.*

- For GL\_r (irreducible σ) this is the Ramanujan property of L. Lafforgue's correspondence.

*Source.* [st] §11, Lemmas 11.4–11.5, p. 83: For split semisimple G and Ĝ-valued ι-mixed σ, proves purity of weight zero for parameters in no proper parabolic and deduces temperedness at unramified places from Satake compatibility; the LG-valued form is RA.1/sawin-templier-purity.; [lz] §3, p. 5: Notes that a representation occurring over σ is tempered at unramified places when σ is elliptic, the adjoint invariants being the Lie algebra of the centralizer.; [ch26] §5, Remark 5.8, p. 16: Explains, after Zhu, that Theorem 5.4 is superfluous for elliptic parameters.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/sawin-templier-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/spherical-tempered-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`.

<a id="ra-6-lafforgue-zhu-decomposition"></a>
### RA.6.3 Lafforgue–Zhu decomposition over elliptic parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/lafforgue-zhu-decomposition` · theorem

Let G be split reductive over K, N a level and σ elliptic. There is a finite-dimensional Q̄\_ℓ-space A\_σ with commuting actions of the Hecke algebra of level N and of the finite group 𝒮\_σ such that, for every finite set I and every representation W of Ĝ × (LG)^I, the σ-part of cuspidal shtuka cohomology is (A\_σ ⊗ W\_{σ^I})^{S\_σ} (S\_σ the centralizer, acting on A\_σ through 𝒮\_σ), functorially in W, compatibly with coalescence, with the Γ^I-action and with change of level. In particular every irreducible constituent of τ ∘ σ occurs in the compactly supported cohomology of a stack of shtukas with one leg (Ciubotaru–Harris Expectation 5.9 holds for elliptic σ), and the σ-eigenspaces are genuine eigenspaces, semisimple as Γ^I-representations.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G split (the nonsplit case is conditional on extending Xue's finiteness to nonsplit groups, as Lafforgue–Zhu state); σ is one of Lafforgue's parameters, so it satisfies the conditions (C1)–(C5) of Lafforgue–Zhu §1 (finite coefficients, reductive Zariski closure, unramified outside a finite set, Galois projection, finite image in the abelianization).
- The one-leg consequence (Expectation 5.9) is drawn by Ciubotaru–Harris Remark 5.8, not by Lafforgue–Zhu.

*Proof route.*

- Lafforgue–Zhu §§4–5: an elliptic σ cannot be deformed among parameters satisfying (C1)–(C5) (Lemma 4.1), so the excursion algebra is reduced at σ and the functor W ↦ (H^cusp\_{I,W})\_σ is determined by its value on W = 1 with the 𝒮\_σ-action.
- The cohomology functors are those of GS.3/the-functor-H-I-W with finiteness from GS.3/integral-cuspidal-finiteness.

*Checks.*

- For GL\_r and irreducible σ, A\_σ = π^{K\_N} and (H^cusp\_{I,W})\_σ = π^{K\_N} ⊗ W\_{σ^I} (Lafforgue–Zhu Corollary 2.1).

*Source.* [lz] §1, Theorem 1.1 and Proposition 1.2 with Remarks 1.3–1.5, pp. 2–3; §4, Lemma 4.1, p. 7: Proves that over an elliptic parameter the cuspidal cohomology of stacks of shtukas is the 𝒮\_σ-invariants of a multiplicity space tensored with the composite representation, functorially and compatibly with coalescence, for split G.; [ch26] §5, Remark 5.8, p. 16: Cites Lafforgue–Zhu Proposition 1.2 as a proof of Expectation 5.9 for elliptic parameters.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-parameter`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/integral-cuspidal-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`.

<a id="ra-6-stack-realisability"></a>
### RA.6.4 Realisability in the cohomology of stacks

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability` · definition

A semisimple lisse Q̄\_ℓ-sheaf L on X ∖ |S| is realisable in stack cohomology when there are a finite set S′ ⊇ S, an algebraic stack Z of finite type over k₁ and a morphism f : Z → X ∖ |S′| such that every irreducible constituent of L|\_{X∖|S′|} is a constituent of some Rⁱf\_! Q̄\_ℓ. Ciubotaru–Harris Expectation 5.9 asks this for L(π, τ) with τ adjoint and τ ∈ T(G); it is recorded here as a hypothesis, not a theorem.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Algebraic stacks and Rf\_! as in Laszlo–Olsson (stacky six operations).

*Construction.*

- The predicate is stable under tensor products and duals of sheaves (fibre products of stacks and Verdier duality) and under restriction to smaller opens.
- For elliptic σ it holds by RA.6/lafforgue-zhu-decomposition with Z a truncated stack of one-leg shtukas.

*API.*

- `LisseSheaf.IsStackRealisable` (data): The predicate of the statement, with its witness (S′, Z, f).
- `LisseSheaf.IsStackRealisable.tensor` (functoriality): Realisable sheaves are closed under tensor product, dual and direct summand.
- `LisseSheaf.IsStackRealisable.integerWeights` (relation): A realisable sheaf has integer punctual ι-weights for every ι (RA.6/stack-purity).
- `LisseSheaf.isStackRealisable_of_elliptic` (other): L(σ, τ) is realisable for elliptic σ (RA.6/lafforgue-zhu-decomposition).

*Unit tests.*

- `LisseSheaf.realisable_constant` (degenerate): The constant sheaf on X ∖ |S| is realisable with Z = X ∖ |S| and f the identity.
- `LisseSheaf.realisable_legendre` (computation): R¹f\_! Q̄\_ℓ of the Legendre family is realisable with Z the family itself (a scheme).
- `LisseSheaf.not_realisable_three` (non-example): A rank-one sheaf with Frobenius 3 over F₄ is not realisable, having non-integral weight.
- `LisseSheaf.realisable_scheme_compat` (compatibility): When Z is a scheme the predicate is Deligne's notion of a sheaf of geometric origin up to the finite-type direct image.

*Checks.*

- The constant sheaf is realisable with Z = X ∖ |S|.
- A rank-one sheaf with Frobenius 3 over F₄ is not realisable (RA.6/stack-purity: realisable sheaves have integer weights).

*Uses.* Ciubotaru–Harris, Sketch 5.10, p. 16: the alternative proof of integrality of weights; Ciubotaru–Harris, Remark 5.8, pp. 15–16: Lafforgue–Zhu prove realisability for elliptic parameters.

*Source.* [ch26] §5, Remark 5.8 and Expectation 5.9, p. 15: Formulates the expectation that the irreducible constituents of L(π, τ), for the adjoint and test representations, occur in compactly supported direct images along finite-type morphisms of stacks of shtukas, after Lafforgue's ICM conjectures.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `DeligneWeightsAndPurity:DWP.8`.

<a id="ra-6-stack-purity"></a>
### RA.6.5 Integral weights of realisable sheaves

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity` · theorem

If L is realisable in stack cohomology (RA.6/stack-realisability), every irreducible constituent of L is punctually ι-pure of integer weight for every ι. Consequently, if L(π, τ) is realisable for τ adjoint and τ ∈ T(G), the conclusion of RA.5/generic-ramanujan holds without the anchor hypothesis (2).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- The integrality step for Artin stacks is only sketched in the source (gap G5).

*Proof route.*

- Sun's Theorem 2.11: the stacky six operations and Verdier duality preserve ι-mixedness.
- Integrality of weights for Rf\_! with f : Z → Y, Y a scheme, Z an algebraic stack: reduce to schemes by a smooth hypercover of Z and its spectral sequence, then by Verdier duality to Rf\_! of schemes, where it is Deligne's theorem (DWP.8/six-operations-preserve-mixedness-6-1-11, DWP.7).
- With integer weights for every ι, rerun the proof of RA.5/generic-ramanujan from the half-integrality step.

*Checks.*

- For Z a scheme the statement is Deligne's integrality of weights of Rf\_!.

*Source.* [ch26] §5, Expectation 5.9, Sketch 5.10, pp. 15–16: Sketches, after Olsson, that compactly supported direct images along finite-type morphisms of stacks preserve integrality of weights, via Sun's mixedness theorem, hypercovers and Verdier duality, and that this would give the generic theorem without the anchor.; [sun] §2, Theorem 2.11, p. 14 (arXiv v2): Proves that the stacky six operations and Verdier duality on algebraic stacks over a finite field preserve ι-mixed complexes.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability`, `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`, `DeligneWeightsAndPurity:DWP.7/fundamental-direct-image-theorem-3-3-1`, `DeligneWeightsAndPurity:DWP.8`.

## Layer RA.7: Arthur parameters and parametrization of the discrete spectrum

**Targets.** Global Arthur parameters over a function field and Arthur's weight prediction at unramified places in Clozel's form (Conjectures 1.3, 1.8, Expectation 1.9, recorded as predicates); compatible global parameters of discrete representations and the parametrization hypotheses (Conjectures 9.1, 9.5, Definition 9.4); rationality of the discrete spectrum under Conjecture 9.1 (Lemma 9.2); Xue's parametrization of finite-codimension Hecke quotients of compactly supported forms (Theorem 3.6.7).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2`, `DeligneWeightsAndPurity:DWP.0`, `DeligneWeightsAndPurity:DWP.5`, `FunctionFieldArithmetic:FA.6`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`, `GlobalShtukasAndFunctionFieldLanglands:GS.4`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `LanglandsParameterStacks:LP0`, `LieHighestWeightPartII:N0`.

<a id="ra-7-global-arthur-parameter"></a>
### RA.7.1 Global Arthur parameters over a function field

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/global-arthur-parameter` · definition · planet: Global Arthur parameter

Let C be an algebraically closed field of characteristic 0. A global Arthur parameter is a homomorphism ψ : W\_K × SL₂(C) → LG(C), compatible with the projection to the Galois factor, continuous on W\_K and algebraic on SL₂, up to Ĝ(C)-conjugacy. Its nilpotent invariant is the class N\_ψ of dψ(e) in Lie(Ĝ), e the upper unipotent generator of sl₂. At a place w where ψ is unramified, ψ\_w : W\_{K\_w}/I\_w × SL₂ → LG and j(Frob\_w) = diag(q\_w^{1/2}, q\_w^{−1/2}); Ψ(G, U) is the set of classes unramified outside S(U).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Construction.*

- The local parameters ψ\_w are restrictions along W\_{K\_w} → W\_K; the Weil–Deligne form of ψ\_w uses the Deligne SL₂ (a third factor) as in Ciubotaru–Harris (1.5)–(1.6).
- N\_ψ is defined by Jacobson–Morozov theory in Ĝ (LieHighestWeightPartII N0).

*API.*

- `ArthurParam.mk` (constructor): A homomorphism W\_K × SL₂(C) → LG(C) as in the statement.
- `ArthurParam.nilpotent` (projection): The nilpotent orbit N\_ψ ⊂ Lie(Ĝ).
- `ArthurParam.local` (projection): ψ\_w for each place w, unramified outside S.
- `ArthurParam.satakeAt` (data): ψ\_w(Frob\_w, j(Frob\_w)) ∈ [LG\_ss(C)] at unramified w.
- `ArthurParam.conj` (extensionality): Equivalence is Ĝ(C)-conjugacy; N\_ψ is an invariant.

*Unit tests.*

- `ArthurParam.tempered` (degenerate): If ψ is trivial on SL₂ then N\_ψ = 0 and ψ\_w(Frob\_w, j(Frob\_w)) = ψ\_w(Frob\_w) is bounded.
- `ArthurParam.pgl2_trivial` (computation): For PGL₂ and ψ = 1 ⊠ std, the unramified Satake class is diag(q\_w^{1/2}, q\_w^{−1/2}), weights ±1 in the standard representation of SL₂.
- `ArthurParam.not_l_parameter` (non-example): ψ ↦ ψ|\_{W\_K × {1}} loses N\_ψ: the trivial representation's ψ and the tempered parameter 1 have the same restriction to W\_K.
- `ArthurParam.weights_from_N` (characterisation): For bounded ψ|\_{W\_K}, the weights of τ(ψ\_w(Frob\_w, j(Frob\_w))) are the eigenvalues of the neutral element h of N\_ψ on τ (LieHighestWeightPartII N1/weight-filtration).

*Checks.*

- A tempered parameter is ψ with trivial SL₂: N\_ψ = 0.
- For G = PGL₂ and ψ = 1 ⊠ (standard of SL₂ = Ĝ), ψ(Frob\_w, j(Frob\_w)) = diag(q\_w^{1/2}, q\_w^{−1/2}), the Satake parameter of the trivial representation.

*Uses.* Ciubotaru–Harris, Conjectures 1.3, 1.8 and Expectation 1.9, pp. 4–5: the conjectural targets that Theorems 1.11 and 10.3 verify in part.

*Source.* [ch26] §1.2, (1.1)–(1.7), pp. 3–4: Defines global Arthur parameters as homomorphisms of the Weil group times SL₂ to the L-group, algebraic on SL₂, their nilpotent invariant, the local unramified parameters and the element j(Frob\_w), following Clozel's simplified form of Arthur's conjectures.

*Needs.* `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LieHighestWeightPartII:N0/jacobson-morozov`, `LieHighestWeightPartII:N0/nilpotent-orbit`.

<a id="ra-7-arthur-weight-prediction"></a>
### RA.7.2 Arthur's weight prediction at unramified places

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/arthur-weight-prediction` · definition · planet: Arthur's weight prediction

For a discrete automorphic π, a global Arthur parameter ψ and w ∉ S, π satisfies Arthur's prediction at w for ψ when: (a) the Satake class s(π\_w) has integral weight (for every τ, τ(s(π\_w)) is diagonalizable with eigenvalues Weil q\_w-numbers of integer weight); (b) s(π\_w) = ψ\_w(Frob\_w, j(Frob\_w)) up to conjugacy; (c) ψ\_w|\_{W\_{K\_w}} is bounded (isobaric of weight 0). π has place-independent weights when the multiset of weights of τ(s(π\_w)) is the same for all w ∉ S and every τ, and determined by N\_ψ (Expectation 1.9). Arthur's decomposition A\_disc(G, U, C) = ⊕\_{ψ ∈ Ψ(G,U)} A\_{disc,U,ψ} (Conjecture 1.3) is recorded as the conjectural target, not as a theorem.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Construction.*

- (a)–(c) together force the weights of τ(s(π\_w)) to be the eigenvalues of the neutral element of N\_ψ on τ.
- These predicates are the conclusions that RA.8/complementary-series-propagation and RA.8/extraneous-point-elimination verify under hypotheses.

*API.*

- `ArthurPrediction.At` (data): The conjunction (a)–(c) for (π, ψ, w).
- `ArthurPrediction.PlaceIndependentWeights` (data): Expectation 1.9 for π.
- `ArthurPrediction.weights_eq_neutral` (relation): Under (a)–(c) the weights of τ(s(π\_w)) are the eigenvalues of h\_{N\_ψ} on τ.
- `ArthurPrediction.tempered_of_trivial_sl2` (characterisation): If N\_ψ = 0, (a)–(c) at w mean π\_w tempered with Weil-number Satake eigenvalues of weight 0.

*Unit tests.*

- `ArthurPrediction.trivial_rep` (computation): The trivial representation of PGL₂(A\_K) satisfies (a)–(c) at every w for ψ = 1 ⊠ std, with weights ±1 in the standard representation.
- `ArthurPrediction.tempered` (degenerate): A tempered spherical π\_w with Weil-number eigenvalues satisfies (a)–(c) for a ψ with N\_ψ = 0.
- `ArthurPrediction.complementary_fails` (non-example): A complementary-series π\_w of PGL₂ with parameter diag(q^{1/4}, q^{−1/4}) fails (a).
- `ArthurPrediction.weight_pattern_compat` (compatibility): Place-independence of weights is equality of weight patterns in the sense of LieHighestWeightPartII N5/weight-pattern at all w ∉ S.

*Checks.*

- For cuspidal generic π satisfying RA.5/generic-ramanujan, (a)–(c) hold with ψ the global parameter and trivial SL₂.
- For the trivial representation of G(A\_K) (residual, ψ = 1 ⊠ principal SL₂) the weights at every w are the eigenvalues of 2ρ̂ on τ.

*Uses.* Ciubotaru–Harris, Theorem 1.11 and Theorem 10.3, pp. 5–6: the verified instances of Expectation 1.9 and of Conjecture 1.8.

*Source.* [ch26] §1.2, Conjecture 1.3, Conjecture 1.8 and Expectation 1.9, p. 4: States, after Clozel's rewriting, Arthur's decomposition of the discrete spectrum by parameters, the integrality of Satake weights and their identification with the Arthur SL₂ at unramified places, and the resulting independence of the weights from the place.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/global-arthur-parameter`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

<a id="ra-7-compatible-global-parameter"></a>
### RA.7.3 Compatible global parameters of discrete representations

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter` · definition

Let π ⊂ A\_disc(G, Q̄) be irreducible with m\_U(π) ≠ 0. A compatible global parameter for π is a continuous semisimple σ : W\_K → LG(Q̄\_ℓ) (Weil-group valued), unramified outside S, such that for every w ∉ S the Satake class of π\_w is ι\_ℓ of an algebraic class s\_w(π) ∈ [LG\_ss(Q̄)] and equals [σ(Frob\_w)]. The local systems L(π, τ) = τ ∘ σ are then lisse Weil sheaves on X ∖ |S|. Ciubotaru–Harris take σ Galois-valued; Weil-group values are allowed here to include Xue's parameters, and the weight arguments of RA.1 and RA.8 hold for lisse Weil sheaves (Deligne's Weil II works with Weil sheaves; an irreducible lisse Weil sheaf is a constant Weil twist of an étale one, DWP.5/rank-one-normalization).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Construction.*

- For cuspidal π, the parameters of RA.2/cuspidal-parameter-local-systems are compatible (RA.2/rational-satake-parameters), with Galois-valued σ.
- Under the hypotheses of RA.7/discrete-spectrum-parametrization (Conjectures 9.1 and 9.5), every discrete π belonging to some σ ∈ Φ\_disc(U) has one.
- For π occurring in a finite-codimension Hecke quotient of compactly supported forms, Xue's parametrization gives one (RA.7/xue-hecke-quotient-parametrization).

*API.*

- `CompatibleParam.mk` (constructor): A Weil-group parameter σ with the Satake compatibility at all w ∉ S.
- `CompatibleParam.localSystem` (constructor): L(π, τ) = τ ∘ σ as a lisse Weil sheaf.
- `CompatibleParam.ofCuspidal` (other): A cuspidal π belonging to σ ∈ Φ(U) has the compatible parameter σ.
- `CompatibleParam.charpoly` (characterisation): det(1 − T·Frob\_w | L(π, τ)) = det(1 − T·τ(ι\_ℓ s\_w(π))).

*Unit tests.*

- `CompatibleParam.cuspidal` (compatibility): For cuspidal π the Lafforgue parameter is compatible.
- `CompatibleParam.trivial_rep` (computation): The trivial representation of PGL₂(A\_K) has the compatible parameter σ(Frob\_w) = diag(q\_w^{1/2}, q\_w^{−1/2}) (σ = |·|^{1/2} ⊕ |·|^{−1/2} composed to SL₂), a Weil-group parameter not attached to a cusp form.
- `CompatibleParam.not_unique` (non-example): Compatibility at w ∉ S determines σ only up to local conjugacy at each Frobenius; two non-conjugate σ may both be compatible for non-GL\_n groups.
- `CompatibleParam.trivial_tau` (degenerate): For every compatible σ and τ trivial, L(π, 1) is the constant sheaf of rank one.

*Checks.*

- Cuspidal π: σ from Lafforgue.
- Without algebraicity of s\_w(π) the compatibility cannot even be stated over Q̄.

*Uses.* Ciubotaru–Harris, Theorem 1.11, p. 5: the parametrization hypothesis; Ciubotaru–Harris, §10, p. 32: the local systems whose weights are compared.

*Source.* [ch26] §9.1, Definition 9.4 and Conjecture 9.5(2), p. 31; §9.2, p. 32: Defines when a discrete representation belongs to a parameter and requires that its Satake classes be algebraic and equal to the Frobenius classes of the parameter; notes that the main theorem only needs such a parametrization for the given π.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/cuspidal-parameter-local-systems`, `DeligneWeightsAndPurity:DWP.5/weil-sheaf`, `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`.

<a id="ra-7-discrete-spectrum-parametrization"></a>
### RA.7.4 The parametrization hypotheses for the discrete spectrum

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/discrete-spectrum-parametrization` · definition · planet: Discrete-spectrum parametrization

The parametrization hypotheses for (G, U) are: (9.1) for every noetherian Z[1/p]-algebra E ⊂ C, A\_disc(G, U, E) is a finite E-module and A\_disc(G, U, E) ⊗ C ≅ A\_disc(G, U, C); (9.5)(1) the excursion algebra acts on A\_disc(G, U, Q̄\_ℓ) and decomposes it as ⊕\_σ A\_disc(G, U, Q̄\_ℓ)\_{λ(σ)} (display (9.3)); (9.5)(2) for σ ∈ Φ\_disc(U) and w ∉ S the Satake class of λ\_w(σ) is ι\_ℓ(s\_w(σ)) with s\_w(σ) ∈ [LG\_ss(Q̄)] and equals [σ(Frob\_w)]. A discrete π belongs to σ when π^U lies in the λ(σ)-summand.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- Corrections PAPER-CIUBOTARU-HARRIS-26/E1 (the conjecture is 9.5, (9.3) a display), E15 (m(π) > 0), E16 (Φ\_disc(U) and ι\_ℓ in 9.5(2)).

*Construction.*

- The hypotheses hold for the cuspidal spectrum (RA.2/rational-satake-parameters).
- Under (9.1) the Hecke action on A\_disc(G, U, E) is semisimple for E of characteristic 0 and Lemma 9.2 follows (RA.7/conditional-discrete-rationality).

*API.*

- `DiscParamHyp.finite` (other): Conjecture 9.1: finiteness and base change of A\_disc(G, U, E).
- `DiscParamHyp.decomposition` (data): The decomposition over the excursion algebra (9.3).
- `DiscParamHyp.satake` (characterisation): Conjecture 9.5(2): algebraic Satake classes equal to Frobenius classes.
- `DiscParamHyp.compatibleParam` (other): Every discrete π with m\_U(π) ≠ 0 has a compatible global parameter (RA.7/compatible-global-parameter).

*Unit tests.*

- `DiscParamHyp.cuspidal` (compatibility): Restricted to A₀(G, U), (9.1) is FA.6/integral-coefficient-model and (9.5) is Lafforgue's theorem.
- `DiscParamHyp.trivial_pgl2` (computation): For PGL₂ the trivial representation lies in A\_disc and has parameter with σ(Frob\_w) = diag(q\_w^{1/2}, q\_w^{−1/2}), algebraic as (9.5)(2) requires.
- `DiscParamHyp.reducedness_not_required` (non-example): The hypotheses do not assert that the excursion algebra is reduced; generalized eigenspaces suffice.
- `DiscParamHyp.level_one_anisotropic` (degenerate): For G anisotropic, A\_disc(G, U, C) = A(G, U, C) is finite-dimensional and (9.1) holds trivially.

*Checks.*

- For the cuspidal subspace the hypotheses are theorems of Lafforgue and BHKT.
- For PGL₂ the residual spectrum consists of characters χ ∘ det, whose parameters are explicit.

*Uses.* Ciubotaru–Harris, Theorem 1.11, p. 5: the alternative hypothesis to cuspidality.

*Source.* [ch26] §9.1, Conjecture 9.1, display (9.3), Definition 9.4 and Conjecture 9.5, pp. 30–31: Formulates the finiteness and coefficient base change of the discrete spectrum, the excursion decomposition and the Satake compatibility as conjectures extending the cuspidal theory.

*Needs.* `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter`.

<a id="ra-7-conditional-discrete-rationality"></a>
### RA.7.5 Rationality of the discrete spectrum under the finiteness hypothesis

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/conditional-discrete-rationality` · theorem

Assume Conjecture 9.1 for (G, U). Then the eigenvalues of H^S(G, U) on A\_disc(G, U, C) are algebraic for every algebraically closed C of characteristic 0, every irreducible discrete automorphic representation has a model over a number field, and A\_disc(G, U, Q̄) = ⊕\_π m\_U(π) π^U.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

- A\_disc(G, U, Q) is a finite-dimensional Q-space stable under the Hecke algebra with integral structure; its eigenvalues are algebraic and the action is semisimple over a large number field, as in Lemma 3.2.
- G(A\_K) preserves A\_disc(G, Q), so each π has a model over the number field generated by its Hecke eigenvalues and Schur-index data.

*Checks.*

- For the cuspidal spectrum this is RA.2/rational-satake-parameters without hypothesis.

*Source.* [ch26] §9.1, Lemma 9.2 and the decomposition after it, p. 31: Deduces from the finiteness conjecture that discrete-spectrum Hecke eigenvalues are algebraic and that discrete representations have number-field models, as in the cuspidal case.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/discrete-spectrum-parametrization`, `FunctionFieldArithmetic:FA.6/integral-coefficient-model`.

<a id="ra-7-xue-hecke-quotient-parametrization"></a>
### RA.7.6 Xue: parametrization of finite-codimension Hecke quotients

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/xue-hecke-quotient-parametrization` · theorem · planet: Xue's parametrization of Hecke quotients

Let G be split reductive over K, N a level, Ξ a cocompact central lattice, u ∉ N a place and 𝔍 an ideal of finite codimension in the spherical Hecke algebra H\_{G,u}. Then C\_c(Bun\_{G,N}(F\_q)/Ξ, Q̄\_ℓ) is of finite type over H\_{G,u} (Proposition 1), so the quotient Q = C\_c/𝔍·C\_c is finite-dimensional, and Q decomposes canonically as ⊕\_σ H\_σ over continuous semisimple σ : Weil(K̄/K) → Ĝ(Q̄\_ℓ) unramified outside N, H\_σ being the generalized eigenspace for the character f((σ(γ\_i))) of the excursion algebra; H\_σ lies in the generalized eigenspace of T(h\_{V,v}) with eigenvalue χ\_V(σ(Frob\_v)) for v ∉ N. The decomposition is compatible with constant-term morphisms. A discrete automorphic π occurring in such a quotient has a compatible global parameter (RA.7/compatible-global-parameter).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G split; Hecke operators on Q need not be diagonalizable (Xue Remark 3.6.8).

*Proof route.*

- Finiteness of compactly supported shtuka cohomology over H\_{G,u} (Xue Theorem 2; GS.3/single-place-hecke-module-finiteness) gives the Weil^I action via Drinfeld's lemma for finite-type H\_{G,u}-modules (GS.4/full-cohomology-weil-descent).
- Excursion operators on C\_c (GS.5/excursions-on-full-compact-cohomology) descend to Q and generate a finite-dimensional commutative algebra B\_𝔍; continuity in (γ\_i) (Lemma 3.6.6) and Lafforgue's §11 argument (GS.5/reconstruction-of-a-langlands-parameter) give Theorem 3.6.7.
- Satake compatibility as in GS.5/satake-compatibility-and-chebotarev; algebraicity of Satake classes on Q from the rational structure of C\_c and finite codimension.
- Ciubotaru–Harris (§9.2) speak of ideals of finite codimension in H^S(G, U); such an ideal contains a finite-codimension ideal 𝔍 of a single H\_{G,u}, so their quotients are quotients of Xue's Q and inherit the decomposition.

*Checks.*

- For 𝔍 the kernel of a character of H\_{G,u}, Q is the largest quotient on which H\_{G,u} acts by that character (Xue Remark 3.6.3).
- On the cuspidal part the decomposition is Lafforgue's.

*Source.* [xue] Introduction, Proposition 1 and Theorem 2, pp. 2–3; §3.6, Definition 3.6.5, Lemma 3.6.6 and Theorem 3.6.7 with Remarks 3.6.3 and 3.6.8, pp. 30–31; §4.2, pp. 40–41: Proves finiteness of compactly supported shtuka cohomology over a local Hecke algebra, extends excursion operators to compactly supported automorphic forms and decomposes every finite-codimension Hecke quotient by semisimple Weil-group parameters compatibly with Satake and constant terms.; [ch26] §9.2, p. 32: Cites Xue for the extension of Lafforgue's parametrization to finite-codimension quotients, covering some non-cuspidal discrete representations.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.3/single-place-hecke-module-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/full-cohomology-weil-descent`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursions-on-full-compact-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/satake-compatibility-and-chebotarev`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter`.

## Layer RA.8: Weight patterns, Property A and Arthur-type propagation

**Targets.** Global weight patterns; propagation of complementary series (Theorem 1.11, with the scope corrections PAPER-CIUBOTARU-HARRIS-26/E1 and E18 and gap G4); the weight array at a ramified place ((10.4)–(10.6)); Property A and the example of Remark 10.8; the weight certificates excluding extraneous points (proof of Theorem 10.3, corrected by E3 and E5) and the elimination of extraneous points (Theorem 10.3, Remark 10.7).

*Requires:* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7`, `LieHighestWeightPartII:N3`, `LieHighestWeightPartII:N5`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7`.

<a id="ra-8-global-weight-pattern"></a>
### RA.8.1 Global weight patterns

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/global-weight-pattern` · construction · planet: Global weight pattern

Let π have a compatible global parameter σ (RA.7/compatible-global-parameter) such that L(π, τ) has integer weights for every τ (for instance π\_u geometric at some place u, by RA.1/geometric-boundary-propagation). The global weight pattern is n(i, π, τ) := rank gr\_i^W L(π, τ). For every w ∉ S, the weight pattern of the Satake class s\_w(π) (LieHighestWeightPartII N5/weight-pattern, with q = q\_w) equals n(·, π, τ) for every τ.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Construction.*

- gr\_i^W L(π, τ) is punctually pure of weight i, so its rank is the number of Frobenius eigenvalues of weight i at every w ∉ S (RA.1/geometric-boundary-propagation (b)).
- The eigenvalues of τ(σ(Frob\_w)) are those of τ(s\_w(π)) by compatibility.

*API.*

- `WeightPattern.global` (constructor): n(·, π, τ) : ℤ → ℕ, finitely supported, Σ\_i n(i, π, τ) = dim τ.
- `WeightPattern.global_eq_local` (characterisation): For every w ∉ S, n(·, π, τ) is the weight pattern of s\_w(π) along τ.
- `WeightPattern.global_tensor` (functoriality): n(·, π, τ ⊗ τ′) is the convolution of n(·, π, τ) and n(·, π, τ′); n(i, π, τ^∨) = n(−i, π, τ).
- `WeightPattern.global_symmetric` (relation): For semisimple G and unitary π, n(i) = n(−i) (the class is conjugate to its inverse up to the compact part).

*Unit tests.*

- `WeightPattern.trivial_pgl2` (computation): For the trivial representation of PGL₂(A\_K) and τ the standard representation of SL₂, n(1) = n(−1) = 1, n(i) = 0 otherwise.
- `WeightPattern.tempered` (degenerate): For tempered π (weight 0), n(0, π, τ) = dim τ.
- `WeightPattern.not_from_one_place` (non-example): Without integer weights (no geometric place) the ranks of ι-weight pieces could depend on ι and the pattern is undefined; the complementary-series class diag(q^{1/4}, q^{−1/4}) has no weight pattern.
- `WeightPattern.local_compat` (compatibility): At w ∉ S the global pattern equals N5/weight-pattern of s\_w(π).

*Checks.*

- For cuspidal generic π as in RA.5/generic-ramanujan, n(i, π, τ) = dim τ for i = 0 and 0 otherwise.

*Uses.* Ciubotaru–Harris, proof of Theorem 1.11, pp. 32–33: equal patterns at v and w; Ciubotaru–Harris, proof of Theorem 10.3, pp. 33–34: the row sums of the weight array.

*Source.* [ch26] §10.1, definition of the weight pattern, p. 32; proof of Theorem 1.11, pp. 32–33: Defines the weight pattern of a geometric Satake parameter as the ranks of the weight-graded pieces in every representation, and observes that for a global parameter with a geometric place these ranks are the same at every unramified place.; [ch26] §2.4, Proposition 2.7, p. 8: Gives the ranks n(i) of the graded pieces of the weight filtration.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/geometric-boundary-propagation`, `LieHighestWeightPartII:N5/weight-pattern`.

<a id="ra-8-complementary-series-propagation"></a>
### RA.8.2 Propagation of complementary series

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation` · theorem · planet: Complementary-series propagation

Let G be split semisimple over K, π ⊂ A\_disc(G, Q̄) with m\_U(π) ≠ 0 having a compatible global parameter (RA.7/compatible-global-parameter: π cuspidal, or occurring in a finite-codimension Hecke quotient, or under the hypotheses of RA.7/discrete-spectrum-parametrization). Assume a place u with π\_u geometric (RA.3/geometric-representation) and a place v ∉ S with π\_v ⊗\_ι ℂ in the complementary series CS(G(K\_v), O^∨) of a nilpotent orbit O^∨. Then: (a) for every w ∉ S, s\_w(π) is geometric with the same weight pattern as s\_v(π), so ℜ(s\_w) and ℜ(s\_v) are Weyl-conjugate; (b) if G is adjoint and s\_v and s\_w have central compact parts, π\_w ⊗\_ι ℂ lies in CS(G(K\_w), O^∨); (c) if G is adjoint and s\_v has central compact part, ℜ(s\_v) is the central point ½h^∨ of O^∨ or one of the extraneous points of SRU.7 (restricted lists), and every split w ∉ S has the same real part.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- Scope corrections: the parametrization hypothesis is Conjectures 9.1 and 9.5 (PAPER-CIUBOTARU-HARRIS-26/E1); the extraneous lists are those of the real or central-compact sector (E18); the step from equal real parts to membership in the same complementary series needs the compact parts to be central (gap G4).

*Proof route.*

- RA.1/geometric-boundary-propagation at u gives integer weights for every L(π, τ); RA.8/global-weight-pattern makes the weight pattern of s\_w independent of w ∉ S.
- LieHighestWeightPartII N5/real-part-recognition (Ciubotaru–Harris Proposition 10.2): the weight pattern determines the real part up to conjugacy; this gives (a).
- (b): with central compact parts, s\_w and s\_v differ by a central element, so Ad(s\_w) = Ad(s\_v) on Lie(Ĝ); the nilpotent stratum of SRU.7/nilpotent-partition is read from the q-eigenspace of Ad(s), and π\_w is unitary (discrete automorphic), so π\_w ∈ CS(G(K\_w), O^∨).
- (c): SRU.7/centralizer-reduction with SRU.7/extraneous-classical, SRU.7/extraneous-exceptional and SRU.7/e8-4a1-exclusion classify geometric points of CS(G, O^∨) with central compact part; the non-adjoint case is reduced through RA.5/adjoint-lift as in Ciubotaru–Harris p. 32.

*Checks.*

- For O^∨ = 0 this is the generic statement: the real part is 0 at v and at every w.
- Sp(6) dual, O^∨ = (2,2,2): the possible real parts are ½h^∨ = (½, ½, ½) and the extraneous (0, ½, 1) (Remark 8.6).

*Source.* [ch26] §1.2, Theorem 1.11, p. 5; §10.1, Proposition 10.2 and the proof of Theorem 1.11, pp. 32–33: States and proves that, for a discrete representation with a Lafforgue-type parametrization and a geometric place, membership of one split unramified component in a complementary series propagates to all split unramified components, with real parts equal to the central point or to the same extraneous point.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/geometric-boundary-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/global-weight-pattern`, `LieHighestWeightPartII:N5/real-part-recognition`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/nilpotent-partition`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/centralizer-reduction`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/extraneous-classical`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/extraneous-exceptional`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/e8-4a1-exclusion`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/xue-hecke-quotient-parametrization`.

<a id="ra-8-weight-array"></a>
### RA.8.3 The weight array of a global parameter at a ramified place

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/weight-array` · construction

With π, σ, u ∈ S and τ as in RA.8/complementary-series-propagation and L(π, τ) with integer weights, let a(i, k)(τ) be the dimension of the generalized eigenspace of weight k of Frob\_u on the fibre at u of gr\_i^W L(π, τ). Then: the row sums Σ\_k a(i, k) are n(i, π, τ) = n\_v(i) (the global pattern, equal to that of s\_v); the column sums Σ\_i a(i, k) are the weight multiplicities n\_u(k) of τ ∘ L\_F(π\_u) at u; and a(i, i + j) = a(i, i − j) for all i, j.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Construction.*

- Row sums: dim gr\_i^W = n(i, π, τ) (RA.8/global-weight-pattern).
- Column sums: the fibre at u of L(π, τ) is the Weil representation τ ∘ σ|\_{W\_{K\_u}}, whose semisimplification is τ ∘ L\_F(π\_u) (RA.3/local-parametrization).
- Symmetry: (gr\_i^W)\_u is pure of weight i as a Weil–Deligne representation (RA.1/geometric-boundary-propagation (c)), so N^j identifies the weight i + j and i − j pieces.

*API.*

- `WeightArray.mk` (constructor): a : ℤ → ℤ → ℕ vanishing outside a finite window, attached to (π, τ, u).
- `WeightArray.rowSum_eq_colSum_of_isDiagonal` (characterisation): A diagonal array (no monodromy) has equal row and column sums.
- `WeightArray.rowSum` (projection): r(i) = Σ\_k a(i, k) = n\_v(i).
- `WeightArray.colSum` (projection): c(k) = Σ\_i a(i, k) = n\_u(k).
- `WeightArray.symm` (relation): a(i, i + j) = a(i, i − j).
- `WeightArray.sum_rowSum_eq_sum_colSum` (simp): Σ\_i r(i) = Σ\_k c(k) = dim τ.

*Unit tests.*

- `WeightArray.remark_10_8` (non-example): The array a(0, 1) = a(0, −1) = 1 (zero elsewhere) satisfies the symmetry but has r = 2·δ₀ and c = δ₁ + δ₋₁: equality of row and column sums is not automatic.
- `WeightArray.diagonal` (degenerate): If N = 0 on every graded piece at u, a is diagonal and r = c.
- `WeightArray.special_two` (computation): For rank two with gr₀ = L and L\_u ≅ Sp(2) (weights −1, 1), a(0, 1) = a(0, −1) = 1.
- `WeightArray.sums_total` (compatibility): Σ\_i r(i) = Σ\_k c(k) = dim τ, the rank of L(π, τ).

*Checks.*

- If N = 0 at u on every gr\_i, the array is diagonal and n\_u = n\_v.

*Uses.* Ciubotaru–Harris, proof of Theorem 10.3, pp. 33–34: Property A is applied to this array.

*Source.* [ch26] §10.2, proof of Theorem 10.3, (10.4)–(10.6), pp. 33–34: Defines the array of local Frobenius weights on the global weight-graded pieces, records the symmetry coming from purity of the monodromy filtration and identifies its row and column sums with the weights at the unramified place and at u; the printed subscripts are corrected by E3.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/global-weight-pattern`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/geometric-boundary-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`.

<a id="ra-8-property-a"></a>
### RA.8.4 Property A for symmetric weight arrays

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/property-a` · theorem · planet: Property A

Let a : ℤ × ℤ → ℕ have finite support and satisfy a(i, i + j) = a(i, i − j) for all i, j; let r(i) = Σ\_k a(i, k) and c(i) = Σ\_k a(k, i). Then either a is diagonal and r = c, or at the largest index i₀ with r(i₀) ≠ c(i₀) one has c(i₀) > r(i₀).

*Hypotheses and conventions.*

- a has finite support; no other hypothesis.

*Proof route.*

- Downward induction from an index above the support. Suppose r(i) = c(i) for all i > i₁ and that a(i, k) = a(k, i) = 0 for i > i₁, k ≠ i.
- Row i₁ is diagonal: a(i₁, k) = 0 for k > i₁ since column k > i₁ is diagonal, and for k < i₁ by symmetry with 2i₁ − k > i₁. Hence r(i₁) = a(i₁, i₁) ≤ c(i₁).
- If r(i₁) = c(i₁) then column i₁ is diagonal too and the induction continues; otherwise c(i₁) > r(i₁) at the first (largest) index of difference.

*Checks.*

- The array of Remark 10.8 (a(0, ±1) = 1) has largest difference index 1 with c(1) = 1 > r(1) = 0.
- A diagonal array has r = c.

*Source.* [ch26] §10.2, Property A and its proof, pp. 33–34; Remark 10.8, p. 35: States and proves by downward induction that a symmetric weight array either has equal row and column sums with diagonal support, or has larger column sum at the top index of difference, and gives a two-entry example showing the second case occurs.

*Needs.* Nothing beyond finite sums of natural numbers.

<a id="ra-8-extraneous-weight-certificates"></a>
### RA.8.5 Weight certificates excluding extraneous points

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-weight-certificates` · theorem

For each extraneous real part x of SRU.7 (real or central-compact sector) for the orbit O^∨ there is a representation τ of Ĝ and an index i₀ such that n\_x(i) = n\_{h/2}(i) for i > i₀ and n\_x(i₀) > n\_{h/2}(i₀), where n\_y(i) is the number of weights μ of τ (with multiplicity) with 2⟨μ, y⟩ = i and h/2 is the central point: (1) Ĝ = Sp(2n), τ standard, i₀ the largest even j with r\_j ≥ 3 and ε\_j = 1, n\_x(i₀) = n\_{h/2}(i₀) + 1; (2) Ĝ = Spin(n), τ standard, i₀ the largest odd i with r\_i ≥ 3 and ε\_i = 1, n\_x(i₀) = n\_{h/2}(i₀) + 1; (3) F₄, τ adjoint: B₃ (x = ω₁ + ½ω₃ + ½ω₄): equal above 8, n\_x(8) = 2 > 1; Ã₁ + A₁ (x = ½ω₁ + ½ω₄): n\_x(4) = 1 > 0; (4) E₇, τ adjoint, D₅(a₁) + A₁: equal above 9, n\_x(9) = 1 > 0; (5) E₈, τ adjoint: D₆, n\_x(16) = 2 > 1 with equality above; A₆, n\_x(13) = 1 > 0; A₄ + A₂, n\_x(9) = 1 > 0; A₂ + 2A₁, n\_x(5) = 1 > 0.

*Hypotheses and conventions.*

- Coordinates of Ciubotaru–Harris (6.21), (6.23)–(6.26); corrections PAPER-CIUBOTARU-HARRIS-26/E3 (subscripts) and E5 (the B₃ point).

*Proof route.*

- n\_{h/2}(i) is the multiplicity of the eigenvalue i of h on τ, read from the appendix tables for the adjoint representation (LieHighestWeightPartII N3/appendix-table-interface) or from sl₂-theory for the standard representations.
- n\_x is computed by enumerating the weights of τ in the stated coordinates.
- Recomputed for this plan by root enumeration: F₄ B₃ gives n\_x(10, 9, 8) = (1, 0, 2) against (1, 0, 1); the printed B₃ point would have top weight 16 (E5); Ã₁ + A₁ gives top weight 4; E₇ gives n\_x(10, 9) = (1, 1); E₈ D₆ gives n\_x(18, 17, 16) = (1, 0, 2) against (1, 0, 1), A₆, A₄ + A₂, A₂ + 2A₁ give top weights 13, 9, 5 against table maxima 12, 8, 4; Sp(6), (2,2,2): x = (0, ½, 1) gives n\_x(2) = 1 against 0.

*Checks.*

- Sp(6), O^∨ = (2,2,2): standard weights ±e\_i, central (½, ½, ½) gives n(±1) = 3; x = (0, ½, 1) gives n(2) = 1, n(1) = 1, n(0) = 2, n(−1) = 1, n(−2) = 1; i₀ = 2.

*Source.* [ch26] §10.2, proof of Theorem 10.3, cases (1)–(5), p. 34; §8.2, Theorem 8.5 and Remark 8.6, pp. 28–29; Appendix Tables 2–3, pp. 36–37: Lists, for each extraneous point, a representation and the top index where its weight multiplicities exceed those of the central point, which contradicts Property A; the right-hand subscripts are misprinted (E3) and the F₄ B₃ point is misprinted (E5).

*Needs.* `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/extraneous-classical`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/extraneous-exceptional`, `LieHighestWeightPartII:N3/appendix-table-interface`, `LieHighestWeightPartII:N5/weight-pattern`.

<a id="ra-8-extraneous-point-elimination"></a>
### RA.8.6 Elimination of extraneous points

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination` · theorem · planet: Elimination of extraneous points

Under the hypotheses of RA.8/complementary-series-propagation with G adjoint split and s\_v of central compact part, assume moreover that u ∈ S and π\_u ≅ AZ(σ\_u) for an irreducible discrete series σ\_u whose pure Weil–Deligne parameter (RA.4/weil-deligne-purity-of-discrete-series) has monodromy in O^∨. Then for every split w ∉ S the real part of the Satake parameter of π\_w is the central point ½h^∨ of O^∨; no unramified component is extraneous. Moreover all monodromy operators N\_i on (gr\_i^W L(π, τ))\_u vanish.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- Same scope corrections as RA.8/complementary-series-propagation.

*Proof route.*

- L\_F(π\_u) = L\_F(σ\_u) (SRU.7/aubert-semisimple-parameter), so n\_u is the weight pattern of the Frobenius of the pure parameter of σ\_u, whose real part is q\_u^{h/2} with h the neutral element of an sl₂-triple through the monodromy (bounded part ϕ₀, RA.4/weil-deligne-purity-of-discrete-series).
- By RA.8/complementary-series-propagation (c), ℜ(s\_v) is ½h^∨ or extraneous; in the extraneous case RA.8/extraneous-weight-certificates gives τ violating Property A for the array of RA.8/weight-array, contradicting RA.8/property-a.
- So n\_v = n\_u, the pattern of ½h^∨; by RA.8/global-weight-pattern and LieHighestWeightPartII N5/real-part-recognition every split w ∉ S has real part ½h^∨.
- With n\_u = n\_v the array is diagonal (Property A, first alternative), which is the vanishing of every N\_i (Remark 10.7).

*Checks.*

- For O^∨ = 0, σ\_u supercuspidal and AZ(σ\_u) = σ\_u: the theorem says the real part is 0 at every split unramified place, recovering the generic statement in that case.

*Source.* [ch26] §1.2, Theorem (Theorem 10.3), pp. 5–6; §10.2, Theorem 10.3 with its proof and Remark 10.7, pp. 33–35: Proves that if the component at a ramified place is the Aubert dual of a discrete series whose monodromy lies in the orbit of the complementary series at v, the real parts at all split unramified places are the central point, by comparing weight patterns through Property A, and remarks that the monodromy at u then vanishes.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/weight-array`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/property-a`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-weight-certificates`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/global-weight-pattern`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/aubert-semisimple-parameter`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/aubert-involution`, `LieHighestWeightPartII:N5/real-part-recognition`.

## Corrections to the sources

| Finding | Where | What changes here |
| --- | --- | --- |
| PAPER-CIUBOTARU-HARRIS-26/E1 | Theorem 1.11, p. 5 | The parametrization hypothesis is Conjectures 9.1 and 9.5 (RA.7/discrete-spectrum-parametrization). |
| PAPER-CIUBOTARU-HARRIS-26/E3 | proof of Theorem 10.3, p. 34 | Right-hand subscripts read n\_u (RA.8/extraneous-weight-certificates); recomputed here by root enumeration. |
| PAPER-CIUBOTARU-HARRIS-26/E5 | Theorem 8.5(3), F₄ row B₃ | The point is ω₁ + ½ω₃ + ½ω₄; the printed point has top adjoint weight 16 (recomputed). |
| PAPER-CIUBOTARU-HARRIS-26/E9 | Definition 2.6 | N lowers weights by 2 with geometric Frobenius (RA.0/pure-weil-deligne-parameter). |
| PAPER-CIUBOTARU-HARRIS-26/E10 | §4.1, sketch step (2) | Theorem 4.3 is planned under geometricity (RA.4/embedding-independent-temperedness); the generic theorem is proved for a fixed ι without it (gap G3). |
| PAPER-CIUBOTARU-HARRIS-26/E11 | Corollary 6.32(1) | Theorem 5.4 is planned with central compact part at v (RA.5/generic-ramanujan; gap G4). |
| PAPER-CIUBOTARU-HARRIS-26/E12 | proof of Theorem 5.4, p. 14 | The lift to the adjoint L-group is used for types A\_{n−1} (n even), B, C, D and E₇ (RA.5/adjoint-lift). |
| PAPER-CIUBOTARU-HARRIS-26/E13 | Theorem 5.4 | The anchor u may be any place (RA.5/integral-weights-from-anchor). |
| PAPER-CIUBOTARU-HARRIS-26/E15, E16 | §9.1 | m(π) > 0; Φ\_disc(U) and ι\_ℓ in Conjecture 9.5(2) (RA.7/discrete-spectrum-parametrization). |
| PAPER-CIUBOTARU-HARRIS-26/E18 | Theorem 8.5, Remark 8.7 | Extraneous lists are those of the central-compact sector (RA.8/complementary-series-propagation; gap G4). |
| GlobalShtukasAndFunctionFieldLanglandsPartII/E1 (new) | §4.1, sketch step (1), p. 11 | Beuzart-Plessis's lemma gives the same cuspidal support only; number-field models of arbitrary discrete series are gap G2 (RA.4/galois-conjugation-of-discrete-series). |

Version note: the arXiv version of Gan–Harris–Sawin (v3) proves Theorem 1.2 for p > 3, which is presumably the 'mild restriction on the residue field cardinality' of Ciubotaru–Harris's abstract; the published version (Forum Math. Pi 12, 2024) has no restriction, Xu–Zhu having removed the prime hypotheses of Heinloth–Ngô–Yun, so no hypothesis on p is carried here.

## Gaps

- **G1. Simple trace formula and Poincaré-series globalization over function fields have no owner.** The Deligne–Kazhdan simple trace formula for general connected reductive groups over a global function field and Gan–Lomelí's Poincaré-series globalization are used as cited theorems; no atlas roadmap plans them (ES7:function-field-automorphic covers only GL\_d and division algebras in a selected range). They are requested from a Part II of FunctionFieldArithmetic at FA.6. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`.
- **G2. Number-field models of arbitrary discrete series.** Ciubotaru–Harris Theorem 4.2 asserts that every complex discrete series of a semisimple group over F = k((t)) has a model over a number field; the sketch derives it from Beuzart-Plessis's lemma, which only gives a cuspidal representation with the same cuspidal support (this packet's source issue E1). The plan proves the Galois conjugation statement for representations that have a model over Q̄, which covers every local component of a cuspidal representation and every supercuspidal; the model for an arbitrary discrete series (for example by finiteness of discrete series with given cuspidal support and algebraicity of the reducibility points) is not established. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/galois-conjugation-of-discrete-series`.
- **G3. Embedding independence of temperedness without geometricity (E10).** Ciubotaru–Harris Theorem 4.3 (an ι-tempered component of a cuspidal representation is tempered for every embedding) assumes in step (2) of its sketch that every local monodromy of L(Π, τ) is geometric, which is not known without an anchor (PAPER-CIUBOTARU-HARRIS-26/E10). The plan states the theorem under geometricity of the local parameter and proves the generic theorem for a fixed ι without it. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/embedding-independent-temperedness`.
- **G4. Non-central compact parts of Satake parameters (E11, E18) and the stratum step of Theorem 1.11.** The local classifications used at v (SRU.5/generic-temperedness-test, SRU.6, SRU.7 extraneous lists) hold for Satake parameters whose compact part is central; for non-central compact parts the G₂ witness (SRU.5/g2-noncentral-witness) shows the generic test fails locally. Theorem 5.4 is therefore planned with the centrality hypothesis at v, and Theorem 1.11 with conclusions (b) and (c) under centrality; an exhaustive classification of geometric complementary-series points with arbitrary compact part (through SRU.7/noncentral-compact-reduction) and a global argument excluding them are missing. No global counterexample is known. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination`.
- **G5. Integrality of weights for direct images from algebraic stacks.** Ciubotaru–Harris Sketch 5.10 (after Olsson) is a sketch: Sun's Theorem 2.11 gives ι-mixedness, but the reduction of integrality of weights to schemes through hypercovers and Verdier duality is not written in the literature, as the source says. The stack route is an alternative to RA.5 and is not on the path of the endpoint theorems. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity`.
- **G6. Elliptic orthogonality of discrete-series characters in positive characteristic.** Beuzart-Plessis's Lemma A.3 uses his elliptic orthogonality relations for discrete-series characters, cited in Gan–Harris–Sawin as a 2022 manuscript; no public version was located for this plan. It is requested at SRU.3 with the pseudo-coefficients it accompanies. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`.
- **G7. The Annals version of Ciubotaru–Harris is not collated.** All locators are to arXiv v1; the accepted revision (8 October 2025) may already repair E10–E13 and renumber statements. Collate the locators and the corrections when a copy is available. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination`.

## Requests to other roadmaps

- `FunctionFieldArithmetic:FA.6`: Part II of FunctionFieldArithmetic (not yet designed), automorphic inputs over a global function field for connected reductive G: (i) the Deligne–Kazhdan simple trace formula (Deligne–Kazhdan–Vignéras §A.1) for test functions with a supercuspidal matrix coefficient at one place and support in regular elliptic classes, with finiteness of both sides, as used by Beuzart-Plessis in Gan–Harris–Sawin Appendix A (A.2); (ii) Gan–Lomelí's Poincaré-series globalization of supercuspidals with prescribed central character and depth-zero principal-series components elsewhere (Gan–Lomelí Theorem 1.1); (iii) the extension of FA.6/integral-coefficient-model and FA.6/harder-cuspidal-support to nonsplit semisimple G (the parent packet's proposed 'FunctionFieldArithmetic, Part II: nonsplit compact cusp support'). Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`.
- `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`: Over a nonarchimedean local field of positive characteristic: pseudo-coefficients of discrete series (from the trace Paley–Wiener theorem of Bernstein–Deligne–Kazhdan), the statement that nonzero trace of an irreducible representation against a pseudo-coefficient forces the same cuspidal support (Gan–Lomelí Lemma 8.1, via the Langlands classification), and Beuzart-Plessis's elliptic orthogonality of discrete-series characters (cited in Gan–Harris–Sawin Appendix A as a 2022 manuscript; gap G6). Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`.
- `HeckeStacksAndLocalShtukas:HS2`: Cited as it stands for the local shtuka tower over a general local field (HS2/general-local-field); needed in addition, in equal characteristic: the formal moduli of local G-shtukas and their deformation theory, relative z-adic Hodge theory and the analytic moduli with étale period maps (Li-Huerta §§2–4, Theorem 4.9 and Proposition 4.12), which are the source of the uniformization morphism. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/shtuka-uniformization`.
- `DeligneWeightsAndPurity:DWP.8`: Part II of DeligneWeightsAndPurity (not yet designed): ι-mixedness of the six operations and Verdier duality on algebraic stacks of finite type over a finite field (Sun 2012, Theorem 2.11, with the Laszlo–Olsson operations), and preservation of integrality of weights by Rf\_! along morphisms from algebraic stacks (Ciubotaru–Harris Sketch 5.10; gap G5). Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity`.
- `PadicDifferentialEquationsAndRigidCohomology:RD.6`: Cited as it stands (RD.6/neutral-tannakian-recognition), together with the converse recorded in Deligne–Milne Proposition 2.20(b): every faithful finite-dimensional representation of an affine algebraic group over a field is a tensor generator of its representation category. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic`.

## Restructuring

- **R1 (split).** The design brief (#3381) carried nine continuations of GlobalShtukasAndFunctionFieldLanglands in six independent directions: (a) Ramanujan and Arthur weight constraints (Ciubotaru–Harris 2026, route GlobalShtukasPartIIRamanujanArthur, 27 items, plus one Gan–Harris–Sawin item); (b) counting unramified ℓ-adic local systems (Yu 2023, route GlobalShtukasAndFunctionFieldLanglandsCountingPartII, 77 items); (c) the Langlands correspondence for isocrystals and crystalline companions (Abe 2018, 17 items, and D'Addezio 2023, 2 items, route GlobalShtukasPartIICrystallineCompanions); (d) special cycles on shtuka moduli and the higher Siegel–Weil formula (Yun–Zhang 2017, 33 items; Yun–Zhang 2019, 129 items; Feng–Yun–Zhang 2024, 25 items; route ShtukaSpecialCyclesAndHigherSiegelWeil); (e) Tate cohomology of shtukas with mod-p coefficients and cyclic base change (Feng 2024, route ShtukaTateCohomologyAndGlobalBaseChange, 33 items); (f) Ĝ-valued deformation theory and potential automorphy (Böckle–Harris–Khare–Thorne 2019, route GValuedDeformationsAndPotentialAutomorphy, 28 items). They share only the parent's shtuka cohomology and excursion theory. This roadmap plans (a), in layers RA.0–RA.8, as the brief's first direction. Each of (b)–(f) becomes its own Part II of GlobalShtukasAndFunctionFieldLanglands with a design job carrying its routes: DESIGN-GlobalShtukasAndFunctionFieldLanglandsCountingPartII (b); DESIGN-GlobalShtukasPartIICrystallineCompanions (c), which also imports PadicDifferentialEquationsAndRigidCohomology and its proposed arithmetic D-module Part II; DESIGN-ShtukaSpecialCyclesAndHigherSiegelWeil (d), one roadmap for the three special-cycle papers as their briefs require; DESIGN-ShtukaTateCohomologyAndGlobalBaseChange (e), importing SheafTheoreticSmithTheory ST.3 (modular Satake) as its review requires; DESIGN-GValuedDeformationsAndPotentialAutomorphy (f). Direction (f) and the generic theorem here are independent: BHKT's potential automorphy is not used by Ciubotaru–Harris.
- **R2 (rescope).** The held route GlobalShtukasPartIISupercuspidalParameters of PAPER-GAN-HARRIS-SAWIN-ETAL-24 (rejected by its review pending revision) would own Gan–Harris–Sawin's Theorem 1.2. Ciubotaru–Harris need that theorem as the anchor of the generic theorem, so this roadmap plans it with its inputs: Lemma 3.5 (RA.0/pure-completion-uniqueness), Lemma 3.6 and Corollary 3.8 (RA.1/sawin-templier-purity, RA.1/local-purity-of-irreducible-parameters), Propositions 3.9 and 3.11, Appendix Lemma A.1 and Corollary 3.12 (RA.4). When the supercuspidal-parameters Part II is redesigned it imports these nodes and plans only Theorems 1.4–1.5 and §§4–11 of Gan–Harris–Sawin (ramification of pure supercuspidal parameters, Poincaré series on P¹, base change and incorrigible representations).

## Routed items

Every item routed to this roadmap by the paper extractions maps to nodes:

| Item | Nodes |
| --- | --- |
| PAPER-CIUBOTARU-HARRIS-26/geometric-parameter | `RA.0/geometric-l-homomorphism`, `RA.0/geometricity-is-intrinsic` |
| PAPER-CIUBOTARU-HARRIS-26/geometric-propagation | `RA.1/geometric-boundary-propagation` |
| PAPER-CIUBOTARU-HARRIS-26/geometric-representation | `RA.3/geometric-representation` |
| PAPER-CIUBOTARU-HARRIS-26/geometric-discrete-series | `RA.4/geometric-discrete-series` |
| PAPER-CIUBOTARU-HARRIS-26/iota-tempered | `RA.4/iota-tempered` |
| PAPER-CIUBOTARU-HARRIS-26/galois-temperedness | `RA.4/embedding-independent-temperedness` |
| PAPER-CIUBOTARU-HARRIS-26/constant-field-weight-splitting | `RA.1/constant-field-weight-decomposition` |
| PAPER-CIUBOTARU-HARRIS-26/finite-extension-lift | `RA.5/adjoint-lift` |
| PAPER-CIUBOTARU-HARRIS-26/generic-global-theorem | `RA.5/generic-ramanujan`, `RA.5/integral-weights-from-anchor`, `RA.5/test-representations` |
| PAPER-CIUBOTARU-HARRIS-26/generic-global-corollary | `RA.5/genericity-propagation` |
| PAPER-CIUBOTARU-HARRIS-26/discrete-parametrization-hypothesis | `RA.7/discrete-spectrum-parametrization`, `RA.7/compatible-global-parameter` |
| PAPER-CIUBOTARU-HARRIS-26/conditional-discrete-rationality | `RA.7/conditional-discrete-rationality` |
| PAPER-CIUBOTARU-HARRIS-26/nongeneric-global-theorem | `RA.8/complementary-series-propagation`, `RA.8/global-weight-pattern` |
| PAPER-CIUBOTARU-HARRIS-26/weight-array | `RA.8/weight-array` |
| PAPER-CIUBOTARU-HARRIS-26/property-A | `RA.8/property-a` |
| PAPER-CIUBOTARU-HARRIS-26/property-A-counterexample | `RA.8/weight-array`, `RA.8/property-a` |
| PAPER-CIUBOTARU-HARRIS-26/extraneous-elimination | `RA.8/extraneous-point-elimination`, `RA.8/extraneous-weight-certificates` |
| PAPER-CIUBOTARU-HARRIS-26/li-huerta | `RA.3/li-huerta-compatibility`, `RA.3/shtuka-uniformization` |
| PAPER-CIUBOTARU-HARRIS-26/prop-3-10-1 | `RA.3/geometricity-galois-conjugates` |
| PAPER-CIUBOTARU-HARRIS-26/prop-3-10-2 | `RA.3/geometric-torus-characters` |
| PAPER-CIUBOTARU-HARRIS-26/prop-3-10-3 | `RA.3/geometricity-stability` |
| PAPER-CIUBOTARU-HARRIS-26/prop-3-10-4 | `RA.3/geometric-central-characters` |
| PAPER-CIUBOTARU-HARRIS-26/arthur-conjectures | `RA.7/global-arthur-parameter`, `RA.7/arthur-weight-prediction` |
| PAPER-CIUBOTARU-HARRIS-26/purity-stacks | `RA.6/stack-realisability`, `RA.6/stack-purity`, `RA.6/lafforgue-zhu-decomposition`, `RA.6/elliptic-parameter`, `RA.6/elliptic-implies-tempered` |
| PAPER-CIUBOTARU-HARRIS-26/xue-extension | `RA.7/xue-hecke-quotient-parametrization` |
| PAPER-CIUBOTARU-HARRIS-26/ghs-discrete-series-purity | `RA.4/weil-deligne-purity-of-discrete-series`, `RA.4/discrete-series-irreducible-globalization`, `RA.4/supercuspidal-irreducible-globalization`, `RA.4/discrete-series-pseudo-globalization`, `RA.1/sawin-templier-purity`, `RA.1/local-purity-of-irreducible-parameters`, `RA.0/pure-weil-deligne-parameter`, `RA.0/pure-completion-uniqueness` |
| PAPER-CIUBOTARU-HARRIS-26/galois-discrete-series | `RA.4/galois-conjugation-of-discrete-series` |
| PAPER-CIUBOTARU-HARRIS-26/cuspidal-finiteness | `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `RA.2/rational-satake-parameters` |
| PAPER-CIUBOTARU-HARRIS-26/cuspidal-base-change | `FunctionFieldArithmetic:FA.6/integral-coefficient-model` |
| PAPER-CIUBOTARU-HARRIS-26/hecke-algebraicity | `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `RA.2/rational-satake-parameters` |
| PAPER-GAN-HARRIS-SAWIN-ETAL-24/47 | `RA.5/generic-ramanujan`, `RA.5/integral-weights-from-anchor` |

## Source versions

- Annals of Mathematics 204 (2026), no. 2, 545–601; read in arXiv:2311.15300v1 (26 November 2023, 39 pp.), whose page numbers are used throughout; the Annals text (revised 8 October 2025) was not accessible and is not collated: [https://arxiv.org/abs/2311.15300](https://arxiv.org/abs/2311.15300), read 2026-10-19, SHA-256 `7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103`.
- Forum of Mathematics, Pi 12 (2024), e13; published PDF (printed page = PDF page); arXiv:2109.07737v3 was also read: there Theorem 1.2 assumes p > 3, and the published Proposition 3.11, Corollary 3.12 and Remark 3.13 are numbered 3.10, 3.11 and 3.12 (the published Remark 3.10 is new): [https://doi.org/10.1017/fmp.2024.10](https://doi.org/10.1017/fmp.2024.10), read 2026-10-19, SHA-256 `e570036504ba58ededa9f48453e517a710da0f49128fefebfa94f5ff4439bfcc`.
- arXiv:2301.09711v2 (13 August 2023), 54 pp.: [https://arxiv.org/abs/2301.09711](https://arxiv.org/abs/2301.09711), read 2026-10-19, SHA-256 `83c269e46bb28713f9081086c0c8f0340c41fccbe224d2ea457e5626421bed6c`.
- arXiv:1805.12231v4 (27 September 2020): [https://arxiv.org/abs/1805.12231](https://arxiv.org/abs/1805.12231), read 2026-10-19, SHA-256 `9dddd64e480b56f3987604a8daf096fa850b74fe998ab1963f55b17f373e3e3c`.
- Épijournal de Géométrie Algébrique 4 (2020), Article 6; arXiv:1811.09513v3 (journal pagination): [https://arxiv.org/abs/1811.09513](https://arxiv.org/abs/1811.09513), read 2026-10-19, SHA-256 `b43e7eec00416326ab508ba6af06ec004b186a09874a6a58c1b455170e57a675`.
- arXiv:1811.07976v2 (11 December 2019): [https://arxiv.org/abs/1811.07976](https://arxiv.org/abs/1811.07976), read 2026-10-19, SHA-256 `871c208f006f5496b3776e1050a20ab85ef88ef7066e351ca188159daf56151d`.
- Algebra & Number Theory 6 (2012), 47–122; read in arXiv:1008.3689v2 (28 March 2011): [https://arxiv.org/abs/1008.3689](https://arxiv.org/abs/1008.3689), read 2026-10-19, SHA-256 `85947e31a4b0f65e7d1cfad998a8f28969411d2e8dca561b645ef266ae8c8d1b`.
- J. Eur. Math. Soc. 20 (2018), 2813–2858; read in arXiv:1510.00131v2: [https://arxiv.org/abs/1510.00131](https://arxiv.org/abs/1510.00131), read 2026-10-19, SHA-256 `5f4adc241b2034f97c74719a28c3c8095314fb459e297a29964c52868ecabff4`.
- Annals of Mathematics 177 (2013), 241–310; read in arXiv:1005.2765v1: [https://arxiv.org/abs/1005.2765](https://arxiv.org/abs/1005.2765), read 2026-10-19, SHA-256 `0918c93759cb2d19fe3521c332b45e9c36e4d78b87b84112d65c82761c482004`.
- Inventiones Mathematicae 147 (2002), 1–241; author's full text (journal pagination): [https://www.ihes.fr/~lafforgue/math/fulltext.pdf](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), read 2026-10-19, SHA-256 `af732dac0d2dd00056ff46075f069f09cb2239bcac5cec68b13d17faa8d2ea76`.
