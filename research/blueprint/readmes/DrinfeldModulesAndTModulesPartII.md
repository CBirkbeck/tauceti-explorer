# Drinfeld modules, t-motives and characteristic-p special values, Part II: multiple zeta values and Thakur's basis

This roadmap plans the theory of multiple zeta values over the polynomial ring F\_q\[θ] up to the three theorems that settle the positive-characteristic analogues of the Zagier and Hoffman conjectures: Thakur’s basis theorem, which says that the values ζ\_A(s) with all entries at most q and last entry below q form a basis of the weight-w span Z\_w; Todd’s dimension formula dim\_K Z\_w = d(w); and, for Harada’s alternating values, dim\_K AZ\_w = s(w) with a Hoffman-like basis. It also plans the description of all linear relations among multiple zeta values of a fixed weight, Ngo Dac’s earlier generation theorem and his small-weight independence theorems, and the direct small-weight bounds for alternating values.

It is a Part II of Drinfeld modules, t-motives and characteristic-p special values (DrinfeldModulesAndTModules) and starts where that roadmap stops. The parent plans depth one: the Carlitz module and the products ℓ\_d (DM.0), the field C\_∞, the Carlitz exponential and logarithm, the period π̃ and the function Ω (DM.2), effective dual t-motives (DM.4), the depth-one power sums S\_d(s) = ℓ\_d^{−s} for s ≤ q (DM.6), and the Frobenius-difference machinery of characteristic-p transcendence: the coefficient twist, the Tate algebra T, the ring E of entire series with algebraic coefficients, the Anderson–Brownawell–Papanikolas criterion, the rational common-denominator theorem and the uniqueness of rigid analytic trivialisations (DM.8). This roadmap imports all of these by node and plans only what lies beyond depth one.

The sources are Ngo Dac, On Zagier–Hoffman’s conjectures in positive characteristic (Annals of Mathematics 194, 2021), for the generation theorem and the small-weight independence results; Chang, Chen and Mishiba, On Thakur’s basis conjecture for multiple zeta values in positive characteristic (Forum of Mathematics, Pi 11, 2023), for the index-space framework, the rewriting operator, the Frobenius systems and the basis theorem; and Im, Kim, Le, Ngo Dac and Pham, Zagier–Hoffman’s conjectures in positive characteristic (Forum of Mathematics, Pi 12, 2024), with their Note in Acta Mathematica Vietnamica 49 (2024), for alternating values, the strong Brown theorem and the improved independence criterion. Chang, Linear independence of monomials of multizeta values in positive characteristic (Compositio Mathematica 150, 2014), supplies Carlitz multiple polylogarithms, the MZ property and the descent theorem; Chang, Papanikolas and Yu (JEMS 21, 2019) supply the Frobenius specialisation and the common denominators; Thakur’s papers on power sums, relations and shuffles supply nonvanishing, the fundamental relation and the shuffle product.

## Scope, layers and boundaries

The two published proofs of Thakur’s basis theorem share most of their material, and the roadmap plans that material once. Both replace multiple zeta values by values of Carlitz multiple polylogarithms, which agree with them on Thakur’s index range by Carlitz’s identity and satisfy the simpler stuffle relations. Both obtain generating sets by Todd’s operators on binary relations, and both prove independence through dual t-motives and the Anderson–Brownawell–Papanikolas criterion, which turns a putative linear relation into a solution of a Frobenius difference system. Chang, Chen and Mishiba compute the solution space of that system for the Hoffman-type index set IND\_w; Im, Kim, Le, Ngo Dac and Pham do the same for alternating polylogarithms and prove a strong Brown theorem that supplies the last step.

MZ.0 fixes the objects: indices and arrays with their orders, power sums of both realisations, Thakur’s and Harada’s values, Carlitz multiple polylogarithms, Carlitz’s identity, the weight spaces, the index families with their counts, the evaluation ζ\_A(q − 1) = −π̃^{q−1}/D\_1 and Eulerian values. MZ.1 gives the products: Chen’s equal-degree formula, the harmonic and q-shuffle products on the index space, the multiplicativity of the realisation maps and the algebra structure of the spans. MZ.2 is the algebraic half: binary relations, Thakur’s relation R\_1, Todd’s operators B\*, C and BC, the reduction to k-admissible indices, Brown’s theorem in positive characteristic, the rewriting operator of Chang–Chen–Mishiba, the IND\_w generating set, the strong Brown theorem and the bridges AZ\_w = AL\_w, Z\_w = L\_w. MZ.3 is the period side: Anderson–Thakur polynomials, Chang’s deformation series and the dual t-motives they trivialise, the MZ property and Chang’s descent theorem, the merged prefix system of a putative relation and the independence criterion with its Eulerian consequence. MZ.4 solves the Frobenius systems: monic Frobenius descent, the θ-degree bound, the key lemma, the dimension of the solution space X\_w, the character-twisted system and Ngo Dac’s two-row system. MZ.5 assembles the independence and dimension theorems.

Boundaries. Classical real multiple zeta values (PeriodsAndSpecialValues, PS.9) are an analogy only and are not used. Todd’s conjecture that the relations B\*\_U C\_V(R\_1) span all relations is not planned; Chang–Chen–Mishiba prove its B\*-version, which is MZ.5/all-relations. The v-adic multiple zeta values of Chang and Mishiba are not planned; the v-adic bound of Chang–Chen–Mishiba Corollary 1.2.7 is stated with that input recorded as a gap. Two other Part II directions of the parent, admissible Anderson class formulas (Anglès–Ngo Dac–Tavares Ribeiro) and gamma values with CM periods (Wei), are separate roadmaps and are not planned here.

Independent review: accepted on 2026-10-19 by Codex, session codex-GTDhJk. All 68 nodes and 23 source issues were checked. The three explicit gaps below remain; this is a completed target-level planning pass. The [review report](../reviews/REV-DESIGN-DrinfeldModulesAndTModulesPartII.md) records the corrections and validation.

## Conventions

- q = p^e is a prime power, A = F\_q\[θ], K = F\_q(θ), A\_+ the monic polynomials and A\_{+,d} those of degree d. K\_∞ = F\_q((1/θ)) is the completion at infinity with |θ|\_∞ = q (Mathlib’s RatFunc.CompletionAtInfty with its valuation), C\_∞ the completion of an algebraic closure of K\_∞, and K̄ the algebraic closure of K in C\_∞ (DM.2).
- ℓ\_0 = 1, ℓ\_d = ∏\_{i=1}^{d}(θ − θ^{q^i}), \[k] = θ^{q^k} − θ, D\_k = ∏\_{ℓ=1}^{k}\[ℓ]^{q^{k−ℓ}}, D\_1 = θ^q − θ = −ℓ\_1 (DM.0).
- Ω(t) = ρ^{−q}∏\_{i ≥ 1}(1 − t/θ^{q^i}) with ρ^{q−1} = −θ, Ω^{(−1)} = (t − θ)Ω, and π̃ = 1/Ω(θ); this is the period π\_ND = −π\_BP of DM.2/carlitz-period. Statements that are invariant under π̃ ↦ ξπ̃ (ξ ∈ F\_q^×) do not depend on the choice of ρ; π̃^{q−1} ∈ K\_∞.
- The twist f ↦ f^{(n)} raises the coefficients of a series in t to the q^n-th power and fixes t; σ is f ↦ f^{(−1)} (DM.8/coefficient-twist). T is the Tate algebra over C\_∞ in t and E ⊂ T the ring of entire series with algebraic coefficients generating a finite extension of K\_∞ (DM.8).
- Indices are finite lists of positive integers; ∅ is the empty index. The roadmap uses Ngo Dac’s indexing of the Anderson–Thakur polynomials, H\_n = Anderson–Thakur’s H\_{n−1}, and Γ\_n is the Carlitz factorial of n − 1.
- Node identifiers below are written without the roadmap prefix: MZ.k/name is a node of this roadmap and DM.k/name a node of DrinfeldModulesAndTModules. Each node lists its statement, hypotheses, proof sketch, prerequisites, and, for definitions and constructions, its API outline and unit tests; theorems list acceptance checks. “Source issue Ek” refers to the list at the end.

The suggested Lean file uses light prototypes over the pinned carriers. Its `powerSum` is the nonalternating sum; `altPowerSum` is the array sum corresponding to the packet’s general power-sum target. The analytic and difference-system targets in MZ.3–MZ.4 remain in the reader and build on carriers and interfaces supplied by the parent roadmap.

## MZ.0. Indices, power sums, multiple zeta values and Carlitz multiple polylogarithms

**Layer targets.**

Conventions: A = F\_q\[θ\], K = F\_q(θ), K\_∞ = F\_q((1/θ)) with |θ|\_∞ = q, C\_∞ and K̄ ⊂ C\_∞ from DM.2, A\_{+,d} the monic polynomials of degree d, ℓ\_0 = 1 and ℓ\_d = ∏\_{i=1}^{d}(θ − θ^{q^i}) (DM.0), D\_1 = θ^q − θ, and π̃ = 1/Ω(θ) the Carlitz period normalised as in DM.2 (π\_ND).

Targets.

- Indices s = (s\_1, …, s\_r) of positive integers with weight wt(s) and depth dep(s), the empty index, concatenation, s\_+ and s\_−; the prefix-dominance order s ≤ t (equal weight, every zero-padded prefix sum of s at most that of t), the collapse T\_i, the coordinatewise sum, the initial tuple Init(s) with its lexicographic order and k-admissibility. Arrays (ε; s) with ε ∈ (F\_q^×)^r, their character χ(ε) = ε\_1⋯ε\_r, the sum of arrays and the preorder on arrays of equal character.
- Power sums of both realisations: S\_d(ε; s) = Σ ε\_1^{deg a\_1}⋯ε\_r^{deg a\_r}/(a\_1^{s\_1}⋯a\_r^{s\_r}) over monic a\_i with d = deg a\_1 > ⋯ > deg a\_r ≥ 0, and Si\_d(ε; s) = Σ ε\_1^{d\_1}⋯ε\_r^{d\_r}/(ℓ\_{d\_1}^{s\_1}⋯ℓ\_{d\_r}^{s\_r}) over d = d\_1 > ⋯ > d\_r ≥ 0, with the truncated sums S\_{&lt;d}, Si\_{&lt;d}, the empty-index conventions and the factorisations S\_d(ε; s) = S\_d(ε\_1; s\_1)S\_{&lt;d}(ε\_−; s\_−).
- Thakur's multiple zeta values ζ\_A(s) = Σ\_{d ≥ 0} S\_d(s) ∈ K\_∞ and Harada's alternating values ζ\_A(ε; s); convergence; Thakur's theorem that every ζ\_A(s) is nonzero (Thakur 2009 Theorem 4).
- Carlitz multiple polylogarithms Li\_s(z\_1, …, z\_r) = Σ\_{d\_1 > ⋯ > d\_r ≥ 0} z\_1^{q^{d\_1}}⋯z\_r^{q^{d\_r}}/(ℓ\_{d\_1}^{s\_1}⋯ℓ\_{d\_r}^{s\_r}) with their convergence domain, the values Li(s) = Li\_s(1, …, 1) and the alternating values Li(ε; s), and Li\_s(γ) = γ\_1⋯γ\_r Li(ε; s) when γ\_i^{q−1} = ε\_i; nonvanishing on the polydisc with every z\_i ≠ 0 and |z\_i| &lt; q^{s\_i q/(q−1)} (Chang 2014 Remark 5.1.5).
- Carlitz's identity S\_d(ε; s) = Si\_d(ε; s) when every s\_i ≤ q, hence ζ\_A(ε; s) = Li(ε; s) on Thakur's range (Im–Kim–Le–Ngo Dac–Pham Lemma 1.2; Chang–Chen–Mishiba Remark 2.2.6).
- The K-spans Z\_w, AZ\_w, L\_w, AL\_w of weight-w values (Z\_0 = K), the index families I^T\_w (Thakur), I^0\_w (entries &lt; q), IND\_w = J′\_w (no entry divisible by q), AT\_w, AS\_w, and the counting theorem |I^T\_w| = |IND\_w| = d(w), |AS\_w| = s(w), |AT\_w| = t(w) with the block bijection ι : IND\_w → I^T\_w.
- Carlitz's evaluation ζ\_A(q − 1) = Li(q − 1) = −π̃^{q−1}/D\_1 and the notion of an Eulerian value (an element of K·π̃^w).

Acceptance: ζ\_A(1) = log\_C(1); for q = 2, I^T\_3 = {(1,1,1), (2,1)} and d(3) = 2; (q) ∉ I^T\_q but (q, 1) ∈ I^T\_{q+1}; the bijection ι sends (q + 1) to (q, 1).

**Inputs from other layers:** `DM.0`, `DM.2`, `DM.6`.

<a id="MZ-0-index"></a>

### MZ.0.1 Indices, arrays and their orders

Node `MZ.0/index`, a definition.

**Statement.** An index is a finite list s = (s\_1, …, s\_r) of positive integers, r ≥ 0, with weight wt(s) = s\_1 + ⋯ + s\_r and depth dep(s) = r; the empty index ∅ has weight and depth 0, and s\_i := 0 for i > r is used only in comparisons. For nonempty s put s\_+ = (s\_1, …, s\_{r−1}) and s\_− = (s\_2, …, s\_r); (s, t) is concatenation, and q^{{m}} denotes m consecutive entries q. Prefix dominance: s ≤ t iff wt(s) = wt(t) and s\_1 + ⋯ + s\_i ≤ t\_1 + ⋯ + t\_i for every i ≥ 1. The collapse T\_i(s) = (s\_1 + ⋯ + s\_i, s\_{i+1}, …, s\_r) (i ≥ 1, so T\_1(s) = s), and s + t is the coordinatewise sum of the zero-padded sequences, trailing zeros dropped (not concatenation). For a fixed prime power q, Init(s) = (s\_1, …, s\_i) with i maximal such that s\_1, …, s\_i ≤ q, and initial tuples are compared in the lexicographic order of finite lists, a proper prefix being smaller. For k ≥ 1, s is k-admissible iff s\_1, …, s\_k ≤ q (zero-padded) and s is not of the form (s\_1, …, s\_r) with r ≤ k, s\_1, …, s\_{r−1} ≤ q and s\_r = q; ∅ is k-admissible. An array (ε; s) is an index s of depth r together with ε = (ε\_1, …, ε\_r) ∈ (F\_q^×)^r; its character is χ(ε) = ε\_1⋯ε\_r, the sum of arrays is (εε′; s + t) with ε\_i := 1 past the depth, and (ε; s) ≤ (ε′; t) iff χ(ε) = χ(ε′) and s ≤ t (a preorder).

**Hypotheses.** q = p^e a fixed prime power; entries of indices are positive integers.

**Proof sketch.**

1. Represent an index as a list of positive integers; weight and depth are its sum and length.
2. Prefix dominance is reflexive and transitive, and antisymmetric among indices of one weight; if s ≤ t then (u, s) ≤ (u, t), u + s ≤ u + t, T\_k(s) ≤ T\_k(t) for every k, and dep(s) ≥ dep(t) (Im–Kim–Le–Ngo Dac–Pham Remark 1.1: a shorter index of the same weight would have a strictly smaller final prefix sum).
3. If T\_i(s) ≤ T\_i(t) then T\_k(s) ≤ T\_k(t) for all k ≥ i (Ngo Dac §2.1).
4. For integers x > i > 0, (x − i, (i) + c) ≤ (x, c); for nonempty a and any b, (a\_1, a\_− + b) ≤ a + b; these are the support bounds used by the product expansions.
5. An index of weight w ≥ 1 is w-admissible iff it lies in Thakur's family I^T\_w (entries ≤ q, last entry &lt; q).

**Uses.**

- Ngo Dac, Proposition 2.1 and Propositions 2.12–2.13: support bounds c ≤ a + b and T\_k(t) ≤ T\_k(s) control the product expansions and the reduction step
- Ngo Dac, proof of Proposition 3.2, p. 16: termination ranks tuples by Init in a finite lexicographic set
- Im–Kim–Le–Ngo Dac–Pham, Propositions 1.3, 1.7, 1.9: the preorder on arrays carries the character through the stuffle calculus
- Chang–Chen–Mishiba, §3.1 and Lemma A.3.7: Init and depth give the lexicographic progress measure of the rewriting operator

**API.**

- `FunctionFieldMZV.Index.weight` (data): wt(s) = s\_1 + ⋯ + s\_r.
- `FunctionFieldMZV.Index.depth` (data): dep(s) = r.
- `FunctionFieldMZV.Index.Dominates` (data): The prefix-dominance relation s ≤ t: equal weight and dominated prefix sums.
- `FunctionFieldMZV.Index.collapse` (data): T\_i(s) = (s\_1 + ⋯ + s\_i, s\_{i+1}, …, s\_r).
- `FunctionFieldMZV.Index.init` (data): Init(s), the longest initial segment with entries ≤ q.
- `FunctionFieldMZV.Index.IsAdmissible` (data): k-admissibility of s.
- `FunctionFieldMZV.Index.dominates_depth` (relation): s ≤ t implies dep(s) ≥ dep(t).
- `FunctionFieldMZV.Index.dominates_collapse` (relation): s ≤ t implies T\_k(s) ≤ T\_k(t) for every k ≥ 1.
- `FunctionFieldMZV.Index.admissible_weight_iff` (characterisation): An index of weight w ≥ 1 is w-admissible iff it lies in I^T\_w.
- `FunctionFieldMZV.ZetaArray.character` (data): χ(ε) = ε\_1⋯ε\_r for an array (ε; s).

**Unit tests.**

- `FunctionFieldMZV.Index.test_weight` (computation): wt(2, 1, 3) = 6 and dep(2, 1, 3) = 3.
- `FunctionFieldMZV.Index.test_dominates` (computation): (1, 2) ≤ (2, 1) holds and (2, 1) ≤ (1, 2) fails.
- `FunctionFieldMZV.Index.test_not_lex` (non-example): (1, 3) and (2, 1, 1) are incomparable for prefix dominance although (1, 3) is lexicographically smaller.
- `FunctionFieldMZV.Index.test_empty` (degenerate): wt(∅) = dep(∅) = 0, Init(∅) = ∅ and ∅ is k-admissible for every k.
- `FunctionFieldMZV.Index.test_admissible` (computation): For every q, (q) is not 1-admissible and (q, 1) is 1-admissible.

**Acceptance.** (1, 2) ≤ (2, 1) but (2, 1) is not ≤ (1, 2); (1, 3) and (2, 1, 1) are incomparable although (1, 3) precedes (2, 1, 1) lexicographically. Init(q + 1, 1) = ∅ and Init(q, q, 1) = (q, q, 1); (q) is not 1-admissible while (q, 1) is.

**Needs.** `mathlib:Composition`.

**Sources.**

- ND21, §2.1, p. 5 (order ≤, T\_i); Definition 2.11, p. 11 (Init); Definition 3.1, p. 14 (k-admissibility): Defines prefix dominance, the collapse T\_i and its propagation, the initial tuple with the lexicographic order, and k-admissibility exactly as stated here.
- IKLNDP24, §1.1.1–1.1.2 and Remark 1.1, pp. 7–8; §1.1.5, p. 10 (sum of arrays); Definition 1.8, p. 21: Restates the tuple order, T\_i and Init, introduces arrays with their character and the preorder on arrays, proves that dominance reverses depth, defines the sum of arrays, and recalls k-admissibility (Definition 1.8).
- CCM23, §2.1, (2.1.2)–(2.1.3), p. 6 (indices, I\_w, concatenation, s\_+, s\_−); Definition 2.1.4, p. 7 (the bracket on H): Indices including ∅ with depth and weight, concatenation (2.1.2), the operations s\_+ and s\_− (2.1.3), and the multilinear bracket extending concatenation.

<a id="MZ-0-power-sum"></a>

### MZ.0.2 Power sums of both realisations

Node `MZ.0/power-sum`, a definition.

**Statement.** Let A = F\_q\[θ\], K = F\_q(θ), A\_{+,d} the finite set of monic polynomials of degree d, ℓ\_0 = 1 and ℓ\_d = ∏\_{i=1}^{d}(θ − θ^{q^i}). For d ∈ Z and an array (ε; s) of depth r ≥ 1 put
S\_d(ε; s) = Σ ε\_1^{deg a\_1}⋯ε\_r^{deg a\_r} a\_1^{−s\_1}⋯a\_r^{−s\_r} ∈ K, over a\_i ∈ A\_+ with d = deg a\_1 > ⋯ > deg a\_r ≥ 0,
Si\_d(ε; s) = Σ ε\_1^{d\_1}⋯ε\_r^{d\_r} ℓ\_{d\_1}^{−s\_1}⋯ℓ\_{d\_r}^{−s\_r} ∈ K, over integers d = d\_1 > ⋯ > d\_r ≥ 0,
both zero when d &lt; r − 1, and S\_{&lt;d} = Σ\_{0 ≤ j &lt; d} S\_j, Si\_{&lt;d} = Σ\_{0 ≤ j &lt; d} Si\_j for nonempty arrays. For the empty array, S\_{&lt;d}(∅) = Si\_{&lt;d}(∅) = 1 for every d ∈ Z, and S\_d(∅) = Si\_d(∅) is 1 for d = 0 and 0 otherwise. Trivial characters give S\_d(s), Si\_d(s). One has S\_d(ε; s) = S\_d(ε\_1; s\_1) S\_{&lt;d}(ε\_−; s\_−), Si\_d(ε; s) = Si\_d(ε\_1; s\_1) Si\_{&lt;d}(ε\_−; s\_−), S\_d(ε; s) = ε^d S\_d(s) and Si\_d(ε; s) = ε^d ℓ\_d^{−s} in depth one for d ≥ 0.

**Hypotheses.** θ transcendental over F\_q, so the sums lie in K = F\_q(θ); ε\_i ∈ F\_q^×.

**Proof sketch.**

1. For d ≥ 0, A\_{+,d} has q^d elements; for d &lt; 0 it is empty. Thus every S\_d is a finite sum in K; Si\_d is a finite sum over decreasing nonnegative integer sequences below d.
2. The factorisations follow by separating the first summation variable; the convention S\_{&lt;d}(∅) = 1 for every d ∈ Z is what makes the depth-one case d = 0 of the factorisation correct (source issue E1 records the slip of the opposite convention).
3. In depth one, ε^{deg a} = ε^d for every a ∈ A\_{+,d}, and ε^{d\_1} = ε^d, giving the character factor.

**Uses.**

- Ngo Dac, Definition 2.3 and §2.2: binary relations are identities among the S\_d valid for every integer d
- Im–Kim–Le–Ngo Dac–Pham, Definition 1.4: binary relations among the Si\_d of arrays
- Chang–Chen–Mishiba, Definition 2.2.2: the realisation maps 𝔏^ζ\_d, 𝔏^{Li}\_d are these power sums
- MZ.0/multiple-zeta-value and MZ.0/carlitz-multiple-polylogarithm: the values are the sums over d ≥ 0

**API.**

- `FunctionFieldMZV.powerSum` (data): S\_d(ε; s) ∈ K.
- `FunctionFieldMZV.powerSumLT` (data): S\_{&lt;d}(ε; s) ∈ K.
- `FunctionFieldMZV.carlitzPowerSum` (data): Si\_d(ε; s) ∈ K.
- `FunctionFieldMZV.carlitzPowerSumLT` (data): Si\_{&lt;d}(ε; s) ∈ K.
- `FunctionFieldMZV.powerSum_cons` (simp): S\_d(ε; s) = S\_d(ε\_1; s\_1) S\_{&lt;d}(ε\_−; s\_−), and likewise for Si.
- `FunctionFieldMZV.powerSumLT_eq_sum` (characterisation): For nonempty arrays, S\_{&lt;d} = Σ\_{0 ≤ j &lt; d} S\_j.
- `FunctionFieldMZV.powerSumLT_nil` (simp): S\_{&lt;d}(∅) = 1 for every d ∈ Z.
- `FunctionFieldMZV.powerSum_eq_zero_of_lt` (simp): S\_d(ε; s) = 0 when d &lt; dep(s) − 1.
- `FunctionFieldMZV.powerSum_character` (simp): For d ≥ 0 in depth one S\_d(ε; s) = ε^d S\_d(s) and Si\_d(ε; s) = ε^d ℓ\_d^{−s}.

**Unit tests.**

- `FunctionFieldMZV.powerSum_test_zero` (degenerate): S\_0(s) = Si\_0(s) = 1 for every s ≥ 1 in depth one, and S\_d(s) = 0 for d &lt; 0. Also S\_{&lt;−1}(∅) = Si\_{&lt;−1}(∅) = 1, while S\_{&lt;−1}(s) = Si\_{&lt;−1}(s) = 0 for nonempty s.
- `FunctionFieldMZV.powerSum_test_q2` (computation): For q = 2, S\_1(1) = (θ² + θ)^{−1}.
- `FunctionFieldMZV.powerSum_test_tail` (non-example): S\_0((s)) = S\_0(s) S\_{&lt;0}(∅) = 1: with S\_{&lt;0}(∅) = 0 the factorisation would give 0. This forces the value 1 at d = 0; our uniform convention gives 1 for every integer d.
- `FunctionFieldMZV.powerSum_test_character` (computation): For q = 3, S\_1(−1; 1) = −S\_1(1).

**Acceptance.** For q = 2, S\_1(1) = θ^{−1} + (θ + 1)^{−1} = (θ² + θ)^{−1} and S\_1(1, 1) = S\_1(1)S\_0(1) = S\_1(1).

**Needs.** `MZ.0/index`, `DM.0/carlitz-products`, `mathlib:Polynomial.Monic`, `mathlib:RatFunc`.

**Sources.**

- ND21, §2.1, pp. 5–6: Defines S\_d(s) and S\_&lt;d(s) as elements of K∞ (they are finite sums, hence in K), with S\_&lt;d(∅) = 1, empty sums 0 and the factorisation S\_d(s) = S\_d(s\_1)S\_&lt;d(s\_−).
- IKLNDP24, §1.1.3–1.1.4, pp. 8–9: Defines S\_d, S\_&lt;d, Si\_d, Si\_&lt;d for tuples and for arrays, with the elementary identities Si\_d(ε; s) = ε^d Si\_d(s) in depth one and the factorisation of Si\_d.
- CCM23, Definition 2.2.2 and the identities after it, pp. 7–8: Defines S^{Li}\_d(s) = 1/L\_d^s and S^ζ\_d(s) = Σ\_{a ∈ A\_{+,d}} a^{−s} and the maps 𝔏^•\_d, 𝔏^•\_{&lt;d} built from them.

<a id="MZ-0-multiple-zeta-value"></a>

### MZ.0.3 Thakur multiple zeta values

Node `MZ.0/multiple-zeta-value`, a definition.

**Statement.** For an index s of depth r ≥ 1, Thakur's multiple zeta value is ζ\_A(s) = Σ\_{d ≥ 0} S\_d(s) ∈ K\_∞ = F\_q((1/θ)), that is the sum of a\_1^{−s\_1}⋯a\_r^{−s\_r} over monic a\_1, …, a\_r with deg a\_1 > ⋯ > deg a\_r. The series converges since |S\_d(s)|\_∞ ≤ q^{−d s\_1} (|·|\_∞ normalised by |θ|\_∞ = q); ζ\_A(∅) = 1. Its weight and depth are those of s; in depth one these are the Carlitz zeta values ζ\_A(n) = Σ\_{a ∈ A\_+} a^{−n}.

**Hypotheses.** The valuation at ∞ normalised by v\_∞(θ) = −1; K\_∞ is the completion of K at ∞.

**Proof sketch.**

1. Each term a\_1^{−s\_1}⋯a\_r^{−s\_r} with deg a\_1 = d has absolute value at most q^{−d s\_1}, and an ultrametric finite sum is bounded by its largest term, so |S\_d(s)|\_∞ ≤ q^{−d s\_1} → 0.
2. Hence the series converges (unconditionally) in K\_∞ and equals the sum over strictly degree-decreasing tuples of monic polynomials.
3. The acceptance identity at 1 uses DM.6/small-power-sum with exponent 1 and the logarithm series of DM.2/carlitz-exponential; 1 is inside its convergence disc.

**Uses.**

- Ngo Dac, Theorem A and Theorems B–D: the spanning and independence statements concern the K-span of these values
- Chang–Chen–Mishiba, Theorem 1.2.4: Thakur’s basis conjecture is a statement about these values
- MZ.1/value-algebras: products of these values are F\_p-combinations of values of the added weight

**API.**

- `FunctionFieldMZV.MZV` (data): ζ\_A(s) ∈ K\_∞ for an index s.
- `FunctionFieldMZV.MZV_nil` (simp): ζ\_A(∅) = 1.
- `FunctionFieldMZV.MZV_eq_tsum` (characterisation): ζ\_A(s) = Σ\_{d ≥ 0} S\_d(s) in K\_∞.
- `FunctionFieldMZV.powerSum_norm_le` (other): |S\_d(s)|\_∞ ≤ q^{−d s\_1} for nonempty s.
- `FunctionFieldMZV.MZV_depth_one` (compatibility): ζ\_A((n)) is the Carlitz zeta value Σ\_{a ∈ A\_+} a^{−n}.

**Unit tests.**

- `FunctionFieldMZV.MZV_test_one` (compatibility): ζ\_A(1) = log\_C(1), the Carlitz logarithm of DM.2 at 1.
- `FunctionFieldMZV.MZV_test_empty` (degenerate): ζ\_A(∅) = 1.
- `FunctionFieldMZV.MZV_test_frobenius` (computation): For q = 2, ζ\_A(1)² = ζ\_A(2).
- `FunctionFieldMZV.MZV_test_first_entry` (non-example): Unlike real multiple zeta values no admissibility s\_1 ≥ 2 is needed: ζ\_A(1) and ζ\_A(1, 1) converge.

**Acceptance.** ζ\_A(1) = Σ\_{d ≥ 0} ℓ\_d^{−1} = log\_C(1) (DM.6/small-power-sum). For q = 2, ζ\_A(1)² = ζ\_A(2), since squaring is additive in characteristic 2.

**Needs.** `MZ.0/power-sum`, `mathlib:RatFunc.CompletionAtInfty`, `mathlib:RatFunc.inftyValuation`, `DM.6/small-power-sum`, `DM.2/carlitz-exponential`.

**Sources.**

- ND21, §1.2, pp. 2–3, and §2, p. 5: Defines ζ\_A(s) as the sum over monic polynomials of strictly decreasing degrees, with ζ\_A(∅) = 1, depth and weight, and notes that the depth-one values are Carlitz zeta values.
- CCM23, §1.2, equation (1.2.1), p. 2: States the definition with the condition |a\_1|\_∞ > ⋯ > |a\_r|\_∞ and notes convergence in k\_∞ from the non-archimedean absolute value.
- IKLNDP24, §0.2.1, p. 3, and §1.1.3, p. 8: Defines ζ\_A(s) = Σ\_{d ≥ 0} S\_d(s) in K\_∞ and Z\_w.

**Planet:** Thakur multiple zeta value.

<a id="MZ-0-alternating-mzv"></a>

### MZ.0.4 Harada’s alternating multiple zeta values

Node `MZ.0/alternating-mzv`, a definition.

**Statement.** For an array (ε; s) of depth r ≥ 1, the alternating multiple zeta value is ζ\_A(ε; s) = Σ\_{d ≥ 0} S\_d(ε; s) = Σ ε\_1^{deg a\_1}⋯ε\_r^{deg a\_r} a\_1^{−s\_1}⋯a\_r^{−s\_r} ∈ K\_∞, the sum over monic a\_1, …, a\_r with deg a\_1 > ⋯ > deg a\_r; ζ\_A(∅; ∅) = 1. Its weight, depth and character are those of the array, and ζ\_A((1, …, 1); s) = ζ\_A(s).

**Hypotheses.** ε\_i ∈ F\_q^×.

**Proof sketch.**

1. Convergence as for ζ\_A(s), since |ε\_i| = 1.
2. The trivial character recovers Thakur’s values.

**Uses.**

- Im–Kim–Le–Ngo Dac–Pham, Theorem A: the dimension of the span AZ\_w of these values is computed
- Im–Kim–Le–Ngo Dac–Pham, Theorem 4.9: AZ\_w is identified with the span of alternating Carlitz polylogarithm values

**API.**

- `FunctionFieldMZV.AMZV` (data): ζ\_A(ε; s) ∈ K\_∞.
- `FunctionFieldMZV.AMZV_one` (compatibility): ζ\_A((1, …, 1); s) = ζ\_A(s).
- `FunctionFieldMZV.AMZV_eq_tsum` (characterisation): ζ\_A(ε; s) = Σ\_{d ≥ 0} S\_d(ε; s).
- `FunctionFieldMZV.AMZV_depth_one` (simp): ζ\_A(ε; n) = Σ\_{d ≥ 0} ε^d S\_d(n).

**Unit tests.**

- `FunctionFieldMZV.AMZV_test_trivial` (compatibility): With ε = (1, …, 1), ζ\_A(ε; s) = ζ\_A(s).
- `FunctionFieldMZV.AMZV_test_q2` (degenerate): For q = 2, F\_2^× = {1}, so every alternating value is a Thakur value.
- `FunctionFieldMZV.AMZV_test_sign` (non-example): For q = 3, ζ\_A(−1; 1) − ζ\_A(1) = −2Σ\_{d odd} ℓ\_d^{−1} ≠ 0 (its leading term has valuation q = 3), so the twist by ε^{deg a} is not trivial.

**Acceptance.** For q = 2 every character is trivial and the alternating values are Thakur’s values.

**Needs.** `MZ.0/power-sum`, `MZ.0/multiple-zeta-value`.

**Sources.**

- IKLNDP24, §0.2.2, p. 4; §4.1.1, p. 43: Defines the alternating values after Harada with ζ\_A(∅; ∅) = 1, their depth, weight and character, and recalls the power-sum expression.

**Planet:** Alternating multiple zeta value.

<a id="MZ-0-mzv-nonvanishing"></a>

### MZ.0.5 Thakur’s nonvanishing theorem

Node `MZ.0/mzv-nonvanishing`, a theorem.

**Statement.** For every prime power q and every index s of positive depth, ζ\_A(s) ≠ 0; likewise ζ\_A(ε; s) ≠ 0 for every array. More precisely, if for each k ≥ 1 the degrees deg\_θ S\_d(k) (d ≥ 0) are finite and strictly decreasing in d, then the term S\_{r−1}(s\_1)S\_{r−2}(s\_2)⋯S\_0(s\_r) is the unique term of largest degree in Σ\_{d\_1 > ⋯ > d\_r ≥ 0} S\_{d\_1}(s\_1)⋯S\_{d\_r}(s\_r).

**Hypotheses.** s of depth r ≥ 1; q any prime power.

**Proof sketch.**

1. For 1 ≤ k ≤ q, S\_d(k) = ℓ\_d^{−k} has degree −k(q + q² + ⋯ + q^d), which is strictly decreasing in d (DM.6/small-power-sum).
2. For general k, Thakur shows S\_d(k) ≠ 0 and −deg S\_d(k) strictly increasing in d: for q prime from his recursion for the degrees, and for general q from the minimal-decomposition formula or Sheats’s degree inequality (Thakur 2009, proof of Theorem 4). This general-q degree input is recorded as a gap.
3. Given strict monotonicity, the degree of S\_{d\_1}(s\_1)⋯S\_{d\_r}(s\_r) over d\_1 > ⋯ > d\_r ≥ 0 is uniquely maximised at d\_i = r − i, so no cancellation can occur and ζ\_A(s) ≠ 0; the character factors have absolute value 1, so the same argument applies to ζ\_A(ε; s).

**Acceptance.** ζ\_A(1) has leading term 1; for q = 2, ζ\_A(1, 1) has leading term S\_1(1) = (θ² + θ)^{−1} of degree −2.

**Needs.** `MZ.0/multiple-zeta-value`, `MZ.0/alternating-mzv`, `DM.6/small-power-sum`.

**Sources.**

- THAKUR09P, Theorem 4 and its proof, §5.2, p. 542; Theorems 1–2, §4, pp. 540–541: States that no multizeta value with positive entries vanishes, proves it for q prime from the degree recursion, and indicates the general case through the minimal decomposition or the Riemann-hypothesis degree inequality.
- ND21, §1.2, p. 3: Records that each multiple zeta value is nonzero, citing Thakur.
- IKLNDP24, §2.2.2, after (2.5), p. 29: Records nonvanishing of the alternating values, citing Thakur and Harada.

<a id="MZ-0-carlitz-multiple-polylogarithm"></a>

### MZ.0.6 Carlitz multiple polylogarithms

Node `MZ.0/carlitz-multiple-polylogarithm`, a definition.

**Statement.** For an index s of depth r ≥ 1, the Carlitz multiple polylogarithm is the series Li\_s(z\_1, …, z\_r) = Σ\_{d\_1 > ⋯ > d\_r ≥ 0} z\_1^{q^{d\_1}}⋯z\_r^{q^{d\_r}} / (ℓ\_{d\_1}^{s\_1}⋯ℓ\_{d\_r}^{s\_r}), converging on its domain D\_s ⊂ C\_∞^r, which contains the polydisc D′\_s = {|z\_i|\_∞ &lt; q^{s\_i q/(q−1)}}. Its values at 1 are Li(s) = Li\_s(1, …, 1) = Σ\_{d ≥ 0} Si\_d(s) ∈ K\_∞, with Li(∅) = 1; for an array, Li(ε; s) = Σ\_{d ≥ 0} Si\_d(ε; s) ∈ K\_∞ (alternating Carlitz multiple polylogarithm). If γ\_i ∈ F̄\_q satisfies γ\_i^{q−1} = ε\_i, then Li\_s(γ\_1, …, γ\_r) = γ\_1⋯γ\_r Li(ε; s). In depth one Li\_n is Anderson–Thakur’s n-th Carlitz polylogarithm and Li\_1 = log\_C.

**Hypotheses.** C\_∞ and its absolute value from DM.2; ℓ\_d from DM.0.

**Proof sketch.**

1. |ℓ\_i^n|\_∞ = q^{nq(q^i − 1)/(q − 1)} (from the product defining ℓ\_i and |θ|\_∞ = q), so the general term has absolute value q^{q(s\_1 + ⋯ + s\_r)/(q−1)} ∏\_j |z\_j/θ^{q s\_j/(q−1)}|^{q^{d\_j}}, which tends to 0 on D′\_s (Chang (5.1.2) and Remark 5.1.4).
2. For γ^{q−1} = ε one has γ^{q^d} = γ·ε^{(q^d − 1)/(q − 1)} = γ ε^d, because 1 + q + ⋯ + q^{d−1} ≡ d mod q − 1.
3. Hence Li\_s(γ) = Σ γ\_1 ε\_1^{d\_1}⋯γ\_r ε\_r^{d\_r}/(ℓ\_{d\_1}^{s\_1}⋯) = γ\_1⋯γ\_r Li(ε; s).

**Uses.**

- Chang–Chen–Mishiba, §1.3 and Theorem 5.2.1: the independence half of the basis theorem is proved for the values Li(s), s ∈ IND\_w
- Im–Kim–Le–Ngo Dac–Pham, §1 and Theorem 3.6: the algebraic theory and the Hoffman-like basis are developed for ACMPL values
- Chang 2014, Theorem 5.4.3: values at algebraic points form a graded algebra defined over K

**API.**

- `FunctionFieldMZV.carlitzPolylog` (data): The series Li\_s(z\_1, …, z\_r) on its convergence domain.
- `FunctionFieldMZV.CMPL` (data): Li(s) = Li\_s(1, …, 1) ∈ K\_∞.
- `FunctionFieldMZV.ACMPL` (data): Li(ε; s) ∈ K\_∞.
- `FunctionFieldMZV.CMPL_eq_tsum` (characterisation): Li(ε; s) = Σ\_{d ≥ 0} Si\_d(ε; s).
- `FunctionFieldMZV.carlitzPolylog_one` (compatibility): Li\_1 = log\_C on the disc |z| &lt; q^{q/(q−1)}.
- `FunctionFieldMZV.carlitzPolylog_roots` (relation): Li\_s(γ\_1, …, γ\_r) = γ\_1⋯γ\_r Li(ε; s) when γ\_i^{q−1} = ε\_i.
- `FunctionFieldMZV.CMPL_nil` (simp): Li(∅) = 1.

**Unit tests.**

- `FunctionFieldMZV.CMPL_test_log` (compatibility): Li\_1(z) = log\_C(z), so Li(1) = log\_C(1) = ζ\_A(1).
- `FunctionFieldMZV.CMPL_test_empty` (degenerate): Li(∅) = 1 and Li((1, …, 1); s) = Li(s).
- `FunctionFieldMZV.CMPL_test_not_zeta` (non-example): For q = 3, Li(4) ≠ ζ\_A(4): the identity of MZ.0/carlitz-identity needs every entry ≤ q.
- `FunctionFieldMZV.CMPL_test_roots` (computation): For q = 3, γ = √−1 ∈ F\_9 and ε = −1, Li\_1(γ) = γ Li(−1; 1).

**Acceptance.** Li\_1(z) = Σ\_d z^{q^d}/ℓ\_d = log\_C(z), and Li(1) = log\_C(1) = ζ\_A(1).

**Needs.** `MZ.0/power-sum`, `DM.0/carlitz-products`, `DM.2/c-infinity`, `DM.2/carlitz-exponential`.

**Sources.**

- CHANG14, §5.1, Definitions 5.1.1 and 5.1.3, Remark 5.1.4, p. 13: Defines the CMPL series, its convergence domain D\_s and the smaller polydisc D′\_s on which it converges, with the absolute value of the general term.
- CCM23, §2.2, equation (2.2.1), p. 7, and the identities after Definition 2.2.2, p. 8: Recalls log\_C, the Anderson–Thakur polylogarithms and the CMPLs (p. 7), and records 𝔏^{Li}(s) = Li\_s(1) (p. 8).
- IKLNDP24, §0.3.2, p. 5; §1.1.3–1.1.4, pp. 8–9; §2.2.3, (2.6)–(2.7), p. 29: Defines the CMPL and ACMPL values Li(s), Li(ε; s) by the power sums Si\_d and relates them to the series at (q − 1)-th roots γ of ε.

**Planet:** Carlitz multiple polylogarithm.

<a id="MZ-0-cmpl-nonvanishing"></a>

### MZ.0.7 Nonvanishing of Carlitz polylogarithm values

Node `MZ.0/cmpl-nonvanishing`, a theorem.

**Statement.** For an index s of depth r ≥ 1 and u ∈ D′\_s with every u\_i ≠ 0, the general term of Li\_s(u) has a unique term of largest absolute value, at (d\_1, …, d\_r) = (r − 1, …, 0); hence Li\_s(u) ≠ 0. In particular Li(s) ≠ 0 and Li(ε; s) ≠ 0 for every array, and 𝔏-type normalised values γ\_1⋯γ\_r Li(ε; s)/π̃^{wt(s)} are nonzero.

**Hypotheses.** u ∈ D′\_s ∩ (C\_∞^×)^r.

**Proof sketch.**

1. By the absolute value of the general term in MZ.0/carlitz-multiple-polylogarithm, each factor |u\_j/θ^{q s\_j/(q−1)}| is &lt; 1, so raising it to q^{d\_j} with d\_j as small as possible maximises the term; the strictly decreasing constraint forces d\_j = r − j.
2. A unique maximal term in an ultrametric sum gives a nonzero sum.
3. Roots of unity γ\_i have absolute value 1 &lt; q^{s\_i q/(q−1)}.

**Acceptance.** Li(1) = Σ\_d ℓ\_d^{−1} has leading term 1.

**Needs.** `MZ.0/carlitz-multiple-polylogarithm`.

**Sources.**

- CHANG14, Remark 5.1.5, p. 13: Observes that on the smaller polydisc with nonzero coordinates the term (r − 1, …, 0) is the unique term of maximal absolute value, so the CMPL value does not vanish.

<a id="MZ-0-carlitz-identity"></a>

### MZ.0.8 Carlitz’s identity: MZVs equal CMPL values on Thakur’s range

Node `MZ.0/carlitz-identity`, a theorem.

**Statement.** For d ≥ 0 and 1 ≤ s ≤ q, S\_d(s) = ℓ\_d^{−s} (Carlitz). Consequently, for every array (ε; s) with s\_i ≤ q for all i and every d ∈ Z, S\_d(ε; s) = Si\_d(ε; s) and S\_{&lt;d}(ε; s) = Si\_{&lt;d}(ε; s), hence ζ\_A(ε; s) = Li(ε; s); in particular ζ\_A(s) = Li(s) for s ∈ I^T\_w and for s ∈ I^0\_w, and 𝔏^{Li}\_d(s) = 𝔏^ζ\_d(s), 𝔏^{Li}\_{&lt;d}(s) = 𝔏^ζ\_{&lt;d}(s) for such s.

**Hypotheses.** Every entry s\_i ≤ q.

**Proof sketch.**

1. The depth-one identity is DM.6/small-power-sum; with characters, both sides acquire the factor ε^d.
2. Induct on depth using S\_d(ε; s) = S\_d(ε\_1; s\_1)S\_{&lt;d}(ε\_−; s\_−) and the same factorisation of Si\_d; the tail (ε\_−; s\_−) again has entries ≤ q.
3. Sum over d ≥ 0 for the values.

**Acceptance.** For q = 3, Li(1, 2) = ζ\_A(1, 2), while Li(4) ≠ ζ\_A(4) (checked numerically in the truncated Laurent expansion).

**Needs.** `MZ.0/power-sum`, `MZ.0/multiple-zeta-value`, `MZ.0/alternating-mzv`, `MZ.0/carlitz-multiple-polylogarithm`, `DM.6/small-power-sum`.

**Sources.**

- IKLNDP24, Lemma 1.2 and its proof, pp. 9–10: Proves S\_d(ε; s) = Si\_d(ε; s) for every d when all s\_i ≤ q, by induction on depth from Thakur’s depth-one formula, and deduces ζ\_A(ε; s) = Li(ε; s).
- CCM23, Remark 2.2.6, p. 8: States Carlitz’s identity 1/L\_d^s = Σ\_{a ∈ A\_{+,d}} a^{−s} for 1 ≤ s ≤ q and deduces the agreement of the two realisations and Li\_s(1) = ζ\_A(s) on that range.

**Planet:** Carlitz’s identity.

<a id="MZ-0-weight-spaces"></a>

### MZ.0.9 Weight-graded spans of zeta and polylogarithm values

Node `MZ.0/weight-spaces`, a definition.

**Statement.** For w ≥ 1 let Z\_w, AZ\_w, L\_w and AL\_w be the K-linear spans in K\_∞ of ζ\_A(s), ζ\_A(ε; s), Li(s) and Li(ε; s) over indices (arrays) of weight w; put Z\_0 = AZ\_0 = L\_0 = AL\_0 = K and Z = Σ\_{w ≥ 0} Z\_w (similarly AZ, L, AL). For descent statements let 𝒵\_w ⊂ C\_∞ be the K̄-span of the weight-w values. One has Z\_w ⊂ AZ\_w and L\_w ⊂ AL\_w, and each weight space is finite-dimensional because there are 2^{w−1} indices of weight w.

**Hypotheses.** K̄ the algebraic closure of K in C\_∞ (DM.2).

**Proof sketch.**

1. The spans are submodules of K\_∞ over K (and of C\_∞ over K̄).
2. There are 2^{w−1} compositions of w and (q − 1)^r characters per index of depth r, so the spanning families are finite.

**Uses.**

- MZ.5/thakur-basis-theorem: dim\_K Z\_w = d(w) is a statement about this span
- MZ.5/amzv-dimension: dim\_K AZ\_w = s(w)
- MZ.3/chang-descent: the K̄-spans 𝒵\_w form a graded algebra defined over K

**API.**

- `FunctionFieldMZV.weightSpan` (data): Z\_w ⊂ K\_∞ as a K-submodule.
- `FunctionFieldMZV.altWeightSpan` (data): AZ\_w ⊂ K\_∞.
- `FunctionFieldMZV.polylogWeightSpan` (data): L\_w and AL\_w ⊂ K\_∞.
- `FunctionFieldMZV.weightSpan_le_alt` (relation): Z\_w ≤ AZ\_w and L\_w ≤ AL\_w.
- `FunctionFieldMZV.weightSpan_finiteDimensional` (instance): Each weight space is finite-dimensional over K.
- `FunctionFieldMZV.weightSpan_zero` (simp): Z\_0 = K.

**Unit tests.**

- `FunctionFieldMZV.weightSpan_test_one` (computation): Z\_1 = K·ζ\_A(1), of dimension 1.
- `FunctionFieldMZV.weightSpan_test_q2` (degenerate): For q = 2, AZ\_w = Z\_w and AL\_w = L\_w.
- `FunctionFieldMZV.weightSpan_test_count` (computation): Weight 3 has four indices (3), (2, 1), (1, 2), (1, 1, 1).
- `FunctionFieldMZV.weightSpan_test_field` (non-example): Z\_w is a K-span. For q > 2 and ρ ∈ K̄ with ρ^{q−1} = −θ, the element ρζ\_A(1) belongs to 𝒵\_1 but not to K\_∞: v\_∞(ζ\_A(1)) = 0 and v\_∞(ρ) = −1/(q − 1).

**Acceptance.** Z\_1 = K·ζ\_A(1); for q = 2, AZ\_w = Z\_w.

**Needs.** `MZ.0/multiple-zeta-value`, `MZ.0/alternating-mzv`, `MZ.0/carlitz-multiple-polylogarithm`, `mathlib:Submodule.span`, `mathlib:Composition`, `MZ.0/cmpl-nonvanishing`, `DM.2/carlitz-period`.

**Sources.**

- ND21, §1.2, p. 3: Defines Z\_w as the K-span of the MZVs of weight w.
- IKLNDP24, §0.2.2, p. 4; §1.1, after Proposition 1.3, p. 14: Defines AZ\_w, L\_w and AL\_w and the algebras AZ, L, AL.
- CHANG14, §2.2, p. 5: Introduces the K̄-span and the K-span of weight-w MZVs and the algebras they generate.

<a id="MZ-0-index-families"></a>

### MZ.0.10 Thakur, small-entry and Hoffman-type index families

Node `MZ.0/index-families`, a definition.

**Statement.** For w ≥ 1: I\_w is the set of indices of weight w; Thakur’s family I^T\_w = J\_w = {s ∈ I\_w : s\_i ≤ q for i &lt; dep(s), s\_{dep(s)} &lt; q}; the small-entry family I^0\_w = {s ∈ I\_w : every s\_i &lt; q}; the Hoffman-type family IND\_w = J′\_w = I′\_w = {s ∈ I\_w : q ∤ s\_i for every i}; I^T\_0 = IND\_0 = {∅}. For arrays: AT\_w = {(ε; s) : s ∈ J\_w}, AS\_w = {(ε; s) : s ∈ J′\_w}, AJ^1\_w = {(ε; s) : s ∈ J\_w, ε\_i = 1 whenever s\_i = q}. The block map ι : J′\_w → J\_w sends (h\_1q + r\_1, …, h\_nq + r\_n), 0 &lt; r\_i &lt; q, to (q^{{h\_1}}, r\_1, …, q^{{h\_n}}, r\_n), and ϕ : AS\_w → AJ^1\_w does the same on arrays, placing ε\_i over r\_i and 1 over the inserted entries q. In weight 0 all these sets are {∅}, resp. {(∅; ∅)}.

**Hypotheses.** q a fixed prime power.

**Proof sketch.**

1. ι is a weight-preserving bijection: an element of J\_w parses uniquely into blocks, each a run of q’s ending in an entry &lt; q, and each block (q^{{h}}, r) comes from the entry hq + r.
2. ϕ is a bijection by the same parsing, the characters riding on the entries r\_i.
3. Consecutive subwords of elements of I^0\_w (resp. IND\_w) lie in I^0 (resp. IND) of their weight; Thakur’s family is not prefix-closed: (q, 1) ∈ I^T\_{q+1} but (q) ∉ I^T\_q.

**Uses.**

- MZ.5/thakur-basis-theorem: I^T\_w indexes the basis
- MZ.5/cmpl-ind-basis: IND\_w indexes the CMPL basis
- MZ.3/independence-criterion: prefix closure of I^0 and IND makes lower-weight prefixes lie in the families already known to be independent
- MZ.2/strong-brown: ι and ϕ match AS\_w with AJ^1\_w in the transition matrix

**API.**

- `FunctionFieldMZV.thakurIndices` (data): I^T\_w as a finite set.
- `FunctionFieldMZV.smallIndices` (data): I^0\_w.
- `FunctionFieldMZV.hoffmanIndices` (data): IND\_w.
- `FunctionFieldMZV.blockMap` (data): ι : IND\_w → I^T\_w.
- `FunctionFieldMZV.blockMap_bijective` (equivalence): ι is a weight-preserving bijection.
- `FunctionFieldMZV.smallIndices_subword` (relation): Consecutive subwords of elements of I^0 (resp. IND) lie in I^0 (resp. IND).
- `FunctionFieldMZV.thakurIndices_eq_of_le` (characterisation): For w ≤ q, I^T\_w = I^0\_w = IND\_w.

**Unit tests.**

- `FunctionFieldMZV.indexFamilies_test_q2` (computation): For q = 2, I^T\_3 = {(1, 1, 1), (2, 1)} and IND\_3 = {(1, 1, 1), (3)}.
- `FunctionFieldMZV.indexFamilies_test_q3` (computation): For q = 3, I^T\_4 = {(1,1,1,1), (1,1,2), (1,2,1), (2,1,1), (2,2), (3,1)} and ι(4) = (3, 1).
- `FunctionFieldMZV.indexFamilies_test_not_prefix` (non-example): (q, 1) ∈ I^T\_{q+1} but its prefix (q) ∉ I^T\_q.
- `FunctionFieldMZV.indexFamilies_test_p` (non-example): IND excludes multiples of q, not of p: for q = 4 the index (2) lies in IND\_2.
- `FunctionFieldMZV.indexFamilies_test_small` (degenerate): For w &lt; q all three families equal the set of all compositions of w.

**Acceptance.** For q = 2, I^T\_3 = {(1, 1, 1), (2, 1)} and IND\_3 = {(1, 1, 1), (3)}, with ι(3) = (2, 1).

**Needs.** `MZ.0/index`, `mathlib:Composition`.

**Sources.**

- ND21, §1.2, Conjecture 1.6 and Theorem B, p. 3; §6, Lemma 6.1, p. 22: Defines T\_w (entries ≤ q, last &lt; q), T^0\_w (entries &lt; q) and T′\_w (no entry divisible by q), with the prefix property of T^0 and T′ (Remark 5.1, Lemma 6.1(2)).
- CCM23, §2.1 and Proposition 2.1.1, p. 6: Defines I^T\_w and IND\_w and the explicit block correspondence between them.
- IKLNDP24, §1.3.2, p. 23; §1.4.1–1.4.2, pp. 24–25: Defines AT\_w, J\_w, J′\_w, the bijection ι, AS\_w, AJ\_w, AJ^1\_w and the bijection ϕ.

<a id="MZ-0-counting-sequences"></a>

### MZ.0.11 The counting sequences d(w), s(w), t(w) and c(w)

Node `MZ.0/counting-sequences`, a definition.

**Statement.** For a prime power q define, for integers w: d(w) = 0 for w &lt; 0, d(0) = 1, d(w) = 2^{w−1} for 1 ≤ w &lt; q, d(q) = 2^{q−1} − 1 and d(w) = Σ\_{i=1}^{q} d(w − i) for w > q; s(w) = (q − 1)q^{w−1} for 1 ≤ w &lt; q, s(q) = (q − 1)(q^{q−1} − 1), s(w) = (q − 1)Σ\_{i=1}^{q−1} s(w − i) + s(w − q) for w > q (with s(0) = 1 and s(w) = 0 for w &lt; 0 in the recursion); t(w) = (q − 1)q^{w−1} for 1 ≤ w &lt; q, t(q) = (q − 1)(q^{q−1} − 1), t(w) = (q − 1)Σ\_{i=1}^{q} t(w − i) for w > q; s(0) = t(0) = 1; and c(0) = 1, c(w) = 0 for w &lt; 0, c(w) = Σ\_{i=1}^{q−1} c(w − i) for w ≥ 1, the number of compositions of w with parts &lt; q (this count is ours; Ngo Dac writes d^0(w) = |T^0\_w|).

**Hypotheses.** q ≥ 2.

**Proof sketch.**

1. Each sequence is defined by strong recursion on w.
2. For w ≠ 0, q the recursion d(w) = Σ\_{i=1}^{q} d(w − i) holds with the conventions d(0) = 1, d(w &lt; 0) = 0 (Ngo Dac §1.2).

**Uses.**

- MZ.0/counting: the cardinalities of the index families are these sequences
- MZ.5/thakur-basis-theorem and MZ.5/amzv-dimension: the dimensions are d(w) and s(w)

**API.**

- `FunctionFieldMZV.thakurDim` (data): d(w).
- `FunctionFieldMZV.altDim` (data): s(w).
- `FunctionFieldMZV.altThakurCount` (data): t(w).
- `FunctionFieldMZV.smallCount` (data): c(w).
- `FunctionFieldMZV.thakurDim_rec` (relation): d(w) = Σ\_{i=1}^{q} d(w − i) for every w ≠ 0, q (with d(n) = 0 for n &lt; 0).
- `FunctionFieldMZV.thakurDim_two` (example): For q = 2, d(w + 2) = d(w + 1) + d(w) for w ≥ 1.

**Unit tests.**

- `FunctionFieldMZV.thakurDim_test_q2` (computation): For q = 2, d(1), …, d(5) = 1, 1, 2, 3, 5.
- `FunctionFieldMZV.thakurDim_test_q3` (computation): For q = 3, d(4) = 6 and s(4) = 46.
- `FunctionFieldMZV.thakurDim_test_q` (degenerate): d(q) = 2^{q−1} − 1, one less than the 2^{q−1} compositions of q, since (q) is excluded.
- `FunctionFieldMZV.altDim_test_ne` (non-example): s(w) ≠ t(w) in general: for q = 3, t(4) = 2(t(3) + t(2) + t(1)) = 48 while s(4) = 46.

**Acceptance.** For q = 2, d(w) is the Fibonacci sequence 1, 1, 2, 3, 5, … (w = 1, 2, …); for q = 3, d(1), …, d(4) = 1, 2, 3, 6 and s(1), …, s(4) = 2, 6, 16, 46.

**Needs.** .

**Sources.**

- ND21, Conjecture 1.5 and the remark after it, p. 3; Theorem B, p. 3 (d^0(w) = |T^0\_w|): Defines d(w) with its initial values and the q-term recursion, and the count of the small-entry family.
- CCM23, Conjecture 1.2.2, p. 3: Defines d′\_w by the same initial values and recursion.
- IKLNDP24, Theorem A, p. 4; §1.3.2, pp. 23–24 (t(w)); §1.4.2, pp. 24–25 (s(w)): Defines s(w) and t(w) by their initial values and recursions.

<a id="MZ-0-counting"></a>

### MZ.0.12 Counting Thakur and Hoffman index sets

Node `MZ.0/counting`, a theorem.

**Statement.** For every w ≥ 0: |I^T\_w| = |IND\_w| = d(w), |I^0\_w| = c(w), |AT\_w| = t(w), and |AS\_w| = |AJ^1\_w| = s(w).

**Hypotheses.** q ≥ 2.

**Proof sketch.**

1. Split an element of IND\_w by its first entry: 1 ≤ s\_1 ≤ q − 1 leaves an element of IND\_{w−s\_1}, and s\_1 > q gives (s\_1 − q, s\_2, …) ∈ IND\_{w−q}; so |IND\_w| = Σ\_{i=1}^{q} |IND\_{w−i}| for w > q, with the initial values counted directly (Ngo Dac Lemma 6.1(1)).
2. ι is a bijection IND\_w → I^T\_w (MZ.0/index-families).
3. AS\_w has (q − 1)^{dep(s)} arrays over each s ∈ IND\_w; splitting by the first entry gives the s(w) recursion, and ϕ identifies AS\_w with AJ^1\_w; AT\_w is counted the same way, the first entry q now carrying q − 1 characters.

**Acceptance.** For q = 3 and w = 4 the counts are 6, 6, 46 and 48 for I^T, IND, AS and AT.

**Needs.** `MZ.0/index-families`, `MZ.0/counting-sequences`.

**Sources.**

- ND21, Lemma 6.1(1) and its proof, p. 22: Proves |T\_w| = |T′\_w| by showing |T′\_w| satisfies the same recursion.
- CCM23, Proposition 2.1.1, p. 6; Remark after Conjecture 1.2.3, p. 3: Gives the bijection IND\_w ↔ I^T\_w and notes |I^T\_w| = d′\_w.
- IKLNDP24, §1.3.2, pp. 23–24; §1.4.2, pp. 24–25: Computes t(w) = |AT\_w| and s(w) = |AS\_w| = |AJ^1\_w| through ϕ.

<a id="MZ-0-zeta-q-minus-one"></a>

### MZ.0.13 Carlitz’s evaluation of ζ\_A(q − 1)

Node `MZ.0/zeta-q-minus-one`, a theorem.

**Statement.** With π̃ = 1/Ω(θ) the Carlitz period of DM.2 and D\_1 = θ^q − θ, ζ\_A(q − 1) = Li(q − 1) = −π̃^{q−1}/D\_1. The right side does not depend on the chosen (q − 1)-th root of −θ, since π̃^{q−1} ∈ K\_∞ (DM.2/period-power). More generally z/e\_C(z) = 1 + Σ\_{m ≥ 1, (q−1) | m} ζ\_A(m)(z/π̃)^m near z = 0.

**Hypotheses.** e\_C the Carlitz exponential with kernel π̃A (DM.2).

**Proof sketch.**

1. By DM.2/lattice-exponential applied to the lattice π̃A (DM.2/carlitz-period), e\_C(z) = z∏\_{0 ≠ a ∈ A}(1 − z/(aπ̃)).
2. e\_C is F\_q-linear with derivative 1, so the logarithmic derivative gives 1/e\_C(z) = 1/z + Σ\_{a ≠ 0} 1/(z − aπ̃) = 1/z − Σ\_{n ≥ 1} z^{n−1} Σ\_{a ≠ 0}(aπ̃)^{−n}.
3. Writing a = cb with c ∈ F\_q^× and b monic, Σ\_{a ≠ 0} a^{−n} = (Σ\_{c ∈ F\_q^×} c^{−n}) ζ\_A(n), and Σ\_{c} c^{−n} is −1 if (q − 1) | n and 0 otherwise (Mathlib FiniteField.sum\_pow\_units); this gives the generating identity.
4. Since e\_C(z) = z + z^q/D\_1 + O(z^{q²}), z/e\_C(z) = 1 − z^{q−1}/D\_1 + O(z^{2(q−1)}); comparing the coefficient of z^{q−1} gives ζ\_A(q − 1)/π̃^{q−1} = −1/D\_1.
5. ζ\_A(q − 1) = Li(q − 1) by MZ.0/carlitz-identity, since q − 1 ≤ q.

**Acceptance.** For q = 2, ζ\_A(1) = −π̃/(θ² + θ), and for q = 3, ζ\_A(2) = −π̃²/(θ³ − θ); both were checked in the Laurent expansion in 1/θ against π̃^{q−1} = −θ^q∏\_{i ≥ 1}(1 − θ^{1−q^i})^{−(q−1)}.

**Needs.** `MZ.0/multiple-zeta-value`, `MZ.0/carlitz-identity`, `DM.2/lattice-exponential`, `DM.2/carlitz-period`, `DM.2/carlitz-exponential`, `DM.2/period-power`, `mathlib:FiniteField.sum_pow_units`.

**Sources.**

- IKLNDP24, proof of Theorem 3.4, last step, p. 42: Uses Li(q − 1) = ζ\_A(q − 1) = −D\_1^{−1}π̃^{q−1} to produce a relation between π̃^w and ACMPL values.
- CCM23, proof of Theorem 5.2.1, p. 25: Uses an element P\_w supported on IND\_w with Li\_{P\_w}(1) = π̃^w when (q − 1) | w, obtained from Theorem 3.2.6; this needs π̃^w ∈ Z\_w, which the paper leaves implicit and which follows from this evaluation and the graded product (MZ.1/period-power-in-weight-space).

**Planet:** Carlitz evaluation of ζ\_A(q − 1).

<a id="MZ-0-eulerian"></a>

### MZ.0.14 Eulerian values

Node `MZ.0/eulerian`, a definition.

**Statement.** An element z ∈ C\_∞ is Eulerian of weight w ≥ 1 if z ∈ K·π̃^w; this is independent of the choice of the period, which changes by a factor in F\_q^× (DM.2/carlitz-period). Since v\_∞(π̃) = −q/(q − 1), the valuation of π̃^w is an integer iff (q − 1) | w. Hence, if (q − 1) ∤ w, no nonzero element of C\_const := ⋃\_{n ≥ 1} F\_{q^n}((1/θ)) ⊂ C\_∞ (which contains K\_∞) has the form cπ̃^w with c ∈ F̄\_q(θ); in particular a nonzero element of K\_∞ is never Eulerian of weight w. (With coefficients c ∈ K̄ the analogue fails: (−θ)^{−w/(q−1)}π̃^w lies in K\_∞.)

**Hypotheses.** π̃ from DM.2; v\_∞ extended to C\_∞.

**Proof sketch.**

1. |π̃|\_∞ = q^{q/(q−1)} (DM.2/carlitz-period), so v\_∞(π̃^w) = −wq/(q − 1), an integer iff (q − 1) | wq iff (q − 1) | w, as gcd(q, q − 1) = 1.
2. Elements of F̄\_q(θ)^× and of C\_const^× have integer valuations, so cπ̃^w ∈ C\_const with c ≠ 0 forces v\_∞(π̃^w) ∈ Z.
3. π̃ ∈ ρ·K\_∞^× with ρ^{q−1} = −θ (from the product formula of DM.2/carlitz-period), which shows that the restriction on the coefficient field cannot be dropped.
4. C\_const denotes the union of the finite constant-field Laurent series fields; no identification with the full Laurent series field over F̄\_q is needed.

**Uses.**

- MZ.3/eulerian-tails: isolated suffix combinations are Eulerian, forcing divisibility of their weights by q − 1
- MZ.4/key-lemma: the hypothesis Li\_P(1) ∈ K·π̃^w
- MZ.5/acmpl-period-relations: a relation with nonzero constant term forces (q − 1) | w

**API.**

- `FunctionFieldMZV.IsEulerian` (data): z is Eulerian of weight w: z ∈ K·π̃^w.
- `FunctionFieldMZV.IsEulerian.dvd` (characterisation): If c ∈ F̄\_q(θ)^× and cπ̃^w ∈ C\_const, then (q − 1) | w; in particular a nonzero Eulerian element of K\_∞ of weight w has (q − 1) | w.
- `FunctionFieldMZV.IsEulerian.smul` (other): Eulerian elements of weight w form a K-subspace of C\_∞.
- `FunctionFieldMZV.isEulerian_zeta_q_sub_one` (example): ζ\_A(q − 1) is Eulerian of weight q − 1.

**Unit tests.**

- `FunctionFieldMZV.IsEulerian_test_zeta` (computation): ζ\_A(q − 1) = −D\_1^{−1}π̃^{q−1} is Eulerian of weight q − 1.
- `FunctionFieldMZV.IsEulerian_test_zero` (degenerate): 0 is Eulerian of every weight.
- `FunctionFieldMZV.IsEulerian_test_weight_one` (non-example): For q > 2, ζ\_A(1) is not Eulerian of weight 1, since π̃ ∉ K\_∞.
- `FunctionFieldMZV.IsEulerian_test_q2` (computation): For q = 2, ζ\_A(1) = −π̃/D\_1 is Eulerian of weight 1.

**Acceptance.** ζ\_A(q − 1) is Eulerian of weight q − 1; for q = 2 every weight is divisible by q − 1.

**Needs.** `DM.2/carlitz-period`, `DM.2/period-power`, `MZ.0/zeta-q-minus-one`.

**Sources.**

- CCM23, Lemma 5.1.1, second hypothesis, p. 22, and the end of its proof, p. 24: Calls Li\_P(1) Eulerian when it lies in k·π̃^w and uses π̃ ∈ (−θ)^{1/(q−1)}·k\_∞^× to deduce (q − 1) | w from rationality.
- IKLNDP24, §3.3, opening, p. 36: Notes π̃^w ∉ C\_const when q − 1 ∤ w, which kills the constant term of a relation.
- CHANG14, Corollary 2.3.3 and Corollary 5.5.5, pp. 6 and 19: Defines the Eulerian dichotomy for MZVs and shows that K̄-Eulerian MZVs are K-Eulerian.

## MZ.1. The q-shuffle and harmonic products

**Layer targets.**

Targets.

- Chen's coefficients Δ^{\[j\]}\_{a,b} = (−1)^{a−1}binom(j−1, a−1) + (−1)^{b−1}binom(j−1, b−1) for (q − 1) | j and 0 &lt; j &lt; a + b, zero otherwise, and Chen's formula S\_d(a)S\_d(b) = S\_d(a + b) + Σ\_j Δ^{\[j\]}\_{a,b} S\_d(a + b − j, j) for every d ∈ Z, with Harada's alternating form; the low-weight vanishing Δ = 0 when a + b ≤ q.
- The weight-graded K-space H with basis the indices, the multilinear bracket, the box-plus operator, the harmonic product ∗ (stuffle) and Thakur's q-shuffle product ∗^ζ with Chen's correction term D^ζ\_{s,n}; depth bounds for the products.
- The realisation maps 𝔏^•\_d, 𝔏^•\_{&lt;d} : H → K and 𝔏^• : H → K\_∞ (• ∈ {Li, ζ}) with 𝔏^{Li}(s) = Li(s) and 𝔏^ζ(s) = ζ\_A(s), and the theorem that they are multiplicative for ∗ and ∗^ζ respectively (Chang–Chen–Mishiba Proposition 2.3.5).
- Controlled product expansions of S\_d S\_d, S\_{&lt;d} S\_{&lt;d} and S\_d S\_{&lt;d} for arrays in both realisations, with coefficients in F\_p (resp. F\_q), terms ≤ the sum array and depth at most the sum of depths (Ngo Dac Proposition 2.1; Im–Kim–Le–Ngo Dac–Pham Propositions 1.3 and 4.2).
- Z = Σ\_w Z\_w, AZ, L and AL are K-algebras graded by weight, and π̃^{m(q−1)} = (−D\_1)^m ζ\_A(q − 1)^m lies in Z\_{m(q−1)} ∩ L\_{m(q−1)}.

Acceptance: ζ\_A(1)² = ζ\_A(2) + 2ζ\_A(1, 1) for every q; for q = 2, Δ^{\[1\]}\_{1,2} = 1 and Δ^{\[2\]}\_{1,2} = 0, so S\_d(1)S\_d(2) = S\_d(3) + S\_d(2, 1) and ζ\_A(1)ζ\_A(2) = ζ\_A(3) + ζ\_A(1, 2); for q = 3, S\_d(2)² = S\_d(4) + S\_d(2, 2); the harmonic square \[1\] ∗ \[1\] = 2\[1, 1\] + \[2\].

**Inputs from other layers:** `MZ.0`.

<a id="MZ-1-chen-coefficient"></a>

### MZ.1.1 Chen’s correction coefficients

Node `MZ.1/chen-coefficient`, a definition.

**Statement.** For positive integers a, b and 1 ≤ j &lt; a + b, Δ^{\[j\]}\_{a,b} = (−1)^{a−1}binom(j − 1, a − 1) + (−1)^{b−1}binom(j − 1, b − 1) ∈ F\_p when (q − 1) | j, and Δ^{\[j\]}\_{a,b} = 0 otherwise (binomial coefficients with a negative lower entry or lower entry above the upper are zero). Δ^{\[j\]}\_{a,b} = Δ^{\[j\]}\_{b,a}, and Δ^{\[j\]}\_{a,b} = 0 for all j when a + b ≤ q.

**Hypotheses.** q = p^e; the coefficients are reduced modulo p.

**Proof sketch.**

1. Symmetry is visible from the formula.
2. If a + b ≤ q, the only j &lt; a + b divisible by q − 1 is j = q − 1 with a + b = q; then binom(q − 2, a − 1) = binom(q − 2, b − 1) and the signs (−1)^{a−1}, (−1)^{b−1} are opposite when q is odd (a + b = q odd), while for q even 2 = 0; so the coefficient vanishes.

**Uses.**

- MZ.1/chen-product: the correction terms of the equal-degree product
- MZ.1/index-algebra: the correction term D^ζ\_{s,n} of the q-shuffle product

**API.**

- `FunctionFieldMZV.chenCoeff` (data): Δ^{\[j\]}\_{a,b} as an element of F\_p (or of ZMod p).
- `FunctionFieldMZV.chenCoeff_comm` (relation): Δ^{\[j\]}\_{a,b} = Δ^{\[j\]}\_{b,a}.
- `FunctionFieldMZV.chenCoeff_eq_zero_of_add_le` (simp): Δ^{\[j\]}\_{a,b} = 0 for every j when a + b ≤ q.
- `FunctionFieldMZV.chenCoeff_eq_zero_of_not_dvd` (simp): Δ^{\[j\]}\_{a,b} = 0 unless (q − 1) | j and 0 &lt; j &lt; a + b.

**Unit tests.**

- `FunctionFieldMZV.chenCoeff_test_q2` (computation): For q = 2, Δ^{\[1\]}\_{1,2} = 1 and Δ^{\[2\]}\_{1,2} = 0.
- `FunctionFieldMZV.chenCoeff_test_q3` (computation): For q = 3, Δ^{\[2\]}\_{2,2} = 1 in F\_3.
- `FunctionFieldMZV.chenCoeff_test_small` (degenerate): Δ^{\[q−1\]}\_{1,q−1} = 0, the case a + b = q.
- `FunctionFieldMZV.chenCoeff_test_index` (non-example): The condition (q − 1) | j cannot be dropped: for q = 3, Δ^{\[1\]}\_{1,2} = 0 although the binomial expression (−1)^0 binom(0, 0) + (−1)^1 binom(0, 1) equals 1.

**Acceptance.** For q = 2, Δ^{\[1\]}\_{1,2} = 1 and Δ^{\[2\]}\_{1,2} = 0; for q = 3, Δ^{\[2\]}\_{2,2} = −2 = 1.

**Needs.** `MZ.0/index`, `mathlib:Nat.choose`.

**Sources.**

- ND21, §2.1, display after (2.1), p. 6: Gives Chen’s explicit coefficients with the divisibility condition on i and the range 0 &lt; i &lt; a + b.
- CCM23, §2.3, (2.3.2), p. 9; Remark 2.3.4, p. 9: Restates the coefficients Δ^{\[j\]}\_{s,n} (with the divisibility misprinted on k, source issue E3) and their vanishing when s + n ≤ q.
- IKLNDP24, §4.1.1, (4.2), p. 44: Restates the same coefficients for Harada’s alternating product formula.

<a id="MZ-1-chen-product"></a>

### MZ.1.2 Chen’s equal-degree product formula

Node `MZ.1/chen-product`, a theorem.

**Statement.** For positive integers a, b and every d ∈ Z, S\_d(a)S\_d(b) = S\_d(a + b) + Σ\_{0&lt;j&lt;a+b} Δ^{\[j\]}\_{a,b} S\_d(a + b − j, j). With characters, S\_d(ε; a)S\_d(ε′; b) = S\_d(εε′; a + b) + Σ\_j Δ^{\[j\]}\_{a,b} S\_d(εε′, 1; a + b − j, j) (Harada). In particular S\_d(a)S\_d(b) = S\_d(a + b) when a + b ≤ q.

**Hypotheses.** a, b ≥ 1; ε, ε′ ∈ F\_q^×.

**Proof sketch.**

1. For d &lt; 0 both sides vanish; for d = 0 there are no off-diagonal pairs and the depth-two sums vanish.
2. For d ≥ 1 write S\_d(a)S\_d(b) as a sum over pairs (u, v) of monic degree-d polynomials; the diagonal u = v gives S\_d(a + b).
3. For u ≠ v set h = u − v, so 0 ≠ h has degree &lt; d and both (u, h) and (v, h) parametrise the off-diagonal pairs; partial fractions give 1/(u^a v^b) = Σ\_{m=1}^{a} (−1)^b binom(a + b − m − 1, b − 1)/(u^m h^{a+b−m}) + Σ\_{m=1}^{b} (−1)^{b−m} binom(a + b − m − 1, a − 1)/(v^m h^{a+b−m}), an integer identity valid in every characteristic.
4. Every nonzero h of degree &lt; d is uniquely cg with c ∈ F\_q^× and g monic, so Σ\_{0 ≠ h, deg h &lt; d} h^{−j} = −S\_{&lt;d}(j) when (q − 1) | j and 0 otherwise (Mathlib FiniteField.sum\_pow\_units). Writing j = a + b − m for the exponent of h, the u-sum and the v-sum combine (using that j is even when q is odd, so the signs match) into exactly Δ^{\[j\]}\_{a,b}S\_d(a + b − j)S\_{&lt;d}(j) = Δ^{\[j\]}\_{a,b}S\_d(a + b − j, j).
5. Characters: every monic of degree d carries ε^d, ε′^d, giving the factor (εε′)^d on both sides; the low-weight case is MZ.1/chen-coefficient.

**Acceptance.** For q = 2, S\_d(1)S\_d(2) = S\_d(3) + S\_d(2, 1), and for q = 3, S\_d(2)² = S\_d(4) + S\_d(2, 2) (both checked for d ≤ 2). S\_d(1)² = S\_d(2) for every q.

**Needs.** `MZ.1/chen-coefficient`, `MZ.0/power-sum`, `mathlib:FiniteField.sum_pow_units`.

**Sources.**

- ND21, §2.1, (2.1) and the display after it, p. 6; Remark 2.2(2), p. 8: States the equal-degree product with Chen’s coefficients for every d ∈ Z and the special case a + b ≤ q.
- CCM23, §2.3, (2.3.2), p. 9: States Chen’s formula for the power sums 𝔏^ζ\_d.
- IKLNDP24, §4.1.1, (4.1)–(4.2) and Remark 4.1, pp. 43–44: States Harada’s alternating version with character εε′ and the trivial case s + t ≤ q.

**Planet:** Chen’s product formula.

<a id="MZ-1-index-algebra"></a>

### MZ.1.3 The index space with its harmonic and q-shuffle products

Node `MZ.1/index-algebra`, a construction.

**Statement.** H = ⊕\_{w ≥ 0} H\_w is the K-vector space with basis the set I of indices (including ∅), graded by weight, with \[s\] the basis element of s and Supp(P) the indices with nonzero coefficient. The multilinear bracket \[P\_1, …, P\_ℓ\] extends concatenation (so \[s, 0\] = 0 while \[s, ∅\] = \[s\]). The box-plus map ⊞ : H × H → H is bilinear with ∅ ⊞ P = P ⊞ ∅ = 0 and s ⊞ n = (s\_+, s\_r + n\_1, n\_−). The harmonic product ∗ = ∗^{Li} is the bilinear map with \[∅\] ∗ P = P ∗ \[∅\] = P and \[s\] ∗ \[n\] = \[s\_1, s\_− ∗ n\] + \[n\_1, s ∗ n\_−\] + \[s\_1 + n\_1, s\_− ∗ n\_−\]; the q-shuffle product ∗^ζ has the same unit and recursion plus the correction D^ζ\_{s,n} = Σ\_{j=1}^{s\_1+n\_1−1} Δ^{\[j\]}\_{s\_1,n\_1}\[s\_1 + n\_1 − j, (j) ∗^ζ (s\_− ∗^ζ n\_−)\] (D^{Li} := 0). Both products are commutative, preserve weight, and every u ∈ Supp(s ∗^• n) has max(dep s, dep n) ≤ dep u ≤ dep s + dep n.

**Hypotheses.** Coefficients in K; Δ from MZ.1/chen-coefficient.

**Proof sketch.**

1. Both products are defined by recursion on dep(s) + dep(n); the correction term only calls products of smaller total depth.
2. Weight homogeneity and the depth bounds follow by induction on dep(s) + dep(n) (Chang–Chen–Mishiba Proposition A.1.1, Corollary A.1.2).
3. Commutativity follows from the symmetry of the recursion and of Δ^{\[j\]}\_{a,b}.
4. If s\_1 + n\_1 ≤ q then D^ζ\_{s,n} = 0, so the two products agree on indices with all entries summing below q at each step.

**Uses.**

- Chang–Chen–Mishiba, Proposition 2.3.5: the realisation maps are multiplicative for these products
- Chang–Chen–Mishiba, Definition 3.2.2: the operators α\_q and U^• are built from ∗^•, ⊞ and the bracket
- Chang–Chen–Mishiba, Appendix A.3: the operators B^•\_s, C^•\_s on binary relations use ∗^• and D^•

**API.**

- `FunctionFieldMZV.IndexSpace` (data): H = ⊕\_w H\_w with basis the indices.
- `FunctionFieldMZV.IndexSpace.bracket` (constructor): The multilinear concatenation \[P\_1, …, P\_ℓ\].
- `FunctionFieldMZV.IndexSpace.boxPlus` (constructor): s ⊞ n = (s\_+, s\_r + n\_1, n\_−), ∅ ⊞ P = 0.
- `FunctionFieldMZV.IndexSpace.harmonic` (structure): The harmonic product ∗.
- `FunctionFieldMZV.IndexSpace.qShuffle` (structure): The q-shuffle product ∗^ζ with correction D^ζ.
- `FunctionFieldMZV.IndexSpace.harmonic_comm` (relation): P ∗ Q = Q ∗ P, and likewise for ∗^ζ.
- `FunctionFieldMZV.IndexSpace.mul_weight` (relation): H\_w ∗^• H\_{w′} ⊂ H\_{w+w′}.
- `FunctionFieldMZV.IndexSpace.depth_bounds` (relation): max(dep s, dep n) ≤ dep u ≤ dep s + dep n for u in Supp(s ∗^• n).
- `FunctionFieldMZV.IndexSpace.correction_eq_zero` (simp): D^ζ\_{s,n} = 0 when s\_1 + n\_1 ≤ q.

**Unit tests.**

- `FunctionFieldMZV.IndexSpace.test_harmonic` (computation): \[1\] ∗ \[1\] = 2\[1, 1\] + \[2\].
- `FunctionFieldMZV.IndexSpace.test_unit` (degenerate): \[∅\] ∗^• P = P for both products.
- `FunctionFieldMZV.IndexSpace.test_shuffle_q2` (computation): For q = 2, \[1\] ∗^ζ \[2\] = \[1, 2\] + \[3\].
- `FunctionFieldMZV.IndexSpace.test_boxplus` (non-example): (n) ⊞ P is not \[n\] + P: (2) ⊞ \[1, 1\] = \[3, 1\].

**Acceptance.** \[1\] ∗ \[1\] = 2\[1, 1\] + \[2\]; for q = 2, \[1\] ∗^ζ \[2\] = \[1, 2\] + \[2, 1\] + \[3\] + \[2, 1\] = \[1, 2\] + \[3\] (characteristic 2 coefficients).

**Needs.** `MZ.0/index`, `MZ.1/chen-coefficient`, `mathlib:Finsupp`.

**Sources.**

- CCM23, §2.1, Definition 2.1.4 and Remark 2.1.5, pp. 6–7; §2.3, pp. 8–9; Definition 3.1.1 and Remark 3.1.2, pp. 10–11; Proposition A.1.1 and Corollary A.1.2, pp. 26–27: Defines H, the bracket, the harmonic and q-shuffle products with the correction D^ζ, the box-plus operator, the weight grading and the depth bounds for products and corrections.

<a id="MZ-1-realisation-maps"></a>

### MZ.1.4 The realisation maps

Node `MZ.1/realisation-maps`, a construction.

**Statement.** For • ∈ {Li, ζ}, put S^{Li}\_d(s) = ℓ\_d^{−s} and S^ζ\_d(s) = S\_d(s) (d ≥ 0). The K-linear maps 𝔏^•\_d, 𝔏^•\_{&lt;d} : H → K and 𝔏^• : H → K\_∞ are given on indices of positive depth by the sums of S^•\_{d\_1}(s\_1)⋯S^•\_{d\_r}(s\_r) over d = d\_1 > ⋯ > d\_r ≥ 0 (requiring d ≥ dep(s) − 1), over d > d\_1 > ⋯ > d\_r ≥ 0, and over all d\_1 > ⋯ > d\_r ≥ 0; on ∅, 𝔏^•\_d(∅) = 1 iff d = 0, 𝔏^•(∅) = 1, and 𝔏^•\_{&lt;d}(∅) = 1 for every d ∈ Z (source issue E1). Then 𝔏^•\_d = 𝔏^•\_{&lt;d+1} − 𝔏^•\_{&lt;d} on positive-depth indices, 𝔏^• = lim\_d 𝔏^•\_{&lt;d}, 𝔏^•\_d(s)𝔏^•\_{&lt;d}(P) = 𝔏^•\_d(\[s, P\]) for s ≥ 1, 𝔏^{Li}(s) = Li(s) and 𝔏^ζ(s) = ζ\_A(s).

**Hypotheses.** H from MZ.1/index-algebra.

**Proof sketch.**

1. The sums are finite for 𝔏\_d, 𝔏\_{&lt;d} and converge in K\_∞ for 𝔏 by MZ.0/multiple-zeta-value and MZ.0/carlitz-multiple-polylogarithm.
2. The listed identities are rearrangements of these sums; the tail identity uses the empty-truncation convention.

**Uses.**

- Chang–Chen–Mishiba, Theorem 3.2.4: U^• preserves 𝔏^•
- Chang–Chen–Mishiba, Appendix A.2: binary relations are pairs (P, Q) with 𝔏^•\_d(P) + 𝔏^•\_{d+1}(Q) = 0
- Chang–Chen–Mishiba, Theorem 5.4.2: all relations are the kernel of 𝔏^ζ on H\_w

**API.**

- `FunctionFieldMZV.realiseFixed` (data): 𝔏^•\_d : H → K.
- `FunctionFieldMZV.realiseLT` (data): 𝔏^•\_{&lt;d} : H → K.
- `FunctionFieldMZV.realise` (data): 𝔏^• : H → K\_∞.
- `FunctionFieldMZV.realise_eq_lim` (characterisation): 𝔏^•(P) = lim\_{d → ∞} 𝔏^•\_{&lt;d}(P).
- `FunctionFieldMZV.realiseFixed_bracket` (simp): 𝔏^•\_d(s)𝔏^•\_{&lt;d}(P) = 𝔏^•\_d(\[s, P\]) for s ≥ 1.
- `FunctionFieldMZV.realise_zeta` (compatibility): 𝔏^ζ(s) = ζ\_A(s) and 𝔏^{Li}(s) = Li(s).

**Unit tests.**

- `FunctionFieldMZV.realise_test_empty` (degenerate): 𝔏^•(∅) = 1 and 𝔏^•\_d(∅) = 0 for d ≠ 0.
- `FunctionFieldMZV.realise_test_agree` (compatibility): 𝔏^{Li}(s) = 𝔏^ζ(s) for s = (1, 2) and q ≥ 2.
- `FunctionFieldMZV.realise_test_disagree` (non-example): For q = 3, 𝔏^{Li}(4) ≠ 𝔏^ζ(4).
- `FunctionFieldMZV.realise_test_depth` (computation): 𝔏^•\_0(s) = 0 for every s of depth ≥ 2.

**Acceptance.** 𝔏^ζ\_d(s) = 𝔏^{Li}\_d(s) whenever all entries of s are ≤ q (MZ.0/carlitz-identity).

**Needs.** `MZ.1/index-algebra`, `MZ.0/power-sum`, `MZ.0/multiple-zeta-value`, `MZ.0/carlitz-multiple-polylogarithm`.

**Sources.**

- CCM23, Definition 2.2.2 and the identities after it, pp. 7–8: Defines 𝔏^•\_d, 𝔏^•\_{&lt;d}, 𝔏^• for • ∈ {Li, ζ} and lists the identities relating them, including 𝔏^{Li}(s) = Li\_s(1) and 𝔏^ζ(s) = ζ\_A(s).

<a id="MZ-1-realisations-multiplicative"></a>

### MZ.1.5 The realisations are algebra homomorphisms

Node `MZ.1/realisations-multiplicative`, a theorem.

**Statement.** For • ∈ {Li, ζ}, all P, Q ∈ H, all positive-depth indices s, n and every d ∈ Z: 𝔏^•(P)𝔏^•(Q) = 𝔏^•(P ∗^• Q); 𝔏^•\_{&lt;d}(P)𝔏^•\_{&lt;d}(Q) = 𝔏^•\_{&lt;d}(P ∗^• Q); and 𝔏^•\_d(s)𝔏^•\_d(n) = 𝔏^•\_d(\[s\_1 + n\_1, s\_− ∗^• n\_−\]) + 𝔏^•\_d(D^•\_{s,n}). Thus ∗ realises the stuffle relations of CMPL values and ∗^ζ realises Thakur’s q-shuffle relations of MZVs.

**Hypotheses.** Products and realisations from MZ.1/index-algebra and MZ.1/realisation-maps.

**Proof sketch.**

1. The fixed-degree formula reduces to depth one: for • = Li, ℓ\_d^{−s\_1}ℓ\_d^{−n\_1} = ℓ\_d^{−(s\_1+n\_1)}; for • = ζ, MZ.1/chen-product.
2. The truncated formula is proved by induction on d, splitting 𝔏^•\_{&lt;d}(s)𝔏^•\_{&lt;d}(n) according to which leading degree is larger, using the fixed formula for equal leading degrees and the induction hypothesis for the tails.
3. The value formula follows by letting d → ∞.
4. At d = 0 the tail factor must be read with 𝔏^•\_{&lt;0}(∅) = 1 (source issue E1); the identities themselves hold as stated.

**Acceptance.** 𝔏^ζ((1))² = 𝔏^ζ(2\[1, 1\] + \[2\]), i.e. ζ\_A(1)² = ζ\_A(2) + 2ζ\_A(1, 1).

**Needs.** `MZ.1/index-algebra`, `MZ.1/realisation-maps`, `MZ.1/chen-product`.

**Sources.**

- CCM23, Proposition 2.3.5 and its proof, pp. 9–10: Proves the three identities for both realisations by induction on d from Chen’s formula and the trivial stuffle formula for 1/L\_d.
- THAKUR10, Theorem 3, p. 1978: Proves that products of power sums and of MZVs are F\_p-combinations preserving weight and the depth filtration (the higher-depth induction is corrected in the author’s updates).

**Planet:** Realisations are algebra maps.

<a id="MZ-1-power-sum-products"></a>

### MZ.1.6 Controlled product expansions of power sums

Node `MZ.1/power-sum-products`, a theorem.

**Statement.** For arrays (ε; s), (ε′; t) there are finitely many coefficients and arrays, independent of d, such that for every d ∈ Z: (1) S\_d(ε; s)S\_d(ε′; t) = Σ f\_i S\_d(μ\_i; u\_i), (2) S\_{&lt;d}(ε; s)S\_{&lt;d}(ε′; t) = Σ f′\_i S\_{&lt;d}(μ′\_i; u′\_i), (3) S\_d(ε; s)S\_{&lt;d}(ε′; t) = Σ f″\_i S\_d(μ″\_i; u″\_i), with coefficients in F\_p for indices (trivial characters; Thakur, Ngo Dac) and in F\_q for arrays (as Im–Kim–Le–Ngo Dac–Pham state; the same induction gives F\_p), every array ≤ (ε; s) + (ε′; t) in the preorder of MZ.0/index (so of the same character and weight) and of depth ≤ dep(s) + dep(t); the same holds for Si in place of S, where the expansion is the stuffle expansion. For trivial characters and nonempty a, the mixed expansion has the form S\_d(a)S\_{&lt;d}(b) = Σ f″\_i S\_d(a\_1, c\_i) with c\_i ≤ a\_− + b.

**Hypotheses.** Arrays of positive depth; characters in F\_q^×.

**Proof sketch.**

1. Induct on dep(s) + dep(t) as in Thakur 2010 Theorem 3 (with the corrected induction) and Ngo Dac Proposition 2.1: the base case is MZ.1/chen-product (for S) or the identity Si\_d(ε; s)Si\_d(ε′; t) = Si\_d(εε′; s + t) (for Si). The author’s correction, credited to Shuhui Shi (source issue E23), proves the mixed identity first at each depth, then the equal-degree identity; use that order.
2. For (1) factor off the leading entries and expand the tails by (2); for (2) split by the larger leading degree; (3) follows from (2).
3. Each step preserves character and weight and keeps the prefix sums dominated, using the calculus of MZ.0/index.

**Acceptance.** For q = 3, S\_1(1)S\_1(1) = S\_1(2).

**Needs.** `MZ.0/index`, `MZ.0/power-sum`, `MZ.1/chen-product`.

**Sources.**

- ND21, Proposition 2.1 and its proof, pp. 6–8; (2.7), p. 8: Proves the controlled expansions of S\_d S\_d and S\_&lt;d S\_&lt;d with c ≤ a + b and the depth bound, and derives the mixed form S\_d(a)S\_&lt;d(b) = Σ f′\_i S\_d(a\_1, c′\_i).
- IKLNDP24, Proposition 1.3 and its proof, pp. 10–14; Proposition 4.2, p. 44: Proves the three expansions for the Si of arrays and quotes Harada’s analogue for the S of arrays, with the preorder and depth bounds.
- THAKUR10, Theorem 3, p. 1978: States the d-independent F\_p-expansion of products of power sums; use the corrected induction in THAKUR-UPDATES for its proof.
- THAKUR-UPDATES, Entry 36, pp. 7–8: Replaces the faulty vector induction in Theorem 3 by simultaneous induction for mixed and equal-degree products.

<a id="MZ-1-value-algebras"></a>

### MZ.1.7 The algebras of zeta and polylogarithm values

Node `MZ.1/value-algebras`, a theorem.

**Statement.** Z = Σ\_w Z\_w, AZ = Σ\_w AZ\_w, L = Σ\_w L\_w and AL = Σ\_w AL\_w are K-subalgebras of K\_∞, and Z\_w Z\_{w′} ⊂ Z\_{w+w′}, AZ\_w AZ\_{w′} ⊂ AZ\_{w+w′}, L\_w L\_{w′} ⊂ L\_{w+w′}, AL\_w AL\_{w′} ⊂ AL\_{w+w′}; the product of two values is an F\_p-combination (F\_q for alternating values) of values of the added weight and of depth at most the sum of the depths.

**Hypotheses.** Weight spaces from MZ.0/weight-spaces.

**Proof sketch.**

1. Sum the expansions of MZ.1/power-sum-products over d: ζ\_A(ε; s)ζ\_A(ε′; t) = Σ\_{d,e}S\_d S\_e splits by d > e, d &lt; e and d = e into values of concatenated or summed arrays.
2. Equivalently apply MZ.1/realisations-multiplicative to \[s\] ∗^• \[n\].

**Acceptance.** ζ\_A(1)² = ζ\_A(2) + 2ζ\_A(1, 1); for q = 2, ζ\_A(1)ζ\_A(2) = ζ\_A(3) + ζ\_A(1, 2) (checked numerically).

**Needs.** `MZ.0/weight-spaces`, `MZ.1/power-sum-products`, `MZ.1/realisations-multiplicative`.

**Sources.**

- THAKUR10, Theorem 3(ii)–(iii), p. 1978: Shows that the product of multizeta values is a weight-preserving, depth-filtered sum of multizeta values, so their F\_p-span is an algebra.
- IKLNDP24, §1.1, after Proposition 1.3, p. 14; §4.1.1, after Proposition 4.2, p. 44: Deduces that AL, L and AZ are K-algebras.
- CCM23, §1.2, p. 2: Records that the k-span Z of all MZVs is an algebra by the q-shuffle relations.

**Planet:** The algebra of multiple zeta values.

<a id="MZ-1-period-power-in-weight-space"></a>

### MZ.1.8 Period powers lie in the weight spaces

Node `MZ.1/period-power-in-weight-space`, a theorem.

**Statement.** For w = m(q − 1) with m ≥ 1, π̃^w = (−D\_1)^m ζ\_A(q − 1)^m = (−D\_1)^m Li(q − 1)^m, and this element lies in Z\_w ∩ L\_w; for w = 0, π̃^0 = 1 ∈ Z\_0 = K.

**Hypotheses.** D\_1 = θ^q − θ.

**Proof sketch.**

1. MZ.0/zeta-q-minus-one gives π̃^{q−1} = −D\_1 ζ\_A(q − 1) = −D\_1 Li(q − 1).
2. Raise to the m-th power and use MZ.1/value-algebras: ζ\_A(q − 1)^m ∈ Z\_{m(q−1)} and Li(q − 1)^m ∈ L\_{m(q−1)}.

**Acceptance.** For q = 2, π̃^w ∈ Z\_w for every w ≥ 1.

**Needs.** `MZ.0/zeta-q-minus-one`, `MZ.1/value-algebras`.

**Sources.**

- CCM23, proof of Theorem 5.2.1, p. 25: Uses an element P\_w supported on IND\_w with Li\_{P\_w}(1) = π̃^w when (q − 1) | w, obtained from Theorem 3.2.6; the needed membership π̃^w ∈ Z\_w is left implicit there and is supplied by this node.
- IKLNDP24, proof of Theorem 3.4, last step, p. 42: Expands Li(q − 1)^m in AS\_w and uses Li(q − 1) = −D\_1^{−1}π̃^{q−1}.

## MZ.2. Binary relations, Todd's operators and the generation theorems

**Layer targets.**

Targets.

- Binary relations of weight w in both realisations (families with Σ a\_i S\_d(s\_i) + Σ b\_i S\_{d+1}(t\_i) = 0 for every d ∈ Z), fixed relations, the spaces BR\_w and P^•\_w, and the summation principle that a binary relation gives a linear relation among the values.
- Thakur's fundamental relation R\_1: S\_d(q) + D\_1 S\_{d+1}(1, q − 1) = 0 for every d, in both realisations, and its alternating form R\_ε.
- Todd's operators B\*, C and the cancellation operator BC\_q (Ngo Dac §2.2; Im–Kim–Le–Ngo Dac–Pham §1.2; Chang–Chen–Mishiba §A.3, with the iterate BC^{•,m}\_q), each sending binary relations to binary relations of the shifted weight, and the controlled form of C\_W(R\_1).
- The reduction step for an index with a first entry exceeding q or a terminal q (Ngo Dac Propositions 2.12–2.13; Im–Kim–Le–Ngo Dac–Pham Propositions 1.7 and 4.6) and the k-admissible reduction with its termination (Ngo Dac Proposition 3.2).
- Brown's theorem in positive characteristic: I^T\_w spans Z\_w and dim\_K Z\_w ≤ d(w) (Ngo Dac Theorem A); the weak Brown theorems for ACMPLs and AMZVs (AT\_w generates AL\_w and AZ\_w) and the bridges AZ\_w = AL\_w and Z\_w = L\_w.
- The rewriting calculus of Chang–Chen–Mishiba: the Thakur decomposition s = (s^T, q^{{m}}, s′), the operators α\_q and U^•, the theorem that U^• preserves both realisations and that an iterate carries every element of H into the span of I^T (Theorem 3.2.4), and the second generating set {Li(s) : s ∈ IND\_w} of Z\_w (Theorem 3.2.6).
- The strong Brown theorem: AS\_w generates AL\_w, so dim\_K AL\_w ≤ s(w), using a t(w) × t(w) coefficient matrix whose rows and columns are indexed by AT\_w and which is diagonal with entries ±1 modulo D\_1; its left-hand values are AS\_w contractions, possibly repeated (Im–Kim–Le–Ngo Dac–Pham Theorem 1.11, with its proof completed).
- The explicit next-weight relation ζ\_A(2q − 1) + D\_1 ζ\_A(1, 2q − 2) = 0.

Acceptance: for q = 2 the algorithm gives ζ\_A(3) = (θ² + θ)²(ζ\_A(1, 1, 1) + ζ\_A(2, 1)); for every q, ζ\_A(q) = −D\_1 ζ\_A(1, q − 1); U^• fixes every index of I^T.

**Inputs from other layers:** `MZ.1`.

<a id="MZ-2-binary-relation"></a>

### MZ.2.1 Binary relations between power sums

Node `MZ.2/binary-relation`, a definition.

**Statement.** Fix a realisation (Thakur power sums S\_d, or Carlitz power sums Si\_d, of arrays). A binary relation of weight w is a pair of finitely supported K-coefficient families (a\_i) on arrays (ε\_i; s\_i) and (b\_j) on arrays (ε′\_j; t\_j), all of weight w, such that Σ\_i a\_i S\_d(ε\_i; s\_i) + Σ\_j b\_j S\_{d+1}(ε′\_j; t\_j) = 0 for every d ∈ Z; it is fixed when every b\_j = 0. They form a K-vector space BR\_w. In the formal setting of MZ.1, P^• = {(P, Q) ∈ H ⊕ H : 𝔏^•\_d(P) + 𝔏^•\_{d+1}(Q) = 0 for all d ∈ Z} and P^•\_w = P^• ∩ (H\_w ⊕ H\_w), both entries homogeneous of weight w. Summing over d, a binary relation gives the linear relation Σ a\_i ζ\_A(ε\_i; s\_i) + Σ b\_j ζ\_A(ε′\_j; t\_j) = 0 (resp. with Li, resp. 𝔏^•(P) + 𝔏^•(Q) = 0).

**Hypotheses.** Coefficients in K; the identity is required for every integer d, including negative d.

**Proof sketch.**

1. BR\_w and P^•\_w are subspaces since the defining identities are linear.
2. Summation: Σ\_{d ∈ Z}(Σ a\_i S\_d + Σ b\_j S\_{d+1}) = Σ a\_i ζ\_A(ε\_i; s\_i) + Σ b\_j ζ\_A(ε′\_j; t\_j), the shift d ↦ d + 1 being harmless over all of Z (Ngo Dac Remark 2.4).

**Uses.**

- MZ.2/todd-operators: B\*, C and BC act on binary relations
- MZ.2/reduction-step: relations obtained from R\_1 by these operators give the reduction of a bad index
- MZ.5/all-relations: every relation among MZVs of weight w comes from the operators applied to R\_1

**API.**

- `FunctionFieldMZV.BinaryRelation` (data): A binary relation of weight w in a fixed realisation.
- `FunctionFieldMZV.BinaryRelation.IsFixed` (data): All shifted coefficients vanish.
- `FunctionFieldMZV.BinaryRelation.sum_eq_zero` (characterisation): Summing over d gives Σ a\_i ζ\_A(ε\_i; s\_i) + Σ b\_j ζ\_A(ε′\_j; t\_j) = 0.
- `FunctionFieldMZV.BinaryRelation.module` (instance): BR\_w is a K-vector space.
- `FunctionFieldMZV.relationSpace` (data): P^•\_w ⊂ H\_w ⊕ H\_w.

**Unit tests.**

- `FunctionFieldMZV.BinaryRelation.test_R1` (computation): (\[q\], −ℓ\_1\[1, q − 1\]) lies in P^ζ\_q and in P^{Li}\_q.
- `FunctionFieldMZV.BinaryRelation.test_zero` (degenerate): The zero pair is a fixed binary relation of every weight.
- `FunctionFieldMZV.BinaryRelation.test_all_d` (non-example): For q = 2, S\_d(2) + S\_{d+1}(1, 1) = 0 fails at d = 0 (it equals 1 + (θ² + θ)^{−1}), while S\_d(2) + D\_1 S\_{d+1}(1, 1) = 0 holds for every d: the identity is required for every d with the exact coefficients.
- `FunctionFieldMZV.BinaryRelation.test_homogeneous` (non-example): A pair whose entries have different weights is not in any P^•\_w.

**Acceptance.** R\_1 of MZ.2/fundamental-relation is a binary relation of weight q that is not fixed.

**Needs.** `MZ.0/power-sum`, `MZ.1/realisation-maps`.

**Sources.**

- ND21, Definition 2.3 and Remark 2.4, pp. 8–9: Defines binary and fixed relations of weight w among the S\_d with K-coefficients, valid for all d ∈ Z, and observes that summing over d gives a relation among MZVs.
- IKLNDP24, Definition 1.4, p. 14; Definition 4.3, p. 44: Defines binary and fixed relations among the Si\_d (resp. S\_d) of arrays and the space BR\_w.
- CCM23, Appendix A.2, (A.2.1)–(A.2.2), p. 27: Defines P^• and the homogeneous parts P^•\_w and the induced relation 𝔏^•(P) + 𝔏^•(Q) = 0.

<a id="MZ-2-fundamental-relation"></a>

### MZ.2.2 Thakur’s fundamental relation R\_1

Node `MZ.2/fundamental-relation`, a theorem.

**Statement.** For every d ∈ Z, S\_d(q) + D\_1 S\_{d+1}(1, q − 1) = 0 and Si\_d(q) + D\_1 Si\_{d+1}(1, q − 1) = 0, where D\_1 = θ^q − θ = −ℓ\_1; with characters, Si\_d(ε; q) + ε^{−1}D\_1 Si\_{d+1}(ε, 1; 1, q − 1) = 0 (the relation R\_ε), and the same for S. Hence ζ\_A(q) + D\_1 ζ\_A(1, q − 1) = 0 = Li(q) + D\_1 Li(1, q − 1).

**Hypotheses.** d ∈ Z; ε ∈ F\_q^×.

**Proof sketch.**

1. For d &lt; 0 both terms vanish. For d ≥ 0, Si\_{d+1}(1, q − 1) = ℓ\_{d+1}^{−1}Σ\_{j=0}^{d}ℓ\_j^{1−q}, and one proves Σ\_{j=0}^{d}ℓ\_j^{1−q} = −(θ − θ^{q^{d+1}})/(D\_1 ℓ\_d^{q−1}) by induction on d: for d = 0 both sides are 1, and the inductive step reduces to −(θ − θ^{q^{d+1}})^q + θ^q − θ = θ^{q^{d+2}} − θ.
2. Since ℓ\_{d+1} = ℓ\_d(θ − θ^{q^{d+1}}), this gives D\_1 Si\_{d+1}(1, q − 1) = −ℓ\_d^{−q} = −Si\_d(q).
3. The S version follows by MZ.0/carlitz-identity, all entries being ≤ q; the character version multiplies both terms by ε^d.
4. Sum over d (MZ.2/binary-relation).

**Acceptance.** For q = 2, ζ\_A(2) = D\_1 ζ\_A(1, 1) (signs are irrelevant in characteristic 2), checked to precision in the Laurent expansion.

**Needs.** `MZ.0/power-sum`, `MZ.0/carlitz-identity`, `MZ.2/binary-relation`, `DM.0/carlitz-products`.

**Sources.**

- THAKUR09R, Theorem 5, §2.7.7, p. 2326, and its proof, §3.4.6, p. 2332: Proves ζ(m, m(q − 1)) = ζ(mq)/ℓ\_1^m for m ≤ q from the degree-wise identity S\_d(m, m(q − 1)) = ℓ\_1^{−m}S\_{d−1}(mq); m = 1 is R\_1.
- ND21, (2.8), p. 8: States R\_1 as a binary relation of weight q with D\_1 = θ^q − θ, citing Thakur §3.4.6.
- IKLNDP24, §1.2, relation R\_ε, p. 14; §4.1.2, p. 44: States R\_ε for the Si and for the S of arrays.
- CCM23, Example A.2.3, p. 27: States R\_1 = (\[q\], −L\_1\[1, q − 1\]) ∈ P^•\_q for both realisations.
- LRT14, Theorem 3.1(2), p. 3: Contains ζ(1, q − 1) = ζ(q)/ℓ\_1 as the case n = 0, s\_1 = 1, s\_2 = 0.

**Planet:** Thakur’s fundamental relation.

<a id="MZ-2-todd-operators"></a>

### MZ.2.3 Todd’s operators B\*, C and the cancellation operator BC

Node `MZ.2/todd-operators`, a construction.

**Statement.** Let R be a binary relation of weight w, R(d): Σ a\_i S\_d(ε\_i; s\_i) + Σ b\_j S\_{d+1}(ε′\_j; t\_j) = 0. For an array (σ; v) of depth one, B\*\_{σ,v}(R) is the fixed relation of weight w + v obtained from S\_d(σ; v)·Σ\_{e&lt;d}R(e), namely Σ a\_i S\_d(σ, ε\_i; v, s\_i) + Σ b\_j S\_d(σ, ε′\_j; v, t\_j) + Σ b\_j S\_d(σ; v)S\_d(ε′\_j; t\_j) = 0, the last product expanded by MZ.1/power-sum-products; B\*\_{Σ,V} = B\*\_{σ\_1,v\_1} ∘ ⋯ ∘ B\*\_{σ\_n,v\_n} (B\*\_0 is not defined). For an array (Σ; V) of weight v, C\_{Σ,V}(R) is the binary relation of weight w + v obtained from R(d)·S\_{&lt;d+1}(Σ; V). For ε ∈ F\_q^×, BC\_{ε,q}(R) = B\*\_{ε,q}(R) − Σ\_j b\_j C\_{ε′\_j,t\_j}(R\_ε), whose equal-degree terms cancel, leaving Σ a\_i S\_d(ε, ε\_i; q, s\_i) + Σ b\_{jk} S\_{d+1}(ε, ε″\_{jk}; 1, t\_{jk}) = 0 with (ε″\_{jk}; t\_{jk}) ≤ (1; q − 1) + (ε′\_j; t\_j). In the formal setting the same operators B^•\_s, C^•\_s and BC^{•,m}\_q (m-fold iterate, BC^{•,m}\_q(P, Q) = (\[q^{{m}}, P\], L\_1^m α^{•,m}\_q(Q))) act on H\_{>0} ⊕ H\_{>0}.

**Hypotheses.** Binary relations from MZ.2/binary-relation; expansions from MZ.1/power-sum-products.

**Proof sketch.**

1. B\*: multiply Σ\_{e&lt;d}R(e) = Σ a\_i S\_{&lt;d}(ε\_i; s\_i) + Σ b\_j (S\_{&lt;d} + S\_d)(ε′\_j; t\_j) by S\_d(σ; v) and use S\_d(σ; v)S\_{&lt;d}(x) = S\_d(σ, x).
2. C: multiply R(d) by S\_{&lt;d+1}(Σ; V) = S\_{&lt;d}(Σ; V) + S\_d(Σ; V) and expand by MZ.1/power-sum-products; coefficients stay in K, only the structure constants lie in F\_p.
3. BC: by definition of C on R\_ε, the terms S\_d(ε, ε′\_j; q, t\_j) + S\_d(ε; q)S\_d(ε′\_j; t\_j) of B\*\_{ε,q}(R) cancel; what remains is the fixed part and the shifted part −Σ b\_j ε^{−1}D\_1 S\_{d+1}(ε; 1)S\_{&lt;d+1}(1; q − 1)S\_{&lt;d+1}(ε′\_j; t\_j).
4. Small heads: if v + (t\_j)\_1 ≤ q for every j then S\_d(σ; v)S\_d(ε′\_j; t\_j) = S\_d(σε′\_{j1}; v + t\_{j1}, …), and if R is fixed then B\*\_{σ,v} only prepends (σ; v) (Ngo Dac Corollaries 2.6–2.7; Im–Kim–Le–Ngo Dac–Pham Lemmas 1.5 and 4.4).
5. Each operator sends binary relations to binary relations of the shifted weight (Chang–Chen–Mishiba Proposition A.3.1).

**Uses.**

- MZ.2/reduction-step: C(R\_1), then BC repeatedly, then B\* produce the decomposition of a bad index
- MZ.2/rewriting-theorem: the explicit composite BC^{•,m}\_q C^•\_{s″}(R\_1), preceded by B^•\_{s^T}, realises \[s\] − U^•(s)
- MZ.5/all-relations: these operators generate the relation space R\_w

**API.**

- `FunctionFieldMZV.BinaryRelation.bStar` (constructor): B\*\_{σ,v}(R), a fixed relation of weight w + v.
- `FunctionFieldMZV.BinaryRelation.cOp` (constructor): C\_{Σ,V}(R), a binary relation of weight w + wt(V).
- `FunctionFieldMZV.BinaryRelation.bcOp` (constructor): BC\_{ε,q}(R) = B\*\_{ε,q}(R) − Σ\_j b\_j C\_{ε′\_j,t\_j}(R\_ε).
- `FunctionFieldMZV.BinaryRelation.bStar_fixed` (simp): On a fixed relation B\*\_{σ,v} prepends (σ; v).
- `FunctionFieldMZV.BinaryRelation.bStar_small` (simp): If v + (t\_j)\_1 ≤ q for all j the product term is S\_d(σε′\_{j1}; v + t\_{j1}, …).
- `FunctionFieldMZV.BinaryRelation.bcOp_support` (relation): The shifted part of BC\_{ε,q}(R) is supported on (ε, ·; 1, u) with u ≤ (q − 1) + t\_j.
- `FunctionFieldMZV.relationSpace_bStar` (relation): B^•\_s, C^•\_s and BC^{•,m}\_q map P^•\_w into P^•\_{w+wt(s)} and P^•\_{w+mq}.

**Unit tests.**

- `FunctionFieldMZV.BinaryRelation.test_bStar_R1` (computation): B\*\_1(R\_1) is the fixed relation S\_d(1, q) + D\_1 S\_d(1, 1, q − 1) + D\_1 S\_d(2, q − 1) = 0, the last term coming from S\_d(1)S\_d(1, q − 1) = S\_d(2, q − 1) by the small-head rule 1 + 1 ≤ q.
- `FunctionFieldMZV.BinaryRelation.test_C_empty` (degenerate): C\_∅ is the identity, and B\*\_∅ is the identity.
- `FunctionFieldMZV.BinaryRelation.test_bStar_zero` (non-example): B\*\_0 is not defined: the operator needs a positive head v ≥ 1 (source issue E2).
- `FunctionFieldMZV.BinaryRelation.test_coeffs` (computation): For q = 2, C\_{(1)}(R\_1) has the coefficient θ² − θ on S\_{d+1}(1, 2): the coefficients of C lie in K, not in F\_p.

**Acceptance.** B\*\_{q}(R\_1) followed by subtraction of C\_{(1,q−1)}(R\_1) is BC\_q(R\_1), whose fixed part is S\_d(q, q).

**Needs.** `MZ.2/binary-relation`, `MZ.2/fundamental-relation`, `MZ.1/power-sum-products`, `MZ.1/index-algebra`.

**Sources.**

- ND21, §2.2: B\*\_v and Proposition 2.5, p. 9; Corollaries 2.6–2.7, p. 9; C\_W and Proposition 2.8, p. 10; BC\_q and Proposition 2.10, p. 11: Defines Todd’s B\* and C on binary relations and the new operator BC\_q, with the resulting relations and the small-head simplifications.
- IKLNDP24, §1.2.1–1.2.3, pp. 14–17; Lemma 1.5, p. 15; §4.1.2, pp. 45–47: Extends B\*, C and BC to arrays for the Si and for the S, with the characters multiplied along.
- CCM23, Appendix A.3, definitions before Proposition A.3.1 and the proposition, pp. 27–29: Defines B^•\_s, C^•\_s and BC^{•,m}\_q on H\_{>0} ⊕ H\_{>0} and proves they preserve P^•\_w with the weight shifts wt(s) and mq.

<a id="MZ-2-c-of-fundamental"></a>

### MZ.2.4 The controlled form of C\_W(R\_1)

Node `MZ.2/c-of-fundamental`, a theorem.

**Statement.** For a nonempty index W = (w\_1, W\_−), C\_W(R\_1) has the form S\_d(q + w\_1, W\_−) + Σ\_i a\_i S\_d(s\_i) + Σ\_i b\_i S\_{d+1}(1, t\_i) = 0 with a\_i, b\_i ∈ K, s\_i ≤ (q) + W and (s\_i)\_1 &lt; q + w\_1, and t\_i ≤ (q − 1) + W. For arrays (Im–Kim–Le–Ngo Dac–Pham Proposition 1.6), C\_{Σ,V}(R\_ε) = Si\_d(εσ\_1, Σ\_−; q + v\_1, V\_−) + Si\_d(ε, Σ; q, V) + Σ\_i b\_i Si\_{d+1}(ε, ε\_i; 1, t\_i) with b\_i ∈ A divisible by D\_1 and (ε\_i; t\_i) ≤ (1; q − 1) + (Σ; V).

**Hypotheses.** W, (Σ; V) nonempty; R\_1, R\_ε from MZ.2/fundamental-relation.

**Proof sketch.**

1. By the definition of C, C\_W(R\_1) is S\_d(q, W) + S\_d(q)S\_d(W) + D\_1 S\_{d+1}(1)S\_{&lt;d+1}(q − 1)S\_{&lt;d+1}(W) = 0.
2. Expand S\_d(q)S\_d(W) by MZ.1/power-sum-products: the leading term is S\_d(q + w\_1, W\_−), the others have first entry &lt; q + w\_1 and are ≤ (q) + W; the term S\_d(q, W) also joins the a\_iS\_d(s\_i), since (q, W) ≤ (q) + W and its first entry is q &lt; q + w\_1.
3. Expand S\_{&lt;d+1}(q − 1)S\_{&lt;d+1}(W) by MZ.1/power-sum-products into S\_{&lt;d+1}(t\_i) with t\_i ≤ (q − 1) + W, and absorb S\_{d+1}(1).
4. For Si the product Si\_d(ε; q)Si\_d(Σ; V) is exactly Si\_d(εσ\_1, Σ\_−; q + v\_1, V\_−), so no further terms appear, and the shifted coefficients are ε^{−1}D\_1 times F\_q-structure constants, hence in D\_1A.

**Acceptance.** For W = (1), C\_{(1)}(R\_1) has leading term S\_d(q + 1).

**Needs.** `MZ.2/todd-operators`, `MZ.2/fundamental-relation`, `MZ.1/power-sum-products`.

**Sources.**

- ND21, Lemma 2.9 and its proof, p. 10: States and proves the controlled form of C\_W(R\_1).
- IKLNDP24, Proposition 1.6 and its proof, p. 16; Proposition 4.5, p. 46: Gives the form of C\_{Σ,V}(R\_ε) for the Si (with D\_1-divisible coefficients in A) and for the S.

<a id="MZ-2-reduction-step"></a>

### MZ.2.5 The reduction step for a bad index

Node `MZ.2/reduction-step`, a theorem.

**Statement.** (1) Let s = (s\_1, …, s\_r) with s\_1, …, s\_{k−1} ≤ q and s\_k > q. Then ζ\_A(s) = Σ a\_i ζ\_A(s′\_i) + Σ b\_i ζ\_A(t′\_i) + Σ c\_i ζ\_A(u\_i) with a\_i, b\_i, c\_i ∈ K, every index t on the right has dep(t) ≥ dep(s) and T\_k(t) ≤ T\_k(s), and: type 1 indices have Init(s′) ≻ Init(s), or Init(s′) = Init(s) and s′\_k &lt; s\_k; type 2 indices have t′\_1 + ⋯ + t′\_ℓ &lt; s\_1 + ⋯ + s\_ℓ for k ≤ ℓ ≤ dep(s); type 3 indices have Init(u) ≻ Init(s). (2) If every entry of s is ≤ q and s\_k = q is the last entry (k = r), the same holds with only types 2 (prefix sums up to k strictly smaller) and 3. (3) For arrays and the Si (Im–Kim–Le–Ngo Dac–Pham Proposition 1.7(1)), with any chosen ε ∈ F\_q^×: Li(ε; s) = −Li(ε′; s′) + Σ b\_i Li(ε′\_i; t′\_i) + Σ c\_i Li(μ\_i; u\_i), with b\_i, c\_i ∈ A divisible by D\_1 and the single type-1 array (ε′; s′) = (ε\_1, …, ε\_{k−1}, ε, ε^{−1}ε\_k, ε\_{k+1}, …; s\_1, …, s\_{k−1}, q, s\_k − q, s\_{k+1}, …); every array on the right has depth ≥ dep(s) and T\_k ≤ T\_k(s), the type-1 and type-2 arrays have prefix sums strictly smaller than those of s at every length ℓ with k ≤ ℓ ≤ dep(s), and type-3 arrays have Init(u) ≻ Init(s). When Init(s) = s and the last entry is q (Proposition 1.7(2)) there is no type-1 term. (4) For the S of arrays (Proposition 4.6) the same holds except that type 1 is a K-combination Σ a\_i ζ\_A(ε′\_i; s′\_i) with Init(s′\_i) ≽ Init(s) and (s′\_i)\_k &lt; s\_k, all coefficients lying in K.

**Hypotheses.** s\_k > q in case (1); s\_k = q terminal in case (2).

**Proof sketch.**

1. Put W = (s\_k − q, s\_{k+1}, …, s\_r) and start from C\_W(R\_1) (MZ.2/c-of-fundamental), whose leading term is S\_d(s\_k, …, s\_r); for (3) start from C\_{Σ,V}(R\_ε) with the chosen ε, whose second term is the type-1 array.
2. Let j &lt; k be maximal with s\_j &lt; q (s\_0 := 0), so s\_{j+1} = ⋯ = s\_{k−1} = q; apply BC\_q k − j − 1 times, controlling the shifted indices by t ≤ (q^{{k−j−1}}, s\_k − 1, s\_{k+1}, …).
3. If j ≥ 1 apply B\*\_{s\_j} (small-head rule, as s\_j &lt; q) and then B\*\_{s\_1} ∘ ⋯ ∘ B\*\_{s\_{j−1}} (fixed relations); if j = 0 skip B\*\_{s\_j} and sum the relation directly (source issue E2), then sum over d.
4. The three families of terms are the three types; their properties follow from the support bounds of MZ.1/power-sum-products and the dominance calculus of MZ.0/index.
5. For (2) use W = ∅ (C\_∅(R\_1) = R\_1); for (3) run the same construction with R\_ε and the chosen ε, noting that the C-terms of Si carry no extra fixed terms and that every coefficient stays in D\_1A.

**Acceptance.** For s = (q + 1), the reduction gives ζ\_A(q + 1) as a combination of ζ\_A(q, 1) (type 1) and indices (1, t) of depth ≥ 2 (type 2).

**Needs.** `MZ.2/c-of-fundamental`, `MZ.2/todd-operators`, `MZ.2/binary-relation`, `MZ.0/index`.

**Sources.**

- ND21, Propositions 2.12–2.13 and their proofs, pp. 11–14: States and proves the three-type decomposition for a first entry exceeding q and for a terminal q.
- IKLNDP24, Proposition 1.7 and its proof, pp. 17–21; Proposition 4.6, pp. 47–52: Proves the decomposition for ACMPLs with a single type-1 array and D\_1-divisible coefficients in A, and for AMZVs.

<a id="MZ-2-admissible-reduction"></a>

### MZ.2.6 Reduction to k-admissible indices

Node `MZ.2/admissible-reduction`, a theorem.

**Statement.** For every k ≥ 1 and every index s, ζ\_A(s) is a K-linear combination of ζ\_A(t) with t k-admissible, wt(t) = wt(s), dep(t) ≥ dep(s) and T\_k(t) ≤ T\_k(s). The same holds for Li(ε; s) and for ζ\_A(ε; s) in terms of k-admissible arrays of the same weight. The reduction terminates: at fixed weight and fixed k, each step strictly decreases (s\_1 + ⋯ + s\_k; reverse lexicographic rank of Init(s) in the finite set of initial tuples of weight ≤ w; the entry after Init(s)) in the lexicographic order.

**Hypotheses.** k ≥ 1.

**Proof sketch.**

1. For ζ\_A(s), induct on k; for the array versions the cited statements give only “same weight, k-admissible”, the depth and T\_k bounds holding by the same proof. For k = 1: if s\_1 ≤ q then s is 1-admissible or s = (q), handled by R\_1; if s\_1 > q use C\_{(s\_1 − q, s\_2, …)}(R\_1) and induct on s\_1.
2. For k ≥ 2 assume the statement for k − 1, so s may be taken (k − 1)-admissible but not k-admissible, hence dep(s) ≥ k; induct on s\_1 + ⋯ + s\_k.
3. Apply MZ.2/reduction-step (case (1) or (2)); type 2 terms have smaller s\_1 + ⋯ + s\_k and are handled by induction; terms with equal sum are of type 1 or 3, with Init weakly increasing.
4. Init(s) ≼ q^{{k}} lies in a finite set, so Init eventually stabilises; then only type 1 steps occur and the entry after Init strictly decreases, which cannot continue forever.

**Acceptance.** k = w applied to an index of weight w gives indices in I^T\_w (MZ.0/index).

**Needs.** `MZ.2/reduction-step`, `MZ.2/fundamental-relation`, `MZ.0/index`.

**Sources.**

- ND21, Definition 3.1 and Proposition 3.2 with its proof, pp. 14–16: Proves the k-admissible reduction by double induction and an explicit termination argument through Init.
- IKLNDP24, Proposition 1.9 and its proof, pp. 21–23; Proposition 4.7, pp. 52–54: Proves the analogous reduction for ACMPLs (where only type 3 can keep the sum) and for AMZVs.

<a id="MZ-2-brown-spanning"></a>

### MZ.2.7 Brown’s theorem in positive characteristic

Node `MZ.2/brown-spanning`, a theorem.

**Statement.** For every w ≥ 1, the family {ζ\_A(s) : s ∈ I^T\_w} spans Z\_w over K; hence dim\_K Z\_w ≤ d(w) (Ngo Dac’s Theorem A). Likewise AT\_w spans AL\_w (the weak Brown theorem for ACMPLs), {ζ\_A(ε; s) : (ε; s) ∈ AT\_w} spans AZ\_w, and {Li(s) : s ∈ I^T\_w} spans L\_w (trivial characters). The proof gives an algorithm expressing every value as such a combination.

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. Apply MZ.2/admissible-reduction with k = w; a w-admissible index of weight w lies in I^T\_w (MZ.0/index).
2. |I^T\_w| = d(w) by MZ.0/counting.
3. The alternating and CMPL versions are the same argument with the array forms of the reduction step; the CMPL version is the trivial-character specialisation of the ACMPL one, the operators preserving characters.

**Acceptance.** For q = 2 the algorithm gives ζ\_A(3) = (θ² + θ)²(ζ\_A(1, 1, 1) + ζ\_A(2, 1)) (checked in the Laurent expansion). For w ≤ q, I^T\_w = IND\_w is the set of compositions of w other than (q), and the theorem reduces to R\_1.

**Needs.** `MZ.2/admissible-reduction`, `MZ.0/counting`, `MZ.0/weight-spaces`, `MZ.0/index-families`.

**Sources.**

- ND21, Theorem A, p. 3, and its proof, p. 16: States that every MZV of weight w is a K-combination of elements of T\_w, so dim\_K Z\_w ≤ d(w), and deduces it from Proposition 3.2 with k = w.
- IKLNDP24, Proposition 1.10, p. 24; Proposition 4.8, p. 54: States the weak Brown theorems for ACMPLs and AMZVs with the generating set AT\_w.
- CCM23, Remark 1.2.5, p. 3: Records Ngo Dac’s spanning theorem and the upper bound.

**Planet:** Brown’s theorem in positive characteristic.

<a id="MZ-2-value-bridge"></a>

### MZ.2.8 The bridge between zeta values and polylogarithm values

Node `MZ.2/value-bridge`, a theorem.

**Statement.** For every w ≥ 0, AZ\_w = AL\_w and Z\_w = L\_w.

**Hypotheses.** w ≥ 0.

**Proof sketch.**

1. By MZ.2/brown-spanning, AZ\_w is spanned by the AMZVs of AT\_w and AL\_w by the ACMPLs of AT\_w.
2. Arrays of AT\_w have all entries ≤ q, so their AMZV and ACMPL agree (MZ.0/carlitz-identity).
3. Restricting to trivial characters gives Z\_w = L\_w from the CMPL version of the weak Brown theorem (source issue E10 for the use of this specialisation).

**Acceptance.** Li(q + 1) ∈ Z\_{q+1} although Li(q + 1) ≠ ζ\_A(q + 1).

**Needs.** `MZ.2/brown-spanning`, `MZ.0/carlitz-identity`, `MZ.0/weight-spaces`.

**Sources.**

- IKLNDP24, Theorem 4.9, p. 54: Deduces AZ\_w = AL\_w from the two weak Brown theorems.
- CCM23, Corollary 3.2.5, p. 12: Shows {𝔏^•(s) : s ∈ I^T\_w} generates Z^•\_w for both realisations, so Z^{Li}\_w = Z^ζ\_w.

<a id="MZ-2-rewriting-operator"></a>

### MZ.2.9 The Thakur decomposition and the rewriting operator U^•

Node `MZ.2/rewriting-operator`, a construction.

**Statement.** Every index has a unique decomposition s = (s^T, q^{{m}}, s′) with s^T ∈ I^T (Thakur’s family of any weight, or ∅), m ≥ 0, and s′ = ∅ or s′\_1 > q; put Init(s) = (s^T, q^{{m}}) and, if s′ ≠ ∅, s″ = (s′\_1 − q, s′\_−). For • ∈ {Li, ζ} let α^•\_q(P) = \[1, (q − 1) ∗^• P\] with iterates α^{•,m}\_q (α^{•,0}\_q = id). The K-linear map U^• : H → H is U^•(s) = −\[s^T, q^{{m+1}}, s″\] + L\_1^{m+1}\[s^T, α^{•,m+1}\_q(s″)\] + L\_1^{m+1}(s^T ⊞ α^{•,m+1}\_q(s″)) − \[s^T, q^{{m}}, D^•\_{q,s″}\] if s′ ≠ ∅, and U^•(s) = L\_1^m\[s^T, α^{•,m}\_q(∅)\] + L\_1^m(s^T ⊞ α^{•,m}\_q(∅)) if s′ = ∅, with L\_1 = θ − θ^q. Write U^• = U^•\_1 + U^•\_2 + U^•\_3 for the bracket terms, the ⊞ term and the correction term. U^• preserves weight and fixes every index of I^T.

**Hypotheses.** H, ∗^•, ⊞ and D^• from MZ.1/index-algebra.

**Proof sketch.**

1. The decomposition is unique: (s^T, q^{{m}}) is Ngo Dac’s Init(s), and s^T is Init(s) with its maximal terminal run of q’s removed, m being the length of that run.
2. Each component is a finite combination of indices of the weight of s (Chang–Chen–Mishiba Remark 3.2.3).
3. For s ∈ I^T, m = 0 and s′ = ∅, so U^•(s) = \[s^T, α^{•,0}\_q(∅)\] + (s^T ⊞ ∅) = \[s\] + 0.

**Uses.**

- Chang–Chen–Mishiba, Theorem 3.2.4: U^• preserves realisations and an iterate lands in the span of I^T
- Chang–Chen–Mishiba, Theorem 3.2.6: the transition matrix (U^{Li})^e from IND\_w to I^T\_w is invertible modulo L\_1
- Chang–Chen–Mishiba, Theorem 5.4.2: the relations \[s\] − U^ζ(s) span all linear relations

**API.**

- `FunctionFieldMZV.thakurDecomp` (data): The unique (s^T, m, s′) with s = (s^T, q^{{m}}, s′).
- `FunctionFieldMZV.alphaQ` (constructor): α^•\_q(P) = \[1, (q − 1) ∗^• P\].
- `FunctionFieldMZV.rewrite` (constructor): The operator U^• : H → H.
- `FunctionFieldMZV.rewrite_of_mem_thakur` (simp): U^•(s) = s for s ∈ I^T.
- `FunctionFieldMZV.rewrite_weight` (relation): U^•(H\_w) ⊂ H\_w.
- `FunctionFieldMZV.rewrite_components` (characterisation): U^• = U^•\_1 + U^•\_2 + U^•\_3 with the three explicit components.

**Unit tests.**

- `FunctionFieldMZV.rewrite_test_decomp` (computation): For s = (q − 1, q, q, q + 1, 1), s^T = (q − 1), m = 2, s″ = (1, 1).
- `FunctionFieldMZV.rewrite_test_fixed` (degenerate): U^•(∅) = ∅ and U^•(s) = s for every s ∈ I^T.
- `FunctionFieldMZV.rewrite_test_q` (computation): For s = (q): m = 1, s′ = ∅ and U^•(q) = L\_1\[α^•\_q(∅)\] = L\_1\[1, q − 1\].
- `FunctionFieldMZV.rewrite_test_not_init` (non-example): s^T is not Init(s): for s = (1, q, q), Init(s) = (1, q, q) while s^T = (1), m = 2 and s′ = ∅.

**Acceptance.** For s = (q − 1, q, q, q + 1, 1): s^T = (q − 1), m = 2, s′ = (q + 1, 1), s″ = (1, 1).

**Needs.** `MZ.1/index-algebra`, `MZ.0/index-families`, `MZ.0/index`.

**Sources.**

- CCM23, §3.1, (3.1.3)–(3.1.4) and Example 3.1.5, p. 11; §3.2, (3.2.1), Definition 3.2.2 and Remark 3.2.3, p. 11; Appendix A.3, definitions of Init, U\_1, U\_2, U\_3, pp. 29–30: Defines the decomposition, α\_q, the operator U^• in both cases and its three components, and notes U^•(s) = s on I^T.

<a id="MZ-2-rewriting-theorem"></a>

### MZ.2.10 The rewriting theorem

Node `MZ.2/rewriting-theorem`, a theorem.

**Statement.** For • ∈ {Li, ζ} and every P ∈ H: (1) 𝔏^•(U^•(P)) = 𝔏^•(P); (2) there is an explicit e ≥ 0 with Supp((U^•)^e(P)) ⊂ I^T. Consequently {𝔏^•(s) : s ∈ I^T\_w} spans Z^•\_w = 𝔏^•(H\_w), and Z^{Li}\_w = Z^ζ\_w = Z\_w.

**Hypotheses.** • ∈ {Li, ζ}.

**Proof sketch.**

1. (1): for s ∉ I^T with s′ ≠ ∅, the relation BC^{•,m}\_q(C^•\_{s″}(R\_1)), followed by B^•\_{s^T} when s^T ≠ ∅, lies in P^•\_{wt(s)} by MZ.2/todd-operators, and its realisation reads 𝔏^•(s) − 𝔏^•(U^•(s)) = 0 (Chang–Chen–Mishiba (A.3.3)–(A.3.4)); for s′ = ∅ (then m ≥ 1) use BC^{•,m−1}\_q(R\_1) ((A.3.5)–(A.3.6)).
2. (2): for s ∉ I^T every n ∈ Supp(U^•(s)) has dep(n) > dep(s) (component U\_1), or dep(n) = dep(s) and Init(n) > Init(s) (U\_2), or dep(n) = dep(s), Init(n) ≥ Init(s) and n\_{ℓ+1} &lt; s\_{ℓ+1} with ℓ = dep Init(s) (U\_3) (Lemma A.3.7).
3. The triple (dep; Init; −entry after Init) lives in a finite totally ordered set at fixed weight, so the iteration stops (Theorem A.3.8).
4. Ngo Dac’s spanning theorem is recovered, simultaneously for both realisations, together with Z^{Li}\_w = Z^ζ\_w from MZ.0/carlitz-identity on I^T.

**Acceptance.** U^ζ applied to (q + 1) for q = 2 terminates after finitely many steps in the span of I^T\_3 = {(1, 1, 1), (2, 1)}.

**Needs.** `MZ.2/rewriting-operator`, `MZ.2/todd-operators`, `MZ.2/fundamental-relation`, `MZ.1/realisations-multiplicative`, `MZ.0/carlitz-identity`.

**Sources.**

- CCM23, Theorem 3.2.4 and Corollary 3.2.5, pp. 11–12; Theorem A.3.2, p. 29; Lemma A.3.7 and Theorem A.3.8, pp. 30–31: States and proves that U^• preserves the realisations and terminates in I^T, and deduces the generating sets in both realisations.

**Planet:** Rewriting operator theorem.

<a id="MZ-2-ind-spanning"></a>

### MZ.2.11 The Hoffman-type generating set

Node `MZ.2/ind-spanning`, a theorem.

**Statement.** For every w ≥ 1, Z\_w is spanned by the values Li(s) with s ∈ IND\_w.

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. Choose e ≫ 0 with (U^{Li})^e(H\_w) ⊂ span I^T\_w over F\_p\[L\_1\] (MZ.2/rewriting-theorem), and let U = (u\_{s,n}) ∈ Mat\_{d(w)}(F\_p\[L\_1\]) with (U^{Li})^e(s) = Σ\_{n ∈ I^T\_w} u\_{s,n}\[n\] for s ∈ IND\_w.
2. For s = (m\_1q + n\_1, …, m\_rq + n\_r) ∈ IND\_w, D^{Li} = 0 gives U^{Li}(s) ≡ −\[s^T, q, s″\] modulo L\_1, so (U^{Li})^e(s) ≡ (−1)^{m\_1+⋯+m\_r}\[ι(s)\] modulo L\_1.
3. ι is a bijection (MZ.0/index-families), so det U ≡ ±1 modulo L\_1 and det U ≠ 0; hence the Li(s), s ∈ IND\_w, span the same space as the ζ\_A(n), n ∈ I^T\_w, which is Z\_w by MZ.2/rewriting-theorem.

**Acceptance.** For w ≤ q, IND\_w = I^T\_w and the statement is MZ.2/rewriting-theorem.

**Needs.** `MZ.2/rewriting-theorem`, `MZ.0/index-families`, `MZ.0/counting`.

**Sources.**

- CCM23, Theorem 3.2.6 and its proof, p. 12: Proves that Li\_s(1), s ∈ IND\_w, span Z\_w by showing the transition matrix to I^T\_w is ±1 modulo L\_1.

<a id="MZ-2-strong-brown"></a>

### MZ.2.12 The strong Brown theorem for alternating polylogarithms

Node `MZ.2/strong-brown`, a theorem.

**Statement.** For every w ≥ 1, the ACMPL values Li(ε; s) with (ε; s) ∈ AS\_w span AL\_w; hence dim\_K AL\_w ≤ s(w). More precisely, for each (ε; s) ∈ AT\_w let (ε′; s′) ∈ AS\_w be its contraction: parse s into blocks, each a run of q’s ending in an entry &lt; q, replace the i-th block (q^{{h\_i − 1}}, r\_i) by the single entry (h\_i − 1)q + r\_i (so ι(s′) = s), and let ε′\_i be the product of the characters of the i-th block. Then Li(ε′; s′) = Σ\_{(ϵ; t) ∈ AT\_w} a^{(ε;s)}\_{ϵ,t} Li(ϵ; t) with every a ∈ A, a ≡ ±1 modulo D\_1 for (ϵ; t) = (ε; s) and a ≡ 0 modulo D\_1 otherwise. The contraction is many-to-one onto AS\_w, and the t(w) × t(w) matrix (a^{(ε;s)}\_{ϵ,t}), with rows indexed by AT\_w (repeated left-hand sides allowed), is invertible.

**Hypotheses.** w ≥ 1; characters in F\_q^×.

**Proof sketch.**

1. Fix (ε; s) ∈ AT\_w and run the reduction algorithm of MZ.2/admissible-reduction with k = w on its contraction (ε′; s′), using MZ.2/reduction-step (3) at every step, also at the first step in place of C(R\_1).
2. Every coefficient is −1 on a type-1 edge and lies in D\_1A otherwise, so the coefficient of a leaf is congruent modulo D\_1 to the product along its all-type-1 path.
3. Splitting the m-th q off the i-th entry of s′, choose the free character in the reduction step equal to the character of the corresponding entry of (ε; s); the all-type-1 chain then ends at (ε; s) with sign (−1)^{n−ℓ}, and every other leaf of AT\_w is reached through a non-type-1 edge.
4. This gives the congruences for every row; the t(w) × t(w) matrix is congruent modulo D\_1 to a diagonal matrix with entries ±1, so its determinant is not divisible by D\_1 and the matrix is invertible over K.
5. Inverting it expresses every Li(ϵ; t), (ϵ; t) ∈ AT\_w, as a K-combination of the Li(ε′; s′), which lie in AS\_w; with the weak Brown theorem (MZ.2/brown-spanning: AT\_w spans AL\_w), AS\_w spans AL\_w. The bijection ϕ is only used for |AS\_w| = s(w) (MZ.0/counting). Source issue E9 records that the published proof cites Propositions 1.7 and 1.10 without this bookkeeping, and E21 that it writes AJ\_w for the index set of AT\_w.

**Acceptance.** For w ≤ q, AS\_w = AT\_w and the statement is the weak Brown theorem; for q = 2 the two sets differ but have the same cardinality d(w).

**Needs.** `MZ.2/reduction-step`, `MZ.2/admissible-reduction`, `MZ.2/brown-spanning`, `MZ.0/index-families`, `MZ.0/counting`.

**Sources.**

- IKLNDP24, Theorem 1.11 and its proof, p. 25: States that AS\_w generates AL\_w and proves it by a transition matrix that is ±1 on the diagonal modulo D\_1.

**Planet:** Strong Brown theorem for ACMPLs.

<a id="MZ-2-next-weight-relation"></a>

### MZ.2.13 The next-weight relation ζ\_A(2q − 1) + D\_1 ζ\_A(1, 2q − 2) = 0

Node `MZ.2/next-weight-relation`, a theorem.

**Statement.** For every prime power q and every d ∈ Z, S\_d(2q − 1) + D\_1 S\_{d+1}(1, 2q − 2) = 0; hence ζ\_A(2q − 1) + D\_1 ζ\_A(1, 2q − 2) = 0. For q > 2 both indices lie in IND\_{2q−1}, so the MZVs indexed by IND\_w are not independent at w = 2q − 1.

**Hypotheses.** q ≥ 2.

**Proof sketch.**

1. Expand C\_{(q−1)}(R\_1) = S\_d(q, q − 1) + S\_d(q)S\_d(q − 1) + D\_1 S\_{d+1}(1)S\_{&lt;d+1}(q − 1)² = 0. By MZ.1/chen-product, Δ^{\[q−1\]}\_{q,q−1} = −1 and Δ^{\[2q−2\]}\_{q,q−1} = 0, so S\_d(q)S\_d(q − 1) = S\_d(2q − 1) − S\_d(q, q − 1), which cancels the first term.
2. S\_{&lt;d+1}(q − 1)² = 2S\_{&lt;d+1}(q − 1, q − 1) + Σ\_{i ≤ d}S\_i(q − 1)², and S\_i(q − 1)² = S\_i(2q − 2) + 2(−1)^q S\_i(q − 1, q − 1) (Δ^{\[q−1\]}\_{q−1,q−1} = 2(−1)^q); the coefficient 2(1 + (−1)^q) of S\_{&lt;d+1}(q − 1, q − 1) vanishes in characteristic p, so S\_{&lt;d+1}(q − 1)² = S\_{&lt;d+1}(2q − 2) and C\_{(q−1)}(R\_1) is the claimed relation.
3. Equivalently, this is the case n = 0, s\_1 = s\_2 = 1, k\_1 = 0 of Lara Rodríguez–Thakur Theorem 3.1(2): ζ(1, 2q − 2) = ζ(2q − 1)/ℓ\_1, with ℓ\_1 = −D\_1.
4. For q > 2, neither 2q − 1 nor 2q − 2 is divisible by q.

**Acceptance.** Checked numerically for q = 2 and q = 3 in the Laurent expansion.

**Needs.** `MZ.2/todd-operators`, `MZ.2/fundamental-relation`, `MZ.1/chen-product`, `MZ.0/index-families`.

**Sources.**

- ND21, Remark 6.3, p. 24: Notes that ζ\_A(2q − 1) and ζ\_A(1, 2q − 2) are K-linearly dependent, verifiable by writing out C\_{(q−1)}(R\_1), so the method of Theorem 6.2 stops at 2q − 2.
- LRT14, Theorem 3.1(2), p. 3: Gives ζ(a, b) = ζ(a + b)/ℓ\_1^{s\_1 q^n} for the stated families, which contains (a, b) = (1, 2q − 2).
- IKLNDP24, Remark 4.14, p. 58: Recalls that ζ\_A(1, 2q − 2) and ζ\_A(2q − 1) are dependent.

## MZ.3. Period interpretation, Chang's descent and the ABP independence criterion

**Layer targets.**

Targets.

- Anderson–Thakur polynomials H\_n ∈ A\[t\] (in Ngo Dac's indexing, H\_n = Anderson–Thakur's H\_{n−1}) and Carlitz factorials Γ\_n, with deg\_θ H\_n &lt; nq/(q − 1), H\_n = 1 for n ≤ q and H\_{q+k−1} = (t^q − t) + (k − 1)(t^q − θ^q) for 1 &lt; k ≤ q − 1, and the interpolation formula (H\_s Ω^s)^{(d)}(θ) = Γ\_s S\_d(s)/π̃^s.
- Chang's deformation series 𝔏(s; Q) = Σ\_{i\_1 > ⋯ > i\_r ≥ 0} (Ω^{s\_r}Q\_r)^{(i\_r)}⋯(Ω^{s\_1}Q\_1)^{(i\_1)} for Q ∈ K̄\[t\]^r with the termwise bound ‖Q\_j‖ &lt; |θ|^{q s\_j/(q−1)}; it lies in the ring E of DM.8 and satisfies 𝔏(s; Q)(θ^{q^j}) = 𝔏(s; Q)(θ)^{q^j}; at θ it gives Γ\_s ζ\_A(s)/π̃^w (Q = H), γ\_1⋯γ\_r Γ\_s ζ\_A(ε; s)/π̃^w (Q = γH) and γ\_1⋯γ\_r Li(ε; s)/π̃^w (Q = γ).
- The dual t-motives M\_{s,Q} given by the bidiagonal matrices Φ\_{s,Q} with rigid analytic trivialisations Ψ\_{s,Q}, Ψ^{(−1)} = ΦΨ, as effective dual t-motives in the sense of DM.4.
- Chang's MZ property and Chang's descent theorem: families of nonzero MZ-property values of distinct weights that are K-linearly independent weight by weight remain K̄-linearly independent together with 1; consequences: K- and K̄-independence agree in a fixed weight, the K̄-algebra generated by MZVs (resp. CMPL values at algebraic points) is graded by weight and defined over K, and the Eulerian descent.
- The merged prefix system: for a finite family of pairs (s\_i; Q\_i) of weight w and coefficients a\_i ∈ A, the matrices Φ′, Φ, Ψ′, Ψ indexed by proper prefixes, with Ψ^{(−1)} = ΦΨ and det Φ a power of t − θ.
- The ABP independence criterion (Im–Kim–Le–Ngo Dac–Pham Theorem 2.4, extending Ngo Dac §5 and Chang–Chen–Mishiba Lemma 5.1.1): if the lower-weight prefix values are K-linearly independent and a + Σ a\_i 𝔏(s\_i; Q\_i)(θ) = 0, then every suffix combination f\_t(θ) lies in K, and the relation yields a polynomial splitting row over a common denominator in F\_q\[t\]; the Eulerian suffix constraint ((q − 1) divides the suffix weight of an isolated tail) follows.

Acceptance: H\_1 = ⋯ = H\_q = 1; for s = (1) the system is Φ = \[\[t − θ, 0\], \[t − θ, 1\]\] with Ψ = \[\[Ω, 0\], \[𝔏(1), 1\]\]; the criterion with a single index recovers ζ\_A(s) ∉ K·π̃^w unless (q − 1) | w.

**Inputs from other layers:** `MZ.0`, `DM.2`, `DM.4`, `DM.8`.

<a id="MZ-3-anderson-thakur-polynomials"></a>

### MZ.3.1 Anderson–Thakur polynomials and Carlitz factorials

Node `MZ.3/anderson-thakur-polynomials`, a definition.

**Statement.** Let \[k\] = θ^{q^k} − θ and D\_k = ∏\_{ℓ=1}^{k}\[ℓ\]^{q^{k−ℓ}} (D\_0 = 1; this is DM.0’s D\_k = ∏\_{j&lt;k}(θ^{q^k} − θ^{q^j})). For n ≥ 1 write n − 1 = Σ\_j n\_j q^j in base q and put Γ\_n = ∏\_j D\_j^{n\_j} (the Carlitz factorial of n − 1). Let γ\_0(t) = 1 and γ\_j(t) = ∏\_{ℓ=1}^{j}(θ^{q^j} − t^{q^ℓ}). The Anderson–Thakur polynomials α\_n(t) ∈ A\[t\] are defined by Σ\_{n ≥ 1} α\_n(t)x^n/Γ\_n = x(1 − Σ\_{j ≥ 0} γ\_j(t)x^{q^j}/D\_j)^{−1}, and H\_n(t) ∈ A\[t\] is α\_n with θ and t interchanged. (In Anderson–Thakur and Chang the same polynomial is called H\_{n−1}; this roadmap uses Ngo Dac’s and Im–Kim–Le–Ngo Dac–Pham’s indexing.) Then deg\_θ H\_n ≤ (n − 1)q/(q − 1) &lt; nq/(q − 1), so ‖H\_n‖ &lt; |θ|^{nq/(q−1)}; H\_n = 1 for 1 ≤ n ≤ q; and H\_{q+k−1} = (t^q − t) + (k − 1)(t^q − θ^q) for 1 &lt; k ≤ q − 1.

**Hypotheses.** q ≥ 2; t an independent variable.

**Proof sketch.**

1. Expanding the geometric series, the coefficient of x^n for n ≤ q comes only from the j = 0 term, so α\_n/Γ\_n = 1 and Γ\_n = 1, whence H\_n = 1.
2. For n = q + k − 1 with 1 &lt; k ≤ q − 1 exactly one factor γ\_1 x^q/D\_1 can occur, in k − 1 positions, so α\_n/Γ\_n = 1 + (k − 1)γ\_1/D\_1 with Γ\_n = D\_1; hence α\_n = (θ^q − θ) + (k − 1)(θ^q − t^q) and H\_n follows by swapping θ and t.
3. The degree bound is Anderson–Thakur’s estimate (3.7.3), as quoted by Ngo Dac §4.2, Chang Theorem 5.5.1 and Im–Kim–Le–Ngo Dac–Pham (2.4).

**Uses.**

- MZ.3/anderson-thakur-interpolation: the polynomials interpolate the power sums S\_d(s)
- MZ.3/deformation-series: Q = H gives the series whose value at θ is Γ\_s ζ\_A(s)/π̃^{wt(s)}
- MZ.4/two-row-system: the explicit low values enter Ngo Dac’s two-row computation

**API.**

- `FunctionFieldMZV.carlitzFactorial` (data): Γ\_n = ∏\_j D\_j^{n\_j} with n − 1 = Σ n\_j q^j.
- `FunctionFieldMZV.andersonThakurPoly` (data): H\_n ∈ A\[t\] (Ngo Dac indexing).
- `FunctionFieldMZV.andersonThakurPoly_degree_le` (other): deg\_θ H\_n ≤ (n − 1)q/(q − 1).
- `FunctionFieldMZV.andersonThakurPoly_of_le` (simp): H\_n = 1 for 1 ≤ n ≤ q.
- `FunctionFieldMZV.andersonThakurPoly_q_add` (simp): H\_{q+k−1} = (t^q − t) + (k − 1)(t^q − θ^q) for 1 &lt; k ≤ q − 1.
- `FunctionFieldMZV.carlitzFactorial_of_le` (simp): Γ\_n = 1 for n ≤ q.

**Unit tests.**

- `FunctionFieldMZV.andersonThakurPoly_test_small` (computation): H\_1 = H\_q = 1.
- `FunctionFieldMZV.andersonThakurPoly_test_q3` (computation): For q = 3, H\_4 = 2t^3 − t − θ^3.
- `FunctionFieldMZV.carlitzFactorial_test` (computation): Γ\_{q+1} = D\_1 = θ^q − θ.
- `FunctionFieldMZV.andersonThakurPoly_test_shift` (non-example): The indexing is shifted from Anderson–Thakur’s: with their convention H\_0 = 1 is the polynomial attached to s = 1, so citing their H\_s for exponent s is off by one.

**Acceptance.** H\_1 = ⋯ = H\_q = 1 and, for q = 3, H\_4 = t^3 − t + t^3 − θ^3 = 2t^3 − t − θ^3.

**Needs.** `DM.0/carlitz-products`, `mathlib:Polynomial`.

**Sources.**

- ND21, §4.2, p. 17: Defines \[k\], D\_k, Γ\_n through the digits of n − 1, γ\_j, α\_n by the generating series and H\_n by swapping θ and t, with the Gauss-norm bound and the index shift relative to the cited sources.
- ND21, §6, p. 24: Uses H\_k = 1 for k ≤ q − 1 and H\_{q+k−1} = (t^q − t) + (k − 1)(t^q − θ^q).
- IKLNDP24, §2.2.2, (2.4), p. 28: Restates the polynomials with the bound deg\_θ H\_n ≤ (n − 1)q/(q − 1).
- CHANG14, Theorem 5.5.1, p. 18: States the Anderson–Thakur polynomials H\_n (Chang’s indexing) with deg\_θ H\_n ≤ nq/(q − 1).

<a id="MZ-3-anderson-thakur-interpolation"></a>

### MZ.3.2 Anderson–Thakur interpolation of power sums

Node `MZ.3/anderson-thakur-interpolation`, a theorem.

**Statement.** For s ≥ 1 and d ≥ 0, (H\_s Ω^s)^{(d)}(θ) = Γ\_s S\_d(s)/π̃^s, where f^{(d)} raises coefficients to the q^d-th power (DM.8/coefficient-twist) and Ω, π̃ = 1/Ω(θ) are as in DM.2. With a character, if γ ∈ F̄\_q satisfies γ^{q−1} = ε, then (γH\_sΩ^s)^{(d)}(θ) = γε^d Γ\_s S\_d(s)/π̃^s.

**Hypotheses.** s ≥ 1, d ≥ 0; H\_s in Ngo Dac’s indexing.

**Proof sketch.**

1. This is Anderson–Thakur’s interpolation formula (Anderson–Thakur 1990, (3.7.3)–(3.7.4); Anderson–Thakur 2009, 2.4.1), as stated in Chang 2014 Theorem 5.5.1; its proof expresses S\_d(s) through the coefficients of the Carlitz exponential and the polynomials γ\_j. The original proof was not reread here (the Annals paper is not freely available); this is recorded as a gap.
2. The character version follows from γ^{q^d} = γε^d (MZ.0/carlitz-multiple-polylogarithm).

**Acceptance.** For s ≤ q, H\_s = 1 and Γ\_s = 1, and the formula reads Ω^{(d)}(θ)^s = S\_d(s)/π̃^s, i.e. ℓ\_d^{−s}π̃^{−s} = S\_d(s)π̃^{−s}, which is Carlitz’s identity, since Ω^{(d)} = Ω/𝕃\_d with 𝕃\_d(θ) = ℓ\_d.

**Needs.** `MZ.3/anderson-thakur-polynomials`, `MZ.0/power-sum`, `DM.2/omega`, `DM.2/carlitz-period`, `DM.8/coefficient-twist`.

**Sources.**

- CHANG14, Theorem 5.5.1, p. 18: States (H\_{s−1}Ω^s)^{(d)}(θ) = Γ\_s S\_d(s)/π̃^s for d ≥ 0, s ≥ 1, after Anderson–Thakur.
- ND21, §4.2, (4.2), p. 17: Uses the interpolation (in its indexing) to obtain L(s)(θ) = Γ\_s ζ\_A(s)/π̃^{w(s)}.
- CH21, §2.4, Proposition 2.12, p. 13: Gives the character-twisted period formula for alternating values.

<a id="MZ-3-deformation-series"></a>

### MZ.3.3 Chang’s deformation series

Node `MZ.3/deformation-series`, a construction.

**Statement.** Let 𝕃\_0(t) = 1 and 𝕃\_d(t) = ∏\_{i=1}^{d}(t − θ^{q^i}), so 𝕃\_d(θ) = ℓ\_d and Ω^{(d)} = Ω/𝕃\_d. For an index s of depth r ≥ 1 and Q = (Q\_1, …, Q\_r) ∈ K̄\[t\]^r with the termwise bound ‖Q\_j‖ &lt; |θ|^{q s\_j/(q−1)} for every j (Gauss norm), Chang’s series is 𝔏(s; Q) = Σ\_{d\_1 > ⋯ > d\_r ≥ 0}(Ω^{s\_r}Q\_r)^{(d\_r)}⋯(Ω^{s\_1}Q\_1)^{(d\_1)} = Ω^{wt(s)}Σ\_{d\_1 > ⋯ > d\_r ≥ 0}Q\_r^{(d\_r)}⋯Q\_1^{(d\_1)}/(𝕃\_{d\_r}^{s\_r}⋯𝕃\_{d\_1}^{s\_1}), with 𝔏(∅) = 1. Special cases: Q = (H\_{s\_1}, …, H\_{s\_r}) gives Ngo Dac’s L(s); Q = (γ\_1H\_{s\_1}, …) with γ\_i^{q−1} = ε\_i gives 𝔏(s; ε); Q = (γ\_1, …, γ\_r) gives 𝔏𝔦(s; ε); Q = (1, …, 1) gives Chang–Chen–Mishiba’s 𝓛(s). The termwise bound holds for every consecutive sub-tuple, so every series 𝔏(s\_j, …, s\_k; Q\_j, …, Q\_k) is defined.

**Hypotheses.** Q\_j ∈ K̄\[t\] with the termwise bound (source issue E8: the whole-tuple condition printed by Im–Kim–Le–Ngo Dac–Pham does not suffice).

**Proof sketch.**

1. Ω^{(−1)} = (t − θ)Ω gives Ω^{(1)} = Ω/(t − θ^q) and inductively Ω^{(d)} = Ω/𝕃\_d, whence the second expression.
2. The twist raises the absolute values of coefficients to the q^d-th power, so ‖f^{(d)}‖ = ‖f‖^{q^d} for the Gauss norm, and ‖Ω‖ = |ρ|^{−q} = |θ|^{−q/(q−1)} since every factor 1 − t/θ^{q^i} has Gauss norm 1.
3. Under the termwise bound the general term has Gauss norm ∏\_j c\_j^{q^{d\_j}} with c\_j = ‖Q\_j‖/|θ|^{q s\_j/(q−1)} &lt; 1, so the series converges in the Tate algebra T of DM.8, for the tuple and for each consecutive sub-tuple.
4. ‖H\_n‖ &lt; |θ|^{nq/(q−1)} (MZ.3/anderson-thakur-polynomials) and |γ| = 1 show that the four special cases satisfy the bound.

**Uses.**

- MZ.3/index-dual-motive: the entries of the rigid analytic trivialisation Ψ\_{s,Q}
- MZ.3/independence-criterion: the series f\_t of suffixes carry the putative relation
- MZ.4/key-lemma: Q = 1 gives the CMPL periods

**API.**

- `FunctionFieldMZV.deformedEll` (data): 𝕃\_d(t) = ∏\_{i=1}^{d}(t − θ^{q^i}).
- `FunctionFieldMZV.changSeries` (data): 𝔏(s; Q) ∈ T under the termwise bound.
- `FunctionFieldMZV.changSeries_eq` (characterisation): 𝔏(s; Q) = Ω^{wt(s)}Σ Q\_r^{(d\_r)}⋯Q\_1^{(d\_1)}/(𝕃\_{d\_r}^{s\_r}⋯𝕃\_{d\_1}^{s\_1}).
- `FunctionFieldMZV.changSeries_nil` (simp): 𝔏(∅) = 1.
- `FunctionFieldMZV.changSeries_twist` (relation): 𝔏(s\_1, …, s\_k; Q)^{(−1)} = 𝔏(s\_1, …, s\_k; Q) + Q\_k^{(−1)}(t − θ)^{s\_k}Ω^{s\_k}𝔏(s\_1, …, s\_{k−1}; Q), the recursion behind Ψ^{(−1)} = ΦΨ.
- `FunctionFieldMZV.omega_twist_eq` (simp): Ω^{(d)} = Ω/𝕃\_d for d ≥ 0.
- `FunctionFieldMZV.changSeries_sub` (other): Every consecutive sub-tuple satisfies the termwise bound, so its series is defined.

**Unit tests.**

- `FunctionFieldMZV.changSeries_test_depth_one` (computation): 𝓛(1) = ΩΣ\_{d ≥ 0}𝕃\_d^{−1}.
- `FunctionFieldMZV.changSeries_test_empty` (degenerate): 𝔏(∅) = 1.
- `FunctionFieldMZV.changSeries_test_bound` (non-example): For s = (q − 1, q − 1) and Q = (1, θ^{q+1}) the whole-tuple condition holds but ‖Q\_2‖ = q^{q+1} > |θ|^{q} violates the termwise bound and the tail series 𝔏((q − 1); (θ^{q+1})) diverges.
- `FunctionFieldMZV.deformedEll_test` (computation): 𝕃\_1(θ) = θ − θ^q = ℓ\_1.

**Acceptance.** 𝓛(1) = Ω Σ\_{d ≥ 0} 𝕃\_d^{−1}, and 𝔏((1); (H\_1)) = 𝓛(1) since H\_1 = 1.

**Needs.** `MZ.3/anderson-thakur-polynomials`, `DM.2/omega`, `DM.8/coefficient-twist`, `DM.8/tate-analytic-interface`, `DM.0/carlitz-products`.

**Sources.**

- CHANG14, Lemma 5.3.1, (5.3.2), p. 14: Defines the series L\_{s,Q} by both expressions under a convergence condition on Q.
- ND21, §4.2, (4.1), pp. 17–18: Defines L(s) with Q = H (p. 17) and records that it lies in E (p. 18).
- IKLNDP24, §2.2.1, (2.1)–(2.2), p. 27; §2.2.2–2.2.3, pp. 28–29: Defines 𝔏(s; Q) under Condition (2.1) and its specialisations 𝔏(s; ε) and 𝔏𝔦(s; ε).
- CCM23, §5, opening, pp. 21–22: Defines 𝕃\_d and the deformation series 𝓛(s) = Ω^{wt(s)}Σ 1/(𝕃\_{d\_1}^{s\_1}⋯𝕃\_{d\_r}^{s\_r}).

<a id="MZ-3-deformation-entire"></a>

### MZ.3.4 Entireness of Chang’s series

Node `MZ.3/deformation-entire`, a theorem.

**Statement.** Under the termwise bound, 𝔏(s; Q) lies in the ring E of DM.8: its coefficients are algebraic over K, generate a finite extension of K\_∞, and the series converges on all of C\_∞. The same holds for every consecutive sub-tuple. More generally, if every Q\_j is nonzero and the whole-tuple decay condition of Chang Lemma 5.3.1 holds, the series for the tuple and every initial sub-tuple are entire; no claim about arbitrary tails is made under that weaker condition.

**Hypotheses.** Either the termwise bound; or, for the initial-sub-tuple assertion only, Q\_j ≠ 0 and ∏\_j (‖Q\_j‖/|θ|^{q s\_j/(q−1)})^{q^{d\_j}} → 0 as d\_1 > ⋯ > d\_r ≥ 0 and d\_1 → ∞.

**Proof sketch.**

1. By MZ.3/deformation-series, 𝔏(s; Q) and the series of all its consecutive sub-tuples lie in T, and Ω ∈ T (DM.2/omega).
2. The vector ψ = (Ω^{s\_1+⋯+s\_r}, 𝔏(s\_1; Q\_1)Ω^{s\_2+⋯+s\_r}, …, 𝔏(s\_1, …, s\_{r−1}; …)Ω^{s\_r}, 𝔏(s; Q))^T has entries in T and, by the twist recursion of MZ.3/deformation-series, satisfies ψ^{(−1)} = Φψ for the lower bidiagonal Φ ∈ Mat\_{r+1}(K̄\[t\]) with diagonal (t − θ)^{s\_{k+1}+⋯+s\_r} and subdiagonal Q\_k^{(−1)}(t − θ)^{s\_k+⋯+s\_r}; det Φ is a power of t − θ, so det Φ(0) ≠ 0.
3. DM.8/entire-from-equation (Anderson–Brownawell–Papanikolas Proposition 3.1.3) gives ψ ∈ E^{r+1}: every entry is entire with algebraic coefficients generating a finite extension of K\_∞; in particular Ω ∈ E and 𝔏(s; Q) ∈ E. Sub-tuples are treated the same way (Chang’s proof of Lemma 5.3.1 follows this route).
4. For the weaker whole-tuple condition put c\_j = ‖Q\_j‖/|θ|^{q s\_j/(q−1)} > 0. To test a prefix of length k, shift all its summation indices by r−k and append the fixed indices r−k−1, …, 0. The whole-tuple norm is a fixed positive constant times the q^{r−k}-th power of the prefix norm. Thus decay for the whole tuple implies decay for every prefix. This puts the displayed first-column vector in T, and the same equation and DM.8/entire-from-equation put it in E; convergence of the other columns is unnecessary (Chang Lemma 5.3.1, proof, p. 15).

**Acceptance.** 𝓛(s) ∈ E for every index s (Chang–Chen–Mishiba §5, p. 22).

**Needs.** `MZ.3/deformation-series`, `DM.8/entire-series`, `DM.8/entire-from-equation`, `DM.2/omega`.

**Sources.**

- CHANG14, Lemma 5.3.1 and its proof, pp. 14–15: Proves that the series L\_{s,Q} is an entire function under the convergence condition, through the difference system it satisfies and the Anderson–Brownawell–Papanikolas criterion for entire solutions.
- ND21, §4.2, p. 18: Records L(s) ∈ E, citing Chang Lemma 5.3.1.
- CCM23, §5, p. 22: Records 𝓛(s) ∈ E, citing Chang Lemma 5.3.1.

<a id="MZ-3-deformation-specialisation"></a>

### MZ.3.5 Specialisations of Chang’s series

Node `MZ.3/deformation-specialisation`, a theorem.

**Statement.** (1) For j ≥ 0, 𝔏(s; Q)(θ^{q^j}) = 𝔏(s; Q)(θ)^{q^j}. (2) At t = θ: 𝔏(s; H)(θ) = Γ\_s ζ\_A(s)/π̃^{wt(s)} with Γ\_s = Γ\_{s\_1}⋯Γ\_{s\_r}; 𝔏(s; ε)(θ) = γ\_1⋯γ\_r Γ\_s ζ\_A(ε; s)/π̃^{wt(s)}; 𝔏𝔦(s; ε)(θ) = γ\_1⋯γ\_r Li(ε; s)/π̃^{wt(s)}; 𝓛(s)(θ) = Li(s)/π̃^{wt(s)}.

**Hypotheses.** Q ∈ K̄\[t\]^r with the termwise bound; γ\_i^{q−1} = ε\_i.

**Proof sketch.**

1. (1): split the sum at d\_r &lt; j and d\_r ≥ j. The terms with d\_r &lt; j vanish at θ^{q^j}, since Ω^{wt(s)} vanishes there to order wt(s) while those terms have poles of order at most s\_1 + ⋯ + s\_{r−1}; the remaining part is the j-fold twist of 𝔏(s; Q), whose value at θ^{q^j} is 𝔏(s; Q)(θ)^{q^j} (Chang Lemma 5.3.5 for constant Q, Chang–Papanikolas–Yu Proposition 2.3.3 in general).
2. (2): at θ, (Ω^{s}Q)^{(d)}(θ) = π̃^{−s}Q^{(d)}(θ)/ℓ\_d^s; for Q = H use MZ.3/anderson-thakur-interpolation term by term; for Q = γ use γ^{q^d} = γε^d; multiply over the r factors and sum over d\_1 > ⋯ > d\_r ≥ 0.

**Acceptance.** For s = (1) and Q = 1, 𝓛(1)(θ) = Li(1)/π̃ = ζ\_A(1)/π̃.

**Needs.** `MZ.3/deformation-series`, `MZ.3/deformation-entire`, `MZ.3/anderson-thakur-interpolation`, `MZ.0/multiple-zeta-value`, `MZ.0/alternating-mzv`, `MZ.0/carlitz-multiple-polylogarithm`.

**Sources.**

- CHANG14, Lemma 5.3.5, p. 16; Theorem 5.5.2, (5.5.3), p. 18: Proves the Frobenius specialisation for constant Q and the value Γ\_s ζ\_A(s)/π̃^w of the H-series at θ.
- CPY19, Proposition 2.3.3, p. 7: Proves the Frobenius specialisation for polynomial Q under the convergence hypothesis (2.3.1).
- ND21, (4.2), p. 17; (5.4), p. 20: States L(s)(θ) = Γ\_s ζ\_A(s)/π̃^{w(s)} and L(t)(θ^{q^j}) = L(t)(θ)^{q^j}.
- IKLNDP24, (2.3), p. 27; (2.5) and (2.7), p. 29: States the Frobenius property and the values of 𝔏(s; ε) and 𝔏𝔦(s; ε) at θ.
- CCM23, §5, p. 22: States 𝓛(s)(θ^{q^j}) = (Li\_s(1)/π̃^{wt(s)})^{q^j}.
- CH21, §2.4, Proposition 2.12, p. 13: Gives the alternating period formula.

**Planet:** Period interpretation of multiple zeta values.

<a id="MZ-3-index-dual-motive"></a>

### MZ.3.6 The dual t-motives attached to an index

Node `MZ.3/index-dual-motive`, a construction.

**Statement.** For (s; Q) as in MZ.3/deformation-series, Φ\_{s,Q} ∈ Mat\_{r+1}(K̄\[t\]) is the lower bidiagonal matrix with diagonal entries (t − θ)^{s\_{k+1}+⋯+s\_r} (k = 0, …, r; the last is 1) and subdiagonal entries Q\_k^{(−1)}(t − θ)^{s\_k+⋯+s\_r} (k = 1, …, r). Ψ\_{s,Q} ∈ GL\_{r+1}(T) is lower triangular with (k, j)-entry 𝔏(s\_{j+1}, …, s\_k; Q\_{j+1}, …, Q\_k)Ω^{s\_{k+1}+⋯+s\_r} for j ≤ k (the empty series being 1), so the diagonal is Ω^{s\_{k+1}+⋯+s\_r} and the last row is (𝔏(s; Q), 𝔏(s\_2, …; Q\_2, …), …, 𝔏(s\_r; Q\_r), 1). Then Ψ\_{s,Q}^{(−1)} = Φ\_{s,Q}Ψ\_{s,Q}, all entries of Ψ lie in E, and det Φ\_{s,Q} = (t − θ)^{Σ\_{k=0}^{r−1}(s\_{k+1}+⋯+s\_r)}. The K̄\[t\]-module M\_{s,Q} = K̄\[t\]^{r+1} with σ acting by Φ\_{s,Q} is an effective dual t-motive (DM.4) and Ψ\_{s,Q} is a rigid analytic trivialisation; M′\_{s,Q} is given by the upper-left r × r block, with trivialisation the upper-left block of Ψ.

**Hypotheses.** Termwise bound on Q; K̄ perfect, so the effective dual t-motive of DM.4 is defined.

**Proof sketch.**

1. Twisting by −1 lowers every summation index by one; separating the terms whose last index becomes −1 gives 𝔏(s\_{j+1}, …, s\_k)^{(−1)} = 𝔏(s\_{j+1}, …, s\_k) + Q\_k^{(−1)}(t − θ)^{s\_k}Ω^{s\_k}𝔏(s\_{j+1}, …, s\_{k−1}); with Ω^{(−1)} = (t − θ)Ω this is the (k, j) entry of Ψ^{(−1)} = ΦΨ.
2. det Φ is the product of the diagonal entries, a power of t − θ; so (t − θ)^N kills M/σM and M is an effective dual t-motive.
3. Ψ is lower triangular with unit-multiple diagonal entries Ω^{…} ∈ T^×, hence invertible over T; its entries lie in E by MZ.3/deformation-entire.

**Uses.**

- MZ.3/mz-property-values: the first column of Ψ\_{s,Q} witnesses the MZ property
- MZ.3/prefix-system: the merged system is built from the Φ\_{s\_i,Q\_i}

**API.**

- `FunctionFieldMZV.indexFrobeniusMatrix` (data): Φ\_{s,Q} ∈ Mat\_{r+1}(K̄\[t\]).
- `FunctionFieldMZV.indexPeriodMatrix` (data): Ψ\_{s,Q} ∈ GL\_{r+1}(T).
- `FunctionFieldMZV.indexPeriodMatrix_twist` (characterisation): Ψ\_{s,Q}^{(−1)} = Φ\_{s,Q}Ψ\_{s,Q}.
- `FunctionFieldMZV.indexFrobeniusMatrix_det` (simp): det Φ\_{s,Q} is a power of t − θ.
- `FunctionFieldMZV.indexDualMotive` (constructor): M\_{s,Q}, an effective dual t-motive given by Φ\_{s,Q}.
- `FunctionFieldMZV.indexDualMotive_rigid` (compatibility): Ψ\_{s,Q} is a rigid analytic trivialisation in the sense of DM.8/fundamental-matrix.

**Unit tests.**

- `FunctionFieldMZV.indexPeriodMatrix_test_depth_one` (computation): For s = (1), Ψ^{(−1)} = ΦΨ reads Ω^{(−1)} = (t − θ)Ω and 𝔏(1; Q)^{(−1)} = Q^{(−1)}(t − θ)Ω + 𝔏(1; Q).
- `FunctionFieldMZV.indexFrobeniusMatrix_test_det` (computation): For s = (2, 1), det Φ = (t − θ)^{3}(t − θ)^{1} = (t − θ)^4.
- `FunctionFieldMZV.indexDualMotive_test_empty` (degenerate): For depth zero M is the trivial motive 1 with Φ = (1).
- `FunctionFieldMZV.indexDualMotive_test_not_free_sigma` (non-example): M\_{s,Q} need not be finitely generated over K̄\[σ\]; only the broader effective definition of DM.4 is used.

**Acceptance.** For s = (1), Φ = \[\[t − θ, 0\], \[Q\_1^{(−1)}(t − θ), 1\]\] and Ψ = \[\[Ω, 0\], \[𝔏(1; Q\_1), 1\]\].

**Needs.** `MZ.3/deformation-series`, `MZ.3/deformation-entire`, `DM.4/inverse-twist-dual-motive`, `DM.8/fundamental-matrix`, `DM.2/omega`.

**Sources.**

- ND21, Definition 4.1, p. 16; §4.2, displays of Φ\_s and Ψ\_s, pp. 17–18: Defines effective dual t-motives and the matrices Φ\_s, Ψ\_s for an index (with Q = H), with Ψ\_s^{(−1)} = Φ\_sΨ\_s.
- IKLNDP24, Definition 2.1, p. 26; §2.2.1, pp. 27–28: Defines M\_{s,Q} by Φ\_{s,Q} and its rigid analytic trivialisation Ψ\_{s,Q}.

<a id="MZ-3-mz-property"></a>

### MZ.3.7 Chang’s MZ property

Node `MZ.3/mz-property`, a definition.

**Statement.** A nonzero Z ∈ C\_∞ has the MZ property of weight w ≥ 1 if there are d ≥ 2, Φ ∈ Mat\_d(K̄\[t\]) and ψ ∈ E^d with ψ^{(−1)} = Φψ such that: (1) det Φ = c(t − θ)^m with c ∈ K̄^× and m ≥ 0; (2) the last column of Φ is (0, …, 0, 1)^T; (3) ψ(θ) has first entry π̃^{−w} and last entry cZ/π̃^w for some c ∈ K^×; (4) for every N ≥ 1, every entry of ψ(θ^{q^N}) except the last vanishes, and the last is (cZ/π̃^w)^{q^N}.

**Hypotheses.** E, the twist and the ABP condition from DM.8; π̃ from DM.2.

**Proof sketch.**

1. The data (Φ, ψ) is a witness; the weight is determined by Z (a consequence of MZ.3/chang-descent).
2. Products: if Z\_i have the MZ property of weight w\_i, Kronecker products of the witnesses give the MZ property of weight Σ m\_iw\_i for Z\_1^{m\_1}⋯Z\_n^{m\_n} (Chang Proposition 3.4.4).

**Uses.**

- MZ.3/chang-descent: the hypothesis of Chang’s descent theorem
- MZ.3/independence-criterion: K- and K̄-independence of prefix values agree through it

**API.**

- `FunctionFieldMZV.HasMZProperty` (data): Z has the MZ property of weight w, witnessed by (Φ, ψ).
- `FunctionFieldMZV.HasMZProperty.mul` (relation): Z\_1Z\_2 has the MZ property of weight w\_1 + w\_2.
- `FunctionFieldMZV.HasMZProperty.smul` (relation): cZ has the MZ property of the same weight for c ∈ K^×.
- `FunctionFieldMZV.HasMZProperty.ne_zero` (projection): An MZ-property value is nonzero.

**Unit tests.**

- `FunctionFieldMZV.HasMZProperty_test_li` (computation): Li(1) has the MZ property of weight 1.
- `FunctionFieldMZV.HasMZProperty_test_power` (computation): ζ\_A(q − 1)^2 has the MZ property of weight 2(q − 1).
- `FunctionFieldMZV.HasMZProperty_test_zero` (non-example): 0 never has the MZ property.
- `FunctionFieldMZV.HasMZProperty_test_scalar` (degenerate): If Z has it, so has aZ for a ∈ K^× (change c).

**Acceptance.** Li(1) has the MZ property of weight 1 with Φ = \[\[t − θ, 0\], \[t − θ, 1\]\] and ψ = (Ω, 𝓛(1))^T.

**Needs.** `DM.8/entire-series`, `DM.2/omega`.

**Sources.**

- CHANG14, Definition 3.4.1 and Proposition 3.4.4, pp. 8–9: Defines the MZ property by conditions (1)–(4) on a difference system and proves that monomials of MZ-property values have it with the total weight.

<a id="MZ-3-mz-property-values"></a>

### MZ.3.8 Zeta and polylogarithm values have the MZ property

Node `MZ.3/mz-property-values`, a theorem.

**Statement.** For (s; Q) as in MZ.3/deformation-series with 𝔏(s; Q)(θ) ≠ 0, the value π̃^{wt(s)}𝔏(s; Q)(θ) has the MZ property of weight wt(s). In particular every nonzero Li\_s(u) with u ∈ D\_s ∩ (K̄^×)^r, every ζ\_A(s), and every ζ\_A(ε; s) and Li(ε; s) whose total character χ(ε) is trivial has the MZ property of weight wt(s); for a general array the normalised values γ\_1⋯γ\_rΓ\_sζ\_A(ε; s) and γ\_1⋯γ\_rLi(ε; s) (γ\_i^{q−1} = ε\_i) have it, and so has every nontrivial monomial in such values, with the total weight.

**Hypotheses.** The termwise bound for polynomial Q. The additional general-point assertion uses nonzero algebraic u satisfying Chang’s whole-tuple convergence condition D\_s; nonvanishing is required in both cases.

**Proof sketch.**

1. Take Φ = Φ\_{s,Q} and ψ the first column of Ψ\_{s,Q} (MZ.3/index-dual-motive): ψ^{(−1)} = Φψ, det Φ is a power of t − θ, and the last column of Φ is (0, …, 0, 1)^T.
2. ψ(θ) has first entry Ω(θ)^{wt(s)} = π̃^{−wt(s)} and last entry 𝔏(s; Q)(θ); at θ^{q^N}, N ≥ 1, every entry carrying a positive power of Ω vanishes and the last entry is 𝔏(s; Q)(θ)^{q^N} (MZ.3/deformation-specialisation).
3. For the larger domain D\_s take Q = u and use only Chang’s first column: MZ.3/deformation-entire gives convergence and entire-ness of every prefix under the whole-tuple condition, and Chang Lemma 5.3.5 (p. 16) gives their specialisations at θ^{q^N}. This proves the same witness conditions without assuming that the full tail matrix Ψ exists on D\_s (source issue E8).
4. The named values are the cases Q = u (Chang Proposition 5.4.1), Q = H, γH and γ, using MZ.0/mzv-nonvanishing and MZ.0/cmpl-nonvanishing for nonvanishing. The constant c of the definition must lie in K^×: c = Γ\_s ∈ K^× for ζ\_A(s), and γ\_1⋯γ\_r is a (q − 1)-th root of χ(ε), so it lies in F\_q^× ⊂ K^× exactly when χ(ε) = 1; otherwise one keeps the normalised value with c = 1.
5. Monomials: MZ.3/mz-property.

**Acceptance.** ζ\_A(q − 1) has the MZ property of weight q − 1, witnessed by Φ = \[\[(t − θ)^{q−1}, 0\], \[(t − θ)^{q−1}, 1\]\] (H\_{q−1} = 1) and ψ = (Ω^{q−1}, 𝔏((q − 1); (1)))^T.

**Needs.** `MZ.3/mz-property`, `MZ.3/index-dual-motive`, `MZ.3/deformation-specialisation`, `MZ.0/mzv-nonvanishing`, `MZ.0/cmpl-nonvanishing`, `MZ.3/deformation-entire`.

**Sources.**

- CHANG14, Proposition 5.4.1 and its proof, pp. 16–17: Shows that a nonzero CMPL value at an algebraic point has the MZ property with weight s\_1 + ⋯ + s\_r.
- IKLNDP24, §2.2.1, paragraph before Proposition 2.3, p. 28: Observes that π̃^w𝔏(s; Q)(θ) has the MZ property by the construction of Ψ\_{s,Q} and (2.3).
- ND21, §4.2 and §5.2, pp. 17–20: Uses the matrices Φ\_s, Ψ\_s and the Frobenius specialisation for MZVs in the role of the MZ property.

<a id="MZ-3-chang-descent"></a>

### MZ.3.9 Chang’s descent theorem and the graded algebra of values

Node `MZ.3/chang-descent`, a theorem.

**Statement.** Let w\_1, …, w\_ℓ be distinct positive integers and V\_i a finite set of MZ-property values of weight w\_i, each V\_i K-linearly independent. Then {1} ∪ V\_1 ∪ ⋯ ∪ V\_ℓ is K̄-linearly independent. Moreover, if Z\_1, …, Z\_n have the MZ property of the same weight w and π̃^w, Z\_1, …, Z\_n are K̄-linearly dependent, they are K-linearly dependent. Consequences: (a) MZ-property values of one weight are K-independent iff K̄-independent (Im–Kim–Le–Ngo Dac–Pham Proposition 2.3); (b) the K̄-algebra 𝒵 generated by all MZVs is graded, 𝒵 = K̄ ⊕ ⊕\_{w ≥ 1}𝒵\_w, and defined over K (K̄ ⊗\_K Z → 𝒵 is bijective), and the same holds for CMPL values at algebraic points (Chang Theorems 2.2.1 and 5.4.3); (c) if ζ\_A(s)/π̃^{wt(s)} ∈ K̄ then it lies in K.

**Hypotheses.** MZ-property values as in MZ.3/mz-property.

**Proof sketch.**

1. Step I (separation of the top weight w\_1 > ⋯): form the block-diagonal system with blocks (t − θ)^{w\_1 − w\_i}Φ\_{ij} and vectors Ω^{w\_1 − w\_i}ψ\_{ij} (entries in E, since Ω ∈ E by MZ.3/deformation-entire); apply ABP lifting (DM.8/abp-lifting) to a relation, normalise, and specialise at θ^{q^N}, where the lower-weight blocks vanish, to get a K̄-relation inside V\_1.
2. Step II (descent from K̄ to K in one weight): lift a K̄-relation by ABP, divide by the last coordinate, compare the twisted and untwisted lifts; the coefficients become σ-invariant rational functions, hence lie in F\_q(t) (DM.8/analytic-fixed-fields), and specialising gives a K-relation, contradicting the hypothesis.
3. The same argument with the extra entry 1 in place of a weight-w block gives the statement with π̃^w (Chang Proposition 4.3.1).
4. (b) follows by Chang Theorem 5.5.2 (ζ\_A(s) = Γ\_s^{−1}Σ\_u a\_u Li\_s(u) with u in a finite set of algebraic points) and MZ.3/mz-property-values; (c) is the case n = 1 of the statement with π̃^w.

**Acceptance.** (a) applied to I^T\_w and the basis theorem gives that I^T\_w is a K̄-basis of 𝒵\_w (Chang–Chen–Mishiba Remark 1.2.6).

**Needs.** `MZ.3/mz-property`, `MZ.3/mz-property-values`, `MZ.3/deformation-entire`, `DM.8/abp-lifting`, `DM.8/analytic-fixed-fields`, `DM.8/entire-series`, `DM.2/omega`.

**Sources.**

- CHANG14, Theorem 3.4.5, p. 9, with proof in §§4.1–4.2, pp. 9–12; Proposition 4.3.1, p. 12; Theorem 2.2.1, p. 5; Theorem 5.4.3, p. 17; Corollary 5.5.5, p. 19: Proves the descent theorem for MZ-property values of distinct weights, the variant with π̃^w, and deduces the graded algebra statements for MZVs and CMPL values at algebraic points and the Eulerian descent.
- IKLNDP24, Proposition 2.3, p. 28: States the equivalence of K- and K̄-independence for values 𝔏(s\_i; Q\_i)(θ) of one weight, via Chang.
- CCM23, Remark 1.2.6, p. 3; proof of Lemma 5.1.1, p. 23: Uses Chang’s theorem to pass from K- to K̄-independence.

**Planet:** Chang’s descent theorem.

<a id="MZ-3-prefix-system"></a>

### MZ.3.10 The merged prefix system of a putative relation

Node `MZ.3/prefix-system`, a construction.

**Statement.** Fix w ≥ 1, finitely many pairs (s\_i; Q\_i), i = 1, …, n, with wt(s\_i) = w and Q\_i ∈ K̄\[t\]^{dep(s\_i)} satisfying the termwise bound, and coefficients a, a\_1, …, a\_n ∈ A, with a\_i(t) = a\_i|\_{θ=t} ∈ F\_q\[t\]. Let I be the set of proper prefixes (t; Q) of the pairs, including ∅. Define Φ′ ∈ Mat\_{|I|}(K̄\[t\]) by Φ′\_{∅,∅} = (t − θ)^w, Φ′\_{(t;Q),(t;Q)} = (t − θ)^{w−wt(t)}, Φ′\_{(t;Q),(t′;Q′)} = Q\_{last}^{(−1)}(t − θ)^{w−wt(t′)} when (t′; Q′) is (t; Q) with its last entry removed, and 0 otherwise; the row v with v\_{(t;Q)} = Σ\_i a\_i(t)Q\_{i,last}^{(−1)}(t − θ)^{w−wt(t)} over the i whose penultimate prefix is (t; Q); and Φ = \[\[Φ′, 0\], \[v, 1\]\]. Define Ψ′ by Ψ′\_{∅,∅} = Ω^w and Ψ′\_{(t;Q),(t′;Q′)} = 𝔏(t after t′; Q after Q′)Ω^{w−wt(t)} when (t′; Q′) is a prefix of (t; Q), 0 otherwise; the row f with f\_{(t;Q)} = Σ\_i a\_i(t)𝔏(s\_i after t; Q\_i after Q) over the i having (t; Q) as a proper prefix; and Ψ = \[\[Ψ′, 0\], \[f, 1\]\]. Finally Φ̃ = diag(1, Φ) and ψ̃ = (1, (Ψ′\_{(t;Q),∅})\_{(t;Q) ∈ I}, f\_∅)^T. Then Ψ^{(−1)} = ΦΨ, Ψ ∈ GL\_{|I|+1}(T) with entries in E, det Φ = (t − θ)^{Σ\_{(t;Q) ∈ I}(w − wt(t))}, ψ̃^{(−1)} = Φ̃ψ̃, ψ̃ ∈ E^{|I|+2}, and the last coordinate of ψ̃(θ) is Σ\_i a\_i𝔏(s\_i; Q\_i)(θ).

**Hypotheses.** As stated; for Chang–Chen–Mishiba one takes Q = 1 and I = 𝔦(M) ∖ M for a set M of weight-w indices.

**Proof sketch.**

1. Each block of Φ′, Ψ′ restricted to the prefixes of one pair is Φ′\_{s\_i,Q\_i}, Ψ′\_{s\_i,Q\_i} of MZ.3/index-dual-motive, so the equation Ψ′^{(−1)} = Φ′Ψ′ holds blockwise, and the merged rows agree because a prefix determines its own entries.
2. The last row: f^{(−1)} = vΨ′ + f is the defining recursion of the suffix series, as in MZ.3/index-dual-motive.
3. Φ′ is lower triangular for the order by length, with diagonal powers of t − θ; Ψ′ is lower triangular with diagonal Ω^{w−wt(t)} ∈ T^×.
4. Entries of Ψ lie in E by MZ.3/deformation-entire; the value of f\_∅ at θ is Σ a\_i𝔏(s\_i; Q\_i)(θ) by definition.

**Uses.**

- MZ.3/independence-criterion: the ABP criterion is applied to (Φ̃, ψ̃)
- MZ.4/key-lemma: the splitting equation of the system is the Frobenius system (E\_M)

**API.**

- `FunctionFieldMZV.prefixSet` (data): The set I of proper prefixes, including ∅.
- `FunctionFieldMZV.prefixFrobeniusMatrix` (data): Φ = \[\[Φ′, 0\], \[v, 1\]\].
- `FunctionFieldMZV.prefixPeriodMatrix` (data): Ψ = \[\[Ψ′, 0\], \[f, 1\]\].
- `FunctionFieldMZV.prefixPeriodMatrix_twist` (characterisation): Ψ^{(−1)} = ΦΨ.
- `FunctionFieldMZV.prefixFrobeniusMatrix_det` (simp): det Φ is a power of t − θ.
- `FunctionFieldMZV.prefixVector` (data): ψ̃ = (1, (Ψ′\_{t,∅})\_t, f\_∅)^T with ψ̃^{(−1)} = Φ̃ψ̃.
- `FunctionFieldMZV.prefixVector_eval` (simp): The last coordinate of ψ̃(θ) is Σ a\_i𝔏(s\_i; Q\_i)(θ).

**Unit tests.**

- `FunctionFieldMZV.prefixSet_test` (computation): For s\_1 = (1, 2) and s\_2 = (3), I = {∅, (1)}.
- `FunctionFieldMZV.prefixSet_test_single` (degenerate): For a single pair of depth one, I = {∅} and Φ = \[\[(t − θ)^w, 0\], \[a\_1(t)Q^{(−1)}(t − θ)^w, 1\]\].
- `FunctionFieldMZV.prefixSet_test_shared` (computation): For s\_1 = (1, 2), s\_2 = (2, 1) of weight 3, I = {∅, (1), (2)}; for s\_1 = (1, 1, 1), s\_2 = (1, 2), I = {∅, (1), (1, 1)}, the prefix (1) being shared.
- `FunctionFieldMZV.prefixVector_test_not_square` (non-example): Without the extra coordinate 1, a relation with nonzero constant term a cannot be fed to the ABP criterion; ψ̃ adds it.

**Acceptance.** For one pair s = (1, q − 1), Q = 1, the system has I = {∅, (1)} and is the system of Chang–Chen–Mishiba Example 4.3.2 before solving.

**Needs.** `MZ.3/index-dual-motive`, `MZ.3/deformation-series`, `MZ.3/deformation-entire`.

**Sources.**

- ND21, §5.1 (Step 1), pp. 18–19: Constructs Φ′, Φ, Ψ′, Ψ indexed by merged proper prefixes for a putative MZV relation, with Ψ^{(−1)} = ΦΨ.
- CCM23, proof of Lemma 5.1.1, pp. 22–23: Constructs the same matrices for an arbitrary set M of weight-w indices with Q = 1 and the extended vector ψ̃.
- IKLNDP24, proof of Theorem 2.4, Step 1, pp. 30–31: Constructs the matrices for arbitrary pairs (s\_i; Q\_i) and the vector ψ̃ with the extra coordinate 1.

<a id="MZ-3-independence-criterion"></a>

### MZ.3.11 The ABP independence criterion for zeta-type periods

Node `MZ.3/independence-criterion`, a theorem.

**Statement.** In the setting of MZ.3/prefix-system, assume (LW) for each weight w′ &lt; w the values 𝔏(t; Q)(θ), (t; Q) ∈ I of weight w′, are K-linearly independent (in particular nonzero), and (LD) a + Σ\_i a\_i𝔏(s\_i; Q\_i)(θ) = 0 with a, a\_i ∈ A not all zero. Then: there are b ∈ F\_q\[t\] ∖ {0} and δ\_0, δ\_{(t;Q)} ∈ K̄\[t\] with δ\_0^{(−1)} = δ\_0 and \[\[Id, 0\], \[δ, 1\]\]^{(−1)}\[\[Φ′, 0\], \[bv, 1\]\] = \[\[Φ′, 0\], \[0, 1\]\]\[\[Id, 0\], \[δ, 1\]\] (δ = (δ\_{(t;Q)})); there is ν ∈ F\_q\[t\]^{|I|} with δΨ′ + bf = ν; and for every (t; Q) ∈ I, f\_{(t;Q)}(θ) = ν\_{(t;Q)}(θ)/b(θ) ∈ K. For Ngo Dac’s case (Q = H, a = 0) and Chang–Chen–Mishiba’s case (Q = 1, Σ a\_s Li(s) = cπ̃^w, so a = −c after clearing π̃) this is the rationality step of their proofs. Im–Kim–Le–Ngo Dac–Pham state the setup with constant tuples Q\_i (source issue E11); the proof uses only the Frobenius specialisation, the descent of MZ.3/chang-descent and the DM.8 inputs, so it applies to every Q with the termwise bound, which is this roadmap’s formulation.

**Hypotheses.** (LW) and (LD) as stated; the termwise bound on all Q\_i.

**Proof sketch.**

1. Apply ABP lifting (DM.8/abp-lifting) to (Φ̃, ψ̃) and ρ = (a, 0, …, 0, 1): det Φ̃ is a power of t − θ with constant 1, and ρψ̃(θ) = 0 by (LD); get a polynomial row h with hψ̃ = 0 and h(θ) = ρ, and put g = h/h\_last, regular at θ.
2. B = g − g^{(−1)}Φ̃ has last entry 0 and Bψ̃ = gψ̃ − (gψ̃)^{(−1)} = 0, i.e. B\_0 + Σ B\_{(t;Q)}𝔏(t; Q)Ω^{w−wt(t)} = 0.
3. Specialise at θ^{q^j}, j ≫ 0, where Ω vanishes: B\_0 = 0; dividing by Ω^{w−w\_0} for the largest prefix weight w\_0 and specialising gives a K̄-relation among the 𝔏(t; Q)(θ)^{q^j} of weight w\_0, which is trivial by (LW) and MZ.3/chang-descent (a); so those B vanish, and descending through the weights all B vanish.
4. Then the unipotent gauge equation holds; by DM.8/constant-denominator the common denominator b of the entries lies in F\_q\[t\]; with δ = b·(entries), X = \[\[Id, 0\], \[δ, 1\]\]\[\[Ψ′, 0\], \[bf, 1\]\] satisfies X^{(−1)} = diag(Φ′, 1)X, so by uniqueness of rigid trivialisations (the API item fundamental\_unique of DM.8/fundamental-matrix: every solution is Ψ times a constant matrix) X = diag(Ψ′, 1)\[\[Id, 0\], \[ν, 1\]\] with ν over F\_q(t); δΨ′ + bf = ν lies in T, so ν ∈ F\_q\[t\] (DM.8/analytic-fixed-fields).
5. Specialise δΨ′ + bf = ν at θ^{q^j}: δΨ′ vanishes there, and b, ν, a\_i are fixed by twisting, so the Frobenius specialisation of MZ.3/deformation-specialisation gives b(θ)^{q^j}f(θ)^{q^j} = ν(θ)^{q^j}; take q^j-th roots (source issue E19: Ngo Dac cites (4.2) where (5.4) is needed).

**Acceptance.** For the two indices (w) and (k, q − 1) with Q = H and a = 0 the gauge equation is Ngo Dac’s two-row system (6.3)–(6.4) (MZ.4/two-row-system).

**Needs.** `MZ.3/prefix-system`, `MZ.3/deformation-specialisation`, `MZ.3/chang-descent`, `DM.8/abp-lifting`, `DM.8/constant-denominator`, `DM.8/fundamental-matrix`, `DM.8/analytic-fixed-fields`.

**Sources.**

- IKLNDP24, Theorem 2.4, p. 29, Remark 2.5, p. 30, and the proof, pp. 30–33: States the criterion with hypotheses (LW) and (LD) and proves it by the ABP criterion, the vanishing of B by specialisation, Chang–Papanikolas–Yu’s denominator theorem and Papanikolas’s uniqueness.
- ND21, §5.2 (Step 2), pp. 20–21: Proves the rationality of f\_t(θ) for a putative MZV relation by the same steps (with a = 0).
- CCM23, Theorem 4.1.1, p. 13; proof of Lemma 5.1.1, pp. 22–24: States the ABP criterion and runs the same argument for CMPL values with an Eulerian right side.

**Planet:** ABP independence criterion.

<a id="MZ-3-eulerian-tails"></a>

### MZ.3.12 The Eulerian suffix constraint

Node `MZ.3/eulerian-tails`, a theorem.

**Statement.** Under the conclusion of MZ.3/independence-criterion: (1) if (q − 1) ∤ w and the 𝔏-values come from ACMPL or CMPL periods, then a = 0. (2) For CMPL values (Q = 1) and a nonempty proper prefix s ∈ 𝔦(M): Σ\_{s′} a\_{(s,s′)}Li(s′) ∈ K·π̃^{w−wt(s)}, so either Σ\_{s′} a\_{(s,s′)}Li(s′) = 0 or (q − 1) | (w − wt(s)); if for every nonempty prefix the suffix values Li(s′), (s, s′) ∈ Supp, are K-independent, then every index in the support has (q − 1) | s\_2, …, s\_r. (3) For MZVs (Q = H), every nonempty proper prefix t gives Σ\_i a\_iΓ\_{suffix\_i}ζ\_A(suffix\_i) ∈ K·π̃^{w−wt(t)}, with i ranging over its support and Γ\_{suffix\_i} the product of the suffix factorials. If these suffix values are K-independent then the sum is nonzero and (q − 1) | (w − wt(t)). In particular, after discarding zero coefficients, if t belongs to exactly one s\_i, then ζ\_A(s\_i after t)/π̃^{w−wt(t)} ∈ K, and (q − 1) divides the suffix weight; for indices in I^0\_w this forces every entry of s\_i after the first position not shared with another index to equal q − 1.

**Hypotheses.** The setting and conclusion of MZ.3/independence-criterion. Every index called part of the support has nonzero coefficient; repeated indices are collected first.

**Proof sketch.**

1. f\_{(s;1)}(θ) = Σ\_{s′} α\_{(s,s′)}(θ)𝓛(s′)(θ) = Σ\_{s′}a\_{(s,s′)}Li(s′)/π̃^{w−wt(s)} lies in K by the criterion and MZ.3/deformation-specialisation.
2. A nonzero element of K\_∞ that is Eulerian of weight w − wt(s) forces (q − 1) | (w − wt(s)) (MZ.0/eulerian); the support statement follows when the suffix values are independent.
3. For (1): the constant a corresponds to aπ̃^w, and a nonzero a would make π̃^w a combination of elements of C\_const = ⋃\_n F\_{q^n}((1/θ)), impossible for (q − 1) ∤ w by MZ.0/eulerian.
4. For (3), the period specialisation gives f\_t(θ) = (Σ\_i a\_iΓ\_{suffix\_i}ζ\_A(suffix\_i))/π̃^{w−wt(t)} ∈ K. Each factorial is nonzero, so independence of the suffixes makes its numerator nonzero. For an isolated tail this is automatic from nonvanishing. Successive isolated tails, when all entries are &lt; q, force each later entry to equal q − 1.

**Acceptance.** For q = 2 every weight is divisible by q − 1 and the constraint is empty.

**Needs.** `MZ.3/independence-criterion`, `MZ.3/deformation-specialisation`, `MZ.0/eulerian`, `MZ.0/mzv-nonvanishing`.

**Sources.**

- CCM23, Lemma 5.1.1(1) and its proof, pp. 22–24: Proves that each suffix combination is Eulerian of the suffix weight and deduces the support condition (q − 1) | s\_2, …, s\_r.
- ND21, §5.3 (Step 3), pp. 21–22; §6, Step 3, (6.1), p. 23: Deduces from rationality that isolated tails are Eulerian and that later entries of small-entry indices equal q − 1, and the divisibility of suffix weights for q-indivisible indices.
- IKLNDP24, §3.3, opening and the consequence of Theorem 2.4, pp. 36–37: Shows a = 0 when q − 1 ∤ w and that suffixes have entries divisible by q − 1 and trivial characters.

## MZ.4. Frobenius difference systems and their solution spaces

**Layer targets.**

Targets.

- The coefficient ring R = {f/g : f ∈ K̄\[t\], 0 ≠ g ∈ F\_q\[t\]}, the system (E\_M): ε\_s^{(1)} = (ε\_s + Σ\_{n ≥ 1, (s,n) ∈ 𝔦(M)} ε\_{(s,n)})(t − θ)^{w − wt(s)} for s in the initial segments 𝔦(M) of a set M of weight-w indices, the index set IND°\_w (no entry divisible by q, later entries divisible by q − 1), the system (E\_w) and its F\_q(t)-space of solutions X\_w; the character-twisted system of Im–Kim–Le–Ngo Dac–Pham (3.4)–(3.5).
- Monic Frobenius descent: if ε ∈ R solves ε^{(1)} = εF + G with F, G ∈ A\[t\], F of positive t-degree with leading coefficient in F\_q^×, then ε ∈ F\_q(t)\[θ\]; and the θ-degree bound deg\_θ ε\_s ≤ (w − wt(s))/(q − 1) for solutions of (E\_M), with the Kuan–Lin form deg\_θ δ ≤ max{qm/(q − 1), deg\_θ F/q} for εδ = δ^{(−1)}(t − θ)^m + F^{(−1)}.
- The key lemma (Chang–Chen–Mishiba Lemma 5.1.1): a K-linear relation Σ a\_s Li(s) ∈ K·π̃^w supported on M, with lower-weight independence, gives the Eulerian support constraint and a solution of (E\_M) with ε\_s = a\_s|\_{θ=t} for s ∈ M.
- The dimension theorem dim\_{F\_q(t)} X\_w = 1 if (q − 1) | w and 0 otherwise, with a normalised generator (Chang–Chen–Mishiba Theorem 4.3.5), and its character-twisted analogue: the system (3.4)–(3.5) has no nonzero solution unless (q − 1) | w and the character is trivial, and then its solutions for a chosen support are proportional over F\_q(t), so their span after localising has dimension at most one.
- Ngo Dac's two-row system for q &lt; w ≤ 2q − 2: every solution of (6.3)–(6.4) with a\_1, a\_2 ∈ F\_q\[t\] has a\_2 = 0; at w = 2q − 2 the nonzero solutions δ\_2 = 0, δ\_1 = a(t − θ)^{2q}, a\_1 = a(t^q − t) exist for a ∈ F\_q\[t\].

Acceptance: (E\_0) is ε\_∅^{(1)} = ε\_∅ with X\_0 = F\_q(t); (E\_q), with IND°\_q = {(1, q − 1)}, has three equations and X\_q is a line when q = 2 and zero when q > 2; the degree-zero analogue of monic descent fails (a root of δ² − δ = 1 in F\_4 solves δ^{(1)} = δ + 1 over F\_2 without lying in F\_2).

**Inputs from other layers:** `MZ.3`, `DM.8`.

<a id="MZ-4-frobenius-system"></a>

### MZ.4.1 The Frobenius difference systems (E\_M) and their solution spaces

Node `MZ.4/frobenius-system`, a definition.

**Statement.** Let R = {f/g : f ∈ K̄\[t\], 0 ≠ g ∈ F\_q\[t\]} ⊂ K̄(t), an F\_q(t)-algebra stable under the coefficient twist f ↦ f^{(1)} (which fixes F\_q(t)). For an index s let 𝔦(s) = {∅, (s\_1), (s\_1, s\_2), …, s} and for a set M let 𝔦(M) = ∪\_{s ∈ M}𝔦(s). For w ≥ 0 and ∅ ≠ M ⊂ I\_w, the system (E\_M) for (ε\_s)\_{s ∈ 𝔦(M)} ∈ R^{𝔦(M)} is ε\_s^{(1)} = (ε\_s + Σ ε\_{(s,n)})(t − θ)^{w−wt(s)} for s ∈ 𝔦(M), the sum over positive integers n with (s, n) ∈ 𝔦(M). Let IND°\_0 = {∅} and, for w > 0, IND°\_w = {s ∈ IND\_w : (q − 1) | s\_2, …, s\_{dep(s)}}; (E\_w) is (E\_M) for M = IND°\_w, and X\_w ⊂ R^{𝔦(IND°\_w)} is its set of solutions, an F\_q(t)-vector space. For arrays of a fixed character ε with γ^{q−1} = ε, the twisted system of Im–Kim–Le–Ngo Dac–Pham asks for δ\_{(t;ε)} ∈ K̄\[t\] with δ\_{(t;ε)} = (δ\_{(t;ε)} + Σ δ\_{child})^{(−1)}(t − θ)^{w−wt(t)} at nonempty prefixes and with the children terms multiplied by γ^{(−1)} at ∅, δ at a full index being its coefficient a\_i(t).

**Hypotheses.** w ≥ 0; M a nonempty finite set of weight-w indices.

**Proof sketch.**

1. R is stable under twisting because g^{(1)} = g for g ∈ F\_q\[t\]; F\_q(t)-linear combinations of solutions are solutions since the twist fixes F\_q(t).
2. For s ∈ M the equation reads ε\_s^{(1)} = ε\_s, so ε\_s ∈ F\_q(t) (DM.8/analytic-fixed-fields).

**Uses.**

- MZ.4/key-lemma: a relation among CMPL values produces a solution of (E\_M)
- MZ.4/solution-space-dimension: dim X\_w is computed
- MZ.5/cmpl-ind-basis: X\_w = 0 or a line forces the relation to be trivial or a multiple of the π̃^w relation

**API.**

- `FunctionFieldMZV.denomRing` (data): R = K̄\[t\] localised at F\_q\[t\] ∖ {0}.
- `FunctionFieldMZV.initialSegments` (data): 𝔦(M), closed under prefixes.
- `FunctionFieldMZV.frobeniusSystem` (data): The system (E\_M) as a predicate on R^{𝔦(M)}.
- `FunctionFieldMZV.eulerianIndices` (data): IND°\_w.
- `FunctionFieldMZV.solutionSpace` (data): X\_w as an F\_q(t)-subspace of R^{𝔦(IND°\_w)}.
- `FunctionFieldMZV.frobeniusSystem_leaf` (simp): For s ∈ M a solution has ε\_s ∈ F\_q(t).

**Unit tests.**

- `FunctionFieldMZV.frobeniusSystem_test_zero` (degenerate): X\_0 = F\_q(t).
- `FunctionFieldMZV.frobeniusSystem_test_q` (computation): IND°\_q = {(1, q − 1)} and 𝔦(IND°\_q) = {∅, (1), (1, q − 1)}.
- `FunctionFieldMZV.frobeniusSystem_test_2q` (computation): For q ≥ 3, IND°\_{2q−2} = {(q − 1, q − 1), (2q − 2)}.
- `FunctionFieldMZV.frobeniusSystem_test_not_ind` (non-example): IND°\_w differs from IND\_w: for q = 3, (1, 1) ∈ IND\_2 but (1, 1) ∉ IND°\_2 since q − 1 = 2 does not divide 1.

**Acceptance.** (E\_0) is ε\_∅^{(1)} = ε\_∅ and X\_0 = F\_q(t); for w = q, IND°\_q = {(1, q − 1)} and (E\_q) has three equations; for q ≥ 3 and w = 2q − 2, IND°\_w = {(q − 1, q − 1), (2q − 2)} and (E\_w) has four equations.

**Needs.** `MZ.0/index-families`, `DM.8/coefficient-twist`, `DM.8/analytic-fixed-fields`.

**Sources.**

- CCM23, §4.2, the ring R and (E\_M) with Remark 4.2.1, p. 14; §4.3, (4.3.1), Example 4.3.2, Definition 4.3.3 and Remark 4.3.4, pp. 15–16: Defines R, the initial segments, the system (E\_M), the set IND°\_w, the system (E\_w) and its F\_q(t)-space of solutions X\_w, with the examples w = 0, q and 2q − 2.
- IKLNDP24, proof of Theorem 3.4, (3.4)–(3.5), pp. 37–38: Writes the gauge equation for ACMPL relations of fixed character as the system (3.4)–(3.5).

<a id="MZ-4-monic-frobenius-descent"></a>

### MZ.4.2 Monic Frobenius descent

Node `MZ.4/monic-frobenius-descent`, a theorem.

**Statement.** Let F = Σ\_{i=0}^{n} f\_i t^i and G be in A\[t\], with n = deg\_t F ≥ 1 and f\_n ∈ F\_q^×. If ε ∈ R satisfies ε^{(1)} = εF + G, then ε ∈ F\_q(t)\[θ\]; if ε ∈ K̄\[t\], then ε ∈ A\[t\]. More generally, if a subring B of a field of characteristic p is stable under q-th powers, F ∈ B\[t\] is monic of positive degree, G ∈ B\[t\], and a polynomial δ over the field satisfies δ^{(1)} = Fδ + G, then δ ∈ B\[t\]. The twisted variant: if εδ = δ^{(−1)}(t − θ)^m + F^{(−1)} with ε ∈ F\_q^×, m ≥ 1, δ ∈ K̄\[t\] and F ∈ F\_q\[t, θ\] (resp. F̄\_q\[t, θ\]), then δ ∈ F\_q\[t, θ\] (resp. F̄\_q\[t, θ\]); the proof uses ε^q = ε.

**Hypotheses.** deg\_t F ≥ 1 is essential; for a general subring B the twist f ↦ f^{(1)} is the coefficientwise q-th power map, which needs no perfectness.

**Proof sketch.**

1. Multiply ε by a common denominator g ∈ F\_q\[t\] (g^{(1)} = g) to assume ε ∈ K̄\[t\] of t-degree m; then G has t-degree m + n.
2. Comparing coefficients of t^i for i = m + n, m + n − 1, …: the top coefficients give a\_{i−n}f\_n = −g\_i − Σ\_{j > i−n}a\_jf\_{i−j}, which determines a\_m, a\_{m−1}, … successively in A; once i ≤ m the extra term a\_i^q appears but involves an already determined coefficient, so every coefficient lies in A (Chang–Chen–Mishiba Lemma 4.2.2).
3. The general and twisted versions are the same descending induction (Im–Kim–Le–Ngo Dac–Pham Lemma 3.3, after Kuan–Lin).
4. Positive degree matters: over B = F\_2, F = 1 and G = 1, a root δ ∈ F\_4 of δ² − δ = 1 solves δ^{(1)} = δ + 1 without lying in F\_2.

**Acceptance.** Applied to Ngo Dac’s equation δ\_2^{(1)} = (t − θ^q)^{q−1}(δ\_2 + a\_2) it puts δ\_2 in A\[t\] (source issue E6).

**Needs.** `MZ.4/frobenius-system`, `DM.8/coefficient-twist`.

**Sources.**

- CCM23, Lemma 4.2.2 and its proof, pp. 14–15: Proves that a solution in R of ε^{(1)} = εF + G with F monic up to F\_q^× of positive t-degree lies in F\_q(t)\[θ\], by descending coefficient comparison.
- IKLNDP24, Lemma 3.3 and its proof, pp. 34–35: Proves the twisted variant with a character ε and F ∈ F\_q\[t, θ\] or F̄\_q\[t, θ\], after Kuan–Lin.
- ND21, §6, Step 3, p. 23: Cites Kuan–Lin for δ\_1, δ\_2 ∈ K\[t\]; the needed membership in A\[t\] follows from this lemma (source issue E6).

**Planet:** Monic Frobenius descent.

<a id="MZ-4-theta-degree-bound"></a>

### MZ.4.3 The θ-degree bound for solutions

Node `MZ.4/theta-degree-bound`, a theorem.

**Statement.** If (ε\_s) ∈ R^{𝔦(M)} solves (E\_M) (w ≥ 0, ∅ ≠ M ⊂ I\_w), then ε\_s ∈ F\_q(t)\[θ\] and deg\_θ ε\_s ≤ (w − wt(s))/(q − 1) for every s ∈ 𝔦(M). In the twisted form, a solution δ ∈ F\_q\[t, θ\] of εδ = δ^{(−1)}(t − θ)^m + F^{(−1)} has deg\_θ δ ≤ max{qm/(q − 1), deg\_θ F/q}.

**Hypotheses.** As in MZ.4/frobenius-system and MZ.4/monic-frobenius-descent.

**Proof sketch.**

1. Induct on w − wt(s). For s ∈ M, ε\_s ∈ F\_q(t). Otherwise the children ε\_{(s,n)} lie in F\_q(t)\[θ\] by induction; after multiplying the equation by a common denominator g ∈ F\_q\[t\] of ε\_s and of the children (g^{(1)} = g), MZ.4/monic-frobenius-descent applies with F = (t − θ)^{w−wt(s)} and G = g(t − θ)^{w−wt(s)}Σε\_{(s,n)} ∈ A\[t\], so ε\_s ∈ F\_q(t)\[θ\].
2. If deg\_θ ε\_s exceeded (w − wt(s))/(q − 1), then deg\_θ ε\_s^{(1)} = q deg\_θ ε\_s would exceed both deg\_θ(ε\_s(t − θ)^{w−wt(s)}) and the degrees of the other terms (bounded by induction), a contradiction.
3. The twisted bound is the same comparison of θ-degrees after twisting once.

**Acceptance.** For s ∈ M the bound gives deg\_θ ε\_s ≤ 0, consistent with ε\_s ∈ F\_q(t).

**Needs.** `MZ.4/frobenius-system`, `MZ.4/monic-frobenius-descent`.

**Sources.**

- CCM23, Lemma 4.2.3 and its proof, pp. 14–15: Proves ε\_s ∈ F\_q(t)\[θ\] and deg\_θ ε\_s ≤ (w − wt(s))/(q − 1) for solutions of (E\_M).
- IKLNDP24, Lemma 3.3, second assertion, pp. 34–35: Proves deg\_θ δ ≤ max{qm/(q − 1), deg\_θ F/q}.

<a id="MZ-4-key-lemma"></a>

### MZ.4.4 The key lemma: relations give solutions of (E\_M)

Node `MZ.4/key-lemma`, a theorem.

**Statement.** Let w ≥ 0, ∅ ≠ M ⊂ I\_w and P = Σ a\_s\[s\] ∈ H with a\_s ∈ K and Supp(P) ⊂ M. Suppose Li\_P(1) = Σ a\_s Li(s) ∈ K·π̃^w and, for each 0 ≤ ℓ &lt; w, the values Li(s), s ∈ 𝔦(M) ∩ I\_ℓ, are K-linearly independent. Then (1) for each s ∈ 𝔦(M), Σ\_{s′} a\_{(s,s′)}Li(s′) = 0 or (q − 1) | (w − wt(s)) (MZ.3/eulerian-tails); and (2) (E\_M) has a solution (ε\_s) ∈ F\_q(t)\[θ\]^{𝔦(M)} with ε\_s = a\_s|\_{θ=t} for every s ∈ M.

**Hypotheses.** Coefficients a\_s cleared to lie in A (so a\_s|\_{θ=t} ∈ F\_q\[t\]); w > 0 for (2) to be non-trivial.

**Proof sketch.**

1. Apply MZ.3/independence-criterion to the pairs (s; 1), s ∈ M, with a = −c where Li\_P(1) = cπ̃^w; its hypotheses are the assumptions.
2. The gauge equation \[\[Id, 0\], \[g, 1\]\]^{(−1)}\[\[Φ′, 0\], \[v, 1\]\] = \[\[Φ′, 0\], \[0, 1\]\]\[\[Id, 0\], \[g, 1\]\] has rational entries with denominator in F\_q\[t\] (DM.8/constant-denominator); put ε\_s = g\_s^{(−1)} for s ∈ 𝔦(M) ∖ M and ε\_s = a\_s|\_{θ=t} for s ∈ M.
3. Reading the gauge equation row by row gives exactly (E\_M); MZ.4/theta-degree-bound puts the solution in F\_q(t)\[θ\].

**Acceptance.** For M = {(w)} the system is ε\_∅^{(1)} = (ε\_∅ + ε\_{(w)})(t − θ)^w, ε\_{(w)}^{(1)} = ε\_{(w)}.

**Needs.** `MZ.3/independence-criterion`, `MZ.3/eulerian-tails`, `MZ.4/frobenius-system`, `MZ.4/theta-degree-bound`, `DM.8/constant-denominator`.

**Sources.**

- CCM23, Lemma 5.1.1 and its proof, pp. 22–24: Proves both parts: the Eulerian alternative for each prefix, and a solution of (E\_M) in F\_q(t)\[θ\] with ε\_s = a\_s|\_{θ=t} on M.

**Planet:** The key lemma.

<a id="MZ-4-solution-space-dimension"></a>

### MZ.4.5 The dimension of the solution space X\_w

Node `MZ.4/solution-space-dimension`, a theorem.

**Statement.** For every w ≥ 0, dim\_{F\_q(t)}X\_w = 1 if (q − 1) | w and 0 otherwise. When w = ℓ(q − 1), a generator (η\_{ℓ;s}) can be chosen with η\_{ℓ;∅} = Σ\_{i=0}^{ℓ}b\_{ℓi}(t − θ)^i, b\_{ℓℓ} = 1 and b\_{ℓi} ∈ T·F\_p\[T\]\_{(T)} for i &lt; ℓ, where T = t − t^q and F\_p\[T\]\_{(T)} is the localisation at (T).

**Hypotheses.** w ≥ 0.

**Proof sketch.**

1. By MZ.4/theta-degree-bound, X\_w ⊂ F\_q(t)\[θ\]^{𝔦(IND°\_w)} with deg\_θ ε\_∅ ≤ ℓ when w = ℓ(q − 1) + s′, 0 ≤ s′ &lt; q − 1.
2. The equations at nonempty prefixes (ℓ − j)(q − 1) \[+ s′\] are copies of (E\_{j(q−1)}), so by induction on ℓ the children of ∅ are f\_j·(normalised generators of lower weight), f\_j ∈ F\_q(t).
3. Write ε\_∅ = Σ a\_i(t − θ)^i and substitute into the root equation; using t − θ^q = T + (t − θ)^q with T = t − t^q and comparing coefficients of (t − θ)^ν for ν = iq (i &lt; ℓ − m) and ν ≥ w gives a square (or one-larger) linear system U(a, f)^T = a\_ℓ b over F\_p\[T\]\_{(T)}. In the divisible case there are 2ℓ − m unknowns and equations (source issue E22 corrects the matrix size printed in point (iii)).
4. det(U mod T) = ±1 by the explicit block structure (identity, then −Id\_n and m blocks −Id\_{q−1} with inserted unit rows), so U is invertible over the local ring: the solution is unique up to the free parameter a\_ℓ when (q − 1) | w, and zero when (q − 1) ∤ w.

**Acceptance.** X\_0 = F\_q(t); for q = 2 every weight is divisible by q − 1 and X\_w is a line; for q = 3 and w = 5, X\_5 = 0.

**Needs.** `MZ.4/frobenius-system`, `MZ.4/theta-degree-bound`.

**Sources.**

- CCM23, Theorem 4.3.5 and its proof, pp. 16–21: Computes dim X\_w by induction, reducing to a linear system over F\_p\[T\]\_{(T)} whose determinant is ±1 modulo T, with the normalised generator.

**Planet:** Dimension of the solution space X\_w.

<a id="MZ-4-twisted-system-solutions"></a>

### MZ.4.6 Solutions of the character-twisted system

Node `MZ.4/twisted-system-solutions`, a theorem.

**Statement.** In the twisted system of MZ.4/frobenius-system attached to a putative relation a + Σ a\_i𝔏𝔦(s\_i; ε\_i)(θ) = 0 with s\_i ∈ J′\_w and all ε\_i of character ε under the explicit reduced-support hypotheses (q − 1) | s\_{i2}, … and ε\_i = (ε, 1, …, 1): every solution has, at each nonempty prefix t with m\_t = (w − wt(t))/(q − 1), the form δ\_t = f\_t(X^{m\_t} + Σ\_{i&lt;m\_t}P\_{t,i}(T)X^i) with X = t^q − θ^q, T = t − t^q, f\_t ∈ F\_q\[t\], P\_{t,i} ∈ F\_q(y) of y-adic valuation ≥ 1, and the f of children are F\_q(T)-multiples of f\_t. If (q − 1) ∤ w, or (q − 1) | w and ε ≠ 1, the only solution is zero; if (q − 1) | w and ε = 1, any two polynomial solutions are proportional over F\_q(t). Thus their span in the localised ambient space has dimension at most one; existence of a nonzero solution for an arbitrary chosen support is not asserted.

**Hypotheses.** Finite support of distinct weight-w arrays with q dividing none of their entries, later entries divisible by q − 1, and characters (ε, 1, …, 1); b = 1 after clearing a common denominator.

**Proof sketch.**

1. Induct on m\_t: at leaves δ = a\_i(t) ∈ F\_q\[t\]; at an inner prefix, MZ.4/monic-frobenius-descent and MZ.4/theta-degree-bound give δ\_t ∈ K\[t\] of θ-degree ≤ m\_tq and divisible by (t − θ)^{(q−1)m\_t}; write δ\_t = F(t − θ)^{(q−1)m\_t} with deg\_θ F ≤ m\_t. Since F(t − θ)^{(q−1)m\_t} lies in F\_q\[t, θ^q\], F = Σ\_{0 ≤ i ≤ m\_t/q}f\_{m\_t−iq}(t − θ)^{m\_t−iq} with f ∈ F\_q\[t\], so F(t − θ)^{(q−1)m\_t} = Σ f\_{m\_t−iq}X^{m\_t−i} and F^{(1)} = Σ f\_{m\_t−iq}(T + X)^{m\_t−iq}; comparing powers of X gives a linear system with matrix B over F\_q(y), y = T, whose diagonal entries are ±1 and whose subdiagonal entries have positive y-adic valuation, whence the stated form.
2. At the root, with the extra factor γ^{(−1)} = γ/ε: if (q − 1) ∤ w a θ-degree comparison forces deg\_θ δ ≤ mq and the same triangular system has only the zero solution.
3. If (q − 1) | w, comparing the top coefficient gives εf\_m = f\_m; so ε ≠ 1 forces f\_m = 0 and then everything vanishes, while ε = 1 leaves one free parameter. The comparison proves uniqueness up to a rational factor when solutions exist. Multiplying a polynomial solution by an arbitrary element of F\_q(t) need not preserve polynomiality, and a smaller support can force the free parameter to vanish.

**Acceptance.** For q = 2 the character is trivial; after ε\_t = δ\_t^{(−1)} and localising at F\_q\[t\] ∖ {0}, the system on the full reduced support is (E\_w). A smaller support is extended by zero.

**Needs.** `MZ.4/frobenius-system`, `MZ.4/monic-frobenius-descent`, `MZ.4/theta-degree-bound`.

**Sources.**

- IKLNDP24, proof of Theorem 3.4, §3.3 claims 1)–2), Case 1 and Case 2 with its subcases, pp. 37–42: Determines the coefficient shape and rational proportionality of solutions on the reduced support, ruling out nonzero solutions at nondivisible weights or nontrivial total character; it does not assert existence on every chosen support.

<a id="MZ-4-two-row-system"></a>

### MZ.4.7 Ngo Dac’s two-row system in weights q &lt; w ≤ 2q − 2

Node `MZ.4/two-row-system`, a theorem.

**Statement.** Let q > 2, w = q + k − 1 with 2 ≤ k ≤ q − 1 (so q &lt; w ≤ 2q − 2), and let δ\_1, δ\_2 ∈ K̄\[t\], a\_1, a\_2 ∈ F\_q\[t\] satisfy δ\_1 = (δ\_1 + δ\_2H\_k + a\_1H\_w)^{(−1)}(t − θ)^w and δ\_2 = (δ\_2 + a\_2H\_{q−1})^{(−1)}(t − θ)^{q−1} (Ngo Dac (6.3)–(6.4)). Then a\_2 = 0; for 2 ≤ k &lt; q − 1 also a\_1 = 0, while for k = q − 1 the solutions with a\_2 = 0 are δ\_2 = 0, δ\_1 = a(t − θ)^{2q}, a\_1 = a(t^q − t) with a ∈ F\_q\[t\] (the Eulerian weight 2q − 2). In particular there is no solution with a\_1a\_2 ≠ 0. In detail: δ\_1, δ\_2 ∈ A\[t\]; δ\_2 = f(θ^q − t^q) and a\_2 = f(t^q − t) for a unique f ∈ F\_q\[t\]; deg\_θ δ\_1 ≤ ⌊qw/(q − 1)⌋; and the coefficient comparisons in θ force f = 0.

**Hypotheses.** q > 2; H\_k = H\_{q−1} = 1 and H\_w = (t^q − t) + (k − 1)(t^q − θ^q) (MZ.3/anderson-thakur-polynomials).

**Proof sketch.**

1. Twisting once and MZ.4/monic-frobenius-descent put δ\_1, δ\_2 in A\[t\]; a θ-degree comparison bounds deg\_θ δ\_2 ≤ q and deg\_θ δ\_1 ≤ ⌊qw/(q − 1)⌋ (source issue E6 replaces the K\[t\] statement quoted from Kuan–Lin).
2. Second row: (θ^q − t^q, t^q − t) is a particular solution; the difference Δ = (t^q − t)δ\_2 − a\_2(θ^q − t^q) satisfies Δ = Δ^{(−1)}(t − θ)^{q−1}, so Δ = 0 by t-degree; evaluating at t = β ∈ F\_q shows t^q − t divides a\_2, giving the unique f.
3. First row: δ\_1 is divisible by (t − θ)^w, with an integral quotient of θ-degree ≤ 1 (k &lt; q − 1) or ≤ 2 (k = q − 1); write δ\_1 = (aθ + b)(t − θ)^w, resp. (aθ² + bθ + c)(t − θ)^w, with a, b, c ∈ F\_q\[t\].
4. Interior case: comparing the coefficients of θ^k and θ^{k−1} gives a = b = 0, then θ^q gives f = (k − 1)a\_1, and finally (t^q − t)a\_1 = 0, so a\_1 = 0 and f = 0.
5. Endpoint: the coefficients of θ^{2q−1}, θ^{2q−2} give aθ² + bθ + c = a(t − θ)²; with h = a(t^q − t) − a\_1 one obtains h\[(t − θ^q)² − (t − θ)^{2q}\] = (θ^q − t^q)f(t^q − t); substituting θ = t gives h = 0, and then f = 0, so a\_2 = 0 and a\_1 = a(t^q − t). Conversely these are solutions, by the identity (t^q − t)\[(t^q − t) − 2(t^q − θ^q)\] = (t − θ^q)² − (t^q − θ^q)².
6. Ngo Dac’s argument only needs the absence of solutions with a\_2 ≠ 0, since the putative relation involves both indices with nonzero coefficients (MZ.5/q-indivisible-independence).

**Acceptance.** For q = 3, w = 4 (k = 2), take a = 1: a\_1 = t³ − t, a\_2 = δ\_2 = 0 and δ\_1 = (t − θ)^6 satisfy both rows. This catches the false assertion that every solution is zero; a\_2 ≠ 0 is what the independence proof excludes.

**Needs.** `MZ.4/monic-frobenius-descent`, `MZ.4/theta-degree-bound`, `MZ.3/anderson-thakur-polynomials`, `MZ.3/independence-criterion`.

**Sources.**

- ND21, §6, Step 3, (6.2)–(6.5), pp. 23–24: Reduces Theorem 6.2 to the two-row system, solves the second row explicitly and derives contradictions from θ-coefficient comparisons in the interior case and at k = q − 1.

## MZ.5. Linear independence, Thakur's basis and the dimension theorems

**Layer targets.**

Targets.

- Ngo Dac's theorems: the MZVs indexed by I^0\_w are K-linearly independent for every w (Theorem B), I^T\_w is a basis of Z\_w for w ≤ q (Corollary C), the MZVs indexed by IND\_w are independent for q > 2 and w ≤ 2q − 2 (Theorem 6.2), and I^T\_w is a basis with dim\_K Z\_w = d(w) for w ≤ 2q − 2 (Theorem D).
- The CMPL basis {Li(s) : s ∈ IND\_w} of Z\_w (Chang–Chen–Mishiba Theorem 5.2.1) and Thakur's basis theorem: for every w ≥ 1, {ζ\_A(s) : s ∈ I^T\_w} is a K-basis of Z\_w and dim\_K Z\_w = d(w) (Todd's dimension conjecture), also over K̄ (Chang–Chen–Mishiba Theorem 1.2.4; Im–Kim–Le–Ngo Dac–Pham Theorem B).
- All K-linear relations among MZVs of weight w are generated by \[s\] − U^ζ(s), s ∈ I\_w ∖ I^T\_w, and Ker 𝔏^ζ = ⊕\_w R\_w (Chang–Chen–Mishiba Theorem 5.4.2).
- The character splitting of relations among ACMPL periods, the relations theorem for normalised ACMPL periods indexed by J′\_w augmented by 1 (Im–Kim–Le–Ngo Dac–Pham Theorem 3.4), the Hoffman-like basis AS\_w of AL\_w with dim\_K AL\_w = s(w) (Theorem 3.6), the lower bound dim\_K Z\_w ≥ d(w) through CMPLs (Proposition 4.10) and the dimension of alternating MZVs dim\_K AZ\_w = s(w) with basis AS\_w (Theorem A).
- The direct small-weight bounds for AMZVs without ACMPLs (Im–Kim–Le–Ngo Dac–Pham Propositions 4.11 and 4.13) and the v-adic upper bound dim\_K Z\_{v,w} ≤ d(w) − d(w − (q − 1)) (Chang–Chen–Mishiba Corollary 1.2.7).

Acceptance: dim\_K Z\_1 = 1 and dim\_K Z\_q = 2^{q−1} − 1; for q = 3, I^T\_4 = {(1,1,1,1), (1,1,2), (1,2,1), (2,1,1), (2,2), (3,1)} is a basis of Z\_4, so dim\_K Z\_4 = d(4) = 6, while IND\_4 = {(4), (2,2), (2,1,1), (1,2,1), (1,1,2), (1,1,1,1)}; dim\_K AZ\_1 = q − 1 and, for q = 3, dim\_K AZ\_4 = s(4) = 46.

**Inputs from other layers:** `MZ.2`, `MZ.4`.

<a id="MZ-5-small-entry-independence"></a>

### MZ.5.1 Independence of small-entry multiple zeta values

Node `MZ.5/small-entry-independence`, a theorem.

**Statement.** For every w ≥ 1 the MZVs ζ\_A(s), s ∈ I^0\_w (every entry &lt; q), are K-linearly independent, hence K̄-linearly independent; so dim\_K Z\_w ≥ |I^0\_w| = c(w).

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. Induct on w; for w = 1, ζ\_A(1) ≠ 0. A relation with a single index is impossible by MZ.0/mzv-nonvanishing (source issue E16), so assume a relation Σ a\_iΓ\_{s\_i}ζ\_A(s\_i) = 0, a\_i ∈ A ∖ {0}, with at least two indices.
2. I^0 is closed under taking prefixes (MZ.0/index-families), so by induction and MZ.3/chang-descent the lower-weight prefix values are independent: (LW) holds, and MZ.3/independence-criterion applies with Q = H and a = 0.
3. By MZ.3/eulerian-tails (3), every entry of s\_i after its first unshared position equals q − 1.
4. Choose two indices with a common prefix of maximal length m; their remaining entries after position m + 1 all equal q − 1 and their weights agree, so their (m + 1)-th entries are congruent modulo q − 1 and lie in \[1, q − 1\], hence equal, contradicting maximality.

**Acceptance.** For q = 2, I^0\_w = {(1, …, 1)} and the theorem says ζ\_A(1, …, 1) ≠ 0.

**Needs.** `MZ.3/independence-criterion`, `MZ.3/eulerian-tails`, `MZ.3/chang-descent`, `MZ.3/mz-property-values`, `MZ.0/mzv-nonvanishing`, `MZ.0/index-families`, `MZ.0/counting`.

**Sources.**

- ND21, Theorem B, p. 3, and its proof, §5, pp. 18–22; Remark 5.1, p. 22: Proves the K-linear independence of the MZVs in T^0\_w by induction on the weight through the ABP criterion, rationality of suffix combinations and the longest-common-prefix argument, noting that T^0 is prefix-closed.

**Planet:** Independence of small-entry MZVs.

<a id="MZ-5-thakur-basis-small-weight"></a>

### MZ.5.2 Thakur’s basis through weight q

Node `MZ.5/thakur-basis-small-weight`, a theorem.

**Statement.** For 1 ≤ w ≤ q, I^T\_w = I^0\_w and {ζ\_A(s) : s ∈ I^T\_w} is a K-basis of Z\_w; dim\_K Z\_w = d(w).

**Hypotheses.** 1 ≤ w ≤ q.

**Proof sketch.**

1. For w ≤ q, an index of weight w all of whose entries are ≤ q and whose last entry is &lt; q has all entries &lt; q, unless it is (q), which lies in neither family; so I^T\_w = I^0\_w.
2. Spanning is MZ.2/brown-spanning and independence MZ.5/small-entry-independence; the count is MZ.0/counting.

**Acceptance.** dim\_K Z\_1 = 1, dim\_K Z\_2 = 2 for q > 2, and dim\_K Z\_q = 2^{q−1} − 1.

**Needs.** `MZ.5/small-entry-independence`, `MZ.2/brown-spanning`, `MZ.0/counting`.

**Sources.**

- ND21, Corollary C, p. 4: Deduces from Theorem B that T\_w = T^0\_w is a basis for w ≤ q, a purely transcendental result since the algebraic part is trivial there.

<a id="MZ-5-q-indivisible-independence"></a>

### MZ.5.3 Independence of q-indivisible MZVs through weight 2q − 2

Node `MZ.5/q-indivisible-independence`, a theorem.

**Statement.** For q > 2 and 1 ≤ w ≤ 2q − 2, the MZVs ζ\_A(s), s ∈ IND\_w, are K-linearly independent.

**Hypotheses.** q > 2, w ≤ 2q − 2.

**Proof sketch.**

1. Induct on w. For w ≤ q, IND\_w = I^0\_w and MZ.5/small-entry-independence applies (source issue E7: the source writes w &lt; q).
2. For q &lt; w ≤ 2q − 2, apply strong induction also to the prefixes and suffixes of each supported index, all of which remain q-indivisible and have smaller weight. Prefix independence supplies (LW). For each nonempty proper prefix t, MZ.3/eulerian-tails (3) gives a factorial-weighted suffix combination in K·π̃^{w−wt(t)}; suffix independence and nonzero collected coefficients make this combination nonzero. Thus (q − 1) | (w − wt(t)). Comparing successive prefixes forces every entry after the first to be divisible by q − 1.
3. With w ≤ 2q − 2 this leaves only (w) and (k, q − 1), k = w − q + 1 ∈ \[2, q − 1\], so the relation is a\_1Γ\_wζ\_A(w) + a\_2ζ\_A(k, q − 1) = 0 with a\_1, a\_2 ≠ 0 (single-index relations being excluded as in MZ.5/small-entry-independence).
4. Its gauge equation is the two-row system, which has no solution with nonzero a\_1, a\_2 (MZ.4/two-row-system).

**Acceptance.** At w = 2q − 1 the statement fails: ζ\_A(2q − 1) + D\_1ζ\_A(1, 2q − 2) = 0 (MZ.2/next-weight-relation).

**Needs.** `MZ.5/small-entry-independence`, `MZ.3/independence-criterion`, `MZ.3/eulerian-tails`, `MZ.4/two-row-system`, `MZ.0/index-families`.

**Sources.**

- ND21, Theorem 6.2 and its proof, pp. 22–24; Remark 6.3, p. 24: Proves the independence of T′\_w for q > 2 and w ≤ 2q − 2 by the reduction to two indices and the two-row computation, and explains why the method stops at 2q − 1.

<a id="MZ-5-theorem-d"></a>

### MZ.5.4 Thakur’s basis through weight 2q − 2

Node `MZ.5/theorem-d`, a theorem.

**Statement.** For every prime power q and 1 ≤ w ≤ 2q − 2, {ζ\_A(s) : s ∈ I^T\_w} is a K-basis of Z\_w, and dim\_K Z\_w = d(w).

**Hypotheses.** 1 ≤ w ≤ 2q − 2.

**Proof sketch.**

1. For q = 2, 2q − 2 = q and this is MZ.5/thakur-basis-small-weight.
2. For q > 2, MZ.5/q-indivisible-independence gives d(w) = |IND\_w| independent elements of Z\_w, while MZ.2/brown-spanning gives dim\_K Z\_w ≤ d(w) with I^T\_w spanning; so I^T\_w is a basis.

**Acceptance.** For q = 3, w = 4: I^T\_4 = {(1,1,1,1), (1,1,2), (1,2,1), (2,1,1), (2,2), (3,1)} is a basis of Z\_4 and dim\_K Z\_4 = 6.

**Needs.** `MZ.5/q-indivisible-independence`, `MZ.5/thakur-basis-small-weight`, `MZ.2/brown-spanning`, `MZ.0/counting`.

**Sources.**

- ND21, Theorem D, p. 4, and its proof, p. 24: Deduces the basis property for w ≤ 2q − 2 from Theorem A, Lemma 6.1 and Theorem 6.2.

<a id="MZ-5-cmpl-ind-basis"></a>

### MZ.5.5 The CMPL basis indexed by IND\_w

Node `MZ.5/cmpl-ind-basis`, a theorem.

**Statement.** For every w ≥ 0, the values Li(s), s ∈ IND\_w, form a K-basis of Z\_w.

**Hypotheses.** w ≥ 0 (IND\_0 = {∅}, Li(∅) = 1).

**Proof sketch.**

1. They span Z\_w by MZ.2/ind-spanning; it remains to show independence, by induction on w (w = 0 is clear).
2. Let P = Σ α\_s(θ)\[s\] be a relation supported on IND\_w. IND is prefix-closed, so the lower-weight hypothesis of MZ.4/key-lemma holds by induction; part (1) and induction give Supp(P) ⊂ IND°\_w, and part (2) with M = IND°\_w gives (ε\_s) ∈ X\_w with ε\_s = α\_s on IND°\_w.
3. If (q − 1) ∤ w, X\_w = 0 (MZ.4/solution-space-dimension), so P = 0.
4. If (q − 1) | w, π̃^w ∈ Z\_w (MZ.1/period-power-in-weight-space), so by MZ.2/ind-spanning there is P\_w ≠ 0 supported on IND\_w with Li\_{P\_w}(1) = π̃^w; the key lemma gives Supp(P\_w) ⊂ IND°\_w and a solution (ε′\_s) ∈ X\_w; X\_w is a line, so (ε\_s) = α(ε′\_s) and P = α(θ)P\_w, whence 0 = Li\_P(1) = α(θ)π̃^w and α = 0.

**Acceptance.** For q = 3, IND\_4 = {(4), (2, 2), (2, 1, 1), (1, 2, 1), (1, 1, 2), (1, 1, 1, 1)} gives six independent values Li(s) spanning Z\_4.

**Needs.** `MZ.2/ind-spanning`, `MZ.4/key-lemma`, `MZ.4/solution-space-dimension`, `MZ.1/period-power-in-weight-space`, `MZ.0/index-families`.

**Sources.**

- CCM23, Theorem 5.2.1 and its proof, p. 25: Proves that the Li\_s(1), s ∈ IND\_w, form a basis of Z\_w by induction, using Lemma 5.1.1, Theorem 4.3.5 and an element P\_w with Li\_{P\_w}(1) = π̃^w.

**Planet:** CMPL basis of Z\_w.

<a id="MZ-5-thakur-basis-theorem"></a>

### MZ.5.6 Thakur’s basis theorem and Todd’s dimension formula

Node `MZ.5/thakur-basis-theorem`, a theorem.

**Statement.** For every w ≥ 1, {ζ\_A(s) : s ∈ I^T\_w} is a K-basis of Z\_w; hence dim\_K Z\_w = d(w) (Todd’s dimension conjecture, the analogue of Zagier’s conjecture) and Thakur’s basis conjecture (the analogue of Hoffman’s) holds. The same family is a K̄-basis of the K̄-span 𝒵\_w of the weight-w MZVs.

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. {ζ\_A(s) : s ∈ I^T\_w} spans Z\_w (MZ.2/brown-spanning), and dim\_K Z\_w = |IND\_w| = d(w) by MZ.5/cmpl-ind-basis and MZ.0/counting; a spanning family of d(w) elements in a space of dimension d(w) is a basis.
2. Independently, Im–Kim–Le–Ngo Dac–Pham obtain dim\_K Z\_w ≥ d(w) from CMPLs (MZ.5/mzv-lower-bound-cmpl) and conclude with Ngo Dac’s spanning theorem.
3. K̄: the elements have the MZ property of weight w (MZ.3/mz-property-values), so K-independence implies K̄-independence (MZ.3/chang-descent (a)).

**Acceptance.** dim\_K Z\_w for q = 2 is the Fibonacci number d(w); for q = 3, dim\_K Z\_5 = d(4) + d(3) + d(2) = 11.

**Needs.** `MZ.5/cmpl-ind-basis`, `MZ.2/brown-spanning`, `MZ.0/counting`, `MZ.3/chang-descent`, `MZ.3/mz-property-values`.

**Sources.**

- CCM23, Theorem 1.2.4, p. 3; §5.3, p. 25; Remark 1.2.6, p. 3: Proves Thakur’s basis conjecture and Todd’s dimension conjecture for every w, and notes the K̄-basis statement by Chang’s descent.
- IKLNDP24, Theorem B, p. 5; §4.3.2, p. 54: Proves the same theorem by the lower bound dim\_K Z\_w ≥ d(w) and Ngo Dac’s upper bound.

**Planet:** Thakur’s basis theorem.

<a id="MZ-5-all-relations"></a>

### MZ.5.7 All linear relations among multiple zeta values

Node `MZ.5/all-relations`, a theorem.

**Statement.** For w ≥ 1 let 𝔏^ζ\_w : H\_w → Z\_w be the realisation and R\_w = Span\_K{\[s\] − U^ζ(s) : s ∈ I\_w ∖ I^T\_w}. Then Ker 𝔏^ζ\_w = R\_w, and Ker(𝔏^ζ : H → K\_∞) = ⊕\_{w ≥ 1}R\_w. After extension of scalars to K̄, the same relations generate all K̄-linear relations among MZVs.

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. R\_w ⊂ Ker 𝔏^ζ\_w by MZ.2/rewriting-theorem (1); since U^ζ fixes I^T, R\_w = Span{P − U^ζ(P) : P ∈ H\_w}.
2. With e from MZ.2/rewriting-theorem (2), P ≡ U^ζ(P) ≡ ⋯ ≡ (U^ζ)^e(P) modulo R\_w, so H\_w/R\_w is spanned by the image of I^T\_w.
3. Hence d(w) ≥ dim H\_w/R\_w ≥ dim H\_w/Ker 𝔏^ζ\_w = dim Z\_w = d(w) (MZ.5/thakur-basis-theorem), forcing Ker 𝔏^ζ\_w = R\_w.
4. Across weights, Chang’s grading theorem (MZ.3/chang-descent (b)) shows that a relation among MZVs of mixed weights splits into homogeneous relations, giving ⊕R\_w; over K̄ the same argument applies to 𝒵 = K̄ ⊗\_K Z.

**Acceptance.** For w = q, R\_q contains \[q\] − L\_1\[1, q − 1\], which is R\_1.

**Needs.** `MZ.5/thakur-basis-theorem`, `MZ.2/rewriting-theorem`, `MZ.2/rewriting-operator`, `MZ.1/realisation-maps`, `MZ.3/chang-descent`.

**Sources.**

- CCM23, Theorem 5.4.2 and its proof, pp. 25–26: Proves Ker 𝔏^ζ\_w = R\_w and Ker 𝔏^ζ = ⊕R\_w, the B\*-version of Todd’s relation conjecture; the published version adds the K̄ statement as Remark 5.4.

**Planet:** All linear relations among MZVs.

<a id="MZ-5-character-splitting"></a>

### MZ.5.8 Character splitting of relations among ACMPL periods

Node `MZ.5/character-splitting`, a theorem.

**Statement.** If ε\_1, …, ε\_n ∈ F\_q^× are distinct and γ\_i ∈ F̄\_q are (q − 1)-th roots of ε\_i, then γ\_1, …, γ\_n are linearly independent over K\_∞ = F\_q((1/θ)). Consequently, if Σ\_i a\_i𝔏𝔦(s\_i; ε\_i)(θ) = 0 with a\_i ∈ K and all s\_i of weight w, then for each character ε the subsum over the i with χ(ε\_i) = ε vanishes.

**Hypotheses.** (q − 1)-th roots fixed once for all.

**Proof sketch.**

1. If ε generates F\_q^×, X^{q−1} − ε is irreducible over F\_q (a factor of degree d would give γ^{gcd(d, q−1)} ∈ F\_q^×, contradicting that ε generates), so 1, γ, …, γ^{q−2} are F\_q-independent; every γ\_i is an F\_q^×-multiple of a power γ^{k\_i} with distinct k\_i.
2. F\_q(γ) and F\_q((1/θ)) are linearly disjoint over F\_q (constant field extension), so F\_q-independence passes to K\_∞-independence.
3. By MZ.3/deformation-specialisation, 𝔏𝔦(s\_i; ε\_i)(θ) = γ\_{i1}⋯γ\_{iℓ\_i}Li(ε\_i; s\_i)/π̃^w, and γ\_{i1}⋯γ\_{iℓ\_i} is a (q − 1)-th root of χ(ε\_i); grouping by character and applying the independence of the roots gives the subsums.

**Acceptance.** For q = 3, γ = √−1 and 1 are independent over F\_3((1/θ)).

**Needs.** `MZ.3/deformation-specialisation`, `MZ.0/carlitz-multiple-polylogarithm`.

**Sources.**

- IKLNDP24, Lemmas 3.1 and 3.2 with proofs, pp. 33–34: Proves that roots of unity attached to distinct characters are independent and that relations among ACMPL periods split by character.

<a id="MZ-5-acmpl-period-relations"></a>

### MZ.5.9 Relations among normalised ACMPL periods

Node `MZ.5/acmpl-period-relations`, a theorem.

**Statement.** Let w ≥ 1 and consider K-linear relations a + Σ\_i a\_i𝔏𝔦(s\_i; ε\_i)(θ) = 0 with a, a\_i ∈ K and s\_i ∈ J′\_w (no entry divisible by q). They form a K-vector space of dimension at most one, every nonzero relation has a ≠ 0, forces (q − 1) | w, and involves only arrays with trivial character ε\_i = (1, …, 1); if (q − 1) | w there is exactly one such relation with a = 1. In particular the ACMPL values Li(ε; s), (ε; s) ∈ AS\_w, are K-linearly independent.

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. Induct on w. For w = 1 and q > 2 use MZ.5/character-splitting and MZ.3/eulerian-tails (1); for q = 2, Li(1) = ζ\_A(1) = −π̃/D\_1.
2. Work by strong induction on this relations theorem for the normalised periods, with distinct arrays and nonzero collected coefficients. Character splitting leaves one total character. The absence of homogeneous relations in smaller weight gives (LW) for the prefix periods. For each nonempty prefix, the independence criterion makes its suffix combination a scalar in K; the induction hypothesis applied to that lower-weight relation, including its constant term, forces every supported suffix character to be trivial and its weight divisible by q − 1. Varying the prefix therefore gives later characters 1 and later entries divisible by q − 1. This uses the full induction hypothesis, beyond the valuation conclusion of MZ.3/eulerian-tails; that lemma also gives a = 0 when (q − 1) ∤ w.
3. The gauge equation is the twisted system; MZ.4/twisted-system-solutions shows it has no nonzero solution unless (q − 1) | w and ε = 1, in which case any solutions are proportional over F\_q(t), so the relations form a space of dimension ≤ 1 with trivial characters. The leaf coordinates determine the coefficients. Embed every support in the full finite family AS\_w, assigning zero to omitted coefficients. Rational proportionality in this one ambient system specialises to K-proportionality of its relation coefficients, so the full relation space has dimension at most one. The relation with nonzero constant term constructed in the next step then excludes every nonzero homogeneous relation.
4. Existence when w = m(q − 1): expand Li(q − 1)^m in AS\_w by MZ.2/strong-brown; since Li(q − 1) = −D\_1^{−1}π̃^{q−1} (MZ.0/zeta-q-minus-one), this gives (−D\_1)^{−m}π̃^w − Σ a\_i Li(ε\_i; s\_i) = 0 with a ≠ 0. The operators of §1 preserve characters, so this expansion involves only trivial characters and is a relation of the required form (source issue E12).
5. Independence of AS\_w: a K-relation among the Li(ε; s) of mixed characters becomes, by the period formula, a K̄-relation among the 𝔏𝔦-values; since these have one weight and are K-independent with a = 0 by the first part, MZ.3/chang-descent (a) makes them K̄-independent (source issue E12).

**Acceptance.** For q = 2 and w = 1 the relation is 1 + D\_1𝔏𝔦((1); (1))(θ) = 0, i.e. π̃ + D\_1 Li(1) = 0.

**Needs.** `MZ.5/character-splitting`, `MZ.3/independence-criterion`, `MZ.3/eulerian-tails`, `MZ.4/twisted-system-solutions`, `MZ.2/strong-brown`, `MZ.0/zeta-q-minus-one`, `MZ.3/chang-descent`.

**Sources.**

- IKLNDP24, Theorem 3.4, p. 35, and its proof, §3.3, pp. 36–42; Remark 3.5, p. 36: Proves the statement on relations between ACMPL periods and π̃^w, using the strong Brown theorem for the existence of the relation with nonzero constant term.

**Planet:** Relations among ACMPL periods.

<a id="MZ-5-hoffman-basis"></a>

### MZ.5.10 The Hoffman-like basis of alternating polylogarithm values

Node `MZ.5/hoffman-basis`, a theorem.

**Statement.** For every w ≥ 1, the ACMPL values Li(ε; s), (ε; s) ∈ AS\_w, form a K-basis of AL\_w; hence dim\_K AL\_w = s(w).

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. Independence: MZ.5/acmpl-period-relations. Spanning: MZ.2/strong-brown. Count: MZ.0/counting.

**Acceptance.** dim\_K AL\_1 = q − 1, spanned by Li(ε; 1), ε ∈ F\_q^×.

**Needs.** `MZ.5/acmpl-period-relations`, `MZ.2/strong-brown`, `MZ.0/counting`.

**Sources.**

- IKLNDP24, Theorem 3.6 and its proof, p. 36: Deduces that AS\_w is a basis of AL\_w with dim\_K AL\_w = s(w) from Theorems 3.4 and 1.11.

<a id="MZ-5-amzv-dimension"></a>

### MZ.5.11 The dimension of alternating multiple zeta values

Node `MZ.5/amzv-dimension`, a theorem.

**Statement.** For every w ≥ 1, dim\_K AZ\_w = s(w), and the ACMPL values Li(ε; s), (ε; s) ∈ AS\_w, which lie in AZ\_w, form a K-basis of AZ\_w.

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. AZ\_w = AL\_w (MZ.2/value-bridge), and MZ.5/hoffman-basis.

**Acceptance.** dim\_K AZ\_1 = q − 1; for q = 3, dim\_K AZ\_4 = 46; for q = 2, dim\_K AZ\_w = d(w).

**Needs.** `MZ.5/hoffman-basis`, `MZ.2/value-bridge`.

**Sources.**

- IKLNDP24, Theorem A, p. 4; §4.2, p. 54: States dim\_K AZ\_w = s(w) with a Hoffman-like basis, deduced from Theorem 4.9 and Theorem 3.6.

**Planet:** Dimension of alternating MZVs.

<a id="MZ-5-mzv-lower-bound-cmpl"></a>

### MZ.5.12 The lower bound dim\_K Z\_w ≥ d(w) through CMPLs

Node `MZ.5/mzv-lower-bound-cmpl`, a theorem.

**Statement.** For every w ≥ 1, the CMPL values Li(s), s ∈ J′\_w = IND\_w, lie in Z\_w and are K-linearly independent; hence dim\_K Z\_w ≥ d(w).

**Hypotheses.** w ≥ 1.

**Proof sketch.**

1. Li(s) ∈ Z\_w: by the trivial-character version of MZ.2/brown-spanning every CMPL of weight w is a K-combination of Li(t), t ∈ J\_w = I^T\_w, and Li(t) = ζ\_A(t) ∈ Z\_w (MZ.0/carlitz-identity) (source issue E10: the source cites the alternating bridge, which only gives Li(s) ∈ AZ\_w).
2. Independence: the trivial-character case of MZ.5/acmpl-period-relations.
3. |J′\_w| = d(w) (MZ.0/counting).

**Acceptance.** For w ≤ q this is MZ.5/thakur-basis-small-weight.

**Needs.** `MZ.5/acmpl-period-relations`, `MZ.2/brown-spanning`, `MZ.0/carlitz-identity`, `MZ.0/counting`.

**Sources.**

- IKLNDP24, Proposition 4.10 and its proof, pp. 54–55: Proves dim\_K Z\_w ≥ d(w) by viewing the CMPLs indexed by J′\_w as ACMPLs with trivial characters.

<a id="MZ-5-amzv-small-weight-bounds"></a>

### MZ.5.13 Direct bounds for alternating MZVs in small weights

Node `MZ.5/amzv-small-weight-bounds`, a theorem.

**Statement.** (1) For w ≤ 2q − 2 (and also w = 2q − 1), the AMZVs ζ\_A(ε; s) with (ε; s) ∈ AT^1\_w = AJ^1\_w span AZ\_w, so dim\_K AZ\_w ≤ s(w) without ACMPLs. (2) For q > 2 and w ≤ 3q − 3, the AMZVs in the explicit set AT′\_w are K-linearly independent, and |AT′\_w| = s(w); so dim\_K AZ\_w ≥ s(w). Here AT′\_w consists of the ζ\_A(ε; s) with characters 1 over the entries q and 2q − 1 and with s ∈ I′\_w: for w ≤ 2q − 2, the indices with no entry equal to q; for 2q − 1 ≤ w ≤ 3q − 3, those with no entry in {q, 2q − 1, 2q} or with exactly one consecutive pair (q − 1, q). (For q = 2 the source treats w ≤ 4 separately; there all characters are trivial, AZ\_w = Z\_w, and the bound is also MZ.5/thakur-basis-theorem.) With MZ.5/amzv-dimension, AT^1\_w (w ≤ 2q − 2) and AT′\_w (w ≤ 3q − 3) are bases of AZ\_w consisting of AMZVs.

**Hypotheses.** The stated weight ranges.

**Proof sketch.**

1. (1): show by induction on depth and first entry that ζ\_A(ε, λ; U, q + w\_1, W\_−) and ζ\_A(ε; U, q, W) lie in the span of AT^1\_w, using the explicit expansion of B\*\_{ε,U}C\_{λ,W}(R\_ε), with U = ∅ treated by summing C\_{λ,W}(R\_ε) directly (source issue E20); the condition w ≤ 2q − 2 keeps the expansion short.
2. For (2), use strong induction on w and closure under deleting the last entry (the Note, Proposition 1.4(2)) to supply (LW). Character splitting and the rational suffix combinations reduce support: below 2q − 1 this is the two-row argument of MZ.4/two-row-system with a common root of the total character; in the range 2q − 1 ≤ w ≤ 3q − 3, Lemmas 5.2–5.5 of the Note restrict suffix weights to multiples of q − 1 and remove later nontrivial characters, apart from the explicit exceptional (q − 1,q) block.
3. For w = 2q − 1 the remaining prefixes are ∅, (1), (q − 1) and (q − 1,1), with the last two carrying the possible split characters. For w = 2q the shortlist is (2,q − 1,q − 1), (2,2q − 2), (q + 1,q − 1); for 2q + 1 ≤ w ≤ 3q − 3 replace these first entries by w − 2q + 2 and w − q + 1 and allow (w). The two-row endpoint shows ζ\_A(q − 1,q − 1) and ζ\_A(2q − 2) are not proportional, removing the double-tail candidate. Monic descent bounds the remaining root quotient by degree 3 in θ. Comparing θ^q and constant coefficients, separately at q = 3 and w = 3q − 3, forces a coefficient assumed in the support to vanish (the Note §§5.6–5.8, pp. 22–29).
4. |AT^1\_w| = s(w) (MZ.0/counting) and |AT′\_w| = s(w) (the Note, Proposition 1.4).

**Acceptance.** For q = 3 and w = 4 ≤ 2q − 2, AT^1\_4 has 46 elements and is a basis of AZ\_4.

**Needs.** `MZ.5/amzv-dimension`, `MZ.2/todd-operators`, `MZ.2/fundamental-relation`, `MZ.3/independence-criterion`, `MZ.0/counting`, `MZ.5/character-splitting`, `MZ.4/monic-frobenius-descent`, `MZ.4/theta-degree-bound`, `MZ.4/two-row-system`.

**Sources.**

- IKLNDP24, Proposition 4.11 and its proof, pp. 55–57; Remark 4.12 and Proposition 4.13, p. 57; Remark 4.14, p. 58: States and sketches the sharp upper bound for w ≤ 2q − 2 (also 2q − 1) and the sharp lower bound for w ≤ 3q − 3 without ACMPLs, with the sets AT^1\_w and AT′\_w.
- IKLNDP-NOTE, Propositions 1.3–1.4 and Theorems 1.5–1.6, pp. 3–4; §3.2, p. 12 (bijection); §4.1, pp. 12–14; §§5.1–5.8, pp. 15–29 (the ranges used here): Defines AT^0\_w, AT^1\_w, I′\_w and AT′\_w, counts them, and states the independence of AT^0\_w for all w and of AT′\_w for 1 ≤ w ≤ 3q − 2. The proof reduces to a short support list using rational suffix periods, then solves the bounded-degree root equation; the roadmap uses only w ≤ 3q − 3.

<a id="MZ-5-v-adic-bound"></a>

### MZ.5.14 An upper bound for v-adic multiple zeta values

Node `MZ.5/v-adic-bound`, a theorem.

**Statement.** Let v be a finite place of K and Z\_{v,w} the K-span of the v-adic MZVs ζ\_A(s)\_v of weight w (Chang–Mishiba). Then dim\_K Z\_{v,w} ≤ d(w) − d(w − (q − 1)), with d(0) = 1 and d(n) = 0 for n &lt; 0; the K̄-span satisfies the same bound for dim\_{K̄}.

**Hypotheses.** v a finite place of K = F\_q(θ).

**Proof sketch.**

1. Chang–Mishiba construct a K-algebra homomorphism Z → Z\_v, ζ\_A(s) ↦ ζ\_A(s)\_v, whose kernel contains ζ\_A(q − 1) (because ζ\_A(q − 1)\_v = 0, Goss); this v-adic input is not planned in the atlas and is recorded as a gap.
2. Multiplication by the nonzero element ζ\_A(q − 1) ∈ Z\_{q−1} embeds Z\_{w−(q−1)} into Z\_w (Z ⊂ K\_∞ is a domain; MZ.1/value-algebras), and its image lies in the kernel of Z\_w → Z\_{v,w}.
3. So dim Z\_{v,w} ≤ dim Z\_w − dim Z\_{w−(q−1)} = d(w) − d(w − q + 1) by MZ.5/thakur-basis-theorem (source issue E14: the source writes a K̄-span with dim\_K).

**Acceptance.** For w &lt; q − 1 the bound is d(w); for w = q − 1 it is d(q − 1) − 1 = 2^{q−2} − 1.

**Needs.** `MZ.5/thakur-basis-theorem`, `MZ.1/value-algebras`, `MZ.0/zeta-q-minus-one`.

**Sources.**

- CCM23, Corollary 1.2.7 and the paragraph before it, p. 4: Deduces the bound for v-adic MZVs from Theorem 1.2.4 and the algebra map of Chang–Mishiba killing ζ\_A(q − 1).

## Dependencies on DrinfeldModulesAndTModules

The following parent nodes are imported. Their statements were independently read against every use in this packet.

- `DM.0/carlitz-products`: `MZ.0/power-sum`, `MZ.0/carlitz-multiple-polylogarithm`, `MZ.2/fundamental-relation`, `MZ.3/anderson-thakur-polynomials`, `MZ.3/deformation-series`.
- `DM.2/c-infinity`: `MZ.0/carlitz-multiple-polylogarithm`.
- `DM.2/carlitz-exponential`: `MZ.0/multiple-zeta-value`, `MZ.0/carlitz-multiple-polylogarithm`, `MZ.0/zeta-q-minus-one`.
- `DM.2/carlitz-period`: `MZ.0/weight-spaces`, `MZ.0/zeta-q-minus-one`, `MZ.0/eulerian`, `MZ.3/anderson-thakur-interpolation`.
- `DM.2/lattice-exponential`: `MZ.0/zeta-q-minus-one`.
- `DM.2/omega`: `MZ.3/anderson-thakur-interpolation`, `MZ.3/deformation-series`, `MZ.3/deformation-entire`, `MZ.3/index-dual-motive`, `MZ.3/mz-property`, `MZ.3/chang-descent`.
- `DM.2/period-power`: `MZ.0/zeta-q-minus-one`, `MZ.0/eulerian`.
- `DM.4/inverse-twist-dual-motive`: `MZ.3/index-dual-motive`.
- `DM.6/small-power-sum`: `MZ.0/multiple-zeta-value`, `MZ.0/mzv-nonvanishing`, `MZ.0/carlitz-identity`.
- `DM.8/abp-lifting`: `MZ.3/chang-descent`, `MZ.3/independence-criterion`.
- `DM.8/analytic-fixed-fields`: `MZ.3/chang-descent`, `MZ.3/independence-criterion`, `MZ.4/frobenius-system`.
- `DM.8/coefficient-twist`: `MZ.3/anderson-thakur-interpolation`, `MZ.3/deformation-series`, `MZ.4/frobenius-system`, `MZ.4/monic-frobenius-descent`.
- `DM.8/constant-denominator`: `MZ.3/independence-criterion`, `MZ.4/key-lemma`.
- `DM.8/entire-from-equation`: `MZ.3/deformation-entire`.
- `DM.8/entire-series`: `MZ.3/deformation-entire`, `MZ.3/mz-property`, `MZ.3/chang-descent`.
- `DM.8/fundamental-matrix`: `MZ.3/index-dual-motive`, `MZ.3/independence-criterion`.
- `DM.8/tate-analytic-interface`: `MZ.3/deformation-series`.

Library declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` were independently checked, together with the parent’s Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`.

- `mathlib:Composition` (`Mathlib/Combinatorics/Enumerative/Composition.lean`): Compositions of a natural number n as lists of positive integers summing to n, with a Fintype instance; the carrier for indices of a fixed weight.
- `mathlib:Polynomial` (`Mathlib/Algebra/Polynomial/Basic.lean`): The polynomial ring F\_q\[θ\] = A and the polynomials in t over K̄.
- `mathlib:Polynomial.Monic` (`Mathlib/Algebra/Polynomial/Degree/Defs.lean`): Monic polynomials; A\_{+,d} is the set of monic polynomials of degree d.
- `mathlib:RatFunc` (`Mathlib/FieldTheory/RatFunc/Defs.lean`): The rational function field K = F\_q(θ), where the power sums live.
- `mathlib:RatFunc.inftyValuation` (`Mathlib/FieldTheory/RatFunc/Valuation.lean`): The valuation at infinity on F(θ), with value exp(deg) on polynomials (multiplicative ℤᵐ⁰ form); it gives |·|\_∞ up to normalisation.
- `mathlib:RatFunc.CompletionAtInfty` (`Mathlib/FieldTheory/RatFunc/Valuation.lean`): The completion K\_∞ = F((1/θ)) of F(θ) at infinity, a valued field containing F(θ); the values ζ\_A(s) and Li(s) lie in it.
- `mathlib:Submodule.span` (`Mathlib/LinearAlgebra/Span/Defs.lean`): K-linear spans, used for the weight spaces Z\_w, AZ\_w, L\_w, AL\_w.
- `mathlib:Nat.choose` (`Mathlib/Data/Nat/Choose/Basic.lean`): Binomial coefficients in Chen’s correction coefficients.
- `mathlib:FiniteField.sum_pow_units` (`Mathlib/FieldTheory/Finite/Basic.lean`): For a finite field of q elements, Σ\_{x ∈ Kˣ} x^i is −1 if (q − 1) | i and 0 otherwise; used for Σ\_{0 ≠ h, deg h &lt; d} h^{−i} and for Σ\_{a ≠ 0} a^{−n}. The theorem uses a natural exponent; negative powers are handled by the inversion bijection of Kˣ before applying it.
- `mathlib:Finsupp` (`Mathlib/Data/Finsupp/Defs.lean`): Finitely supported functions, the carrier of the index space H = ⊕ K\[s\].

## Gaps

- **Degree monotonicity of power sums for general q (Thakur–Sheats).** For every prime power q, k ≥ 1 and d ≥ 0: S\_d(k) ≠ 0 and deg\_θ S\_{d+1}(k) &lt; deg\_θ S\_d(k). Thakur 2009 proves it for q prime from his degree recursion and refers, for general q, to the minimal-decomposition formula and Sheats’s degree inequality (Sheats, J. Number Theory 71 (1998)). No roadmap plans this degree theory. It is used only for the nonvanishing of MZVs with entries > q; the end theorems use CMPL values and Thakur’s range, where nonvanishing is elementary (MZ.0/cmpl-nonvanishing, MZ.0/carlitz-identity). Needed by `MZ.0/mzv-nonvanishing`.
- **Proof of the Anderson–Thakur interpolation formula.** The statement (H\_sΩ^s)^{(d)}(θ) = Γ\_s S\_d(s)/π̃^s is taken from Chang 2014 Theorem 5.5.1 and Ngo Dac §4.2; its proof (Anderson–Thakur, Ann. of Math. 132 (1990), (3.7.3)–(3.7.4), and IMRN 2009, 2.4.1) was not reread in the design or this review; no assertion about present public availability is made. A follow-up should obtain the proof and plan its steps (the generating series of power sums in terms of the Carlitz exponential and the polynomials γ\_j). The CMPL route to the end theorems (Chang–Chen–Mishiba, Im–Kim–Le–Ngo Dac–Pham) does not use it; Ngo Dac’s direct route (Theorems B, 6.2, D) and the MZ property of general MZVs do. Needed by `MZ.3/anderson-thakur-interpolation`.
- **v-adic multiple zeta values and the Chang–Mishiba homomorphism.** For a finite place v of K, Chang–Mishiba (Invent. Math. 223 (2021), Theorem 1.2.2) define v-adic MZVs ζ\_A(s)\_v and a K-algebra homomorphism from the K-span Z of ∞-adic MZVs to the span of v-adic MZVs, ζ\_A(s) ↦ ζ\_A(s)\_v, whose kernel contains ζ\_A(q − 1) (Goss: ζ\_A(q − 1)\_v = 0). No roadmap of the atlas plans v-adic MZVs or this homomorphism; a Part II on v-adic special values would own it. Needed by `MZ.5/v-adic-bound`.

## Mistakes found in the sources

The descriptions are in our own words. All 23 findings have an independent confirmed verdict in the packet. E22 adds a matrix-size misprint; E23 records the author’s known shuffle-proof correction, credited to Shuhui Shi. Findings are scoped to the listed version; publisher comparisons and access limits are recorded under `sourceVersions` in the packet.

- **E1** (misprint, affects the proof). CCM23, arXiv:2205.09929v2, Definition 2.2.2 and the identities listed after it, pp. 7–8; used in the proof of Proposition 2.3.5(3), p. 9. The truncated realisation of the empty index is set to 1 only for d ≥ 1, while the identity 𝔏^•\_d(s)𝔏^•\_{&lt;d}(P) = 𝔏^•\_d(\[s, P\]) is asserted for every P ∈ H and every d ∈ Z. Correction: Use 𝔏^•\_{&lt;d}(∅) = 1 for every d ∈ Z when ∅ occurs as a tail factor (Ngo Dac’s convention S\_{&lt;d}(∅) = 1), or restrict the identity to d ≥ 1 or to P without ∅-component. For a depth-one index (s) and d = 0, 𝔏^•\_0(s)𝔏^•\_{&lt;0}(∅) = 1·0 = 0 while 𝔏^•\_0(\[s, ∅\]) = 𝔏^•\_0(s) = 1. The proof of Proposition 2.3.5(3) uses the factorisation 𝔏^•\_d(s) = 𝔏^•\_d(s\_1)𝔏^•\_{&lt;d}(s\_−) at d = 0 for depth-one s. The proposition itself is true: at d = 0 both sides of (3) equal 1 (depth-two terms vanish), and for d &lt; 0 everything vanishes. Independent check: Depth one at d = 0 gives a concrete failure of the printed empty-tail factorisation; the node uses the corrected convention.
- **E2** (gap, affects the proof). ND21, HAL v1, proof of Proposition 2.12, case j = 0, p. 12. The proof applies B\*\_{s\_j} to (2.11) after setting s\_0 = 0, so for j = 0 it calls B\*\_0. Correction: When j = 0, omit B\*\_{s\_j} and sum the relation (2.11) directly over d; apply B\*\_{s\_j} only for j ≥ 1. B\*\_v is defined only for v ≥ 1. If no entry before s\_k is &lt; q, the j = 0 branch is reached; summing (2.11) directly gives the required type 1 and type 2 terms (there are no type 3 terms then). Recorded earlier as PAPER-NGODAC-21/E3 and confirmed here against the text. Independent check: The j = 0 branch calls an operator whose domain excludes 0; summing the binary relation supplies exactly that branch.
- **E3** (misprint, affects nothing). CCM23, arXiv:2205.09929v2, §2.3, definition of Δ^{\[j\]}\_{s,n} in (2.3.2), p. 9. The coefficient is defined under the condition (q − 1) | k and 1 ≤ j &lt; s + n. Correction: The condition is (q − 1) | j. k denotes F\_q(θ) in the paper; Chen’s formula and Ngo Dac’s restatement put the divisibility on the summation index; with the correction, Remark 2.3.4 holds. Recorded earlier as PAPER-CHANG-CHEN-MISHIBA-23/E2. Independent check: The v2 divisibility symbol uses k, whereas the sum and Chen formula require j. Independently confirmed fixed in the published formula (2.5).
- **E4** (error, affects a stated result). ND21, HAL v1, Theorem 4.2 (statement of the ABP criterion), p. 18. The determinant hypothesis is written det Φ = c(t − θ)^s with c only required to lie in K̄. Correction: Require c ∈ K̄^×, as in Anderson–Brownawell–Papanikolas Theorem 3.1.1. With c = 0 the conclusion fails: Φ = diag(t − θ^{1/q}, 0), ψ = (Ω^{(−1)}, 0)^T and ρ = (1, 0) satisfy the hypotheses but no polynomial row P with Pψ = 0 has P(θ) = ρ. The matrices used in the paper have nonzero determinant. Recorded earlier as PAPER-NGODAC-21/E4. Independent check: The determinant must be nonzero in ABP Theorem 3.1.1; the recorded rank-deficient example disproves the HAL statement with c = 0. Scope: HAL manuscript only.
- **E5** (misprint, affects nothing). ND21, HAL v1, §5, first paragraph, p. 18. K-to-K̄ descent for lower-weight MZVs is attributed to \[9, Proposition 4.3.1\]. Correction: Cite Chang 2014 Theorem 3.4.5 (or its MZV form, Theorem 2.2.1). Chang’s Proposition 4.3.1 is the descent statement that involves π̃^w; the same-weight descent used is Theorem 3.4.5. Recorded earlier as PAPER-NGODAC-21/E5. Independent check: The cited proposition treats period descent; Theorem 3.4.5 supplies the weightwise descent actually used.
- **E6** (gap, affects the proof). ND21, HAL v1, proof of Theorem 6.2, Step 3, after (6.4), pp. 23–24. Citing Kuan–Lin, the proof states that δ\_1, δ\_2 lie in K\[t\] with θ-degree bounds, and then writes δ\_1 = (aθ + b)(t − θ)^w with a, b ∈ F\_q\[t\]. Correction: One needs δ\_1, δ\_2 ∈ A\[t\] = F\_q\[θ, t\]; this follows from (6.3)–(6.4) by monic Frobenius descent (MZ.4/monic-frobenius-descent) and the θ-degree bound. Membership in K\[t\] with a θ-degree bound does not give polynomial dependence on θ: (t − θ)^w/θ lies in K\[t\]. Recorded earlier as PAPER-NGODAC-21/E11. Independent check: The next coefficient comparison requires A\[t\], not merely K\[t\]. Descending monic comparison supplies A\[t\] with the stated degree bound.
- **E7** (misprint, affects nothing). ND21, HAL v1, proof of Theorem 6.2, p. 22. The base case is stated for w &lt; q, using T\_w = T′\_w there. Correction: The base case should be w ≤ q. At w = q the families agree as well, while the inductive step asserts 1 &lt; k for k = w − (q − 1), which fails at w = q. Recorded earlier as PAPER-NGODAC-21/E12. Independent check: The base families agree also at w = q; the subsequent k > 1 step starts only above q.
- **E8** (error, affects a stated result). IKLNDP24, arXiv:2205.07165v2, §2.2.1, Condition (2.1) and the matrix Ψ\_{s,Q}, pp. 27–28. The convergence condition (2.1) is imposed on the whole tuple (s, Q), and Ψ\_{s,Q}, whose entries include the series of every tail, is asserted to lie in GL\_{r+1}(T). Correction: Require the termwise bound ‖Q\_j‖\_∞ &lt; |θ|\_∞^{q s\_j/(q−1)} for every j (equivalently (2.1) for every consecutive sub-tuple), which all applications satisfy. For s = (q − 1, q − 1) and Q = (1, θ^{q+1}) the whole-tuple condition holds, but the tail series 𝔏((q − 1); (θ^{q+1})) diverges. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E14. Independent check: The whole-tuple norm can decay while its last factor grows. The displayed example has normalised exponents −q and +1. Published condition (3.1) and the full-tail matrix retain this issue; first-column Chang arguments remain valid.
- **E9** (gap, affects the proof). IKLNDP24, arXiv:2205.07165v2, proof of Theorem 1.11, p. 25. The congruences a ≡ ±1 (resp. 0) modulo D\_1 of the transition coefficients are said to follow from Propositions 1.7 and 1.10. Correction: Run the reduction algorithm with Proposition 1.7 at every step, choosing its free character to match the target array, and track that every coefficient is −1 on type-1 edges and in D\_1A otherwise. Propositions 1.9–1.10 only assert the existence of a K-linear expression and carry no integrality or congruence information. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E12; the completed argument is in MZ.2/strong-brown. Independent check: The determinant congruence needs the unique type-1 path with coefficient −1 and divisibility on all other paths; the reduction construction supplies this bookkeeping.
- **E10** (gap, affects the proof). IKLNDP24, arXiv:2205.07165v2, proof of Proposition 4.10, pp. 54–55. The inclusion of the CMPLs indexed by J′\_w in Z\_w is deduced from Theorem 4.9. Correction: Use the trivial-character version of Proposition 1.10 together with Lemma 1.2: every CMPL of weight w is a K-combination of Li(t) = ζ\_A(t), t ∈ J\_w. Theorem 4.9 gives AZ\_w = AL\_w, hence only an inclusion in AZ\_w, which is larger than Z\_w for q > 2. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E31. Independent check: The alternating bridge yields membership only in AZ\_w. Trivial-character Brown spanning and Carlitz’s identity give the required Z\_w membership.
- **E11** (misprint, affects nothing). IKLNDP24, arXiv:2205.07165v2, §2.3.1 (setup of Theorem 2.4), p. 29, repeated on p. 30. The tuples Q\_i are taken in (F\_q^×)^{ℓ\_i}. Correction: Q\_i ∈ K̄\[t\]^{ℓ\_i} with the termwise bound. The theorem is applied with Q\_{ij} = γ\_{ij} ∈ F̄\_q and with γ\_{ij}H\_s, and Remark 2.5 says the restriction to Anderson–Thakur polynomials is removed. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E16. Independent check: The matrix entries use polynomials Q\_i, not constants in F\_q^×; the surrounding formulas identify the intended carrier.
- **E12** (gap, affects the proof). IKLNDP24, arXiv:2205.07165v2, Theorem 3.4, last sentence, p. 35, and the final step of its proof, p. 42. The independence of AS\_w and the uniqueness of the relation with π̃^w are asserted for ACMPL values of mixed characters, the final step expanding Li(q − 1)^m in AS\_w by Theorem 1.11. Correction: Formulate the uniqueness for the normalised periods 𝔏𝔦(s; ε)(θ) with K-coefficients; pass to K-relations among the Li(ε; s) by Chang’s descent (Proposition 2.3); note that the operators of §1 preserve characters, so the expansion of Li(q − 1)^m involves only trivial characters. A K-relation among Li-values of mixed characters is a relation among the 𝔏𝔦-values with coefficients in K(F̄\_q), not covered by the K-statement; and the expansion of Li(q − 1)^m must be shown to stay in the character-1 class. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E23 and E30. Independent check: Ordinary ACMPL relations acquire algebraic constant factors on normalising. Chang descent and character-preserving Brown expansion justify the two missing passages.
- **E13** (misprint, affects nothing). CCM23, arXiv:2205.09929v2, Remark 1.2.5, p. 3. The upper bound is written dim\_w Z\_w ≤ d′\_w. Correction: dim\_k Z\_w ≤ d′\_w. Z\_w is a k-vector space; dim\_w is undefined. Recorded earlier as PAPER-CHANG-CHEN-MISHIBA-23/E3. Independent check: The subscript w is undefined as a coefficient field; the intended k-dimension is clear. The published Remark 1.6 retains the slip.
- **E14** (misprint, affects a stated result). CCM23, arXiv:2205.09929v2, Corollary 1.2.7, p. 4 (published Corollary 1.8). The bound is stated for a k̄-vector space spanned by v-adic MZVs but measured with dim\_k. Correction: Use the k-span with dim\_k, or the k̄-span with dim\_{k̄}. A nonzero k̄-vector space has infinite k-dimension. Recorded earlier as PAPER-CHANG-CHEN-MISHIBA-23/E5. Independent check: A nonzero algebraic-closure vector space has infinite dimension over k, so the printed finite bound uses the wrong field. The published Corollary 1.8 also retains the bar over the spanning field; checked visually.
- **E15** (misprint, affects nothing). IKLNDP24, arXiv:2205.07165v2, §0.2.2, definition of the alternating values, p. 4. The tuples s and ε of length r are said to lie in N^n and (F\_q^×)^n. Correction: N^r and (F\_q^×)^r. Both tuples have r entries and n is not introduced there. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E1. Independent check: The displayed tuples have r entries and the n in the carrier is unbound.
- **E16** (gap, affects the proof). ND21, HAL v1, Step 3 of the proof of Theorem B, pp. 21–22, and (6.2), p. 23. The longest-common-prefix argument takes two distinct indices with m\_1 = m\_2 = m, which needs at least two indices in the relation. Correction: Dispose first of a relation with a single index by nonvanishing (a\_1Γ\_{s\_1}ζ\_A(s\_1) ≠ 0); the same remark justifies a\_1, a\_2 ≠ 0 in (6.2). With one index, m\_i is undefined and Step 3 gives no contradiction. Recorded earlier as PAPER-NGODAC-21/E16. Independent check: The maximal common-prefix argument needs two supported indices. Nonvanishing disposes of a singleton relation first.
- **E17** (misprint, affects nothing). CCM23, arXiv:2205.09929v2, proof of Proposition A.3.1, p. 28. The weight of BC^•\_s(R) is written w + wt(s). In the same line the weight of C\_s(R) uses the unbound symbol wt(n). Correction: BC^{•,m}\_q(R) lies in H\_{w+mq}^{⊕2}. The C\_s shift is w + wt(s). The operator is defined with subscript q and iterate m; the proposition states the correct shift. Recorded earlier as PAPER-CHANG-CHEN-MISHIBA-23/E8. Independent check: The operator definitions give the BC shift mq and the C\_s shift wt(s), agreeing with the proposition but not this proof line.
- **E18** (misprint, affects nothing). CCM23, arXiv:2205.09929v2, §2.2, definition of S^ζ\_d(s), p. 7. S^ζ\_d(s) is defined as the sum of 1/a^d over a ∈ A\_{+,d}. Correction: The exponent is s: S^ζ\_d(s) = Σ\_{a ∈ A\_{+,d}} a^{−s}. With exponent d the symbol would not depend on s; Remark 2.2.6 uses the exponent s. Recorded earlier as PAPER-CHANG-CHEN-MISHIBA-23/E1. Independent check: The definition would lose all dependence on s with the printed exponent d; the next small-exponent identity uses exponent s.
- **E19** (misprint, affects nothing). ND21, HAL v1, end of Step 2 of the proof of Theorem B, p. 21. The passage from (5.7) at θ^{q^j} to f(θ) = ν(θ)/b(θ) is said to use (4.2). Correction: It uses the Frobenius specialisation (5.4) and the twist-invariance of a\_i, b and ν, followed by taking q^j-th roots. (4.2) evaluates L(s) at θ in terms of ζ\_A; no ζ-value enters this step. Recorded earlier as PAPER-NGODAC-21/E15. Independent check: The step uses specialisation at θ^{q^j} followed by q^j-th roots, which is (5.4), rather than the value formula (4.2).
- **E20** (gap, affects the proof). IKLNDP24, arXiv:2205.07165v2, proof of Proposition 4.11, formula (\*) and claim H\_r, pp. 55–56. The claim H\_r is asserted for every tuple U, but formula (\*) is derived by applying B\*\_{ε,U} to C\_{λ,W}(R\_ε), which needs U nonempty. Correction: Treat U = ∅ separately by summing C\_{λ,W}(R\_ε) over d; the induction then runs unchanged. For U = ∅, C\_{λ,W}(R\_ε) is not a fixed relation and the terms with u\_n + 1 do not exist, so (\*) read literally is false there. Recorded earlier as PAPER-IM-KIM-LE-ETAL-24/E33. Independent check: B\* is defined for nonempty prefixes. Summing C directly supplies the U = ∅ boundary case needed by the induction.
- **E21** (misprint, affects nothing). IKLNDP24, arXiv:2205.07165v2, proof of Theorem 1.11, p. 25. The proof says that AT\_w is the set of ACMPLs indexed by AJ\_w and lets the expansion run over all elements of AJ\_w, although AJ\_w was defined on p. 24 as the set of arrays of weight w with no entry divisible by q. Correction: Read AJ\_w in this proof as the set of arrays (ε; s) with s ∈ J\_w (the index set of AT\_w); the left-hand sides Li(ε′; s′) then lie in AS\_w, with repetitions. Arrays with an entry q lie in AT\_w but not in the p. 24 set AJ\_w, and the proof needs every element of AT\_w as a row of the transition matrix; with the p. 24 meaning the argument would not cover them. Independent check: The proof needs the AT index set, including entries q; the earlier AJ definition excludes those entries. Its square matrix must run over AT rows and columns.
- **E22** (misprint, affects nothing). CCM23, arXiv:2205.09929v2, proof of Theorem 4.3.5, point (iii), p. 18; example on p. 19. Point (iii) gives the square matrix size as 2(ℓ − m), rather than 2ℓ − m. Correction: Both dimensions are 2ℓ − m, the number of a-unknowns plus f-unknowns. The a-block has ℓ − m entries and the f-block has ℓ entries. The displayed example q = 3, ℓ = 7, m = 2 has size 12, which is 2ℓ − m, rather than 10. This changes no determinant argument. Independent check: The unknown counts and the displayed 12 × 12 example verify the corrected 2ℓ − m size.
- **E23** (error, affects the proof). THAKUR10, Theorem 3 proof, p. 1979, fourth equality in the main display; author’s corrections list, entry 36, pp. 7–8. The higher-depth vector induction uses an equality that does not follow from the shuffle relation. Correction: Use simultaneous induction on mixed and equal-degree power-sum products: prove the mixed case first at the new depth, then factor the leading term and apply the depth-one identity to obtain the equal-degree case. The author explicitly corrects this induction and credits Shuhui Shi. The supplied induction controls the depth and weight and retains coefficients independent of d. MZ.1/power-sum-products uses this corrected argument. Independent check: The author’s own correction identifies the faulty equality and supplies the simultaneous induction used here.

## Sources read

- **ND21.** Tuan Ngo Dac, On Zagier–Hoffman's conjectures in positive characteristic. HAL hal-03298790v1 (manuscript dated 29 March 2021, 26 printed pages after the HAL cover); Annals of Mathematics 194 (2021), no. 1, 361–392, doi:10.4007/annals.2021.194.1.6. Locators are the printed manuscript pages. [Source](https://hal.science/hal-03298790). Read: §1, pp. 1–5; §2 (2.1–2.3), pp. 5–14; §3, pp. 14–16; §4, pp. 16–18; §5, pp. 18–22; §6, pp. 22–24; References, pp. 25–26.
- **CCM23.** Chieh-Yu Chang, Yen-Tsung Chen and Yoshinori Mishiba, On Thakur's basis conjecture for multiple zeta values in positive characteristic. arXiv:2205.09929v2 (11 July 2022, 32 pages); Forum of Mathematics, Pi 11 (2023), e26, doi:10.1017/fmp.2023.26 (the published version numbers statements by section: arXiv Theorem 1.2.4 = published Theorem 1.5, Theorem 5.4.2 = Theorem 5.3). [Source](https://arxiv.org/abs/2205.09929v2). Read: §1, pp. 1–6; §2, pp. 6–10; §3, pp. 10–12; §4, pp. 13–21; §5, pp. 21–26; Appendix A, pp. 26–31; References, pp. 31–32.
- **IKLNDP24.** Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, Zagier–Hoffman's conjectures in positive characteristic. arXiv:2205.07165v2 (10 June 2024, 60 pages); Forum of Mathematics, Pi 12 (2024), doi:10.1017/fmp.2024.18 (the published version numbers the introduction as §1, so its section numbers are one more than the preprint's: arXiv Theorem 3.4 = published Theorem 4.4). [Source](https://arxiv.org/abs/2205.07165v2). Read: §0, pp. 1–7; §1 (1.1–1.4), pp. 7–25; §2, pp. 26–33; §3, pp. 33–42; §4, pp. 43–58.
- **IKLNDP-NOTE.** Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, Note on linear independence of alternating multiple zeta values in positive characteristic. HAL hal-04240841v3 (30 July 2024); Acta Mathematica Vietnamica 49 (2024), 485–521, doi:10.1007/s40306-024-00554-4. Locators are the printed pages of the HAL version. [Source](https://hal.science/hal-04240841). Read: §1, pp. 1–4; §2.1–2.2, pp. 5–6; §3.2, p. 12; §4.1, pp. 12–14; §§5.1–5.8, pp. 15–29 (independent review: direct small-weight proof and its support reductions).
- **CHANG14.** Chieh-Yu Chang, Linear independence of monomials of multizeta values in positive characteristic. arXiv:1207.2326 (20 pages); Compositio Mathematica 150 (2014), 1789–1808. [Source](https://arxiv.org/abs/1207.2326). Read: §2.2, p. 5; §3.4, pp. 8–9; §4, pp. 9–12; §5.1–5.5, pp. 13–19.
- **CPY19.** Chieh-Yu Chang, Matthew A. Papanikolas and Jing Yu, An effective criterion for Eulerian multizeta values in positive characteristic. arXiv:1411.0124 (32 pages); Journal of the European Mathematical Society 21 (2019), 405–440. [Source](https://arxiv.org/abs/1411.0124). Read: §2.2, Proposition 2.2.1, p. 6; §2.3, Proposition 2.3.3, p. 7.
- **THAKUR09R.** Dinesh S. Thakur, Relations between multizeta values for F\_q\[t\]. International Mathematics Research Notices 2009, no. 12, 2318–2346 (author's copy); doi:10.1093/imrn/rnp018. [Source](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/imrnrelation.pdf). Read: §2.7.7, Theorem 5, p. 2326; §3.4.6, proof of Theorem 5, p. 2332.
- **THAKUR10.** Dinesh S. Thakur, Shuffle relations for function field multizeta values. International Mathematics Research Notices 2010, no. 11, 1973–1980 (author's copy); doi:10.1093/imrn/rnp202. The higher-depth induction is corrected in the author's updates list. [Source](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/shufflepub.pdf). Read: Theorems 1–3 with proofs, pp. 1975–1979.
- **THAKUR09P.** Dinesh S. Thakur, Power sums with applications to multizeta and zeta zero distribution for F\_q\[t\]. Finite Fields and Their Applications 15 (2009), 534–552 (author's copy); doi:10.1016/j.ffa.2009.04.002. [Source](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf). Read: §4, Theorems 1–2, pp. 540–541; §5, Theorems 3–4, pp. 541–542.
- **CH21.** Yen-Tsung Chen and Ryotaro Harada, On lower bounds of the dimensions of multizeta values in positive characteristic. arXiv:2012.00340; Documenta Mathematica 26 (2021), 537–559. [Source](https://arxiv.org/abs/2012.00340). Read: §1, pp. 1–5; §2.4, Proposition 2.12, p. 13.
- **LRT14.** José Alejandro Lara Rodríguez and Dinesh S. Thakur, Zeta-like multizeta values for F\_q\[t\]. arXiv:1312.4928; Indian Journal of Pure and Applied Mathematics 45 (2014), 787–801. [Source](https://arxiv.org/abs/1312.4928). Read: §3, Theorems 3.1–3.2, pp. 3–8.
- **PAP08.** Matthew A. Papanikolas, Tannakian duality for Anderson–Drinfeld motives and algebraic independence of Carlitz logarithms. arXiv:math/0506078v2; Inventiones Mathematicae 171 (2008), 123–174. [Source](https://arxiv.org/abs/math/0506078v2). Read: §4.1.6, p. 22 (uniqueness of rigid analytic trivialisations), consulted for the DM.8 interface.
- **ABP04.** Greg W. Anderson, W. Dale Brownawell and Matthew A. Papanikolas, Determination of the algebraic relations among special Γ-values in positive characteristic. arXiv:math/0207168; Annals of Mathematics 160 (2004), 237–313. [Source](https://arxiv.org/abs/math/0207168). Read: Theorem 3.1.1 statement and §3.1.2 (Ω and π̃), consulted for the DM.8 interface; Proposition 3.1.3, pp. 9–10 (entire-ness from a Tate solution).
- **THAKUR-UPDATES.** Dinesh S. Thakur, Corrections and updates to publications. Author’s continuously maintained corrections list; downloaded 19 October 2026, 12 pages. [Source](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/updates.pdf). Read: Entry 36, pp. 7–8: correction to the higher-depth shuffle induction, credited to Shuhui Shi.

The exact source hashes and preprint/published comparison URLs are recorded in the packet. The independent review obtained both Cambridge published PDFs. For Ngo Dac, only the HAL manuscript and the Annals publication page were obtained; the source findings make no new claim about the published typesetting.
