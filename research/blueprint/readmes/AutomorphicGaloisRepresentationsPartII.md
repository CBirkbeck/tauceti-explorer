# Galois representations attached to regular algebraic automorphic representations of GL_n

This roadmap constructs Galois representations attached to regular algebraic cuspidal representations of GL_n over CM or totally real fields. It distinguishes good-place attachment, coefficient-prime admissibility, Weil–Deligne compatibility with monodromy, compatible-family assembly and residual arithmetic. Every output retains its field, regularity, polarization and local hypotheses. The stable identifier is `AutomorphicGaloisRepresentationsPartII`, as in accepted [RS-12](../restructure/RS-12.result.json).

The compact polarized route first constructs actual PEL geometry, coefficient projectors and raw traces. Stabilization and local comparison then identify virtual constituents; weight concentration and irreducible-multiplicity divisibility produce actual representations. Definite-unitary families and solvable descent remove the geometric restrictions. HLTT supplies an independent nonselfdual existence route over CM and totally real fields. The all-CM coefficient-prime refinement is A’Campo–Hevesi–Thorne–Whitmore’s July 2026 preprint, with its precise semisimplification and monodromy-bound conclusions.

The complete target-level specification has 124 targets: 14 definitions, 24 constructions, 64 theorems, six lemmas and 16 comparisons, with 189 API items, 139 unit tests and 46 planets. Each mathematical layer is planned; AG2.1 is a process aggregate. Planned means that every target has a contract and a prerequisite chain ending in the libraries, a named supplier or an explicit gap. It does not assert closure or implementation. There are 18 gaps and 49 supplier requests.

The [full-scope packet](../packets/AutomorphicGaloisRepresentationsPartII.json) is a **partial revision-2 checkpoint**, blocked on executable integration outside the issue's named deliverables. Its mathematical planning inventory is unchanged. It continues the independently accepted [AG2.0 part](../packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json) and [AG2.6 part](../packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json). It retains 108 accepted target ids through full `importChecks`, combines seven integrated milestone ids with nine new primitive targets, and excludes five targets whose owners are elsewhere. The contracts below are the reconciled specification. The [handoff](../handoff/BP-AutomorphicGaloisRepresentationsPartII.md) records the precise dependency and parent redirects required in the historical packets at promotion; metadata alone does not modify the live graph.

The [independent review](../reviews/REV-AutomorphicGaloisRepresentationsPartII.md) records **needs_changes**. These counts describe the proposed reconciled specification. A production merge instead retains 129 declarations and 54 planets: 35 historical contracts are not overridden and five excluded targets remain. Acceptance requires the scoped promotion repair in gap 18. The mathematical source and supplier gaps remain explicit and are not, by themselves, the reason acceptance is withheld. The [revision-2 handoff](../handoff/BP-AutomorphicGaloisRepresentationsPartII~2.md) records fresh source checks, a reproducible in-memory integration probe and six external prerequisite references that must be redirected before the obsolete generic ideal targets are removed. No production integration repair is claimed.

## Conventions and arithmetic scope

For n≥1, a dominant weight has weakly decreasing integer coordinates a_{τ,i}; negative coordinates are allowed. The infinitesimal character of π_τ is that of Ξ_a∨, while Ξ_a is the algebraic coefficient representation. Sources index i from 1 to n. The suggested file uses `Fin n`, indexed from 0 to n−1.

Artin reciprocity sends a uniformizer to geometric Frobenius. The cyclotomic character ε has ε(Frob_v)=q_v⁻¹ and HT(ε)=−1. With T_{v,i} the integral spherical double coset and t_{v,0}=1, the geometric good polynomial is

P_v(X)=Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2}t_{v,i}X^{n−i}.

Its roots in unitary Satake coordinates are q_v^{(n−1)/2}α_j. The integral coefficients require no square root. This early polynomial makes no use of local Langlands. AG2.5 compares it with the normalized correspondence, including the |det|^{(1−n)/2} twist. Changing geometric to arithmetic Frobenius replaces a monic polynomial by its normalized reciprocal; changing the representation to its dual must be tracked separately. For roots β_j and constant term c₀≠0, the monic reciprocal is c₀⁻¹X^nP_v(X⁻¹).

The Hodge multiset is H_τ(a)={a_{τ,i}+n−i:1≤i≤n}. Thus a=(k−2,0) gives {k−1,0}. Its sum determines the determinant weight, but not the multiset. Generic period statements whose supplier uses HT(ε)=+1 require the explicit sign dictionary. No sign change of labels alone is a period comparison.

If a_{τ,i}+a_{τc,n+1−i}=w, the purity weight is W=w+n−1. The polarized multiplier is μ_λ=ε^{1−n}r_{χ,λ}, with r_χ pure of weight 2w. Its real-place value is μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1); total oddness requires χ_v(−1)=(−1)^{n+w}. This weight factor is retained in the corrected parity statements.

M_π denotes the finite-part rationality field controlling good polynomial coefficients. A finite local realization field and a common global strong realization field are additional choices and conclusions. A trace field need not split a Schur-index obstruction. Chenevier–Harris Proposition 3.2.5, p.12, obtains a common field using regular good Frobenius polynomials at two distinct residue characteristics and the regular Hodge comparison. Its historical AG2.3 id is assigned to AG2.6 to respect this dependency.

The polarized branch proves full Frobenius-semisimple WD equality retaining N. For arbitrary nonselfdual CM π at v|ℓ, the AHTW branch proves de Rham admissibility, the complete Hodge multiset, semisimplified comparison and a monodromy upper bound. Spherical places are crystalline and Iwahori places are semistable. A general ramified equality of N is not among these conclusions. The stronger all-CM theorem is not extended here to arbitrary nonpolarized totally real π.

A compatible family has raw data before admissibility: coefficient field, rank, finite exceptional set, normalized common good polynomials, actual continuous semisimple members and labelled Hodge metadata. Weak, VeryWeak and ExtremelyWeak are separate predicates with different quantifiers. Weak implies VeryWeak implies ExtremelyWeak on this same carrier. Purity, strict local compatibility, polarization, regularity and residual irreducibility are separate properties. The exact definitions and discriminating tests appear in AG2.6.

Reduction first chooses a finite local realization and a stable lattice, then semisimplifies the reduction. Independence concerns that semisimple isomorphism class. A stable lattice alone supplies neither a perfect self-dual integral pairing nor an absolutely irreducible reduction.

ACC+ local genericity means trivial inertia and α_i/α_j≠q for every ordered pair i≠j, counting multiplicities. Repeated roots can satisfy it. Strong CS genericity also excludes ratio 1. A decomposed generic rational prime splits completely in F, differs from the coefficient characteristic, and satisfies the local condition at every v above it. Absolute irreducibility and residual-image hypotheses are independent. Unramified scalar twisting preserves local ratios; a ramified twist can destroy the inertia condition.

## Ownership and proof order

Only lower-tier roadmaps and existing Tau Ceti work are inputs. Current upstream main and the current library were read in addition to the older atlas snapshot; exact commits and pinned declarations are recorded below. The general rank-two, compatible-system, compact-Igusa and torsion consumers import the corresponding primitives here. Their existence or concentration theorems are not inputs to this roadmap.

| Owner | Exact division of work |
| --- | --- |
| AutomorphicFormsOnReductiveGroups AF.1/AF.4 | Automorphic representations, highest-weight algebraic coefficients, rationality and coefficient conjugation; AG2 applies them. |
| ArithmeticGaloisRepresentations R01/G7 | Generic continuous representations, stable lattices, semisimple recognition, WD operations, pairing/multiplier and residual polarization APIs. |
| IntegralHeckeAndGaloisDeterminants IHG.3/IHG.4 | Existing upstream Layers 3a/3b own the integral spherical polynomial and generic Galois-type/non-Eisenstein ideals; Layer 4 owns determinant gluing. AG2 supplies automorphic instances, HLTT congruence witnesses and the exact factor separation. |
| PELModuli M0/M4 | Generic PEL moduli and polarized O_F-linear effectivity. AG2 owns the specific compact Shin, ramified Drinfeld/Igusa and split HLTT instances. Unpolarized Honda–Tate classification is insufficient for the fixed-point count. |
| EtaleDualityAndPerverseSheaves EDC.8 | Generic trace formalism; the Fujiwara/Varshavsky refinement must precede stabilization. ET.5’s stabilized formula cannot justify its own raw geometric input. |
| EndoscopicTransferAndUnitaryTraceComparison ET.5/ET.6/ET.7a/ET.7b | Igusa stabilization, local correspondence, pure transfer/base change and characteristic-zero ST/END comparison. ET.6 follows the raw AG2.1a geometry. |
| SmoothRepresentationsOfLocalGroups and adic/étale cohomology owners | Smooth derived Ext, coefficients, boundedness, six operations and actions. AG2 specifies the classical EL local tower and its normalized Mantovan use. |
| PadicHodgeTheory R06; CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.6 | Generic period, descent, bounded-family closedness and weight machinery. The automorphic summands, tensor-square concentration and projected comparisons belong here. The two-boundary sequence needs its recorded extension. |
| PadicDifferentialEquationsAndRigidCohomology RD.4/RD.5/RD.6; AdicSpacesPartII F1 | RD supplies dagger/rigid functoriality, finiteness and weights; F1 supplies the geometric carriers. |
| GlobalNumberFields; ClassFieldTheory | Algebraic characters, reciprocity and local-global character/extension prescriptions. The CHT08 global polarization extension is read, including its parity obstruction. |
| PotentialModularityAndCompatibleSystems; AutomorphicGaloisRepresentations; IgusaVarietiesAndTorsionConcentration | These higher-tier consumers use the common family primitives, conditional rank-two recognition and compact models specified here. There is no upward construction input. |
| GSp4LocalLanglandsAndGaloisRepresentations, proposed owner | GSp₄ transfer, similitude, ordinary/singular weights and parahoric/inertia comparisons require the dedicated design. The routing appendix specifies the source contracts without fabricating a stage id. |

The proof order within each layer is determined by the prerequisites. The historical normalization id is in AG2.5, the polarized existence milestone and arbitrary-regular CS discrete application are in AG2.3, and the common realization-field theorem is in AG2.6. These placements make both the target graph and its layer contraction acyclic. AG2.1 has no mathematical target; its producers are AG2.1a and AG2.1b.

## Layer inventory

| Layer | Output | Targets | Planets | Coverage |
| --- | --- | ---: | ---: | --- |
| AG2.0 | Algebraic weights, characters and good polynomials | 14 | 6 | planned |
| AG2.1 | Process aggregate | 0 | 0 | source_decomposed |
| AG2.1a | Compact geometry and raw traces | 11 | 5 | planned |
| AG2.1b | Mantovan comparison and actual constituents | 8 | 5 | planned |
| AG2.2 | Polarized twisting, base change and discrete assembly | 4 | 4 | planned |
| AG2.3 | Definite families, descent and arbitrary regularity | 12 | 6 | planned |
| AG2.4 | HLTT ordinary boundary and nonselfdual existence | 15 | 6 | planned |
| AG2.5 | Local comparison, monodromy and purity | 17 | 3 | planned |
| AG2.6 | Coefficient-prime comparison and compatible families | 25 | 5 | planned |
| AG2.7 | Residual representations, genericity and exports | 18 | 6 | planned |

## Suggested statements at the pins

The [suggested file](../suggested/AutomorphicGaloisRepresentationsPartII.lean) is a compact 221-line collection of light coordinate definitions and true statements on carriers available at the pins. It elaborates successfully; all warnings are permitted proof placeholders. It does not develop the theory. Discharging its statements would not finish a layer or the roadmap: this reader carries the definitive target specification.

The concrete definitions give dominant weights, the conjugate weight relation, weight base change, shifted Hodge multisets and local genericity for actual matrix representations with specified inertia and Frobenius. Examples check rank zero and one, weight 12, integer-weight parity, integral n=2/n=3 polynomials, normalized reciprocal conversion, coefficient reduction and weak versus strong genericity. A two-dimensional matrix example has the same semisimple Frobenius with either zero or nonzero N, so it detects the information lost by semisimplification. Equivariant range and zero-rank statements check algebraic components of projector and monodromy arguments.

Automorphic representations, PEL towers, period modules, compatible-family structures and local Langlands parameters are targets below, rather than invented Lean carriers. APIs and tests involving these objects remain mathematical contracts. All implementation statuses are unchecked.

## AG2.0: Algebraic weights, characters and good polynomials

Fix the finite-part algebraicity and character conventions before any comparison with local Langlands. The generic spherical polynomial is imported from IHG; the automorphic specialization and normalization tests belong here.

**Planets:** Dominant polarized weights; Regular algebraic representations; Polarized automorphic representations; Algebraic Hecke characters; Expected Hodge–Tate weights; Automorphic rationality field.

<a id="ag20-dominant-weights-and-the-weight-w"></a>

### Dominant weights (ℤⁿ)^{Hom(F,Ω),+}, the subsets (ℤⁿ)_w for CM fields, base change of weights and the representations Ξ_a

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w` (definition).

For a number field F, rank n≥1 and algebraically closed characteristic-zero coefficient field Ω, use the embedding-wise dominant GL_n coordinates of AF.4: a family a has a_{τ,1}≥⋯≥a_{τ,n} at each τ:F→Ω. The notation (ℤⁿ)^{Hom(F,Ω),+} denotes this specialization of the imported algebraic-weight carrier. For totally real or CM F with conjugation c, membership in (ℤⁿ)_w means a_{τ,i}+a_{τ∘c,n+1−i}=w for every τ and i. When Ω=ℂ, conjugating the target embedding gives the same condition. Restriction of embeddings defines base change: (a_{F′})_{τ,i}=a_{τ|_F,i}. Extreme regularity asks that, at some embedding, equal-sized subsets of the shifted entries {a_{τ,i}+n−i} are determined by their sums. For complex coefficients Ξ_a is AF.4’s highest-weight representation, identified with the tensor product of the GL_n representations of highest weights a_τ. The coordinate notation and Ξ_a do not introduce a second highest-weight theory.

**Hypotheses.**

- Dominance is the ordering a_{τ,1} ≥ ⋯ ≥ a_{τ,n}, with repetitions allowed; regularity of the attached Hodge–Tate numbers comes from the shift by n − i (node expected-hodge-tate-multiset), not from strictness of a.
- The condition defining (ℤⁿ)_w pairs τ with τ∘c and i with n + 1 − i. It is empty unless F is totally real or CM.
- Ξ_a is a representation of the complex group GL_n^{Hom(F,ℂ)} = (Res_{F/ℚ} GL_n)_ℂ. Its highest-weight theory is supplied by AutomorphicFormsOnReductiveGroups AF.4 (algebraic highest weights).

**Proof or construction.**

1. Import AF.4/algebraic-weight and identify its dominant GL_n coordinates and representation V_a with the notation a and Ξ_a. Only the polarized weight-w condition and extremely-regular subset are added here.
2. Well-definedness: dominance and membership in (ℤⁿ)_w are finitely many linear conditions on the integers a_{τ,i}.
3. The two forms of the (ℤⁿ)_w condition agree for Ω = ℂ because, for F totally real or CM, τ∘c = c∘τ for every τ: F → ℂ (Mathlib's NumberField.IsCMField.complexEmbedding_complexConj).
4. a_{F′} is dominant, and lies in (ℤⁿ)_w for the same w when F′ is again totally real or CM and a ∈ (ℤⁿ)_w, since complex conjugation on F′ restricts to that of F.

**Prerequisites:** `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`, `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. Embedding-wise dominance, conjugate-coordinate weight relation and restriction of embeddings under base change.
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. Extremely regular weights; the definition continues on the same page.

**Uses determining the API.**

- AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight: the weight a of a regular algebraic π, through Ξ_a^∨
- AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset: HT_τ = {a_{ιτ,i} + n − i}
- AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier: the integer w with a ∈ (ℤⁿ)_w decides the parity condition on χ

**API.**

- `TauCeti.AutomorphicGalois.DominantWeight` (compatibility): The GL_n coordinate form of AF.4 AlgebraicWeight is ι → {a : Fin n → ℤ // Antitone a}; DominantWeight is this specialization, not a new general carrier.
- `TauCeti.AutomorphicGalois.DominantWeight.IsInW` (data): a.IsInW c w :⇔ ∀ τ i, a τ i + a (c τ) (rev i) = w, for an involution c of ι.
- `TauCeti.AutomorphicGalois.DominantWeight.baseChange` (constructor): (a.baseChange f) τ′ = a (f τ′) for the restriction f: Hom(F′, Ω) → Hom(F, Ω).
- `TauCeti.AutomorphicGalois.DominantWeight.IsExtremelyRegular` (data): Some τ has no two distinct equal-size subsets of {a τ i + n − 1 − i} with equal sums.
- `TauCeti.AutomorphicGalois.DominantWeight.xi` (compatibility): Ξ_a is the imported AF.4 representation V_a, identified with its embedding-wise tensor product; no highest-weight classification is reproved here.
- `TauCeti.AutomorphicGalois.DominantWeight.isInW_baseChange` (compatibility): a ∈ (ℤⁿ)_w implies a_{F′} ∈ (ℤⁿ)_w when F′ ⊇ F is CM or totally real.
- `TauCeti.AutomorphicGalois.DominantWeight.mk` (constructor): An embedding-indexed family a of antitone Fin n → ℤ functions constructs its DominantWeight.
- `TauCeti.AutomorphicGalois.DominantWeight.ext` (extensionality): Two dominant weights are equal when every embedding-wise coordinate is equal.
- `TauCeti.AutomorphicGalois.DominantWeight.baseChange_id` (simp): a.baseChange id = a.
- `TauCeti.AutomorphicGalois.DominantWeight.baseChange_comp` (functoriality): (a.baseChange f).baseChange g = a.baseChange (f ∘ g).

**Unit tests.**

- `TauCeti.AutomorphicGalois.DominantWeight.isInW_classical` (computation): For F = ℚ, n = 2, integer k≥2 and a = (k − 2, 0): a is dominant and lies in (ℤ²)_{k−2}.
- `TauCeti.AutomorphicGalois.DominantWeight.isInW_rank_one` (degenerate): For n = 1 every a ∈ ℤ^{Hom(F,ℂ)} is dominant, and a ∈ (ℤ¹)_w iff a_τ + a_{cτ} = w for all τ.
- `TauCeti.AutomorphicGalois.DominantWeight.not_isInW_unpaired` (non-example): For F imaginary quadratic, n = 2, a_τ = (1, 0) and a_{cτ} = (0, 0): a_{τ,1} + a_{cτ,2} = 1 but a_{τ,2} + a_{cτ,1} = 0, so a lies in no (ℤ²)_w.
- `TauCeti.AutomorphicGalois.DominantWeight.not_dominant` (non-example): (0, 1) is not dominant: a definition with a_{τ,1} ≤ ⋯ ≤ a_{τ,n} would accept it.

**Check.**

- For integer k≥2, the classical weight-k form gives a = (k − 2, 0) at the single embedding of ℚ, which lies in (ℤ²)_{k−2}.
- For F imaginary quadratic and n = 1, a = (a_τ, a_{cτ}) lies in (ℤ¹)_w with w = a_τ + a_{cτ}; w can be odd, e.g. (1, 0), the weight of the Hecke character of a CM elliptic curve.
- Dominant algebraic GL_n weights allow negative integers. The polarized determinant pair has tuples (1,…,1) and (−1,…,−1), with w=0; imposing nonnegative coordinates as in CH’s misprint E7 would wrongly exclude it.

<a id="ag20-polarized-galois-representation"></a>

### BLGGT pairing conventions for the imported polarized carrier

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` (comparison).

Use the continuous representation and polarized-extension carriers of R01.1 and G7. For CM F, the BLGGT pairing has symmetry ε_v=−μ(c_v), so total oddness is ε_v=1, equivalently μ(c_v)=−1; this is the convention bridge to the G_n-valued extension with multiplier μ. For totally real F, an invariant alternating (respectively symmetric) pairing has μ(c_v)=−ε_v (respectively ε_v) in the corresponding symplectic (respectively orthogonal) extension convention. Algebraic and regular conditions import the p-adic Hodge carrier, with HT(ε_ℓ)={−1}. This node specializes those carriers and does not construct a second deformation theory.

**Hypotheses.**

- The condition at one infinite place implies it at all of them, with ε_{v′} = µ(c_v c_{v′})ε_v and ⟨x, y⟩_{v′} = ⟨x, r(c_v c_{v′}) y⟩_v.
- For F imaginary, (r, µ) is polarized if and only if r extends to r̃: G_{F⁺} → 𝒢_n(Q̄_l) with multiplier µ, where 𝒢_n is the group of Clozel–Harris–Taylor (ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group).
- For F totally real, (r, µ) is polarized if and only if r factors through GSp_n (µ(c_v) = −ε_v) or GO_n (µ(c_v) = ε_v) with multiplier µ.
- Hodge–Tate numbers use BLGGT's convention HT_τ(ε_l) = {−1}.

**Proof or construction.**

1. Well-definedness: the pairing condition is a closed condition on (r, µ), and the change of place v ↦ v′ is the computation quoted in the hypotheses.
2. Equivalence with 𝒢_n-valued extensions (F imaginary), BLGGT's second remark in §2.1: r̃(c_v) = (A, a)·j, where A is determined by the Gram matrix of ⟨ , ⟩_v and ν(r̃(c_v)) = −a = µ(c_v), so a = ε_v. Conversely, a pairing is read off from r̃(c_v). (For n = 1, r̃(c)² = 1 forces a = 1, i.e. µ(c) = −1.)

**Prerequisites:** `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `PadicHodgeTheory:R06.2`, `ArithmeticGaloisRepresentations:G7/polarized-representation`, `ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant`, `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 31. The sign convention linking ε_v and µ(c_v).
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 31. Totally odd.

**Check.**

- n = 1, F imaginary: a character r with r^c = r^{−1}µ|_{G_F} is polarized with multiplier µ if and only if µ(c_v) = −1, since a non-degenerate pairing on a line is symmetric (ε_v = 1).
- n = 2, F imaginary quadratic, r = ρ|_{G_F} for an odd ρ: G_ℚ → GL_2(Q̄_l): (r, det ρ) is totally odd, via the pairing ⟨x, y⟩ = det(x, ρ(c)y).

<a id="ag20-galois-character-of-an-algebraic-hecke-character"></a>

### The l-adic character r_{l,ι}(χ) of an algebraic Hecke character, its Hodge–Tate numbers and its weight

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character` (construction).

Let F be a number field, l a prime and ι: Q̄_l ≅ ℂ, with Art_F normalised to send uniformisers to geometric Frobenius elements. Let χ: 𝔸_F^×/F^× → ℂ^× be algebraic: χ|_{(F_∞^×)⁰}(x) = ∏_{τ ∈ Hom(F,ℂ)} τ(x)^{−a_τ} with a_τ ∈ ℤ. There is a unique continuous character r_{l,ι}(χ): G_F → Q̄_l^× with ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for all v ∤ l; explicitly ι((r_{l,ι}(χ) ∘ Art_F)(x) ∏_τ (ι^{−1}τ)(x_l)^{a_τ}) = χ(x) ∏_τ (τ x_∞)^{a_τ}. It is de Rham above l with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}. The weight wt(χ) is the integer with |χ| = ‖·‖^{−wt(χ)/2}. Then a_τ + a_{τ′} = wt(χ) whenever τ|_{F₀} = τ′|_{F₀} ∘ c (F₀ the maximal CM subfield), wt(χ) is even when F₀ is totally real, wt(‖·‖_F) = −2, r_{l,ι}(‖·‖) = ε_l, and r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2} at every real place v when F is totally real.

**Hypotheses.**

- The normalisation of Art_F (uniformisers ↦ geometric Frobenius) fixes r_{l,ι}(‖·‖) = ε_l. With the arithmetic normalisation it would be ε_l^{−1}.
- HT_τ(ε_l) = {−1} in this convention, consistent with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}} and a = −1 for ‖·‖ over ℚ.
- The value at complex conjugation is computed at real places only: at a complex place there is no c_v in G_F.

**Proof or construction.**

1. The displayed formula defines a continuous character of 𝔸_F^×/F^×(F_∞^×)⁰ with values in Q̄_l^× (the correction factor at l cancels χ_∞ on F^×). Global Artin reciprocity (Tau Ceti ClassFieldTheory, layer 11) turns it into r_{l,ι}(χ).
2. Local compatibility at v ∤ l is immediate from the formula. Uniqueness follows from Čebotarev density of the unramified Frobenius elements.
3. Hodge–Tate numbers: on an open subgroup of O_{F_v}^× (v | l), r ∘ Art is ∏_τ τ^{−a_τ}, a Lubin–Tate character product, whose τ-Hodge–Tate number is a_{ι∘τ} (Serre, Abelian l-adic representations).
4. Weight: |χ| = ‖·‖^{−wt/2} and the unit theorem give a_τ + a_{τ′} = wt for conjugate pairs; for F₀ totally real all a_τ are equal, so wt = 2a is even.
5. Value at c_v for F totally real: χ = χ₀‖·‖^{−wt/2} with χ₀ of finite order. Then r(χ) = r(χ₀)ε_l^{−wt/2}, r(χ₀)(c_v) = χ_{0,v}(−1) = χ_v(−1) because Art_ℝ(−1) = c, and ε_l(c_v) = −1.

**Prerequisites:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `PadicHodgeTheory:R06.2`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §A.2, p. 87. The Hodge–Tate numbers of r_{l,ι}(χ).
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §A.2, p. 87. Parity of the weight over a totally real field.
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Notation, p. 8. The Artin normalisation fixing r_{l,ι}(‖·‖) = ε_l.

**Uses determining the API.**

- AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier: the value of r_{l,ι}(χ) at complex conjugation
- AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions: the n = 1 case of the Frobenius dictionary
- AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation: the multiplier ε_l^{1−n} r_{l,ι}(χ)

**API.**

- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar` (constructor): r_{l,ι}(χ): G_F → Q̄_l^× for an algebraic Hecke character χ.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_local` (characterisation): ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for v ∤ l.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.hodgeTate_galoisChar` (characterisation): HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.wt` (data): wt(χ) ∈ ℤ with |χ| = ‖·‖^{−wt(χ)/2}.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_mul` (simp): r_{l,ι}(χ₁χ₂) = r_{l,ι}(χ₁) r_{l,ι}(χ₂).
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_norm` (simp): r_{l,ι}(‖·‖_F) = ε_l.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_complexConj` (relation): For F totally real: r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}.
- `TauCeti.AutomorphicGalois.AlgHeckeChar.galoisChar_restrict` (functoriality): r_{l,ι}(χ|_{𝔸_{F⁺}^×}) = r_{l,ι}(χ) ∘ V, V: G_{F⁺}^{ab} → G_F^{ab} the transfer.

**Unit tests.**

- `TauCeti.AutomorphicGalois.galoisChar_norm_rat` (computation): F = ℚ: r_{l,ι}(‖·‖) = ε_l, with HT {−1} and wt −2.
- `TauCeti.AutomorphicGalois.galoisChar_trivial` (degenerate): r_{l,ι}(1) = 1, with a = 0 and wt 0.
- `TauCeti.AutomorphicGalois.galoisChar_finite_order` (compatibility): For ω of finite order unramified at p ∤ l: r_{l,ι}(ω)(Frob_p^{geom}) = ω_p(p), and r_{l,ι}(ω)(Frob_p^{arith}) = ω_p(p)^{−1}.
- `TauCeti.AutomorphicGalois.galoisChar_restrict_complexConj` (non-example): For F imaginary and ψ algebraic on F, r_{l,ι}(ψ|_{𝔸_{F⁺}})(c_v) = +1 because the transfer sends c_v to c_v² = 1, whatever ψ_v(−1) is: the Galois sign is not χ_v(−1) unless wt/2 is even.

**Check.**

- F = ℚ, χ = ‖·‖: r = ε_l and HT = {−1}, i.e. a = −1 and wt = −2.
- F = ℚ, ω of finite order and unramified at p ∤ l: r_{l,ι}(ω)(Frob_p) = ω_p(p) for the geometric Frobenius, so the arithmetic Frobenius goes to ω_p(p)^{−1}. Which of χ(p)^{±1} this is for a Dirichlet character χ depends on how χ is made idelic, and must be fixed once (GlobalNumberFields layer 9's Dirichlet dictionary).
- The Hecke character ψ of a CM elliptic curve E over its CM field K (weight (1, 0)): r_{l,ι}(ψ) ⊕ r_{l,ι}(ψ^c) is the restriction to G_K of the dual of V_l(E), in this convention.

<a id="ag20-regular-algebraic-of-weight"></a>

### Regular algebraic automorphic representations of GL_n(𝔸_F) and their weight

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight` (definition).

For an automorphic GL_n(𝔸_F) representation π over a number field F, regular algebraicity means that its archimedean infinitesimal character comes from an irreducible algebraic representation of Res_{F/ℚ} GL_n. Write its weight as the unique dominant family a for which infChar(π_∞)=infChar(Ξ_a^∨). If an algebraic Hecke character ψ has identity-component infinity type ∏_τ τ(x)^{−b_τ}, tensoring π with ψ∘det changes a_{τ,i} to a_{τ,i}+b_τ. Thus an integer norm twist π⊗‖det‖^t changes every coordinate to a_{τ,i}−t.

**Hypotheses.**

- The infinitesimal character is compared with that of Ξ_a^∨, not Ξ_a; this is the convention of both BLGGT and ACC+.
- Regular algebraic is Clozel's C-algebraic for GL_n. It differs from L-algebraic by the twist ‖det‖^{(n−1)/2} when n is even. The C/L distinction is owned by AutomorphicFormsOnReductiveGroups AF.4 and is not re-planned here.
- No cuspidality, self-duality or unitarity is part of the definition.

**Proof or construction.**

1. Well-definedness of the weight: the infinitesimal character of Ξ_a^∨ is the W-orbit of −w₀a + ρ at each τ, and these orbits determine a (AF.4's Harish-Chandra parametrisation).
2. Twisting: the infinitesimal character of π_∞ ⊗ (ψ_∞∘det) is that of π_∞ shifted by the exponents of ψ_∞, and Ξ_a^∨ ⊗ ∏_τ τ(det)^{−b_τ} = Ξ_{a+b}^∨. For ψ = ‖·‖^t, the identity-component exponents are b_τ = −t, since ‖x‖ = ∏_τ |τ(x)| on (F_∞^×)⁰.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`](#ag20-dominant-weights-and-the-weight-w), `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicFormsOnReductiveGroups:AF.4/infinitesimal-character-of-weight`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. The definition of regular algebraic.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §1, Notation, p. 908. ACC+ use the same Ξ^∨ convention for the weight.

**Uses determining the API.**

- AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation: a polarized pair is regular algebraic of some weight a ∈ (ℤⁿ)_w
- AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places: the class of π to which Galois representations are attached
- AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality: rationality is proved for regular algebraic cuspidal π

**API.**

- `TauCeti.AutomorphicGalois.IsRegularAlgebraic` (data): π.IsRegularAlgebraic :⇔ ∃ a, π.HasWeight a.
- `TauCeti.AutomorphicGalois.HasWeight` (data): π.HasWeight a :⇔ infChar π_∞ = infChar (Ξ_a)^∨.
- `TauCeti.AutomorphicGalois.HasWeight.unique` (characterisation): π.HasWeight a → π.HasWeight b → a = b.
- `TauCeti.AutomorphicGalois.HasWeight.twist` (compatibility): π.HasWeight a → (π ⊗ ψ∘det).HasWeight (a + b) for ψ algebraic of exponents (b_τ).
- `TauCeti.AutomorphicGalois.HasWeight.twist_norm` (simp): (π ⊗ ‖det‖^t).HasWeight (a − t) ↔ π.HasWeight a.

**Unit tests.**

- `TauCeti.AutomorphicGalois.hasWeight_heckeCharacter` (computation): n = 1: ψ with ψ_∞(x) = ∏ τ(x)^{−a_τ} on (F_∞^×)⁰ has weight (a_τ).
- `TauCeti.AutomorphicGalois.hasWeight_classical` (computation): For a classical newform f of integer weight k≥2, π_f ⊗ ‖det‖^{1−k/2} has weight (k − 2, 0).
- `TauCeti.AutomorphicGalois.not_isRegularAlgebraic_odd_weight_unitary` (non-example): π_f with f of odd weight k is not regular algebraic: its infinitesimal character (±(k − 1)/2) is not a shifted integral weight.
- `TauCeti.AutomorphicGalois.hasWeight_trivial` (degenerate): The trivial representation of GL_1(𝔸_F) has weight 0.

**Check.**

- n = 1: an algebraic Hecke character ψ with ψ|_{(F_∞^×)⁰}(x) = ∏ τ(x)^{−a_τ} is regular algebraic of weight (a_τ).
- n = 2, F = ℚ: for a newform f of integer weight k≥2, the automorphic representation π_f (unitary normalisation) is not regular algebraic when k is odd, but π_f ⊗ ‖det‖^{1−k/2} is, of weight (k − 2, 0).

<a id="ag20-expected-hodge-tate-multiset"></a>

### The Hodge–Tate multiset attached to a weight: HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset` (definition).

For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, ι: Q̄_l ≅ ℂ and τ: F → Q̄_l, put HT_τ(a) = {a_{ι∘τ,i} + n − i : 1 ≤ i ≤ n}, a multiset of n integers, in BLGGT's convention HT_τ(ε_l) = {−1}. The elements are distinct, so a Galois representation with these Hodge–Tate numbers is regular. If F is CM and a ∈ (ℤⁿ)_w, then HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}. Twisting a by −t (π ↦ π ⊗ ‖det‖^t) subtracts t from every element, matching ⊗ ε_l^t. In the opposite convention (HT(ε_l) = +1) every element is negated.

**Hypotheses.**

- This is the target that AG2.6 proves for r_{l,ι}(π) (BLGGT Theorem 2.1.1(3), ACC+ Theorem 2.3.3(b)); here it is only the dictionary from a to a multiset.
- The integer w + n − 1 is BLGGT's w in Theorem 2.1.1(3). The two integers must not be confused.

**Proof or construction.**

1. Distinctness: a dominant gives a_{τ,i} + n − i > a_{τ,j} + n − j for i < j.
2. Polarity: a_{τc,i} = w − a_{τ,n+1−i}, so a_{τc,i} + n − i = (w + n − 1) − (a_{τ,n+1−i} + n − (n + 1 − i)).
3. Twist: (a − t)_{τ,i} + n − i = (a_{τ,i} + n − i) − t, and HT(ε_l^t) = {−t}.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`](#ag20-dominant-weights-and-the-weight-w).

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(3), p. 33. The multiset, and after it the polarity HT_{τ∘c} = {w − h}, with BLGGT's w equal to w + n − 1 here.
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Notation, p. 8. The sign convention for Hodge–Tate numbers.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Corollary 7.2.4, p. 1100. Weight 0 corresponds to Sym^m of the dual Tate module (the test expectedHodgeTate_zero).

**Uses determining the API.**

- AutomorphicGaloisRepresentationsPartII:AG2.6: the labelled Hodge–Tate multiset of the constructed representations
- AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation: regular algebraic means |HT_τ| = n

**API.**

- `TauCeti.AutomorphicGalois.expectedHodgeTate` (constructor): expectedHodgeTate a = multiset of a i + (n − 1 − i), i : Fin n (0-indexed).
- `TauCeti.AutomorphicGalois.expectedHodgeTate_strictAnti` (characterisation): i ↦ a i + (n − 1 − i) is strictly antitone when a is antitone.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_conj` (relation): a ∈ (ℤⁿ)_w ⇒ HT at τc is {w + n − 1 − h : h ∈ HT at τ}.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_twist` (simp): expectedHodgeTate (a − t) = (expectedHodgeTate a).map (· − t).
- `TauCeti.AutomorphicGalois.expectedHodgeTate_card` (characterisation): The multiset expectedHodgeTate a has cardinality n.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_nodup` (characterisation): For antitone a, expectedHodgeTate a has no repetitions, by strict antitonicity of the shifted coordinates.

**Unit tests.**

- `TauCeti.AutomorphicGalois.expectedHodgeTate_classical` (computation): n = 2, a = (k − 2, 0) ↦ {k − 1, 0}; for k = 12, {11, 0}.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_zero` (degenerate): For n≥1, a = 0 ↦ {n − 1, …, 1, 0}: parallel weight 0 gives the Hodge–Tate numbers of Symⁿ⁻¹ of the dual Tate module of an elliptic curve.
- `TauCeti.AutomorphicGalois.expectedHodgeTate_regular` (compatibility): The elements are pairwise distinct, so the multiset is regular in BLGGT's sense (|HT_τ| = n).
- `TauCeti.AutomorphicGalois.not_expectedHodgeTate_unshifted` (non-example): The unshifted multiset {a_{τ,i}} fails regularity for a = 0 and n ≥ 2, so the shift n − i is part of the definition.

**Check.**

- For integer k≥2, n = 2, a = (k − 2, 0): HT = {k − 1, 0} for ρ_f^∨ in BLGGT’s convention and for ρ_f in R19’s opposite convention. Negating the convention for a fixed representation negates its weights; passing to its dual also negates them.
- n = 2, a = (0, 0), w = 0: HT = {1, 0} at τ and τc, as for the dual of the Tate module of an elliptic curve in BLGGT's convention (V_l(E) itself has {0, −1}). ACC+ attach Sym^m r_{E,l}^∨ to a π of weight 0.

<a id="ag20-unitary-similitude-central-character-dictionary"></a>

### The similitude character in a compact coefficient system

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary` (comparison).

For Shin’s compact similitude datum, write an algebraic coefficient ξ by its integral central exponent a₀(ξ) and dominant entries a(ξ)_{σ,1}≥⋯≥a(ξ)_{σ,n} for the chosen CM type. Its purity weight is w(ξ)=−2a₀(ξ)−Σ_{σ,i}a(ξ)_{σ,i}. The normalization of the coefficient sheaf and the extracted Galois constituent retains the GL₁-character ψ: the shifted labelled integers are j_κ(k)=k−1−a(ιξ)_{ικ,k}−a₀(ιξ). For ξ=ν^t, a₀=t and all a_{σ,i}=0, so w(ξ)=−2t and j_κ(k)=k−1−t. This is the required nontrivial central-character acceptance case.

**Hypotheses.**

- Use the chosen CM type and positive similitude component, with Shin §3.6 and §6.2 indexing; n≥1, t integral.

**Proof or construction.**

1. Restrict ξ to the central similitude torus and evaluate the central character; import the algebraic coefficient representation from AF.4/B2.
2. Keep a₀ through the Kuga–Sato Tate twist and the GL₁ correction in Shin Corollary 6.8.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`](#ag20-dominant-weights-and-the-weight-w), `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicBundles:B2`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.6, definitions preceding (3.18), and §6.2 preceding Corollary 6.7, pp. 20, 48. The central exponent enters both w(ξ) and j_κ(k); forgetting it fails the similitude acceptance test.

**Check.**

- t=1 shifts each j by −1 and the weight by −2.
- t=0 gives the trivial central character.
- Changing the highest GL_n weight and changing a₀ are separate operations.

<a id="ag20-prescribed-crystalline-twisting-character"></a>

### A crystalline character with prescribed p-adic unit type

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/prescribed-crystalline-twisting-character` (theorem).

Let F be CM, p a prime, E/Q_p sufficiently large, S a finite ramification set containing the p-adic places, and ṽ a p-adic place split over F⁺. For the compatible algebraic local unit characters used in ACC+ §4.5.1, there is a continuous ψ:G_F→O_E^× crystalline at every place above p, unramified at ṽ and at S minus S_p, and with ψ∘Art_{F_{ṽc}} on units equal to ∏_{τ:F_{ṽ}→E}(τc)^(λ_{τ₀,1}+λ_{τ₀c,1}), where τ₀ maximizes that sum. Its labelled HT weights are 0 at ṽ and −λ_{τ₀,1}−λ_{τ₀c,1} at ṽc. Additional finite ramification is allowed outside S.

**Hypotheses.**

- The local prescriptions satisfy the global unit and totally real restriction compatibility of HSBT Lemma 2.2.
- This is the source’s split-place construction; arbitrary inconsistent local characters are excluded.

**Proof or construction.**

1. Use HSBT Lemma 2.2 to extend the compatible character from units and the totally real idele subgroup.
2. Apply geometric class field theory and the algebraic-character p-adic Hodge formula; enlarge E and the finite ramification set.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`](#ag20-dominant-weights-and-the-weight-w), `PadicHodgeTheory:R06.2`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §4.5.1, proof of Theorem 4.5.1, pp. 985–986. The split p-adic twist is used to place the weights in the prescribed range.
- [A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf), Lemma 2.2, pp. 795–796. The three compatibility hypotheses precede the extension, so local prescriptions alone do not imply existence.

**Check.**

- The sign on HT is negative for positive unit exponent in geometric Artin normalization.
- The character is unramified at ṽ while carrying the opposite-place type.
- A nontrivial character on a global unit violating compatibility cannot extend.

<a id="ag20-polarized-automorphic-representation"></a>

### Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation` (definition).

Let F be totally real or CM with maximal totally real subfield F⁺ and complex conjugation c, and π an automorphic representation of GL_n(𝔸_F). (i) π is conjugate self-dual if π^c ≅ π^∨. (ii) π is essentially conjugate self-dual with multiplier χ if χ: 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× is continuous and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det). (iii) (π, χ) is a polarized automorphic representation if moreover χ_v(−1) is independent of v | ∞. (iv) π is polarizable if some (π, χ) is polarized. (v) A regular algebraic polarized (π, χ) of weight a ∈ (ℤⁿ)_w with F imaginary is totally odd if χ_v(−1) = (−1)^{n+w} for all v | ∞. Here π^c = π ∘ c on GL_n(𝔸_F), and π^c = π when F is totally real.

**Hypotheses.**

- The multiplier χ is part of the data. It is determined by π only up to δ_{F/F⁺}, since δ_{F/F⁺} ∘ N_{F/F⁺} = 1.
- BLGGT impose instead χ_v(−1) = (−1)^n for F imaginary (printed with µ in place of χ). That is the correct normalisation only when w is even; with odd w it makes the Galois multiplier even (sourceIssue AutomorphicGaloisRepresentationsPartII/E2; node sign-of-the-polarization-multiplier). Condition (v) is the corrected form, and like BLGGT's it can always be achieved by replacing χ by χδ_{F/F⁺}.
- For regular algebraic (π, χ) of weight a ∈ (ℤⁿ)_w, χ is algebraic with |χ| = ‖·‖^{−w}. Conjugate self-duality is the case χ = 1, possible only when w = 0.
- For F totally real, polarized means essentially self-dual with χ_v(−1) independent of v. Patrikis shows the independence is automatic for regular algebraic cuspidal π; this packet does not use that.

**Proof or construction.**

1. Well-definedness: π^c and π^∨ ⊗ (χ ∘ N ∘ det) are automorphic representations, so the condition is an isomorphism class condition; χ_v(−1) makes sense since −1 ∈ (F⁺_v)^× at every real place v.
2. Weight constraint: comparing the infinitesimal characters of π^c (weight (a_{τc,i})) and π^∨ ⊗ (χ∘N∘det) (weight (−a_{τ,n+1−i} + b)), where χ has parallel exponent b, gives a_{τc,i} + a_{τ,n+1−i} = b. So a ∈ (ℤⁿ)_b and w = b, and |χ| = ‖·‖^{−w}.
3. Normalisation: χ and χδ_{F/F⁺} give the same condition (ii), and δ_{F/F⁺,v}(−1) = −1 at every real place v when F is imaginary. So exactly one of them satisfies (v).

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`](#ag20-regular-algebraic-of-weight), [`AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`](#ag20-dominant-weights-and-the-weight-w), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. The three conditions of a polarized pair follow on the same page.
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32. BLGGT's sign normalisation, with µ printed for χ (sourceIssue E1); corrected in (v) (E2).
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Hypotheses 4.1(ii), p. 13. Chenevier–Harris's polarization over a totally real field, with the same independence condition.

**Uses determining the API.**

- AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier: the parity of χ_v(−1) against n + w
- AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation: (r_{l,ι}(π), ε^{1−n} r_{l,ι}(χ)) is the expected polarized Galois pair
- AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris: the input class of the polarized construction

**API.**

- `TauCeti.AutomorphicGalois.IsConjSelfDual` (data): π.IsConjSelfDual :⇔ π^c ≅ π^∨.
- `TauCeti.AutomorphicGalois.IsEssConjSelfDual` (data): π.IsEssConjSelfDual χ :⇔ π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det).
- `TauCeti.AutomorphicGalois.PolarizedAutRep` (structure): A pair (π, χ) with IsEssConjSelfDual and v ↦ χ_v(−1) constant on the real places.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.twistDelta` (constructor): (π, χ) ↦ (π, χ δ_{F/F⁺}), again polarized.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.IsTotallyOdd` (data): For regular algebraic (π, χ) of weight in (ℤⁿ)_w: χ_v(−1) = (−1)^{n+w} for v | ∞.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.exists_totallyOdd` (characterisation): Exactly one of (π, χ), (π, χδ_{F/F⁺}) is totally odd when F is imaginary.
- `TauCeti.AutomorphicGalois.PolarizedAutRep.weight_mem_W` (relation): A regular algebraic polarized pair has weight in (ℤⁿ)_w with |χ| = ‖·‖^{−w}.

**Unit tests.**

- `TauCeti.AutomorphicGalois.polarized_heckeCharacter_cm` (computation): n = 1, ψ of weight (1, 0) over an imaginary quadratic field: (ψ, ψ|_{𝔸_ℚ}δ) is totally odd; (ψ, ψ|_{𝔸_ℚ}) is not.
- `TauCeti.AutomorphicGalois.isConjSelfDual_iff_multiplier_one` (degenerate): π.IsConjSelfDual ↔ π.IsEssConjSelfDual 1.
- `TauCeti.AutomorphicGalois.polarized_totallyReal` (compatibility): For F totally real, π^c = π and polarized means essentially self-dual with χ_v(−1) independent of v.
- `TauCeti.AutomorphicGalois.not_totallyOdd_blggt_sign_odd_w` (non-example): A pair satisfying BLGGT's printed χ_v(−1) = (−1)^n with w odd (the CM elliptic curve character) is not totally odd: its Galois multiplier takes c_v to +1.

**Check.**

- n = 1, F imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0), w = 1): ψψ^c = ψ|_{𝔸_{F⁺}} ∘ N, and (ψ, ψ|_{𝔸_ℚ}) satisfies BLGGT's printed condition while (ψ, ψ|_{𝔸_ℚ} δ) is totally odd.
- Base change of a weight-k newform to an imaginary quadratic field: π^c ≅ π and π^∨ ≅ π ⊗ ω_π^{−1}, so π is essentially conjugate self-dual with multiplier the central character of the form (twisted as needed), and w = k − 2.

<a id="ag20-frobenius-polynomial-and-conventions"></a>

### Automorphic specialization of the integral Hecke polynomial

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions` (comparison).

Let v be a finite place of F with q_v = #k(v), π_v an unramified irreducible representation of GL_n(F_v), and t_{v,i} the eigenvalue on π_v^{GL_n(O_{F_v})} of T_{v,i} = [GL_n(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_n(O_{F_v})] (ϖ_v repeated i times). Define P_v(π_v; X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}. If α₁, …, α_n are the Satake parameters of π_v, with t_{v,i} = q_v^{i(n−i)/2} e_i(α), then P_v(π_v; X) = ∏_j (X − q_v^{(n−1)/2} α_j). Conventions: a Galois representation r corresponds to π at v in the geometric convention (BLGGT, ACC+, HLTT: Frob_v geometric, Art uniformisers ↦ geometric Frobenius) if ι det(X − r(Frob_v)) = P_v(π_v; X). It corresponds in the arithmetic convention (IntegralHeckeAndGaloisDeterminants IHG.3, and R19) if the arithmetic Frobenius has characteristic polynomial P_v(π_v; X). r corresponds in one convention if and only if r^∨ corresponds in the other. Twists: P_v(π_v ⊗ ‖det‖^t; X) = q_v^{−tn} P_v(π_v; q_v^t X), matching r ↦ r ⊗ ε_l^t. The contragredient has roots q_v^{n−1}/β_j, where β_j are the roots for π_v, matching r ↦ r^∨ ⊗ ε_l^{1−n}.

**Hypotheses.**

- No local Langlands correspondence is used. For unramified π_v, 'r corresponds at v' is defined by the polynomial identity, which is what AG2.0 requires. Agreement with rec(π_v ⊗ |det|^{(1−n)/2}) for unramified π_v is an AG2.5 comparison.
- ACC+ say P_v corresponds to Frobenius on rec^T(π_v), their arithmetic normalisation of local Langlands (Clozel–Thorne §2.1), with Frob_v geometric in their notation. That is the geometric convention here.

**Proof or construction.**

1. Import the normalized Satake and integral polynomial declarations from IHG.3; specialize the coefficient ring along the spherical Hecke eigencharacter of π_v.
2. Use the imported scalar-twist and reciprocal-polynomial identities, with ε_ℓ(Frob_geom)=q_v^(−1), to obtain norm, contragredient and Frobenius conversion formulas.
3. For rank two compare the resulting polynomial with the classical Hecke eigenvalues; this is a polynomial acceptance check and does not use a modular Galois existence theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`](#ag20-regular-algebraic-of-weight), `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients`, `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`, `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, (2.2.6), p. 922. Use all signed coefficients of the characteristic polynomial. The terminal sign and unitary powers in the displayed definitions require the corrections recorded as E6; the packet’s GL_n polynomial already has the correct signs and degrees.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Theorem 2.3.2, p. 935. The geometric convention in the construction HLTT–ACC+ use (Frob_v geometric).
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation, p. 906. rec^T, in which P_v is read.

**Check.**

- n = 1: P_v(X) = X − χ_v(ϖ_v), and r_{l,ι}(χ)(Frob_v) = ι^{−1}χ_v(ϖ_v) in the geometric convention (galois-character-of-an-algebraic-hecke-character).
- n = 2, F = ℚ, π = π_f ⊗ ‖det‖^{1−k/2}, normalised so that T_{p,1} acts by a_p and T_{p,2} by ψ(p)p^{k−2}: P_p(X) = X² − a_pX + ψ(p)p^{k−1}. This is the R19 polynomial of ρ_f for arithmetic Frobenius, so the geometric convention gives r_{l,ι}(π) ≅ ρ_f^∨. For Δ at p = 2: X² + 24X + 2^{11}.
- n = 3: P_v(X) = X³ − t₁X² + q t₂X − q³ t₃ = ∏(X − qα_j) when t₁ = q e₁, t₂ = q e₂ and t₃ = e₃.

<a id="ag20-sign-of-the-polarization-multiplier"></a>

### The parity of the Galois multiplier of a polarized pair: µ(c_v) = (−1)^{n−1+w} χ_v(−1)

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` (lemma).

Let F be imaginary CM and (π, χ) a regular algebraic polarized automorphic representation of GL_n(𝔸_F) of weight a ∈ (ℤⁿ)_w. Put µ = ε_l^{1−n} r_{l,ι}(χ): G_{F⁺} → Q̄_l^×. Then µ(c_v) = (−1)^{n−1+w} χ_v(−1) for every v | ∞. Hence µ is totally odd if and only if χ_v(−1) = (−1)^{n+w}, i.e. (π, χ) is totally odd in the sense of polarized-automorphic-representation (v). Under BLGGT's printed normalisation χ_v(−1) = (−1)^n, µ(c_v) = (−1)^{w+1}: it is −1 exactly when w is even.

**Hypotheses.**

- The integer w is the one with a ∈ (ℤⁿ)_w. Theorem 2.1.1 of BLGGT uses a different integer, the purity weight w + n − 1 of r_{l,ι}(π).
- Only the multiplier's value at complex conjugation is computed. No Galois representation r_{l,ι}(π) is needed for the statement.

**Proof or construction.**

1. By polarized-automorphic-representation, χ is algebraic with parallel exponent b = w on 𝔸_{F⁺}, so wt(χ) = 2w.
2. By galois-character-of-an-algebraic-hecke-character, r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^w.
3. ε_l(c_v) = −1, so ε_l^{1−n}(c_v) = (−1)^{n−1}, and µ(c_v) = (−1)^{n−1+w} χ_v(−1).
4. Consequence for BLGGT Theorem 2.1.1(1): the pair (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) is totally odd only for the multiplier χ satisfying (v). With χ_v(−1) = (−1)^n and w odd, µ(c_v) = +1, and (r_{l,ι}(π), µ) is not even polarized for n = 1 (a pairing on a line is symmetric).
5. Independent check against Patrikis, who records the sign of the pairing preserved by these representations as ω_ι(c_v) = (−1)^w ω_v(−1) in his normalisation.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`](#ag20-polarized-automorphic-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`](#ag20-polarized-galois-representation).

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(1), p. 33. The assertion that fails for odd w under the printed normalisation (sourceIssue E2).
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Proof of Theorem 2.1.1, p. 34. The step that holds only when w is even.
- [On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2), §4, proof of Proposition 4.1, p. 8. An independent calculation of ω_ι(c_v)=(−1)^w ω_v(−1), with ω_ι the associated geometric Galois character. This is in Proposition 4.1, not the proof of Theorem 2.1.

**Check.**

- n = 1, F = K imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0), w = 1): ψψ^c = ψ|_{𝔸_ℚ} ∘ N. χ = ψ|_{𝔸_ℚ} has χ_∞(−1) = (−1)^1 = −1, BLGGT's sign. But r_{l,ι}(ψ|_{𝔸_ℚ})(c) = 1 (transfer), whereas χ = ψ|_{𝔸_ℚ}δ_K, with χ_∞(−1) = +1 = (−1)^{n+w}, gives µ(c) = −1.
- n = 2, the base change to K of a newform of weight k with k odd (w = k − 2 odd): BLGGT's sign gives µ(c) = +1. The invariant pairing on r = ρ_f^∨|_{G_K} is symmetric (det(x, ρ(c)y)), so the totally odd multiplier is the other one, the extension of det r with value −1 at c.
- w even (for instance n = 1 and ψ with ψψ^c = 1): the corrected and printed normalisations agree.

<a id="ag20-galois-representation-attached-at-good-places"></a>

### A Galois representation attached to π at the good places, and its functoriality under twist, dual, conjugation and base change

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` (definition).

For regular algebraic cuspidal π, a coefficient isomorphism ι:Q̄_ℓ≅C, and a continuous semisimple rank-n representation r of G_F unramified outside a finite set, IsAttached(ι,r,π) means that outside a finite set of finite places v∤ℓ, π_v is spherical, r is unramified, and ι det(X−r(Frob_v^geom))=P_v(π_v;X). The exceptional set contains the ramification of π, F and r and the coefficient prime. Two such r are isomorphic by Frobenius density. This is a good-place condition; it asserts neither local Langlands compatibility at ramified places nor de Rham admissibility nor global existence.

**Hypotheses.**

- This is the property HLTT prove for every regular algebraic cuspidal π over a CM field (ACC+ Theorem 2.3.2). It is the interface that AG2.1–AG2.4 produce and AG2.5 strengthens. Nothing at the places in S, or above l, is asserted.
- Uniqueness needs semisimplicity. It uses Čebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations R01.1/R01.5).
- The base-change clause needs the Satake parameters of BC(π)_w to be the q-power restrictions of those of π_v (the unramified base-change identity), requested from EndoscopicTransferAndUnitaryTraceComparison ET.7, which exports the Arthur–Clozel base-change steps to this roadmap.

**Proof or construction.**

1. The polynomial condition is invariant under change of a Frobenius lift at an unramified place and isomorphism of r.
2. Apply R01.5 recognition on a density-one set to prove uniqueness among semisimple representations.
3. Twist, dual and conjugation formulas are exported by the separate attachment-operations lemma; solvable base change is a late AG2.2 export.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), [`AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`](#ag20-regular-algebraic-of-weight), `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Theorem 2.3.2, p. 935. The good-place property that defines attachment.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.3, after Definition 2.3.6, p. 938. The contragredient rule r ↦ r^∨ ⊗ ε^{1−n}, as ACC+ state it for Hecke maximal ideals.

**Uses determining the API.**

- AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems: HLTT Theorem A produces an attached r_{p,ι}(π)
- AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris: the polarized construction's good-place property
- AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality: P_v(π_v) has coefficients in M_π, so an attached r has traces in ι^{-1}(M_π) at good places

**API.**

- `TauCeti.AutomorphicGalois.IsAttached` (data): r.IsAttached ι π :⇔ ∃ S finite, ∀ v ∉ S, r unramified at v ∧ ι det(X − r(Frob_v)) = P_v(π_v).
- `TauCeti.AutomorphicGalois.IsAttached.unique` (extensionality): r, r′ semisimple and both attached to π ⇒ r ≅ r′.
- `TauCeti.AutomorphicGalois.IsAttached.twist` (functoriality): r.IsAttached π → (r ⊗ r_{l,ι}(ψ)).IsAttached (π ⊗ ψ∘det).
- `TauCeti.AutomorphicGalois.IsAttached.dual` (functoriality): r.IsAttached π → (r^∨ ⊗ ε_l^{1−n}).IsAttached π^∨.
- `TauCeti.AutomorphicGalois.IsAttached.conj` (functoriality): r.IsAttached π → r^c.IsAttached π^c.

**Unit tests.**

- `TauCeti.AutomorphicGalois.isAttached_heckeCharacter` (degenerate): n = 1: r_{l,ι}(ψ).IsAttached ι ψ.
- `TauCeti.AutomorphicGalois.isAttached_classical` (computation): ρ_f^∨ is attached to π_f ⊗ ‖det‖^{1−k/2}; for Δ the polynomial at 2 is X² + 24X + 2^{11}.
- `TauCeti.AutomorphicGalois.not_isAttached_classical_rho` (non-example): ρ_f is not attached to π_f ⊗ ‖det‖^{1−k/2} (for Δ its geometric polynomial at 2 is X² + 24·2^{−11}X + 2^{−11}).
- `TauCeti.AutomorphicGalois.isAttached_dual_twist` (compatibility): The two rules compose consistently: (r^∨ε^{1−n})^∨ε^{1−n} = r, matching π^∨∨ = π.

**Check.**

- n = 1: r_{l,ι}(ψ) is attached to ψ.
- n = 2, F = ℚ: ρ_f^∨ (R19 convention for ρ_f, i.e. the cohomological realisation M_{f,λ}) is attached to π_f ⊗ ‖det‖^{1−k/2}; ρ_f is attached to (π_f ⊗ ‖det‖^{1−k/2})^∨ ⊗ ‖det‖ (dual rule, then twist rule with r_{l,ι}(‖·‖) = ε_l); for Δ at 2, ρ_f^∨ has geometric-Frobenius roots β_j and ρ_f has roots 1/β_j, where β_j are the roots of X² + 24X + 2^{11}.
- Dual check at n = 2: ρ_f^∨ is attached to π ⇒ ρ_f ⊗ ε_l^{−1} is attached to π^∨. Indeed ρ_f ⊗ ε_l^{−1} = (ρ_f^∨)^∨ ⊗ ε_l^{1−2}.

<a id="ag20-field-of-rationality"></a>

### Rationality of the good Hecke polynomials

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality` (theorem).

Import M_π=C^{Aut(C/π^∞)} and Clozel rationality from AF.4. For regular algebraic cuspidal π on GL_n over a CM or totally real field, every spherical integral Hecke polynomial P_v(π_v;X) has coefficients in M_π. At good places the traces of any attached r therefore lie in ι^(−1)(M_π). This controls traces, not a model of r over (M_π)_λ: the Schur-index obstruction is supplied by R01.5. Coefficient conjugation sends M_π to M_{σπ}=σ(M_π).

**Hypotheses.**

- The definition uses π^∞ only. σπ^∞ is π^∞ with scalars extended along σ.
- M_π controls traces, not realizations. The field over which r can be written may be strictly larger, by a Schur-index obstruction. AG2.3/finite-number-field-of-realization proves a common realization field using the regular labelled Hodge–Tate input supplied by AG2.6; the early rationality theorem does not depend on that late result.
- Clozel's theorem is used with its exact hypotheses: π regular algebraic (cohomological) and cuspidal. It is not claimed for non-cuspidal or non-algebraic π.

**Proof or construction.**

1. The spherical Hecke algebra and its integral normalization are defined over Q, so t_{v,i}(σπ)=σ(t_{v,i}(π)).
2. The rational factors q_v^(i(i−1)/2) are fixed by Aut(C); take invariants under the stabilizer of π^∞.
3. Use AF.4 for finiteness of M_π and R01.5 for the distinction between a trace field and a realization field.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `ArithmeticGaloisRepresentations:R01.5/descent-obstruction`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, p. 1093. The field of rationality, in the coefficient field of the compatible system ACC+ attach to π.

**Check.**

- n = 1: M_ψ is the field generated by the values of ψ on 𝔸_F^{∞,×}, a number field for algebraic ψ.
- n = 2: for π = π_f ⊗ ‖det‖^{1−k/2}, M_π = ℚ(a_p, ψ(p) : p ∤ N) = K_f, the Hecke field, and ρ_{f,λ} is realised over K_{f,λ} (Deligne–Serre footnote (2): complex conjugation has distinct rational eigenvalues).
- Realisation is a separate question: the two-dimensional representation of the quaternion group Q₈ has rational character but is not realisable over ℚ₂, since the quaternion algebra (−1, −1)_ℚ ramifies at 2. So an Artin representation of G_ℚ through a Q₈-extension has trace field ℚ but no model over ℚ₂.

<a id="ag20-attachment-twist-dual-and-conjugation"></a>

### Twists, duals and conjugation preserve good-place attachment

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation` (lemma).

If IsAttached(ι,r,π), then IsAttached(ι,r⊗r(ψ),π⊗ψ∘det) for algebraic ψ; in particular norm^t corresponds to ε_ℓ^t. Also r^∨⊗ε_ℓ^(1−n) is attached to π^∨, and for CM F the conjugate r^c is attached to π^c. All conclusions are up to isomorphism and enlarge the finite excluded set by the character ramification.

**Hypotheses.**

- r semisimple and continuous; ψ algebraic; fixed geometric Artin/Frobenius normalization.

**Proof or construction.**

1. Apply the scalar-twist and reciprocal-polynomial identities from IHG.3, then the algebraic-character local formula.
2. Transport Frobenius at v to Frobenius at cv; use attachment uniqueness.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.3 after Definition 2.3.6, p. 938. The dual Hecke ideal has representation ρ^∨⊗ε^(1−n); the polynomial computation supplies the other operations.

**Check.**

- Dualizing twice returns r.
- For n=1 a norm twist multiplies geometric Frobenius by q^(−t).

<a id="ag20-relevant-automorphic-coefficient-field"></a>

### The coefficient field of a relevant automorphic representation

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/relevant-automorphic-coefficient-field` (comparison).

For relevant π in Liu et al. Definition 1.1.3, import Q(π) as the fixed field of automorphisms preserving the finite part π^∞. Its local coefficient field is generated by coefficients of ∏_i(T−α_i q_v^{(N−1)/2}) at spherical places. Lemma 3.1.2 identifies Q(π) with the compositum of these local fields, using Clozel rationality and strong multiplicity one. This is an automorphic coefficient-field result; it does not prove Definition 3.2.5 strong Galois realization over each completion.

**Hypotheses.**

- Relevant regular algebraic CSD cuspidal π and normalized spherical parameters; all coefficient embeddings tracked.

**Proof or construction.**

1. Identify the local polynomial with the IHG.3 integral polynomial.
2. Use the AF.4 rational model and strong multiplicity one to identify the stabilizer.
3. Distinguish the strong Galois realization property in AG2.6.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `AutomorphicFormsOnReductiveGroups:AF.4`.

**Sources.**

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §3.1, Definition 3.1.1 and Lemma 3.1.2, pp. 138–139 (PDF pp. 32–33). Clozel and strong multiplicity one identify the global/local coefficient fields.

**Check.**

- The local polynomial is independent of the chosen square-root extension.

**Remaining closure obligations.** Close the AF.1/AF.4 algebraicity, finite-part rationality and coefficient-conjugation contracts and the exact global-character/PHT specialization APIs. Source access for the CHT08 polarization lemma is resolved.

## AG2.1: Process aggregate

This is the process aggregate of AG2.1a and AG2.1b. It contributes no independent mathematical definition, theorem or planet.

## AG2.1a: Compact geometry and raw traces

Construct the compact generic PEL datum, the precise integral Drinfeld models and Igusa strata, coefficient projectors, finite cohomology and raw trace identities. No ET.6 or local LLC statement is a prerequisite. The polarized effectivity and early fixed-point refinements remain explicit gaps.

**Planets:** Kuga–Sato coefficient projector; Raw coefficient cohomology; Raw Hecke–Frobenius trace; Compact Drinfeld models; Compact Igusa towers.

<a id="ag21a-compact-shin-pel-instance"></a>

### The compact unitary PEL instance

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance` (construction).

Under Shin §5.1, F=EF⁺ is CM, E imaginary quadratic, n≥3 odd, [F⁺:Q]≥2, and all rational primes ramified in F split in F/F⁺. Choose a CM embedding τ and the similitude datum of Lemma 5.1: signature (1,n−1) at τ and (0,n) at the other selected embeddings, quasi-split at all finite places and anisotropic modulo centre over Q. At sufficiently small level U the PEL moduli scheme X_U/F is smooth proper of dimension n−1 with universal abelian scheme A_U. For p split in E choose w|p: G(Q_p) has the GL_n(F_w) factor used for Drinfeld level, including when F_w/Q_p is ramified. The other split factors have the étale level structures of §5.2. Form A_U^m over X_U for m≥0.

**Hypotheses.**

- The positivity, determinant, polarization and level conditions are those of the chosen PEL datum, not those of the quasi-split signature (n,n) datum.
- Choose integral orders and sufficiently small levels as in §5.2; Drinfeld models require the distinguished split factor.

**Proof or construction.**

1. Specialize PEL M0–M4 to Lemma 5.1, keeping the signature and reflex-field embedding.
2. Use representability, properness from anisotropy and the universal abelian scheme; form relative fibre powers.
3. The generic PEL tower is this node’s output. The separate compact-drinfeld-newton-models construction supplies the integral Drinfeld extension, Newton strata and possibly ramified local models; no IG.0 prerequisite is used.

**Prerequisites:** `PELModuli:M0`, `PELModuli:M4`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Lemma 5.1 and §5.2, pp. 30–34. The finite-level compact datum and its models are fixed here.

**Uses determining the API.**

- TY §2 and AG2.1a coefficient projector: Provides the abelian powers on which the correspondences act.
- Shin Proposition 5.2 and AG2.1b: Provides the proper tower and its Drinfeld Newton strata.

**API.**

- `CompactPEL.dimension` (characterisation): dim X_U=n−1; the universal abelian scheme has the relative dimension prescribed by this PEL representation.
- `CompactPEL.levelPullback` (functoriality): Level inclusions give finite étale maps on generic fibres, with compatible universal abelian schemes.
- `CompactPEL.kugaPower` (constructor): A_U^0=X_U and A_U^(m+1)=A_U^m×_{X_U}A_U.
- `CompactPEL.drinfeldFactor` (compatibility): At w the integral level structure is the Drinfeld structure on the one-dimensional O_{F_w}-Barsotti–Tate factor.

**Unit tests.**

- `CompactPEL.zeroPower` (degenerate): m=0 gives X_U, not an empty scheme.
- `CompactPEL.signatureDimension` (computation): n=3 gives a proper surface of dimension 2; the signature (3,3) datum has complex dimension 9[F⁺:Q].
- `CompactPEL.ramifiedFactor` (non-example): An unramified-only local datum cannot satisfy the API for ramified F_w.

**Check.**

- The generic fibre has dimension n−1.
- The construction includes ramified F_w when p splits in E.
- A signature (n,n) variety of dimension [F⁺:Q]n² cannot replace this instance.

<a id="ag21a-compact-drinfeld-newton-models"></a>

### Compact Drinfeld models and Newton strata

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-drinfeld-newton-models` (construction).

For the compact PEL datum of Shin Lemma 5.1, p split in E and distinguished w|p, construct the projective flat Drinfeld models Sh_{U^p, m-vector} over O_{F_w}. The zero distinguished level is smooth. On its geometric special fibre, Sh^(h), 0≤h≤n−1, is the locus where the one-dimensional O_{F_w}-divisible group A[w^∞] has étale height h. Equivalently its connected part has O_{F_w}-height n−h. These strata have dimension h; the locus of height at most h is closed. The remaining split factors have dimension-zero divisible groups. No unramifiedness of F_w/Q_p is imposed. The construction is restricted to this Lie-dimension-one datum; it is not a general ramified PEL integral-model theorem.

**Hypotheses.**

- Shin §5.1 conditions (i)–(v), sufficiently small prime-to-p level and compatible Drinfeld levels; Lie dimension one at w and zero at the other chosen split factors.

**Proof or construction.**

1. Specialize the PEL integral moduli problem to the one-dimensional O_{F_w}-divisible group with determinant, polarization and level conditions.
2. Use Drinfeld deformation and level theory, rather than a Grothendieck–Messing argument requiring an unramified field. The precise HT01 proof remains a recorded source gap.
3. Stratify the reduced zero-level special fibre by étale height and preserve all prime-to-p Hecke correspondences.

**Prerequisites:** `PELModuli:M0`, `PELModuli:M4`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2, pp.32–33 (integral model and strata); Lemma 5.1, pp.30–31. Specifies projectivity, flatness, smooth zero level and the exceptional ramified-field extension of the Drinfeld construction.

**Uses determining the API.**

- AG2.1a raw nearby cycles: Supplies the actual integral model, not a stabilized or LLC-dependent formula.
- IgusaVarietiesAndTorsionConcentration: Its compact Drinfeld application imports this lower-tier specialization.

**API.**

- `CompactDrinfeldModel.model` (constructor): The integral model at each level, with universal abelian scheme and its O_F action.
- `CompactDrinfeldModel.genericFiber` (compatibility): Its generic fibre is the corresponding PEL Shimura variety with the same level.
- `CompactDrinfeldModel.newtonStratum` (constructor): The reduced locally closed locus Sh^(h) for étale height h.
- `CompactDrinfeldModel.dimension` (characterisation): dim Sh^(h)=h; h=n−1 is ordinary and h=0 is basic.
- `CompactDrinfeldModel.hecke` (functoriality): Prime-to-p Hecke maps preserve the Newton label; level transitions and composition agree with those of the PEL tower.

**Unit tests.**

- `CompactDrinfeldModel.ordinary` (computation): For n=3, h=2 the stratum has dimension 2 and connected O_{F_w}-height 1.
- `CompactDrinfeldModel.basic` (degenerate): For h=0 the stratum has dimension 0 and the connected height is n.
- `CompactDrinfeldModel.ramified` (non-example): A ramified F_w/Q_p is allowed in this datum; replacing the model by a hyperspecial unramified PEL model does not define the stated integral model.
- `CompactDrinfeldModel.index` (compatibility): The alternative formal-height index j is n−1−h, so its dimension n−1−j equals h.

**Check.**

- For n=3, h=2 the stratum has dimension 2 and connected O_{F_w}-height 1.
- For h=0 the stratum has dimension 0 and the connected height is n.
- A ramified F_w/Q_p is allowed in this datum; replacing the model by a hyperspecial unramified PEL model does not define the stated integral model.
- The alternative formal-height index j is n−1−h, so its dimension n−1−j equals h.

<a id="ag21a-kuga-sato-coefficient-projector"></a>

### The corrected Kuga–Sato coefficient projector

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector` (construction).

For an irreducible algebraic ξ of the compact similitude group choose the TY §2 integers m_ξ,t_ξ and rational algebraic correspondence ε_ξ realizing L_ξ inside R^{m_ξ}(A_U^{m_ξ}/X_U)(t_ξ). For N≥2 let ε(m,N)=∏_{x=1}^m ∏_{0≤y≤2[F⁺:Q]n², y≠1}([N]_x−N^y)/(N−N^y), and set a_ξ=ε_ξ ε(m_ξ,N)^{2n−1}. Its action on global cohomology is idempotent and realizes the coefficient cohomology in the shifted degree. The exponent 2n−1 removes the Leray-filtration error: ε(m,N) alone is only the relative-degree selector.

**Hypotheses.**

- Q-coefficients; N≥2; sufficiently small U; the chosen realization of ξ and its central exponent a₀, CM type and Tate twist are retained.

**Proof or construction.**

1. Multiplication by N acts on relative R^y by N^y, so the product selects H¹ from each abelian factor.
2. Apply the normalized Young/Schur correspondence ε_ξ on the selected tensor power.
3. The Leray filtration has length at most 2n−1. Apply the TY correction before asserting a global idempotent.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`](#ag21a-compact-shin-pel-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`](#ag20-unitary-similitude-central-character-dictionary), `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicBundles:B2`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-2-young-symmetrizers`, `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`.

**Sources.**

- [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §2, p. 12, definition of a_ξ. The source corrects the projector and identifies its global cohomology image.

**Uses determining the API.**

- TY §2 degree identity: Extracts L_ξ-cohomology from ordinary étale cohomology.
- AG2.1b purity and multiplicity: Makes ξ-cohomology a geometric direct summand with its correct weight.

**API.**

- `CoefficientProjector.idempotent` (characterisation): a_ξ²=a_ξ on each global cohomology group after the 2n−1 correction.
- `CoefficientProjector.relativeDegree` (characterisation): The multiplier correspondence annihilates relative degrees other than m_ξ.
- `CoefficientProjector.centralTwist` (compatibility): Replacing ξ by ξ⊗ν^t changes the retained central character and Tate normalization according to the coefficient dictionary.
- `CoefficientProjector.level` (functoriality): a_ξ commutes with level pullback and the correspondences defining Hecke actions.

**Unit tests.**

- `CoefficientProjector.denominator` (computation): For N=2, y=0, the denominator is 1; for y=2 it is −2.
- `CoefficientProjector.degreeSelector` (non-example): On H⁰ of one abelian factor the y=0 term annihilates the class; on H¹ every term acts as 1.
- `CoefficientProjector.zeroPower` (degenerate): For ξ=1 with m_ξ=t_ξ=0 and ε_ξ=1, the empty product is the identity and realizes the trivial coefficient. The condition m_ξ=0 alone does not exclude a nontrivial Tate twist.
- `CoefficientProjector.lerayCorrection` (compatibility): The global selector uses the power 2n−1 even though its associated-graded selector is idempotent.

**Check.**

- Denominators are nonzero for N≥2.
- The exponent is exactly the corrected source exponent, not a degree-one idempotence assertion.
- The output degree shifts by m_ξ and the Tate twist remains t_ξ.

<a id="ag21a-compact-mantovan-igusa-tower"></a>

### Compact Igusa towers before local comparison

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower` (construction).

Over each compact Newton stratum Sh^(b)=Sh^(h), choose the one-dimensional O_{F_w}-divisible group Σ_b over the algebraic residue closure with the prescribed isocrystal and additional structures. In this datum its isogeny class contains one isomorphism class, so its central leaf is all Sh^(b). Construct Mantovan’s finite-level Igusa covers Ig_{b,U^p,m} and the tower, with level-transition, prime-to-p Hecke, quasi-isogeny J_b(Q_p), and descent actions on compact-support cohomology. The finite-level covers of the central leaf are smooth finite étale Galois covers as in Shin §5.2. Distinguish them from first-kind étale-part level and from perfection of an infinite-level tower. Independence of Σ_b means equivalence after an isomorphism of framing objects, not a preferred identification.

**Hypotheses.**

- The compact Drinfeld datum and Newton strata; the additional structures and bounded trivializations in Mantovan’s construction.

**Proof or construction.**

1. Use the uniqueness of the one-dimensional framed divisible group to identify central leaf and Newton stratum.
2. Construct the compatible finite-level trivialization covers and their descent; retain formal as well as étale structure.
3. Pass to compact-support cohomology and level colimits; record the commuting quasi-isogeny and prime-to-p Hecke actions.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-drinfeld-newton-models`](#ag21a-compact-drinfeld-newton-models), `PELModuli:M4`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2, pp.33–34, paragraphs defining Ig_{b,U^p,m} and H_c(Ig_b,L_ξ). Gives the compact Mantovan covers, ramified adaptation, framing independence and commuting actions.

**Uses determining the API.**

- AG2.1a/raw-nearby-cycle-traces: Organizes raw stratum traces without an automorphic constituent calculation.
- AG2.1b/compact-global-mantovan-formula: Supplies the J_b-valued compact-support cohomology input.

**API.**

- `CompactIgusaTower.level` (constructor): The finite Igusa cover with its map to Sh^(b).
- `CompactIgusaTower.finiteEtale` (structure): The stated finite covers are finite étale Galois and smooth over the residue field.
- `CompactIgusaTower.transition` (functoriality): Compatible transition maps and composition with prime-to-p Hecke correspondences.
- `CompactIgusaTower.cohomology` (data): H_c^j(Ig_b,L_ξ) is the level colimit with smooth J_b and prime-to-p Hecke actions.
- `CompactIgusaTower.changeFraming` (equivalence): An isomorphism of framing objects induces an equivalence of towers and compatible cohomology, with identity and composition laws.

**Unit tests.**

- `CompactIgusaTower.dimension` (compatibility): A nonempty finite Igusa cover of Sh^(h) has dimension h, as finite étale maps preserve dimension.
- `CompactIgusaTower.basic` (degenerate): For h=0 the finite-level covers are zero-dimensional; the tower still has level data.
- `CompactIgusaTower.notFirstKind` (non-example): Trivializing only the étale summand cannot supply the full Mantovan cover when the connected part has nontrivial level data.
- `CompactIgusaTower.notPerfection` (non-example): For h>0 a smooth finite-level cover is not its perfection: Frobenius on local parameters need not be invertible.

**Check.**

- A nonempty finite Igusa cover of Sh^(h) has dimension h, as finite étale maps preserve dimension.
- For h=0 the finite-level covers are zero-dimensional; the tower still has level data.
- Trivializing only the étale summand cannot supply the full Mantovan cover when the connected part has nontrivial level data.
- For h>0 a smooth finite-level cover is not its perfection: Frobenius on local parameters need not be invertible.

<a id="ag21a-coefficient-projector-degree-identity"></a>

### Cohomology of the coefficient projector

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity` (lemma).

For every j, a_ξ H^j(A_U^{m_ξ}×_F F̄,Q̄_ℓ(t_ξ)) is canonically H^{j−m_ξ}(X_U×_F F̄,L_ξ) if j≥m_ξ, and zero otherwise. The identity is equivariant for Gal(F̄/F), level transitions and prime-to-level Hecke correspondences.

**Hypotheses.**

- Use the corrected a_ξ and the selected algebraic realization; ℓ invertible on the generic fibre.

**Proof or construction.**

1. The relative selector leaves the single R^{m_ξ} row in Leray.
2. Identify the ε_ξ summand with L_ξ; use the corrected global projector to split the filtration.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector), `EtaleDualityAndPerverseSheaves:EDC.2`.

**Sources.**

- [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §2, cohomology identity after a_ξ, p. 12. This is the actual shifted coefficient-cohomology identity.

**Check.**

- j=m_ξ gives H⁰(X_U,L_ξ).
- No negative cohomology group is introduced when j<m_ξ.

<a id="ag21a-finite-level-coefficient-cohomology"></a>

### Finite-level coefficient cohomology

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology` (construction).

Define H^k_U(ξ)=H^k_et(X_U×_F F̄,L_ξ) as the corrected Kuga–Sato summand in degree k+m_ξ with twist t_ξ. Set H^k(ξ)=colim_U H^k_U(ξ) under pullback. This is a smooth admissible G(A_f)-representation with commuting continuous Gal(F̄/F)-action on finite-level invariants. Define H(ξ)=Σ_k(−1)^k[H^k(ξ)] only in the Grothendieck group, retaining the graded H^k separately.

**Hypotheses.**

- Small levels; ξ irreducible algebraic; Q̄_ℓ coefficients obtained from a finite ℓ-adic coefficient field; the finite-level étale finiteness and descent contracts.

**Proof or construction.**

1. Construct finite-level coefficient cohomology via the preceding identity.
2. Use functorial level pullbacks and Hecke correspondences to form the smooth tower.
3. Take the alternating class after constructing the actual graded representation.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`](#ag21a-compact-shin-pel-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity`](#ag21a-coefficient-projector-degree-identity), `EtaleDualityAndPerverseSheaves:EDC.2`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2, definitions of H^k and H, pp. 33–34. Actual graded cohomology precedes the alternating virtual class.

**Uses determining the API.**

- Shin Theorem 6.4: The geometric side of Mantovan and trace comparison.
- ET.6 geometric export: Supplies graded cohomology and actions before local Langlands.

**API.**

- `CoefficientCohomology.level` (functoriality): Compatible level pullbacks compose and commute with Galois.
- `CoefficientCohomology.hecke` (functoriality): A double-coset correspondence acts by finite pullback followed by proper pushforward.
- `CoefficientCohomology.invariants` (compatibility): Small-level invariants identify with the finite-level cohomology in characteristic zero.
- `CoefficientCohomology.alternating` (constructor): The alternating sum is a Grothendieck class and is not declared an actual representation.

**Unit tests.**

- `CoefficientCohomology.outsideRange` (degenerate): Degrees below 0 or above 2(n−1) vanish.
- `CoefficientCohomology.trivialCoefficient` (compatibility): ξ=1 gives the usual étale cohomology of X_U.
- `CoefficientCohomology.virtualCancellation` (non-example): A nonzero class appearing in two adjacent degrees cancels in H(ξ) but remains in both graded groups.

**Check.**

- H^k_U=0 outside 0≤k≤2(n−1).
- Invariants at a small level recover finite-dimensional coefficient cohomology.
- Equality of alternating classes cannot by itself identify H^{n−1}.

<a id="ag21a-hecke-galois-projector-commutation"></a>

### Commutation of the geometric actions

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation` (lemma).

On H^k_U(ξ), the Galois action commutes with every rational Hecke correspondence that is defined over F and with a_ξ. Passage between levels preserves this commutation and the Tate twist. In particular the cohomology is a joint module, not just a list of unrelated eigenvalues.

**Hypotheses.**

- Correspondences and the selected coefficient projector are defined over the reflex field.

**Proof or construction.**

1. Use functoriality of pullback and proper pushforward under field automorphisms.
2. Use the rational algebraic correspondence description of a_ξ.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector), `EtaleDualityAndPerverseSheaves:EDC.2`.

**Sources.**

- [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §2, action following the cohomology identity, p. 12. The level and Galois actions respect the ξ projector.

**Check.**

- The central similitude character is preserved under the commutation identity.

<a id="ag21a-finite-continuous-geometric-galois-action"></a>

### Finite continuous geometric Galois actions

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action` (theorem).

Every H^k_U(ξ) is finite-dimensional over a finite extension of Q_ℓ and has continuous Galois action; after scalar extension it is unramified away from finitely many places. For almost all y∤ℓ its Frobenius eigenvalues are algebraic and pure of weight k+w(ξ). These statements apply to actual finite-level summands, independently of local Langlands.

**Hypotheses.**

- Smooth proper X_U and the abelian-power projector; coefficient field of definition fixed.

**Proof or construction.**

1. Apply étale finiteness and continuity at finite level.
2. Spread the smooth proper abelian tower and algebraic correspondences away from finitely many places.
3. Apply the proper smooth purity theorem to the summand, tracking m_ξ−2t_ξ=w(ξ).

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`](#ag21a-hecke-galois-projector-commutation), `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Proposition 5.3(ii)–(iii), pp. 34–35. Only the geometric finiteness and weight assertions are used here.

**Check.**

- The Tate twist changes the weight by −2t_ξ.
- Removing purity from an alternating sum cannot replace the finite-level purity statement.

<a id="ag21a-raw-fixed-point-trace-identity"></a>

### The raw geometric fixed-point trace identity

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity` (theorem).

For a good reduction prime p≠ℓ and sufficiently large Frobenius power, the alternating trace of a Hecke correspondence times geometric Frobenius on H^k_U(ξ) equals the fixed-point sum with the coefficient trace. When expressed as a sum over admissible Kottwitz triples, the local orbital integrals, volumes and effectivity multiplicities belong to the compact PEL instance. No local Langlands parameter or automorphic Galois representation occurs in this identity.

**Hypotheses.**

- Correspondence and Frobenius power satisfy the Fujiwara/Varshavsky fixed-point hypotheses; good integral model and all coefficient factors fixed.

**Proof or construction.**

1. Use the generic cohomological-correspondence fixed-point theorem.
2. Apply the requested polarized O_F-linear PEL M4 effectivity theorem, with the prescribed p-adic isocrystal, positivity and trivial Kottwitz obstruction α₀; identify the effective fixed-point objects. Unpolarized Honda–Tate classification alone does not supply this step.
3. Rewrite the raw count as orbital integrals without spectral stabilization.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`](#ag21a-hecke-galois-projector-commutation), `PELModuli:M4`, `EtaleDualityAndPerverseSheaves:EDC.8`.

**Sources.**

- [Stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2, pp. 13–14; §4.4, Theorem 4.4, p. 15. Theorem 4.4 restates the Igusa count from [Shi09, Theorem 13.1], with actual effectivity and coefficient factors. It does not itself prove the compact global Hecke–Frobenius identity; the fixed-point and polarized-effectivity supplier requests remain necessary.

**Check.**

- The equality is alternating until the weight argument is supplied.
- Ineffective triples contribute zero.

<a id="ag21a-automorphic-multiplicity-spaces"></a>

### Automorphic multiplicity spaces in the tower

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces` (construction).

For π^∞ irreducible admissible occurring in H^k(ξ), let R^k_{ξ,ℓ}(π^∞)=Hom_{G(A_f)}(π^∞,H^k(ξ)), with its commuting Galois action. In the characteristic-zero discrete automorphic decomposition of the compact tower, H^k(ξ)=⊕_{π∞}π^∞⊗R^k_{ξ,ℓ}(π^∞). R^k is finite-dimensional; R_{ξ,ℓ}(π∞)=Σ_k(−1)^k[R^k] remains a virtual representation.

**Hypotheses.**

- Compact quotient and the semisimple automorphic decomposition at the chosen central character; π∞ has finite-level invariants.

**Proof or construction.**

1. Use the compact automorphic spectral decomposition and Schur isotypic multiplicities.
2. Transport the commuting Galois action to Hom; take finite-level invariants to prove finiteness.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`](#ag21a-hecke-galois-projector-commutation), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action`](#ag21a-finite-continuous-geometric-galois-action), `AutomorphicFormsOnReductiveGroups:AF.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-1-simple-modules-schur-and-isotypic-components`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2 decomposition (5.5), p. 34. The multiplicity space is graded before its alternating sum.

**Uses determining the API.**

- Shin Theorem 6.4 and Corollary 6.5: Separates the automorphic factor from actual Galois multiplicities.
- AG2.1b actual constituent: The object from which a genuine representation is extracted.

**API.**

- `MultiplicitySpace.evaluation` (compatibility): The evaluation map π∞⊗Hom(π∞,H^k)→the π∞-isotypic summand is an isomorphism under the discrete semisimple decomposition.
- `MultiplicitySpace.galois` (functoriality): Galois acts by postcomposition on Hom and commutes with evaluation.
- `MultiplicitySpace.finite` (projection): Choose a small level with nonzero π∞ invariants to bound dim R^k by finite-level cohomology.
- `MultiplicitySpace.virtual` (constructor): The virtual multiplicity is Σ_k(−1)^k[R^k].

**Unit tests.**

- `MultiplicitySpace.absent` (degenerate): If π∞ is absent then every R^k is zero.
- `MultiplicitySpace.double` (computation): Two copies of π∞ give a two-dimensional multiplicity space.
- `MultiplicitySpace.cancellation` (non-example): Equal multiplicity spaces in adjacent degrees give zero virtual class with nonzero actual spaces.

**Check.**

- A multiplicity greater than one is retained.
- Virtual R cannot be replaced by a rank-n Galois representation before cancellation.

<a id="ag21a-raw-nearby-cycle-traces"></a>

### Raw nearby-cycle and stratum traces

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces` (theorem).

For the compact Drinfeld model at w|p≠ℓ, identify the generic-fibre alternating trace with the trace on the special fibre with RΨL_ξ. Decompose by Newton/Drinfeld strata and the compatible Igusa level covers before applying any local Langlands correspondence. Retain the nearby-cycle monodromy operator and its filtration rather than replacing it by zero.

**Hypotheses.**

- Proper integral model; the actual ramified O_{F_w} charts and coefficient projector; p split in E.

**Proof or construction.**

1. Use proper base change for nearby cycles and specialize the correspondences.
2. Apply the raw trace theorem on strata with the nearby-cycle coefficients.
3. Use the Drinfeld and Igusa comparison to organize the stratum sum.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`](#ag21a-compact-shin-pel-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`](#ag21a-raw-fixed-point-trace-identity), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), `LefschetzPencilsAndVanishingCycles:LPV.0`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Proposition 5.2 and §5.2, pp. 33–34. The geometric stratum identity supplies the Mantovan comparison.

**Check.**

- A ramified model requires its verified chart contract.
- The raw identity makes no claim that its alternating summand is an actual representation.

**Remaining closure obligations.** Prove the explicit graded coefficient-projector recipe, compact ramified Drinfeld/Igusa geometry, polarized Kottwitz-triple effectivity and independent early fixed-point theorem. The early trace calculation has no ET.6, R19 or local LLC input.

## AG2.1b: Mantovan comparison and actual constituents

The classical EL tower and alternating smooth Ext define Mantovan’s functor before any local comparison. The global identity is virtual. ST/END comparison, middle-degree weight cancellation and divisibility of each irreducible multiplicity are separate steps towards an actual rank-n representation.

**Planets:** Virtual automorphic comparison; Middle-degree concentration; Actual Galois constituents; EL local cohomology; Mantovan Ext functor.

<a id="ag21b-compact-el-rapoport-zink-cohomology"></a>

### Compact EL local cohomology

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-el-rapoport-zink-cohomology` (construction).

For the EL factors of the compact split local datum (b,μ), construct the framed Rapoport–Zink deformation spaces over O_{F_w^ur-hat}, their generic-fibre level tower M^rig_{b,μ,U_p}, and H_c^j with smooth J_b(Q_p), G(Q_p) and Weil descent actions. A point is a deformation of the framed O_{F_w}-divisible group together with the framing quasi-isogeny and rational level; the other dimension-zero factors and similitude factor are retained. The dimension D of the generic fibre is part of the normalization. This is the classical EL special case required by Shin, not a construction of arbitrary local shtukas or spectral-action machinery.

**Hypotheses.**

- The compact one-dimensional EL signature and additional level structures of Shin §5.2, including ramified F_w; use the unramified-completion base of that source.

**Proof or construction.**

1. Apply the local deformation problem at the distinguished factor and the dimension-zero factor problems; representability and finiteness are exact requested moduli/cohomology inputs.
2. Equip the tower with changing-framing, level and descent actions; commute them before taking cohomology.
3. Use the compact-support six-functor formalism for the generic fibres, retaining the dimension and transition maps.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-drinfeld-newton-models`](#ag21a-compact-drinfeld-newton-models), `PELModuli:M4`, `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2, pp.33–35, definition preceding Proposition 5.2 and factorization (5.6). Specifies the EL tower, base, cohomology and product factors needed by the Mantovan expression.

**Uses determining the API.**

- AG2.1b/mantovan-ext-functor: Provides the first argument of smooth derived Ext.
- HeckeStacksAndLocalShtukas: The broader higher-level theory may import this classical EL specialization.

**API.**

- `CompactELCohomology.space` (constructor): The framed local moduli space at level U_p over the specified completed base.
- `CompactELCohomology.actions` (structure): Commuting G, J_b and Weil actions on the level-colimit cohomology.
- `CompactELCohomology.dimension` (projection): The actual geometric dimension D used in the Tate twist.
- `CompactELCohomology.changeLevel` (functoriality): Transition pullbacks, identity and composition agree with the tower.
- `CompactELCohomology.product` (compatibility): The decomposition into EL and similitude factors induces the tensor decomposition of alternating cohomology with Künneth signs.

**Unit tests.**

- `CompactELCohomology.framing` (characterisation): Changing the framing by j∈J_b acts through its quasi-isogeny, independently of changing the rational G level.
- `CompactELCohomology.zeroDim` (degenerate): A dimension-zero factor contributes no geometric (−D) twist.
- `CompactELCohomology.ramifiedBase` (non-example): For ramified F_w, substituting the completion of Z_p^ur for O_{F_w^ur-hat} changes the stated deformation base.
- `CompactELCohomology.dimensionProduct` (compatibility): Dimensions add under the product decomposition, hence total Tate twist is the product of the factor twists.

**Check.**

- Changing the framing by j∈J_b acts through its quasi-isogeny, independently of changing the rational G level.
- A dimension-zero factor contributes no geometric (−D) twist.
- For ramified F_w, substituting the completion of Z_p^ur for O_{F_w^ur-hat} changes the stated deformation base.
- Dimensions add under the product decomposition, hence total Tate twist is the product of the factor twists.

<a id="ag21b-compact-global-mantovan-formula"></a>

### The compact global Mantovan formula

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula` (theorem).

For every Newton class b of the compact datum, define Mant_{b,μ}(ρ) by the colimit over Rapoport–Zink levels of the alternating Ext^i_{J_b(Q_p)}(H^j_c(M_{b,μ}),ρ), with the source’s dimension twist (−D) and sign (−1)^{i+j}. Shin Proposition 5.2 gives [H(Sh,L_ξ)]=Σ_b Mant_{b,μ}([H_c(Ig_b,L_ξ)]) as a class with commuting prime-to-p Hecke and Weil actions. The split local factors tensor as in (5.6).

**Hypotheses.**

- Mantovan’s cohomology, smooth derived Ext, towers and actions for the chosen compact Drinfeld model; the dimension twist is included.

**Proof or construction.**

1. Import the representation-valued Rapoport–Zink and Igusa cohomology functor and derived Ext.
2. Apply the almost-product stratum comparison and compact-support descent.
3. Sum the alternating Ext/cohomology classes and keep the Weil twist.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`](#ag21a-raw-nearby-cycle-traces), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-el-rapoport-zink-cohomology`](#ag21b-compact-el-rapoport-zink-cohomology), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §2.2, Mantovan functor (2.1), p. 9; Proposition 5.2, p. 34. The required global formula includes the Ext/colimit functor and normalization.

**Check.**

- This is the global formula of Proposition 5.2, not only a local slogan.
- Changing D changes the Frobenius normalization.

<a id="ag21b-mantovan-ext-functor"></a>

### The compact Mantovan Ext functor

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/mantovan-ext-functor` (construction).

For a finite-length smooth J_b(Q_p)-representation ρ in the admissible compact EL setting define Mant_{b,μ}([ρ]) = Σ_{i,j} (−1)^{i+j} [colim_{U_p} Ext^i_{J_b(Q_p)-smooth}(H_c^j(M^rig_{b,μ,U_p}),ρ)](−D), a Grothendieck class for G(Q_p)×W_{F_w}. Use finite/cohomologically bounded alternating sums and the commuting actions from the towers. Additivity extends it to the Grothendieck group. With prime-to-p coefficients carried along, the compact almost-product comparison yields [H(Sh,L_ξ)]=Σ_b Mant_{b,μ}([H_c(Ig_b,L_ξ)]). This identity is virtual; no individual cohomology degree or actual rank-n summand follows from it alone.

**Hypotheses.**

- Smooth derived Ext with level colimits and bounded admissibility; compact almost-product/coefficient descent for this datum. These are explicit supplier contracts, not consequences of local LLC.

**Proof or construction.**

1. Form derived smooth Hom from the local compact-support complex into the Igusa representation and take the alternating cohomology class.
2. Apply the almost-product comparison on each Newton stratum and descend coefficients, retaining all actions.
3. Sum strata, insert (−D), and use Künneth for the split factors as in Shin (5.6). Local reduction via ET.6a is a separate application to this expression.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-el-rapoport-zink-cohomology`](#ag21b-compact-el-rapoport-zink-cohomology), `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.2, p.34, definition of Mant_{b,μ}, Proposition 5.2 and (5.6). Defines the alternating Ext functor, dimension twist and virtual global identity.

**Uses determining the API.**

- Shin Proposition 5.2 and AG2.1b virtual comparison: The exact geometric functor precedes LLC evaluation, weight concentration and multiplicity division.

**API.**

- `MantovanExt.apply` (constructor): The normalized Grothendieck class, with (−1)^{i+j} and (−D).
- `MantovanExt.add` (simp): An exact sequence in the second variable induces additivity of the bounded alternating Ext class.
- `MantovanExt.actions` (structure): Prime-to-p Hecke and Weil actions commute with the G(Q_p) action.
- `MantovanExt.factorization` (compatibility): For decomposable split local input, Mant factors as the tensor product of normalized local Mant functors.
- `MantovanExt.globalIdentity` (characterisation): The sum over admissible Newton classes equals the alternating compact Shimura cohomology class.

**Unit tests.**

- `MantovanExt.zero` (degenerate): Mant_{b,μ}(0)=0.
- `MantovanExt.sign` (computation): A single nonzero Ext^1 of H_c^0 contributes with negative sign, unlike Ext^0 of H_c^0.
- `MantovanExt.dimensionTwist` (compatibility): A dimension-D factor carries the twist (−D); omitting it changes geometric Frobenius eigenvalues by q^(−D).
- `MantovanExt.virtualNotActual` (non-example): [V]−[V]=0 in the Grothendieck group does not imply V=0 and cannot select an actual automorphic constituent.

**Check.**

- Mant_{b,μ}(0)=0.
- A single nonzero Ext^1 of H_c^0 contributes with negative sign, unlike Ext^0 of H_c^0.
- A dimension-D factor carries the twist (−D); omitting it changes geometric Frobenius eigenvalues by q^(−D).
- [V]−[V]=0 in the Grothendieck group does not imply V=0 and cannot select an actual automorphic constituent.

<a id="ag21b-shin-st-end-igusa-computation"></a>

### Shin’s stable and endoscopic Igusa computation

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation` (theorem).

Under Shin §6.1, n≥3 is odd, Π=ψ⊗Π₁ is θ-stable, generic Ξ-cohomological, and Ram_Q(Π) lies in Spl_{F/F⁺,Q}; the finite set S also contains the ramification of F and the auxiliary odd character ϖ. In Case ST, Π₁ is cuspidal. In Case END, m₁>m₂>0, m₁+m₂=n, Π is transferred from ψ_H⊗Π₁⊗Π₂, each Π_i is conjugate-self-dual cohomological cuspidal and the central-character condition §6.1(ii) holds. Set C_G=|ker¹(Q,G)|τ(G). Theorem 6.1 computes BC(H_c(Ig_b,L_ξ){Π^S}) as C_G e₀[Π^{∞,p}]Red_n^b(π_p) in ST and (C_G/2)[Π^{∞,p}](e₁Red_n^b(π_p)+e₂Red_{m₁,m₂}^b(π_H,p)) in END, with e_i∈{±1} independent of b and the §3.6 transfer factors.

**Hypotheses.**

- All displayed §6.1 datum, ramification, central-character and infinity hypotheses; the END blocks and parity character are fixed.

**Proof or construction.**

1. Apply the stable Igusa trace formula with the exact compact datum and transfer factors.
2. Use twisted character identities and linear independence to isolate the Π^S component.
3. Compute archimedean packet signs using §3.6; retain e₁ and e₂ separately.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`](#ag21b-compact-global-mantovan-formula), [`AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`](#ag20-unitary-similitude-central-character-dictionary), `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §6.1 and Theorem 6.1, pp. 41–46. The specialized ST/END computation retains the signs and C_G factors.

**Check.**

- The factor 1/2 appears in END only.
- e₁=e₂ is not imposed before the packet computation.

<a id="ag21b-virtual-weil-constituent-comparison"></a>

### The virtual Weil constituent comparison

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison` (theorem).

Under the ST/END hypotheses, Theorem 6.4 identifies the base-changed alternating Π-part with C_G times the selected local Weil constituent, with the GL₁ character. In ST it is e₀ χ₀⊗L_n(Π₁,w). In END it is e₁ χ₀⊗L_{m₁}(Π_{M,1,w})|·|^(−m₂/2) if e₁=e₂, and e₁ χ₀⊗L_{m₂}(Π_{M,2,w})|·|^(−m₁/2) if e₁=−e₂. This equality is in the Weil Grothendieck group and has not yet removed alternating degrees or divided an actual representation by C_G.

**Hypotheses.**

- w over a rational prime split in E, w∤ℓ; exact local transfer and the normalized Mantovan formula.

**Proof or construction.**

1. Insert the Igusa ST/END computation in the global Mantovan formula.
2. Apply the local Harris–Taylor/Mantovan calculation, including Sp_s terms and normalized parabolic induction.
3. Sum the reduction functors using Shin Proposition 2.3 and retain the GL₁ correction.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`](#ag21b-shin-st-end-igusa-computation), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`](#ag21b-compact-global-mantovan-formula), `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Propositions 2.2–2.3, pp. 10–11; Theorem 6.4, pp. 46–47. The local computation applies to the required generalized Steinberg and parabolic cases.

**Check.**

- The selected rank is n, m₁ or m₂ according to the case/sign, never always n.
- All identities here are virtual.

<a id="ag21b-weight-separation-middle-degree"></a>

### Weight separation into the middle degree

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree` (theorem).

For π∞ in the ST/END Π-part, R^k_{ξ,ℓ}(π∞)=0 for k≠n−1. Thus the alternating multiplicity is (−1)^(n−1)[R^{n−1}], an actual representation up to the explicit sign. In particular e₀=(−1)^(n−1) in ST and e₁=(−1)^(n−1) in END.

**Hypotheses.**

- The virtual Weil formula, geometric purity of every actual degree k, and the selected constituent purity/temperedness argument of Shin Corollary 6.5; no equality of virtual dimensions is used as cancellation.

**Proof or construction.**

1. Compare Frobenius eigenvalue weights k+w(ξ) for the actual graded summands with the selected constituent weights.
2. Use the Harris–Taylor argument cited in Corollary 6.5 to rule out other degrees.
3. Read the remaining alternating sign from the actual middle degree.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison`](#ag21b-virtual-weil-constituent-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action`](#ag21a-finite-continuous-geometric-galois-action), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`](#ag21a-automorphic-multiplicity-spaces), `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `DeligneWeightsAndPurity:DWP.0`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 6.5(i)–(ii) and proof, pp. 47–49. The source explicitly uses Proposition 5.3(iii) and HT01 p. 207.

**Check.**

- An artificial pair of equal adjacent-degree summands is excluded by distinct geometric weights.

<a id="ag21b-archimedean-packet-multiplicity"></a>

### The archimedean packet multiplicity

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity` (theorem).

Under ST/END, the sum of discrete multiplicities at the ith relevant cohomological archimedean packet member is τ(G) for all i in ST; in END it is τ(G) for i≤m₁ if e₁=e₂, or i>m₁ if e₁=−e₂, and zero for the other indices. These are the multiplicities of Shin Corollary 6.5(iv), compatible with the ξ highest-weight partition W^1_κ⊔W^2_κ.

**Hypotheses.**

- The exact cohomological packet and signs of §3.6/§6.1, with middle-degree concentration.

**Proof or construction.**

1. Combine Lie-algebra cohomology dimensions from Proposition 5.3(i) with the stabilized virtual character.
2. Use the selected archimedean partition and packet transfer to determine which indices contribute.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`](#ag21b-weight-separation-middle-degree), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`](#ag21b-shin-st-end-igusa-computation), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`](#ag21a-automorphic-multiplicity-spaces), `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 6.5(iv), pp. 47–48. The formula selects one END block and preserves the packet multiplicity.

**Check.**

- END has vanishing members as well as the contributing members.

<a id="ag21b-actual-galois-constituent-from-cohomology"></a>

### The actual Galois constituent of cohomology

Target `AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology` (construction).

For the selected ST/END Π-part, semisimplify the actual middle-degree Galois multiplicity space to R̃. The source proves that R̃ is C_G copies of a continuous semisimple representation R̃₀, and then removes the GL₁ character ψ by class field theory. The resulting R′_ℓ(Π) has rank n in ST, m₁ in END with e₁=e₂, or m₂ with e₁=−e₂; it is independent, up to isomorphism, of τ and ψ. At the source’s split primes its Weil Grothendieck class is exactly (6.31), with the selected half-dimensional norm twist.

**Hypotheses.**

- Middle-degree concentration, packet multiplicity and the actual multiplicity divisibility argument in Shin Corollary 6.8/Remark 6.9; de Rham comparison for the geometric summand is used to obtain the distinct labelled dimensions.

**Proof or construction.**

1. Vary τ and apply Frobenius-density recognition to identify the actual semisimple multiplicity representation.
2. Use the labelled de Rham dimensions and HT01 Proposition VII.1.8 as specified in Remark 6.9 to divide multiplicities by C_G.
3. Remove ψ using the character dictionary; use Frobenius density for independence.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`](#ag21b-weight-separation-middle-degree), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity`](#ag21b-archimedean-packet-multiplicity), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`](#ag21a-automorphic-multiplicity-spaces), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `PadicHodgeTheory:R06.5`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 6.8 and Remark 6.9, p. 49. The proof extracts a true rank-n or selected-rank representation; it does not divide a virtual dimension.

**Uses determining the API.**

- AG2.2 geometric polarized existence: Supplies the effective constituent with known normalization.
- ET.6 export: The genuine cohomological Galois representation with the raw source supplied by AG2.1a.

**API.**

- `ActualConstituent.rank` (characterisation): dim R′ equals the selected n, m₁ or m₂.
- `ActualConstituent.copies` (compatibility): Before removing ψ, R̃≅R̃₀^{⊕C_G} as Galois representations.
- `ActualConstituent.independent` (functoriality): Changing τ or the auxiliary ψ produces an isomorphic corrected constituent.
- `ActualConstituent.goodWeil` (projection): At source split primes recover the selected class (6.31), including the norm twist.

**Unit tests.**

- `ActualConstituent.stableRank` (computation): Case ST n=3 gives rank 3 after removing C_G copies.
- `ActualConstituent.endRank` (computation): For n=5,m₁=3,m₂=2 the two sign cases give rank 3 and 2 respectively.
- `ActualConstituent.rankOnly` (non-example): A semisimple rank-4 representation with irreducible multiplicities 1 and 3 cannot be divided into two copies merely because 2 divides 4.

**Check.**

- Rank divisibility alone is insufficient: every irreducible multiplicity must be divisible by C_G.
- The central-character twist is explicitly removed.

**Remaining closure obligations.** Close compact EL deformation/cohomology and smooth Ext/almost-product contracts; verify HT01 p.207 weight cancellation and Proposition VII.1.8 divisibility of every irreducible multiplicity, not just the total dimension.

## AG2.2: Polarized twisting, base change and discrete assembly

Use the compact construction in the Shin-regular range, the algebraic global character extension with parity and ramification constraints, solvable base change and a selected discrete assembly. General arbitrary-regular existence is proved in AG2.3.

**Planets:** Shin-regular Galois representations; Polarization character twist; Discrete unitary Galois parameters; Solvable base change.

<a id="ag22-shin-regular-geometric-existence"></a>

### Geometric existence in the Shin-regular range

Target `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence` (theorem).

For CM F and regular algebraic conjugate-self-dual cuspidal π of GL_m(A_F), m≥2, suppose m is odd, or for even m the algebraic highest weight has a_{σ,k}>a_{σ,k+1} for some embedding σ and odd k. Under the technical §7.1 conditions F=EF⁺, [F⁺:Q]≥2 and all ramification of F and π over rational primes split in F/F⁺, the compact construction gives a continuous semisimple rank-m r attached to π. For odd m use ST with n=m; for even m use END with n=m+1 and an auxiliary character chosen so that e₁=e₂, then remove its parity and norm corrections. This node asserts good-place attachment and rank; the comparison and coefficient-prime conclusions have separate owners.

**Hypotheses.**

- Shin §7.1 technical datum; m=1 is supplied by the character dictionary; slight regularity for even m is retained.

**Proof or construction.**

1. Choose the auxiliary odd Hecke character and the coefficient extension as in Lemmas 7.1–7.2.
2. For even m insert a rank-one END block into the strict odd-index gap and use Lemma 7.3 to select the rank-m block.
3. Apply the actual constituent construction and remove ψ, parity and norm twists; compare good polynomials.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`](#ag21b-actual-galois-constituent-from-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`](#ag20-attachment-twist-dual-and-conjugation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`](#ag20-unitary-similitude-central-character-dictionary), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Sources.**

- [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §7.1, Lemmas 7.1–7.3 and Proposition 7.4, pp. 50–53. The rank-m effective representation is built by the selected ST/END geometry.

**Check.**

- Even rank with no odd-index gap is excluded from this geometric node.
- n=m+1 in the even-rank construction.

<a id="ag22-algebraic-character-polarization-twist"></a>

### Twisting an essentially self-dual form into unitary type

Target `AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist` (theorem).

For a CM regular algebraic cuspidal polarized pair (π,χ), choose an algebraic Hecke character ψ with ψψ^c=χ∘N_{F/F⁺} in the source’s compatible infinity-type and parity convention. Then π⊗ψ^−1∘det is conjugate self-dual. Given a good-place attached representation r₀ for the twisted form, r=r₀⊗r(ψ) is attached to π. A change of ψ changes the construction only up to the unique good-place attached isomorphism. The existence of ψ uses the idele-character extension compatibility, not a pointwise square root of χ.

**Hypotheses.**

- Compatible algebraic infinity types and finite-order parity, after the parity correction E2 for total oddness; the source extension lemma applies.
- For the auxiliary ψ use the exact CHT08 extension contract: S consists of places of F^+ splitting in F, χ is unramified at S and has constant χ_v(−1) at infinity; the requested CM-type exponents are integral with complementary exponent w−m_τ. Coefficient-prime crystalline prescriptions use Lemma 4.1.5 and its own hypotheses.

**Proof or construction.**

1. Import the algebraic Hecke-character extension lemma of CHT08 Lemma 4.1.4 with its global-unit compatibility.
2. Compute the conjugate dual of π⊗ψ^−1.
3. Apply attachment operations and uniqueness to the corrected representation.
4. Extend the character on the norm-idèle subgroup using CHT08 Lemma 4.1.4; check the common real-place parity that kills its finite obstruction. This supplies a global ψ, not an independently chosen local square root.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`](#ag20-polarized-automorphic-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`](#ag20-attachment-twist-dual-and-conjugation), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Proof of Theorem 2.1.1, p. 34. The proof twists the polarized form to conjugate-self-dual type.
- [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), Lemma 7.4 and proof, accepted copy pp. 47–48. The rank-two route explicitly checks the odd infinity-weight and conjugate-character conditions.
- [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://numdam.org/item/10.1007/s10240-008-0016-1.pdf), Lemma 4.1.4 and proof, pp.118–119; Lemma 4.1.5, p.120. Builds the global algebraic character with the product ψψ^c, prescribed labelled infinity type and unramifiedness at a split finite set; it uses a norm-idèle subgroup and the real-place parity obstruction rather than local square roots.

**Check.**

- For ψ=1 this is the conjugate-self-dual case.
- A character with incompatible global-unit restrictions is not admitted.

<a id="ag22-discrete-unitary-galois-assembly"></a>

### Galois assembly for discrete unitary transfer

Target `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly` (construction).

For cohomological square-integrable Π on HLTT G_n(A), write 2n=Σ_i m_i n_i and BC(Π)_v=⊞_i⊞_{j=0}^{n_i−1} π̃_{i,v}|det|^{(n_i−1)/2−j} at the source’s good places, where π̃_i is conjugate-self-dual cuspidal and π_i=π̃_i||det||^{(m_i+n_i−1)/2} is cohomological. Given normalized rank-m_i attached r_i for π_i, form R(Π)=⊕_i⊕_{j=0}^{n_i−1} r_i⊗ε_ℓ^{−n−j}. Its rank is 2n and its good-place WD semisimplification is rec(BC(Π)_v|det|^{(1−2n)/2}). The input r_i are supplied individually; this assembly does not presume they all lie in the Shin-regular geometric range.

**Hypotheses.**

- Discrete transfer/classification in HLTT Proposition 1.2; actual rank-m_i normalized representations supplied; good places q≠ℓ with q split in F₀ or F and Π unramified above q.

**Proof or construction.**

1. Apply discrete stable transfer and the GL square-integrable classification.
2. The normalized r_i parameter has norm exponent (m_i+n_i−1)/2+(1−m_i)/2=n_i/2 on π̃_i.
3. Subtract from (n_i−1)/2−j+(1−2n)/2 to obtain −n−j, then use direct sum and scalar twists.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), [`AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`](#ag20-attachment-twist-dual-and-conjugation), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 1.2 and Corollary 1.3, p. 31. The discrete decomposition and its good-place parameter determine the twists.

**Uses determining the API.**

- HLTT Corollary 1.3 and Lemma 6.2: Supplies the 2n Galois representation attached to a classical discrete G_n eigensystem.
- CS Corollary 5.5.5: The same discrete-versus-cuspidal distinction must be retained in cohomology inputs.

**API.**

- `DiscreteAssembly.rank` (characterisation): rank R=Σ_i m_i n_i=2n.
- `DiscreteAssembly.goodPolynomial` (projection): The good Frobenius polynomial is the product of the scalar-twisted polynomials of r_i.
- `DiscreteAssembly.continuous` (compatibility): Finite sums of continuous finite-field representations are continuous and semisimple.
- `DiscreteAssembly.choice` (functoriality): Replacing each supplied r_i by an isomorphic attached representative gives an isomorphic R.

**Unit tests.**

- `DiscreteAssembly.singleBlock` (computation): n=1,m₁=1,n₁=2 gives r₁ε^−1⊕r₁ε^−2.
- `DiscreteAssembly.cuspidal` (degenerate): n₁=1,m₁=2n gives r₁ε^−n, tracking the cohomological twist on π₁.
- `DiscreteAssembly.rank` (non-example): Taking only one copy of each r_i gives the wrong rank when some n_i>1.

**Check.**

- The total rank is Σm_i n_i=2n.
- For n_i>1 the cyclotomic twists differ as j varies.
- Cuspidal-only existence cannot justify this discrete assembly without the classification.

<a id="ag22-attachment-under-solvable-base-change"></a>

### Attachment under cuspidal solvable base change

Target `AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change` (theorem).

If F′/F is solvable, π′=BC_{F′/F}(π) is cuspidal regular algebraic, and r is attached to π, then (r|_{G_{F′}})^ss is attached to π′. If another semisimple representation is attached to π′, good Frobenius polynomials identify it with this restriction. This is a specialization of automorphic base change and Galois restriction, distinct from the effective descent theorem used to construct r over F.

**Hypotheses.**

- Existence and good-place Satake compatibility of the specified solvable base change; cuspidality is assumed or ensured by avoiding finite self-twist fields.

**Proof or construction.**

1. At a good w|v, Frobenius is the residue-degree power of Frobenius at v.
2. Use the automorphic base-change Satake power identity and Frobenius recognition.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.1, proof of Theorem 3.1.2, p. 9. Good-polynomial compatibility identifies restrictions along the chosen base changes.

**Check.**

- A degree-f residue extension raises every good Satake root to its fth power.

**Remaining closure obligations.** Close exact character, discrete-transfer and solvable base-change APIs. The CHT08 global extension proof is read. The GSp4-specific transfer and ordinary/singular-weight outputs require their dedicated owner.

## AG2.3: Definite families, descent and arbitrary regularity

Specialize the definite-unitary eigenvariety, establish actual classical accumulation, interpolate the determinant and reconstruct semisimple specializations. Effective solvable patching and local Iwahori reduction remove geometric and finite-slope restrictions. The arbitrary-regular CS application follows that existence theorem.

**Planets:** Definite-unitary eigenvariety; Classical-point density; Family determinant interpolation; Solvable Galois patching; Arbitrary-regular polarized construction; Automorphic polarization sign.

<a id="ag23-definite-unitary-eigenvariety-instance"></a>

### The definite-unitary eigenvariety instance

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance` (construction).

Under CH General Hypotheses 1.1 and all Special Hypotheses 1.2, including Π spherical at nonsplit places (1.2.2), K/F is unramified at finite places and [F:Q] is even. The hermitian V₀ gives a unitary G₀ compact at all real places and quasi-split at finite places. Choose v₀|ℓ split in K and an Iwahori refinement of Π there; fix weights at all other real places, and tame Bernstein components with the prescribed local monodromy bound. Specialize the group-independent finite-slope eigenvariety to overconvergent G₀ forms varying the weights belonging to v₀. The classical Π gives a point x with its good Hecke eigenvalues.

**Hypotheses.**

- General Hypothesis 1.1 and Special Hypotheses 1.2 and 2.2; n even in the interpolation step; a genuine finite-slope refinement at v₀.

**Proof or construction.**

1. Use CH Lemma 2.1 and stable descent to G₀.
2. Construct the linked Banach family with compact controlling operator at v₀.
3. Import L4 finite-slope summands and L2a gluing; identify x through the eigenpacket-points theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`](#ag20-polarized-automorphic-representation), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `PadicFamilies:L2a/linked-banach-families`, `PadicFamilies:L2a/eigenpacket-points`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `AutomorphicFormsOnReductiveGroups:AF.4`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Lemma 2.1, Hypotheses 2.2 and proof of Theorem 2.3, p. 8. This is a specific definite-unitary instance, not a second generic eigenvariety construction.

**Uses determining the API.**

- CH Theorem 2.3: Approximates a regular target by the geometric strong-regularity range.
- AG2.3 local Hodge export: Fixed other weights are the condition needed for the relative p-adic Hodge comparison.

**API.**

- `DefiniteFamily.classicalPoint` (constructor): A refined classical Π with the fixed tame/infinity data gives x.
- `DefiniteFamily.fixedWeights` (characterisation): All labelled weights away from v₀ are fixed in the family.
- `DefiniteFamily.goodEigenvalues` (projection): At x, spherical operators specialize to the good Hecke eigenvalues of Π.
- `DefiniteFamily.tameType` (compatibility): At tame split places every classical point lies in the prescribed Bernstein component with the source local bound.

**Unit tests.**

- `DefiniteFamily.fixedWeight` (compatibility): Varying a weight at an embedding not attached to v₀ violates the family contract.
- `DefiniteFamily.missingRefinement` (non-example): An infinite-slope eigensystem does not give a point of a finite-slope chart.
- `DefiniteFamily.classicalSpecialization` (computation): At a classical point the good Hecke polynomial is the integral polynomial specialized to Π.

**Check.**

- Weights away from v₀ are held fixed.
- A target with no finite-slope refinement cannot be inserted in this chart and needs the solvable-index step.

<a id="ag23-s-general-solvable-extension-families"></a>

### The automorphic S-general extension family

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families` (construction).

For K/F CM, a finite forbidden set S and auxiliary finite extension M, choose cyclic prime-degree totally real F′/F disjoint from M, splitting the required places outside S and meeting the specified local splitting/ramification conditions. Their composita K′=KF′ give the S-general families used by CH §3.1. Enlarge M to exclude the finitely many self-twist extensions so that BC_{K′/K}(Π) stays cuspidal. S-general means: for every finite M/K and v∉S there is K′ disjoint from M with v split completely.

**Hypotheses.**

- Only compatible prime-degree Grunwald–Wang prescriptions, including real places; no special 2-power case is invoked.

**Proof or construction.**

1. Use the prime-degree Grunwald–Wang approximation and auxiliary nonsplit primes to force disjointness.
2. Exclude the finite cuspidality obstruction fields by adjoining them to M.
3. Verify the S-general quantifiers, which are stronger than merely infinitely many extensions.

**Prerequisites:** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.1 and Lemma 3.2.1, pp. 9–10. These are the exact families needed by effective patching.

**Uses determining the API.**

- CH Theorem 3.1.2: Removes the auxiliary geometric field hypotheses.
- CH Theorem 3.2.3: Supplies the inductive patching families.

**API.**

- `SGeneralFamily.disjoint` (projection): Given every finite M, obtain an extension linearly disjoint from M.
- `SGeneralFamily.splitPlace` (projection): Given v∉S, choose that extension with v split completely.
- `SGeneralFamily.cuspidal` (compatibility): Avoiding the finite self-twist fields preserves cuspidality of base change.

**Unit tests.**

- `SGeneralFamily.quantifier` (non-example): An infinite collection all containing one fixed nontrivial extension is not S-general.
- `SGeneralFamily.split` (computation): At a prescribed split place the local completion of each branch is the original field.
- `SGeneralFamily.forbidden` (degenerate): No splitting assertion is made for v∈S unless included in the local prescription.

**Check.**

- Disjointness is quantified for every M.
- Preserving one testing place is independent of changing another local completion.

<a id="ag23-strongly-regular-classical-density"></a>

### Density of strongly regular classical points

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density` (theorem).

In the CH definite-unitary family, classical points whose varied algebraic weights lie sufficiently far in the dominant chamber and satisfy slight regularity are Zariski dense in the required finite-slope charts. They retain the fixed other archimedean weights and tame local data. These points have geometric attached representations from AG2.2 and are sufficient to determine analytic good-place trace functions.

**Hypotheses.**

- The source’s classicality bounds relative to the chosen finite slope and coefficient family; density is asserted on the relevant charts, not on arbitrary eigenvarieties.

**Proof or construction.**

1. Use the definite-unitary classicality theorem at sufficiently dominant weights.
2. Choose arithmetic weights in the strict chambers satisfying the additional odd-index gap.
3. Use their density in weight space and finite Hecke charts to obtain the determining set.
4. Use the actual definite-unitary small-slope classicality and accumulation criterion of the eigenvariety construction. Abstract Fredholm existence alone does not supply this density theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`](#ag23-definite-unitary-eigenvariety-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`](#ag22-shin-regular-geometric-existence), `PadicFamilies:L2a/finite-hecke-images`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `AutomorphicFormsOnReductiveGroups:AF.4`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proof of Theorem 2.3, p. 8; references to Ch Theorems 3.3 and 3.5. The classicality/density input is not furnished by the group-independent spectral theorem.
- [Une application des variétés de Hecke des groupes unitaires](https://www.imj-prg.fr/fa/bpFiles/Chenevier.pdf), §§3.6–3.8, pp.17–18, Z^reg before Corollary 3.9. A minimal eigenvariety fixes the nonvarying weights and tame Bernstein component; its regular classical set is Zariski dense and accumulates at its classical points.

**Check.**

- Generic Fredholm finite-slope decomposition supplies no classicality by itself.

<a id="ag23-effective-automorphic-galois-patching"></a>

### Effective Galois patching for automorphic base changes

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching` (theorem).

For an S-general family K_i/K of cyclic extensions of a fixed prime degree, let r_i be continuous semisimple rank-n representations of G_{K_i}, invariant under Gal(K_i/K), with isomorphic restrictions on every compositum K_iK_j. Sorensen’s effective patching theorem yields a unique continuous semisimple rank-n r of G_K restricting to every r_i. For attached base-change r_i, good Frobenius polynomials establish both invariance and pairwise compatibility and then good-place attachment of r.

**Hypotheses.**

- All S-general quantifiers and all overlap/invariance conditions; actual representations r_i, not only virtual classes or traces.

**Proof or construction.**

1. Use base-change good-polynomial identities and density to verify the two compatibility conditions.
2. Import the effective continuous patching theorem.
3. Choose split testing places from S-generality to identify the descended good polynomials.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`](#ag23-s-general-solvable-extension-families), [`AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`](#ag22-attachment-under-solvable-base-change), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), `ArithmeticGaloisRepresentations:R01.5`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.1, patching lemma and Theorem 3.1.2, p. 9. The effective descent, not a trace-only construction, removes the field restrictions.

**Check.**

- Pairwise equal traces without invariance and S-generality is insufficient.

<a id="ag23-solvable-local-iwahori-reduction"></a>

### Solvable local reduction to Iwahori level

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction` (theorem).

At a split coefficient place v, choose a finite solvable local extension L/F_v over which the Weil part of rec(Π_u) is unramified; then the automorphic local base change has Iwahori invariants. If Π satisfies P(m+1), CH Corollary 3.2.2 supplies an S-general family of prime-degree global extensions preserving a testing place and cuspidality, on which the local solvable index drops to m.

**Hypotheses.**

- Local GL_n Langlands and its compatibility with cyclic base change; coefficient place split in K; finite solvable index as defined in CH p. 10.

**Proof or construction.**

1. Kill the finite inertial Weil image over a local solvable extension.
2. Peel the first prime-degree extension from the solvable tower.
3. Globalize that local step by Lemma 3.2.1 while avoiding the finite cuspidality obstructions.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`](#ag23-s-general-solvable-extension-families), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Property P(m) and Corollary 3.2.2, p. 10. The local index drops strictly and the resulting family is S-general.

**Check.**

- m=0 means the original local representation has Iwahori invariants.
- A general n-dimensional representation is not assumed to be unramified before the local extension.

<a id="ag23-definite-family-determinant-interpolation"></a>

### Determinant interpolation on the definite family

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation` (theorem).

The traces of the rank-n geometric attached representations at the dense strongly regular classical points extend to a continuous degree-n determinant on G_{K,S} with values in the reduced affinoid Hecke algebra of each relevant chart. Its good Frobenius characteristic polynomial is the analytic integral Hecke polynomial. At x, specialization and semisimple reconstruction give a continuous rank-n representation r_x over Q̄_ℓ, without an absolute-irreducibility hypothesis on r_x.

**Hypotheses.**

- One common finite ramification set S, reduced affinoid Hecke charts, continuous bounded trace interpolation, characteristic zero so n! is invertible, and finite-field continuity of the specialized semisimple representation.

**Proof or construction.**

1. Use dense classical points to enforce determinant/pseudocharacter identities on the reduced chart.
2. Apply the generic interpolation and continuity contract, then specialize at x.
3. Use algebraically closed semisimple reconstruction; obtain continuity by the characteristic-zero pseudocharacter continuity theorem, rather than invoking a residual absolutely irreducible matrix theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density`](#ag23-strongly-regular-classical-density), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`](#ag23-definite-unitary-eigenvariety-instance), `IntegralHeckeAndGaloisDeterminants:IHG.4`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3 and proof, p. 8. The family interpolation is evaluated at the arbitrary regular target.

**Check.**

- Reducible r_x is allowed.
- A nonreduced chart cannot be checked by classical point values alone.

<a id="ag23-finite-slope-regular-target-existence"></a>

### Existence at the regular finite-slope target

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence` (theorem).

Under CH Hypotheses 1.1, 1.2 and 2.2, a regular CSD cuspidal Π has a unique continuous semisimple rank-n good-place attached r, without Hypothesis 1.3. The assertion includes even rank without slight regularity, because it is obtained by specializing the determinant at x, not by identifying Π itself with a geometric middle-degree constituent.

**Hypotheses.**

- A split coefficient place with Iwahori invariants and the technical unramified CM datum of the definite-unitary family.
- CH §2 takes n even; the odd-rank existence branch comes from the geometric theorem. This node is the even-rank finite-slope step of the general construction.

**Proof or construction.**

1. Take r_x from determinant interpolation.
2. Use good-eigenvalue specialization to verify attachment.
3. Use the early good-place uniqueness theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`](#ag23-definite-family-determinant-interpolation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3, p. 8. The theorem explicitly drops Hypothesis 1.3.

**Check.**

- An even-rank weight with repeated adjacent highest-weight entries is allowed if π is regular algebraic.

<a id="ag23-removal-of-geometric-field-hypotheses"></a>

### Removal of the geometric field hypotheses

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses` (theorem).

The good-place rank-n representation constructed in the geometric or finite-slope range descends over an arbitrary CM K after choosing S-general base changes that make the real degree even, the CM extension unramified and the necessary coefficient place split while preserving cuspidality. Thus the imaginary-quadratic-subfield, degree and field-ramification assumptions are construction devices rather than final hypotheses.

**Hypotheses.**

- CSD regular cuspidal Π; the local finite-slope or slight-regularity hypothesis needed by the chosen construction is retained at this step.

**Proof or construction.**

1. Use the CH §3.1 extension family to reach the relevant auxiliary geometry.
2. Check conjugation and overlap identities using the common automorphic good polynomials.
3. Apply effective patching.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching), [`AutomorphicGaloisRepresentationsPartII:AG2.3/finite-slope-regular-target-existence`](#ag23-finite-slope-regular-target-existence), [`AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`](#ag22-shin-regular-geometric-existence), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 3.1.2 and proof, p. 9. This step removes Hypotheses 1.2, before the solvable-index induction.
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proof of Theorem 3.2.3, first paragraph, p. 11. The arbitrary-regular finite-slope branch removes the field hypotheses by the same patching argument as the slightly regular Theorem 3.1.2.

**Check.**

- Every additional construction field is removed from the conclusion.

<a id="ag23-solvable-index-induction"></a>

### Induction removing the finite-slope hypothesis

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction` (theorem).

For a regular CSD cuspidal Π, induction on its local solvable index P(m) constructs a continuous semisimple good-place attached representation at every coefficient prime. The base m=0 is finite-slope Iwahori existence, after field hypotheses are removed. The successor step constructs representations after each prime-degree extension lowering m and patches them effectively. No finite-slope hypothesis remains on the original Π.

**Hypotheses.**

- Arbitrary coefficient prime; the prime-degree local-global extension family and effective patching.

**Proof or construction.**

1. Apply the field-removal step in the base case.
2. Use Corollary 3.2.2 to lower m over an S-general family.
3. Check overlaps from good polynomials and descend by effective patching.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction`](#ag23-solvable-local-iwahori-reduction), [`AutomorphicGaloisRepresentationsPartII:AG2.3/removal-of-geometric-field-hypotheses`](#ag23-removal-of-geometric-field-hypotheses), [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proof of Theorem 3.2.3, pp. 11–12. This induction removes the residual Iwahori/finite-slope construction hypothesis.

**Check.**

- The argument terminates because m decreases by one.
- The original target need not itself be a finite-slope point.

<a id="ag21a-polarized-construction-inputs-shin-and-chenevier-harris"></a>

### Arbitrary regular conjugate-self-dual existence

Target `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` (theorem).

For any CM F, regular algebraic conjugate-self-dual cuspidal π on GL_n(A_F), prime ℓ and coefficient isomorphism ι, there is a unique-up-to-isomorphism continuous semisimple rank-n r attached at good places. No odd-rank, slight-regularity, finite-place square-integrability, finite-slope, unramified-field or imaginary-quadratic-subfield hypothesis remains. CH Theorem 3.2.3 also proves domination away from ℓ and the de Rham/crystalline/semistable assertions, but those exports are assigned to AG2.5 and AG2.6. For an essentially polarized form apply the algebraic-character twist and undo it.

**Hypotheses.**

- Regular algebraic cuspidal and conjugate self-dual; n=1 comes from class field theory. The GSp₄ case is assigned to the dedicated proposed owner.

**Proof or construction.**

1. Construct the finite-slope definite-unitary target point from strongly regular classical points.
2. Remove the field and unramified hypotheses by S-general patching, and remove the Iwahori hypothesis by induction on solvable index.
3. For essentially polarized pairs, apply the prescribed algebraic polarization twist and recover good-place attachment.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction`](#ag23-solvable-index-induction), [`AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`](#ag22-algebraic-character-polarization-twist), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 3.2.3 and proof, pp. 11–12. Arbitrary regular CSD existence follows from the separate interpolation and patching steps.

**Check.**

- An even-rank form whose weight has no strict odd-index gap is included.
- Every coefficient prime is included, including those at which the initial eigenvariety point has no finite-slope refinement.

<a id="ag22-cs-discrete-polarization-normalization"></a>

### The Caraiani–Scholze discrete normalization

Target `AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization` (comparison).

For an irreducible admissible Π^S in BC^S[H_c(I_Mant^b,Q̄_ℓ)]_Sur of CS Corollary 5.5.5, Corollary 5.5.2 chooses the specified transfer from G_{n₁,n₂}, with Π⃗=ψ⊗Π₁⊗Π₂ and n₁+n₂=N. Let r_i be the representation for the L-algebraic parameter Π_i|det|^{(1−n_i)/2}. The character |det|^{(n_i−N)/2}(ϖ∘N_{F/𝒦})^{ε(N−n_i)} is L-algebraic, with Galois character ε_i. Then r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i has rank N, is unramified outside the places above S∪{ℓ}, and at v above q∈Spl_{𝒦/Q} outside S∪{ℓ} has the displayed integral Hecke polynomial. The parity ε takes values 0 or 1 and ϖ has odd infinity exponent. This is the selected two-block cohomological transfer, not an assertion about every abstract discrete GL_N representation. The full local normalization at the specified split places is the separate Remark 5.5.6 comparison contract.

**Hypotheses.**

- The exact cohomological surjection and transferred packet of Corollaries 5.5.2/5.5.5; published numbering; specified imaginary quadratic 𝒦, source splitting set, n₁+n₂=N and odd ϖ.
- F=F⁺·𝒦 and ϖ is a character of 𝔸_𝒦×/𝒦× as in CS §5.1. The printed F₀ in Corollary 5.5.5 is the known E11 misprint; its splitting set is Spl_{𝒦/Q}.

**Proof or construction.**

1. Choose the two-block transfer supplied by Corollary 5.5.2, then r_i by Theorem 5.5.4.
2. Check ((N−n_i)+ε(N−n_i)δ)/2 is integral for the odd infinity exponent δ of ϖ.
3. Apply the displayed L-morphism and normalized parabolic-induction identity, then sum r_i⊗ε_i and compare good polynomials.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`](#ag22-discrete-unitary-galois-assembly), [`AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`](#ag20-attachment-twist-dual-and-conjugation), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris).

**Sources.**

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.5, pp. 745–746. The discrete case requires the displayed blockwise parity/norm corrections.

**Check.**

- When all N−n_i are even the parity correction is trivial.
- An odd block difference needs the selected auxiliary character.

<a id="ag23-automorphic-polarization-and-sign"></a>

### The polarization sign of the constructed system

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign` (theorem).

For the constructed regular algebraic polarized cuspidal pair (π,χ), r^c≅r∨⊗ε_ℓ^{1−n}r(χ)|_{G_F}. After the E2 parity normalization every conjugate-self-dual irreducible factor has Bellaïche–Chenevier sign +1, and the representation admits the G7 polarized-extension structure with totally odd multiplier µ=ε_ℓ^{1−n}r(χ). The good-place dual identity alone supplies the self-duality isomorphism; the sign theorem is the independent input needed for the prescribed symmetric polarization.

**Hypotheses.**

- The normalized polarized pair and algebraic twisting character; characteristic-zero semisimple r; irreducible factors fixed by the dual-conjugation operation as in BC Theorem 1.2.

**Proof or construction.**

1. Apply good-place attachment operations and uniqueness to identify the dual-conjugate representation.
2. Apply the automorphic sign theorem to its polarized irreducible factors, using the geometric case, specialization and solvable descent.
3. Assemble orthogonal sums of the sign +1 self-dual irreducible factors and hyperbolic pairings on pairs exchanged by dual-conjugation; use the arithmetic G7 extension equivalence and evaluate the multiplier at complex conjugation with the E2 correction.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), [`AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`](#ag22-algebraic-character-polarization-twist), [`AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`](#ag20-attachment-twist-dual-and-conjugation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`](#ag20-sign-of-the-polarization-multiplier), `ArithmeticGaloisRepresentations:G7/polarized-representation`, `ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant`, `ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group`, `ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations`.

**Sources.**

- [The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf), §1.3, Theorem 1.2 and Corollary 1.3, p. 1339 (PDF p. 4). The automorphic theorem gives sign +1 for the specified irreducible factors.

**Check.**

- A self-duality isomorphism without the sign theorem does not establish total oddness.

**Remaining closure obligations.** Close the actual definite-unitary classicality/accumulation, pseudocharacter realization and effective solvable-patching supplier APIs. Chenevier’s public proof is now located; bounded period closedness uses proper realization covers and fixed weights. Close regular-Hodge realization-field descent.

## AG2.4: HLTT ordinary boundary and nonselfdual existence

Use the noncompact split hyperbolic U(n,n) datum, independently of Shin’s compact datum. Build ordinary boundary and dagger cohomology, Frobenius/Hecke-compatible comparisons, classical approximation and determinant factor separation. Keep fixed compactification data where intrinsic independence is not proved.

**Planets:** HLTT Galois representations; Boundary-support dagger cohomology; Hasse congruences; Ordinary Hecke determinant; Boundary Levi realization; HLTT unitary datum.

<a id="ag24-hltt-quasi-split-unitary-datum"></a>

### The HLTT split unitary datum

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-quasi-split-unitary-datum` (definition).

For CM F=F_0F^+ with F_0 imaginary quadratic and n≥1, take V=F^{2n} with skew-Hermitian form Σ_{i=1}^n(x_i conjugate(y_{2n+1−i})−x_{2n+1−i} conjugate(y_i)) and its Q-trace alternating form. Let G_n over Q be its unitary similitude group with similitude ν, and G_n^0=ker ν. At every real place the unitary signature is (n,n). An integral lattice and its trace-dual define the integral level model; no reductivity at ramified primes is inferred. For p split in F_0 use the split local factorization with GL_{2n}(F_w) and the Levi GL_1×Res_{F/Q}GL_n of the Siegel parabolic, in the source’s fixed identifications. The Shimura dimension is [F^+:Q]n². This specializes PELModuli; it does not define a second general unitary group theory.

**Hypotheses.**

- HLTT §§1,3; source-compatible lattice, positivity, determinant and level conditions.

**Proof or construction.**

1. Specialize the generic PEL similitude construction to the hyperbolic skew-Hermitian space.
2. Compute the real signatures and the split local Levi; retain the similitude factor.
3. Import ordinary integral models and compactifications in the application node, rather than building them into the group definition.

**Prerequisites:** `PELModuli:M0`, `ShimuraData:D4`, `AdelicAlgebraicGroups:AA.1`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §1, pp.5–17, G_n and its parabolic; §3.1, pp.58–63, moduli datum. Defines the split similitude group and the ordinary-model setting used in boundary cohomology.

**Uses determining the API.**

- AG2.4/hltt-ordinary-boundary-instance: Supplies the group and Siegel Levi without an upward IG.0 edge.
- IgusaVarietiesAndTorsionConcentration: Imports this datum for its noncompact application.

**API.**

- `HLTTUnitaryDatum.group` (data): The Q-group G_n with ν and unitary kernel.
- `HLTTUnitaryDatum.toPEL` (coercion): The corresponding PEL datum and the trace alternating form.
- `HLTTUnitaryDatum.siegelLevi` (equivalence): The displayed Levi identification, preserving the determinant and ν characters.
- `HLTTUnitaryDatum.dimension` (characterisation): Complex dimension [F^+:Q]n².
- `HLTTUnitaryDatum.splitLocal` (compatibility): At a prime split in F_0, retain the GL_{2n} factors and Q_p× similitude factor.

**Unit tests.**

- `HLTTUnitaryDatum.rankOne` (computation): For F imaginary quadratic and n=1 the Shimura domain has complex dimension 1 and real dimension 2.
- `HLTTUnitaryDatum.similitude` (non-example): Scalar 2 has ν=4; it lies in G_n(Q) and not in G_n^0(Q).
- `HLTTUnitaryDatum.notCompactDatum` (non-example): For n>1 the signature (n,n) datum is not Shin’s compact signature (1,n−1) datum.
- `HLTTUnitaryDatum.traceDual` (compatibility): The lattice O_F^n⊕(different^{-1})^n is self-dual for the trace pairing; using O_F^{2n} need not be self-dual at ramified primes.

**Check.**

- For F imaginary quadratic and n=1 the Shimura domain has complex dimension 1 and real dimension 2.
- Scalar 2 has ν=4; it lies in G_n(Q) and not in G_n^0(Q).
- For n>1 the signature (n,n) datum is not Shin’s compact signature (1,n−1) datum.
- The lattice O_F^n⊕(different^{-1})^n is self-dual for the trace pairing; using O_F^{2n} need not be self-dual at ramified primes.

<a id="ag24-hltt-ordinary-boundary-instance"></a>

### HLTT ordinary boundary geometry

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance` (construction).

Fix F=F₀F⁺ with F₀ imaginary quadratic and p split in F₀. For the quasi-split similitude G_n on F^{2n} of signature (n,n), choose HLTT ordinary levels U^p(N₁,N₂), smooth toroidal cone data Σ and the Kuga family A^(m). The minimal compactification carries canonical and subcanonical E_ρ, the ordinary locus and its Hasse section; the ordinary toroidal Kuga model has SNC boundary ∂. Its formal ordinary tube has the dagger structure used in §6.2. Keep the right G_n action, the left GL_m(F) action and their source commutation conventions.

**Hypotheses.**

- The exact integral ordinary/mixed models and toroidal charts of HLTT §§3–5; neat levels and admissible smooth cones; m≥0.

**Proof or construction.**

1. Specialize the PEL and mixed Kuga suppliers to G_n and the ordinary levels.
2. Import minimal/toroidal compactifications and E_ρ extensions with the common generic fibre.
3. Use F1 to form the ordinary dagger tube and its SNC boundary.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-quasi-split-unitary-datum`](#ag24-hltt-quasi-split-unitary-datum), `PELModuli:M4`, `ShimuraCompactifications:C3`, `ShimuraCompactifications:C5`, `AutomorphicBundles:B3`, `AdicSpacesPartII:F1/dagger-snc-divisor`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §§3–5 and Appendix A.1, pp. 229–234. The ordinary mixed model, boundary charts and group actions are the actual geometric input. In Appendix A.1 the Std factor is the lower-right invertible block of the Levi matrix, correcting the zero lower-left-block description recorded as E8.

**Uses determining the API.**

- HLTT Lemma 6.1: The ordinary Hasse section and ample minimal line bundle give the weight congruence.
- HLTT §§6.4–6.5: The SNC boundary and Levi charts produce the GL_n input.

**API.**

- `HLTTModel.genericFibre` (compatibility): Minimal/toroidal/Kuga models identify the stipulated generic fibres and levels.
- `HLTTModel.ordinaryDagger` (constructor): The ordinary formal tube defines the smooth dagger pair with SNC boundary.
- `HLTTModel.subcanonical` (characterisation): E_ρ^sub is the boundary-vanishing extension used for cuspidal sections.
- `HLTTModel.refinement` (functoriality): Admissible cone refinements and level changes give the maps used in the cohomology colimit.

**Unit tests.**

- `HLTTModel.zeroKuga` (degenerate): m=0 has dimension [F⁺:Q]n².
- `HLTTModel.oneKuga` (computation): n=1,m=1 has dimension 3[F⁺:Q].
- `HLTTModel.boundaryIdeal` (non-example): Canonical sections without the boundary ideal include noncuspidal classes and cannot replace the subcanonical module.

**Check.**

- The base dimension is [F⁺:Q]n² and the Kuga dimension is [F⁺:Q]n(n+2m).
- These are the quasi-split boundary models, not the compact Shin signature.
- The source left GL_m and right mixed-group actions must not be asserted to commute without its convention.

<a id="ag24-boundary-support-dagger-cohomology"></a>

### Dagger cohomology with boundary support

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology` (construction).

For each fixed ordinary toroidal Kuga pair (A_Σ^†,∂), define H^i_{c−∂}(A_Σ^ord)=H^i(A_Σ^†,I_∂Ω^•(log∂)), then form the HLTT colimit over levels and admissible Σ with its transition maps. The complex restricts to the ordinary de Rham complex away from ∂. This definition is relative to the selected compactification; no intrinsic compactification-independent identification is asserted.

**Hypotheses.**

- Smooth dagger SNC pair from the exact HLTT model and compatible level/refinement morphisms.

**Proof or construction.**

1. Import the F1 compact-support logarithmic complex.
2. Form hypercohomology and the level/cone transition maps.
3. Use the source colimit to define the tower module.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), `AdicSpacesPartII:F1/compact-support-log-complex`, `AdicSpacesPartII:F1/log-de-rham-complex`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §6.5 definition and Lemma 6.19, pp. 218–219. The definition uses the selected boundary pair and its tower invariants.

**Uses determining the API.**

- HLTT Lemmas 6.20–6.21: The same hypercohomology has cusp-form and boundary-stratum spectral sequences.
- HLTT Corollary 6.25: Its weight-zero part contains the Levi cohomology.

**API.**

- `BoundaryCohomology.complex` (characterisation): Its complex is I_∂Ω^•(log∂), with the de Rham differential.
- `BoundaryCohomology.emptyBoundary` (compatibility): If ∂ is empty the complex is Ω^•.
- `BoundaryCohomology.transition` (functoriality): Level/refinement morphisms induce compatible maps used by the directed colimit.
- `BoundaryCohomology.groupAction` (functoriality): The source ordinary adelic group acts through these transition correspondences.

**Unit tests.**

- `BoundaryCohomology.localIdeal` (computation): For ∂=(t=0), the degree-zero term is tO^†, not O^†.
- `BoundaryCohomology.empty` (degenerate): With ∂=∅ recover ordinary dagger de Rham cohomology.
- `BoundaryCohomology.support` (non-example): Dropping I_∂ gives logarithmic cohomology with different boundary classes.

**Check.**

- The boundary ideal is retained.
- Changing Σ produces a specified map, not a declared canonical equality.

<a id="ag24-hltt-functorial-dagger-rigid-comparison"></a>

### Functorial comparison of HLTT tubes with rigid cohomology

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison` (theorem).

For smooth quasi-projective Y/O_K in HLTT Lemma 6.8, H^i_rig(Y_s/K)≅H^i(Y^†,Ω^•). The isomorphism is functorial under the actual morphisms of smooth models used for boundary strata, Hecke maps and Frobenius lifts. In particular the ordinary lift ς_p corresponds to rigid Frobenius because its special-fibre map is Frobenius.

**Hypotheses.**

- The proper formal embeddings and strict-neighborhood choices in GK Theorem 5.1 and HLTT Lemma 6.8; this is not an arbitrary rigid-space comparison.

**Proof or construction.**

1. Apply GK Theorem 5.1 to a projective closure.
2. For a morphism choose compatible closures in a product and compatible affine covers.
3. Compare the Čech/strict-neighborhood maps as in HLTT’s added functoriality argument; identify Frobenius on the special fibre.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `AdicSpacesPartII:F1/log-de-rham-complex`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemma 6.8 and bracketed functoriality proof, pp. 201–202. The source supplies the missing functorial comparison needed for Frobenius.
- [Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329), Theorem 5.1 and proof, §5. The proper formal embedding comparison is the generic supplier theorem.

**Check.**

- The word canonical alone does not establish the required functorial diagram.

<a id="ag24-hasse-weight-changing-congruence"></a>

### Hasse weight-changing congruences

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence` (theorem).

For M≥1 and any lower bound r, multiplication/division by the lifted Hasse section gives the Hecke-equivariant surjection ⊕_{j≥r} H⁰(X^min,E_ρ^sub⊗ω^{j(p−1)p^{M−1}})→H⁰(X^ord,min,E_ρ^sub⊗Z/p^M), f↦f/Hasse_M^j. Consequently a finite collection of ordinary sections modulo p^M admits lifts in finitely many sufficiently high classical weights; one common weight bound and modulus controls that finite collection.

**Hypotheses.**

- Integral E_ρ lattice and HLTT ordinary minimal model; ample ω and the lifted Hasse section; all relevant level/action normalizations.

**Proof or construction.**

1. Use ampleness and Serre vanishing after a common twist.
2. Localize along Hasse to recover ordinary sections and reduce modulo p^M.
3. Lift a finite generating set using finitely many j; retain the Hecke equivariant surjection, rather than just separate pointwise congruences.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), `AutomorphicBundles:B3`, `ShimuraCompactifications:C5`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemma 6.1 and proof, pp. 192–195. The actual source surjection provides the integral weight-changing congruence.

**Check.**

- The shift is (p−1)p^{M−1}.
- M grows arbitrarily; a single mod-p lift does not suffice.

<a id="ag24-hltt-frobenius-trace-normalization"></a>

### HLTT Frobenius and trace normalization

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization` (lemma).

On H^i_{c−∂}(A_Σ^ord), the pullback ς_p and trace trF commute with the ordinary adelic action and satisfy trF∘ς_p=p^{n(n+2m)[F⁺:Q]} id. On the ordinary minimal cusp-section module the normalized trace is the source controlling operator, with the explicit coefficient factor p^{mn[F:Q]} of Proposition 6.15: on a graded E_ρ term the Kuga trace is p^{mn[F:Q]} times the cusp-section trace. Thus section slope bound a gives Kuga slope bound a+mn[F:Q] in Corollary 6.17; conversely Kuga bound a corresponds to section bound a−mn[F:Q]. This distinguishes geometric Frobenius pullback from its finite-étale trace.

**Hypotheses.**

- HLTT ordinary Frobenius quotient, dagger finite-étale trace and its boundary extension; characteristic zero coefficients.

**Proof or construction.**

1. Use trace∘pullback=degree on the ordinary finite-étale map.
2. Compute its degree from the ordinary Kuga dimension.
3. Extend through the boundary log complex and compare the coefficient trace filtration.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`](#ag24-boundary-support-dagger-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison`](#ag24-hltt-functorial-dagger-rigid-comparison), `AdicSpacesPartII:F1/dagger-finite-etale-trace`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 6.15 and Corollary 6.17; §6.5 before Lemma 6.19, pp. 215–218. The coefficient filtration and the Kuga degree fix the slope operator normalization.

**Check.**

- At m=0 the exponent is n²[F⁺:Q].
- trF is not identified with ς_p.
- For n=m=1 and [F:Q]=2, section slope 3 corresponds to Kuga slope 5, and Kuga bound 5 corresponds to section bound 3; reversing this shift is incorrect.

<a id="ag24-classical-cusp-galois-type"></a>

### Galois type of sufficiently high classical cusp forms

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type` (theorem).

For a fixed algebraic ρ, sufficiently large determinant twists satisfying −2n≥(b_{τ,1}−t)+(b_{τc,1}−t) put the classical cuspidal G_n eigensystems in the discrete cohomological range of HLTT Lemma 6.2. Through constituent existence in AG2.3 and the discrete assembly they have continuous semisimple rank-2n representations with the normalized good polynomials and one fixed tame ramification set determined by the fixed level and p.

**Hypotheses.**

- The high-weight inequality and fixed level; all discrete constituent algebraic twists are retained; no torsion Hecke existence is an input.

**Proof or construction.**

1. Use the infinity-type inequality of Lemma 6.2.
2. Apply discrete transfer, construct each cuspidal constituent through arbitrary regular existence, then assemble.
3. Use local fixed-level bounds to choose the common tame set.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence`](#ag24-hasse-weight-changing-congruence), [`AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`](#ag22-discrete-unitary-galois-assembly), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemma 6.2 and Corollaries 6.3–6.4, pp. 195–197. The high classical weights have Galois type before ordinary interpolation.

**Check.**

- The G_n representation may be discrete and noncuspidal after transfer to GL_{2n}.

<a id="ag24-ordinary-cusp-finite-slope-pieces"></a>

### Finite slope cusp sections on the ordinary tube

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces` (theorem).

For each algebraic ρ and slope bound a, H⁰(X^ord,min,†,E_ρ^sub)_{≤a} is an admissible ordinary adelic module; at each fixed small level it is finite-dimensional. The completely continuous normalized trF acts on Banach strict neighborhoods and the finite-slope summand is unchanged upon shrinking through the source compatible neighborhoods. Its tower embeds in the ordinary formal-section space H⁰(X^ord,min,E_ρ^ord,sub)⊗Q_p.

**Hypotheses.**

- HLTT Lemmas 6.6 and 6.10–6.12, compact restriction maps and exact linked neighborhood data; the slope is measured for the normalized source trace.

**Proof or construction.**

1. Construct the Banach neighborhood modules with compact restrictions.
2. Use the generic L4 coprime-factor Fredholm decomposition and compatibility under the primitive links.
3. Pass to the ordinary dagger union and finite-level invariants.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization`](#ag24-hltt-frobenius-trace-normalization), `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `PadicFamilies:L2a/linked-banach-families`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemmas 6.10–6.12 and Corollary 6.13, pp. 209–215. The finite-slope admissibility input applies to the ordinary cusp-section tower.

**Check.**

- The finite-slope invariance is for strict neighborhoods of the same datum, not intrinsic independence of the toroidal boundary pair.

<a id="ag24-uniform-integral-hecke-congruence-witnesses"></a>

### Uniform integral Hecke congruence witnesses

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses` (theorem).

For each finite ordinary Hecke module W and each p-adic modulus, the Hasse surjection and sufficiently high classical Galois-type modules give a single finite classical comparison controlling all good Hecke operators on W modulo that modulus. Choose a common finite ramification set, coefficient ring and compatible refinements of these comparison data as the modulus grows. The resulting quotient determinant/trace data obey the IHG.4 uniform-congruence contract; at primes dividing (2n)! use a stronger modulus before converting trace pseudocharacters to determinants in characteristic zero.

**Hypotheses.**

- Integral finite Hecke image of W, finite classical comparison module and quotient descent for the continuous determinant identities; denominator control is explicit.

**Proof or construction.**

1. Lift finite generators of W by the Hasse surjection at a common sufficiently large weight.
2. Use Hecke equivariance to control the whole commuting Hecke image, not one eigencharacter at a time.
3. Descend the classical determinant identities along the resulting Hecke quotient using Frobenius density and fixed ramification; refine witnesses jointly at successive moduli.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence`](#ag24-hasse-weight-changing-congruence), [`AutomorphicGaloisRepresentationsPartII:AG2.4/classical-cusp-galois-type`](#ag24-classical-cusp-galois-type), `IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness`, `IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Corollaries 6.3–6.4 and proof of Proposition 6.5, pp. 196–199. The passage from classical forms to the ordinary finite module uses congruences, not density alone.

**Check.**

- The witness is uniform over all good primes for a given modulus.
- A Zariski-dense classical set without integral lifts does not supply this witness.

<a id="ag24-boundary-stratum-weight-zero-sequence"></a>

### The boundary-stratum and weight-zero spectral sequence

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence` (theorem).

For the fixed HLTT ordinary boundary model, E₁^{i,j}=H^i_rig(∂^(j)A_Σ^ord)⇒H^{i+j}_{c−∂}(A_Σ^ord), compatibly with ς_p. The abutment is finite-dimensional at fixed level and is exhausted by finite trF slopes. Its Frobenius eigenvalues have nonnegative Weil weights; for i>0, the weight-zero part of H^{i+1}_{c−∂} is the cohomology H^i of the boundary dual simplicial complex, and for i=0 the source gives a surjection.

**Hypotheses.**

- Smooth quasi-projective strata, functorial rigid/dagger comparison, rigid finiteness and the weight lower bound w≥cohomological degree.

**Proof or construction.**

1. Resolve the boundary-support complex by its intersections.
2. Apply the functorial rigid comparison to each stratum and rigid finiteness.
3. Use trF∘ς_p=p^D to obtain finite slopes, then isolate weight zero from the stratum spectral sequence.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`](#ag24-boundary-support-dagger-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison`](#ag24-hltt-functorial-dagger-rigid-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization`](#ag24-hltt-frobenius-trace-normalization), `PadicDifferentialEquationsAndRigidCohomology:RD.5`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Lemmas 6.21 and Corollaries 6.22–6.24, pp. 219–220. The precise degree shift and the i=0 exception identify the boundary weight-zero part.

**Check.**

- At i=0 claim a surjection only.
- Frobenius and trace slopes are related by the dimension factor.

<a id="ag24-ordinary-hecke-determinant-limit"></a>

### The continuous ordinary Hecke determinant limit

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit` (theorem).

The compatible fixed-S quotient data for the ordinary finite Hecke modules interpolate to a unique continuous degree-2n determinant, with every good Frobenius polynomial equal to the normalized G_n Hecke polynomial. At each characteristic-zero irreducible ordinary eigensystem covered by Proposition 6.5/Corollary 6.13, specialization reconstructs a continuous semisimple rank-2n Galois representation. Coefficient/level changes transport this determinant; the coefficient limit adds no ramification.

**Hypotheses.**

- The uniform congruence witnesses and actual quotient-descent contract, separated complete coefficient topology, compatible level maps and characteristic-zero reconstruction continuity; the source Proposition 6.5 initially concerns an irreducible quotient of an admissible submodule.

**Proof or construction.**

1. Apply the generic finite-quotient inverse-limit theorem and completed-group-algebra extension.
2. Apply coefficient and level functoriality and fixed-S ramification descent.
3. Specialize to an eigencharacter and reconstruct semisimply; use the admissible finite-slope realization for the applicable subquotients.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`](#ag24-uniform-integral-hecke-congruence-witnesses), [`AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces`](#ag24-ordinary-cusp-finite-slope-pieces), `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.4/completed-group-algebra-extension`, `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-coefficient-change`, `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-level-change`, `IntegralHeckeAndGaloisDeterminants:IHG.4/interpolation-ramification`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 6.5 and Corollary 6.13, pp. 197–199, 214–215. The source obtains a characteristic-zero rank-2n representation for the applicable ordinary eigenquotient.

**Check.**

- A common finite quotient of G is not required across all moduli.
- Uniform unramifiedness must be proved before using inverse-limit ramification preservation.

<a id="ag24-logarithmic-cusp-section-spectral-sequence"></a>

### The logarithmic cusp-section spectral sequence

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence` (theorem).

At each fixed Kuga slope bound b, the logarithmic de Rham cohomology of the ordinary Kuga model with I_∂ has the coefficient filtration and spectral sequence of HLTT Proposition 6.15/Corollary 6.17: the E₁ terms are finite-slope H⁰(X^ord,min,†,E_{ρ_{m,s}^{i,j}}^sub), with section bound b−mn[F:Q]. Equivalently, section bound a gives Kuga bound a+mn[F:Q]. Combining with Lemma 6.20 gives the log de Rham spectral sequence to H^*_{c−∂,≤b}. Hence every irreducible constituent appearing in the abutment has the source rank-2n good-place Galois representation.

**Hypotheses.**

- Actual algebraic representations ρ_{m,s}^{i,j}, coefficient trace factor and finite filtrations; the higher coherent cohomology vanishing on the ordinary affine locus.

**Proof or construction.**

1. Compute the associated graded logarithmic differentials using the mixed Kuga boundary charts.
2. Use the source finite coefficient filtration and vanishing to pass to ordinary sections.
3. Apply finite-slope exactness and the spectral sequence filtration to obtain Corollaries 6.18 and 6.23.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`](#ag24-boundary-support-dagger-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-frobenius-trace-normalization`](#ag24-hltt-frobenius-trace-normalization), [`AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-cusp-finite-slope-pieces`](#ag24-ordinary-cusp-finite-slope-pieces), [`AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit`](#ag24-ordinary-hecke-determinant-limit), `AutomorphicBundles:B3`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Proposition 6.15, Corollary 6.17 and Corollaries 6.18, 6.23, pp. 215–220. The filtration and spectral sequence connect sections to higher boundary-support cohomology.

**Check.**

- An arbitrary subquotient assertion is justified by the finite spectral-sequence filtration, not merely quoted from Proposition 6.5.

<a id="ag24-boundary-levi-cohomology-realization"></a>

### The boundary Levi realization

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization` (theorem).

For i>0, the induced interior cohomology of the GL_n Levi locally symmetric space in HLTT Corollary 6.25 occurs as a subquotient of W₀H^{i+1}_{c−∂}. A regular algebraic GL_n cuspidal π, after all sufficiently large norm twists N, occurs in this interior-cohomology input by Corollary 1.9. Corollary 6.27 gives an actual rank-2n R(π,N) whose good-place parameter is rec(π_v|det|^{(1−n)/2})⊕rec(π^c_{cv}|det|^{(1−n)/2})^{∨,c}ε_p^{1−2n−2N}.

**Hypotheses.**

- n>1; exact Levi arithmetic quotient, coefficient representation ρ and π∞ with the infinitesimal character of ρ∨; N sufficiently large; good source places q≠p split in F₀ or unramified in F with π spherical above q.

**Proof or construction.**

1. Use the boundary open embedding of the Levi dual-complex piece and the induced cohomology formula.
2. Apply the weight-zero boundary comparison and the rank-2n cohomology constituent theorem.
3. Insert π||det||^N in the interior cohomology and undo ε_p^N to obtain Corollary 6.27.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence`](#ag24-boundary-stratum-weight-zero-sequence), [`AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence`](#ag24-logarithmic-cusp-section-spectral-sequence), `AutomorphicFormsOnReductiveGroups:AF.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Corollary 1.9, §1.5, p. 41; Corollaries 6.25–6.27, p. 221. The Levi inclusion and the varying-twist polynomial are the bridge to separation.

**Check.**

- The second n-dimensional block carries ε_p^{1−2n−2N}.
- The first block is independent of N.

<a id="ag24-hltt-factor-separation-specialization"></a>

### Separating the two HLTT rank-n factors

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization` (theorem).

The representations R(π,N) for all sufficiently large N satisfy HLTT Proposition 7.12 with Γ=G_{F,S}, dense good Frobenius set, µ=ε_p^−2 and two n-element root multisets E₁,E₂ independent of N, the constant ε_p^{1−2n} correction absorbed into E₂. Each µ(Frob_v) has infinite order. The generic factor-separation theorem therefore gives continuous semisimple rank-n representations for each multiset. The first is the good-place attached r(π), uniquely determined by Frobenius polynomials.

**Hypotheses.**

- One finite S for all N; Γ topological, algebraically closed characteristic-zero coefficient field; all R(π,N) continuous semisimple; infinitely many exponents and infinite-order µ on the determining dense set.

**Proof or construction.**

1. Verify the fixed root multisets and infinite-order character from Corollary 6.27.
2. Import the generic reductive-closure/central-character separation theorem.
3. Use early attachment uniqueness for the first factor.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization`](#ag24-boundary-levi-cohomology-realization), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), `IntegralHeckeAndGaloisDeterminants:IHG.4`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §7 first two paragraphs, Proposition 7.12 and proof of Theorem 7.13, pp. 222–228. The algebraic separation hypotheses are all checked for the automorphic family.

**Check.**

- One or finitely many twists do not satisfy the theorem.
- A finite-order separating character is excluded.

<a id="ag24-hltt-construction-of-nonselfdual-systems"></a>

### HLTT existence over arbitrary CM and totally real fields

Target `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems` (theorem).

For E totally real or CM and π regular algebraic cuspidal on GL_n(A_E), every prime p and coefficient isomorphism ι yield a continuous semisimple rank-n r attached at good places. HLTT Theorem 7.13 constructs it first for F=F₀F⁺ with p split in F₀ and the stated source good primes; Corollary 7.14 removes the auxiliary field restrictions by effective patching and proves unramifiedness and the normalized polynomial at all v|q≠p for rational q where π is unramified above q. No polarization is required; the theorem here asserts neither de Rham admissibility at p nor full monodromy at ramified primes.

**Hypotheses.**

- Regular algebraic cuspidal; geometric Artin and the common integral polynomial convention; n=1 supplied by the algebraic-character construction.

**Proof or construction.**

1. Apply factor separation on the auxiliary imaginary-quadratic compositum.
2. Vary linearly disjoint auxiliary CM fields, preserving cuspidality and splitting testing places.
3. Use effective continuous patching, overlap recognition and good polynomials to descend to E.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization`](#ag24-hltt-factor-separation-specialization), [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching), [`AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`](#ag23-s-general-solvable-extension-families), [`AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`](#ag22-attachment-under-solvable-base-change), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character).

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Theorem 7.13 and Corollary 7.14, pp. 227–228. The final auxiliary-field descent supplies the nonselfdual rank-n representation.

**Check.**

- All coefficient primes occur.
- A nonselfdual regular algebraic cuspidal π is included.
- Good-place equality is not promoted to ramified monodromy equality.

**Remaining closure obligations.** Close ordinary boundary/bundle, dagger-rigid functoriality and weight contracts; derive joint-injective IHG witnesses from Hasse quotient congruences or prove the necessary quotient-descent extension. Supply the generic HLTT factor-separation refinement. Intrinsic compactification independence remains unproved in the source.

## AG2.5: Local comparison, monodromy and purity

Compare the early integral polynomial with the normalized local correspondence. Distinguish semisimple Weil equality, isotypic monodromy dominance and full WD equality. Tensor-square concentration and purity give the polarized upgrade; the rank of one N alone is insufficient.

**Planets:** Varma local comparison; Caraiani monodromy comparison; RACSDC temperedness.

<a id="ag20-the-normalization-dictionary-fixed-by-the-sources"></a>

### Comparison of the early polynomial with normalized local Langlands

Target `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources` (comparison).

For spherical π_v, after ET.6 fixes geometric Artin and the Harris–Taylor normalization, rec(π_v|det|^{(1−n)/2}) is unramified with Frobenius polynomial equal to the AG2.0 integral Hecke polynomial. Shin/Caraiani L_n is this geometric normalization. The square-root Satake extension cancels from the integral coefficients. rec^T is the corresponding arithmetic/rational normalization of the source; geometric-to-arithmetic Frobenius takes the normalized reciprocal polynomial. This is a comparison with the constructed local correspondence, and is not an early prerequisite for raw geometry. The term arithmetic normalization for rec^T in ACC+ does not change its geometric Frobenius convention; inversion of Frobenius is a separate operation.

**Hypotheses.**

- Use the chosen coefficient embedding and geometric Frobenius on both sides.
- Import the exact local reciprocity/Satake normalization from ET.6; do not invert roots in just one side.

**Proof or construction.**

1. Compare ET.6’s unramified local parameter with the normalized Satake character.
2. Apply the IHG.3 factorization and twist formula.
3. Compare the geometric L_n and rec^T source dictionaries, and apply reciprocal conversion for arithmetic Frobenius.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`.

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Theorem 7.13 and notation §1, pp. 1–3, 227. The normalized good parameter is the one supplied by local Langlands.
- [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §1.1 notation, accepted copy p. 3. This notation refers rec and rec^T to the earlier Clozel–Thorne convention; this page alone does not prove the normalization formula.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation, printed p.906. Art sends uniformizers to geometric Frobenius, while rec^T is called the arithmetic normalization. These two uses of normalization must be distinguished.

**Check.**

- Check the n = 1 case: an algebraic Hecke character and the twist |det|^{(1-n)/2} = 1, so the dictionary must reduce to class field theory in the chosen normalization
- Check the n = 2 case against the R19 convention (characteristic polynomial X^2 - a_l X + eps(l) l^{k-1} at good arithmetic Frobenius) and record the twist relating the two

<a id="ag25-monodromy-order-interface"></a>

### The monodromy dominance interface

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface` (comparison).

Import WD, Frobenius semisimplification, WD semisimplification and monodromy filtration from R01.2. For equal semisimple Weil representations, Varma’s ≺ compares decreasing Sp-block partitions separately in each irreducible Weil unramified-twist class: every initial sum on the first side is ≤ the second. The inertial relation ≺_I compares the corresponding N-block partitions in every irreducible inertia isotype. Lemma 9.2 identifies them when the semisimple Weil parts agree. Equivalently all ranks of positive powers of each isotypic N on the first side are ≤ the second; one rank is insufficient.

**Hypotheses.**

- Characteristic zero; finite inertial Weil image; same semisimple Weil part when identifying the two orders.

**Proof or construction.**

1. Import the indecomposable Sp classification and nilpotent partition order from R01.2.
2. Apply Varma Lemma 9.2’s repetition factor dim(s)/dim(θ) to compare the Weil and inertia partitions.

**Prerequisites:** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `ArithmeticGaloisRepresentations:R01.2/monodromy-filtration`, `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), §9, Definitions 1–2 and Lemma 9.2, pp. 20–21. The actual orders retain the isotypic partitions and all initial sums.

**Check.**

- For partitions (1,1)≺(2), N=0 is below nonzero rank-one N.
- Partitions (3,3) and (4,2) have equal rank N but different higher-power ranks.

<a id="ag25-varma-integral-bernstein-operators"></a>

### Integral Bernstein operators on the ordinary family

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators` (theorem).

At the unitary split places v∤p, the Bernstein centres of the finitely many components permitted by the fixed local level supply operators whose value at a classical or ordinary cusp eigensystem Π is tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ), for every σ∈W_{F_v}. After the source common denominator d(z), these operators preserve the integral cusp-section lattices used in the Hasse congruences. The bound idempotent e_{Π,B} selects points whose local parameter is dominated by that of the target Π.

**Hypotheses.**

- Finite union of actual Bernstein components at the split local G_n factor; fixed level; source integral denominator and idempotent.

**Proof or construction.**

1. Import the local Bernstein trace functions and parameter-type idempotent from SR/ET.
2. Map them to the Hecke action on each weight and prove the common denominator preserves the lattice.
3. Retain the same operator as the weight and modulus vary.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hasse-weight-changing-congruence`](#ag24-hasse-weight-changing-congruence), `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

**Sources.**

- [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), §7.2, integral Bernstein operators, pp. 16–17; §9.1, e_{Π,B}, pp. 24–25. The centre operators and their integral action are the additional local interpolation data.

**Check.**

- Split places are the starting local argument, not the final range of the theorem.
- Ignoring the denominator invalidates integral congruence transfer.

<a id="ag25-caraiani-tensor-square-geometric-instance"></a>

### The tensor-square geometric instance

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance` (construction).

For the source auxiliary CM extensions F/F′/L and π with local Iwahori invariants, choose the compact unitary datum with signatures (1,n−1) at two distinguished real places and (0,n) at the others. Its dimension is 2n−2. The selected cohomological automorphic packet and corrected coefficient projector realize the tensor square of the already constructed rank-n representation, with the scalar character and multiplicity corrections of Caraiani §7. The integral model is locally étale over a product of two semistable charts at the chosen split prime.

**Hypotheses.**

- The solvable extensions and two split distinguished p-adic places of the proof of Theorem 7.4; cuspidality preserved, relevant local components Iwahori fixed and exact source coefficient twists.

**Proof or construction.**

1. Choose the source solvable extensions making the local parameter Iwahori and p split at the two selected places.
2. Specialize PEL geometry to the two-signature datum and import its product charts.
3. Use stable transfer and the packet cohomology calculation to identify the corrected tensor-square constituent.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector), `PELModuli:M4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `LefschetzPencilsAndVanishingCycles:LPV.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

**Sources.**

- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), §7 setup and proof of Theorem 7.4, pp. 80–85. The actual two-signature geometry realizes the tensor-square constituent.

**Uses determining the API.**

- Caraiani Corollary 7.3: The product-chart spectral sequence proves purity of the geometric constituent.
- Caraiani Theorem 7.4: Tensor-square purity is transferred to the rank-n representation.

**API.**

- `TensorSquareInstance.signature` (characterisation): Exactly two nondefinite signatures give dimension 2n−2.
- `TensorSquareInstance.charts` (projection): The local model is étale over the product of the two specified semistable charts.
- `TensorSquareInstance.constituent` (compatibility): After the source scalar/multiplicity correction the selected middle cohomology realizes r(π)⊗r(π).
- `TensorSquareInstance.actions` (functoriality): This identification preserves Hecke and Weil actions with N acting as N⊗1+1⊗N.

**Unit tests.**

- `TensorSquareInstance.rankTwo` (computation): n=2 gives a two-dimensional Shimura variety and a rank-four tensor-square constituent.
- `TensorSquareInstance.dimension` (non-example): The single-signature Shin variety cannot replace the dimension-2n−2 model.
- `TensorSquareInstance.monodromy` (compatibility): For nonzero tensor factors V₁,V₂ with N₁=0 and N₂≠0, total monodromy is 1⊗N₂≠0. For the tensor square with N=0, total monodromy is zero.

**Check.**

- The dimension is 2n−2 rather than n−1.
- The model is a product of semistable charts, not declared semistable as a single chart.

<a id="ag25-good-prime-unramified-polynomial"></a>

### Unramifiedness and the good-prime polynomial

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial` (theorem).

For each constructed polarized or nonselfdual rank-n r, outside its specified finite excluded set and v∤ℓ, r is unramified and det(X−r(Frob_v^geom))=ι^−1P_v(π_v;X). HLTT Corollary 7.14 proves this for v|q≠ℓ where π is unramified at every place above q, including field-ramified q after auxiliary descent. The polarized branch has the source’s unramified local-global comparison. The result includes every coefficient prime, while excluding the places above that prime.

**Hypotheses.**

- The relevant existence theorem and its actual common ramification set; π cuspidal regular algebraic, polarized only in the corresponding branch.

**Proof or construction.**

1. Use the good-place existence output and normalized local unramified parameter.
2. For the final HLTT good rational primes use the patching proof of Corollary 7.14, beyond the auxiliary Theorem 7.13.
3. Identify Frobenius polynomials in the early integral normalization.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`](#ag24-hltt-construction-of-nonselfdual-systems), [`AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`](#ag20-the-normalization-dictionary-fixed-by-the-sources), [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions).

**Sources.**

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Corollary 7.14, p. 228. The final good-place unramifiedness is stronger than the auxiliary-field good set.

**Check.**

- An unramified π at one place above q does not satisfy HLTT’s stated all-places-above-q hypothesis.
- At v|ℓ this node gives no crystalline claim.

<a id="ag25-two-chart-nearby-cycle-monodromy"></a>

### Nearby cycles of the two-chart instance

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy` (comparison).

Import the product nearby-cycle comparison of Caraiani Proposition 3.9 and Proposition 4.10, with the single-chart filtration of Proposition 4.6 from LPV.6. On the tensor-square instance RΨ of the product is the derived tensor product of the two factors, and N=N₁⊗1+1⊗N₂. The kernel and image filtrations of the total monodromy operator N yield Corollary 4.29’s double-filtered stratum spectral sequence, compatible with the corrected projector, Hecke and Weil actions.

**Hypotheses.**

- The actual étale-local product of semistable charts, all shifts and Tate twists, and coefficient projector equivariance.
- Characteristic-zero ℓ-adic coefficients Λ=Q_ℓ or Q̄_ℓ for the product argument of §4.2; the two charts are semistable over the same trait.

**Proof or construction.**

1. Apply the generic product-chart comparison locally and glue equivariantly.
2. Track each monodromy operator and the two filtrations; apply the ξ projector.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`](#ag25-caraiani-tensor-square-geometric-instance), `LefschetzPencilsAndVanishingCycles:LPV.6`, [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector).

**Sources.**

- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Proposition 3.9 (p. 24), Proposition 4.6 (p. 29), Proposition 4.10 (p. 33) and Corollary 4.29 (p. 51). The generic product nearby-cycle result supplies the needed N and double filtration.

**Check.**

- Neither ordinary smooth nearby cycles nor a one-chart weight sequence supplies this comparison.

<a id="ag25-caraiani-stratum-concentration"></a>

### Cohomology of the two-chart strata

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration` (theorem).

For the source Π^{1,S}-isotypic part, the stratum Y_{S,T} of the two-chart integral model has coefficient cohomology zero outside j=2n−|S|−|T|, as in Caraiani Proposition 5.10. Its surviving graded pieces have the explicit Igusa/Mantovan trace calculation of Proposition 5.8. These are characteristic-zero automorphic stratum calculations under the source §5 datum; torsion concentration is not used.

**Hypotheses.**

- The exact two-signature datum, selected packet, local Iwahori levels and source ST/END transfer hypotheses.

**Proof or construction.**

1. Express stratum traces using the product Newton/Igusa correspondence.
2. Apply the source stabilized characteristic-zero calculation and weight separation.
3. Identify the single allowed degree with the stratum dimension.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`](#ag25-caraiani-tensor-square-geometric-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`](#ag21b-shin-st-end-igusa-computation), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`](#ag21b-compact-global-mantovan-formula), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.

**Sources.**

- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Propositions 5.8 and 5.10, pp. 64–65. The stratum concentration is the actual input used for degeneration in §7.

**Check.**

- The allowed degree changes with both |S| and |T|.

<a id="ag25-ch-polarized-local-monodromy-bound"></a>

### The polarized local comparison from the definite family

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound` (theorem).

For the arbitrary-regular polarized CH representation, at every v away from the coefficient prime the Frobenius-semisimplified WD parameter is dominated by the normalized local parameter of π. In particular their semisimple Weil parts agree. This is CH Theorem 3.2.3(a′), obtained from the tame Bernstein/monodromy restrictions in Theorem 2.3 and effective patching. It precedes the pure-WD upgrade and supplies that upgrade’s semisimple comparison without using Varma’s general nonselfdual theorem.

**Hypotheses.**

- CH General Hypotheses 1.1, the definite-unitary interpolation and source Bernstein restrictions; extend essentially polarized forms by the prescribed character twist.

**Proof or construction.**

1. At the dense geometric points import the local comparison in Shin’s range, with the imposed tame parameter bound.
2. Use the CH/BC family local theorem to specialize the Weil traces and monodromy domination at the target point.
3. Carry both properties through the S-general patching and solvable-index induction of Theorem 3.2.3.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`](#ag23-definite-unitary-eigenvariety-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`](#ag23-definite-family-determinant-interpolation), [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching), [`AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction`](#ag23-solvable-index-induction), [`AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`](#ag25-monodromy-order-interface), `SmoothRepresentationsOfLocalGroups:SR.3`, `IntegralHeckeAndGaloisDeterminants:IHG.4`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3, tame-family paragraph, p. 8; Theorem 3.2.3(a′), pp. 11–12. The polarized bound is already proved by this interpolation and patching route.
- [Une application des variétés de Hecke des groupes unitaires](https://www.imj-prg.fr/fa/bpFiles/Chenevier.pdf), Proposition 3.11, Lemmas 3.12 and 3.14, pp.19–21; Theorem 3.5, p.17. Bernstein-centre interpolation identifies the local semisimple Weil part; the inertia-isotypic partition bound specializes and converts to the Weil-class order with the repetition factor dim(σ)/dim(τ). The generic specialization theorem remains an imported family contract.

**Check.**

- The polarized semisimple comparison must precede Caraiani; otherwise using Varma here and Caraiani on Varma’s classical inputs creates a proof cycle.
- Domination retains the semisimple Weil part and only bounds N.

<a id="ag25-racsdc-temperedness"></a>

### Temperedness of regular unitary-type cuspidal forms

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness` (theorem).

Every regular algebraic conjugate-self-dual cuspidal π on GL_n over CM L has tempered local components at all finite places. With every coefficient conjugate accounted for, the normalized local parameter is pure of weight n−1 in geometric normalization. This is the automorphic purity input to the monodromy comparison; arbitrary nonselfdual π is outside this theorem.

**Hypotheses.**

- Regular algebraic CSD cuspidal, source solvable-base-change descent and all coefficient embeddings.
- Corollary 5.9 is stated for n≥2. For n=1 the assertion follows separately from the conjugate-self-dual algebraic Hecke-character dictionary and class field theory.

**Proof or construction.**

1. Use Caraiani Proposition 5.8’s local trace calculation to prove Corollary 5.9.
2. Remove the local auxiliary hypotheses by the source base-change arguments.
3. Apply TY Lemma 1.4(3) with the correct norm normalization and all conjugates.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`](#ag25-caraiani-stratum-concentration), [`AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`](#ag22-attachment-under-solvable-base-change), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`, [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character).

**Sources.**

- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Corollary 5.9, pp. 64–65, and Theorem 1.2, p. 2. The automorphic local parameter is pure because the local components are tempered.

**Check.**

- A norm twist shifts the weight and preserves essential temperedness only with its specified central normalization.
- The factor has weight n−1, and its tensor square has weight 2n−2; E5 records the doubled-factor-weight misprint in the proof of Theorem 7.4.

<a id="ag25-tensor-square-weight-spectral-sequence"></a>

### Purity from the double weight spectral sequence

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence` (theorem).

Caraiani Proposition 7.2 supplies the double-filtered nearby-cycle spectral sequence for the Π^{1,S} part of the corrected Kuga tower, with N taking Gr_l Gr_k to Gr_{l+1} Gr_{k−1}. Its secondary stratum sequence has |S|=j+s, |T|=j+k+l−s+1 and coefficient degree m−2j−k−l+1 with twist −j−k+1. Stratum concentration forces m=2n−2, gives the source degeneration, and proves WD of the selected H^{2n−2} is pure of weight m_ξ−2t_ξ+2n−2.

**Hypotheses.**

- Exact stratum purity and the two-chart nearby-cycle comparison, equivariant projector and coefficient twists; no unproved general weight-monodromy conjecture is assumed.

**Proof or construction.**

1. Apply the two filtrations and the geometric projector to the nearby-cycle complexes.
2. Insert the stratum degree formula, forcing m=2n−2 in each nonzero term.
3. Use the graded weight w+k−l−1 and N maps, reindexed by r=k−l−1, to identify the monodromy filtration centered at zero and Corollary 7.3 purity.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy`](#ag25-two-chart-nearby-cycle-monodromy), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`](#ag25-caraiani-stratum-concentration), `DeligneWeightsAndPurity:DWP.8`, `ArithmeticGaloisRepresentations:R01.2/monodromy-filtration`.

**Sources.**

- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Proposition 7.2 and Corollary 7.3, pp. 82–84. The exact double spectral sequence establishes the geometric monodromy purity.

**Check.**

- The two filtration indices and the Tate twist −j−k+1 are retained.
- E₁ degeneration alone without the N identification does not establish purity.
- To use R01.2’s monodromy filtration centered at zero, reindex the source kernel/image piece Gr_l Gr_k by r=k−l−1. Its weight is w+r with w=m_ξ−2t_ξ+2n−2; when N=0 the sole monodromy grade is r=0.

<a id="ag25-late-gl2-modular-comparison"></a>

### Comparison with the classical GL₂ constructions

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison` (comparison).

For an already supplied semisimple rank-two representation of a regular classical or Hilbert eigenform, equality of the normalized good polynomials with the AG2 member gives a memberwise isomorphism by Chebotarev and Brauer–Nesbitt. In the classical weight-k arithmetic Deligne convention the geometric AG2 member is its dual, with X²−a_qX+ψ(q)q^(k−1) and HT={0,k−1}; the geometric nebentype character sends Frob_q to ψ(q). A Hilbert comparison must retain the actual parity and half-integer normalization of the supplied theorem. Local conclusions transport only when they are supplied for that independent representation. This statement does not construct the modular/Hilbert member or import Skinner as a prerequisite for the general AG2 construction.

**Hypotheses.**

- An independently supplied continuous semisimple rank-two representation of the same eigenform exists; its normalization is specified and its converted good characteristic polynomials equal the AG2 polynomials. Any transported local conclusion is an explicit hypothesis on that supplied representation.

**Proof or construction.**

1. Convert Frobenius, dual and character conventions before comparing polynomials.
2. Apply the lower-tier rank-n semisimple recognition theorem to the two existing representations.
3. Transport only the expressly supplied local hypotheses. The subsequent modular/Hilbert roadmap imports AG2, rather than being used as its input.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial`](#ag25-good-prime-unramified-polynomial), `IntegralHeckeAndGaloisDeterminants:IHG.3/rank-two-modular-normalization`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §3.2, pp. 10–12; §4, Hypotheses 4.1 and Theorem 4.2, p. 13. The overlap is identified by uniqueness after the arbitrary regular construction.

**Check.**

- Weight k arithmetic polynomial X²−a_qX+ω(q)q^(k−1) becomes its normalized reciprocal at geometric Frobenius.

<a id="ag25-pure-weil-deligne-comparison"></a>

### Pure Weil–Deligne comparison up to equivalence

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison` (comparison).

For the semisimple Weil representation shared by the Galois and automorphic sides, TY Lemma 1.4(4) determines at most one pure WD extension up to equivalence. Import purity and filtration from R01.2 and request the full primitive-string uniqueness, finite-extension equivalence and tensor-square detection. Apply it only after geometric purity of the Galois side and tempered purity of the automorphic side are proved. Do not replace purity with maximal rank of N: BCGP Lemma 2.5.1’s general maximal-rank uniqueness claim has the counterexample recorded in E3.

**Hypotheses.**

- Characteristic-zero algebraically closed field and semisimple Weil part; equivalence means a Weil-equivariant isomorphism carrying one N to the other.

**Proof or construction.**

1. Use primitive weight strings and their monodromy isomorphisms to recover the WD isomorphism class.
2. Apply the geometric tensor-square and finite-extension purity detection to the Galois side.
3. Combine with equality of the semisimple Weil parts.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence`](#ag25-tensor-square-weight-spectral-sequence), [`AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness`](#ag25-racsdc-temperedness), [`AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`](#ag25-monodromy-order-interface), `ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations`, `ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne`, `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), Lemma 1.4(2)–(4), proof of (4), pp. 6–7. The uniqueness is a WD equivalence statement and uses full purity.
- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Published typeset author copy lgc1.pdf, proof of Theorem 7.4, pp. 2410–2411; the preprint gives a shorter argument on p. 85. The primitive-string/binomial argument proves tensor-square detection of purity, an additional generic R01.2 contract beyond TY Lemma 1.4’s uniqueness and finite-extension assertions.

**Check.**

- N itself is not unique in a fixed basis.
- Rank N does not detect every N-power needed by purity.

<a id="ag25-caraiani-upgrade-away-from-p-and-temperedness"></a>

### Caraiani’s full away-prime compatibility

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness` (theorem).

For CM L and regular algebraic CSD cuspidal π on GL_n(A_L), every prime ℓ and every v∤ℓ satisfy WD(r_{ℓ,ι}(π)|_{G_{L_v}})^{F-ss}≅ι^−1rec(π_v|det|^{(1−n)/2}) including N. Choose the source solvable extensions and two-signature tensor-square instance, prove its monodromy purity, descend purity to the rank-n representation, and combine with the semisimple local comparison and temperedness. This is full WD compatibility under the polarized source hypotheses, not a conclusion for arbitrary nonselfdual HLTT systems or for v|ℓ.

**Hypotheses.**

- Regular algebraic CSD cuspidal; v∤ℓ; source geometric normalization and coefficient embedding.

**Proof or construction.**

1. Choose the source auxiliary extensions and compare the tensor-square geometric constituent.
2. Use the double weight sequence, tensor-square detection and finite-extension invariance to establish Galois WD purity.
3. Use tempered automorphic purity and equality of semisimple Weil parts, then pure-extension uniqueness up to equivalence.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), [`AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`](#ag25-ch-polarized-local-monodromy-bound), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`](#ag25-caraiani-tensor-square-geometric-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence`](#ag25-tensor-square-weight-spectral-sequence), [`AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`](#ag25-pure-weil-deligne-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`](#ag20-the-normalization-dictionary-fixed-by-the-sources).

**Sources.**

- [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188), Theorem 7.4 and proof, pp. 83–85. The tensor-square geometric route proves the full away-prime result.

**Check.**

- The isomorphism preserves N, not only Frobenius eigenvalues.
- The companion coefficient-prime log-crystalline theorem belongs to AG2.6.

<a id="ag25-varma-local-trace-congruence"></a>

### Local Weil traces through the HLTT congruences

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence` (theorem).

Include the denominator-corrected Bernstein operators in the uniform classical-to-ordinary Hecke congruences. The resulting continuous degree-2n pseudocharacter has T(σ_v)=tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ_v) at every split v∤p and every Weil element σ_v. Semisimple reconstruction therefore identifies the entire semisimple local Weil representation, not just its good unramified Frobenius polynomial.

**Hypotheses.**

- The integral operators, arbitrary-modulus congruences, common ramification set and characteristic-zero pseudocharacter continuity.

**Proof or construction.**

1. Use the known classical polarized local comparison at the sufficiently high classical weights.
2. Transfer the integral local operator eigenvalues through the uniform congruences.
3. Pass to the continuous pseudocharacter and use semisimple local recognition.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`](#ag25-varma-integral-bernstein-operators), [`AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`](#ag24-uniform-integral-hecke-congruence-witnesses), [`AutomorphicGaloisRepresentationsPartII:AG2.4/ordinary-hecke-determinant-limit`](#ag24-ordinary-hecke-determinant-limit), `IntegralHeckeAndGaloisDeterminants:IHG.4`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`](#ag25-caraiani-upgrade-away-from-p-and-temperedness).

**Sources.**

- [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), Proposition 8.1 and proof, pp. 18–20. Every required local Weil trace is included in the interpolation.

**Check.**

- Unramified Frobenius values alone do not identify ramified inertia.

<a id="ag25-published-racsdc-comparison-specializations"></a>

### Published RACSDC comparison specializations

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations` (comparison).

For the RACSDC systems, specialize the normalized away-prime compatibility to the relevant weight-zero representations of Liu et al. Proposition 3.2.4 and to BCGP25 RACSDC paragraph following equation (1.8.21). Published CS Theorem 5.5.4 supplies its polarized rank-n system and away-prime comparison; Corollary 5.5.5 treats the discrete sum separately. The p-adic WD comparison, de Rham assertions, coefficient conjugation and strong coefficient field are AG2.6 exports. Liu Hypothesis 3.2.10 is a conditional identification of a Shimura isotypic middle degree, not an unconditional realization for every π; Proposition 3.2.11’s stated range and its unpublished KSZ input are retained.

**Hypotheses.**

- Relevant means the CSD cohomological infinity type of Liu Definition 1.1.3; the chosen automorphic coefficient field and embeddings; no universal use of Hypothesis 3.2.10.

**Proof or construction.**

1. Match the relevant coefficient and weight-zero normalization with the good polynomial.
2. Apply the established polarized away-prime theorem.
3. Keep the conditional geometric identification and the p-adic comparison in their explicit requested ranges.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`](#ag25-caraiani-upgrade-away-from-p-and-temperedness), [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), [`AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization`](#ag22-cs-discrete-polarization-normalization).

**Sources.**

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 1.1.3, p. 110; Proposition 3.2.4, Hypothesis 3.2.10 and Proposition 3.2.11, pp. 145–146 (PDF pp. 4, 39–40). The geometric identification is conditional and has a restricted verification range.
- [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), Unnumbered RACSDC GL_n summary after equation (1.8.21), pp. 14–15. The unnumbered paragraph summarizes RACSDC systems; (1.8.21) labels the preceding GSp₄ equation.
- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Theorem 5.5.4, pp. 744–745. The published result is split by its away-prime and coefficient-prime dependencies.
- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Remark 5.5.6 and §5.6, pp. 746–750. The generic principal-series consequence and simple-Kottwitz variant have explicit supplier contracts.

**Check.**

- The RACSDC paragraph follows equation (1.8.21); it has no separate theorem or subsection number.
- CS discrete output has the full blockwise twists.

<a id="ag25-varma-monodromy-rank-bound"></a>

### Monodromy bounds through exterior trace identities

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound` (theorem).

For the interpolated 2n representation at a split place, WD(r(Π)_v)^{F-ss}≺rec(BC(Π)_v|det|^{(1−2n)/2}). The source detects inertial nilpotent type by all exterior-power vanishing identities for powers of b_{η,ζ}=g_η−ζa_η, and transfers the associated pseudocharacter functions B_{η,ζ}^{k,j} across the integral bound idempotent. This proves rank inequalities for every monodromy power in every inertia isotype, then Lemma 9.2 gives the Weil order.

**Hypotheses.**

- Semisimple global representation; nondegenerate trace pairing on its semisimple image algebra; all η, p-power ζ, j,k>0 of Varma Lemma 9.7; the target Bernstein idempotent.

**Proof or construction.**

1. Use Lemma 9.7 to characterize the inertia order by exterior-power annihilation and traces against all global τ.
2. Use the integral idempotent and Lemma 9.8 to impose those identities in the classical Hecke quotient.
3. Transfer the identities by arbitrary-modulus congruences and conclude using the equal semisimple Weil parts.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`](#ag25-monodromy-order-interface), [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-local-trace-congruence`](#ag25-varma-local-trace-congruence), [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`](#ag25-varma-integral-bernstein-operators), `IntegralHeckeAndGaloisDeterminants:IHG.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`.

**Sources.**

- [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), Lemma 9.7, Lemma 9.8 and proof of Proposition 9.1, pp. 24–26. The exterior trace identities establish the full inertial monodromy bound.

**Check.**

- A single rank inequality does not determine the partition order.
- The output is a bound, not equality of N.

<a id="ag25-varma-semisimplified-comparison-and-monodromy-bound"></a>

### Varma’s semisimplified comparison and monodromy bound

Target `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound` (theorem).

For E totally real or CM and regular algebraic cuspidal π on GL_n(A_E), the constructed r_{p,ι}(π) satisfies WD(r|_{G_{E_v}})^ss≅ι^−1rec(π_v|det|^{(1−n)/2})^ss for every v∤p, and WD(r|_{G_{E_v}})^{F-ss}≺ι^−1rec(π_v|det|^{(1−n)/2}). Extract the local bound from the varying-twist 2n family and then remove the split-place and auxiliary-CM restrictions by the source extension/descent argument. The comparison retains no asserted equality of monodromy for arbitrary nonselfdual π.

**Hypotheses.**

- Regular algebraic cuspidal; every v∤p; the source parameter convention and the full isotypic dominance relation.

**Proof or construction.**

1. Establish the split-place local Weil traces and nilpotent bound in the 2n ordinary family.
2. Choose a sufficiently large twist avoiding the finitely many isotypic collisions; extract the rank-n first factor and its local bound as in §10.
3. Use the auxiliary CM extensions of §11 and effective patching to recover all v∤p.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`](#ag24-hltt-construction-of-nonselfdual-systems), [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound`](#ag25-varma-monodromy-rank-bound), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization`](#ag24-hltt-factor-separation-specialization), [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching), [`AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`](#ag20-the-normalization-dictionary-fixed-by-the-sources).

**Sources.**

- [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520), Theorem (1), p. 2; Proposition 8.1 and proof, pp. 18–19; Proposition 9.1 and proof, pp. 20–26; Theorem 10.2 and Corollary 10.3, §10, pp. 26–27. The completed route gives the semisimple local comparison and the monodromy bound at all away places.

**Check.**

- A Steinberg target permits a smaller Galois monodromy under the bound; strictness is not asserted to occur in any actual automorphic example.
- Semisimplification equality does not remove N from the meaning of the separate F-ss bound.

**Remaining closure obligations.** Close integral Bernstein and inertia-family specialization, generic WD partition/purity and two-chart nearby-cycle contracts. Keep Liu’s Hypothesis 3.2.10 conditional outside the verified range. Use pure-WD uniqueness, not uniqueness from one rank.

## AG2.6: Coefficient-prime comparison and compatible families

Separate the at-coefficient-prime geometric realization, family admissibility and log-crystalline purity. AHTW’s nonselfdual all-CM branch retains its quantitative-cohomology and arbitrary-multiplicity hypotheses. Common family data and strength predicates are owned here before potential-modularity consumers.

**Planets:** All-CM coefficient-prime comparison; Compatible-family data; Compatibility strengths; Compatible-family operations; Pure polarized families.

<a id="ag26-geometric-coefficient-prime-comparison"></a>

### Comparison on the geometric automorphic summand

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison` (theorem).

For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply D_cris and D_dR to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. At good reduction the summand is crystalline; its filtered de Rham realization gives HT_τ={a_{τ,i}+n−i : 1≤i≤n}. At strictly semistable reduction use the filtered (φ,N) comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions n.

**Hypotheses.**

- AG2.1a first supplies the raw smooth proper PEL or Kuga–Sato realization, algebraic coefficient representation, cohomological degree, commuting Schur/isotypic idempotents, multiplicity and Tate twist. Its currently named attached-representation conclusion does not supply these data.
- The claimed good or strictly semistable reduction belongs to that realization and the specified local model. Comparison is applied to its cohomology before any admissibility conclusion about the attached representation.

**Proof or construction.**

1. Obtain the requested raw AG2.1a realization and projector/multiplicity/Tate dictionary independently of an attached-representation admissibility theorem.
2. Restrict the functorial geometric comparison to projector images, using strict exactness of the period functors.
3. Read each Hodge graded piece in the algebraic coefficient system; negate the supplier’s HT(ε)=+1 weights at this boundary.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`](#ag20-expected-hodge-tate-multiset), `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.5`, [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity`](#ag21a-coefficient-projector-degree-identity), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/hecke-galois-projector-commutation`](#ag21a-hecke-galois-projector-commutation), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`](#ag21b-actual-galois-constituent-from-cohomology).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7. Geometric cases, including the dual convention.

**Check.**

- For a classical weight-k base-change form the AG2 multiset is {0,k−1}.
- Projector images commute with coefficient extension; dimension equals the cohomological multiplicity times n.

<a id="ag26-all-cm-de-rham-and-semisimplified-coefficient-comparison"></a>

### Nonselfdual de Rham comparison at ℓ

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison` (theorem).

A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM F, n≥1, regular algebraic cuspidal π of highest weight a, ℓ, ι and v|ℓ, r_{π,ℓ,ι}|G_{F_v} is de Rham, has HT_τ={a_{ιτ,i}+n−i}, and WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}. Here rec^T(π_v)=rec(π_v|det|^{(1−n)/2}). No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed. This is the July 2026 preprint theorem, with its precise input chain recorded below.

**Proof or construction.**

1. Use quantitative Hecke annihilators for cohomology outside the middle degree (Theorem 2.5.7), via local Shimura cohomology and Mantovan’s formula, rather than a residual genericity assumption.
2. Use bounded potentially semistable pseudodeformation quotients for arbitrary residual multiplicities (Theorem 3.3.6).
3. Control non-Siegel boundary terms and shift interior cohomological degrees; induction on n yields the bounded torsion local–global comparison P(n,a,S,T_n) in Proposition 5.2.8.
4. After suitable cyclic base change remove the auxiliary local-degree inequalities in Proposition 5.2.8 and apply Theorem 5.2.9.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), [`AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`](#ag20-expected-hodge-tate-multiset), `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `AutomorphicGaloisRepresentationsPartII:AG2.4`, [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`](#ag24-hltt-construction-of-nonselfdual-systems).

**Sources.**

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, p.5; §1.2.3–1.2.5; Theorem 5.2.9. All regular algebraic CM cuspidal representations.

**Check.**

- Reducible residual representations are allowed.
- The result is equality after ss, not an equality of monodromy operators.

<a id="ag26-coefficient-embedding-independence-and-semisimple-uniqueness"></a>

### Embedding independence and semisimple uniqueness

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness` (theorem).

Fix π, its coefficient field M_π, λ and the embedding M_π→Q̄_ℓ attached to λ. Any two continuous semisimple n-dimensional representations of G_F with the common good geometric Frobenius polynomials P_v for v outside a finite set are isomorphic over Q̄_ℓ. Thus r_{π,ℓ,ι} depends on ι only through its restriction to M_π, up to isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different λ are compared by the common M_π-polynomials, not by identifying their topological coefficient fields.

**Proof or construction.**

1. Use Chebotarev density to extend equality from good Frobenius classes to continuous characteristic-zero traces or characteristic polynomials.
2. Apply arbitrary-rank semisimple Brauer–Nesbitt.
3. For changes of ι fixing M_π, good polynomials coincide; conclude isomorphism, retaining scalar automorphisms.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), `ArithmeticGaloisRepresentations:R01.5`, `mathlib:Matrix.charpoly_units_conj`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. The common rationality field and Frobenius data determine members.

**Check.**

- In rank one, an algebraic Hecke character is recovered.
- Scalar matrices give nonunique intertwiners even for an absolutely irreducible member.

<a id="ag26-compatible-family-data"></a>

### Compatible-family data before admissibility

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data` (definition).

Fix number fields F,M, algebraic closures and compatible embeddings used to compare labels. A rank-n compatible-family datum consists of a finite set S of finite places of F; monic degree-n polynomials P_v∈M[X] with nonzero constant term for v∉S; actual continuous semisimple representations r_λ:G_F→GL_n(algebraicClosure(M_λ)) for every finite place λ of M; and n-element multisets H_τ⊂Z for embeddings τ:F→algebraicClosure(M). Require r_λ unramified at v∉S, v∤char(k_λ), and charpoly(r_λ(Frob_v^geom)) equal to the specified image of P_v, for every compatible coefficient embedding. H_τ is metadata at this level: de Rhamness and agreement with actual labelled weights are separate predicates. Morphisms consist of the same S, polynomials and labels and memberwise equivariant isomorphisms. Enlarging S is restriction of good-place indexing, not literal equality of data. The rank-zero datum is allowed, with P_v=1, empty H and the zero-dimensional member.

**Hypotheses.**

- All members are actual representations, not just traces. Coefficient embeddings and their compatibility with λ are fixed in the label comparison.

**Proof or construction.**

1. Assemble polynomial and representation data over the ArithmeticGaloisRepresentations carriers; transport coefficient embeddings through the fixed algebraic closures.
2. Impose only common good-place polynomial compatibility; attach all period, purity and polarization conditions as predicates.
3. Use characteristic-polynomial recognition only for memberwise uniqueness up to isomorphism.

**Prerequisites:** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`, `mathlib:Representation.IsSemisimpleRepresentation`, `mathlib:AlgebraicClosure`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.1, pp.62–65. The family’s number field, polynomials, actual members and labelled weights are the data underneath weak compatibility.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1094, weakened compatibility definitions. Requires separating data from determinant-only and density-one period conditions.

**Uses determining the API.**

- AG2.6 automorphic-family assembly: One carrier supports all strength and branch predicates.
- PotentialModularityAndCompatibleSystems:R24.5: The generic family data move here to precede potential-modularity consumers.
- AutomorphicGaloisRepresentations:R19.3: Rank-two families use the same carrier.

**API.**

- `CompatibleFamilyData.member` (projection): The actual λ-representation with its continuity and semisimplicity evidence.
- `CompatibleFamilyData.frobPolynomial` (projection): The common monic polynomial and its nonzero constant coefficient.
- `CompatibleFamilyData.hodgeMetadata` (projection): The n-element multiset at every labelled embedding.
- `CompatibleFamilyData.charpolyFrob` (characterisation): For v∉S and v∤ℓ, the specified member is unramified and has the image of P_v.
- `CompatibleFamilyData.iso` (extensionality): Equality of good polynomials identifies semisimple members only up to equivariant isomorphism, never by a canonical matrix basis.
- `CompatibleFamilyData.enlargeSet` (functoriality): Keep every member and H_τ, restrict P_v; identity and nested restriction laws hold.
- `CompatibleFamilyData.changeCoefficients` (functoriality): A number-field embedding extends polynomials and labels and pulls members along the compatible local embeddings, with identity and composition up to canonical member isomorphism.

**Unit tests.**

- `CompatibleFamilyData.cyclotomic` (computation): The cyclotomic family has n=1, S=∅, P_v=X−q_v^{-1}, H_τ={−1}; arithmetic Frobenius would give q_v instead.
- `CompatibleFamilyData.zero` (degenerate): Rank zero has P_v=1 and empty H_τ; a definition requiring positive rank would exclude it.
- `CompatibleFamilyData.metadataNotAdmissibility` (non-example): Assigning wrong H_τ to the trivial family still defines raw data, but it fails weak and determinant-Hodge compatibility.
- `CompatibleFamilyData.delta` (computation): For the cohomological Δ family at q=2, P_2=X²+24X+2048 and H={11,0}.
- `CompatibleFamilyData.noncanonical` (non-example): A scalar automorphism of an irreducible member preserves every P_v; common polynomials do not choose an intertwiner or basis.

**Check.**

- The cyclotomic family has n=1, S=∅, P_v=X−q_v^{-1}, H_τ={−1}; arithmetic Frobenius would give q_v instead.
- Rank zero has P_v=1 and empty H_τ; a definition requiring positive rank would exclude it.
- Assigning wrong H_τ to the trivial family still defines raw data, but it fails weak and determinant-Hodge compatibility.
- For the cohomological Δ family at q=2, P_2=X²+24X+2048 and H={11,0}.
- A scalar automorphism of an irreducible member preserves every P_v; common polynomials do not choose an intertwiner or basis.

<a id="ag26-coefficient-hodge-comparison-through-families-and-descent"></a>

### Hodge comparison through deformation and descent

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent` (theorem).

For a conjugate-self-dual cohomological cuspidal Π over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place v_0 and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.

**Proof or construction.**

1. On the definite-unitary reduced affinoid eigenvariety, pass to a proper surjective cover carrying a locally free Galois representation (Chenevier p.23). Obtain a stable lattice after admissible blowup (Lemma 3.18); apply bounded-weight closedness at the nonvarying places (Proposition 3.17), then semisimplify the fibres. At varying places, the Sen polynomial alone is not a de Rham theorem.
2. Use S-general cyclic extensions disjoint from the finite bad cuspidality extensions; patch by intersection compatibility and invariance.
3. At a target coefficient place choose a solvable extension splitting enough other places, then descend the period comparison and recover its filtration.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`](#ag26-geometric-coefficient-prime-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`](#ag23-definite-unitary-eigenvariety-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`](#ag23-definite-family-determinant-interpolation), [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching), [`AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction`](#ag23-solvable-index-induction), `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/completed-base-change`, `PadicHodgeTheory:R06.2/de-rham-base-change`, `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `PadicHodgeTheory:R06.2`.

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3; §3.1; Theorem 3.2.3, pp.8–12. Other coefficient places first; cyclic patching removes the exclusion.
- [Une application des variétés de Hecke des groupes unitaires](https://www.imj-prg.fr/fa/bpFiles/Chenevier.pdf), Propositions 3.16–3.17, Lemma 3.18 and Corollary 3.19, pp.22–24. After a proper surjective realization cover of an affinoid pseudocharacter, bounded fixed-weight period conditions extend across the reduced family; the varying-weight places initially yield only Sen/Hodge–Tate information.

**Check.**

- The place v_0 is absent from Theorem 2.3’s de Rham claim and present in Theorem 3.2.3.
- The labelled multiset, not only its sum, survives descent.

<a id="ag26-log-crystalline-purity-on-the-automorphic-summand"></a>

### Log-crystalline purity of the automorphic summand

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand` (theorem).

In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the Π-isotypic log-crystalline summand realizing the tensor-square representation is pure as a WD representation (Proposition 5.1). Use the two-index strata Y^(r,s) and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of N. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.

**Hypotheses.**

- The separate AG2.1a tensor-square realization includes the two distinguished coefficient-prime places, the closed two-index strata, cohomological multiplicity and coefficient-system projector/Tate twist. Its projected stratum concentration is proved before degeneration and purity are inferred.
- The log model used for comparison is proper, fine and saturated, log smooth and vertical over the standard log DVR, with special fiber of Cartier type. The second boundary uses its own divisors and s factors. With m smooth local coordinates, a nonempty (i,j)-stratum has dimension 2n+m−i−j; carry this dimension and the Kuga–Sato/Tate shifts into the spectral sequence.

**Proof or construction.**

1. Use the actual tensor-square cohomological realization and projector in §§2 and 5.
2. Apply the two-boundary log de Rham–Witt spectral sequence, including N realized by the residue operator.
3. Compare closed-stratum crystalline and étale cohomology; projected concentration along i=2n−2 gives degeneration and pure graded pieces.
4. Recover purity on the automorphic summand through the monodromy filtration.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`](#ag26-geometric-coefficient-prime-comparison), `CrystallineCohomology:CR.6`, `WeightsInEtaleCohomology:R34.6`, `AutomorphicGaloisRepresentationsPartII:AG2.1a`.

**Sources.**

- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683), §§2–4; Theorem 4.6, Remark 4.7, Proposition 5.1, pp.31–32. The projected two-boundary spectral sequence supplies purity.
- [Monodromy and local-global compatibility for l = p (published version)](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf), §3A, pp.1609–1611, including Lemma 3.2; comparison hypotheses immediately before Corollary 2.3, p.1609. Specifies the log comparison domain and both independent boundary directions; E6–E8 record corrected indices and the dimension contribution of the smooth coordinates.

**Check.**

- Keep both stratum indices; a one-divisor Rapoport–Zink sequence is not the required input.
- A mixed cohomological summand without the concentration theorem does not pass the purity test.

<a id="ag26-nonselfdual-coefficient-prime-monodromy-bound"></a>

### Nonselfdual monodromy bound at ℓ

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound` (theorem).

Under the preceding theorem, WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v). Equality of the semisimplified Weil representations comes from the preceding comparison theorem, not from the definition of the order. The order compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-i sum on the left is ≤ the corresponding sum on the right. It is Varma’s order of §8.2, used in AHTW Definition 6.0.2. Full equality of N is not asserted for a general nonselfdual ramified π_v.

**Proof or construction.**

1. Use the ss equality from Theorem 1.2.1.
2. Local genericity of a cuspidal global π implies its local rec^T parameter is generic in the WD sense Hom_WD(D,D(1))=0.
3. Apply Proposition 6.0.5 and Corollary 6.0.6: its monodromy is maximal in the fixed-Weil-parameter space.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`](#ag26-all-cm-de-rham-and-semisimplified-coefficient-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`](#ag25-varma-semisimplified-comparison-and-monodromy-bound), [`AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`](#ag25-monodromy-order-interface).

**Sources.**

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Corollary 1.2.2, p.6; Definitions 6.0.1–4, Corollary 6.0.6, pp.111–112. Generic local GL_n parameters occupy the maximal monodromy orbit.

**Check.**

- Two parameters with the same Weil semisimplification and different N can satisfy a strict inequality.
- WD genericity here is a characteristic-zero Hom condition, not AG2.7 residual genericity.

<a id="ag26-complex-and-local-coefficient-conjugation"></a>

### Complex and local coefficient conjugation

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation` (theorem).

For RAESDC π over totally real F or RAECSDC π over CM F, σ∈Aut(C), r_{σπ,ι}≅r_{π,σ⁻¹ι}. If σ_ℓ∈Gal(Q̄_ℓ/Q_ℓ) and σ=ισ_ℓι⁻¹, then σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}. Coefficient conjugation acts on matrix entries; the absolute Galois group G_F is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.

**Proof or construction.**

1. Use rationality and conjugation of finite automorphic components from Clozel’s theorem.
2. Conjugate every good Satake polynomial and compare through σ⁻¹ι.
3. Apply semisimple uniqueness; the local formula follows by taking σ=ισ_ℓι⁻¹.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`](#ag26-coefficient-embedding-independence-and-semisimple-uniqueness), [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), `AutomorphicFormsOnReductiveGroups:AF.4`.

**Sources.**

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem 5.1 and Lemma 5.2, p.38, footnote 4. Both complex and local coefficient automorphisms, with inverse orientation.

**Check.**

- σ=id gives the same isomorphism class.
- Composition gives σ_ℓτ_ℓ(r)≅σ_ℓ(τ_ℓ(r)), not a pullback on G_F.

<a id="ag26-strong-coefficient-field"></a>

### Strong coefficient field

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field` (definition).

For Π regular cohomological cuspidal conjugate-self-dual (including Liu’s relevant specialization with archimedean principal series arg^{1−n},arg^{3−n},…,arg^{n−1}) and a number field E⊂C containing Q(Π), E is a strong coefficient field if for each finite λ of E there exists a continuous E_λ-linear ρ_{Π,λ} whose scalar extension to Q̄_ℓ is ρ_{Π,ι} for every ι inducing λ. Members are unique up to E_λ-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners. This generalizes Liu’s named definition beyond its relevant specialization, using the simultaneous realization condition justified by Chenevier–Harris Proposition 3.2.5; Liu’s conditional minimal-field assertion remains confined to his specialization and Hypothesis 3.2.10.

**Proof or construction.**

1. Define the simultaneous realization condition on the supplier’s family, keeping the embedding compatibility.
2. Use descent/uniqueness only after scalar extension; record E_λ-linear conjugacy as the equivalence relation.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`](#ag26-coefficient-embedding-independence-and-semisimple-uniqueness), [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), `ArithmeticGaloisRepresentations:R01.5`.

**Sources.**

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 3.2.5 and Remark 3.2.6, printed p.145. A simultaneous field of definition, distinguished from Q(Π).
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, author-copy p.12. Justifies the broader regular cohomological domain used by the following uniform-realization theorem.

**Uses determining the API.**

- Liu et al., §3.2 and Appendix D: Defines λ-members and integral reductions simultaneously.
- AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi: Uniform field of definition can precede every local lattice choice.

**API.**

- `TauCeti.AutomorphicGalois.IsStrongCoefficientField` (characterisation): The preceding all-λ realization property.
- `TauCeti.AutomorphicGalois.strongCoefficientField_member` (data): Choose an E_λ-realization with its scalar-extension isomorphism.
- `TauCeti.AutomorphicGalois.strongCoefficientField_baseChange` (functoriality): For E′/E finite, each λ′-member is E′_λ′⊗_{E_λ}ρ_{Π,λ}, with the identity and composition laws.
- `TauCeti.AutomorphicGalois.strongCoefficientField_unique` (extensionality): Descended semisimple members are unique up to conjugacy, not as based homomorphisms.

**Unit tests.**

- `TauCeti.AutomorphicGalois.strongCoefficientField_character` (degenerate): A rank-one character whose values lie in E has the expected E_λ-realizations.
- `TauCeti.AutomorphicGalois.strongCoefficientField_extension` (compatibility): Changing E to a finite extension gives exactly the supplier’s coefficient base-change operation at every λ′.
- `TauCeti.AutomorphicGalois.strongCoefficientField_not_rationality` (non-example): The definition does not identify rational Frobenius traces with a canonical E_λ-model; a nontrivial Schur obstruction must be split.
- `TauCeti.AutomorphicGalois.strongCoefficientField_scalar_intertwiner` (characterisation): Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class.

**Check.**

- Containing Q(Π) is necessary, not by itself sufficient.
- Q(Π) being strong under Hypothesis 3.2.10 remains conditional.

<a id="ag26-rank-two-comparison-with-r19"></a>

### Rank-two compatible-family comparison

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19` (comparison).

Given an independently supplied family of continuous semisimple rank-two representations of the same regular classical or Hilbert eigenform, compare each coefficient-prime member with the AG2 family by the AG2.5 memberwise comparison. After the specified coefficient embeddings and extensions, the memberwise isomorphisms identify the common normalized good polynomials P_v and the labelled Hodge multisets H_τ whenever the supplied family proves those Hodge assertions. In the classical regular weight-k convention, k≥2, the geometric AG2 members are the duals of the arithmetic Deligne members. Hilbert parity and half-integer normalization remain those of the independent theorem. This comparison supplies no canonical choice of intertwiners, no common strong realization field unless independently provided, and no additional local property. The later R19 construction may use this comparison; its existence theorem is not an input to AG2.

**Hypotheses.**

- An independent rank-two family with the specified coefficient embeddings and semisimple members exists, and its converted good polynomials agree with the AG2 family for every coefficient place outside the finite exceptional sets.
- Any comparison of Hodge multisets, local properties or a common strong realization field assumes that assertion for the independent family. Retain the classical k≥2 range, or the precise regular Hilbert parity and normalization.

**Proof or construction.**

1. Apply the AG2.5 conditional rank-two comparison separately at each coefficient place after the specified scalar extensions.
2. Use the common P_v metadata of compatible-family data to identify the good-polynomial package; identify H_τ only under the stated Hodge hypothesis.
3. Transport only the independently supplied local or realization assertions, leaving choices of memberwise intertwiners unprivileged.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`](#ag25-late-gl2-modular-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`](#ag26-compatible-system-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`](#ag26-coefficient-embedding-independence-and-semisimple-uniqueness).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 3.2.3 and §4, Hypotheses 4.1 and Theorem 4.2, pp.10–13. Memberwise attachment and conditional rank-two overlap; the family comparison here is a consequence of these memberwise results, not an additional theorem asserted by the source.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. Common-polynomial compatible-family assembly and the separate very-weak compatibility range; this does not supply an independent R19 family.

**Check.**

- At each λ the same normalized P_v is obtained after coefficient extension; for classical k=2, the geometric member has Hodge multiset {0,1} when the independent family proves it.
- Finite-image weight-one systems do not enter the regular k≥2 comparison.
- Memberwise isomorphism does not canonically choose bases or imply a common strong coefficient field.

<a id="ag26-compatibility-strength-predicates"></a>

### Weak, very weak and extremely weak compatibility

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates` (definition).

On compatible-family data define Weak: every r_λ is de Rham at every v|ℓ, its labelled HT multiset is H_τ for every compatible coefficient embedding, and it is crystalline at v|ℓ outside S. Define ExtremelyWeak: det r_λ is de Rham at every v|ℓ with labelled HT weight Σ H_τ for all λ. Define VeryWeak: ExtremelyWeak and a set of rational primes of Dirichlet density one such that for every λ above one of these primes, every v|ℓ is crystalline with the full labelled multiset H_τ. This density-one set can omit the finitely many rational characteristics below S. Then Weak implies VeryWeak implies ExtremelyWeak. Neither weakened predicate asserts admissibility of each rank-n member at every coefficient prime. Genericity or residual irreducibility is not a field of any of these predicates.

**Hypotheses.**

- Use geometric Frobenius and HT(ε)=−1 throughout. Density is on rational coefficient primes and quantifies every λ above them, not one selected λ.

**Proof or construction.**

1. Define the determinant-Hodge condition and the independent density-one crystalline/full-weight condition.
2. For Weak⇒VeryWeak omit the finite set of rational primes below S and use compatibility of D_dR with determinants.
3. For VeryWeak⇒ExtremelyWeak forget the density-one clause; no limiting Hodge assertion is used.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.3`, `ArithmeticGaloisRepresentations:R01.5`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.1, pp.62–65. Supplies all-member de Rham/full-weight and outside-S crystalline weak compatibility.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1094, definitions and Lemmas 7.1.9–7.1.10. Separates weakened determinant-Hodge data from density-one full crystalline data.

**Uses determining the API.**

- AG2.6/compatible-system-of-pi: The all-CM comparison supplies Weak without residual genericity.
- ACC+ Lemmas 7.1.9–7.1.10: Their arithmetic proof supplies a weaker predicate and is not used backwards in the all-CM construction.

**API.**

- `CompatibleFamilyData.IsWeak` (characterisation): All-member de Rham, common full Hodge multisets and outside-S coefficient-prime crystallinity.
- `CompatibleFamilyData.IsVeryWeak` (characterisation): ExtremelyWeak plus the rational density-one, all-λ crystalline/full-weight condition.
- `CompatibleFamilyData.IsExtremelyWeak` (characterisation): All-member determinant de Rhamness with labelled sums.
- `CompatibleFamilyData.weakToVeryWeak` (relation): Weak⇒VeryWeak for the same raw data, removing finitely many coefficient characteristics.
- `CompatibleFamilyData.veryWeakToExtremelyWeak` (relation): VeryWeak⇒ExtremelyWeak by forgetting a clause.
- `CompatibleFamilyData.strengthUnderEnlargeSet` (functoriality): Enlarging S preserves each predicate and leaves members and labels unchanged.

**Unit tests.**

- `CompatibleStrength.cyclotomic` (computation): ε is weak, very weak and extremely weak, with labelled weight −1.
- `CompatibleStrength.zero` (degenerate): Rank zero satisfies all three conditions, with determinant 1 of weight zero.
- `CompatibleStrength.determinantNotWeights` (non-example): In rank two H={0,2} and H′={1,1} have the same determinant weight but different full labelled multisets.
- `CompatibleStrength.allLambda` (non-example): A density-one claim for one chosen λ above each ℓ is weaker than the required statement for every λ above those ℓ.

**Check.**

- ε is weak, very weak and extremely weak, with labelled weight −1.
- Rank zero satisfies all three conditions, with determinant 1 of weight zero.
- In rank two H={0,2} and H′={1,1} have the same determinant weight but different full labelled multisets.
- A density-one claim for one chosen λ above each ℓ is weaker than the required statement for every λ above those ℓ.

<a id="ag26-extremely-weakly-compatible-system"></a>

### Weak, very weak and extremely weak automorphic data

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system` (comparison).

Use compatible-family-data and compatibility-strength-predicates on one raw carrier. Weak, VeryWeak and ExtremelyWeak are successively weaker predicates with the exact all-member, determinant and rational-density quantifiers defined there. There is no conditional R24 carrier and no full weak-admissibility field hidden in raw data. The weakening maps preserve the actual members and common polynomials.

**Proof or construction.**

1. Use the raw carrier defined here before potential modularity.
2. Apply Weak⇒VeryWeak⇒ExtremelyWeak on the same data; no residual genericity assumption is needed for this implication.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates`](#ag26-compatibility-strength-predicates).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1086. These are imported predicates on one carrier.

**Check.**

- For n=2 the lists {0,3} and {1,2} have the same determinant sum and are distinguished by weak compatibility.
- Rank-one extremely weak data become weak through the supplier’s algebraic-character classification.

<a id="ag26-polarized-branch-de-rham-and-crystalline"></a>

### Polarized admissibility at the coefficient prime

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline` (theorem).

Let F be CM and (π,χ) regular algebraic cuspidal polarized of weight a. For every λ|ℓ and v|ℓ, r_{π,λ}|G_{F_v} is de Rham with HT_τ={a_{τ,i}+n−i}. If π_v is spherical it is crystalline; if π_v has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4) gives full Frobenius-semisimple WD comparison with rec(π_v|det|^{(1−n)/2}). The full comparison for general π_v is the separate Caraiani theorem below.

**Proof or construction.**

1. Use the Chenevier–Harris descent theorem for Hodge admissibility.
2. Apply geometric semistable/crystalline comparison in the Iwahori/spherical cases.
3. Keep the proof order: the geometric Iwahori case precedes Caraiani’s general full-monodromy argument.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`](#ag26-coefficient-hodge-comparison-through-families-and-descent), [`AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`](#ag20-expected-hodge-tate-multiset), [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`](#ag20-polarized-galois-representation), `PadicHodgeTheory:R06.3/weil-deligne-parameter`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(3)–(4), pp.33–34. Admissibility and the Iwahori comparison.

**Check.**

- An unramified local component has N=0 and the expected crystalline polynomial.
- An Iwahori component may have N≠0; semistable does not mean crystalline.

<a id="ag26-all-cm-crystalline-and-iwahori-corollary"></a>

### Nonselfdual spherical and Iwahori admissibility

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary` (theorem).

For arbitrary regular algebraic cuspidal π over a CM field, r_{π,λ}|G_{F_v} is crystalline when v|ℓ and π_v is spherical, and is semistable when π_v has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the rec^T Satake polynomial. Proof: de Rham implies potentially semistable; ss compatibility gives trivial WD inertia for Iwahori π_v, and the monodromy bound against N=0 forces N=0 in the spherical case. Iwahori semistability does not establish full monodromy equality.

**Proof or construction.**

1. Apply the p-adic monodromy theorem.
2. A finite inertia action in characteristic zero is semisimple; triviality of its semisimplification therefore gives trivial inertia.
3. For spherical π_v all Jordan blocks on the upper bound have size one, so the dominance order forces N=0.
4. Apply the supplier’s semistable/crystalline criterion and Frobenius comparison.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`](#ag26-all-cm-de-rham-and-semisimplified-coefficient-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`](#ag26-nonselfdual-coefficient-prime-monodromy-bound), `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/weil-deligne-descent`.

**Sources.**

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. Admissibility is a consequence using the imported WD criteria.

**Check.**

- An Iwahori parameter may retain nonzero N.
- No Fontaine–Laffaille weight range or residual genericity is required.

<a id="ag26-compatible-family-operations"></a>

### Operations on compatible-family data

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations` (construction).

For families over the same F, first extend coefficient fields to a common number field and enlarge S to the union. Define direct sum, tensor, dual, conjugation by an automorphism c of F, restriction to a finite extension, and tensoring by an algebraic-character family on actual members and on H_τ. Direct sums concatenate H, tensor products use all pairwise sums, dual negates H and inverts polynomial roots. Good P_v are the corresponding characteristic polynomials (for a tensor product use the universal resultant expression, not multiplication of P_v). Weak, VeryWeak and ExtremelyWeak are preserved by these operations, with rational density-one intersections where needed; regularity, irreducibility and cuspidal automorphy require separate hypotheses. Restriction at w|v replaces good roots α by α^{f(w/v)}. Semisimplify members when necessary in the characteristic-zero family category and use its polynomial invariance.

**Hypotheses.**

- Continuous finite-dimensional semisimple characteristic-zero member theory and common embeddings; scalar extension and tensor semisimplicity are supplied by R01.1, not by an arbitrary positive-characteristic tensor assertion.

**Proof or construction.**

1. Apply each functor to actual members and transport continuity; compute good polynomials universally from their roots or characteristic polynomials.
2. Apply the corresponding multiset operation to the H labels and prove identity/composition up to memberwise isomorphism.
3. Use tensor exactness of period functors and determinant formulas for the three strength predicates; retain separate conditions for the branch predicates.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates`](#ag26-compatibility-strength-predicates), `ArithmeticGaloisRepresentations:R01.1`, `PadicHodgeTheory:R06.2`, `mathlib:Matrix.charpoly_map`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.1, pp.62–65. Provides system operations and the conditional preservation statements.
- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §5.1, Lemma 5.2 and proof of Lemma 5.8, pp.38,42–44. Uses coefficient conjugation and tensor operations on actual systems.

**Uses determining the API.**

- AG2.2 discrete assembly and AG2.7/unitary-discrete-parameter-export: Direct sums and character twists retain actual constituent labels.
- AG2.6/tensor-automorphy-independent-of-coefficient-embedding: The operation preserves family polynomials; it does not by itself prove automorphy.
- PotentialModularityAndCompatibleSystems:R24.5: Imports the operation carrier and proves its additional potential-automorphy theorems.

**API.**

- `CompatibleFamilyData.directSum` (constructor): Members are direct sums, P_v multiply and H concatenate.
- `CompatibleFamilyData.tensor` (constructor): Members tensor; roots multiply pairwise, and H add pairwise.
- `CompatibleFamilyData.dual` (functoriality): Members dualize; H negate; P_v^dual=C(P_v(0)^{-1})·reflect_n(P_v).
- `CompatibleFamilyData.restrict` (functoriality): Restriction has root α^{f(w/v)} at w and H labelled by restriction of embeddings; identity and tower laws hold.
- `CompatibleFamilyData.twist` (constructor): Tensor with the character family; all good roots scale by its root and all H shift by its labelled weight.
- `CompatibleFamilyData.operationsPreserveStrength` (compatibility): Each functor preserves Weak, VeryWeak and ExtremelyWeak under the stated common-field and finite-set conventions.
- `CompatibleFamilyData.tensorSymmetry` (equivalence): Associativity, symmetry and unit equivalences are the actual representation equivalences and agree on P and H.

**Unit tests.**

- `CompatibleOperations.tensorNotProduct` (non-example): Tensoring two rank-two families gives rank four; multiplying their polynomials instead describes the direct sum.
- `CompatibleOperations.dualCyclotomic` (computation): The dual cyclotomic family has P_v=X−q_v and H={1}.
- `CompatibleOperations.zero` (degenerate): Tensor with rank zero has rank zero and P_v=1; direct sum with rank zero preserves members up to canonical isomorphism.
- `CompatibleOperations.tensorTrivial` (computation): The rank-two trivial family tensored with itself has polynomial (X−1)^4, H={0,0,0,0}; it is neither regular nor irreducible.
- `CompatibleOperations.restriction` (compatibility): At an unramified residue-degree-two extension, X−q_v^{-1} becomes X−q_v^{-2}, agreeing with the cyclotomic family over the extension.

**Check.**

- Tensoring two rank-two families gives rank four; multiplying their polynomials instead describes the direct sum.
- The dual cyclotomic family has P_v=X−q_v and H={1}.
- Tensor with rank zero has rank zero and P_v=1; direct sum with rank zero preserves members up to canonical isomorphism.
- The rank-two trivial family tensored with itself has polynomial (X−1)^4, H={0,0,0,0}; it is neither regular nor irreducible.
- At an unramified residue-degree-two extension, X−q_v^{-1} becomes X−q_v^{-2}, agreeing with the cyclotomic family over the extension.

<a id="ag23-finite-number-field-of-realization"></a>

### A common finite field of realization in the polarized range

Target `AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization` (theorem).

For the CH polarized π, there is a number field E(π) containing its trace field such that every coefficient-prime representation has a model over E(π)_λ. Obtain two auxiliary good Frobenius polynomials with n distinct roots and distinct residue characteristics, adjoin their roots to the trace field, and use R01.5 rational-eigenvalue descent at a place away from each coefficient prime. This is a field of realization, not an assertion that the minimal trace field itself is sufficient.

**Hypotheses.**

- CH regular de Rham/Hodge–Tate input used by the Serre Zariski-closure argument; uniform good polynomials and their number field; two auxiliary residue characteristics.

**Proof or construction.**

1. Use the labelled regular Hodge–Tate weights to find a regular-semisimple element in the algebraic monodromy group.
2. Use openness and Frobenius density to choose two good distinct-root places.
3. Adjoin the roots and apply the exact generic rational-eigenvalue descent theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`](#ag21a-polarized-construction-inputs-shin-and-chenevier-harris), [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), `ArithmeticGaloisRepresentations:R01.5/rational-eigenvalue-descent`, `PadicHodgeTheory:R06.2`, [`AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`](#ag26-polarized-branch-de-rham-and-crystalline).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5 and proof, p. 12. The explicit auxiliary-prime/root construction supplies a common number field.

**Check.**

- Two residue characteristics ensure at least one usable auxiliary place for every coefficient prime.
- A trace field need not be a realization field because of Schur index.

<a id="ag26-full-polarized-comparison-at-the-coefficient-prime"></a>

### Full polarized local–global compatibility at ℓ

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime` (theorem).

For n≥2, a conjugate-self-dual cohomological cuspidal Π over CM F, any ℓ, ι and v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2}) with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The theorem has no Shin-regularity condition; it uses purity of the geometric summand, temperedness and the pure-parameter uniqueness theorem. Rank one is supplied by algebraic local class field theory.

**Proof or construction.**

1. Twist to the conjugate-self-dual branch and take solvable local base change to an Iwahori situation.
2. Use log-crystalline purity of the tensor-square realization and the established temperedness theorem.
3. Apply Taylor–Yoshida pure WD uniqueness to the known semisimplification, then descend and undo the character twist.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`](#ag26-polarized-branch-de-rham-and-crystalline), [`AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`](#ag26-log-crystalline-purity-on-the-automorphic-summand), [`AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`](#ag22-algebraic-character-polarization-twist), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`](#ag25-caraiani-upgrade-away-from-p-and-temperedness), [`AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`](#ag25-pure-weil-deligne-comparison), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683), Theorem 1.1, pp.1–2; §§2 and 5. Equality includes N, including even non-Shin-regular weights.

**Check.**

- A Steinberg parameter retains its nonzero N.
- The even-rank non-Shin-regular case is included.

<a id="ag26-tensor-automorphy-independent-of-coefficient-embedding"></a>

### Coefficient independence of tensor automorphy

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding` (theorem).

Let π_1 and σ be RAESDC over a totally real F. Suppose r_{π_1,ι}⊗r_{σ,ι} is irreducible and automorphic for one (ℓ,ι), in the RAESDC sense used by Newton–Thorne. Then r_{π_1,j}⊗r_{σ,j} is automorphic for every prime q and j:Q̄_q≅C. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.

**Proof or construction.**

1. Choose the RAESDC automorphic realization at the initial coefficient embedding and conjugate it so its good polynomials match those of the tensor product in C.
2. Use the λ-independent tensor operation on the supplier carrier.
3. At each (q,j) compare good polynomials and apply arbitrary-rank semisimple uniqueness.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`](#ag26-complex-and-local-coefficient-conjugation), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`](#ag26-coefficient-embedding-independence-and-semisimple-uniqueness), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations).

**Sources.**

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Lemma 5.8, pp.42–44, cf. proof of Lemma 2.1. The same coefficient-conjugation argument applies to an automorphic tensor product.

**Check.**

- The identity coefficient embedding recovers the given automorphic representation.
- No residual genericity is introduced by changing j.

<a id="ag26-system-purity-and-polarization"></a>

### Purity, strict compatibility and polarized families

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/system-purity-and-polarization` (definition).

Define separate predicates on compatible-family data. Regular means every H_τ is without repetition. Pure of integral weight W means |ι(α)|²=q_v^W for every good root and every complex embedding, and H_{cτ}={W−h:h∈H_τ} when F is CM (the analogous same-embedding symmetry when F is totally real). BLGGT StrictCompatible means for every finite v a common algebraic WD parameter D_v with WD(r_λ|G_{F_v})^{F-ss}≅D_v at λ not above the residue characteristic of v. StrictPure adds WD purity of weight W for every D_v. AllPlaceStrict adds comparison at coefficient-prime places using D_pst for potentially semistable members. A polarization is a character family μ over F^+ and actual memberwise conjugate-dual identifications with the symmetry/oddness condition of G7; the pair convention is r_λ^c≅r_λ^∨⊗μ_λ. These structures are not included in raw data or Weak, and pure WD objects are owned by AG2.5 rather than redeveloped here.

**Hypotheses.**

- F is CM or totally real where conjugation/polarization is invoked. Finite inertial Weil image and Frobenius semisimplification are part of each WD input.

**Proof or construction.**

1. Define good-root purity, labelled symmetry, and common local-parameter predicates separately.
2. Use the AG2.5 pure-WD interface and the G7 pairing API; no maximal-rank characterization of pure N is assumed.
3. Relate AllPlaceStrict to BLGGT strictness by forgetting coefficient-prime comparisons.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations), `ArithmeticGaloisRepresentations:G7`, `ArithmeticGaloisRepresentations:R01.2`, [`AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`](#ag25-pure-weil-deligne-comparison), `DeligneWeightsAndPurity:DWP.0`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, pp.31–34; §5.1, pp.62–65. Defines the pair convention, purity, away-coefficient strict compatibility and the separate system predicates.
- [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357), §1, pp.3–7, Lemma 1.4. Supplies pure WD uniqueness, retaining all monodromy data.

**Uses determining the API.**

- AG2.6/polarized-compatible-system-strictly-pure: Instantiates these predicates only after the polarized local comparison.
- PotentialModularityAndCompatibleSystems:R24.5: Imports the early system predicates and adds its irreducibility/potential automorphy results.

**API.**

- `CompatibleFamilyData.IsRegular` (characterisation): No repetition in any labelled Hodge multiset.
- `CompatibleFamilyData.IsPure` (characterisation): All good roots have weight W and the labelled conjugation symmetry holds.
- `CompatibleFamilyData.IsStrictCompatible` (characterisation): Common F-ss WD parameters at every v for coefficient primes away from v.
- `CompatibleFamilyData.IsStrictPure` (characterisation): StrictCompatible together with purity of every local WD parameter.
- `CompatibleFamilyData.IsAllPlaceStrict` (characterisation): The same common D_v also matches the potentially semistable coefficient-prime WD parameters.
- `CompatibleFamilyData.Polarization` (structure): The multiplier character family, actual conjugate-dual identifications and G7 symmetry condition.
- `CompatibleFamilyData.allPlaceToStrict` (relation): Forgetting the coefficient-prime comparisons gives BLGGT StrictCompatible.

**Unit tests.**

- `CompatiblePurity.cyclotomic` (computation): ε is pure of weight −2, with H={−1}; replacing geometric q^{-1} by q would give the wrong sign of the weight.
- `CompatiblePurity.trivialPair` (non-example): 1⊕1 is pure of weight zero but not regular or irreducible.
- `CompatiblePurity.weilPartInsufficient` (non-example): For an integer q>1, with geometric F=diag(1,q), both N=0 and N=e_12 satisfy FNF^{-1}=q^{-1}N; only the Steinberg monodromy has its pure weight-one structure. Good or ss Weil data do not choose N.
- `CompatiblePurity.strictNotAllPlace` (characterisation): The definition of BLGGT StrictCompatible quantifies λ away from v, so a coefficient-prime equality requires AllPlaceStrict evidence.

**Check.**

- ε is pure of weight −2, with H={−1}; replacing geometric q^{-1} by q would give the wrong sign of the weight.
- 1⊕1 is pure of weight zero but not regular or irreducible.
- With geometric F=diag(1,q), both N=0 and N=e_12 satisfy FNF^{-1}=q^{-1}N; only the Steinberg monodromy has its pure weight-one structure. Good or ss Weil data do not choose N.
- The definition of BLGGT StrictCompatible quantifies λ away from v, so a coefficient-prime equality requires AllPlaceStrict evidence.

<a id="ag26-totally-real-polarized-coefficient-prime-descent"></a>

### Totally real polarized coefficient-prime descent

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent` (theorem).

For a regular algebraic essentially self-dual cuspidal π over a totally real F, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.

**Proof or construction.**

1. Use the totally-real attached representation from AG2.0 and BLGGT.
2. Choose a cuspidality-preserving quadratic CM extension split at the prescribed finite place and identify the restrictions by their good polynomials.
3. Apply the full polarized CM coefficient-prime theorem at the unchanged local field and transport its Hodge/WD data.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), [`AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`](#ag20-expected-hodge-tate-multiset), [`AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`](#ag26-full-polarized-comparison-at-the-coefficient-prime), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`](#ag26-coefficient-hodge-comparison-through-families-and-descent), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §2.1 terminology. The source allows CM or totally real polarized fields.

**Check.**

- The completion at the selected place is unchanged by split base change.
- Rank-two Hilbert specialization follows from the generic CM split-place descent. An independently supplied modular or Hilbert realization is compared by its normalized good polynomials.

<a id="ag26-uniform-strong-realization-for-polarized-systems"></a>

### Uniform strong realization of polarized systems

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems` (theorem).

For a conjugate-self-dual cohomological cuspidal Π over CM F, there is one finite number field E⊂C which is a strong coefficient field for all λ. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field E_0 of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each λ can use one place away from ℓ; a split regular Frobenius and E_0-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.

**Proof or construction.**

1. Regular Hodge–Tate weights give a regular semisimple element in the algebraic monodromy group.
2. Choose two good regular Frobenius elements of different residue characteristics by Chebotarev.
3. Adjoin their eigenvalues to E_0 and apply the splitting/descent argument at each λ.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`](#ag26-polarized-branch-de-rham-and-crystalline), [`AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`](#ag26-strong-coefficient-field), `ArithmeticGaloisRepresentations:R01.5`, [`AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`](#ag23-finite-number-field-of-realization).

**Sources.**

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, p.12. Uniform realization follows from two regular Frobenius elements.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Remark 3.2.6, printed p.145. Existence is separate from conditional minimal-field rationality.

**Check.**

- Both good places are needed so one lies away from each coefficient prime.
- Hypothesis 3.2.10 is not used for the existence of an enlarged E.

<a id="ag26-coefficient-prime-branch-and-what-it-does-not-give"></a>

### Comparison strength at the coefficient prime

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-prime-branch-and-what-it-does-not-give` (comparison).

The polarized branch has de Rham admissibility and full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1; spherical crystallinity and Iwahori semistability follow from WD criteria. Full N equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.

**Proof or construction.**

1. Compare the exact outputs without upgrading a bound to equality.
2. Retain the branch tag on each arithmetic export.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`](#ag26-full-polarized-comparison-at-the-coefficient-prime), [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`](#ag26-all-cm-crystalline-and-iwahori-corollary), [`AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`](#ag26-nonselfdual-coefficient-prime-monodromy-bound).

**Sources.**

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. Separate ss equality and N bound.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683), Theorem 1.1, pp.1–2. The polarized theorem identifies N.

**Check.**

- A ramified nonselfdual member cannot be passed to a full-WD consumer without an additional theorem.
- Crystallinity at good places is sufficient for the imported weak predicate.

<a id="ag26-compatible-system-of-pi"></a>

### Compatible system attached to π

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi` (construction).

For regular algebraic cuspidal π of GL_n(A_F), with F CM, or F totally real and π polarized, assemble R_π on compatible-family-data: coefficient field M_π from the finite-part rationality theorem, finite ramification set S_π, normalized common good polynomials P_v, actual continuous semisimple λ-members, and H_τ={a_{τ,i}+n−i}. The all-CM coefficient-prime theorem, or its totally-real polarized counterpart, proves Weak on these data. Purity, polarization and strict local compatibility are separate branch predicates.

**Proof or construction.**

1. Construct the raw family defined in this roadmap; it does not import the subsequent potential-modularity carrier.
2. Fix the finite rationality field and finite ramification set from AG2.0.
3. Install every λ-member and P_v using good-place compatibility and embedding independence.
4. Read the labelled Hodge multisets from the coefficient-prime theorem and prove the weak predicate.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), [`AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`](#ag20-frobenius-polynomial-and-conventions), [`AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`](#ag20-expected-hodge-tate-multiset), [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`](#ag26-coefficient-embedding-independence-and-semisimple-uniqueness), [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`](#ag26-all-cm-crystalline-and-iwahori-corollary), [`AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`](#ag26-totally-real-polarized-coefficient-prime-descent), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates`](#ag26-compatibility-strength-predicates).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. Construct the automorphic data; stronger admissibility is supplied separately.
- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, pp.5–6. Upgrades the all-CM instance to weak compatibility.

**Uses determining the API.**

- PotentialAutomorphyInfrastructure:PA.0: Supplies the fixed automorphic members and their normalization, before deformation or lifting.
- PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems: Allows tensor, dual and algebraic-character operations on the same carrier.

**API.**

- `TauCeti.AutomorphicGalois.compatibleSystem` (constructor): Map π to R_π in the supplier carrier.
- `TauCeti.AutomorphicGalois.compatibleSystem_member` (projection): The λ-member after embedding is r_{π,ℓ,ι}, up to isomorphism.
- `TauCeti.AutomorphicGalois.compatibleSystem_goodPolynomial` (simp): At v outside S_π, the common polynomial is P_v(X).
- `TauCeti.AutomorphicGalois.compatibleSystem_hodgeTate` (data): The labelled multiset is {a_{τ,i}+n−i}, including multiplicities.
- `TauCeti.AutomorphicGalois.compatibleSystem_weak` (compatibility): R_π satisfies the R24.5 weak predicate, with explicit normalization conversion.
- `TauCeti.AutomorphicGalois.compatibleSystem_embedding` (extensionality): Two ι inducing the same λ on M_π give isomorphic members.

**Unit tests.**

- `TauCeti.AutomorphicGalois.compatibleSystem_rank_one` (degenerate): For an algebraic Hecke character ψ, this is its class-field-theoretic compatible system.
- `TauCeti.AutomorphicGalois.compatibleSystem_weight_k` (computation): At n=2, a=(k−2,0), the Hodge multiset is {k−1,0} and its sum is k−1.
- `TauCeti.AutomorphicGalois.compatibleSystem_R19` (compatibility): On the exact classical/Hilbert overlap, applying the stated dual/twist dictionary identifies each λ-member with the R19 fixed-form member.
- `TauCeti.AutomorphicGalois.compatibleSystem_no_automatic_strictness` (non-example): A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place.

**Check.**

- All λ use one M_π and S_π.
- Only the polarized instance receives the full pure-WD comparison below.

<a id="ag26-polarized-compatible-system-strictly-pure"></a>

### Purity and polarization of the polarized system

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure` (theorem).

For a regular algebraic polarized cuspidal (π,χ) with a_{τ,i}+a_{τc,n+1−i}=w, R_π is pure and BLGGT-strictly pure of weight W=w+n−1. Its polarization is r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}; the χ-system has purity weight 2w. Total oddness uses μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so the required sign is χ_v(−1)=(−1)^{n+w}. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition.

**Proof or construction.**

1. Use the algebraic weight symmetry and AG2.0’s corrected multiplier sign.
2. Apply tempered local comparison and weight purity at the good and away-coefficient places.
3. Populate the separate pure/polarized predicates, then use full coefficient-prime comparison for the all-place property.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`](#ag26-compatible-system-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`](#ag26-full-polarized-comparison-at-the-coefficient-prime), [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`](#ag20-polarized-galois-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`](#ag20-sign-of-the-polarization-multiplier), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`](#ag25-caraiani-upgrade-away-from-p-and-temperedness), [`AutomorphicGaloisRepresentationsPartII:AG2.6/system-purity-and-polarization`](#ag26-system-purity-and-polarization), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations).

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(1)–(2), pp.33–34; §5.1 pp.62–65. Purity weight and branch predicates on the imported carrier.

**Check.**

- At n=2, a=(k−2,0), W=k−1.
- Purity is not inferred from a common polynomial family on an arbitrary nonselfdual branch.

<a id="ag26-very-weak-compatibility-under-dgi"></a>

### Very weak compatibility and the density-one DGI route

Target `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi` (comparison).

The Weak predicate proved for R_π implies VeryWeak and ExtremelyWeak on the same compatible-family data. In particular it supplies the weakened conclusions of ACC+ Lemmas 7.1.9–7.1.10 without using their density-one residual absolute-irreducibility and decomposed-genericity hypotheses as construction inputs. Their Fontaine–Laffaille/degree-shifting argument is a separate arithmetic proof, not a prerequisite here. No conclusion of residual irreducibility at every λ follows.

**Proof or construction.**

1. Apply the established Weak predicate to R_π.
2. Use the weakening maps on compatible-family-data; keep the ACC+ arithmetic proof independent.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`](#ag26-compatible-system-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates`](#ag26-compatibility-strength-predicates).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemmas 7.1.9–7.1.10, pp.1093–1094. The density-one DGI route, with rank-two specialization.

**Check.**

- A finite set of exceptional ℓ is allowed.
- Existence of a local generic prime alone does not establish absolute irreducibility.

**Remaining closure obligations.** Close the distinct at-p geometric/log-crystalline input and AHTW quantitative cohomology, arbitrary-multiplicity bounded pseudodeformations, non-Siegel boundary and generic maximal-orbit refinements. The family data and strength/purity predicates are specified here independently of R24.

## AG2.7: Residual representations, genericity and exports

Choose finite local realizations before lattices and residual semisimplification. Apply the existing IHG ideal predicates. Local ratios, complete splitting, absolute irreducibility and residual-image conditions are independent. Export exactly the branch of local comparison that was proved.

**Planets:** Residual automorphic representations; ACC+ local genericity; Decomposed-generic primes; Decomposed genericity; Strong local genericity; Generic Chebotarev primes.

<a id="ag27-finite-p-adic-field-of-realization"></a>

### Finite p-adic realization before lattices

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization` (theorem).

For each continuous r_{π,ℓ,ι}:G_F→GL_n(Q̄_ℓ), there is a finite extension E/Q_ℓ over which its matrices are defined, after a change of basis if desired. Prove this before invoking a compact-local-field stable-lattice theorem. The compact image is covered by GL_n(E) for the countably many finite subextensions of Q̄_ℓ/Q_ℓ; Baire gives one such closed subgroup with open intersection, and finitely many coset representatives lie in a larger finite field. A uniform strong number field is available on the polarized branch, but is not needed for this local assertion.

**Proof or construction.**

1. Use the compactness of the continuous image of G_F and the countability of finite local extensions inside Q̄_ℓ.
2. Apply Baire to image∩GL_n(E), which is closed, obtaining an open subgroup.
3. Adjoin entries of finitely many coset representatives to E.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`](#ag26-compatible-system-of-pi), `ArithmeticGaloisRepresentations:R01.1`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, after Theorem 2.1.1, p.34. Finite realization is the prerequisite for the residual construction.
- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Proposition 6.8, author-copy p.39. An explicit source for finite local realization; the proof sketch records the compact-image argument in arbitrary rank.

**Check.**

- Do not apply local-field lattice compactness directly over Q̄_ℓ.
- The chosen E is finite over Q_ℓ, not a finite field of positive characteristic.

<a id="ag27-dual-and-character-twist-hecke-comparison"></a>

### Dual and character-twist Hecke comparison

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison` (theorem).

For a Galois-type maximal ideal m of rank n, the contragredient Hecke ideal m^∨ is of Galois type with r_{m^∨}≅r_m^∨⊗ε̄^{1−n}. At good geometric Frobenius its eigenvalues are q_v^{n−1}/α_i. An integral unramified-at-v character ψ multiplies the eigenvalues by ψ(Frob_v), and its Hecke twist realizes r_m⊗ψ̄. In the rank-2n unitary Hecke algebra the reciprocal factor is q_v^{2n−1}. Residual nonratio conditions are transported only with their unramifiedness hypotheses.

**Proof or construction.**

1. Apply the contragredient Hecke involution to the polynomial coefficients.
2. Compute eigenvalues of dual times the geometric cyclotomic twist.
3. Match all good polynomials and use semisimple uniqueness.

**Prerequisites:** `IntegralHeckeAndGaloisDeterminants:IHG.3`, [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 2.3.6, p.938. Exact dual ε^(1−n) and character-twist conventions.

**Check.**

- At n=2, α_i become q/α_i.
- A ramified scalar twist can violate local unramifiedness.

<a id="ag27-good-prime-characteristic-zero-export"></a>

### Good-prime characteristic-zero export

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export` (construction).

GoodPrimeExport(π) consists of the compatible-family datum R_π, its finite coefficient field and common S_π/P_v data, the chosen λ-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping the compatible-family carrier, not a new compatible-system definition.

**Proof or construction.**

1. Package the carrier and its good polynomial comparison.
2. Give the forgetful map from stronger branch exports and a coefficient-change map inherited from the supplier.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`](#ag26-compatible-system-of-pi).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. The minimum automorphic compatible-data export.

**Uses determining the API.**

- PotentialAutomorphyInfrastructure:PA.0: The characteristic-zero fixed automorphic input.
- IntegralHeckeAndGaloisDeterminants:IHG.1: Provides dense classical comparisons for interpolation, whose nonreduced determinant construction is owned by IHG.

**API.**

- `TauCeti.AutomorphicGalois.GoodPrimeExport` (constructor): Wrap R_π with its good comparison maps.
- `TauCeti.AutomorphicGalois.goodPrimeExport_member` (projection): Retrieve the λ-member and good Frobenius theorem.
- `TauCeti.AutomorphicGalois.goodPrimeExport_coeffChange` (functoriality): Use supplier coefficient change, with identity and composition laws.

**Unit tests.**

- `TauCeti.AutomorphicGalois.goodPrimeExport_character` (degenerate): At n=1 it is the algebraic-character good-prime package.
- `TauCeti.AutomorphicGalois.goodPrimeExport_polynomial` (computation): For a weight-k classical overlap its polynomial is X²−a_qX+ψ(q)q^{k−1}.
- `TauCeti.AutomorphicGalois.goodPrimeExport_not_fullWD` (non-example): The package cannot supply N at a ramified place without branch evidence.

**Check.**

- The export can be consumed with no polarization hypothesis.
- Forgetting branch evidence preserves M,S,P_v and every λ-member.

<a id="ag27-unitary-discrete-parameter-export"></a>

### Unitary discrete-parameter export

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export` (construction).

In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i attached to an endoscopic discrete parameter of ranks n_1+n_2=n, with each ε_i the algebraic character of |det|^{(n_i−n)/2}·(ϖ∘N_{F/𝒦}∘det)^{ε(n−n_i)}, and ε(m)≡m mod 2. The polynomial at every v over q∈Spl_{𝒦/Q} outside S∪{ℓ} is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-ℓ local comparison from Remark 5.5.6. This package need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove. Here F=F⁺·𝒦 with 𝒦 the imaginary quadratic field of CS §5.1; the printed F₀ in Corollary 5.5.5 is the already confirmed E11 misprint, not another splitting field.

**Hypotheses.**

- For the literal CS Corollary 5.5.5 application, retain the §5.1 unitary datum and the given irreducible admissible Π^S in the indicated BCS supercuspidal alternating Igusa summand. Its identification with the labelled pure automorphic transfer parameter is supplied as input; this export does not prove an Igusa trace or concentration theorem.
- The constituent Π_i are regular C-algebraic, θ-stable isobaric representations supplied by that parameter, and r_i has rank n_i (known E10), not n. The source setup has F⁺≠Q, quasi-split finite unitary group, and the ramified rational primes of F contained in Spl_{F/F⁺}; these source restrictions are retained for that literal application.
- ϖ:𝔸_𝒦×/𝒦×→ℂ× is the specified auxiliary character with odd infinity exponent; the norm is its argument, not a substitute for this character.

**Proof or construction.**

1. Use the ET.7a pure stable/endoscopic transfer and the AG2.2 constituent representations.
2. Install ε_i with the parity correction so the indicated twist is L-algebraic.
3. Take the direct sum and match normalized Satake polynomials using local LLC compatibility away from ℓ.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization`](#ag22-cs-discrete-polarization-normalization), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations), [`AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial`](#ag25-good-prime-unramified-polynomial), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`](#ag25-caraiani-upgrade-away-from-p-and-temperedness).

**Sources.**

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.5 and Remark 5.5.6, pp.745–746. Constructs the two labelled blocks with their algebraic parity twists and states the away-coefficient local comparison, under the same unitary and transfer hypotheses.

**Uses determining the API.**

- IgusaVarietiesAndTorsionConcentration:IG.5–IG.7: Provides the discrete automorphic Galois summands used in the generic principal-series argument.
- TorsionCohomologyInfrastructure:TC.0: Supplies characteristic-zero summands, while torsion interpolation stays with IHG.

**API.**

- `TauCeti.AutomorphicGalois.UnitaryDiscreteExport` (constructor): Build the labelled direct sum with explicit algebraic character twists.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_constituent` (projection): Retrieve r_i, ε_i and its inclusion into the direct sum.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_goodPolynomial` (compatibility): Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_coeffChange` (functoriality): Coefficient extension commutes with each labelled algebraic-character twist and the finite direct sum, up to the specified representation isomorphism.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_congr` (extensionality): Label-preserving isomorphisms of the supplied constituents and character data induce an isomorphism of exports. This does not choose canonical intertwiners from an isomorphism class alone.

**Unit tests.**

- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_two_characters` (computation): For n_1=n_2=1, at good v with twisted values β_1,β_2 the polynomial is (X−β_1)(X−β_2).
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity` (characterisation): The direct-sum dimension is n_1+n_2, with neither twist changing dimension.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_not_cuspidal_irreducibility` (non-example): A two-character endoscopic sum cannot certify global irreducibility.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_odd_block_twist` (non-example): For n₁=2,n₂=1,n=3, the twists are |det|^(−1/2)·(ϖ∘N_{F/𝒦}∘det) on the rank-two block and |det|^(−1) on the rank-one block. At an idele with ϖ(N(a))≠1, omitting ϖ changes the first twist; the bare norm expression fails this test.

**Check.**

- The two-constituent sum is allowed to be reducible.
- Theorem 5.5.4’s finite-place statement is used only at v∤ℓ, correcting the known E83 extraction finding.
- The known E10/E11 corrections are respected: constituent rank n_i and q split in 𝒦, not an undefined F₀.

<a id="ag27-residual-representation-of-pi"></a>

### Residual representation of π

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi` (construction).

Choose a finite E/Q_ℓ realizing r_{π,λ}, an O_E-stable lattice L, and a basis of L. Define r̄_{π,λ} as the semisimplification of L/m_EL. Its isomorphism class over k̄_ℓ is independent of L, the basis and enlargement of E, for a fixed coefficient embedding λ. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good v away from ℓ it is unramified and has characteristic polynomial P_v reduced through λ. For F/F^+ CM in the totally odd polarized branch, the semisimple residual polarized representation admits the 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_χ supplied by the polarized representation API. An arbitrary lattice is not declared self-dual.

**Proof or construction.**

1. Use finite p-adic realization first; compactness then supplies an O_E-stable lattice.
2. Reduce the integral representation and semisimplify; use arbitrary-rank residual Brauer–Nesbitt for lattice independence.
3. Use finite-image Frobenius density to recover all characteristic-polynomial coefficients from good places; descend the semisimple member by finite-field Brauer-group vanishing. In positive characteristic use characteristic polynomials rather than traces alone.
4. Request preservation of polarization under reduction and semisimplification and the specified 𝒢_n-extension from ArithmeticGaloisRepresentations G7. The deformation-problem supplier assumes that extension as input. Do not claim every chosen lattice carries a perfect pairing.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`](#ag27-finite-p-adic-field-of-realization), `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`](#ag20-polarized-galois-representation), `ArithmeticGaloisRepresentations:G7`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Representation.IsSemisimpleRepresentation`.

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p.34. The invariant is the semisimple reduction, with its polarized extension.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, p.1085. Finite-field descent of residual members.

**Uses determining the API.**

- ACC+, Definition 2.3.6: Certifies the residual Galois type of m_π.
- PotentialAutomorphyInfrastructure:PA.0: Supplies residual automorphic input, without adding irreducibility or enormous-image hypotheses.

**API.**

- `TauCeti.AutomorphicGalois.residualRep` (constructor): The continuous semisimple residual member over its finite field of realization.
- `TauCeti.AutomorphicGalois.residualRep_indep_lattice` (extensionality): Two lattice reductions have isomorphic semisimplifications over k̄_ℓ.
- `TauCeti.AutomorphicGalois.residualRep_coeffExtension` (functoriality): Enlargement of E gives scalar extension of the same semisimple residual representation.
- `TauCeti.AutomorphicGalois.residualRep_goodPolynomial` (compatibility): At good v away from ℓ the polynomial is the coefficient reduction of P_v.
- `TauCeti.AutomorphicGalois.residualRep_extendGn` (constructor): For F/F^+ CM, totally odd polarized residual members extend to 𝒢_n with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.

**Unit tests.**

- `TauCeti.AutomorphicGalois.residualRep_rank_one` (degenerate): For an integral character ψ, r̄ is its reduction and no semisimplification changes it.
- `TauCeti.AutomorphicGalois.residualRep_diagonal_reduction` (computation): Reduction of diag(1,2) modulo 3 has polynomial (X−1)(X−2), the reduction of the characteristic-zero polynomial.
- `TauCeti.AutomorphicGalois.residualRep_R19_dual` (compatibility): For the classical weight-k overlap at fixed λ, r̄_AG2≅r̄_R19^∨ under the same residue embedding.
- `TauCeti.AutomorphicGalois.residualRep_noncanonical_lattice` (non-example): For the Z_5-action r(t)=[[1,5t],[0,1]], lattices with bases (e1,e2) and (5e1,e2) give identity and nontrivial unipotent reductions; both semisimplify to 1⊕1.

**Check.**

- Changing λ may change the residual representation; only auxiliary choices at fixed λ are removed.
- Nonsemisimple reductions can differ.

<a id="ag27-nonselfdual-hodge-and-monodromy-bound-export"></a>

### Nonselfdual Hodge and monodromy-bound export

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export` (construction).

NonselfdualComparisonExport(π) for an arbitrary regular algebraic cuspidal π over CM F wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and F-ss monodromy upper bound at every v|ℓ. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified N equality. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.

**Proof or construction.**

1. Package the proved de Rham/Hodge maps and the separate ss/bound statements at each coefficient-prime place.
2. Expose the spherical and Iwahori corollaries as hypothesis-indexed local projections.
3. Forget to the good-prime carrier without changing its members.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`](#ag27-good-prime-characteristic-zero-export), [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`](#ag26-all-cm-de-rham-and-semisimplified-coefficient-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`](#ag26-nonselfdual-coefficient-prime-monodromy-bound), [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`](#ag26-all-cm-crystalline-and-iwahori-corollary).

**Sources.**

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. The nonselfdual export includes the known Hodge and coefficient-prime properties.

**Uses determining the API.**

- PotentialAutomorphyInfrastructure:PA.1: Supplies unrestricted de Rham and Hodge data before additional Fontaine–Laffaille/ordinary assumptions.
- TorsionCohomologyInfrastructure: Keeps the unconditional characteristic-zero Hodge comparison distinct from residual concentration hypotheses.

**API.**

- `TauCeti.AutomorphicGalois.NonselfdualComparisonExport` (constructor): Combine the AHTW coefficient-prime maps with the common carrier.
- `TauCeti.AutomorphicGalois.nonselfdualExport_goodPrime` (projection): Forget to GoodPrimeExport with the same members.
- `TauCeti.AutomorphicGalois.nonselfdualExport_hodge` (data): Retrieve de Rham comparison and the labelled multiset at every v|ℓ.
- `TauCeti.AutomorphicGalois.nonselfdualExport_wdBound` (data): Retrieve ss comparison and the F-ss monodromy upper bound, retaining their distinct strengths.

**Unit tests.**

- `TauCeti.AutomorphicGalois.nonselfdualExport_rank_one` (degenerate): For an algebraic character the Hodge multiset has one element and N=0.
- `TauCeti.AutomorphicGalois.nonselfdualExport_good_crystalline` (compatibility): At a spherical coefficient-prime place the upper bound N=0 and trivial inertia recover the crystalline supplier criterion.
- `TauCeti.AutomorphicGalois.nonselfdualExport_not_polarized_fullWD` (non-example): The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone.

**Check.**

- An unrestricted regular CM cuspidal input receives the full labelled Hodge output.
- A general ramified member is exported with an N bound, not full equality.

<a id="ag27-polarized-hodge-and-wd-export"></a>

### Polarized Hodge and Weil–Deligne export

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export` (construction).

PolarizedComparisonExport(π,χ) wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full F-ss WD comparison at all finite places, including coefficient-prime places. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, the polarized-family structure and each local comparison; they do not insert residual enormousness or an ordinary refinement.

**Proof or construction.**

1. Assemble separately established comparison and polarization maps.
2. Supply forgetful maps and their agreement on the underlying members.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`](#ag27-good-prime-characteristic-zero-export), [`AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`](#ag26-full-polarized-comparison-at-the-coefficient-prime), [`AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`](#ag26-totally-real-polarized-coefficient-prime-descent), [`AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`](#ag26-polarized-compatible-system-strictly-pure).

**Sources.**

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §5.1, pp.63–65. The polarized system evidence.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683), Theorem 1.1, pp.1–2. Full coefficient-prime WD evidence.

**Uses determining the API.**

- PotentialAutomorphyInfrastructure:PA.1–PA.5:  supplies the Hodge/polarization input before their additional local and residual hypotheses.
- Liu et al., §3.2: Supplies the polarized relevant members and local comparison maps.

**API.**

- `TauCeti.AutomorphicGalois.PolarizedComparisonExport` (constructor): Combine the established polarized branch comparisons.
- `TauCeti.AutomorphicGalois.polarizedExport_goodPrime` (projection): Forget to GoodPrimeExport, preserving all good polynomials.
- `TauCeti.AutomorphicGalois.polarizedExport_local` (data): Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
- `TauCeti.AutomorphicGalois.polarizedExport_supplier` (compatibility): Return precisely the R24.5 pure/polarized predicates with normalization conversion.

**Unit tests.**

- `TauCeti.AutomorphicGalois.polarizedExport_weight_k` (computation): For a weight-k base-change form it returns H={0,k−1}, W=k−1 and determinant ε^{1−k}r_ψ.
- `TauCeti.AutomorphicGalois.polarizedExport_forget` (compatibility): The forgotten good package has exactly the same λ-members and P_v.
- `TauCeti.AutomorphicGalois.polarizedExport_nonselfdual_rejected` (non-example): AHTW ss comparison plus an N bound does not fulfill a full-WD comparison field.

**Check.**

- The χ multiplier and W=w+n−1 are retained.
- An arbitrary nonselfdual good-prime package cannot be promoted to this type.

<a id="ag27-good-polynomial-reduction"></a>

### Reduction of good Frobenius polynomials

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction` (lemma).

For a stable lattice realization A_v∈GL_n(O_E) of a good geometric Frobenius, Matrix.charpoly(A_v) has integral coefficients and maps under O_E→k_E to Matrix.charpoly(Ā_v); semisimplification leaves it unchanged. Thus the reduced polynomial is the reduction of ι⁻¹P_v. The constant term is a unit because A_v is invertible. This is ordinary characteristic-polynomial coefficient change, not a new determinant-law construction.

**Proof or construction.**

1. Write Frobenius in an integral lattice basis.
2. Apply the pinned Matrix.charpoly_map lemma to residue reduction.
3. Apply the supplier’s semisimplification invariance to the reduced representation.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi), `mathlib:Matrix.charpoly_map`, `mathlib:Matrix.GeneralLinearGroup.map`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. Residual Hecke polynomials are reduced characteristic polynomials.

**Check.**

- For diag(1,2) modulo 3, X²−3X+2 becomes X²+2.
- Conjugating the lattice basis leaves the polynomial unchanged.

<a id="ag27-the-residual-ratio-condition-for-taylor-wiles-primes"></a>

### Local residual genericity

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes` (definition).

Let L/Q_p be any finite extension with residue cardinality q, ℓ≠p, k a finite field of characteristic ℓ, and r:G_L→GL_n(k) continuous. It is ACC+-generic at L if inertia acts trivially and, over k̄, the eigenvalues α_i∈k̄× of r(Frob_L^geom), listed with multiplicity, satisfy α_i/α_j≠q for every i≠j. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when q≠1 in k; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.

**Proof or construction.**

1. Use actual residual local inertia and a Frobenius lift; unramifiedness makes the matrix independent of the lift.
2. Split the characteristic polynomial in k̄ and test all ordered pairs of eigenvalues, retaining multiplicity.
3. Keep the eigenvalue predicate separate from its local representation predicate.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi), `ArithmeticGaloisRepresentations:R01.1`, `mathlib:Matrix.charpoly`, `mathlib:Matrix.GeneralLinearGroup.map`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(1), p.972. Unramifiedness and the ordered noncyclotomic ratio condition.

**Uses determining the API.**

- ACC+, §4.3; §6 Taylor–Wiles construction: Provides the local noncyclotomic ratio input without implying the other global hypotheses.
- IgusaVarietiesAndTorsionConcentration:IG.5: This is the condition exported by AG2.7 to the Hecke localization consumer.

**API.**

- `TauCeti.AutomorphicGalois.IsGenericEigenvalues` (characterisation): For a list α:Fin n→k×, require α_i/α_j≠q for i≠j; list multiplicities are retained.
- `TauCeti.AutomorphicGalois.IsGeneric` (characterisation): Trivial inertia together with the eigenvalue predicate over k̄.
- `TauCeti.AutomorphicGalois.isGeneric_unramified` (projection): A locally generic representation kills inertia.
- `TauCeti.AutomorphicGalois.isGeneric_frobenius_independent` (extensionality): For trivial inertia, changing the Frobenius lift preserves the matrix and predicate.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_smul` (functoriality): Multiplication of every α_i by the same nonzero scalar preserves the eigenvalue predicate.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_reindex` (compatibility): Reordering the list by a permutation leaves the predicate unchanged.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_inverse` (compatibility): Inverting every eigenvalue preserves the predicate by exchanging ordered pairs.

**Unit tests.**

- `TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue` (computation): Over F_3 with q=2, the list (1,1) is generic.
- `TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q` (non-example): Over F_5 with q=2, the distinct list (2,1) is not generic.
- `TauCeti.AutomorphicGalois.isGeneric_rank_one` (degenerate): Every one-term nonzero list is generic.
- `TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one` (non-example): Over F_3 with q=1, (1,1) is not generic.
- `TauCeti.AutomorphicGalois.isGeneric_matrix_diagonal` (compatibility): The list condition on α agrees with the characteristic-polynomial factorization of the diagonal matrix diag(α).

**Check.**

- For n=1 the ratio condition is vacuous but unramifiedness remains required.
- A ramified scalar representation has generic eigenvalue ratios without being locally generic.

<a id="ag27-residual-hecke-ideal-independence"></a>

### Independence of the residual Hecke ideal

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence` (theorem).

Fix π, λ and an integral eigencharacter θ_π:T^S→O_E at that coefficient place. Then m_{π,λ}=ker(T^S→O_E→k_E) is of Galois type with realization r̄_{π,λ}. Its kernel is independent of stable lattice, basis and finite extension of E inducing the same λ: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when r̄_{π,λ} is absolutely irreducible. Independence across distinct λ is not asserted.

**Proof or construction.**

1. Apply the existing upstream IHG Layer 3b predicates to the actual normalized reduced Hecke polynomials; match them with the residual member. The ideal and the eigencharacter are the automorphic specialization owned here.
2. Use semisimple lattice independence for the representation.
3. An injective residue-field extension leaves the kernel of θ̄_π unchanged.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`](#ag27-good-polynomial-reduction), `IntegralHeckeAndGaloisDeterminants:IHG.3`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. The reduced automorphic eigencharacter has the matching residual representation.

**Check.**

- Changing a lattice cannot change m_{π,λ}.
- Different coefficient primes can yield different maximal ideals.

<a id="ag27-completely-split-generic-prime"></a>

### Completely split generic prime

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime` (definition).

For a continuous residual r:G_F→GL_n(k), a rational prime p is a decomposed-generic prime if p≠ℓ, p is completely split in F, and r is unramified and ACC+-generic at every v|p. Complete splitting means e_v=f_v=1 at every v, so q_v=p. This is a property of the pair (r,p), distinct from local genericity at one arbitrary place and from existence of such a p.

**Proof or construction.**

1. Conjoin coefficient-prime avoidance, complete splitting and the local predicate at every place.
2. Use complete splitting to rewrite each q_v as p in the residue field.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`](#ag27-the-residual-ratio-condition-for-taylor-wiles-primes), `ArithmeticGaloisRepresentations:R01.1`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(2), p.972. All places over a completely split rational prime.

**Uses determining the API.**

- ACC+, Lemma 4.3.2: Provides the witness whose Frobenius class is reproduced by Chebotarev.

**API.**

- `TauCeti.AutomorphicGalois.IsDecomposedGenericPrime` (characterisation): The complete-splitting and all-v condition.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_local` (projection): For every v|p, obtain unramifiedness and the local predicate with q=p.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_coeffExtension` (functoriality): Any extension of the finite coefficient field preserves and reflects the condition.

**Unit tests.**

- `TauCeti.AutomorphicGalois.decomposedGenericPrime_Q` (computation): For F=Q there is exactly one place over p; the splitting clause is automatic.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_not_inert` (non-example): An inert prime in a quadratic F is not decomposed generic even when the local ratio condition holds.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_not_ell` (degenerate): p=ℓ is excluded independently of eigenvalues.

**Check.**

- One generic place in a non-split fiber does not suffice.
- A generic prime is away from the coefficient characteristic.

<a id="ag27-strong-local-decomposed-genericity"></a>

### Strong local decomposed genericity

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity` (definition).

For any finite extension L/Q_p, ℓ≠p, define the Caraiani–Scholze Definition 1.9 specialization: r is unramified and α_i/α_j∉{1,q} for all i≠j over k̄. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be Q_p. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.

**Proof or construction.**

1. Add injectivity of the eigenvalue list to the ACC+ ratio predicate, equivalently excluding ratio 1.
2. Prove invariance under scalar, permutation, dual and coefficient extension with the same unramifiedness clauses.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`](#ag27-the-residual-ratio-condition-for-taylor-wiles-primes).

**Sources.**

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition 1.9, printed p.652. The stronger condition over an arbitrary p-adic field.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition D.1.2, footnote 37, printed p.365. The paper explains the relaxed noncompact input.

**Uses determining the API.**

- Caraiani–Scholze, Definition 1.9 and §6: The residual stronger condition controls generic principal-series lifts.
- Liu et al., Appendix D: States the distinction between the displayed strong condition and the relaxed concentration input.

**API.**

- `TauCeti.AutomorphicGalois.IsStrongGenericEigenvalues` (characterisation): IsGenericEigenvalues(α,q) and α injective, equivalently ratios avoid {1,q}.
- `TauCeti.AutomorphicGalois.IsStrongGeneric` (characterisation): Trivial inertia plus the stronger eigenvalue predicate over k̄.
- `TauCeti.AutomorphicGalois.strongGeneric_generic` (projection): Forget the ratio-1 exclusion.
- `TauCeti.AutomorphicGalois.strongGeneric_distinct` (projection): The Frobenius eigenvalues have no repeated roots.
- `TauCeti.AutomorphicGalois.strongGeneric_arbitrary_local_field` (compatibility): The definition uses q=|k_L| and specializes to Definition 1.9 for every finite L/Q_p.

**Unit tests.**

- `TauCeti.AutomorphicGalois.strongGeneric_not_repeated` (non-example): Over F_3, q=2, (1,1) is ACC+-generic but not strong-generic.
- `TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio` (computation): Over F_7, q=2, (1,3) is strong-generic: the two ordered ratios are 3 and 5.
- `TauCeti.AutomorphicGalois.strongGeneric_rank_one` (degenerate): Every single nonzero eigenvalue is strong-generic.
- `TauCeti.AutomorphicGalois.strongGeneric_non_Qp` (compatibility): For an unramified quadratic L/Q_2 and ℓ=3, use q=4≡1; the ratio-1 clause remains explicit.

**Check.**

- A repeated list can be ACC+-generic and fail this predicate.
- Rank one still requires unramifiedness.

<a id="ag27-existential-decomposed-genericity"></a>

### Decomposed generic residual representation

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity` (definition).

A continuous residual representation r:G_F→GL_n(k) is decomposed generic if there exists a rational prime p which is decomposed generic for r. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.

**Proof or construction.**

1. Quantify the auxiliary rational prime in the preceding predicate.
2. Keep its witness available for the infinite-prime theorem.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`](#ag27-completely-split-generic-prime).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(3), p.972. Existence of an auxiliary rational prime.

**Uses determining the API.**

- ACC+, Lemma 7.1.9: Supplies the density-one DGI hypothesis, separately from absolute irreducibility.
- PotentialAutomorphyInfrastructure:PA.1: Genericity hypothesis for the Fontaine–Laffaille comparison.

**API.**

- `TauCeti.AutomorphicGalois.IsDecomposedGeneric` (characterisation): There exists p satisfying IsDecomposedGenericPrime(r,p).
- `TauCeti.AutomorphicGalois.decomposedGeneric_witness` (data): Extract the prime witness and all-v local conditions.
- `TauCeti.AutomorphicGalois.decomposedGeneric_coeffExtension` (compatibility): The existential condition is preserved and reflected by finite residue-field extension.

**Unit tests.**

- `TauCeti.AutomorphicGalois.decomposedGeneric_trivial_F3` (computation): For F=Q, k=F_3, r=1⊕1, the prime p=2 is a witness.
- `TauCeti.AutomorphicGalois.decomposedGeneric_not_irreducible` (non-example): The preceding decomposed-generic representation is reducible.
- `TauCeti.AutomorphicGalois.decomposedGeneric_not_every_prime` (characterisation): For the same r, p=7 has q=1 mod 3 and is not a witness, although p=2 is.

**Check.**

- A single witness is sufficient.
- For n≥2 the trivial representation may be decomposed generic when suitable p≠1 mod ℓ split in F.

<a id="ag27-finite-exceptional-residual-genericity-for-relevant-pi"></a>

### Residual genericity outside finitely many λ

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi` (theorem).

For a relevant Π with a strong coefficient field E in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots α_i and α_i≠qα_j. After a finite extension of E containing these roots, exclude the finitely many coefficient places dividing denominators, roots, α_i−α_j or α_i−qα_j. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain a place w split in F/F⁺ that is locally generic for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own F^+≠Q and level hypotheses and belongs to the Igusa/torsion consumer. This conclusion does not itself provide the completely split rational prime, generic at every v above it, required by the ACC+ global predicate; that stronger witness needs its separate Chebotarev hypotheses.

**Proof or construction.**

1. Use the relevant polarized regular representation and a regular unramified Frobenius from CH.
2. Local genericity of the characteristic-zero π excludes the q-ratios.
3. Exclude finitely many algebraic bad factors and use the Appendix D split-place Chebotarev argument.
4. Pass the resulting generic Hecke ideal to the consumer rather than importing concentration back into AG2.6.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`](#ag26-uniform-strong-realization-for-polarized-systems), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`](#ag27-residual-hecke-ideal-independence), [`AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`](#ag27-strong-local-decomposed-genericity), `ArithmeticGaloisRepresentations:R01.5`.

**Sources.**

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Corollary D.1.4, printed p.368; Remark 3.2.6. Exclude divisors of finitely many nonzero algebraic quantities, then use Chebotarev.

**Check.**

- A nonzero algebraic difference can vanish at finitely many λ; these λ must be excluded.
- No absolute residual irreducibility or enormousness follows from this local condition.

<a id="ag27-lattice-residual-polynomial-export"></a>

### Lattice and residual polynomial export

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/lattice-residual-polynomial-export` (construction).

ResidualPolynomialExport(π,λ) contains a finite p-adic realization E, an explicitly chosen stable O_E-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good P_v and the comparison isomorphisms under another lattice or coefficient extension. It exports m_{π,λ} and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.

**Proof or construction.**

1. Choose finite E and stable lattice in that order.
2. Package the residue coefficient homomorphism and its characteristic-polynomial comparison.
3. Use lattice-independent semisimplification and kernel-independent m_{π,λ} for the comparison API.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`](#ag27-good-polynomial-reduction), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`](#ag27-residual-hecke-ideal-independence), `mathlib:Representation.IsSemisimpleRepresentation`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. Integral-to-residual good-polynomial interface.

**Uses determining the API.**

- PotentialAutomorphyInfrastructure:PA.0: Supplies residual automorphic data before lifting.
- IntegralHeckeAndGaloisDeterminants:IHG.1–IHG.3: Supplies classical integral polynomial comparisons, not a family over a nonreduced Hecke algebra.

**API.**

- `TauCeti.AutomorphicGalois.ResidualPolynomialExport` (constructor): Assemble finite realization, chosen lattice and reduction maps.
- `TauCeti.AutomorphicGalois.residualExport_compareLattice` (equivalence): Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
- `TauCeti.AutomorphicGalois.residualExport_maxIdeal` (projection): Retrieve m_{π,λ} with Galois-type evidence.
- `TauCeti.AutomorphicGalois.residualExport_charpoly` (compatibility): The integral/residual Frobenius square commutes by Matrix.charpoly_map.

**Unit tests.**

- `TauCeti.AutomorphicGalois.residualExport_rank_one` (degenerate): Reduction of an integral character is its residual character.
- `TauCeti.AutomorphicGalois.residualExport_diagonal_mod3` (computation): The diagonal integral test reduces X²−3X+2 to X²+2 modulo 3.
- `TauCeti.AutomorphicGalois.residualExport_unipotent_lattices` (non-example): The two Z_5-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions.

**Check.**

- The integral lattice may change while the residual semisimple isomorphism class remains fixed.
- The good-polynomial maps use the pinned GL map and charpoly_map.

<a id="ag27-rank-two-residual-comparison-with-r19"></a>

### Rank-two residual comparison with R19

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/rank-two-residual-comparison-with-r19` (comparison).

For the regular classical/Hilbert overlap, suppose an independent rank-two realization with the normalized good polynomials has been supplied. Fix λ and the characteristic-zero dual/twist identification of AG2.6. Semisimple reduction respects that identification: in the classical normalization the AG2 residual member is the dual of the supplied arithmetic-Frobenius residual member, and the geometric good polynomial is X²−ā_qX+ψ̄(q)q^{k−1}. Their maximal Hecke ideals agree under the normalized Hecke algebra identification. This is a conditional comparison on semisimple classes, not a preferred lattice or an import of R19 existence or geometry. The higher-tier R19 consumer may apply it to its constructed realization.

**Proof or construction.**

1. Identify the independently supplied characteristic-zero member using normalized good polynomials, Chebotarev density and semisimplicity.
2. Choose stable lattices and use residual semisimple independence, compatibility with duals and integral twists, to compare reductions.
3. Compare normalized reduced Hecke eigencharacters and their kernels.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19`](#ag26-rank-two-comparison-with-r19), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`](#ag27-residual-hecke-ideal-independence).

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6 and following duality statement, p.938. The dual convention descends to the residual comparison.

**Check.**

- At k=2 the determinant is ψ̄ε̄⁻¹ in the AG2 geometric convention.
- A claim that all integral lattices are identified fails the unipotent lattice test.

<a id="ag27-infinitely-many-decomposed-generic-primes"></a>

### Infinitely many decomposed generic primes

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes` (theorem).

If r:G_F→GL_n(k) is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set. Let K be a normal closure of F, the field cut out by r and Q(ζ_ℓ). A witness determines a conjugacy class in Gal(K/Q) whose restriction fixes F, fixes the all-place eigenvalue ratios and fixes p mod ℓ. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.

**Proof or construction.**

1. Encode r, complete splitting and the cyclotomic residue value in one finite normal extension.
2. Use the witness’s Frobenius conjugacy class and all its conjugates to retain conditions at every v.
3. Apply Chebotarev and discard the chosen finite exceptional set.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`](#ag27-existential-decomposed-genericity), `ArithmeticGaloisRepresentations:R01.5`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 4.3.2, pp.972–973. Chebotarev reproduces the witness at all conjugate places.

**Check.**

- For r=1⊕1 over F_3 and F=Q, all p≡2 mod 3 away from 3 are witnesses.
- Keeping only the field cut out by r loses the q=p mod ℓ information.

<a id="ag27-genericity-transfer-and-projective-qualification"></a>

### Genericity transfer and projective qualification

Target `AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification` (theorem).

The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.

**Proof or construction.**

1. Cancel a common nonzero scalar in ratios and exchange ordered pairs for inversion.
2. Use conjugacy and coefficient-change invariance of characteristic polynomials.
3. For the global twist choose a witness away from the character’s finite ramification set.

**Prerequisites:** [`AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`](#ag27-the-residual-ratio-condition-for-taylor-wiles-primes), [`AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`](#ag27-strong-local-decomposed-genericity), [`AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`](#ag27-infinitely-many-decomposed-generic-primes), `mathlib:Matrix.charpoly_units_conj`, `mathlib:Matrix.charpoly_map`.

**Sources.**

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 4.3.1, p.972; Lemma 4.3.2. Qualify the local assertion by unramifiedness; see E5.

**Check.**

- A ramified quadratic scalar twist of 1⊕1 at L=Q_2, k=F_3, has the same projective representation but is not locally generic.
- For the globally trivial F_3 representation, an arbitrary finite character twist retains some good witness.

**Remaining closure obligations.** Close residual finite-field descent, polarization through reduction/semisimplification and normalized integral eigencharacter application APIs. Apply existing IHG generic ideal predicates. Do not infer non-Eisensteinness, complete splitting, adequacy or enormousness from local ratio tests.

## GSp₄ source-routing contract

The following specialized results are assigned to the proposed dedicated owner GSp4LocalLanglandsAndGaloisRepresentations. No stage id is asserted for that proposal, and no ML.4 theorem is an AG2 prerequisite. The regular GL₄ input, polarization sign and generic WD comparison are supplied by this roadmap. A design must connect them to the actual GSp₄ transfer and local normalizations before specialized comparisons can be claimed.

Calegari–Geraghty, Proposition 6.8(1)–(5), author-copy pp.38–39, treats a cuspidal eigenform in its specified good-p-level section space with weight (a,b), a≥b≥3, W=a+b−3. It constructs a finite-field-of-definition GSp₄-valued representation with similitude λ_f(χ_{μ,0})ε^{−W}. At good x≠p, its geometric Frobenius polynomial is the specialized monic Q_x(X). Its restriction at p is crystalline with Hodge multiset {0,b−2,a−1,W}. The additional assumption of being a p-Hecke eigenform specifies the crystalline polynomial; it is not an additional crystallinity hypothesis. Absolute irreducibility is retained in the proposition’s all-prime local-global compatibility clause.

For the ordinary clause, both T_{p,1} and Q_{p,2} eigenvalues must be units. The specialized polynomial’s four roots α,β,γ,δ have valuations 0,b−2,a−1,W. These different valuations imply distinct roots in this regular range. The triangular diagonal characters are unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), and ε^{−W}unram(p^{−W}δ). The normalized unramified parameters are units. Neither one unit condition nor unspecified singular-weight ordinarity gives this conclusion.

Pilloni, Theorem 5.1.7.1(1)–(5) and its remark, author-copy pp.22–23, assumes a cuspidal π with the specified discrete-series infinity type (λ₁,λ₂;−λ₁−λ₂+3). Its de Rham weights are {0,−λ₂,−λ₁,−λ₁−λ₂}; spherical coefficient-prime places are crystalline, with det(1−Xφ)=Θ_π(Q_p(X)). The monic polynomial is obtained by reversing the degree-four polynomial: X⁴Θ_π(Q_p(X⁻¹)). The corrected similitude exponent is ε^{λ₁+λ₂}, as in the routed paper correction E27. Substituting λ₁=1−a and λ₂=2−b matches the four Hodge labels above. This substitution alone does not identify automorphic or Galois representations: a Harish–Chandra/Satake and transfer dictionary is also required.

The dedicated design must retain the Mok/Bellaïche–Chenevier symplectic-valuedness argument and the Sorensen Iwahori/Klingen/paraspherical/inertia statements with their exact hypotheses, alongside the p-adic ordinary and singular-weight interfaces. These are owner-creation and source-routing obligations, rather than new GL_n existence theorems here.

Checks for that interface are: weight (3,3) gives {0,1,2,3}; the normalized ordinary root parameters are units; and the constant-one determinant polynomial and monic characteristic polynomial are converted before comparing coefficients. In the singular boundary the four valuation arguments must not be reused without their strict inequalities. The three historical GSp₄-specific AG2.6 node ids are excluded from this full-scope target inventory and preserved only as route provenance in the packet.

## Supplier requests

Each request is a contract for the named owner. Exact node prerequisites are imported directly; a stage request is not a claim that the complete refinement already exists.

### Supplier 1: `AutomorphicFormsOnReductiveGroups:AF.1`

Infinitesimal characters for the archimedean (g,K)-modules of Res GL_n, including restriction to the connected real subgroup.
Discrete compact-quotient automorphic decomposition with fixed central character and its comparison to (g,K)-cohomology; enough to identify multiplicity spaces at finite level.
Interior cohomology realization of regular algebraic GL_n cuspidal π after sufficiently large determinant twists, HLTT Corollary 1.9, with coefficient dual convention and degree i>0.
Shin Proposition 5.3(i): the exact cohomological archimedean packet, its Lie-algebra cohomology degree/dimensions and highest-weight partition, needed before Corollary 6.5(iv) can identify the selected multiplicities.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`](#ag20-regular-algebraic-of-weight), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`](#ag21a-automorphic-multiplicity-spaces), [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-levi-cohomology-realization`](#ag24-boundary-levi-cohomology-realization), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/archimedean-packet-multiplicity`](#ag21b-archimedean-packet-multiplicity).

### Supplier 2: `PadicHodgeTheory:R06.2`

The de Rham and Hodge–Tate conditions on a continuous representation, with labelled Hodge–Tate multiset and HT(ε_ℓ)={−1}; used only to interpret BLGGT terminology, not to prove automorphic admissibility.
Serre regular-Hodge–Tate algebraic-monodromy criterion: distinct labelled weights force a regular-semisimple element of the Zariski closure, as used in CH Proposition 3.2.5. Automorphic de Rham and labelled regularity proofs are the AG2.6 output.

Berger–Colmez bounded constant-Hodge-type family theorem in the CH Theorem 2.3 setting, at coefficient-prime places other than the weight-varying v_0; prove strict period comparison on that family. This is a family extension of the scalar period-functor API, not a claim that de Rham representations are closed under arbitrary limits.

Labelled D_dR and HT comparisons commute with determinant, tensor, dual, restriction and coefficient change; HT(ε)=−1 at the AG2 boundary. For fixed bounded weights on reduced rigid affinoids, period-admissibility closedness applies after a proper representation-realization cover and stable lattice/blowup, including reducible fibres (Chenevier pp.22–24).

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`](#ag20-polarized-galois-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`](#ag23-finite-number-field-of-realization), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`](#ag26-coefficient-hodge-comparison-through-families-and-descent), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates`](#ag26-compatibility-strength-predicates), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations).

### Supplier 3: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

Geometric Artin reciprocity on the idele class group modulo the connected archimedean component; compatibility with local Artin maps and transfer for extension of number fields.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character).

### Supplier 4: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`

Idele Hecke characters, local components and finite-order parity, including the conductor-compatible Dirichlet dictionary.
Prime-degree Grunwald–Wang theorem with totally real local conditions, S-splitting and linear disjointness from arbitrary M; this is an extension of the global-field direction and must be owned there, as a proposed Part II if the upstream layers do not cover it.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`](#ag20-polarized-automorphic-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.3/s-general-solvable-extension-families`](#ag23-s-general-solvable-extension-families).

### Supplier 5: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

Algebraic CM character extension in CHT08 Lemma 4.1.4, pp.118–119: for χ on F^+, unramified at a finite split set S and with constant real χ_v(−1), construct ψ on F, unramified above S, ψψ^c=χ∘Norm, infinity exponents m_τ,w−m_τ. Prove the norm-idèle subgroup extension and its parity obstruction. The source is now read; the precise API remains an extension of GlobalNumberFields, not a duplicate AG2 definition. Lemma 4.1.5 supplies the separate crystalline Galois-character version with its stated hypotheses.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`](#ag20-galois-character-of-an-algebraic-hecke-character), [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`](#ag20-polarized-automorphic-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.2/algebraic-character-polarization-twist`](#ag22-algebraic-character-polarization-twist).

### Supplier 6: `AutomorphicBundles:B2`

Algebraic local systems for the compact Shin similitude datum, retaining a₀ and the selected CM type, and their comparison with the associated highest-weight representations.
TY §2 realization L_ξ=ε_ξ R^{m_ξ}(A_U^{m_ξ}/X_U)(t_ξ), including explicit ξ↦(m_ξ,t_ξ,ε_ξ), central character and graded permutation signs.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/unitary-similitude-central-character-dictionary`](#ag20-unitary-similitude-central-character-dictionary), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector).

### Supplier 7: `AutomorphicFormsOnReductiveGroups:AF.4`

Clozel’s Aut(C)-conjugate regular algebraic cuspidal π and its archimedean coefficient weight, as in Newton–Thorne Theorem 5.1 (Clozel Theorem 3.13). This extends the present rationality node’s explicit API.
Banach spaces of overconvergent definite-unitary automorphic forms with compact v₀ controlling operator, the fixed other infinity weights and linked tame-level maps. L2a only glues supplied families.
Definite-unitary classicality at sufficiently dominant varied weights relative to a finite slope, and Zariski density of slightly regular classical points with the other weights fixed, as in CH Theorem 2.3 / Ch Theorems 3.3 and 3.5.
Liu et al. Lemma 3.1.2: rational coefficient model and strong multiplicity one identify the field of a relevant representation with the compositum of its normalized spherical polynomial fields.

Clozel conjugation theorem in NT Theorem 5.1: σπ exists, is cuspidal regular algebraic and has finite components σπ^∞; number-field rationality.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`](#ag20-field-of-rationality), [`AutomorphicGaloisRepresentationsPartII:AG2.0/relevant-automorphic-coefficient-field`](#ag20-relevant-automorphic-coefficient-field), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`](#ag23-definite-unitary-eigenvariety-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.3/strongly-regular-classical-density`](#ag23-strongly-regular-classical-density), [`AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`](#ag26-complex-and-local-coefficient-conjugation).

### Supplier 8: `PELModuli:M0`

Shin Lemma 5.1 compact similitude datum: odd n≥3, one signature (1,n−1), definite other signatures, finite quasi-split factors, reflex embedding and positivity. Current PEL conventions must specialize to this datum.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`](#ag21a-compact-shin-pel-instance).

### Supplier 9: `PELModuli:M4`

Smooth proper generic-fibre models X_U with universal A_U and finite étale level maps; Harris–Taylor Drinfeld integral levels at a split prime, allowing ramified F_w/Q_p. Do not substitute the unramified signature (n,n) model.
Effective polarized O_F-linear Kottwitz triples for the compact datum, with prime-to-p level, p-adic type and α₀=0; establish the actual multiplicity in the raw count.
HLTT §§3–4 quasi-split G_n integral ordinary level models and mixed Kuga families, with the right/left action conventions and common generic fibres.
Caraiani §7 compact unitary two-signature (1,n−1),(1,n−1) instance, Iwahori integral models and the product of two semistable charts after the source solvable extensions.

The projective flat compact Drinfeld integral models, deformation representability for the one-dimensional O_{F_w} factor, zero-level smoothness, formal-height stratification and dimension formulas of Shin §5.2, pp.32–34, including ramified F_w. For the local EL framed moduli problem, supply representability and the stated level tower over O_{F_w^ur-hat}. This does not import general ramified PEL local-model smoothness.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-drinfeld-newton-models`](#ag21a-compact-drinfeld-newton-models), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`](#ag21a-compact-shin-pel-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`](#ag21a-raw-fixed-point-trace-identity), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-el-rapoport-zink-cohomology`](#ag21b-compact-el-rapoport-zink-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`](#ag25-caraiani-tensor-square-geometric-instance).

### Supplier 10: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-2-young-symmetrizers`

Rationally normalized Young idempotents and denominator control, with the graded permutation action appropriate to tensor powers of H¹; import this upstream theory, not a second Schur-functor library.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector).

### Supplier 11: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`

The highest-weight ξ summand and its explicit rational tensor realization, including determinant/dual twists and the chosen polarization. Match the geometric H¹ sign convention.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector).

### Supplier 12: `EtaleDualityAndPerverseSheaves:EDC.2`

Étale derived pushforward, Leray spectral sequence and relative Künneth for the proper abelian tower; compatible with finite correspondences and rational summands.

Compact-support cohomology and coefficient descent for the finite compact Igusa covers and the compact almost-product correspondence, with prime-to-p Hecke, G and J_b actions and bounded level-colimit behavior. The almost-product identity is specifically Mantovan/Shin Proposition 5.2; it is not a consequence of Künneth alone.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/coefficient-projector-degree-identity`](#ag21a-coefficient-projector-degree-identity), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/mantovan-ext-functor`](#ag21b-mantovan-ext-functor).

### Supplier 13: `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`

Smooth admissible characteristic-zero representations, fixed-level invariants and Grothendieck groups for the adelic tower, with exactness of compact-open invariants.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-level-coefficient-cohomology`](#ag21a-finite-level-coefficient-cohomology).

### Supplier 14: `DeligneWeightsAndPurity:DWP.7`

Proper smooth purity for the geometric Kuga–Sato summand, with its algebraic correspondence, degree k+m_ξ and twist t_ξ; equality m_ξ−2t_ξ=w(ξ).

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/finite-continuous-geometric-galois-action`](#ag21a-finite-continuous-geometric-galois-action).

### Supplier 15: `EtaleDualityAndPerverseSheaves:EDC.8`

Fujiwara/Varshavsky Lefschetz–Verdier trace for Hecke cohomological correspondences composed with sufficiently high Frobenius, including coefficients and compact support; keep it independent of ET.5.
The current EDC.8 statement supplies the trace class and explicitly sends stronger Fujiwara/contracting-boundary results to ET.5. Refine a single generic owner to supply the above theorem before automorphic stabilization; ET.5 should specialize it to Igusa varieties. Until that owner split is reconciled, this is a requested extension, not an available EDC.8 theorem.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`](#ag21a-raw-fixed-point-trace-identity).

### Supplier 16: `LefschetzPencilsAndVanishingCycles:LPV.0`

Proper nearby-cycle comparison with the graded coefficient projector for the compact Drinfeld model, including the Galois/Hecke actions.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`](#ag21a-raw-nearby-cycle-traces).

### Supplier 17: `LefschetzPencilsAndVanishingCycles:LPV.1`

Monodromy, specialization and trace compatibility on the actual Drinfeld charts, including ramified local fields; no LLC is an input.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`](#ag21a-raw-nearby-cycle-traces).

### Supplier 18: `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`

Derived smooth Ext with compact-support cohomology, level-colimit compatibility and Grothendieck additivity needed for the precise Mantovan functor.

Smooth derived Ext for the classical EL Rapoport–Zink compact-support complexes, bounded admissibility and exact-sequence additivity, with compatible level colimits and G×Weil actions. This supplies the exact functor used by Shin p.34 before any LLC evaluation.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`](#ag21b-compact-global-mantovan-formula), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/mantovan-ext-functor`](#ag21b-mantovan-ext-functor).

### Supplier 19: `EndoscopicTransferAndUnitaryTraceComparison:ET.5`

Stable Igusa trace formula for Shin’s compact datum and all its admissible classes b, with the §3.4/§5.3 transfer factors; raw geometric traces come from AG2.1a.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`](#ag21b-shin-st-end-igusa-computation).

### Supplier 20: `EndoscopicTransferAndUnitaryTraceComparison:ET.7b`

Twisted endoscopic character identities for the exact ST/END hypotheses of Shin §6.1, plus §3.6 archimedean sign calculation; not a universal multiplicity-one assertion.
Caraiani Proposition 5.8 characteristic-zero trace computation for the two-signature product strata; keep its packet, sign and local transfer restrictions.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/shin-st-end-igusa-computation`](#ag21b-shin-st-end-igusa-computation), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`](#ag25-caraiani-stratum-concentration).

### Supplier 21: `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`

Shin Propositions 2.2–2.3: normalized local Mantovan/reduction formulas for supercuspidal, generalized Steinberg Sp_s and parabolic inputs over possibly ramified F_w, including Weil twist. A supercuspidal-only Drinfeld export does not suffice.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/virtual-weil-constituent-comparison`](#ag21b-virtual-weil-constituent-comparison).

### Supplier 22: `DeligneWeightsAndPurity:DWP.0`

Eigenvalue-weight separation: classes of pure representations of distinct weights cannot cancel in the Weil Grothendieck group; apply to every actual graded summand.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`](#ag21b-weight-separation-middle-degree).

### Supplier 23: `PadicHodgeTheory:R06.5`

Geometric de Rham comparison for the compact Kuga–Sato projector and the labelled filtered dimensions in Shin Corollary 6.7, available before coefficient-system packaging AG2.6.

Projector-compatible filtered semistable comparison for the PEL/Kuga–Sato realizations, with D_st, N and cup products; the existing good-reduction node supplies only the smooth proper crystalline case.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`](#ag21b-actual-galois-constituent-from-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`](#ag26-geometric-coefficient-prime-comparison).

### Supplier 24: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`

Stable base change and the rank-m plus character endoscopic embedding in Shin §7.1, including the selected parity branch in Lemma 7.3 and good Hecke-polynomial identity.
HLTT Proposition 1.2 discrete stable transfer for square-integrable cohomological G_n representations, and the GL discrete classification with all m_i,n_i and half-integral norm twists. Also CS Corollary 5.5.5 parity character ϖ and its normalized discrete blocks.
Cuspidal solvable base change, finite exceptional self-twist extensions, and residue-degree Satake power compatibility; no automorphic Galois existence may be a prerequisite of the good polynomial identity.
Strong descent to the totally definite G₀ of CH Lemma 2.1, with the target refined Hecke eigensystem and prescribed tame local Bernstein data.
Caraiani §7 tensor-square packet comparison with the exact scalar characters, multiplicity and base-change factors; must identify actual middle cohomology, not just an alternating virtual tensor class.
Clozel–Thorne §3.5 selected real L-packet branches in stable base change and the source trace identities. CS §5.6 simple-Kottwitz inner-form variants require their own datum and stabilized packet comparison; import the exact variant, never identify it with Shin’s compact instance.
CS Corollaries 5.5.2/5.5.5 use the selected two-block transfer G_{n₁,n₂}, the surjective cohomological quotient, the source splitting set and ζ̃ L-morphism. Retain these hypotheses; the corollary does not state a general discrete GL_N theorem.

S-general cyclic base-change and patching/descent from CH §3.1–3.2, including finite excluded cuspidality extensions, local Grunwald–Wang realization and coefficient-place splitting.

CS5.5.5 Shin stable/endoscopic transfer with L-morphism ζ̃_{n1,n2} and the parity-corrected auxiliary Hecke character ϖ, identifying the twisted direct-sum Satake polynomial.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`](#ag22-attachment-under-solvable-base-change), [`AutomorphicGaloisRepresentationsPartII:AG2.2/cs-discrete-polarization-normalization`](#ag22-cs-discrete-polarization-normalization), [`AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`](#ag22-discrete-unitary-galois-assembly), [`AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`](#ag22-shin-regular-geometric-existence), [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-unitary-eigenvariety-instance`](#ag23-definite-unitary-eigenvariety-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`](#ag25-caraiani-tensor-square-geometric-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`](#ag26-coefficient-hodge-comparison-through-families-and-descent), [`AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`](#ag26-full-polarized-comparison-at-the-coefficient-prime), [`AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`](#ag26-totally-real-polarized-coefficient-prime-descent), [`AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`](#ag27-unitary-discrete-parameter-export).

### Supplier 25: `IntegralHeckeAndGaloisDeterminants:IHG.4`

Characteristic-zero continuous pseudocharacter/determinant interpolation on reduced affinoid eigenvariety Hecke charts from a determining classical set, and continuity of specialized semisimple reconstruction even when residual or characteristic-zero representations are reducible.
Descent of characteristic-zero continuous determinant/pseudocharacter data along the integral Hecke quotients arising from the HLTT Hasse surjection, with uniform modulus and ramification. Supply the quotient identity and denominator control when p divides (2n)!; reconcile the finite-product witness API with a surjective classical Hecke comparison.
Generic HLTT Proposition 7.12 factor separation: continuous semisimple rank-2d ρ_m for infinitely many integer m, dense F, characteristic-zero algebraically closed k, continuous µ of infinite order on each f∈F, roots E₁(f)⊔E₂(f)µ(f)^m. Construct actual continuous rank-d factors by finite-product reductive Zariski closure and separation of connected-centre weights. Must be independent of TC.2 and automorphic existence.
CH Theorem 2.3 / Bellaïche–Chenevier §6.5 local family theorem: continuity of ramified Weil trace functions and specialization of the full inertial monodromy bound on the definite affinoid family with fixed tame Bernstein/parameter restrictions. This polarized route must not assume Varma’s theorem or Caraiani’s pure-WD upgrade.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.3/definite-family-determinant-interpolation`](#ag23-definite-family-determinant-interpolation), [`AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`](#ag24-uniform-integral-hecke-congruence-witnesses), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-factor-separation-specialization`](#ag24-hltt-factor-separation-specialization), [`AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`](#ag25-ch-polarized-local-monodromy-bound).

### Supplier 26: `ArithmeticGaloisRepresentations:R01.5`

Sorensen effective patching of continuous semisimple rank-n representations over an S-general fixed-prime-degree cyclic extension family, with conjugation invariance and compositum compatibility; source CH §3.1. Keep the generic theorem in arithmetic Galois theory.
Use the corrected arithmetic blueprint recognition-by-characteristic-polynomials-and-coefficient-descent over any number field, characteristic-zero Hausdorff coefficient fields with fixed continuous embeddings, equal good Frobenius polynomials on a density-one set, and semisimple conclusion. The integrated decomposition’s earlier G_Q/finite-residue-field formulation alone is too narrow. Keep rational-eigenvalue-descent separate: traces in a characteristic-zero field M and one element with distinct M-rational eigenvalues.

Import the existing arbitrary-rank characteristic-zero/residual Chebotarev–Brauer–Nesbitt recognition target. Additional need: the precise regular-Frobenius simultaneous descent obstruction-splitting criterion used by CH Proposition 3.2.5 (traces in E₀, split regular Frobenius, and two good places of different residue characteristics for a uniform number-field enlargement). Do not re-plan generic recognition as a rank-two-only supplier.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/attachment-twist-dual-and-conjugation`](#ag20-attachment-twist-dual-and-conjugation), [`AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`](#ag20-galois-representation-attached-at-good-places), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`](#ag21b-actual-galois-constituent-from-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.2/attachment-under-solvable-base-change`](#ag22-attachment-under-solvable-base-change), [`AutomorphicGaloisRepresentationsPartII:AG2.3/effective-automorphic-galois-patching`](#ag23-effective-automorphic-galois-patching), [`AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`](#ag23-finite-number-field-of-realization), [`AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`](#ag25-late-gl2-modular-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`](#ag26-coefficient-embedding-independence-and-semisimple-uniqueness), [`AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`](#ag26-strong-coefficient-field), [`AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`](#ag26-uniform-strong-realization-for-polarized-systems), [`AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi`](#ag27-finite-exceptional-residual-genericity-for-relevant-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`](#ag27-infinitely-many-decomposed-generic-primes).

### Supplier 27: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

Local GL_n parameter and cyclic base-change compatibility: after a finite solvable extension killing inertia of the Weil part, the local representation has Iwahori invariants. This uses the classical local parameter, not AG2.5 compatibility for already constructed global representations.
Unramified Satake normalization of the constructed local GL_n correspondence, geometric Artin, L_n=rec(π|det|^{(1−n)/2}), and the comparison with rec^T; supply this as a late comparison.
TY Lemma 1.4(3): all coefficient conjugates tempered iff the normalized local parameter is pure, with the geometric weight shift; import the local theorem, do not define purity again.
CS published Remark 5.5.6: at split places transfer via the specified L-morphism preserves the geometric local normalization. A direct sum of characters with no ratio equal to the cyclotomic character gives a generic principal series. Retain the all-ordered-pairs condition and its particular transfer datum.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-local-iwahori-reduction`](#ag23-solvable-local-iwahori-reduction), [`AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`](#ag20-the-normalization-dictionary-fixed-by-the-sources), [`AutomorphicGaloisRepresentationsPartII:AG2.5/racsdc-temperedness`](#ag25-racsdc-temperedness), [`AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations`](#ag25-published-racsdc-comparison-specializations).

### Supplier 28: `ShimuraCompactifications:C3`

HLTT minimal/toroidal compactification and SNC Kuga boundary charts, level/cone transition maps and formal ordinary completions.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance).

### Supplier 29: `ShimuraCompactifications:C5`

HLTT exact integral ordinary boundary charts and Hasse section modulo p^M; include ampleness of ω on X^min and extension of subcanonical bundles.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance).

### Supplier 30: `AutomorphicBundles:B3`

Canonical/subcanonical automorphic extensions on the HLTT mixed ordinary models, their coefficient lattices, boundary vanishing and determinant weight shifts.
Compute the explicit algebraic graded pieces ρ_{m,s}^{i,j} of logarithmic differentials and their finite filtration in HLTT Proposition 6.15, with subcanonical extension, trace factor and ordinary higher-cohomology vanishing.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.4/logarithmic-cusp-section-spectral-sequence`](#ag24-logarithmic-cusp-section-spectral-sequence).

### Supplier 31: `PadicDifferentialEquationsAndRigidCohomology:RD.4`

GK Theorem 5.1 / HLTT Lemma 6.8: rigid cohomology equals de Rham hypercohomology of the specified dagger tube, functorial in morphisms via compatible formal closures and covers, hence Frobenius and Hecke compatible. F1 supplies geometry, not this comparison.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-functorial-dagger-rigid-comparison`](#ag24-hltt-functorial-dagger-rigid-comparison).

### Supplier 32: `PadicDifferentialEquationsAndRigidCohomology:RD.5`

Finite-dimensional rigid cohomology of the smooth quasi-projective HLTT boundary strata, compatible with the displayed Čech spectral sequence.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence`](#ag24-boundary-stratum-weight-zero-sequence).

### Supplier 33: `PadicDifferentialEquationsAndRigidCohomology:RD.6`

Rigid Frobenius weight lower bound w≥i on H^i of the smooth quasi-projective boundary strata, as used in HLTT Corollary 6.24; isolate weight zero and retain the degree-zero surjection exception.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-stratum-weight-zero-sequence`](#ag24-boundary-stratum-weight-zero-sequence).

### Supplier 34: `ArithmeticGaloisRepresentations:R01.2`

Complete the current WD classification API with Sp strings, isotypic monodromy partitions, dominance by all initial sums/ranks of all N powers, and Varma Lemma 9.2 comparison of Weil-twist and inertia orders. Keep these generic notions in R01.2.
TY Lemma 1.4(2),(4) primitive-string uniqueness of a pure WD extension up to equivalence and invariance/detection under finite local extension; tensor-square purity detects purity for the parameter and N⊗1+1⊗N. The current purity-definition node alone does not supply these theorems.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.5/monodromy-order-interface`](#ag25-monodromy-order-interface), [`AutomorphicGaloisRepresentationsPartII:AG2.5/pure-weil-deligne-comparison`](#ag25-pure-weil-deligne-comparison).

### Supplier 35: `SmoothRepresentationsOfLocalGroups:SR.3`

Bernstein components/centre and the local trace functions σ↦tr rec(π)(σ), plus the type idempotent e_{Π,B} cutting out the target monodromy bound, as in Varma §9.1.
The fixed tame Bernstein-component and monodromy-bound condition imposed in CH Theorem 2.3 / BC §6.5; its trace functions and local-type inequalities on all relevant classical specializations.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`](#ag25-varma-integral-bernstein-operators), [`AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`](#ag25-ch-polarized-local-monodromy-bound).

### Supplier 36: `SmoothRepresentationsOfLocalGroups:SR.5`

Integral Bernstein operators with a uniform denominator across the permitted finite component union and all algebraic weights, Varma §7.2. Supply their lattice-preserving action for HLTT ordinary congruences.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-integral-bernstein-operators`](#ag25-varma-integral-bernstein-operators).

### Supplier 37: `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`

Nondegenerate trace pairing on the image algebra of a characteristic-zero semisimple representation, used to convert all traces against τ into exterior-power annihilation. Import the upstream algebra theory.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.5/varma-monodromy-rank-bound`](#ag25-varma-monodromy-rank-bound).

### Supplier 38: `LefschetzPencilsAndVanishingCycles:LPV.6`

Caraiani Proposition 3.9, Propositions 4.6/4.10 and Corollary 4.29: derived nearby cycles on étale-local products of two semistable charts over one trait with characteristic-zero ℓ-adic coefficients; N=N₁⊗1+1⊗N₂; kernel/image bifiltration of total N and its stratum spectral sequence with shifts, twists and correspondence equivariance.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-tensor-square-geometric-instance`](#ag25-caraiani-tensor-square-geometric-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.5/two-chart-nearby-cycle-monodromy`](#ag25-two-chart-nearby-cycle-monodromy).

### Supplier 39: `DeligneWeightsAndPurity:DWP.8`

Weight filtrations and degeneration/separation for the actual double-filtered nearby-cycle stratum complexes of Caraiani §7, with N and Tate twists; keep the general weight formalism in DWP.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.5/tensor-square-weight-spectral-sequence`](#ag25-tensor-square-weight-spectral-sequence).

### Supplier 40: `ArithmeticGaloisRepresentations:G7`

BC sign under algebraic twists, semisimple factor assembly and specialization (including potentially reducible target), plus the G_n extension equivalence; import these generic polarized-carrier operations. The automorphic sign theorem itself is AG2.3.
Use G7/polarized-representation, polarization-sign-and-determinant, operations-on-polarized-representations and clozel-harris-taylor-group. These generic carriers have no residual Schur, p>2 or deformation-ring hypothesis. The GlobalGaloisDeformations G7 polarized deformation problem does not supply this interface.

For a continuous finite-local-field CM polarized representation with multiplier ε_ℓ^(1−n)r_χ, prove that stable-lattice reduction followed by semisimplification admits the residual polarization and continuous extension G_{F+}→𝒢_n over the finite residue field or its algebraic closure, with multiplier ε̄_ℓ^(1−n)r̄_χ and the specified complex-conjugation sign. Retain the characteristic-2 case allowed by BLGGT §2.1, p.34, or prove exactly the additional restriction needed there. Do not impose Schur/absolute-irreducibility or deformation-ring hypotheses. Generic polarization and conjugation-extension constructions belong here; GlobalGaloisDeformations:G7/polarized-deformation-problem consumes a given extension and does not supply it.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`](#ag20-polarized-galois-representation), [`AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign`](#ag23-automorphic-polarization-and-sign), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi).

### Supplier 41: `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-1-simple-modules-schur-and-isotypic-components`

Characteristic-zero Schur/isotypic decomposition and evaluation for semisimple finite-level modules; compact automorphic tower decomposition is supplied separately by AF.1.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1a/automorphic-multiplicity-spaces`](#ag21a-automorphic-multiplicity-spaces).

### Supplier 42: `CrystallineCohomology:CR.6`

Part II extension: Caraiani §§3–4 two-boundary log de Rham–Witt complex, residue realization of N (Proposition 4.4), and Theorem 4.6 bi-indexed stratum spectral sequence with its Tate twists. The existing ordinary Hyodo–Kato theory is a base, not this full generalized sequence.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`](#ag26-log-crystalline-purity-on-the-automorphic-summand).

### Supplier 43: `WeightsInEtaleCohomology:R34.6`

Purity and monodromy-weight inference for the projected Caraiani two-boundary spectral sequence, after the explicit diagonal concentration of projected closed-stratum cohomology; retain the concentration hypothesis.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`](#ag26-log-crystalline-purity-on-the-automorphic-summand).

### Supplier 44: `ArithmeticGaloisRepresentations:R01.1`

The compact-image Baire finite-p-adic-realization theorem for continuous maps from profinite G to GL_n(Q̄_ℓ), with countability of finite local extensions and closedness of GL_n(E), before the existing local-field lattice theorem.

Continuous coefficient change, restriction, dual and tensor operations on characteristic-zero semisimple representations, with semisimplification when necessary and characteristic-polynomial invariance. Keep positive-characteristic tensor semisimplicity out of this contract.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-data`](#ag26-compatible-family-data), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-family-operations`](#ag26-compatible-family-operations), [`AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`](#ag27-completely-split-generic-prime), [`AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`](#ag27-finite-p-adic-field-of-realization), [`AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`](#ag27-the-residual-ratio-condition-for-taylor-wiles-primes).

### Supplier 45: `IntegralHeckeAndGaloisDeterminants:IHG.3`

T^S with geometric rank-n Hecke polynomials, its integral eigencharacters, residue quotients, dual involution and algebraic-character twist; interpolate elsewhere over nonreduced rings, with this interface receiving only classical comparisons.

Use existing upstream Layers 3a–3b: normalized spherical polynomial, residual Galois type and non-Eisenstein predicates, conjugacy-saturated Frobenius uniqueness and polynomial-law dual/twist transport. AG2 needs only their automorphic specialization; do not reintroduce the two old generic definitions. Dual/twist also needs the actual Hecke algebra involution/character action on eigencharacters.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`](#ag27-dual-and-character-twist-hecke-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`](#ag27-residual-hecke-ideal-independence).

### Supplier 46: `ShimuraData:D4`

The hyperbolic unitary PEL datum defines the Shimura datum of signature (n,n), its domain and source-compatible reflex/level data, with dimension [F^+:Q]n². It is distinct from the compact signature (1,n−1) datum.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-quasi-split-unitary-datum`](#ag24-hltt-quasi-split-unitary-datum).

### Supplier 47: `AdelicAlgebraicGroups:AA.1`

Adelic point functor and split-factor identifications for the rational PEL similitude group, preserving ν and its Siegel Levi.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-quasi-split-unitary-datum`](#ag24-hltt-quasi-split-unitary-datum).

### Supplier 48: `AdicCoefficientsAndComparisons:L0`

Use the existing six-operations-for-adic-coefficients node with the precise representability/compactifiability and dimension bounds for each local EL level, and filtered unions when that level is not quasicompact. This supplies the cohomology formalism, not Rapoport–Zink moduli representability or Mantovan almost-product descent.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-el-rapoport-zink-cohomology`](#ag21b-compact-el-rapoport-zink-cohomology).

### Supplier 49: `PadicHodgeTheory:R06.3`

Potential semistability and the local WD functor on actual de Rham members; here only the strength/purity interfaces are used. No period dimensions are inferred from a raw family.

Used by [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatibility-strength-predicates`](#ag26-compatibility-strength-predicates).

## Gaps preventing closure

### Explicit coefficient realization

TY cites HT01 pp. 97–98 for the recipe ξ↦m_ξ,t_ξ,ε_ξ. Those pages were unavailable. The B2 and Schur–Weyl requests must provide the recipe and verify its parity and Tate twist; no unspecified projector is accepted as a proof.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1a/kuga-sato-coefficient-projector`](#ag21a-kuga-sato-coefficient-projector).

### Polarized Kottwitz-triple effectivity

The current Honda–Tate node classifies abelian varieties up to isogeny. Raw fixed-point counting additionally needs a polarized O_F-linear realization with prescribed p-adic isocrystal, positivity and trivial Kottwitz obstruction α₀. Request PEL M4 refinement; do not infer it from the unpolarized Honda–Tate node.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`](#ag21a-raw-fixed-point-trace-identity).

### Middle-degree cancellation source step

Shin Corollary 6.5 imports the Harris–Taylor p. 207 argument, beyond just purity of H^k. That unavailable passage must supply the selected-constituent weight bounds under the exact ST/END hypotheses. Geometric purity plus a virtual rank equality alone is not a proof of concentration.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1b/weight-separation-middle-degree`](#ag21b-weight-separation-middle-degree).

### Irreducible multiplicity divisibility

Shin Corollary 6.8 invokes HT01 Proposition VII.1.8 and explains the adjusted assumptions in Remark 6.9. The book proof was unavailable. The required lemma is divisibility of every irreducible Galois multiplicity by C_G, using the labelled geometric de Rham dimensions and independence of τ. Numerical rank divisibility is expressly insufficient.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1b/actual-galois-constituent-from-cohomology`](#ag21b-actual-galois-constituent-from-cohomology).

### GSp₄ route and dedicated ownership

Confirmed RT-AREA-langlands-1/19 routes the regular GSp₄ systems, Calegari–Geraghty Proposition 6.8 GSp₄-valuedness and Sorensen parahoric/inertia bounds, Pilloni Theorem 5.1.7.1 and its normalization and GSp₄ ramified comparisons to the proposed GSp4LocalLanglandsAndGaloisRepresentations owner. No such roadmap/stage exists in the atlas yet, so a fabricated supplier id is not used. The source-route obligation for AG2.2 and AG2.5 is recorded as this explicit ownership gap, pending creation of that owner. The contract must preserve Calegari–Geraghty Proposition 6.8(1)–(2),(5), the Mok/Bellaïche–Chenevier GSp₄-valuedness argument and Sorensen’s Iwahori/Klingen/paraspherical/inertia cases, and Pilloni Theorem 5.1.7.1(2),(5) with its geometric-Frobenius normalization and the routed E27 correction. Coefficient-prime and ordinary-shape clauses go with that owner’s p-adic package, not with this away-prime blueprint. Only the generic GL_n sign theorem is kept in AG2.3; GL₄ polarized construction and generic pure WD theory are imported by the dedicated owner.

Affects `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

### Intrinsic boundary-pair independence

HLTT explicitly says its cohomology should depend only on the intrinsic pair but this is unproved; the plan uses a fixed Σ and the constructed transition-map colimit. A proof of intrinsic compactification/refinement independence is still required for the stronger stage wording; it must not be inferred from Lemma 6.19’s finite-level invariants.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.4/boundary-support-dagger-cohomology`](#ag24-boundary-support-dagger-cohomology).

### HLTT quotient witness versus injection contract

The existing upstream IHG Layer 4 joint-injectivity contract is phrased using an injective map into a finite product, whereas the Hasse construction naturally gives a surjective classical Hecke comparison. A generic quotient-descent lemma with continuity and polynomial-law identities, or a construction of the required injective witnesses from these quotients, remains necessary. This contract is requested explicitly; pointwise Hecke congruence is not treated as that lemma.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.4/uniform-integral-hecke-congruence-witnesses`](#ag24-uniform-integral-hecke-congruence-witnesses).

### Inertial family specialization contract

Chenevier’s public chapter, pp.19–21, now supplies the Bernstein trace interpolation, Weil/inertia partition conversion and application. The generic inertia-isotypic monodromy specialization theorem used there is Bellaïche–Chenevier Proposition 7.8.19; its complete hypotheses and proof are still an IHG.4/SR.3 refinement contract. Do not use Varma’s nonselfdual comparison as the polarized theorem’s own input.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.5/ch-polarized-local-monodromy-bound`](#ag25-ch-polarized-local-monodromy-bound).

### Liu middle-degree identification range

Liu et al. Hypothesis 3.2.10 identifies the irreducible automorphic representation with Hom_{G(A_f)} in degree N−1 for its specified indefinite unitary group. Proposition 3.2.11 verifies low ranks N≤3 and cites unpublished Kisin–Shin–Zhu for the further F⁺≠Q range. No public proof of that unpublished input was obtained. Keep the identification conditional outside the proved range; no universal geometric realization is used.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.5/published-racsdc-comparison-specializations`](#ag25-published-racsdc-comparison-specializations).

### Coefficient realization dependency

CH Proposition 3.2.5 needs the regular Hodge–Tate/de Rham assertion established by its family comparison. The generic p-adic Hodge regular-semisimple criterion is requested here; the automorphic admissibility proof is assigned to AG2.6 and is not used by the early AG2.0 trace-field dictionary. The finite-field target stays planned with this precise dependency, rather than asserting trace-field descent.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.3/finite-number-field-of-realization`](#ag23-finite-number-field-of-realization).

### Early fixed-point theorem owner refinement

EDC.8 constructs Lefschetz–Verdier trace classes but explicitly leaves the stronger Fujiwara/Varshavsky fixed-point result to ET.5. The raw compact Hecke–Frobenius identity needs that geometric result before ET.5 stabilization and ET.6 LLC/global comparison. Reconcile one generic owner with the existing ET.5 assignment; do not infer the fixed-point equality from a trace-class construction or import the stabilized automorphic formula into its own raw input.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`](#ag21a-raw-fixed-point-trace-identity).

### Generalized two-boundary log-crystalline comparison

CR.6 and the existing geometric period comparison do not yet specify Caraiani’s full two-boundary weight spectral sequence and the projected-stratum concentration interface. The target node records its exact source and proof; the reusable sequence is requested as a CrystallineCohomology, Part II extension.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`](#ag26-log-crystalline-purity-on-the-automorphic-summand).

### AHTW quantitative cohomology and arbitrary-multiplicity pseudodeformations

The source theorem is fully stated, but the supplier chain is not already closed by the atlas: AHTW Theorem 2.5.7 uses quantitative local Shimura cohomology annihilators (FS/HKW, Mantovan/HL25, Harris–Viehmann cases), not the subsequent generic-only torsion-concentration theorem; Theorem 3.3.6 constructs reduced p-torsion-free bounded potentially semistable/crystalline pseudodeformation quotients with arbitrary residual multiplicities using Wake–Wang Erickson stable conditions and the bounded stable-condition algebraization/comparison results of WE15/WWE19. AHTW explains why it avoids assuming general formal GAGA; no general quotient-stack GAGA theorem is asserted as a prerequisite. Existing BunG/Newton and fixed-representation R08.3 foundations do not contain these full extensions. Precise Part II supplier extensions must be designed without a torsion-concentration→AG2.6 cycle.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`](#ag26-all-cm-de-rham-and-semisimplified-coefficient-comparison).

### Polarization through residual semisimplification

BLGGT §2.1, p.34 states the residual CM 𝒢_n-extension, but the previously cited deformation-problem node assumes it. ArithmeticGaloisRepresentations G7 owns the generic pairing/conjugation API; its exact reduction-and-semisimplification extension is requested here, including the coefficient-characteristic boundary, without importing Schur hypotheses. No self-dual lattice is asserted.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`](#ag27-residual-representation-of-pi).

### Compact ramified local geometry and almost-product proof

Shin §5.2, pp.33–34 explicitly extends the one-dimensional compact Drinfeld setting to ramified F_w and cites Drinfeld/HT01 and Mantovan. Its source-level recipe is read. A complete formal proof of the ramified deformation, finite Igusa descent and almost-product/coefficient comparison is still required. No general unramified PEL theorem or generic local-shtuka layer closes it; the precise PEL/cohomology requests are recorded.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-drinfeld-newton-models`](#ag21a-compact-drinfeld-newton-models), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-mantovan-igusa-tower`](#ag21a-compact-mantovan-igusa-tower), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-el-rapoport-zink-cohomology`](#ag21b-compact-el-rapoport-zink-cohomology), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/mantovan-ext-functor`](#ag21b-mantovan-ext-functor).

### Coefficient-prime tensor-square realization and log sequence

The at-p Caraiani realization has two distinguished places and projected closed strata. Its exact realization, multiplicity/projector/Tate dictionary and two-boundary log-crystalline concentration are not supplied merely by the away-prime tensor-square node. CrystallineCohomology CR.6 and the raw geometric supplier requests must supply this extension before purity is inferred.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`](#ag26-log-crystalline-purity-on-the-automorphic-summand).

### AHTW maximal-orbit and non-Siegel boundary extensions

The arbitrary-regular all-CM theorem needs quantitative cohomological annihilators, non-Siegel boundary induction and bounded arbitrary-multiplicity pseudodeformations; HLTT’s characteristic-zero boundary package does not provide them. The monodromy corollary additionally needs the characteristic-zero generic maximal-orbit theorem (AHTW §6), not just the definition of Varma dominance. The source locators specify the required extensions, without using a downstream residual-genericity theorem.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`](#ag26-all-cm-de-rham-and-semisimplified-coefficient-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`](#ag26-nonselfdual-coefficient-prime-monodromy-bound).

### Historical part dependency redirects

The two independently accepted part packets are immutable deliverables of other jobs. Their ids are reused here, not duplicated in nodes. importChecks gives the reconciled full contract, and dependencyReconciliation enumerates every old/new prerequisite list. The atlas promoter does not interpret those metadata as edits: the maintainer must redirect the historical consumer edges when promoting this full-scope plan. Until that happens, the old graph retains upward tier edges and the old generic ideal duplicates; this packet does not claim that the historical live graph is already repaired. Independent review reproduced the production merge: 129 declarations and 54 planets, rather than the proposed 124 and 46. Five excluded historical nodes persist and 35 retained contracts differ in statement, hypotheses, prerequisites, parent, API or tests. Neither importChecks nor the reconciliation/exclusion metadata is applied by scripts/blueprints.py. Acceptance must wait for an executable, scoped supersession/redirect mechanism and verification of the resulting graph; recording the desired edits does not install the reviewed specification. This is a promotion blocker, separate from the openly recorded mathematical proof gaps. Contracting the effective production prerequisites to owning layers yields AG2.2 ↔ AG2.3: the AG2.3 polarized-existence milestone uses the AG2.2 character twist, while the historical CS discrete normalization stays in AG2.2 and uses that milestone. The proposed move of the CS target to AG2.3 is not applied. Revision 2 also found six prerequisite references to the two excluded generic ideal targets in three external consumers: IG.7/cs-generic-maximal-ideal, IG.7/cohomologically-generic and PL.2/unitary-hecke-algebra. Each consumer uses both obsolete ids, in both its research and promoted packet. Their generic predicate supplier is IntegralHeckeAndGaloisDeterminants IHG.3, current upstream Layer 3b (Spherical.IsGaloisType and Spherical.IsNonEisenstein). Resolve these edges in the same executable repair before removing the obsolete targets. No external reference to the three excluded GSp4 targets was found in the physical nodes scanned; this is not a global graph certificate. The issue permits only this packet, its reader, suggested file and revision handoff; the merger, checker and historical/consumer packets are outside that scope. The revision therefore remains partial pending authorized integration work, rather than claiming that descriptive metadata repairs the production graph.

Affects [`AutomorphicGaloisRepresentationsPartII:AG2.1a/compact-shin-pel-instance`](#ag21a-compact-shin-pel-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity`](#ag21a-raw-fixed-point-trace-identity), [`AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-nearby-cycle-traces`](#ag21a-raw-nearby-cycle-traces), [`AutomorphicGaloisRepresentationsPartII:AG2.1b/compact-global-mantovan-formula`](#ag21b-compact-global-mantovan-formula), [`AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-ordinary-boundary-instance`](#ag24-hltt-ordinary-boundary-instance), [`AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-stratum-concentration`](#ag25-caraiani-stratum-concentration), [`AutomorphicGaloisRepresentationsPartII:AG2.5/late-gl2-modular-comparison`](#ag25-late-gl2-modular-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`](#ag26-extremely-weakly-compatible-system), [`AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`](#ag26-geometric-coefficient-prime-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`](#ag26-compatible-system-of-pi), [`AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`](#ag26-polarized-compatible-system-strictly-pure), [`AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`](#ag26-very-weak-compatibility-under-dgi), [`AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19`](#ag26-rank-two-comparison-with-r19), [`AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding`](#ag26-tensor-automorphy-independent-of-coefficient-embedding), [`AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`](#ag27-residual-hecke-ideal-independence), [`AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`](#ag27-dual-and-character-twist-hecke-comparison), [`AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`](#ag27-unitary-discrete-parameter-export).

## Source corrections

These findings retain their original part-qualified identities and existing independent verdicts. They are described in our own words; the corrected contracts above control the targets. Inherited acceptance is not an independent review of this continuation.

### `AutomorphicGaloisRepresentationsPartII/EAG20-1`

Source `blggt-potential-automorphy`, §2.1, definition of a polarized automorphic representation, p. 32; unchanged in published Annals §2.1, p. 536.

**Problem.** The automorphic parity condition uses the symbol μ although its pair is denoted (π,χ); the subsequent quadratic-character adjustment repeats that mismatched symbol.

**Correction.** Use χ in the automorphic condition and in its δ_{F/F⁺} adjustment. The required parity is the separate weight-dependent correction E2.

**Reason.** The definition introduces only π and χ; no µ is in scope, and the next paragraph speaks of a character µ with (π, µ) polarized, again meaning χ.

**Correction status.** No published correction found. Independently confirmed in arXiv v4 and the published Annals text, p. 536, on 2026-10-07.

**Independent review (2026-10-16): confirmed.** BLGGT arXiv v4 §2.1 p.32 uses χ in the automorphic definition; the displayed μ belongs to the preceding Galois definition. Confirmed in this version, independently of the parity issue.

### `AutomorphicGaloisRepresentationsPartII/EAG20-2`

Source `blggt-potential-automorphy`, §2.1, p. 32 (sign normalisation) and Theorem 2.1.1(1) with its proof, pp. 33–34; published Annals pp. 536–538.

**Problem.** The CM automorphic sign condition is independent of w, namely χ_v(−1)=(−1)^n after repairing the symbol. Theorem 2.1.1(1) then asserts total oddness for the multiplier ε_l^{1−n}r_{l,ι}(χ), and the proof evaluates it at complex conjugation as −1.

**Correction.** For F imaginary and (π, χ) regular algebraic of weight a ∈ (ℤⁿ)_w, the normalisation making (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) totally odd is χ_v(−1) = (−1)^{n+w}. Equivalently, ε_l^{1−n} r_{l,ι}(χ)(c_v) = (−1)^{n−1+w} χ_v(−1), so the printed (−1)^n is right exactly when w is even. The stated result affected is Theorem 2.1.1(1) for odd w; the theorem holds for every polarizable π after replacing χ by χδ_{F/F⁺}, so no result about polarizable π is lost.

**Reason.** χ is algebraic on the totally real F⁺ with wt(χ) = 2w (compare infinitesimal characters in π^c ≅ π^∨ ⊗ χ∘N∘det). By BLGGT A.2, r_{l,ι}(χ) = r_{l,ι}(χ₀) ε_l^{−w} with χ₀ of finite order, so r_{l,ι}(χ)(c_v) = (−1)^w χ_v(−1), and µ(c_v) = (−1)^{n−1+w} χ_v(−1). Counterexample for w odd: n = 1, F imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0)). (ψ, ψ|_{𝔸_ℚ}) satisfies the printed conditions, since ψ|_{𝔸_ℚ} has sign (−1)^1 at ∞. But r_{l,ι}(ψ|_{𝔸_ℚ}) = r_{l,ι}(ψ)∘V (V the transfer) takes c to r_{l,ι}(ψ)(c²) = 1, so µ(c) = +1. A pairing on a line is symmetric, so (r_{l,ι}(ψ), µ) is not polarized, let alone totally odd. The same happens for the base change of a newform of odd weight k (w = k − 2). Patrikis (Math. Ann. 362, p. 8 of arXiv v2) gives the general sign as ω_ι(c_v) = (−1)^w ω_v(−1), consistent with this correction.

**Correction status.** new as a correction of BLGGT; the relation with (−1)^w is implicit in Patrikis 2015, who does not comment on BLGGT's CM normalisation

**Independent review (2026-10-16): confirmed.** BLGGT arXiv v4 §2.1 pp.32–34 and Appendix A.2 p.87 give μ(c_v)=(−1)^(n−1+w)χ_v(−1). A rank-one CM elliptic character with w=1 detects the missing weight factor. Patrikis Proposition 4.1 p.8 independently retains it. This fresh verdict certifies these versions, not a newly inspected publisher edition.

### `AutomorphicGaloisRepresentationsPartII/EAG20-3`

Source `bcgp21-purity`, Published §2.5, Lemma 2.5.1, p. 189; n(r,N)=rank N in preceding paragraph.

**Problem.** Lemma 2.5.1 uses maximum rank of N as a uniqueness criterion for a pure Weil–Deligne extension of the fixed semisimple Weil representation.

**Correction.** Pure extension is unique up to equivalence by TY Lemma 1.4(4). Rank N alone does not characterize it in arbitrary dimension. Use purity’s full family of monodromy-power isomorphisms, or a proved sufficiently refined criterion in the intended restricted rank.

**Reason.** For q=4, fix an unramified semisimple Weil representation whose geometric Frobenius is diag(8,2,2,1/2,1/2,1/8), with weights (3,1,1,−1,−1,−3). Let N_p have chains (0,1,3,5),(2,4), and N_i have chains (0,1,3),(2,4,5), each sending an entry to the next. Both satisfy FNF^−1=N/4 and have rank 4, the maximum allowed by the graded dimensions (1,2,2,1). N_p is pure of weight 0 with strings of lengths 4 and 2. N_i has strings of length 3 centred at weights 1 and −1, is not pure, and has N_i³=0 while rank N_p³=1. Thus the maximizing WD class is not unique even up to equivalence. Literal uniqueness of a matrix N must also be replaced by equivalence.

**Correction status.** No published correction found in the versions and author publication pages checked on 2026-10-07. This packet records the general counterexample for independent review; it makes no claim that the rank-four application is invalid.

**Independent review (2026-10-16): confirmed.** BCGP21 Lemma 2.5.1 p.189 makes an unrestricted maximal-rank uniqueness assertion. Exact rational 6×6 calculations with q=4, F=diag(8,2,2,1/2,1/2,1/8) give FNF⁻¹=N/4 and N-power ranks (4,2,1,0) versus (4,2,0,0), both with maximal rank 4. Only the length-(4,2) strings are pure of weight zero. Use TY Lemma 1.4 uniqueness up to equivalence in the pure range.

### `AutomorphicGaloisRepresentationsPartII/EAG20-4`

Source `chenevier-harris-II`, Alternative argument after Theorem 3.2.3, author copy p. 12.

**Problem.** The alternate de Rham proof treats the exterior-square map GL_n→GL_{n(n−1)/2} as an isogeny onto that target.

**Correction.** For n≥4, the exterior-square homomorphism has finite kernel μ₂ onto its algebraic image; it is not an isogeny onto the full displayed GL group. The alternate de Rham argument needs the theorem for a finite-kernel map onto that image and compatibility of the p-adic Hodge condition with its faithful inclusion. This packet uses the first, eigenvariety/fixed-weight proof instead.

**Reason.** For n=4 the domain dimension is 16 and the displayed codomain dimension is 36, so the map is not surjective and cannot be an isogeny onto that codomain. The first argument on pp. 11–12 does not use this sentence.

**Correction status.** No correction found on the Chenevier/Harris publication pages or in the author copy checked 2026-10-07. The intended finite-kernel-onto-image formulation may be implicit, but the literal codomain statement is false.

**Independent review (2026-10-16): confirmed.** CH author copy p.12 names the full GL_{n(n−1)/2} as target of ∧². At n=4 dimensions 16 and 36 preclude an isogeny onto that group. Finite kernel onto the image is different. The first de Rham proof remains the route used here.

### `AutomorphicGaloisRepresentationsPartII/EAG20-5`

Source `caraiani-monodromy-away`, Proof of Theorem 7.4, arXiv:1010.2188 p. 84; published Duke version p. 2409.

**Problem.** The proof identifies the individual tempered parameter L_n(Π) as having weight 2n−2, which is the weight appropriate to its tensor square.

**Correction.** The individual normalized rank-n parameter L_n(Π) is pure of weight n−1. Its tensor square is pure of weight 2n−2.

**Reason.** Corollary5.9 gives tempered Π. Geometric rec(Π|det|^((1−n)/2)) has Frobenius absolute values q^((n−1)/2), hence weight n−1; weights add on tensor products. In rank2 a weight-zero CSD base change of a modular form has factor weight1 and square weight2. The sentence appears immediately before the tensor-square calculation and assigns its doubled weight to the factor.

**Correction status.** No correction found in the arXiv version, the published author copy or the author publication page and erratum searches checked 2026-10-07.

**Independent review (2026-10-16): confirmed.** Caraiani away-prime preprint p.84 assigns the doubled tensor weight to the individual normalized factor. Its weight is n−1, so the tensor has weight 2n−2. The surrounding tensor-square purity argument distinguishes the two.

### `AutomorphicGaloisRepresentationsPartII/EAG20-6`

Source `accplus-cm-potential-automorphy`, §2.2.5, equations (2.2.6)–(2.2.7) and following unitary σ-polynomial, journal-pagination author copy p. 922; current arXiv/author preprint p. 26 has equations (2.2.5)–(2.2.6).

**Problem.** The GL_n display ends with +q_v^{n(n−1)/2}T_{v,n}, omitting (−1)^n. The unitary display’s general j-term omits X^{2n−j}. Its following σ-polynomial has powers X^{n−i} although its index runs from 0 to 2n.

**Correction.** The GL_n constant is (−1)^n q_v^{n(n−1)/2}T_{v,n}; the unitary j-term has X^{2n−j}, and every unitary σ-term has X^{2n−i}.

**Reason.** For n=1 the spherical character polynomial is X−T_{v,1}. The degree-2n unitary characteristic polynomial has one coefficient in each nonnegative degree from 2n to 0. The displayed n−i exponent produces negative powers; the j-term without its X power collapses different degrees. The surrounding characteristic-polynomial interpretation and the correctly signed GL_n display subsequent in §2.3 fix the intended expressions.

**Correction status.** No correction found in the specific versions, publication pages and searches listed; finding limited to the text read on 2026-10-08.

**Independent review (2026-10-16): confirmed.** ACC+ printed pp.922,927,938: n=1 forces X−T in the GL_n polynomial. A degree-2n unitary polynomial requires X^(2n−j) in the first sum and X^(2n−i) in the second; the printed expressions lose these degrees. The two later sourceIssues preserve the separate extraction provenance.

### `AutomorphicGaloisRepresentationsPartII/EAG20-7`

Source `chenevier-harris-II`, §1, after Hypotheses 1.2, author copy p. 4; finding scoped to that copy (publisher download denied).

**Problem.** The coefficient highest weights are restricted to nonnegative coordinates on both conjugate embeddings, alongside the condition μ_i(τc)=−μ_{n−i+1}(τ).

**Correction.** Use dominant integral coordinates, without a nonnegativity restriction. Polynomial representations form a smaller class than the algebraic GL_n representations used here.

**Reason.** The two printed conditions together force every coordinate to vanish. The algebraic polarized pair det and det⁻¹ has dominant tuples (1,…,1) and (−1,…,−1), and is excluded by nonnegativity. BLGGT’s embedding-wise integer weights give the needed convention.

**Correction status.** No correction found in the specific versions, publication pages and searches listed; finding limited to the text read on 2026-10-08.

**Independent review (2026-10-16): confirmed.** CH author copy p.4 requires nonnegative coordinates for both conjugate tuples while imposing negative reversed conjugacy. Together these force all coordinates to vanish; dominant integer tuples such as (1,0) and (0,−1) must be allowed.

### `AutomorphicGaloisRepresentationsPartII/EAG20-8`

Source `hltt-rigid-cohomology`, Appendix A.1, definition of Std, article-pagination author copy p. 231.

**Problem.** Std is assigned the lower-left n×n block of the displayed block-diagonal Levi matrix.

**Correction.** Std takes the lower-right n×n block. This is the invertible GL_n factor paired with ν in the displayed Levi isomorphism.

**Reason.** The lower-left block in the display is zero, so it cannot even define a GL_n-valued map. The lower-right block is invertible; the ν×Std isomorphism and the Hodge-bundle examples determine the intended factor.

**Correction status.** No correction found in the specific versions, publication pages and searches listed; finding limited to the text read on 2026-10-08.

**Independent review (2026-10-16): confirmed.** HLTT Appendix A.1 p.231 displays a zero lower-left block. It cannot be the Std invertible block map; the lower-right block is invertible and agrees with the stated ν×Std decomposition.

### `AutomorphicGaloisRepresentationsPartII/EAG20-9`

Source `varma-local-global`, arXiv:1411.2520v1, proof of Proposition 8.1, p. 19; §10 proof of Theorem 10.2 and Corollary 10.3, pp. 26–27.

**Problem.** The proof of Proposition 8.1 appeals to Corollary 9.3; the last section appeals to Corollary 11.1 and deduces Corollary 10.3 from Theorem 7.13. These numbers do not identify the comparison results established in this version.

**Correction.** Use Corollary 8.3 for the continuous Hecke pseudorepresentation on p. 19. Use Proposition 9.1’s constituent-by-constituent monodromy bound in Theorem 10.2, and Theorem 10.2 followed by the stated patching argument for Corollary 10.3. HLTT Theorem 7.13 alone gives existence rather than that local bound.

**Reason.** Corollary 8.3 appears immediately before the p. 19 application. Proposition 9.1 establishes the componentwise dominance used on p. 27. This version ends its mathematical sections at §10 and contains no Corollary 11.1; its preceding Theorem 10.2 supplies the bounded comparison that the final patching needs. The plan already distinguishes existence, trace agreement and the full family of N-power inequalities.

**Correction status.** No correction found in the specific versions, publication pages and searches listed; finding limited to the text read on 2026-10-08.

**Independent review (2026-10-16): confirmed.** Varma arXiv v1 pp.19,27: the preceding trace corollary is 8.3, the dominance result is Proposition 9.1, and final bounded compatibility is Theorem 10.2. The cited 9.3/11.1/7.13 references do not identify these results in this version.

### `AutomorphicGaloisRepresentationsPartII/EAG26-3`

Source `accplus-cm-potential-automorphy`, §2.2.5, (2.2.6), p. 922; checked on the page image.

**Problem.** Paraphrase of the affected display: the final rank-n coefficient lacks the sign required in odd rank.

**Correction.** The last term is (−1)^n q_v^{n(n−1)/2} T_{v,n}, the i = n case of the general term.

**Reason.** For n = 1 the printed form gives X + T_{v,1} while the general term gives X − T_{v,1}, and the characteristic polynomial of the Frobenius on an unramified character χ is X − χ(ϖ_v). The proof of Theorem 2.3.5 (p. 938) prints the same polynomial with the last term (−1)^n q_v^{n(n−1)/2} T_{v,n}.

**Correction status.** new: present in the journal-paginated copy (Annals 197 (2023)); no erratum found

**Independent review (2026-10-16): confirmed.** ACC+ printed p.922 has the wrong final GL_n sign; n=1 requires X−T. Theorem 2.3.5 p.938 gives the correctly signed form. This overlaps EAG20-6 and is retained for provenance.

### `AutomorphicGaloisRepresentationsPartII/EAG26-4`

Source `accplus-cm-potential-automorphy`, §2.2.5, (2.2.7) and the definition of P̃_{v,σ}, p. 922; Lemma 2.2.13(2), p. 927.

**Problem.** Paraphrase of the affected displays: the degree-2n coefficient formula loses its monomial in (2.2.7), and the following sums use exponents indexed as though the degree were n.

**Correction.** The general term of (2.2.7) is (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j}, and both sums of degree 2n are Σ_{i=0}^{2n} (−1)^i e_{v,i} X^{2n−i}.

**Reason.** P̃_v is monic of degree 2n (its leading term X^{2n} is printed), so the i-th term must carry X^{2n−i}; with X^{n−i} the sum has negative exponents for i > n.

**Correction status.** new: present in the journal-paginated copy; no erratum found

**Independent review (2026-10-16): confirmed.** ACC+ printed pp.922 and 927 lose X^(2n−j) and print X^(n−i) instead of X^(2n−i). Degree and nonnegative-exponent checks confirm both errors in the identified copy. This overlaps EAG20-6.

### `AutomorphicGaloisRepresentationsPartII/EAG26-5`

Source `accplus-cm-potential-automorphy`, Remark after Definition 4.3.1, printed p.972, local genericity reading.

**Problem.** Paraphrase of the local reading: the remark treats projectivization as sufficient for genericity without separately retaining trivial inertia.

**Correction.** The ratio predicate is projectively invariant. Local genericity is invariant under unramified scalar twists; an arbitrary scalar twist also requires checking unramifiedness. Global existential decomposed genericity is invariant under finite residual character twists after avoiding the twist’s ramification set via Lemma 4.3.2.

**Reason.** At L=Q_2 with k=F_3, r=1⊕1 has q=2 and is generic. A ramified quadratic scalar twist χ⊕χ has the same projective representation and eigenvalue ratios but nontrivial inertia, so is not locally generic. This does not invalidate the global existential statement.

**Correction status.** new local qualification; no public erratum located

**Independent review (2026-10-16): confirmed.** ACC+ pp.972–973: local genericity includes trivial inertia. Over Q₂ and F₃, 1⊕1 and a ramified quadratic scalar twist have the same projectivization but different inertia. The global existential conclusion survives by avoiding finitely many ramified places; only the unrestricted local formulation is corrected.

### `AutomorphicGaloisRepresentationsPartII/EAG26-6`

Source `caraiani-monodromy-published`, §3A, definition of the second separate boundary log structure, p.1611; also arXiv v1 §3.1, p.9.

**Problem.** The display for the second boundary log structure repeats the first boundary’s open immersions and open complements.

**Correction.** Use j_{2,j} and U_{2,j} for the second boundary; leave the first boundary using j_{1,j} and U_{1,j}.

**Reason.** The combined log structure on the same page uses both independent families. For X₁X₂=ϖ and Y₁Y₂=ϖ, the second boundary must detect the Y-divisors rather than duplicate the X-divisors. The p.1611 page image confirms the repeated first-boundary indices; the intended two-boundary construction is unchanged.

**Correction status.** new in the identified version; no public correction located in the recorded search

**Independent review (2026-10-16): confirmed.** Caraiani published §3A pp.1609–1611 has two independent boundary families. The second log structure must use j₂ and U₂; repeating j₁ and U₁ discards the Y-boundary.

### `AutomorphicGaloisRepresentationsPartII/EAG26-7`

Source `caraiani-monodromy-published`, §3A local boundary membership, p.1609, and Lemma 3.2 chart, p.1611; also arXiv v1 §3.1 and Lemma 3.1.2, pp.8–9.

**Problem.** The second boundary’s membership list ends at j_r, and the chart’s second product ends at Y_r, although its second monoid has s generators.

**Correction.** Use j_s as the endpoint of the second boundary membership list and Y₁⋯Y_s in the chart’s second equation.

**Reason.** The model has independent r and s. Its preceding local equation and the proof’s second auxiliary model use s Y-factors, while the chart maps all s second-boundary generators to them. For r=1,s=2 the printed Y₁=ϖ chart loses the second boundary component. The published p.1611 image and p.1609 text confirm the slips; v1 has the same indices.

**Correction status.** new in the identified version; no public correction located in the recorded search

**Independent review (2026-10-16): confirmed.** Caraiani published §3A pp.1609–1611 uses s second-boundary factors. The repeated j_r and Y_r in that part of the local chart must be j_s and Y_s. Taking r=1,s=2 detects the loss of the second boundary.

### `AutomorphicGaloisRepresentationsPartII/EAG26-8`

Source `caraiani-monodromy-published`, §3A dimension of Y^(i,j), p.1610; also arXiv v1 §3.1, p.8.

**Problem.** The stated dimension of a nonempty two-index stratum omits the m smooth Z-coordinates of the local model.

**Correction.** The local dimension is 2n+m−i−j. The expression 2n−i−j applies when m=0.

**Reason.** On the special fiber, imposing i X-coordinates and j Y-coordinates to vanish already kills both product equations, leaving 2n+m−i−j free coordinates. With n=r=s=i=j=m=1, the stratum is the affine Z-line, of dimension 1 rather than 0. The published p.1610 page image includes the Z-coordinates and omits m from the dimension. This is a dimension slip; the projected degree/Tate shifts remain separate in the purity argument.

**Correction status.** new in the identified version; no public correction located in the recorded search

**Independent review (2026-10-16): confirmed.** Caraiani published p.1610 includes m free Z-coordinates. The stratum has dimension 2n+m−i−j. Taking n=r=s=i=j=m=1 gives an affine line, whereas the printed dimension gives zero.

### `AutomorphicGaloisRepresentationsPartII/EAG26-9`

Source `chenevier-harris-II`, Identified author copy, §1, highest-weight notation immediately after Special Hypotheses 1.2, p.4.

**Problem.** Both highest-weight tuples are described as having nonnegative entries, while the next formula makes them reverse negatives of one another.

**Correction.** Use non-increasing tuples of integers; a dominant algebraic GL_n weight need not have nonnegative entries.

**Reason.** Nonnegativity of both tuples combined with μ_i(τ^c)=−μ_{n−i+1}(τ) forces every entry to be zero. For n=2, μ(τ)=(1,0) has dual tuple (0,−1), a valid dominant integral weight excluded by that wording. The author-copy p.4 image confirms it. The packet already uses integer weights and needs no theorem restriction.

**Correction status.** new in the identified version; no public correction located in the recorded search

**Independent review (2026-10-16): confirmed.** CH author copy p.4: conjugate negative reversal together with nonnegativity forces zero weights. Dominant integral weights, including negative entries, give the intended condition. This overlaps EAG20-7 and retains its separate provenance.

## Library and upstream baseline

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Declaration statements and surrounding hypotheses were checked at these commits. The reviewed audit is [data/library-coverage.json](../../../data/library-coverage.json).

- `mathlib:NumberField.IsCMField`, `Mathlib/NumberTheory/NumberField/CMField.lean`: For [Field K] [CharZero K], NumberField.IsCMField K asserts total complexness and quadraticity over its maximal real subfield K⁺; number fields supply these ambient instances.
- `mathlib:NumberField.IsCMField.complexConj`, `Mathlib/NumberTheory/NumberField/CMField.lean`: For [Field K] [CharZero K] [NumberField.IsCMField K] [Algebra.IsIntegral ℚ K], complexConj K : K ≃ₐ[K⁺] K; [NumberField K] supplies integrality.
- `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`, `Mathlib/NumberTheory/NumberField/CMField.lean`: Under the same CM/integrality instances, for φ:K→+*ℂ and x:K, φ (complexConj K x) = conj (φ x). This identifies τ∘c with c∘τ.
- `mathlib:Multiset.prod_X_sub_C_coeff`, `Mathlib/RingTheory/Polynomial/Vieta.lean`: For [CommRing R], s:Multiset R and k≤s.card, (s.map (fun t => X−C t)).prod.coeff k = (−1)^(s.card−k)*s.esymm(s.card−k). It supplies exactly the signed elementary-symmetric coefficient identity.
- `mathlib:AlgebraicClosure`, `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean`: Algebraic closure of a field, with field, algebra and algebraic-closedness instances
- `mathlib:Matrix.GeneralLinearGroup`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: The group of units of square matrices; the carrier of the local prototypes
- `mathlib:Matrix.charpoly`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: det(X I − A) over a commutative ring
- `mathlib:Matrix.charpoly_map`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: charpoly(A mapped by f) = charpoly(A) mapped by f for a ring homomorphism
- `mathlib:Matrix.charpoly_diagonal`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: charpoly(diagonal d) = product of X − C(d_i)
- `mathlib:Matrix.charpoly_units_conj`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: invariance of characteristic polynomial under conjugation by an invertible matrix
- `mathlib:Matrix.GeneralLinearGroup.map`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: coefficient change on GL_n as a group homomorphism; map_id and map_comp are available
- `mathlib:Representation.IsSemisimpleRepresentation`, `Mathlib/RepresentationTheory/Semisimple.lean`: Complemented lattice of subrepresentations; equivalent to semisimplicity of the corresponding group-algebra module
- `mathlib:Representation.IsIrreducible`, `Mathlib/RepresentationTheory/Irreducible.lean`: Simple order of subrepresentations; apply after coefficient extension to AlgebraicClosure for absolute irreducibility
- `mathlib:Matrix.GeneralLinearGroup.toLin`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: Multiplicative equivalence from matrix units to invertible linear endomorphisms, used to obtain a Mathlib Representation
- `mathlib:Matrix.rank`, `Mathlib/LinearAlgebra/Matrix/Rank.lean`: Finite rank of the range of mulVecLin, used for the zero-monodromy algebraic inference

The current LocalGaloisGroups roadmap uses arithmetic Artin reciprocity (a uniformizer maps to arithmetic Frobenius), so its character API requires inversion before use with the geometric convention here. The terminology arithmetic normalization for rec^T in ACC+ p.906 does not itself invert Frobenius.

The current upstream roadmap comparison used commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` on 2026-10-16. Searched current TauCeti source for automorphic-representation, compatible-family, WD, Igusa, Mantovan and Rapoport–Zink carriers. No arithmetic target in these directions was found. Generic polynomial, matrix and semisimplicity algebra is imported. Current upstream IHG definitions are not new AG2 targets.

## Source editions and access

Source locators above identify the mathematical use. The catalog records the editions read and public links. Four cleared PDFs were read in place from the maintainer-cleared library. HT01 was not available as a cleared source; the precise dependencies on its coefficient-projector, weight-cancellation and multiplicity proofs remain gaps. No source passages are reproduced.

### `blggt-potential-automorphy`

Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). arXiv:1010.2561v4, 9 December 2013, the last arXiv version (published Annals of Math. 179 (2014), 501–609). Printed page = PDF page. R. Taylor's copy pa3.pdf has the same text in §2.1.

Access recorded: 2026-10-08.

SHA-256: `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24`.

Read locators: Introduction: Theorems A–D, pp. 1–6; Notation: Artin normalisation, rec, HT_τ(ε_l) = {−1}, algebraic characters, pp. 8–10; §2.1 Terminology: polarized l-adic and mod l representations, totally odd, algebraic, polarized automorphic representations, (ℤⁿ)_w, extremely regular, Ξ_a, weight, ι-ordinary, Theorem 2.1.1 with its proof and remarks, pp. 31–34; §5.1 remark on the weights of r_{l,ι}(χ), p. 65; Theorem 5.5.1's proof and the remark before Theorem 5.5.2, p. 81; Appendix A.2: algebraic characters and their weights (1)–(8), Lemmas A.2.1–A.2.5, pp. 87–90; §2.1 pp.31–34; §5.1 pp.62–65

### `accplus-cm-potential-automorphy`

Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113; the authors' copy Ramanujan.pdf, which carries the journal pagination (printed page = PDF page + 896).

Access recorded: 2026-10-16.

Maintainer-cleared author PDF read in place; no copy or extracted text retained.

SHA-256: `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02`.

Read locators: Earlier decomposition: 4.3 Definition 4.3.1 and Lemma 4.3.2 (pp. 972–973); 6.2.28–6.2.31 (pp. 1044–1045); §2.2.5 pp.922,927; §2.3.6 p.938; §4.3 pp.972–974; §4.5; §6.2.29–30; §7.1 pp.1084–1094

### `patrikis-sign`

Stefan Patrikis. [On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2). arXiv:1306.1242v2, 8 July 2014 (published Math. Ann. 362 (2015), 147–171). Printed page = PDF page.

Access recorded: 2026-10-08.

SHA-256: `2bfa2a6a00a94465725cd7b0e48d64eef1fed4113a6be4b246a015e7927259f8`.

Read locators: Theorem 2.1 and §4, Proposition 4.1 with proof, pp.7–8: archimedean pairing sign and multiplier parity.

### `hltt-rigid-cohomology`

Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne. [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf). Author's copy rigcoh.pdf (published in Res. Math. Sci. 3 (2016)); read from the supplied extracted text references/text/SS_HLTT.txt. Locators give the article's own page numbers and result numbers.

Access recorded: 2026-10-08.

SHA-256: `abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7`.

Read locators: Abstract and Introduction: Theorem A (quoted there as Corollary 7.14), the remark on extending local-global compatibility, the sketch of the argument including the group G_n, its maximal parabolic and Levi, the induced representation Pi(N), the realization in overconvergent p-adic cusp forms of finite slope, Katz's congruence argument, and the dagger-space set-up with the ordinary loci and the subcanonical sheaf, pp. 1-3

### `chenevier-harris-II`

Gaetan Chenevier and Michael Harris. [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf). Author's copy ConstructionII.pdf (published in Camb. J. Math. 1 (2013), 53-73); read from the supplied extracted text references/text/SS_ChenevierHarris.txt. Locators give the article's own page and result numbers.

Access recorded: 2026-10-08.

SHA-256: `9b5e76798f75273f53d1d4160f35815b1a3b656f04c965ad47fd4fa454840529`.

Read locators: Introduction: the setting (F totally real, K/F totally imaginary quadratic, G = Res_{K/Q} GL(n)), and the main theorem quoted there as Theorem 3.2.3 with its parts (a), (b), (c), p. 1; §1.4–1.5; §2, Theorem 2.3; §3.1–3.2, Theorem 3.2.3, Proposition 3.2.5

### `varma-local-global`

Ila Varma. [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520). arXiv:1411.2520v1, 10 November 2014; read from the supplied extracted text references/text/SS_VarmaLocalGlobal.txt. Locators give the arXiv version's own page numbers.

Access recorded: 2026-10-08.

SHA-256: `24076dfcc6ca9b9e3168efb0150e75d5200f66e64085625b3e52895cfd1e56ef`.

Read locators: Abstract, p. 1; 1 Introduction: the setting, the known unramified compatibility, Theorem (1^ss), Theorem (1) with the partial order, and the summary of the proof strategy through the Bernstein centre, pp. 1-2

### `caraiani-monodromy-away`

Ana Caraiani. [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188). arXiv:1010.2188v1, 11 October 2010 (published Duke Math. J. 161 (2012)); read from references/text/SS_CaraianiMonodromyAway.txt. Locators give the arXiv version's page numbers.

Access recorded: 2026-10-08.

SHA-256: `769e68e2384b42caf16861d9011b35afe48018eba006074ce0d6c4111451f3b3`.

Read locators: Abstract and 1 Introduction: Theorem 1.1, Theorem 1.2 (Ramanujan-Petersson), the statement of what was already known, and the strategy (realizing R_l(Pi)^{tensor 2} in the cohomology of a unitary Shimura system and proving purity by computing the monodromy operator), pp. 1-2

### `caraiani-monodromy-at-p`

Ana Caraiani. [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683). arXiv:1202.4683v1, 21 February 2012 (published Algebra Number Theory 8 (2014)); read from references/text/SS_CaraianiMonodromyAtP.txt. Locators give the arXiv version's page numbers.

Access recorded: 2026-10-08.

SHA-256: `6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e`.

Read locators: Abstract and 1 Introduction: Theorem 1.1, the statement of what was known from Barnet-Lamb-Gee-Geraghty-Taylor and what is new, and the announcement of a generalization of Mokrane's weight spectral sequence for log crystalline cohomology, p. 1; Theorem 1.1 pp.1–2; §§2–3; §4, Theorem 4.6 and Remark 4.7; §5, Proposition 5.1 pp.31–32

### `shin-compact`

Sug Woo Shin. [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). Author copy; article pagination, 61 pages.

Access recorded: 2026-10-08.

SHA-256: `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b`.

Read locators: §2, Mantovan functor, Lemma 2.1 and Propositions 2.2–2.3; §3.6 archimedean transfer conventions; §§5.1–5.3 compact datum, Drinfeld models, Proposition 5.2 and Proposition 5.3; §§6.1–6.2 ST/END, Theorems 6.1 and 6.4, Corollaries 6.5–6.8; §7 theorem and descent.

### `shin-igusa`

Sug Woo Shin. [Stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf). Author copy; article pagination, 30 pages.

Access recorded: 2026-10-16.

SHA-256: `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0`.

Read locators: §4.1–4.4, pp.13–15: PEL setup, effective Kottwitz triples and Theorem 4.4 restating the counting theorem from [Shi09, Theorem 13.1]. The proof in the earlier counting paper is not certified by reading this restatement.

### `taylor-yoshida`

Richard Taylor and Teruyoshi Yoshida. [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357). arXiv:math/0412357v2, 7 April 2005; downloaded PDF metadata dated 2018.

Access recorded: 2026-10-08.

SHA-256: `a17d283d3a605cd3f031a1178f2914254ee9cbe430b11cfbff8c382e8cd1713b`.

Read locators: §1 definitions, Lemma 1.4 and Theorem 1.5; §2, corrected Harris–Taylor projector a_ξ=ε_ξ ε(m_ξ,N)^(2n−1).

### `grosse-klonne-dagger`

Elmar Grosse-Klönne. [Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329). arXiv:1408.3329, author version.

Access recorded: 2026-10-08.

SHA-256: `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b`.

Read locators: §5, Theorem 5.1 and its proof: partially proper dagger tubes and comparison with rigid cohomology.

### `cs-generic-published`

Ana Caraiani and Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals of Mathematics 186 (2017), 649–766; published PDF.

Access recorded: 2026-10-08.

SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.

Read locators: §5.5, Theorem 5.5.4, Corollary 5.5.5 and Remark 5.5.6, pp. 744–746; §5.6 simple Kottwitz variants and Corollary 5.6.2, pp. 748–750.; Definition 1.9 p.652; §5.5 Theorem 5.5.4, Corollary 5.5.5 and Remark 5.5.6 pp.744–747

### `newton-thorne26`

James Newton and Jack A. Thorne. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2). Annals of Mathematics 203 (2026), pp.283–347; arXiv:2212.03595v2 used for page locators.

Access recorded: 2026-10-08.

SHA-256: `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`.

Read locators: §5.1, Theorem 5.1 and Lemma 5.2, preprint p.38 (Clozel rationality and conjugation); Lemma 5.8, pp.42–44.

### `liu-et-al22`

Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu. [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones Mathematicae 228 (2022), 107–375; published PDF.

Access recorded: 2026-10-16.

Maintainer-cleared author PDF read in place; no copy or extracted text retained.

SHA-256: `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.

Read locators: Definitions 1.1.3 and 3.1.1, Lemma 3.1.2, Proposition 3.2.4, Definition 3.2.5, Hypothesis 3.2.10 and Proposition 3.2.11; Appendix D.1, Proposition D.1.3 and Corollary D.1.4.; §1.1; §3.2 Proposition 3.2.4, Definition 3.2.5, Remark 3.2.6, Hypothesis 3.2.10; Appendix D, Definition D.1.2 and Corollary D.1.4

### `bcgp21-purity`

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publications Mathématiques de l’IHÉS 134 (2021), 153–501; published PDF.

Access recorded: 2026-10-08.

SHA-256: `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`.

Read locators: §2.5, p. 189, purity definition and Lemma 2.5.1, checked against the arXiv version; generic GL_n claim separated from the GSp₄ application.

### `bcgp25-racsdc`

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645). arXiv:2502.20645v1, February 2025.

Access recorded: 2026-10-08.

SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

Read locators: RACSDC paragraph following equation (1.8.21), pp. 14–15, RACSDC GL_n representations; §1.8.13 regular GSp₄ result and §1.8.22 transfer read for ownership only.

### `bellaiche-chenevier-sign`

Joël Bellaïche and Gaëtan Chenevier. [The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf). Compositio Mathematica 147 (2011), 1337–1352; published PDF.

Access recorded: 2026-10-08.

SHA-256: `46a4a8c7dc1394b6ec72c4b908bb7616818db4d608dcadf2f96d0998b3e0caa8`.

Read locators: Theorem 1.2 and Corollary 1.3; §§2–3 sign under twists, specialization, eigenvariety approximation and descent.

### `hsbt-character`

Michael Harris, Nicholas Shepherd-Barron and Richard Taylor. [A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf). Annals of Mathematics 171 (2010), 779–813; published PDF.

Access recorded: 2026-10-08.

SHA-256: `5e3fc579911961071bb7e7f7a7a4f4154d621d0abccafcf4d03702fbcfb3d1ab`.

Read locators: Lemma 2.2, pp. 795–796, compatible idele characters with prescribed units and restriction to the totally real subfield.

### `clozel-thorne17`

Laurent Clozel and Jack A. Thorne. [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download). Accepted Cambridge repository copy, published 2017.

Access recorded: 2026-10-08.

SHA-256: `fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742`.

Read locators: §1.1 notation; §3.5 stable base change with selected real branches, pp. 30–31; Lemma 7.4, pp. 47–48, twisting character for rank two.

### `ahtw-coefficient-prime`

A’Campo, Hevesi, Thorne and Whitmore. [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1). arXiv:2607.11763v1, 13 July 2026; unrefereed preprint.

Access recorded: 2026-10-08.

SHA-256: `a5a56b7917c387b24f717e31714675d2de183505250bbd3a3fae21bd1fa424bb`.

Read locators: §1.2 pp.5–7; §2.5 Theorem 2.5.7; §3.3 Theorem 3.3.6; §5.2 Proposition 5.2.8 and Theorem 5.2.9; §6 Definitions 6.0.1–4 and Corollary 6.0.6

### `calegari-geraghty-20`

Calegari and Geraghty. [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke 169 (2020), 801–896; author copy.

Access recorded: 2026-10-08.

SHA-256: `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`.

Read locators: Proposition 6.8 and its proof, author-copy pp.38–39; Lemma 6.9, author-copy pp.39–40

### `pilloni-20`

Pilloni. [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author copy; Duke Mathematical Journal 169 (2020), no.9, 1647–1807.

Access recorded: 2026-10-16.

Maintainer-cleared author PDF read in place; no copy or extracted text retained.

SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

Read locators: Theorem 5.1.7.1 and Remark 5.1.7.1, author-copy pp.22–23

### `caraiani-monodromy-published`

Caraiani. [Monodromy and local-global compatibility for l = p (published version)](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf). Algebra & Number Theory 8 (2014), no.7, 1597–1646; published PDF includes two cover pages, printed page = PDF page + 1595.

Access recorded: 2026-10-08.

SHA-256: `a0c7963e45b4706c8d0e5ca4791d12f5de749ef77ca6ba8256371ecd215f5314`.

Read locators: §3A, pp.1609–1611, including the comparison domain before Corollary 2.3 and Lemma 3.2

### `chenevier-unitary`

Gaëtan Chenevier. [Une application des variétés de Hecke des groupes unitaires](https://www.imj-prg.fr/fa/bpFiles/Chenevier.pdf). Author chapter, 5 June 2009, 25 pages.

Access recorded: 2026-10-16.

SHA-256: `dc3dcd7238ca306641af7c752835094ce85180045bc5a4affca7ad831398dfda`.

Read locators: §3, Theorems 3.2–3.5, pp.16–17; §§3.6–3.8 and Corollary 3.9, pp.17–18; Proposition 3.11 and Lemmas 3.12, 3.14, pp.19–21; Propositions 3.16–3.17, Lemma 3.18, Corollary 3.19 and Remark 3.20, pp.22–24. Page images checked because the PDF text encoding is damaged.

### `cht08`

Laurent Clozel, Michael Harris and Richard Taylor. [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://numdam.org/item/10.1007/s10240-008-0016-1.pdf). Publications Mathématiques de l’IHÉS 108 (2008), pp.1–181.

Access recorded: 2026-10-16.

SHA-256: `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c`.

Read locators: Lemma 4.1.4 and proof, pp.118–119; Lemma 4.1.5, p.120: algebraic and crystalline character extensions with polarization, labelled weights and parity.
