# Global shtukas and Langlands over function fields, Part II: Ramanujan and Arthur weight constraints

This roadmap starts with the semisimple global parameters and local–global comparison of GlobalShtukasAndFunctionFieldLanglands (GS.5–GS.7). It applies curve weights to their algebraic realizations and uses the resulting Frobenius constraints to study local automorphic components. The endpoints are the generic Ramanujan argument and the complementary-series propagation and elimination arguments of Ciubotaru–Harris. All locators to that paper refer to arXiv:2311.15300v1; the later Annals text has not been collated.

The generic theorem is stated in the central-compact sector. A tempered anchor at one chosen embedding yields a conclusion at that embedding; a discrete-series anchor gives the arithmetic weight input at every embedding. General adjoint transfer and nonsplit spherical genericity require the exact supplier contracts below. The Arthur-type endpoint determines weight multiplicities and normalized real Satake parts. Constructing one global Arthur homomorphism, including a commuting SL₂ and globally compatible bounded Weil factor, is a further conjectural assertion.

## Scope and conventions

The parent owns excursion operators, global parameters, their good-place Satake compatibility and the semisimple local–global theorem. LieHighestWeightPartII owns nilpotent orbits, triples, profiles and recognition of real parts. SmoothRepresentationsOfLocalGroupsPartII owns spherical unitarity, genericity tests, the Aubert involution and the extraneous-point lists. Those targets are imported. This roadmap owns the arithmetic and global weight arguments. Counting local systems, crystalline companions, special cycles, Tate cohomology and potential automorphy remain the separate directions recorded under Restructuring.

Current TauCetiRoadmap SmoothRepresentationsOfLocalGroups already owns coefficient change (SR.0), the Hecke-module correspondence (SR.1), normalized induction and Jacquet base change (SR.2), Casselman’s criterion and tempered support (SR.3), and square-root-independent Satake charts (SR.4). The SR.3/SR.4 requests concern additional central-reduction and transfer contracts. ReductiveGroups already owns the algebraic group infrastructure used by the local suppliers. None of those existing targets is planned again here.

- K is the function field of a smooth projective geometrically connected curve X over a finite field of characteristic p; q\_w=|k(w)|. F is an equal-characteristic local field with residue cardinality q. The detailed hypotheses on G, the level and coefficient field are stated at each target.
- Frobenius is geometric; reciprocity takes a uniformizer to geometric Frobenius. Fix √q for normalized induction and half Tate twists. An arithmetic Weil q-number of integer weight i has every complex conjugate of absolute value q^{i/2}. Fixed-ι purity concerns only the chosen complex coefficient transport; it does not imply the arithmetic condition.
- For Weil–Deligne representations, ϕ(w)Nϕ(w)^{-1}=q^{-deg(w)}N, so N lowers weights by 2. Purity of common weight w requires the monodromy filtration centred at w. A subquotient can have a different weight even when its ambient object is pure.
- Write the real Satake factor q\_w^{ν\_w}; an eigenweight μ has Frobenius weight 2⟨μ,ν\_w⟩. The central-compact hypothesis concerns a Γ-invariant central dual-torus factor representing a unitary unramified twist (or the identity). The outer Frobenius component in a nonsplit L-group is kept separate.
- Arthur homomorphism data below use Q̄\_ℓ with its ℓ-adic topology. Complex transport is used to test boundedness locally, not to impose archimedean continuity on a global Galois representation.

## Coverage

The packet is partial. A planned layer has a justified target-level pass; partial layers carry the following precise outstanding inputs. No layer is claimed closed.

| Layer | Status | Remaining input |
| --- | --- | --- |
| RA.0 | partial | Supply the RD.6 faithful ⇒ tensor-generator converse with the exact affine-group hypothesis; elementary WD corrections are included in this review. |
| RA.1 | planned | None in this pass. |
| RA.2 | partial | Supply the already requested nonsplit FA.6 coefficient/support extension. |
| RA.3 | partial | Supply HS2 equal-characteristic formal/analytic moduli, the ES6 normal-image central restriction theorem, and the exact ES5 coefficient-automorphism normalization (G8). |
| RA.4 | partial | Supply the trace-formula and étale/all-prime Kloosterman contracts (G1/G6), reductive central reduction G8, and number-field descent of arbitrary complex discrete series G2; G3 remains outside the geometric statement. |
| RA.5 | partial | Supply the general central-isogeny and unramified spherical-generic contracts G9. The arbitrary noncentral compact case remains G4. |
| RA.6 | partial | Supply stack integrality G5 and the Satake-to-constant coefficient realization G10; nonsplit Lafforgue–Zhu finiteness remains conditional. |
| RA.7 | partial | Constructing a global ψ and Arthur’s discrete decomposition remain conjectural (G11). Bare Satake compatibility does not include ramified-place comparison; Xue quotients have it via Li-Huerta Theorem 6.13. |
| RA.8 | partial | Supply exceptional orbit-to-triple identifications and the E7 profile G12; noncentral compact cases G4 and Annals collation G7 remain open. |

## Sources

- **Dan Ciubotaru and Michael Harris**, *On the generalized Ramanujan and Arthur conjectures over function fields*. Annals of Mathematics 204 (2026), no. 2, 545–601; read in arXiv:2311.15300v1 (26 November 2023, 39 pp.), whose page numbers are used throughout; the Annals text (revised 8 October 2025) was not accessible and is not collated [ch26](https://arxiv.org/abs/2311.15300).
- **Wee Teck Gan, Michael Harris and Will Sawin, with an appendix by Raphaël Beuzart-Plessis**, *Local parameters of supercuspidal representations*. Forum of Mathematics, Pi 12 (2024), e13; published PDF (printed page = PDF page); arXiv:2109.07737v3 was also read: there Theorem 1.2 assumes p > 3, and the published Proposition 3.11, Corollary 3.12 and Remark 3.13 are numbered 3.10, 3.11 and 3.12 (the published Remark 3.10 is new) [ghs](https://doi.org/10.1017/fmp.2024.10).
- **Siyan Daniel Li-Huerta**, *Local-global compatibility over function fields*. arXiv:2301.09711v2 (13 August 2023), 54 pp. [lh](https://arxiv.org/abs/2301.09711).
- **Will Sawin and Nicolas Templier**, *On the Ramanujan conjecture for automorphic forms over function fields I. Geometry*. arXiv:1805.12231v4 (27 September 2020) [st](https://arxiv.org/abs/1805.12231).
- **Cong Xue**, *Finiteness of cohomology groups of stacks of shtukas as modules over Hecke algebras, and applications*. Épijournal de Géométrie Algébrique 4 (2020), Article 6; arXiv:1811.09513v3 (journal pagination) [xue](https://arxiv.org/abs/1811.09513).
- **Vincent Lafforgue and Xinwen Zhu**, *Décomposition au-dessus des paramètres de Langlands elliptiques*. arXiv:1811.07976v2 (11 December 2019) [lz](https://arxiv.org/abs/1811.07976).
- **Shenghao Sun**, *L-series of Artin stacks over finite fields*. Algebra & Number Theory 6 (2012), 47–122; read in arXiv:1008.3689v2 (28 March 2011) [sun](https://arxiv.org/abs/1008.3689).
- **Wee Teck Gan and Luis Lomelí**, *Globalization of supercuspidal representations over function fields and applications*. J. Eur. Math. Soc. 20 (2018), 2813–2858; read in arXiv:1510.00131v2 [glo](https://arxiv.org/abs/1510.00131).
- **Jochen Heinloth, Bao Châu Ngô and Zhiwei Yun**, *Kloosterman sheaves for reductive groups*. Annals of Mathematics 177 (2013), 241–310; read in arXiv:1005.2765v1 [hny](https://arxiv.org/abs/1005.2765).
- **Laurent Lafforgue**, *Chtoucas de Drinfeld et correspondance de Langlands*. Inventiones Mathematicae 147 (2002), 1–241; author's full text (journal pagination) [laf02](https://www.ihes.fr/~lafforgue/math/fulltext.pdf).
- **Richard Taylor and Teruyoshi Yoshida**, *Compatibility of local and global Langlands correspondences*. arXiv:math/0412357 author text, pp.6–7; Lemma 1.4(3)–(6) [ty](https://arxiv.org/abs/math/0412357).

Each node gives the source section, theorem and page. Statements and proof routes are restated in our own words. The source issues E1–E4 below belong to this packet; references prefixed PAPER-CIUBOTARU-HARRIS-26 belong to the earlier paper extraction.

## Contact with the libraries

Planning pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The two baseline declarations were read at those exact commits. The current Tau Ceti library and the newer TauCetiRoadmap documents were also inspected; their representation and algebraic-group foundations are imported rather than duplicated. The reviewed GS.0–GS.7 library audit supplies no existing formal global-parameter or Ramanujan target.

| Pinned declaration | Import |
| --- | --- |
| `mathlib:Finset.prod_eq_single` | A finite product with all factors 1 except possibly at a equals the factor at a; its additive form Finset.sum\_eq\_single (generated by to\_additive) shows that a diagonal weight array has equal row and column sums in the suggested file. statement read at the pinned commit (line 355). |
| `mathlib:Finset.prod_comm` | Exchange of two finite products; its additive form Finset.sum\_comm gives the equality of the totals of row and column sums of a weight array. statement read at the pinned commit (line 121). |

The suggested Lean file states the finite weight-array combinatorics and explicit numerical examples that can be expressed at these pins. It also records the finite index lists for test representations. It does not construct the corresponding Γ-stable L-group representations or identify named exceptional orbits with triples; those are reader targets. Every implementation status remains unchecked.

## RA.0 Geometric local parameters and pure Weil–Deligne parameters

**Targets.** Integer-weight geometric L-homomorphisms with finite inertia (Ciubotaru–Harris §2.3, Definition 2.5, p.7), and independence of a faithful realization using tensor generation. Distinguish arithmetic Weil–Deligne purity from fixed-ι purity and boundedness. State the weight–monodromy convention with N lowering weights by 2. Pure completion is unique in the fixed-ι GL_n case; the general reductive assertion uses adjoint boundedness and derived-centralizer conjugacy (Gan–Harris–Sawin Lemma 3.5, p.9), not common-weight purity in every faithful representation. The RD.6 tensor-generator converse is requested.

<a id="ra-0-geometric-l-homomorphism"></a>
### RA.0.1 Geometric local L-homomorphisms

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism` · definition · planet: Geometric local parameter

Let G be a connected reductive group over F and ϕ : W\_F → LG(C) a continuous semisimple L-homomorphism (compatible with the projection to the Galois factor). For a finite-dimensional algebraic representation τ : LG → GL\_N write ρ(ϕ, τ) = τ ∘ ϕ. The parameter ϕ is geometric when, for a faithful τ, every eigenvalue λ of ρ(ϕ, τ)(Frob) is a Weil q-number of integer weight: λ is algebraic over Q and there is w(λ) ∈ ℤ with |σ(λ)| = q^{w(λ)/2} for every field embedding σ : Q(λ) → ℂ. The weight multiset of ϕ along τ is the multiset of the w(λ), counted with algebraic multiplicity. The same definition applies with C = Q̄\_ℓ, and to a Weil-group representation W\_F → GL\_N(C) (the case LG = GL\_N).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists.
- The Weil parameter is Frobenius-semisimple and has finite inertia image. Finite inertia is an admissibility hypothesis here; an ℓ-adic representation with quasi-unipotent inertia is first converted to its Weil–Deligne representation. A semisimple algebraic representation alone is not used as a substitute for this hypothesis.

*Proof route.*

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

*Source.* [ch26] §2.3, Definition 2.5, p. 7: Defines a geometric L-homomorphism of the Galois group of k((t)) as one whose Frobenius eigenvalues in a faithful representation are Weil q-numbers of integer weight, and notes that the definition is the same over any algebraically closed field of characteristic 0.; [ghs] §2.2, Definition 2.5, pp. 7–8: Introduces common-weight purity in a faithful representation. Only the integer-weight eigenvalue predicate is used here; the claimed arbitrary-faithful common-weight independence is false for reductive centres (this packet E3).

*Needs.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`.

<a id="ra-0-geometricity-is-intrinsic"></a>
### RA.0.2 Geometricity is independent of the realization

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic` · theorem

Let ϕ : W\_F → LG(C) be a continuous semisimple L-homomorphism. (a) If the eigenvalues of τ₀(ϕ(Frob)) are Weil q-numbers of integer weights for one faithful τ₀, then for every algebraic representation τ of LG the eigenvalues of τ(ϕ(Frob)) are Weil q-numbers of integer weights. (b) The condition does not depend on the Frobenius lift: for Frob′ = Frob·σ with σ in inertia, the eigenvalues of τ(ϕ(Frob′)) are Weil q-numbers of the same weights. (c) For an algebraic L-homomorphism f : LG → LH, geometricity of ϕ implies that of f ∘ ϕ, with equivalence when f is a closed embedding.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- τ₀ is faithful: its kernel is trivial as a group scheme.
- The parameter has finite inertia image, as in RA.0/geometric-l-homomorphism.

*Proof route.*

- (a) A faithful representation of an affine algebraic group is a tensor generator: every algebraic τ is a subquotient of a finite sum of τ₀^{⊗a} ⊗ (τ₀^∨)^{⊗b} (Deligne–Milne Proposition 2.20(b), the tensor-generator statement imported through RD.6).
- Eigenvalues of tensor products and duals are products and inverses of eigenvalues (DWP.0/spectra-of-tensor-products-and-duals), and eigenvalues of a subquotient are among those of the ambient endomorphism; Weil q-numbers of integer weight are closed under products and inverses (DWP.0/weil-number-arithmetic).
- (b) By the finite-inertia hypothesis ϕ(I\_F) is finite, say of order m, normalized by ϕ(Frob). Some power ϕ(Frob)^N with N ≥ 1 commutes with ϕ(I\_F); then ϕ(Frob′)^{Nm} = ϕ(Frob)^{Nm}, so the eigenvalues of τ(ϕ(Frob′)) are Nm-th roots of those of τ(ϕ(Frob))^{Nm}. A root of a Weil q^{Nm}-number of weight w is a Weil q-number of weight w (DWP.0/weil-number-base-extension).
- (c) τ ∘ f is an algebraic representation of LG, so (a) applies; for a closed embedding f a faithful representation of LH restricts to a faithful one of LG.

*Checks.*

- For G = SL₂ (Ĝ = PGL₂) and ϕ unramified with ϕ(Frob) = diag(q^{1/2}, q^{−1/2}) (the trivial representation), the adjoint representation has eigenvalues q, 1, q^{−1} with weights 2, 0, −2.
- If the condition held only for a non-faithful τ (say the trivial representation) nothing would follow; faithfulness is needed.

*Source.* [ch26] §2.3, Definition 2.5, p. 7: Asserts that the condition for one faithful representation is equivalent to the condition for any, and that any Frobenius element may be used; the argument is left to the reader.; [ghs] §2.2, Definition 2.5, pp. 7–8: Contains a faithful-realization independence assertion. The proof here establishes the weaker, correct integer-weight geometricity assertion by tensor generation, not arbitrary-faithful common-weight purity (this packet E3).

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `PadicDifferentialEquationsAndRigidCohomology:RD.6/neutral-tannakian-recognition`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

<a id="ra-0-pure-weil-deligne-parameter"></a>
### RA.0.3 Pure Weil–Deligne representations and parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter` · definition · planet: Pure Weil–Deligne parameter

A Weil–Deligne representation (ϕ, N) of W\_F on a finite-dimensional C-vector space V (ϕ continuous and Frobenius-semisimple, N nilpotent with ϕ(w) N ϕ(w)^{−1} = q^{−deg w} N for w ∈ W\_F, deg(Frob) = 1) is pure of weight w ∈ ℤ when: (i) the eigenvalues of ϕ(Frob) are Weil q-numbers of integer weights; (ii) for each a the sum W\_a V of the generalized eigenspaces of ϕ(Frob) of weight ≤ a is stable under ϕ and N (N lowers weights by 2); (iii) for every i ≥ 0, N^i induces an isomorphism gr\_{w+i} V → gr\_{w−i} V, where gr\_a = W\_a/W\_{a−1}. For a fixed field isomorphism ι : C ≅ ℂ, ι-purity of weight w uses the same integer filtration and N-isomorphisms, replacing the Weil-number condition by 2 log\_q|ι(λ)| ∈ ℤ. Arithmetic purity requires the same weights for every embedding as well as algebraicity of the eigenvalues. For semisimple G, call an LG-valued pair arithmetically pure of weight 0 when τ ∘ (ϕ,N) is arithmetically pure of weight 0 for every algebraic τ. For general reductive G use the separate analytic predicate ι-essentially tempered: the associated W\_F × SL₂ parameter has bounded Weil image after projection to the adjoint group. No common-weight condition in one arbitrary faithful representation is used for reductive groups. The associated semisimple parameter is ϕ(w) = φ(w,diag(q^{−deg w/2},q^{deg w/2})), with N = dφ(e); thus N lowers weights by 2.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists.
- This is the geometric-Frobenius form of Ciubotaru–Harris Definition 2.6 with the correction PAPER-CIUBOTARU-HARRIS-26/E9: as printed, (ii) and (iii) ask N to move weights in opposite directions.
- The Weil part has finite inertia image. A direct summand below is a Weil–Deligne direct summand, respecting both ϕ and N.

*Proof route.*

- The Weil–Deligne relation with geometric Frobenius gives ϕ(Frob)(Nv) = q^{−1} N ϕ(Frob)v, so N maps the generalized λ-eigenspace to the q^{−1}λ one and lowers weights by 2; this makes (ii) consistent with (iii).
- Tensor products of pure WD representations have added weights and duals have opposite weights. WD direct summands inherit purity of the same weight. Arbitrary subobjects and quotients need not: in Sp(2), ker N has weight 0 while the whole pair is pure of weight 1 (Taylor–Yoshida Lemma 1.4(5), pp. 6–7). The all-representations group predicate avoids assuming the false common-weight faithful criterion.
- For the Frobenius-semisimple dictionary use the WD–SL₂ equivalence with the displayed sign convention. Jacobson–Morozov supplies the algebraic SL₂; the arithmetic purity conditions and analytic boundedness are compared only after fixing ι, as specified in RA.0/pure-completion-uniqueness.

*API.*

- `WeilDeligneRep.IsPure` (data): The predicate IsPure w on a Weil–Deligne representation (ϕ, N), with the weight filtration W\_a and graded pieces gr\_a.
- `WeilDeligneRep.IsPure.weightFiltration` (projection): The filtration W\_• by Frobenius weight, stable under ϕ and N.
- `WeilDeligneRep.IsPure.hardLefschetz` (characterisation): N^i : gr\_{w+i} ≅ gr\_{w−i} for i ≥ 0.
- `WeilDeligneRep.IsPure.tensor` (functoriality): IsPure w₁ and IsPure w₂ give IsPure (w₁ + w₂) for the tensor product; the dual is pure of weight −w.
- `WeilDeligneRep.IsPure.directSummand` (functoriality): A Weil–Deligne direct summand of an arithmetically pure representation of weight w is arithmetically pure of weight w; the corresponding assertion for arbitrary subquotients is false.
- `LGWeilDeligne.IsPure` (data): For semisimple G, all algebraic τ ∘ (ϕ,N) are arithmetically pure of weight 0. For general reductive G, analytic ι-essential temperedness is defined separately by adjoint boundedness.
- `WeilDeligneRep.iotaPure_zero_iff_tempered` (equivalence): For a GL\_n WD representation and a fixed ι, ι-purity of weight 0 is equivalent to boundedness of the Weil restriction of its associated L-parameter. Arithmetic purity of weight 0 requires algebraicity and this condition at every embedding.

*Unit tests.*

- `WeilDeligneRep.special_two_pure` (computation): Sp(2) with ϕ(Frob) = diag(1, q) and N e₁ = e₀ is pure of weight 1.
- `WeilDeligneRep.special_two_N_zero` (non-example): diag(1, q) with N = 0 is not pure: gr₂ ≠ 0 = N(gr₂).
- `WeilDeligneRep.unramified_scalar` (degenerate): N = 0 and ϕ(Frob) = λ·id with λ a Weil q-number of weight w: pure of weight w.
- `WeilDeligneRep.sign_convention` (non-example): With the printed directions of Ciubotaru–Harris Definition 2.6 (N raising weights in (iii) while (ii) needs N to lower them), Sp(2) would fail (ii) or (iii); the corrected definition accepts it.
- `WeilDeligneRep.gln_tempered` (compatibility): For a GL\_n WD representation and a fixed ι, ι-purity of weight 0 is equivalent to boundedness of the Weil restriction of its associated L-parameter. Arithmetic purity of weight 0 requires algebraicity and this condition at every embedding.
- `WeilDeligneRep.kernel_not_same_weight` (non-example): For Sp(2), ker N = ⟨e₀⟩ is pure of weight 0 and V/ker N is pure of weight 2; neither is pure of the ambient weight 1.
- `LGWeilDeligne.faithful_common_weight_fails` (non-example): For G\_m and ϕ(Frob)=q, the identity representation is pure of weight 2, while the faithful identity ⊕ trivial representation with N=0 has weights 2 and 0 and is not pure of any common weight.
- `WeilDeligneRep.one_embedding_insufficient` (non-example): For a rank-one WD representation with Frobenius a unit-circle root of x⁴−x³−x²−x+1, the chosen complex realization is bounded and ι-pure of weight 0, but the representation is not arithmetically pure of weight 0: another conjugate has absolute value 1.7221….

*Checks.*

- The special representation Sp(2): V = C², ϕ(Frob) = diag(1, q) on (e₀, e₁), N e₁ = e₀, N e₀ = 0, is pure of weight 1: gr₀ = ⟨e₀⟩, gr₂ = ⟨e₁⟩ and N : gr₂ → gr₀ is an isomorphism.
- The same ϕ with N = 0 is not pure of any weight.

*Uses.* Ciubotaru–Harris, Proposition 2.7, last assertion, p. 8: the graded pieces of the global weight filtration are pure Weil–Deligne representations at the boundary place; Ciubotaru–Harris, proof of Theorem 5.4, p. 14: the discrete-series anchor gives a pure Weil–Deligne representation of weight 0; Ciubotaru–Harris, proof of Theorem 10.3, (10.4), p. 33: the symmetry of the weight array comes from the isomorphisms N^i.

*Source.* [ch26] §2.3, Definition 2.6, p. 7: Defines a pure Weil–Deligne representation of weight w by integrality of Frobenius weights, stability of the weight subspaces and the hard-Lefschetz-type isomorphisms N^i between graded pieces; the direction of N is corrected as in E9.; [ghs] §3.1, Definitions 3.1–3.3, p. 8: Defines the analytic WD–SL₂ dictionary and essential temperedness. Its common-weight independence of an arbitrary faithful representation is not used: see this packet E3. Fixed-ι analytic and all-embeddings arithmetic purity are distinguished here.; [ty] §1, Lemma 1.4(3)–(6) and proof, pp.6–7: Distinguishes arithmetic purity from temperedness at every embedding; direct summands of a pure WD representation inherit its weight, while arbitrary WD subobjects need the determinant condition.

*Needs.* `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometric-l-homomorphism`, `LieHighestWeightPartII:N0/jacobson-morozov`.

<a id="ra-0-pure-completion-uniqueness"></a>
### RA.0.4 Uniqueness of pure completions

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-completion-uniqueness` · theorem

For a fixed ι, a GL\_n WD representation is ι-pure of weight 0 iff the Weil part of its associated L-parameter is bounded. For a general reductive group, a Frobenius-semisimple Weil parameter has at most one ι-essentially tempered WD completion up to Ĝ-conjugacy; essential temperedness means adjoint boundedness. In particular an arithmetic weight-0 completion of a semisimple-group parameter, if it exists, is unique. Arithmetic purity is not equivalent to boundedness at just one embedding.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- C = ℂ for boundedness; for C = Q̄\_ℓ transport by a field isomorphism Q̄\_ℓ ≅ ℂ (ι-purity).

*Proof route.*

- For GL\_n decompose the WD representation into special representations Sp(r); ι-purity of weight 0 says that the primitive Weil constituents have exactly the shifts cancelling the SL₂ weights, hence the associated Weil part is bounded. Taylor–Yoshida Lemma 1.4(3) compares its arithmetic version with temperedness at every embedding; it does not remove that quantifier.
- For uniqueness use Gan–Harris–Sawin Lemma 3.5(b): after projection to the adjoint group the Weil part is bounded; its centralizer is reductive, and its SL₂ lies in the derived subgroup of the identity component. The neutral element is determined by the real Frobenius part of the given semisimple parameter.
- Apply neutral-element conjugacy to that semisimple derived Lie algebra (N0/neutral-conjugacy and N0/kostant-conjugacy). Lift back through the finite central isogeny; a connected SL₂ has no nontrivial morphism into the central torus. Unbounded central Weil characters do not affect this uniqueness argument.

*Checks.*

- For GL₂ and ρ unramified with ρ(Frob) = diag(q^{1/2}, q^{−1/2}) (weights 1 and −1), the pure completion is the Steinberg parameter with N ≠ 0; N = 0 is not pure.
- For GL₂, diag(1,q²) has no essentially tempered completion: with N=0 its two real Weil exponents differ, while the WD relation prevents a nonzero N from joining eigenvalues whose ratio is q².

*Source.* [ghs] §3.1, Lemma 3.5 and its proof, p. 9: States that purity is equivalent to essential temperedness of the L-parameter and that a semisimple parameter has at most one pure completion, reducing (a) to GL\_n via Taylor–Yoshida and (b) to Arthur's uniqueness of the SL₂-factor inside the reductive centralizer of the bounded part.; [ty] §1, Lemma 1.4(3)–(6) and proof, pp.6–7: Distinguishes arithmetic purity from temperedness at every embedding; direct summands of a pure WD representation inherit its weight, while arbitrary WD subobjects need the determinant condition.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter`, `LieHighestWeightPartII:N0/neutral-conjugacy`, `LieHighestWeightPartII:N0/kostant-conjugacy`.

## RA.1 Weights of ℓ-adic local systems on curves

**Targets.** Lafforgue’s constant-field twist decomposition (Corollaire VII.8, pp.201–202) and geometricity propagation from one boundary place (Ciubotaru–Harris Proposition 2.7, pp.7–8). Sawin–Templier’s real-weight filtration and purity for parameters in no proper parabolic (Lemma 11.4, p.83) give common weights in irreducible algebraic realizations. For semisimple G the resulting arithmetic weight is 0; reductive centres require a separate normalization. Import the curve weight theory from DWP.5/DWP.8 and GS.6.

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
- Use L. Lafforgue Corollaire VII.8 directly for the absolute constant-twist decomposition, including the splitting of extensions between distinct twist classes. DWP.8 supplies the analogous fixed-ι decomposition; disjoint spectra by itself proves no-Hom, not the required Ext vanishing.

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

Let Ĝ be semisimple over Q̄\_ℓ and σ : Gal(K^sep/K) → Ĝ(Q̄\_ℓ) continuous, unramified outside a finite set, such that V ∘ σ is ι-mixed for one faithful V (automatic on curves by RA.1/constant-field-weight-decomposition). If the image of σ lies in no proper parabolic subgroup of Ĝ, then V ∘ σ is ι-pure of weight 0 for every representation V of Ĝ. For LG-valued σ with Ĝ semisimple the same argument applies when parabolic subgroups of LG are taken in the dynamic sense (GHS Lemma 3.6 and Remark 3.7 note that the argument holds for any reductive G, giving a common weight for each irreducible algebraic representation; semisimplicity of Ĝ forces the weight to be 0 as in the last step below).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- ι : Q̄\_ℓ ≅ ℂ is fixed; the conclusion is then for every ι, since the hypothesis is ι-independent.
- Fixed-ι mixedness permits real weights. Apply the decomposition modulo ℤ followed by a constant twist before using DWP.8 integer-indexed weight filtrations; alternatively use the real-weight version of the argument in Sawin–Templier §11.

*Proof route.*

- Use the real-weight filtration on an ι-mixed sheaf, as in Sawin–Templier §11, Lemma 11.4, p.83. DWP.8 gives its integer-weight case; after splitting by weights modulo ℤ and applying constant twists it supplies the required filtration on the separate summands. The Frobenius cocharacter construction below is the real-weight version and must use the full faithful representation, not a single irreducible summand.
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

Let G be semisimple over K and σ a continuous semisimple global Galois parameter whose image lies in no proper parabolic of LG. At every place u, the Frobenius-semisimple WD representation of τ ∘ σ|\_{W\_{K\_u}} is arithmetically pure of weight 0 for every algebraic τ. Its LG-valued WD completion is therefore the unique essentially tempered completion at every ι. For a general reductive group the corresponding assertion is about the adjoint projection; a common arithmetic weight for every τ is not asserted.

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

## RA.2 Rational Satake classes of cuspidal parameters

**Targets.** The relation between a cuspidal representation π and a parent excursion parameter σ, its associated local systems L(π,τ), rationality of Satake classes (Ciubotaru–Harris Theorem 3.6, p.10), and normalized real parts satisfying 2⟨μ,ν_w⟩=weight(μ). The nonsplit coefficient/support extension of FA.6 is requested; it is not supplied by the existing split integral-model target.

<a id="ra-2-cuspidal-parameter-local-systems"></a>
### RA.2.1 Cuspidal representations belonging to a parameter

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/cuspidal-parameter-local-systems` · definition · planet: Local systems of a cuspidal parameter

Let A₀(G, U, E) be the module of E-valued cusp forms of level U (FA.6) and A₀(G, U, Q̄\_ℓ) = ⊕\_σ A₀(G, U, Q̄\_ℓ)\_{λ(σ)} V. Lafforgue's decomposition into generalized eigenspaces of the excursion algebra B(G, U, Q̄\_ℓ), indexed by continuous semisimple σ : Gal(K^sep/K) → LG(Q̄\_ℓ) unramified outside S (GS.5); Φ(U) is the set of σ that occur. For an irreducible π ⊂ A₀(G, Q̄) with m\_U(π) ≠ 0, π belongs to σ ∈ Φ(U) when the restriction λ\_H(σ) of λ(σ) to the spherical Hecke algebra H^S(G, U) away from S equals the action of H^S(G, U) on π^U (after ι\_ℓ). For an algebraic representation τ : LG → GL\_M, L(σ, τ) is the semisimple lisse Q̄\_ℓ-sheaf on X ∖ |S| given by τ ∘ σ, and L(π, τ) := L(σ, τ) when π belongs to σ.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

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

*Needs.* `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/nonsplit-groups-and-the-l-group`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`, `FunctionFieldArithmetic:FA.6`.

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

*Needs.* `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `FunctionFieldArithmetic:FA.6/function-field-hecke-satake`, `FunctionFieldArithmetic:FA.6/harder-cuspidal-support`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/hecke-operator-as-creation-frobenius-annihilation`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/satake-compatibility-and-chebotarev`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/nonsplit-groups-and-the-l-group`, `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/cuspidal-parameter-local-systems`, `FunctionFieldArithmetic:FA.6`.

<a id="ra-2-satake-real-part"></a>
### RA.2.3 The real part of a Satake class

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part` · construction · planet: Real part of a Satake class

For σ ∈ Φ(U), w ∉ S and an embedding ι, write ι(s\_w(σ)) = s\_c·q\_w^{ν} with s\_c in the maximal compact subgroup of T̂(ℂ) and ν ∈ t̂\_ℝ (polar decomposition, SRU.5/real-satake-parameter). The real part is ν\_w^ι(σ) := ν = log\_{q\_w}|ι(s\_w(σ))| ∈ t̂\_ℝ, well defined up to the (relative) Weyl group. Its pairing with a weight α of τ gives half the Deligne ι-weight of the corresponding eigenvalue of τ(σ(Frob\_w)): |ι(·)| = q\_w^{⟨α, ν⟩}. Thus that Deligne weight is 2⟨α,ν⟩.

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
- `SatakeClass.realPart_weight` (characterisation): For a weight α of τ the corresponding eigenvalue of τ(ι s\_w) has absolute value q\_w^{⟨α, ν⟩}. Its Deligne ι-weight is 2⟨α,ν⟩.
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

## RA.3 Local semisimple parameters and geometric representations

**Targets.** Framed local-to-global shtuka uniformization and Li-Huerta’s comparison of Genestier–Lafforgue and Fargues–Scholze parameters (Theorems A/C and §§5–6). Plan geometric representations and stability under coefficient transport, normalized induction, Jacquet modules, products and geometric twists (Ciubotaru–Harris Proposition 3.10, pp.10–11), with finite-length Hecke descent. For nonsplit tori use componentwise residue cardinalities, not a uniformizer criterion with an incorrect residue-degree normalization. Restrict central characters to the smooth central torus. Request the equal-characteristic HS2 extension, ES6 normal-image transport and the precise ES5 square-root coefficient law.

<a id="ra-3-shtuka-uniformization"></a>
### RA.3.1 Uniformization of global shtukas by local shtukas

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/shtuka-uniformization` · theorem

Let C be the curve of a global function field, v a place with formal disc D, G connected reductive with a smooth model, legs I placed in D with bounds μ\_•, and N a level disjoint from v. Gluing a framed local G-shtuka to the trivial G-bundle away from v by Beauville–Laszlo defines a formally étale morphism Θ̂ from the formal moduli of local G-shtukas bounded by μ\_• to the formal completion along v of the moduli of global G-shtukas of level N (Li-Huerta Proposition 5.13). On a Harder–Narasimhan truncation ≤ s and for deg N large enough this is a morphism of formal schemes, formally étale and locally formally of finite type (Proposition 5.14). On generic fibres, for every n ≥ 0, it gives an étale morphism Θ\_n of locally spatial diamonds from the analytic local shtuka moduli with level n·v to the diamond of the truncated global moduli with level n·v + N (Theorem 5.16), compatible with the partial Frobenius morphisms (Lemma 5.18). Through Θ\_n the homology of the local shtuka moduli with Satake coefficients maps to the cohomology of the global shtuka stacks (§6).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- N and v are disjoint; deg N is large enough for Proposition 5.14; the truncation ≤ s is fixed and Θ\_n is defined over the product of the punctured discs at v.

*Proof route.*

- A framed local shtuka includes the quasi-isogeny trivialization on the punctured disc. Glue its bundles and modifications to the trivial bundle and identity modifications away from v; the level N is trivial there. This defines Θ̂ in the local-to-global direction. Rigidity of quasi-isogenies (Proposition 2.3) gives the unique infinitesimal lifting required by Proposition 5.13.
- On truncations the source is a formal scheme by Li-Huerta Theorem 2.12 and the target by the finite-type statement for large deg N (Proposition 5.14).
- Pass to generic fibres through the analytic local shtuka moduli and their identification with diamonds (Theorem 4.9, Proposition 4.12) to define Θ\_n with level at v (Theorem 5.16); compatibility with partial Frobenius is Lemma 5.18.
- The coefficient sheaves on both sides match under Θ\_n (Lemma 6.4), which gives the maps on (co)homology used in §6.13.

*Checks.*

- For G=GL₁, use a local shtuka with its quasi-isogeny framing. Gluing produces a global line bundle trivialized away from v, of degree prescribed by the local modification. Forgetting the framing does not define the stated local-to-global map, and formal étaleness does not assert a bijection with all global Pic-shtuka components.

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

Let L\_F : Π(G/F) → Φ(G/F) be the semisimple local parametrization of irreducible smooth Q̄\_ℓ-representations (Genestier–Lafforgue, equal to Fargues–Scholze by RA.3/li-huerta-compatibility). Then: (1) for F = K\_w and Π cuspidal, L\_F(Π\_w) = (L(Π)|\_{W\_F})^{ss}; (2) if π is a constituent of the normalized induction i\_P^G(ρ), then L\_F(π) = i\_M ∘ L\_F(ρ) for the Levi embedding i\_M : LM → LG; (3) if L\_F(π) lies in no proper Levi subgroup, π is supercuspidal; (4) if π has nonzero vectors under the pro-p radical of an Iwahori subgroup of a quasi-split G, L\_F(π) factors through LT; (5) for Υ : G₁ → G₂ with normal image, L\_F(π ∘ Υ) = LΥ ∘ L\_F(π) on constituents; (6) τ ↦ τ ∘ L\_F(π) is symmetric monoidal; (7) coefficient transport by γ fixing the chosen √q commutes with L\_F; for a general γ the precise finite central normalization twist is a requested ES5 target (G8), rather than an unverified formula through a named cocharacter.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- Frobenius conventions are those of the parent roadmap: geometric Frobenius, local reciprocity sending a uniformizer to geometric Frobenius, and one fixed square root of q for normalized induction and half Tate twists.
- G connected reductive over F.

*Proof route.*

- (1) is GS.7/local-global-compatibility-up-to-semisimplification (Genestier–Lafforgue Théorème 0.1).
- (2) and (3): compatibility with normalized parabolic induction (GS.7/bernstein-center-and-local-parameters; ES7:parabolic/normalised-induction-dictionary); if π were a constituent of an induction from a proper parabolic, its parameter would factor through a proper Levi.
- (4) follows from (2) for a principal-series constituent. (5) uses the general normal-image functoriality of GHS Theorem 2.3(vi), requested explicitly at ES6; the existing isogenies node alone has the narrower adjoint-isomorphism hypothesis.
- (7) is the coefficient-transport target requested at ES5, including the precise effect of moving √q on the normalized parameter. The existing invariance-and-coefficient-transport supplier is conditional and does not by itself identify this twist. No characteristic-zero GL\_n comparison is used here.

*Checks.*

- For GL₂ the Steinberg representation and the trivial representation have the same semisimple parameter diag(q^{1/2},q^{−1/2}), by their common normalized-induction support. This is an equal-characteristic calculation and does not cite ES7’s characteristic-zero GL\_n comparison.
- For the Steinberg representation of PGL₂, L\_F(St) is unramified with Frobenius diag(q^{1/2}, q^{−1/2}): the parameter of the trivial representation, as (2) predicts.

*Source.* [ch26] §3.2, Theorem 3.8, p. 10: Recalls the semisimple local parametrization with local–global compatibility, compatibility with parabolic induction and the supercuspidality of representations with irreducible parameter.; [ghs] §2.1, Theorem 2.1(iii), p. 7; §2.2, Theorem 2.3(iv)–(vi) and Corollary 2.4(ii), pp. 6–7: States that the semisimplified local restriction of a global parameter depends only on the local component, and states compatibility with normalized parabolic induction, the Iwahori pro-p case, compatibility with homomorphisms with normal image, and the symmetric monoidal functor on representations of LG.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.7/local-global-compatibility-up-to-semisimplification`, `GlobalShtukasAndFunctionFieldLanglands:GS.7/bernstein-center-and-local-parameters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/li-huerta-compatibility`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `ExcursionOperatorsAndSpectralAction:ES5`.

<a id="ra-3-geometric-representation"></a>
### RA.3.4 Geometric representations of a local group

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation` · definition · planet: Geometric representation

An irreducible smooth representation π of G(F) over Q̄\_ℓ is geometric when it has a model π\_E over a number field E ⊂ Q̄\_ℓ (π\_E ⊗\_E Q̄\_ℓ ≅ π) and its semisimple parameter L\_F(π) is geometric (RA.0/geometric-l-homomorphism). A complex representation is geometric when it is π ⊗\_{ι} ℂ for a geometric π.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F; L\_F as in RA.3/local-parametrization.

*Proof route.*

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
- `SmoothRep.gln_compat` (compatibility): For GL\_n the normalized induction of geometric characters has geometric semisimple parameter by RA.3/local-parametrization (2); for GL₂ the Steinberg constituent has Frobenius eigenvalues q^{1/2},q^{−1/2}. This test does not import the characteristic-zero ES7 GL\_n comparison.
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
- Use the coefficient-transport contract requested at ES5, including the finite central normalization twist for automorphisms moving √q (G8).

*Proof route.*

- Extend the two embeddings of the number field to an automorphism γ of Q̄\_ℓ. The requested ES5 coefficient-transport contract identifies L\_F(γπ) with γL\_F(π), allowing the specified finite central normalization twist. The representation twist is an autoequivalence preserving irreducibility and smoothness by the current SR.0 coefficient-change target; a transported number-field model is still a number-field model.
- Being a Weil q-number of a given integer weight depends only on the minimal polynomial (DWP.0/weil-q-number), so γ preserves it; −1 is a Weil number of weight 0.

*Checks.*

- For an unramified character of G\_m with value (1 + 2i) on a uniformizer and q = 5, the conjugate value (1 − 2i) again has absolute value √5.

*Source.* [ch26] §3.2, Proposition 3.10(1) and its proof, pp. 10–11: States that conjugates of a geometric representation by embeddings of its field of definition are geometric, deducing it from compatibility of the Genestier–Lafforgue and Fargues–Scholze parametrizations with automorphisms of the coefficient field.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/coefficient-change`.

<a id="ra-3-geometric-torus-characters"></a>
### RA.3.6 Geometric characters of tori

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-torus-characters` · theorem

For a split F-torus T, a smooth character χ : T(F) → Q̄\_ℓ^× is geometric iff all its values are Weil q\_F-numbers of integer weight. For T = Res\_{E/F} G\_m, let f=[k\_E:k\_F] and q\_E=q\_F^f. Then χ is geometric iff χ(ϖ\_E) is a Weil q\_E-number of integer weight; the values on O\_E^× are roots of unity. The criterion must use q\_E, not q\_F. For an arbitrary nonsplit torus retain the definition through its torus L-parameter; the all-values condition with q\_F is not asserted to be sufficient.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- T a torus over F (not necessarily split).

*Proof route.*

- For G\_m use local reciprocity, sending ϖ\_F to geometric Frobenius. Smoothness makes the image of the compact unit group finite; a split torus is a finite product of this calculation. Algebraicity of the finitely many uniformizer values also supplies a number-field model.
- For Res\_{E/F} G\_m use the induced L-representation Ind\_{W\_E}^{W\_F} χ. For unramified E/F its Frobenius eigenvalues λ satisfy λ^f=χ(ϖ\_E), up to root-of-unity factors. Thus 2 log\_{q\_F}|λ| = 2 log\_{q\_E}|χ(ϖ\_E)|, with the same equality for every conjugate. For ramified E/F, the same power argument uses the residue degree f and finite inertia.
- An isogeny or a resolution by induced tori does not remove this residue-degree constraint. For unramified quadratic E/F and χ(ϖ\_E)=q\_F^{1/2}, every character value is a Weil q\_F-number of integer weight, but the induced Frobenius eigenvalues ±q\_F^{1/4} have weight 1/2, so χ is not geometric.

*Checks.*

- For the unramified quadratic torus Res\_{E/F} G\_m, χ(ϖ\_E)=q\_F has weight 1 relative to q\_E and gives induced Frobenius weights 1; χ(ϖ\_E)=q\_F^{1/2} fails integrality.
- For split G\_m the values on units have weight 0 and the sole unramified weight is 2 log\_{q\_F}|χ(ϖ\_F)|, independent of the embedding precisely for a Weil number.

*Source.* [ch26] §3.2, Proposition 3.10(2) and its proof, pp. 10–11: Proposition 3.10(2) states the all-values criterion for a general torus; this is used only for split tori here. Weil restriction requires q\_E=q\_F^f and gives the counterexample in this packet E2.

*Needs.* `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`.

<a id="ra-3-geometricity-stability"></a>
### RA.3.7 Stability of geometricity

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability` · theorem

Geometricity of irreducible smooth representations is preserved by: constituents of normalized parabolic induction i\_P^G(ρ) from geometric ρ; constituents of the normalized Jacquet module r\_P(π) of geometric π; external tensor products for G₁ × G₂; and twisting by geometric characters of G(F) factoring through G → G^{ab}.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F, P = MN a parabolic subgroup.

*Proof route.*

- Induction: L\_F(π)=i\_M∘L\_F(ρ). The normalized induced object is defined over a number field after adjoining √q. For induction and Jacquet modules use finite length and admissibility, choose a compact open subgroup whose invariants see all constituents, and use the finite-dimensional image of its Hecke algebra over that number field. Its simple modules descend after finite coefficient extension; the simple Hecke-module/smooth-representation correspondence then gives number-field models of the constituents. Coefficient change of invariants and of the functors is already in SR.0/SR.2; it does not alone assert descent of arbitrary infinite-length objects.
- For a Jacquet constituent η on M, its cuspidal support, viewed in G, is G-conjugate to the cuspidal support of π, by the geometric lemma and the cuspidal-support theorem. Compatibility with normalized induction therefore identifies i\_M∘L\_M(η) with L\_G(π). Since i\_M is a closed embedding, RA.0/geometricity-is-intrinsic(c) gives geometricity of L\_M(η).
- Products and twists: ES6:functoriality/products and ES6:functoriality/twisting-by-abelianized-characters, with RA.3/geometric-torus-characters for the character.

*Checks.*

- Every irreducible constituent of an unramified principal series of PGL₂ induced from a character with value q^{1/2} on a uniformizer is geometric (the trivial and Steinberg representations).

*Source.* [ch26] §3.2, Proposition 3.10(3) and its proof, pp. 10–11: States that geometricity is preserved under normalized parabolic induction, Jacquet modules, direct products and twists by geometric characters.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-torus-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/coefficient-change`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`.

<a id="ra-3-geometric-central-characters"></a>
### RA.3.8 Central characters of geometric representations

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters` · theorem

Let π be geometric. For every F-split torus A contained in Z\_G, the restricted central character ω\_π|\_{A(F)} is geometric and hence takes Weil q\_F-number values of integer weight. More generally, the restriction to T=(Z\_G)\_red^∘ is geometric through the torus local parameter, provided the normal-image central functoriality requested at ES6 is supplied. No L-group of a nonsmooth centre is formed. For example the centre μ\_p of SL\_p in characteristic p is not a torus; its group of F-points is trivial.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F with centre Z\_G.

*Proof route.*

- For a smooth central torus T→G the image is normal, so the normal-image compatibility of GHS Theorem 2.3(vi) identifies the parameter of ω\_π|\_T with the composite LT←LG←W\_F. This precise extension of the ES6 central-character supplier is requested; the existing z-embedding supplier alone does not make a nonsmooth centre a torus.
- Composition with an algebraic L-map preserves geometricity by RA.0/geometricity-is-intrinsic. In the split case RA.3/geometric-torus-characters converts this into the values criterion. This is exactly the input on the split centres A\_M required in Casselman inequalities.

*Checks.*

- For G = GL\_n and π = St\_n, ω\_π is trivial.

*Source.* [ch26] §3.2, Proposition 3.10(4) and its proof, pp. 10–11: States that the central character of a geometric representation of any reductive group is geometric, because restriction to the centre corresponds to representations of LG factoring through the L-group of the centre.

*Needs.* `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-torus-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`.

## RA.4 Discrete series: globalization, purity and Galois conjugation

**Targets.** Fixed-ι tempered/discrete representations, Casselman’s criterion with central unitarity, the semisimple Gan–Harris–Sawin globalizations in no proper parabolic (Propositions 3.9/3.11, Appendix A), and arithmetic Weil–Deligne purity of weight 0 for semisimple discrete series (Theorem 1.2, Corollary 3.12). The general reductive adjoint statement is conditional on central reduction. Plan Galois conjugation for algebraic discrete-series models and embedding independence for geometric tempered representations. Trace-formula inputs, étale Kloosterman invariant vanishing, arbitrary discrete-series descent and reductive central reduction remain explicit gaps.

<a id="ra-4-iota-tempered"></a>
### RA.4.1 ι-tempered and ι-discrete representations

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/iota-tempered` · definition · planet: ι-temperedness

Let π be an irreducible admissible representation of G(F) defined over Q̄ and ι : Q̄ → ℂ an embedding. π is ι-tempered (resp. ι-discrete series) when π ⊗\_{Q̄, ι} ℂ is tempered (resp. square-integrable modulo the centre) in the sense of SR.3. π is tempered (resp. discrete series) in the absolute sense when this holds for every embedding ι′.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F; π irreducible admissible over Q̄.

*Proof route.*

- Temperedness of π ⊗\_ι ℂ requires a unitary central character together with Casselman’s inequalities on the exponents of proper normalized Jacquet modules (SR.3/casselman-criterion). Coefficient change transports these algebraic characters and exponent values by ι′.
- Hence ι-temperedness depends only on the absolute values |ι(χ(a))| of the exponents χ of π.

*API.*

- `QbarRep.IsIotaTempered` (data): π ⊗\_ι ℂ is tempered.
- `QbarRep.IsIotaDiscrete` (data): π ⊗\_ι ℂ is square-integrable modulo the centre.
- `QbarRep.IsTempered` (data): ι′-tempered for every ι′ : Q̄ → ℂ.
- `QbarRep.isIotaTempered_iff_exponents` (characterisation): π is ι-tempered iff its central character is ι-unitary and |ι(χ(a))|≤1 for every exponent χ of a proper standard Jacquet module and a in its negative cone (SR.3/casselman-criterion).
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

Let G be connected semisimple over a global function field K, z a place with K\_z ≅ F and π a supercuspidal representation of G(F). There are infinitely many cuspidal automorphic Π of G(A\_K) with Π\_z ≅ π whose global parameter L(Π) lies in no proper parabolic subgroup of LG. Hence L\_F(π) has a pure completion realized as the restriction of L(Π) to the decomposition group at z.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G connected semisimple over K; z a place of K.
- In this packet the Galois-parameter and arithmetic-purity conclusion is planned for semisimple G. The general reductive extension requires central-character normalization and compatible global central data, recorded in G8.

*Proof route.*

- Choose a place x ≠ z where G is split (infinitely many: places splitting completely in a splitting field).
- At x take the local component π′ at ∞ of the Heinloth–Ngô–Yun Kloosterman automorphic representation over P¹\_{k(x)}; its parameter is the Kloosterman Ĝ-local system (KB.1/eigenobject, identified with Lafforgue's parameter by Satake compatibility and Chebotarev, GHS Remark 3.10), whose inertia image at ∞ has no adjoint invariants (KB.6/rigidity-local; Xu–Zhu remove the HNY prime restrictions, KB.11/all-prime-corollaries), so L\_F(π′) lies in no proper Levi. The KB.6 supplier currently states isocrystal local invariants; the étale HNY vanishing and its Xu–Zhu all-prime transfer are an explicit requested extension, not an implicit change of cohomology theory.
- Gan–Lomelí's Poincaré-series globalization gives cuspidal Π with Π\_x ≅ π′, Π\_z ≅ π and tame components elsewhere (requested from FA.6).
- L(Π)|\_{W\_x}^{ss} = L\_F(π′) (RA.3/local-parametrization (1)) is irreducible, so L(Π) is; RA.1/local-purity-of-irreducible-parameters gives the pure completion at z.
- Use the vanishing of adjoint inertia invariants to exclude a proper Levi: a proper Levi of a semisimple dual group has a positive-dimensional centre, whose Lie algebra would be fixed. This is weaker than irreducibility of the adjoint Weil representation, and the latter is not used (this packet E4).

*Checks.*

- For G = PGL₂ the Kloosterman parameter at ∞ is the Kloosterman sheaf Kl₂, whose ∞-inertia acts irreducibly (Swan conductor 1).

*Source.* [ghs] §3.3, Proposition 3.9 and its proof, Remark 3.10, pp. 10–11: Constructs, for a supercuspidal at one place, infinitely many cuspidal globalizations with irreducible global parameter, using the Kloosterman representation at an auxiliary split place (with Xu–Zhu removing the prime restrictions of Heinloth–Ngô–Yun) and the Poincaré-series globalization of Gan–Lomelí.; [glo] Theorem 1.1, pp. 1–2: Globalizes prescribed supercuspidals at a finite set of places to a cuspidal representation whose other local components are depth-zero principal series constituents, with prescribed central character.; [hny] Theorem 2, p. 17 (arXiv v1): Computes, for split almost-simple G, that the adjoint Kloosterman local system has Swan conductor equal to the rank at ∞ and no inertia invariants there, for p good when G is not simply laced.

*Needs.* `KloostermanSheavesAndBesselIsocrystals:KB.1/eigenobject`, `KloostermanSheavesAndBesselIsocrystals:KB.6/rigidity-local`, `KloostermanSheavesAndBesselIsocrystals:KB.11/all-prime-corollaries`, `FunctionFieldArithmetic:FA.6`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/local-purity-of-irreducible-parameters`, `KloostermanSheavesAndBesselIsocrystals:KB.6`.

<a id="ra-4-discrete-series-pseudo-globalization"></a>
### RA.4.3 Beuzart-Plessis's pseudo-globalization of discrete series

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization` · theorem

Let G be connected reductive over K with Z⁰ the identity component of its centre, ξ a character of Z⁰(K)∖Z⁰(A\_K), S\_ram the places where G or ξ ramify, and S, S′ ⊂ |X| disjoint with S′ ∩ S\_ram = ∅. For v ∈ S let π\_v be discrete series with central character ξ\_v on Z⁰(K\_v), at least one π\_{v₀} supercuspidal; for v ∈ S′ let X\_v be a proper Zariski-closed subset of the unramified characters with central character ξ\_v. Then there is a cuspidal automorphic Π with central character ξ on Z⁰(A\_K) such that Π\_v has nonzero trace against a pseudo-coefficient of π\_v for v ∈ S (so Π\_v and π\_v have the same cuspidal support), and Π\_v is unramified with Satake parameter outside X\_v for v ∈ S′. It is not asserted that Π\_v ≅ π\_v for v ∈ S ∖ {v₀}.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G connected reductive over K; pseudo-coefficients exist by the trace Paley–Wiener theorem.
- S and S′ are finite. The central torus formulation assumes Z\_G^∘ is smooth; for a nonsmooth centre use its maximal smooth connected central torus and supply the corresponding central-character formulation.

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

For semisimple G and an essentially discrete series π of G(F), there is a cuspidal automorphic Π of G over a global function field K with K\_z ≅ F such that L\_F(Π\_z) = L\_F(π) and L(Π) lies in no proper parabolic subgroup. Hence L\_F(π) admits a pure completion L(π), realized as the restriction of L(Π) at z.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G connected semisimple; any K, z with K\_z ≅ F and G defined over K (as in GHS).
- In this packet the Galois-parameter and arithmetic-purity conclusion is planned for semisimple G. The general reductive extension requires central-character normalization and compatible global central data, recorded in G8.

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

For connected reductive G and a discrete-series π, the semisimple local parameter has a unique essentially tempered WD refinement at a fixed ι (GHS Theorem 1.2). The refinement is essentially tempered after every coefficient embedding in the adjoint sense. For semisimple G, every algebraic τ of LG gives an arithmetically pure WD representation of weight 0, so its semisimple Frobenius eigenvalues have integer weights symmetric about 0. For general reductive G no single arithmetic weight in an arbitrary faithful representation is asserted; the proof requires the central reduction in G8.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- G connected reductive over F of any characteristic p (the published version has no restriction on p; the arXiv v3 version assumed p > 3).

*Proof route.*

- For semisimple G, existence follows from RA.4/discrete-series-irreducible-globalization and RA.1/local-purity-of-irreducible-parameters; uniqueness is RA.0/pure-completion-uniqueness. For reductive G, first twist the central character by an unramified character to reduce its unramified part to finite order, and compare discrete series and parameters under central isogenies/z-extensions. These exact local reduction and parameter-transport statements are requested at SR.3/ES6 (G8); they cannot be replaced by the semisimple globalizations alone.
- The semisimple global input is pure for every embedding. The reductive assertion concerns adjoint boundedness, which is unchanged by central twists (GHS Remark 3.13 read with this convention).
- For semisimple G use Sawin–Templier for each ι and every algebraic τ, plus the absolute weight argument through constant-twist classes; the determinant of τ factors through a finite Galois quotient, forcing the common weight to be 0. GHS Corollary 3.12 states the adjoint case, and the same semisimple argument applies to any τ.
- For semisimple G, arithmetic purity of every τ ∘ L\_F(π) gives integer-weight Weil-number Frobenius eigenvalues. This yields geometricity when the representation also has the number-field model required in RA.3/geometric-representation. No such central arithmetic assertion follows for general reductive G from adjoint boundedness alone.

*Checks.*

- For G = PGL₂ and π = St, L(π) is the Steinberg parameter and τ = standard of SL₂ gives Sp(2) twisted by q^{−1/2}: weights 1 and −1, pure of weight 0.

*Source.* [ghs] §1, Theorem 1.2 and Corollary 1.3, p. 3; §3.3, Corollary 3.12 and Remark 3.13, p. 11: Proves that the Genestier–Lafforgue parameter of a discrete series has a unique essentially tempered refinement, that for semisimple G its composite with the adjoint representation is pure of weight 0, and that the refinement is ι-pure for every ι.; [ch26] §4.2, paragraph after Proposition 4.5, p. 12; proof of Theorem 5.4, p. 14: Uses the Gan–Harris–Sawin purity of discrete series in the form 'τ ∘ L\_F(π\_u) extends uniquely to a pure Weil–Deligne representation of weight 0 for every τ'.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-completion-uniqueness`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/sawin-templier-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/pure-weil-deligne-parameter`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`.

<a id="ra-4-geometric-discrete-series"></a>
### RA.4.6 Discrete series with algebraic models are geometric

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series` · theorem

Let G be semisimple over F and π a representation with a number-field model such that π ⊗\_ι ℂ is discrete series. Then π is geometric. The extension to general reductive G with a geometric central character is a remaining target in G8, requiring the precise central reduction and torus convention; it is not inferred merely by taking a root of a nonzero integer-weight Weil number.

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).

*Proof route.*

- Choose a field isomorphism Q̄\_ℓ ≅ ℂ restricting to ι ∘ ι\_ℓ^{−1} on ι\_ℓ(Q̄); then π ⊗ Q̄\_ℓ is a discrete series for that isomorphism and RA.4/weil-deligne-purity-of-discrete-series applies.
- Purity of τ ∘ L(π) gives Weil-number Frobenius eigenvalues of integer weight.

*Checks.*

- The Steinberg representation of PGL₂(F) is geometric with weights ±1 in the standard representation.

*Source.* [ch26] §3.2, Proposition 3.10(5) and the last line of its proof, p. 11: States that a discrete series with geometric central character is geometric, automatically for semisimple G, deducing it from the Gan–Harris–Sawin theorem.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-representation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters`.

<a id="ra-4-galois-conjugation-of-discrete-series"></a>
### RA.4.7 Galois conjugates of discrete series are discrete series

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/galois-conjugation-of-discrete-series` · theorem · planet: Galois conjugation of discrete series

Let G be semisimple over F and π an irreducible representation with a number-field model, viewed over Q̄ such that π ⊗\_ι ℂ is discrete series for one ι. Then π ⊗\_{ι′} ℂ is discrete series for every ι′ : Q̄ → ℂ. The assertion of Ciubotaru–Harris Theorem 4.2 that every complex discrete series of G(F) has a number-field model is not established by the cited argument (gap G2).

*Hypotheses and conventions.*

- F = k((t)) is a local field of characteristic p with residue field k of cardinality q, W\_F its Weil group and Frob ∈ W\_F a geometric Frobenius lift (it acts on k̄ by x ↦ x^{1/q}); C is an algebraically closed field of characteristic 0 (C = ℂ or C = Q̄\_ℓ).
- π is assumed to have a number-field model, viewed over Q̄; this holds for local components of cuspidal representations (RA.2/rational-satake-parameters) and for supercuspidals (RA.4/supercuspidal-irreducible-globalization). Descent for an arbitrary complex discrete series remains G2.

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

- Every irreducible constituent of every normalized Jacquet module of Π\_v is geometric by RA.3/geometricity-stability. Its central character restricted to the split centre A\_M therefore has Weil-number values by RA.3/geometric-central-characters. The central character of Π\_v is unitary (Π is cuspidal semisimple); apply Casselman to these actual Jacquet exponents rather than identifying them with the supercuspidal support.
- Casselman's criterion (SR.3/casselman-criterion) is then an inequality between integer weights, independent of ι.

*Checks.*

- When L\_F(Π\_v) is unramified with Satake parameter of real part 0 for one ι and Weil-number eigenvalues, temperedness holds for all ι.

*Source.* [ch26] §4.1, Theorem 4.3 and step (2) of the sketch, p. 11: Asserts that an ι-tempered local component of a cuspidal representation is tempered for every embedding; the sketch assumes that the local monodromy of every L(Π, τ) is geometric, which is the gap recorded as E10 by the extraction.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/iota-tempered`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters`.

## RA.5 The generic Ramanujan theorem

**Targets.** Γ-stable test representations, parameter lifts through the actual central kernel over a finite extension, and the anchored weight argument. A fixed-ι tempered anchor gives fixed-ι integer weights; a discrete-series anchor supplies arithmetic integer weights at every embedding. The generic Ramanujan conclusion is planned with central compact factor at the generic place (Ciubotaru–Harris Theorem 5.4, pp.13–15, corrected scope). A nonsplit Frobenius component is not itself required to be central. Transfer on rational points to adjoint groups and spherical tempered-to-generic compatibility for general unramified quasi-split groups are requested at SR.4; arbitrary noncentral compact parts remain open.

<a id="ra-5-test-representations"></a>
### RA.5.1 Test representations of the dual group

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/test-representations` · definition · planet: Test representations of the dual group

For G absolutely simple over K, let G^{ad} be its adjoint group, whose dual Ĝ\_sc is simply connected. The test set T(G) consists of the adjoint representation of Ĝ\_sc and, by type of G: A\_{n−1} with n even, the standard representation V(ω̂₁) of SL\_n; B\_n, the standard representation V(ω̂\_n) of Sp\_{2n}; C\_n, the spin representation V(ω̂₁) of Spin\_{2n+1}; D\_n, the half-spin V(ω̂₁) and the vector representation V(ω̂\_n) of Spin\_{2n} (Ciubotaru–Harris numbering); E₇, the 56-dimensional V(ω̂₇); for A\_{n−1} with n odd, E₆, E₈, F₄ and G₂, the adjoint representation alone. For G not adjoint these are representations of L(G^{ad}), used after lifting the parameter (RA.5/adjoint-lift). For the finite Galois L-group, replace each listed Ĝ\_sc-module V by Ind\_{Ĝ\_sc}^{Ĝ\_sc⋊Γ} V: its restriction is the direct sum of the Γ-translates of V. Thus the test list supplies algebraic L-group representations even when a fundamental highest weight is not Γ-fixed; the light Lean testWeights records only the underlying highest-weight indices.

*Hypotheses and conventions.*

- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- G absolutely simple; numbering of fundamental weights as in Ciubotaru–Harris §6 and the SRU.5 nodes.

*Proof route.*

- The list is the one for which SRU.5/fundamental-separators shows that every nonzero half-integral generic unitary point left by the adjoint representation is not half-integral for some member.
- For a finite pinned action Γ, finite induction extends each module by taking ⊕\_{γ∈Γ} {}^γV with Γ permuting the summands. The original module occurs as a direct summand after restriction, so integrality for the induced module implies integrality for the required separator. In type D the two half-spin translates must both be retained. Restriction to the folded group then uses SRU.6/nonsplit-generic-temperedness.

*API.*

- `testWeights` (constructor): The finite list of fundamental weights ω̂ᵢ of Ĝ\_sc used beside the adjoint representation, by Cartan type; T(G) is the adjoint representation together with the V(ω̂ᵢ).
- `TestReps.adjoint_mem` (other): The adjoint representation is always in T(G).
- `TestReps.separates` (characterisation): A generic unitary real point ν of the split adjoint form that is half-integral for every member of T(G) is 0 (SRU.5/generic-temperedness-test).
- `TestReps.restrict_tau_fixed` (compatibility): For nonsplit unramified G, the members restrict to the representations of G^∨(τ) used in SRU.6.
- `TestReps.extendToLGroup` (constructor): Finite induction V↦⊕\_{γ∈Γ} {}^γV gives an algebraic Ĝ\_sc⋊Γ-module whose restriction contains V; integer weights for the induced module imply integer weights for V.

*Unit tests.*

- `TestReps.pgl2` (computation): T(PGL₂) = {adjoint, standard of SL₂}; ½ω (the PGL₂ point ½ω\_{n/2}) pairs to ¼ with the standard weight, so it is excluded.
- `TestReps.pgl3` (degenerate): T(PGL₃) is the adjoint representation alone: no nonzero half-integral generic unitary point exists for PGL₃ (SRU.5/half-integral-type-a).
- `TestReps.cn_needs_spin` (non-example): For PSp\_{2n} the vector representation of SO\_{2n+1} does not separate ½ω\_n (it factors through SO\_{2n+1}); the spin representation is required.
- `TestReps.dn_needs_both` (non-example): For PSO\_{2n}, n even, the spin representation alone leaves ½ω₁ and ½ω₂, and the vector representation alone leaves ½ω\_n; both are needed.
- `TestReps.outer_D` (non-example): For the order-two outer action on type D\_n, one half-spin module alone need not extend; its sum with its outer translate does extend and retains both required restrictions.

*Checks.*

- For G = PGL₂ (n = 2) the test set is {adjoint, standard of SL₂}; for G = PGL₃ it is {adjoint}.

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, p. 14: half-integrality is imposed for the adjoint representation and τ₀.

*Source.* [ch26] §5, the table after Theorem 5.4, p. 13; §6.12, Proposition 6.31, p. 24: Lists, for adjoint groups of each type, the highest weight of the representation of the dual group to use beside the adjoint representation, and checks that it separates the extra half-integral points.

*Needs.* `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/fundamental-separators`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6/nonsplit-generic-temperedness`, `LieHighestWeightPartII:N5/highest-weight-test`.

<a id="ra-5-adjoint-lift"></a>
### RA.5.2 Lifting a parameter to the L-group of the adjoint group

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift` · construction

Let σ : Gal(K^sep/K) → LG(Q̄\_ℓ) be continuous with image in LG(E) for a finite E/Q\_ℓ, and LG^{ad} → LG the central extension dual to G → G^{ad} (kernel Z = ker(Ĝ\_sc → Ĝ), a subgroup of the finite centre). There is a finite separable K′/K and a continuous lift σ̃′ : Gal(K^sep/K′) → LG^{ad}(Q̄\_ℓ) of σ|\_{Gal(K^sep/K′)}. For every place u′ of K′ over u, every τ ∈ T(G) and every place w′ unramified for σ̃′, the real part of σ̃′(Frob\_{w′}) equals that of σ(Frob\_{w′}), and τ ∘ σ̃′ is geometric at u′ when σ|\_{u}^{ss} has a pure completion of weight 0. There is also a fixed-ι version: if the local completion has bounded Weil part at ι, every lifted algebraic representation has integer local ι-weights; this assertion does not imply arithmetic geometricity.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- This is needed when G is not adjoint and T(G) contains a representation not factoring through LG: types A\_{n−1} (n even), B\_n, C\_n, D\_n and E₇ (PAPER-CIUBOTARU-HARRIS-26/E12; the source writes the lift for types C and D only).

*Construction.*

- The image of σ is a compact ℓ-adic Lie group; an open subgroup lifts through the finite central extension (de Jong's remark, Ciubotaru–Harris footnote 6), giving K′; equivalently the obstruction in H²(Gal(K^sep/K), Z) dies on a finite extension.
- At each fixed Frobenius the finite central kernel changes eigenvalues only by roots of unity. Compare real parts using the same residue field q\_{w′}; the kernel is trivial if G is already adjoint.
- The algebraic SL₂ of the local completion lifts through the central isogeny because SL₂ is simply connected. The real neutral element has integer eigenvalues in every representation, giving integer WD weights. A bounded Weil part lifts to a bounded Weil part; in the arithmetic case its eigenvalues are roots of Weil numbers of weight 0, which remain weight 0 at every embedding. This proves the distinct fixed-ι and arithmetic assertions.

*API.*

- `ParamLift.field` (data): The finite extension K′/K over which the lift exists.
- `ParamLift.lift` (constructor): The lift σ̃′ : Gal(K^sep/K′) → LG^{ad}(Q̄\_ℓ).
- `ParamLift.lift_proj` (characterisation): Composing σ̃′ with LG^{ad} → LG gives σ restricted to K′.
- `ParamLift.realPart_eq` (relation): Real parts of Frobenius classes of σ̃′ and σ agree.
- `ParamLift.unique_up_to_center` (extensionality): Two lifts differ by a continuous 1-cocycle with values in the actual finite kernel Z, with its Galois action; this is a character only when that action is trivial.

*Unit tests.*

- `ParamLift.adjoint_trivial` (degenerate): If G is adjoint then LG^{ad} = LG, K′ = K and σ̃′ = σ.
- `ParamLift.sl2` (computation): For G = SL₂ and σ with values in PGL₂(Q̄\_ℓ), the lift exists over K′ where the image of the Brauer class of σ in Br(K′)[2] vanishes.
- `ParamLift.no_lift_over_K` (non-example): A projective representation with nonzero obstruction in H²(Gal(K^sep/K), μ₂) has no lift over K itself, so passing to K′ is necessary.
- `ParamLift.realPart_compat` (compatibility): The real part of σ̃′(Frob\_{w′}) equals that of σ(Frob\_{w′}) as elements of t̂\_ℝ (the isogeny Ĝ\_sc → Ĝ is an isomorphism on Lie algebras).
- `ParamLift.twisted_kernel` (non-example): For a nontrivial Galois action on Z, the difference satisfies c(γδ)=c(γ)·γ(c(δ)); the untwisted homomorphism law is not the lift-ambiguity law.

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
- For (a), realize π\_u inside normalized induction from a discrete series ρ of a Levi M with ι-unitary central character (SR.3). Use the reductive fixed-ι completion theorem RA.4/weil-deligne-purity-of-discrete-series, including its requested central reduction G8: the central real part is 0 and the SL₂ weights are integers. This gives local integer ι-weights without asserting arithmetic geometricity. Apply the mod-ℤ decomposition and local weight–monodromy theorem to eliminate every other weight class globally.
- The half-integrality is RA.2/satake-real-part (halfIntegral\_of\_integerWeights).
- For τ ∈ T(G) use RA.5/adjoint-lift at the places of K′.

*Checks.*

- For PGL₂ a Steinberg anchor has normalized local weights ±1. The integrality conclusion by itself is not the Hasse bound for an elliptic curve; weight-0 automorphic normalization and purity require separate input.

*Source.* [ch26] §5, proof of Theorem 5.4, pp. 14–15: Uses the purity of the discrete-series parameter at u and the uniqueness of the twist decomposition (5.5) to show that every L(π, τ) is mixed with integer weights, so that the real part at every unramified place is half-integral (5.6); the tempered case reduces to the discrete series of a Levi subgroup.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/geometric-boundary-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `DeligneWeightsAndPurity:DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/constant-field-weight-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.3`.

<a id="ra-5-generic-ramanujan"></a>
### RA.5.4 The generic Ramanujan theorem over function fields

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan` · theorem · planet: Generic Ramanujan theorem

Let G be connected absolutely simple over K and π ⊂ A₀(G, Q̄) with m\_U(π) ≠ 0 belonging to σ. Assume (1) at a place v ∉ S where G\_{K\_v} is unramified quasi-split and not the quasi-split form of PSU(2n+1), π\_v ⊗\_ι ℂ is generic and the compact part of its Satake parameter ι(s\_v(σ)) is equal to 1, or represented by z∈Z(Ĝ)^Γ giving a unitary unramified character twist. In the nonsplit case this condition concerns the dual-torus compact factor: the Frobenius component is kept separate and is not required to be central; (2) at a place u, π\_u is ι-tempered. Then π\_w ⊗\_ι ℂ is tempered for every w ∉ S, and every irreducible constituent of every L(π, τ) is ι-pure of weight 0. If π\_u is ι-discrete series, π\_w is tempered for every embedding and every L(π, τ) is pure of weight 0.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- G absolutely simple; v ∉ S so U\_v is hyperspecial. The centrality condition at v is the scope correction of PAPER-CIUBOTARU-HARRIS-26/E11 (the source states the theorem without it); u may be any place (E13).
- The source's abstract mentions a mild residue-field restriction coming from the arXiv version of Gan–Harris–Sawin; with the published version none is needed.

*Proof route.*

- RA.5/integral-weights-from-anchor gives ⟨α, ν\_v^ι(σ)⟩ ∈ ½ℤ for the adjoint representation and, through RA.5/adjoint-lift, for every τ ∈ T(G) (RA.5/test-representations).
- π\_v is unitary, spherical and generic. For adjoint G apply SRU.5 in the split case or SRU.6 in the nonsplit case, using their full-L-group central-compact hypotheses. For non-adjoint G use the central-isogeny transfer of spherical unitarity and genericity requested at SR.4/SRU.5: triviality on Z(G)(F) alone does not extend a representation from the image of G(F) to every element of G^ad(F). With this transfer and the lifted test modules the same local criterion gives ν\_v^ι=0.
- Then every constituent of L(π, τ) has ι-weight 0 at v; since the constituents are ι-pure of integer weight (previous step and DWP.8 weight filtration), they are all of weight 0, so ν\_w^ι(σ) = 0 for every w ∉ S.
- Temperedness at w: SRU.5/spherical-tempered-criterion (split) and Casselman's criterion (SR.3/casselman-criterion) in general. For the discrete-series anchor the weights are Weil numbers, so the conclusion holds for every ι.

*Checks.*

- For G = PGL₂ and π\_u Steinberg, the theorem is the Ramanujan conjecture for those π (known by Drinfeld); the hypothesis at v holds automatically, since every unramified generic unitary π\_v of PGL₂ has Satake parameter with central compact part or is tempered.
- The quasi-split PSU(2n+1) case is excluded: SRU.6/odd-unitary-residual leaves the point ½ω\_n.
- Without the centrality condition the local step fails: SRU.5/g2-noncentral-witness.

*Source.* [ch26] §1.1, the main theorem and the outline of its proof, pp. 2–3; §5, Theorem 5.4 and its proof, pp. 13–15: States and proves that a cuspidal representation of an absolutely simple group, generic at an unramified quasi-split place (not odd quasi-split unitary) and tempered at another place, is tempered at every unramified place, via integrality of weights and the classification of generic unitary spherical representations; the scope corrections E11–E13 apply.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/integral-weights-from-anchor`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/test-representations`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/adjoint-lift`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/generic-temperedness-test`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.6/nonsplit-generic-temperedness`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/spherical-tempered-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`, `SmoothRepresentationsOfLocalGroups:SR.4`.

<a id="ra-5-genericity-propagation"></a>
### RA.5.5 Propagation of genericity

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/genericity-propagation` · theorem

Under the hypotheses of RA.5/generic-ramanujan, π\_w ⊗\_ι ℂ is generic at every w ∉ S at which G\_{K\_w} is quasi-split; if G is quasi-split over K, π is locally generic at almost every place.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

- Use the spherical-tempered-implies-generic theorem for unramified quasi-split groups requested at SR.4, with its isogeny/Whittaker hypotheses. SRU.5 supplies the split adjoint special case; it does not alone prove the general nonsplit statement. The local theorem is the one invoked from Reeder Proposition 7.4 in Ciubotaru–Harris Corollary 5.7.
- Apply this at every w ∉ S after RA.5/generic-ramanujan.

*Checks.*

- For PGL₂ every tempered spherical representation is an irreducible unitary principal series, hence generic.

*Source.* [ch26] §5, Corollary 5.7 and its proof, p. 15: Deduces genericity of all unramified quasi-split components from their temperedness, using that spherical tempered representations are generic (Reeder in general, Kazhdan–Lusztig for split adjoint groups).

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/spherical-generic-criterion`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/kazhdan-lusztig-classification`, `SmoothRepresentationsOfLocalGroups:SR.4`.

## RA.6 Elliptic parameters and the stack-purity route

**Targets.** Ellipticity and weight-0 purity for semisimple global parameters. State Lafforgue–Zhu’s elliptic decomposition with invariants under the full centralizer S_σ, retaining the frozen leg and W^{G_m} in the GL_r example (Proposition 1.2, pp.2–3; Corollary 2.1, p.4). Define constant-coefficient stack realization (Ciubotaru–Harris Expectation 5.9, p.16). Its integer-weight consequence is conditional on DWP.8 stack integrality; deducing that realization from Satake-coefficient cohomology requires a separate bridge. Sun’s real ι-mixedness alone is not treated as that bridge or integer-weight theorem.

<a id="ra-6-elliptic-parameter"></a>
### RA.6.1 Elliptic global parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-parameter` · definition · planet: Elliptic parameter

For a continuous semisimple σ : Gal(K^sep/K) → LG(Q̄\_ℓ) let S\_σ be the centralizer in Ĝ of its image. σ is elliptic when S\_σ / (Z(Ĝ))^{Gal(K̃/K)} is finite; equivalently (for semisimple σ) its image lies in no proper Levi subgroup of LG, equivalently (Ad⁰)^σ = 0 for the adjoint representation on Lie(Ĝ)/Lie(Z(Ĝ)).

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected reductive group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).

*Proof route.*

- Lie(S\_σ) is the σ-invariant Lie algebra. Exactness of invariants for the finite Galois action in characteristic 0 identifies Lie(S\_σ/(Z(Ĝ))^Γ) with (Lie(Ĝ)/Lie Z(Ĝ))^σ, so finiteness of the reductive quotient is equivalent to vanishing of these invariants.
- A semisimple σ in a proper Levi M is centralized by the connected centre of M̂, a positive-dimensional torus modulo Z(Ĝ); conversely a positive-dimensional reductive S\_σ contains a torus whose centralizer is a proper Levi containing the image.

*API.*

- `GlobalParam.IsElliptic` (data): S\_σ/(Z(Ĝ))^Γ is finite.
- `GlobalParam.isElliptic_iff_adInvariants` (characterisation): σ elliptic iff (Ad⁰ ∘ σ)^{Gal} = 0.
- `GlobalParam.isElliptic_iff_noProperLevi` (characterisation): For semisimple σ, elliptic iff the image lies in no proper Levi, iff no proper parabolic of LG contains it.
- `GlobalParam.IsElliptic.centralizer_finite` (projection): The finite group 𝒮\_σ = S\_σ/(Z(Ĝ))^Γ acting on the Lafforgue–Zhu multiplicity space.
- `GlobalParam.isElliptic_gl_iff_irreducible` (compatibility): For G = GL\_r, elliptic iff the r-dimensional representation is irreducible.

*Unit tests.*

- `GlobalParam.gl2_reducible` (non-example): For GL₂, σ = χ₁ ⊕ χ₂ is not elliptic: S\_σ ⊇ G\_m² and S\_σ/G\_m is one-dimensional.
- `GlobalParam.torus` (degenerate): For a torus, S\_σ=(Ĝ)^Γ=(Z(Ĝ))^Γ even when Γ acts nontrivially. The quotient is trivial, so every torus parameter is elliptic; S\_σ need not equal all of Ĝ.
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

- For G=PGL₂ and an elliptic cuspidal parameter, the standard representation of the dual SL₂ has weight 0 at all good places, so the spherical components are tempered. The GL\_r analogue additionally requires the finite-order central normalization and is not an example of the displayed semisimple hypothesis.

*Source.* [st] §11, Lemmas 11.4–11.5, p. 83: For split semisimple G and Ĝ-valued ι-mixed σ, proves purity of weight zero for parameters in no proper parabolic and deduces temperedness at unramified places from Satake compatibility; the LG-valued form is RA.1/sawin-templier-purity.; [lz] §3, p. 5: Notes that a representation occurring over σ is tempered at unramified places when σ is elliptic, the adjoint invariants being the Lie algebra of the centralizer.; [ch26] §5, Remark 5.8, p. 16: Explains, after Zhu, that Theorem 5.4 is superfluous for elliptic parameters.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.1/sawin-templier-purity`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/satake-real-part`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.5/spherical-tempered-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`.

<a id="ra-6-lafforgue-zhu-decomposition"></a>
### RA.6.3 Lafforgue–Zhu decomposition over elliptic parameters

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/lafforgue-zhu-decomposition` · theorem

Let G be split reductive over K, N a level, Ξ a cocompact central lattice and σ an elliptic parameter occurring in the cuspidal excursion decomposition. There is a finite-dimensional graded Q̄\_ℓ-space A\_σ with commuting actions of the full level-N Hecke algebra and 𝒮\_σ=S\_σ/Z(Ĝ), such that (H^cusp\_{\{0\}∪I,W})\_σ ≅ (A\_σ⊗W\_{σ^I})^{S\_σ}, where W is an algebraic representation of Ĝ×(LG)^I, Γ^I acts through σ on the moving factors and trivially on the factor 0, and S\_σ acts diagonally on all factors of W and through 𝒮\_σ on A\_σ. This is functorial in W, compatible with coalescence and level change. These generalized excursion eigenspaces are genuine eigenspaces and semisimple as Γ^I-representations; no Hecke semisimplicity of A\_σ is asserted. With a suitable auxiliary representation at the frozen leg, each irreducible constituent of τ∘σ occurs in Satake-coefficient shtuka cohomology. The additional constant-coefficient realization of Expectation 5.9 requires the bridge G10.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G split (the nonsplit case is conditional on extending Xue's finiteness to nonsplit groups, as Lafforgue–Zhu state); σ is one of Lafforgue's parameters, so it satisfies the conditions (C1)–(C5) of Lafforgue–Zhu §1 (finite coefficients, reductive Zariski closure, unramified outside a finite set, Galois projection, finite image in the abelianization).
- The Satake-coefficient consequence uses a nonzero A\_σ and a suitable auxiliary factor at the frozen leg. The constant-coefficient consequence suggested by Ciubotaru–Harris Remark 5.8 is conditional on G10.

*Proof route.*

- Use Lafforgue–Zhu Proposition 1.2 and the extra frozen base leg: its Ĝ-representation W₀ supplies the central character needed for (A\_σ⊗W₀⊗τ)^{S\_σ} to contain the desired τ∘σ constituent. One must retain invariants under the full centralizer S\_σ, including its connected centre; invariants under the finite quotient alone give a different formula. Lemma 4.1 supplies the nondeformability input to the proof, not a standalone assertion that every excursion algebra is reduced.
- The cohomology functors are those of GS.3/the-functor-H-I-W with finiteness from GS.3/integral-cuspidal-finiteness.
- The exact promotion from Satake-coefficient shtuka cohomology to constant-coefficient stack cohomology must be supplied: Satake IC sheaves are not constant sheaves. This realization bridge is recorded in G10; Proposition 1.2 by itself gives the displayed Satake-cohomology formula.

*Checks.*

- For GL\_r and irreducible σ, A\_σ=π^{K\_N} and (H^cusp\_{I,W})\_σ=π^{K\_N}⊗(W^{G\_m})\_{σ^I} (Corollary 2.1, p.4). For a single moving standard factor without a compensating frozen factor, W^{G\_m}=0, so the summand vanishes.

*Source.* [lz] §1, Theorem 1.1 and Proposition 1.2 with Remarks 1.3–1.5, pp. 2–3; §4, Lemma 4.1, p. 7; §2, Corollary 2.1, p.4: For split G, identifies the elliptic cuspidal summand with full S\_σ-invariants of A\_σ tensored with W, including the frozen base leg. The finite quotient acts on A\_σ, while the full centralizer acts on W. Corollary 2.1, p.4 retains W^{G\_m} in the GL\_r case.; [ch26] §5, Remark 5.8, p. 16: Cites Lafforgue–Zhu Proposition 1.2 as a proof of Expectation 5.9 for elliptic parameters.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/elliptic-parameter`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/the-functor-H-I-W`, `GlobalShtukasAndFunctionFieldLanglands:GS.3/integral-cuspidal-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `DeligneWeightsAndPurity:DWP.8`.

<a id="ra-6-stack-realisability"></a>
### RA.6.4 Realisability in the cohomology of stacks

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability` · definition

A semisimple lisse Q̄\_ℓ-sheaf L on X ∖ |S| is realisable in stack cohomology when there are a finite set S′ ⊇ S, an algebraic stack Z of finite type over k₁ and a morphism f : Z → X ∖ |S′| such that every irreducible constituent of L|\_{X∖|S′|} is a constituent of some Rⁱf\_! Q̄\_ℓ. Ciubotaru–Harris Expectation 5.9 asks this for L(π, τ) with τ adjoint and τ ∈ T(G); it is recorded here as a hypothesis, not a theorem.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Algebraic stacks and Rf\_! as in Laszlo–Olsson (stacky six operations).

*Proof route.*

- Direct summands and restriction to a smaller open preserve the predicate. Tensor products use the fibre product of two witnessing stacks, Künneth and exactness on semisimplified finite-rank constituents. Verdier duality changes the constant coefficient sheaf to a dualizing complex and by itself does not prove closure of this constant-coefficient predicate under duals.
- For elliptic σ, RA.6/lafforgue-zhu-decomposition gives the Satake-coefficient realization; the extra bridge to constant coefficients is an explicit hypothesis/request in G10.

*API.*

- `LisseSheaf.IsStackRealisable` (data): The predicate of the statement, with its witness (S′, Z, f).
- `LisseSheaf.IsStackRealisable.tensor` (functoriality): Realisable sheaves are closed under tensor product and direct summand; restriction to a smaller open also preserves realisability. Closure under duals requires an additional realization argument.
- `LisseSheaf.IsStackRealisable.integerWeights` (relation): Conditional on the stack integrality input of G5, a realisable sheaf has integer punctual ι-weights for every ι (RA.6/stack-purity).
- `LisseSheaf.isStackRealisable_of_elliptic` (other): For elliptic σ the Satake-coefficient formula is RA.6/lafforgue-zhu-decomposition; constant-coefficient stack realisability follows once the realization bridge G10 is supplied.

*Unit tests.*

- `LisseSheaf.realisable_constant` (degenerate): The constant sheaf on X ∖ |S| is realisable with Z = X ∖ |S| and f the identity.
- `LisseSheaf.realisable_legendre` (computation): R¹f\_! Q̄\_ℓ of the Legendre family is realisable with Z the family itself (a scheme).
- `LisseSheaf.not_realisable_three` (non-example): With ℓ=5, the constant rank-one étale sheaf on G\_m/F₄ whose Frobenius is 3 is not realisable if stack integrality G5 holds: its ι-weight is 2 log₄3, not an integer. Choosing ℓ=3 would not define a continuous constant-field étale character.
- `LisseSheaf.realisable_scheme_compat` (compatibility): For a finite-type scheme f:Z→U, semisimple lisse constituents of Rⁱf\_!Q̄\_ℓ satisfy this predicate. This literal constant-coefficient direct-image test does not identify the predicate with every closure operation in the general notion of geometric origin.

*Checks.*

- The constant sheaf is realisable with Z = X ∖ |S|.
- With ℓ=5, the constant-field rank-one étale sheaf of Frobenius 3 over F₄ fails the constant-cohomology predicate conditional on G5, because its ι-weight is 2 log₄3.

*Uses.* Ciubotaru–Harris, Sketch 5.10, p. 16: the alternative proof of integrality of weights; Ciubotaru–Harris, Remark 5.8, pp. 15–16: Lafforgue–Zhu prove realisability for elliptic parameters.

*Source.* [ch26] §5, Remark 5.8 and Expectation 5.9, p. 15: Formulates the expectation that the irreducible constituents of L(π, τ), for the adjoint and test representations, occur in compactly supported direct images along finite-type morphisms of stacks of shtukas, after Lafforgue's ICM conjectures.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.2/cohomology-sheaves-of-shtuka-stacks`, `DeligneWeightsAndPurity:DWP.8`.

<a id="ra-6-stack-purity"></a>
### RA.6.5 Integral weights of realisable sheaves

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity` · theorem

Assuming the stack integrality input G5, every irreducible constituent of a stack-realisable L is punctually ι-pure of integer weight. If this realization and integrality hold for all the adjoint and separator modules actually used in RA.5 (including their lifts over K′ when G is not adjoint), the proof of RA.5/generic-ramanujan gives its conclusion without a tempered anchor. The central-compact and local transfer hypotheses at the generic place are retained.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- The integrality step for Artin stacks is only sketched in the source (gap G5).
- Assume the stack integrality theorem requested in G5: for finite-type f:Z→U, each lisse constituent of Rⁱf\_!Q̄\_ℓ has integer punctual ι-weights. Sun Theorem 2.11 supplies ι-mixedness and is not silently treated as this additional integer-weight assertion.

*Proof route.*

- Sun's Theorem 2.11: the stacky six operations and Verdier duality preserve ι-mixedness.
- The reduction through a smooth presentation, hypercover spectral sequence and Verdier duality is the remaining proof of the integer-weight theorem G5, not a consequence labelled already proved. Sun Theorem 2.11 is the mixedness input to this reduction; its Remark 2.12 must also be reconciled with the absolute/integer conventions when filling G5.
- With integer weights for every ι, rerun the proof of RA.5/generic-ramanujan from the half-integrality step.

*Checks.*

- For Z a scheme the statement is Deligne's integrality of weights of Rf\_!.

*Source.* [ch26] §5, Expectation 5.9, Sketch 5.10, pp. 15–16: Sketches, after Olsson, that compactly supported direct images along finite-type morphisms of stacks preserve integrality of weights, via Sun's mixedness theorem, hypercovers and Verdier duality, and that this would give the generic theorem without the anchor.; [sun] §2, Theorem 2.11, p. 14 (arXiv v2): Proves that the stacky six operations and Verdier duality on algebraic stacks over a finite field preserve ι-mixed complexes.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability`, `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`, `DeligneWeightsAndPurity:DWP.7/fundamental-direct-image-theorem-3-3-1`, `DeligneWeightsAndPurity:DWP.8`.

## RA.7 Arthur homomorphism data and the discrete spectrum

**Targets.** Weak global Arthur homomorphism data with continuous Weil factor and algebraic SL₂, and the separate conjectural arithmetic, Satake-compatibility and boundedness requirements (Ciubotaru–Harris Conjectures 1.3/1.8). Record the discrete-spectrum parametrization hypotheses (Conjectures 9.1/9.5), fixed-level rationality through the full Hecke algebra (Lemma 9.2, p.31), and Xue’s finite-codimension Hecke-quotient decomposition (Theorem 3.6.7, pp.30–31). Algebraicity requires a number-field model. Bare good-place compatibility has no ramified consequence; for Xue quotients use Li-Huerta Theorem 6.13, pp.47–48. No global Arthur homomorphism is constructed.

<a id="ra-7-global-arthur-parameter"></a>
### RA.7.1 Global Arthur homomorphism data

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/global-arthur-parameter` · definition · planet: Arthur homomorphism data

Let C=Q̄\_ℓ with its ℓ-adic topology. Global Arthur homomorphism data consist of a homomorphism ψ : W\_K × SL₂(C) → LG(C), compatible with the projection to the Galois factor, continuous and unramified outside a finite set on W\_K, Frobenius-semisimple at good places, and algebraic on SL₂, up to Ĝ(C)-conjugacy. Its nilpotent invariant is the class N\_ψ of dψ(e) in Lie(Ĝ), e the upper unipotent generator of sl₂. At a place w where ψ is unramified, ψ\_w : W\_{K\_w}/I\_w × SL₂ → LG and j(Frob\_w) = diag(q\_w^{1/2}, q\_w^{−1/2}); Ψ(G, U) is the set of classes unramified outside S(U). Here C=Q̄\_ℓ has its ℓ-adic topology on the Weil part. Complex coefficient versions are obtained by field transport; no archimedean continuity of that transported global Weil map is asserted. Boundedness at good places is imposed separately in ArthurPrediction.At, not inferred from these weak homomorphism data.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.

*Proof route.*

- At an unramified place restrict the weak Weil homomorphism and evaluate it with the Arthur SL₂ as displayed. At a ramified place, converting the Weil representation to a WD representation introduces its monodromy/Deligne SL₂; merely restricting the weak homomorphism does not supply this additional factor.
- N\_ψ is defined by Jacobson–Morozov theory in Ĝ (LieHighestWeightPartII N0).

*API.*

- `ArthurParam.mk` (constructor): A homomorphism W\_K × SL₂(C) → LG(C) as in the statement.
- `ArthurParam.nilpotent` (projection): The nilpotent orbit N\_ψ ⊂ Lie(Ĝ).
- `ArthurParam.local` (projection): ψ\_w for each place w, unramified outside S.
- `ArthurParam.satakeAt` (data): ψ\_w(Frob\_w, j(Frob\_w)) ∈ [LG\_ss(C)] at unramified w.
- `ArthurParam.conj` (extensionality): Equivalence is Ĝ(C)-conjugacy; N\_ψ is an invariant.

*Unit tests.*

- `ArthurParam.tempered` (degenerate): If ψ is trivial on SL₂ then N\_ψ=0 and satakeAt(ψ,w)=ψ(Frob\_w). Boundedness follows only under the separate bounded-Weil-at-w hypothesis of ArthurPrediction.At; triviality on SL₂ alone does not imply it.
- `ArthurParam.pgl2_trivial` (computation): For PGL₂ and ψ = 1 ⊠ std, the unramified Satake class is diag(q\_w^{1/2}, q\_w^{−1/2}), weights ±1 in the standard representation of SL₂.
- `ArthurParam.not_l_parameter` (non-example): ψ ↦ ψ|\_{W\_K × {1}} loses N\_ψ: the trivial representation's ψ and the tempered parameter 1 have the same restriction to W\_K.
- `ArthurParam.weights_from_N` (characterisation): If ψ(Frob\_w) is bounded at the chosen ι, the Deligne ι-weights of τ(satakeAt ψ w) are the integer eigenvalues of h\_{N\_ψ}. Arithmetic Weil weights additionally require algebraicity and the same boundedness for every embedding.
- `ArthurParam.sl2_trivial_unbounded` (non-example): Take G=PGL₂ and an unramified Weil homomorphism whose dual Frobenius is diag(q,q^{−1}), with trivial SL₂. These are valid weak homomorphism data and are unbounded at the chosen complex embedding.

*Checks.*

- Given weak data with trivial SL₂, N\_ψ=0. They describe tempered local Satake classes only when the Weil restrictions at those places are bounded; triviality on SL₂ alone is insufficient.
- For G = PGL₂ and ψ = 1 ⊠ (standard of SL₂ = Ĝ), ψ(Frob\_w, j(Frob\_w)) = diag(q\_w^{1/2}, q\_w^{−1/2}), the Satake parameter of the trivial representation.

*Uses.* Ciubotaru–Harris, Conjectures 1.3, 1.8 and Expectation 1.9, pp. 4–5: the conjectural targets that Theorems 1.11 and 10.3 verify in part.

*Source.* [ch26] §1.2, (1.1)–(1.7), pp. 3–4: Defines global Arthur parameters as homomorphisms of the Weil group times SL₂ to the L-group, algebraic on SL₂, their nilpotent invariant, the local unramified parameters and the element j(Frob\_w), following Clozel's simplified form of Arthur's conjectures.

*Needs.* `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LieHighestWeightPartII:N0/jacobson-morozov`, `LieHighestWeightPartII:N0/nilpotent-orbit`.

<a id="ra-7-arthur-weight-prediction"></a>
### RA.7.2 Arthur's weight prediction at unramified places

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/arthur-weight-prediction` · definition · planet: Arthur's weight prediction

For a discrete automorphic π, global Arthur homomorphism data ψ and w ∉ S, π satisfies Arthur's prediction at w for ψ when: (a) the Satake class s(π\_w) has integral weight (for every τ, τ(s(π\_w)) is diagonalizable with eigenvalues Weil q\_w-numbers of integer weight); (b) s(π\_w) = ψ\_w(Frob\_w, j(Frob\_w)) up to conjugacy; (c) ψ\_w|\_{W\_{K\_w}} is bounded after the chosen complex coefficient transport. π has place-independent weights when the multiset of weights of τ(s(π\_w)) is the same for all w ∉ S and every τ, and determined by N\_ψ (Expectation 1.9). Arthur's decomposition A\_disc(G, U, C) = ⊕\_{ψ ∈ Ψ(G,U)} A\_{disc,U,ψ} (Conjecture 1.3) is recorded as the conjectural target, not as a theorem.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- When a single integer weight pattern determined by N\_ψ is asserted arithmetically, impose (b) and (c) after every embedding. Boundedness at just one embedding need not give the same weights at its algebraic conjugates.

*Proof route.*

- (b) and fixed-ι boundedness (c) give the neutral-element eigenvalues as the local ι-weight pattern. For the arithmetic pattern impose the same condition after every embedding, together with the algebraicity in (a).
- RA.8 proves place-independent weight patterns and normalized real Satake parts under its stated hypotheses. It does not construct a single global ψ with the required commuting SL₂ and bounded Weil part, and therefore does not prove the full conjunction (a)–(c). This global construction remains the conjectural target G11.

*API.*

- `ArthurPrediction.At` (data): The conjunction (a)–(c) for (π, ψ, w).
- `ArthurPrediction.PlaceIndependentWeights` (data): Expectation 1.9 for π.
- `ArthurPrediction.weights_eq_neutral` (relation): Under (a)–(c) the weights of τ(s(π\_w)) are the eigenvalues of h\_{N\_ψ} on τ.
- `ArthurPrediction.tempered_of_trivial_sl2` (characterisation): Given (a)–(c) and N\_ψ=0, π\_w is tempered at the chosen embedding and its Satake eigenvalues are arithmetic Weil numbers of weight 0. The converse requires a supplied ψ satisfying the actual Satake equality (b).

*Unit tests.*

- `ArthurPrediction.trivial_rep` (computation): The trivial representation of PGL₂(A\_K) satisfies (a)–(c) at every w for ψ = 1 ⊠ std, with weights ±1 in the standard representation.
- `ArthurPrediction.tempered` (degenerate): If a global ψ with trivial SL₂ and the specified local Satake class is already supplied, and the local class is arithmetically pure of weight 0, then (a)–(c) hold at that place. Temperedness of one spherical representation does not construct such a global ψ.
- `ArthurPrediction.complementary_fails` (non-example): A complementary-series π\_w of PGL₂ with parameter diag(q^{1/4}, q^{−1/4}) fails (a).
- `ArthurPrediction.weight_pattern_compat` (compatibility): Place-independence of weights is equality of weight patterns in the sense of LieHighestWeightPartII N5/weight-pattern at all w ∉ S.

*Checks.*

- For cuspidal generic π under the discrete-series-anchor clause of RA.5, the compatible σ with trivial SL₂ satisfies (a)–(c) at every good place and embedding. Under only the fixed-ι tempered-anchor clause, the fixed-ι weight conclusion does not itself prove arithmetic condition (a).
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

*Proof route.*

- For cuspidal π, the parameters of RA.2/cuspidal-parameter-local-systems are compatible (RA.2/rational-satake-parameters), with Galois-valued σ.
- Under the hypotheses of RA.7/discrete-spectrum-parametrization (Conjectures 9.1 and 9.5), every discrete π belonging to some σ ∈ Φ\_disc(U) has one.
- For π with a number-field model occurring in a finite-codimension Hecke quotient of compactly supported forms, Xue gives a compatible parameter (RA.7/xue-hecke-quotient-parametrization). Without the number-field model, finite codimension alone does not imply the algebraicity required by this definition.

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

*Proof route.*

- The hypotheses hold for the cuspidal spectrum (RA.2/rational-satake-parameters).
- Under (9.1), base change to ℂ gives the finite-dimensional unitary discrete-spectrum module. Its Hecke action is semisimple over ℂ and hence after algebraic scalar extension as used by RA.7/conditional-discrete-rationality. No semisimplicity over an arbitrary characteristic-zero coefficient ring E is asserted.

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
- For PGL₂ the residual characters have the form χ∘det with χ²=1, so that the character descends from GL₂ to PGL₂; their parameters are explicit.

*Uses.* Ciubotaru–Harris, Theorem 1.11, p. 5: the alternative hypothesis to cuspidality.

*Source.* [ch26] §9.1, Conjecture 9.1, display (9.3), Definition 9.4 and Conjecture 9.5, pp. 30–31: Formulates the finiteness and coefficient base change of the discrete spectrum, the excursion decomposition and the Satake compatibility as conjectures extending the cuspidal theory.

*Needs.* `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-main-decomposition`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter`.

<a id="ra-7-conditional-discrete-rationality"></a>
### RA.7.5 Rationality of the discrete spectrum under the finiteness hypothesis

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/conditional-discrete-rationality` · theorem

Assume Conjecture 9.1 for (G,U). Then the eigenvalues of H^S(G,U) on A\_disc(G,U,C) are algebraic, and A\_disc(G,U,Q̄)=⊕\_{π:π^U≠0}m\_U(π)π^U. Each irreducible π occurring at this level has a number-field model. To deduce the assertion for every discrete automorphic π, impose Conjecture 9.1 at all sufficiently small levels.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- The assertion about a representation π at fixed level U concerns π with π^U≠0. To assert the result for every discrete automorphic π, assume Conjecture 9.1 at every sufficiently small level.

*Proof route.*

- A\_disc(G, U, Q) is a finite-dimensional Q-space stable under the Hecke algebra with integral structure; its eigenvalues are algebraic and the action is semisimple over a large number field, as in Lemma 3.2.
- For π^U≠0 use the full level-U Hecke algebra, rather than good-place eigenvalues alone. Its image on the finite-dimensional rational space A\_disc(G,U,Q) is a finite-dimensional Q-algebra. Its simple modules have models over finite extensions of Q; the simple Hecke-module/smooth-representation correspondence recovers π from π^U. This also accounts for a finite Schur-index extension. The all-representations assertion uses sufficiently small levels.

*Checks.*

- For the cuspidal spectrum this is RA.2/rational-satake-parameters without hypothesis.

*Source.* [ch26] §9.1, Lemma 9.2 and the decomposition after it, p. 31: Deduces from the finiteness conjecture that discrete-spectrum Hecke eigenvalues are algebraic and that discrete representations have number-field models, as in the cuspidal case.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/discrete-spectrum-parametrization`, `FunctionFieldArithmetic:FA.6/integral-coefficient-model`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`.

<a id="ra-7-xue-hecke-quotient-parametrization"></a>
### RA.7.6 Xue: parametrization of finite-codimension Hecke quotients

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/xue-hecke-quotient-parametrization` · theorem · planet: Xue's parametrization of Hecke quotients

Let G be split reductive over K, N a level, Ξ a cocompact central lattice, u ∉ N a place and 𝔍 an ideal of finite codimension in the spherical Hecke algebra H\_{G,u}. Then C\_c(Bun\_{G,N}(F\_q)/Ξ, Q̄\_ℓ) is of finite type over H\_{G,u} (Proposition 1), so the quotient Q = C\_c/𝔍·C\_c is finite-dimensional, and Q decomposes canonically as ⊕\_σ H\_σ over continuous semisimple σ : Weil(K̄/K) → Ĝ(Q̄\_ℓ) unramified outside N, H\_σ being the generalized eigenspace for the character f((σ(γ\_i))) of the excursion algebra; H\_σ lies in the generalized eigenspace of T(h\_{V,v}) with eigenvalue χ\_V(σ(Frob\_v)) for v ∉ N. The decomposition is compatible with constant-term morphisms. A discrete automorphic π with a number-field model occurring in such a quotient has a compatible global parameter (RA.7/compatible-global-parameter). For a constituent π the full compact-support comparison of Li-Huerta Theorem 6.13 also identifies σ|\_{W\_{K\_v}}^{ss}=L\_{K\_v}(π\_v) at ramified places, whenever π lies in the chosen σ generalized eigenspace. No algebraicity of eigenvalues for arbitrary coefficient-field ideals 𝔍 is asserted.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- G split; Hecke operators on Q need not be diagonalizable (Xue Remark 3.6.8).

*Proof route.*

- Finiteness of compactly supported shtuka cohomology over H\_{G,u} (Xue Theorem 2; GS.3/single-place-hecke-module-finiteness) gives the Weil^I action via Drinfeld's lemma for finite-type H\_{G,u}-modules (GS.4/full-cohomology-weil-descent).
- Excursion operators on C\_c (GS.5/excursions-on-full-compact-cohomology) descend to Q and generate a finite-dimensional commutative algebra B\_𝔍; continuity in (γ\_i) (Lemma 3.6.6) and Lafforgue's §11 argument (GS.5/reconstruction-of-a-langlands-parameter) give Theorem 3.6.7.
- Satake compatibility is Xue Theorem 3.6.7. For a constituent π with a number-field model, its spherical Hecke character is algebraic, and the normalized Satake isomorphism identifies an algebraic semisimple class with σ(Frob\_v). The rational structure on C\_c alone does not make an arbitrary Q̄\_ℓ-ideal 𝔍 algebraic.
- Ciubotaru–Harris (§9.2) speak of ideals of finite codimension in H^S(G, U); such an ideal contains a finite-codimension ideal 𝔍 of a single H\_{G,u}, so their quotients are quotients of Xue's Q and inherit the decomposition.
- Li-Huerta Theorem 6.13, with Theorem 6.10/§6.11, compares the local excursion algebra via the Bernstein centre with global excursions on the full C\_c space. The commuting identity descends to 𝔍-quotients and their generalized eigenspaces. Evaluating its character on a π^U constituent gives the local semisimple parameter, including at ramified v. This uses the full C\_c theorem rather than only the cuspidal Theorem A.

*Checks.*

- For 𝔍 the kernel of a character of H\_{G,u}, Q is the largest quotient on which H\_{G,u} acts by that character (Xue Remark 3.6.3).
- On the cuspidal part the decomposition is Lafforgue's.
- For the abstract Hecke algebra Q̄\_ℓ[T], the codimension-one ideal (T−a) can have a transcendental a over Q. Finite codimension alone is not an algebraicity argument; the positive constituent statement uses the given number-field model.

*Source.* [xue] Introduction, Proposition 1 and Theorem 2, pp. 2–3; §3.6, Definition 3.6.5, Lemma 3.6.6 and Theorem 3.6.7 with Remarks 3.6.3 and 3.6.8, pp. 30–31; §4.2, pp. 40–41: Proves finiteness of compactly supported shtuka cohomology over a local Hecke algebra, extends excursion operators to compactly supported automorphic forms and decomposes every finite-codimension Hecke quotient by semisimple Weil-group parameters compatibly with Satake and constant terms.; [ch26] §9.2, p. 32: Cites Xue for the extension of Lafforgue's parametrization to finite-codimension quotients, covering some non-cuspidal discrete representations.; [lh] §6, Theorem 6.10, §6.11 and Theorem 6.13, pp. 46–48: Constructs global excursions on all compactly supported automorphic forms and compares the restricted local excursions with the local Bernstein centre. The identity descends to Hecke quotients and their σ generalized eigenspaces.

*Needs.* `GlobalShtukasAndFunctionFieldLanglands:GS.3/single-place-hecke-module-finiteness`, `GlobalShtukasAndFunctionFieldLanglands:GS.4/full-cohomology-weil-descent`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursions-on-full-compact-cohomology`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/reconstruction-of-a-langlands-parameter`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/satake-compatibility-and-chebotarev`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/compatible-global-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/li-huerta-compatibility`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`.

## RA.8 Weight patterns, Property A and Arthur-type propagation

**Targets.** Global weight patterns and propagation of complementary-series real parts, with the central-compact scope and ramified-anchor compatibility explicit (Ciubotaru–Harris Theorem 1.11, p.5). The symmetric weight array, Property A and Remark 10.8 (pp.33–35) compare boundary monodromy with good-place weights. Enumerated Sp6/F4/E7/E8 weight certificates eliminate extraneous points under the orbit-profile contracts; N3 must supply semantic orbit-to-triple identifications and the missing E7 profile. The endpoint (Theorem 10.3, pp.33–35) forces the central real part and vanishing on each global weight-graded monodromy piece, not vanishing of the full local discrete-series monodromy.

<a id="ra-8-global-weight-pattern"></a>
### RA.8.1 Global weight patterns

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/global-weight-pattern` · construction · planet: Global weight pattern

Let π have a compatible global parameter σ (RA.7/compatible-global-parameter) such that L(π, τ) has integer weights for every τ (for instance π\_u geometric at some place u, by RA.1/geometric-boundary-propagation). The global weight pattern is n(i, π, τ) := rank gr\_i^W L(π, τ). For every w ∉ S, the weight pattern of the Satake class s\_w(π) (LieHighestWeightPartII N5/weight-pattern, with q = q\_w) equals n(·, π, τ) for every τ.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- G is a connected semisimple group over K; Ĝ is its dual group over the coefficient field and LG = Ĝ ⋊ Gal(K̃/K), with K̃/K the finite Galois extension through which Gal(K^sep/K) acts on the based root datum (Galois form, as in GlobalShtukasAndFunctionFieldLanglands GS.5).
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- Whenever geometricity or an Aubert anchor at u is used, require σ|\_{W\_{K\_u}}^{ss}=L\_{K\_u}(π\_u). This follows for cuspidal parameters by RA.3/local-parametrization and for a chosen Xue quotient eigenspace by RA.7/xue-hecke-quotient-parametrization with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

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
- `WeightPattern.tempered` (degenerate): If every L(π,τ) is arithmetically pure of weight 0, as in the discrete-series-anchor clause of RA.5, n(0,π,τ)=dim τ. Temperedness at a single complex embedding alone does not imply this arithmetic assertion.
- `WeightPattern.not_from_one_place` (non-example): Without integer weights (no geometric place) the ranks of ι-weight pieces could depend on ι and the pattern is undefined; the complementary-series class diag(q^{1/4}, q^{−1/4}) has no weight pattern.
- `WeightPattern.local_compat` (compatibility): At w ∉ S the global pattern equals N5/weight-pattern of s\_w(π).

*Checks.*

- For cuspidal generic π under the discrete-series-anchor clause of RA.5, n(0,π,τ)=dim τ and n(i,π,τ)=0 for i≠0.

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
- Whenever geometricity or an Aubert anchor at u is used, require σ|\_{W\_{K\_u}}^{ss}=L\_{K\_u}(π\_u). This follows for cuspidal parameters by RA.3/local-parametrization and for a chosen Xue quotient eigenspace by RA.7/xue-hecke-quotient-parametrization with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

*Proof route.*

- RA.1/geometric-boundary-propagation at u gives integer weights for every L(π, τ); RA.8/global-weight-pattern makes the weight pattern of s\_w independent of w ∉ S.
- LieHighestWeightPartII N5/real-part-recognition (Ciubotaru–Harris Proposition 10.2): the weight pattern determines the real part up to conjugacy; this gives (a).
- For (b), equality of normalized real parts gives the same root subsets ⟨α,ν⟩=0 and ⟨α,ν⟩=1. With central compact parts these identify the centralizer root algebra and the q\_w-eigenspace of Ad(s\_w), and similarly at v. Their nilpotent strata match under the root-datum identification; the numerical operators Ad(s\_w) and Ad(s\_v) need not be equal because q\_w can differ from q\_v. Unitarity then places π\_w in the same complementary-series stratum.
- For (c) apply the restricted real/central-compact classifications of SRU.7 componentwise to the simple factors of the split adjoint group. No claim of these classifications for arbitrary compact parts or arbitrary non-adjoint groups is made.

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
- Whenever geometricity or an Aubert anchor at u is used, require σ|\_{W\_{K\_u}}^{ss}=L\_{K\_u}(π\_u). This follows for cuspidal parameters by RA.3/local-parametrization and for a chosen Xue quotient eigenspace by RA.7/xue-hecke-quotient-parametrization with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

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

*Needs.* Finite arithmetic only.

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
- The N3 appendix interface has opaque orbit labels and covers E8/F4/G2. To use these profiles for a named nilpotent orbit one still needs the orbit-to-triple identification; in particular the E7 D5(a1)+A1 profile is not supplied by that interface. Request these exact semantic identifications and the E7 profile from N3 (G12). The elementary root counts in the suggested file prove the displayed Sp6/F4 numerical comparisons, not the missing orbit identifications.

*Checks.*

- Sp(6), O^∨ = (2,2,2): standard weights ±e\_i, central (½, ½, ½) gives n(±1) = 3; x = (0, ½, 1) gives n(2) = 1, n(1) = 1, n(0) = 2, n(−1) = 1, n(−2) = 1; i₀ = 2.

*Source.* [ch26] §10.2, proof of Theorem 10.3, cases (1)–(5), p. 34; §8.2, Theorem 8.5 and Remark 8.6, pp. 28–29; Appendix Tables 2–3, pp. 36–37: Lists, for each extraneous point, a representation and the top index where its weight multiplicities exceed those of the central point, which contradicts Property A; the right-hand subscripts are misprinted (E3) and the F₄ B₃ point is misprinted (E5).

*Needs.* `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/extraneous-classical`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/extraneous-exceptional`, `LieHighestWeightPartII:N3/appendix-table-interface`, `LieHighestWeightPartII:N5/weight-pattern`, `LieHighestWeightPartII:N3`.

<a id="ra-8-extraneous-point-elimination"></a>
### RA.8.6 Elimination of extraneous points

`GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination` · theorem · planet: Elimination of extraneous points

Under the hypotheses of RA.8/complementary-series-propagation with G adjoint split and s\_v of central compact part, assume moreover that u ∈ S and π\_u ≅ AZ(σ\_u) for an irreducible discrete series σ\_u whose pure Weil–Deligne parameter (RA.4/weil-deligne-purity-of-discrete-series) has monodromy in O^∨. Then for every split w ∉ S the real part of the Satake parameter of π\_w is the central point ½h^∨ of O^∨; no unramified component is extraneous. Moreover all monodromy operators N\_i on (gr\_i^W L(π, τ))\_u vanish.

*Hypotheses and conventions.*

- K = k₁(X) is the function field of a smooth projective geometrically connected curve X over a finite field k₁ of characteristic p and cardinality q₁; |X| is its set of closed points (places); q\_w = |k(w)| for a place w; ℓ ≠ p is a prime.
- Q̄ is the algebraic closure of Q inside C, and ι : Q̄ → C, ι\_ℓ : Q̄ → Q̄\_ℓ are fixed embeddings; a statement 'for every ι' quantifies over all field embeddings Q̄ → C, equivalently over all field isomorphisms Q̄\_ℓ ≅ C after extension.
- U ⊂ G(A\_K) is a compact open subgroup and S = S(U) is the finite set of places w at which U\_w = U ∩ G(K\_w) is not a hyperspecial maximal compact subgroup; at w ∉ S the group G is unramified over K\_w.
- Same scope corrections as RA.8/complementary-series-propagation.
- Whenever geometricity or an Aubert anchor at u is used, require σ|\_{W\_{K\_u}}^{ss}=L\_{K\_u}(π\_u). This follows for cuspidal parameters by RA.3/local-parametrization and for a chosen Xue quotient eigenspace by RA.7/xue-hecke-quotient-parametrization with Li-Huerta Theorem 6.13. For a bare hypothetical parameter known only by good-place Satake compatibility, it is an additional hypothesis.

*Proof route.*

- L\_F(π\_u) = L\_F(σ\_u) (SRU.7/aubert-semisimple-parameter), so n\_u is the weight pattern of the Frobenius of the pure parameter of σ\_u, whose real part is q\_u^{h/2} with h the neutral element of an sl₂-triple through the monodromy (bounded part ϕ₀, RA.4/weil-deligne-purity-of-discrete-series).
- By RA.8/complementary-series-propagation (c), ℜ(s\_v) is ½h^∨ or extraneous; in the extraneous case RA.8/extraneous-weight-certificates gives τ violating Property A for the array of RA.8/weight-array, contradicting RA.8/property-a.
- So n\_v = n\_u, the pattern of ½h^∨; by RA.8/global-weight-pattern and LieHighestWeightPartII N5/real-part-recognition every split w ∉ S has real part ½h^∨.
- With n\_u = n\_v the array is diagonal (Property A, first alternative), which is the vanishing of every N\_i (Remark 10.7).

*Checks.*

- For O^∨ = 0, σ\_u supercuspidal and AZ(σ\_u) = σ\_u: the theorem says the real part is 0 at every split unramified place, recovering the generic statement in that case.

*Source.* [ch26] §1.2, Theorem (Theorem 10.3), pp. 5–6; §10.2, Theorem 10.3 with its proof and Remark 10.7, pp. 33–35: Proves that if the component at a ramified place is the Aubert dual of a discrete series whose monodromy lies in the orbit of the complementary series at v, the real parts at all split unramified places are the central point, by comparing weight patterns through Property A, and remarks that the monodromy at u then vanishes.

*Needs.* `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/weight-array`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/property-a`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-weight-certificates`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/global-weight-pattern`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/aubert-semisimple-parameter`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/aubert-involution`, `LieHighestWeightPartII:N5/real-part-recognition`, `LieHighestWeightPartII:N3`.

## Corrections and source issues

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

The earlier findings are scoped to the source versions named in the paper extraction. The following independently checked findings are scoped to this packet’s versions.

### E1 — gap

**Locator.** arXiv:2311.15300v1, §4.1, sketch of the proofs of Theorems 4.2–4.3, step (1), p. 11

**Source assertion.** The sketch says that Beuzart-Plessis's appendix to Gan–Harris–Sawin shows that every discrete series representation is a local component of a cuspidal automorphic representation, and deduces from the number-field model of that cuspidal representation that every discrete series has a number-field model.

**Correction.** Beuzart-Plessis's Lemma A.1 produces a cuspidal Π whose component at the place has nonzero trace against a pseudo-coefficient of the discrete series, hence the same cuspidal support; it is isomorphic to the given representation only at a supercuspidal place. The number-field model of an arbitrary discrete series needs a separate argument (gap G2); the Galois-conjugation assertion holds for discrete series that have a model over Q̄ (RA.4/galois-conjugation-of-discrete-series).

**Reason.** Gan–Harris–Sawin, proof of Proposition 3.11 (p. 11), state that they do not know whether the local component is the given discrete series, and Gan–Lomelí, remark after Proposition 8.2 (p. 40), say the same of their pseudo-globalization; Lemma A.1(i) of the appendix only asserts nonzero trace against a pseudo-coefficient. A non-tempered Π\_v can have nonzero trace against a pseudo-coefficient of π\_v without being π\_v (for example the trivial representation against the Steinberg pseudo-coefficient of PGL₂).

**Known status.** new as a source issue; the paper extraction PAPER-CIUBOTARU-HARRIS-26 notes a missing 'isolation/support-descent bridge' in its item galois-discrete-series without an E-number

**Review.** confirmed — Read CH v1 p.11, GHS published Proposition 3.11 p.11 and Appendix A.1 pp.38–40, and Gan–Lomelí Lemma 8.1/Proposition 8.2 pp.38–40. They give common cuspidal support, whereas the descent sketch needs the actual representation. The separate general number-field descent argument is not supplied.

**Correction search.** the source issues E1–E18 and gaps of PAPER-CIUBOTARU-HARRIS-26; the arXiv abstract page and version history of 2311.15300 (one version) and of the earlier 2204.06053 (three versions, generic case only); the published Gan–Harris–Sawin, Proposition 3.11 and Appendix A; https://annals.math.princeton.edu/2026/204-2/p03 (metadata only; published text not obtained); https://www.math.columbia.edu/~harris/website/errata-publications-list-links-here and its linked errata.pdf (no CH correction listed)

### E2 — error

**Locator.** arXiv:2311.15300v1, §3.2, Proposition 3.10(2), pp.10–11 (preprint only; Annals revision uncollated)

**Source assertion.** The all-values Weil q-number criterion is stated for an arbitrary torus over F, with integer-weight geometricity as in Definition 2.5.

**Correction.** Use this equivalence for split tori. For Res\_{E/F}G\_m the uniformizer value must be a Weil q\_E-number of integer weight, where q\_E=q\_F^f; integer weights relative to q\_F alone do not suffice.

**Reason.** For unramified quadratic E/F, take the unramified character χ(ϖ\_E)=q\_F^{1/2}. All its values are integer-weight Weil q\_F-numbers, and it has a number-field model. In the natural induced L-representation the Frobenius eigenvalues are ±q\_F^{1/4}, each of Deligne weight 1/2, contradicting integer-weight geometricity.

**Known status.** No correction located in the consulted public material; finding scoped to arXiv v1, not asserted against the uncollated Annals revision.

**Review.** confirmed — Direct induced-representation calculation: the square of the Frobenius matrix is χ(ϖ\_E)·id, so the weights are measured relative to q\_E, not q\_F.

**Correction search.** https://arxiv.org/abs/2311.15300 (v1 only); https://annals.math.princeton.edu/2026/204-2/p03 (published metadata; text not collated); https://www.math.columbia.edu/~harris/website/errata-publications-list-links-here and linked errata.pdf (no relevant correction listed); https://www.maths.ox.ac.uk/people/dan.ciubotaru (publication listing)

### E3 — error

**Locator.** Published §2.2, Definition 2.5, pp.7–8; §3.1, Definition 3.3(b), p.8

**Source assertion.** Common-weight purity of an LG-valued parameter is declared independent of the chosen faithful representation for connected reductive G.

**Correction.** For reductive groups distinguish adjoint analytic essential temperedness from common-weight arithmetic purity in a specified representation. For semisimple groups use weight-0 purity in every algebraic representation. Do not infer arbitrary-faithful common-weight independence.

**Reason.** For G=G\_m and unramified Frobenius q, the identity representation is faithful and pure of weight 2, whereas identity ⊕ trivial is also faithful but has weights 2 and 0. With N=0 no scalar twist makes its two weights equal. Thus the faithful-representation equivalence in these definitions fails for this reductive example; this does not refute the semisimple weight-0 theorem used here.

**Known status.** No correction located in the consulted public material; the packet narrows its purity conventions accordingly.

**Review.** confirmed — Both representations have trivial kernel, but their N=0 Frobenius weight multisets are {2} and {2,0}. Tensor generation preserves integer geometricity, not a common nonzero weight.

**Correction search.** https://doi.org/10.1017/fmp.2024.10 (published text read); https://arxiv.org/abs/2109.07737 (public version history); https://www.math.columbia.edu/~harris/website/errata-publications-list-links-here and linked errata.pdf

### E4 — error

**Locator.** Published Remark 3.10, p.11, final adjoint-irreducibility assertion; compare HNY §2.4, Theorem 2 and Corollary 2.13, pp.17–18

**Source assertion.** The local Kloosterman parameter used at the auxiliary place is said to become irreducible after composition with the adjoint representation.

**Correction.** Use the absence of a proper Levi, which follows from vanishing adjoint inertia invariants. This does not require the adjoint Weil representation to be irreducible.

**Reason.** Take G=PGL₂ and odd residue characteristic. HNY Corollary 2.13 puts wild inertia in a nontrivial finite subgroup of a dual maximal torus, with tame inertia acting by the rank-one Coxeter element. The Lie algebra of the centralizer of wild inertia is a one-dimensional toral line. Wild inertia is normal in the full local Weil group, so this line is Weil-stable inside the three-dimensional adjoint representation. Tame inertia acts on it by −1: this is consistent with zero inertia invariants, but disproves irreducibility of the adjoint Weil representation.

**Known status.** No correction located in the consulted public material. The globalization proof only needs the weaker, valid Levi assertion.

**Review.** confirmed — The wild-inertia centralizer line is a proper local Weil subrepresentation. Vanishing inertia invariants is a different assertion and suffices for the consumer.

**Correction search.** https://doi.org/10.1017/fmp.2024.10 (published Remark 3.10 read); https://arxiv.org/abs/2109.07737 (version history); https://www.math.columbia.edu/~harris/website/errata-publications-list-links-here and linked errata.pdf

The published Gan–Harris–Sawin theorem removes the p>3 condition of arXiv v3. This does not explain or remove the separate residue-cardinality qualification in Ciubotaru–Harris’s abstract: the later Annals text remains uncollated (G7).

## Gaps

- **G1. Simple trace formula and Poincaré-series globalization over function fields have no owner.** The Deligne–Kazhdan simple trace formula for general connected reductive groups over a global function field and Gan–Lomelí's Poincaré-series globalization are used as cited theorems; no atlas roadmap plans them (ES7:function-field-automorphic covers only GL\_d and division algebras in a selected range). They are requested from a Part II of FunctionFieldArithmetic at FA.6. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`.
- **G2. Number-field models of arbitrary discrete series.** Ciubotaru–Harris Theorem 4.2 asserts that every complex discrete series of a semisimple group over F = k((t)) has a model over a number field; the sketch derives it from Beuzart-Plessis's lemma, which only gives a cuspidal representation with the same cuspidal support (this packet's source issue E1). The plan proves the Galois conjugation statement for representations that have a number-field model, viewed over Q̄, which covers every local component of a cuspidal representation and every supercuspidal; the model for an arbitrary discrete series (for example by finiteness of discrete series with given cuspidal support and algebraicity of the reducibility points) is not established. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/galois-conjugation-of-discrete-series`.
- **G3. Embedding independence of temperedness without geometricity (E10).** Ciubotaru–Harris Theorem 4.3 (an ι-tempered component of a cuspidal representation is tempered for every embedding) assumes in step (2) of its sketch that every local monodromy of L(Π, τ) is geometric, which is not known without an anchor (PAPER-CIUBOTARU-HARRIS-26/E10). The plan states the theorem under geometricity of the local parameter and proves the generic theorem for a fixed ι without it. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/embedding-independent-temperedness`.
- **G4. Non-central compact parts of Satake parameters (E11, E18) and the stratum step of Theorem 1.11.** The local classifications used at v (SRU.5/generic-temperedness-test, SRU.6, SRU.7 extraneous lists) hold for Satake parameters whose compact part is central; for non-central compact parts the G₂ witness (SRU.5/g2-noncentral-witness) shows the generic test fails locally. Theorem 5.4 is therefore planned with the centrality hypothesis at v, and Theorem 1.11 with conclusions (b) and (c) under centrality; an exhaustive classification of geometric complementary-series points with arbitrary compact part (through SRU.7/noncentral-compact-reduction) and a global argument excluding them are missing. No global counterexample is known. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination`.
- **G5. Integrality of weights for direct images from algebraic stacks.** Ciubotaru–Harris Sketch 5.10 requires integer weights for constant-coefficient direct images from finite-type stacks. Sun Theorem 2.11, pp.14–15, gives real ι-mixedness; Remark 2.12 also states preservation of mixedness without a fixed embedding. Neither is silently identified here with preservation of the integer-weight subclass. A closure proof with the exact integer convention, using a smooth presentation, the hypercover spectral sequence and a mixed dualizing complex, is requested at DWP.8. This alternative stack route is not needed by the anchored endpoint. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity`.
- **G6. Elliptic orthogonality of discrete-series characters in positive characteristic.** Beuzart-Plessis's Lemma A.3 uses his elliptic orthogonality relations for discrete-series characters, cited in Gan–Harris–Sawin as a 2022 manuscript; no public version was located for this plan. It is requested at SRU.3 with the pseudo-coefficients it accompanies. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`.
- **G7. The Annals version of Ciubotaru–Harris is not collated.** All locators are to arXiv v1; the accepted revision (8 October 2025) may already repair E10–E13 and renumber statements. Collate the locators and the corrections when a copy is available. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/complementary-series-propagation`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination`.
- **G8. Reductive central reduction and coefficient normalization.** The all-embeddings arithmetic globalization chain is stated for semisimple G. Its extension to arbitrary reductive centres requires the precise SR.3 central reduction and ES6 parameter transport; fixed-ι boundedness does not prove absolute purity in an arbitrary faithful representation. ES5 must also identify the √q coefficient-automorphism law used by RA.3. These are requested supplier targets, not theorems obtained by the narrower existing nodes. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-galois-conjugates`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/integral-weights-from-anchor`.
- **G9. General adjoint transfer and spherical genericity.** The non-adjoint generic-place reduction must account for the finite-index image on rational points. Nonsplit genericity propagation needs the general unramified quasi-split theorem, not merely SRU.5’s split adjoint criterion. Exact contracts are requested at SR.4; the endpoint remains conditional on those contracts. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/genericity-propagation`.
- **G10. From Satake coefficients to constant stack coefficients.** Lafforgue–Zhu’s formula retains Sσ invariants and a frozen auxiliary representation. It does not identify a Satake IC coefficient complex with the constant sheaf. The precise realization bridge requested at DWP.8 is required before deducing the constant-coefficient predicate from that formula. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/lafforgue-zhu-decomposition`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity`.
- **G11. Weight patterns do not construct a global Arthur homomorphism.** RA.8 determines integer weight multiplicities and normalized real Satake parts. It does not provide a commuting global SL₂ or a globally compatible bounded Weil factor whose products equal the full Satake classes. ArthurPrediction.At includes these additional conjectural requirements; no construction of ψ is claimed. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/global-arthur-parameter`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.7/arthur-weight-prediction`.
- **G12. Semantic identification of exceptional-orbit profiles.** N3 currently supplies E8/F4/G2 profiles with opaque identifiers. The orbit-to-SL₂-triple identifications needed here and the E7 D5(a1)+A1 profile must be supplied before the exceptional cases of RA.8/extraneous-weight-certificates are a closed proof. The Sp6 and F4 explicit numerical tests in Lean do not supply these missing identifications. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-weight-certificates`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination`.

## Requests to other roadmaps

- `FunctionFieldArithmetic:FA.6`: Part II of FunctionFieldArithmetic (not yet designed), automorphic inputs over a global function field for connected reductive G: (i) the Deligne–Kazhdan simple trace formula (Deligne–Kazhdan–Vignéras §A.1) for test functions with a supercuspidal matrix coefficient at one place and support in regular elliptic classes, with finiteness of both sides, as used by Beuzart-Plessis in Gan–Harris–Sawin Appendix A (A.2); (ii) Gan–Lomelí's Poincaré-series globalization of supercuspidals with prescribed central character and depth-zero principal-series components elsewhere (Gan–Lomelí Theorem 1.1); (iii) the extension of FA.6/integral-coefficient-model and FA.6/harder-cuspidal-support to nonsplit semisimple G (the parent packet's proposed 'FunctionFieldArithmetic, Part II: nonsplit compact cusp support'). Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.2/rational-satake-parameters`.
- `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`: Over a nonarchimedean local field of positive characteristic: pseudo-coefficients of discrete series (from the trace Paley–Wiener theorem of Bernstein–Deligne–Kazhdan), the statement that nonzero trace of an irreducible representation against a pseudo-coefficient forces the same cuspidal support (Gan–Lomelí Lemma 8.1, via the Langlands classification), and Beuzart-Plessis's elliptic orthogonality of discrete-series characters (cited in Gan–Harris–Sawin Appendix A as a 2022 manuscript; gap G6). Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-pseudo-globalization`.
- `HeckeStacksAndLocalShtukas:HS2`: Cited as it stands for the local shtuka tower over a general local field (HS2/general-local-field); needed in addition, in equal characteristic: the formal moduli of local G-shtukas and their deformation theory, relative z-adic Hodge theory and the analytic moduli with étale period maps (Li-Huerta §§2–4, Theorem 4.9 and Proposition 4.12), which are the source of the uniformization morphism. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/shtuka-uniformization`.
- `DeligneWeightsAndPurity:DWP.8`: Part II of DeligneWeightsAndPurity (not yet designed): ι-mixedness of the six operations and Verdier duality on algebraic stacks of finite type over a finite field (Sun 2012, Theorem 2.11, with the Laszlo–Olsson operations), and preservation of integrality of weights by Rf\_! along morphisms from algebraic stacks (Ciubotaru–Harris Sketch 5.10; gap G5). Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity`.
- `PadicDifferentialEquationsAndRigidCohomology:RD.6`: Cited as it stands (RD.6/neutral-tannakian-recognition), together with the converse recorded in Deligne–Milne Proposition 2.20(b): every faithful finite-dimensional representation of an affine algebraic group over a field is a tensor generator of its representation category. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.0/geometricity-is-intrinsic`.
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality`: Extend the existing isogeny contract to a homomorphism Υ:G1→G2 with normal image: parameters of every irreducible constituent of restriction are LΥ∘L(π). Include smooth central tori T→G and restriction of the central character to T; do not form L(Z\_G) when the centre is nonsmooth. Source: GHS Theorem 2.3(vi), p.7; CH Proposition 3.10(4), pp.10–11. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometric-central-characters`.
- `ExcursionOperatorsAndSpectralAction:ES5`: Give the exact coefficient-automorphism formula for L\_F(γπ), for all γ∈Aut(Q̄\_ℓ), with the chosen √q and the cocharacter giving the order-two normalization twist. State hypotheses ensuring preservation of smooth irreducibility and a number-field model. The existing conditional invariance-and-coefficient-transport node does not itself identify this formula. Needed for Proposition 3.10(1) and geometric induction/Jacquet descent. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/local-parametrization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-galois-conjugates`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.3/geometricity-stability`.
- `KloostermanSheavesAndBesselIsocrystals:KB.6`: Supply the étale adjoint inertia-invariant vanishing Lie(Ĝ)^{I∞}=0 for split almost-simple Kloosterman parameters (HNY Theorem 2, p.17), its extension from isocrystal invariants using Xu–Zhu Corollary 4.5.8/Remark 4.5.10 for every prime, and passage to products/central quotients used to obtain a local parameter in no proper Levi. The present rigidity-local statement is formulated for isocrystals. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/supercuspidal-irreducible-globalization`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/discrete-series-irreducible-globalization`.
- `SmoothRepresentationsOfLocalGroups:SR.3`: For a discrete-series representation of reductive G, construct an unramified twist making the unramified central character finite order, and compare discrete-series constituents under the relevant central isogenies/z-extensions; combine with ES6 parameter transport to reduce the adjoint completion theorem to semisimple G. Distinguish fixed-ι unitary twists from arithmetic Weil twists. Source: GHS Theorem 1.2 and §3; CH §4.1. The Harish–Chandra tempered-support theorem used at RA.5 is already a current SR.3 target and is imported as it stands. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/weil-deligne-purity-of-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.4/geometric-discrete-series`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/integral-weights-from-anchor`.
- `SmoothRepresentationsOfLocalGroups:SR.4`: Supply (i) central-isogeny transfer of spherical unitarity/genericity from a semisimple G(F) to its adjoint form, accounting for the possibly nonsurjective map on F-points; (ii) spherical tempered ⇒ Whittaker generic for an unramified quasi-split group, with precise isogeny and Whittaker hypotheses (Reeder Proposition 7.4 as invoked by CH Corollary 5.7, p.15). The SRU.5 split-adjoint criterion alone does not supply either generality. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/generic-ramanujan`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.5/genericity-propagation`.
- `LieHighestWeightPartII:N3`: Provide checked identifications between the appendix’s opaque orbit rows and actual SL₂ triples for the F4 and E8 orbits used in CH Theorem 10.3, and the missing E7 orbit D5(a1)+A1 adjoint weight profile (central top counts n(10)=1,n(9)=0; extraneous counts 1,1). Give compatible root coordinates and weighted Dynkin diagrams so the profile is attached to the named orbit, not merely an identifier. CH §10.2 p.34 and Appendix pp.36–37. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-weight-certificates`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.8/extraneous-point-elimination`.
- `DeligneWeightsAndPurity:DWP.8`: Provide the constant-coefficient realization bridge for the Satake-coefficient constituents in Lafforgue–Zhu Proposition 1.2: spread the frozen base leg, retain full centralizer invariants, and realize the needed IC/Satake summands as constituents of Rf\_!Q̄\_ℓ for a finite-type stack, with shifts and Tate twists. A formula for shtuka cohomology with Satake coefficients is not itself this assertion. This is separate from integer-weight preservation G5. Needed by `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/lafforgue-zhu-decomposition`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-realisability`, `GlobalShtukasAndFunctionFieldLanglandsPartII:RA.6/stack-purity`.

## Upstream notes

- Current TauCetiRoadmap SmoothRepresentationsOfLocalGroups already owns coefficient-change (SR.0), the simple Hecke-module correspondence (SR.1), normalized induction and Jacquet base change (SR.2), Harish–Chandra tempered support and Casselman’s criterion with central unitarity (SR.3), and square-root-independent c-group Satake charts (SR.4). These are imported. The SR.3/SR.4 requests below concern only the additional central reduction/isogeny and general spherical-generic contracts, not replanning those existing targets.

## Restructuring

- **R1 (split).** The design brief (#3381) carried nine continuations of GlobalShtukasAndFunctionFieldLanglands in six independent directions: (a) Ramanujan and Arthur weight constraints (Ciubotaru–Harris 2026, route GlobalShtukasPartIIRamanujanArthur, 27 items, plus one Gan–Harris–Sawin item); (b) counting unramified ℓ-adic local systems (Yu 2023, route GlobalShtukasAndFunctionFieldLanglandsCountingPartII, 77 items); (c) the Langlands correspondence for isocrystals and crystalline companions (Abe 2018, 17 items, and D'Addezio 2023, 2 items, route GlobalShtukasPartIICrystallineCompanions); (d) special cycles on shtuka moduli and the higher Siegel–Weil formula (Yun–Zhang 2017, 33 items; Yun–Zhang 2019, 129 items; Feng–Yun–Zhang 2024, 25 items; route ShtukaSpecialCyclesAndHigherSiegelWeil); (e) Tate cohomology of shtukas with mod-p coefficients and cyclic base change (Feng 2024, route ShtukaTateCohomologyAndGlobalBaseChange, 33 items); (f) Ĝ-valued deformation theory and potential automorphy (Böckle–Harris–Khare–Thorne 2019, route GValuedDeformationsAndPotentialAutomorphy, 28 items). They share only the parent's shtuka cohomology and excursion theory. This roadmap plans (a), in layers RA.0–RA.8, as the brief's first direction. Each of (b)–(f) becomes its own Part II of GlobalShtukasAndFunctionFieldLanglands with a design job carrying its routes: DESIGN-GlobalShtukasAndFunctionFieldLanglandsCountingPartII (b); DESIGN-GlobalShtukasPartIICrystallineCompanions (c), which also imports PadicDifferentialEquationsAndRigidCohomology and its proposed arithmetic D-module Part II; DESIGN-ShtukaSpecialCyclesAndHigherSiegelWeil (d), one roadmap for the three special-cycle papers as their briefs require; DESIGN-ShtukaTateCohomologyAndGlobalBaseChange (e), importing SheafTheoreticSmithTheory ST.3 (modular Satake) as its review requires; DESIGN-GValuedDeformationsAndPotentialAutomorphy (f). Direction (f) and the generic theorem here are independent: BHKT's potential automorphy is not used by Ciubotaru–Harris.
- **R2 (rescope).** The held route GlobalShtukasPartIISupercuspidalParameters of PAPER-GAN-HARRIS-SAWIN-ETAL-24 (rejected by its review pending revision) would own Gan–Harris–Sawin's Theorem 1.2. Ciubotaru–Harris need that theorem as the anchor of the generic theorem, so this roadmap plans it with its inputs: Lemma 3.5 (RA.0/pure-completion-uniqueness), Lemma 3.6 and Corollary 3.8 (RA.1/sawin-templier-purity, RA.1/local-purity-of-irreducible-parameters), Propositions 3.9 and 3.11, Appendix Lemma A.1 and Corollary 3.12 (RA.4). When the supercuspidal-parameters Part II is redesigned it imports these nodes and plans only Theorems 1.4–1.5 and §§4–11 of Gan–Harris–Sawin (ramification of pure supercuspidal parameters, Poincaré series on P¹, base change and incorrigible representations).

## Routed items

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

- Annals of Mathematics 204 (2026), no. 2, 545–601; read in arXiv:2311.15300v1 (26 November 2023, 39 pp.), whose page numbers are used throughout; the Annals text (revised 8 October 2025) was not accessible and is not collated: [source](https://arxiv.org/abs/2311.15300), read 2026-10-19, SHA-256 `7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103`.
- Forum of Mathematics, Pi 12 (2024), e13; published PDF (printed page = PDF page); arXiv:2109.07737v3 was also read: there Theorem 1.2 assumes p > 3, and the published Proposition 3.11, Corollary 3.12 and Remark 3.13 are numbered 3.10, 3.11 and 3.12 (the published Remark 3.10 is new): [source](https://doi.org/10.1017/fmp.2024.10), read 2026-10-19, SHA-256 `e570036504ba58ededa9f48453e517a710da0f49128fefebfa94f5ff4439bfcc`.
- arXiv:2301.09711v2 (13 August 2023), 54 pp.: [source](https://arxiv.org/abs/2301.09711), read 2026-10-19, SHA-256 `83c269e46bb28713f9081086c0c8f0340c41fccbe224d2ea457e5626421bed6c`.
- arXiv:1805.12231v4 (27 September 2020): [source](https://arxiv.org/abs/1805.12231), read 2026-10-19, SHA-256 `9dddd64e480b56f3987604a8daf096fa850b74fe998ab1963f55b17f373e3e3c`.
- Épijournal de Géométrie Algébrique 4 (2020), Article 6; arXiv:1811.09513v3 (journal pagination): [source](https://arxiv.org/abs/1811.09513), read 2026-10-19, SHA-256 `b43e7eec00416326ab508ba6af06ec004b186a09874a6a58c1b455170e57a675`.
- arXiv:1811.07976v2 (11 December 2019): [source](https://arxiv.org/abs/1811.07976), read 2026-10-19, SHA-256 `871c208f006f5496b3776e1050a20ab85ef88ef7066e351ca188159daf56151d`.
- Algebra & Number Theory 6 (2012), 47–122; read in arXiv:1008.3689v2 (28 March 2011): [source](https://arxiv.org/abs/1008.3689), read 2026-10-19, SHA-256 `85947e31a4b0f65e7d1cfad998a8f28969411d2e8dca561b645ef266ae8c8d1b`.
- J. Eur. Math. Soc. 20 (2018), 2813–2858; read in arXiv:1510.00131v2: [source](https://arxiv.org/abs/1510.00131), read 2026-10-19, SHA-256 `5f4adc241b2034f97c74719a28c3c8095314fb459e297a29964c52868ecabff4`.
- Annals of Mathematics 177 (2013), 241–310; read in arXiv:1005.2765v1: [source](https://arxiv.org/abs/1005.2765), read 2026-10-19, SHA-256 `0918c93759cb2d19fe3521c332b45e9c36e4d78b87b84112d65c82761c482004`.
- Inventiones Mathematicae 147 (2002), 1–241; author's full text (journal pagination): [source](https://www.ihes.fr/~lafforgue/math/fulltext.pdf), read 2026-10-19, SHA-256 `af732dac0d2dd00056ff46075f069f09cb2239bcac5cec68b13d17faa8d2ea76`.
- https://arxiv.org/pdf/math/0412357: [source](https://arxiv.org/pdf/math/0412357), read 2026-10-19, SHA-256 `a17d283d3a605cd3f031a1178f2914254ee9cbe430b11cfbff8c382e8cd1713b`.
